Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BA03B35C8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1876EC84;
	Thu, 24 Jun 2021 18:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ADE6EC7F;
 Thu, 24 Jun 2021 18:31:30 +0000 (UTC)
IronPort-SDR: y01lzh37fZSTxfjl2AB48K7JK1AlY/Ljw67aZV15Ql30lPQaCcJuoqJrNpXK1McqX/I1g/27+z
 sOiL1vbTNLtw==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207354198"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="207354198"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:31:29 -0700
IronPort-SDR: Pl1dVxODw7+zq5xE4/Ou/8RFJk/CfJFPAbKqMLpeJJs9+T0i0ayxZ/sqUAwDHn/FLtRRfjm7UN
 NtFRLQs1vMVg==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="556585575"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.243])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:31:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/gem: Introduce a selftest for the gem object
 migrate functionality
Date: Thu, 24 Jun 2021 20:31:08 +0200
Message-Id: <20210624183110.22582-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624183110.22582-1-thomas.hellstrom@linux.intel.com>
References: <20210624183110.22582-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

A selftest for the gem object migrate functionality. Slightly adapted
from the original by Matthew to the new interface and new fill blit
code.

Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   1 +
 .../drm/i915/gem/selftests/i915_gem_migrate.c | 237 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 3 files changed, 239 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 6421c3a8b2f3..24f4395bf387 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -644,6 +644,7 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/huge_gem_object.c"
 #include "selftests/huge_pages.c"
+#include "selftests/i915_gem_migrate.c"
 #include "selftests/i915_gem_object.c"
 #include "selftests/i915_gem_coherency.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
