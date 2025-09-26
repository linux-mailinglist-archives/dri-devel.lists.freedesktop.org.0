Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B39BA300B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 10:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AA710EA18;
	Fri, 26 Sep 2025 08:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJlQQ6uH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6742510E2FD;
 Fri, 26 Sep 2025 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758876412; x=1790412412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MqJdruCHgnjZUj9KwJr+po8RkBPfCkgtOTm3sDWYslA=;
 b=WJlQQ6uHexWe0BN3P4iNs+G0An9DQJTn4AQvrcM0sLw8nD7/2zX26N+L
 BTZoHiOeBeihSIMsjAeMBYvvI/QmYN2UGfl4LBgEZ9WvnWZsQQll6av/s
 vmIGj6aqYZyoEU9xwvtBnkTFNl40UvclQX3PxEqByslt/WavBumOKd+HY
 HHnMczDa3rX85gn4NHZTBd+5gBq+BiZ1dMz47tbVTCEqZUF4CTDsDObLL
 nh6C6kMD+/okkDf33A4300GkHYt9KqREG++Brb1QN1F8M93VmmGlLxFtD
 P/D5MVA5rpcY5P8mPtCzY3zjuAdAEHLyWSF8mIj886JlMeo2SdYqrZHNK A==;
X-CSE-ConnectionGUID: XIs/DDcqTveV9zyvZHl4Wg==
X-CSE-MsgGUID: TXJbDduEROijo4Z6ynqXJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="65054069"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="65054069"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 01:46:52 -0700
X-CSE-ConnectionGUID: bJtP7oYBRf6WLoR+7FRE8Q==
X-CSE-MsgGUID: Hz7qb9q1SnKH5sCDz+a+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="182839743"
Received: from opintica-mobl1 (HELO fedora) ([10.245.244.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 01:46:50 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH v2 2/2] drm/xe/dma-buf: Add generic interconnect support
 framework
Date: Fri, 26 Sep 2025 10:46:24 +0200
Message-ID: <20250926084624.2288-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Negotiate to use an xe-specific interconnect.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 12 ++---
 drivers/gpu/drm/xe/xe_dma_buf.c       | 73 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_dma_buf.h       |  1 -
 drivers/gpu/drm/xe/xe_interconnect.h  | 31 ++++++++++++
 4 files changed, 104 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_interconnect.h

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 5df98de5ba3c..8eaea6c2a3b7 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -210,9 +210,9 @@ static const struct dma_buf_attach_ops nop2p_attach_ops = {
  */
 static const struct dma_buf_test_params test_params[] = {
 	{.mem_mask = XE_BO_FLAG_VRAM0,
-	 .attach_ops = &xe_dma_buf_attach_ops},
+	 .attach_ops = &xe_dma_buf_attach_ops.dma_ops},
 	{.mem_mask = XE_BO_FLAG_VRAM0 | XE_BO_FLAG_NEEDS_CPU_ACCESS,
-	 .attach_ops = &xe_dma_buf_attach_ops,
+	 .attach_ops = &xe_dma_buf_attach_ops.dma_ops,
 	 .force_different_devices = true},
 
 	{.mem_mask = XE_BO_FLAG_VRAM0,
@@ -226,9 +226,9 @@ static const struct dma_buf_test_params test_params[] = {
 	 .force_different_devices = true},
 
 	{.mem_mask = XE_BO_FLAG_SYSTEM,
-	 .attach_ops = &xe_dma_buf_attach_ops},
+	 .attach_ops = &xe_dma_buf_attach_ops.dma_ops},
 	{.mem_mask = XE_BO_FLAG_SYSTEM,
-	 .attach_ops = &xe_dma_buf_attach_ops,
+	 .attach_ops = &xe_dma_buf_attach_ops.dma_ops,
 	 .force_different_devices = true},
 
 	{.mem_mask = XE_BO_FLAG_SYSTEM,
@@ -242,10 +242,10 @@ static const struct dma_buf_test_params test_params[] = {
 	 .force_different_devices = true},
 
 	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
-	 .attach_ops = &xe_dma_buf_attach_ops},
+	 .attach_ops = &xe_dma_buf_attach_ops.dma_ops},
 	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0 |
 		     XE_BO_FLAG_NEEDS_CPU_ACCESS,
-	 .attach_ops = &xe_dma_buf_attach_ops,
+	 .attach_ops = &xe_dma_buf_attach_ops.dma_ops,
 	 .force_different_devices = true},
 
 	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 54e42960daad..ffb00d54bb9e 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -16,18 +16,49 @@
 #include "tests/xe_test.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_interconnect.h"
 #include "xe_pm.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
