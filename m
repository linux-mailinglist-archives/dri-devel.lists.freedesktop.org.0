Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D84ED007
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AB610E1CC;
	Wed, 30 Mar 2022 23:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2285610E14A;
 Wed, 30 Mar 2022 23:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682954; x=1680218954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D5C2wrNKdrz0yW6ijewQ07r3qcVcW8xqnZCN/cvQZLM=;
 b=GeYLqRoKcUeAv/iSfgWPrqyqq4QOG/h7HREoSPbR4N1fhNHEAG15ayRg
 v0s93ZS+tLIZyktfwYssIyC0fTS+aCTVx7WKNY6hfKj5BY43eY1Rk404U
 bGvXS54RUB3Ud69k97veDxz8ZE9LkKyEUM83q3rhLE9ZOqL89+4VhfYGy
 xB9M+WP3z9WrxVTeA+RsR/meTzFuIuJylxgDbsc3pzV/7/JNrrOeUDtL9
 IHD3TV/eNJ1Z8okJ9DaPFSLPery5ZOeRE4I2vnxIPGAIy3pm3SoyE8flY
 /uW/iSVaJvuqF70F+2ggZeJtGWYmtBeT8qReowtyVxkGnyLHPecAE+R6p g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582499"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582499"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547051970"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/15] i915: Explicit handling of multicast registers
Date: Wed, 30 Mar 2022 16:28:43 -0700
Message-Id: <20220330232858.3204283-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multicast/replicated (MCR) registers on Intel hardware are a purely
GT-specific concept.  Rather than leaving MCR register handling spread
across several places throughout the driver (intel_uncore.c, intel_gt.c,
etc.) with confusing combinations of handler functions living in
different namespaces, let's consolidate it all into a single place
(intel_gt_mcr.c) and provide a more consistent and clearly-documented
interface for the rest of the driver to access such registers:

 * intel_gt_mcr_read -- unicast read from specific instance
 * intel_gt_mcr_read_any[_fw] -- unicast read from any non-terminated
   instance
 * intel_gt_mcr_unicast_write -- unicast write to specific instance
 * intel_gt_mcr_multicast_write[_fw] -- multicast write to all instances

To ensure these new interfaces are used for all accesses to MCR
registers (rather than relying on the implicit and possibly incorrect
semantics of our regular mmio accessors), we'll also promote multicast
registers to a unique type within the driver (i915_mcr_reg_t rather than
the traditional i915_reg_t).  This will let the compiler help us catch
places where the code is trying to perform a non-MCR-aware MMIO
operation on an MCR register.

Finally, we'll implement new guidance from our hardware architects that
we should steer every undirected access to MCR registers (including
registers in GSLICE/DSS MCR ranges) at the time of access on Xe_HP,
rather than relying on a default steering target programmed at driver
initialization time.

One aspect of this series that I'm not super happy with is the handling
of mixed lists MCR and non-MCR registers that we have in a few places
(e.g., the various whitelists used by perf, GVT, etc.).  Since we're not
actually accessing the registers in those spots, just listing them out
so their MMIO offsets can be used for comparison, for now I've
effectively cast the MCR registers on those lists back to i915_reg_t
type so that the compiler doesn't complain about seeing incompatible
i915_mcr_reg_t elements in a list that's supposed to be i915_reg_t.  We
may want to think about better ways to handle heterogeneous lists of MCR
and non-MCR registers, or possibly just convert those to lists of u32
offsets since we're not actually using them to perform MMIO accesses.


Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>


Matt Roper (15):
  drm/i915/gen8: Create separate reg definitions for new MCR registers
  drm/i915/xehp: Create separate reg definitions for new MCR registers
  drm/i915/gt: Drop a few unused register definitions
  drm/i915/gt: Correct prefix on a few registers
  drm/i915/xehp: Check for faults on all mslices
  drm/i915: Drop duplicated definition of XEHPSDV_FLAT_CCS_BASE_ADDR
  drm/i915: Move XEHPSDV_TILE0_ADDR_RANGE to GT register header
  drm/i915: Define MCR registers explicitly
  drm/i915/gt: Move multicast register handling to a dedicated file
  drm/i915/gt: Cleanup interface for MCR operations
  drm/i915/gt: Always use MCR functions on multicast registers
  drm/i915/guc: Handle save/restore of MCR registers explicitly
  drm/i915/gt: Add MCR-specific workaround initializers
  drm/i915: Define multicast registers as a new type
  drm/i915/xehp: Eliminate shared/implicit steering

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  34 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 303 ++---------
 drivers/gpu/drm/i915/gt/intel_gt.h            |  15 -
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c        | 506 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h        |  34 ++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 153 +++---
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   1 +
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  44 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |   6 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c          |  12 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |   3 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 473 ++++++++--------
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  61 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  12 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |   2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  19 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |  16 +-
 drivers/gpu/drm/i915/i915_perf.c              |   2 +-
 drivers/gpu/drm/i915/i915_reg.h               |   6 -
 drivers/gpu/drm/i915/i915_reg_defs.h          |   9 +
 drivers/gpu/drm/i915/intel_pm.c               |  20 +-
 drivers/gpu/drm/i915/intel_uncore.c           | 112 ----
 drivers/gpu/drm/i915/intel_uncore.h           |   8 -
 30 files changed, 1059 insertions(+), 816 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.h

-- 
2.34.1

