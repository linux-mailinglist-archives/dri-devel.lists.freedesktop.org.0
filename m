Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCB9516A66
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 07:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD7110FF00;
	Mon,  2 May 2022 05:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F262310FF00;
 Mon,  2 May 2022 05:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651470171; x=1683006171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rmVvQIZ+L5jSU+vZ2xs8MLE+/tvnkEH4OWx5MERMyMs=;
 b=Wi92CzzjXGZmms8mCae//D3GoF9VnnrGW1fh2eNwFT6CmEmwOd2SfkfQ
 deI/LwDqu3pB36Ekma3Psptk+6JPcjEsvI1t0jxfnQaeKFk5/163qGpwa
 kpuBANdyD88oM1qZLs/+RQ7boPSuohi/+vuzqHFN7IYvMDx3yqsEfmLQI
 kEr4xdDrI6vxZjOhZr8vJyIoUps6JKvxlJbMDLs1BgTHil6mI56iLilUY
 b3JI5DVym+WXuNcRkV8b9R1HtB4ux7T8Xh6hDx5LOwfziK2gTUWb1+SxV
 dF+/6i831gGs+VHG2SuFU0YjksZv1Z5zZRet4iEEt0ZW+CjJtOX1WpUUt A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="330111150"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="330111150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 22:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="619750874"
Received: from kandpal.iind.intel.com ([10.190.239.32])
 by fmsmga008.fm.intel.com with ESMTP; 01 May 2022 22:42:48 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: Creating writeback pipeline to bypass
 drm_writeback framework
Date: Mon,  2 May 2022 11:12:17 +0530
Message-Id: <20220502054219.2083162-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502054219.2083162-1-suraj.kandpal@intel.com>
References: <20220502054219.2083162-1-suraj.kandpal@intel.com>
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
Cc: jani.nikula@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 uma.shankar@intel.com, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes to create a i915 private pipeline to enable the WD transcoder
without relying on the current drm_writeback framework.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../drm/i915/display/intel_display_types.h    |   4 +
 .../gpu/drm/i915/display/intel_wb_connector.c | 296 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_wb_connector.h |  99 ++++++
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 5 files changed, 403 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_wb_connector.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_wb_connector.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index d2b18f03a33c..8bd1dd01dc81 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -298,6 +298,7 @@ i915-y += \
 	display/intel_tv.o \
 	display/intel_vdsc.o \
 	display/intel_vrr.o \
+	display/intel_wb_connector.o\
 	display/vlv_dsi.o \
 	display/vlv_dsi_pll.o
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 408152f9f46a..c4ccb03424f1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -52,6 +52,7 @@
 #include "intel_display_power.h"
 #include "intel_dpll_mgr.h"
 #include "intel_pm_types.h"
+#include "intel_wb_connector.h"
 
 struct drm_printer;
 struct __intel_global_objs_state;
@@ -537,11 +538,14 @@ struct intel_connector {
 	struct work_struct modeset_retry_work;
 
 	struct intel_hdcp hdcp;
+
+	struct intel_writeback_connector wb_conn;
 };
 
 struct intel_digital_connector_state {
 	struct drm_connector_state base;
 
+	struct intel_writeback_job *job;
 	enum hdmi_force_audio force_audio;
 	int broadcast_rgb;
 };
