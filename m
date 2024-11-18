Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9829D1BF2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848CF10E599;
	Mon, 18 Nov 2024 23:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqhQzOLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4775110E585;
 Mon, 18 Nov 2024 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973050; x=1763509050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iQ6a/LouePdc9Se4be/vtSdyyt0+f/h9tau0Yc4zn40=;
 b=KqhQzOLFGs2vTMPKNDT2yUtg5I+0szvMPrKF/IjfcGjez5gMzUdFzlWa
 jUZmctFq4YQlz3N1q8RmAtTYlDUfAxj7se62PiWKMLgDU/zBxYLBUUYhi
 MekaqSQ443c1HtPAQhd97yYYWSCLgs1rI7ma9wzAmQldt7ZnJcc9BbZK6
 s5z6CsrPRetVwoS4I4TTjF6xpT9zDL1t8l7lQ8br+yS6P9MUg8EiEw2L+
 S7kMRgFz54tj4ICpPepdbor6KTM0vyAL6uXigMsgjb8OEAg5pjSdSAY/S
 cHC+Iuejao//cocr8ehce3rVGVmRXrtNcrXQjIZHfZO7Q4oXr4RwmH6wT Q==;
X-CSE-ConnectionGUID: /TEUt9GISwmI43Z2W/SlMA==
X-CSE-MsgGUID: 9RSKHzQSS5WCZrCg6ahpow==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31879006"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31879006"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:30 -0800
X-CSE-ConnectionGUID: k4yaSghsRkO7WL2M2VwqCg==
X-CSE-MsgGUID: QWrVrlftRVSAwhup1vC3IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521762"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 24/29] drm/xe: Add xe_hw_fence_user_init
Date: Mon, 18 Nov 2024 15:37:52 -0800
Message-Id: <20241118233757.2374041-25-matthew.brost@intel.com>
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

Add xe_hw_fence_user_init which can create a struct xe_hw_fence from a
user input rather than internal LRC state. Used to import user fence and
export them as dma fences.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_fence.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 0b4f12be3692..2ea4d8bca6eb 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -263,3 +263,20 @@ void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 
 	trace_xe_hw_fence_create(hw_fence);
 }
+
+void xe_hw_fence_user_init(struct dma_fence *fence, struct xe_device *xe,
+			   struct iosys_map seqno_map, u64 seqno)
+{
+	struct xe_hw_fence *hw_fence =
+		container_of(fence, typeof(*hw_fence), dma);
+
+	hw_fence->xe = xe;
+	snprintf(hw_fence->name, sizeof(hw_fence->name), "user");
+	hw_fence->seqno_map = seqno_map;
+
+	INIT_LIST_HEAD(&hw_fence->irq_link);
+	dma_fence_init(fence, &xe_hw_fence_ops, &xe->user_fence_irq.lock,
+		       dma_fence_context_alloc(1), seqno);
+
+	trace_xe_hw_fence_create(hw_fence);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index f13a1c4982c7..76571ef2ef36 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -30,4 +30,7 @@ void xe_hw_fence_free(struct dma_fence *fence);
 
 void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 		      struct iosys_map seqno_map);
+void xe_hw_fence_user_init(struct dma_fence *fence, struct xe_device *xe,
+			   struct iosys_map seqno_map, u64 seqno);
+
 #endif
-- 
2.34.1

