Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EC63169BE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 16:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE60B6E314;
	Wed, 10 Feb 2021 15:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC656E091;
 Wed, 10 Feb 2021 15:07:09 +0000 (UTC)
IronPort-SDR: xykI7wxxrFWbTRnT9GXfA6O+X44fltOjcPVdzs5YFU+pHMjZyP/j4G84vS2uPO34mPtGvq6HWw
 rvkp5Vu3aLyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="201195804"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="201195804"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 07:07:08 -0800
IronPort-SDR: l4fw1WnfZ0KvRg9vyUl0wY5BiSDtGb/FqiHmH4Zd5GHO4QY4bGsCucpwXvGb1DSbX2CK8JInU2
 xZfC1ML+2kMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="362174452"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 10 Feb 2021 07:07:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Feb 2021 17:07:03 +0200
Date: Wed, 10 Feb 2021 17:07:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/atomic: document and enforce
 rules around "spurious" EBUSY"
Message-ID: <YCP2l7PDMTE2a0Eh@intel.com>
References: <20210210001401.463-1-manasi.d.navare@intel.com>
 <YCPcrusmPxj0iGxz@phenom.ffwll.local>
 <vpyQ2PWoypdzSDLBjlqvQW_zi3sOkPdCOWS_MuxLId4i5HFb3ulnEWkVreU1mEYxcN9bKIB0iV_TpgMBEDaREA7bhZVUFVkTaA5d1DJHhLI=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <vpyQ2PWoypdzSDLBjlqvQW_zi3sOkPdCOWS_MuxLId4i5HFb3ulnEWkVreU1mEYxcN9bKIB0iV_TpgMBEDaREA7bhZVUFVkTaA5d1DJHhLI=@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 01:38:45PM +0000, Simon Ser wrote:
> On Wednesday, February 10th, 2021 at 2:16 PM, Daniel Vetter <daniel@ffwll=
.ch> wrote:
> =

> > On Tue, Feb 09, 2021 at 04:14:01PM -0800, Manasi Navare wrote:
> >
> > > These additional checks added to avoid EBUSY give unnecessary WARN_ON
> > > in case of big joiner used in i915 in which case even if the modeset
> > > is requested on a single pipe, internally another consecutive
> > > pipe is stolen and used to drive half of the transcoder timings.
> > > So in this case it is expected that requested crtc and affected crtcs
> > > do not match. Hence the added WARN ON becomes irrelevant.
> =

> The WARN_ON only happens if allow_modeset =3D=3D false. If allow_modeset =
=3D=3D true,
> then the driver is allowed to steal an unrelated pipe.
> =

> Maybe i915 is stealing a pipe without allow_modeset?

No. All page flips etc. will have to get split up internally
between multiple crtcs.

So I think there's basically three options:
a) massive rewrite of i915 to bypass even more of drm_atomic stuff
b) allow i915 to silence that warning, which opens up the question
   whether the warn is doing any good if it can just be bypassed
c) nuke the warning entirely

a) is not going to happen, and it would any way allow i915 to
do things any which way it wants without tripping the warn,
rendering the warn entirely toothless.

Hmm. Maybe there is a d) which would be to ignore all crtcs
that are not logically enabled in the warn? Not sure if that
could allow something to slit through that people want it to
catch?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
