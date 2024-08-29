Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C68965113
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 22:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C51C10E774;
	Thu, 29 Aug 2024 20:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="R1jHdCmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCD410E714;
 Thu, 29 Aug 2024 20:49:12 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TIUtmu007794;
 Thu, 29 Aug 2024 20:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B89Ltkh6etkL3tOFSAau8gpedGTqLIwCFaNGVkQkuIg=; b=R1jHdCmOKUSOfdJU
 2zPeAl7BxllnHEKdGR70oUUamRdSymFsLvFDxJX8vWtw1FoFbbav7BYSwwIT/svB
 xT0t3rcti50urRQYCycdw00Jm99hJnj0zZvJT0yM5YayOf+cJ9tcQt5qe2uaPjmq
 sBdlPfDiV3fY+qm2qEc6eVVIHvWD7e4JwyCxsNIAt9wsMI3CxdXOO5/g5+zYuf8X
 t1oSpryoO5fn8HCZIL5gnmXQ+l1heJYvIQvLGkCM8KrcUN44vBUcpATGB4SKS5oQ
 7celKPPXzOWGQOGptNG84nzfo4yxtOotierB+SlK+oPZflxLDWkFzsdwFnukttWP
 C4hmTg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0en2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TKn2Po025041
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:02 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 13:49:02 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Aug 2024 13:48:32 -0700
Subject: [PATCH 11/21] drm/msm/dpu: Add RM support for allocating CWB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240829-concurrent-wb-v1-11-502b16ae2ebb@quicinc.com>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
In-Reply-To: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724964539; l=3088;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=g/6444LSdexGBzRzk11CQN1324zV0WLFsQMmtUfOVIo=;
 b=Qa5mh0lUVcJp28u038tCDiuOAdcwKXiDzOd+mD/BNZtb9SVYsjXLeb9KCmIWhMhU8ZgDfgY1v
 rT+5JAPrH8BDNbfujnArXG0gqXXQn4CEZitzd6k07GDDHWGitaMsht9
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HXh35JNhRJ_F_4RG5oBzYBQVCgbtzYzE
X-Proofpoint-ORIG-GUID: HXh35JNhRJ_F_4RG5oBzYBQVCgbtzYzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290147
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

Add support for allocating the concurrent writeback mux as part of the
WB allocation

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 30 +++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index c17d2d356f7a..c43cb55fe1d2 100644
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
@@ -352,6 +354,7 @@ struct dpu_mdss_color {
 #define DPU_DBG_MASK_DSPP     (1 << 10)
 #define DPU_DBG_MASK_DSC      (1 << 11)
 #define DPU_DBG_MASK_CDM      (1 << 12)
+#define DPU_DBG_MASK_CWB      (1 << 13)
 
 /**
  * struct dpu_hw_tear_check - Struct contains parameters to configure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index bc99b04eae3a..738e9a081b10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <drm/drm_managed.h>
 #include "msm_drv.h"
 #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
 #include "dpu_kms.h"
@@ -34,6 +35,7 @@ int dpu_rm_init(struct drm_device *dev,
 		void __iomem *mmio)
 {
 	int rc, i;
+	struct dpu_hw_blk_reg_map *cwb_reg_map;
 
 	if (!rm || !cat || !mmio) {
 		DPU_ERROR("invalid kms\n");
@@ -100,11 +102,35 @@ int dpu_rm_init(struct drm_device *dev,
 		rm->hw_intf[intf->id - INTF_0] = hw;
 	}
 
+	if (cat->cwb_count > 0) {
+		cwb_reg_map = drmm_kzalloc(dev,
+				sizeof(*cwb_reg_map) * cat->cwb_count,
+				GFP_KERNEL);
+
+		if (!cwb_reg_map) {
+			DPU_ERROR("failed cwb object creation\n");
+			return -ENOMEM;
+		}
+	}
+
+
+	for (i = 0; i < cat->cwb_count; i++) {
+		struct dpu_hw_blk_reg_map *cwb = &cwb_reg_map[i];
+
+		cwb->blk_addr = mmio + cat->cwb[i].base;
+		cwb->log_mask = DPU_DBG_MASK_CWB;
+	}
+
 	for (i = 0; i < cat->wb_count; i++) {
 		struct dpu_hw_wb *hw;
 		const struct dpu_wb_cfg *wb = &cat->wb[i];
 
-		hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
+		if (cat->cwb)
+			hw = dpu_hw_wb_init_with_cwb(dev, wb, mmio,
+					cat->mdss_ver, cwb_reg_map);
+		else
+			hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
+
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed wb object creation: err %d\n", rc);

-- 
2.34.1