new file mode 100644
index 000000000000..a437b66f64d9
--- /dev/null
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2020-2021 Intel Corporation
+ */
+
+#include "gt/intel_migrate.h"
+
+static int igt_smem_create_migrate(void *arg)
+{
+	struct intel_gt *gt = arg;
+	struct drm_i915_private *i915 = gt->i915;
+	struct drm_i915_gem_object *obj;
+	struct i915_gem_ww_ctx ww;
+	int err = 0;
+
+	/* Switch object backing-store on create */
+	obj = i915_gem_object_create_lmem(i915, PAGE_SIZE, 0);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	for_i915_gem_ww(&ww, err, true) {
+		err = i915_gem_object_lock(obj, &ww);
+		if (err)
+			continue;
+
+		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM)) {
+			err = -EINVAL;
+			continue;
+		}
+
+		err = i915_gem_object_migrate(obj, &ww, INTEL_REGION_SMEM);
+		if (err)
+			continue;
+
+		err = i915_gem_object_pin_pages(obj);
+		if (err)
+			continue;
+
+		if (i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM))
+			err = -EINVAL;
+
+		i915_gem_object_unpin_pages(obj);
+	}
+	i915_gem_object_put(obj);
+
+	return err;
+}
+
+static int igt_lmem_create_migrate(void *arg)
+{
+	struct intel_gt *gt = arg;
+	struct drm_i915_private *i915 = gt->i915;
+	struct drm_i915_gem_object *obj;
+	struct i915_gem_ww_ctx ww;
+	int err = 0;
+
+	/* Switch object backing-store on create */
+	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	for_i915_gem_ww(&ww, err, true) {
+		err = i915_gem_object_lock(obj, &ww);
+		if (err)
+			continue;
+
+		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM)) {
+			err = -EINVAL;
+			continue;
+		}
+
+		err = i915_gem_object_migrate(obj, &ww, INTEL_REGION_LMEM);
+		if (err)
+			continue;
+
+		err = i915_gem_object_pin_pages(obj);
+		if (err)
+			continue;
+
+		if (i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))
+			err = -EINVAL;
+
+		i915_gem_object_unpin_pages(obj);
+	}
+	i915_gem_object_put(obj);
+
+	return err;
+}
+
+static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
+				  struct drm_i915_gem_object *obj)
+{
+	int err;
+
+	err = i915_gem_object_lock(obj, ww);
+	if (err)
+		return err;
+
+	err = i915_gem_object_wait(obj,
+				   I915_WAIT_INTERRUPTIBLE |
+				   I915_WAIT_PRIORITY |
+				   I915_WAIT_ALL,
+				   MAX_SCHEDULE_TIMEOUT);
+	if (err)
+		return err;
+
+	if (i915_gem_object_is_lmem(obj)) {
+		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM)) {
+			pr_err("object can't migrate to smem.\n");
+			return -EINVAL;
+		}
+
+		err = i915_gem_object_migrate(obj, ww, INTEL_REGION_SMEM);
+		if (err) {
+			pr_err("Object failed migration to smem\n");
+			if (err)
+				return err;
+		}
+
+		if (i915_gem_object_is_lmem(obj)) {
+			pr_err("object still backed by lmem\n");
+			err = -EINVAL;
+		}
+
+		if (!i915_gem_object_has_struct_page(obj)) {
+			pr_err("object not backed by struct page\n");
+			err = -EINVAL;
+		}
+
+	} else {
+		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM)) {
+			pr_err("object can't migrate to lmem.\n");
+			return -EINVAL;
+		}
+
+		err = i915_gem_object_migrate(obj, ww, INTEL_REGION_LMEM);
+		if (err) {
+			pr_err("Object failed migration to lmem\n");
+			if (err)
+				return err;
+		}
+
+		if (i915_gem_object_has_struct_page(obj)) {
+			pr_err("object still backed by struct page\n");
+			err = -EINVAL;
+		}
+
+		if (!i915_gem_object_is_lmem(obj)) {
+			pr_err("object not backed by lmem\n");
+			err = -EINVAL;
+		}
+	}
+
+	return err;
+}
+
+static int igt_lmem_pages_migrate(void *arg)
+{
+	struct intel_gt *gt = arg;
+	struct drm_i915_private *i915 = gt->i915;
+	struct drm_i915_gem_object *obj;
+	struct i915_gem_ww_ctx ww;
+	struct i915_request *rq;
+	int err;
+	int i;
+
+	/* From LMEM to shmem and back again */
+
+	obj = i915_gem_object_create_lmem(i915, SZ_2M, 0);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	err = i915_gem_object_lock(obj, NULL);
+	if (err)
+		goto out_put;
+
+	err = ____i915_gem_object_get_pages(obj);
+	if (err) {
+		i915_gem_object_unlock(obj);
+		goto out_put;
+	}
+
+	err = intel_context_migrate_clear(gt->migrate.context, NULL,
+					  obj->mm.pages->sgl, obj->cache_level,
+					  i915_gem_object_is_lmem(obj),
+					  0, &rq);
+	if (rq) {
+		dma_resv_add_excl_fence(obj->base.resv, &rq->fence);
+		i915_request_put(rq);
+	}
+	i915_gem_object_unlock(obj);
+	if (err)
+		goto out_put;
+
+	for (i = 1; i <= 4; ++i) {
+		for_i915_gem_ww(&ww, err, true) {
+			err = lmem_pages_migrate_one(&ww, obj);
+			if (err)
+				continue;
+
+			err = i915_gem_object_wait_migration(obj, true);
+			if (err)
+				continue;
+
+			err = intel_migrate_clear(&gt->migrate, &ww, NULL,
+						  obj->mm.pages->sgl,
+						  obj->cache_level,
+						  i915_gem_object_is_lmem(obj),
+						  0xdeadbeaf, &rq);
+			if (rq) {
+				dma_resv_add_excl_fence(obj->base.resv,
+							&rq->fence);
+				i915_request_put(rq);
+			}
+		}
+		if (err)
+			break;
+	}
+out_put:
+	i915_gem_object_put(obj);
+
+	return err;
+}
+
+int i915_gem_migrate_live_selftests(struct drm_i915_private *i915)
+{
+	static const struct i915_subtest tests[] = {
+		SUBTEST(igt_smem_create_migrate),
+		SUBTEST(igt_lmem_create_migrate),
+		SUBTEST(igt_lmem_pages_migrate),
+	};
+
+	if (!HAS_LMEM(i915))
+		return 0;
+
+	return intel_gt_live_subtests(tests, &i915->gt);
+}
diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
index a68197cf1044..e2fd1b61af71 100644
--- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
@@ -40,6 +40,7 @@ selftest(hugepages, i915_gem_huge_page_live_selftests)
 selftest(gem_contexts, i915_gem_context_live_selftests)
 selftest(gem_execbuf, i915_gem_execbuffer_live_selftests)
 selftest(client, i915_gem_client_blt_live_selftests)
+selftest(gem_migrate, i915_gem_migrate_live_selftests)
 selftest(reset, intel_reset_live_selftests)
 selftest(memory_region, intel_memory_region_live_selftests)
 selftest(hangcheck, intel_hangcheck_live_selftests)
-- 
2.31.1

