Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AE0A137F6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 11:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CC410E93E;
	Thu, 16 Jan 2025 10:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QZUlHj6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBF310E93B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 10:32:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1736F1C0004;
 Thu, 16 Jan 2025 10:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737023561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3XUJFnwZJXejFQ6GOrBP90JIe8tQOdKjR5IG9MJDAw=;
 b=QZUlHj6v4ffVrI6UFedN3piGVoARQwHiuKKvoRdjdekRE2Kug/TtAGDXbmc8amdxO39lqq
 NFIuxnwbT5V0YoiNl5qLn0bagsvJV8iyx++CB4En/2hyQFXc/d/dLyhbzt9ADAjnwuj3Hx
 q5pmIT27vwk+Th9Bcnm1UdlRrSRbzpBlP5TO0tUbrgQ0+Gm0RhprpSesplJMGsTv8LUJrQ
 h5O8Z5NL9geqLMMFi26kQvcnIHYoxW016qSXC3X+cKZfWd0xbp62Ri8BOCtvof6wIxAHDM
 oDIwABVBm4egm0pPjopLIDe7be0g7ro5bP2Jo+XDDmWz5fqnwleebmHmL2m6jw==
Date: Thu, 16 Jan 2025 11:32:36 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <20250116113236.39ba876a@booty>
In-Reply-To: <20250110115819.55bc887b@booty>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty> <20250110115819.55bc887b@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Dmitry, Maxime, All,

On Fri, 10 Jan 2025 11:58:19 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Hi Dmitry,
> 
> On Thu, 2 Jan 2025 13:01:49 +0100
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> 
> > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > index f8b4fb8357659018ec0db65374ee5d05330639ae..c4d1563fd32019efde523dfc0863be044c05a826 100644
> > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > @@ -1705,6 +1705,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> > > >  	struct device *dev = dsi->dev;
> > > >  	struct device_node *np = dev->of_node;
> > > >  	struct device_node *remote;
> > > > +	struct drm_bridge *out_bridge;
> > > >  	struct drm_panel *panel;
> > > >  	int ret;
> > > >  
> > > > @@ -1740,21 +1741,23 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> > > >  
> > > >  	panel = of_drm_find_panel(remote);
> > > >  	if (!IS_ERR(panel)) {
> > > > -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > > > +		out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > > >  	} else {
> > > > -		dsi->out_bridge = of_drm_find_bridge(remote);
> > > > -		if (!dsi->out_bridge)
> > > > -			dsi->out_bridge = ERR_PTR(-EINVAL);
> > > > +		out_bridge = of_drm_find_bridge(remote);
> > > > +		if (!out_bridge)
> > > > +			out_bridge = ERR_PTR(-EINVAL);
> > > >  	}      
> > > 
> > > While looking at this patch, I think we should migrate the driver to
> > > drm_of_find_panel_or_bridge().    
> > 
> > Indeed, the code here is duplicating drm_of_find_panel_or_bridge(). I'm
> > going to convert it.  

I've been struggling to find a good way to handle the panel bridge
lifetime, and still haven't found a way that looks totally good.
Here's my analysis and some possible ways forward.

For "normal" bridges there is a device driver that probes, allocates a
struct drm_bridge and registers it via drm_bridge_add() and at that
point the bridge can be found by other drivers, such as the previous
bridge or the encoder. Those "other drivers" will obtain a pointer to
the struct drm_bridge and with refcounting they need to
drm_bridge_put() it.

So there are two clearly separate roles: the provider (bridge driver)
and the consumers (which gets/puts a pointer). So far so good.

And there are panels, which probe similarly as far as I can see.

And then there is the panel bridge. My understanding (which I'd love to
get clarified in case it is not accurate) is that DRM bridges expect to
always interact with "the next bridge", which cannot work for the last
bridge of course, and so the panel bridge wraps the panel pretending it
is a bridge.

This software structure is clearly not accurately modeling the
hardware (panel is not bridge), but it has been serving us so far.
However now I'm definitely hitting some troubles due to how the panel
bridge is created.

First: when the panel probes, no panel bridge is created. So other
bridges cannot find it as they would find other bridges, using
of_drm_find_bridge().

Second: to circumvent this, we have {drmm,devm_drm}_of_get_bridge()
which do (not counting error cases):

 1. call drm_of_find_panel_or_bridge() which returns:
    - a panel pointer, if found
    - otherwise a bridge pointer, if one already exists
 2. if a panel was found, it is assumed that no bridge exists yet (*)
    so one is created:
    2.1) call {drmm,devm_drm}_panel_bridge_add: a new panel bridge is
         allocated and its pointer returned
 3. the bridge obtained at 1 or 2 is returned

So, the pointer returned by {drmm,devm_drm}_of_get_bridge() can be a)
pre-existing or b) a panel bridge allocated automagically if there is a
panel. However the caller has no way to know whether a) or b) happened.
Yet a) and b) have different implications for the panel bridge lifetime
management and require that the returned pointer is disposed of in a
different way.

