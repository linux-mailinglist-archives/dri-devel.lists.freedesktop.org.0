Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 337F74BBEA1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 18:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6391B10E146;
	Fri, 18 Feb 2022 17:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1A310E146;
 Fri, 18 Feb 2022 17:47:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED5B8482;
 Fri, 18 Feb 2022 18:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645206470;
 bh=AeJhQIrl7kaQkaCwa4nHx70xAmOpJnbiz0a0jKT3OiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8B0HBNKGtUFPV32deV/2qeQ2HM4bJ9PplhGD3Zzo+PqGtCzrcvUiouNvDnVWUYh8
 ex3ixl7CjONlthhg+Okvsg/QX3okxrWbi4Pr52aCAXc9I/Sc2j3idtwKOTVvowL574
 JW8z9ygT+mZakoI2yAuzYgPHGKoSxgTK1tOPz8Dc=
Date: Fri, 18 Feb 2022 19:47:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 06/22] drm/bridge: Use drm_mode_copy()
Message-ID: <Yg/bvcv+9jS5WAEs@pendragon.ideasonboard.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220218100403.7028-7-ville.syrjala@linux.intel.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

Thank you for the patch.

On Fri, Feb 18, 2022 at 12:03:47PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> struct drm_display_mode embeds a list head, so overwriting
> the full struct with another one will corrupt the list
> (if the destination mode is on a list). Use drm_mode_copy()
> instead which explicitly preserves the list head of
> the destination mode.
> 
> Even if we know the destination mode is not on any list
> using drm_mode_copy() seems decent as it sets a good
> example. Bad examples of not using it might eventually
> get copied into code where preserving the list head
> actually matters.
> 
> Obviously one case not covered here is when the mode
> itself is embedded in a larger structure and the whole
> structure is copied. But if we are careful when copying
> into modes embedded in structures I think we can be a
> little more reassured that bogus list heads haven't been
> propagated in.
> 
> @is_mode_copy@
> @@
> drm_mode_copy(...)
> {
> ...
> }
> 
> @depends on !is_mode_copy@
> struct drm_display_mode *mode;
> expression E, S;
> @@
> (
> - *mode = E
> + drm_mode_copy(mode, &E)
> |
> - memcpy(mode, E, S)
> + drm_mode_copy(mode, E)
> )
> 
> @depends on !is_mode_copy@
> struct drm_display_mode mode;
> expression E;
> @@
> (
> - mode = E
> + drm_mode_copy(&mode, &E)
> |
> - memcpy(&mode, E, S)
> + drm_mode_copy(&mode, E)
> )
> 
> @@
> struct drm_display_mode *mode;
> @@
> - &*mode
> + mode
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c          | 2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
>  drivers/gpu/drm/bridge/tc358767.c         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 963a6794735f..881cf338d5cf 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -857,7 +857,7 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
>  	/* Save the new desired phy config */
>  	memcpy(&dsi->phy_cfg, &new_cfg, sizeof(new_cfg));
>  
> -	memcpy(&dsi->mode, adjusted_mode, sizeof(dsi->mode));
> +	drm_mode_copy(&dsi->mode, adjusted_mode);
>  	drm_mode_debug_printmodeline(adjusted_mode);
>  
>  	if (pm_runtime_resume_and_get(dev) < 0)
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 4befc104d220..a563460f8d20 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2830,7 +2830,7 @@ static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>  	mutex_lock(&hdmi->mutex);
>  
>  	/* Store the display mode for plugin/DKMS poweron events */
> -	memcpy(&hdmi->previous_mode, mode, sizeof(hdmi->previous_mode));
> +	drm_mode_copy(&hdmi->previous_mode, mode);
>  
>  	mutex_unlock(&hdmi->mutex);
>  }
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index c23e0abc65e8..7f9574b17caa 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1312,7 +1312,7 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  
> -	tc->mode = *mode;
> +	drm_mode_copy(&tc->mode, mode);
>  }
>  
>  static struct edid *tc_get_edid(struct drm_bridge *bridge,

-- 
Regards,

Laurent Pinchart
