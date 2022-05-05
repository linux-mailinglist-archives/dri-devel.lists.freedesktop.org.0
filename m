Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3638451CB71
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6091410FA64;
	Thu,  5 May 2022 21:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED6B10E24A;
 Thu,  5 May 2022 21:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651786701; x=1683322701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9OnQ6/ZQ7s66z6mxudJU+0dLto6UP9McHHioPzerKkw=;
 b=IqhR9bdGWAsjG4tWiFO16uxN3+Ece/4hdHqzo8qBfiT73LDuWf+E5hjm
 lfP0g6zMPmf3N1UgjDpbH7n7LUuJ2hf/jOIWAIC7t+AxqW6qic+Qm1qeH
 /lS6M6TO+l6QxV+BI4NfcqkF1fETnAy5DU1Vv4TZnYc3lnnRXdy7v9JhZ
 7jkOqKNYb0dxl51rVzD62RfmYk3/S/MFDHFzkYUocg21VbdyjpVmroz5U
 5N/EUCquQBchW6yaHTRcgY7Le3OL+nY/ggaPRHWAY61B414EUnQkVZNB3
 nWvIWoKrgK7UkyXNFVuh2AWpCf3tzwYMElyKn6KinKg5VQvwiE7subXOx Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248166056"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248166056"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549553248"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/12] i915: Introduce Ponte Vecchio
Date: Thu,  5 May 2022 14:38:00 -0700
Message-Id: <20220505213812.3979301-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
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

Ponte Vecchio (PVC) is a new GPU based on the Xe_HPC architecture.  As a
compute-focused platform, PVC has compute engines and enhanced copy
engines, but no render engine (there is no geometry pipeline) and no
display.

This is just a handful of early enablement patches, including some
initial support for the new copy engines (although we're not yet adding
those to the platform's engine list or exposing them to userspace just
yet).

v2:
 - Drop replicated comment from forcewake patch completely and add an
   additional commit to provide better documentation for forcewake and
   shadowed register tables in a way that's clear for all platforms.
 - Move gvt build fix to its own patch.
 - Address various minor review feedback from Lucas, Tvrtko, and
   Prathap.


Ayaz A Siddiqui (1):
  drm/i915/pvc: Define MOCS table for PVC

John Harrison (1):
  drm/i915/pvc: Reduce stack usage in reset selftest with extra blitter
    engine

Lucas De Marchi (2):
  drm/i915/pvc: skip all copy engines from aux table invalidate
  drm/i915/pvc: read fuses for link copy engines

Matt Roper (7):
  drm/i915/uncore: Reorganize and document shadow and forcewake tables
  drm/i915/pvc: Add forcewake support
  drm/i915/pvc: Read correct RP_STATE_CAP register
  drm/i915/gvt: Use intel_engine_mask_t for ring mask
  drm/i915/pvc: Engine definitions for new copy engines
  drm/i915/pvc: Interrupt support for new copy engines
  drm/i915/pvc: Reset support for new copy engines

Stuart Summers (1):
  drm/i915/pvc: Remove additional 3D flags from PIPE_CONTROL

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  21 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  93 ++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  12 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  12 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  16 ++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  56 ++--
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   1 +
 drivers/gpu/drm/i915/gt/intel_mocs.c          |  24 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |   4 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  30 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   9 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |   2 +-
 drivers/gpu/drm/i915/i915_drv.h               |   4 +
 drivers/gpu/drm/i915/i915_pci.c               |   4 +-
 drivers/gpu/drm/i915/i915_reg.h               |   9 +
 drivers/gpu/drm/i915/intel_device_info.h      |   4 +-
 drivers/gpu/drm/i915/intel_uncore.c           | 267 +++++++++++++++---
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   2 +
 18 files changed, 483 insertions(+), 87 deletions(-)

-- 
2.35.1

