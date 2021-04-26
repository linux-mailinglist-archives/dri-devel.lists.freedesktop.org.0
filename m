Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0EB36B7EB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 19:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CE689DEC;
	Mon, 26 Apr 2021 17:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0698289DEC;
 Mon, 26 Apr 2021 17:19:09 +0000 (UTC)
IronPort-SDR: 0fP8KFh3OdRZ2mUm+OgRQO/bjc2PehcKJI7szQfyRBoUZEVNCC9ouSUuIe5L8BwbLVyW3TQfxi
 JiixxXDp2Edg==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="281703523"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="281703523"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 10:18:44 -0700
IronPort-SDR: AyMfC91s2Gh7760M+K8XfmTeSVhXZTdWKLaSBImHNG05XDWjbQ9Lr+H3e/7i1oCCav5+Xd4OdD
 T8gNPW4OcDsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="457263823"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 26 Apr 2021 10:18:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 26 Apr 2021 20:18:39 +0300
Date: Mon, 26 Apr 2021 20:18:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Rewrite CL/CTG L-shaped memory
 detection
Message-ID: <YIb178CssrxSSSk6@intel.com>
References: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
 <20210421153401.13847-5-ville.syrjala@linux.intel.com>
 <YIFGt+I8LMckYyVG@phenom.ffwll.local> <YIF1+mhbWO7UD/yN@intel.com>
 <YIblm7BAj6fnQiq+@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIblm7BAj6fnQiq+@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 06:08:59PM +0200, Daniel Vetter wrote:
> On Thu, Apr 22, 2021 at 04:11:22PM +0300, Ville Syrj=E4l=E4 wrote:
> > On Thu, Apr 22, 2021 at 11:49:43AM +0200, Daniel Vetter wrote:
> > > On Wed, Apr 21, 2021 at 06:34:01PM +0300, Ville Syrjala wrote:
> > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > =

> > > > Currently we try to detect a symmetric memory configurations
> > > > using a magic DCC2_MODIFIED_ENHANCED_DISABLE bit. That bit is
> > > > either only set on a very specific subset of machines or it
> > > > just does not exist (it's not mentioned in any public chipset
> > > > datasheets I've found). As it happens my CL/CTG machines never
> > > > set said bit, even if I populate the channels with identical
> > > > sticks.
> > > > =

> > > > So let's do the L-shaped memory detection the same way as the
> > > > desktop variants, ie. just look at the DRAM rank boundary
> > > > registers to see if both channels have an identical size.
> > > > =

> > > > With this my CL/CTG no longer claim L-shaped memory when I use
> > > > identical sticks. Also tested with non-matching sticks just to
> > > > make sure the L-shaped memory is still properly detected.
> > > > =

> > > > And for completeness let's update the debugfs code to dump
> > > > the correct set of registers on each platform.
> > > > =

> > > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > =

> > > Did you check this with the swapping igt? I have some vague memories =
of
> > > bug reports where somehow the machine was acting like it's L-shaped m=
emory
> > > despite that banks were populated equally. I've iirc tried all kinds =
of
> > > tricks to figure it out, all to absolutely no avail.
> > =

> > Did you have a specific test in mind? I ran a bunch of things
> > that seemed swizzle related. All passed just fine.
> =

> gem_tiled_swapping should be the one. It tries to cycle your entire system
> memory through tiled buffers into swap and out of it.

Passes with symmetric config, fails with L-shaped config (if I hack
out the L-shape detection of course). So seems pretty solid.

A kernel based self test that looks at the physical address would
still be nice I suppose. Though depending on the size of your RAM
sticks figuring out where exactly the switchover from two channels
to one channels happens probably requires a bit of work due to
the PCI hole/etc.

Both my cl and ctg report this btw:
 bit6 swizzle for X-tiling =3D bit9/bit10/bit11
 bit6 swizzle for Y-tiling =3D bit9/bit11
so unfortunately can't be sure the other swizzle modes would be
correctly detected.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
