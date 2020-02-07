Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B72E2155E61
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 19:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5116E051;
	Fri,  7 Feb 2020 18:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C097F6E051
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 18:45:50 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 10:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,414,1574150400"; d="scan'208";a="265093906"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 07 Feb 2020 10:45:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2020 20:45:45 +0200
Date: Fri, 7 Feb 2020 20:45:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH] drm/tidss: dispc: Rewrite naive plane positioning code
Message-ID: <20200207184545.GQ13686@intel.com>
References: <20200207181824.7233-1-jsarha@ti.com>
 <02abcb19-efca-27a1-6aba-220532393a81@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02abcb19-efca-27a1-6aba-220532393a81@ti.com>
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

On Fri, Feb 07, 2020 at 08:26:17PM +0200, Jyri Sarha wrote:
> On 07/02/2020 20:18, Jyri Sarha wrote:
> > The old implementation of placing planes on the CRTC while configuring
> > the planes was naive and relied on the order in which the planes were
> > configured, enabled, and disabled. The situation where a plane's zpos
> > was changed on the fly was completely broken. The usual symptoms of
> > this problem was scrambled display and a flood of sync lost errors,
> > when a plane was active in two layers at the same time, or a missing
> > plane, in case when a layer was accidentally disabled.
> > =

> > The rewrite takes a more straight forward approach when when HW is
> > concerned. The plane positioning registers are in the CRTC (or
> > actually OVR) register space and it is more natural to configure them
> > in a one go when configuring the CRTC. This is easy since we have
> > access to the whole atomic state when updating the CRTC configuration.
> > =

> =

> While implementing this fix it caught me by surprise that
> crtc->state->state (pointer up to full atomic state) is NULL when
> crtc_enable() or -flush() is called. So I take the plane-state directly
> from the plane->state and just assume that it is pointing to the same
> atomic state with the crtc state I am having. I that alraight?

IMO you should never use plane->state etc. Better pass down the
full atomic state everywhere. Otherwise you can never even consider
increasing the commit queue depth since you'd end up accessing the
wrong state.

> =

> Why is the crtc->state->state NULL? Is it a bug or is there some reason
> to it?

Currently swap_state() moves that state pointer from the new obj state
to the old obj state, and clears the one in the new obj state. Not entirely
sure why, but maybe just so there isn't a stale ->state pointer hanging =

around in the obj->state after the swap?

I think a better way could be to not clobber the old obj state at
all, leave the new_obj_state->state alone, and just clear the ->state
pointer .duplicate_state(). But that would require reviewing a bunch
of code to find all the places where old_obj_state->state gets used
during the commit.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
