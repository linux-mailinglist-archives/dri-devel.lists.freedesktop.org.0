Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6105B168589
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 18:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1BF6E44E;
	Fri, 21 Feb 2020 17:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111066E44E;
 Fri, 21 Feb 2020 17:49:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 09:49:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,469,1574150400"; d="scan'208";a="225284790"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 21 Feb 2020 09:49:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 21 Feb 2020 19:49:34 +0200
Date: Fri, 21 Feb 2020 19:49:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 00/12] drm: Put drm_display_mode on diet
Message-ID: <20200221174934.GT13686@intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <CACvgo50pCb4OafEs9tLm7YEPqHc+BtDAvagRnwjXtZeQDNwUwg@mail.gmail.com>
 <20200220142759.GA13686@intel.com>
 <20200220153426.GC13686@intel.com> <871rqoyy42.fsf@intel.com>
 <20200221114309.GM13686@intel.com>
 <CAKMK7uGTpEHuBA09FuUA5ihPLtw7s+6=YBfQ2A4i=8Q-4SsRjA@mail.gmail.com>
 <20200221154031.GQ13686@intel.com>
 <20200221160904.GS13686@intel.com>
 <20200221171657.GE2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221171657.GE2363188@phenom.ffwll.local>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 06:16:57PM +0100, Daniel Vetter wrote:
> On Fri, Feb 21, 2020 at 06:09:04PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Fri, Feb 21, 2020 at 05:40:31PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Fri, Feb 21, 2020 at 03:42:56PM +0100, Daniel Vetter wrote:
> > > > On Fri, Feb 21, 2020 at 12:43 PM Ville Syrj=E4l=E4
> > > > <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > On Fri, Feb 21, 2020 at 01:32:29PM +0200, Jani Nikula wrote:
> > > > > > On Thu, 20 Feb 2020, Ville Syrj=E4l=E4 <ville.syrjala@linux.int=
el.com> wrote:
> > > > > > > Looks like getting rid of private_flags is going to be pretty
> > > > > > > straightforward. I'll post patches for that once this first s=
eries
> > > > > > > lands.
> > > > > >
> > > > > > Going all in on crtc state? I suppose migrating away from priva=
te_flags
> > > > > > could easily start in i915 before that. Seems rather independen=
t.
> > > > > >
> > > > > > I guess it's __intel_get_crtc_scanline() and:
> > > > > >
> > > > > >       vblank =3D &crtc->base.dev->vblank[drm_crtc_index(&crtc->=
base)];
> > > > > >       mode =3D &vblank->hwmode;
> > > > > >
> > > > > >       if (mode->private_flags & I915_MODE_FLAG_GET_SCANLINE_FRO=
M_TIMESTAMP)
> > > > > >
> > > > > > that gives me the creeps in reviewing all that.
> > > > > >
> > > > > > There's also [1] adding new uses for private_flags; I think the=
re were
> > > > > > issues in getting at the right crtc state on some of those path=
s, but I
> > > > > > forget the exact details. Ideas?
> > > > >
> > > > > I'm just going to move them to the crtc_state and put a copy into=
 the
> > > > > crtc itself for the vblank code. Pretty much a 1:1 replacement.
> > > > > Saves me from having to think ;)
> > > > =

> > > > I've looked through the patches, and didn't spot any place where we
> > > > couldn't just get at the full crtc state. Might need some crtc->sta=
te
> > > > dereferencing and upcasting and making sure stuff is ordered correc=
tly
> > > > with enable/disable paths of crtc, but nothing to jump over.
> > > =

> > > swap_state() could easily race with the irq handler. I guess
> > > practically unlikely the old crtc state would disappear before
> > > the irq handler is done, but still seems somewhat dubious.
> > =

> > And I guess the bigger problem is that swap_state() happens way too
> > early. So crtc->state would be pointing to bogus stuff while we're
> > disabling the crtc.
> =

> Uh, so we're essentially piggy-packing some random i915 state on top of
> the hw timing stuff the vblank handler does, and hope that this is
> race-free enough to not matter?
> =

> I think the right solution there would be to have a proper
> spinlock_irqsafe for this stuff that the dsi TE handler needs, and through
> that make sure that we're actually not going boom. At least it looked like
> there's also irq handling bits outside of the vblank code, so the vblank
> locking is not going to safe the day.

I haven't actually looked at the DSI TE stuff so far, so no
idea what's going on there.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
