Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 989743CAF4B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671216E8C5;
	Thu, 15 Jul 2021 22:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCA96E8C5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 22:39:21 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso6438102pjx.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uTvb5nCOZNBFjkHb/A0OT2QdNDoGq3FEFV5E3JS80iA=;
 b=JmtVnbT5kDFSjpkjRVGjGcpfcRgBk7LeFBfR+uOvOVp/hkgbhWjCLrB83O2InRAxJq
 8pG5roHvCiSoIS8qamFzruU5/IWH1Oaft2Pz1cuFizUqQ09vE87i71ZZa/CSDwrWvpYi
 yEtg6jS3bBww1jtzpgcMbZw8dx3Xvl7TjKwLYLCisNmasIm+ijlHXBbvO3y8s7NemPRi
 rLdzX2dNN5dWaItniReVYfECFnv8Mqph3VFLsORIC0LjpvDez5N9fCLAh9xinvpcS+0H
 N1bXXBitFWzkduodEGV+Mm0g/wuvCQvzKWf9QbJecHy1v6a11ZiqjPOWtJN//qd3rvnE
 f1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uTvb5nCOZNBFjkHb/A0OT2QdNDoGq3FEFV5E3JS80iA=;
 b=HXC/q3qvs1Q3xhb4Ynw7ksEVNq4cufD0R9Np0+QhPnm6nZshSzYQyK898/yDBJFWsI
 FIGiZOpFofYgbtLL/t87Xuzpv4iy7XjMwSnY9s8sML8QzP8YzUUo4w/7H191/+da4qse
 44A3HXIPczExEZpK/M+pg7lsmPj/jSuqX/xvCdr19cCq+eLV+wA06QVAYrmZvCkG1sUF
 t8o1TH7SXION8PCSU/vX5ny8ew8M7qxdhM8VaZ4Uz9F1od3PNG0JMrtWgecqIZgeK2Si
 cRishvckCVMlxEMtg8TVBc0MuiSEYhm4PD01XbE74ubGInEL/mAGSQuES8nG8ssssbDT
 8Axg==
X-Gm-Message-State: AOAM533ql5MRlQKkAWT+z6wsPOfoIXfcRXBwJPGW1x0CrLfiFktcBfr0
 63fxZSpzXDxokQlwsmxISsQaGg==
X-Google-Smtp-Source: ABdhPJxyhJv81KVkp7JZiyi9kHmYNr5psMEV2RHJ3qgPbebMHV02Zef1CSJp+VQ+2aD12SUixWV6zQ==
X-Received: by 2002:a17:902:c246:b029:129:b2e0:be90 with SMTP id
 6-20020a170902c246b0290129b2e0be90mr5203729plg.84.1626388760480; 
 Thu, 15 Jul 2021 15:39:20 -0700 (PDT)
Received: from omlet.com ([134.134.137.87])
 by smtp.gmail.com with ESMTPSA id ft7sm9959459pjb.32.2021.07.15.15.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 15:39:20 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915/gem: Migrate to system at dma-buf attach time
 (v6)
Date: Thu, 15 Jul 2021 17:39:00 -0500
Message-Id: <20210715223900.1840576-8-jason@jlekstrand.net>
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
index 69bf9ec777642..ed6b0d75ff801 100644
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

