Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB471C714EF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 23:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7427210E6A5;
	Wed, 19 Nov 2025 22:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8DHsGuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4546A10E26E;
 Wed, 19 Nov 2025 22:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763592074; x=1795128074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ghv8ILOtLvr5X5SCSH5vSjVG/pPb6ZoqyLViLCu1wkg=;
 b=N8DHsGuWbXESCsVUVIXUKxXSrquLpdpc81DY7raLk8ZWKLUFMix7j+ak
 3m2hcLOllAtWMEATmU0cihk/SqosEywzz+PYM7wNrxubFfHUToMgy8Ah4
 vEquNEw7loT+IqbBgZy9A4cKfCWvYKd48bEO8yDnpP/XE+McujGZ/+oTd
 eLhSlIq53ON/7TWKiY5W+ArqkQFzFluFAs5xIsL5rVHPmxPlzzk8jKf4p
 CmR7ftmK6R7O1qnL0GdIBnziif8KhjBLZdTb1gLjZvlP35o62ZecB6e4W
 1nPck6OJ1lU1JEa/brS4Orvn4bHYHXcFBYzScM8YVueWM/g7lVh3cWtDy Q==;
X-CSE-ConnectionGUID: ZGm3Em1ISz+2oiL5UuHAAQ==
X-CSE-MsgGUID: e2hQeL8ZQLGepvLSlXorUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76755398"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="76755398"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 14:41:12 -0800
X-CSE-ConnectionGUID: IF98Np5oTNSa6RwId6fFuw==
X-CSE-MsgGUID: vb+3EXasRt+HyZiiG5ob1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="228504144"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 14:41:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, umesh.nerlige.ramappa@intel.com,
 christian.koenig@amd.com, pstanner@redhat.com, dakr@kernel.org
Subject: [PATCH v4 5/8] drm/xe: Only toggle scheduling in TDR if GuC is running
Date: Wed, 19 Nov 2025 14:41:03 -0800
Message-Id: <20251119224106.3733883-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119224106.3733883-1-matthew.brost@intel.com>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3ee35d4873bc..648c9ea06749 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1277,7 +1277,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		if (exec_queue_reset(q))
 			err = -EIO;
 
-		if (!exec_queue_destroyed(q)) {
+		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
 			/*
 			 * Wait for any pending G2H to flush out before
 			 * modifying state
@@ -1312,6 +1312,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		 */
 		smp_rmb();
 		ret = wait_event_timeout(guc->ct.wq,
+					 !xe_uc_fw_is_running(&guc->fw) ||
 					 !exec_queue_pending_disable(q) ||
 					 xe_guc_read_stopped(guc) ||
 					 vf_recovery(guc), HZ * 5);
-- 
2.34.1

