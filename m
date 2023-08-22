Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58FC784890
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 19:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BF610E3C1;
	Tue, 22 Aug 2023 17:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A37210E3BD;
 Tue, 22 Aug 2023 17:42:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37MHBXgl018334; Tue, 22 Aug 2023 17:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=Odxorr5uJn9A96agPReyZgxNUhYagy2a6ONJkehgKo4=;
 b=MD4UHZOF0vn2IuVwiieKOCa45W96Z3PT6J8AIKIOmcxCriZ0Im9Bg/hIb87lMSiwvRYp
 S+OYIsHddRrJ0OoiW7QucZEpb+n9mdvemkFRuKjATCOosiYGdkiLTOPwYPQtg0dmsR4A
 claNVQRfCkII8IQUMcpJd3ripjz315lzzst8oeIj9nHmXvGnRtUkz54Nb6AmHRQQfLr9
 gzxOyiQQbd+Qw3s1dohb1rhILBZOzlrynZNkkNnAJLZHfWNSwDghmjE6shxMaMZ945Gj
 DjUex1fkCN2nTOFxmvo5IPTgphhh7U07CKBkHib4ckDPPIBcO9uLxjmr7Lcx0RVFMAw1 0Q== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3smghqt4hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Aug 2023 17:42:46 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37MHgjFi015669
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Aug 2023 17:42:45 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 22 Aug 2023 10:42:45 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 22 Aug 2023 10:42:05 -0700
Subject: [PATCH v4 2/4] drm/msm/dpu: Enable widebus for DSI INTF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230822-add-widebus-support-v4-2-9dc86083d6ea@quicinc.com>
References: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
In-Reply-To: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692726164; l=5359;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=7EbBBeiN7rWO96Emz/2qo6c36vc3+IFtPE0onl+nr2s=;
 b=ds0ivYufyhrhmxEi28C3a7BKIx3y3z6MSvntaj/sAYLoxvVBnXa/UxQ7PXJbw84mi6aV/2jjk
 JjvfUiCfK5DDt5VL3FkVyoAZHT71b2DWtDiEoYWlxEAQcngALZPOd/2
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2OZiLaFlzNBsKPQyZdMzC2NYtpu55Tv9
X-Proofpoint-ORIG-GUID: 2OZiLaFlzNBsKPQyZdMzC2NYtpu55Tv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_14,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308220140
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPU supports a data-bus widen mode for DSI INTF.

Enable this mode for all supported chipsets if widebus is enabled for DSI.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 7 +++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 +
 drivers/gpu/drm/msm/dsi/dsi.c                        | 5 +++++
 drivers/gpu/drm/msm/msm_drv.h                        | 5 +++++
 6 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3dcd37c48aac..d4a21f172aba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1196,15 +1196,18 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	struct drm_display_mode *cur_mode = NULL;
 	struct msm_drm_private *priv = drm_enc->dev->dev_private;
 	struct msm_display_info *disp_info;
+	int index;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	disp_info = &dpu_enc->disp_info;
+	index = disp_info->h_tile_instance[0];
 
 	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
 
 	if (disp_info->intf_type == INTF_DP)
-		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
-				priv->dp[disp_info->h_tile_instance[0]]);
+		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
+	else if (disp_info->intf_type == INTF_DSI)
+		dpu_enc->wide_bus_en = msm_dsi_wide_bus_enabled(priv->dsi[index]);
 
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index df88358e7037..29a5f88a12ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -72,6 +72,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	if (intf_cfg.dsc != 0)
 		cmd_mode_cfg.data_compress = true;
 
+	cmd_mode_cfg.wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
+
 	if (phys_enc->hw_intf->ops.program_intf_cmd_cfg)
 		phys_enc->hw_intf->ops.program_intf_cmd_cfg(phys_enc->hw_intf, &cmd_mode_cfg);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8ec6505d9e78..5dcc83dd47ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -521,6 +521,9 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
 	if (cmd_mode_cfg->data_compress)
 		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
+	if (cmd_mode_cfg->wide_bus_en)
+		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
+
 	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
 }
 
@@ -545,6 +548,10 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
 	}
 
+	/* Technically, INTF_CONFIG2 is present for DPU 5.0+, but
+	 * we can configure it for DPU 7.0+ since the wide bus and DSC flags
+	 * would not be set for DPU < 7.0 anyways
+	 */
 	if (mdss_rev->core_major_ver >= 7)
 		ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 77f80531782b..c539025c418b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -50,6 +50,7 @@ struct dpu_hw_intf_status {
 
 struct dpu_hw_intf_cmd_mode_cfg {
 	u8 data_compress;	/* enable data compress between dpu and dsi */
+	u8 wide_bus_en;		/* enable databus widen mode */
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index baab79ab6e74..4cf424b3509f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -17,6 +17,11 @@ struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
 	return msm_dsi_host_get_dsc_config(msm_dsi->host);
 }
 
+bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi)
+{
+	return false;
+}
+
 static int dsi_get_phy(struct msm_dsi *msm_dsi)
 {
 	struct platform_device *pdev = msm_dsi->pdev;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9d9d5e009163..1f37be53c281 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -344,6 +344,7 @@ void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi
 bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
+bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi);
 struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
@@ -373,6 +374,10 @@ static inline bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
 {
 	return false;
 }
+static inline bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi)
+{
+	return false;
+}
 
 static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
 {

-- 
2.42.0

