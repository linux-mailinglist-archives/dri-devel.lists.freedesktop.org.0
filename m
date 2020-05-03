Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE241C2D7B
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 17:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0116E25C;
	Sun,  3 May 2020 15:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C076E25C
 for <dri-devel@lists.freedesktop.org>; Sun,  3 May 2020 15:34:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 66255804D8;
 Sun,  3 May 2020 17:34:34 +0200 (CEST)
Date: Sun, 3 May 2020 17:34:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 08/17] drm/mgag200: Split MISC register update into PLL
 selection, SYNC and I/O
Message-ID: <20200503153432.GA23105@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-9-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=QETBecno_6xkQj0YUwoA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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

On Wed, Apr 29, 2020 at 04:32:29PM +0200, Thomas Zimmermann wrote:
> Set different fields in MISC in their rsp location in the code. This
> patch also fixes a bug in the original code where the mode's SYNC flags
> were never written into the MISC register.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 37 ++++++++++++++++++--------
>  drivers/gpu/drm/mgag200/mgag200_reg.h  |  5 +++-
>  2 files changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 749ba6e420ac7..b5bb02e9f05d6 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -704,6 +704,8 @@ static int mga_g200er_set_plls(struct mga_device *mdev, long clock)
>  
>  static int mga_crtc_set_plls(struct mga_device *mdev, long clock)
>  {
> +	uint8_t misc;

General comment.
uint8_t and friends are for uapi stuff.
kernel internal prefer u8 and friends.

Would be good to clean this up in the drivire, maybe as a follow-up
patch after is becomes atomic.


> +
>  	switch(mdev->type) {
>  	case G200_SE_A:
>  	case G200_SE_B:
> @@ -724,6 +726,12 @@ static int mga_crtc_set_plls(struct mga_device *mdev, long clock)
>  		return mga_g200er_set_plls(mdev, clock);
>  		break;
>  	}
> +
> +	misc = RREG8(MGA_MISC_IN);
> +	misc &= ~GENMASK(3, 2);
The code would be easier to read if we had a 
#define MGAREG_MISC_CLK_SEL_MASK	GENMASK(3, 2)

So the above became:
	misc &= ~MGAREG_MISC_CLK_SEL_MASK;

Then it is more clear that the CLK_SEL bits are clared and then
MGA_MSK is set.

> +	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
> +	WREG8(MGA_MISC_OUT, misc);
> +
>  	return 0;
>  }
>  
> @@ -916,7 +924,7 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
>  {
>  	unsigned int hdisplay, hsyncstart, hsyncend, htotal;
>  	unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
> -	uint8_t misc = 0;
> +	uint8_t misc;
>  	uint8_t crtcext1, crtcext2, crtcext5;
>  
>  	hdisplay = mode->hdisplay / 8 - 1;
> @@ -933,10 +941,17 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
>  	vsyncend = mode->vsync_end - 1;
>  	vtotal = mode->vtotal - 2;
>  
> +	misc = RREG8(MGA_MISC_IN);
> +
>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> -		misc |= 0x40;
> +		misc |= MGAREG_MISC_HSYNCPOL;
> +	else
> +		misc &= ~MGAREG_MISC_HSYNCPOL;
> +
So the code just assumes DRM_MODE_FLAG_PHSYNC if
DRM_MODE_FLAG_NHSYNC is not set.
I think that is fine, but it also indicate how hoorible the
flags definitions are in mode->flags


>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> -		misc |= 0x80;
> +		misc |= MGAREG_MISC_VSYNCPOL;
> +	else
> +		misc &= ~MGAREG_MISC_VSYNCPOL;
And this code was touched in previous patch, but I gess it is better
to update it here.

>  
>  	crtcext1 = (((htotal - 4) & 0x100) >> 8) |
>  		   ((hdisplay & 0x100) >> 7) |
> @@ -982,6 +997,10 @@ static void mgag200_set_mode_regs(struct mga_device *mdev,
>  	WREG_ECRT(0x01, crtcext1);
>  	WREG_ECRT(0x02, crtcext2);
>  	WREG_ECRT(0x05, crtcext5);
> +
> +	WREG8(MGA_MISC_OUT, misc);
> +
> +	mga_crtc_set_plls(mdev, mode->clock);
>  }
>  
>  static int mga_crtc_mode_set(struct drm_crtc *crtc,
> @@ -1140,12 +1159,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  		ext_vga[3] = ((1 << bppshift) - 1) | 0x80;
>  	ext_vga[4] = 0;
>  
> -	/* Set pixel clocks */
> -	misc = 0x2d;
> -	WREG8(MGA_MISC_OUT, misc);
> -
> -	mga_crtc_set_plls(mdev, mode->clock);
> -
>  	WREG_ECRT(0, ext_vga[0]);
>  	WREG_ECRT(3, ext_vga[3]);
>  	WREG_ECRT(4, ext_vga[4]);
> @@ -1161,9 +1174,11 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  	}
>  
>  	WREG_ECRT(0, ext_vga[0]);
> -	/* Enable mga pixel clock */
> -	misc = 0x2d;
>  
> +	misc = RREG8(MGA_MISC_IN);
> +	misc |= MGAREG_MISC_IOADSEL |
> +		MGAREG_MISC_RAMMAPEN |
> +		MGAREG_MISC_HIGH_PG_SEL;
>  	WREG8(MGA_MISC_OUT, misc);

I am left puzzeled why there is several writes to MGA_MISC_OUT.
The driver needs to read back and then write again.

Would it be simpler to have one function that only took care of
misc register update?

>  
>  	mga_crtc_do_set_base(mdev, fb, old_fb);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
> index c096a9d6bcbc1..89e12c55153cf 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_reg.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
> @@ -16,10 +16,11 @@
>   *		MGA1064SG Mystique register file
>   */
>  
> -
>  #ifndef _MGA_REG_H_
>  #define _MGA_REG_H_
>  
> +#include <linux/bits.h>
> +
>  #define	MGAREG_DWGCTL		0x1c00
>  #define	MGAREG_MACCESS		0x1c04
>  /* the following is a mystique only register */
> @@ -227,6 +228,8 @@
>  #define MGAREG_MISC_CLK_SEL_MGA_MSK	(0x3 << 2)
>  #define MGAREG_MISC_VIDEO_DIS	(0x1 << 4)
>  #define MGAREG_MISC_HIGH_PG_SEL	(0x1 << 5)
> +#define MGAREG_MISC_HSYNCPOL		BIT(6)
> +#define MGAREG_MISC_VSYNCPOL		BIT(7)
I like BIT(), but mixing (1 << N) and BIT() does not look nice.
Oh, and do not get me started on GENMASK() :-)

	Sam
>  
>  /* MMIO VGA registers */
>  #define MGAREG_SEQ_INDEX	0x1fc4
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
