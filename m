Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC1CB1179A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE1810E41C;
	Fri, 25 Jul 2025 05:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4jpjkrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5D010E42A;
 Fri, 25 Jul 2025 05:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419871; x=1784955871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lf+AJx3OZrWGqB4/mYdPVfkuUeZ1t2Vo75LEn6yg5U8=;
 b=f4jpjkrNPJt+ClK7iA3lP31PrSzhYh+Uuho443k5h8nqpoU6YnAqQKXe
 9VOAEsDAwzTY8pbjS28zT3K3gZg1T00ZxFE6zAulCf3LOMzpaMmNVBC4q
 pFXPTD14cgTTnL/rIW2SeJmshP4qLtMEnQq46TMRFXL6CqRBqwhSWd21f
 diTc/wyiHmiCiitw/k0SYCnG6dZUCG+iVU64ZtdAxzzsasNjL7o6rP1Wr
 tCCKNMzCTX0jWEocEvShy05WKHdEzktHUmvIFZgvLbuh+t1sTeJGsHcxl
 sZ8GETw5QH+hT/uC2UUlqJW5WuoggJyyBmmx/PZfZ49hrTbwLDPoV/U7/ w==;
X-CSE-ConnectionGUID: d3Gem1CMS/SmtkPLAHkHSw==
X-CSE-MsgGUID: msdknkQ0Qo2eDnZ72tUQ2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299523"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299523"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:30 -0700
X-CSE-ConnectionGUID: dFbkY+cHTbyh2T2AdXrUdA==
X-CSE-MsgGUID: IIP/YF0STAaqj7OJii3C1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956536"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:28 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 06/28] drm/i915/writeback: Init writeback connector
Date: Fri, 25 Jul 2025 10:33:47 +0530
Message-Id: <20250725050409.2687242-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/display/intel_writeback.c    | 129 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_writeback.h    |  17 +++
 3 files changed, 147 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 853543443072..c9201f6111c3 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -295,6 +295,7 @@ i915-y += \
 	display/intel_vblank.o \
 	display/intel_vga.o \
 	display/intel_wm.o \
+	display/intel_writeback.o \
 	display/skl_scaler.o \
 	display/skl_universal_plane.o \
 	display/skl_watermark.o \
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
new file mode 100644
index 000000000000..f3843ac9b026
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
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
+#include "intel_atomic.h"
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
+	enum transcoder trans;
+	int frame_num;
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
+	conn_state = kzalloc(sizeof(*conn_state), GFP_KERNEL);
+	if (!conn_state)
+		return -ENOMEM;
+
+	__drm_atomic_helper_connector_reset(&connector->base,
+					    &conn_state->base);
+	return 0;
+}
+
+static int
+intel_writeback_connector_alloc(struct intel_connector *connector)
+{
+	if (intel_writeback_connector_init(connector) < 0) {
+		kfree(connector);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+const struct drm_connector_funcs conn_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_helper_funcs conn_helper_funcs = {
+};
+
+static const struct drm_writeback_connector_helper_funcs writeback_conn_helper_funcs = {
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
+	encoder = &writeback_conn->encoder;
+	encoder->base.possible_crtcs = 0xf;
+	ret = drm_encoder_init(display->drm, &encoder->base,
+			       &drm_writeback_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret) {
+		kfree(writeback_conn);
+		return ret;
+	}
+
+	encoder->type = INTEL_OUTPUT_WRITEBACK;
+	encoder->pipe_mask = ~0;
+	encoder->cloneable = 0;
+
+	connector = &writeback_conn->connector;
+	intel_writeback_connector_alloc(connector);
+
+	connector->base.interlace_allowed = 0;
+	drm_connector_helper_add(&connector->base, &conn_helper_funcs);
+	ret = drm_writeback_connector_init_with_conn(display->drm, &connector->base,
+						     &writeback_conn->base,
+						     &encoder->base, &conn_funcs,
+						     &writeback_conn_helper_funcs,
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
+	connector->get_hw_state = intel_connector_get_hw_state;
+	connector->base.status = connector_status_disconnected;
+	writeback_conn->frame_num = 1;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.h b/drivers/gpu/drm/i915/display/intel_writeback.h
new file mode 100644
index 000000000000..5911684cb81a
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_writeback.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
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

