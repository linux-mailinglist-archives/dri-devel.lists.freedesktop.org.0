Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC73F80010D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 02:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CF210E7A5;
	Fri,  1 Dec 2023 01:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF2710E795;
 Fri,  1 Dec 2023 01:31:03 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUICHYw002423; Fri, 1 Dec 2023 01:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=h8ZdeR7sn+APPSNGy5lmHPEBKa1mCyW71NExfWsf8D0=;
 b=bUkgfVKXFOLrTQRd8pPS4HbDPG98+7CiKoXYXxpo/rmfV1W3gJsJL6beD43MAihhVJMa
 /7wJtH+OcpOEcamyXc3EZ/u4hD0o1pm0zRYVY2P2fZEwxYJQStsz5kDcUQb23skNby0i
 SDwDNELOexHr3PDh3dnjhpD2N0iQ/JGuOyPO++su/uPjKuXgFWwFQmYkU1SEiGEkCVrE
 9M1IWsOEGcd8QF8hnHXhAARrFY8+YV7Bg2iHNBLLXDWkL8hO3npBAea0R9BzsTwh9y45
 kI2mrbOkZQeUu+IiWZITLHQAuB3D+GRoM7JjsDFpLkQ8zUL9gWdO73ymPX2CLFKD0k/b AQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uph8x385p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 01:31:00 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B11V0qe011443
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 01:31:00 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 17:30:59 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 30 Nov 2023 17:30:33 -0800
Subject: [PATCH 1/2] drm/msm/dpu: Drop enable and frame_count parameters
 from dpu_hw_setup_misr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231130-encoder-fixup-v1-1-585c54cd046e@quicinc.com>
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
In-Reply-To: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-53db1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701394259; l=9312;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=IS3/2LxTK4Wqs0JKPatXizXZQ2BWAYi2z2K6vvBz8IY=;
 b=MHWsjpozCiZgKDjQP9FWq5+4m5Ctuy8xyHh7MmcJAPlpj0HJDZat4IDRHq0Wj3F2W6WTQ4Lzz
 ivfFHrzCd8cBSzjCkLsqMGOH1uggMKCqNk6+3PTos+AnjJfAz6JLUNc
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: V85elZQDQL9ML1FbLuNl1a4AIht5UMwJ
X-Proofpoint-GUID: V85elZQDQL9ML1FbLuNl1a4AIht5UMwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010008
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
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 17 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  9 +++------
 8 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2b83a13b3aa9..79f2b69429c8 100644
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
@@ -125,7 +125,7 @@ static void dpu_crtc_setup_lm_misr(struct dpu_crtc_state *crtc_state)
 			continue;
 
 		/* Calculate MISR over 1 frame */
-		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
+		m->hw_lm->ops.setup_misr(m->hw_lm);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4..5dbb5d27bbea 100644
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
@@ -255,7 +255,7 @@ void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
 		if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
 			continue;
 
-		phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
+		phys->hw_intf->ops.setup_misr(phys->hw_intf);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index e8b8908d3e12..3442cf65b86f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
@@ -318,9 +318,9 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 	return DPU_REG_READ(c, INTF_LINE_COUNT);
 }
 
-static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
+static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf)
 {
-	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count);
+	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL);
 }
 
 static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index c539025c418b..66a5603dc7ed 100644
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
index d1c3bd8379ea..f38473e68f79 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
@@ -81,9 +81,9 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 	}
 }
 
-static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
+static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
 {
-	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
+	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL);
 }
 
 static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 36992d046a53..98b77cda6547 100644
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
index 18b16b2d2bf5..a8a0a4e76b94 100644
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
@@ -481,9 +481,7 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 		      cfg->danger_safe_en ? QOS_QOS_CTRL_DANGER_SAFE_EN : 0);
 }
 
-void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
-		u32 misr_ctrl_offset,
-		bool enable, u32 frame_count)
+void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset)
 {
 	u32 config = 0;
 
@@ -492,15 +490,8 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 	/* Clear old MISR value (in case it's read before a new value is calculated)*/
 	wmb();
 
-	if (enable) {
-		config = (frame_count & MISR_FRAME_COUNT_MASK) |
-			MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
-
-		DPU_REG_WRITE(c, misr_ctrl_offset, config);
-	} else {
-		DPU_REG_WRITE(c, misr_ctrl_offset, 0);
-	}
-
+	config = MISR_FRAME_COUNT | MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
+	DPU_REG_WRITE(c, misr_ctrl_offset, config);
 }
 
 int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 4bea139081bc..bb496ebe283b 100644
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
@@ -357,10 +357,7 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 			   bool qos_8lvl,
 			   const struct dpu_hw_qos_cfg *cfg);
 
-void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
-		u32 misr_ctrl_offset,
-		bool enable,
-		u32 frame_count);
+void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c, u32 misr_ctrl_offset);
 
 int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset,

-- 
2.43.0

