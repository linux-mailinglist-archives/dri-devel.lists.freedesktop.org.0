Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D968809B68
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 06:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA81D10E9FA;
	Fri,  8 Dec 2023 05:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF8F10E9EE;
 Fri,  8 Dec 2023 05:07:24 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B850HSh007946; Fri, 8 Dec 2023 05:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=fPGwADTDy3Y1Av7MDMvH0OZPWdRig9AhR111QmIlwok=;
 b=ZcymvpQzv2zjCfsIcKkTu3zGHIt64QHnPTevlzIzP2yQXlDu50VF58plSrS7oMNFT5JV
 7XcuhvqkybyohzU1NQ90SH3UgFU8dzT9qI1aTfok3pnvEeazZFJcZXdEJoYebsfsWIq8
 VOH+q9QYz0g/qlDfLlrOQqjVwceJkWYeH5OxW0dn3b3u1ZUPZoH8j6LS+BfgmCsfUiEa
 yXsz2Nwbil8jum3nnrnOLYoFdzuahrtO9VHvpu00CeNhmdSypBY8tZwAZzUm54j09Wvb
 OZSqnuI2XTN9Zd1u2tUyA0aGq4iVeadmtwWK9wK3Vu0WLXb5HOl5CbeyNd/eE414Dzzf Rw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuu2084ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 05:07:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B857LFG014835
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 05:07:21 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 21:07:20 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v2 12/16] drm/msm/dpu: add an API to setup the CDM block for
 writeback
Date: Thu, 7 Dec 2023 21:06:37 -0800
Message-ID: <20231208050641.32582-13-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CveOBGK-JwlK9LrWLkrBDHzQ4UbvLGI9
X-Proofpoint-ORIG-GUID: CveOBGK-JwlK9LrWLkrBDHzQ4UbvLGI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080038
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
Cc: quic_jesszhan@quicinc.com, quic_parellan@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an API dpu_encoder_helper_phys_setup_cdm() which can be used by
the writeback encoder to setup the CDM block.

Currently, this is defined and used within the writeback's physical
encoder layer however, the function can be modified to be used to setup
the CDM block even for non-writeback interfaces.

Until those modifications are planned and made, keep it local to
writeback.

changes in v2:
	- add the RGB2YUV CSC matrix to dpu util as needed by CDM
	- use dpu_hw_get_csc_cfg() to get and program CSC
	- drop usage of setup_csc_data() and setup_cdwn() cdm ops
	  as they both have been merged into enable()
	- drop reduntant hw_cdm and hw_pp checks

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 96 ++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   | 17 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  1 +
 4 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 410f6225789c..1d6d1eb642b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -16,6 +16,7 @@
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_top.h"
+#include "dpu_hw_cdm.h"
 #include "dpu_encoder.h"
 #include "dpu_crtc.h"
 
@@ -210,6 +211,7 @@ static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
  * @wbirq_refcount:     Reference count of writeback interrupt
  * @wb_done_timeout_cnt: number of wb done irq timeout errors
  * @wb_cfg:  writeback block config to store fb related details
+ * @cdm_cfg: cdm block config needed to store writeback block's CDM configuration
  * @wb_conn: backpointer to writeback connector
  * @wb_job: backpointer to current writeback job
  * @dest:   dpu buffer layout for current writeback output buffer
@@ -219,6 +221,7 @@ struct dpu_encoder_phys_wb {
 	atomic_t wbirq_refcount;
 	int wb_done_timeout_cnt;
 	struct dpu_hw_wb_cfg wb_cfg;
+	struct dpu_hw_cdm_cfg cdm_cfg;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_writeback_job *wb_job;
 	struct dpu_hw_fmt_layout dest;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4665367cf14f..85429c62d727 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -259,6 +259,99 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 	}
 }
 
