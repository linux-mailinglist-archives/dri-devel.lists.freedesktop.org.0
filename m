Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C18D5406D98
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 16:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839826EA03;
	Fri, 10 Sep 2021 14:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5736EA02;
 Fri, 10 Sep 2021 14:24:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="208320325"
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="208320325"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 07:24:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="467131263"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 07:24:04 -0700
Date: Fri, 10 Sep 2021 07:24:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 0/6] i915: Simplify mmio handling & add new
 DG2 shadow table
Message-ID: <20210910142402.GJ461228@mdroper-desk1.amr.corp.intel.com>
References: <20210910053317.3379249-1-matthew.d.roper@intel.com>
 <8d211f7a-9dcb-dc5e-8703-5ffc33898ee7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d211f7a-9dcb-dc5e-8703-5ffc33898ee7@linux.intel.com>
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

On Fri, Sep 10, 2021 at 02:03:44PM +0100, Tvrtko Ursulin wrote:
> 
> On 10/09/2021 06:33, Matt Roper wrote:
> > Our uncore MMIO functions for reading/writing registers have become very
> > complicated over time.  There's significant macro magic used to generate
> > several nearly-identical functions that only really differ in terms of
> > which platform-specific shadow register table they should check on write
> > operations.  We can significantly simplify our MMIO handlers by storing
> > a reference to the current platform's shadow table within the 'struct
> > intel_uncore' the same way we already do for forcewake; this allows us
> > to consolidate the multiple variants of each 'write' function down to
> > just a single 'fwtable' version that gets the shadow table out of the
> > uncore struct rather than hardcoding the name of a specific platform's
> > table.  We can do similar consolidation on the MMIO read side by
> > creating a single-entry forcewake table to replace the open-coded range
> > check they had been using previously.
> > 
> > The final patch of the series adds a new shadow table for DG2; this
> > becomes quite clean and simple now, given the refactoring in the first
> > five patches.
> 
> Tidy and it ends up saving kernel binary size.
> 
> However I am undecided yet, because one thing to note is that the trade off
> is source code and kernel text consolidation at the expense of more indirect
> calls at runtime and larger common read/write functions.
> 
> To expand, current code generates a bunch of per gen functions but in doing
> so it manages to inline a bunch of checks like NEEDS_FORCE_WAKE and BSEARCH
> (from find_fw_domain) so at runtime each platform mmio read/write does not
> have to do indirect calls to do lookups.
> 
> It may matter a lot in the grand scheme of things but this trade off is
> something to note in the cover letter I think.

That's true.  However it seems like if the extra indirect calls are good
enough for our forcewake lookups (which are called more frequently and
have to search through much larger tables) then using the same strategy
for shadow registers should be less of a concern.  Plus most of
timing-critical parts of the code don't call through this at all; they
just grab an explicit forcewake and then issue a bunch of *_fw()
operations that skip all the per-register forcewake and shadow handling.

But you're right that this is something I should mention more clearly in
the cover letter.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > Matt Roper (6):
> >    drm/i915/uncore: Convert gen6/gen7 read operations to fwtable
> >    drm/i915/uncore: Associate shadow table with uncore
> >    drm/i915/uncore: Replace gen8 write functions with general fwtable
> >    drm/i915/uncore: Drop gen11/gen12 mmio write handlers
> >    drm/i915/uncore: Drop gen11 mmio read handlers
> >    drm/i915/dg2: Add DG2-specific shadow register table
> > 
> >   drivers/gpu/drm/i915/intel_uncore.c           | 190 ++++++++++--------
> >   drivers/gpu/drm/i915/intel_uncore.h           |   7 +
> >   drivers/gpu/drm/i915/selftests/intel_uncore.c |   1 +
> >   3 files changed, 110 insertions(+), 88 deletions(-)
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
