Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9219A1C2D82
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 17:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000666E25E;
	Sun,  3 May 2020 15:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49806E25E
 for <dri-devel@lists.freedesktop.org>; Sun,  3 May 2020 15:42:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9C3ED804A4;
 Sun,  3 May 2020 17:42:10 +0200 (CEST)
Date: Sun, 3 May 2020 17:42:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 10/17] drm/mgag200: Set pitch in a separate helper function
Message-ID: <20200503154209.GC23105@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-11-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=9j-RmjQqD388Yx8HkDUA:9 a=CjuIK1q_8ugA:10
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

Hi Thomas.

On Wed, Apr 29, 2020 at 04:32:31PM +0200, Thomas Zimmermann wrote:
> The framebuffer's pitch is now set in mgag200_set_offset().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I failed to follow this code.

> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 41 +++++++++++++++++---------
>  1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 92dee31f16c42..eb83e471d72fc 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1003,6 +1003,32 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
>  	mga_crtc_set_plls(mdev, mode->clock);
>  }
>  
> +static void mgag200_set_offset(struct mga_device *mdev,
> +			       const struct drm_framebuffer *fb)
> +{
> +	unsigned int offset;
> +	uint8_t crtc13, crtcext0;
> +	u8 bppshift;
> +
> +	bppshift = mdev->bpp_shifts[fb->format->cpp[0] - 1];
Hmm, use of cpp is deprecated. But is continue to be used all over.

> +
> +	offset = fb->pitches[0] / fb->format->cpp[0];
> +	if (fb->format->cpp[0] * 8 == 24)
> +		offset = (offset * 3) >> (4 - bppshift);
> +	else
> +		offset = offset >> (4 - bppshift);
> +
> +	RREG_ECRT(0, crtcext0);
> +
> +	crtc13 = offset & 0xff;
> +
> +	crtcext0 &= ~GENMASK(5, 4);
> +	crtcext0 |= (offset & GENMASK(9, 8)) >> 4;
Lot's of hardcoded numbers.
Could the reg file include these so you had more readable defined names?

> +
> +	WREG_CRT(0x13, crtc13);
> +	WREG_ECRT(0x00, crtcext0);
> +}
> +
>  static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  				struct drm_display_mode *mode,
>  				struct drm_display_mode *adjusted_mode,
> @@ -1011,7 +1037,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  	struct drm_device *dev = crtc->dev;
>  	struct mga_device *mdev = dev->dev_private;
>  	const struct drm_framebuffer *fb = crtc->primary->fb;
> -	int pitch;
>  	int option = 0, option2 = 0;
>  	int i;
>  	unsigned char misc = 0;
> @@ -1122,12 +1147,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  	WREG_SEQ(3, 0);
>  	WREG_SEQ(4, 0xe);
>  
> -	pitch = fb->pitches[0] / fb->format->cpp[0];
> -	if (fb->format->cpp[0] * 8 == 24)
> -		pitch = (pitch * 3) >> (4 - bppshift);
> -	else
> -		pitch = pitch >> (4 - bppshift);
> -
>  	WREG_GFX(0, 0);
>  	WREG_GFX(1, 0);
>  	WREG_GFX(2, 0);
> @@ -1144,20 +1163,15 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  	WREG_CRT(13, 0);
>  	WREG_CRT(14, 0);
>  	WREG_CRT(15, 0);
> -	WREG_CRT(19, pitch & 0xFF);
> -
> -	ext_vga[0] = 0;
>  
>  	/* TODO interlace */
>  
> -	ext_vga[0] |= (pitch & 0x300) >> 4;
>  	if (fb->format->cpp[0] * 8 == 24)
>  		ext_vga[3] = (((1 << bppshift) * 3) - 1) | 0x80;
>  	else
>  		ext_vga[3] = ((1 << bppshift) - 1) | 0x80;
>  	ext_vga[4] = 0;
>  
> -	WREG_ECRT(0, ext_vga[0]);
>  	WREG_ECRT(3, ext_vga[3]);
>  	WREG_ECRT(4, ext_vga[4]);
>  
> @@ -1171,8 +1185,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  		WREG_ECRT(6, 0);
>  	}
>  
> -	WREG_ECRT(0, ext_vga[0]);
> -
>  	misc = RREG8(MGA_MISC_IN);
>  	misc |= MGAREG_MISC_IOADSEL |
>  		MGAREG_MISC_RAMMAPEN |
> @@ -1180,6 +1192,7 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  	WREG8(MGA_MISC_OUT, misc);
>  
>  	mga_crtc_do_set_base(mdev, fb, old_fb);
> +	mgag200_set_offset(mdev, fb);
>  
>  	mgag200_set_mode_regs(mdev, mode);

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
