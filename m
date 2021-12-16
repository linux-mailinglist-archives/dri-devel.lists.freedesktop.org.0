Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF54747748D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563441122C1;
	Thu, 16 Dec 2021 14:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C42910FF0E;
 Thu, 16 Dec 2021 14:28:06 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 04/17] drm/i915: Take object lock in i915_ggtt_pin if ww is
 not set
Date: Thu, 16 Dec 2021 15:27:36 +0100
Message-Id: <20211216142749.1966107-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
References: <20211216142749.1966107-1-maarten.lankhorst@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_vma_wait_for_bind needs the vma lock held, fix the caller.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 40 +++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 8eb531b04d3e..de24e4b3b19b 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1441,23 +1441,15 @@ static void flush_idle_contexts(struct intel_gt *gt)
 	intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
 }
 
-int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
-		  u32 align, unsigned int flags)
+static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
+			   u32 align, unsigned int flags)
 {
 	struct i915_address_space *vm = vma->vm;
 	int err;
 
-	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
-
-#ifdef CONFIG_LOCKDEP
-	WARN_ON(!ww && dma_resv_held(vma->obj->base.resv));
-#endif
-
 	do {
-		if (ww)
-			err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
-		else
-			err = i915_vma_pin(vma, 0, align, flags | PIN_GLOBAL);
+		err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
+
 		if (err != -ENOSPC) {
 			if (!err) {
 				err = i915_vma_wait_for_bind(vma);
@@ -1476,6 +1468,30 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	} while (1);
 }
 
+int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
+		  u32 align, unsigned int flags)
+{
+	struct i915_gem_ww_ctx _ww;
+	int err;
+
+	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
+
+	if (ww)
+		return __i915_ggtt_pin(vma, ww, align, flags);
+
+#ifdef CONFIG_LOCKDEP
+	WARN_ON(dma_resv_held(vma->obj->base.resv));
+#endif
+
+	for_i915_gem_ww(&_ww, err, true) {
+		err = i915_gem_object_lock(vma->obj, &_ww);
+		if (!err)
+			err = __i915_ggtt_pin(vma, &_ww, align, flags);
+	}
+
+	return err;
+}
+
 static void __vma_close(struct i915_vma *vma, struct intel_gt *gt)
 {
 	/*
-- 
2.34.1

