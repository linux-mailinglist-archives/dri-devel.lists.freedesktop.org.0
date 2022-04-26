Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC7D5100C7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 16:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDAA10E49F;
	Tue, 26 Apr 2022 14:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E153610E3C2;
 Tue, 26 Apr 2022 14:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650984149; x=1682520149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=IeXADmYf51xXtzv+e1w6kyLTnDMw+BzLFXXWIGwYR7s=;
 b=iOjJer1PFgh8ObnA8qFoMcGkDty+M0824+kkLuMUnKAK5HBGu9GCnVG/
 ozJezML+t/1yDn/F0JQ4ZDdwIw9HkTCuRV5PjpDa3D7LyRWI4SsfbHNbE
 YPMpZUeaOWysq5EgL8C2xfBZtrAoQWDJipZQFUWTxCLjuf78CukSSVufj g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 07:42:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 07:42:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:42:20 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:42:19 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v6 14/19] drm/msm/dpu: add the writeback connector layer
Date: Tue, 26 Apr 2022 07:41:31 -0700
Message-ID: <1650984096-9964-15-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650984096-9964-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650984096-9964-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

changes in v3:
	- none

changes in v4:
	- none

changes in v5:
	- store the drm_enc in the dpu_wb_conn to be used while
	  using dpu_encoder APIs

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                  |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 76 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h | 31 +++++++++++
 3 files changed, 108 insertions(+)
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
index 0000000..7620ffe
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -0,0 +1,76 @@
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
+
+	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
+
+	if (!job->fb)
+		return 0;
+
+	dpu_encoder_prepare_wb_job(dpu_wb_conn->wb_enc, job);
+
+	return 0;
+}
+
+static void dpu_wb_conn_cleanup_job(struct drm_writeback_connector *connector,
+		struct drm_writeback_job *job)
+{
+	struct dpu_wb_connector *dpu_wb_conn = to_dpu_wb_conn(connector);
+
+	if (!job->fb)
+		return;
+
+	dpu_encoder_cleanup_wb_job(dpu_wb_conn->wb_enc, job);
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
+	if (!rc)
+		dpu_wb_conn->wb_enc = enc;
+
+	return rc;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
new file mode 100644
index 0000000..5a75ea9
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
@@ -0,0 +1,31 @@
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
+	struct drm_encoder *wb_enc;
+};
+
+static inline struct dpu_wb_connector *to_dpu_wb_conn(struct drm_writeback_connector *conn)
+{
+	return container_of(conn, struct dpu_wb_connector, base);
+}
+
+int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
+		const u32 *format_list, u32 num_formats);
+
+#endif /*_DPU_WRITEBACK_H */
-- 
2.7.4

