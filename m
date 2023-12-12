Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB00080F890
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 21:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1163010E6B0;
	Tue, 12 Dec 2023 20:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D4F10E6B0;
 Tue, 12 Dec 2023 20:53:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCKBk8U013841; Tue, 12 Dec 2023 20:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=V9/xUpiFgVj2qg+y262Yf7BOGZRre0SLb6mkcg89Z6g=; b=BU
 O2w20SIZhg2/vX1muoUmofkRiCdeEGAnd6r3ButEhLDd5UwSpNXhV1WdOCLFNw6c
 V178PRpW8ygFDrmVjQiwnFgM8RJ0xATusdORaVXxDo9IqnlvcjoeLnAbUTHlJbqx
 t6CJDHD0rweDcsi+hOqaol4noJBhXfsXTC0crQeO8x8eRE7V9A7MQPYQdqtEA66r
 BlM5eTkcAEXDfNFu/yaKA7OmsJnuGqmTbv1Gxmei6T0s8jOEEp84yno7Xqx3EUm2
 a09cDVJAZNZqj0IBnYXHzMZ9XFGvvU4JnQ60w7qaNpdlui7IRFeMZN1VGVwxN4At
 5l67BLiQu6sBPjzjcTkg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxkc81ud7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 20:53:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCKrI1E002372
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 20:53:18 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 12:53:17 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v4 07/15] drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
Date: Tue, 12 Dec 2023 12:52:45 -0800
Message-ID: <20231212205254.12422-8-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Q7HW7eKsii9XH--GJmdCrF1R4hmf4Xtf
X-Proofpoint-ORIG-GUID: Q7HW7eKsii9XH--GJmdCrF1R4hmf4Xtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120161
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

CDM block comes with its own set of registers and operations
which can be done. In-line with other hardware blocks, this
change adds the dpu_hw_cdm abstraction for the CDM block.

changes in v4:
	- used FIELD_PREP() for dpu_hw_cdm_setup_cdwn() operations
	- change to lowercase hex in dpu_hw_cdm_bind_pingpong_blk()
	- move disable assignment inside else in dpu_hw_cdm_bind_pingpong_blk()

changes in v3:
	- fix commit text from sub-blk to blk for CDM
	- fix kbot issue for missing static for dpu_hw_cdm_enable()
	- fix kbot issue for incorrect documentation style
	- add more documentation for enums and struct in dpu_hw_cdm.h
	- drop "enable" parameter from bind_pingpong_blk() as we can
	  just use PINGPONG_NONE for disable cases
	- drop unnecessary bit operation for zero value of cdm_cfg

changes in v2:
	- replace bit magic with relevant defines
	- use drmm_kzalloc instead of kzalloc/free
	- some formatting fixes
	- inline _setup_cdm_ops()
	- protect bind_pingpong_blk with core_rev check
	- drop setup_csc_data() and setup_cdwn() ops as they
	  are merged into enable()

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312101815.B3ZH7Pfy-lkp@intel.com/
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile                |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c  | 245 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h  | 142 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |   1 +
 4 files changed, 389 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 49671364fdcf..b1173128b5b9 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -63,6 +63,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_encoder_phys_wb.o \
 	disp/dpu1/dpu_formats.o \
 	disp/dpu1/dpu_hw_catalog.o \
+	disp/dpu1/dpu_hw_cdm.o \
 	disp/dpu1/dpu_hw_ctl.o \
 	disp/dpu1/dpu_hw_dsc.o \
 	disp/dpu1/dpu_hw_dsc_1_2.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
