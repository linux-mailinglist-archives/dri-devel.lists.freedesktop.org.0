Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8B9C8BCC3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 21:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AD910E6EA;
	Wed, 26 Nov 2025 20:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmetRkQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369510E68E;
 Wed, 26 Nov 2025 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764188362; x=1795724362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+h5WXPfjqj3jW0WNzc7SQieKs/MYTkWn4gPhUUFsDY8=;
 b=JmetRkQwkBP08PWkPvp5LKgx525+QWWxkg5BAbKsvD+W0b5ireeA7/OD
 6NTBP6Y2lsOKnVVM3/PJyN7vy5JNogyuVHhPQGgkpnKxNFLLe/Kxm51bu
 3CCGpJwJFZfYk0N+426oeJeC3V0QKHGfD/pW16GJS8t79LLNyp0zVYkmj
 DpW8TqfhVR69r3eflRtph368VscgyfA7o+jvRS/lPoD76nXiEODNutFa9
 fR1M3RkN8+M8v0ofDJnf1pmKHO1aMC1qTlas66KP+F0JmDnKJVkAf5uHI
 T54PoWb7lASI+ayYMzWtz36IJ2jzfGqyOrmuXs06QUSCJSY3BfMpvC/S8 g==;
X-CSE-ConnectionGUID: 2Sn5/75jReaAU2mffGVXCA==
X-CSE-MsgGUID: nkScdT3URMuBV8F7Mrcerg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76864166"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="76864166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:19:21 -0800
X-CSE-ConnectionGUID: ZsV1G8LySKeBv4+v893Sng==
X-CSE-MsgGUID: ww1S6IChTUOSuunx45oYiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193137297"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:19:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 5/8] drm/xe: Only toggle scheduling in TDR if GuC is running
Date: Wed, 26 Nov 2025 12:19:13 -0800
Message-Id: <20251126201916.618996-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126201916.618996-1-matthew.brost@intel.com>
References: <20251126201916.618996-1-matthew.brost@intel.com>
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

If the firmware is not running during TDR (e.g., when the driver is
unloading), there's no need to toggle scheduling in the GuC. In such
cases, skip this step.

v4:
 - Bail on wait UC not running (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4166b4ec6a67..693e3a892639 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1274,7 +1274,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		if (exec_queue_reset(q))
 			err = -EIO;
 
-		if (!exec_queue_destroyed(q)) {
+		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
 			/*
 			 * Wait for any pending G2H to flush out before
 			 * modifying state
@@ -1309,6 +1309,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		 */
 		smp_rmb();
 		ret = wait_event_timeout(guc->ct.wq,
+					 !xe_uc_fw_is_running(&guc->fw) ||
 					 !exec_queue_pending_disable(q) ||
 					 xe_guc_read_stopped(guc) ||
 					 vf_recovery(guc), HZ * 5);
-- 
2.34.1

