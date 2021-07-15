Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330653CAF47
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A6B6E8C3;
	Thu, 15 Jul 2021 22:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F282F6E8C2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 22:39:18 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id y4so8023564pgl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iyozTSomnY57D+e+B5ZX9prvxFTQugp7z+hR/eTorww=;
 b=fsIHp9qJxKQCYTxYSygRbtrVdskVdQpwPhqRmenzAggXpqTfWpSOYPuWU4dZqgeAWG
 VMEp1XkQODBah750DFVcFKcObHVrRO57f03WJD7egh59VIdqtryyDEj6zb1OnfogCjq/
 Zs23oe/Z+q7LSzrG0qSj1FNmXRHzVd7gZjvo+BQINDK6FTqkBMdKhxi2g2HKDiWDWa9b
 kxZJX6gbq744sCeNyUtkSh835TIG29Ifn8ywMkIzA73od3/QvhzrHtF/T+gr7Vp1qGO6
 iAICpn2ZoxVGzQXkWaBWrzPt7aVgY/kTuLtbVg9ckF7o1pd7WI+a2cRrolitlN9vhnK+
 najA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iyozTSomnY57D+e+B5ZX9prvxFTQugp7z+hR/eTorww=;
 b=UZeA8Sy8ZK4rNsFZTXTM4Bs4rPlFjziOqNGtNZ1xIXo625f/0TjR5ZOGsu82dwA1Nu
 xYBw7CMPDHSJyRBg+oXF9NGTOl7qAliHhBVVzKgdOHFDJDkVSynHtH+sKPtre1dhRxH4
 WbRYH/AFxcZgEdVdsC7NzKfZuMcinjxwTR7LUy6CUtM+uqqMJMwzOFNAI4YewCgzl4D+
 HpDoBBMPaX6C4jfyWqibBvsd/rTTDqptV/g8vNS0TTEJw6GceFuG94E0CdrK9MBvMyAy
 yNTniPdFMvUUg4hTiNirsKSSr2L4brssX+Sk74EGjQh9DwHVJQj2nLdXIEH5pZyHsmDR
 IutA==
X-Gm-Message-State: AOAM530rP2NVYhBGGHqkb0olD0H6tgItzethsKxqrLRVlmWCmwSGI/DM
 b2mHK++j7+6Sna0NxCOB6a/rGA==
X-Google-Smtp-Source: ABdhPJzYSaPU+NPZ30UE5b17SAlXEWyCx2wEdozswkNTiUkviFPP1WjAWB1Krwz9f844/0/dmn7/QQ==
X-Received: by 2002:a05:6a00:16c6:b029:32d:e190:9dd0 with SMTP id
 l6-20020a056a0016c6b029032de1909dd0mr6960538pfc.70.1626388758467; 
 Thu, 15 Jul 2021 15:39:18 -0700 (PDT)
Received: from omlet.com ([134.134.137.87])
 by smtp.gmail.com with ESMTPSA id ft7sm9959459pjb.32.2021.07.15.15.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 15:39:18 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/i915/gem: Correct the locking and pin pattern for
 dma-buf (v6)
Date: Thu, 15 Jul 2021 17:38:59 -0500
Message-Id: <20210715223900.1840576-7-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715223900.1840576-1-jason@jlekstrand.net>
References: <20210715223900.1840576-1-jason@jlekstrand.net>
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
 Jason Ekstrand <jason@jlekstrand.net>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

If our exported dma-bufs are imported by another instance of our driver,
that instance will typically have the imported dma-bufs locked during
dma_buf_map_attachment(). But the exporter also locks the same reservation
object in the map_dma_buf() callback, which leads to recursive locking.

So taking the lock inside _pin_pages_unlocked() is incorrect.

Additionally, the current pinning code path is contrary to the defined
way that pinning should occur.

Remove the explicit pin/unpin from the map/umap functions and move them
to the attach/detach allowing correct locking to occur, and to match
the static dma-buf drm_prime pattern.

Add a live selftest to exercise both dynamic and non-dynamic
exports.

