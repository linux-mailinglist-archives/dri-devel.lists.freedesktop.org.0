Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ADC157A29
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 14:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E946E98C;
	Mon, 10 Feb 2020 13:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10886E98C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 13:21:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 05:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; d="scan'208";a="347044787"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 10 Feb 2020 05:21:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 10 Feb 2020 15:21:03 +0200
Date: Mon, 10 Feb 2020 15:21:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH] drm/tidss: dispc: Rewrite naive plane positioning code
Message-ID: <20200210132103.GS13686@intel.com>
References: <20200207181824.7233-1-jsarha@ti.com>
 <02abcb19-efca-27a1-6aba-220532393a81@ti.com>
 <20200207184545.GQ13686@intel.com>
 <76f083da-e05f-9dd1-a85f-c7a3a1820f6a@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <76f083da-e05f-9dd1-a85f-c7a3a1820f6a@ti.com>
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

On Sun, Feb 09, 2020 at 02:50:09PM +0200, Jyri Sarha wrote:
> On 07/02/2020 20:45, Ville Syrj=E4l=E4 wrote:
> > On Fri, Feb 07, 2020 at 08:26:17PM +0200, Jyri Sarha wrote:
> >> On 07/02/2020 20:18, Jyri Sarha wrote:
> >>> The old implementation of placing planes on the CRTC while configuring
> >>> the planes was naive and relied on the order in which the planes were
> >>> configured, enabled, and disabled. The situation where a plane's zpos
> >>> was changed on the fly was completely broken. The usual symptoms of
> >>> this problem was scrambled display and a flood of sync lost errors,
> >>> when a plane was active in two layers at the same time, or a missing
> >>> plane, in case when a layer was accidentally disabled.
> >>>
> >>> The rewrite takes a more straight forward approach when when HW is
> >>> concerned. The plane positioning registers are in the CRTC (or
> >>> actually OVR) register space and it is more natural to configure them
> >>> in a one go when configuring the CRTC. This is easy since we have
> >>> access to the whole atomic state when updating the CRTC configuration.
> >>>
> >>
> >> While implementing this fix it caught me by surprise that
> >> crtc->state->state (pointer up to full atomic state) is NULL when
> >> crtc_enable() or -flush() is called. So I take the plane-state directly
> >> from the plane->state and just assume that it is pointing to the same
> >> atomic state with the crtc state I am having. I that alraight?
> > =

> > IMO you should never use plane->state etc. Better pass down the
> > full atomic state everywhere. Otherwise you can never even consider
> > increasing the commit queue depth since you'd end up accessing the
> > wrong state.
> >
> =

> Ok. I did explore this a bit and it starts to look like that I have to
> store the planes' zpos values in the driver after all. Only the changes
> are available in the drm_atomic_state being commited so I have to
> maintain the full state myself. That is if I should not use plane->state
> in crtc_enable() or -flush().

You have the full old and new states around for each
crtc/plane/connector in the state. So not sure what you mean
by having only the changes available?

> =

> >>
> >> Why is the crtc->state->state NULL? Is it a bug or is there some reason
> >> to it?
> > =

> > Currently swap_state() moves that state pointer from the new obj state
> > to the old obj state, and clears the one in the new obj state. Not enti=
rely
> > sure why, but maybe just so there isn't a stale ->state pointer hanging =

> > around in the obj->state after the swap?
> > =

> > I think a better way could be to not clobber the old obj state at
> > all, leave the new_obj_state->state alone, and just clear the ->state
> > pointer .duplicate_state(). But that would require reviewing a bunch
> > of code to find all the places where old_obj_state->state gets used
> > during the commit.
> > =

> =

> I think those places are many, since at least I did not figure out any
> other way to access the full commit behind the atomic helpers.

I haven't examined how many drivers depend on the current behaviour.
But fixing up the core/helpers should be pretty trivial.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
