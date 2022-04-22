Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC66750C07E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 21:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D205210E60D;
	Fri, 22 Apr 2022 19:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BEA10E57E;
 Fri, 22 Apr 2022 19:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650656743; x=1682192743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=mSvNq9dpupHzgUcWOKn4lGzW4nBR8/iWevxgq0+5j1E=;
 b=acLK8IxgHlPRC1g+aNeR6UQExE+3FffG+Au79G8LTQZEIl9B2h2BV2Tq
 oqRkYs609wbq0rFU4Wj5s9U3gM+gBSpLu4HXr6kdXT9lRxBNicbKPCN/q
 iP/Uulr+sCNB+bLZMpMaYnb2K7YjCYyTaT4P5viGX90qoezJKzl4z2dYT 0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Apr 2022 12:45:43 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 12:45:43 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 12:45:43 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 12:45:42 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 2/3] drm/msm/dpu: add wb_idx to existing DRM prints in
 dpu_encoder
Date: Fri, 22 Apr 2022 12:45:28 -0700
Message-ID: <1650656729-8170-3-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650656729-8170-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650656729-8170-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add wb_idx to existing DRM prints in dpu_encoder and also
print the intf_mode so that its clear that for any INTF_CMD/VID
there will be a valid intf_idx and any INTF_WB_* there will be a
valid wb_idx.

Update the debugfs to add the same information. Here is a sample
output with this change:

root:/sys/kernel/debug/dri/0/encoder31# cat status
intf:1  wb:-1  vsync: 31  underrun: 0    mode: INTF_MODE_VIDEO
root:/sys/kernel/debug/dri/0/encoder33# cat status
intf:-1  wb:2  vsync:  7  underrun: 0    mode: INTF_MODE_WB_LINE

Also remove DPU_DEBUG_PHYS macros as its unused because the
respective dpu_encoder_phys_* files have their own macros.

changes in v2:
	- use switch case instead of if/else-if for get_intf_type

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 52 +++++++++++++----------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9ae9bd4..7bd20fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -37,18 +37,6 @@
 #define DPU_ERROR_ENC(e, fmt, ...) DPU_ERROR("enc%d " fmt,\
 		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
 
-#define DPU_DEBUG_PHYS(p, fmt, ...) DRM_DEBUG_ATOMIC("enc%d intf%d pp%d " fmt,\
-		(p) ? (p)->parent->base.id : -1, \
-		(p) ? (p)->intf_idx - INTF_0 : -1, \
-		(p) ? ((p)->hw_pp ? (p)->hw_pp->idx - PINGPONG_0 : -1) : -1, \
-		##__VA_ARGS__)
-
-#define DPU_ERROR_PHYS(p, fmt, ...) DPU_ERROR("enc%d intf%d pp%d " fmt,\
-		(p) ? (p)->parent->base.id : -1, \
-		(p) ? (p)->intf_idx - INTF_0 : -1, \
-		(p) ? ((p)->hw_pp ? (p)->hw_pp->idx - PINGPONG_0 : -1) : -1, \
-		##__VA_ARGS__)
-
 /*
  * Two to anticipate panels that can do cmd/vid dynamic switching
  * plan is to create all possible physical encoder types, and switch between
@@ -262,12 +250,30 @@ static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bp
 	hw_pp->ops.setup_dither(hw_pp, &dither_cfg);
 }
 
+static char *dpu_encoder_helper_get_intf_type(enum dpu_intf_mode intf_mode)
+{
+	switch (intf_mode) {
+	case INTF_MODE_VIDEO:
+		return "INTF_MODE_VIDEO";
+	case INTF_MODE_CMD:
+		return "INTF_MODE_CMD";
+	case INTF_MODE_WB_BLOCK:
+		return "INTF_MODE_WB_BLOCK";
+	case INTF_MODE_WB_LINE:
+		return "INTF_MODE_WB_LINE";
+	default:
+		return "INTF_MODE_UNKNOWN";
+	}
+}
+
 void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
 		enum dpu_intr_idx intr_idx)
 {
-	DRM_ERROR("irq timeout id=%u, intf=%d, pp=%d, intr=%d\n",
-		  DRMID(phys_enc->parent), phys_enc->intf_idx - INTF_0,
-		  phys_enc->hw_pp->idx - PINGPONG_0, intr_idx);
+	DRM_ERROR("irq timeout id=%u, intf_mode=%s intf=%d wb=%d, pp=%d, intr=%d\n",
+			DRMID(phys_enc->parent),
+			dpu_encoder_helper_get_intf_type(phys_enc->intf_mode),
+			phys_enc->intf_idx - INTF_0, phys_enc->wb_idx - WB_0,
+			phys_enc->hw_pp->idx - PINGPONG_0, intr_idx);
 
 	if (phys_enc->parent_ops->handle_frame_done)
 		phys_enc->parent_ops->handle_frame_done(
@@ -2048,22 +2054,12 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		seq_printf(s, "intf:%d    vsync:%8d     underrun:%8d    ",
-				phys->intf_idx - INTF_0,
+		seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    ",
+				phys->intf_idx - INTF_0, phys->wb_idx - WB_0,
 				atomic_read(&phys->vsync_cnt),
 				atomic_read(&phys->underrun_cnt));
 
-		switch (phys->intf_mode) {
-		case INTF_MODE_VIDEO:
-			seq_puts(s, "mode: video\n");
-			break;
-		case INTF_MODE_CMD:
-			seq_puts(s, "mode: command\n");
-			break;
-		default:
-			seq_puts(s, "mode: ???\n");
-			break;
-		}
+		seq_printf(s, "mode: %s\n", dpu_encoder_helper_get_intf_type(phys->intf_mode));
 	}
 	mutex_unlock(&dpu_enc->enc_lock);
 
-- 
2.7.4

