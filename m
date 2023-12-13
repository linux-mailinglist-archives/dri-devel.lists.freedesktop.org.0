Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4F1812039
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 21:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C6D10E841;
	Wed, 13 Dec 2023 20:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFA810E80B;
 Wed, 13 Dec 2023 20:51:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDIs5jt019978; Wed, 13 Dec 2023 20:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=jg+M33yzqdyJTdwnQpzismU/xcwsg3cFKlMlBu5GSZc
 =; b=UuLPUndDJKLdQziNWjTIHxyC4XuWqtucWSSlSjDKFpRRcW7OqIYx2WJYXG0
 e1BC7dBchflvYtQtPMHgUlrso7fkdVZqZA5+LpMTArXiW+4vll9h25zau9e9aOFz
 dzh62Qn0Nf/DElG2a7fhb/l+OzLVya0TGIm8rHrLunksughwwF3KBs14dEF54B7a
 D6zB6pnYdwAEimaUB3COauJ/i+QnHJP6mbcAM6O4OJH29btTwsTno+MG6ZGxBjMB
 CeGR2GdwbwueB8opmGun+SabdsBX/AeS6rLBRFnOhFvFFvNqhfYCCD5EJ+XxzIxd
 EQoSdRxC85OuKLeKTpk69mgU2Cg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy5tvj58x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 20:51:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDKpqsN021832
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 20:51:52 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 12:51:51 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 13 Dec 2023 12:51:28 -0800
Subject: [PATCH v2 2/2] drm/msm/dpu: Drop enable and frame_count parameters
 from dpu_hw_setup_misr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231213-encoder-fixup-v2-2-b11a4ad35e5e@quicinc.com>
References: <20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com>
In-Reply-To: <20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-53db1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702500711; l=9531;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=8FEPFbimM5zHSONKpQM/1wptMYBzF1pZADObysmx9ag=;
 b=/s+sGCFpIzHWC5ie4ZJ5d9/jszKsYYsEsg23XFCMd9E+ud08O2bq93gU8lT3s1dPSeAk2JImZ
 gWwlRVAQ0RPAsb4qKYNKDL0FNnstcOiLREv1J1aecjZ+F+XWBsJA9Km
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dFYWXXYkiDGhXktt6uXWcTZgk35g55rT
X-Proofpoint-GUID: dFYWXXYkiDGhXktt6uXWcTZgk35g55rT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130147
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

Drop the enable and frame_count parameters from dpu_hw_setup_misr() as they
are always set to the same values.

In addition, replace MISR_FRAME_COUNT_MASK with MISR_FRAME_COUNT as
frame_count is always set to the same value.

Fixes: 7b37523fb1d1 ("drm/msm/dpu: Move MISR methods to dpu_hw_util")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 26 ++++++++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  9 +++------
 8 files changed, 25 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8ebed048a193..555182201b8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -114,7 +114,7 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
 			continue;
 
 		/* Calculate MISR over 1 frame */
-		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
+		m->hw_lm->ops.setup_misr(m->hw_lm);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index aa1a1646b322..1d8eb3b509b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Red Hat
  * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  *
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -258,7 +258,7 @@ void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
 		if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
 			continue;
 
-		phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
+		phys->hw_intf->ops.setup_misr(phys->hw_intf);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 226133af7840..6bba531d6dc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
@@ -320,9 +320,9 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 	return DPU_REG_READ(c, INTF_LINE_COUNT);
 }
 
-static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
+static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf)
 {
-	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count, 0x1);
+	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, 0x1);
 }
 
 static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 215401bb042e..0bd57a32144a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
@@ -95,7 +95,7 @@ struct dpu_hw_intf_ops {
 
 	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
 			const enum dpu_pingpong pp);
-	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
+	void (*setup_misr)(struct dpu_hw_intf *intf);
 	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
 
 	// Tearcheck on INTF since DPU 5.0.0
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index bbc9756ecde9..1d3ccf3228c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
@@ -83,9 +83,9 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 	}
 }
 
-static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
+static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
 {
-	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count, 0x0);
+	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, 0x0);
 }
 
 static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 8835fd106413..0a3381755249 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
@@ -57,7 +58,7 @@ struct dpu_hw_lm_ops {
 	/**
 	 * setup_misr: Enable/disable MISR
 	 */
-	void (*setup_misr)(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count);
+	void (*setup_misr)(struct dpu_hw_mixer *ctx);
 
 	/**
 	 * collect_misr: Read MISR signature
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 87716a60332e..3b33a60c5c6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -476,9 +476,7 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 }
 
 void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
-		u32 misr_ctrl_offset,
-		bool enable, u32 frame_count,
-		u32 input_sel)
+		u32 misr_ctrl_offset, u32 input_sel)
 {
 	u32 config = 0;
 
@@ -487,20 +485,12 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 	/* Clear old MISR value (in case it's read before a new value is calculated)*/
 	wmb();
 
-	if (enable) {
-		/*
-		 * note: Aside from encoders, input_sel should be
-		 * set to 0x0 by default
-		 */
-		config = (frame_count & MISR_FRAME_COUNT_MASK) |
-			MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK |
-			((input_sel & 0xF) << 24);
-
-		DPU_REG_WRITE(c, misr_ctrl_offset, config);
-	} else {
-		DPU_REG_WRITE(c, misr_ctrl_offset, 0);
-	}
-
+	/*
+	 * note: Aside from encoders, input_sel should be set to 0x0 by default
+	 */
+	config = MISR_FRAME_COUNT | MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK |
+		((input_sel & 0xF) << 24);
+	DPU_REG_WRITE(c, misr_ctrl_offset, config);
 }
 
 int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 761056be272b..a561720f827d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
@@ -13,7 +13,7 @@
 #include "dpu_hw_catalog.h"
 
 #define REG_MASK(n)                     ((BIT(n)) - 1)
-#define MISR_FRAME_COUNT_MASK           0xFF
+#define MISR_FRAME_COUNT                0x1
 #define MISR_CTRL_ENABLE                BIT(8)
 #define MISR_CTRL_STATUS                BIT(9)
 #define MISR_CTRL_STATUS_CLEAR          BIT(10)
@@ -355,10 +355,7 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 			   const struct dpu_hw_qos_cfg *cfg);
 
 void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
-		u32 misr_ctrl_offset,
-		bool enable,
-		u32 frame_count,
-		u32 input_sel);
+		u32 misr_ctrl_offset, u32 input_sel);
 
 int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset,

-- 
2.43.0