diff --git a/drivers/gpu/drm/i915/display/intel_wb_connector.c b/drivers/gpu/drm/i915/display/intel_wb_connector.c
new file mode 100644
index 000000000000..65f4abef53d0
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_wb_connector.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *	Suraj Kandpal <suraj.kandpal@intel.com>
+ *	Arun Murthy <arun.r.murthy@intel.com>
+ *
+ */
+
+
+#include <linux/dma-fence.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_property.h>
+
+#include "i915_drv.h"
+#include "intel_wb_connector.h"
+#include "intel_display_types.h"
+
+#define fence_to_wb_connector(x) container_of(x->lock, \
+					      struct intel_writeback_connector, \
+					      fence_lock)
+
+static const char *intel_writeback_fence_get_driver_name(struct dma_fence *fence)
+{
+	struct intel_writeback_connector *wb_connector =
+		fence_to_wb_connector(fence);
+
+	return wb_connector->base->dev->driver->name;
+}
+
+static const char *
+intel_writeback_fence_get_timeline_name(struct dma_fence *fence)
+{
+	struct intel_writeback_connector *wb_connector =
+		fence_to_wb_connector(fence);
+
+	return wb_connector->timeline_name;
+}
+
+static bool intel_writeback_fence_enable_signaling(struct dma_fence *fence)
+{
+	return true;
+}
+
+static const struct dma_fence_ops intel_writeback_fence_ops = {
+	.get_driver_name = intel_writeback_fence_get_driver_name,
+	.get_timeline_name = intel_writeback_fence_get_timeline_name,
+	.enable_signaling = intel_writeback_fence_enable_signaling,
+};
+
+static int intel_create_writeback_properties(struct drm_device *dev)
+{
+	struct drm_property *prop;
+	struct drm_i915_private *i915 = to_i915(dev);
+
+	if (!i915->wb_fb_id_property) {
+		prop = drm_property_create_object(dev, DRM_MODE_PROP_ATOMIC,
+						"WRITEBACK_FB_ID",
+						DRM_MODE_OBJECT_FB);
+		if (!prop)
+			return -ENOMEM;
+		i915->wb_fb_id_property = prop;
+	}
+
+	if (!i915->wb_pixel_formats_property) {
+		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB |
+					DRM_MODE_PROP_ATOMIC |
+					DRM_MODE_PROP_IMMUTABLE,
+					"WRITEBACK_PIXEL_FORMATS", 0);
+		if (!prop)
+			return -ENOMEM;
+		i915->wb_pixel_formats_property = prop;
+	}
+
+	if (!i915->wb_out_fence_ptr_property) {
+		prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+						"WRITEBACK_OUT_FENCE_PTR", 0,
+						U64_MAX);
+		if (!prop)
+			return -ENOMEM;
+		i915->wb_out_fence_ptr_property = prop;
+	}
+
+	return 0;
+}
+
+static const struct drm_encoder_funcs intel_writeback_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+int intel_writeback_connector_init(struct drm_device *dev,
+				 struct intel_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
+				 const u32 *formats, int n_formats)
+{
+	struct drm_property_blob *blob;
+	struct drm_i915_private *i915 = to_i915(dev);
+	struct drm_connector *connector = wb_connector->base;
+	int ret;
+
+	drm_dbg_kms(&i915->drm, "\n");
+	ret = intel_create_writeback_properties(dev);
+
+	if (ret != 0)
+		return ret;
+
+	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
+					formats);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
+	ret = drm_encoder_init(dev, wb_connector->encoder,
+			&intel_writeback_encoder_funcs,
+			DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		goto fail;
+
+	connector->interlace_allowed = 0;
+
+	ret = drm_connector_init(dev, connector, con_funcs,
+				DRM_MODE_CONNECTOR_WRITEBACK);
+	if (ret)
+		goto connector_fail;
+
+	ret = drm_connector_attach_encoder(connector,
+					wb_connector->encoder);
+	if (ret)
+		goto attach_fail;
+
+	INIT_LIST_HEAD(&wb_connector->job_queue);
+	spin_lock_init(&wb_connector->job_lock);
+
+	wb_connector->fence_context = dma_fence_context_alloc(1);
+	spin_lock_init(&wb_connector->fence_lock);
+	snprintf(wb_connector->timeline_name,
+		sizeof(wb_connector->timeline_name),
+		"CONNECTOR:%d-%s", connector->base.id, connector->name);
+
+	drm_object_attach_property(&connector->base,
+				i915->wb_out_fence_ptr_property, 0);
+
+	drm_object_attach_property(&connector->base,
+				i915->wb_fb_id_property, 0);
+
+	drm_object_attach_property(&connector->base,
+				i915->wb_pixel_formats_property,
+				blob->base.id);
+	wb_connector->pixel_formats_blob_ptr = blob;
+
+	return 0;
+
+attach_fail:
+	drm_connector_cleanup(connector);
+connector_fail:
+	drm_encoder_cleanup(wb_connector->encoder);
+fail:
+	drm_property_blob_put(blob);
+	return ret;
+}
+
+void intel_writeback_queue_job(struct intel_writeback_connector *wb_connector,
+		struct drm_connector_state *conn_state)
+{
+	struct intel_writeback_job *wb_job;
+	struct intel_digital_connector_state *intel_conn_state =
+		to_intel_digital_connector_state(conn_state);
+	unsigned long flags;
+
+	wb_job = intel_conn_state->job;
+	intel_conn_state->job = NULL;
+
+	spin_lock_irqsave(&wb_connector->job_lock, flags);
+	list_add_tail(&wb_job->list_entry, &wb_connector->job_queue);
+	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
+}
+
+int intel_writeback_set_fb(struct drm_connector_state *conn_state,
+			 struct drm_framebuffer *fb)
+{
+	struct intel_connector *intel_connector = to_intel_connector(conn_state->connector);
+	struct intel_writeback_connector *wb_connector = &intel_connector->wb_conn;
+	struct intel_digital_connector_state *intel_conn_state =
+		to_intel_digital_connector_state(conn_state);
+	WARN_ON(conn_state->connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK);
+
+	if (!intel_conn_state->job) {
+		intel_conn_state->job =
+			kzalloc(sizeof(*intel_conn_state->job), GFP_KERNEL);
+		if (!intel_conn_state->job)
+			return -ENOMEM;
+
+		intel_conn_state->job->connector = wb_connector;
+	}
+
+	drm_framebuffer_assign(&intel_conn_state->job->fb, fb);
+	return 0;
+}
+
+void intel_writeback_cleanup_job(struct intel_writeback_job *job)
+{
+	if (job->fb)
+		drm_framebuffer_put(job->fb);
+
+	if (job->out_fence)
+		dma_fence_put(job->out_fence);
+
+	kfree(job);
+}
+
+static void cleanup_work(struct work_struct *work)
+{
+	struct intel_writeback_job *job = container_of(work,
+						struct intel_writeback_job,
+						cleanup_work);
+
+	intel_writeback_cleanup_job(job);
+}
+
+void
+intel_writeback_signal_completion(struct intel_writeback_connector *wb_connector,
+				int status)
+{
+	unsigned long flags;
+	struct intel_writeback_job *job;
+	struct dma_fence *out_fence;
+
+	spin_lock_irqsave(&wb_connector->job_lock, flags);
+	job = list_first_entry_or_null(&wb_connector->job_queue,
+					struct intel_writeback_job,
+					list_entry);
+	if (job)
+		list_del(&job->list_entry);
+
+	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
+
+	if (WARN_ON(!job))
+		return;
+
+	out_fence = job->out_fence;
+	if (out_fence) {
+		if (status)
+			dma_fence_set_error(out_fence, status);
+		dma_fence_signal(out_fence);
+		dma_fence_put(out_fence);
+		job->out_fence = NULL;
+	}
+
+	INIT_WORK(&job->cleanup_work, cleanup_work);
+	queue_work(system_long_wq, &job->cleanup_work);
+}
+
+struct dma_fence *
+intel_writeback_get_out_fence(struct intel_writeback_connector *wb_connector)
+{
+	struct dma_fence *fence;
+
+	if (WARN_ON(wb_connector->base->connector_type !=
+		DRM_MODE_CONNECTOR_WRITEBACK))
+		return NULL;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return NULL;
+
+	dma_fence_init(fence, &intel_writeback_fence_ops,
+		&wb_connector->fence_lock, wb_connector->fence_context,
+		++wb_connector->fence_seqno);
+
+	return fence;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_wb_connector.h b/drivers/gpu/drm/i915/display/intel_wb_connector.h
new file mode 100644
index 000000000000..71142457b7c1
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_wb_connector.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *	Suraj Kandpal <suraj.kandpal@intel.com>
+ *	Arun Murthy <arun.r.murthy@intel.com>
+ *
+ */
+
+#ifndef __INTEL_WB_CONNECTOR_H__
+#define __INTEL_WB_CONNECTOR_H__
+
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+#include <linux/workqueue.h>
+#include "intel_display.h"
+
+/**
+ * struct intel_writeback_connector - Intel writeback connector
+ * to get a idea of each individual variable please look at
+ * documentation in drm_writeback.h we emulate the same structure
+ * ditto for intel_writeback_job structure.
+ */
+struct intel_writeback_connector {
+	struct drm_connector *base;
+	struct drm_encoder *encoder;
+	struct drm_property_blob *pixel_formats_blob_ptr;
+	spinlock_t job_lock;
+	struct list_head job_queue;
+	unsigned int fence_context;
+	spinlock_t fence_lock;
+	unsigned long fence_seqno;
+	char timeline_name[32];
+};
+
+/**
+ * struct intel_writeback_job - DRM writeback job
+ */
+struct intel_writeback_job {
+	struct intel_writeback_connector *connector;
+	bool *prepared;
+	struct work_struct cleanup_work;
+	struct list_head list_entry;
+	struct drm_framebuffer *fb;
+	struct dma_fence *out_fence;
+	void *priv;
+};
+
+int intel_writeback_connector_init(struct drm_device *dev,
+			struct intel_writeback_connector *wb_connector,
+			const struct drm_connector_funcs *con_funcs,
+			const struct drm_encoder_helper_funcs *enc_helper_funcs,
+			const u32 *formats, int n_formats);
+
+int intel_writeback_set_fb(struct drm_connector_state *conn_state,
+			struct drm_framebuffer *fb);
+
+int intel_writeback_prepare_job(struct intel_writeback_job *job);
+
+void intel_writeback_queue_job(struct intel_writeback_connector *wb_connector,
+			struct drm_connector_state *conn_state);
+
+void intel_writeback_cleanup_job(struct intel_writeback_job *job);
+
+void
+intel_writeback_signal_completion(struct intel_writeback_connector *wb_connector,
+			int status);
+
+struct dma_fence *
+intel_writeback_get_out_fence(struct intel_writeback_connector *wb_connector);
+struct intel_wb_connector *intel_wb_connector_alloc(void);
+void intel_wb_connector_free(struct intel_wb_connector *connector);
+void intel_wb_connector_destroy(struct drm_connector *connector);
+bool intel_wb_connector_get_hw_state(struct intel_wb_connector *connector);
+enum pipe intel_wb_connector_get_pipe(struct intel_wb_connector *connector);
+void intel_wb_connector_attach_encoder(struct intel_wb_connector *connector,
+					struct intel_encoder *encoder);
+
+#endif /* __INTEL_WB_CONNECTOR_H__ */
+
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 24111bf42ce0..3c8ac44d9fa3 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -673,6 +673,9 @@ struct drm_i915_private {
 
 	struct drm_property *broadcast_rgb_property;
 	struct drm_property *force_audio_property;
+	struct drm_property *wb_fb_id_property;
+	struct drm_property *wb_out_fence_ptr_property;
+	struct drm_property *wb_pixel_formats_property;
 
 	u32 fdi_rx_config;
 
-- 
2.35.1