new file mode 100644
index 000000000000..050c6aa40720
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ */
+
+#include <drm/drm_managed.h>
+
+#include "dpu_hw_mdss.h"
+#include "dpu_hw_util.h"
+#include "dpu_hw_catalog.h"
+#include "dpu_hw_cdm.h"
+#include "dpu_kms.h"
+
+#define CDM_CSC_10_OPMODE                  0x000
+#define CDM_CSC_10_BASE                    0x004
+
+#define CDM_CDWN2_OP_MODE                  0x100
+#define CDM_CDWN2_CLAMP_OUT                0x104
+#define CDM_CDWN2_PARAMS_3D_0              0x108
+#define CDM_CDWN2_PARAMS_3D_1              0x10C
+#define CDM_CDWN2_COEFF_COSITE_H_0         0x110
+#define CDM_CDWN2_COEFF_COSITE_H_1         0x114
+#define CDM_CDWN2_COEFF_COSITE_H_2         0x118
+#define CDM_CDWN2_COEFF_OFFSITE_H_0        0x11C
+#define CDM_CDWN2_COEFF_OFFSITE_H_1        0x120
+#define CDM_CDWN2_COEFF_OFFSITE_H_2        0x124
+#define CDM_CDWN2_COEFF_COSITE_V           0x128
+#define CDM_CDWN2_COEFF_OFFSITE_V          0x12C
+#define CDM_CDWN2_OUT_SIZE                 0x130
+
+#define CDM_HDMI_PACK_OP_MODE              0x200
+#define CDM_CSC_10_MATRIX_COEFF_0          0x004
+
+#define CDM_MUX                            0x224
+
+/* CDM CDWN2 sub-block bit definitions */
+#define CDM_CDWN2_OP_MODE_EN                  BIT(0)
+#define CDM_CDWN2_OP_MODE_ENABLE_H            BIT(1)
+#define CDM_CDWN2_OP_MODE_ENABLE_V            BIT(2)
+#define CDM_CDWN2_OP_MODE_BITS_OUT_8BIT       BIT(7)
+#define CDM_CDWN2_V_PIXEL_METHOD_MASK         GENMASK(6, 5)
+#define CDM_CDWN2_H_PIXEL_METHOD_MASK         GENMASK(4, 3)
+
+/* CDM CSC10 sub-block bit definitions */
+#define CDM_CSC10_OP_MODE_EN               BIT(0)
+#define CDM_CSC10_OP_MODE_SRC_FMT_YUV      BIT(1)
+#define CDM_CSC10_OP_MODE_DST_FMT_YUV      BIT(2)
+
+/* CDM HDMI pack sub-block bit definitions */
+#define CDM_HDMI_PACK_OP_MODE_EN           BIT(0)
+
+/*
+ * Horizontal coefficients for cosite chroma downscale
+ * s13 representation of coefficients
+ */
+static u32 cosite_h_coeff[] = {0x00000016, 0x000001cc, 0x0100009e};
+
+/*
+ * Horizontal coefficients for offsite chroma downscale
+ */
+static u32 offsite_h_coeff[] = {0x000b0005, 0x01db01eb, 0x00e40046};
+
+/*
+ * Vertical coefficients for cosite chroma downscale
+ */
+static u32 cosite_v_coeff[] = {0x00080004};
+/*
+ * Vertical coefficients for offsite chroma downscale
+ */
+static u32 offsite_v_coeff[] = {0x00060002};
+
+static int dpu_hw_cdm_setup_cdwn(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cfg)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	u32 opmode;
+	u32 out_size;
+
+	switch (cfg->h_cdwn_type) {
+	case CDM_CDWN_DISABLE:
+		opmode = 0;
+		break;
+	case CDM_CDWN_PIXEL_DROP:
+		opmode = CDM_CDWN2_OP_MODE_ENABLE_H |
+				FIELD_PREP(CDM_CDWN2_H_PIXEL_METHOD_MASK,
+					   CDM_CDWN2_METHOD_PIXEL_DROP);
+		break;
+	case CDM_CDWN_AVG:
+		opmode = CDM_CDWN2_OP_MODE_ENABLE_H |
+				FIELD_PREP(CDM_CDWN2_H_PIXEL_METHOD_MASK,
+					   CDM_CDWN2_METHOD_AVG);
+		break;
+	case CDM_CDWN_COSITE:
+		opmode = CDM_CDWN2_OP_MODE_ENABLE_H |
+				FIELD_PREP(CDM_CDWN2_H_PIXEL_METHOD_MASK,
+					   CDM_CDWN2_METHOD_COSITE);
+		DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_0,
+			      cosite_h_coeff[0]);
+		DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_1,
+			      cosite_h_coeff[1]);
+		DPU_REG_WRITE(c, CDM_CDWN2_COEFF_COSITE_H_2,
+			      cosite_h_coeff[2]);
+		break;
+	case CDM_CDWN_OFFSITE:
+		opmode = CDM_CDWN2_OP_MODE_ENABLE_H |
+				FIELD_PREP(CDM_CDWN2_H_PIXEL_METHOD_MASK, CDM_CDWN2_METHOD_OFFSITE);
+		DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_0,
+			      offsite_h_coeff[0]);
+		DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_1,
+			      offsite_h_coeff[1]);
+		DPU_REG_WRITE(c, CDM_CDWN2_COEFF_OFFSITE_H_2,
+			      offsite_h_coeff[2]);
+		break;
+	default:
+		DPU_ERROR("%s invalid horz down sampling type\n", __func__);
+		return -EINVAL;
+	}
+
+	switch (cfg->v_cdwn_type) {
+	case CDM_CDWN_DISABLE:
+		/* if its only Horizontal downsample, we dont need to do anything here */
+		break;
+	case CDM_CDWN_PIXEL_DROP:
+		opmode |= CDM_CDWN2_OP_MODE_ENABLE_V |
+				FIELD_PREP(CDM_CDWN2_V_PIXEL_METHOD_MASK,
+					   CDM_CDWN2_METHOD_PIXEL_DROP);
+		break;
+	case CDM_CDWN_AVG:
+		opmode |= CDM_CDWN2_OP_MODE_ENABLE_V |
+				FIELD_PREP(CDM_CDWN2_V_PIXEL_METHOD_MASK,
+					   CDM_CDWN2_METHOD_AVG);
+		break;
+	case CDM_CDWN_COSITE:
+		opmode |= CDM_CDWN2_OP_MODE_ENABLE_V |
+				FIELD_PREP(CDM_CDWN2_V_PIXEL_METHOD_MASK,
+					   CDM_CDWN2_METHOD_COSITE);
+		DPU_REG_WRITE(c,
+			      CDM_CDWN2_COEFF_COSITE_V,
+			      cosite_v_coeff[0]);
+		break;
+	case CDM_CDWN_OFFSITE:
+		opmode |= CDM_CDWN2_OP_MODE_ENABLE_V |
+				FIELD_PREP(CDM_CDWN2_V_PIXEL_METHOD_MASK,
+					   CDM_CDWN2_METHOD_OFFSITE);
+		DPU_REG_WRITE(c,
+			      CDM_CDWN2_COEFF_OFFSITE_V,
+			      offsite_v_coeff[0]);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (cfg->output_bit_depth != CDM_CDWN_OUTPUT_10BIT)
+		opmode |= CDM_CDWN2_OP_MODE_BITS_OUT_8BIT;
+
+	if (cfg->v_cdwn_type || cfg->h_cdwn_type)
+		opmode |= CDM_CDWN2_OP_MODE_EN; /* EN CDWN module */
+	else
+		opmode &= ~CDM_CDWN2_OP_MODE_EN;
+
+	out_size = (cfg->output_width & 0xFFFF) | ((cfg->output_height & 0xFFFF) << 16);
+	DPU_REG_WRITE(c, CDM_CDWN2_OUT_SIZE, out_size);
+	DPU_REG_WRITE(c, CDM_CDWN2_OP_MODE, opmode);
+	DPU_REG_WRITE(c, CDM_CDWN2_CLAMP_OUT, ((0x3FF << 16) | 0x0));
+
+	return 0;
+}
+
+static int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	const struct dpu_format *fmt;
+	u32 opmode = 0;
+	u32 csc = 0;
+
+	if (!ctx || !cdm)
+		return -EINVAL;
+
+	fmt = cdm->output_fmt;
+
+	if (!DPU_FORMAT_IS_YUV(fmt))
+		return -EINVAL;
+
+	dpu_hw_csc_setup(&ctx->hw, CDM_CSC_10_MATRIX_COEFF_0, cdm->csc_cfg, true);
+	dpu_hw_cdm_setup_cdwn(ctx, cdm);
+
+	if (cdm->output_type == CDM_CDWN_OUTPUT_HDMI) {
+		if (fmt->chroma_sample != DPU_CHROMA_H1V2)
+			return -EINVAL; /*unsupported format */
+		opmode = CDM_HDMI_PACK_OP_MODE_EN;
+		opmode |= (fmt->chroma_sample << 1);
+	}
+
+	csc |= CDM_CSC10_OP_MODE_DST_FMT_YUV;
+	csc &= ~CDM_CSC10_OP_MODE_SRC_FMT_YUV;
+	csc |= CDM_CSC10_OP_MODE_EN;
+
+	if (ctx && ctx->ops.bind_pingpong_blk)
+		ctx->ops.bind_pingpong_blk(ctx, cdm->pp_id);
+
+	DPU_REG_WRITE(c, CDM_CSC_10_OPMODE, csc);
+	DPU_REG_WRITE(c, CDM_HDMI_PACK_OP_MODE, opmode);
+	return 0;
+}
+
+static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_pingpong pp)
+{
+	struct dpu_hw_blk_reg_map *c;
+	int mux_cfg;
+
+	c = &ctx->hw;
+
+	mux_cfg = DPU_REG_READ(c, CDM_MUX);
+	mux_cfg &= ~0xf;
+
+	if (pp)
+		mux_cfg |= (pp - PINGPONG_0) & 0x7;
+	else
+		mux_cfg |= 0xf;
+
+	DPU_REG_WRITE(c, CDM_MUX, mux_cfg);
+}
+
+struct dpu_hw_cdm *dpu_hw_cdm_init(struct drm_device *dev,
+				   const struct dpu_cdm_cfg *cfg, void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_rev)
+{
+	struct dpu_hw_cdm *c;
+
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
+	if (!c)
+		return ERR_PTR(-ENOMEM);
+
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_CDM;
+
+	/* Assign ops */
+	c->idx = cfg->id;
+	c->caps = cfg;
+
+	c->ops.enable = dpu_hw_cdm_enable;
+	if (mdss_rev->core_major_ver >= 5)
+		c->ops.bind_pingpong_blk = dpu_hw_cdm_bind_pingpong_blk;
+
+	return c;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
new file mode 100644
index 000000000000..348424df87c6
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_HW_CDM_H
+#define _DPU_HW_CDM_H
+
+#include "dpu_hw_mdss.h"
+#include "dpu_hw_top.h"
+
+struct dpu_hw_cdm;
+
+/**
+ * struct dpu_hw_cdm_cfg : current configuration of CDM block
+ *
+ *  @output_width:         output ROI width of CDM block
+ *  @output_height:        output ROI height of CDM block
+ *  @output_bit_depth:     output bit-depth of CDM block
+ *  @h_cdwn_type:          downsample type used for horizontal pixels
+ *  @v_cdwn_type:          downsample type used for vertical pixels
+ *  @output_fmt:           handle to dpu_format of CDM block
+ *  @csc_cfg:              handle to CSC matrix programmed for CDM block
+ *  @output_type:          interface to which CDM is paired (HDMI/WB)
+ *  @pp_id:                ping-pong block to which CDM is bound to
+ */
+struct dpu_hw_cdm_cfg {
+	u32 output_width;
+	u32 output_height;
+	u32 output_bit_depth;
+	u32 h_cdwn_type;
+	u32 v_cdwn_type;
+	const struct dpu_format *output_fmt;
+	const struct dpu_csc_cfg *csc_cfg;
+	u32 output_type;
+	int pp_id;
+};
+
+/*
+ * These values are used indicate which type of downsample is used
+ * in the horizontal/vertical direction for the CDM block.
+ */
+enum dpu_hw_cdwn_type {
+	CDM_CDWN_DISABLE,
+	CDM_CDWN_PIXEL_DROP,
+	CDM_CDWN_AVG,
+	CDM_CDWN_COSITE,
+	CDM_CDWN_OFFSITE,
+};
+
+/*
+ * CDM block can be paired with WB or HDMI block. These values match
+ * the input with which the CDM block is paired.
+ */
+enum dpu_hw_cdwn_output_type {
+	CDM_CDWN_OUTPUT_HDMI,
+	CDM_CDWN_OUTPUT_WB,
+};
+
+/*
+ * CDM block can give an 8-bit or 10-bit output. These values
+ * are used to indicate the output bit depth of CDM block
+ */
+enum dpu_hw_cdwn_output_bit_depth {
+	CDM_CDWN_OUTPUT_8BIT,
+	CDM_CDWN_OUTPUT_10BIT,
+};
+
+/*
+ * CDM block can downsample using different methods. These values
+ * are used to indicate the downsample method which can be used
+ * either in the horizontal or vertical direction.
+ */
+enum dpu_hw_cdwn_op_mode_method_h_v {
+	CDM_CDWN2_METHOD_PIXEL_DROP,
+	CDM_CDWN2_METHOD_AVG,
+	CDM_CDWN2_METHOD_COSITE,
+	CDM_CDWN2_METHOD_OFFSITE
+};
+
+/**
+ * struct dpu_hw_cdm_ops : Interface to the chroma down Hw driver functions
+ *                         Assumption is these functions will be called after
+ *                         clocks are enabled
+ *  @enable:               Enables the output to interface and programs the
+ *                         output packer
+ *  @bind_pingpong_blk:    enable/disable the connection with pingpong which
+ *                         will feed pixels to this cdm
+ */
+struct dpu_hw_cdm_ops {
+	/**
+	 * Enable the CDM module
+	 * @cdm         Pointer to chroma down context
+	 */
+	int (*enable)(struct dpu_hw_cdm *cdm, struct dpu_hw_cdm_cfg *cfg);
+
+	/**
+	 * Enable/disable the connection with pingpong
+	 * @cdm         Pointer to chroma down context
+	 * @pp          pingpong block id.
+	 */
+	void (*bind_pingpong_blk)(struct dpu_hw_cdm *cdm, const enum dpu_pingpong pp);
+};
+
+/**
+ * struct dpu_hw_cdm - cdm description
+ * @base: Hardware block base structure
+ * @hw: Block hardware details
+ * @idx: CDM index
+ * @caps: Pointer to cdm_cfg
+ * @ops: handle to operations possible for this CDM
+ */
+struct dpu_hw_cdm {
+	struct dpu_hw_blk base;
+	struct dpu_hw_blk_reg_map hw;
+
+	/* chroma down */
+	const struct dpu_cdm_cfg *caps;
+	enum  dpu_cdm  idx;
+
+	/* ops */
+	struct dpu_hw_cdm_ops ops;
+};
+
+/**
+ * dpu_hw_cdm_init - initializes the cdm hw driver object.
+ * should be called once before accessing every cdm.
+ * @dev: DRM device handle
+ * @cdm: CDM catalog entry for which driver object is required
+ * @addr :   mapped register io address of MDSS
+ * @mdss_rev: mdss hw core revision
+ */
+struct dpu_hw_cdm *dpu_hw_cdm_init(struct drm_device *dev,
+				   const struct dpu_cdm_cfg *cdm, void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_rev);
+
+static inline struct dpu_hw_cdm *to_dpu_hw_cdm(struct dpu_hw_blk *hw)
+{
+	return container_of(hw, struct dpu_hw_cdm, base);
+}
+
+#endif /*_DPU_HW_CDM_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index f319c8232ea5..9db4cf61bd29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -466,6 +466,7 @@ struct dpu_mdss_color {
 #define DPU_DBG_MASK_ROT      (1 << 9)
 #define DPU_DBG_MASK_DSPP     (1 << 10)
 #define DPU_DBG_MASK_DSC      (1 << 11)
+#define DPU_DBG_MASK_CDM      (1 << 12)
 
 /**
  * struct dpu_hw_tear_check - Struct contains parameters to configure
-- 
2.40.1

