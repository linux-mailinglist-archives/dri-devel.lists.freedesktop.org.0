Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3F15EE9AB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB1010E785;
	Wed, 28 Sep 2022 22:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7661A10E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:48:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFC4C6BE;
 Thu, 29 Sep 2022 00:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405280;
 bh=GhrNkHEUmvuo0YeL57RsZhgq5+8sgxOPwHo8bE0fmV4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RSwisUyNtDtU2NRWS3V/gwtL8hlNIB47H9oWnsa1ok7Drf6DVcpXtttrnO69QfHz7
 qUU6rs8qwfLNYUbF+BOFbl+Rna55omN9GrNsCQqxbC69kBVb9zCzYQRcBvI2F0shho
 9CnESvfI70wuk+DH40B0Jqa7UPwaUQ5ZvOilav+I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 23/37] drm: xlnx: zynqmp_dpsub: Move DRM/KMS initialization
 to separate file
Date: Thu, 29 Sep 2022 01:47:05 +0300
Message-Id: <20220928224719.3291-24-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Start preparation for using the DPSUB as a standalone DisplayPort
encoder without a display controller by moving the DRM/KMS
initialization to a new zynqmp_kms.c file. No functional change
intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/Makefile       |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 43 ++----------------
 drivers/gpu/drm/xlnx/zynqmp_kms.c   | 70 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_kms.h   | 19 ++++++++
 4 files changed, 93 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_kms.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_kms.h

diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
index 51c24b72217b..ea1422a39502 100644
--- a/drivers/gpu/drm/xlnx/Makefile
+++ b/drivers/gpu/drm/xlnx/Makefile
@@ -1,2 +1,2 @@
-zynqmp-dpsub-y := zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
+zynqmp-dpsub-y := zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o zynqmp_kms.o
 obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index cb01548f2b8c..e4cb7b82556b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -17,9 +17,7 @@
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -30,12 +28,12 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "zynqmp_disp.h"
 #include "zynqmp_dp.h"
 #include "zynqmp_dpsub.h"
+#include "zynqmp_kms.h"
 
 /* -----------------------------------------------------------------------------
  * Dumb Buffer & Framebuffer Allocation
@@ -98,8 +96,6 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
 
 static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 {
-	struct drm_encoder *encoder = &dpsub->encoder;
-	struct drm_connector *connector;
 	struct drm_device *drm = &dpsub->drm;
 	int ret;
 
@@ -120,43 +116,10 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 
 	drm_kms_helper_poll_init(drm);
 
-	/*
-	 * Initialize the DISP and DP components. This will creates planes,
-	 * CRTC, and a bridge for the DP encoder.
-	 */
-	ret = zynqmp_disp_drm_init(dpsub);
-	if (ret)
+	ret = zynqmp_dpsub_kms_init(dpsub);
+	if (ret < 0)
 		goto err_poll_fini;
 
-	ret = zynqmp_dp_drm_init(dpsub);
-	if (ret)
-		goto err_poll_fini;
-
-	/* Create the encoder and attach the bridge. */
-	encoder->possible_crtcs |= zynqmp_disp_get_crtc_mask(dpsub->disp);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
-
-	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
-				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret) {
-		dev_err(dpsub->dev, "failed to attach bridge to encoder\n");
-		goto err_poll_fini;
-	}
-
-	/* Create the connector for the chain of bridges. */
-	connector = drm_bridge_connector_init(drm, encoder);
-	if (IS_ERR(connector)) {
-		dev_err(dpsub->dev, "failed to created connector\n");
-		ret = PTR_ERR(connector);
-		goto err_poll_fini;
-	}
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret < 0) {
-		dev_err(dpsub->dev, "failed to attach connector to encoder\n");
-		goto err_poll_fini;
-	}
-
 	/* Reset all components and register the DRM device. */
 	drm_mode_config_reset(drm);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
new file mode 100644
index 000000000000..e4e7f8fd96d2
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ZynqMP DisplayPort Subsystem - KMS API
+ *
+ * Copyright (C) 2017 - 2021 Xilinx, Inc.
+ *
+ * Authors:
+ * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
+ * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "zynqmp_disp.h"
+#include "zynqmp_dp.h"
+#include "zynqmp_dpsub.h"
+#include "zynqmp_kms.h"
+
+/* -----------------------------------------------------------------------------
+ * Initialization
+ */
+
+int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
+{
+	struct drm_encoder *encoder = &dpsub->encoder;
+	struct drm_connector *connector;
+	int ret;
+
+	/*
+	 * Initialize the DISP and DP components. This will creates planes,
+	 * CRTC, and a bridge for the DP encoder.
+	 */
+	ret = zynqmp_disp_drm_init(dpsub);
+	if (ret)
+		return ret;
+
+	ret = zynqmp_dp_drm_init(dpsub);
+	if (ret)
+		return ret;
+
+	/* Create the encoder and attach the bridge. */
+	encoder->possible_crtcs |= zynqmp_disp_get_crtc_mask(dpsub->disp);
+	drm_simple_encoder_init(&dpsub->drm, encoder, DRM_MODE_ENCODER_NONE);
+
+	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(dpsub->dev, "failed to attach bridge to encoder\n");
+		return ret;
+	}
+
+	/* Create the connector for the chain of bridges. */
+	connector = drm_bridge_connector_init(&dpsub->drm, encoder);
+	if (IS_ERR(connector)) {
+		dev_err(dpsub->dev, "failed to created connector\n");
+		return PTR_ERR(connector);
+	}
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret < 0) {
+		dev_err(dpsub->dev, "failed to attach connector to encoder\n");
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.h b/drivers/gpu/drm/xlnx/zynqmp_kms.h
new file mode 100644
index 000000000000..a6729d9d82cc
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ZynqMP DisplayPort Subsystem - KMS API
+ *
+ * Copyright (C) 2017 - 2021 Xilinx, Inc.
+ *
+ * Authors:
+ * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
+ * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#ifndef _ZYNQMP_KMS_H_
+#define _ZYNQMP_KMS_H_
+
+struct zynqmp_dpsub;
+
+int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub);
+
+#endif /* _ZYNQMP_KMS_H_ */
-- 
Regards,

Laurent Pinchart

