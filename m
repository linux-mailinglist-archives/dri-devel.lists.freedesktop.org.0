Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BD054E9B8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E60711A4DB;
	Thu, 16 Jun 2022 19:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F9811A4D2;
 Thu, 16 Jun 2022 19:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655406108; x=1686942108;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=9IVl9pjuM9Y9X6fdBtWsowyqEPPoqMj9xTy9D/wEjKY=;
 b=dxjtcGXZlu6uflGeuYiHjHq2ErlCBRiIh9LV+lycW639NOppGtA4w2u0
 6t4HF6BcqgCIQ+EXjBabBxxfeyJbC5ugapyMK3xjdBQ6Da5GXm/HNsXCE
 E/b/td1rqilhPDYuGpPp+NCnzPk7GB3lHLvWmigFR0qiAFSm1txugSHIP 4=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Jun 2022 12:01:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 12:01:47 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 12:01:47 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 12:01:46 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v3 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
Date: Thu, 16 Jun 2022 12:01:22 -0700
Message-ID: <1655406084-17407-1-git-send-email-quic_abhinavk@quicinc.com>
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

changes in v3:
	- correct the Fixes tag

Fixes: e02a559a720f ("drm/msm/dpu: make changes to dpu_encoder to support virtual encoder")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

