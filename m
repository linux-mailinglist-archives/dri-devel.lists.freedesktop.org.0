Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA01D4F8D
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 15:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9986ECA5;
	Fri, 15 May 2020 13:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C7E6ECA6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 13:51:58 +0000 (UTC)
IronPort-SDR: 54zm8HGqVWpSCCQ/wOtORsVP6TxXYdFxQKFur5fHYAy88PFWlmlQ09yfdlW37mJw1Fr2D1XfjW
 lGEW5orr73Eg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 06:51:56 -0700
IronPort-SDR: Pqnag+GLpsTSplStszfJiTTywO41PYk0+fwhCrQNILmWMY1rOGhobRHfizUtQ9qTMuYij90ia2
 cY8ntNDwtrow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="252038075"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 15 May 2020 06:51:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 May 2020 16:51:53 +0300
Date: Fri, 15 May 2020 16:51:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: drm state readout helpers
Message-ID: <20200515135153.GJ6112@intel.com>
References: <CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com>
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

On Fri, May 15, 2020 at 03:36:13PM +0200, Daniel Vetter wrote:
> Hi all,
> =

> Maxime seems to have a need for a bit more than what the current
> drm_mode_config_reste can do, so here's a bunch of ideas inspired by
> i915.
> =

> I think minimally what you need is a drm_atomic_state_helper_readout()
> functions, which instead of resetting, allocates all the obj->state
> pointers and fills them out. For that I think the simplest is to add
> atomic_readout_state functions to crtc, connector and plane (if you
> want to take over the firmware fb allocation too), which take as
> parameter the object, and return the read-out state. Important, they
> must _not_ touch anything persistent, otherwise the following stuff
> here doesn't work.
> =

> Next up is the challenge of bridges and encoders. If the goal is to
> properly shut down encoders/bridges, they also need their state. And
> on most hw, they need a mix of the crtc and connector state, so best
> to pass both of those (plus bridge state for bridges) to them. You can
> do that if we assume that connector_helper_funcs->atomic_readout_state
> sets the drm_connector_state->crtc pointer correctly. So the
> drm_atomic_state_helper_readout function would first loop through
> connectors and crtcs, and then loop through encoders and bridges to
> fill in the gaps. Last you probably want to go through planes.
> =

> Now even more fun hw will have trouble and might need to look up
> random other objects to set stuff, so we need a drm_atomic_state
> structure to tie all these things together. For reasons that will
> become obvious later on these read-out states should be stored in the
> old_ state pointers.
> =

> Finally we need the actual helper which takes that read-out state and
> smashes it into the real obj->state pointers, essentially a swap_state
> but in reverse (since we need to write the old_ state pointers into
> obj->state).
> =

> One thing i915 does, but I don't think is really needed: We read out
> the connector->crtc routing as a first step, and once we have that, we
> read out the connector/encoder/crtc steps. I think if you first read
> out (and hence allocate) crtrc states, and then connector, and then
> encoder/bridges that should work, and simplifies the flow a bit. So we
> need another drm_atomic_state_helper_reset_to_readout or whatever,
> which uses _readout and then does the reverse swap. Drivers call this
> instead of drm_mode_config_reset.
> =

> Now the real issue: How do you make sure this actually works? Testing
> with different fw configurations is usually impossible, you cant
> easily tell the firmware to boot with different modes. Or at least
> it's cumbersome since manual testing and lots of reboots. Waiting for
> bug reports and then fixing them, while probably breaking something
> else is a game of whack-a-mole.
> =

> So what i915 does is read out the hw state on every nonblocking
> modeset (the additional time spent doesn't matter), but _only_ for the
> objects touched in that modeset state. This is why you need to read
> out into old_ state pointers, since after a blocking modeset those are
> unused and available.

I have a feeling this old vs. new thing is still going to bite
someone. But atm don't really have any sane alternative ideas.

Hmm, maybe we could at least tag the atomic_state as "readout only"
for the duration of the actual readout and WARN/fail if anyone does
drm_atomic_get_new_foo_state() and for_each_new/oldnew...() on it?

> Next item is to add a  atomic_compare_state
> function to crtc/connector&plane and maybe bridges (i.e. all objects
> with state), which compares 2 state objects for equality. This needs
> to be a driver callback since each driver will only read out the state
> relevant from take-over from fw, not every possible feature, so
> there's lots you need to ignore. If any of these functions note a
> mismatch you splat with a warning and dump both the old and new states
> with the atomic_print driver hooks. I915 uses some #define so that
> these comparisons are one-liners (see PIPE_CONFIG_CHECK_X/I and so on,
> maybe we should have a few default ones with proper atomic naming, the
> names date back to the first somewhat-atomic modeset flow in i915).
> =

> So for validation we need a drm_atomic_state_helper_check which uses
> _readout, and then the compare functions plus debug printouts if it
> goes wrong. I'd wire that directly into the default
> drm_atomic_helper_commit function.
> =

> With these pieces you should have a state readout code that actually
> tends to work, and you can even test it (simply by doing a bunch of
> modesets). In i915 we have the _check code running unconditionally,
> blocking modesets are slow enough that it really doesn't matter.
> =

> One more thing on the implementation: Since this is all helpers all
> the hooks should probably be in the respective helper function tables.
> =

> Cheers, Daniel
> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
