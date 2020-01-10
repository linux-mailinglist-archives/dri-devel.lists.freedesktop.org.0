Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8AF136E23
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 14:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85836EA17;
	Fri, 10 Jan 2020 13:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0C96EA15;
 Fri, 10 Jan 2020 13:32:36 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 05:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,417,1571727600"; d="scan'208";a="212265157"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 10 Jan 2020 05:32:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jan 2020 15:32:32 +0200
Date: Fri, 10 Jan 2020 15:32:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Add current maximum eDP link rate to
 sink_rate array.
Message-ID: <20200110133232.GJ13686@intel.com>
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <20200109152656.GP1208@intel.com> <20200109153815.GQ1208@intel.com>
 <CAEsyxyj6xbHrkKk5=bG5APrD5VW_PP-Cs+nT0vqCjW_LBSG29A@mail.gmail.com>
 <20200109164715.GD13686@intel.com>
 <CAEsyxyhjbP6ADutU7XRJUjryj1+X8mFqopB9TvBoW6RWjBihww@mail.gmail.com>
 <20200109182408.GF13686@intel.com>
 <CAEsyxyiTxRZC=Mw4rKvjCQO557Qg6Q2JRkoUvQWOia7SxumznA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEsyxyiTxRZC=Mw4rKvjCQO557Qg6Q2JRkoUvQWOia7SxumznA@mail.gmail.com>
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

On Thu, Jan 09, 2020 at 09:19:07PM +0100, Mario Kleiner wrote:
> On Thu, Jan 9, 2020 at 7:24 PM Ville Syrj=E4l=E4 <ville.syrjala@linux.int=
el.com>
> wrote:
> =

> > On Thu, Jan 09, 2020 at 06:57:14PM +0100, Mario Kleiner wrote:
> > > On Thu, Jan 9, 2020 at 5:47 PM Ville Syrj=E4l=E4 <
> > ville.syrjala@linux.intel.com>
> > > wrote:
> > >
> > > > On Thu, Jan 09, 2020 at 05:30:05PM +0100, Mario Kleiner wrote:
> > > > > On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=E4l=E4 <
> > > > ville.syrjala@linux.intel.com>
> > > > > wrote:
> > > > >
> >
> =

> > wouldn't work if dpcd[0x1] =3D=3D 0xa, which it likely is [*]. AMD DC
> > > identified it as DP 1.1, eDP 1.3, and these extended caps seem to be =
only
> > > part of DP 1.3+ if i understand the comments in
> > > intel_dp_extended_receiver_capabilities() correctly.
> >
> >
> Ok, looking at previous debug output logs shows that those extended caps
> are not present on the systems, ie. that extended caps bit is not set. So
> dpcd[0x1] =3D=3D 0xa.
> =

> =

> > Yeah, but you never know how creative they've been with the DPCD in
> > such a propritary machine. A full DPCD dump from /dev/drm_dp_aux* would
> > be nice. Can you file a bug an attach the DPCD dump there so we have a
> > good reference on what we're talking about (also for future if/when
> > someone eventually starts to wonder why we have such hacks in the
> > code)?
> >
> >
> True, it's Apple which likes to "Think different..." :/
> =

> Will do. But is there a proper/better way to do the /dev/drm_dp_aux0 dump?
> I used cat /dev/drm_dp_aux0 > dump, and that hangs, but if i interrupt it
> after a few seconds, i get a dump file of 512k size, which seems excessiv=
e?
> On AMD DC atm., in case that matters.

It can take a while to dump the whole thing. If there are errors in some
parts (against the spec but some devices simply don't care about the
spec) you may need to use ddrescue/etc. to dump everything that can be
dumped.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
