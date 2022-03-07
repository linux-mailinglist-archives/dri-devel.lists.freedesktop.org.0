Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2C4D0742
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 20:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D96210E121;
	Mon,  7 Mar 2022 19:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754F810E121
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 19:07:50 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id ecfd2899-9e49-11ec-b2df-0050568cd888;
 Mon, 07 Mar 2022 19:08:08 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 82088194B3A;
 Mon,  7 Mar 2022 20:07:51 +0100 (CET)
Date: Mon, 7 Mar 2022 20:07:44 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 06/10] drm/gma500: Move GTT resume logic out of
 psb_gtt_init()
Message-ID: <YiZYAFdM28igTrC3@ravnborg.org>
References: <20220306203619.22624-1-tzimmermann@suse.de>
 <20220306203619.22624-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220306203619.22624-7-tzimmermann@suse.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

One comment below.

On Sun, Mar 06, 2022 at 09:36:15PM +0100, Thomas Zimmermann wrote:
> The current implementation of psb_gtt_init() also does resume
> handling. Move the resume code into its own helper.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gtt.c     | 122 ++++++++++++++++++++++++++-----
>  drivers/gpu/drm/gma500/gtt.h     |   2 +-
>  drivers/gpu/drm/gma500/psb_drv.c |   2 +-
>  3 files changed, 104 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
> index acd50ee26b03..43ad3ec38c80 100644
> --- a/drivers/gpu/drm/gma500/gtt.c
> +++ b/drivers/gpu/drm/gma500/gtt.c
> @@ -209,7 +209,7 @@ static void psb_gtt_populate_resources(struct drm_psb_private *pdev)
>  	drm_dbg(dev, "Restored %u of %u gtt ranges (%u KB)", restored, total, (size / 1024));
>  }
>  
> -int psb_gtt_init(struct drm_device *dev, int resume)
> +int psb_gtt_init(struct drm_device *dev)
>  {
>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
> @@ -218,10 +218,8 @@ int psb_gtt_init(struct drm_device *dev, int resume)
>  	struct psb_gtt *pg;
>  	int ret = 0;
>  
> -	if (!resume) {
> -		mutex_init(&dev_priv->gtt_mutex);
> -		mutex_init(&dev_priv->mmap_mutex);
> -	}
> +	mutex_init(&dev_priv->gtt_mutex);
> +	mutex_init(&dev_priv->mmap_mutex);
>  
>  	pg = &dev_priv->gtt;
>  
> @@ -290,13 +288,6 @@ int psb_gtt_init(struct drm_device *dev, int resume)
>  	dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n",
>  			dev_priv->stolen_base, vram_stolen_size / 1024);
>  
> -	if (resume && (gtt_pages != pg->gtt_pages) &&
> -	    (stolen_size != pg->stolen_size)) {
> -		dev_err(dev->dev, "GTT resume error.\n");
> -		ret = -EINVAL;
> -		goto out_err;
> -	}
> -
>  	pg->gtt_pages = gtt_pages;
>  	pg->stolen_size = stolen_size;
>  	dev_priv->vram_stolen_size = vram_stolen_size;
> @@ -304,19 +295,14 @@ int psb_gtt_init(struct drm_device *dev, int resume)
>  	/*
>  	 *	Map the GTT and the stolen memory area
>  	 */
> -	if (!resume)
> -		dev_priv->gtt_map = ioremap(pg->gtt_phys_start,
> -						gtt_pages << PAGE_SHIFT);
> +	dev_priv->gtt_map = ioremap(pg->gtt_phys_start, gtt_pages << PAGE_SHIFT);
>  	if (!dev_priv->gtt_map) {
>  		dev_err(dev->dev, "Failure to map gtt.\n");
>  		ret = -ENOMEM;
>  		goto out_err;
>  	}
>  
> -	if (!resume)
> -		dev_priv->vram_addr = ioremap_wc(dev_priv->stolen_base,
> -						 stolen_size);
> -
> +	dev_priv->vram_addr = ioremap_wc(dev_priv->stolen_base, stolen_size);
>  	if (!dev_priv->vram_addr) {
>  		dev_err(dev->dev, "Failure to map stolen base.\n");
>  		ret = -ENOMEM;
> @@ -333,11 +319,107 @@ int psb_gtt_init(struct drm_device *dev, int resume)
>  	return ret;
>  }
>
The below is a lot of duplicated complex code.
Can you add one more helper for this?

