Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4223D4F4C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED226E44B;
	Sun, 25 Jul 2021 17:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A93B6E44B
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:50:08 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id c2751beb-ed70-11eb-9082-0050568c148b;
 Sun, 25 Jul 2021 17:50:11 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 03509194B04;
 Sun, 25 Jul 2021 19:50:24 +0200 (CEST)
Date: Sun, 25 Jul 2021 19:50:04 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 17/17] drm: bridge: samsung-dsim: Add bridge mode_fixup
Message-ID: <YP2kTP77Z0/qmEub@ravnborg.org>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-18-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704090230.26489-18-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,
On Sun, Jul 04, 2021 at 02:32:30PM +0530, Jagan Teki wrote:
> Fixing up the mode flags are required in order to correlate
> the correct sync flags in i.MX8MM eLCDIF.
> 
> So, handle the mode flags via bridge, mode_fixup.

Please do this in atomic_check.
Check rcar-du for a way to get access to adjusted_mode.

I have a helper in the works, but I may not return to it until a week or
more.

	Sam

> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 0ed218f5eefc..c2a76ee5ac4e 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1474,6 +1474,16 @@ static void samsung_dsim_bridge_disable(struct drm_bridge *bridge)
>  	pm_runtime_put_sync(dsi->dev);
>  }
>  
> +static bool samsung_dsim_bridge_mode_fixup(struct drm_bridge *bridge,
> +					   const struct drm_display_mode *mode,
> +					   struct drm_display_mode *adjusted_mode)
> +{
> +	adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> +
> +	return true;
> +}
> +
>  static void samsung_dsim_bridge_mode_set(struct drm_bridge *bridge,
>  					 const struct drm_display_mode *mode,
>  					 const struct drm_display_mode *adjusted_mode)
> @@ -1542,6 +1552,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
>  	.enable = samsung_dsim_bridge_enable,
>  	.disable = samsung_dsim_bridge_disable,
>  	.mode_set = samsung_dsim_bridge_mode_set,
> +	.mode_fixup = samsung_dsim_bridge_mode_fixup,
>  	.attach = samsung_dsim_bridge_attach,
>  };
>  
> -- 
> 2.25.1
