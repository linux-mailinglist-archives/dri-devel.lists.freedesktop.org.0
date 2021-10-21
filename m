Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA93436BF3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 22:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCBA6E49A;
	Thu, 21 Oct 2021 20:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8641F6E49A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 20:21:11 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 72df22b6-32ac-11ec-ac3c-0050568cd888;
 Thu, 21 Oct 2021 20:21:18 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id AA1FD194B52;
 Thu, 21 Oct 2021 22:21:03 +0200 (CEST)
Date: Thu, 21 Oct 2021 22:21:02 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Cc: dri-devel@lists.freedesktop.org, Philip Chen <philipchen@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Fix the bridge chain order for pre_enable /
 post_disable
Message-ID: <YXHLrnAliqxmrrho@ravnborg.org>
References: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
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

Hi Douglas,

On Thu, Oct 21, 2021 at 12:29:01PM -0700, Douglas Anderson wrote:
> Right now, the chaining order of
> pre_enable/enable/disable/post_disable looks like this:
> 
> pre_enable:   start from connector and move to encoder
> enable:       start from encoder and move to connector
> disable:      start from connector and move to encoder
> post_disable: start from encoder and move to connector
> 
> In the above, it can be seen that at least pre_enable() and
> post_disable() are opposites of each other and enable() and disable()
> are opposites. However, it seems broken that pre_enable() and enable()
> would not move in the same direction. In other parts of Linux you can
> see that various stages move in the same order. For instance, during
> system suspend the "early" calls run in the same order as the normal
> calls run in the same order as the "late" calls run in the same order
> as the "noirq" calls.
> 
> Let fix the above so that it makes more sense. Now we'll have:
> 
> pre_enable:   start from encoder and move to connector
> enable:       start from encoder and move to connector
> disable:      start from connector and move to encoder
> post_disable: start from connector and move to encoder
> 
> This order is chosen because if there are parent-child relationships
> anywhere I would expect that the encoder would be a parent and the
> connector a child--not the other way around.

This makes good sense as you describe it. I hope others can add more
useful feedback.
Added Andrzej Hajda <andrzej.hajda@intel.com> to the mail, as he have
expressed concerns with the chain of bridges before.

> 
> This can be important when using the DP AUX bus to instantiate a
> panel. The DP AUX bus is likely part of a bridge driver and is a
> parent of the panel. We'd like the bridge to be pre_enabled before the
> panel and the panel to be post_disabled before the
> bridge. Specifically, this allows pm_runtime_put_sync_suspend() in a
> bridge driver's post_suspend to work properly even a panel is under
> it.
> 
> NOTE: it's entirely possible that this change could break someone who
> was relying on the old order. Hopefully this isn't the case, but if
> this does break someone it seems like it's better to do it sonner
> rather than later so we can fix everyone to handle the order that
> makes the most sense.
> 
> A FURTHER NOTE: Looking closer at commit 4e5763f03e10 ("drm/bridge:
> ti-sn65dsi86: Wrap panel with panel-bridge") you can see that patch
> inadvertently changed the order of things. The order used to be
> correct (panel prepare was at the tail of the bridge enable) but it
> became backwards. We'll restore the original order with this patch.
> 
> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

To make the patch complete the descriptions in drm_bridge_funcs
need to be updated to reflect the new reality.

> ---
> 
>  drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c96847fc0ebc..98808af59afd 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -583,18 +583,14 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>  void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)

If you, or someone else, could r-b or ack the pending patches to remove
this function, this part of the patch would no longer be needed.

>  {
>  	struct drm_encoder *encoder;
> -	struct drm_bridge *iter;
>  
>  	if (!bridge)
>  		return;
>  
>  	encoder = bridge->encoder;
> -	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> -		if (iter->funcs->pre_enable)
> -			iter->funcs->pre_enable(iter);
> -
> -		if (iter == bridge)
> -			break;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		if (bridge->funcs->pre_enable)
> +			bridge->funcs->pre_enable(bridge);
>  	}
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
> @@ -684,26 +680,30 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>  					  struct drm_atomic_state *old_state)
>  {
>  	struct drm_encoder *encoder;
> +	struct drm_bridge *iter;
s/iter/bridge/ would make the patch simpler
And then the bridge argument could be last_bridge or something.
This would IMO increase readability of the code and make the patch smaller.
>  
>  	if (!bridge)
>  		return;
>  
>  	encoder = bridge->encoder;
> -	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> -		if (bridge->funcs->atomic_post_disable) {
> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> +		if (iter->funcs->atomic_post_disable) {
>  			struct drm_bridge_state *old_bridge_state;
>  
>  			old_bridge_state =
>  				drm_atomic_get_old_bridge_state(old_state,
> -								bridge);
> +								iter);
>  			if (WARN_ON(!old_bridge_state))
>  				return;
>  
> -			bridge->funcs->atomic_post_disable(bridge,
> -							   old_bridge_state);
> -		} else if (bridge->funcs->post_disable) {
> -			bridge->funcs->post_disable(bridge);
> +			iter->funcs->atomic_post_disable(iter,
> +							 old_bridge_state);
> +		} else if (iter->funcs->post_disable) {
> +			iter->funcs->post_disable(iter);
>  		}
> +
> +		if (iter == bridge)
> +			break;
I cannot see why this is needed, we are at the end of the list here
anyway.


>  	}
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);

	Sam