> +static int psb_gtt_resume(struct drm_device *dev)
> +{
> +	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +	unsigned int gtt_pages;
> +	unsigned long stolen_size, vram_stolen_size;
> +	struct psb_gtt *pg;
> +	int ret = 0;
> +
> +	pg = &dev_priv->gtt;

static void psb_enable_gtt(..)
{
> +
> +	/* Enable the GTT */
> +	pci_read_config_word(pdev, PSB_GMCH_CTRL, &dev_priv->gmch_ctrl);
> +	pci_write_config_word(pdev, PSB_GMCH_CTRL,
> +			      dev_priv->gmch_ctrl | _PSB_GMCH_ENABLED);
> +
> +	dev_priv->pge_ctl = PSB_RVDC32(PSB_PGETBL_CTL);
> +	PSB_WVDC32(dev_priv->pge_ctl | _PSB_PGETBL_ENABLED, PSB_PGETBL_CTL);
> +	(void) PSB_RVDC32(PSB_PGETBL_CTL);
> +
> +	/* The root resource we allocate address space from */
> +	dev_priv->gtt_initialized = 1;
> +
> +	pg->gtt_phys_start = dev_priv->pge_ctl & PAGE_MASK;
> +
> +	/*
> +	 *	The video mmu has a hw bug when accessing 0x0D0000000.
> +	 *	Make gatt start at 0x0e000,0000. This doesn't actually
> +	 *	matter for us but may do if the video acceleration ever
> +	 *	gets opened up.
> +	 */
> +	pg->mmu_gatt_start = 0xE0000000;
> +
> +	pg->gtt_start = pci_resource_start(pdev, PSB_GTT_RESOURCE);
> +	gtt_pages = pci_resource_len(pdev, PSB_GTT_RESOURCE) >> PAGE_SHIFT;
> +	/* CDV doesn't report this. In which case the system has 64 gtt pages */
> +	if (pg->gtt_start == 0 || gtt_pages == 0) {
> +		dev_dbg(dev->dev, "GTT PCI BAR not initialized.\n");
> +		gtt_pages = 64;
> +		pg->gtt_start = dev_priv->pge_ctl;
> +	}
> +
> +	pg->gatt_start = pci_resource_start(pdev, PSB_GATT_RESOURCE);
> +	pg->gatt_pages = pci_resource_len(pdev, PSB_GATT_RESOURCE) >> PAGE_SHIFT;
> +	dev_priv->gtt_mem = &pdev->resource[PSB_GATT_RESOURCE];
> +
> +	if (pg->gatt_pages == 0 || pg->gatt_start == 0) {
> +		static struct resource fudge;	/* Preferably peppermint */
> +		/*
> +		 * This can occur on CDV systems. Fudge it in this case. We
> +		 * really don't care what imaginary space is being allocated
> +		 * at this point.
> +		 */
> +		dev_dbg(dev->dev, "GATT PCI BAR not initialized.\n");
> +		pg->gatt_start = 0x40000000;
> +		pg->gatt_pages = (128 * 1024 * 1024) >> PAGE_SHIFT;
> +		/*
> +		 * This is a little confusing but in fact the GTT is providing
> +		 * a view from the GPU into memory and not vice versa. As such
> +		 *  this is really allocating space that is not the same as the
> +		 *  CPU address space on CDV.
> +		 */
> +		fudge.start = 0x40000000;
> +		fudge.end = 0x40000000 + 128 * 1024 * 1024 - 1;
> +		fudge.name = "fudge";
> +		fudge.flags = IORESOURCE_MEM;
> +		dev_priv->gtt_mem = &fudge;
> +	}
> +
> +	pci_read_config_dword(pdev, PSB_BSM, &dev_priv->stolen_base);
> +	vram_stolen_size = pg->gtt_phys_start - dev_priv->stolen_base - PAGE_SIZE;
> +	stolen_size = vram_stolen_size;
> +
> +	dev_dbg(dev->dev, "Stolen memory base 0x%x, size %luK\n",
> +			dev_priv->stolen_base, vram_stolen_size / 1024);
}

And then use this helper in both init and resume?

> +
> +	if ((gtt_pages != pg->gtt_pages) && (stolen_size != pg->stolen_size)) {
> +		dev_err(dev->dev, "GTT resume error.\n");
> +		ret = -EINVAL;
> +		goto out_err;
> +	}
> +

> +	pg->gtt_pages = gtt_pages;
> +	pg->stolen_size = stolen_size;
Not needed for resume, we just checked them.

> +	dev_priv->vram_stolen_size = vram_stolen_size;
> +
> +	psb_gtt_clear(dev_priv);
> +	psb_gtt_populate_stolen(dev_priv);
> +
> +	return 0;
> +
> +out_err:
> +	psb_gtt_takedown(dev);
> +	return ret;
> +}
> +
>  int psb_gtt_restore(struct drm_device *dev)
>  {
>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>  
> -	psb_gtt_init(dev, 1);
> +	psb_gtt_resume(dev);
>  
>  	psb_gtt_populate_resources(dev_priv);
>  
> diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
> index 31500533ac45..cb270ea40794 100644
> --- a/drivers/gpu/drm/gma500/gtt.h
> +++ b/drivers/gpu/drm/gma500/gtt.h
> @@ -25,7 +25,7 @@ struct psb_gtt {
>  };
>  
>  /* Exported functions */
> -extern int psb_gtt_init(struct drm_device *dev, int resume);
> +int psb_gtt_init(struct drm_device *dev);
>  extern void psb_gtt_takedown(struct drm_device *dev);
>  extern int psb_gtt_restore(struct drm_device *dev);
A cleanup patch to remove all extern would be nice.
But that's not related to this series.

	Sam
