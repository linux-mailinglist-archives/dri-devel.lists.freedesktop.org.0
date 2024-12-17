Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CAE9F3F33
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562ED10E813;
	Tue, 17 Dec 2024 00:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XLpYSCaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5645710E818;
 Tue, 17 Dec 2024 00:43:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMrXXx006694;
 Tue, 17 Dec 2024 00:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I9zAdE04gNxlGVFSMdFm3T0V5WTsLrvzSIex60IiB6A=; b=XLpYSCaMeRYwg0m+
 akITGC7AYu3r1cgK0I/V9RCGB/npo2k2jCdCr1zYKr+FzIxBmSuf1jhEP9wX9ptm
 y3EsbTHjIi+E5hSFGYY4Di70J2qUCRmDzwYii+9CYA8lJK0/QWkuWoP3SQAbW6o1
 9TNEP6qhvJFO0Ls0s1nnyXkvQPsra86LYk3mkd3wjvT6SzGN60dJN/eun4DAY1Id
 dNeEb+TGKrhbUul3LwFmvpSVjVx6PjA9vSqattcFXw+hr099Pi1gBnzTeI2pZ208
 fYkMPuY5B9pCDCBkYsA/z4PS72Y+fXJz7RaARq0z+bYnQZzaBW4ZWk4dE1d//d/3
 jWfXdQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jwda062g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 00:43:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hTqQ030643
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 00:43:29 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:28 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:23 -0800
Subject: [PATCH v4 12/25] drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-12-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=6259;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=j4IJY3KO5wwBAYVRyxw5gBsk81tk/SupCpMLRG6iubI=;
 b=/zUquXXrH+YV6R3SS33R1Q0iZx5tKUxruFEron88gzeVRCBL28qXuszhhdBVpK5S+dsKY/uxw
 j2PERmlYcOvC0BPbMF6t58FFzoDMAJWKM6XyJCB4snA1WeMD5kVlGey
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WACVEJprtd2PldAu6Qux-m0UTfGd9ISQ
X-Proofpoint-ORIG-GUID: WACVEJprtd2PldAu6Qux-m0UTfGd9ISQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170004
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

The CWB mux has its own registers and set of operations. Add dpu_hw_cwb
abstraction to allow driver to configure the CWB mux.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile                |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c  | 73 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h  | 70 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 +-
 4 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index f274d9430cc311405f890074c1466ffe2ec45ac9..5df20cbeafb8bf07c825a1fd72719d5a56c38613 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -78,6 +78,7 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_hw_catalog.o \
 	disp/dpu1/dpu_hw_cdm.o \
 	disp/dpu1/dpu_hw_ctl.o \
+	disp/dpu1/dpu_hw_cwb.o \
 	disp/dpu1/dpu_hw_dsc.o \
 	disp/dpu1/dpu_hw_dsc_1_2.o \
 	disp/dpu1/dpu_hw_interrupts.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c