+struct xe_dma_buf_attach_ops {
+	struct dma_buf_attach_ops dma_ops;
+	struct xe_interconnect_attach_ops ic_ops;
+};
+
+static const struct xe_dma_buf_attach_ops *
+to_xe_dma_buf_attach_ops(struct dma_buf_attachment *attach)
+{
+	const struct dma_buf_attach_ops *aops = attach->importer_ops;
+	const struct dma_buf_interconnect_attach_ops *iaops;
+
+	if (!aops || !aops->supports_interconnect)
+		return NULL;
+
+	iaops = aops->supports_interconnect(attach, xe_interconnect);
+	return iaops ? container_of(iaops, struct xe_dma_buf_attach_ops, ic_ops.base) : NULL;
+}
+
 static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 			     struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
+	const struct xe_dma_buf_attach_ops *xe_attach_ops =
+		to_xe_dma_buf_attach_ops(attach);
+
+	if (xe_attach_ops && xe_attach_ops->ic_ops.allow_ic) {
+		struct xe_interconnect_attach *xe_attach = kzalloc(sizeof(*attach), GFP_KERNEL);
+
+		if (xe_attach) {
+			xe_attach->base.interconnect = xe_interconnect;
+			xe_attach->sg_list_replacement = NULL;
+			attach->interconnect_attach = &xe_attach->base;
+		}
+	}
 
-	if (attach->peer2peer &&
+	if (!attach->interconnect_attach && attach->peer2peer &&
 	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
 		attach->peer2peer = false;
 
@@ -43,6 +74,7 @@ static void xe_dma_buf_detach(struct dma_buf *dmabuf,
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 
+	kfree(attach->interconnect_attach);
 	xe_pm_runtime_put(to_xe_device(obj->dev));
 }
 
@@ -135,6 +167,11 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
+		if (attach->interconnect_attach &&
+		    attach->interconnect_attach->interconnect == xe_interconnect) {
+			/* Map using something else than sglist */
+			;
+		}
 		r = xe_ttm_vram_mgr_alloc_sgt(xe_bo_device(bo),
 					      bo->ttm.resource, 0,
 					      bo->ttm.base.size, attach->dev,
@@ -285,9 +322,28 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	XE_WARN_ON(xe_bo_evict(bo, exec));
 }
 
-static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
-	.allow_peer2peer = true,
-	.move_notify = xe_dma_buf_move_notify
+static const struct dma_buf_interconnect_attach_ops *
+xe_dma_buf_supports_interconnect(struct dma_buf_attachment *attach,
+				 const struct dma_buf_interconnect *interconnect)
+{
+	if (interconnect == xe_interconnect) {
+		return &container_of(attach->importer_ops,
+				     const struct xe_dma_buf_attach_ops,
+				     dma_ops)->ic_ops.base;
+	}
+
+	return NULL;
+}
+
+static const struct xe_dma_buf_attach_ops xe_dma_buf_attach_ops = {
+	.dma_ops = {
+		.allow_peer2peer = true,
+		.move_notify = xe_dma_buf_move_notify,
+		.supports_interconnect = xe_dma_buf_supports_interconnect,
+	},
+	.ic_ops = {
+		.allow_ic = true,
+	}
 };
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
@@ -336,12 +392,11 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 	if (IS_ERR(bo))
 		return ERR_CAST(bo);
 
-	attach_ops = &xe_dma_buf_attach_ops;
+	attach_ops = &xe_dma_buf_attach_ops.dma_ops;
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 	if (test)
 		attach_ops = test->attach_ops;
 #endif
-
 	attach = dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->ttm.base);
 	if (IS_ERR(attach)) {
 		obj = ERR_CAST(attach);
@@ -364,6 +419,12 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 	return obj;
 }
 
+static const struct dma_buf_interconnect _xe_interconnect = {
+	.name = "xe_interconnect",
+};
+
+const struct dma_buf_interconnect *xe_interconnect = &_xe_interconnect;
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_dma_buf.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.h b/drivers/gpu/drm/xe/xe_dma_buf.h
index 861dd28a862c..6b381ce4b7c1 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.h
+++ b/drivers/gpu/drm/xe/xe_dma_buf.h
@@ -11,5 +11,4 @@
 struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags);
 struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 					   struct dma_buf *dma_buf);
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_interconnect.h b/drivers/gpu/drm/xe/xe_interconnect.h
new file mode 100644
index 000000000000..2b8bc9bf1c8d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_interconnect.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef _XE_INTERCONNECT_H_
+#define _XE_INTERCONNECT_H_
+
+#include <linux/types.h>
+#include <linux/dma-buf.h>
+
+struct device_private_address;
+
+/* This file needs to be shared between the importer and exporter of the interconnect */
+
+extern const struct dma_buf_interconnect *xe_interconnect;
+
+struct xe_interconnect_attach_ops {
+	struct dma_buf_interconnect_attach_ops base;
+	/*
+	 * Here interconnect-private stuff can be added.
+	 * Like a function to check interconnect possibility.
+	 */
+	bool allow_ic;
+};
+
+struct xe_interconnect_attach {
+	struct dma_buf_interconnect_attach base;
+	struct device_private_address *sg_list_replacement;
+};
+
+#endif
-- 
2.51.0

