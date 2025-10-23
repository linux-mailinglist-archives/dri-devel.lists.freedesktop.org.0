Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D1EBFF13C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCF010E880;
	Thu, 23 Oct 2025 04:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQ0YnzAL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493DC10E863;
 Thu, 23 Oct 2025 04:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761192487; x=1792728487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vhb/X5yWlEuf59UUJffs44ZUtPBbcq/Pq+eukqzG1XY=;
 b=lQ0YnzALkROa4KyK4R6uMp1s8fqLB9La3FBavxmyep7QKdLTeqnvpQBg
 GLh8VHpvyzsLFkIa6SA/2WH2JvC6FRa0FFiCdTImdlFMZWDwJ1667CAYu
 VQQPckchVV8yMyhd7wIGNbQpUV05liRSq/rdvWwwdXCXGlCB5+kIlERkS
 aEXUcRMW6uToPMfoPL+wvQC/gjqzONWUrtaGwLDzfa7M8q7V4HdQOowr7
 ngzzqMudtlezUM2NBTTmHbxLB1UYHIg0f1sMUjhzRf0wsKKHJKCnyzET2
 bSg4W8oGN8+PrrHLZqWi+nG+GjFfD5MP18L8SlaZJHBpA3JOR/PLdpu4g A==;
X-CSE-ConnectionGUID: pcWNc2lbQ/uPeTd1Z0MTwg==
X-CSE-MsgGUID: s4gBeUeRTQq/VjdCoaUVmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63391289"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63391289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
X-CSE-ConnectionGUID: /jcOttF2QJWMYzPlXT32hQ==
X-CSE-MsgGUID: pqg6hjhLSy2U6VOY+61JOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="189175760"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com
Subject: [RFC PATCH 12/14] drm/xe: Drop HW fence slab
Date: Wed, 22 Oct 2025 21:07:58 -0700
Message-Id: <20251023040800.970283-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023040800.970283-1-matthew.brost@intel.com>
References: <20251023040800.970283-1-matthew.brost@intel.com>
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

Helps with disconnecting fences from Xe module.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 25 ++-----------------------
 drivers/gpu/drm/xe/xe_hw_fence.h |  3 ---
 drivers/gpu/drm/xe/xe_module.c   |  5 -----
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 3456bec93c70..5edcf057aceb 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -6,7 +6,6 @@
 #include "xe_hw_fence.h"
 
 #include <linux/device.h>
-#include <linux/slab.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -16,28 +15,9 @@
 #include "xe_map.h"
 #include "xe_trace.h"
 
-static struct kmem_cache *xe_hw_fence_slab;
-
-int __init xe_hw_fence_module_init(void)
-{
-	xe_hw_fence_slab = kmem_cache_create("xe_hw_fence",
-					     sizeof(struct xe_hw_fence), 0,
-					     SLAB_HWCACHE_ALIGN, NULL);
-	if (!xe_hw_fence_slab)
-		return -ENOMEM;
-
-	return 0;
-}
-
-void xe_hw_fence_module_exit(void)
-{
-	rcu_barrier();
-	kmem_cache_destroy(xe_hw_fence_slab);
-}
-
 static struct xe_hw_fence *fence_alloc(void)
 {
-	return kmem_cache_zalloc(xe_hw_fence_slab, GFP_KERNEL);
+	return kzalloc(sizeof(struct xe_hw_fence), GFP_KERNEL);
 }
 
 static void fence_free(struct rcu_head *rcu)
@@ -45,8 +25,7 @@ static void fence_free(struct rcu_head *rcu)
 	struct xe_hw_fence *fence =
 		container_of(rcu, struct xe_hw_fence, dma.rcu);
 
-	if (!WARN_ON_ONCE(!fence))
-		kmem_cache_free(xe_hw_fence_slab, fence);
+	kfree(fence);
 }
 
 static void hw_fence_irq_run_cb(struct irq_work *work)
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index f13a1c4982c7..96f34332fd8d 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -11,9 +11,6 @@
 /* Cause an early wrap to catch wrapping errors */
 #define XE_FENCE_INITIAL_SEQNO (-127)
 
-int xe_hw_fence_module_init(void);
-void xe_hw_fence_module_exit(void);
-
 void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d08338fc3bc1..32517bcd533c 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -12,7 +12,6 @@
 
 #include "xe_drv.h"
 #include "xe_configfs.h"
-#include "xe_hw_fence.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_observation.h"
@@ -114,10 +113,6 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_configfs_init,
 		.exit = xe_configfs_exit,
 	},
-	{
-		.init = xe_hw_fence_module_init,
-		.exit = xe_hw_fence_module_exit,
-	},
 	{
 		.init = xe_sched_job_module_init,
 		.exit = xe_sched_job_module_exit,
-- 
2.34.1

