Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1944BB9F6EA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BC810E91D;
	Thu, 25 Sep 2025 13:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1tsCrDH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14410E91B;
 Thu, 25 Sep 2025 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758805759; x=1790341759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xuaCmYDCN/vVg5YfT7DtznqrL8bkFM2T4rIX+TL5tas=;
 b=Q1tsCrDHpcZzHSGSZ4s+NrEK7lomzajWS670Aq+s0FPSUhDO+SYUGJxn
 TNbjHrZ7IaXAUAjmTq9wC9qDBjWpg1y9xCZfZ0xglbIdMfOj4j31Ra+Kk
 ADOiJJ/iZ5qZBrBgyv8J7jDYKnmt++7kiLeO29Z78XY/GQuGR2eDjMQy1
 +G0Wd0QQ+RFcMtxuQzUK4MLE/dZnQuBKtTpZ9I6PEWqtaoD3zOa6Y9sZI
 hKVWWRgiG2LWHQPN6fWJ+aKvTC3GfIMwhcYybUHdS8gRviktitqeEetYG
 hmbpPu873AZX0dwwvdFcGUhSB2MpRPkmpLDWLSVIDFQwoFK/28cs1JebX Q==;
X-CSE-ConnectionGUID: chuw0aihRSa3Izk3j3fAMQ==
X-CSE-MsgGUID: i2YDGZdSRLSBw+hsVnOn4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61035822"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61035822"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 06:09:19 -0700
X-CSE-ConnectionGUID: 6qc3KjshRvy+a4FoGm4dOQ==
X-CSE-MsgGUID: G269syTsR02tQvC+GE4Idg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="201011393"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.100])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 06:09:15 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 2/2] drm/xe/dma-buf: Add generic interconnect support
 framework
Date: Thu, 25 Sep 2025 15:08:49 +0200
Message-ID: <20250925130849.12021-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925130849.12021-1-thomas.hellstrom@linux.intel.com>
References: <20250925130849.12021-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 12 +++---
 drivers/gpu/drm/xe/xe_dma_buf.c       | 54 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_dma_buf.h       |  1 -
 drivers/gpu/drm/xe/xe_interconnect.h  | 22 +++++++++++
 4 files changed, 75 insertions(+), 14 deletions(-)
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
index 54e42960daad..40e9a28eaf64 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -16,19 +16,40 @@
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
+
+	if (!aops || !aops->supports_interconnect)
+		return NULL;
+
+	return aops->supports_interconnect(attach, xe_interconnect);
+}
+
 static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 			     struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
+	const struct xe_dma_buf_attach_ops *xe_attach_ops =
+		to_xe_dma_buf_attach_ops(attach);
 
-	if (attach->peer2peer &&
-	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
+	if (xe_attach_ops && xe_attach_ops->ic_ops.allow_ic)
+		attach->interconnect = xe_interconnect;
+	else if (attach->peer2peer &&
+		 pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
 		attach->peer2peer = false;
 
 	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
@@ -285,9 +306,27 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	XE_WARN_ON(xe_bo_evict(bo, exec));
 }
 
-static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
-	.allow_peer2peer = true,
-	.move_notify = xe_dma_buf_move_notify
+static const void *xe_dma_buf_supports_interconnect(struct dma_buf_attachment *attach,
+						    const void *interconnect)
+{
+	if (interconnect == xe_interconnect) {
+		return &container_of(attach->importer_ops,
+				     const struct xe_dma_buf_attach_ops,
+				     dma_ops)->ic_ops;
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
@@ -336,12 +375,11 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
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
@@ -364,6 +402,8 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_device *dev,
 	return obj;
 }
 
+void *xe_interconnect = "XE_INTERCONNECT";
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
index 000000000000..1fa052623d05
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_interconnect.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef _XE_INTERCONNECT_H_
+#define _XE_INTERCONNECT_H_
+
+#include <linux/types.h>
+
+/* This file needs to be shared between the importer and exporter of the interconnect */
+
+extern void *xe_interconnect;
+
+struct xe_interconnect_attach_ops {
+	/*
+	 * Here interconnect-private stuff can be added.
+	 * Like a function to check interconnect possibility.
+	 */
+	bool allow_ic;
+};
+
+#endif
-- 
2.51.0

