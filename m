Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C16A17CFB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 12:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE4010E174;
	Tue, 21 Jan 2025 11:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P3hTmw0T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0710E10E174
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 11:27:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9142940004;
 Tue, 21 Jan 2025 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737458842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VHs0IsbrFZ3T6GIn1dS0YMDGZkEzsEacvOinFbeJiE=;
 b=P3hTmw0T6ZvuownhK3rRu7Awxr7I7YqKd0OHLOXa53PGeddizCzQT1FE65x75RoY0WVB3j
 fd+C/S/6Rb9z8axu5txm0Q4+sJ8HdvMsRU2ggR0G73KIMY2jSPlWFBxfIGO5BIL+X/NKEt
 eULQXh48ufcWDsz6H08L/u0P5NstTW3lsxgcGLM+SUJVNDl1KOwznJsTI0p2f9J3wXAiNE
 ATDi4UL7H9pGD0lGhSaTKazxUzij0kjtVrszcHyhzQL1TyMR6h6zxqczCUj5k/pdrYDpS2
 lA9IhxjhNhEwkRtWBj+LqMc466/hFj3+dVFeNZTtM6AV87PYaUOOuHDeencEZw==
Date: Tue, 21 Jan 2025 12:27:18 +0100
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
Message-ID: <20250121122718.48502262@booty>
In-Reply-To: <emuj2innmp6zmzd7pyakqzjqpdzhly6qfhakya3ydwmd63pl26@5jwxaidpikjw>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty> <20250110115819.55bc887b@booty>
 <20250116113236.39ba876a@booty>
 <emuj2innmp6zmzd7pyakqzjqpdzhly6qfhakya3ydwmd63pl26@5jwxaidpikjw>
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

Hi Dmitry,

On Thu, 16 Jan 2025 12:56:25 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

[...]

> > Idea 3: 
> > 
> > The idea is that if the panel driver framework always creates a panel
> > bridge, it will never need to be created on the fly automagically by
> > its consumers, so the whole problem would disappear. It also would be
> > better modeling the hardware: still wrapping a panel with a drm_bridge
> > that does not exist in the hardware, but at least having it created by
> > the provider driver and not by the consumer driver which happens to
> > look for it.  
> 
> I think this is the best option up to now.

Thanks for sharing your opinion. However a few points are not clear to
me, see below.

> > This looks like a promising and simple idea, so I tried a quick
> > implementation:
> > 
> >  void drm_panel_init(struct drm_panel *panel, struct device *dev,
> >                     const struct drm_panel_funcs *funcs, int connector_type)
> >  {
> > +       struct drm_bridge *bridge;
> > +
> >         INIT_LIST_HEAD(&panel->list);
> >         INIT_LIST_HEAD(&panel->followers);
> >         mutex_init(&panel->follower_lock);
> >         panel->dev = dev;
> >         panel->funcs = funcs;
> >         panel->connector_type = connector_type;
> > +
> > +       bridge = devm_drm_panel_bridge_add(panel->dev, panel);
> > +       WARN_ON(!bridge);
> >  }
> > 
> > This is somewhat working but it requires more work because:
> > 
> >  * as it is, it creates a circular dependency between drm_panel and the
> >    panel bridge, and modular builds will fail:
> > 
> >      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> > 
> >  * The panel bridge implementation should be made private to the panel
> >    driver only (possibly helping to solve the previous issue?)  
> 
> Or merge drm_panel.c into bridge/panel.c.

Not sure here you mean exactly what you wrote, or the other way around.
It looks more correct to me that the panel core (drm_panel.c) starts
exposing a bridge now, and not that the panel bridge which is just one
of many bridge drivers starts handling all the panel-related stuff.

> The panel bridge already
> exports non-standard API, so it should be fine to extend / change that
> API. Likewise we might move drm_panel.c to drm_kms_helper.o, also
> resolving the loop.

Again I'm not following I'm afraid. It would seem more logical to me to
move things from the helper into drm.o as they become more necessary
for common cases, rather than moving things out to a helper module and
then force all panel drivers to depend on the helper module.

Apologies, I'm perhaps not following your reasoning here. :(

> There will be a need for a Kconfig update in both
> cases.
> 
> >  * Many drivers currently call devm_drm_panel_bridge_add() directly,
> >    they should probably call drm_of_get_bridge instead  
> 
> I'd say, make it a stub that calls drm_of_get_bridge() with a possible
> deprecation warning.

I get the idea, but it would need to be implemented differently because
drm_of_get_bridge() calls devm_drm_panel_bridge_add(). They would loop
into each other. I think we might simply add a check at the beginning
of drm_panel_bridge_add_typed(), as in (pseudocode):

drm_panel_bridge_add_typed(struct drm_panel *panel, ...)
{
    if (panel_has_a_panel_bridge(panel))
        return panel->panel_bridge.bridge;

    // existing code
}

But that reopens the same issue: drm_panel_bridge_add_typed() would not
always call drm_bridge_add(), so the caller doesn't know how to dispose
of the returned pointer.

I think idea 3 can only work if the code understands that the panel
bridge is created by the panel and they _never_ have to create it
themselves. So handling the transition for all drivers would be quite
painful.

> >  * drm_of_find_panel_or_bridge() should disappear: other drivers would
> >    just look for a bridge  
> 
> Please keep it for now.
> 
> Some of the drivers think that it returns literally panel-or-bridge (but
> not both). However if panel bridge is already created, it will return
> both. So those drivers need to be updated.

I really believe it never returns both. The *bridge is set only when
ret != 0 here [0], which can happen only if a panel was not found.
Despite the slightly intricate logic of that function, I don't see how
it could return both in its current implementation.

[0]
https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/gpu/drm/drm_of.c#L273

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
