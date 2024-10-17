Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2389A1798
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 03:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCD610E776;
	Thu, 17 Oct 2024 01:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JdUf33sN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C360E10E774;
 Thu, 17 Oct 2024 01:21:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GIoW3p011837;
 Thu, 17 Oct 2024 01:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /XcRoZho/XbalM5+jE/UQCvCaPdIiwjsVlckhm3ziA8=; b=JdUf33sNC1u1pDHH
 q2YaDuoSugsGEQ+jD12Lhs7u+fwpKsfbHsWoFRZ0XazWmrq/xzEQQjuvMJH5fkzv
 dLAIxXdm8W99gI3NEFQ7Q8ReDeXa0MeVQhWeOlhLmRbsQGApG/hjxpY2gR+gJCv4
 wwHIwB7pXckEkKaL3ZePELVApbuC/80Aat5tgzruAUpqs6L4zuM6y4PCHaXXROVS
 a28TTt/a4X/euv069pm8OOwgcpPvfOIlrxuss+GitBwJXbJeOQ8YjBek+nB2MeDa
 Y9/hkL7Dujpl/pU97gdExPxjobo3W+L/VK3/Z6vAimFh07WFM30ZIBTUQQGtVdll
 hepDMA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5jaee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:21:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LM3G006495
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:21:22 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:21 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:29 -0700
Subject: [PATCH v3 23/23] drm/msm/dpu: Set possible clones for all encoders
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-23-a33cf9b93835@quicinc.com>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
In-Reply-To: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
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
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128076; l=3734;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=3xCis0LeZTVLzy2+rHx0s2TGJubZ9EAyvJkwx/q1ISo=;
 b=vQ6Ckh+bUBGDY/V7i6yVNb9VT2PMK92sRoZwiUDAfjq8+ey0ZIXaV46YaLRzwkiau22QNJZxF
 Eb+PFBmCFjXB/OsmB6XQf5ZshjDfDZ2TfZ1+eBLovD2aqyvv94HKy/f
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Eqj8-roXynbsvF89OTZKEifcLWNs86lZ
X-Proofpoint-GUID: Eqj8-roXynbsvF89OTZKEifcLWNs86lZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170008
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

Set writeback encoders as possible clones for DSI encoders and vice
versa.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++++--
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2084f54e4a6235cc65dedcb0003f83d75dd51ec1..7b8fd1041acaea297ead2a4e0b33b43336ce1a1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2397,6 +2397,38 @@ static int dpu_encoder_virt_add_phys_encs(
 	return 0;
 }
 
+/**
+ * dpu_encoder_get_clones - Calculate the possible_clones for DPU encoder
+ * @drm_enc:        DRM encoder pointer
+ * Returns:         possible_clones mask
+ */
+uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc)
+{
+	struct drm_encoder *curr;
+	int type = drm_enc->encoder_type;
+	uint32_t clone_mask = drm_encoder_mask(drm_enc);
+
+	/*
+	 * Set writeback as possible clones of real-time DSI encoders and vice
+	 * versa
+	 *
+	 * Writeback encoders can't be clones of each other and DSI
+	 * encoders can't be clones of each other.
+	 *
+	 * TODO: Add DP encoders as valid possible clones for writeback encoders
+	 * (and vice versa) once concurrent writeback has been validated for DP
+	 */
+	drm_for_each_encoder(curr, drm_enc->dev) {
+		if ((type == DRM_MODE_ENCODER_VIRTUAL &&
+		    curr->encoder_type == DRM_MODE_ENCODER_DSI) ||
+		    (type == DRM_MODE_ENCODER_DSI &&
+		    curr->encoder_type == DRM_MODE_ENCODER_VIRTUAL))
+			clone_mask |= drm_encoder_mask(curr);
+	}
+
+	return clone_mask;
+}
+
 static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				 struct dpu_kms *dpu_kms,
 				 struct msm_display_info *disp_info)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index deaa0463b289fd12eaa0bb4179c58d04425007a6..1692e7de079d6e2e3d7ae20cece30b5b297a7763 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -98,6 +98,8 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);
  */
 void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
 
+uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc);
+
 /**
  * dpu_encoder_init - initialize virtual encoder object
  * @dev:        Pointer to drm device structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47e304b357e89b8b3683c37b2abb447411e1e455..5effa108f3282cc52e6a15d71689e9def1205ebc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Red Hat
  * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  *
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -793,8 +793,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		return ret;
 
 	num_encoders = 0;
-	drm_for_each_encoder(encoder, dev)
+	drm_for_each_encoder(encoder, dev) {
 		num_encoders++;
+		if (catalog->cwb_count > 0)
+			encoder->possible_clones = dpu_encoder_get_clones(encoder);
+	}
 
 	max_crtc_count = min(catalog->mixer_count, num_encoders);
 

-- 
2.34.1

