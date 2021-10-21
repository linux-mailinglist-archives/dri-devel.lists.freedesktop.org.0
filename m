Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B80436C39
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 22:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCFF6E49C;
	Thu, 21 Oct 2021 20:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB726E49C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 20:34:07 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id d125so2624981iof.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 13:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qc5yk2ewhoH94OoX+tRZuXvqhmyfRbN00IiOr1tb4iU=;
 b=OoTa6UG/eMXeKDGTA4sYKl0TkjpkdP9n7fq2xELyADWB9E8Sd4SygwGy4lyHjmsbhB
 Bd6YZ37c8AOWr9YIV9NxUstNzaNqopKTj/6cOldCh4pvfQR0qR+Hq6dvvWxmCiEnm/mW
 vOyjzuLvJ8JrH0pMnzo9oA25IQVb/OjHBe9d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qc5yk2ewhoH94OoX+tRZuXvqhmyfRbN00IiOr1tb4iU=;
 b=d140r/9cEfbrIXMZ4jC9SIT8xXkDtuu4yUmtaj4vvp6DK7xwbZ0QfiD4y/zqJE/gMQ
 K9AttCmMKDkgIi0DPNaBZNpEi3M6V4uiGAXm4Vs9PGtgoJ6rQh6xpvDv+qnf7rY7G5Jd
 Z6SdHeUthJkZRuqSRP5MgHmXQ859d9nXmun5vveMPUAqygNUByzfJB+oHs/6+bdehuQZ
 tHk3vat6EebkeZnjzVwQp7ywpS4W/Xy6VsUT9HcWJbVOf+okv/78vNpWN3hkiO9nmmsa
 /fqKgXlQfzlz1KpowXmUzSwoDlCCycVxCMqRSEkIOqm8cuE9J36jwu4lZmGXREz+nOmC
 iHxg==
X-Gm-Message-State: AOAM531mcnVroocJ7vO2os93g3D/3lnlbA940XPIwcHEtMWWXsYho6+A
 wf8ptZSX2+cDRtmObUOl9z0l+psi3LhRlQ==
X-Google-Smtp-Source: ABdhPJyBxb58DlpPd4ZA385HsrMDbD0XRvAYm99c2NXKdI0K85UwPFvmpaL3p5CBqriRzG9XIGhBYw==
X-Received: by 2002:a05:6602:2dd5:: with SMTP id
 l21mr5650954iow.202.1634848446718; 
 Thu, 21 Oct 2021 13:34:06 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id n3sm2997733iob.32.2021.10.21.13.34.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:34:06 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id w10so1995446ilc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 13:34:06 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b09:: with SMTP id
 i9mr4972431ilv.142.1634848445568; 
 Thu, 21 Oct 2021 13:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
 <YXHLrnAliqxmrrho@ravnborg.org>
