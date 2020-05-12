Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FC71CFDC5
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 20:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0736F6E17B;
	Tue, 12 May 2020 18:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6C26E17B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 18:50:26 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EC7DA80512;
 Tue, 12 May 2020 20:50:20 +0200 (CEST)
Date: Tue, 12 May 2020 20:50:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 02/15] drm/mgag200: Clean up mga_set_start_address()
Message-ID: <20200512185014.GA13949@ravnborg.org>
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512084258.12673-3-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=yPCof4ZbAAAA:8 a=7gkXJVJtAAAA:8
 a=ltBTedp8EoImT-3YN8MA:9 a=FwM2J8Ra-q_vwob9:21 a=7hFS1yOpdwAGGnxT:21
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
 kraxel@redhat.com, airlied@redhat.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Tue, May 12, 2020 at 10:42:45AM +0200, Thomas Zimmermann wrote:
> All register names and fields are now named according to the
> MGA programming manuals. The function doesn't need the CRTC, so
> callers pass in the device structure directly. The logging now
> uses device-specific macros.
> 
> v2:
> 	* use to_mga_device()
> 	* use MiB instead of MB
> 	* replace empty while loop with do-while, fixes checkpatch warning
> 	* replace uint{8,32}_t with u{8,32}
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: John Donnelly <John.p.donnelly@oracle.com>

With the comment below addressed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  5 ++
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 82 +++++++++++++++-----------
>  2 files changed, 53 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index bc372c2ec79e9..1963876ef3b8c 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -61,6 +61,11 @@
>  		WREG8(MGAREG_CRTC_DATA, v);			\
>  	} while (0)						\
>  
> +#define RREG_ECRT(reg, v)					\
> +	do {							\
> +		WREG8(MGAREG_CRTCEXT_INDEX, reg);		\
> +		v = RREG8(MGAREG_CRTCEXT_DATA);			\
> +	} while (0)						\
>  
>  #define WREG_ECRT(reg, v)					\
>  	do {							\
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index c68ed8b6faf9b..80a3a805c0c4e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -819,49 +819,53 @@ static void mga_g200wb_commit(struct drm_crtc *crtc)
>  }
>  
>  /*
> -   This is how the framebuffer base address is stored in g200 cards:
> -   * Assume @offset is the gpu_addr variable of the framebuffer object
> -   * Then addr is the number of _pixels_ (not bytes) from the start of
> -     VRAM to the first pixel we want to display. (divided by 2 for 32bit
> -     framebuffers)
> -   * addr is stored in the CRTCEXT0, CRTCC and CRTCD registers
> -   addr<20> -> CRTCEXT0<6>
> -   addr<19-16> -> CRTCEXT0<3-0>
> -   addr<15-8> -> CRTCC<7-0>
> -   addr<7-0> -> CRTCD<7-0>
> -   CRTCEXT0 has to be programmed last to trigger an update and make the
> -   new addr variable take effect.
> + * This is how the framebuffer base address is stored in g200 cards:
> + *   * Assume @offset is the gpu_addr variable of the framebuffer object
> + *   * Then addr is the number of _pixels_ (not bytes) from the start of
> + *     VRAM to the first pixel we want to display. (divided by 2 for 32bit
> + *     framebuffers)
> + *   * addr is stored in the CRTCEXT0, CRTCC and CRTCD registers
> + *      addr<20> -> CRTCEXT0<6>
> + *      addr<19-16> -> CRTCEXT0<3-0>
> + *      addr<15-8> -> CRTCC<7-0>
> + *      addr<7-0> -> CRTCD<7-0>
> + *
> + *  CRTCEXT0 has to be programmed last to trigger an update and make the
> + *  new addr variable take effect.
>   */
> -static void mga_set_start_address(struct drm_crtc *crtc, unsigned offset)
> +static void mgag200_set_startadd(struct mga_device *mdev,
> +				 unsigned long offset)
>  {
> -	struct mga_device *mdev = to_mga_device(crtc->dev);
> -	u32 addr;
> -	int count;
> -	u8 crtcext0;
> +	struct drm_device *dev = mdev->dev;
> +	u32 startadd;
> +	u8 crtcc, crtcd, crtcext0;
>  
> -	while (RREG8(0x1fda) & 0x08);
> -	while (!(RREG8(0x1fda) & 0x08));
> +	startadd = offset / 8;
>  
> -	count = RREG8(MGAREG_VCOUNT) + 2;
> -	while (RREG8(MGAREG_VCOUNT) < count);
> -
> -	WREG8(MGAREG_CRTCEXT_INDEX, 0);
> -	crtcext0 = RREG8(MGAREG_CRTCEXT_DATA);
> -	crtcext0 &= 0xB0;
> -	addr = offset / 8;
> -	/* Can't store addresses any higher than that...
> -	   but we also don't have more than 16MB of memory, so it should be fine. */
> -	WARN_ON(addr > 0x1fffff);
> -	crtcext0 |= (!!(addr & (1<<20)))<<6;
> -	WREG_CRT(0x0d, (u8)(addr & 0xff));
> -	WREG_CRT(0x0c, (u8)(addr >> 8) & 0xff);
> -	WREG_ECRT(0x0, ((u8)(addr >> 16) & 0xf) | crtcext0);
> +	/*
> +	 * Can't store addresses any higher than that, but we also
> +	 * don't have more than 16 MiB of memory, so it should be fine.
> +	 */
> +	drm_WARN_ON(dev, startadd > 0x1fffff);
> +
> +	RREG_ECRT(0x00, crtcext0);
> +
> +	crtcc = (startadd >> 8) & 0xff;
> +	crtcd = startadd & 0xff;
> +	crtcext0 &= 0xb0;
> +	crtcext0 |= ((startadd >> 14) & BIT(6)) |
> +		    ((startadd >> 16) & 0x0f);
> +
> +	WREG_CRT(0x0c, crtcc);
> +	WREG_CRT(0x0d, crtcd);
> +	WREG_ECRT(0x00, crtcext0);
>  }
>  
>  static int mga_crtc_do_set_base(struct drm_crtc *crtc,
>  				struct drm_framebuffer *fb,
>  				int x, int y, int atomic)
>  {
> +	struct mga_device *mdev = to_mga_device(crtc->dev);
>  	struct drm_gem_vram_object *gbo;
>  	int ret;
>  	s64 gpu_addr;
> @@ -882,7 +886,7 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
>  		goto err_drm_gem_vram_unpin;
>  	}
>  
> -	mga_set_start_address(crtc, (u32)gpu_addr);
> +	mgag200_set_startadd(mdev, (unsigned long)gpu_addr);
>  
>  	return 0;
>  
> @@ -894,6 +898,16 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,
>  static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
>  				  struct drm_framebuffer *old_fb)
>  {
> +	struct drm_device *dev = crtc->dev;
> +	struct mga_device *mdev = dev->dev_private;
> +	unsigned int count;
> +
> +	do { } while (RREG8(0x1fda) & 0x08);
> +	do { } while (!(RREG8(0x1fda) & 0x08));
> +
> +	count = RREG8(MGAREG_VCOUNT) + 2;
> +	do { } while (RREG8(MGAREG_VCOUNT) < count);
> +
>  	return mga_crtc_do_set_base(crtc, old_fb, x, y, 0);
>  }
The changelog still does not explain why this code is moved here.



>  
> -- 
> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
