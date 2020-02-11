Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D41158F5E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 14:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE4F6EA51;
	Tue, 11 Feb 2020 13:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEB56EA51
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 13:00:38 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 05:00:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="221923017"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 11 Feb 2020 05:00:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 Feb 2020 15:00:30 +0200
Date: Tue, 11 Feb 2020 15:00:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/tidss: dispc: Rewrite naive plane positioning code
Message-ID: <20200211130030.GU13686@intel.com>
References: <20200207181824.7233-1-jsarha@ti.com>
 <02abcb19-efca-27a1-6aba-220532393a81@ti.com>
 <20200207184545.GQ13686@intel.com>
 <76f083da-e05f-9dd1-a85f-c7a3a1820f6a@ti.com>
 <20200210132103.GS13686@intel.com>
 <1f396d11-2ce0-ef01-dd6e-8c563568800b@ti.com>
 <20200210160336.GT13686@intel.com>
 <5b985430-3659-68be-4834-9cc2de9daf5e@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b985430-3659-68be-4834-9cc2de9daf5e@ti.com>
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
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 Jyri Sarha <jsarha@ti.com>, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 11:11:34AM +0200, Tomi Valkeinen wrote:
> Hi Ville,
> =

> On 10/02/2020 18:03, Ville Syrj=E4l=E4 wrote:
> =

> > The usual approach we follow in i915 for things that affect more
> > than one plane is is to collect that state into the crtc state.
> > That way we get to remember it for the planes that are not part
> > of the current commit.
> > =

> > And when we have state that affects more than one crtc that again
> > get collected up one level up in what we call global state
> > (basically drm_private_obj with less heavy handed locking scheme).
> =

> I'm confused. Don't we always have the full state available? Why do you n=
eed to store state into =

> custom crtc-state?
> =

> Here we are interested in the x, y and z positions of all the planes on a=
 crtc. Creating a custom =

> state object and duplicating that information there seems a bit silly, as=
 surely that information is =

> tracked by DRM?

You can have it if you add all the planes to the state, which can be
a bit expensive. Another option would to peek into the planes' states
that aren't in the commit, but that's quite gross due to bypassing
the normal locking rules and instead relying on the crtc mutex to
sufficiently protect the plane states as well. And I suspect trying
to do said peeking during the commit phase when the locks have
already been dropped will end badly.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
