Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E352A175F
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 13:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBE76E0F3;
	Sat, 31 Oct 2020 12:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BFA6E0F3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 12:35:53 +0000 (UTC)
IronPort-SDR: b7rHFIKB21aSjh+m8bHnGaqY3zsTvZqwCZBrQLxLAI9jNCypkA62q1KQ8OLSh3ft16j0yuPN9C
 U7l+hjJ23x+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="156499413"
X-IronPort-AV: E=Sophos;i="5.77,437,1596524400"; d="scan'208";a="156499413"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 05:35:53 -0700
IronPort-SDR: IT+Tw1ZWd5IX9f6r3kILd6qGQyD9Dey879AobVoXqTdSAQbpypznwpwZTsGIa5Z6Jx6CU44SrP
 +j2qKUN/cAvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,437,1596524400"; d="scan'208";a="351530079"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 31 Oct 2020 05:35:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 31 Oct 2020 14:35:49 +0200
Date: Sat, 31 Oct 2020 14:35:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/2] drm/atomic: Pass the full state to CRTC atomic begin
 and flush
Message-ID: <20201031123549.GM6112@intel.com>
References: <20201028123222.1732139-1-maxime@cerno.tech>
 <20201028123222.1732139-2-maxime@cerno.tech>
 <20201029135537.GB6112@intel.com>
 <20201031095905.lr6jat6jasxasuhq@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201031095905.lr6jat6jasxasuhq@gilmour.lan>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 31, 2020 at 10:59:05AM +0100, Maxime Ripard wrote:
> On Thu, Oct 29, 2020 at 03:55:37PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Wed, Oct 28, 2020 at 01:32:22PM +0100, Maxime Ripard wrote:
> > > The current atomic helpers have either their object state being passe=
d as
> > > an argument or the full atomic state.
> > > =

> > > The former is the pattern that was done at first, before switching to=
 the
> > > latter for new hooks or when it was needed.
> > > =

> > > Let's start convert all the remaining helpers to provide a consistent
> > > interface, starting with the CRTC's atomic_begin and atomic_flush.
> > > =

> > > The conversion was done using the coccinelle script below, built test=
ed on
> > > all the drivers and actually tested on vc4.
> > > =

> > <snip>
> > > @@ -323,26 +323,27 @@ static void ingenic_drm_crtc_atomic_begin(struc=
t drm_crtc *crtc,
> > >  }
> > >  =

> > >  static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > > -					  struct drm_crtc_state *oldstate)
> > > +					  struct drm_atomic_state *state)
> > >  {
> > >  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> > > -	struct drm_crtc_state *state =3D crtc->state;
> > > -	struct drm_pending_vblank_event *event =3D state->event;
> > > +	struct drm_crtc_state *crtc_state =3D crtc->state;
> > =

> > Looks like quite a few places could use a followup to
> > switch to get_{old,new}_crtc_state().
> =

> That one is not entirely clear to me. crtc->state is documented as the
> current CRTC state, but in atomic_begin / atomic_flush, does that mean
> that it's the old state that we're going to replace, or the new state
> that is going to replace the current state?

That depends on whether it's being used before or after the
swap_state(). Before swap_state() foo->state is the old state,
after swap_state() foo->state is the new state.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
