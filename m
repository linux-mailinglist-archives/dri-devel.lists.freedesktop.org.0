Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71546157F6B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 17:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7E26E9BC;
	Mon, 10 Feb 2020 16:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521BD6E9BC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 16:03:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 08:03:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; d="scan'208";a="265908867"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 10 Feb 2020 08:03:37 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 10 Feb 2020 18:03:36 +0200
Date: Mon, 10 Feb 2020 18:03:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH] drm/tidss: dispc: Rewrite naive plane positioning code
Message-ID: <20200210160336.GT13686@intel.com>
References: <20200207181824.7233-1-jsarha@ti.com>
 <02abcb19-efca-27a1-6aba-220532393a81@ti.com>
 <20200207184545.GQ13686@intel.com>
 <76f083da-e05f-9dd1-a85f-c7a3a1820f6a@ti.com>
 <20200210132103.GS13686@intel.com>
 <1f396d11-2ce0-ef01-dd6e-8c563568800b@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f396d11-2ce0-ef01-dd6e-8c563568800b@ti.com>
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
Cc: praneeth@ti.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 05:44:19PM +0200, Jyri Sarha wrote:
> On 10/02/2020 15:21, Ville Syrj=E4l=E4 wrote:
> > On Sun, Feb 09, 2020 at 02:50:09PM +0200, Jyri Sarha wrote:
> >> On 07/02/2020 20:45, Ville Syrj=E4l=E4 wrote:
> >>> On Fri, Feb 07, 2020 at 08:26:17PM +0200, Jyri Sarha wrote:
> >>>> On 07/02/2020 20:18, Jyri Sarha wrote:
> >>>>> The old implementation of placing planes on the CRTC while configur=
ing
> >>>>> the planes was naive and relied on the order in which the planes we=
re
> >>>>> configured, enabled, and disabled. The situation where a plane's zp=
os
> >>>>> was changed on the fly was completely broken. The usual symptoms of
> >>>>> this problem was scrambled display and a flood of sync lost errors,
> >>>>> when a plane was active in two layers at the same time, or a missing
> >>>>> plane, in case when a layer was accidentally disabled.
> >>>>>
> >>>>> The rewrite takes a more straight forward approach when when HW is
> >>>>> concerned. The plane positioning registers are in the CRTC (or
> >>>>> actually OVR) register space and it is more natural to configure th=
em
> >>>>> in a one go when configuring the CRTC. This is easy since we have
> >>>>> access to the whole atomic state when updating the CRTC configurati=
on.
> >>>>>
> >>>>
> >>>> While implementing this fix it caught me by surprise that
> >>>> crtc->state->state (pointer up to full atomic state) is NULL when
> >>>> crtc_enable() or -flush() is called. So I take the plane-state direc=
tly
> >>>> from the plane->state and just assume that it is pointing to the same
> >>>> atomic state with the crtc state I am having. I that alraight?
> >>>
> >>> IMO you should never use plane->state etc. Better pass down the
> >>> full atomic state everywhere. Otherwise you can never even consider
> >>> increasing the commit queue depth since you'd end up accessing the
> >>> wrong state.
> >>>
> >>
> >> Ok. I did explore this a bit and it starts to look like that I have to
> >> store the planes' zpos values in the driver after all. Only the changes
> >> are available in the drm_atomic_state being commited so I have to
> >> maintain the full state myself. That is if I should not use plane->sta=
te
> >> in crtc_enable() or -flush().
> > =

> > You have the full old and new states around for each
> > crtc/plane/connector in the state. So not sure what you mean
> > by having only the changes available?
> > =

> =

> If (by using the drm_atomic_state pointer in old_crtc_state paremeter)
> I loop the planes trough with for_each_oldnew_plane_in_state(), I will
> only see the planes that were part of the drm atomic request sent from
> the user-space. I just tested that again.
> =

> But is it a requirement that an user-space applications should always
> send the full state, and that the driver should assume that all
> mode_config objects that are not there in drm_atomic_state should be
> disabled?

No.

The usual approach we follow in i915 for things that affect more
than one plane is is to collect that state into the crtc state. =

That way we get to remember it for the planes that are not part
of the current commit.

And when we have state that affects more than one crtc that again
get collected up one level up in what we call global state
(basically drm_private_obj with less heavy handed locking scheme).

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
