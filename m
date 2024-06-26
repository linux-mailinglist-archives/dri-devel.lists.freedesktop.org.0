Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA3917FDF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 13:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC7B10E857;
	Wed, 26 Jun 2024 11:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mrsFo2ZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E7D10E857
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:39:16 +0000 (UTC)
Received: from [192.168.88.20] (91-158-144-210.elisa-laajakaista.fi
 [91.158.144.210])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94D4173E;
 Wed, 26 Jun 2024 13:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1719401931;
 bh=1tZpKcd6cjYRd5VUB+0EsT1xdOH4XNI9S6LakqoNsVk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mrsFo2ZR2/M+swqkO1BxBhgDYyPnSnsMjKc0+CJk3ywpOvrXdlnwijBKRYLpnnxoQ
 5pSIPyJQt9spxHM2B2Pe2SSY8vLGPJMfFDWwz20t9SjpQ7GcmZ+vMClPbsmFOXz3Y0
 Z2XHtEe6QtRwjFIt8IsI4nNDoFmhKyN2s3tQPW4U=
Message-ID: <1f17da9c-0368-4a93-8b37-30d56841048d@ideasonboard.com>
Date: Wed, 26 Jun 2024 14:39:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/11] drm/bridge: cdns-dsi: Use
 pre_enable/post_disable to enable/disable
To: Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Dominik Haller <d.haller@phytec.de>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <treding@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Jai Luthra <j-luthra@ti.com>
References: <20240622110929.3115714-1-a-bhatia1@ti.com>
 <20240622110929.3115714-12-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240622110929.3115714-12-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 22/06/2024 14:09, Aradhya Bhatia wrote:
> The cdns-dsi controller requires that it be turned on completely before
> the input DPI's source has begun streaming[0]. Not having that, allows
> for a small window before cdns-dsi enable and after cdns-dsi disable
> where the previous entity (in this case tidss's videoport) to continue
> streaming DPI video signals. This small window where cdns-dsi is
> disabled but is still receiving signals causes the input FIFO of
> cdns-dsi to get corrupted. This causes the colors to shift on the output
> display. The colors can either shift by one color component (R->G, G->B,
> B->R), or by two color components (R->B, G->R, B->G).
> 
> Since tidss's videoport starts streaming via crtc enable hooks, we need
> cdns-dsi to be up and running before that. Now that the bridges are
> pre_enabled before crtc is enabled, and post_disabled after crtc is
> disabled, use the pre_enable and post_disable hooks to get cdns-dsi
> ready and running before the tidss videoport to get pass the color shift
> issues.
> 
> [0]: See section 12.6.5.7.3 "Start-up Procedure" in J721E SoC TRM
>       TRM Link: http://www.ti.com/lit/pdf/spruil1
> 

I think it makes sense to explain a bit about this in a comment in the 
driver code. Otherwise doing all of this in pre_enable and post_disable 
looks a bit odd.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 32 +++----------------
>   1 file changed, 4 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index c9697818308e..c352ea7db4ed 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -655,8 +655,8 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>   	return MODE_OK;
>   }
>   
> -static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> -					   struct drm_bridge_state *old_bridge_state)
> +static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +						struct drm_bridge_state *old_bridge_state)
>   {
>   	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>   	struct cdns_dsi *dsi = input_to_dsi(input);
> @@ -680,15 +680,6 @@ static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
>   	pm_runtime_put(dsi->base.dev);
>   }
>   
> -static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> -						struct drm_bridge_state *old_bridge_state)
> -{
> -	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> -	struct cdns_dsi *dsi = input_to_dsi(input);
> -
> -	pm_runtime_put(dsi->base.dev);
> -}
> -
>   static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
>   {
>   	struct cdns_dsi_output *output = &dsi->output;
> @@ -757,8 +748,8 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
>   	dsi->link_initialized = true;
>   }
>   
> -static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> -					  struct drm_bridge_state *old_bridge_state)
> +static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					      struct drm_bridge_state *old_bridge_state)
>   {
>   	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>   	struct cdns_dsi *dsi = input_to_dsi(input);
> @@ -909,19 +900,6 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>   	writel(tmp, dsi->regs + MCTL_MAIN_EN);
>   }
>   
> -static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> -					      struct drm_bridge_state *old_bridge_state)
> -{
> -	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> -	struct cdns_dsi *dsi = input_to_dsi(input);
> -
> -	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
> -		return;
> -
> -	cdns_dsi_init_link(dsi);
> -	cdns_dsi_hs_init(dsi);
> -}
> -
>   static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
>   					       struct drm_bridge_state *bridge_state,
>   					       struct drm_crtc_state *crtc_state,
> @@ -952,9 +930,7 @@ static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
>   static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
>   	.attach = cdns_dsi_bridge_attach,
>   	.mode_valid = cdns_dsi_bridge_mode_valid,
> -	.atomic_disable = cdns_dsi_bridge_atomic_disable,
>   	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
> -	.atomic_enable = cdns_dsi_bridge_atomic_enable,
>   	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
>   	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,

