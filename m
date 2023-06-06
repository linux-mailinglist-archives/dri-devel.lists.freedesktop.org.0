Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5356872465D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E84510E365;
	Tue,  6 Jun 2023 14:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072A210E363
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:38:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp
 [126.253.223.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BE0CAB;
 Tue,  6 Jun 2023 16:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686062268;
 bh=SlYjAxQ88VfcgDbxzfQdqVW8absnYmwE1GYlH2uvgyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p2H//vRKtHfTqkbrO1+l/tMtYeC3G/DKhQBKZfHL9Y6zJPpYnOOWz5uz+/Dm7XlOS
 i/WdCD887zHat9i9b39M2rGjrC26htPbnQh6u4WIERU3kSsHhYIRDbU/wrxapOwC9n
 /73Eq3tO6iO2+oBeYRtfz8o+q3ddQUZYXT9KKaKo=
Date: Tue, 6 Jun 2023 17:38:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v9 7/8] drm: Remove usage of deprecated DRM_DEBUG_DRIVER
Message-ID: <20230606143810.GC5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <22d3153244242e08984b16065da19308a513a743.1686047727.git.code@siddh.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22d3153244242e08984b16065da19308a513a743.1686047727.git.code@siddh.me>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Siddh,

Thank you for the patch.

On Tue, Jun 06, 2023 at 04:15:21PM +0530, Siddh Raman Pant wrote:
> drm_print.h says DRM_DEBUG_DRIVER is deprecated.
> Thus, use newer drm_dbg_driver().
> 
> Also fix the deprecation comment in drm_print.h which
> mentions drm_dbg() instead of drm_dbg_driver().
> 
> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 10 +++++-----
>  include/drm/drm_print.h        |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 58ff9503a403..ab5dd5933a1a 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -70,11 +70,11 @@
>  #define MIPI_DBI_DEBUG_COMMAND(cmd, data, len) \
>  ({ \
>  	if (!len) \
> -		DRM_DEBUG_DRIVER("cmd=%02x\n", cmd); \
> +		drm_dbg_driver(NULL, "cmd=%02x\n", cmd); \
>  	else if (len <= 32) \
> -		DRM_DEBUG_DRIVER("cmd=%02x, par=%*ph\n", cmd, (int)len, data);\
> +		drm_dbg_driver(NULL, "cmd=%02x, par=%*ph\n", cmd, (int)len, data);\
>  	else \
> -		DRM_DEBUG_DRIVER("cmd=%02x, len=%zu\n", cmd, len); \
> +		drm_dbg_driver(NULL, "cmd=%02x, len=%zu\n", cmd, len); \
>  })
>  
>  static const u8 mipi_dbi_dcs_read_commands[] = {
> @@ -708,7 +708,7 @@ bool mipi_dbi_display_is_on(struct mipi_dbi *dbi)
>  	    DCS_POWER_MODE_DISPLAY_NORMAL_MODE | DCS_POWER_MODE_SLEEP_MODE))
>  		return false;
>  
> -	DRM_DEBUG_DRIVER("Display is ON\n");
> +	drm_dbg_driver(NULL, "Display is ON\n");
>  	return true;
>  }
> @@ -1256,7 +1256,7 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
>  
>  	mutex_init(&dbi->cmdlock);
>  
> -	DRM_DEBUG_DRIVER("SPI speed: %uMHz\n", spi->max_speed_hz / 1000000);
> +	drm_dbg_driver(NULL, "SPI speed: %uMHz\n", spi->max_speed_hz / 1000000);

We don't have access to a struct drm_device pointer here, but we have
access to a struct device through spi_device. It's quite annoying to be
forced by drm_dbg_driver() to use NULL. This isn't a regression, so I'm
fine with this patch, but it probably shows that the drm_print macros
are not always good fits and that API improvements are needed.

With the commit message fixed as mentioned in the review of an earlier
patch in this series,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	return 0;
>  }
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 4b8532cf2ae6..2bac5e8fd550 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -589,7 +589,7 @@ void __drm_err(const char *format, ...);
>  #define DRM_DEBUG(fmt, ...)						\
>  	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
>  
> -/* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
> +/* NOTE: this is deprecated in favor of drm_dbg_driver(NULL, ...). */
>  #define DRM_DEBUG_DRIVER(fmt, ...)					\
>  	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>  

-- 
Regards,

Laurent Pinchart
