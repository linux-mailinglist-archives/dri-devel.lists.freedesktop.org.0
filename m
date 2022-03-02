Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF54CA6DB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 15:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B8A10E550;
	Wed,  2 Mar 2022 14:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9F410E4FF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 14:01:35 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id q17so2400434edd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 06:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dZ+xckJn98ATKHWBU5P10gAI0WotxpARcozBCBrZPsg=;
 b=WAwNs8jlT3Ks15M3htHM+sOaK3CfO413zRYs5Nln9ah1s/HpYaQtrrFaH9S1JIXjfu
 h4HGNT4a6LrzzdX5E+gxgao/2RDQuDRbCyNjOfWUtJKohEPsl9AvGCNih8gGxKyW08u2
 oy7RhtcyCWMhFQ7GbQ+EQzq2D9v8nox1Kzlbktt9suykcQ9FYdpKm0OqLoPY2EcH63Nx
 xFu70JqjOx1Pf3luuG9KuZ1B6XVbtj2JpHUIlKRmbSveLJyeaTPLDZCBNNIlJv/CBgpz
 R85Uz8hv1ZnqHhBP+g3rZuQDFbNdyDYYDQXkAajOThfCMgCu0qBOalLGsX5VmdDjxxtv
 90Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZ+xckJn98ATKHWBU5P10gAI0WotxpARcozBCBrZPsg=;
 b=0E/7pTKcwcvdI5hTmfrYPYPFRYBZC3JswJFBVJliIhSQWtkd9Pjm7nvCzT1QDFveLI
 iXQ3MH7h5QBC5yUcr8IxjQcCfqzFrM2sNALRRd8Lm00/ZVcBu4S0sxmOyorOo+A4IyR8
 rVQqXRWPFNXOrWpi9KFvfd2k+te13PjCyx8XTqDRptuU7Eo6PBbipHr9b5fqWfOE4JfT
 Nqh1GuPb/+zfn0yg8JOlBT/oj2Id/90NBhvWqzUk5O2YbufIhMHj2Y8dw1WL2tFiQ1+V
 ijROgLxElpXddxn5uEjmhPfsZ4LSYIMKSEzZIU6Y6ul30amRtBYMgzvti2CEXSQw0Hlg
 lEuA==
X-Gm-Message-State: AOAM53177URSmAfbd9IRURHhrfN33QjUSXXAr/ZpoQREeOEIkzPX2zWI
 iAxXiiE3eb/NIJsL4R5mRZ42hbIdt6UhQr+YzIGrdw==
X-Google-Smtp-Source: ABdhPJwOp31krTKWY8CvOJqux9To9dvqX81YuRtVGkVINLJbaEroO2oloYNglkGjUyOm62JqL23br4XGaeFoesAsR6I=
X-Received: by 2002:a05:6402:1d4e:b0:415:bc08:1d14 with SMTP id
 dz14-20020a0564021d4e00b00415bc081d14mr2811634edb.217.1646229693944; Wed, 02
 Mar 2022 06:01:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
 <4c6511bd7f4ce52aa3323141b6f0a68ae2773787.1645029005.git.dave.stevenson@raspberrypi.com>
 <YhSD1zHxaOeCitgz@pendragon.ideasonboard.com>
 <CAPY8ntA=1ZD2kgFy=deuV4FWetT7wq3s_=eKH6kJwOx6CBLTkw@mail.gmail.com>
 <35234e49-8e1c-b88c-2764-cd79e50dd0ad@intel.com>
In-Reply-To: <35234e49-8e1c-b88c-2764-cd79e50dd0ad@intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 2 Mar 2022 14:01:17 +0000
Message-ID: <CAPY8ntB+btVZhccahr90oqJ4nG=UXV3Lr6uiDPoCjQohN77FAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Introduce DRM_BRIDGE_OP_UPSTREAM_FIRST to alter
 bridge init order
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej

On Mon, 28 Feb 2022 at 15:36, Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
>
>
> On 22.02.2022 09:43, Dave Stevenson wrote:
> > Hi Laurent.
> >
> > Thanks for the review.
> >
> > On Tue, 22 Feb 2022 at 06:34, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >> Hi Dave,
> >>
> >> Thank you for the patch.
> >>
> >> On Wed, Feb 16, 2022 at 04:59:43PM +0000, Dave Stevenson wrote:
> >>> DSI sink devices typically want the DSI host powered up and configured
> >>> before they are powered up. pre_enable is the place this would normally
> >>> happen, but they are called in reverse order from panel/connector towards
> >>> the encoder, which is the "wrong" order.
> >>>
> >>> Add a new flag DRM_BRIDGE_OP_UPSTREAM_FIRST that any bridge can set
> >>> to swap the order of pre_enable (and post_disable) so that any upstream
> >>> bridges are called first to create the desired state.
> >>>
> >>> eg:
> >>> - Panel
> >>> - Bridge 1
> >>> - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
> >>> - Bridge 3
> >>> - Encoder
> >>> Would result in pre_enable's being called as Panel, Bridge 1, Bridge 3,
> >>> Bridge 2.
> >> If there was a Bridge 4 between Bridge 3 and Encoder, would it be
> >>
> >> Panel, Bridge 1, Bridge 3, Bridge 4, Bridge 2
> >>
> >> ? I'd capture that here, to be explicit.
> > No.
> >   - Panel
> >   - Bridge 1
> >   - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
> >   - Bridge 3
> >   - Bridge 4
> >    - Encoder
> > Would result in pre_enable's being called as Panel, Bridge 1, Bridge
> > 3, Bridge 2, Bridge 4, Encoder.
> > ie it only swaps the order of bridges 2 & 3.
> >
> >   - Panel
> >   - Bridge 1
> >   - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
> >   - Bridge 3 DRM_BRIDGE_OP_UPSTREAM_FIRST
> >   - Bridge 4
> >   - Encoder
> > Would result in pre_enable's being called as Panel, Bridge 1, Bridge
> > 4, Bridge 3, Bridge 2, Encoder.
> > (Bridge 2&3 have asked for upstream to be enabled first, which means
> > bridge 4. Bridge 2 wants upstream enabled first, which means bridge
> > 3).
> >
> >   - Panel
> >   - Bridge 1
> >   - Bridge 2 DRM_BRIDGE_OP_UPSTREAM_FIRST
> >   - Bridge 3
> >   - Bridge 4 DRM_BRIDGE_OP_UPSTREAM_FIRST
> >   - Bridge 5
> >   - Encoder
> > Would result in Panel, Bridge 1, Bridge 3, Bridge 2, Bridge 5, Bridge
> > 4, Encoder.
> >
> > So we only reverse the order whilst the bridges request that they want
> > upstream enabled first, but we can do that multiple times within the
> > chain. I hope that makes sense.
> >
> >>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>> ---
> >>>   drivers/gpu/drm/drm_bridge.c | 197 +++++++++++++++++++++++++++++++++++++------
> >>>   include/drm/drm_bridge.h     |   8 ++
> >>>   2 files changed, 180 insertions(+), 25 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> >>> index c96847fc0ebc..7c24e8340efa 100644
> >>> --- a/drivers/gpu/drm/drm_bridge.c
> >>> +++ b/drivers/gpu/drm/drm_bridge.c
> >>> @@ -522,21 +522,58 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
> >>>    * Calls &drm_bridge_funcs.post_disable op for all the bridges in the
> >>>    * encoder chain, starting from the first bridge to the last. These are called
> >>>    * after completing the encoder's prepare op.
> >> Missing blank line, as well as in three locations below.
> >>
> >>> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the post_disable for
> >>> + * that bridge will be called before the previous one to reverse the pre_enable
> >>> + * calling direction.
> >>>    *
> >>>    * Note: the bridge passed should be the one closest to the encoder
> >>>    */
> >>>   void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
> >>>   {
> >>>        struct drm_encoder *encoder;
> >>> +     struct drm_bridge *next, *limit;
> >>>
> >>>        if (!bridge)
> >>>                return;
> >>>
> >>>        encoder = bridge->encoder;
> >>>        list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> >>> +             limit = NULL;
> >>> +
> >>> +             if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
> >>> +                     next = list_next_entry(bridge, chain_node);
> >>> +
> >>> +                     if (next->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> >>> +                             limit = next;
> >>> +
> >>> +                             list_for_each_entry_from(next, &encoder->bridge_chain,
> >>> +                                                      chain_node) {
> >>> +                                     if (!(next->ops &
> >>> +                                             DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> >>> +                                             next = list_prev_entry(next, chain_node);
> >>> +                                             limit = next;
> >>> +                                             break;
> >>> +                                     }
> >>> +                             }
> >>> +
> >>> +                             list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
> >>> +                                                              chain_node) {
> >>> +                                     if (next == bridge)
> >>> +                                             break;
> >>> +
> >>> +                                     if (next->funcs->post_disable)
> >>> +                                             next->funcs->post_disable(next);
> >>> +                             }
> >>> +                     }
> >>> +             }
> >>> +
> >>>                if (bridge->funcs->post_disable)
> >>>                        bridge->funcs->post_disable(bridge);
> >>> +
> >>> +             if (limit)
> >>> +                     bridge = limit;
> >>>        }
> >>> +
> >>>   }
> >>>   EXPORT_SYMBOL(drm_bridge_chain_post_disable);
> >>>
> >>> @@ -577,22 +614,53 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
> >>>    * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
> >>>    * chain, starting from the last bridge to the first. These are called
> >>>    * before calling the encoder's commit op.
> >>> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
> >>> + * the previous bridge will be called before pre_enable of this bridge.
> >>>    *
> >>>    * Note: the bridge passed should be the one closest to the encoder
> >>>    */
> >>>   void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> >>>   {
> >>>        struct drm_encoder *encoder;
> >>> -     struct drm_bridge *iter;
> >>> +     struct drm_bridge *iter, *next, *limit;
> >>>
> >>>        if (!bridge)
> >>>                return;
> >>>
> >>>        encoder = bridge->encoder;
> >>> +
> >>>        list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> >>> +             if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> >>> +                     next = iter;
> >>> +                     limit = bridge;
> >>> +                     list_for_each_entry_from_reverse(next,
> >>> +                                                      &encoder->bridge_chain,
> >>> +                                                      chain_node) {
> >>> +                             if (next == bridge)
> >>> +                                     break;
> >>> +
> >>> +                             if (!(next->ops &
> >>> +                                     DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> >>> +                                     limit = list_prev_entry(next, chain_node);
> >>> +                                     break;
> >>> +                             }
> >>> +                     }
> >>> +
> >>> +                     list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
> >>> +                             if (next == iter)
> >>> +                                     break;
> >>> +
> >>> +                             if (next->funcs->pre_enable)
> >>> +                                     next->funcs->pre_enable(next);
> >>> +                     }
> >>> +             }
> >>> +
> >>>                if (iter->funcs->pre_enable)
> >>>                        iter->funcs->pre_enable(iter);
> >>>
> >>> +             if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
> >>> +                     iter = limit;
> >>> +
> >>>                if (iter == bridge)
> >>>                        break;
> >>>        }
> >>> @@ -667,6 +735,25 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
> >>>   }
> >>>   EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
> >>>
> >>> +static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
> >>> +                                             struct drm_atomic_state *old_state)
> >>> +{
> >>> +     if (bridge->funcs->atomic_post_disable) {
> >>> +             struct drm_bridge_state *old_bridge_state;
> >>> +
> >>> +             old_bridge_state =
> >>> +                     drm_atomic_get_old_bridge_state(old_state,
> >>> +                                                     bridge);
> >>> +             if (WARN_ON(!old_bridge_state))
> >>> +                     return;
> >>> +
> >>> +             bridge->funcs->atomic_post_disable(bridge,
> >>> +                                                old_bridge_state);
> >>> +     } else if (bridge->funcs->post_disable) {
> >>> +             bridge->funcs->post_disable(bridge);
> >>> +     }
> >>> +}
> >>> +
> >>>   /**
> >>>    * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
> >>>    *                                     in the encoder chain
> >>> @@ -677,6 +764,9 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
> >>>    * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
> >>>    * starting from the first bridge to the last. These are called after completing
> >>>    * &drm_encoder_helper_funcs.atomic_disable
> >>> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the post_disable for
> >>> + * that bridge will be called before the previous one to reverse the pre_enable
> >>> + * calling direction.
> >>>    *
> >>>    * Note: the bridge passed should be the one closest to the encoder
> >>>    */
> >>> @@ -684,30 +774,69 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
> >>>                                          struct drm_atomic_state *old_state)
> >>>   {
> >>>        struct drm_encoder *encoder;
> >>> +     struct drm_bridge *next, *limit;
> >>>
> >>>        if (!bridge)
> >>>                return;
> >>>
> >>>        encoder = bridge->encoder;
> >>> +
> >>>        list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> >>> -             if (bridge->funcs->atomic_post_disable) {
> >>> -                     struct drm_bridge_state *old_bridge_state;
> >>> +             limit = NULL;
> >>> +
> >>> +             if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
> >>> +                     next = list_next_entry(bridge, chain_node);
> >>> +
> >>> +                     if (next->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> >>> +                             limit = next;
> >>> +
> >>> +                             list_for_each_entry_from(next, &encoder->bridge_chain,
> >>> +                                                      chain_node) {
> >>> +                                     if (!(next->ops &
> >>> +                                             DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> >>> +                                             next = list_prev_entry(next, chain_node);
> >>> +                                             limit = next;
> >>> +                                             break;
> >>> +                                     }
> >>> +                             }
> >>> +
> >>> +                             list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
> >>> +                                                              chain_node) {
> >>> +                                     if (next == bridge)
> >>> +                                             break;
> >>> +
> >>> +                                     drm_atomic_bridge_call_post_disable(next,
> >>> +                                                                         old_state);
> >>> +                             }
> >>> +                     }
> >>> +             }
> >>>
> >>> -                     old_bridge_state =
> >>> -                             drm_atomic_get_old_bridge_state(old_state,
> >>> -                                                             bridge);
> >>> -                     if (WARN_ON(!old_bridge_state))
> >>> -                             return;
> >>> +             drm_atomic_bridge_call_post_disable(bridge, old_state);
> >>>
> >>> -                     bridge->funcs->atomic_post_disable(bridge,
> >>> -                                                        old_bridge_state);
> >>> -             } else if (bridge->funcs->post_disable) {
> >>> -                     bridge->funcs->post_disable(bridge);
> >>> -             }
> >>> +             if (limit)
> >>> +                     bridge = limit;
> >>>        }
> >>>   }
> >>>   EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
> >>>
> >>> +static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
> >>> +                                           struct drm_atomic_state *old_state)
> >>> +{
> >>> +     if (bridge->funcs->atomic_pre_enable) {
> >>> +             struct drm_bridge_state *old_bridge_state;
> >>> +
> >>> +             old_bridge_state =
> >>> +                     drm_atomic_get_old_bridge_state(old_state,
> >>> +                                                     bridge);
> >>> +             if (WARN_ON(!old_bridge_state))
> >>> +                     return;
> >>> +
> >>> +             bridge->funcs->atomic_pre_enable(bridge, old_bridge_state);
> >>> +     } else if (bridge->funcs->pre_enable) {
> >>> +             bridge->funcs->pre_enable(bridge);
> >>> +     }
> >>> +}
> >>> +
> >>>   /**
> >>>    * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
> >>>    *                                   the encoder chain
> >>> @@ -718,6 +847,8 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
> >>>    * &drm_bridge_funcs.pre_enable) op for all the bridges in the encoder chain,
> >>>    * starting from the last bridge to the first. These are called before calling
> >>>    * &drm_encoder_helper_funcs.atomic_enable
> >>> + * If a bridge sets the DRM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
> >>> + * the previous bridge will be called before pre_enable of this bridge.
> >>>    *
> >>>    * Note: the bridge passed should be the one closest to the encoder
> >>>    */
> >>> @@ -725,26 +856,42 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
> >>>                                        struct drm_atomic_state *old_state)
> >>>   {
> >>>        struct drm_encoder *encoder;
> >>> -     struct drm_bridge *iter;
> >>> +     struct drm_bridge *iter, *next, *limit;
> >>>
> >>>        if (!bridge)
> >>>                return;
> >>>
> >>>        encoder = bridge->encoder;
> >>> +
> >>>        list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> >>> -             if (iter->funcs->atomic_pre_enable) {
> >>> -                     struct drm_bridge_state *old_bridge_state;
> >>> +             if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
> >>> +                     next = iter;
> >>> +                     limit = bridge;
> >>> +                     list_for_each_entry_from_reverse(next,
> >>> +                                                      &encoder->bridge_chain,
> >>> +                                                      chain_node) {
> >>> +                             if (next == bridge)
> >>> +                                     break;
> >>> +
> >>> +                             if (!(next->ops &
> >>> +                                     DRM_BRIDGE_OP_UPSTREAM_FIRST)) {
> >>> +                                     limit = list_prev_entry(next, chain_node);
> >>> +                                     break;
> >>> +                             }
> >>> +                     }
> >>> +
> >>> +                     list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
> >>> +                             if (next == iter)
> >>> +                                     break;
> >>> +
> >>> +                             drm_atomic_bridge_call_pre_enable(next, old_state);
> >>> +                     }
> >>> +             }
> >> This is hard to understand, I have trouble figuring out if it does the
> >> right thing when multiple bridges set the DRM_BRIDGE_OP_UPSTREAM_FIRST
> >> flag (or actually even when a single bridge does so). Comments would
> >> help, but I wonder if it wouldn't be simpler to switch to a recursive
> >> implementation.
> > Recursive - such joys!
> > With the explanation above, I'm not sure that recursive helps, but
> > certainly can add comments.
>
> It could be recursive, or just proper iteration, for example pseudocode:
>
> list_for_each_entry_reverse(...) {
>         if (iter->upstream_first && iter->prev)
>                 continue;
>         tmp = iter;
>         do {
>                 call_op
>                 tmp = tmp->next;
>         } while (tmp && tmp->upstream_first);
> }

You're right, using continue to skip over list entries, and then
having a single loop to work backwards works quite nicely. I'm sorting
a V2 that does that.

  Dave
