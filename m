Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510FC54998B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B6310F3AC;
	Mon, 13 Jun 2022 17:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F31B10F3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=zzClTWa3O/O7WoHsh8nXqDCyyN5Trs41+RWOsjpe04g=;
 b=Q+QPoryxNxFrXPQfzGyDw/jTvgFzAY3j64IzVkKe3vOevqwCbq3gtgU6MK+rZvUENfsEJaXr83w29
 7w+CO2wY8cYIWQF5qwfYVq0avarl/K+lWQp1KTyQF42CYRs+VYVWYR9mpH7somrZAZvkA+iPYtL8Io
 gdtoT7BKBh05KoK7+rg87EH642dyJnO25bPz+rjh5R2LgMpTZdoxU0SdTVEDHx/phXo+Dqrco/72W2
 JhjalUdrtUI/EvLGmaCgieOICqEyYMvB0iFkCpQ2Cjh+Lhpq/DR2sx8gU0bSHfTm/A306ria6XffEg
 vKT+LDeauPgSq1patOteF1ASnsnTyqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=zzClTWa3O/O7WoHsh8nXqDCyyN5Trs41+RWOsjpe04g=;
 b=lhx59PuR409UoF3ARa+wFJMRMp00a1d0GDt/1G6yaRbeD5s7fXQ+lctqClreFu6x0Gcix9WzArpS5
 Ppzk/UtDw==
X-HalOne-Cookie: 96613712d1fa2b840aeadbfa0af9f24786789f88
X-HalOne-ID: 7280eb29-eb3b-11ec-a6c1-d0431ea8a283
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 7280eb29-eb3b-11ec-a6c1-d0431ea8a283;
 Mon, 13 Jun 2022 17:08:30 +0000 (UTC)
Date: Mon, 13 Jun 2022 19:08:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH 01/19] drm/gma500: Unify *_lvds_get_max_backlight()
Message-ID: <YqdvDI59JRfsZiut@ravnborg.org>
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
 <20220613123436.15185-2-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220613123436.15185-2-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrick.

On Mon, Jun 13, 2022 at 02:34:18PM +0200, Patrik Jakobsson wrote:
> These functions mostly do the same thing so unify them into one. All
> unified lvds code will live in gma_lvds.c.
> 
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> ---
> +/*
> + * Returns the maximum level of the backlight duty cycle field.
> + */

I find this function quite un-readable.

