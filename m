Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88A4F7596
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 08:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F86410E59F;
	Thu,  7 Apr 2022 06:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1184B10E59F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 06:03:59 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 x8-20020a9d6288000000b005b22c373759so3232318otk.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 23:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BUWjA+qqy07Gxtdm1nguQ12hoGIbPMwA1SebaUR3zCE=;
 b=Jmg8o1s5OrxYcxEP/Ogr2w/FxptpT+yM7cWcy4wP7qC07mg9LcpNhPxcInCFmhvHXK
 eeTWCHhEIjgcse0VkvLzAEIFP7JNrmdflNlff/2qydx8D1ynIpSMfnnr0QUUYslXrOHe
 k/1uOUuNtPTFJKwzXiu11Nh2P+JL8QKYqA1Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BUWjA+qqy07Gxtdm1nguQ12hoGIbPMwA1SebaUR3zCE=;
 b=i2vk1u+eo3NyEy4tEkpwANB/tMYXiRZWViZXFdi1xcOGFuscqudDKeBeO1M9sl+Syv
 j38TUY5n3UTGIPDsvNJfmx8xg4xWFUfkF5H7dWuM3CKw6yWs2D33PeDS/V4aR9fi+KMT
 5MJn1VKo62AbjJHtGQO1lDzGL1lCeELTfBKwh8/ODg7qigor7sKVcUxzp57bYihaK8iw
 tpofO1XOw07nxEmUVG/AkSEChqY/4R618T/rlIoYg+hcHZCI2frYCENlzODB/OsmP+tw
 vZl89dejCApmRi3yK5Z95ri261QWd40zmmiu/2zpEhaPP6hQv0hl/TqUAPnTOaR6TrMF
 1L7w==
X-Gm-Message-State: AOAM532tFbWx9bjLkJCtQotrm22rFG/aSRsGeuQpTTt0fu4tmPYfxhC9
 fTycbPqWNUzPqt+t5iHNLS18O7Xmx+yRucksXEge2w==
X-Google-Smtp-Source: ABdhPJwaIdfsWXceTZj4mlwlrCEufwcnVXPMjp2DBzOlrIljjeBk58trjqg9oPpHLA3deZhHWIzudmbS80qX0HR2MEk=
X-Received: by 2002:a05:6830:14d3:b0:5b2:49d9:17b6 with SMTP id
 t19-20020a05683014d300b005b249d917b6mr4182691otq.321.1649311439256; Wed, 06
 Apr 2022 23:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220331130545.625721-1-maxime@cerno.tech>
 <YkWruSRsrKv+cQIB@intel.com>
 <YkXFVdjlPQKZumLp@phenom.ffwll.local> <YkXNWxjbAd5ymfcn@intel.com>
 <YkX84QXOXwF0BbI8@phenom.ffwll.local> <YkYGlugdcYOZhDwE@intel.com>
 <YkYI7QBobW0EQC16@phenom.ffwll.local> <YkYK1O7ETTxGCslm@intel.com>
 <YkYOM7aTGy5f4RVp@phenom.ffwll.local> <YkYR9JSA/rNSeJDs@intel.com>
In-Reply-To: <YkYR9JSA/rNSeJDs@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 7 Apr 2022 08:03:48 +0200
Message-ID: <CAKMK7uEw96mvbX3tuqeQLe4S0iAv5eQMfnHRgQNrCBomSqeM-w@mail.gmail.com>
Subject: Re: [PATCH v4] drm/atomic-helpers: remove legacy_cursor_update hacks
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Imre Deak <imre.deak@intel.com>, "airlied@gmail.com" <airlied@gmail.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nikula,
 Jani" <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 22:41, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Mar 31, 2022 at 10:25:23PM +0200, Daniel Vetter wrote:
> > On Thu, Mar 31, 2022 at 11:11:00PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote=
:
> > > On Thu, Mar 31, 2022 at 10:02:53PM +0200, Daniel Vetter wrote:
> > > > On Thu, Mar 31, 2022 at 10:52:54PM +0300, Ville Syrj=C3=A4l=C3=A4 w=
rote:
> > > > > On Thu, Mar 31, 2022 at 09:11:29PM +0200, Daniel Vetter wrote:
> > > > > > On Thu, Mar 31, 2022 at 06:48:43PM +0300, Ville Syrj=C3=A4l=C3=
=A4 wrote:
> > > > > > > On Thu, Mar 31, 2022 at 05:14:29PM +0200, Daniel Vetter wrote=
:
> > > > > > > > On Thu, Mar 31, 2022 at 04:25:13PM +0300, Ville Syrj=C3=A4l=
=C3=A4 wrote:
> > > > > > > > > On Thu, Mar 31, 2022 at 03:05:45PM +0200, Maxime Ripard w=
rote:
> > > > > > > > > > From: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > > > > > >
> > > > > > > > > > The stuff never really worked, and leads to lots of fun=
 because it
