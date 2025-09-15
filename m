Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D73B57F85
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA0810E4D5;
	Mon, 15 Sep 2025 14:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YhtKvGax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5131C10E4D5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:52:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 049C81A0CA1;
 Mon, 15 Sep 2025 14:52:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CB74D6063F;
 Mon, 15 Sep 2025 14:52:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D7E5102F289A; 
 Mon, 15 Sep 2025 16:51:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757947932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9/1xDLpN46ovxWuIDb6y1UDzgPJCPHEEUNnnvivnkWw=;
 b=YhtKvGax5QyhFwcLqEYXTw5QbQdZ9spP89NdDB+ZcanR0RjAR0XokGenpHPmb/QJtgPYor
 skhkcOPlmOvG1TWih3fEusanYKxSV0zyD5Pu939GmbfmqEXtIP4ioJLIDq5yn0KYPN5bid
 pX14zIf/Xs0S4Jh6062AcPzl+RC9mpUYF2tFCp9TfD0iyw9cRjLYlLf7IPmWxusA6VbJEJ
 c2rBesGl01sNiidMTXNlkXYQdlZa/d9p7be2WKIolPJb/Sgu4BSv4sYkk0L/W8A+BIKNA6
 ZHEPNvsAPa5PAhGieZ3d0rIZ4B3Id/oUIFYu1K2PcLgu3fDOLZt3pCcKzQLHQA==
Date: Mon, 15 Sep 2025 16:51:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: protect device resources
 on unplug
Message-ID: <20250915165156.35378299@booty>
In-Reply-To: <20250915-benign-rare-marmot-9fbb96@penduick>
References: <20250808-drm-bridge-atomic-vs-remove-v1-0-a52e933b08a8@bootlin.com>
 <20250808-drm-bridge-atomic-vs-remove-v1-2-a52e933b08a8@bootlin.com>
 <l2orbpdoh3cqqgqudbnbdlogo3bd57uu4nv3ax74uoahknzjgr@gbxxuky3huw6>
 <20250820131302.6a2da5ef@booty>
 <20250827-charming-arcane-stingray-cfb8b6@houat>
 <20250908154906.16693078@booty>
 <20250910-glittering-serval-of-piety-b32844@houat>
 <20250910184752.6c42f004@booty>
 <20250915-benign-rare-marmot-9fbb96@penduick>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Maxime,

thanks for the feedback, this discussion is getting very interesting!

On Mon, 15 Sep 2025 14:03:17 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> > > I'm still confused why it's so important than in your example
> > > xyz_disable must be called after drm_bridge_unplug.  
> > 
> > Let me clarify with an example.
> > 
> > As I wrote in another reply, I have moved from a flag
> > (disable_resources_needed) to a devres action as you had suggested, but
> > the example here is based on the old flag because it is more explicit,
> > code would be executed in the same order anyway, and, well, because I
> > had written the example before the devres action conversion.
> > 
> > Take these two functions (stripped versions of the actual ones):
> > 
> > /* Same as proposed, but with _unplug moved at the end */
> > static void sn65dsi83_remove()
> > {
> > 	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
> > 
> > 	drm_bridge_remove(&ctx->bridge);
> > 	
> > 	/* 
> > 	 * I moved the following code to a devm action, but keeping it
> > 	 * explicit here for the discussion
> > 	 */
> > 	if (ctx->disable_resources_needed) {
> > 		sn65dsi83_monitor_stop(ctx);
> > 		regulator_disable(ctx->vcc);
> > 	}
> > 	
> > 	drm_bridge_unplug(&ctx->bridge);     // At the end!
> > }  
> 
> First off, why do we need to have drm_bridge_unplug and
> drm_bridge_remove separate?
> 
> If we were to mirror drm_dev_enter and drm_dev_unplug, drm_dev_unplug
> calls drm_dev_unregister itself, and I can't find a reason where we
> might want to split the two.

I think it could make sense and I'm definitely open to it.

