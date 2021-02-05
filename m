Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E6310DCF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 17:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5C56F48A;
	Fri,  5 Feb 2021 16:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AC56F48A;
 Fri,  5 Feb 2021 16:24:34 +0000 (UTC)
IronPort-SDR: DXAxoGgV2l5GiLH1dko6afEE6Pirg9D8bSH7VNIQkC73nCxfQWXoyHZ9455ivwZFBznq7PL5hh
 KPm+Ok5z07sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="266282902"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="266282902"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 08:24:14 -0800
IronPort-SDR: bI0nw/KwwUEF24qpnez7ITCL07rXAd7T8YWSNcXd0OVEcpDJU2PFU7+yA+gcMPQAfPoNxWyE7/
 Bwr2CZ1KkJrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="397538013"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 05 Feb 2021 08:24:09 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Feb 2021 18:24:08 +0200
Date: Fri, 5 Feb 2021 18:24:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vblank: Avoid storing a timestamp for the same frame
 twice
Message-ID: <YB1xKG317Zp7NogO@intel.com>
References: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
 <YBwTgHwZwMr8PwMr@phenom.ffwll.local> <YBwY8DZnrPNXYvfy@intel.com>
 <YB1oU6asAR3ki4ZT@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YB1oU6asAR3ki4ZT@phenom.ffwll.local>
X-Patchwork-Hint: comment
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 04:46:27PM +0100, Daniel Vetter wrote:
> On Thu, Feb 04, 2021 at 05:55:28PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Thu, Feb 04, 2021 at 04:32:16PM +0100, Daniel Vetter wrote:
> > > On Thu, Feb 04, 2021 at 04:04:00AM +0200, Ville Syrjala wrote:
> > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > =

> > > > drm_vblank_restore() exists because certain power saving states
> > > > can clobber the hardware frame counter. The way it does this is
> > > > by guesstimating how many frames were missed purely based on
> > > > the difference between the last stored timestamp vs. a newly
> > > > sampled timestamp.
> > > > =

> > > > If we should call this function before a full frame has
> > > > elapsed since we sampled the last timestamp we would end up
> > > > with a possibly slightly different timestamp value for the
> > > > same frame. Currently we will happily overwrite the already
> > > > stored timestamp for the frame with the new value. This
> > > > could cause userspace to observe two different timestamps
> > > > for the same frame (and the timestamp could even go
> > > > backwards depending on how much error we introduce when
> > > > correcting the timestamp based on the scanout position).
> > > > =

> > > > To avoid that let's not update the stored timestamp unless we're
> > > > also incrementing the sequence counter. We do still want to update
> > > > vblank->last with the freshly sampled hw frame counter value so
> > > > that subsequent vblank irqs/queries can actually use the hw frame
> > > > counter to determine how many frames have elapsed.
> > > =

> > > Hm I'm not getting the reason for why we store the updated hw vblank
> > > counter?
> > =

> > Because next time a vblank irq happens the code will do:
> > diff =3D current_hw_counter - vblank->last
> > =

> > which won't work very well if vblank->last is garbage.
> > =

> > Updating vblank->last is pretty much why drm_vblank_restore()
> > exists at all.
> =

> Oh sure, _restore has to update this, together with the timestamp.
> =

> But your code adds such an update where we update the hw vblank counter,
> but not the timestamp, and that feels buggy. Either we're still in the
> same frame, and then we should story nothing. Or we advanced, and then we
> probably want a new timestampt for that frame too.

Even if we're still in the same frame the hw frame counter may already
have been reset due to the power well having been turned off. That is
what I'm trying to fix here.

Now I suppose that's fairly unlikely, at least with PSR which probably
does impose some extra delays before the power gets yanked. But at least
theoretically possible.

> =

> Advancing the vblank counter and not advancing the timestamp sounds like a
> bug in our code.

We're not advancing the vblank counter. We're storing a new
timestamp for a vblank counter value which already had a timestamp.

> =

> > > There's definitely a race when we grab the hw timestamp at a bad time
> > > (which can't happen for the irq handler, realistically), so maybe we
> > > should first adjust that to make sure we never store anything inconsi=
stent
> > > in the vblank state?
> > =

> > Not sure what race you mean, or what inconsistent thing we store?
> =

> For the drm_handle_vblank code we have some fudge so we don't compute
> something silly when the irq fires (like it often does) before
> top-of-frame. Ofc that fudge is inheritedly racy, if the irq is extremely
> delay (almost an entire frame) we'll get it wrong.

Sorry, still no idea what fudge you mean.

> =

> In practice it doesn't matter.
> =

> Now _restore can be called anytime, so we might end up in situations where
> the exact point where we jump to the next frame count, and the exact time
> where the hw counter jumps, don't lign up. And I think in that case funny
> things can happen, and I'm not sure your approach of "update hw counter
> but don't update timestamp" is the right way.
> =

> I think if we instead ignore any update if our fudge-corrected timestamp
> is roughly the same, then we handle that race correctly and there's no
> jumping around.

We can't just not update vblank->last, assuming the theory holds
that the power well may turn off even if the last vblank timestamp
was sampled less than a full frame ago.

That will cause the next diff=3Dcurrent_hw_counter-vblank->last to
generate total garbage and then the vblank seq number will jump
to some random value. Which is exactly the main problem
drm_vblank_restore() is trying to prevent.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
