Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B58A3BC845
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E88E89B0D;
	Tue,  6 Jul 2021 09:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EB889B0D;
 Tue,  6 Jul 2021 09:07:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="230810006"
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="230810006"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 02:07:06 -0700
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="486078626"
Received: from yunhanch-mobl.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.214.173.133])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 02:07:03 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] dma-fence: export dma_fence_might_wait
Date: Tue,  6 Jul 2021 10:05:58 +0100
Message-Id: <20210706090559.1589544-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It might be useful for drivers to annotate a path where hitting the
actual wait path might be difficult or unlikely through normal testing.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-fence.c | 19 ++++++++++++++++---
 include/linux/dma-fence.h   |  2 ++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ce0f5eff575d..f2cd036b5243 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -335,6 +335,21 @@ void __dma_fence_might_wait(void)
 }
 #endif
 
+/**
+ * dma_fence_might_wait - entering a section which might wait on DMA fence
+ * critical section.
+ *
+ * This is also potentially useful for drivers to call directly, when annotating
+ * a path where hitting the actual wait path might be difficult or unlikely
+ * through normal testing.
+ */
+void dma_fence_might_wait(void)
+{
+	might_sleep();
+	__dma_fence_might_wait();
+}
+EXPORT_SYMBOL(dma_fence_might_wait);
+
 
 /**
  * dma_fence_signal_timestamp_locked - signal completion of a fence
@@ -495,9 +510,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 	if (WARN_ON(timeout < 0))
 		return -EINVAL;
 
-	might_sleep();
-
-	__dma_fence_might_wait();
+	dma_fence_might_wait();
 
 	trace_dma_fence_wait_start(fence);
 	if (fence->ops->wait)
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..37bf4beed93f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -370,6 +370,8 @@ static inline void dma_fence_end_signalling(bool cookie) {}
 static inline void __dma_fence_might_wait(void) {}
 #endif
 
+void dma_fence_might_wait(void);
+
 int dma_fence_signal(struct dma_fence *fence);
 int dma_fence_signal_locked(struct dma_fence *fence);
 int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
-- 
2.26.3

