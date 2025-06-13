Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B575BAD830E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 08:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B2110E8D9;
	Fri, 13 Jun 2025 06:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxMwad/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F15610E8D4;
 Fri, 13 Jun 2025 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749795374; x=1781331374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BnDzjZ2SgmifM6GAJuNZkjz8+6p7eNY0whDbUAwJtHE=;
 b=hxMwad/2efOQTg+zbPsvkOqz3yEX1G+ho0SmVo5xMVzblDaM5U6MjVqK
 S+xm5NP4L00WBYBoTjpjwq7cj+ngfqV1Q7yvTAmw6994BzCruIGUR3bSu
 xcQnJQDINwd8GJEHZiklQnRUDSz8VpK3nwB+FIqT3EMLK7cjoiPvI0NaK
 PZ2DXyWIIHj+PsggiwPOKWGabsQrdROYEIFHxCw2aubwGtXCME21hcOjX
 Igi9SUP+842l1yCVlCZYh0ioVh4iy1tY/viN5xBev3vTBawupFh4ifl8d
 JBR4gtrBrMow/xnA3Pwjh6lEU3/6Ldj/Kosp4KCJYTx6ywd2uUh4S0+cR w==;
X-CSE-ConnectionGUID: hi8/6HcWT/GDYr27BqQv2A==
X-CSE-MsgGUID: X1d3OwJlTBiHd1AvXqvv2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="39608853"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="39608853"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 23:16:14 -0700
X-CSE-ConnectionGUID: HFB53aOTQFG7BxQw1jm6tQ==
X-CSE-MsgGUID: xvc7maGpS4uXY7/7HrU1sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="152717245"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 12 Jun 2025 23:16:12 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [RFC PATCH 4/4] drm/i915/writeback: Init writeback connector
Date: Fri, 13 Jun 2025 11:45:50 +0530
Message-Id: <20250613061550.2893526-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613061550.2893526-1-suraj.kandpal@intel.com>
References: <20250613061550.2893526-1-suraj.kandpal@intel.com>
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

Initialize writeback connector initialising the virtual encoder
and intel connector. We also allocate memory for drm_writeback_connector
but not the drm_connector within it due to a constraint
we need all connectors to be an intel_connector.
The writeback_format arrays is used to tell the user which
drm formats are supported by us.

Bspec: 49275
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 13d4a16f7d33..0748edae8aa9 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -294,6 +294,7 @@ i915-y += \
 	display/intel_vblank.o \
 	display/intel_vga.o \
 	display/intel_wm.o \
+	display/intel_writeback.o \
 	display/skl_scaler.o \
 	display/skl_universal_plane.o \
 	display/skl_watermark.o
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
new file mode 100644
index 000000000000..7be2c24c530f
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/slab.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_writeback.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_encoder.h>
+
+#include "i915_drv.h"
+#include "intel_de.h"
+#include "intel_display_types.h"
+#include "intel_display_driver.h"
+#include "intel_connector.h"
+#include "intel_writeback.h"
+
+struct intel_writeback_connector {
+	struct drm_writeback_connector base;
+	struct intel_encoder encoder;
+	struct intel_connector connector;
+};
+
+static const u32 writeback_formats[] = {
+	DRM_FORMAT_XYUV8888,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XVYU2101010,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_XBGR2101010,
+};
+
+static int intel_writeback_connector_init(struct intel_connector *connector)
+{
+	struct intel_digital_connector_state *conn_state;
+
+	conn_state = kzalloc(sizeof(conn_state), GFP_KERNEL);
+	if (!conn_state)
+		return -ENOMEM;
+
+	__drm_atomic_helper_connector_reset(&connector->base,
+					    &conn_state->base);
+
+	return 0;
+}
+
+static struct
+intel_connector *intel_writeback_connector_alloc(struct intel_connector *connector)
+{
+	connector = kzalloc(sizeof(connector), GFP_KERNEL);
+	if (!connector)
+		return NULL;
+
+	if (intel_writeback_connector_init(connector) < 0) {
+		kfree(connector);
+		return NULL;
+	}
+
+	return connector;
+}
+
+static const struct drm_encoder_helper_funcs enc_helper_funcs = {
+};
+
+static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+const struct drm_connector_funcs conn_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_helper_funcs intel_writeback_conn_helper_funcs = {
+};
+
+int intel_writeback_init(struct intel_display *display)
+{
+	struct intel_encoder *encoder;
+	struct intel_writeback_connector *writeback_conn;
+	struct intel_connector *connector;
+	int ret;
+
+	writeback_conn = kzalloc(sizeof(*writeback_conn), GFP_KERNEL);
+	if (!writeback_conn)
+		return -ENOSPC;
+
+	connector = &writeback_conn->connector;
+	intel_writeback_connector_alloc(connector);
+
+	encoder = &writeback_conn->encoder;
+	drm_encoder_helper_add(&encoder->base, &enc_helper_funcs);
+	ret = drm_encoder_init(display->drm, &encoder->base,
+			       &drm_writeback_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret) {
+		intel_connector_free(connector);
+		kfree(writeback_conn);
+		return ret;
+	}
+
+	encoder->base.possible_crtcs = 0xf;
+	encoder->type = INTEL_OUTPUT_WRITEBACK;
+	encoder->pipe_mask = ~0;
+
+	connector->base.interlace_allowed = 0;
+	drm_connector_helper_add(&connector->base, &intel_writeback_conn_helper_funcs);
+	ret = drm_writeback_connector_init_with_conn(display->drm, &connector->base,
+						     &writeback_conn->base,
+						     &encoder->base, &conn_funcs,
+						     writeback_formats,
+						     ARRAY_SIZE(writeback_formats));
+	if (ret) {
+		intel_connector_free(connector);
+		drm_encoder_cleanup(&encoder->base);
+		kfree(&writeback_conn->encoder);
+		kfree(writeback_conn);
+		return ret;
+	}
+
+	intel_connector_attach_encoder(connector, encoder);
+
+	return 0;
+}
+
+
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.h b/drivers/gpu/drm/i915/display/intel_writeback.h
new file mode 100644
index 000000000000..bdd433a83835
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_writeback.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_WRITEBACK_H__
+#define __INTEL_WRITEBACK_H__
+
+#include <linux/types.h>
+
+struct intel_display;
+struct intel_writeback_connector;
+
+int intel_writeback_init(struct intel_display *display);
+
+#endif /* __INTEL_WRITEBACK_H__ */
+
-- 
2.34.1

