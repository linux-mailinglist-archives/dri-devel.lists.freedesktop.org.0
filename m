Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A2096510B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 22:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370C210E751;
	Thu, 29 Aug 2024 20:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lPcEFT9X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A9910E13C;
 Thu, 29 Aug 2024 20:49:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47THQoJY015412;
 Thu, 29 Aug 2024 20:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bofpdI2gbabYFx6LiDsw0TOf5qtpihr9aTfkXO0rKpk=; b=lPcEFT9XP/8BTSQU
 MXJq/7uArFLofuUFgHSPzVFW2SfMmVLmFE6s0ZowdG4+zsRfsoImIP0lwOJqepfz
 /jEG3yBDISoEE3BTeczcR/r9Fnwt2aH8meAa4FW5p77VQVer8aJS0nO1BCTQ0Gq2
 oHW2VFyo7+s6UoYm1vfH35KDEsAlZw0J4eomcvb62UfyRvDv7Ej+hCl4KVWA9c9O
 RngtwKHyF28u1V/pkCwl+RDWvaUhxU1vznh6XgQ4t5BvuE9ygze/GtYWZJAYUrX8
 pgxSagUeLrxzlK9DaKNtrPO5IwafIrtVC15rCUPByO4o5SttqS5FRtAHZgpCWAD0
 vHHjoQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419px5pgwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TKn1KJ015097
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 20:49:01 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 13:49:00 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Aug 2024 13:48:28 -0700
Subject: [PATCH 07/21] drm/msm/dpu: Check CRTC encoders are valid clones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240829-concurrent-wb-v1-7-502b16ae2ebb@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724964539; l=2507;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=f5sIg4wgMLNdE3+UAOj+ZHkuNzYnLi/WcPHfusX2d3M=;
 b=EiuZK9aND+DH1dbOFOaAmpB/VPlex7J7foWCO9t29ZFC4J7eDrlfCuIDqBIymPTkf+7f4xnoz
 zL8OYwi1c0CBzqWvAFPYgrq1yNvwUa3D/X0wyTDMKw6zjBdJHsghBr0
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FxTCpGOas7SrAWo6MJaE9hD65tARmmZJ
X-Proofpoint-GUID: FxTCpGOas7SrAWo6MJaE9hD65tARmmZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290147
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

Check that each encoder in the CRTC state's encoder_mask is marked as a
possible clone for all other encoders in the encoder_mask and that only
one CRTC is in clone mode at a time

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 36 +++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5ec1b5a38922..bebae365c036 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -1204,6 +1204,36 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	return topology;
 }
 
+static bool dpu_crtc_has_valid_clones(struct drm_crtc *crtc,
+		struct drm_crtc_state *crtc_state)
+{
+	struct drm_encoder *drm_enc;
+	struct drm_crtc *temp_crtc;
+	int num_cwb_sessions = 0;
+
+	drm_for_each_crtc(temp_crtc, crtc->dev)
+		if (drm_crtc_in_clone_mode(temp_crtc->state))
+			num_cwb_sessions++;
+
+	/*
+	 * Only support a single concurrent writeback session running
+	 * at a time
+	 */
+	if (num_cwb_sessions > 1)
+		return false;
+
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
+		if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
+				crtc_state->encoder_mask) {
+			DPU_ERROR("crtc%d failed valid clone check for mask 0x%x\n",
+				crtc->base.id, crtc_state->encoder_mask);
+			return false;
+		}
+	}
+
+	return true;
+}
+
 static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
@@ -1287,6 +1317,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			return rc;
 	}
 
+	if (drm_crtc_in_clone_mode(crtc_state) &&
+			!dpu_crtc_has_valid_clones(crtc, crtc_state))
+		return -EINVAL;
+
 	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,

-- 
2.34.1