> > > > > > > > > > out-of-order frees atomic states. Which upsets KASAN, a=
mong other
> > > > > > > > > > things.
> > > > > > > > > >
> > > > > > > > > > For async updates we now have a more solid solution wit=
h the
> > > > > > > > > > ->atomic_async_check and ->atomic_async_commit hooks. S=
upport for that
> > > > > > > > > > for msm and vc4 landed. nouveau and i915 have their own=
 commit
> > > > > > > > > > routines, doing something similar.
> > > > > > > > > >
> > > > > > > > > > For everyone else it's probably better to remove the us=
e-after-free
> > > > > > > > > > bug, and encourage folks to use the async support inste=
ad. The
> > > > > > > > > > affected drivers which register a legacy cursor plane a=
nd don't either
> > > > > > > > > > use the new async stuff or their own commit routine are=
: amdgpu,
> > > > > > > > > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virt=
io, and vmwgfx.
> > > > > > > > > >
> > > > > > > > > > Inspired by an amdgpu bug report.
> > > > > > > > > >
> > > > > > > > > > v2: Drop RFC, I think with amdgpu converted over to use
> > > > > > > > > > atomic_async_check/commit done in
> > > > > > > > > >
> > > > > > > > > > commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > > > > > > > > > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.co=
m>
> > > > > > > > > > Date:   Wed Dec 5 14:59:07 2018 -0500
> > > > > > > > > >
> > > > > > > > > >     drm/amd/display: Add fast path for cursor plane upd=
ates
> > > > > > > > > >
> > > > > > > > > > we don't have any driver anymore where we have userspac=
e expecting
> > > > > > > > > > solid legacy cursor support _and_ they are using the at=
omic helpers in
> > > > > > > > > > their fully glory. So we can retire this.
> > > > > > > > > >
> > > > > > > > > > v3: Paper over msm and i915 regression. The complete_al=
l is the only
> > > > > > > > > > thing missing afaict.
> > > > > > > > > >
> > > > > > > > > > v4: Rebased on recent kernel, added extra link for vc4 =
bug.
> > > > > > > > > >
> > > > > > > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D199=
425
> > > > > > > > > > Link: https://lore.kernel.org/all/20220221134155.125447=
-9-maxime@cerno.tech/
> > > > > > > > > > Cc: mikita.lipski@amd.com
> > > > > > > > > > Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> > > > > > > > > > Cc: harry.wentland@amd.com
> > > > > > > > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > > > > > > > Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com=
>
> > > > > > > > > > Tested-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > > > > > ---
> > > > > > > > > >  drivers/gpu/drm/drm_atomic_helper.c          | 13 ----=
---------
> > > > > > > > > >  drivers/gpu/drm/i915/display/intel_display.c | 13 ++++=
+++++++++
> > > > > > > > > >  drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
> > > > > > > > > >  3 files changed, 15 insertions(+), 13 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/driv=
ers/gpu/drm/drm_atomic_helper.c
> > > > > > > > > > index 9603193d2fa1..a2899af82b4a 100644
> > > > > > > > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > > > > @@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblan=
ks(struct drm_device *dev,
> > > > > > > > > >       int i, ret;
> > > > > > > > > >       unsigned int crtc_mask =3D 0;
> > > > > > > > > >
> > > > > > > > > > -      /*
> > > > > > > > > > -       * Legacy cursor ioctls are completely unsynced,=
 and userspace
> > > > > > > > > > -       * relies on that (by doing tons of cursor updat=
es).
> > > > > > > > > > -       */
> > > > > > > > > > -     if (old_state->legacy_cursor_update)
> > > > > > > > > > -             return;
> > > > > > > > > > -
> > > > > > > > > >       for_each_oldnew_crtc_in_state(old_state, crtc, ol=
d_crtc_state, new_crtc_state, i) {
> > > > > > > > > >               if (!new_crtc_state->active)
> > > > > > > > > >                       continue;
> > > > > > > > > > @@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_comm=
it(struct drm_atomic_state *state,
> > > > > > > > > >                       continue;
> > > > > > > > > >               }
> > > > > > > > > >
> > > > > > > > > > -             /* Legacy cursor updates are fully unsync=
ed. */
> > > > > > > > > > -             if (state->legacy_cursor_update) {
> > > > > > > > > > -                     complete_all(&commit->flip_done);
> > > > > > > > > > -                     continue;
> > > > > > > > > > -             }
> > > > > > > > > > -
> > > > > > > > > >               if (!new_crtc_state->event) {
> > > > > > > > > >                       commit->event =3D kzalloc(sizeof(=
*commit->event),
> > > > > > > > > >                                               GFP_KERNE=
L);
> > > > > > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_display=
.c b/drivers/gpu/drm/i915/display/intel_display.c
> > > > > > > > > > index bf7ce684dd8e..bde32f5a33cb 100644
> > > > > > > > > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > > > > > > > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > > > > > > > > @@ -8855,6 +8855,19 @@ static int intel_atomic_commit(s=
truct drm_device *dev,
> > > > > > > > > >                               state->base.legacy_cursor=
_update =3D false;
> > > > > > > > > >       }
> > > > > > > > > >
> > > > > > > > > > +     /*
> > > > > > > > > > +      * FIXME: Cut over to (async) commit helpers inst=
ead of hand-rolling
> > > > > > > > > > +      * everything.
> > > > > > > > > > +      */
> > > > > > > > >
> > > > > > > > > Intel cursors can't even do async updates so this is rath=
er
> > > > > > > > > nonsensical. What we need is some kind of reasonable mail=
box
> > > > > > > > > support.
> > > > > > > >
> > > > > > > > This is not the async plane update you're thinking of. i915=
 really should
> > > > > > > > switch over more to atomic helpers.
> > > > > > >
> > > > > > > The comment should be clarified then. As is I have no real id=
ea
> > > > > > > what it's trying to say.
> > > > > >
> > > > > > Use drm_atomic_commit and only overwrite atomic_commit_tail.
> > > > >
> > > > > You mean drm_atomic_helper_commit() I suppose?
> > > > >
> > > > > > But I'm not
> > > > > > really clear why the comment isn't clear - i915 is the only dri=
ver not
> > > > > > using them, maybe should start to take a look when they're so u=
nfamiliar
> > > > > > :-P
> > > > >
> > > > > There are a lot of problems with that:
> > > > > - no uapi/hw state split so if there's anything that looks
> > > > >   at the state it's very likely going to get things wrong
> > > > > - it doesn't know anything about i915's own state objects
> > > > > - uses wrong workqueues
> > > > >
> > > > > Those are the ones that immediately came to mind when I looked
> > > > > at it. Probably I missed some others as well.
> > > >
> > > > Yeah and we could have fixed them in the shared code, and 5+ years =
ago I
> > > > even had patches, but i915 gem team had the idea they know better. =
That
> > > > part really needs to be fixed, and if that means redoing a bunch of
> > > > display work because display team didn't push back on gem team rein=
venting
> > > > all the wheels ... tough luck.
> > > >
> > > > I suggest you get started.
> > >
> > > I offered to do the hw/uapi split in the core. You refused it.
> >
> > That should work with with atomic_commit_tail too, or at least I'm not
> > seeing why not.
>
> I haven't gone through all of it to see how much it's poking inside
> the plane/crtc states and assuming the uapi state matches the hardware
> state. Maybe there is not much.
>
> >
> > > I raised my objection to the introduction of the single lock
> > > scheme for private state objects. No one was interested.
> >
> > Yeah add it to the list of things i915 reinvents I guess. And as long a=
s
> > you're out, you kinda don't get much of a vote. Which is why being out =
of
> > this isn't a bright idea.
>
> It was reinvented _after_ the locking change. We were using
> private objects before.

So the atomic state subclassing was deprecated in 2017 in the
kerneldoc and drivers started moving over to drm_private_state
(including i915):

commit da6c05969785a0f4108a089ef33c55f46ae21775
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu Dec 14 21:30:53 2017 +0100

   drm/atomic: document how to handle driver private objects

And I actually replied in that old thread from 2018 where the
drm_private_state locking was added and explained how to do read-only
state in drm_private_state, but you didn't follow up on that:

https://lore.kernel.org/dri-devel/20180306073709.GT22212@phenom.ffwll.local=
/

Other drivers have been using that approach without issue meanwhile.

There's also been a pile of discussions on #dri-devel irc since then
with more involved ideas, but for that entire time I have not heard a
single time again that this is causing issues for intel. Nor any kinds
of proposals how to fix it.

Instead you figured that's not for you and started moving i915 away
from drm_private_state. Without cc'ing dri-devel, without kicking off
the discussion again and maybe clarifying what the problem is exactly,
and without explaining in the commit message that you're moving away
from drm_private_state because of some locking issue in that thing
that you don't want to address on dri-devel.

At least if I got this all right and found the right commit:

commit fd1a9bba73fa10e1601a43264283fe4696d6f82c
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Date:   Mon Jan 20 19:47:25 2020 +0200

   drm/i915: Convert bandwidth state to global state

I'm probably way more pissed on this than what's appropriate, but I
just spend the last 3 years fixing up a giantic dumpster fire in the
i915-gem side, because a few people were way too keen on reinveinting
wheels in their little driver corner instead of working with dri-devel
to get it all sorted out.

Cheers, Daniel




> > > I don't think this situation is on me.
> >
> > These were your examples why you can't adopt the atomic commit helpers,
> > and aside from the workqueue one (where i915 really should not be the o=
nly
> > driver doing it differently, that makes no sense at all) they're not re=
al
> > reasons to not do this.
> >
> > The real reasons are
> > - cursor code not yet adopted async plane commit
>
> As long as people talk about async commits while apparently
> meaning something totally different it's hard to even be on
> the same page.
>
> > - i915_sw_fence
> > - ... including the boosting and everything else that i915 gem team han=
d
> >   rolled in there
> >
> > And those need to be fixed eventually. And this time around not by doin=
g
> > more i915 hand rolling of stuff.
> > -Daniel
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel



--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
