Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C321D46173A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 14:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9F66EE0D;
	Mon, 29 Nov 2021 13:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D38E6EB2C;
 Mon, 29 Nov 2021 13:57:18 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/16] drm/i915: Force ww lock for
 i915_gem_object_ggtt_pin_ww
Date: Mon, 29 Nov 2021 14:47:24 +0100
Message-Id: <20211129134735.628712-6-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
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

We will need the lock to unbind the vma, and wait for bind to complete.
Remove the special casing for the !ww path, and force ww locking for all.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h |  7 ++-----
 drivers/gpu/drm/i915/i915_gem.c | 26 ++++++++++++++++++++++----
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 1bfadd9127fc..8322abe194da 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1842,13 +1842,10 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 			    const struct i915_ggtt_view *view,
 			    u64 size, u64 alignment, u64 flags);
 
-static inline struct i915_vma * __must_check
+struct i915_vma * __must_check
 i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
 			 const struct i915_ggtt_view *view,
-			 u64 size, u64 alignment, u64 flags)
-{
-	return i915_gem_object_ggtt_pin_ww(obj, NULL, view, size, alignment, flags);
-}
+			 u64 size, u64 alignment, u64 flags);
 
 int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 			   unsigned long flags);
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 527228d4da7e..e83522953cde 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -877,6 +877,8 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 	struct i915_vma *vma;
 	int ret;
 
+	GEM_WARN_ON(!ww);
+
 	if (flags & PIN_MAPPABLE &&
 	    (!view || view->type == I915_GGTT_VIEW_NORMAL)) {
 		/*
@@ -936,10 +938,7 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 			return ERR_PTR(ret);
 	}
 
-	if (ww)
-		ret = i915_vma_pin_ww(vma, ww, size, alignment, flags | PIN_GLOBAL);
-	else
-		ret = i915_vma_pin(vma, size, alignment, flags | PIN_GLOBAL);
+	ret = i915_vma_pin_ww(vma, ww, size, alignment, flags | PIN_GLOBAL);
 
 	if (ret)
 		return ERR_PTR(ret);
@@ -959,6 +958,25 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 	return vma;
 }
 
+struct i915_vma * __must_check
+i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
+			 const struct i915_ggtt_view *view,
+			 u64 size, u64 alignment, u64 flags)
+{
+	struct i915_gem_ww_ctx ww;
+	struct i915_vma *ret;
+	int err;
+
+	for_i915_gem_ww(&ww, err, true) {
+		err = i915_gem_object_lock(obj, &ww);
+		if (!err)
+			ret = i915_gem_object_ggtt_pin_ww(obj, &ww, view, size,
+							  alignment, flags);
+	}
+
+	return err ? ERR_PTR(err) : ret;
+}
+
 int
 i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file_priv)
-- 
2.34.0