In-Reply-To: <YXHLrnAliqxmrrho@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Oct 2021 13:33:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U3_q-Y7QArYkGabrNEYMT0D3uuh-_O+D4DjF_bYmpPiA@mail.gmail.com>
Message-ID: <CAD=FV=U3_q-Y7QArYkGabrNEYMT0D3uuh-_O+D4DjF_bYmpPiA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Fix the bridge chain order for pre_enable /
 post_disable
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Philip Chen <philipchen@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Oct 21, 2021 at 1:21 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Douglas,
>
> On Thu, Oct 21, 2021 at 12:29:01PM -0700, Douglas Anderson wrote:
> > Right now, the chaining order of
> > pre_enable/enable/disable/post_disable looks like this:
> >
> > pre_enable:   start from connector and move to encoder
> > enable:       start from encoder and move to connector
> > disable:      start from connector and move to encoder
> > post_disable: start from encoder and move to connector
> >
> > In the above, it can be seen that at least pre_enable() and
> > post_disable() are opposites of each other and enable() and disable()
> > are opposites. However, it seems broken that pre_enable() and enable()
> > would not move in the same direction. In other parts of Linux you can
> > see that various stages move in the same order. For instance, during
> > system suspend the "early" calls run in the same order as the normal
> > calls run in the same order as the "late" calls run in the same order
> > as the "noirq" calls.
> >
> > Let fix the above so that it makes more sense. Now we'll have:
> >
> > pre_enable:   start from encoder and move to connector
> > enable:       start from encoder and move to connector
> > disable:      start from connector and move to encoder
> > post_disable: start from connector and move to encoder
> >
> > This order is chosen because if there are parent-child relationships
> > anywhere I would expect that the encoder would be a parent and the
> > connector a child--not the other way around.
>
> This makes good sense as you describe it. I hope others can add more
> useful feedback.
> Added Andrzej Hajda <andrzej.hajda@intel.com> to the mail, as he have
> expressed concerns with the chain of bridges before.
>
> >
> > This can be important when using the DP AUX bus to instantiate a
> > panel. The DP AUX bus is likely part of a bridge driver and is a
> > parent of the panel. We'd like the bridge to be pre_enabled before the
> > panel and the panel to be post_disabled before the
> > bridge. Specifically, this allows pm_runtime_put_sync_suspend() in a
> > bridge driver's post_suspend to work properly even a panel is under
> > it.
> >
> > NOTE: it's entirely possible that this change could break someone who
> > was relying on the old order. Hopefully this isn't the case, but if
> > this does break someone it seems like it's better to do it sonner
> > rather than later so we can fix everyone to handle the order that
> > makes the most sense.
> >
> > A FURTHER NOTE: Looking closer at commit 4e5763f03e10 ("drm/bridge:
> > ti-sn65dsi86: Wrap panel with panel-bridge") you can see that patch
> > inadvertently changed the order of things. The order used to be
> > correct (panel prepare was at the tail of the bridge enable) but it
> > became backwards. We'll restore the original order with this patch.
> >
> > Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> > Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> To make the patch complete the descriptions in drm_bridge_funcs
> need to be updated to reflect the new reality.

Ah, oops! Sure, I'll plan on a v2 with this but I'll wait for more feedback.



> >  drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index c96847fc0ebc..98808af59afd 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -583,18 +583,14 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
> >  void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>
> If you, or someone else, could r-b or ack the pending patches to remove
> this function, this part of the patch would no longer be needed.

OK. I will likely be able to take a look next week. Given that I'm
helping Philip bringup a board with ps8640 it looks like your patch
series will be quite relevant! I guess it would be good to figure out
what would be the best order to land them. In my case we need this fix
to be easy to pick back to fix the behavior on the Chrome OS 5.4 tree.
My fix is easy to pick back, but perhaps yours is as well. Of course
we could also just make a local divergent change in our tree if need
be, too.


> >  {
> >       struct drm_encoder *encoder;
> > -     struct drm_bridge *iter;
> >
> >       if (!bridge)
> >               return;
> >
> >       encoder = bridge->encoder;
> > -     list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> > -             if (iter->funcs->pre_enable)
> > -                     iter->funcs->pre_enable(iter);
> > -
> > -             if (iter == bridge)
> > -                     break;
> > +     list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> > +             if (bridge->funcs->pre_enable)
> > +                     bridge->funcs->pre_enable(bridge);
> >       }
> >  }
> >  EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
> > @@ -684,26 +680,30 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
> >                                         struct drm_atomic_state *old_state)
> >  {
> >       struct drm_encoder *encoder;
> > +     struct drm_bridge *iter;
> s/iter/bridge/ would make the patch simpler
> And then the bridge argument could be last_bridge or something.
> This would IMO increase readability of the code and make the patch smaller.

Yeah, I debated this too. I was trying to match
drm_bridge_chain_disable() and in my mind keeping the two functions
matching is more important than keeping this patch small. Certainly I
could add another patch in the series to rename "bridge" to
"last_bridge" and "iter" to "bridge" in that function, but that
defeats the goal of reducing churn... ...and clearly whoever wrote
drm_bridge_chain_disable() liked "iter" better. :-P

In any case, I'll change it as you say if everyone likes it better,
but otherwise I'll leave it as I have it.


> >       if (!bridge)
> >               return;
> >
> >       encoder = bridge->encoder;
> > -     list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> > -             if (bridge->funcs->atomic_post_disable) {
> > +     list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> > +             if (iter->funcs->atomic_post_disable) {
> >                       struct drm_bridge_state *old_bridge_state;
> >
> >                       old_bridge_state =
> >                               drm_atomic_get_old_bridge_state(old_state,
> > -                                                             bridge);
> > +                                                             iter);
> >                       if (WARN_ON(!old_bridge_state))
> >                               return;
> >
> > -                     bridge->funcs->atomic_post_disable(bridge,
> > -                                                        old_bridge_state);
> > -             } else if (bridge->funcs->post_disable) {
> > -                     bridge->funcs->post_disable(bridge);
> > +                     iter->funcs->atomic_post_disable(iter,
> > +                                                      old_bridge_state);
> > +             } else if (iter->funcs->post_disable) {
> > +                     iter->funcs->post_disable(iter);
> >               }
> > +
> > +             if (iter == bridge)
> > +                     break;
> I cannot see why this is needed, we are at the end of the list here
> anyway.

It's because you can start at something that's not the first bridge in
the chain. See commit bab5cca7e609 ("drm/bridge: Fix the stop
condition of drm_bridge_chain_pre_enable()")
