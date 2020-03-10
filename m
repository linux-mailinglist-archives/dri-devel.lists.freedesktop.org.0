Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78F017F706
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 13:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5943C6E1A2;
	Tue, 10 Mar 2020 12:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570A06E1A2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 12:04:28 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 05:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="321779751"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 10 Mar 2020 05:04:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Mar 2020 14:04:23 +0200
Date: Tue, 10 Mar 2020 14:04:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 15/33] drm/panel-simple: Fix dotclock for EDT ET035012DM6
Message-ID: <20200310120423.GB13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-16-ville.syrjala@linux.intel.com>
 <20200303073320.2udpokcs2ync4hpy@pengutronix.de>
 <20200303145251.GX13686@intel.com>
 <20200306080257.2v7knpjavace7jw4@pengutronix.de>
 <20200309131843.GW13686@intel.com>
 <20200310070532.7ltpdskupxxtd3me@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310070532.7ltpdskupxxtd3me@pengutronix.de>
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
Cc: Thierry Reding <treding@nvidia.com>, Andreas Pretzsch <apr@cn-eng.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 08:05:32AM +0100, Marco Felsch wrote:
> On 20-03-09 15:18, Ville Syrj=E4l=E4 wrote:
> > On Fri, Mar 06, 2020 at 09:02:57AM +0100, Marco Felsch wrote:
> > > On 20-03-03 16:52, Ville Syrj=E4l=E4 wrote:
> > > > On Tue, Mar 03, 2020 at 08:33:20AM +0100, Marco Felsch wrote:
> > > > > Hi Ville,
> > > > > =

> > > > > On 20-03-02 22:34, Ville Syrjala wrote:
> > > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > > =

> > > > > > The currently listed dotclock disagrees with the currently
> > > > > > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > > > > > =

> > > > > > Someone tell me which (if either) of the dotclock or vreresh is
> > > > > > correct?
> > > > > =

> > > > > Pls, check the datasheet which is linked within the comment. We h=
it the
> > > > > vrefresh exactly if we are in SYNC MODE.
> > > > =

> > > > It's too much work to start hunting datasheets for all these
> > > > and figuring out what's going on in each case. Pls just
> > > > inform me which way is correct if you know the details.
> > > =

> > > How do you know that the clock is wrong if it is to much work? As I s=
aid
> > > the clock is completely fine.
> > =

> > htotal*vtotal*vrefresh !=3D clock, so one or both are incorrect.
> =

> I checked the values using this equation:
> clock / (htotal * vtotal) =3D vrefresh.

I guess you truncated instead of rounding to nearest. With round to
nearest we get vrefresh=3D61. The actual number being 60.8...

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
