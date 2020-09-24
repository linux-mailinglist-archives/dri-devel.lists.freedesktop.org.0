Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F80276F38
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C230A6E1F3;
	Thu, 24 Sep 2020 11:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5126E1BA;
 Thu, 24 Sep 2020 11:01:40 +0000 (UTC)
IronPort-SDR: 2R1QqWiEJIncFhKiuYIDHk8uVWE5c+wzY45dqUIsznQkHIzxXp90qcAwaAzSI+ImNRCDfvsNXi
 5tVWqeQ8WtaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="141184569"
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="141184569"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 04:01:39 -0700
IronPort-SDR: 40EV3xhybvGzIHYU0Ng65UYYdevJxB6Nm9nsV6TLE66lpxB2vm8MS9OF27Da5/3Zf+LDoSpDK/
 PruilT+9+Sjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="349219856"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 24 Sep 2020 04:01:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 24 Sep 2020 14:01:35 +0300
Date: Thu, 24 Sep 2020 14:01:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm/atomic: document and enforce rules around "spurious"
 EBUSY
Message-ID: <20200924110135.GJ6112@intel.com>
References: <20200923105737.2943649-1-daniel.vetter@ffwll.ch>
 <20200923151852.2952812-1-daniel.vetter@ffwll.ch>
 <20200923191724.GA62596@xpredator>
 <CAKMK7uH0WiEPP1H1DZPdE4mJdStTTtnZJQN5rjnkG_6va_1Tdg@mail.gmail.com>
 <20200924104101.63be1c13@eldfell>
 <CAKMK7uHwU0r7Z699qw3Y2HPuvzL3-B12fw3gDbdrxOX1V6iK2w@mail.gmail.com>
 <20200924131056.54beb12e@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924131056.54beb12e@eldfell>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 01:10:56PM +0300, Pekka Paalanen wrote:
> On Thu, 24 Sep 2020 10:04:12 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> =

> > On Thu, Sep 24, 2020 at 9:41 AM Pekka Paalanen <ppaalanen@gmail.com> wr=
ote:
> > >
> > > On Wed, 23 Sep 2020 22:01:25 +0200
> > > Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >  =

> > > > On Wed, Sep 23, 2020 at 9:17 PM Marius Vlad <marius.vlad@collabora.=
com> wrote:  =

> > > > >
> > > > > On Wed, Sep 23, 2020 at 05:18:52PM +0200, Daniel Vetter wrote:  =

> > > > > > When doing an atomic modeset with ALLOW_MODESET drivers are all=
owed to
> > > > > > pull in arbitrary other resources, including CRTCs (e.g. when
> > > > > > reconfiguring global resources).  =

> > >
> > > ...
> > >  =

> > > > > > @@ -1313,6 +1322,26 @@ int drm_atomic_check_only(struct drm_ato=
mic_state *state)
> > > > > >               }
> > > > > >       }
> > > > > >
> > > > > > +     for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> > > > > > +             affected_crtc |=3D drm_crtc_mask(crtc);
> > > > > > +
> > > > > > +     /*
> > > > > > +      * For commits that allow modesets drivers can add other =
CRTCs to the
> > > > > > +      * atomic commit, e.g. when they need to reallocate globa=
l resources.
> > > > > > +      * This can cause spurious EBUSY, which robs compositors =
of a very
> > > > > > +      * effective sanity check for their drawing loop. Therefo=
r only allow
> > > > > > +      * drivers to add unrelated CRTC states for modeset commi=
ts.
> > > > > > +      *
> > > > > > +      * FIXME: Should add affected_crtc mask to the ATOMIC IOC=
TL as an output
> > > > > > +      * so compositors know what's going on.
> > > > > > +      */
> > > > > > +     if (affected_crtc !=3D requested_crtc) {
> > > > > > +             DRM_DEBUG_ATOMIC("driver added CRTC to commit: re=
quested 0x%x, affected 0x%0x\n",
> > > > > > +                              requested_crtc, affected_crtc);
> > > > > > +             WARN(!state->allow_modeset, "adding CRTC not allo=
wed without modesets: requested 0x%x, affected 0x%0x\n",
> > > > > > +                  requested_crtc, affected_crtc);  =

> > > > > Previous patch had the warn on state->allow_modeset now is
> > > > > !state->allow_modeset. Is that correct?  =

> > > >
> > > > We need to fire a warning when allow_modeset is _not_ set. An earli=
er
> > > > version got that wrong, and yes that would have caused a _ton_ of
> > > > warnings on any fairly new intel platform.
> > > >  =

> > > > > I haven't followed the entire thread on this matter, but I guess =
the idea
> > > > > is that somehow the kernel would pass to userspace a CRTC mask of
> > > > > affected_crtc (somehow, we don't know how atm) and with it, users=
pace
> > > > > can then issue a new commit (this commit blocking) with those?  =

> > > >
> > > > Either that, or just use that to track all the in-flight drm events.
> > > > Userspace will get events for all the crtc, not just the one it ask=
ed
> > > > to update.  =

> > >
> > > Wait, does that happen already? Getting CRTC events for CRTCs userspa=
ce
> > > didn't include in the atomic commit?  =

> > =

> > Yeah I'm pretty sure. With the affected_crtc mask you could update
> > your internal book-keeping to catch these, which should also prevent
> > all the spurious EBUSY. But I'm not entirely sure, I just read the
> > code, haven't tested.
> =

> If that actually happens, how does userspace know whether the
> userdata argument with the event is valid or not?

At some point I was worried about the kernel potentially sending spurious
events, but IIRC I managed to convince myself that it shouldn't happen.
I think I came to the conclusion the events were populated before the
core calls into the driver. But maybe I misanalyzed it, or something
has since broken?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
