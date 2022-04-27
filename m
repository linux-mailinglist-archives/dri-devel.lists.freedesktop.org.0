Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3F51275C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 01:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DBB10E6A8;
	Wed, 27 Apr 2022 23:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BEC10E6A8;
 Wed, 27 Apr 2022 23:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651100873; x=1682636873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5EzU/vQ+Fd4YfPf9jrwU6rxkgBokFXvfwB52Y8fELjo=;
 b=IvYBrop9u2xLsgfwqjDGFUHn7FL9MHVciGTi9OneJ978vFSNdFZG1lHM
 P7atupJ01wTGpvKIiJ9R7uzon0ZCmvPChP0OGLnTj3w7uEya5kMQ8Z0tv
 6h+Fs7qw3QrG7yyx1gb2zGHHbsdSxBdczRfJRVMx1ZP+c+T9lYVkzX8GW
 2GDD26DVyq5cfY1YQvhwatSjvj+qjoc1TQBhAtYh49uaAR4tcmJvHOvXj
 1uS5T1rXx7Ua4mQccCqaLh6VNTHpR1Gpb3S4sgjmeh3myVaICil8ysL1V
 xARwhk8E5JElwodI7/vR9jHadnveaf/tS+Uh+RDxBGnK2uH5XzA8CnCUw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265912012"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="265912012"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="533495677"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 16:07:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] i915: SSEU handling updates
Date: Wed, 27 Apr 2022 16:07:42 -0700
Message-Id: <20220427230747.906625-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
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

This series makes a handful of updates to i915's internal handling of
slice/subslice/EU (SSEU) data to handle recent platforms like Xe_HP in a
more natural manner and to prepare for some additional upcoming
platforms we have in the pipeline (the first of which I'll probably
start sending patches for in the next week or two).  One key idea of
this series is that although we have a fixed ABI to convey SSEU data to
userspace (i.e., multiple u8[] arrays with data stored at different
strides), we don't need to use this cumbersome format for the driver's
own internal storage.  As long as we can convert into the uapi form
properly when responding to the I915_QUERY ioctl, it's preferable to use
an internal storage format that's easier for the driver to work with.
Doing so can also save us some storage space on modern platforms since
we don't always need to replicate a bunch of data that's architecturally
guaranteed to be identical.

Another key point here is that Xe_HP platforms today have subslice (DSS)
masks that are 32 bits, which maxes out the storage of a u32.  On future
platforms the architecture design is going to start spreading their DSS
masks over multiple 32-bit fuse registers.  So even for platforms where
the total number of DSS doesn't actually go up, we're going to need
larger storage than just a u32 to express the mask properly.  To
accomodate this, we start storing our subslice mask in a new typedef
that can be processed by the linux/bitmap.h operations.

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
   when subslice masks begin to exceed 32-bits, it simply can't return
   the entire mask.
 * The GETPARAM ioctl doesn't have a way to give sensible information
   for multi-tile devices.


Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Matt Roper (5):
  drm/i915/sseu: Don't try to store EU mask internally in UAPI format
  drm/i915/xehp: Drop GETPARAM lookups of I915_PARAM_[SUB]SLICE_MASK
  drm/i915/xehp: Use separate sseu init function
  drm/i915/sseu: Simplify gen11+ SSEU handling
  drm/i915/sseu: Disassociate internal subslice mask representation from
    uapi

 drivers/gpu/drm/i915/gem/i915_gem_context.c  |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c           |  14 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c         | 371 +++++++++++--------
 drivers/gpu/drm/i915/gt/intel_sseu.h         |  69 ++--
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c |  28 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c  |  28 +-
 drivers/gpu/drm/i915/i915_getparam.c         |  10 +-
 drivers/gpu/drm/i915/i915_query.c            |  16 +-
 9 files changed, 323 insertions(+), 219 deletions(-)

-- 
2.35.1

