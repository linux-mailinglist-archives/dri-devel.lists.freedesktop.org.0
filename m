Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32334BE5714
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454B010E34A;
	Thu, 16 Oct 2025 20:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhducLWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAFE10E34A;
 Thu, 16 Oct 2025 20:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760647710; x=1792183710;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cySD8qm3dHMp4fc1ml3x7cpoaZle6ufIahZHdYvF3fU=;
 b=YhducLWTCXOROQJGk4XSMatGCpbX3fN7IcFX4XjPjMKla12RgTibt3vk
 uLed/0F7SDmSogzqHMiJDwHKvZ5CEPfEbbiTL/1ELv2+ogC9qiUUeFY0m
 DdfXFoVKSFnW3u1JbWQ5LT8C8RshB/vL/Qehf2C5I1JDOvIgPC4IawzuR
 B8CMEbKJ9WtwzGo+kGUd4KHlcIfLIXlwVrSXPqV6atJJoJxjPATeuICsT
 LMU0MYPrUK7kpNS36I+dU7v+ohHpgoO3mAsltAoBk6/Krc/xnQ+wKVWh0
 /69UIoErDvzuFQylOaZ7aVgIXFeVw+BoP5xuwDcVFWqbl+JoS+zBUz9+H A==;
X-CSE-ConnectionGUID: z/0K4UofQzaPyLoeGN7TOw==
X-CSE-MsgGUID: 4ANhEkOyTWKS0pmDkSq/AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65472178"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="65472178"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:30 -0700
X-CSE-ConnectionGUID: dCtaOC3DSbCYa2y+37poNA==
X-CSE-MsgGUID: H6eODv5IQoORE6TGoSd+Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186572837"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:48:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [PATCH v3 0/7] Fix DRM scheduler layering violations in Xe
Date: Thu, 16 Oct 2025 13:48:19 -0700
Message-Id: <20251016204826.284077-1-matthew.brost@intel.com>
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

While here, cleanup LR queue handling in Xe too.

v2:
 - Fix checkpatch / naming issues
v3:
 - Only allow pending job list iterator to be called on stopped schedulers
 - Cleanup LR queue handling / fix a few misselanous Xe scheduler issues

Matt

Matthew Brost (7):
  drm/sched: Add pending job list iterator
  drm/sched: Add several job helpers to avoid drivers touching scheduler
    state
  drm/xe: Add dedicated message lock
  drm/xe: Stop abusing DRM scheduler internals
  drm/xe: Do not deregister queues in TDR
  drm/xe: Remove special casing for LR queues in submission
  drm/xe: Only toggle scheduling in TDR if GuC is running

 drivers/gpu/drm/scheduler/sched_main.c       |   4 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |   9 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  38 +--
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c           | 252 ++-----------------
 drivers/gpu/drm/xe/xe_guc_submit_types.h     |  11 -
 drivers/gpu/drm/xe/xe_hw_fence.c             |  16 --
 drivers/gpu/drm/xe/xe_hw_fence.h             |   2 -
 include/drm/gpu_scheduler.h                  |  80 ++++++
 10 files changed, 117 insertions(+), 299 deletions(-)

-- 
2.34.1

