Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8937A785
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 15:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96316EA43;
	Tue, 11 May 2021 13:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006066EA3C;
 Tue, 11 May 2021 13:26:18 +0000 (UTC)
IronPort-SDR: LfZxtojGUuTKzRhnuYiSLrtEFh/xSEYi8WTs5VZxVIhCRNj3Z/CBbItA7oFxHcmieoY9VlHyFA
 I63bXmokkM0Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196345417"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196345417"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 06:26:18 -0700
IronPort-SDR: OsMYZ0cbbp5SlmZJEY88ZOOUWYIIqDsCbevHE2iDtFpfo3suD1dtAWQhZnpiDkZU9KDZwAnJbI
 KPUK4gCl3eSQ==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="468905441"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.168])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 06:26:17 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915/lmem: Verify checks for lmem residency
Date: Tue, 11 May 2021 15:25:25 +0200
Message-Id: <20210511132525.377190-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since objects can be migrated or evicted when not pinned or locked,
update the checks for lmem residency or future residency so that
the value returned is not immediately stale.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c     | 42 +++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.c   | 29 ++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h   |  4 ++
 4 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index de1f13d203b5..b95def2d5af3 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11615,7 +11615,7 @@ intel_user_framebuffer_create(struct drm_device *dev,
 
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
index c53488f391dd..0475b1c94454 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -458,6 +458,35 @@ bool i915_gem_object_evictable(struct drm_i915_gem_object *obj)
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
+	struct intel_memory_region *placement;
+	int i;
+
+	if (!mr)
+		return false;
+
+	if (!obj->mm.n_placements)
+		return false;
+
+	for (i = 0; i < obj->mm.n_placements; ++i) {
+		placement = obj->mm.placements[i];
+		if (placement != mr)
+			return true;
+	}
+
+	return false;
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
2.30.2

