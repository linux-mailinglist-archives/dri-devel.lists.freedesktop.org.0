Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB1B4394A9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 13:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A2E89E33;
	Mon, 25 Oct 2021 11:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9E489E11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 11:21:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34940E0A;
 Mon, 25 Oct 2021 13:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635160893;
 bh=KJ5E+UmHrKXcUGMUAvm4P646pzk+qrj0hQ0ZpbrdCAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gSRiOrCuipvsOg0iazp3C0ri1JCfVyhxZDBgSavug/r4C7maSpZkT/O9YkoitRGk3
 RX/E+vAHYpfTnNhIbEelfli32VcGN5FSb42l46gDpiCkIV2fRYS2lr1oUTd2KBH9r3
 DeHfWDqwgRb4g/K7YD1RjPjpCnav7TXG+e+MjOF8=
Date: Mon, 25 Oct 2021 14:21:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Philip Chen <philipchen@chromium.org>,
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
Message-ID: <YXaTJ+bwm7vSTGpv@pendragon.ideasonboard.com>
References: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
 <YXHLrnAliqxmrrho@ravnborg.org>
 <cdcd19de-19e6-83ed-606f-defebdcc0997@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdcd19de-19e6-83ed-606f-defebdcc0997@intel.com>
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

Hello,

On Mon, Oct 25, 2021 at 01:00:10PM +0200, Andrzej Hajda wrote:
> On 21.10.2021 22:21, Sam Ravnborg wrote:
> > On Thu, Oct 21, 2021 at 12:29:01PM -0700, Douglas Anderson wrote:
> >> Right now, the chaining order of
> >> pre_enable/enable/disable/post_disable looks like this:
> >>
> >> pre_enable:   start from connector and move to encoder
> >> enable:       start from encoder and move to connector
> >> disable:      start from connector and move to encoder
> >> post_disable: start from encoder and move to connector
> >>
> >> In the above, it can be seen that at least pre_enable() and
> >> post_disable() are opposites of each other and enable() and disable()
> >> are opposites. However, it seems broken that pre_enable() and enable()
> >> would not move in the same direction. In other parts of Linux you can
> >> see that various stages move in the same order. For instance, during
> >> system suspend the "early" calls run in the same order as the normal
> >> calls run in the same order as the "late" calls run in the same order
> >> as the "noirq" calls.
> >>
> >> Let fix the above so that it makes more sense. Now we'll have:
> >>
> >> pre_enable:   start from encoder and move to connector
> >> enable:       start from encoder and move to connector
> >> disable:      start from connector and move to encoder
> >> post_disable: start from connector and move to encoder
> >>
> >> This order is chosen because if there are parent-child relationships
> >> anywhere I would expect that the encoder would be a parent and the
> >> connector a child--not the other way around.
> >
> > This makes good sense as you describe it. I hope others can add more
> > useful feedback.
> > Added Andrzej Hajda <andrzej.hajda@intel.com> to the mail, as he have
> > expressed concerns with the chain of bridges before.
> 
> Thanks Sam, but I am not sure about useful feedback - when I see bridge 
> chain issues it automatically triggers "whining mode" in my head :)
> 
> >> This can be important when using the DP AUX bus to instantiate a
> >> panel. The DP AUX bus is likely part of a bridge driver and is a
> >> parent of the panel. We'd like the bridge to be pre_enabled before the
> >> panel and the panel to be post_disabled before the
> >> bridge. Specifically, this allows pm_runtime_put_sync_suspend() in a
> >> bridge driver's post_suspend to work properly even a panel is under
> >> it.
> >>
> >> NOTE: it's entirely possible that this change could break someone who
> >> was relying on the old order. Hopefully this isn't the case, but if
> >> this does break someone it seems like it's better to do it sonner
> >> rather than later so we can fix everyone to handle the order that
> >> makes the most sense.
> 
> It will break for sure. So the question is: if it is worth changing?
> 
> New order seems good for eDP, DSI sinks [1], probably other as well.
> 
> Old order is better for example for THC63LVD1024 [2 p. 20], I guess for 
> many other sinks as well.
> 
> I am not even sure if it is protocol specific (LVDS, RGB, HDMI,...), or 
> it depends on specific hw pairs (source->sink).
> 
> This is why I complain about the bridge chain - assumption that one 
> fixed call order will work for all setups seems to me ridiculous.
> 
> Going back to the question - changing the order from fixed one to 
> another fixed one will not solve general issue.
> 
> What can we do then?
> 
> 1. Configurable call order? Probably doable: every chain element should 
> expose info if it's call should be before or after source, then some 
> core helper will create queue of callbacks. Seems quite complicated, 
> hides the logic from implementer and not fully flexible (for example, 
> there are protocols which require to perform sth on source, then on 
> sink, then again on the source).
> 
> 2. Stop using bridge chain and call sink ops directly from the source 
> (this is what Exynos and VC4 do): is flexible and straightforward, gives 
> full control to the source.

And breaks interoperability, because different sources end up calling
operations in different orders. We end up having different sinks that
expect calls in different ways, and divide the world in sink/source
groups that don't interoperate :-(

