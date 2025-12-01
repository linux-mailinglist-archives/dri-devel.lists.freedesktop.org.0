Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96CC98BE0
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6279F10E45A;
	Mon,  1 Dec 2025 18:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aq4l8lEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2756D10E457;
 Mon,  1 Dec 2025 18:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764614399; x=1796150399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TTJ63CD72ecPmQy/qVjJCSw2q7IHBX5hktT4tU8SKdk=;
 b=Aq4l8lEwdiD+JGOiIscNEEZ4QCNNDbBWvR825D15Npqol5G4X+FYMpX8
 CAMTmQ8GDrLSh15TrI8iFlhe/Ye7K96K/DH/t2V7MO/6S5+gybwCj/v4o
 l4jFPWHcWjlEbpJ9CrY/zJFXaa2Ku+uVON9qz+z8OmrHvY1XZWuwbJEO/
 1eWaFvWbygWQiE8kFrlJDLoJohzWCRodbMbLnk/H/JLZHN/Lvyiz48ybU
 Ap66sue6g6x1x3jy/X75MfoX3pQ+mWdaVZcRwWm71R8KHMl+j4JOeZTee
 b9CIvybMear9nJ0vKB1ih4lO1LzvqivdMlOh1cBIwa8zE1F4sqC4zNF8n w==;
X-CSE-ConnectionGUID: 6FeN2Z4tRFqYNW2uyqmkdQ==
X-CSE-MsgGUID: GQBJX61yRjiGOULoT+E6zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78031141"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="78031141"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:39:58 -0800
X-CSE-ConnectionGUID: qcDuS/PoSiSVGJbmeyg0tg==
X-CSE-MsgGUID: wX8MZamrQsaPR+RU1zswsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194359099"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:39:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/9] Fix DRM scheduler layering violations in Xe
Date: Mon,  1 Dec 2025 10:39:45 -0800
Message-Id: <20251201183954.852637-1-matthew.brost@intel.com>
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
Xe too. Also rework LRC timestamp sampling to avoid scheduling toggle.

v2:
 - Fix checkpatch / naming issues
v3:
 - Only allow pending job list iterator to be called on stopped schedulers
 - Cleanup LR queue handling / fix a few misselanous Xe scheduler issues
v4:
 - Address Niranjana's feedback
 - Add patch to avoid toggling scheduler state in the TDR
v5:
 - Rebase
 - Fixup LRC timeout check (Umesh)
v6:
 - Fix VF bugs (Testing)
v7:
 - Disable timestamp WA on VF

Matt

Matthew Brost (9):
  drm/sched: Add several job helpers to avoid drivers touching scheduler
    state
  drm/sched: Add pending job list iterator
  drm/xe: Add dedicated message lock
  drm/xe: Stop abusing DRM scheduler internals
  drm/xe: Only toggle scheduling in TDR if GuC is running
  drm/xe: Do not deregister queues in TDR
  drm/xe: Remove special casing for LR queues in submission
  drm/xe: Disable timestamp WA on VFs
  drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR

 drivers/gpu/drm/scheduler/sched_main.c       |   4 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |   9 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  37 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c           | 362 +++----------------
 drivers/gpu/drm/xe/xe_guc_submit_types.h     |  11 -
 drivers/gpu/drm/xe/xe_hw_fence.c             |  16 -
 drivers/gpu/drm/xe/xe_hw_fence.h             |   2 -
 drivers/gpu/drm/xe/xe_lrc.c                  |  45 ++-
 drivers/gpu/drm/xe/xe_lrc.h                  |   3 +-
 drivers/gpu/drm/xe/xe_ring_ops.c             |  25 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |   1 +
 drivers/gpu/drm/xe/xe_sched_job_types.h      |   2 +
 drivers/gpu/drm/xe/xe_trace.h                |   5 -
 include/drm/gpu_scheduler.h                  |  82 +++++
 16 files changed, 211 insertions(+), 397 deletions(-)

-- 
2.34.1

