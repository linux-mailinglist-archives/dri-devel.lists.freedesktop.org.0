Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD371D5009
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 16:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250926ECAE;
	Fri, 15 May 2020 14:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1196E0D0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 14:10:21 +0000 (UTC)
IronPort-SDR: LD6A12L562l+6wVrmPag0o+aoLwW/ooIfPllYF+Vvnpg95B/Z2XdGsQvqB4Ysne0UlEh/M8Ytw
 4Oxs88HvfA8Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 07:10:21 -0700
IronPort-SDR: rHo7kUkDP8xk9AQBTT7ATI+cBCR+DYASP8NPXlUjN/TtThJcm3rq+/cX8X7BiFeyOCa39dBjeQ
 B+PxuaNYgGJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="372701733"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 15 May 2020 07:10:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 May 2020 17:10:18 +0300
Date: Fri, 15 May 2020 17:10:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: drm state readout helpers
Message-ID: <20200515141018.GK6112@intel.com>
References: <CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com>
 <20200515135153.GJ6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515135153.GJ6112@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 04:51:53PM +0300, Ville Syrj=E4l=E4 wrote:
> On Fri, May 15, 2020 at 03:36:13PM +0200, Daniel Vetter wrote:
> > Hi all,
> > =

> > Maxime seems to have a need for a bit more than what the current
> > drm_mode_config_reste can do, so here's a bunch of ideas inspired by
> > i915.
> > =

> > I think minimally what you need is a drm_atomic_state_helper_readout()
> > functions, which instead of resetting, allocates all the obj->state
> > pointers and fills them out. For that I think the simplest is to add
> > atomic_readout_state functions to crtc, connector and plane (if you
> > want to take over the firmware fb allocation too), which take as
> > parameter the object, and return the read-out state. Important, they
> > must _not_ touch anything persistent, otherwise the following stuff
> > here doesn't work.
> > =

> > Next up is the challenge of bridges and encoders. If the goal is to
> > properly shut down encoders/bridges, they also need their state. And
> > on most hw, they need a mix of the crtc and connector state, so best
> > to pass both of those (plus bridge state for bridges) to them. You can
> > do that if we assume that connector_helper_funcs->atomic_readout_state
> > sets the drm_connector_state->crtc pointer correctly. So the
> > drm_atomic_state_helper_readout function would first loop through
> > connectors and crtcs, and then loop through encoders and bridges to
> > fill in the gaps. Last you probably want to go through planes.
> > =

> > Now even more fun hw will have trouble and might need to look up
> > random other objects to set stuff, so we need a drm_atomic_state
> > structure to tie all these things together. For reasons that will
> > become obvious later on these read-out states should be stored in the
> > old_ state pointers.
> > =

> > Finally we need the actual helper which takes that read-out state and
> > smashes it into the real obj->state pointers, essentially a swap_state
> > but in reverse (since we need to write the old_ state pointers into
> > obj->state).
> > =

> > One thing i915 does, but I don't think is really needed: We read out
> > the connector->crtc routing as a first step, and once we have that, we
> > read out the connector/encoder/crtc steps. I think if you first read
> > out (and hence allocate) crtrc states, and then connector, and then
> > encoder/bridges that should work, and simplifies the flow a bit. So we
> > need another drm_atomic_state_helper_reset_to_readout or whatever,
> > which uses _readout and then does the reverse swap. Drivers call this
> > instead of drm_mode_config_reset.
> > =

> > Now the real issue: How do you make sure this actually works? Testing
> > with different fw configurations is usually impossible, you cant
> > easily tell the firmware to boot with different modes. Or at least
> > it's cumbersome since manual testing and lots of reboots. Waiting for
> > bug reports and then fixing them, while probably breaking something
> > else is a game of whack-a-mole.
> > =

> > So what i915 does is read out the hw state on every nonblocking
> > modeset (the additional time spent doesn't matter), but _only_ for the
> > objects touched in that modeset state. This is why you need to read
> > out into old_ state pointers, since after a blocking modeset those are
> > unused and available.
> =

> I have a feeling this old vs. new thing is still going to bite
> someone. But atm don't really have any sane alternative ideas.
> =

> Hmm, maybe we could at least tag the atomic_state as "readout only"
> for the duration of the actual readout and WARN/fail if anyone does
> drm_atomic_get_new_foo_state() and for_each_new/oldnew...() on it?

Oh, and I also had some fun with the readout overwriting
old_crtc_state->commit when I playing around with vblank workers.
I'm not even sure why that doesn't blow up currently as well. =


I think we should try to remove that confusing new_crtc_state->commit
vs. old_crtc_state->commit switcheroo. But I have a feeling that is
going to require quite a few changes since I guess it's the
old_crtc_state that currently gets plumbed into various places.

Another related annoyance is the old_foo_state->state vs.
new_foo_state->state which routinely trips up people with null ptr
derefs.

I guess trying to type up some cocci to plumb drm_atomic_state
everywhere might be a start...

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
