Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA91135E9C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 17:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8426E44D;
	Thu,  9 Jan 2020 16:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3158A6E44D;
 Thu,  9 Jan 2020 16:47:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 08:47:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="227974216"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 09 Jan 2020 08:47:15 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Jan 2020 18:47:15 +0200
Date: Thu, 9 Jan 2020 18:47:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Add current maximum eDP link rate to
 sink_rate array.
Message-ID: <20200109164715.GD13686@intel.com>
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <20200109152656.GP1208@intel.com> <20200109153815.GQ1208@intel.com>
 <CAEsyxyj6xbHrkKk5=bG5APrD5VW_PP-Cs+nT0vqCjW_LBSG29A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEsyxyj6xbHrkKk5=bG5APrD5VW_PP-Cs+nT0vqCjW_LBSG29A@mail.gmail.com>
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

On Thu, Jan 09, 2020 at 05:30:05PM +0100, Mario Kleiner wrote:
> On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=E4l=E4 <ville.syrjala@linux.int=
el.com>
> wrote:
> =

> > On Thu, Jan 09, 2020 at 05:26:57PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Thu, Jan 09, 2020 at 04:07:52PM +0100, Mario Kleiner wrote:
> > > > The panel reports 10 bpc color depth in its EDID, and the UEFI
> > > > firmware chooses link settings at boot which support enough
> > > > bandwidth for 10 bpc (324000 kbit/sec to be precise), but the
> > > > DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,
> >
> > Does it actually or do we just ignore the fact that it reports 3.24Gbps?
> >
> > If it really reports 3.24 then we should be able to just add that to
> > dp_rates[] in intel_dp_set_sink_rates() and be done with it.
> >
> > Although we'd likely want to skip 3.24 unless it really is reported
> > as the max so as to not use that non-standard rate on other displays.
> > So would require a bit fancier logic for that.
> >
> >
> Was also my initial thought, but the DP_MAX_LINK_RATE reg reports 2.7 Gbps
> as maximum.

So dpcd[0x1] =3D=3D 0xa ?

What about the magic second version of DP_MAX_LINK_RATE at 0x2201 ?
Hmm. I guess we should already be reading that via
intel_dp_extended_receiver_capabilities().

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
