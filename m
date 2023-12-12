Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FE480E020
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 01:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A649210E542;
	Tue, 12 Dec 2023 00:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77D610E550;
 Tue, 12 Dec 2023 00:23:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BBNVrEd028612; Tue, 12 Dec 2023 00:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=hEAP6CMn0bp2AzPVL/SOWGjphURTfpm83pkwlBZAVGg=; b=Rw
 FGJkUKkHilaJl9DsnMSE8T0PiY0S+xZ/u1DhPIhuTXeaNbHbJ3Lu9xW1ldteMnYh
 9v4dtq1Ary0yQotsjRljk9aR4OedbChq4Idu43A6eU6X0cyaGVT8Lh7ZxP69EIUq
 A8EbGXBHoKwQWCYTrJISDrfRWfC/7vnQpmG50Ab4kRsQBPvswT2PRqUcHZO6cZTF
 xr1Un2PwRBJZj4yhhO/tI5tDDlVDFGoJOFczE7DsHIlqrkVmUGkQqd8joR/sDZ8s
 yiRuklRyNNIN+Fl/+wse7MShcM7gspEUFAz+pxrhqrrc6mwbvbNVsLDLwOxFHsUH
 24oczR1xhWVj+FwX1CFg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux20eskke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 00:23:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC0NGgB007419
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 00:23:16 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 16:23:16 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v3 11/15] drm/msm/dpu: add an API to setup the CDM block for
 writeback
Date: Mon, 11 Dec 2023 16:22:41 -0800
Message-ID: <20231212002245.23715-12-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: b93TZ0MiuVwKZAwShVEjXsuMxKnQdiUx
X-Proofpoint-ORIG-GUID: b93TZ0MiuVwKZAwShVEjXsuMxKnQdiUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120000
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an API dpu_encoder_helper_phys_setup_cdm() which can be used by
the writeback encoder to setup the CDM block.

Currently, this is defined and used within the writeback's physical
encoder layer however, the function can be modified to be used to setup
the CDM block even for non-writeback interfaces.

Until those modifications are planned and made, keep it local to
writeback.

changes in v3:
	- call bind_pingpong_blk() directly as disable() is dropped
	- add dpu_csc10_rgb2yuv_601l to dpu_hw_util.h and use it
	- fix kbot error on the function doc
	- document that dpu_encoder_helper_phys_setup_cdm() doesn't handle
	  DPU_CHROMA_H1V2

changes in v2:
	- add the RGB2YUV CSC matrix to dpu util as needed by CDM
	- use dpu_hw_get_csc_cfg() to get and program CSC
	- drop usage of setup_csc_data() and setup_cdwn() cdm ops
	  as they both have been merged into enable()
	- drop reduntant hw_cdm and hw_pp checks

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312102149.qmbCdsg2-lkp@intel.com/
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  6 ++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 93 ++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 14 +++
 3 files changed, 112 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e2934a6702d1..bdb89cbbcfb8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -14,8 +14,10 @@
 #include "dpu_hw_intf.h"
 #include "dpu_hw_wb.h"
 #include "dpu_hw_pingpong.h"
+#include "dpu_hw_cdm.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_top.h"
+#include "dpu_hw_util.h"
 #include "dpu_encoder.h"
 #include "dpu_crtc.h"
 
@@ -150,6 +152,7 @@ enum dpu_intr_idx {
  * @hw_pp:		Hardware interface to the ping pong registers
  * @hw_intf:		Hardware interface to the intf registers
  * @hw_wb:		Hardware interface to the wb registers
+ * @hw_cdm:		Hardware interface to the CDM registers
  * @dpu_kms:		Pointer to the dpu_kms top level
  * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
  * @enabled:		Whether the encoder has enabled and running a mode
@@ -178,6 +181,7 @@ struct dpu_encoder_phys {
 	struct dpu_hw_pingpong *hw_pp;
 	struct dpu_hw_intf *hw_intf;
 	struct dpu_hw_wb *hw_wb;
+	struct dpu_hw_cdm *hw_cdm;
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode cached_mode;
 	enum dpu_enc_split_role split_role;
@@ -207,6 +211,7 @@ static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
  * @wbirq_refcount:     Reference count of writeback interrupt
  * @wb_done_timeout_cnt: number of wb done irq timeout errors
  * @wb_cfg:  writeback block config to store fb related details
+ * @cdm_cfg: cdm block config needed to store writeback block's CDM configuration
  * @wb_conn: backpointer to writeback connector
  * @wb_job: backpointer to current writeback job
  * @dest:   dpu buffer layout for current writeback output buffer
@@ -216,6 +221,7 @@ struct dpu_encoder_phys_wb {
 	atomic_t wbirq_refcount;
 	int wb_done_timeout_cnt;
 	struct dpu_hw_wb_cfg wb_cfg;
+	struct dpu_hw_cdm_cfg cdm_cfg;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_writeback_job *wb_job;
 	struct dpu_hw_fmt_layout dest;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 8f05f2a1fc24..85cb8596737d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -259,6 +259,96 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 	}
 }
 
+/**
+ * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
+ *                                     This API does not handle DPU_CHROMA_H1V2.
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
+		if (hw_cdm->ops.bind_pingpong_blk)
+			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
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
 /**
  * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic states
  * @phys_enc:	Pointer to physical encoder
@@ -382,8 +472,9 @@ static void dpu_encoder_phys_wb_setup(
 
 	dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
 
-	dpu_encoder_phys_wb_setup_ctl(phys_enc);
+	dpu_encoder_helper_phys_setup_cdm(phys_enc);
 
+	dpu_encoder_phys_wb_setup_ctl(phys_enc);
 }
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index aa50005042d1..c0aaad2023da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -19,6 +19,8 @@
 #define MISR_CTRL_STATUS_CLEAR          BIT(10)
 #define MISR_CTRL_FREE_RUN_MASK         BIT(31)
 
+#define TO_S15D16(_x_)((_x_) << 7)
+
 static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
 	{
 		/* S15.16 format */
@@ -49,6 +51,18 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
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
 /*
  * This is the common struct maintained by each sub block
  * for mapping the register offsets in this block to the
-- 
2.40.1