After a quick analysis I have mostly one concern. Calls
to drm_bridge_add() and drm_bridge_remove() are balanced in current
code and that's very intuitive. If drm_bridge_unplug() were to call
drm_bridge_remove(), that symmetry would disappear. Some drivers would
still need to call drm_bridge_remove() directly (e.g. the DSI host
drivers which _add/remove() in the DSI attach/detach callbacks), while
other wouldn't because drm_bridge_unplug() would do that.

What do you think about this?

Another concern I initially had is about drivers whose usage of
drm_bridge is more complex than the average. Most simple drivers just
call drm_bridge_remove() in their .remove callback and that's
straightforward. I was suspicious about drivers such as
imx8qxp-pixel-combiner which instantiate multiple bridges, and whether
they need do all the drm_bridge_unplug()s before all the
drm_bridge_remove()s. However I don't think that's a real need because,
except for probe and removal, operations on bridges happen on a
per-bridge basis, so each bridge is independent from others, at least
for the driver I mentioned.

> > static void sn65dsi83_atomic_disable()
> > {
> > 	if (!drm_bridge_enter(bridge, &idx))
> > 		return;
> > 
> > 	/* These 3 lines will be replaced by devm_release_action() */
> > 	ctx->disable_resources_needed = false;
> > 	sn65dsi83_monitor_stop(ctx);
> > 	regulator_disable(ctx->vcc);
> > 
> > 	drm_bridge_exit(idx);
> > }
> > 
> > Here the xyz_disable() in my pseudocode is the sn65dsi83_monitor_stop()
> > + regulator_disable().
> > 
> > If sn65dsi83_remove() and sn65dsi83_atomic_disable() were to happen
> > concurrently, this sequence of events could happen:
> > 
> > 1. atomic_disable:  drm_bridge_enter() -> OK, can go
> > 2. remove:          drm_bridge_remove()
> > 3. remove:          sn65dsi83_monitor_stop()
> > 4. remove:          regulator_disable()
> > 5. remove:          drm_bridge_unplug() -- too late to stop atomic_disable  
> 
> drm_dev_unplug would also get delayed until drm_dev_exit is called,
> mitigating your issue here.

I don't think I got what you mean. With the above code the regulator
would still be subject to an en/disable imbalance.

However I realized the problem does not exist when using devres,
because devres itself takes care of executing each release function only
once, by means of a spinlock.

I think using devres actually solves my concerns about removal during
atomic[_post]_disable, but also for the atomic[_pre]_enable and other
call paths. Also, I think it makes the question of which goes first
(drm_bridge_unplug() or _remove()) way less relevant.

The concern is probably still valid for drivers which don't use devres.
However the concern is irrelevant until there is a need for a bridge to
become hot-pluggable. At that point a driver needs to either move to
devres or take other actions to avoid incurring in the same issue.

I'm going to send soon a v2 with my devres changes so we can continue
this discussion on actual code.

> > 6. atomic_disable:  ctx->disable_resources_needed = false -- too late to stop .remove
> > 7. atomic_disable:  sn65dsi83_monitor_stop() -- twice, maybe no problem
> > 8. atomic_disable:  regulator_disable() -- Twice, en/disable imbalance!
> > 
> > So there is an excess regulator disable, which is an error. I don't see
> > how this can be avoided if the drm_bridge_unplug() is called after the
> > regulator_disable().
> > 
> > Let me know whether this clarifies the need to _unplug at the beginning
> > of the .remove function.  
> 
> Another thing that just crossed my mind is why we don't call
> atomic_disable when we're tearing down the bridge too. We're doing it
> for the main DRM devices, it would make sense to me to disable the
> encoder -> bridge -> connector (and possibly CRTC) chain if we remove a
> bridge automatically.

Uh, interesting idea.

Do you mean something like:

void drm_bridge_unplug(struct drm_bridge *bridge)
{
    bridge->unplugged = true;
    synchronize_srcu(&drm_bridge_unplug_srcu);

    drm_bridge_remove(bridge); // as per discussion above

    drm_atomic_helper_shutdown(bridge->dev);
}

?

I'm not sure which is the right call to tear down the pipeline though.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
