Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF74ACCCF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 01:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37610E129;
	Tue,  8 Feb 2022 00:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5C010E1A6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 00:40:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78826340;
 Tue,  8 Feb 2022 01:40:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644280831;
 bh=/1yJXKIcbpw4XZahIMz7M2mrJlPPvMD22wqPJxSjErU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tOE3QNKYhIOxgas4QuwTkyktM4FjvG8XsEpDI/7/6MA3J9sl5HhBuK42dRGMUKJRB
 M09Jfgg6I34mCRvW9pvD7oxWvjO8RmrAUtDQ0HlBVkFcECY6ti+qs2nvGr+IXWA05I
 kWbB4h1aBI8wiAr0bI78sHj1XCSrjYM1OFcGy2J8=
Date: Tue, 8 Feb 2022 02:40:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/9] drm: add drm specific media-bus-format header file
Message-ID: <YgG7/eb6ymR/1U70@pendragon.ideasonboard.com>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220206154405.1243333-3-sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Feb 06, 2022 at 04:43:58PM +0100, Sam Ravnborg wrote:
> For now the header file includes a single method to retreive the bpc

s/retreive/retrieve/

> from the bus format.
> The supported MEDIA_BUS_* codes are the ones used for the current panels
> in DRM. The list can be extended as there are a need for more formats.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  include/drm/media-bus-format.h | 53 ++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 include/drm/media-bus-format.h
> 
> diff --git a/include/drm/media-bus-format.h b/include/drm/media-bus-format.h
> new file mode 100644
> index 000000000000..d4d18f19a70f
> --- /dev/null
> +++ b/include/drm/media-bus-format.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Sam Ravnborg
> + */
> +
> +#ifndef __LINUX_DRM_MEDIA_BUS_FORMAT
> +#define __LINUX_DRM_MEDIA_BUS_FORMAT
> +
> +#include <linux/bug.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/types.h>
> +
> +/**
> + * media_bus_format_to_bpc - The bits per color channel for the bus_format
> + *
> + * Based on the supplied bus_format return the maximum number of bits
> + * per color channel.
> + *
> + * RETURNS
> + * The number of bits per color channel, or -EINVAL if the bus_format
> + * is unknown.
> + */
> +static inline int media_bus_format_to_bpc(u32 bus_format)
> +{
> +	switch (bus_format) {
> +	/* DPI */
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +		return 6;
> +
> +	/* DPI */
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB888_3X8:
> +	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +		return 8;
> +
> +     	/* LVDS */

Wrong indentation.

> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		return 6;
> +
> +     	/* LVDS */
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		return 8;
> +
> +	default:
> +		WARN(1, "Unknown MEDIA_BUS format %d\n", bus_format);
> +		return -EINVAL;
> +	}
> +}

This seems a bit big for an inline function.

If we add more helper functions, it will result in lots of switch...case
statements. Could we use the same approach as in drm_fourcc.h with a
format info structure ?

> +
> +#endif

-- 
Regards,

Laurent Pinchart
