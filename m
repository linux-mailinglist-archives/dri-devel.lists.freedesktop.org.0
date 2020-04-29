Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E91BE634
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 20:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494AF6EACD;
	Wed, 29 Apr 2020 18:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7E96EACD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 18:24:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 660EF804DF;
 Wed, 29 Apr 2020 20:24:34 +0200 (CEST)
Date: Wed, 29 Apr 2020 20:24:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 07/17] drm/mgag200: Move mode-setting code into separate
 helper function
Message-ID: <20200429182433.GG31071@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-8-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=dRf9T1qdWL1uU3ECS94A:9
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 04:32:28PM +0200, Thomas Zimmermann wrote:
> The mode-setting code is now located in mgag200_set_mode_regs(), sans
> a few flags that will be moved in a later patch for clarity.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Looked like trivial code movements, did not look carefully.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 140 ++++++++++++++-----------
>  1 file changed, 78 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 12df809d64f7c..749ba6e420ac7 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -911,6 +911,79 @@ static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
>  	return mga_crtc_do_set_base(mdev, fb, old_fb);
>  }
>  
> +static void mgag200_set_mode_regs(struct mga_device *mdev,
> +				  const struct drm_display_mode *mode)
> +{
> +	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
> +	unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
> +	uint8_t misc = 0;
> +	uint8_t crtcext1, crtcext2, crtcext5;
> +
> +	hdisplay = mode->hdisplay / 8 - 1;
> +	hsyncstart = mode->hsync_start / 8 - 1;
> +	hsyncend = mode->hsync_end / 8 - 1;
> +	htotal = mode->htotal / 8 - 1;
> +
> +	/* Work around hardware quirk */
> +	if ((htotal & 0x07) == 0x06 || (htotal & 0x07) == 0x04)
> +		htotal++;
> +
> +	vdisplay = mode->vdisplay - 1;
> +	vsyncstart = mode->vsync_start - 1;
> +	vsyncend = mode->vsync_end - 1;
> +	vtotal = mode->vtotal - 2;
> +
> +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +		misc |= 0x40;
> +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +		misc |= 0x80;
> +
> +	crtcext1 = (((htotal - 4) & 0x100) >> 8) |
> +		   ((hdisplay & 0x100) >> 7) |
> +		   ((hsyncstart & 0x100) >> 6) |
> +		    (htotal & 0x40);
> +	if (mdev->type == G200_WB || mdev->type == G200_EW3)
> +		crtcext1 |= BIT(7) | /* vrsten */
> +			    BIT(3); /* hrsten */
> +
> +	crtcext2 = ((vtotal & 0xc00) >> 10) |
> +		   ((vdisplay & 0x400) >> 8) |
> +		   ((vdisplay & 0xc00) >> 7) |
> +		   ((vsyncstart & 0xc00) >> 5) |
> +		   ((vdisplay & 0x400) >> 3);
> +	crtcext5 = 0x00;
> +
> +	WREG_CRT(0, htotal - 4);
> +	WREG_CRT(1, hdisplay);
> +	WREG_CRT(2, hdisplay);
> +	WREG_CRT(3, (htotal & 0x1F) | 0x80);
> +	WREG_CRT(4, hsyncstart);
> +	WREG_CRT(5, ((htotal & 0x20) << 2) | (hsyncend & 0x1F));
> +	WREG_CRT(6, vtotal & 0xFF);
> +	WREG_CRT(7, ((vtotal & 0x100) >> 8) |
> +		 ((vdisplay & 0x100) >> 7) |
> +		 ((vsyncstart & 0x100) >> 6) |
> +		 ((vdisplay & 0x100) >> 5) |
> +		 ((vdisplay & 0x100) >> 4) | /* linecomp */
> +		 ((vtotal & 0x200) >> 4) |
> +		 ((vdisplay & 0x200) >> 3) |
> +		 ((vsyncstart & 0x200) >> 2));
> +	WREG_CRT(9, ((vdisplay & 0x200) >> 4) |
> +		 ((vdisplay & 0x200) >> 3));
> +	WREG_CRT(16, vsyncstart & 0xFF);
> +	WREG_CRT(17, (vsyncend & 0x0F) | 0x20);
> +	WREG_CRT(18, vdisplay & 0xFF);
> +	WREG_CRT(20, 0);
> +	WREG_CRT(21, vdisplay & 0xFF);
> +	WREG_CRT(22, (vtotal + 1) & 0xFF);
> +	WREG_CRT(23, 0xc3);
> +	WREG_CRT(24, vdisplay & 0xFF);
> +
> +	WREG_ECRT(0x01, crtcext1);
> +	WREG_ECRT(0x02, crtcext2);
> +	WREG_ECRT(0x05, crtcext5);
> +}
> +
>  static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  				struct drm_display_mode *mode,
>  				struct drm_display_mode *adjusted_mode,
> @@ -919,8 +992,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  	struct drm_device *dev = crtc->dev;
>  	struct mga_device *mdev = dev->dev_private;
>  	const struct drm_framebuffer *fb = crtc->primary->fb;
> -	int hdisplay, hsyncstart, hsyncend, htotal;
> -	int vdisplay, vsyncstart, vsyncend, vtotal;
>  	int pitch;
>  	int option = 0, option2 = 0;
>  	int i;
> @@ -999,12 +1070,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  		break;
>  	}
>  
> -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> -		misc |= 0x40;
> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> -		misc |= 0x80;
> -
> -
>  	for (i = 0; i < sizeof(dacvalue); i++) {
>  		if ((i <= 0x17) ||
>  		    (i == 0x1b) ||
> @@ -1044,20 +1109,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  	else
>  		pitch = pitch >> (4 - bppshift);
>  
> -	hdisplay = mode->hdisplay / 8 - 1;
> -	hsyncstart = mode->hsync_start / 8 - 1;
> -	hsyncend = mode->hsync_end / 8 - 1;
> -	htotal = mode->htotal / 8 - 1;
> -
> -	/* Work around hardware quirk */
> -	if ((htotal & 0x07) == 0x06 || (htotal & 0x07) == 0x04)
> -		htotal++;
> -
> -	vdisplay = mode->vdisplay - 1;
> -	vsyncstart = mode->vsync_start - 1;
> -	vsyncend = mode->vsync_end - 1;
> -	vtotal = mode->vtotal - 2;
> -
>  	WREG_GFX(0, 0);
>  	WREG_GFX(1, 0);
>  	WREG_GFX(2, 0);
> @@ -1068,61 +1119,26 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  	WREG_GFX(7, 0xf);
>  	WREG_GFX(8, 0xf);
>  
> -	WREG_CRT(0, htotal - 4);
> -	WREG_CRT(1, hdisplay);
> -	WREG_CRT(2, hdisplay);
> -	WREG_CRT(3, (htotal & 0x1F) | 0x80);
> -	WREG_CRT(4, hsyncstart);
> -	WREG_CRT(5, ((htotal & 0x20) << 2) | (hsyncend & 0x1F));
> -	WREG_CRT(6, vtotal & 0xFF);
> -	WREG_CRT(7, ((vtotal & 0x100) >> 8) |
> -		 ((vdisplay & 0x100) >> 7) |
> -		 ((vsyncstart & 0x100) >> 6) |
> -		 ((vdisplay & 0x100) >> 5) |
> -		 ((vdisplay & 0x100) >> 4) | /* linecomp */
> -		 ((vtotal & 0x200) >> 4)|
> -		 ((vdisplay & 0x200) >> 3) |
> -		 ((vsyncstart & 0x200) >> 2));
> -	WREG_CRT(9, ((vdisplay & 0x200) >> 4) |
> -		 ((vdisplay & 0x200) >> 3));
>  	WREG_CRT(10, 0);
>  	WREG_CRT(11, 0);
>  	WREG_CRT(12, 0);
>  	WREG_CRT(13, 0);
>  	WREG_CRT(14, 0);
>  	WREG_CRT(15, 0);
> -	WREG_CRT(16, vsyncstart & 0xFF);
> -	WREG_CRT(17, (vsyncend & 0x0F) | 0x20);
> -	WREG_CRT(18, vdisplay & 0xFF);
>  	WREG_CRT(19, pitch & 0xFF);
> -	WREG_CRT(20, 0);
> -	WREG_CRT(21, vdisplay & 0xFF);
> -	WREG_CRT(22, (vtotal + 1) & 0xFF);
> -	WREG_CRT(23, 0xc3);
> -	WREG_CRT(24, vdisplay & 0xFF);
> +
> +	mgag200_set_mode_regs(mdev, mode);
>  
>  	ext_vga[0] = 0;
> -	ext_vga[5] = 0;
>  
>  	/* TODO interlace */
>  
>  	ext_vga[0] |= (pitch & 0x300) >> 4;
> -	ext_vga[1] = (((htotal - 4) & 0x100) >> 8) |
> -		((hdisplay & 0x100) >> 7) |
> -		((hsyncstart & 0x100) >> 6) |
> -		(htotal & 0x40);
> -	ext_vga[2] = ((vtotal & 0xc00) >> 10) |
> -		((vdisplay & 0x400) >> 8) |
> -		((vdisplay & 0xc00) >> 7) |
> -		((vsyncstart & 0xc00) >> 5) |
> -		((vdisplay & 0x400) >> 3);
>  	if (fb->format->cpp[0] * 8 == 24)
>  		ext_vga[3] = (((1 << bppshift) * 3) - 1) | 0x80;
>  	else
>  		ext_vga[3] = ((1 << bppshift) - 1) | 0x80;
>  	ext_vga[4] = 0;
> -	if (mdev->type == G200_WB || mdev->type == G200_EW3)
> -		ext_vga[1] |= 0x88;
>  
>  	/* Set pixel clocks */
>  	misc = 0x2d;
> @@ -1130,9 +1146,9 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  
>  	mga_crtc_set_plls(mdev, mode->clock);
>  
> -	for (i = 0; i < 6; i++) {
> -		WREG_ECRT(i, ext_vga[i]);
> -	}
> +	WREG_ECRT(0, ext_vga[0]);
> +	WREG_ECRT(3, ext_vga[3]);
> +	WREG_ECRT(4, ext_vga[4]);
>  
>  	if (mdev->type == G200_ER)
>  		WREG_ECRT(0x24, 0x5);
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
