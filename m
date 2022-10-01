Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B555F177D
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 02:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A735A10E493;
	Sat,  1 Oct 2022 00:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F0010E485;
 Sat,  1 Oct 2022 00:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664585165; x=1696121165;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jcaGDCXaUePbL+gwbg3hWD3ASLmwDIpAwSBYwVoQIx0=;
 b=H8UBAT6FazXb0IXZG48kZuEqaA/tG6eRBUdgcEB6Ydz06N8HznFmSd6P
 Ml1JIpybvl+Enbr/YKKMtb6O33h+wsgEaq/ZKDOTgIFKp1QkmuHxSubNA
 1dzchql6MFabzbR7qd3rycx7qPtcCBHGmrnReFSconL3ow0P8K93IT7V8
 5ZxAtkfNx9PNMka8u+gJP+eSVvQTSsfPYA4aQUb2RtwJH6lAKkUBQnEBg
 5N0zAQ8D/c2uhCygGRDTHy7xhJNdSUU31eDMCpwrCaLjoHbVi4nwHfLzU
 K1CFhood3FDqWVJHTYRHJYeUI3X3X/vJYA+BmxV26+cLEVAT4mzoheHva w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="302299559"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="302299559"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:04 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="685477594"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="685477594"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/14] Explicit MCR handling and MTL steering
Date: Fri, 30 Sep 2022 17:45:36 -0700
Message-Id: <20221001004550.3031431-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: ravi.kumar.vodapalli@intel.com, balasubramani.vivekanandan@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Steering of multicast/replicated registers becomes a bit more
complicated on Meteor Lake.  Whereas previously the control register we
used to manage the steering was only used by our driver[*], software's
control of steering has now been consolidated with the controls for
various other hardware/firmware agents into a single register.  We can
no longer utilize pre-programmed implicit steering since other firmware
agents may change the steering target and not restore it afterward;
we'll need to explicitly steer all types of MCR registers (including the
GSLICE/COMPUTE/DSS ranges that have been handled implicitly in the
past).  Furthermore, since multiple agents will now be sharing a single
steering control register, races are possible.  To address this, the
hardware adds a new MCR semaphore register which is supposed to be used
to temporarily lock the steering while performing MCR operations.

It's going to become important for us to handle accesses of multicast
registers very explicitly going forward.  This series provides some prep
work for that by updating our register definitions to clearly define
registers as either MCR or non-MCR and ensure that we're using the
intel_gt_mcr_*() functions rather than intel_uncore_*() when operating
on MCR registers.  By declaring MCR registers as a new C type (i.e., not
an i915_reg_t) we can have the compiler help us find any mistakes where
non-MCR functions are used on MCR registers and vice-versa.

This series also includes the general MCR steering tables and logic, but
does not yet introduce the support for the semaphore register that will
be used to coordinate steering updates with other agents; we'll provide
that support in a separate series once this preparation work has landed.


[*] This is a bit of an oversimplification; there are some hardware and
software debug tools that use the same MCR_SELECTOR register that i915
does and which could potentially re-steer MCR accesses behind our back.
E.g., simply using IGT's "intel_reg" tool to write the MCR_SELECTOR
register at the wrong time could interfere with driver operation.  But
given that these debug facilities require root privileges to run and are
only used by people intentionally debugging the driver or hardware, we
can ignore such races for real-world usage.

v2:
 - Add MCR handling of TLB invalidation registers (since they're in the
   GAM range, their read behavior behaves a bit more like unicast
   registers, but they should still be treated as MCR for writes).
 - Add MCR rmw and 'wait_for_reg' operations; these are only typically
   needed for GAM registers.
 - Switched a few more instances of MISCCPCTL, HALF_SLICE_CHICKEN3, and
   the fault registers over to MCR handling where appropriate.  (Bala)

Matt Roper (14):
  drm/i915/gen8: Create separate reg definitions for new MCR registers
  drm/i915/xehp: Create separate reg definitions for new MCR registers
  drm/i915/gt: Drop a few unused register definitions
  drm/i915/gt: Correct prefix on a few registers
  drm/i915/gt: Add intel_gt_mcr_multicast_rmw() operation
  drm/i915/xehp: Check for faults on primary GAM
  drm/i915/gt: Add intel_gt_mcr_wait_for_reg_fw()
  drm/i915: Define MCR registers explicitly
  drm/i915/gt: Always use MCR functions on multicast registers
  drm/i915/guc: Handle save/restore of MCR registers explicitly
  drm/i915/gt: Add MCR-specific workaround initializers
  drm/i915: Define multicast registers as a new type
  drm/i915/mtl: Add multicast steering for render GT
  drm/i915/mtl: Add multicast steering for media GT

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   4 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 126 ++++-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c        | 228 +++++++--
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h        |  24 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 162 +++---
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   9 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  22 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   2 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c          |  12 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 474 +++++++++++-------
 .../gpu/drm/i915/gt/intel_workarounds_types.h |   9 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  60 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  12 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  19 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |  16 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  12 +-
 drivers/gpu/drm/i915/i915_pci.c               |   1 +
 drivers/gpu/drm/i915/i915_reg_defs.h          |  22 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  12 +-
 drivers/gpu/drm/i915/intel_pm.c               |  20 +-
 23 files changed, 862 insertions(+), 398 deletions(-)

-- 
2.37.3

