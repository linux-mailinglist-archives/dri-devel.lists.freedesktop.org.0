Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66578917FA6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 13:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBB510E294;
	Wed, 26 Jun 2024 11:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g+xR1eIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A888C10E294
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 11:29:02 +0000 (UTC)
Received: from [192.168.88.20] (91-158-144-210.elisa-laajakaista.fi
 [91.158.144.210])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F00FE73E;
 Wed, 26 Jun 2024 13:28:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1719401318;
 bh=aEUCS13LAnB9ZMzMaR71+Z7sWml/R0/UdxKZTF7fYS8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g+xR1eIiRtGUF0AL9Uv+84HEc08Q3uM8lEkZfVNFw+7tOfHNSJ3mUI8QfLrxlKpA8
 r3BPQRzV2/Dqhwx0CeMBWoajayRtjbUfcGmpwvXVWlX8LJiuPNgMhF/iqw7+pGdcPm
 nC0KMA4P8xww6TIN8qRkbnKsFVuwoTvyBA5E0Wxc=
Message-ID: <e7dde09d-ceb0-4fb0-a23e-6aaba8f1beb3@ideasonboard.com>
Date: Wed, 26 Jun 2024 14:28:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
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
 <20240622110929.3115714-11-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240622110929.3115714-11-a-bhatia1@ti.com>
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
> Move the bridge pre_enable call before crtc enable, and the bridge
> post_disable call after the crtc disable.
> 
> The sequence of enable after this patch will look like:
> 
> 	bridge[n]_pre_enable
> 	...
> 	bridge[1]_pre_enable
> 
> 	crtc_enable
> 	encoder_enable
> 
> 	bridge[1]_enable
> 	...
> 	bridge[n]__enable
> 
> and vice-versa for the bridge chain disable sequence.
> 
> The definition of bridge pre_enable hook says that,
> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> will not yet be running when this callback is called".
> 
> Since CRTC is also a source feeding the bridge, it should not be enabled
> before the bridges in the pipeline are pre_enabled. Fix that by
> re-ordering the sequence of bridge pre_enable and bridge post_disable.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 165 ++++++++++++++++++----------
>   include/drm/drm_atomic_helper.h     |   7 ++
>   2 files changed, 114 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index fb97b51b38f1..e8ad08634f58 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -74,6 +74,7 @@
>    * also shares the &struct drm_plane_helper_funcs function table with the plane
>    * helpers.
>    */
> +

Extra change.

