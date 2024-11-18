Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F89D1BFD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB5510E576;
	Mon, 18 Nov 2024 23:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9qzgR2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C3210E585;
 Mon, 18 Nov 2024 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973050; x=1763509050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C02NA37fN9dm3BF7bGK31pqMn+aFCtASLHdm9hCh/k4=;
 b=h9qzgR2+V3epog6qoHy9w/BMBRnIGSdiij6ePFyKQPcapEKtJsRUmKRB
 UwlXYUiEUn6wduV9V/REmFMvonUftD91rb2g/g14d8r2kugjXAVtSlvic
 hvyFtGPhChk6XiPNGIe0aNVb3UBi/DCVduf45mKdz1+spVTk2a0CSc62b
 ucOKPKQ8LFTe50lj8gTBEfcsgIJ3TyE6GlS3sC0AX7yZ0L6X/6Mp64+ZY
 PID3aq1V6IjhfFMP3Rbs87RwRKaIJ1XEvSHiZ/fy07YSEYIwkplIsea1r
 1JWXqyLxoBWkkSayoNm4yvka/X/NV11iAsaNYImAqGJ6y9khsQLUfW2go w==;
X-CSE-ConnectionGUID: 23QZUSSJSrOiUsUfTuYNvA==
X-CSE-MsgGUID: g4Dn8+UrT7yibgruFP+btA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878998"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878998"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:29 -0800
X-CSE-ConnectionGUID: ZjHVHXT9QDaHpvEo7aDu5A==
X-CSE-MsgGUID: VLvUIeWJSt+IcI6yzvRDcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521759"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 23/29] drm/xe: Add user fence IRQ handler
Date: Mon, 18 Nov 2024 15:37:51 -0800
Message-Id: <20241118233757.2374041-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

Imported user fences will not be tied to a specific queue or hardware
engine class. Therefore, a device IRQ handler is needed to signal the
associated exported DMA fences.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 4 ++++
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 4 +++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bbdff4308b2e..573b5f3df0c8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -39,6 +39,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_hw_engine_group.h"
+#include "xe_hw_fence.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
 #include "xe_memirq.h"
@@ -902,6 +903,7 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_hw_fence_irq_init(&xe->user_fence_irq);
 	for_each_gt(gt, xe, id) {
 		last_gt = id;
 
@@ -944,6 +946,7 @@ int xe_device_probe(struct xe_device *xe)
 	xe_oa_fini(xe);
 
 err_fini_gt:
+	xe_hw_fence_irq_finish(&xe->user_fence_irq);
 	for_each_gt(gt, xe, id) {
 		if (id < last_gt)
 			xe_gt_remove(gt);
@@ -979,6 +982,7 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_heci_gsc_fini(xe);
 
+	xe_hw_fence_irq_finish(&xe->user_fence_irq);
 	for_each_gt(gt, xe, id)
 		xe_gt_remove(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8592f1b02db1..3ac118c6f85e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -507,6 +507,9 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	/** @user_fence_irq: User fence IRQ handler */
+	struct xe_hw_fence_irq user_fence_irq;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c4b0dc3be39c..2c9aa5343971 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -822,8 +822,10 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 	if (hwe->irq_handler)
 		hwe->irq_handler(hwe, intr_vec);
 
-	if (intr_vec & GT_RENDER_USER_INTERRUPT)
+	if (intr_vec & GT_RENDER_USER_INTERRUPT) {
+		xe_hw_fence_irq_run(&gt_to_xe(hwe->gt)->user_fence_irq);
 		xe_hw_fence_irq_run(hwe->fence_irq);
+	}
 }
 
 /**
-- 
2.34.1