+/**
+ * dpu_encoder_phys_wb_setup_cdp - setup chroma down sampling block
+ * @phys_enc:Pointer to physical encoder
+ */
+static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_hw_cdm *hw_cdm;
+	struct dpu_hw_cdm_cfg *cdm_cfg;
+	struct dpu_hw_pingpong *hw_pp;
+	struct dpu_encoder_phys_wb *wb_enc;
+	const struct msm_format *format;
+	const struct dpu_format *dpu_fmt;
+	struct drm_writeback_job *wb_job;
+	int ret;
+
+	if (!phys_enc)
+		return;
+
+	wb_enc = to_dpu_encoder_phys_wb(phys_enc);
+	cdm_cfg = &wb_enc->cdm_cfg;
+	hw_pp = phys_enc->hw_pp;
+	hw_cdm = phys_enc->hw_cdm;
+	wb_job = wb_enc->wb_job;
+
+	format = msm_framebuffer_format(wb_enc->wb_job->fb);
+	dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
+
+	if (!hw_cdm)
+		return;
+
+	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
+		DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
+			  dpu_fmt->base.pixel_format);
+		if (hw_cdm->ops.disable)
+			hw_cdm->ops.disable(hw_cdm);
+
+		return;
+	}
+
+	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
+
+	cdm_cfg->output_width = wb_job->fb->width;
+	cdm_cfg->output_height = wb_job->fb->height;
+	cdm_cfg->output_fmt = dpu_fmt;
+	cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
+	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
+			CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
+	cdm_cfg->csc_cfg = dpu_hw_get_csc_cfg(DPU_HW_RGB2YUV_601L_10BIT);
+	if (!cdm_cfg->csc_cfg) {
+		DPU_ERROR("valid csc not found\n");
+		return;
+	}
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
 /**
  * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
  * @phys_enc:	Pointer to physical encoder
@@ -382,8 +475,9 @@ static void dpu_encoder_phys_wb_setup(
 
 	dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
 
-	dpu_encoder_phys_wb_setup_ctl(phys_enc);
+	dpu_encoder_helper_phys_setup_cdm(phys_enc);
 
+	dpu_encoder_phys_wb_setup_ctl(phys_enc);
 }
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 59a153331194..34143491aba2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -87,6 +87,8 @@ static u32 dpu_hw_util_log_mask = DPU_DBG_MASK_NONE;
 #define QOS_QOS_CTRL_VBLANK_EN            BIT(16)
 #define QOS_QOS_CTRL_CREQ_VBLANK_MASK     GENMASK(21, 20)
 
+#define TO_S15D16(_x_)((_x_) << 7)
+
 static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
 	{
 		/* S15.16 format */
@@ -117,6 +119,18 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
 	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
 };
 
+static const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l = {
+	{
+		TO_S15D16(0x0083), TO_S15D16(0x0102), TO_S15D16(0x0032),
+		TO_S15D16(0x1fb5), TO_S15D16(0x1f6c), TO_S15D16(0x00e1),
+		TO_S15D16(0x00e1), TO_S15D16(0x1f45), TO_S15D16(0x1fdc)
+	},
+	{ 0x00, 0x00, 0x00 },
+	{ 0x0040, 0x0200, 0x0200 },
+	{ 0x000, 0x3ff, 0x000, 0x3ff, 0x000, 0x3ff },
+	{ 0x040, 0x3ac, 0x040, 0x3c0, 0x040, 0x3c0 },
+};
+
 /**
  * dpu_hw_get_csc_cfg - get the CSC matrix based on the request type
  * @type:		type of the requested CSC matrix from caller
@@ -133,6 +147,9 @@ const struct dpu_csc_cfg *dpu_hw_get_csc_cfg(enum dpu_hw_csc_cfg_type type)
 	case DPU_HW_YUV2RGB_601L_10BIT:
 		csc_cfg = &dpu_csc10_YUV2RGB_601L;
 		break;
+	case DPU_HW_RGB2YUV_601L_10BIT:
+		csc_cfg = &dpu_csc10_rgb2yuv_601l;
+		break;
 	default:
 		DPU_ERROR("unknown csc_cfg type\n");
 		break;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 49f2bcf6de15..ed153d66f660 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -22,6 +22,7 @@
 enum dpu_hw_csc_cfg_type {
 	DPU_HW_YUV2RGB_601L,
 	DPU_HW_YUV2RGB_601L_10BIT,
+	DPU_HW_RGB2YUV_601L_10BIT,
 };
 
 /*
-- 
2.40.1

