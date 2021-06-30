Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031A63B82AE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 15:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47DD6E9CE;
	Wed, 30 Jun 2021 13:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6FC6E105;
 Wed, 30 Jun 2021 13:07:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="195634525"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="195634525"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 06:07:19 -0700
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="558290333"
Received: from vanderss-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.133])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 06:07:17 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gem: Make our dma-buf exporter dynamic
Date: Wed, 30 Jun 2021 15:07:00 +0200
Message-Id: <20210630130701.349458-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210630130701.349458-1-thomas.hellstrom@linux.intel.com>
References: <20210630130701.349458-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com, "Michael J . Ruhl" <michael.j.ruhl@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If our exported dma-bufs are imported by another instance of our driver,
that instance will typically have the imported dma-bufs locked during
dma_buf_map_attachment(). But the exporter also locks the same reservation
object in the map_dma_buf() callback, which leads to recursive locking.

Add a live selftest to exercise both dynamic and non-dynamic exports,
and as a workaround until we fully support dynamic import and export,
declare the exporter dynamic by providing pin() and unpin() implementations.
For dynamic importers, make sure we keep the pinning also in map_dma_buf(),
to ensure we never need to call dma_buf_move_notify().
Calling dma_buf_move_notify() is at the discretion of the exporter.

v2:
- Extend the selftest with a fake dynamic importer.
- Provide real pin and unpin callbacks to not abuse the interface.

Reported-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  31 ++++-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 116 +++++++++++++++++-
 2 files changed, 143 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 616c3a2f1baf..918c19df7b66 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -12,6 +12,8 @@
 #include "i915_gem_object.h"
 #include "i915_scatterlist.h"
 
