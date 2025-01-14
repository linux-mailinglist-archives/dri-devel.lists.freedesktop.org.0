Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61098A1070E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 13:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106E210E29C;
	Tue, 14 Jan 2025 12:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q2/R/dys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E98B10E29D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 12:47:39 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F0BC842;
 Tue, 14 Jan 2025 13:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736858801;
 bh=nVSv+rX5UueUCjtenjscVHStT3IISW9iDsjH0cez6CI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q2/R/dysCroOeHu4lTYBWkF6jBuNA8M8z0aAO81gBZBhhQIHVszutewGDYROOrPMn
 +paA82j4z1Ge+Farj3NpCjGIcoEGdxnavPVKVAI7nsv5YMWLyTyfQzxOLlMSXmtWaM
 9WLGctgRGZAc69xc2Q2U0XXP56w9G3SYrgg55hp0=
Message-ID: <5e5cd09b-a292-4af7-a124-4eced94e1bdf@ideasonboard.com>
Date: Tue, 14 Jan 2025 14:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/12] drm/bridge: cdns-dsi: Move DSI mode check to
 _atomic_check()
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-11-aradhya.bhatia@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250114055626.18816-11-aradhya.bhatia@linux.dev>
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

Hi,

On 14/01/2025 07:56, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> At present, the DSI mode configuration check happens during the
> _atomic_enable() phase, which is not really the best place for this.
> Moreover, if the mode is not valid, the driver gives a warning and
> continues the hardware configuration.
> 
> Move the DSI mode configuration check to _atomic_check() instead, which
> can properly report back any invalid mode, before the _enable phase even
> begins.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>   .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 87 +++++++++++++++++--
>   1 file changed, 82 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> index b8db984ea9fa..d60254e1270c 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> @@ -425,6 +425,17 @@
>   #define DSI_NULL_FRAME_OVERHEAD		6
>   #define DSI_EOT_PKT_SIZE		4
>   
> +struct cdns_dsi_bridge_state {
> +	struct drm_bridge_state base;
> +	struct cdns_dsi_cfg dsi_cfg;
> +};
> +
> +static inline struct cdns_dsi_bridge_state *
> +to_cdns_dsi_bridge_state(struct drm_bridge_state *bridge_state)
> +{
> +	return container_of(bridge_state, struct cdns_dsi_bridge_state, base);
> +}
> +
>   static inline struct cdns_dsi *input_to_dsi(struct cdns_dsi_input *input)
>   {
>   	return container_of(input, struct cdns_dsi, input);
> @@ -768,6 +779,9 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>   	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
>   	struct cdns_dsi *dsi = input_to_dsi(input);
>   	struct cdns_dsi_output *output = &dsi->output;
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
> +	struct cdns_dsi_bridge_state *dsi_state;
> +	struct drm_bridge_state *new_bridge_state;
>   	struct drm_display_mode *mode;
>   	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
>   	unsigned long tx_byte_period;
> @@ -778,14 +792,19 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>   	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
>   		return;
>   
> +	new_bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +	if (WARN_ON(!new_bridge_state))
> +		return;
> +
> +	dsi_state = to_cdns_dsi_bridge_state(new_bridge_state);
> +	dsi_cfg = dsi_state->dsi_cfg;
> +
>   	if (dsi->platform_ops && dsi->platform_ops->enable)
>   		dsi->platform_ops->enable(dsi);
>   
>   	mode = &bridge->encoder->crtc->state->adjusted_mode;
>   	nlanes = output->dev->lanes;
>   
> -	WARN_ON_ONCE(cdns_dsi_check_conf(dsi, mode, &dsi_cfg, false));
> -
>   	cdns_dsi_init_link(dsi);
>   	cdns_dsi_hs_init(dsi);
>   
> @@ -956,6 +975,63 @@ static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
>   	return input_fmts;
>   }
>   
> +static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
> +{
> +	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
> +	struct cdns_dsi *dsi = input_to_dsi(input);
> +	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
> +	struct drm_display_mode *mode = &crtc_state->mode;

const

> +	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
> +
> +	return cdns_dsi_check_conf(dsi, mode, dsi_cfg, false);
> +}
> +
> +static struct drm_bridge_state *
> +cdns_dsi_bridge_atomic_duplicate_state(struct drm_bridge *bridge)
> +{
> +	struct cdns_dsi_bridge_state *dsi_state;
> +
> +	if (WARN_ON(!bridge->base.state))
> +		return NULL;
> +
> +	dsi_state = kzalloc(sizeof(*dsi_state), GFP_KERNEL);
> +	if (!dsi_state)
> +		return NULL;
> +
> +	__drm_atomic_helper_bridge_duplicate_state(bridge, &dsi_state->base);

Hmm, if I'm not mistaken, you should copy the private state here 
(cdns_dsi_cfg).

> +	return &dsi_state->base;
> +}
> +
> +static void
> +cdns_dsi_bridge_atomic_destroy_state(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *state)
> +{
> +	struct cdns_dsi_bridge_state *dsi_state;
> +
> +	dsi_state = to_cdns_dsi_bridge_state(state);
> +
> +	kfree(dsi_state);
> +}
> +
> +static struct drm_bridge_state *
> +cdns_dsi_bridge_atomic_reset(struct drm_bridge *bridge)
> +{
> +	struct cdns_dsi_bridge_state *dsi_state;
> +
> +	dsi_state = kzalloc(sizeof(*dsi_state), GFP_KERNEL);
> +	if (!dsi_state)
> +		return NULL;
> +
> +	memset(dsi_state, 0, sizeof(*dsi_state));
> +	dsi_state->base.bridge = bridge;
> +
> +	return &dsi_state->base;
> +}
> +
>   static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
>   	.attach = cdns_dsi_bridge_attach,
>   	.mode_valid = cdns_dsi_bridge_mode_valid,
> @@ -963,9 +1039,10 @@ static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
>   	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
>   	.atomic_enable = cdns_dsi_bridge_atomic_enable,
>   	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
> -	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_check = cdns_dsi_bridge_atomic_check,
> +	.atomic_duplicate_state = cdns_dsi_bridge_atomic_duplicate_state,
> +	.atomic_destroy_state = cdns_dsi_bridge_atomic_destroy_state,
> +	.atomic_reset = cdns_dsi_bridge_atomic_reset,
>   	.atomic_get_input_bus_fmts = cdns_dsi_bridge_get_input_bus_fmts,
>   };
>   

Other than the two small comments:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