> 3. Use different abstractions to enforce proper initialization order 
> (like extending mipi_dsi_host_ops): requires existence of transport bus 
> abstraction (only DSI at the moment(?)).

A real bus seems overkill, but we could have drm_bridge operations
specific to particular hardware interfaces.

> ... other ideas?

I don't like it because of the amount of work it would require to switch
to such a model, but I'm really starting to think that a variation of
the second option would be best, where the sink controls the source
instead of having the source controlling the sink. It's the sink that
knows about its enabling/disabling sequence, and about how the source
needs to be controlled to match it.

> Another idea, connected to the subject - some protocols require some 
> negotiations between source and sink bus format, or more steps than 
> pre_enable, enable ops to establish link. I wonder if encapsulating 
> drm_bridge in some protocol specific struct wouldn't be a solution, it 
> can be helpful as well in case of the subject.
> 
> For example:
> 
> struct drm_bridge_edp {
> 
>      const struct drm_bridge_edp_funcs *funcs;
> 
>      struct drm_bridge base;
> 
>      ...
> 
> };
> 
> Then source could promote bridge pointer to bridge_edp pointer (if 
> applicable) and perform edp specific stuff. To make it working well 
> pre-enable order should be as proposed in this patchsets (encoder -> 
> connector), as the source should initiate negotiations.
> 
> Btw this encapsulation stuff above asks to rename drm_bridge to 
> drm_sink, otherwise it would be confusing as bridges have two ends.

drm_sink would be equally confusing when used for devices that have a
sink and a source :-) I'm not against a rename though, if we can find a
better name.

> Regards
> 
> Andrzej
> 
> 
> [1]: I use term sink as short equivalent for 'bridges AND panels' 
> (another issue in DRMs).
> 
> [2]: https://www.mouser.com/datasheet/2/286/THC63LVD1024-1396205.pdf
> 
> >> A FURTHER NOTE: Looking closer at commit 4e5763f03e10 ("drm/bridge:
> >> ti-sn65dsi86: Wrap panel with panel-bridge") you can see that patch
> >> inadvertently changed the order of things. The order used to be
> >> correct (panel prepare was at the tail of the bridge enable) but it
> >> became backwards. We'll restore the original order with this patch.
> >>
> >> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> >> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > To make the patch complete the descriptions in drm_bridge_funcs
> > need to be updated to reflect the new reality.
> >
> >> ---
> >>
> >>   drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++--------------
> >>   1 file changed, 14 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> >> index c96847fc0ebc..98808af59afd 100644
> >> --- a/drivers/gpu/drm/drm_bridge.c
> >> +++ b/drivers/gpu/drm/drm_bridge.c
> >> @@ -583,18 +583,14 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
> >>   void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> >
> > If you, or someone else, could r-b or ack the pending patches to remove
> > this function, this part of the patch would no longer be needed.
> >
> >>   {
> >>   	struct drm_encoder *encoder;
> >> -	struct drm_bridge *iter;
> >>   
> >>   	if (!bridge)
> >>   		return;
> >>   
> >>   	encoder = bridge->encoder;
> >> -	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> >> -		if (iter->funcs->pre_enable)
> >> -			iter->funcs->pre_enable(iter);
> >> -
> >> -		if (iter == bridge)
> >> -			break;
> >> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> >> +		if (bridge->funcs->pre_enable)
> >> +			bridge->funcs->pre_enable(bridge);
> >>   	}
> >>   }
> >>   EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
> >> @@ -684,26 +680,30 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
> >>   					  struct drm_atomic_state *old_state)
> >>   {
> >>   	struct drm_encoder *encoder;
> >> +	struct drm_bridge *iter;
> >
> > s/iter/bridge/ would make the patch simpler
> > And then the bridge argument could be last_bridge or something.
> > This would IMO increase readability of the code and make the patch smaller.
> >>   
> >>   	if (!bridge)
> >>   		return;
> >>   
> >>   	encoder = bridge->encoder;
> >> -	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> >> -		if (bridge->funcs->atomic_post_disable) {
> >> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> >> +		if (iter->funcs->atomic_post_disable) {
> >>   			struct drm_bridge_state *old_bridge_state;
> >>   
> >>   			old_bridge_state =
> >>   				drm_atomic_get_old_bridge_state(old_state,
> >> -								bridge);
> >> +								iter);
> >>   			if (WARN_ON(!old_bridge_state))
> >>   				return;
> >>   
> >> -			bridge->funcs->atomic_post_disable(bridge,
> >> -							   old_bridge_state);
> >> -		} else if (bridge->funcs->post_disable) {
> >> -			bridge->funcs->post_disable(bridge);
> >> +			iter->funcs->atomic_post_disable(iter,
> >> +							 old_bridge_state);
> >> +		} else if (iter->funcs->post_disable) {
> >> +			iter->funcs->post_disable(iter);
> >>   		}
> >> +
> >> +		if (iter == bridge)
> >> +			break;
> >
> > I cannot see why this is needed, we are at the end of the list here
> > anyway.
> >
> >>   	}
> >>   }
> >>   EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);

-- 
Regards,

Laurent Pinchart
