Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505FC1C2E58
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 19:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364F76E271;
	Sun,  3 May 2020 17:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C916E271
 for <dri-devel@lists.freedesktop.org>; Sun,  3 May 2020 17:23:24 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0267A2001F;
 Sun,  3 May 2020 19:23:21 +0200 (CEST)
Date: Sun, 3 May 2020 19:23:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 13/17] drm/mgag200: Move hiprilvl setting into separate
 functions
Message-ID: <20200503172315.GE23105@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-14-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=rJrRFs-aCHv1xywcDOEA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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

On Wed, Apr 29, 2020 at 04:32:34PM +0200, Thomas Zimmermann wrote:
> The hiprivlvl settings are now updated in mgag200_g200se_set_hiprilvl()
> and mgag200_g200ev_set_hiprilvl().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 98 ++++++++++++++------------
>  1 file changed, 54 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 6b88c306ff4d7..a04404c5aa769 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1118,6 +1118,56 @@ static void mgag200_g200er_reset_tagfifo(struct mga_device *mdev)
>  	WREG_SEQ(0x01, seq1);
>  }
>  
> +static void mgag200_g200se_set_hiprilvl(struct mga_device *mdev,
> +					const struct drm_display_mode *mode,
> +					const struct drm_framebuffer *fb)
> +{
> +	unsigned int hiprilvl;
> +	uint8_t crtcext6;
> +
> +	if  (mdev->unique_rev_id >= 0x04) {
> +		hiprilvl = 0;
> +	} else if (mdev->unique_rev_id >= 0x02) {
> +		unsigned int bpp;
> +		unsigned long mb;
> +
> +		if (fb->format->cpp[0] * 8 > 16)
> +			bpp = 32;
> +		else if (fb->format->cpp[0] * 8 > 8)
> +			bpp = 16;
> +		else
> +			bpp = 8;
> +
> +		mb = (mode->clock * bpp) / 1000;
> +		if (mb > 3100)
> +			hiprilvl = 0;
> +		else if (mb > 2600)
> +			hiprilvl = 1;
> +		else if (mb > 1900)
> +			hiprilvl = 2;
> +		else if (mb > 1160)
> +			hiprilvl = 3;
> +		else if (mb > 440)
> +			hiprilvl = 4;
> +		else
> +			hiprilvl = 5;
> +
> +	} else if (mdev->unique_rev_id >= 0x01) {
> +		hiprilvl = 3;
> +	} else {
> +		hiprilvl = 4;
> +	}
> +
> +	crtcext6 = hiprilvl; /* implicitly sets maxhipri to 0 */
> +
> +	WREG_ECRT(0x06, crtcext6);
> +}
> +
> +static void mgag200_g200ev_set_hiprilvl(struct mga_device *mdev)
> +{
> +	WREG_ECRT(0x06, 0x00);
> +}
> +
>  static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  				struct drm_display_mode *mode,
>  				struct drm_display_mode *adjusted_mode,
> @@ -1236,10 +1286,6 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  	if (mdev->type == G200_EW3)
>  		WREG_ECRT(0x34, 0x5);
>  
> -	if (mdev->type == G200_EV) {
> -		WREG_ECRT(6, 0);
> -	}
> -
>  	misc = RREG8(MGA_MISC_IN);
>  	misc |= MGAREG_MISC_IOADSEL |
>  		MGAREG_MISC_RAMMAPEN |
> @@ -1255,47 +1301,11 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  	if (mdev->type == G200_ER)
>  		mgag200_g200er_reset_tagfifo(mdev);
>  
> +	if (IS_G200_SE(mdev))
> +		mgag200_g200se_set_hiprilvl(mdev, mode, fb);
> +	else if (mdev->type == G200_EV)
> +		mgag200_g200ev_set_hiprilvl(mdev);
>  
> -	if (IS_G200_SE(mdev)) {
> -		if  (mdev->unique_rev_id >= 0x04) {
> -			WREG8(MGAREG_CRTCEXT_INDEX, 0x06);
> -			WREG8(MGAREG_CRTCEXT_DATA, 0);
> -		} else if (mdev->unique_rev_id >= 0x02) {
> -			u8 hi_pri_lvl;
> -			u32 bpp;
> -			u32 mb;
> -
> -			if (fb->format->cpp[0] * 8 > 16)
> -				bpp = 32;
> -			else if (fb->format->cpp[0] * 8 > 8)
> -				bpp = 16;
> -			else
> -				bpp = 8;
> -
> -			mb = (mode->clock * bpp) / 1000;
> -			if (mb > 3100)
> -				hi_pri_lvl = 0;
> -			else if (mb > 2600)
> -				hi_pri_lvl = 1;
> -			else if (mb > 1900)
> -				hi_pri_lvl = 2;
> -			else if (mb > 1160)
> -				hi_pri_lvl = 3;
> -			else if (mb > 440)
> -				hi_pri_lvl = 4;
> -			else
> -				hi_pri_lvl = 5;
> -
> -			WREG8(MGAREG_CRTCEXT_INDEX, 0x06);
> -			WREG8(MGAREG_CRTCEXT_DATA, hi_pri_lvl);
> -		} else {
> -			WREG8(MGAREG_CRTCEXT_INDEX, 0x06);
> -			if (mdev->unique_rev_id >= 0x01)
> -				WREG8(MGAREG_CRTCEXT_DATA, 0x03);
> -			else
> -				WREG8(MGAREG_CRTCEXT_DATA, 0x04);
> -		}
> -	}
>  	return 0;
>  }
>  
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
