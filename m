Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B59DC714DD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 23:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11A010E272;
	Wed, 19 Nov 2025 22:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apLwAvV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C85510E26C;
 Wed, 19 Nov 2025 22:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763592073; x=1795128073;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a1NVpBtiyHcjJSVGuGX8U2Dvz0zornAYlnBdkn4SyX4=;
 b=apLwAvV+4MgJXZ4lcQ+qJsHbd+8+cijNCubTSyYpTUy0pdpvEDzmt2HR
 9JmRSAliEVF8pgDhAbJ8giYYiNmIya6SdF3Fxyd+/8HHqWMuDOFPBI5RB
 4dBkEwsJDh4XFdx4f1WOPA8pO6x6blRFH3mZgLaeIDTuTjhuSSBpwpwju
 Cn/jcHKURAvxQKkPwLedVQR59sy+3q7SQa3Xsqvh70WoQHZdpSKe19Pt+
 pA00bL0/64v3b3L8XFGd2DWeTr/V01aI+1vRa3xllWjKwQ0iXxutG9JTy
 p4tj0XKHC7Ze/cHGxalkAYU/KGvafdnoqayYtS78qHPNPjjzfLqa/2cT3 A==;
X-CSE-ConnectionGUID: vIprcM8oQqKjkgAgtK/dzw==
X-CSE-MsgGUID: ukot23mDRZiMrlOCLxs9ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76755372"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="76755372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 14:41:12 -0800
X-CSE-ConnectionGUID: MV98D4GfRYqrSYKu7DUbEg==
X-CSE-MsgGUID: YYBG9J59Tluy5vr5hZdDKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="228504128"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 14:41:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, umesh.nerlige.ramappa@intel.com,
 christian.koenig@amd.com, pstanner@redhat.com, dakr@kernel.org
Subject: [PATCH v4 0/8] Fix DRM scheduler layering violations in Xe
Date: Wed, 19 Nov 2025 14:40:58 -0800
Message-Id: <20251119224106.3733883-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At XDC, we discussed that drivers should avoid accessing DRM scheduler
internals, misusing DRM scheduler locks, and adopt a well-defined
pending job list iterator. This series proposes the necessary changes to
the DRM scheduler to bring Xe in line with that agreement and updates Xe
to use the new DRM scheduler API.

While here, cleanup LR queue handling and simplify GuC state machine in
Xe too.

v2:
 - Fix checkpatch / naming issues
v3:
 - Only allow pending job list iterator to be called on stopped schedulers
 - Cleanup LR queue handling / fix a few misselanous Xe scheduler issues
v4:
 - Address Niranjana's feedback
 - Add patch to avoid toggling scheduler state in the TDR

Matt

Matthew Brost (8):
  drm/sched: Add several job helpers to avoid drivers touching scheduler
    state
  drm/sched: Add pending job list iterator
  drm/xe: Add dedicated message lock
  drm/xe: Stop abusing DRM scheduler internals
  drm/xe: Only toggle scheduling in TDR if GuC is running
  drm/xe: Do not deregister queues in TDR
  drm/xe: Remove special casing for LR queues in submission
  drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR

 drivers/gpu/drm/scheduler/sched_main.c       |   4 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |   9 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  38 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c           | 362 +++----------------
 drivers/gpu/drm/xe/xe_guc_submit_types.h     |  11 -
 drivers/gpu/drm/xe/xe_hw_fence.c             |  16 -
 drivers/gpu/drm/xe/xe_hw_fence.h             |   2 -
 drivers/gpu/drm/xe/xe_sched_job.c            |   1 +
 drivers/gpu/drm/xe/xe_sched_job_types.h      |   2 +
 drivers/gpu/drm/xe/xe_trace.h                |   5 -
 include/drm/gpu_scheduler.h                  |  82 +++++
 13 files changed, 157 insertions(+), 379 deletions(-)

-- 
2.34.1

