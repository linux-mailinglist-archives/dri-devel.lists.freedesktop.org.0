Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC82F402D99
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05B96E087;
	Tue,  7 Sep 2021 17:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E553E6E087;
 Tue,  7 Sep 2021 17:19:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220322730"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="220322730"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="605352242"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/8] i915: Introduce Xe_HP compute engines
Date: Tue,  7 Sep 2021 10:19:08 -0700
Message-Id: <20210907171916.2548047-1-matthew.d.roper@intel.com>
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

The Xe_HP architecture introduces compute engines as a new engine class.
These compute command streamers (CCS) are similar to the render engine,
except that they're intended for GPGPU usage and lack support for the 3D
pipeline.

The definition of I915_ENGINE_CLASS_COMPUTE is new ABI; see below for a
link to a UMD (compute) merge request that utilizes the new ABI.

This series adds some of the basic enablement for the CCS engines, but
does not yet add them to the engine list for the relevant platforms
(XeHP SDV and DG2); that will be handled in future series.

UMD (compute): https://github.com/intel/compute-runtime/pull/451

Daniele Ceraolo Spurio (1):
  drm/i915/xehp: compute engine pipe_control

John Harrison (1):
  drm/i915/xehp: Extend uninterruptible OpenCL workloads to CCS

Matt Roper (6):
  drm/i915/xehp: Define compute class and engine
  drm/i915/xehp: CCS shares the render reset domain
  drm/i915/xehp: Add Compute CS IRQ handlers
  drm/i915/xehp: CCS should use RCS setup functions
  drm/i915/xehp: Define context scheduling attributes in lrc descriptor
  drm/i915/xehp: Enable ccs/dual-ctx in RCU_MODE

 .../drm/i915/gem/selftests/i915_gem_context.c |  8 ++--
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 31 ++++++++++-----
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 39 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  | 11 +++++-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  5 ++-
 .../drm/i915/gt/intel_execlists_submission.c  | 34 +++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  | 15 +++++++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 15 ++++++-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h           | 10 +++++
 drivers/gpu/drm/i915/gt/intel_reset.c         |  4 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 13 ++++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 28 ++++++++++++-
 drivers/gpu/drm/i915/i915_drv.h               |  2 +
 drivers/gpu/drm/i915/i915_perf.c              |  4 +-
 drivers/gpu/drm/i915/i915_reg.h               | 20 +++++++++-
 include/uapi/drm/i915_drm.h                   |  1 +
 17 files changed, 215 insertions(+), 29 deletions(-)

-- 
2.25.4

