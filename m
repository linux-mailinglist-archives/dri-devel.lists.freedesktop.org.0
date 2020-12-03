Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0D52CD581
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 13:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678276E9AF;
	Thu,  3 Dec 2020 12:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE1B6E9AF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 12:31:58 +0000 (UTC)
IronPort-SDR: D9d0PMbnvgHFdnR4I0dp0PAZtGaYo+RZPUsWdagh3T8LUIs7Z33WXQJdAMhBd8B7t/CPi46lmR
 tpoJtyfsFEiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="173344085"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="173344085"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 04:31:57 -0800
IronPort-SDR: iaoKt8+1pEInV7x0L7Mu9Lsxd9b8tGPMNkXjoSfWDDwgsvRNN1BPNePeXKt5tyHBp8fsggJENy
 VG2Y2QLU/oMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="335942581"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 03 Dec 2020 04:31:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Dec 2020 14:31:53 +0200
Date: Thu, 3 Dec 2020 14:31:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/5] drm: add legacy support for using degamma for gamma
Message-ID: <20201203123153.GE6112@intel.com>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-2-tomi.valkeinen@ti.com>
 <20201130103840.GR4141@pendragon.ideasonboard.com>
 <f744a803-6d8c-5188-7bfa-93cc05cc26bf@ti.com>
 <20201130141057.GL401619@phenom.ffwll.local>
 <93e718be-01ff-fc5c-6497-f7afb2becb38@ti.com>
 <CAKMK7uGY91+-HUuZfignoFJHWTm-zCAdsH4jLrC=EOXAHdEmvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGY91+-HUuZfignoFJHWTm-zCAdsH4jLrC=EOXAHdEmvQ@mail.gmail.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, Sekhar Nori <nsekhar@ti.com>,
 Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 02, 2020 at 01:38:42PM +0100, Daniel Vetter wrote:
> On Wed, Dec 2, 2020 at 12:52 PM Tomi Valkeinen <tomi.valkeinen@ti.com> wr=
ote:
> >
> > On 30/11/2020 16:10, Daniel Vetter wrote:
> >
> > > The thing is, the legacy helpers should be able to pull off what user=
space
> > > needs to do when it's using atomic anyway. Hard-coding information in=
 the
> > > kernel means we have a gap here. Hence imo legacy helpers doing the r=
ight
> > > thing in all reasonable cases is imo better.
> > >
> > > In many cases I think we should even go further, and ditch driver abi=
lity
> > > to overwrite legacy helper hooks like this. I thought we'd need that
> > > flexibility for legacy userspace being incompatible in awkward ways, =
but
> > > wasn't ever really needed. Worse, many drivers forget to wire up the
> > > compat hooks.
> > >
> > > tldr, imo right thing to do here:
> > > - move legacy gamma function from helpers into core code
> > > - call it unconditionally for all atomic drivers (if there's no legacy
> > >   drivers using the hook left then we can outright remove it)
> > > - make sure it dtrt in all cases
> >
> > There are atomic drivers which have their custom gamma_set function. I =
guess they don't support
> > atomic color mgmt, but do support (legacy) gamma.
> =

> Hm yeah, but it's this kind of feature disparity which is why I think
> we should at least try to unify more.
> =

> > We could make the core code call the gamma legacy helper automatically =
for atomic drivers that don't
> > have gamma_set defined but do have GAMMA_LUT or DEGAMMA_LUT. But the ga=
mma_set function is called
> > also in a few places from drm_fb_helper.c, so this code wouldn't be ful=
ly inside drm_color_mgmt.c.
> >
> > Or we could just change drm_atomic_helper_legacy_gamma_set() to do the =
right thing, depending on
> > GAMMA_LUT & DEGAMMA_LUT existence.
> =

> Yeah that would be at least better than pushing more decisions onto
> drivers as hard-coding. I still think that maybe just automatically
> calling the helper when either a GAMMA or DEGAMMA lut is set up would
> be better.

BTW I have some gamma related stuff here
git://github.com/vsyrjala/linux.git fb_helper_c8_lut_4

which tries to fix some fb_helper gamma stuff, and I'm also
getting rid of the gamma_store stuff for the leacy uapi for
drivers which implement the fancier color management stuff.
In fact I just threw out the helper thing entirely and made
the core directly call the right stuff. Not sure if that
would be helpful, harmful or just meh here.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
