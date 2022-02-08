Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E904ACCC8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 01:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8610E128;
	Tue,  8 Feb 2022 00:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894E510E128
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 00:30:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59492340;
 Tue,  8 Feb 2022 01:30:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644280245;
 bh=myyYYwF0zw0KqcsUrHoCyxQvYmLiqqpmlW/RBPnVask=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pw/5iLsIlW/vT3n6wFmZjGchQqYtpgEt25SHIvD54VsSOXeRi02D6UsGvE4vQ/PRC
 zsU7e8i77HLbdtsPNMHPOxwmH83bEL3IRxYpR3V0Ib/X6PBE2o+FfGq2Ag18sD33N5
 Anwm1Jhj/7hBi22Vi5LO4W1bcPNXBwjhtE2kOgnY=
Date: Tue, 8 Feb 2022 02:30:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/9] drm/bridge: add DRM_BRIDGE_STATE_OPS macro
Message-ID: <YgG5snx6y69SKU6w@pendragon.ideasonboard.com>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220206154405.1243333-2-sam@ravnborg.org>
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

On Sun, Feb 06, 2022 at 04:43:57PM +0100, Sam Ravnborg wrote:
> The DRM_BRIDGE_STATE_OPS can be used as shortcut for bridge drivers that
> do not subclass drm_bridge_state to assign the default operations for
> reset, duplicate and destroy of the state.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  include/drm/drm_bridge.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 061d87313fac..fc00304be643 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -935,4 +935,16 @@ static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
>  }
>  #endif
>  
> +/**
> + * DRM_BRIDGE_STATE_OPS - Default drm_bridge state funcs

I'd name the macro DRM_BRIDGE_STATE_DEFAULT_OPS.

> + *
> + * Bridge driver that do not subclass &drm_bridge_state can use the helpers
> + * for reset, duplicate, and destroy. This macro provides a shortcut for
> + * setting the helpers in the &drm_bridge_funcs structure.
> + */
> +#define DRM_BRIDGE_STATE_OPS \
> +	.atomic_reset = drm_atomic_helper_bridge_reset,				\
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,	\
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state

I'm not a big fan of such macros for a small number of operations, as I
find that it obfuscates the code a bit, but that could change once I get
used to the new macro :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  #endif

-- 
Regards,

Laurent Pinchart
