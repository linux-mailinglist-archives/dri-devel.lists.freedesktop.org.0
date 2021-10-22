Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F14370FF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 06:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DE96E58B;
	Fri, 22 Oct 2021 04:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950BD6E58B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 04:44:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 286C151D;
 Fri, 22 Oct 2021 06:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634877844;
 bh=eSwlb6YuqsR3uV5jKVNohlQDel9PmJlvK6dwAOAjDsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KCypfD8VKzEQ/+Vk1MA66r5q6tixJm3CmYwu9qPcUX/i+r81BRaHbjC5WCmEwHKYh
 0nNPUAPt+OC7sJMfebGkRQsQ3oyGBOCNI0ssp5ZPgq0PiFU6q0UjJFaPHCs9TwiB+3
 VeGUGrrvKImkXOt9fiYUXcPWV6SAXB/c9X38IN/s=
Date: Fri, 22 Oct 2021 07:43:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Philip Chen <philipchen@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Fix the bridge chain order for pre_enable /
 post_disable
Message-ID: <YXJBgNvkZb14AJDQ@pendragon.ideasonboard.com>
References: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Hi Doug,

Thank you for the patch.

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

I'm less hopeful than you are on this, changing the order of operations
is very risky. I'm also concerned about hardware damage, the pre-enable
operation is often used to power up devices, and powering up a source
before a sink is dangerous as many devices don't like having I/O voltage
applied to their pins before they get powered up. If you really want to
land this, the patch needs very very broad testing, as well as a plan to
address the power up issue.

> A FURTHER NOTE: Looking closer at commit 4e5763f03e10 ("drm/bridge:
> ti-sn65dsi86: Wrap panel with panel-bridge") you can see that patch
> inadvertently changed the order of things. The order used to be
> correct (panel prepare was at the tail of the bridge enable) but it
> became backwards. We'll restore the original order with this patch.
> 
> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
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
>  	}
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);

-- 
Regards,

Laurent Pinchart
