Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E483966ED
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 19:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5739D6E97D;
	Mon, 31 May 2021 17:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21406E977;
 Mon, 31 May 2021 17:22:59 +0000 (UTC)
IronPort-SDR: 0OaAMBprLtcr3awmRRmZoph5NTq33e3zd5H8y3qiXCFzK37/6MhoyhZ/4VQF//qGIsqhYJiUPv
 gNMYoCyUb94Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="201520242"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="201520242"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 10:22:59 -0700
IronPort-SDR: 7pu2lUhFTqQ7ljjUGfEQ7Mq9L1giiJBwFS9IZF3HzjeRWoGybpHu16x4sfj+dGE5ElJojFSiJi
 sSv/vX0+mDcw==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="416211048"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.142])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 10:22:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 12/15] drm/i915/lmem: Verify checks for lmem residency
Date: Mon, 31 May 2021 19:22:25 +0200
Message-Id: <20210531172228.70846-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531172228.70846-1-thomas.hellstrom@linux.intel.com>
References: <20210531172228.70846-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since objects can be migrated or evicted when not pinned or locked,
update the checks for lmem residency or future residency so that
the value returned is not immediately stale.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
v2: Simplify i915_gem_object_migratable() (Reported by Mattew Auld)
---
 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c     | 42 +++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.c   | 18 +++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h   |  4 ++
 4 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index caf0414e0b50..f947295d7e53 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11756,7 +11756,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 
 	/* object is backed with LMEM for discrete */
 	i915 = to_i915(obj->base.dev);
-	if (HAS_LMEM(i915) && !i915_gem_object_is_lmem(obj)) {
+	if (HAS_LMEM(i915) && !i915_gem_object_validates_to_lmem(obj)) {
 		/* object is "remote", not in local memory */
 		i915_gem_object_put(obj);
 		return ERR_PTR(-EREMOTE);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index 2b8cd15de1d9..d539dffa1554 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -23,10 +23,50 @@ i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
 	return io_mapping_map_wc(&obj->mm.region->iomap, offset, size);
 }
 
+/**
+ * i915_gem_object_validates_to_lmem - Whether the object is resident in
+ * lmem when pages are present.
+ * @obj: The object to check.
+ *
+ * Migratable objects residency may change from under us if the object is
+ * not pinned or locked. This function is intended to be used to check whether
+ * the object can only reside in lmem when pages are present.
+ *
+ * Return: Whether the object is always resident in lmem when pages are
+ * present.
+ */
+bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object *obj)
+{
+	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
+
+	return !i915_gem_object_migratable(obj) &&
+		mr && (mr->type == INTEL_MEMORY_LOCAL ||
+		       mr->type == INTEL_MEMORY_STOLEN_LOCAL);
+}
+
+/**
+ * i915_gem_object_is_lmem - Whether the object is resident in
+ * lmem
+ * @obj: The object to check.
+ *
+ * Even if an object is allowed to migrate and change memory region,
+ * this function checks whether it will always be present in lmem when
+ * valid *or* if that's not the case, whether it's currently resident in lmem.
+ * For migratable and evictable objects, the latter only makes sense when
+ * the object is locked.
+ *
+ * Return: Whether the object migratable but resident in lmem, or not
+ * migratable and will be present in lmem when valid.
+ */
 bool i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
 {
-	struct intel_memory_region *mr = obj->mm.region;
+	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
 
+#ifdef CONFIG_LOCKDEP
+	if (i915_gem_object_migratable(obj) &&
+	    i915_gem_object_evictable(obj))
+		assert_object_held(obj);
+#endif
 	return mr && (mr->type == INTEL_MEMORY_LOCAL ||
 		      mr->type == INTEL_MEMORY_STOLEN_LOCAL);
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 16eac5ea9238..cf18c430d51f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -457,6 +457,24 @@ bool i915_gem_object_evictable(struct drm_i915_gem_object *obj)
 	return pin_count == 0;
 }
 
+/**
+ * i915_gem_object_migratable - Whether the object is migratable out of the
+ * current region.
+ * @obj: Pointer to the object.
+ *
+ * Return: Whether the object is allowed to be resident in other
+ * regions than the current while pages are present.
+ */
+bool i915_gem_object_migratable(struct drm_i915_gem_object *obj)
+{
+	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
+
+	if (!mr)
+		return false;
+
+	return obj->mm.n_placements > 1;
+}
+
 void i915_gem_init__objects(struct drm_i915_private *i915)
 {
 	INIT_WORK(&i915->mm.free_work, __i915_gem_free_work);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index ae5930e307d5..a3ad8cf4eefd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -596,6 +596,10 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj);
 
 bool i915_gem_object_evictable(struct drm_i915_gem_object *obj);
 
+bool i915_gem_object_migratable(struct drm_i915_gem_object *obj);
+
+bool i915_gem_object_validates_to_lmem(struct drm_i915_gem_object *obj);
+
 #ifdef CONFIG_MMU_NOTIFIER
 static inline bool
 i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
-- 
2.31.1

