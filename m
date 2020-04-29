Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2511BE59E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 19:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A0D6EABF;
	Wed, 29 Apr 2020 17:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CFA6EABF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 17:49:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 27B6580501;
 Wed, 29 Apr 2020 19:49:49 +0200 (CEST)
Date: Wed, 29 Apr 2020 19:49:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/17] drm/mgag200: Remove unused fields from struct
 mga_device
Message-ID: <20200429174947.GB31071@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-3-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=pHV0ZpmMzHd0v6gFZzEA:9
 a=TE8lxChpMLPDhgjz:21 a=h31ULP7TcxwPxwMI:21 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 04:32:23PM +0200, Thomas Zimmermann wrote:
> The fields mode_info, num_crtcs and mode in struct mga_device serve
> no purpose. Remove them.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Looks straight forward.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.h  | 8 --------
>  drivers/gpu/drm/mgag200/mgag200_main.c | 3 ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 6 ------
>  3 files changed, 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index c7f2000d46fce..de3181bd63ca0 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -104,11 +104,6 @@ struct mga_crtc {
>  	bool enabled;
>  };
>  
> -struct mga_mode_info {
> -	bool mode_config_initialized;
> -	struct mga_crtc *crtc;
> -};
> -
>  struct mga_i2c_chan {
>  	struct i2c_adapter adapter;
>  	struct drm_device *dev;
> @@ -155,15 +150,12 @@ struct mga_device {
>  	void __iomem			*rmmio;
>  
>  	struct mga_mc			mc;
> -	struct mga_mode_info		mode_info;
>  
>  	size_t vram_fb_available;
>  
>  	bool				suspended;
> -	int				num_crtc;
>  	enum mga_type			type;
>  	int				has_sdram;
> -	struct drm_display_mode		mode;
>  
>  	int bpp_shifts[4];
>  
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index 46cc32816f1e1..698fbf31337d4 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -98,9 +98,6 @@ static int mgag200_device_init(struct drm_device *dev,
>  	mdev->flags = mgag200_flags_from_driver_data(flags);
>  	mdev->type = mgag200_type_from_driver_data(flags);
>  
> -	/* Hardcode the number of CRTCs to 1 */
> -	mdev->num_crtc = 1;
> -
>  	pci_read_config_dword(dev->pdev, PCI_MGA_OPTION, &option);
>  	mdev->has_sdram = !(option & (1 << 14));
>  
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index c9d120b019649..ce41bebfdd1a2 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1135,9 +1135,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  
>  	WREG8(MGA_MISC_OUT, misc);
>  
> -	if (adjusted_mode)
> -		memcpy(&mdev->mode, mode, sizeof(struct drm_display_mode));
> -
>  	mga_crtc_do_set_base(crtc, old_fb, x, y, 0);
>  
>  	/* reset tagfifo */
> @@ -1443,7 +1440,6 @@ static void mga_crtc_init(struct mga_device *mdev)
>  	drm_crtc_init(mdev->dev, &mga_crtc->base, &mga_crtc_funcs);
>  
>  	drm_mode_crtc_set_gamma_size(&mga_crtc->base, MGAG200_LUT_SIZE);
> -	mdev->mode_info.crtc = mga_crtc;
>  
>  	drm_crtc_helper_add(&mga_crtc->base, &mga_helper_funcs);
>  }
> @@ -1619,8 +1615,6 @@ int mgag200_modeset_init(struct mga_device *mdev)
>  	struct drm_connector *connector;
>  	int ret;
>  
> -	mdev->mode_info.mode_config_initialized = true;
> -
>  	mdev->dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
>  	mdev->dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
>  
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
