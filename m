Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106A35093E4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 01:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01F610F2D7;
	Wed, 20 Apr 2022 23:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3732410E360;
 Wed, 20 Apr 2022 23:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650498624; x=1682034624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=bkQuz+dv+piHw8s0lXFGNO5kewpNsUTCflWWkPMMGDc=;
 b=olzBMlIBrm9Lq17KI2QSMjO1dpA+35NDqGcGhXlkmEjinpK0ImF+3EBP
 A+DSn1I/dh8bo1Jqqf7WWSmr00uS5TjfYz2JGNXIkIEWiuCs8Z7qLQ+Nj
 xSQEs9LBEThVUIoZWatDWq+kBXglE55fYLNBO1AR4eykgXcnS8e8rB12k k=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 20 Apr 2022 16:50:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 16:50:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 16:50:08 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 16:50:07 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 12/18] drm/msm/dpu: add encoder operations to
 prepare/cleanup wb job
Date: Wed, 20 Apr 2022 16:49:41 -0700
Message-ID: <1650498587-14749-13-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
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

add dpu encoder APIs to prepare and cleanup writeback job
for the writeback encoder. These shall be invoked from the
prepare_wb_job/cleanup_wb_job hooks of the drm_writeback
framework.

changes in v3:
	- none

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 34 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h      | 16 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  5 ++++
 3 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ec93962..86bdd1a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -912,6 +912,40 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 	return 0;
 }
 
+void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
+		struct drm_writeback_job *job)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	int i;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (phys->ops.prepare_wb_job)
+			phys->ops.prepare_wb_job(phys, job);
+
+	}
+}
+
+void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
+		struct drm_writeback_job *job)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	int i;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (phys->ops.cleanup_wb_job)
+			phys->ops.cleanup_wb_job(phys, job);
+
+	}
+}
+
 static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 					     struct drm_crtc_state *crtc_state,
 					     struct drm_connector_state *conn_state)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 2903e65..6ceec1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -180,4 +180,20 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
  */
 bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @job:        Pointer to the current drm writeback job
+ */
+void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
+		struct drm_writeback_job *job);
+
+/**
+ * dpu_encoder_cleanup_wb_job - cleanup writeback job for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ * @job:        Pointer to the current drm writeback job
+ */
+void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
+		struct drm_writeback_job *job);
+
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 0b80af4..00951f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -7,6 +7,7 @@
 #ifndef __DPU_ENCODER_PHYS_H__
 #define __DPU_ENCODER_PHYS_H__
 
+#include <drm/drm_writeback.h>
 #include <linux/jiffies.h>
 
 #include "dpu_kms.h"
@@ -137,6 +138,10 @@ struct dpu_encoder_phys_ops {
 	void (*restore)(struct dpu_encoder_phys *phys);
 	int (*get_line_count)(struct dpu_encoder_phys *phys);
 	int (*get_frame_count)(struct dpu_encoder_phys *phys);
+	void (*prepare_wb_job)(struct dpu_encoder_phys *phys_enc,
+			struct drm_writeback_job *job);
+	void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
+			struct drm_writeback_job *job);
 };
 
 /**
-- 
2.7.4

