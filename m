Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B926150C290
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 01:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A526510ECBB;
	Fri, 22 Apr 2022 23:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD48110EC91;
 Fri, 22 Apr 2022 23:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650668846; x=1682204846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Lp6352XFHPnAv8EpuYTsHZhTBTQz1scCMjo3gM25OlM=;
 b=f+2RGQpMLC70WHKrt36U0TfyoyEEEWltkrSfGzZ4nve/ccmdh0qhW0HO
 8GB748BtA9e80YprGY1bwPsZDqnw1iRIW7xTdQPmoENUzofHPKajNUNHA
 spKm1RgXjZOjl0gpST1x3fiZVTriiQSUSsz80V6OdimX32OIMUEhmGEr9 w=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Apr 2022 16:07:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 16:07:25 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 16:07:25 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 16:07:24 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v4 15/20] drm/msm/dpu: add the writeback connector layer
Date: Fri, 22 Apr 2022 16:06:50 -0700
Message-ID: <1650668815-7048-16-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650668815-7048-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650668815-7048-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the dpu_writeback module which serves as the
interface between dpu operations and the drm_writeback.

This module manages the connector related operations for
dpu writeback.

changes in v2:
	- start using drm_writeback_connector_init_with_encoder()
	- drop unnecessary arguments from dpu_writeback_init()
	- rebase on msm-next tip and remove usage of priv->connectors

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                  |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 68 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h | 25 ++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 0387f22..66395ee 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -80,6 +80,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_plane.o \
 	disp/dpu1/dpu_rm.o \
 	disp/dpu1/dpu_vbif.o \
+	disp/dpu1/dpu_writeback.o
 
 msm-$(CONFIG_DRM_MSM_MDSS) += \
 	msm_mdss.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
new file mode 100644
index 0000000..526d884
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "dpu_writeback.h"
+
+static int dpu_wb_conn_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+
+	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
+			dev->mode_config.max_height);
+}
+
+static const struct drm_connector_funcs dpu_wb_conn_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int dpu_wb_conn_prepare_job(struct drm_writeback_connector *connector,
+		struct drm_writeback_job *job)
+{
+	if (!job->fb)
+		return 0;
+
+	dpu_encoder_prepare_wb_job(connector->encoder, job);
+
+	return 0;
+}
+
+static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
+		struct drm_writeback_job *job)
+{
+	if (!job->fb)
+		return;
+
+	dpu_encoder_cleanup_wb_job(connector->encoder, job);
+}
+
+static const struct drm_connector_helper_funcs dpu_wb_conn_helper_funcs = {
+	.get_modes = dpu_wb_conn_get_modes,
+	.prepare_writeback_job = dpu_wb_conn_prepare_job,
+	.cleanup_writeback_job = dpu_wb_conn_cleanup_job,
+};
+
+int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
+		const u32 *format_list, u32 num_formats)
+{
+	struct dpu_wb_connector *dpu_wb_conn;
+	int rc = 0;
+
+	dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
+
+	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
+
+	/* DPU initializes the encoder and sets it up completely for writeback
+	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
+	 * to initialize the writeback connector
+	 */
+	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
+			&dpu_wb_conn_funcs, format_list, num_formats);
+
+	return rc;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
new file mode 100644
index 0000000..05aff05
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DPU_WRITEBACK_H
+#define _DPU_WRITEBACK_H
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_file.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_writeback.h>
+
+#include "msm_drv.h"
+#include "dpu_kms.h"
+#include "dpu_encoder_phys.h"
+
+struct dpu_wb_connector {
+	struct drm_writeback_connector base;
+};
+
+int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
+		const u32 *format_list, u32 num_formats);
+
+#endif /*_DPU_WRITEBACK_H */
-- 
2.7.4

