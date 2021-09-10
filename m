Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6003406DF6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 17:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690F36EA07;
	Fri, 10 Sep 2021 15:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D5F6EA07;
 Fri, 10 Sep 2021 15:07:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="220768519"
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="220768519"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 08:07:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="432276992"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 08:07:19 -0700
Date: Fri, 10 Sep 2021 08:07:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 0/6] i915: Simplify mmio handling & add new
 DG2 shadow table
Message-ID: <20210910150717.GL461228@mdroper-desk1.amr.corp.intel.com>
References: <20210910053317.3379249-1-matthew.d.roper@intel.com>
 <8d211f7a-9dcb-dc5e-8703-5ffc33898ee7@linux.intel.com>
 <20210910142402.GJ461228@mdroper-desk1.amr.corp.intel.com>
 <6039a619-9240-75ad-0291-e654411fdb40@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6039a619-9240-75ad-0291-e654411fdb40@linux.intel.com>
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

On Fri, Sep 10, 2021 at 04:03:50PM +0100, Tvrtko Ursulin wrote:
> 
> On 10/09/2021 15:24, Matt Roper wrote:
> > On Fri, Sep 10, 2021 at 02:03:44PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 10/09/2021 06:33, Matt Roper wrote:
> > > > Our uncore MMIO functions for reading/writing registers have become very
> > > > complicated over time.  There's significant macro magic used to generate
> > > > several nearly-identical functions that only really differ in terms of
> > > > which platform-specific shadow register table they should check on write
> > > > operations.  We can significantly simplify our MMIO handlers by storing
> > > > a reference to the current platform's shadow table within the 'struct
> > > > intel_uncore' the same way we already do for forcewake; this allows us
> > > > to consolidate the multiple variants of each 'write' function down to
> > > > just a single 'fwtable' version that gets the shadow table out of the
> > > > uncore struct rather than hardcoding the name of a specific platform's
> > > > table.  We can do similar consolidation on the MMIO read side by
> > > > creating a single-entry forcewake table to replace the open-coded range
> > > > check they had been using previously.
> > > > 
> > > > The final patch of the series adds a new shadow table for DG2; this
> > > > becomes quite clean and simple now, given the refactoring in the first
> > > > five patches.
> > > 
> > > Tidy and it ends up saving kernel binary size.
> > > 
> > > However I am undecided yet, because one thing to note is that the trade off
> > > is source code and kernel text consolidation at the expense of more indirect
> > > calls at runtime and larger common read/write functions.
> > > 
> > > To expand, current code generates a bunch of per gen functions but in doing
> > > so it manages to inline a bunch of checks like NEEDS_FORCE_WAKE and BSEARCH
> > > (from find_fw_domain) so at runtime each platform mmio read/write does not
> > > have to do indirect calls to do lookups.
> > > 
> > > It may matter a lot in the grand scheme of things but this trade off is
> > > something to note in the cover letter I think.
> > 
> > That's true.  However it seems like if the extra indirect calls are good
> > enough for our forcewake lookups (which are called more frequently and
> > have to search through much larger tables) then using the same strategy
> > for shadow registers should be less of a concern.  Plus most of
> > timing-critical parts of the code don't call through this at all; they
> > just grab an explicit forcewake and then issue a bunch of *_fw()
> > operations that skip all the per-register forcewake and shadow handling.
> 
> With lookups you mean intel_uncore_forcewake_for_reg? Yeah I don't have a
> good idea of how many of those followed by "_fw" accessors we have vs
> "un-optimized" access. But it's a good point.
> 
> I was mostly coming from the point of view of old platforms like gen6, where
> with this series reads go from inlined checks (NEEDS_FORCE_WAKE) to always
> calling find_fw_domain. Just because it is a bit unfortunate to burden old
> CPUs (they are not getting any faster) with executing more code. It's not
> nice when old hardware gets slower and slower with software updates. :) But
> whether or not this case would at all be measurable.. probably not. Unless
> some compounding effects, like "death by thousand cuts", would come into
> play.

Chris pointed out in an offline mail that NEEDS_FORCE_WAKE does cut cut
out a lot of display MMIO lookups.  So I think it might be worth adding
that back, but also adding an "|| GEN11_BSD_RING_BASE" so that it will
still be accurate for the newer platforms too.

But I think another thing to consider here would be that we might want
to switch our intel_de_{read,write} wrappers to call raw mmio directly,
to completely bypass forcewake and shadow logic.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > But you're right that this is something I should mention more clearly in
> > the cover letter.
> > 
> > 
> > Matt
> > 
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > > Matt Roper (6):
> > > >     drm/i915/uncore: Convert gen6/gen7 read operations to fwtable
> > > >     drm/i915/uncore: Associate shadow table with uncore
> > > >     drm/i915/uncore: Replace gen8 write functions with general fwtable
> > > >     drm/i915/uncore: Drop gen11/gen12 mmio write handlers
> > > >     drm/i915/uncore: Drop gen11 mmio read handlers
> > > >     drm/i915/dg2: Add DG2-specific shadow register table
> > > > 
> > > >    drivers/gpu/drm/i915/intel_uncore.c           | 190 ++++++++++--------
> > > >    drivers/gpu/drm/i915/intel_uncore.h           |   7 +
> > > >    drivers/gpu/drm/i915/selftests/intel_uncore.c |   1 +
> > > >    3 files changed, 110 insertions(+), 88 deletions(-)
> > > > 
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
