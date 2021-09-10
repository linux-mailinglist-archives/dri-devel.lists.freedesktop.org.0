Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E74407247
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 22:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77156EAAE;
	Fri, 10 Sep 2021 20:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E726EAA5;
 Fri, 10 Sep 2021 20:10:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="221205106"
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="221205106"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 13:10:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="480346565"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 13:10:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH v2 0/6] i915: Simplify mmio handling & add new DG2 shadow table
Date: Fri, 10 Sep 2021 13:10:24 -0700
Message-Id: <20210910201030.3436066-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Our uncore MMIO functions for reading/writing registers have become very
complicated over time.  There's significant macro magic used to generate
several nearly-identical functions that only really differ in terms of
which platform-specific shadow register table they should check on write
operations.  We can significantly simplify our MMIO handlers by storing
a reference to the current platform's shadow table within the 'struct
intel_uncore' the same way we already do for forcewake; this allows us
to consolidate the multiple variants of each 'write' function down to
just a single 'fwtable' version that gets the shadow table out of the
uncore struct rather than hardcoding the name of a specific platform's
table.  We can do similar consolidation on the MMIO read side by
creating a single-entry forcewake table to replace the open-coded range
check they had been using previously.

The final patch of the series adds a new shadow table for DG2; this
becomes quite clean and simple now, given the refactoring in the first
five patches.

Aside from simplifying the code signficantly, this series reduces the
size of the generated .ko in exchange for adding an extra pointer
indirection to access the tables.  The size deltas (for just the first
five patches, before we add an additional table in the final patch) are:

Old:
        $ size drivers/gpu/drm/i915/i915.ko
           text    data     bss     dec     hex filename
        2865921   88972    2912 2957805  2d21ed drivers/gpu/drm/i915/i915.ko

New:
        $ size drivers/gpu/drm/i915/i915.ko
           text    data     bss     dec     hex filename
        2854181   88236    2912 2945329  2cf131 drivers/gpu/drm/i915/i915.ko

The code size deltas will become larger as we add more platforms; we
already add one new platform table in the final patch of this series and
our next few platforms are all expected to bring new shadow tables as
well.

I don't think the impact of the indirect table reference for shadow
tables should be a concern for a few reasons:
 * The stored table + indirect lookup design is already deemed good
   enough for forcewake, which is used more frequently (both reads and
   writes, compared to shadow tables which are only used for writes) and
   operates on much larger tables.
 * Performance-critical sections of the code or those read/writing lots
   of registers in a batch usually do an explicit grab of the relevant
   forcewake domains and then perform their MMIO operations via *_fw()
   functions without considering shadowed registers and bypassing all of
   the table lookups.
 * In v2 of the series, we still apply NEEDS_FORCE_WAKE() checks that
   will bypass all of the forcewake and shadow logic for display
   register writes.

v2:
 - Drop orphaned definition of __gen6_reg_read_fw_domains. (Tvrtko)
 - Restore NEEDS_FORCE_WAKE() check to
   __fwtable_reg_{read,write}_fw_domains, but update the definition of
   NEEDS_FORCE_WAKE to also return 'true' on offsets above
   GEN11_BSD_RING_BASE for compatibility with gen11+ platforms. (Chris,
   Tvrtko).

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>

Matt Roper (6):
  drm/i915/uncore: Convert gen6/gen7 read operations to fwtable
  drm/i915/uncore: Associate shadow table with uncore
  drm/i915/uncore: Replace gen8 write functions with general fwtable
  drm/i915/uncore: Drop gen11/gen12 mmio write handlers
  drm/i915/uncore: Drop gen11 mmio read handlers
  drm/i915/dg2: Add DG2-specific shadow register table

 drivers/gpu/drm/i915/intel_uncore.c           | 200 ++++++++++--------
 drivers/gpu/drm/i915/intel_uncore.h           |   7 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   1 +
 3 files changed, 115 insertions(+), 93 deletions(-)

-- 
2.25.4

