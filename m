Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE6D6E9FE9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 01:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A13010ED4A;
	Thu, 20 Apr 2023 23:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E8510ED46;
 Thu, 20 Apr 2023 23:25:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KNOYK1010539; Thu, 20 Apr 2023 23:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=eKyw35H82e66JNCilnVlr9LRV1WBUociHUJKmSvO5qw=;
 b=Btw5gErQNYKmfQwCUHy1PlTbmUps5FbTOuVE32wq5ubZw66RaNV4wt5sLBKl80FQH40e
 MPJMd1lZ3rogLhz0sACr/iMnu2gZmeMjNOVpi9Yf2kJmLQTYrYu1P0wP+xJrS1a3eUmV
 d28wTe0Qa9q5KKE2sUtWM/1Ej7epLkEI1gIQCLQejjVFwXBg6YycOPo7t2Gb41J6AWIQ
 uf932snTwnghH0kWQ3haXXiPAiJhSrg9MVqAf3JmEWBbZ0dyH86+K3jttg7Xnw1S3D3I
 7oeyWmzG9rYLa+GMDVZejLCp0vMVrHKwmRNdAyWgXf+BrhgqSRWAxNKIqCn6v0nyrQ9g Nw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3cpyr77v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 23:25:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KNPSLJ016025
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 23:25:28 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 16:25:27 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 1/5] drm/msm/dpu: add support for DSC encoder v1.2 engine
Date: Thu, 20 Apr 2023 16:25:10 -0700
Message-ID: <1682033114-28483-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RvdE5iP6p85XykmqPgehHLToQy9ve8Bg
X-Proofpoint-ORIG-GUID: RvdE5iP6p85XykmqPgehHLToQy9ve8Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_15,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200200
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for DSC 1.2 by providing the necessary hooks to program
the DPU DSC 1.2 encoder.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile                   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  38 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h     |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c | 388 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |   7 +-
 5 files changed, 444 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b814fc8..b9af5e4 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_hw_catalog.o \
 	disp/dpu1/dpu_hw_ctl.o \
 	disp/dpu1/dpu_hw_dsc.o \
+	disp/dpu1/dpu_hw_dsc_1_2.o \
 	disp/dpu1/dpu_hw_interrupts.o \
 	disp/dpu1/dpu_hw_intf.o \
 	disp/dpu1/dpu_hw_lm.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71584cd..22421b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
