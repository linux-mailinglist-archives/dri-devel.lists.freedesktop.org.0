Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223973D3E81
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 19:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8896FB2B;
	Fri, 23 Jul 2021 17:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDED6FABE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 17:21:57 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id t21so3719565plr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 10:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gZDUyU6TiqgcwzDSQgDDr7H1fzdH4+hJ76kiwfOJe/I=;
 b=ls1w+tAidcr71IqxrcMbkRpIm7NtfRtO+/Y9I1hx7Y4ZKXQaosalMErKDB/tQwHLM3
 6E1qFr5ThKPik0mn2Uxx06SUg44wdpz4q/eGn6jt5nQyd7ZmUwZv1UWXUuqOViI0E+6T
 NS56rb8IDitV2i2aToZCScdbZxff3AkSYbPrdD2V56wUaYAJDBMYeKR09L4K/bhcs0K6
 RrxuHF/honsR23ch+OYNCTVAwUa1TIkFJlc7bEwUjetMLAEe1Rz1SLofq1QhP0QyVGzv
 ewIUQV/XQIwRNqhsfvdufBFfGdhIMl0ggVgKUKWCmuqwFAdH5u9CUSwjhnMSHi1/NB7B
 +KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gZDUyU6TiqgcwzDSQgDDr7H1fzdH4+hJ76kiwfOJe/I=;
 b=e0R5Q2gShIMXDQ4Bh/GD3PrK0dKfZ4axtjn1x5XHuXVJXlLk5PPdCIiybsbGvts61n
 97Z9oXyX7cj6dvJ6z08qs1QTgxZsfyvMnW6xbNQqZ0v/SG/zHcl3gYpV7O6h67sbP7Z3
 eGn09wACW2H4Vgg4n/GaKSfb2MJ4BLUSzGIanKR4xLkJfVuDKfGXtLDHjRgFAp2rnTKn
 tJAgJFekzyVALI6vf1l34PmxffWPl6iTOBlIyuxz+9rUfwGqa4R95zCAxMGo7UmTWCDT
 WBG7T3vrmJDnV/tbk1TDSW/ZVyYaFy8sNYQ5hycKcOERLU2b7q5PKtnfNGUB+ARS3dGh
 JoaA==
X-Gm-Message-State: AOAM532rf8v7Zr2gqUZe/ojB9F/brNrCgMZHwKA8THZ6iI7wCfSyjBCD
 BKIuC061CGn6c1z8Tx++ucCxSRqdDhu4YQ==
X-Google-Smtp-Source: ABdhPJwPHgJVlpn4rqr25GQMbrpU6sk3l8T9FvbKgDJrcVzyIN/2GCSdrU5wcKu4vVPVbxOfjyAzgA==
X-Received: by 2002:a63:807:: with SMTP id 7mr5761424pgi.122.1627060916676;
 Fri, 23 Jul 2021 10:21:56 -0700 (PDT)
Received: from omlet.lan ([134.134.137.86])
 by smtp.gmail.com with ESMTPSA id s36sm24288648pgl.8.2021.07.23.10.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:21:56 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915/gem: Migrate to system at dma-buf attach time
 (v7)
Date: Fri, 23 Jul 2021 12:21:42 -0500
Message-Id: <20210723172142.3273510-9-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723172142.3273510-1-jason@jlekstrand.net>
References: <20210723172142.3273510-1-jason@jlekstrand.net>
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
 kernel test robot <lkp@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Until we support p2p dma or as a complement to that, migrate data
to system memory at dma-buf attach time if possible.

v2:
- Rebase on dynamic exporter. Update the igt_dmabuf_import_same_driver
  selftest to migrate if we are LMEM capable.
v3:
- Migrate also in the pin() callback.
v4:
- Migrate in attach
v5: (jason)
- Lock around the migration
v6: (jason)
- Move the can_migrate check outside the lock
- Rework the selftests to test more migration conditions.  In
  particular, SMEM, LMEM, and LMEM+SMEM are all checked.
v7: (mauld)
- Misc style nits

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 23 ++++-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 87 ++++++++++++++++++-
 2 files changed, 106 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 59dc56ae14d6b..afa34111de02e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -164,8 +164,29 @@ static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
 				  struct dma_buf_attachment *attach)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dmabuf);
