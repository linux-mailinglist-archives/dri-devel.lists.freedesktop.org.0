Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7258E31906B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 17:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B439B6E456;
	Thu, 11 Feb 2021 16:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E496E453;
 Thu, 11 Feb 2021 16:55:31 +0000 (UTC)
IronPort-SDR: 3Ywd9xXDHAIFcZLZP5kH7jzudLRdNxDNzWuX7vHMz3sA6N4f1C2u5Wb56AYTpY0fnkkQMYH/zT
 dcMQqGoUFThw==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="182408771"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="182408771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 08:55:31 -0800
IronPort-SDR: +Qt7brR7Gm5axvPagUwZb1vGE9NQw/aVMkXLj0md2jPMa20eJsg53y+DLrN+k5Zi/bIx8jAzWk
 /SS26zQATq1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; d="scan'208";a="437215452"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 11 Feb 2021 08:55:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Feb 2021 18:55:27 +0200
Date: Thu, 11 Feb 2021 18:55:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/atomic: document and enforce
 rules around "spurious" EBUSY"
Message-ID: <YCVhf0Bt5vnczvWN@intel.com>
References: <20210210001401.463-1-manasi.d.navare@intel.com>
 <YCPcrusmPxj0iGxz@phenom.ffwll.local>
 <vpyQ2PWoypdzSDLBjlqvQW_zi3sOkPdCOWS_MuxLId4i5HFb3ulnEWkVreU1mEYxcN9bKIB0iV_TpgMBEDaREA7bhZVUFVkTaA5d1DJHhLI=@emersion.fr>
 <YCP2l7PDMTE2a0Eh@intel.com>
 <CAPj87rOZgAD0FJOD+4X2vniV8PP6dMLSn6fDzaf-rP00JYoDeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPj87rOZgAD0FJOD+4X2vniV8PP6dMLSn6fDzaf-rP00JYoDeA@mail.gmail.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 11, 2021 at 04:14:02PM +0000, Daniel Stone wrote:
> On Wed, 10 Feb 2021 at 15:07, Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> > On Wed, Feb 10, 2021 at 01:38:45PM +0000, Simon Ser wrote:
> > > The WARN_ON only happens if allow_modeset =3D=3D false. If allow_mode=
set =3D=3D true,
> > > then the driver is allowed to steal an unrelated pipe.
> > >
> > > Maybe i915 is stealing a pipe without allow_modeset?
> >
> > No. All page flips etc. will have to get split up internally
> > between multiple crtcs.
> =

> I think this is the salient point.
> =

> > So I think there's basically three options:
> > a) massive rewrite of i915 to bypass even more of drm_atomic stuff
> > b) allow i915 to silence that warning, which opens up the question
> >    whether the warn is doing any good if it can just be bypassed
> > c) nuke the warning entirely
> >
> > a) is not going to happen, and it would any way allow i915 to
> > do things any which way it wants without tripping the warn,
> > rendering the warn entirely toothless.
> >
> > Hmm. Maybe there is a d) which would be to ignore all crtcs
> > that are not logically enabled in the warn? Not sure if that
> > could allow something to slit through that people want it to
> > catch?
> =

> So from what I understand, if I enable CRTC 44 and the driver
> magically decides to split it up as a 'big-joiner' output, it will
> also steal CRTC 50 to work as the other half of the output. Then if I
> attach plane 47 to CRTC 44, posting a FB to plane 47 will result in me
> getting atomic completion events for both CRTC 44 and CRTC 50?
> =

> That's not OK from a userspace perspective. If you want to do magic to
> create the illusion of a single CRTC, then that magic needs to be
> consistent. At the moment it's the worst kind of magic: it does
> implicit things under the hood for you, but then leaks all of the
> behind-the-scenes detail into userspace.
> =

> Continuing with that would force us all to just ignore whatever events
> we see, because we can't reason about what they may be or why they're
> generated. Which doesn't allow for any kind of best practice in
> userspace.

You should only get externally visibile events for stuff in your
request. Or at least if that's not the case then the atomic
code is already bork regardless of bigjoiner.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
