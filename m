Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8A313A44
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 17:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7AB6E955;
	Mon,  8 Feb 2021 16:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED9B6E955;
 Mon,  8 Feb 2021 16:58:37 +0000 (UTC)
IronPort-SDR: 0Y/5p9JycVDYDNpiGYAb61t85SfmV5UEaeVKMnt/hUraQ/fPTI/KIqCwOKxXJ8tAhPzHcaD1cI
 +oog8YuTuxKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="169425709"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="169425709"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 08:58:36 -0800
IronPort-SDR: ZBnm6ZeM+ik0nMiuYMus6M1YpVOjxbfwEv2lM9MFWY60CMgW6fW6cnYpIxLTC2n/T76vrdDxDT
 v1fbGccwoThA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="377840665"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 08 Feb 2021 08:58:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Feb 2021 18:58:33 +0200
Date: Mon, 8 Feb 2021 18:58:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vblank: Avoid storing a timestamp for the same frame
 twice
Message-ID: <YCFtuRvpm8OpmdR4@intel.com>
References: <20210204020400.29628-1-ville.syrjala@linux.intel.com>
 <YBwTgHwZwMr8PwMr@phenom.ffwll.local> <YBwY8DZnrPNXYvfy@intel.com>
 <YB1oU6asAR3ki4ZT@phenom.ffwll.local> <YB1xKG317Zp7NogO@intel.com>
 <YB22V+n2bdIWrH2m@intel.com> <YCEK1AWP5DarlMIt@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCEK1AWP5DarlMIt@phenom.ffwll.local>
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

On Mon, Feb 08, 2021 at 10:56:36AM +0100, Daniel Vetter wrote:
> On Fri, Feb 05, 2021 at 11:19:19PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Fri, Feb 05, 2021 at 06:24:08PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Fri, Feb 05, 2021 at 04:46:27PM +0100, Daniel Vetter wrote:
> > > > On Thu, Feb 04, 2021 at 05:55:28PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > > On Thu, Feb 04, 2021 at 04:32:16PM +0100, Daniel Vetter wrote:
> > > > > > On Thu, Feb 04, 2021 at 04:04:00AM +0200, Ville Syrjala wrote:
> > > > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > > > =

> > > > > > > drm_vblank_restore() exists because certain power saving stat=
es
> > > > > > > can clobber the hardware frame counter. The way it does this =
is
> > > > > > > by guesstimating how many frames were missed purely based on
> > > > > > > the difference between the last stored timestamp vs. a newly
> > > > > > > sampled timestamp.
> > > > > > > =

> > > > > > > If we should call this function before a full frame has
> > > > > > > elapsed since we sampled the last timestamp we would end up
> > > > > > > with a possibly slightly different timestamp value for the
> > > > > > > same frame. Currently we will happily overwrite the already
> > > > > > > stored timestamp for the frame with the new value. This
> > > > > > > could cause userspace to observe two different timestamps
> > > > > > > for the same frame (and the timestamp could even go
> > > > > > > backwards depending on how much error we introduce when
> > > > > > > correcting the timestamp based on the scanout position).
> > > > > > > =

> > > > > > > To avoid that let's not update the stored timestamp unless we=
're
> > > > > > > also incrementing the sequence counter. We do still want to u=
pdate
> > > > > > > vblank->last with the freshly sampled hw frame counter value =
so
> > > > > > > that subsequent vblank irqs/queries can actually use the hw f=
rame
> > > > > > > counter to determine how many frames have elapsed.
> > > > > > =

> > > > > > Hm I'm not getting the reason for why we store the updated hw v=
blank
> > > > > > counter?
> > > > > =

> > > > > Because next time a vblank irq happens the code will do:
> > > > > diff =3D current_hw_counter - vblank->last
> > > > > =

> > > > > which won't work very well if vblank->last is garbage.
> > > > > =

> > > > > Updating vblank->last is pretty much why drm_vblank_restore()
> > > > > exists at all.
> > > > =

> > > > Oh sure, _restore has to update this, together with the timestamp.
> > > > =

