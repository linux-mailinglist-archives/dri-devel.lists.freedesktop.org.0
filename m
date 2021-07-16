Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699043CB894
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168B76E9AB;
	Fri, 16 Jul 2021 14:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE9E6E9AB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:14:36 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id e11so7991181oii.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iwESnNdVb8Ql0T+r09B5hLFoFY4TsIMumU8Vn60f698=;
 b=vR+2D6eDT8yL3l+WGb2B0R9gPRTqbfdNRrFEPBcZ0AtwVHrvo4gIbmE78fLQGLUfAy
 mC+VW4oj54o1rX/qGxgbL2soI+6+aWB+OwumWJTUJhOx8ux0r6GC1dzeBp72rvLKisg3
 2oEcjN7AeHRiVUCAFJYm1DnimI/9euQr8GyNQXW2sc/aCBFDdGYbIzqI2+rxIsZGogTS
 KwRwRFJ2JjeMuXMBWcB0Od3qs22wIu0WvYvTAYGXSJ94uJc0X8ibg0rSkvIlJeGMzQVh
 7w/mJXSG2zoG50lR11NhFdl+4l22LbY3PFyIuitSeOqPTK6SfYz5+j5Ch/cXEdyn9Ndo
 KpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iwESnNdVb8Ql0T+r09B5hLFoFY4TsIMumU8Vn60f698=;
 b=PzXZeReWKc6zIsR2D+kcVPddzwHaeEvIWVzehTYRouIDFrSXgkvz23aKEL9nm+F6wa
 xGwEuKuFKqdF0AwtopErLGLiypHjTHAvaKkpFG8+G1Fb9WE0B9/kql5zoTzSPrykKW0r
 BruKUU5z1/cZequelXJh+C4NCVAjbmyxHdW3FUhvLAt+/FKDuPMkRPPgIjuts98X68ri
 oshSm0Rdc05frAo2LwToWG1tA2kpeb+oFwVmQ+8Id6qrcQWlbWN2pzfMOb//I/xr0//G
 Vxb9iyuHY2BjugTwkgABz4Ly+YjXrHK6l0MrG1FvKsQpfjHvQgkor56MatmeTMmfWmwy
 p8eA==
X-Gm-Message-State: AOAM531CYtRU+Wly7YmtmHyU8njOuQEtSWZgbiZ4rb2Xj0oUQj97I2sx
 ZmzUT7wGgte0UHPRdjkTykZM9g==
X-Google-Smtp-Source: ABdhPJwF0zbCi/sMNX1FGANRLJiLGHHvLoNOWWNHG8I2wWswXkqMrViZbP5CpdSCLtZStbDieU94Kw==
X-Received: by 2002:aca:aaca:: with SMTP id t193mr12208413oie.94.1626444875876; 
 Fri, 16 Jul 2021 07:14:35 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id v42sm1852266ott.70.2021.07.16.07.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 07:14:35 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915/gem: Migrate to system at dma-buf attach time
 (v6)
Date: Fri, 16 Jul 2021 09:14:26 -0500
Message-Id: <20210716141426.1904528-8-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716141426.1904528-1-jason@jlekstrand.net>
References: <20210716141426.1904528-1-jason@jlekstrand.net>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 23 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  4 +
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 89 ++++++++++++++++++-
 4 files changed, 112 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 039e4f3b39c79..41c4cd3e1ea01 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -82,7 +82,7 @@ static int i915_gem_publish(struct drm_i915_gem_object *obj,
 	return 0;
 }
 
-static struct drm_i915_gem_object *
+struct drm_i915_gem_object *
 i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
 			    struct intel_memory_region **placements,
 			    unsigned int n_placements)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 9a655f69a0671..5d438b95826b9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -170,8 +170,29 @@ static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
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
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 8be4fadeee487..fbae53bd46384 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -61,6 +61,10 @@ i915_gem_object_create_shmem(struct drm_i915_private *i915,
 struct drm_i915_gem_object *
 i915_gem_object_create_shmem_from_data(struct drm_i915_private *i915,
 				       const void *data, resource_size_t size);
+struct drm_i915_gem_object *
+i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
+			    struct intel_memory_region **placements,
+			    unsigned int n_placements);
 
 extern const struct drm_i915_gem_object_ops i915_gem_shmem_ops;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 4451bbb4917e4..7b7647e7e220a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -85,9 +85,62 @@ static int igt_dmabuf_import_self(void *arg)
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
+	if (!i915->mm.regions[INTEL_REGION_LMEM])
+		return 0;
+
+	force_different_devices = true;
+
+	obj = i915_gem_object_create_user(i915, PAGE_SIZE, &lmem, 1);
+	if (IS_ERR(obj)) {
+		pr_err("i915_gem_object_create_user failed with err=%d\n",
+		       (int)PTR_ERR(dmabuf));
+		err = PTR_ERR(obj);
+		goto out_ret;
+	}
+
+	dmabuf = i915_gem_prime_export(&obj->base, 0);
+	if (IS_ERR(dmabuf)) {
+		pr_err("i915_gem_prime_export failed with err=%d\n",
+		       (int)PTR_ERR(dmabuf));
+		err = PTR_ERR(dmabuf);
+		goto out;
+	}
+
+	/* We expect an import of an LMEM-only object to fail with
+	 * -EOPNOTSUPP because it can't be migrated to SMEM.
+	 */
+	import = i915_gem_prime_import(&i915->drm, dmabuf);
+	if (!IS_ERR(import)) {
+		drm_gem_object_put(import);
+		pr_err("i915_gem_prime_import succeeded when it shouldn't have\n");
+		err = -EINVAL;
+	} else if (PTR_ERR(import) != -EOPNOTSUPP) {
+		pr_err("i915_gem_prime_import failed with the wrong err=%d\n",
+		       (int)PTR_ERR(import));
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
@@ -97,9 +150,15 @@ static int igt_dmabuf_import_same_driver(void *arg)
 	int err;
 
 	force_different_devices = true;
-	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
-	if (IS_ERR(obj))
+
+	obj = i915_gem_object_create_user(i915, PAGE_SIZE,
+					  regions, num_regions);
+	if (IS_ERR(obj)) {
+		pr_err("i915_gem_object_create_user failed with err=%d\n",
+		       (int)PTR_ERR(dmabuf));
+		err = PTR_ERR(obj);
 		goto out_ret;
+	}
 
 	dmabuf = i915_gem_prime_export(&obj->base, 0);
 	if (IS_ERR(dmabuf)) {
@@ -174,6 +233,26 @@ static int igt_dmabuf_import_same_driver(void *arg)
 	return err;
 }
 
+static int igt_dmabuf_import_same_driver_smem(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
+	struct intel_memory_region *smem = i915->mm.regions[INTEL_REGION_SMEM];
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
@@ -384,7 +463,9 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_private *i915)
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

