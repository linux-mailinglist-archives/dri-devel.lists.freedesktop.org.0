Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6B41C5DC5
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 18:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADAA6E7EA;
	Tue,  5 May 2020 16:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0546E7EA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 16:43:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A4DC2804BA;
 Tue,  5 May 2020 18:43:05 +0200 (CEST)
Date: Tue, 5 May 2020 18:43:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/5] drm/mgag200: Remove several references to struct
 mga_device.dev
Message-ID: <20200505164304.GD5082@ravnborg.org>
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505095649.25814-4-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=ZQoE62_62IfG92eJibMA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: cogarre@gmail.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Tue, May 05, 2020 at 11:56:47AM +0200, Thomas Zimmermann wrote:
> Done in preparation of embedding the DRM device in struct mga_device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Trivial, one nit you can fix while applying, or ignore.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/mgag200/mgag200_main.c | 21 +++++++++++----------
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 17 +++++++++--------
>  2 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index 3830d3f3c9fa2..010b309c01fc4 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -66,25 +66,26 @@ static int mga_probe_vram(struct mga_device *mdev, void __iomem *mem)
>  /* Map the framebuffer from the card and configure the core */
>  static int mga_vram_init(struct mga_device *mdev)
>  {
> +	struct drm_device *dev = mdev->dev;
>  	void __iomem *mem;
>  
>  	/* BAR 0 is VRAM */
> -	mdev->mc.vram_base = pci_resource_start(mdev->dev->pdev, 0);
> -	mdev->mc.vram_window = pci_resource_len(mdev->dev->pdev, 0);
> +	mdev->mc.vram_base = pci_resource_start(dev->pdev, 0);
> +	mdev->mc.vram_window = pci_resource_len(dev->pdev, 0);
>  
> -	if (!devm_request_mem_region(mdev->dev->dev, mdev->mc.vram_base, mdev->mc.vram_window,
> -				"mgadrmfb_vram")) {
> +	if (!devm_request_mem_region(dev->dev, mdev->mc.vram_base,
> +				     mdev->mc.vram_window, "mgadrmfb_vram")) {
>  		DRM_ERROR("can't reserve VRAM\n");
>  		return -ENXIO;
>  	}
>  
> -	mem = pci_iomap(mdev->dev->pdev, 0, 0);
> +	mem = pci_iomap(dev->pdev, 0, 0);
>  	if (!mem)
>  		return -ENOMEM;
>  
>  	mdev->mc.vram_size = mga_probe_vram(mdev, mem);
>  
> -	pci_iounmap(mdev->dev->pdev, mem);
> +	pci_iounmap(dev->pdev, mem);
>  
>  	return 0;
>  }
> @@ -116,11 +117,11 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  	mdev->has_sdram = !(option & (1 << 14));
>  
>  	/* BAR 0 is the framebuffer, BAR 1 contains registers */
> -	mdev->rmmio_base = pci_resource_start(mdev->dev->pdev, 1);
> -	mdev->rmmio_size = pci_resource_len(mdev->dev->pdev, 1);
> +	mdev->rmmio_base = pci_resource_start(dev->pdev, 1);
> +	mdev->rmmio_size = pci_resource_len(dev->pdev, 1);
>  
> -	if (!devm_request_mem_region(mdev->dev->dev, mdev->rmmio_base, mdev->rmmio_size,
> -				"mgadrmfb_mmio")) {
> +	if (!devm_request_mem_region(dev->dev, mdev->rmmio_base,
> +				     mdev->rmmio_size, "mgadrmfb_mmio")) {
>  		drm_err(dev, "can't reserve mmio registers\n");
>  		return -ENOMEM;
>  	}
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index fa91869c0db52..aaa73b29b04f0 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1433,6 +1433,7 @@ static const struct drm_crtc_helper_funcs mga_helper_funcs = {
>  /* CRTC setup */
>  static void mga_crtc_init(struct mga_device *mdev)
>  {
> +	struct drm_device *dev = mdev->dev;
>  	struct mga_crtc *mga_crtc;
>  
>  	mga_crtc = kzalloc(sizeof(struct mga_crtc) +
> @@ -1442,7 +1443,7 @@ static void mga_crtc_init(struct mga_device *mdev)
>  	if (mga_crtc == NULL)
>  		return;
>  
> -	drm_crtc_init(mdev->dev, &mga_crtc->base, &mga_crtc_funcs);
> +	drm_crtc_init(dev, &mga_crtc->base, &mga_crtc_funcs);
>  
>  	drm_mode_crtc_set_gamma_size(&mga_crtc->base, MGAG200_LUT_SIZE);
>  	mdev->mode_info.crtc = mga_crtc;
> @@ -1617,30 +1618,30 @@ static struct drm_connector *mga_vga_init(struct drm_device *dev)
>  
>  int mgag200_modeset_init(struct mga_device *mdev)
>  {
> +	struct drm_device *dev = mdev->dev;
>  	struct drm_encoder *encoder = &mdev->encoder;
>  	struct drm_connector *connector;
>  	int ret;
>  
>  	mdev->mode_info.mode_config_initialized = true;
>  
> -	mdev->dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
> -	mdev->dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
> +	dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
> +	dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
>  
> -	mdev->dev->mode_config.fb_base = mdev->mc.vram_base;
> +	dev->mode_config.fb_base = mdev->mc.vram_base;
>  
>  	mga_crtc_init(mdev);
>  
> -	ret = drm_simple_encoder_init(mdev->dev, encoder,
> -				      DRM_MODE_ENCODER_DAC);
> +	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
>  	if (ret) {
> -		drm_err(mdev->dev,
> +		drm_err(dev,
>  			"drm_simple_encoder_init() failed, error %d\n",
Join with line before.

>  			ret);
>  		return ret;
>  	}
>  	encoder->possible_crtcs = 0x1;
>  
> -	connector = mga_vga_init(mdev->dev);
> +	connector = mga_vga_init(dev);
>  	if (!connector) {
>  		DRM_ERROR("mga_vga_init failed\n");
>  		return -1;
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
