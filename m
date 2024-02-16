Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A485899F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 00:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2749310ED03;
	Fri, 16 Feb 2024 23:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="p43ohwWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549E310ECEE;
 Fri, 16 Feb 2024 23:02:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41GMT0Bh016662; Fri, 16 Feb 2024 23:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=y0BLfJOKhmKukjBBBxbaYedzwzAqtFVvUi3jaGAotXc=; b=p4
 3ohwWPVrz2SLWBJvJDAVoK4PxqCgFYhpDPQtEGv1xSAg19VFwBip3olhNH5pxVKC
 axEdyFLqyONg082jlDHFkS/+0TPY64KzwcS8vlRAmG7ls4ytNPPRKtN+c9pn4Wb6
 43Wshx467EAT7J+k+3WxbCJBAIz3nL5RBcw62GhZdmQG8vYv6FTQsXIc4GSZA+MU
 phb7rUnwFY1MFB685rMd8fWsjH+cSUTTiDj4uqxzE9go+8DQd4P2LBIoruFf6Scv
 7Crvv5iAVfvbrpeK7v8qpITeB3Mn0yHuVPD3IsM4IJKsmIs5OszEAUweonotKSkM
 SjZ7CbYrH+XGci6DRgbA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wa6nk9axc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 23:02:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GN2ktW032645
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 23:02:46 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 15:02:46 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v4 05/19] drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm
 to dpu_encoder
Date: Fri, 16 Feb 2024 15:01:53 -0800
Message-ID: <20240216230228.26713-6-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216230228.26713-1-quic_parellan@quicinc.com>
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QZ43OcPYfbc1Op5jL-iGKE_EYaikfu6N
X-Proofpoint-ORIG-GUID: QZ43OcPYfbc1Op5jL-iGKE_EYaikfu6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_22,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402160182
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

Move dpu_encoder_helper_phys_setup_cdm to dpu_encoder in preparation for
implementing YUV420 over DP, which requires CDM compatibility.

Changes in v2:
	- Slightly change the wording of the commit text to make clear
	  that YUV over DP requires CDM

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 78 +++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  9 ++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 83 -------------------
 3 files changed, 87 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8932f38a41b2d..1905e8653b77a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2117,6 +2117,84 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	ctl->ops.clear_pending_flush(ctl);
 }
 
+void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
+				       const struct dpu_format *dpu_fmt,
+				       u32 output_type)
+{
+	struct dpu_hw_cdm *hw_cdm;
+	struct dpu_hw_cdm_cfg *cdm_cfg;
+	struct dpu_hw_pingpong *hw_pp;
+	int ret;
+
+	if (!phys_enc)
+		return;
+
+	cdm_cfg = &phys_enc->cdm_cfg;
+	hw_pp = phys_enc->hw_pp;
+	hw_cdm = phys_enc->hw_cdm;
+
+	if (!hw_cdm)
+		return;
+
+	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
+		DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
+			  dpu_fmt->base.pixel_format);
+		if (hw_cdm->ops.bind_pingpong_blk)
+			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
+
+		return;
+	}
+
+	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
+
+	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
+	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
+	cdm_cfg->output_fmt = dpu_fmt;
+	cdm_cfg->output_type = output_type;
+	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
+			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
+	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
+
+	/* enable 10 bit logic */
+	switch (cdm_cfg->output_fmt->chroma_sample) {
+	case DPU_CHROMA_RGB:
+		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
+		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
+		break;
+	case DPU_CHROMA_H2V1:
+		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
+		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
+		break;
+	case DPU_CHROMA_420:
+		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
+		cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
+		break;
+	case DPU_CHROMA_H1V2:
+	default:
+		DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
+			  DRMID(phys_enc->parent));
+		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
+		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
+		break;
+	}
+
+	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
+		  DRMID(phys_enc->parent), cdm_cfg->output_width,
+		  cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
+		  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
+		  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
+
+	if (hw_cdm->ops.enable) {
+		cdm_cfg->pp_id = hw_pp->idx;
+		ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
+		if (ret < 0) {
+			DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
+				  DRMID(phys_enc->parent), ret);
+			return;
+		}
+	}
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 204d7cc3c1de8..f43d57d9c74e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -381,6 +381,15 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
  */
 void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
 
+/**
+ * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
+ * @phys_enc: Pointer to physical encoder
+ * @output_type: HDMI/WB
+ */
+void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
+				       const struct dpu_format *dpu_fmt,
+				       u32 output_type);
+
 /**
  * dpu_encoder_vblank_callback - Notify virtual encoder of vblank IRQ reception
  * @drm_enc:    Pointer to drm encoder structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 072fc6950e496..32a7a31b667be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -264,89 +264,6 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 	}
 }
 
-/**
- * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
- *                                     This API does not handle DPU_CHROMA_H1V2.
- * @phys_enc:Pointer to physical encoder
- */
-static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
-					      const struct dpu_format *dpu_fmt,
-					      u32 output_type)
-{
-	struct dpu_hw_cdm *hw_cdm;
-	struct dpu_hw_cdm_cfg *cdm_cfg;
-	struct dpu_hw_pingpong *hw_pp;
-	int ret;
-
-	if (!phys_enc)
-		return;
-
-	cdm_cfg = &phys_enc->cdm_cfg;
-	hw_pp = phys_enc->hw_pp;
-	hw_cdm = phys_enc->hw_cdm;
-
-	if (!hw_cdm)
-		return;
-
-	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
-		DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
-			  dpu_fmt->base.pixel_format);
-		if (hw_cdm->ops.bind_pingpong_blk)
-			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
-
-		return;
-	}
-
-	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
-
-	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
-	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
-	cdm_cfg->output_fmt = dpu_fmt;
-	cdm_cfg->output_type = output_type;
-	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
-			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
-	cdm_cfg->csc_cfg = &dpu_csc10_rgb2yuv_601l;
-
-	/* enable 10 bit logic */
-	switch (cdm_cfg->output_fmt->chroma_sample) {
-	case DPU_CHROMA_RGB:
-		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
-		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
-		break;
-	case DPU_CHROMA_H2V1:
-		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
-		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
-		break;
-	case DPU_CHROMA_420:
-		cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
-		cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
-		break;
-	case DPU_CHROMA_H1V2:
-	default:
-		DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
-			  DRMID(phys_enc->parent));
-		cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
-		cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
-		break;
-	}
-
-	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
-		  DRMID(phys_enc->parent), cdm_cfg->output_width,
-		  cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
-		  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
-		  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
-
-	if (hw_cdm->ops.enable) {
-		cdm_cfg->pp_id = hw_pp->idx;
-		ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
-		if (ret < 0) {
-			DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
-				  DRMID(phys_enc->parent), ret);
-			return;
-		}
-	}
-}
-
 /**
  * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
  * @phys_enc:	Pointer to physical encoder
-- 
2.39.2

