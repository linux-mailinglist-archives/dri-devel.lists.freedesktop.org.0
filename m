Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74257459826
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 00:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B9289EF7;
	Mon, 22 Nov 2021 23:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FA489ED6;
 Mon, 22 Nov 2021 23:02:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="215612615"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="215612615"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 15:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="674237054"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 22 Nov 2021 15:02:51 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC 0/7] Add GuC Error Capture Support
Date: Mon, 22 Nov 2021 15:03:55 -0800
Message-Id: <20211122230402.2023576-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series:
  1. Supports the roll out of an upcoming GuC feature to
     enable error-state-capture that allows the driver to
     register lists of MMIO registers that GuC will report
     during a GuC triggered engine-reset event.
  2. Updates the ADS blob creation to register lists
     of global and engine registers with GuC.
  3. Defines tables of register lists that are global or
     engine class or engine instance in scope.
  4. Separates GuC log-buffer access locks for relay logging
     vs the new region for the error state capture data.
  5. Allocates an additional interim circular buffer store
     to copy snapshots of new GuC reported error-state-capture
     dumps in response to the G2H notification.
  6. Connects the i915_gpu_coredump reporting function
     to the GuC error capture module to print all GuC
     error state capture dumps that is reported.

Alan Previn (6):
  drm/i915/guc: Update GuC ADS size for error capture lists
  drm/i915/guc: Populate XE_LP register lists for GuC error state
    capture.
  drm/i915/guc: Add GuC's error state capture output structures.
  drm/i915/guc: Update GuC's log-buffer-state access for error capture.
  drm/i915/guc: Copy new GuC error capture logs upon G2H notification.
  drm/i915/guc: Print the GuC error capture output register list.

John Harrison (1):
  drm/i915/guc: Add basic support for error capture lists

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   4 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   8 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  52 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   9 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 197 +++-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 999 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_capture.h    | 107 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  40 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 141 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  21 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  22 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |  53 +-
 drivers/gpu/drm/i915/i915_gpu_error.h         |   5 +
 15 files changed, 1581 insertions(+), 81 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h

-- 
2.25.1

