Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A70865F98C5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 08:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E92C10E664;
	Mon, 10 Oct 2022 06:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D252B10E642;
 Mon, 10 Oct 2022 06:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665385134; x=1696921134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mFfZPkMd1ggMqYWnEmA12yucnrHzlOupuAn4+u79H9o=;
 b=Frwe8xOHDT7zvn5KwU5sw2tHPvTaS7a52qDh5Sjwcyp72r6LTkqy85rA
 fYNNd60kMwtknQYGWPs2nY5apS/W57VZe55B6V38z8BBeyTlRymBN5ddm
 U2O3VPvb4nEeur5lzSvPnoSUlgEJ/abhQpqC+iyUbaGMsbEvhBAPoq7QO
 GiZu2Dg6VR5EwVVJ0RAMQcbAYMb7oKiYzzGYgC5Z8/gxiqMQd7Eiw+Ds8
 9nsRz9w/ZQvT6GheLToQdwc53tpoafQbUhJYbPJQ7Vfh4qsUc1Vs8VgS8
 2gbCzCcRVHGKc0TgZwIuCTQK8n3f/DJaoMXHL2espJx7cKaj5PeR7Lu9W A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="305752993"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="305752993"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2022 23:58:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="576947133"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="576947133"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 09 Oct 2022 23:58:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/17] drm/i915/vm_bind: Add
 __i915_sw_fence_await_reservation()
Date: Sun,  9 Oct 2022 23:58:11 -0700
Message-Id: <20221010065826.32037-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add function __i915_sw_fence_await_reservation() for
asynchronous wait on a dma-resv object with specified
dma_resv_usage. This is required for async vma unbind
with vm_bind.

Acked-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 28 +++++++++++++++++++++-------
 drivers/gpu/drm/i915/i915_sw_fence.h | 23 +++++++++++++++++------
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index cc2a8821d22a..ae06d35db056 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -7,7 +7,6 @@
 #include <linux/slab.h>
 #include <linux/dma-fence.h>
 #include <linux/irq_work.h>
-#include <linux/dma-resv.h>
 
 #include "i915_sw_fence.h"
 #include "i915_selftest.h"
@@ -569,11 +568,26 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 	return ret;
 }
 
-int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
-				    struct dma_resv *resv,
-				    bool write,
-				    unsigned long timeout,
-				    gfp_t gfp)
+/**
+ * __i915_sw_fence_await_reservation() - Setup a fence to wait on a dma-resv
+ * object with specified usage.
+ * @fence: the fence that needs to wait
+ * @resv: dma-resv object
+ * @usage: dma_resv_usage (See enum dma_resv_usage)
+ * @timeout: how long to wait in jiffies
+ * @gfp: allocation mode
+ *
+ * Setup the @fence to asynchronously wait on dma-resv object @resv for
+ * @usage to complete before signaling.
+ *
+ * Returns 0 if there is nothing to wait on, -ve error code upon error
+ * and >0 upon successfully setting up the wait.
+ */
+int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
+				      struct dma_resv *resv,
+				      enum dma_resv_usage usage,
+				      unsigned long timeout,
+				      gfp_t gfp)
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *f;
@@ -582,7 +596,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 	debug_fence_assert(fence);
 	might_sleep_if(gfpflags_allow_blocking(gfp));
 
-	dma_resv_iter_begin(&cursor, resv, dma_resv_usage_rw(write));
+	dma_resv_iter_begin(&cursor, resv, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, f) {
 		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
 							gfp);
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
index f752bfc7c6e1..9c4859dc4c0d 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence.h
@@ -10,13 +10,13 @@
 #define _I915_SW_FENCE_H_
 
 #include <linux/dma-fence.h>
+#include <linux/dma-resv.h>
 #include <linux/gfp.h>
 #include <linux/kref.h>
 #include <linux/notifier.h> /* for NOTIFY_DONE */
 #include <linux/wait.h>
 
 struct completion;
-struct dma_resv;
 struct i915_sw_fence;
 
 enum i915_sw_fence_notify {
@@ -89,11 +89,22 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 				  unsigned long timeout,
 				  gfp_t gfp);
 
-int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
-				    struct dma_resv *resv,
-				    bool write,
-				    unsigned long timeout,
-				    gfp_t gfp);
+int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
+				      struct dma_resv *resv,
+				      enum dma_resv_usage usage,
+				      unsigned long timeout,
+				      gfp_t gfp);
+
+static inline int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
+						  struct dma_resv *resv,
+						  bool write,
+						  unsigned long timeout,
+						  gfp_t gfp)
+{
+	return __i915_sw_fence_await_reservation(fence, resv,
+						 dma_resv_usage_rw(write),
+						 timeout, gfp);
+}
 
 bool i915_sw_fence_await(struct i915_sw_fence *fence);
 void i915_sw_fence_complete(struct i915_sw_fence *fence);
-- 
2.21.0.rc0.32.g243a4c7e27

