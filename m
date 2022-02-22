Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893E4BF21D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 07:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A1410E601;
	Tue, 22 Feb 2022 06:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DE910E601
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 06:34:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DD8747F;
 Tue, 22 Feb 2022 07:34:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645511649;
 bh=puGql1ZOzZpJzJq5RPGMBAXmmjJ+a0E+JUOF1ctasSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j1D4pkePG1RqB662GvkD7LLblYKksigPTJohoK8CHjIFRlhYmwryl6JH1YuqLklbQ
 p+HdDlSurT9utClMI73RsyWMablar2yBQy1tlpML4dhQiGtm86UYGqEIKeRurcbWSN
 J+OUblaBWPCzcKT41ZS5308wMvxUPZsXlU8Txg7Y=
Date: Tue, 22 Feb 2022 08:33:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 1/2] drm: Introduce DRM_BRIDGE_OP_UPSTREAM_FIRST to alter
 bridge init order
Message-ID: <YhSD1zHxaOeCitgz@pendragon.ideasonboard.com>
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
 <4c6511bd7f4ce52aa3323141b6f0a68ae2773787.1645029005.git.dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c6511bd7f4ce52aa3323141b6f0a68ae2773787.1645029005.git.dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 andrzej.hajda@gmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Thank you for the patch.

On Wed, Feb 16, 2022 at 04:59:43PM +0000, Dave Stevenson wrote:
> DSI sink devices typically want the DSI host powered up and configured
> before they are powered up. pre_enable is the place this would normally
> happen, but they are called in reverse order from panel/connector towards
> the encoder, which is the "wrong" order.
> 
> Add a new flag DRM_BRIDGE_OP_UPSTREAM_FIRST that any bridge can set
> to swap the order of pre_enable (and post_disable) so that any upstream
> bridges are called first to create the desired state.
> 
> eg:
> - Panel
> - Bridge 1
> - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
> - Bridge 3
> - Encoder
> Would result in pre_enable's being called as Panel, Bridge 1, Bridge 3,
> Bridge 2.

If there was a Bridge 4 between Bridge 3 and Encoder, would it be 

Panel, Bridge 1, Bridge 3, Bridge 4, Bridge 2

? I'd capture that here, to be explicit.

> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 197 +++++++++++++++++++++++++++++++++++++------
>  include/drm/drm_bridge.h     |   8 ++
>  2 files changed, 180 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c96847fc0ebc..7c24e8340efa 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -522,21 +522,58 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
>   * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
>   * encoder chain, starting from the first bridge to the last. These are called
>   * after completing the encoder's prepare op.

Missing blank line, as well as in three locations below.

> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the post_disable for
> + * that bridge will be called before the previous one to reverse the pre_enable
> + * calling direction.
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
>  void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
>  {
>  	struct drm_encoder *encoder;
> +	struct drm_bridge *next, *limit;
>  
>  	if (!bridge)
>  		return;
>  
>  	encoder = bridge->encoder;
>  	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		limit = NULL;
> +
> +		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
> +			next = list_next_entry(bridge, chain_node);
> +
> +			if (next->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> +				limit = next;
> +
> +				list_for_each_entry_from(next, &encoder->bridge_chain,
> +							 chain_node) {
> +					if (!(next->ops &
> +						DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> +						next = list_prev_entry(next, chain_node);
> +						limit = next;
> +						break;
> +					}
> +				}
> +
> +				list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
> +								 chain_node) {
> +					if (next == bridge)
> +						break;
> +
> +					if (next->funcs->post_disable)
> +						next->funcs->post_disable(next);
> +				}
> +			}
> +		}
> +
>  		if (bridge->funcs->post_disable)
>  			bridge->funcs->post_disable(bridge);
> +
> +		if (limit)
> +			bridge = limit;
>  	}
> +
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_post_disable);
>  
> @@ -577,22 +614,53 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>   * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
>   * chain, starting from the last bridge to the first. These are called
>   * before calling the encoder's commit op.
> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
> + * the previous bridge will be called before pre_enable of this bridge.
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
>  void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>  {
>  	struct drm_encoder *encoder;
> -	struct drm_bridge *iter;
> +	struct drm_bridge *iter, *next, *limit;
>  
>  	if (!bridge)
>  		return;
>  
>  	encoder = bridge->encoder;
> +
>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> +		if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> +			next = iter;
> +			limit = bridge;
> +			list_for_each_entry_from_reverse(next,
> +							 &encoder->bridge_chain,
> +							 chain_node) {
> +				if (next == bridge)
> +					break;
> +
> +				if (!(next->ops &
> +					DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> +					limit = list_prev_entry(next, chain_node);
> +					break;
> +				}
> +			}
> +
> +			list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
> +				if (next == iter)
> +					break;
> +
> +				if (next->funcs->pre_enable)
> +					next->funcs->pre_enable(next);
> +			}
> +		}
> +
>  		if (iter->funcs->pre_enable)
>  			iter->funcs->pre_enable(iter);
>  
> +		if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
> +			iter = limit;
> +
>  		if (iter == bridge)
>  			break;
>  	}
> @@ -667,6 +735,25 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>  
> +static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
> +						struct drm_atomic_state *old_state)
> +{
> +	if (bridge->funcs->atomic_post_disable) {
> +		struct drm_bridge_state *old_bridge_state;
> +
> +		old_bridge_state =
> +			drm_atomic_get_old_bridge_state(old_state,
> +							bridge);
> +		if (WARN_ON(!old_bridge_state))
> +			return;
> +
> +		bridge->funcs->atomic_post_disable(bridge,
> +						   old_bridge_state);
> +	} else if (bridge->funcs->post_disable) {
> +		bridge->funcs->post_disable(bridge);
> +	}
> +}
> +
>  /**
>   * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
>   *					  in the encoder chain
> @@ -677,6 +764,9 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>   * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
>   * starting from the first bridge to the last. These are called after completing
>   * &drm_encoder_helper_funcs.atomic_disable
> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the post_disable for
> + * that bridge will be called before the previous one to reverse the pre_enable
> + * calling direction.
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
> @@ -684,30 +774,69 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>  					  struct drm_atomic_state *old_state)
>  {
>  	struct drm_encoder *encoder;
> +	struct drm_bridge *next, *limit;
>  
>  	if (!bridge)
>  		return;
>  
>  	encoder = bridge->encoder;
> +
>  	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> -		if (bridge->funcs->atomic_post_disable) {
> -			struct drm_bridge_state *old_bridge_state;
> +		limit = NULL;
> +
> +		if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
> +			next = list_next_entry(bridge, chain_node);
> +
> +			if (next->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> +				limit = next;
> +
> +				list_for_each_entry_from(next, &encoder->bridge_chain,
> +							 chain_node) {
> +					if (!(next->ops &
> +						DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> +						next = list_prev_entry(next, chain_node);
> +						limit = next;
> +						break;
> +					}
> +				}
> +
> +				list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
> +								 chain_node) {
> +					if (next == bridge)
> +						break;
> +
> +					drm_atomic_bridge_call_post_disable(next,
> +									    old_state);
> +				}
> +			}
> +		}
>  
> -			old_bridge_state =
> -				drm_atomic_get_old_bridge_state(old_state,
> -								bridge);
> -			if (WARN_ON(!old_bridge_state))
> -				return;
> +		drm_atomic_bridge_call_post_disable(bridge, old_state);
>  
> -			bridge->funcs->atomic_post_disable(bridge,
> -							   old_bridge_state);
> -		} else if (bridge->funcs->post_disable) {
> -			bridge->funcs->post_disable(bridge);
> -		}
> +		if (limit)
> +			bridge = limit;
>  	}
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>  
> +static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
> +					      struct drm_atomic_state *old_state)
> +{
> +	if (bridge->funcs->atomic_pre_enable) {
> +		struct drm_bridge_state *old_bridge_state;
> +
> +		old_bridge_state =
> +			drm_atomic_get_old_bridge_state(old_state,
> +							bridge);
> +		if (WARN_ON(!old_bridge_state))
> +			return;
> +
> +		bridge->funcs->atomic_pre_enable(bridge, old_bridge_state);
> +	} else if (bridge->funcs->pre_enable) {
> +		bridge->funcs->pre_enable(bridge);
> +	}
> +}
> +
>  /**
>   * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
>   *					the encoder chain
> @@ -718,6 +847,8 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>   * &drm_bridge_funcs.pre_enable) op for all the bridges in the encoder chain,
>   * starting from the last bridge to the first. These are called before calling
>   * &drm_encoder_helper_funcs.atomic_enable
> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
> + * the previous bridge will be called before pre_enable of this bridge.
>   *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
> @@ -725,26 +856,42 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
>  					struct drm_atomic_state *old_state)
>  {
>  	struct drm_encoder *encoder;
> -	struct drm_bridge *iter;
> +	struct drm_bridge *iter, *next, *limit;
>  
>  	if (!bridge)
>  		return;
>  
>  	encoder = bridge->encoder;
> +
>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> -		if (iter->funcs->atomic_pre_enable) {
> -			struct drm_bridge_state *old_bridge_state;
> +		if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> +			next = iter;
> +			limit = bridge;
> +			list_for_each_entry_from_reverse(next,
> +							 &encoder->bridge_chain,
> +							 chain_node) {
> +				if (next == bridge)
> +					break;
> +
> +				if (!(next->ops &
> +					DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> +					limit = list_prev_entry(next, chain_node);
> +					break;
> +				}
> +			}
> +
> +			list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
> +				if (next == iter)
> +					break;
> +
> +				drm_atomic_bridge_call_pre_enable(next, old_state);
> +			}
> +		}

This is hard to understand, I have trouble figuring out if it does the
right thing when multiple bridges set the DRM_BRIDGE_OP_UPSTREAM_FIRST
flag (or actually even when a single bridge does so). Comments would
help, but I wonder if it wouldn't be simpler to switch to a recursive
implementation.

It also seems that merging the legacy and atomic versions of the code
would be a good idea. They could both call into a shared implementation,
with the legacy version passing a NULL state, and the atomic op being
considered only if the state is not NULL.

>  
> -			old_bridge_state =
> -				drm_atomic_get_old_bridge_state(old_state,
> -								iter);
> -			if (WARN_ON(!old_bridge_state))
> -				return;
> +		drm_atomic_bridge_call_pre_enable(iter, old_state);
>  
> -			iter->funcs->atomic_pre_enable(iter, old_bridge_state);
> -		} else if (iter->funcs->pre_enable) {
> -			iter->funcs->pre_enable(iter);
> -		}
> +		if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
> +			iter = limit;
>  
>  		if (iter == bridge)
>  			break;
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index f27b4060faa2..523ec9d8f3f8 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -725,6 +725,14 @@ enum drm_bridge_ops {
>  	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
>  	 */
>  	DRM_BRIDGE_OP_MODES = BIT(3),
> +	/**
> +	 * @DRM_BRIDGE_OP_UPSTREAM_FIRST: The bridge can requires

s/can //

> +	 * that the upstream node pre_enable is called before its pre_enable,

s/node/bridge/ ?

> +	 * and conversely for post_disables. This is most frequently a

s/post_disables/post_disable/

Bonus points if you use the correct markup to link to those operations.

> +	 * requirement for DSI devices which need the host to be initialised
> +	 * before them.
> +	 */
> +	DRM_BRIDGE_OP_UPSTREAM_FIRST = BIT(4),
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
