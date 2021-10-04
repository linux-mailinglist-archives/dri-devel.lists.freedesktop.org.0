Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C69242095C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 12:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1699E6E9B8;
	Mon,  4 Oct 2021 10:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668666E9B6;
 Mon,  4 Oct 2021 10:36:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="248629914"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="248629914"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 03:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="622059673"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 04 Oct 2021 03:36:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 13:36:24 +0300
Date: Mon, 4 Oct 2021 13:36:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Rewrite CL/CTG L-shaped memory
 detection
Message-ID: <YVrZKEgBEPeNegx5@intel.com>
References: <20210421153401.13847-1-ville.syrjala@linux.intel.com>
 <20210421153401.13847-5-ville.syrjala@linux.intel.com>
 <YIFGt+I8LMckYyVG@phenom.ffwll.local> <YIF1+mhbWO7UD/yN@intel.com>
 <YIblm7BAj6fnQiq+@phenom.ffwll.local> <YIb178CssrxSSSk6@intel.com>
 <YIfSH/PWf2ZnOnOr@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YIfSH/PWf2ZnOnOr@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 10:58:07AM +0200, Daniel Vetter wrote:
> On Mon, Apr 26, 2021 at 08:18:39PM +0300, Ville Syrjälä wrote:
> > On Mon, Apr 26, 2021 at 06:08:59PM +0200, Daniel Vetter wrote:
> > > On Thu, Apr 22, 2021 at 04:11:22PM +0300, Ville Syrjälä wrote:
> > > > On Thu, Apr 22, 2021 at 11:49:43AM +0200, Daniel Vetter wrote:
> > > > > On Wed, Apr 21, 2021 at 06:34:01PM +0300, Ville Syrjala wrote:
> > > > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > 
> > > > > > Currently we try to detect a symmetric memory configurations
> > > > > > using a magic DCC2_MODIFIED_ENHANCED_DISABLE bit. That bit is
> > > > > > either only set on a very specific subset of machines or it
> > > > > > just does not exist (it's not mentioned in any public chipset
> > > > > > datasheets I've found). As it happens my CL/CTG machines never
> > > > > > set said bit, even if I populate the channels with identical
> > > > > > sticks.
> > > > > > 
> > > > > > So let's do the L-shaped memory detection the same way as the
> > > > > > desktop variants, ie. just look at the DRAM rank boundary
> > > > > > registers to see if both channels have an identical size.
> > > > > > 
> > > > > > With this my CL/CTG no longer claim L-shaped memory when I use
> > > > > > identical sticks. Also tested with non-matching sticks just to
> > > > > > make sure the L-shaped memory is still properly detected.
> > > > > > 
> > > > > > And for completeness let's update the debugfs code to dump
> > > > > > the correct set of registers on each platform.
> > > > > > 
> > > > > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > 
> > > > > Did you check this with the swapping igt? I have some vague memories of
> > > > > bug reports where somehow the machine was acting like it's L-shaped memory
> > > > > despite that banks were populated equally. I've iirc tried all kinds of
> > > > > tricks to figure it out, all to absolutely no avail.
> > > > 
> > > > Did you have a specific test in mind? I ran a bunch of things
> > > > that seemed swizzle related. All passed just fine.
> > > 
> > > gem_tiled_swapping should be the one. It tries to cycle your entire system
> > > memory through tiled buffers into swap and out of it.
> > 
> > Passes with symmetric config, fails with L-shaped config (if I hack
> > out the L-shape detection of course). So seems pretty solid.
> > 
> > A kernel based self test that looks at the physical address would
> > still be nice I suppose. Though depending on the size of your RAM
> > sticks figuring out where exactly the switchover from two channels
> > to one channels happens probably requires a bit of work due to
> > the PCI hole/etc.
> > 
> > Both my cl and ctg report this btw:
> >  bit6 swizzle for X-tiling = bit9/bit10/bit11
> >  bit6 swizzle for Y-tiling = bit9/bit11
> > so unfortunately can't be sure the other swizzle modes would be
> > correctly detected.
> 
> I think testing-wise this is as good as it gets.

So what do we think about putting this in? Currently this only works by
sheer luck more or less. On my machines we have a false positive which
is safe now that the pin quirk got fixed, but if some other machines
have a false negative then things are not going to go so well.

-- 
Ville Syrjälä
Intel
