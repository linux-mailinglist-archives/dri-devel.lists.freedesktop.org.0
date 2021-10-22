Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027FE4378DE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 16:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0258E6E5C0;
	Fri, 22 Oct 2021 14:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102556E5BF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 14:16:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0C1551D;
 Fri, 22 Oct 2021 16:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634912168;
 bh=Aeh70f2r0wQV/wb1x02cOw9hnDeyXSaLBnVvry1mwe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rzBB0LaMFaMCZ2/dRF1HPjKReXJ7F978Gl8b3WnKVG4RBRlozPil9ZZwqX8as3T1K
 IVgOgyAYDmi5y6xxhfxVMDJ7m8jQ0VqISSbeEfU8H3Jq0cg9u1e6HJj4gB9EJ+3kct
 9jmtrc0DbMiOgdCITq76tJvu4SoaAWkaNpLnJOYw=
Date: Fri, 22 Oct 2021 17:15:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 1/7] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Message-ID: <YXLHlaLfPD4wI7R7@pendragon.ideasonboard.com>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211020181901.2114645-2-sam@ravnborg.org>
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

Hi Sam,

Thank you for the patch.

On Wed, Oct 20, 2021 at 08:18:55PM +0200, Sam Ravnborg wrote:
> The atomic variants of enable/disable in drm_bridge_funcs are the
> preferred operations - introduce these.
> 
> The ps8640 driver used the non-atomic variants of the drm_bridge_chain_pre_enable/
> drm_bridge_chain_post_disable - convert these to the atomic variants.
> 
> v2:
>   - Added a few more people to cc: (Jitao, Enric, Philip) to increase
>     possibility to get test feedback
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Maxime Ripard <maxime@cerno.tech>
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Philip Chen <philipchen@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 3aaa90913bf8..0b620afe99c0 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -376,7 +376,8 @@ static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
>  	ps_bridge->powered = false;
>  }
>  
> -static void ps8640_pre_enable(struct drm_bridge *bridge)
> +static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  	int ret;
> @@ -388,7 +389,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>  		ps8640_bridge_poweroff(ps_bridge);
>  }
>  
> -static void ps8640_post_disable(struct drm_bridge *bridge)
> +static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  
> @@ -489,7 +491,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>  	 * EDID, for this chip, we need to do a full poweron, otherwise it will
>  	 * fail.
>  	 */
> -	drm_bridge_chain_pre_enable(bridge);
> +	drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
>  
>  	edid = drm_get_edid(connector,
>  			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
> @@ -499,7 +501,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>  	 * before, return the chip to its original power state.
>  	 */
>  	if (poweroff)
> -		drm_bridge_chain_post_disable(bridge);
> +		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
>  
>  	return edid;
>  }
> @@ -508,8 +510,8 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
>  	.attach = ps8640_bridge_attach,
>  	.detach = ps8640_bridge_detach,
>  	.get_edid = ps8640_bridge_get_edid,
> -	.post_disable = ps8640_post_disable,
> -	.pre_enable = ps8640_pre_enable,
> +	.atomic_post_disable = ps8640_atomic_post_disable,
> +	.atomic_pre_enable = ps8640_atomic_pre_enable,

Don't you also need to implement .atomic_duplicate_state(),
.atomic_destroy_state() and .atomic_reset() to use the atomic API ?

>  };
>  
>  static int ps8640_probe(struct i2c_client *client)

-- 
Regards,

Laurent Pinchart
