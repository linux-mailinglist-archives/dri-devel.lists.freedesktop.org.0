Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8794C7428
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B2210E48C;
	Mon, 28 Feb 2022 17:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABED210E199;
 Mon, 28 Feb 2022 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070184; x=1677606184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T8ZUK02WzJK87WoaTi6ek1WNyl9PgCe07m/7U5M6Oik=;
 b=Gwcjq+k2gOLBS3Dm0+Q/EjUhTaTic9QNV50kJ2kLl/vPBVkMJCCAB9Vf
 9Vl1G0h+fvx2IuWuJ2wSWR07eTgr/loRLVag9QSivJUKsTc/kvQRq5W1w
 XvB7NOnxjbxlpaASMYLEbBbJiRPsAOYl/RStobuJT8vpgDenbs/y7Ag47
 4P1Ilfhu8RSbE/K+oRPuRdIT5eL3SXFf7JScZPPUiDo5u2pqWhXu5AJ6E
 Ka4S4XO+WzO0NlBzhzTFj2Xjid3dc+JVBnezRZykv8OPw0PlgCvcUUweZ
 UMt/uO4ZH3esZRcqpVhxC8g7YB00PfcOOAghSM5UGiZKix5OinhFPdEiw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240351461"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="240351461"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:03 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392808"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:02 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/13] i915: Prepare for Xe_HP compute engines
Date: Mon, 28 Feb 2022 09:42:32 -0800
Message-Id: <20220228174245.1569581-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Xe_HP architecture introduces compute engines as a new engine class.
These compute command streamers (CCS) are similar to the render engine,
except that they're intended for GPGPU usage and lack support for the 3D
pipeline.

For now we're just sending some initial "under the hood" preparation for
CCS engines without actually exposing them to userspace or adding them
to any platform's engine list yet.  There may be a bit more GuC-related
updates necessary before it's safe to expose them, so the actual uabi
bits will come later once that's all worked out.


Daniele Ceraolo Spurio (3):
  drm/i915/xehp: compute engine pipe_control
  drm/i915/xehp/guc: enable compute engine inside GuC
  drm/i915/xehp: handle fused off CCS engines

Matt Roper (8):
  drm/i915/xehp: Define compute class and engine
  drm/i915/xehp: CCS shares the render reset domain
  drm/i915/xehp: Add Compute CS IRQ handlers
  drm/i915/xehp: CCS should use RCS setup functions
  drm/i915: Move context descriptor fields to intel_lrc.h
  drm/i915/xehp: Define context scheduling attributes in lrc descriptor
  drm/i915/xehp: Enable ccs/dual-ctx in RCU_MODE
  drm/i915/xehp: Add compute workarounds

Matthew Brost (1):
  drm/i915/xehp: Don't support parallel submission on compute / render

Srinivasan Shanmugam (1):
  drm/i915/xehpsdv: Move render/compute engine reset domains related
    workarounds

 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 10 +++
 .../drm/i915/gem/selftests/i915_gem_context.c |  8 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 35 ++++++--
 drivers/gpu/drm/i915/gt/intel_engine.h        |  2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 83 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  | 11 ++-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  5 +-
 .../drm/i915/gt/intel_execlists_submission.c  | 24 +++++-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  | 15 ++++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 15 +++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 45 +++-------
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 10 ++-
 drivers/gpu/drm/i915/gt/intel_lrc.h           | 51 ++++++++++++
 drivers/gpu/drm/i915/gt/intel_sseu.c          | 17 +++-
 drivers/gpu/drm/i915/gt/intel_sseu.h          |  4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 73 +++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  5 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 32 +++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 18 +++-
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  4 +
 drivers/gpu/drm/i915/i915_drv.h               |  2 +
 drivers/gpu/drm/i915/i915_reg.h               |  4 +
 22 files changed, 393 insertions(+), 80 deletions(-)

-- 
2.34.1

