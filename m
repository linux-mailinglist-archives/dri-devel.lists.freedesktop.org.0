Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4481A51744E
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3494810E53F;
	Mon,  2 May 2022 16:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414A610E8C6;
 Mon,  2 May 2022 16:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651509261; x=1683045261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zuekNP4ZMtBZXkwlyAT3R9hLnIUVAmwJpjtwlKdQUZU=;
 b=kZQ1lTX+0McgSnsOHrqKYHvyKryqQibz1Opfl4E8yCaD90Ma54NtoMEn
 h7sqJrglSJknSEH0NQ4104+5TYka0mMGl9EM0DqFTT0ic3VKEuViBmXxf
 heQvXWjZsRE3yMmiX+NP2dYrBHFiI5yAgyGbMhCFepA2TKrx9avXWk1bN
 a4E+3QydIsPbEmn/sMSyIUrKTYRubishuBnDRtG0g9odRQwwsuYpnTY8J
 ReUYDOA06J3amXfXDVinMxmqak9PS/YBUjz8mun1FhZFt+oxfx/SYN6Ou
 x7WL1qUbbQEWP6gLAfPRMa18IDzlomuM0BqocB6QkhheO0JzYA7M/ARY9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266104994"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="266104994"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583781807"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/11] i915: Introduce Ponte Vecchio
Date: Mon,  2 May 2022 09:34:06 -0700
Message-Id: <20220502163417.2635462-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ponte Vecchio (PVC) is a new GPU based on the Xe_HPC architecture.  As a
compute-focused platform, PVC has compute engines and enhanced copy
engines, but no render engine (there is no geometry pipeline) and no
display.

This is just a handful of early enablement patches, including some
initial support for the new copy engines (although we're not yet adding
those to the platform's engine list or exposing them to userspace just
yet).


Ayaz A Siddiqui (1):
  drm/i915/pvc: Define MOCS table for PVC

John Harrison (1):
  drm/i915/pvc: Reduce stack usage in reset selftest with extra blitter
    engine

Lucas De Marchi (2):
  drm/i915/pvc: skip all copy engines from aux table invalidate
  drm/i915/pvc: read fuses for link copy engines

Matt Roper (5):
  drm/i915/pvc: Add forcewake support
  drm/i915/pvc: Read correct RP_STATE_CAP register
  drm/i915/pvc: Engines definitions for new copy engines
  drm/i915/pvc: Interrupt support for new copy engines
  drm/i915/pvc: Reset support for new copy engines

Stuart Summers (2):
  drm/i915/pvc: add initial Ponte Vecchio definitions
  drm/i915/pvc: Remove additional 3D flags from PIPE_CONTROL

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  20 ++-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  92 +++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  10 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  12 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  16 ++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  56 ++++---
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   1 +
 drivers/gpu/drm/i915/gt/intel_mocs.c          |  24 ++-
 drivers/gpu/drm/i915/gt/intel_rps.c           |   4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  13 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   9 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |   2 +-
 drivers/gpu/drm/i915/i915_drv.h               |   6 +
 drivers/gpu/drm/i915/i915_pci.c               |  23 +++
 drivers/gpu/drm/i915/i915_reg.h               |   9 ++
 drivers/gpu/drm/i915/intel_device_info.c      |   1 +
 drivers/gpu/drm/i915/intel_device_info.h      |   5 +-
 drivers/gpu/drm/i915/intel_uncore.c           | 150 +++++++++++++++++-
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   2 +
 19 files changed, 417 insertions(+), 38 deletions(-)

-- 
2.35.1

