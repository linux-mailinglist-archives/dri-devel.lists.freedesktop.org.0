Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCA5436C50
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 22:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576126E4A1;
	Thu, 21 Oct 2021 20:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EF56E4A1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 20:41:44 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 542c1e46-32af-11ec-ac3c-0050568cd888;
 Thu, 21 Oct 2021 20:41:55 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 98917194B4A;
 Thu, 21 Oct 2021 22:41:41 +0200 (CEST)
Date: Thu, 21 Oct 2021 22:41:40 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Philip Chen <philipchen@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/bridge: Fix the bridge chain order for pre_enable /
 post_disable
Message-ID: <YXHQhMe84ZZKkJik@ravnborg.org>
References: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
 <YXHLrnAliqxmrrho@ravnborg.org>
 <CAD=FV=U3_q-Y7QArYkGabrNEYMT0D3uuh-_O+D4DjF_bYmpPiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=U3_q-Y7QArYkGabrNEYMT0D3uuh-_O+D4DjF_bYmpPiA@mail.gmail.com>
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

> > >  void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> >
> > If you, or someone else, could r-b or ack the pending patches to remove
> > this function, this part of the patch would no longer be needed.
> 
> OK. I will likely be able to take a look next week. Given that I'm
> helping Philip bringup a board with ps8640 it looks like your patch
> series will be quite relevant! I guess it would be good to figure out
> what would be the best order to land them. In my case we need this fix
> to be easy to pick back to fix the behavior on the Chrome OS 5.4 tree.
> My fix is easy to pick back, but perhaps yours is as well. Of course
> we could also just make a local divergent change in our tree if need
> be, too.
I do not mind the order - so whatever works for you guys.
The only concern here is that we should not gain new users.

> 
> > >  {
> > >       struct drm_encoder *encoder;
> > > -     struct drm_bridge *iter;
> > >
> > >       if (!bridge)
> > >               return;
> > >
> > >       encoder = bridge->encoder;
> > > -     list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> > > -             if (iter->funcs->pre_enable)
> > > -                     iter->funcs->pre_enable(iter);
> > > -
> > > -             if (iter == bridge)
> > > -                     break;
> > > +     list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> > > +             if (bridge->funcs->pre_enable)
> > > +                     bridge->funcs->pre_enable(bridge);
> > >       }
> > >  }
> > >  EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
> > > @@ -684,26 +680,30 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
> > >                                         struct drm_atomic_state *old_state)
> > >  {
> > >       struct drm_encoder *encoder;
> > > +     struct drm_bridge *iter;
> > s/iter/bridge/ would make the patch simpler
> > And then the bridge argument could be last_bridge or something.
> > This would IMO increase readability of the code and make the patch smaller.
> 
> Yeah, I debated this too. I was trying to match
> drm_bridge_chain_disable() and in my mind keeping the two functions
> matching is more important than keeping this patch small.
Well, drm_bridge_chain_disable() is about to be deleted. So that the
wrong one to look at.

> Certainly I
> could add another patch in the series to rename "bridge" to
> "last_bridge" and "iter" to "bridge" in that function, but that
> defeats the goal of reducing churn... ...and clearly whoever wrote
> drm_bridge_chain_disable() liked "iter" better. :-P
> 
> In any case, I'll change it as you say if everyone likes it better,
> but otherwise I'll leave it as I have it.

> 
> 
> > >       if (!bridge)
> > >               return;
> > >
> > >       encoder = bridge->encoder;
> > > -     list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> > > -             if (bridge->funcs->atomic_post_disable) {
> > > +     list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> > > +             if (iter->funcs->atomic_post_disable) {
> > >                       struct drm_bridge_state *old_bridge_state;
> > >
> > >                       old_bridge_state =
> > >                               drm_atomic_get_old_bridge_state(old_state,
> > > -                                                             bridge);
> > > +                                                             iter);
> > >                       if (WARN_ON(!old_bridge_state))
> > >                               return;
> > >
> > > -                     bridge->funcs->atomic_post_disable(bridge,
> > > -                                                        old_bridge_state);
> > > -             } else if (bridge->funcs->post_disable) {
> > > -                     bridge->funcs->post_disable(bridge);
> > > +                     iter->funcs->atomic_post_disable(iter,
> > > +                                                      old_bridge_state);
> > > +             } else if (iter->funcs->post_disable) {
> > > +                     iter->funcs->post_disable(iter);
> > >               }
> > > +
> > > +             if (iter == bridge)
> > > +                     break;
> > I cannot see why this is needed, we are at the end of the list here
> > anyway.
I see, please include this change in your changelog and add it to the
documentation in drm_bridge_h.

	Sam
