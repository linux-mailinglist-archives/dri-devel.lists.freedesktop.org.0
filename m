Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F1764AB61
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 00:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D67710E2C0;
	Mon, 12 Dec 2022 23:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939EF10E2AE;
 Mon, 12 Dec 2022 23:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670886933; x=1702422933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s2SytYlZ4XW8IHH4S3RWx/PSLW3YXP5X/WijwHLKFdA=;
 b=PuO9yBP7KRCTqggo/MxVYSSmzumxOtzIX7qd27KKX31S0dJlRdmWPT+B
 +sOsFbSk+ZgbRjxMNoo2oXH3mmjNv/zhvmIE3wNkemj7087XALrniPyw2
 tFIszFnVskrubswgxdZebSWLUYOq4753ble7se5+LuIMy3/xiG8Spah9Q
 lmuK5GL6H0iglZ3pxx8ZY200chH3CCEcG+nqq/sNLXL9FNgPkRNHTVvGo
 Rht5npTPhrwB2i6tOze+QQEXqZ5dvoigxx8dTpEXUYikw4szMqIu+A+Z3
 z2izu77GOrq7KwlGUXX5nBNhAnBQlhD6Z7ekKaeYGI8x9SR7imSPkeHHp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="380196342"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="380196342"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="679090304"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="679090304"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:32 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 02/23] drm/i915/vm_bind: Add
 __i915_sw_fence_await_reservation()
Date: Mon, 12 Dec 2022 15:15:06 -0800
Message-Id: <20221212231527.2384-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
References: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
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

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

