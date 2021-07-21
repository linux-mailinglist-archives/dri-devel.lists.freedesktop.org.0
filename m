Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4583D17B8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A759D6ECF4;
	Wed, 21 Jul 2021 20:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E156ECF4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:14:03 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id x16so1686889plg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gZDUyU6TiqgcwzDSQgDDr7H1fzdH4+hJ76kiwfOJe/I=;
 b=bpLYY+SJUhbN35eV8XoeJsgTlP2woAn2Wfg4P6c9EmQRKuroVXKcLZ08ZTkynQf+NA
 mgKzxqgANHjC71JKmmkACy97MlryMuAsobPhsU7/VeF93B7P9yimORxCzQrFIDzdhY8E
 qX4JVtfTRWO8OMLxJ5Vy4yQ7pQ5ig7Fc0BZ1yFpYy20A1frauWIPadrimfrOL9H/KXXE
 wHmGbzImW6yKyJiknjUmvh04f5uPz08QcpSkWAORb09YDlPrXs8MefryqAHWcYOdHT5C
 QVznNn97WisSLBfmwysLh0Sliaz/dtckT0Kpc4RqZuHqQH4yaEn6vNQuMYu7baSO8vjW
 RpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gZDUyU6TiqgcwzDSQgDDr7H1fzdH4+hJ76kiwfOJe/I=;
 b=qETtbvGq4DEngIPBQdaEXhipZlSkaPSixL611v2G+5+/jRzOx+0tRyI8gcmCOBA5tY
 fAGcJZeff0QeUZ3XcXMowvHnaFQwNp2WhUgk84ZE+9VJz2HP3Tpw7LwwojL0mYGckf16
 nx3RdBc+pYTCmPyOdnQ5t7BO9UjSB1BvS8FeyBVNao4JKHnMwhb/Z+fMHRWfAn5FiNgg
 cNUrFbzArc7bntjFzSNQo6y1Z/BWtk5xbBYKOADPZz2u9SOL/mXgzq/peZ3HGDshfaZC
 UpMyYGxA2CWYSY720SatXTJhXfu8WGsOB+vpDYo64CZ3/yyeWDzPyqsOcMJ4icYxFEW5
 Kuaw==
X-Gm-Message-State: AOAM532mPnZMw3db8puaR4S1reOr4ZjRe0L0W1ZcFSfZw/s7VoNzdGiV
 QTwDNGm6WfNRjAJXislgcebqOg==
X-Google-Smtp-Source: ABdhPJzvumOfOa+Llndako4OEPGVoU1nzb/wY1xvSbRODr8qOpVkHbicXlsIjJcJaxy3J8G0qKi9bg==
X-Received: by 2002:a17:90a:f28e:: with SMTP id
 fs14mr5514578pjb.106.1626898443011; 
 Wed, 21 Jul 2021 13:14:03 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id h24sm28777439pfn.180.2021.07.21.13.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:14:02 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915/gem: Migrate to system at dma-buf attach time
 (v7)
Date: Wed, 21 Jul 2021 15:13:43 -0500
Message-Id: <20210721201343.2962674-8-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721201343.2962674-1-jason@jlekstrand.net>
References: <20210721201343.2962674-1-jason@jlekstrand.net>
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