new file mode 100644
index 0000000000000000000000000000000000000000..5fbf52906ea94847a8eb3fcaa372e582dce2357c
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#include <drm/drm_managed.h>
+#include "dpu_hw_cwb.h"
+
+#define CWB_MUX              0x000
+#define CWB_MODE             0x004
+
+/* CWB mux block bit definitions */
+#define CWB_MUX_MASK         GENMASK(3, 0)
+#define CWB_MODE_MASK        GENMASK(2, 0)
+
+static void dpu_hw_cwb_config(struct dpu_hw_cwb *ctx,
+			      struct dpu_hw_cwb_setup_cfg *cwb_cfg)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int cwb_mux_cfg = 0xF;
+	enum dpu_pingpong pp;
+	enum cwb_mode_input input;
+
+	if (!cwb_cfg)
+		return;
+
+	input = cwb_cfg->input;
+	pp = cwb_cfg->pp_idx;
+
+	if (input >= INPUT_MODE_MAX)
+		return;
+
+	/*
+	 * The CWB_MUX register takes the pingpong index for the real-time
+	 * display
+	 */
+	if ((pp != PINGPONG_NONE) && (pp < PINGPONG_MAX))
+		cwb_mux_cfg = FIELD_PREP(CWB_MUX_MASK, pp - PINGPONG_0);
+
+	input = FIELD_PREP(CWB_MODE_MASK, input);
+
+	DPU_REG_WRITE(c, CWB_MUX, cwb_mux_cfg);
+	DPU_REG_WRITE(c, CWB_MODE, input);
+}
+
+/**
+ * dpu_hw_cwb_init() - Initializes the writeback hw driver object with cwb.
+ * @dev:  Corresponding device for devres management
+ * @cfg:  wb_path catalog entry for which driver object is required
+ * @addr: mapped register io address of MDP
+ * Return: Error code or allocated dpu_hw_wb context
+ */
+struct dpu_hw_cwb *dpu_hw_cwb_init(struct drm_device *dev,
+				   const struct dpu_cwb_cfg *cfg,
+				   void __iomem *addr)
+{
+	struct dpu_hw_cwb *c;
+
+	if (!addr)
+		return ERR_PTR(-EINVAL);
+
+	c = drmm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
+	if (!c)
+		return ERR_PTR(-ENOMEM);
+
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_CWB;
+
+	c->idx = cfg->id;
+	c->ops.config_cwb = dpu_hw_cwb_config;
+
+	return c;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h
new file mode 100644
index 0000000000000000000000000000000000000000..96b6edf6b2bbf7d270ac08f76af06fcd3c431527
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#ifndef _DPU_HW_CWB_H
+#define _DPU_HW_CWB_H
+
+#include "dpu_hw_util.h"
+
+struct dpu_hw_cwb;
+
+enum cwb_mode_input {
+	INPUT_MODE_LM_OUT,
+	INPUT_MODE_DSPP_OUT,
+	INPUT_MODE_MAX
+};
+
+/**
+ * struct dpu_hw_cwb_setup_cfg : Describes configuration for CWB mux
+ * @pp_idx:        Index of the real-time pinpong that the CWB mux will
+ *                 feed the CWB mux
+ * @input:         Input tap point
+ */
+struct dpu_hw_cwb_setup_cfg {
+	enum dpu_pingpong pp_idx;
+	enum cwb_mode_input input;
+};
+
+/**
+ *
+ * struct dpu_hw_cwb_ops : Interface to the cwb hw driver functions
+ * @config_cwb: configure CWB mux
+ */
+struct dpu_hw_cwb_ops {
+	void (*config_cwb)(struct dpu_hw_cwb *ctx,
+			   struct dpu_hw_cwb_setup_cfg *cwb_cfg);
+};
+
+/**
+ * struct dpu_hw_cwb : CWB mux driver object
+ * @base: Hardware block base structure
+ * @hw: Block hardware details
+ * @idx: CWB index
+ * @ops: handle to operations possible for this CWB
+ */
+struct dpu_hw_cwb {
+	struct dpu_hw_blk base;
+	struct dpu_hw_blk_reg_map hw;
+
+	enum dpu_cwb idx;
+
+	struct dpu_hw_cwb_ops ops;
+};
+
+/**
+ * dpu_hw_cwb - convert base object dpu_hw_base to container
+ * @hw: Pointer to base hardware block
+ * return: Pointer to hardware block container
+ */
+static inline struct dpu_hw_cwb *to_dpu_hw_cwb(struct dpu_hw_blk *hw)
+{
+	return container_of(hw, struct dpu_hw_cwb, base);
+}
+
+struct dpu_hw_cwb *dpu_hw_cwb_init(struct drm_device *dev,
+				   const struct dpu_cwb_cfg *cfg,
+				   void __iomem *addr);
+
+#endif /*_DPU_HW_CWB_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index fb3b6db8112f567f23ddab474d777182abb86033..ba7bb05efe9b8cac01a908e53121117e130f91ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -1,5 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_MDSS_H
@@ -350,6 +352,7 @@ struct dpu_mdss_color {
 #define DPU_DBG_MASK_DSPP     (1 << 10)
 #define DPU_DBG_MASK_DSC      (1 << 11)
 #define DPU_DBG_MASK_CDM      (1 << 12)
+#define DPU_DBG_MASK_CWB      (1 << 13)
 
 /**
  * struct dpu_hw_tear_check - Struct contains parameters to configure

-- 
2.34.1