+	struct i915_gem_ww_ctx ww;
+	int err;
+
+	if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))
+		return -EOPNOTSUPP;
+
+	for_i915_gem_ww(&ww, err, true) {
+		err = i915_gem_object_lock(obj, &ww);
+		if (err)
+			continue;
+
+		err = i915_gem_object_migrate(obj, &ww, INTEL_REGION_SMEM);
+		if (err)
+			continue;
 
-	return i915_gem_object_pin_pages_unlocked(obj);
+		err = i915_gem_object_wait_migration(obj, 0);
+		if (err)
+			continue;
+
+		err = i915_gem_object_pin_pages(obj);
+	}
+
+	return err;
 }
 
 static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index d4ce01e6ee854..ffae7df5e4d7d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -85,9 +85,63 @@ static int igt_dmabuf_import_self(void *arg)
 	return err;
 }
 
-static int igt_dmabuf_import_same_driver(void *arg)
+static int igt_dmabuf_import_same_driver_lmem(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
+	struct intel_memory_region *lmem = i915->mm.regions[INTEL_REGION_LMEM];
+	struct drm_i915_gem_object *obj;
+	struct drm_gem_object *import;
+	struct dma_buf *dmabuf;
+	int err;
+
+	if (!lmem)
+		return 0;
+
+	force_different_devices = true;
+
+	obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &lmem, 1);
+	if (IS_ERR(obj)) {
+		pr_err("__i915_gem_object_create_user failed with err=%ld\n",
+		       PTR_ERR(dmabuf));
+		err = PTR_ERR(obj);
+		goto out_ret;
+	}
+
+	dmabuf = i915_gem_prime_export(&obj->base, 0);
+	if (IS_ERR(dmabuf)) {
+		pr_err("i915_gem_prime_export failed with err=%ld\n",
+		       PTR_ERR(dmabuf));
+		err = PTR_ERR(dmabuf);
+		goto out;
+	}
+
+	/*
+	 * We expect an import of an LMEM-only object to fail with
+	 * -EOPNOTSUPP because it can't be migrated to SMEM.
+	 */
+	import = i915_gem_prime_import(&i915->drm, dmabuf);
+	if (!IS_ERR(import)) {
+		drm_gem_object_put(import);
+		pr_err("i915_gem_prime_import succeeded when it shouldn't have\n");
+		err = -EINVAL;
+	} else if (PTR_ERR(import) != -EOPNOTSUPP) {
+		pr_err("i915_gem_prime_import failed with the wrong err=%ld\n",
+		       PTR_ERR(import));
+		err = PTR_ERR(import);
+	}
+
+	dma_buf_put(dmabuf);
+out:
+	i915_gem_object_put(obj);
+out_ret:
+	force_different_devices = false;
+	return err;
+}
+
+static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
+					 struct intel_memory_region **regions,
+					 unsigned int num_regions)
+{
 	struct drm_i915_gem_object *obj, *import_obj;
 	struct drm_gem_object *import;
 	struct dma_buf *dmabuf;
@@ -97,8 +151,12 @@ static int igt_dmabuf_import_same_driver(void *arg)
 	int err;
 
 	force_different_devices = true;
-	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
+
+	obj = __i915_gem_object_create_user(i915, PAGE_SIZE,
+					    regions, num_regions);
 	if (IS_ERR(obj)) {
+		pr_err("__i915_gem_object_create_user failed with err=%ld\n",
+		       PTR_ERR(dmabuf));
 		err = PTR_ERR(obj);
 		goto out_ret;
 	}
@@ -180,6 +238,27 @@ static int igt_dmabuf_import_same_driver(void *arg)
 	return err;
 }
 
+static int igt_dmabuf_import_same_driver_smem(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_memory_region *smem = i915->mm.regions[INTEL_REGION_SMEM];
+
+	return igt_dmabuf_import_same_driver(i915, &smem, 1);
+}
+
+static int igt_dmabuf_import_same_driver_lmem_smem(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_memory_region *regions[2];
+
+	if (!i915->mm.regions[INTEL_REGION_LMEM])
+		return 0;
+
+	regions[0] = i915->mm.regions[INTEL_REGION_LMEM];
+	regions[1] = i915->mm.regions[INTEL_REGION_SMEM];
+	return igt_dmabuf_import_same_driver(i915, regions, 2);
+}
+
 static int igt_dmabuf_import(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
@@ -390,7 +469,9 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
 		SUBTEST(igt_dmabuf_export),
-		SUBTEST(igt_dmabuf_import_same_driver),
+		SUBTEST(igt_dmabuf_import_same_driver_lmem),
+		SUBTEST(igt_dmabuf_import_same_driver_smem),
+		SUBTEST(igt_dmabuf_import_same_driver_lmem_smem),
 	};
 
 	return i915_subtests(tests, i915);
-- 
2.31.1

