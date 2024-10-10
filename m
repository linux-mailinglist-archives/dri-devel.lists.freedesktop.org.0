Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA257998D52
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 18:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3069E10E0D9;
	Thu, 10 Oct 2024 16:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bEFaeSdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B9910E0D9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 16:25:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 122AEA44BB7;
 Thu, 10 Oct 2024 16:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E75C4CEC5;
 Thu, 10 Oct 2024 16:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728577553;
 bh=dvlME7cIGafoPlXr0vrZLAnMPMxd5hylDvxsIK90mBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bEFaeSdYbaJNRDBzMzt5gJDKMbtLJZS07gnhmIHJoS4Q8dpJA6mdXqdEzvRbKnebR
 3PPRJ0h4OosI45rxXD4Vfq/7YOH8H2k+KxTDnEJJoytdpiWWbteZ6pdGidxMFSLAiG
 teGVlM0BzRssrV9DfwvtVt9C+D1ABgFGQY5rhugpGtDf+xgTRZHZRxvd/vhBo2oMfy
 VwVZUEHabjN84pA66Wd8Y1DYaqR2sbJnK8JjK7CqZNHWRNthh1YJRz3vR/Hp4P370d
 xwIhFw2vXyyKVVqE0vJuRiojWLA1QX1nV3L+eb+aEhBi6SYtnZDxqQGGmY2ktKAo0i
 yrq/ClO/qL7uQ==
Date: Thu, 10 Oct 2024 17:25:47 +0100
From: Lee Jones <lee@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: sam@ravnborg.org, bbrezillon@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: atmel-hlcdc: bypass LCDC pixel clock divider when
 using LCDC Generic Clock
Message-ID: <20241010162547.GK661995@google.com>
References: <20241010093132.235177-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010093132.235177-1-manikandan.m@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Oct 2024, Manikandan Muralidharan wrote:

> In sam9x7 SoC where XLCDC IP is used,add support to bypass the LCDC pixel
> clock divider when LCDC Generic clock is enabled.Used to match
> and drive the panel requested Pixel clock.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 8 +++++++-
>  include/linux/mfd/atmel-hlcdc.h                | 1 +

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 0f7ffb3ced20..c54770cecaa8 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -146,13 +146,19 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  
>  		if (div_low >= 2 &&
>  		    (10 * (prate / div_low - mode_rate) <
> -		     (mode_rate - prate / div)))
> +		     (mode_rate - prate / div))) {
>  			/*
>  			 * At least 10 times better when using a higher
>  			 * frequency than requested, instead of a lower.
>  			 * So, go with that.
>  			 */
>  			div = div_low;
> +		} else {
> +			if (crtc->dc->desc->is_xlcdc) {
> +				cfg |= ATMEL_XLCDC_CLKBYP;
> +				mask |= ATMEL_XLCDC_CLKBYP;
> +			}
> +		}
>  	}
>  
>  	cfg |= ATMEL_HLCDC_CLKDIV(div);
> diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
> index 80d675a03b39..982f494e6307 100644
> --- a/include/linux/mfd/atmel-hlcdc.h
> +++ b/include/linux/mfd/atmel-hlcdc.h
> @@ -44,6 +44,7 @@
>  #define ATMEL_XLCDC_HEO_UPDATE		BIT(3)
>  
>  #define ATMEL_HLCDC_CLKPOL		BIT(0)
> +#define ATMEL_XLCDC_CLKBYP		BIT(1)
>  #define ATMEL_HLCDC_CLKSEL		BIT(2)
>  #define ATMEL_HLCDC_CLKPWMSEL		BIT(3)
>  #define ATMEL_HLCDC_CGDIS(i)		BIT(8 + (i))
> -- 
> 2.25.1
> 

-- 
Lee Jones [李琼斯]