The fundamental design choice that is problematic with respect to
hotplugging is that the panel bridge (which is a struct drm_bridge
after all) is not created by the provider (the panel driver) but on the
fly by the first consumer that happens to need it. And the consumer is
not aware of this: it obtains a struct drm_bridge pointer and doesn't
know whether it was a) pre-existing or b) created on the fly.

So far this approach has been working because devm and drmm ensure the
panel bridge would be dealloacted at some point. However the devm and drmm
release actions are associated to the consumer struct device (the panel
bridge consumer), so if the panel bridge is removed and the consumer is
not, deallocation won't happen.

For hotplugging we cannot use drmm and devm and instead we use get/put,
to let the "next bridge" disappear with the previous one still present.
So the trivial idea is to add a drm_of_get_bridge(), similar to
{drmm,devm_drm}_of_get_bridge() except it uses plain
drm_panel_bridge_add() instead of devm/drmm variants. But then the
caller (which is the panel consumer) will have to dispose of the struct
drm_bridge pointer by calling:

 - drm_bridge_put() in case a)
 - drm_panel_bridge_remove in case b)

And that's the problem I need to solve.


First and foremost, do you think my analysis is correct?


(*) superficially this looks like another fundamental issue to me, but
    it is not my focus at the moment


Assuming it is, here are some possible ways to make the panel-bridge
work with hotplug.

 1. have drm_of_get_bridge() return an indication on how to dispose of
    the returned pointer
 2. add an ad-hoc remover function alongside drm_of_get_bridge()
 3. let all panel drivers automatically add a panel-bridge
 4. stop pretending there is always a "next bridge" after each bridge

Idea 1:

The new (non drmm/devm) drm_of_get_bridge() would return a flag to
indicate whether case a) or b) happened. Or it could return a function
pointer to be called to dispose of the returned pointer, to be
stored and called by the consumer.

I find this quite ugly and I'd call this a workaround rather than a
solution, but I'm open to discussion.

Idea 2:

I'm proposing to add drm_of_get_bridge(), which as a non-drmm, non-devm
variant to be used with refcounting. So the idea is to add alongside it
a corresponding removal function [drm_of_put_bridge()?]:

  drm_of_put_bridge(struct drm_bridge *bridge)
  {
      if (drm_bridge_is_panel(bridge))
          drm_panel_bridge_remove(bridge);
      drm_bridge_put(bridge);
  }

So the consumer would always have to call this function, which is as
automagic as *drm_of_get_bridge().

My concern is what would happen in case:

 * driver A calls drm_of_get_bridge() and a panel_bridge is created
 * driver B calls drm_of_get_bridge() on the same panel, the existing
   panel_bridge is returned

Both drivers would call drm_of_put_bridge -> drm_panel_bridge_remove,
so removing twice. However I don't think this is possible due to how the
*_drm_of_get_bridge() functions are currently implemented.

Even more, I don't think it is realistic that two different drivers call
*_drm_of_get_bridge() for the same panel. Is this assumption correct?

Idea 3: 

The idea is that if the panel driver framework always creates a panel
bridge, it will never need to be created on the fly automagically by
its consumers, so the whole problem would disappear. It also would be
better modeling the hardware: still wrapping a panel with a drm_bridge
that does not exist in the hardware, but at least having it created by
the provider driver and not by the consumer driver which happens to
look for it.

This looks like a promising and simple idea, so I tried a quick
implementation:

 void drm_panel_init(struct drm_panel *panel, struct device *dev,
                    const struct drm_panel_funcs *funcs, int connector_type)
 {
+       struct drm_bridge *bridge;
+
        INIT_LIST_HEAD(&panel->list);
        INIT_LIST_HEAD(&panel->followers);
        mutex_init(&panel->follower_lock);
        panel->dev = dev;
        panel->funcs = funcs;
        panel->connector_type = connector_type;
+
+       bridge = devm_drm_panel_bridge_add(panel->dev, panel);
+       WARN_ON(!bridge);
 }

This is somewhat working but it requires more work because:

 * as it is, it creates a circular dependency between drm_panel and the
   panel bridge, and modular builds will fail:

     depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm

 * The panel bridge implementation should be made private to the panel
   driver only (possibly helping to solve the previous issue?)

 * Many drivers currently call devm_drm_panel_bridge_add() directly,
   they should probably call drm_of_get_bridge instead

 * drm_of_find_panel_or_bridge() should disappear: other drivers would
   just look for a bridge

Opinions about this idea?

Idea 4:

'stop pretending there is always a "next bridge" after each bridge'
looks like a _very_ long term goal, but it would be interesting to
discuss whether this is a correct idea.

If you've been reading thus far, thanks for your patience! I'll be very
glad to hear more opinions on all the above.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
