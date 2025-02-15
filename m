Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9986A369B4
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 01:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED4110ED4A;
	Sat, 15 Feb 2025 00:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FANrI2z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F53310E4A1;
 Sat, 15 Feb 2025 00:15:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EK7Ett027469;
 Sat, 15 Feb 2025 00:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sssCZHvTixgFkfdIsW2nieXep2egW8K/BQ7icz4BxNc=; b=FANrI2z5OUIZbFf2
 05uJbHO00Q9pei4hpsGpc4zm0u03Zui6l0yRDMy00Oy4E5jFRGlbXfDaPsXfFvy5
 brRDHqd479ANI5Qt6lt4ovCIbRLF9y7cMTNPR9ZhvjRE8nsO2zm8WMue4xHji1DM
 OZHgwRNVaarZRE++O3rZ3MiV5XMPxE0HwvBkyi7abJ1lwp/rdgsgU0gbp2XT7jWZ
 dmceDy7wGe//ZhFjeMXzYD3NLc5StXETJbx2qeEQ0zn9bCyM7OiKyDgY/Fhtq+/R
 G3f150WjfWSe5bFfxgeLnTClj84VvrBvoxhAQdLZrvsg2ol+jE6YXY61gLG3oDyy
 vpXUJg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebnd878-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:15:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0FROa009364
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:15:27 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 16:15:27 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 14 Feb 2025 16:14:34 -0800
Subject: [PATCH v6 11/14] drm/msm/dpu: Start frame done timer after encoder
 kickoff
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-concurrent-wb-v6-11-a44c293cf422@quicinc.com>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
In-Reply-To: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
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
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739578524; l=4139;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=UAtO/PF7LmEj3DwLfxugK70szF45lJr0GqS5kplHK5E=;
 b=QR3Vg52FAmI/+gGsQ2op7ASYRkqea1/REJwJAA90QrZCQca/MuAAqyOab/v1Eun7fLqQcLTzg
 PGScs+8OKnxCtSHVmvvWKCn+W10SPsPoA3xfQL6ncqtbvKgY1pEa1tI
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1BGs8dEOJtpomURPmqZT4Wnst3sbRD8u
X-Proofpoint-ORIG-GUID: 1BGs8dEOJtpomURPmqZT4Wnst3sbRD8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150000
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

Starting the frame done timer before the encoder is finished kicking off
can lead to unnecessary frame done timeouts when the device is
experiencing heavy load (ex. when debug logs are enabled).

Thus, create a separate API for starting the encoder frame done timer and
call it after the encoder kickoff is finished

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  3 ++-
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5c9c317c9347..60df3ee9419a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -999,8 +999,10 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	dpu_vbif_clear_errors(dpu_kms);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
 		dpu_encoder_kickoff(encoder);
+		dpu_encoder_start_frame_done_timer(encoder);
+	}
 
 	reinit_completion(&dpu_crtc->frame_done_comp);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 04ba26ce65a0..69f63151ca94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2090,6 +2090,25 @@ bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
 	return true;
 }
 
+/**
+ * dpu_encoder_start_frame_done_timer - Start the encoder frame done timer
+ * @drm_enc: Pointer to drm encoder structure
+ */
+void dpu_encoder_start_frame_done_timer(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	unsigned long timeout_ms;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	timeout_ms = DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES * 1000 /
+			drm_mode_vrefresh(&drm_enc->crtc->state->adjusted_mode);
+
+	atomic_set(&dpu_enc->frame_done_timeout_ms, timeout_ms);
+	mod_timer(&dpu_enc->frame_done_timer,
+			jiffies + msecs_to_jiffies(timeout_ms));
+
+}
+
 /**
  * dpu_encoder_kickoff - trigger a double buffer flip of the ctl path
  *	(i.e. ctl flush and start) immediately.
@@ -2099,7 +2118,6 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	struct dpu_encoder_phys *phys;
-	unsigned long timeout_ms;
 	unsigned int i;
 
 	DPU_ATRACE_BEGIN("encoder_kickoff");
@@ -2107,13 +2125,6 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 
 	trace_dpu_enc_kickoff(DRMID(drm_enc));
 
-	timeout_ms = DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES * 1000 /
-			drm_mode_vrefresh(&drm_enc->crtc->state->adjusted_mode);
-
-	atomic_set(&dpu_enc->frame_done_timeout_ms, timeout_ms);
-	mod_timer(&dpu_enc->frame_done_timer,
-			jiffies + msecs_to_jiffies(timeout_ms));
-
 	/* All phys encs are ready to go, trigger the kickoff */
 	_dpu_encoder_kickoff_phys(dpu_enc);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index b0ac10ebd02c..8503386bb503 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -95,4 +95,5 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
+void dpu_encoder_start_frame_done_timer(struct drm_encoder *drm_enc);
 #endif /* __DPU_ENCODER_H__ */

-- 
2.48.1

