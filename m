Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418A31743A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 00:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921C46ED27;
	Wed, 10 Feb 2021 23:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84E06ED27;
 Wed, 10 Feb 2021 23:20:56 +0000 (UTC)
IronPort-SDR: 53glRNp3DlUm2lP8tnQw4Teere7KrwgYeVaB+qgVb58IfmHk7fX+h4vHN391sj0NpwqMYpdjFH
 XJgy3eUrRJZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="178658911"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="178658911"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 15:20:56 -0800
IronPort-SDR: Y5PYA4JRB2InB0sblvukPFgV5cTDDdjt6N12agAAxY38dvLF/Gl/yuSpEKENLHVTej9GggSyRh
 T4BoY+/ojqbg==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="436859448"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 15:20:56 -0800
Date: Wed, 10 Feb 2021 15:26:00 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/atomic: document and enforce
 rules around "spurious" EBUSY"
Message-ID: <20210210232600.GA5116@labuser-Z97X-UD5H>
References: <20210210001401.463-1-manasi.d.navare@intel.com>
 <YCPcrusmPxj0iGxz@phenom.ffwll.local>
 <vpyQ2PWoypdzSDLBjlqvQW_zi3sOkPdCOWS_MuxLId4i5HFb3ulnEWkVreU1mEYxcN9bKIB0iV_TpgMBEDaREA7bhZVUFVkTaA5d1DJHhLI=@emersion.fr>
 <YCP2l7PDMTE2a0Eh@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCP2l7PDMTE2a0Eh@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 05:07:03PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Feb 10, 2021 at 01:38:45PM +0000, Simon Ser wrote:
> > On Wednesday, February 10th, 2021 at 2:16 PM, Daniel Vetter <daniel@ffw=
ll.ch> wrote:
> > =

> > > On Tue, Feb 09, 2021 at 04:14:01PM -0800, Manasi Navare wrote:
> > >
> > > > These additional checks added to avoid EBUSY give unnecessary WARN_=
ON
> > > > in case of big joiner used in i915 in which case even if the modeset
> > > > is requested on a single pipe, internally another consecutive
> > > > pipe is stolen and used to drive half of the transcoder timings.
> > > > So in this case it is expected that requested crtc and affected crt=
cs
> > > > do not match. Hence the added WARN ON becomes irrelevant.
> > =

> > The WARN_ON only happens if allow_modeset =3D=3D false. If allow_modese=
t =3D=3D true,
> > then the driver is allowed to steal an unrelated pipe.
> > =

> > Maybe i915 is stealing a pipe without allow_modeset?
> =

> No. All page flips etc. will have to get split up internally
> between multiple crtcs.
> =

> So I think there's basically three options:
> a) massive rewrite of i915 to bypass even more of drm_atomic stuff
> b) allow i915 to silence that warning, which opens up the question
>    whether the warn is doing any good if it can just be bypassed
> c) nuke the warning entirely
> =

> a) is not going to happen, and it would any way allow i915 to
> do things any which way it wants without tripping the warn,
> rendering the warn entirely toothless.
> =

> Hmm. Maybe there is a d) which would be to ignore all crtcs
> that are not logically enabled in the warn? Not sure if that
> could allow something to slit through that people want it to
> catch?

So as per the offline IRC discussions,
- We can check for crtc_state->enable and only use the enabled crtcs
in the affected crtc calculation. And this enable would only
be set when modeset is done. So in case of bigjoiner no modeset on Pipe A,
even if Pipe B is stolen, since no modeset and because that pipe doesnt
get enabled the affected crtcs would still be 0x1.

This should solve the problem. =

Ville, Danvet - I will make this change?

Manasi

> =

> -- =

> Ville Syrj=E4l=E4
> Intel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
