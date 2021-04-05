Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64D5353A74
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 02:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5CD6E0E9;
	Mon,  5 Apr 2021 00:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE0B6E0E9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 00:59:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B06C1D40;
 Mon,  5 Apr 2021 02:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617584370;
 bh=vfFmpNJF/fiC2qTs4S5P4oYV9/Rjj51A1zCLqAj61Ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c/cYoodP20+9+bb1rkYiNbOu6k4O/M5qnuNWvP5kmaoV0Qlw0rnIk7Cok/O/4KeQy
 KmkFAXeegKyc61qJNvIxWff6v2sPnFezEVIO+2JsReAcatNQoRt1H224cBjGwhM0tx
 HKe+SQDQW2SAo3aQOlV7SwL2UljxxB7t1fNHwr1k=
Date: Mon, 5 Apr 2021 03:58:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 06/12] drm/bridge: ti-sn65dsi86: Get rid of the
 useless detect() function
Message-ID: <YGpgxss706zm/+By@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.6.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.6.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:40PM -0700, Douglas Anderson wrote:
> If we just leave the detect() function as NULL then the upper layers
> assume we're always connected. There's no reason for a stub.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index e30460002c48..51db30d573c1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -306,20 +306,8 @@ static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
>  	.mode_valid = ti_sn_bridge_connector_mode_valid,
>  };
>  
> -static enum drm_connector_status
> -ti_sn_bridge_connector_detect(struct drm_connector *connector, bool force)
> -{
> -	/**
> -	 * TODO: Currently if drm_panel is present, then always
> -	 * return the status as connected. Need to add support to detect
> -	 * device state for hot pluggable scenarios.
> -	 */
> -	return connector_status_connected;
> -}
> -
>  static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.detect = ti_sn_bridge_connector_detect,
>  	.destroy = drm_connector_cleanup,
>  	.reset = drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