v2:
- Extend the selftest with a fake dynamic importer.
- Provide real pin and unpin callbacks to not abuse the interface.
v3: (ruhl)
- Remove the dynamic export support and move the pinning into the
  attach/detach path.
v4: (ruhl)
- Put pages does not need to assert on the dma-resv
v5: (jason)
- Lock around dma_buf_unmap_attachment() when emulating a dynamic
  importer in the subtests.
- Use pin_pages_unlocked
v6: (jason)
- Use dma_buf_attach instead of dma_buf_attach_dynamic in the selftests

Reported-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  43 ++++++--
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 103 +++++++++++++++++-
 2 files changed, 132 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 616c3a2f1baf0..9a655f69a0671 100644
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
@@ -25,15 +27,11 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 	struct scatterlist *src, *dst;
 	int ret, i;
 
-	ret = i915_gem_object_pin_pages_unlocked(obj);
-	if (ret)
-		goto err;
-
 	/* Copy sg so that we make an independent mapping */
 	st = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
 	if (st == NULL) {
 		ret = -ENOMEM;
-		goto err_unpin_pages;
+		goto err;
 	}
 
 	ret = sg_alloc_table(st, obj->mm.pages->nents, GFP_KERNEL);
@@ -58,8 +56,6 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 	sg_free_table(st);
 err_free:
 	kfree(st);
-err_unpin_pages:
-	i915_gem_object_unpin_pages(obj);
 err:
 	return ERR_PTR(ret);
 }
@@ -68,13 +64,9 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   struct sg_table *sg,
 				   enum dma_data_direction dir)
 {
-	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment->dmabuf);
-
 	dma_unmap_sgtable(attachment->dev, sg, dir, DMA_ATTR_SKIP_CPU_SYNC);
 	sg_free_table(sg);
 	kfree(sg);
-
-	i915_gem_object_unpin_pages(obj);
 }
 
 static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
@@ -168,7 +160,31 @@ static int i915_gem_end_cpu_access(struct dma_buf *dma_buf, enum dma_data_direct
 	return err;
 }
 
+/**
+ * i915_gem_dmabuf_attach - Do any extra attach work necessary
+ * @dmabuf: imported dma-buf
+ * @attach: new attach to do work on
+ *
+ */
+static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
+				  struct dma_buf_attachment *attach)
+{
+	struct drm_i915_gem_object *obj = dma_buf_to_obj(dmabuf);
+
+	return i915_gem_object_pin_pages_unlocked(obj);
+}
+
+static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
+				   struct dma_buf_attachment *attach)
+{
+	struct drm_i915_gem_object *obj = dma_buf_to_obj(dmabuf);
+
+	i915_gem_object_unpin_pages(obj);
+}
+
 static const struct dma_buf_ops i915_dmabuf_ops =  {
+	.attach = i915_gem_dmabuf_attach,
+	.detach = i915_gem_dmabuf_detach,
 	.map_dma_buf = i915_gem_map_dma_buf,
 	.unmap_dma_buf = i915_gem_unmap_dma_buf,
 	.release = drm_gem_dmabuf_release,
@@ -204,6 +220,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 	struct sg_table *pages;
 	unsigned int sg_page_sizes;
 
+	assert_object_held(obj);
+
 	pages = dma_buf_map_attachment(obj->base.import_attach,
 				       DMA_BIDIRECTIONAL);
 	if (IS_ERR(pages))
@@ -241,7 +259,8 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
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
index dd74bc09ec88d..4451bbb4917e4 100644
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
@@ -65,14 +65,112 @@ static int igt_dmabuf_import_self(void *arg)
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
+	/* Now try a fake an importer */
+	import_attach = dma_buf_attach(dmabuf, obj->base.dev->dev);
+	if (IS_ERR(import_attach))
+		goto out_import;
+
+	st = dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
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
 
@@ -286,6 +384,7 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
 		SUBTEST(igt_dmabuf_export),
+		SUBTEST(igt_dmabuf_import_same_driver),
 	};
 
 	return i915_subtests(tests, i915);
-- 
2.31.1

