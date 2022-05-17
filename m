Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8E95297CF
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 05:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DDB10E360;
	Tue, 17 May 2022 03:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D447C10E23A;
 Tue, 17 May 2022 03:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652757624; x=1684293624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0wFP09G34q5RdPuHBDbmGgCXgBQfDfbvu66T6K3fQV4=;
 b=mIrXhO8EX6y6K+zS6LASM+FxM8xE74Sj3SFqFSB095FTojE8/qptaNgI
 u/CloUcR2NJWFa00EMZNEBNuNBTGYDmzuYjBzd/gJXFWFvINC0xWaulKW
 +fVpybKeNxLHwNYrD961yO6Yd7froJqj6j9rM1JCk7NWH3/rKgs4HY+5c
 5Xb2v2rcH2hPA05Yup7rYh78n/NunizBMlZ1NSsmxi9hJjP9JgXye3EPS
 pUBOxNS5r3ykuguPr/+ylhIw8x07AzsH3j/szhKuJnXHIgJicQyNjF0Vr
 CAItNSgsA9Q0bCIc7DoWi/m7MVIeBEQkbAqKTSgBnGe6Khnj47o4HYxyH Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="258603225"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="258603225"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:20:24 -0700
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="596877334"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 20:20:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/6] i915: SSEU handling updates
Date: Mon, 16 May 2022 20:19:59 -0700
Message-Id: <20220517032005.2694737-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series reworks i915's internal handling of slice/subslice/EU (SSEU)
data to represent platforms like Xe_HP in a more natural manner and to
prepare for future platforms where the masks will need to grow in size.
One key idea of this series is that although we have a fixed ABI to
convey SSEU data to userspace (i.e., multiple u8[] arrays with data
stored at different strides), we don't need to use this cumbersome
format for the driver's own internal storage.  As long as we can convert
into the uapi form properly when responding to the I915_QUERY ioctl,
it's preferable to use an internal storage format that's easier for the
driver to work with.

Another key point here is that we're reaching the point where subslice
(DSS) masks will soon not fit within simple u32/u64 integer values.
Xe_HP SDV and DG2 platforms today have subslice (DSS) masks that are 32
bits, which maxes out the current storage of a u32.  With PVC the masks
are represented by a pair of 32-bit registers, requiring a bump up to at
least 64-bits of storage internally.  We could switch to u64 for that in
the short term, but since we already know that upcoming architectures
intend to provide DSS fuse bits via three or more registers it's best to
switch to a representation that's more future-proof but still easy to
work with in the driver code.  To accomodate this, we start storing our
subslice mask for Xe_HP and beyond in a new typedef that can be
processed by the linux/bitmap.h operations.

Finally, since no userspace for Xe_HP or beyond is using the legacy
I915_GETPARAM ioctl lookups for I915_PARAM_SLICE_MASK and
I915_PARAM_SUBSLICE_MASK (since they've migrated to the more flexible
I915_QUERY ioctl that can return more than a simple u32 value), we take
the opportunity to officially drop support for those GETPARAM lookups on
modern platforms.  Maintaining support for these GETPARAM lookups don't
make sense for a number of reasons:

 * Traditional slices no longer exist, and newer ideas like gslices,
   cslices, mslices, etc. aren't something userspace needs to query
   since it can be inferred from other information.
 * The GETPARAM ioctl doesn't have a way to distinguish between geometry
   subslice masks and compute subslice masks, which are distinct on
   Xe_HP and beyond.
 * The I915_GETPARAM ioctl is limited to returning a 32-bit value, so
   when subslice masks begin to exceed 32-bits (on PVC), it simply can't
   return the entire mask.
 * The GETPARAM ioctl doesn't have a way to give sensible information
   for multi-tile devices.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Matt Roper (6):
  drm/i915/xehp: Use separate sseu init function
  drm/i915/xehp: Drop GETPARAM lookups of I915_PARAM_[SUB]SLICE_MASK
  drm/i915/sseu: Simplify gen11+ SSEU handling
  drm/i915/sseu: Don't try to store EU mask internally in UAPI format
  drm/i915/sseu: Disassociate internal subslice mask representation from
    uapi
  drm/i915/pvc: Add SSEU changes

 drivers/gpu/drm/i915/gem/i915_gem_context.c  |   5 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c           |  12 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |   1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c         | 428 ++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_sseu.h         |  90 ++--
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c |  30 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c  |  24 +-
 drivers/gpu/drm/i915/i915_drv.h              |   2 +
 drivers/gpu/drm/i915/i915_getparam.c         |  11 +-
 drivers/gpu/drm/i915/i915_pci.c              |   3 +-
 drivers/gpu/drm/i915/i915_query.c            |  16 +-
 drivers/gpu/drm/i915/intel_device_info.h     |   1 +
 13 files changed, 376 insertions(+), 251 deletions(-)

-- 
2.35.3

