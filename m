Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B394C9900
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F7810E7C9;
	Tue,  1 Mar 2022 23:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058DE10E7BB;
 Tue,  1 Mar 2022 23:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646176587; x=1677712587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FaPLvtupEuSx6dSAgxUIh/822pvF8jCv8uVXZ+L7X0s=;
 b=dnam4Q8UvnsWPtac5IaaLPH081yBcceU0CILhW8SiTTTfa439cBMUkBs
 kp1tParhPxb9+C7QB0y6PvYpAAtEZJIHIUdJi/jt/d2OhxhHKX6a6242l
 KbEygKMwB6KoraMzVyo4/z5XihQNsfw53q1dbHaCye+zjMVwQDV9CqXvO
 Z8zfCnqp2qZyrMVK9MMOhZ9J92R2kS5qUlxBGkj7PvqfBVtWt/h2pljAC
 PKN2JRIfynFdBPgYe2wuMoHigj2kUe1z4BMRF+5PaHPj9gtP2RX5G2dLL
 XpGXPXnqmEd1IVqkNZy55PKAyEHmKQEldIAemkpkuaY2G9WyFqJ0hOjUC Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316479049"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="316479049"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709253443"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 00/13] i915: Prepare for Xe_HP compute engines
Date: Tue,  1 Mar 2022 15:15:36 -0800
Message-Id: <20220301231549.1817978-1-matthew.d.roper@intel.com>
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

v2:
 - General rebase of patches from September.
 - Drop ABI bits for now; we'll make it visible to userspace later once
   all the GuC work is hammered out.

v3:
 - Flip order of RCU_MODE patch and GuC's ADS update to enable compute
   engines.  (Daniele)
 - Replace fls(CCS_MASK) condition on fusing check with a simple IP
   version test to omit pre-Xe_HP platforms.
 - Fix a handful of checkpatch warnings.


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
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 34 ++++++--
 drivers/gpu/drm/i915/gt/intel_engine.h        |  2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 83 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  | 11 ++-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  5 +-
 .../drm/i915/gt/intel_execlists_submission.c  | 24 +++++-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  | 15 ++++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 15 +++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 45 +++-------
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 12 ++-
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
 22 files changed, 394 insertions(+), 80 deletions(-)

-- 
2.34.1