@@ -241,12 +241,20 @@ enum {
 };
 
 /**
- * DSC features
- * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
- *                            the pixel output from this DSC.
+ * DSC sub-blocks/features
+ * @DPU_DSC_OUTPUT_CTRL         Configure which PINGPONG block gets
+ *                              the pixel output from this DSC.
+ * @DPU_DSC_HW_REV_1_1          DSC block supports dsc 1.1 only
+ * @DPU_DSC_HW_REV_1_2          DSC block supports dsc 1.1 and 1.2
+ * @DPU_DSC_NATIVE_422_EN       Supports native422 and native420 encoding
+ * @DPU_DSC_MAX
  */
 enum {
 	DPU_DSC_OUTPUT_CTRL = 0x1,
+	DPU_DSC_HW_REV_1_1,
+	DPU_DSC_HW_REV_1_2,
+	DPU_DSC_NATIVE_422_EN,
+	DPU_DSC_MAX
 };
 
 /**
@@ -311,6 +319,14 @@ struct dpu_pp_blk {
 };
 
 /**
+ * struct dpu_dsc_blk - DSC Encoder sub-blk information
+ * @info:   HW register and features supported by this sub-blk
+ */
+struct dpu_dsc_blk {
+	DPU_HW_SUBBLK_INFO;
+};
+
+/**
  * enum dpu_qos_lut_usage - define QoS LUT use cases
  */
 enum dpu_qos_lut_usage {
@@ -459,6 +475,17 @@ struct dpu_pingpong_sub_blks {
 };
 
 /**
+ * struct dpu_dsc_sub_blks - DSC sub-blks
+ * @enc: DSC encoder sub block
+ * @ctl: DSC controller sub block
+ *
+ */
+struct dpu_dsc_sub_blks {
+	struct dpu_dsc_blk enc;
+	struct dpu_dsc_blk ctl;
+};
+
+/**
  * dpu_clk_ctrl_type - Defines top level clock control signals
  */
 enum dpu_clk_ctrl_type {
@@ -612,10 +639,13 @@ struct dpu_merge_3d_cfg  {
  * struct dpu_dsc_cfg - information of DSC blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
+ * @len:               length of hardware block
  * @features           bit mask identifying sub-blocks/features
+ * @sblk               sub-blocks information
  */
 struct dpu_dsc_cfg {
 	DPU_HW_BLK_INFO;
+	const struct dpu_dsc_sub_blks *sblk;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index ae9b5db..d0f8b8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -1,5 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2020-2022, Linaro Limited */
+/*
+ * Copyright (c) 2020-2022, Linaro Limited
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
+ */
 
 #ifndef _DPU_HW_DSC_H
 #define _DPU_HW_DSC_H
@@ -61,7 +64,7 @@ struct dpu_hw_dsc {
 };
 
 /**
- * dpu_hw_dsc_init - initializes the dsc block for the passed dsc idx.
+ * dpu_hw_dsc_init - initializes the v1.1 dsc block for the passed dsc idx.
  * @idx:  DSC index for which driver object is required
  * @addr: Mapped register io address of MDP
  * @m:    Pointer to mdss catalog data
@@ -71,6 +74,16 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
 				   const struct dpu_mdss_cfg *m);
 
 /**
+ * dpu_hw_dsc_init_1_2 - initializes the v1.2 dsc block for the passed dsc idx.
+ * @idx:  DSC index for which driver object is required
+ * @addr: Mapped register io address of MDP
+ * @m:    Pointer to mdss catalog data
+ * Returns: Error code or allocated dpu_hw_dsc context
+ */
+struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(enum dpu_dsc idx, void __iomem *addr,
+				   const struct dpu_mdss_cfg *m);
+
+/**
  * dpu_hw_dsc_destroy - destroys dsc driver context
  * @dsc:   Pointer to dsc driver context returned by dpu_hw_dsc_init
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
new file mode 100644
index 00000000..455d7f2
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#include <drm/display/drm_dsc_helper.h>
+
+#include "dpu_kms.h"
+#include "dpu_hw_catalog.h"
+#include "dpu_hwio.h"
+#include "dpu_hw_mdss.h"
+#include "dpu_hw_dsc.h"
+
+
+#define DSC_CMN_MAIN_CNF           0x00
+
+/* DPU_DSC_ENC register offsets */
+#define ENC_DF_CTRL                0x00
+#define ENC_GENERAL_STATUS         0x04
+#define ENC_HSLICE_STATUS          0x08
+#define ENC_OUT_STATUS             0x0C
+#define ENC_INT_STAT               0x10
+#define ENC_INT_CLR                0x14
+#define ENC_INT_MASK               0x18
+#define DSC_MAIN_CONF              0x30
+#define DSC_PICTURE_SIZE           0x34
+#define DSC_SLICE_SIZE             0x38
+#define DSC_MISC_SIZE              0x3C
+#define DSC_HRD_DELAYS             0x40
+#define DSC_RC_SCALE               0x44
+#define DSC_RC_SCALE_INC_DEC       0x48
+#define DSC_RC_OFFSETS_1           0x4C
+#define DSC_RC_OFFSETS_2           0x50
+#define DSC_RC_OFFSETS_3           0x54
+#define DSC_RC_OFFSETS_4           0x58
+#define DSC_FLATNESS_QP            0x5C
+#define DSC_RC_MODEL_SIZE          0x60
+#define DSC_RC_CONFIG              0x64
+#define DSC_RC_BUF_THRESH_0        0x68
+#define DSC_RC_BUF_THRESH_1        0x6C
+#define DSC_RC_BUF_THRESH_2        0x70
+#define DSC_RC_BUF_THRESH_3        0x74
+#define DSC_RC_MIN_QP_0            0x78
+#define DSC_RC_MIN_QP_1            0x7C
+#define DSC_RC_MIN_QP_2            0x80
+#define DSC_RC_MAX_QP_0            0x84
+#define DSC_RC_MAX_QP_1            0x88
+#define DSC_RC_MAX_QP_2             0x8C
+#define DSC_RC_RANGE_BPG_OFFSETS_0  0x90
+#define DSC_RC_RANGE_BPG_OFFSETS_1  0x94
+#define DSC_RC_RANGE_BPG_OFFSETS_2  0x98
+
+/* DPU_DSC_CTL register offsets */
+#define DSC_CTL                    0x00
+#define DSC_CFG                    0x04
+#define DSC_DATA_IN_SWAP           0x08
+#define DSC_CLK_CTRL               0x0C
+
+/*
+ * @DPU_DSC_ENC                 DSC encoder sub block
+ * @DPU_DSC_CTL                 DSC controller sub block
+ */
+enum {
+	DPU_DSC_ENC,
+	DPU_DSC_CTL,
+};
+
+static int _dsc_calc_ob_max_addr(struct dpu_hw_dsc *hw_dsc, int num_ss)
+{
+	int max_addr = 2400 / num_ss;
+
+	if (hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_422_EN))
+		max_addr /= 2;
+
+	return max_addr - 1;
+};
+
+static inline void _dsc_subblk_offset(struct dpu_hw_dsc *hw_dsc, int s_id,
+		u32 *offset)
+{
+	const struct dpu_dsc_sub_blks *sblk;
+
+	sblk = hw_dsc->caps->sblk;
+
+	if (s_id == DPU_DSC_ENC)
+		*offset = sblk->enc.base;
+	else if (s_id == DPU_DSC_CTL)
+		*offset = sblk->ctl.base;
+	else
+		DPU_ERROR("invalid DSC sub block=%d\n", s_id);
+}
+
+static void dpu_hw_dsc_disable_1_2(struct dpu_hw_dsc *hw_dsc)
+{
+	struct dpu_hw_blk_reg_map *hw;
+	u32 offset;
+
+	if (!hw_dsc)
+		return;
+
+	_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &offset);
+
+	hw = &hw_dsc->hw;
+	DPU_REG_WRITE(hw, offset + DSC_CFG, 0);
+
+	_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &offset);
+
+	DPU_REG_WRITE(hw, offset + ENC_DF_CTRL, 0);
+	DPU_REG_WRITE(hw, offset + DSC_MAIN_CONF, 0);
+}
+
+static void dpu_hw_dsc_config_1_2(struct dpu_hw_dsc *hw_dsc,
+			      struct drm_dsc_config *dsc,
+			      u32 mode,
+			      u32 initial_lines)
+{
+	struct dpu_hw_blk_reg_map *hw;
+	u32 offset;
+	u32 data = 0;
+	u32 det_thresh_flatness;
+	u32 num_active_ss_per_enc;
+	u32 bpp;
+	void __iomem *off;
+
+	if (!hw_dsc || !dsc)
+		return;
+
+	hw = &hw_dsc->hw;
+
+	_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &offset);
+
+	if (mode & DSC_MODE_SPLIT_PANEL)
+		data |= BIT(0);
+
+	if (mode & DSC_MODE_MULTIPLEX)
+		data |= BIT(1);
+
+	num_active_ss_per_enc = dsc->slice_count;
+	if (mode & DSC_MODE_MULTIPLEX)
+		num_active_ss_per_enc = dsc->slice_count >> 1;
+
+	data |= (num_active_ss_per_enc & 0x3) << 7;
+
+	DPU_REG_WRITE(hw, DSC_CMN_MAIN_CNF, data);
+
+	data = (initial_lines & 0xff);
+
+	if (mode & DSC_MODE_VIDEO)
+		data |= BIT(9);
+
+	data |= (_dsc_calc_ob_max_addr(hw_dsc, num_active_ss_per_enc) << 18);
+
+	DPU_REG_WRITE(hw, offset + ENC_DF_CTRL, data);
+
+	data = (dsc->dsc_version_minor & 0xf) << 28;
+	if (dsc->dsc_version_minor == 0x2) {
+		if (dsc->native_422)
+			data |= BIT(22);
+		if (dsc->native_420)
+			data |= BIT(21);
+	}
+
+	bpp = dsc->bits_per_pixel;
+	/* as per hw requirement bpp should be programmed
+	 * twice the actual value in case of 420 or 422 encoding
+	 */
+	if (dsc->native_422 || dsc->native_420)
+		bpp = 2 * bpp;
+	data |= (dsc->block_pred_enable ? 1 : 0) << 20;
+	data |= bpp << 10;
+	data |= (dsc->line_buf_depth & 0xf) << 6;
+	data |= dsc->convert_rgb << 4;
+	data |= dsc->bits_per_component & 0xf;
+
+	DPU_REG_WRITE(hw, offset + DSC_MAIN_CONF, data);
+
+	data = (dsc->pic_width & 0xffff) |
+		((dsc->pic_height & 0xffff) << 16);
+
+	DPU_REG_WRITE(hw, offset + DSC_PICTURE_SIZE, data);
+
+	data = (dsc->slice_width & 0xffff) |
+		((dsc->slice_height & 0xffff) << 16);
+
+	DPU_REG_WRITE(hw, offset + DSC_SLICE_SIZE, data);
+
+	DPU_REG_WRITE(hw, offset + DSC_MISC_SIZE,
+			(dsc->slice_chunk_size) & 0xffff);
+
+	data = (dsc->initial_xmit_delay & 0xffff) |
+		((dsc->initial_dec_delay & 0xffff) << 16);
+
+	DPU_REG_WRITE(hw, offset + DSC_HRD_DELAYS, data);
+
+	DPU_REG_WRITE(hw, offset + DSC_RC_SCALE,
+			dsc->initial_scale_value & 0x3f);
+
+	data = (dsc->scale_increment_interval & 0xffff) |
+		((dsc->scale_decrement_interval & 0x7ff) << 16);
+
+	DPU_REG_WRITE(hw, offset + DSC_RC_SCALE_INC_DEC, data);
+
+	data = (dsc->first_line_bpg_offset & 0x1f) |
+		((dsc->second_line_bpg_offset & 0x1f) << 5);
+
+	DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_1, data);
+
+	data = (dsc->nfl_bpg_offset & 0xffff) |
+		((dsc->slice_bpg_offset & 0xffff) << 16);
+
+	DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_2, data);
+
+	data = (dsc->initial_offset & 0xffff) |
+		((dsc->final_offset & 0xffff) << 16);
+
+	DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_3, data);
+
+	data = (dsc->nsl_bpg_offset & 0xffff) |
+		((dsc->second_line_offset_adj & 0xffff) << 16);
+
+	DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_4, data);
+
+	data = (dsc->flatness_min_qp & 0x1f);
+	data |= (dsc->flatness_max_qp & 0x1f) << 5;
+
+	det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
+	data |= (det_thresh_flatness & 0xff) << 10;
+
+	DPU_REG_WRITE(hw, offset + DSC_FLATNESS_QP, data);
+
+	DPU_REG_WRITE(hw, offset + DSC_RC_MODEL_SIZE,
+			(dsc->rc_model_size) & 0xffff);
+
+	data = dsc->rc_edge_factor & 0xf;
+	data |= (dsc->rc_quant_incr_limit0 & 0x1f) << 8;
+	data |= (dsc->rc_quant_incr_limit1 & 0x1f) << 13;
+	data |= (dsc->rc_tgt_offset_high & 0xf) << 20;
+	data |= (dsc->rc_tgt_offset_low & 0xf) << 24;
+
+	DPU_REG_WRITE(hw, offset + DSC_RC_CONFIG, data);
+
+	/* program the dsc wrapper */
+	_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &offset);
+
+	off = hw->blk_addr + offset;
+
+	data = BIT(0); /* encoder enable */
+	if (dsc->native_422)
+		data |= BIT(8);
+	else if (dsc->native_420)
+		data |= BIT(9);
+	if (!dsc->convert_rgb)
+		data |= BIT(10);
+	if (dsc->bits_per_component == 8)
+		data |= BIT(11);
+	if (mode & DSC_MODE_SPLIT_PANEL)
+		data |= BIT(12);
+	if (mode & DSC_MODE_MULTIPLEX)
+		data |= BIT(13);
+	if (!(mode & DSC_MODE_VIDEO))
+		data |= BIT(17);
+
+	DPU_REG_WRITE(hw, offset + DSC_CFG, data);
+}
+
+static void dpu_hw_dsc_config_thresh_1_2(struct dpu_hw_dsc *hw_dsc,
+					struct drm_dsc_config *dsc)
+{
+	struct dpu_hw_blk_reg_map *hw;
+	u32 offset, off;
+	int i, j = 0;
+	struct drm_dsc_rc_range_parameters *rc;
+	u32 data = 0, min_qp = 0, max_qp = 0, bpg_off = 0;
+
+	if (!hw_dsc || !dsc)
+		return;
+
+	_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &offset);
+
+	hw = &hw_dsc->hw;
+
+	rc = dsc->rc_range_params;
+
+	off = 0;
+	for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
+		data |= dsc->rc_buf_thresh[i] << (8 * j);
+		j++;
+		if ((j == 4) || (i == DSC_NUM_BUF_RANGES - 2)) {
+			DPU_REG_WRITE(hw, offset + DSC_RC_BUF_THRESH_0 + off,
+					data);
+			off += 4;
+			j = 0;
+			data = 0;
+		}
+	}
+
+	off = 0;
+	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
+		min_qp |= rc[i].range_min_qp << (5 * j);
+		max_qp |= rc[i].range_max_qp << (5 * j);
+		bpg_off |= rc[i].range_bpg_offset << (6 * j);
+		j++;
+		if (j == 5) {
+			DPU_REG_WRITE(hw, offset + DSC_RC_MIN_QP_0 + off,
+					min_qp);
+			DPU_REG_WRITE(hw, offset + DSC_RC_MAX_QP_0 + off,
+					max_qp);
+			DPU_REG_WRITE(hw,
+					offset + DSC_RC_RANGE_BPG_OFFSETS_0 + off,
+					bpg_off);
+			off += 4;
+			j = 0;
+			min_qp = 0;
+			max_qp = 0;
+			bpg_off = 0;
+		}
+	}
+}
+
+static void dpu_hw_dsc_bind_pingpong_blk_1_2(
+		struct dpu_hw_dsc *hw_dsc,
+		bool enable,
+		const enum dpu_pingpong pp)
+{
+	struct dpu_hw_blk_reg_map *hw;
+	int offset;
+	int mux_cfg = 0xf; /* Disabled */
+
+	_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &offset);
+
+	hw = &hw_dsc->hw;
+	if (enable)
+		mux_cfg = (pp - PINGPONG_0) & 0x7;
+
+	DPU_REG_WRITE(hw, offset + DSC_CTL, mux_cfg);
+}
+
+static const struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
+				       const struct dpu_mdss_cfg *m,
+				       void __iomem *addr,
+				       struct dpu_hw_blk_reg_map *b)
+{
+	int i;
+
+	for (i = 0; i < m->dsc_count; i++) {
+		if (dsc == m->dsc[i].id) {
+			b->blk_addr = addr + m->dsc[i].base;
+			b->log_mask = DPU_DBG_MASK_DSC;
+			return &m->dsc[i];
+		}
+	}
+
+	return NULL;
+}
+
+static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
+		const unsigned long features)
+{
+	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
+	ops->dsc_config = dpu_hw_dsc_config_1_2;
+	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh_1_2;
+	ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk_1_2;
+}
+
+struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(enum dpu_dsc idx, void __iomem *addr,
+				   const struct dpu_mdss_cfg *m)
+{
+	struct dpu_hw_dsc *c;
+	const struct dpu_dsc_cfg *cfg;
+
+	c = kzalloc(sizeof(*c), GFP_KERNEL);
+	if (!c)
+		return ERR_PTR(-ENOMEM);
+
+	cfg = _dsc_offset(idx, m, addr, &c->hw);
+	if (IS_ERR_OR_NULL(cfg)) {
+		kfree(c);
+		return ERR_PTR(-EINVAL);
+	}
+
+	c->idx = idx;
+	c->caps = cfg;
+
+	_setup_dcs_ops_1_2(&c->ops, c->caps->features);
+
+	return c;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f4dda88..f7014f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
@@ -250,7 +251,11 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_dsc *hw;
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
-		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
+		if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
+			hw = dpu_hw_dsc_init_1_2(dsc->id, mmio, cat);
+		else
+			hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
+
 		if (IS_ERR_OR_NULL(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dsc object creation: err %d\n", rc);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