> +u32 gma_lvds_get_max_backlight(struct drm_device *dev)
> +{
> +	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +	u32 retval;
> +
> +	if (gma_power_begin(dev, false)) {
> +		retval = ((REG_READ(BLC_PWM_CTL) &
> +			  BACKLIGHT_MODULATION_FREQ_MASK) >>
> +			  BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
> +
> +		gma_power_end(dev);
> +	} else
> +		retval = ((dev_priv->regs.saveBLC_PWM_CTL &
> +			  BACKLIGHT_MODULATION_FREQ_MASK) >>
> +			  BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
> +
> +	return retval;
> +}

Maybe like this - which should be the same functionality:

u32 gma_lvds_get_max_backlight(struct drm_device *dev)
{
	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
	u32 pwmctl;

	if (gma_power_begin(dev, false)) {
		pwmctl = REG_READ(BLC_PWM_CTL);
		gma_power_end(dev);
	} else {
		pwmctl = dev_priv->regs.saveBLC_PWM_CTL;
	}
	
	pwmctl = pwmctl & BACKLIGHT_MODULATION_FREQ_MASK;
	return  (pwmctl >> BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
}

this is more or less the same as in psb_intel_lvds_get_max_backlight().

With or without this change the patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>> +
> +
> diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
> new file mode 100644
> index 000000000000..2a9ce8ee3fa7
> --- /dev/null
> +++ b/drivers/gpu/drm/gma500/gma_lvds.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/*
> + * Copyright © 2006-2011 Intel Corporation
> + */
> +
> +#ifndef _GMA_LVDS_H
> +#define _GMA_LVDS_H
> +
> +u32 gma_lvds_get_max_backlight(struct drm_device *dev);
> +
> +#endif
> diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> index 9c9ebf8e29c4..4913baca7ae2 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> @@ -20,6 +20,7 @@
>  #include "psb_drv.h"
>  #include "psb_intel_drv.h"
>  #include "psb_intel_reg.h"
> +#include "gma_lvds.h"
>  
>  /* The max/min PWM frequency in BPCR[31:17] - */
>  /* The smallest number is 1 (not 0) that can fit in the
> @@ -170,25 +171,6 @@ static void oaktrail_lvds_prepare(struct drm_encoder *encoder)
>  	gma_power_end(dev);
>  }
>  
> -static u32 oaktrail_lvds_get_max_backlight(struct drm_device *dev)
> -{
> -	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -	u32 ret;
> -
> -	if (gma_power_begin(dev, false)) {
> -		ret = ((REG_READ(BLC_PWM_CTL) &
> -			  BACKLIGHT_MODULATION_FREQ_MASK) >>
> -			  BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
> -
> -		gma_power_end(dev);
> -	} else
> -		ret = ((dev_priv->regs.saveBLC_PWM_CTL &
> -			  BACKLIGHT_MODULATION_FREQ_MASK) >>
> -			  BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
> -
> -	return ret;
> -}
> -
>  static void oaktrail_lvds_commit(struct drm_encoder *encoder)
>  {
>  	struct drm_device *dev = encoder->dev;
> @@ -197,8 +179,7 @@ static void oaktrail_lvds_commit(struct drm_encoder *encoder)
>  	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
>  
>  	if (mode_dev->backlight_duty_cycle == 0)
> -		mode_dev->backlight_duty_cycle =
> -					oaktrail_lvds_get_max_backlight(dev);
> +		mode_dev->backlight_duty_cycle = gma_lvds_get_max_backlight(dev);
>  	oaktrail_lvds_set_power(dev, gma_encoder, true);
>  }
>  
> diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> index 7ee6c8ce103b..371c202a15ce 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> @@ -18,6 +18,7 @@
>  #include "psb_drv.h"
>  #include "psb_intel_drv.h"
>  #include "psb_intel_reg.h"
> +#include "gma_lvds.h"
>  
>  /*
>   * LVDS I2C backlight control macros
> @@ -52,32 +53,6 @@ struct psb_intel_lvds_priv {
>  	struct gma_i2c_chan *i2c_bus;
>  };
>  
> -
> -/*
> - * Returns the maximum level of the backlight duty cycle field.
> - */
> -static u32 psb_intel_lvds_get_max_backlight(struct drm_device *dev)
> -{
> -	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -	u32 ret;
> -
> -	if (gma_power_begin(dev, false)) {
> -		ret = REG_READ(BLC_PWM_CTL);
> -		gma_power_end(dev);
> -	} else /* Powered off, use the saved value */
> -		ret = dev_priv->regs.saveBLC_PWM_CTL;
> -
> -	/* Top 15bits hold the frequency mask */
> -	ret = (ret &  BACKLIGHT_MODULATION_FREQ_MASK) >>
> -					BACKLIGHT_MODULATION_FREQ_SHIFT;
> -
> -        ret *= 2;	/* Return a 16bit range as needed for setting */
> -        if (ret == 0)
> -                dev_err(dev->dev, "BL bug: Reg %08x save %08X\n",
> -                        REG_READ(BLC_PWM_CTL), dev_priv->regs.saveBLC_PWM_CTL);
> -	return ret;
> -}
> -
>  /*
>   * Set LVDS backlight level by I2C command
>   *
> @@ -131,7 +106,7 @@ static int psb_lvds_pwm_set_brightness(struct drm_device *dev, int level)
>  	u32 max_pwm_blc;
>  	u32 blc_pwm_duty_cycle;
>  
> -	max_pwm_blc = psb_intel_lvds_get_max_backlight(dev);
> +	max_pwm_blc = gma_lvds_get_max_backlight(dev);
>  
>  	/*BLC_PWM_CTL Should be initiated while backlight device init*/
>  	BUG_ON(max_pwm_blc == 0);
> @@ -176,7 +151,7 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
>  /*
>   * Sets the backlight level.
>   *
> - * level: backlight level, from 0 to psb_intel_lvds_get_max_backlight().
> + * level: backlight level, from 0 to gma_lvds_get_max_backlight().
>   */
>  static void psb_intel_lvds_set_backlight(struct drm_device *dev, int level)
>  {
> @@ -275,8 +250,7 @@ static void psb_intel_lvds_save(struct drm_connector *connector)
>  	 * just make it full brightness
>  	 */
>  	if (dev_priv->backlight_duty_cycle == 0)
> -		dev_priv->backlight_duty_cycle =
> -		psb_intel_lvds_get_max_backlight(dev);
> +		dev_priv->backlight_duty_cycle = gma_lvds_get_max_backlight(dev);
>  
>  	dev_dbg(dev->dev, "(0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x)\n",
>  			lvds_priv->savePP_ON,
> @@ -445,7 +419,7 @@ static void psb_intel_lvds_commit(struct drm_encoder *encoder)
>  
>  	if (mode_dev->backlight_duty_cycle == 0)
>  		mode_dev->backlight_duty_cycle =
> -		    psb_intel_lvds_get_max_backlight(dev);
> +		    gma_lvds_get_max_backlight(dev);
>  
>  	psb_intel_lvds_set_power(dev, true);
>  }
> -- 
> 2.36.1
