Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF4C50D64B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 02:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAF010EFE3;
	Mon, 25 Apr 2022 00:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59C110EF9D;
 Mon, 25 Apr 2022 00:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650846762; x=1682382762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=TFI+oM1zRJQfNkGkqjNqVOpVK2d/fhoactIphdlJI4o=;
 b=pSykLPr4u8Yasc2SvtpjxkCYQiNt0XOb1+yTFigzODDEGf8UB4iI4leL
 PB2zUBnxjUudVdifRnS/4TpYozqbB78vJzc7HxYAChE4Sbe1vEiZnZR1c
 IoT0d752NwAuvCzIyV+v0fTfpIS+QudiC13rzlcWeIiOaMNez7Rd50uVe 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Apr 2022 17:32:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 17:32:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 24 Apr 2022 17:32:42 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 24 Apr 2022 17:32:41 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v5 16/19] drm/msm/dpu: gracefully handle null fb commits for
 writeback
Date: Sun, 24 Apr 2022 17:32:07 -0700
Message-ID: <1650846730-19226-17-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650846730-19226-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650846730-19226-1-git-send-email-quic_abhinavk@quicinc.com>
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

kms_writeback test cases also verify with a null fb for the
writeback connector job. In addition there are also other
commit paths which can result in kickoffs without a valid
framebuffer like while closing the fb which results in the
callback to drm_atomic_helper_dirtyfb() which internally
triggers a commit.

Add protection in the dpu driver to ensure that commits for
writeback encoders without a valid fb are gracefully skipped.

changes in v2:
	- rename dpu_encoder_has_valid_fb to dpu_encoder_is_valid_for_commit

changes in v3:
	- none

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c            |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h         |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 12 ++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7763558..d65e124 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -869,6 +869,13 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	DPU_ATRACE_BEGIN("crtc_commit");
 
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+			crtc->state->encoder_mask) {
+		if (!dpu_encoder_is_valid_for_commit(encoder)) {
+			DRM_DEBUG_ATOMIC("invalid FB not kicking off crtc\n");
+			goto end;
+		}
+	}
 	/*
 	 * Encoder will flush/start now, unless it has a tx pending. If so, it
 	 * may delay and flush at an irq event (e.g. ppdone)
@@ -891,6 +898,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 		dpu_encoder_kickoff(encoder);
 
 	reinit_completion(&dpu_crtc->frame_done_comp);
+
+end:
 	DPU_ATRACE_END("crtc_commit");
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2d79002..90ef807 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1862,6 +1862,27 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 		dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
 }
 
+bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	unsigned int i;
+	struct dpu_encoder_phys *phys;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL) {
+		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+			phys = dpu_enc->phys_encs[i];
+			if (phys->ops.is_valid_for_commit && !phys->ops.is_valid_for_commit(phys)) {
+				DPU_DEBUG("invalid FB not kicking off\n");
+				return false;
+			}
+		}
+	}
+
+	return true;
+}
+
 void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 6ceec1d..781d41c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -196,4 +196,10 @@ void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
 void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 		struct drm_writeback_job *job);
 
+/**
+ * dpu_encoder_is_valid_for_commit - check if encode has valid parameters for commit.
+ * @drm_enc:    Pointer to drm encoder structure
+ */
+bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
+
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index bed4523..f2af07d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -142,6 +142,7 @@ struct dpu_encoder_phys_ops {
 			struct drm_writeback_job *job);
 	void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
 			struct drm_writeback_job *job);
+	bool (*is_valid_for_commit)(struct dpu_encoder_phys *phys_enc);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4ab2699..cb5c7da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -667,6 +667,16 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
 	wb_enc->wb_conn = NULL;
 }
 
+static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
+
+	if (wb_enc->wb_job)
+		return true;
+	else
+		return false;
+}
+
 /**
  * dpu_encoder_phys_wb_init_ops - initialize writeback operations
  * @ops:	Pointer to encoder operation table
@@ -687,6 +697,8 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
 	ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
 	ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
+	ops->is_valid_for_commit = dpu_encoder_phys_wb_is_valid_for_commit;
+
 }
 
 /**
-- 
2.7.4