>   static void
>   drm_atomic_helper_plane_changed(struct drm_atomic_state *state,
>   				struct drm_plane_state *old_plane_state,
> @@ -1122,11 +1123,11 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
>   }
>   
>   static void
> -disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
> +disable_encoder_brige_chain(struct drm_device *dev, struct drm_atomic_state *old_state,
> +			    enum bridge_chain_operation_type op_type)
>   {
>   	struct drm_connector *connector;
>   	struct drm_connector_state *old_conn_state, *new_conn_state;
> -	struct drm_crtc *crtc;
>   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>   	int i;
>   
> @@ -1163,32 +1164,55 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>   		if (WARN_ON(!encoder))
>   			continue;
>   
> -		funcs = encoder->helper_private;
> -
> -		drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
> -			       encoder->base.id, encoder->name);
> -
>   		/*
>   		 * Each encoder has at most one connector (since we always steal
>   		 * it away), so we won't call disable hooks twice.
>   		 */
>   		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		drm_atomic_bridge_chain_disable(bridge, old_state);
>   
> -		/* Right function depends upon target state. */
> -		if (funcs) {
> -			if (funcs->atomic_disable)
> -				funcs->atomic_disable(encoder, old_state);
> -			else if (new_conn_state->crtc && funcs->prepare)
> -				funcs->prepare(encoder);
> -			else if (funcs->disable)
> -				funcs->disable(encoder);
> -			else if (funcs->dpms)
> -				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
> -		}
> +		switch (op_type) {
> +		case DRM_ENCODER_BRIDGE_DISABLE:
> +			funcs = encoder->helper_private;
> +
> +			drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
> +				       encoder->base.id, encoder->name);
> +
> +			drm_atomic_bridge_chain_disable(bridge, old_state);
> +
> +			/* Right function depends upon target state. */
> +			if (funcs) {
> +				if (funcs->atomic_disable)
> +					funcs->atomic_disable(encoder, old_state);
> +				else if (new_conn_state->crtc && funcs->prepare)
> +					funcs->prepare(encoder);
> +				else if (funcs->disable)
> +					funcs->disable(encoder);
> +				else if (funcs->dpms)
> +					funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
> +			}
> +
> +			break;
> +
> +		case DRM_BRIDGE_POST_DISABLE:
> +			drm_atomic_bridge_chain_post_disable(bridge, old_state);
>   
> -		drm_atomic_bridge_chain_post_disable(bridge, old_state);
> +			break;
> +
> +		default:
> +			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_type);
> +			break;
> +		}
>   	}
> +}
> +
> +static void
> +disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> +	int i;
> +
> +	disable_encoder_brige_chain(dev, old_state, DRM_ENCODER_BRIDGE_DISABLE);
>   
>   	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
>   		const struct drm_crtc_helper_funcs *funcs;
> @@ -1234,6 +1258,8 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>   		if (ret == 0)
>   			drm_crtc_vblank_put(crtc);
>   	}
> +
> +	disable_encoder_brige_chain(dev, old_state, DRM_BRIDGE_POST_DISABLE);
>   }
>   
>   /**
> @@ -1445,6 +1471,64 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
>   	}
>   }
>   
> +static void
> +enable_encoder_brige_chain(struct drm_device *dev, struct drm_atomic_state *old_state,
> +			   enum bridge_chain_operation_type op_type)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *new_conn_state;
> +	int i;
> +
> +	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
> +		const struct drm_encoder_helper_funcs *funcs;
> +		struct drm_encoder *encoder;
> +		struct drm_bridge *bridge;
> +
> +		if (!new_conn_state->best_encoder)
> +			continue;
> +
> +		if (!new_conn_state->crtc->state->active ||
> +		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
> +			continue;
> +
> +		encoder = new_conn_state->best_encoder;
> +
> +		/*
> +		 * Each encoder has at most one connector (since we always steal
> +		 * it away), so we won't call enable hooks twice.
> +		 */
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +
> +		switch (op_type) {
> +		case DRM_BRIDGE_PRE_ENABLE:
> +			drm_atomic_bridge_chain_pre_enable(bridge, old_state);
> +			break;
> +
> +		case DRM_ENCODER_BRIDGE_ENABLE:
> +			funcs = encoder->helper_private;
> +
> +			drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> +				       encoder->base.id, encoder->name);
> +
> +			if (funcs) {
> +				if (funcs->atomic_enable)
> +					funcs->atomic_enable(encoder, old_state);
> +				else if (funcs->enable)
> +					funcs->enable(encoder);
> +				else if (funcs->commit)
> +					funcs->commit(encoder);
> +			}
> +
> +			drm_atomic_bridge_chain_enable(bridge, old_state);
> +			break;
> +
> +		default:
> +			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_type);
> +			break;
> +		}
> +	}
> +}
> +
>   /**
>    * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
>    * @dev: DRM device
> @@ -1465,10 +1549,10 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>   	struct drm_crtc *crtc;
>   	struct drm_crtc_state *old_crtc_state;
>   	struct drm_crtc_state *new_crtc_state;
> -	struct drm_connector *connector;
> -	struct drm_connector_state *new_conn_state;
>   	int i;
>   
> +	enable_encoder_brige_chain(dev, old_state, DRM_BRIDGE_PRE_ENABLE);
> +
>   	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
>   		const struct drm_crtc_helper_funcs *funcs;
>   
> @@ -1491,42 +1575,7 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>   		}
>   	}
>   
> -	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
> -		const struct drm_encoder_helper_funcs *funcs;
> -		struct drm_encoder *encoder;
> -		struct drm_bridge *bridge;
> -
> -		if (!new_conn_state->best_encoder)
> -			continue;
> -
> -		if (!new_conn_state->crtc->state->active ||
> -		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
> -			continue;
> -
> -		encoder = new_conn_state->best_encoder;
> -		funcs = encoder->helper_private;
> -
> -		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> -			       encoder->base.id, encoder->name);
> -
> -		/*
> -		 * Each encoder has at most one connector (since we always steal
> -		 * it away), so we won't call enable hooks twice.
> -		 */
> -		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
> -
> -		if (funcs) {
> -			if (funcs->atomic_enable)
> -				funcs->atomic_enable(encoder, old_state);
> -			else if (funcs->enable)
> -				funcs->enable(encoder);
> -			else if (funcs->commit)
> -				funcs->commit(encoder);
> -		}
> -
> -		drm_atomic_bridge_chain_enable(bridge, old_state);
> -	}
> +	enable_encoder_brige_chain(dev, old_state, DRM_ENCODER_BRIDGE_ENABLE);
>   
>   	drm_atomic_helper_commit_writebacks(dev, old_state);
>   }
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 9aa0a05aa072..b45a175a9f8a 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -43,6 +43,13 @@
>    */
>   #define DRM_PLANE_NO_SCALING (1<<16)
>   
> +enum bridge_chain_operation_type {
> +	DRM_BRIDGE_PRE_ENABLE,
> +	DRM_BRIDGE_POST_DISABLE,
> +	DRM_ENCODER_BRIDGE_ENABLE,
> +	DRM_ENCODER_BRIDGE_DISABLE,
> +};

Why are the last two "DRM_ENCODER"?

I don't like the enum... Having "enum bridge_chain_operation_type" as a 
parameter to a function looks like one can pass any of the enum's 
values, which is not the case.

How about an enum with just two values:

DRM_BRIDGE_PRE_ENABLE_POST_DISABLE
DRM_BRIDGE_ENABLE_DISABLE

  Tomi

