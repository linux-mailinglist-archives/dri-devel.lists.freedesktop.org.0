Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FA11A23B5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 16:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC5B6EA6B;
	Wed,  8 Apr 2020 14:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC876E11A;
 Wed,  8 Apr 2020 14:03:31 +0000 (UTC)
IronPort-SDR: 3LSL3uViEFDDOaU8gXTUKZ2XhvCrDL9x5ZHuJgDll7pYC0kYjJCYQ4Tjpl30eF3QPJgK4Ljmek
 R8e5r1/2BtkA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 07:03:31 -0700
IronPort-SDR: 1LEUTT39CP391chqslTbrXClR/XQZlsqITEzl4rKJbGdVV2aO0ZwfoMsGaeCLmdJSC3/Zu/rFq
 KSKCMCESb3mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,358,1580803200"; d="scan'208";a="254808508"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 08 Apr 2020 07:03:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 Apr 2020 17:03:27 +0300
Date: Wed, 8 Apr 2020 17:03:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH] drm: avoid spurious EBUSY due to nonblocking
 atomic modesets
Message-ID: <20200408140327.GT6112@intel.com>
References: <20200225115024.2386811-1-daniel.vetter@ffwll.ch>
 <20200225144814.GC13686@intel.com>
 <CAKMK7uFKJd1G8qT2Kup8nOfp22V7eQmDZC=6bdU=UEpqO7K3QQ@mail.gmail.com>
 <20200225153400.GE13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225153400.GE13686@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Stone <daniels@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 05:34:00PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Feb 25, 2020 at 04:09:26PM +0100, Daniel Vetter wrote:
> > On Tue, Feb 25, 2020 at 3:48 PM Ville Syrj=E4l=E4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Tue, Feb 25, 2020 at 12:50:24PM +0100, Daniel Vetter wrote:
> > > > When doing an atomic modeset with ALLOW_MODESET drivers are allowed=
 to
> > > > pull in arbitrary other resources, including CRTCs (e.g. when
> > > > reconfiguring global resources).
> > > >
> > > > But in nonblocking mode userspace has then no idea this happened,
> > > > which can lead to spurious EBUSY calls, both:
> > > > - when that other CRTC is currently busy doing a page_flip the
> > > >   ALLOW_MODESET commit can fail with an EBUSY
> > > > - on the other CRTC a normal atomic flip can fail with EBUSY because
> > > >   of the additional commit inserted by the kernel without userspace=
's
> > > >   knowledge
> > > >
> > > > For blocking commits this isn't a problem, because everyone else wi=
ll
> > > > just block until all the CRTC are reconfigured. Only thing userspace
> > > > can notice is the dropped frames without any reason for why frames =
got
> > > > dropped.
> > > >
> > > > Consensus is that we need new uapi to handle this properly, but no =
one
> > > > has any idea what exactly the new uapi should look like. As a stop-=
gap
> > > > plug this problem by demoting nonblocking commits which might cause
> > > > issues by including CRTCs not in the original request to blocking
> > > > commits.
> > > >
> > > > v2: Add comments and a WARN_ON to enforce this only when allowed - =
we
> > > > don't want to silently convert page flips into blocking plane updat=
es
> > > > just because the driver is buggy.
> > > >
> > > > v3: Fix inverted WARN_ON (Pekka).
> > > >
> > > > References: https://lists.freedesktop.org/archives/dri-devel/2018-J=
uly/182281.html
> > > > Bugzilla: https://gitlab.freedesktop.org/wayland/weston/issues/24#n=
ote_9568
> > > > Cc: Daniel Stone <daniel@fooishbar.org>
> > > > Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> > > > Cc: stable@vger.kernel.org
> > > > Reviewed-by: Daniel Stone <daniels@collabora.com>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_atomic.c | 34 +++++++++++++++++++++++++++++++-=
--
> > > >  1 file changed, 31 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_ato=
mic.c
> > > > index 9ccfbf213d72..4c035abf98b8 100644
> > > > --- a/drivers/gpu/drm/drm_atomic.c
> > > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > > @@ -1362,15 +1362,43 @@ EXPORT_SYMBOL(drm_atomic_commit);
> > > >  int drm_atomic_nonblocking_commit(struct drm_atomic_state *state)
> > > >  {
> > > >       struct drm_mode_config *config =3D &state->dev->mode_config;
> > > > -     int ret;
> > > > +     unsigned requested_crtc =3D 0;
> > > > +     unsigned affected_crtc =3D 0;
> > > > +     struct drm_crtc *crtc;
> > > > +     struct drm_crtc_state *crtc_state;
> > > > +     bool nonblocking =3D true;
> > > > +     int ret, i;
> > > > +
> > > > +     /*
> > > > +      * For commits that allow modesets drivers can add other CRTC=
s to the
> > > > +      * atomic commit, e.g. when they need to reallocate global re=
sources.
> > > > +      *
> > > > +      * But when userspace also requests a nonblocking commit then=
 userspace
> > > > +      * cannot know that the commit affects other CRTCs, which can=
 result in
> > > > +      * spurious EBUSY failures. Until we have better uapi plug th=
is by
> > > > +      * demoting such commits to blocking mode.
> > > > +      */
> > > > +     for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> > > > +             requested_crtc |=3D drm_crtc_mask(crtc);
> > > >
> > > >       ret =3D drm_atomic_check_only(state);
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > -     DRM_DEBUG_ATOMIC("committing %p nonblocking\n", state);
> > > > +     for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> > > > +             affected_crtc |=3D drm_crtc_mask(crtc);
> > > > +
> > > > +     if (affected_crtc !=3D requested_crtc) {
> > > > +             /* adding other CRTC is only allowed for modeset comm=
its */
> > > > +             WARN_ON(!state->allow_modeset);
> > >
> > > Not sure that's really true. What if the driver needs to eg.
> > > redistribute FIFO space or something between the pipes? Or do we
> > > expect drivers to now examine state->allow_modeset to figure out
> > > if they're allowed to do certain things?
> > =

> > Maybe we need more fine-grained flags here, but adding other states
> > (and blocking a commit flow) is exactly the uapi headaches this patch
> > tries to solve here. So if our driver currently adds crtc states to
> > reallocate fifo between pipes for an atomic flip then yes we're
> > breaking userspace. Well, everyone figured out by now that you get
> > random EBUSY and dropped frames for no apparent reason at all, and
> > work around it. But happy, they are not.
> =

> I don't think we do this currently for the FIFO, but in theory we
> could.
> =

> The one thing we might do currently is cdclk reprogramming, but that
> can only happen without a full modeset when there's only a single
> active pipe. So we shouldn't hit this right now. But that restriction
> is going to disappear in the future, at which point we may want to
> do this even with multiple active pipes.

Looks like we're hitting something like this on some CI systems.
After a bit of pondering I guess we could fix that by not sending
out any flips events until all crtcs have finished the commit. Not
a full solution though as it can't help if there are multiple threads
trying to commit independently on different CRTC and one thread
happens to need a full modeset on all CRTCs. But seems like it
should solve the the single threaded CI fails we're seeing.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
