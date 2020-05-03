Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2781C2DEE
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 18:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F8B6E0B7;
	Sun,  3 May 2020 16:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151556E0B7
 for <dri-devel@lists.freedesktop.org>; Sun,  3 May 2020 16:25:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 93985804E5;
 Sun,  3 May 2020 18:25:30 +0200 (CEST)
Date: Sun, 3 May 2020 18:25:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/17] drm/mgag200: Move TAGFIFO reset into separate
 function
Message-ID: <20200503162529.GD23105@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-13-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=CQqKy-xza9vA-qq3lXsA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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

One nit about a bit name below.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

On Wed, Apr 29, 2020 at 04:32:33PM +0200, Thomas Zimmermann wrote:
> 5
> 
> The TAGFIFO state is now reset in mgag200_g200er_reset_tagfifo().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  6 ++++
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 45 +++++++++++++++++---------
>  2 files changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 9b957d9fc7e04..b10da90e0f35a 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -49,6 +49,12 @@
>  		WREG8(ATTR_DATA, v);				\
>  	} while (0)						\
>  
> +#define RREG_SEQ(reg, v)					\
> +	do {							\
> +		WREG8(MGAREG_SEQ_INDEX, reg);			\
> +		v = RREG8(MGAREG_SEQ_DATA);			\
> +	} while (0)						\
> +
>  #define WREG_SEQ(reg, v)					\
>  	do {							\
>  		WREG8(MGAREG_SEQ_INDEX, reg);			\
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 73f7135cbb3d8..6b88c306ff4d7 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1091,6 +1091,33 @@ static void mgag200_set_format_regs(struct mga_device *mdev,
>  	WREG_ECRT(3, crtcext3);
>  }
>  
> +static void mgag200_g200er_reset_tagfifo(struct mga_device *mdev)
> +{
> +	static uint32_t RESET_FLAG = 0x00200000; /* undocumented magic value */
> +	u8 seq1;
> +	u32 memctl;
> +
> +	/* screen off */
> +	RREG_SEQ(0x01, seq1);
> +	seq1 |= 0x20;
This looks like this:
#define        M_SEQ1_SCROFF            0x20


> +	WREG_SEQ(0x01, seq1);
> +
> +	memctl = RREG32(MGAREG_MEMCTL);
> +
> +	memctl |= RESET_FLAG;
> +	WREG32(MGAREG_MEMCTL, memctl);
> +
> +	udelay(1000);
> +
> +	memctl &= ~RESET_FLAG;
> +	WREG32(MGAREG_MEMCTL, memctl);
> +
> +	/* screen on */
> +	RREG_SEQ(0x01, seq1);
> +	seq1 &= ~0x20;
> +	WREG_SEQ(0x01, seq1);
Here seq1 is read again, the old code used the old value.
I think new code is better.

> +}
> +
>  static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  				struct drm_display_mode *mode,
>  				struct drm_display_mode *adjusted_mode,
> @@ -1225,22 +1252,8 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  
>  	mgag200_set_mode_regs(mdev, mode);
>  
> -	/* reset tagfifo */
> -	if (mdev->type == G200_ER) {
> -		u32 mem_ctl = RREG32(MGAREG_MEMCTL);
> -		u8 seq1;
> -
> -		/* screen off */
> -		WREG8(MGAREG_SEQ_INDEX, 0x01);
> -		seq1 = RREG8(MGAREG_SEQ_DATA) | 0x20;
> -		WREG8(MGAREG_SEQ_DATA, seq1);
> -
> -		WREG32(MGAREG_MEMCTL, mem_ctl | 0x00200000);
> -		udelay(1000);
> -		WREG32(MGAREG_MEMCTL, mem_ctl & ~0x00200000);
> -
> -		WREG8(MGAREG_SEQ_DATA, seq1 & ~0x20);
> -	}
> +	if (mdev->type == G200_ER)
> +		mgag200_g200er_reset_tagfifo(mdev);
>  
>  
>  	if (IS_G200_SE(mdev)) {
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-dev
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