+I915_SELFTEST_DECLARE(static bool force_different_devices;)
+
 static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
 {
 	return to_intel_bo(buf->priv);
@@ -25,7 +27,14 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 	struct scatterlist *src, *dst;
 	int ret, i;
 
-	ret = i915_gem_object_pin_pages_unlocked(obj);
+	assert_object_held(obj);
+
+	/*
+	 * Note. In the dynamic importer case, the object is not yet pinned.
+	 * Let's pin it here to avoid having to call the move_notify
+	 * callback, The call of which is not yet implemented.
+	 */
+	ret = i915_gem_object_pin_pages(obj);
 	if (ret)
 		goto err;
 
@@ -168,6 +177,21 @@ static int i915_gem_end_cpu_access(struct dma_buf *dma_buf, enum dma_data_direct
 	return err;
 }
 
+static int i915_gem_dmabuf_pin(struct dma_buf_attachment *attach)
+{
+	struct drm_i915_gem_object *obj = dma_buf_to_obj(attach->dmabuf);
+
+	assert_object_held(obj);
+	return i915_gem_object_pin_pages(obj);
+}
+
+static void i915_gem_dmabuf_unpin(struct dma_buf_attachment *attach)
+{
+	struct drm_i915_gem_object *obj = dma_buf_to_obj(attach->dmabuf);
+
+	i915_gem_object_unpin_pages(obj);
+}
+
 static const struct dma_buf_ops i915_dmabuf_ops =  {
 	.map_dma_buf = i915_gem_map_dma_buf,
 	.unmap_dma_buf = i915_gem_unmap_dma_buf,
@@ -177,6 +201,8 @@ static const struct dma_buf_ops i915_dmabuf_ops =  {
 	.vunmap = i915_gem_dmabuf_vunmap,
 	.begin_cpu_access = i915_gem_begin_cpu_access,
 	.end_cpu_access = i915_gem_end_cpu_access,
+	.pin = i915_gem_dmabuf_pin,
+	.unpin = i915_gem_dmabuf_unpin,
 };
 
 struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
@@ -241,7 +267,8 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 	if (dma_buf->ops == &i915_dmabuf_ops) {
 		obj = dma_buf_to_obj(dma_buf);
 		/* is it from our device? */
-		if (obj->base.dev == dev) {
+		if (obj->base.dev == dev &&
+		    !I915_SELFTEST_ONLY(force_different_devices)) {
 			/*
 			 * Importing dmabuf exported from out own gem increases
 			 * refcount on gem itself instead of f_count of dmabuf.
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index dd74bc09ec88..868b3469ecbd 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -35,7 +35,7 @@ static int igt_dmabuf_export(void *arg)
 static int igt_dmabuf_import_self(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
-	struct drm_i915_gem_object *obj;
+	struct drm_i915_gem_object *obj, *import_obj;
 	struct drm_gem_object *import;
 	struct dma_buf *dmabuf;
 	int err;
@@ -65,14 +65,125 @@ static int igt_dmabuf_import_self(void *arg)
 		err = -EINVAL;
 		goto out_import;
 	}
+	import_obj = to_intel_bo(import);
+
+	i915_gem_object_lock(import_obj, NULL);
+	err = ____i915_gem_object_get_pages(import_obj);
+	i915_gem_object_unlock(import_obj);
+	if (err) {
+		pr_err("Same object dma-buf get_pages failed!\n");
+		goto out_import;
+	}
 
 	err = 0;
 out_import:
-	i915_gem_object_put(to_intel_bo(import));
+	i915_gem_object_put(import_obj);
+out_dmabuf:
+	dma_buf_put(dmabuf);
+out:
+	i915_gem_object_put(obj);
+	return err;
+}
+
+static void igt_dmabuf_move_notify(struct dma_buf_attachment *attach)
+{
+	GEM_WARN_ON(1);
+}
+
+static const struct dma_buf_attach_ops igt_dmabuf_attach_ops = {
+	.move_notify = igt_dmabuf_move_notify,
+};
+
+static int igt_dmabuf_import_same_driver(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct drm_i915_gem_object *obj, *import_obj;
+	struct drm_gem_object *import;
+	struct dma_buf *dmabuf;
+	struct dma_buf_attachment *import_attach;
+	struct sg_table *st;
+	long timeout;
+	int err;
+
+	force_different_devices = true;
+	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
+	if (IS_ERR(obj))
+		goto out_ret;
+
+	dmabuf = i915_gem_prime_export(&obj->base, 0);
+	if (IS_ERR(dmabuf)) {
+		pr_err("i915_gem_prime_export failed with err=%d\n",
+		       (int)PTR_ERR(dmabuf));
+		err = PTR_ERR(dmabuf);
+		goto out;
+	}
+
+	import = i915_gem_prime_import(&i915->drm, dmabuf);
+	if (IS_ERR(import)) {
+		pr_err("i915_gem_prime_import failed with err=%d\n",
+		       (int)PTR_ERR(import));
+		err = PTR_ERR(import);
+		goto out_dmabuf;
+	}
+
+	if (import == &obj->base) {
+		pr_err("i915_gem_prime_import reused gem object!\n");
+		err = -EINVAL;
+		goto out_import;
+	}
+
+	import_obj = to_intel_bo(import);
+
+	i915_gem_object_lock(import_obj, NULL);
+	err = ____i915_gem_object_get_pages(import_obj);
+	if (err) {
+		pr_err("Different objects dma-buf get_pages failed!\n");
+		i915_gem_object_unlock(import_obj);
+		goto out_import;
+	}
+
+	/*
+	 * If the exported object is not in system memory, something
+	 * weird is going on. TODO: When p2p is supported, this is no
+	 * longer considered weird.
+	 */
+	if (obj->mm.region != i915->mm.regions[INTEL_REGION_SMEM]) {
+		pr_err("Exported dma-buf is not in system memory\n");
+		err = -EINVAL;
+	}
+
+	i915_gem_object_unlock(import_obj);
+
+	/* Now try a fake dynamic importer */
+	import_attach = dma_buf_dynamic_attach(dmabuf, obj->base.dev->dev,
+					       &igt_dmabuf_attach_ops,
+					       NULL);
+	if (IS_ERR(import_attach))
+		goto out_import;
+
+	dma_resv_lock(dmabuf->resv, NULL);
+	st = dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
+	dma_resv_unlock(dmabuf->resv);
+	if (IS_ERR(st))
+		goto out_detach;
+
+	timeout = dma_resv_wait_timeout(dmabuf->resv, false, true, 5 * HZ);
+	if (!timeout) {
+		pr_err("dmabuf wait for exclusive fence timed out.\n");
+		timeout = -ETIME;
+	}
+	err = timeout > 0 ? 0 : timeout;
+	dma_buf_unmap_attachment(import_attach, st, DMA_BIDIRECTIONAL);
+out_detach:
+	dma_buf_detach(dmabuf, import_attach);
+out_import:
+	i915_gem_object_put(import_obj);
 out_dmabuf:
 	dma_buf_put(dmabuf);
 out:
 	i915_gem_object_put(obj);
+out_ret:
+	force_different_devices = false;
 	return err;
 }
 
@@ -286,6 +397,7 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
 		SUBTEST(igt_dmabuf_export),
+		SUBTEST(igt_dmabuf_import_same_driver),
 	};
 
 	return i915_subtests(tests, i915);
-- 
2.31.1