> > > > But your code adds such an update where we update the hw vblank cou=
nter,
> > > > but not the timestamp, and that feels buggy. Either we're still in =
the
> > > > same frame, and then we should story nothing. Or we advanced, and t=
hen we
> > > > probably want a new timestampt for that frame too.
> > > =

> > > Even if we're still in the same frame the hw frame counter may already
> > > have been reset due to the power well having been turned off. That is
> > > what I'm trying to fix here.
> > > =

> > > Now I suppose that's fairly unlikely, at least with PSR which probably
> > > does impose some extra delays before the power gets yanked. But at le=
ast
> > > theoretically possible.
> > =

> > Pondering about this a bit further. I think the fact that the current
> > code takes the round-to-closest approach I used for the vblank handler
> > is perhaps a bit bad. It could push the seq counter forward if we're
> > past the halfway point of a frame. I think that rounding behaviour
> > makes sense for the irq since those tick steadily and so allowing a bit
> > of error either way seems correct to me. Perhaps round-down might be
> > the better option for _restore(). Not quites sure, need more thinking
> > probably.
> =

> Yes this is the rounding I'm worried about.

Actually I don't think this is really an issue since we are working =

with the corrected timestamps here. Those always line up with
frames, so unless the correction is really buggy or the hw somehow
skips a partial frame it should work rather well. At least when
operating with small timescales. For large gaps the error might
creep up, but I don't think a small error in the predicted seq
number over a long timespan is really a problem.

> =

> But your point above that the hw might reset the counter again is also
> valid. I'm assuming what you're worried about is that we first do a
> _restore (and the hw vblank counter hasn't been trashed yet), and then in
> the same frame we do another restore, but now the hw frame counter has
> been trashe, and we need to update it?

Yeah, although the pre-trashing _restore could also just be
a vblank irq I think.

> =

> > Another idea that came to me now is that maybe we should actually just
> > check if the current hw frame counter value looks sane, as in something
> > like:
> > =

> > diff_hw_counter =3D current_hw_counter-stored_hw_counter
> > diff_ts =3D (current_ts-stored_ts)/framedur
> > =

> > if (diff_hw_counter ~=3D diff_ts)
> > 	diff =3D diff_hw_counter;
> > else
> > 	diff =3D diff_ts;
> > =

> > and if they seem to match then just keep trusting the hw counter.
> > So only if there's a significant difference would we disregard
> > the diff of the hw counter and instead use the diff based on the
> > timestamps. Not sure what "significant" is though; One frame, two
> > frames?
> =

> Hm, another idea: The only point where we can trust the entire hw counter
> + timestamp sampling is when the irq happens. Because then we know the
> driver will have properly corrected for any hw oddities (like hw counter
> flipping not at top-of-frame, like the core expects).

i915 at least gives out correct data regardless of when you sample
it. Well, except for the cases where the hw counter gets trashed,
in which case the hw counter is garbage (when compared with .last)
but the timestamp is still correct.

> =

> So what if _restore always goes back to the last such trusted hw counter
> for computing the frame counter diff and all that stuff? That way if we
> have a bunch of _restore with incosisten hw vblank counter, we will a)
> only take the last one (fixes the bug you're trying to fix) b) still use
> the same last trusted baseline for computations (addresses the race I'm
> seeing).
> =

> Or does this not work?

I don't think I really understand what you're suggesting here.
_restore is already using the last trusted data (the stored
timestamp + .last).

So the one thing _restore will have to update is .last.
I think it can either do what it does now and set .last
to the current hw counter value + update the timestamp
to match, or it could perhaps adjust the stored .last
such that the already stored timestamp and the updated
.last match up. But I think both of those options have
the same level or inaccuracy since both would still do
the same ts_diff->hw_counter_diff prediction. =


> =

> It does complicate the code a bit, because we'd need to store the
> count/timestamp information from _restore outside of the usual vblank ts
> array. But I think that addresses everything.

Hmm. So restore would store this extra information
somewhere else, and not update the normal stuff at all?
What exactly would we do with that extra data?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
