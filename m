Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41695288A9D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 16:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6614C6ECE9;
	Fri,  9 Oct 2020 14:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8519E6ECE9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 14:20:22 +0000 (UTC)
IronPort-SDR: TsgcVzeJnEnS6QIDVwkUUgRf7HTNPhGVp93dqFAT1O5hYL2YpFvsSLY3NvvXJluKBbk5S/B2G4
 jom6iED5m9sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="165603775"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165603775"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 07:20:21 -0700
IronPort-SDR: KcKux4DIG6yCmiffyqjJ8vpqt/4Kx+nxtOGLpu3i+cAcZcX5qHFxeh+kGOeKtxw0GxlHjXw7ON
 rMy8oqFuCTaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="389154097"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 09 Oct 2020 07:20:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 09 Oct 2020 17:20:18 +0300
Date: Fri, 9 Oct 2020 17:20:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
Message-ID: <20201009142018.GT6112@intel.com>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
 <CAPj87rM3H+kNzMgw1B00iDzH94gZPoLfr17KrAAiCXuUB2VHKA@mail.gmail.com>
 <20201009131025.GS6112@intel.com> <20201009165651.31199071@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009165651.31199071@eldfell>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 04:56:51PM +0300, Pekka Paalanen wrote:
> On Fri, 9 Oct 2020 16:10:25 +0300
> Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com> wrote:
> =

> > On Fri, Oct 09, 2020 at 01:07:20PM +0100, Daniel Stone wrote:
> > > Hi,
> > > =

> > > On Fri, 9 Oct 2020 at 10:24, Simon Ser <contact@emersion.fr> wrote:  =

> > > > User-space should avoid parsing EDIDs for metadata already exposed =
via
> > > > other KMS interfaces and properties. For instance, user-space shoul=
d not
> > > > try to extract a list of modes from the EDID: the kernel might muta=
te
> > > > the mode list (because of link capabilities or quirks for instance).
> > > >
> > > > Other metadata not exposed by KMS can be parsed by user-space. This
> > > > includes for instance monitor identification (make/model/serial) and
> > > > supported color-spaces.  =

> > > =

> > > So I take it the only way to get modes is through the connector's list
> > > of modes. That sounds reasonable enough to me, but I think to properly
> > > handle colour (e.g. CEA modes have different behaviour for
> > > limited/full range depending on which VIC they correspond to IIRC)  =

> > =

> > If the mode has a VIC and that VIC is not 1, then it's limited range,
> > otherwise full range. There are fortunately no cases where you would
> > have the same exact timings corresponding to different quantization
> > range depending on the VIC.
> > =

> > And the only reason the same timings could correspond to multiple VICs
> > is aspect ratio. Which is already exposed via the mode flags, assuming
> > the appropriate client cap is enabled.
> > =

> > So I think the only reason to expose the VIC would be if userspace is
> > non-lazy and wants to manage its colors presicely, but is otherwise lazy
> > and doesn't want to figure out what the VIC of the mode is on its own.
> =

> What would "figure out what the VIC of the mode is" require in userspace?
> =

> A database of all VIC modes and then compare if the detailed timings matc=
h?
> =

> Is that also how the kernel recognises that userspace wants to set a
> certain VIC mode instead of some arbitrary mode?

Yes and yes.

Note that atm we also don't have a way for userspace to say that it
wants to signal limited range to the sink but wants the kernel
to not do the full->limited range conversion. Ie. no way for userspace
to pass in pixels that are already in limited range. There was a patch
for that posted quite long ago, but it didn't go in.

> =

> Can CVT or GVT produce those exact timings? Can that accidentally
> result in limited range?

Not sure.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
