Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4565A3352
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 03:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7EE10EAC9;
	Sat, 27 Aug 2022 01:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD66B10EAC9
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 01:07:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 122C64A8;
 Sat, 27 Aug 2022 03:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661562441;
 bh=m8ksfH8nmGsyi5xEncklMbzTnnb0HB+1yaYcqVa1Zgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SgrV/ylf4F8lYCjmqYu7MUo/LM+lesZNHUMCUgNrb6+ulCA4JGN9E15ei6EBQFOlw
 BgCuJTWKegO9yKdVjG+85dVGytF1/enMCxew27lQtwU+fsCdNaRo6aoT6unZAsd0s/
 iJcVRMQNBqABrysRuJ/3q9rUoDFQ/T3eZoVeW5jk=
Date: Sat, 27 Aug 2022 04:07:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v5 2/4] drm/bridge: ti-sn65dsi86: Reject modes with too
 large blanking
Message-ID: <YwluQWegvcoW3w/d@pendragon.ideasonboard.com>
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Aug 24, 2022 at 04:00:32PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The blanking related registers are 8 bits, so reject any modes
> with larger blanking periods.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index ba84215c1511..f085a037ff5b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -752,6 +752,29 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>  	if (mode->clock > 594000)
>  		return MODE_CLOCK_HIGH;
>  
> +	/*
> +	 * The blanking related registers are 8 bits, so reject any modes

s/blanking register/blanking-related/

> +	 * with larger blanking periods.
> +	 */
> +
> +	if ((mode->hsync_start - mode->hdisplay) > 0xff)
> +		return MODE_HBLANK_WIDE;
> +
> +	if ((mode->vsync_start - mode->vdisplay) > 0xff)
> +		return MODE_VBLANK_WIDE;
> +
> +	if ((mode->hsync_end - mode->hsync_start) > 0xff)
> +		return MODE_HSYNC_WIDE;
> +
> +	if ((mode->vsync_end - mode->vsync_start) > 0xff)
> +		return MODE_VSYNC_WIDE;
> +
> +	if ((mode->htotal - mode->hsync_end) > 0xff)
> +		return MODE_HBLANK_WIDE;
> +
> +	if ((mode->vtotal - mode->vsync_end) > 0xff)
> +		return MODE_VBLANK_WIDE;

You could drop all inner parentheses. Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	return MODE_OK;
>  }
>  

-- 
Regards,

Laurent Pinchart
