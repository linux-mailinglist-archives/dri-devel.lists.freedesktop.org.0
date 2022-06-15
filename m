Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CAC54D392
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 23:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6401132B1;
	Wed, 15 Jun 2022 21:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB03112EE0;
 Wed, 15 Jun 2022 21:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655328140; x=1686864140;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Us+TkJX0tTvqGq4zJjwX8dBqFxE7vOx03uOlFZZL5xM=;
 b=RxhuatlAe7HQwRZJAIozevPowBH4Evp+vfeF2Vqo2IOb4t5blZFQdPh9
 ZhtOvdLNIiPuXc3JcVXiVJ5CvPx4jyQJGSVT9xV0S4mJLUN7NlrOW35UK
 AeLa2IPtWFO/+QbbdK6Vdmn32J1x8cNdGdY1WdvtvKYuTQBJV7LERxYsJ 8=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 15 Jun 2022 14:22:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 14:22:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 14:22:19 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 14:22:18 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
Date: Wed, 15 Jun 2022 14:22:00 -0700
Message-ID: <1655328122-23619-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: markyacoub@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

intf and wb resources are not dependent on the rm global
state so need not be allocated during dpu_encoder_virt_atomic_mode_set().

Move the allocation of intf and wb resources to dpu_encoder_setup_display()
so that we can utilize the hw caps even during atomic_check() phase.

Since dpu_encoder_setup_display() already has protection against
setting invalid intf_idx and wb_idx, these checks can now
be dropped as well.

changes in v2:
	- add phys->hw_intf and phys->hw_wb checks back

Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual encoder")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3a462e327e0e..3be73211d631 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1048,24 +1048,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_pp = dpu_enc->hw_pp[i];
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
-		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
-			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
-
-		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
-			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
-
-		if (!phys->hw_intf && !phys->hw_wb) {
-			DPU_ERROR_ENC(dpu_enc,
-				      "no intf or wb block assigned at idx: %d\n", i);
-			return;
-		}
-
-		if (phys->hw_intf && phys->hw_wb) {
-			DPU_ERROR_ENC(dpu_enc,
-					"invalid phys both intf and wb block at idx: %d\n", i);
-			return;
-		}
-
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)
 			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
@@ -2293,7 +2275,25 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 		atomic_set(&phys->vsync_cnt, 0);
 		atomic_set(&phys->underrun_cnt, 0);
+
+		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
+			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
+
+		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
+			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
+
+		if (!phys->hw_intf && !phys->hw_wb) {
+			DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned at idx: %d\n", i);
+			ret = -EINVAL;
+		}
+
+		if (phys->hw_intf && phys->hw_wb) {
+			DPU_ERROR_ENC(dpu_enc,
+					"invalid phys both intf and wb block at idx: %d\n", i);
+			ret = -EINVAL;
+		}
 	}
+
 	mutex_unlock(&dpu_enc->enc_lock);
 
 	return ret;
-- 
2.7.4

