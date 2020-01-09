Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1C136024
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 19:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41426E948;
	Thu,  9 Jan 2020 18:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6876E948;
 Thu,  9 Jan 2020 18:24:14 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 10:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="303944265"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 09 Jan 2020 10:24:09 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Jan 2020 20:24:08 +0200
Date: Thu, 9 Jan 2020 20:24:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Add current maximum eDP link rate to
 sink_rate array.
Message-ID: <20200109182408.GF13686@intel.com>
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <20200109152656.GP1208@intel.com> <20200109153815.GQ1208@intel.com>
 <CAEsyxyj6xbHrkKk5=bG5APrD5VW_PP-Cs+nT0vqCjW_LBSG29A@mail.gmail.com>
 <20200109164715.GD13686@intel.com>
 <CAEsyxyhjbP6ADutU7XRJUjryj1+X8mFqopB9TvBoW6RWjBihww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEsyxyhjbP6ADutU7XRJUjryj1+X8mFqopB9TvBoW6RWjBihww@mail.gmail.com>
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
Cc: mario.kleiner.de@gmail.de, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 09, 2020 at 06:57:14PM +0100, Mario Kleiner wrote:
> On Thu, Jan 9, 2020 at 5:47 PM Ville Syrj=E4l=E4 <ville.syrjala@linux.int=
el.com>
> wrote:
> =

> > On Thu, Jan 09, 2020 at 05:30:05PM +0100, Mario Kleiner wrote:
> > > On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=E4l=E4 <
> > ville.syrjala@linux.intel.com>
> > > wrote:
> > >
> > > > On Thu, Jan 09, 2020 at 05:26:57PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > > On Thu, Jan 09, 2020 at 04:07:52PM +0100, Mario Kleiner wrote:
> > > > > > The panel reports 10 bpc color depth in its EDID, and the UEFI
> > > > > > firmware chooses link settings at boot which support enough
> > > > > > bandwidth for 10 bpc (324000 kbit/sec to be precise), but the
> > > > > > DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possibl=
e,
> > > >
> > > > Does it actually or do we just ignore the fact that it reports
> > 3.24Gbps?
> > > >
> > > > If it really reports 3.24 then we should be able to just add that to
> > > > dp_rates[] in intel_dp_set_sink_rates() and be done with it.
> > > >
> > > > Although we'd likely want to skip 3.24 unless it really is reported
> > > > as the max so as to not use that non-standard rate on other display=
s.
> > > > So would require a bit fancier logic for that.
> > > >
> > > >
> > > Was also my initial thought, but the DP_MAX_LINK_RATE reg reports 2.7
> > Gbps
> > > as maximum.
> >
> > So dpcd[0x1] =3D=3D 0xa ?
> >
> >
> Yes. [*]
> =

> =

> > What about the magic second version of DP_MAX_LINK_RATE at 0x2201 ?
> > Hmm. I guess we should already be reading that via
> > intel_dp_extended_receiver_capabilities().
> >
> =

> Yes, you do.
> =

> [*] Well, i have to recheck on the machine. I started this work on the AMD
> side and checked what AMD DC gave me, haven't rechecked stuff under i915
> that i already knew from AMD. Comparing the implementations, there's some
> peculiar differences that may matter:
> =

> intel_dp_extended_receiver_capabilities() is more "paranoid" than AMD DC's
> retrieve_link_cap() function in deciding if the extended receiver caps are
> valid. Intels implementation copies only the first 6 Bytes of extended
> receiver caps into the dpcd[] arrays, whereas AMD copies 16 Bytes. Not su=
re
> about the differences, but one of you may wanna check why this is, and if
> it matters somehow.
> =

> Btw. your proposed
> =

> /* blah */
> if (max_rate > ...)
> =

> wouldn't work if dpcd[0x1] =3D=3D 0xa, which it likely is [*]. AMD DC
> identified it as DP 1.1, eDP 1.3, and these extended caps seem to be only
> part of DP 1.3+ if i understand the comments in
> intel_dp_extended_receiver_capabilities() correctly.

Yeah, but you never know how creative they've been with the DPCD in
such a propritary machine. A full DPCD dump from /dev/drm_dp_aux* would
be nice. Can you file a bug an attach the DPCD dump there so we have a
good reference on what we're talking about (also for future if/when
someone eventually starts to wonder why we have such hacks in the
code)?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
