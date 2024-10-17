Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531009A17B1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 03:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDF610E784;
	Thu, 17 Oct 2024 01:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="K2W3QaGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D9010E1AA;
 Thu, 17 Oct 2024 01:21:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GGXNpD020138;
 Thu, 17 Oct 2024 01:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MfHEvB0BZxNnRWqA6M30gD96GJkRLn7WF63qejHbi9Q=; b=K2W3QaGvMtUUlj/i
 pg14Bk7exzOvYO/1Byf4RTeluOBw83UtmhZojBFbIqwvrSD2WRG05AxHSoXUc3UK
 +zyvkIus3WmbDSQKCb71wqv8vfNIkBVrUa4e2ewJQiBtMo+k8DEyoAyfTvGf+L4Y
 Oir9UD1dVsH8TmtvIuT8jVUYvrF0XnWRT+fJ6lDVjYp4eK2IwGFevIaFXQqNNOVl
 9T13SPVVnKzvud2nY5E57PQa2GyzwMJ6koeMOfBJMi0khIVwAsYI68XM/ZgWH15+
 Rz2cJF9qONE72sdkPYySrvFziW49FAkrtzjVig0ItsHkgzNi/W8PKhxDDuPjx5Xx
 zkWKrA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429m0fehsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:21:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LGAA022711
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 01:21:16 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:16 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:09 -0700
Subject: [PATCH v3 03/23] drm/msm/dpu: get rid of struct
 dpu_rm_requirements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-3-a33cf9b93835@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=8961;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=xA4kNXbxH0BrAtCR7RuwmAb4j9B5WAPEDzQGLZT57+U=;
 b=nXtHJRRigMqXkL0gaHoY9SUU1S5OKvE0827+d29xxWXvOvRpUBN/+Mm2U4mC927zWsKRXejdG
 D87fVsDmywhAnSD1bra1B52hcgb0UHRP94T/zqoLLz10s3wzfTXkDoT
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BQ7ecfRBSmqnrhOvLDrVdN59fpG9IhZY
X-Proofpoint-ORIG-GUID: BQ7ecfRBSmqnrhOvLDrVdN59fpG9IhZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The struct dpu_rm_requirements was used to wrap display topology and
hw resources, which meant INTF indices. As of commit ef58e0ad3436
("drm/msm/dpu: get INTF blocks directly rather than through RM") the hw
resources struct was removed, leaving struct dpu_rm_requirements
containing a single field (topology). Remove the useless wrapper.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 71 ++++++++++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +-
 3 files changed, 25 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3b171bf227d16f301545eefeac1e2bf61085b218..6293e716a1c3ae8ba07c0ee76f61766fdaab0710 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -691,7 +691,7 @@ static int dpu_encoder_virt_atomic_check(
 
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, topology);
+					drm_enc, crtc_state, &topology);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 44938ba7a2b7e618735447e0af51e91f9fa3242a..8193c3d579dfc86b0fb8395ba60b7b1f5137413f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include "msm_drv.h"
 #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
@@ -26,14 +27,6 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
 	return res_map[idx] && res_map[idx] != enc_id;
 }
 
-/**
- * struct dpu_rm_requirements - Reservation requirements parameter bundle
- * @topology:  selected topology for the display
- */
-struct dpu_rm_requirements {
-	struct msm_display_topology topology;
-};
-
 int dpu_rm_init(struct drm_device *dev,
 		struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
@@ -231,14 +224,13 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
  *      mixer in rm->pingpong_blks[].
  * @dspp_idx: output parameter, index of dspp block attached to the layer
  *      mixer in rm->dspp_blks[].
- * @reqs: input parameter, rm requirements for HW blocks needed in the
- *      datapath.
+ * @topology:  selected topology for the display
  * Return: true if lm matches all requirements, false otherwise
  */
 static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
-		struct dpu_rm_requirements *reqs)
+		struct msm_display_topology *topology)
 {
 	const struct dpu_lm_cfg *lm_cfg;
 	int idx;
@@ -263,7 +255,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	}
 	*pp_idx = idx;
 
-	if (!reqs->topology.num_dspp)
+	if (!topology->num_dspp)
 		return true;
 
 	idx = lm_cfg->dspp - DSPP_0;
@@ -285,7 +277,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
 			       uint32_t enc_id,
-			       struct dpu_rm_requirements *reqs)
+			       struct msm_display_topology *topology)
 
 {
 	int lm_idx[MAX_BLOCKS];
@@ -293,14 +285,14 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	int dspp_idx[MAX_BLOCKS] = {0};
 	int i, lm_count = 0;
 
-	if (!reqs->topology.num_lm) {
-		DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
+	if (!topology->num_lm) {
+		DPU_ERROR("invalid number of lm: %d\n", topology->num_lm);
 		return -EINVAL;
 	}
 
 	/* Find a primary mixer */
 	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
-			lm_count < reqs->topology.num_lm; i++) {
+			lm_count < topology->num_lm; i++) {
 		if (!rm->mixer_blks[i])
 			continue;
 
@@ -309,14 +301,14 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
 				enc_id, i, &pp_idx[lm_count],
-				&dspp_idx[lm_count], reqs)) {
+				&dspp_idx[lm_count], topology)) {
 			continue;
 		}
 
 		++lm_count;
 
 		/* Valid primary mixer found, find matching peers */
-		if (lm_count < reqs->topology.num_lm) {
+		if (lm_count < topology->num_lm) {
 			int j = _dpu_rm_get_lm_peer(rm, i);
 
 			/* ignore the peer if there is an error or if the peer was already processed */
@@ -329,7 +321,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
 					global_state, enc_id, j,
 					&pp_idx[lm_count], &dspp_idx[lm_count],
-					reqs)) {
+					topology)) {
 				continue;
 			}
 
@@ -338,7 +330,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		}
 	}
 
-	if (lm_count != reqs->topology.num_lm) {
+	if (lm_count != topology->num_lm) {
 		DPU_DEBUG("unable to find appropriate mixers\n");
 		return -ENAVAIL;
 	}
@@ -347,7 +339,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
 		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
 		global_state->dspp_to_enc_id[dspp_idx[i]] =
-			reqs->topology.num_dspp ? enc_id : 0;
+			topology->num_dspp ? enc_id : 0;
 
 		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
 					 pp_idx[i] + PINGPONG_0);
@@ -584,28 +576,28 @@ static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
-		struct dpu_rm_requirements *reqs)
+		struct msm_display_topology *topology)
 {
 	int ret;
 
-	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, reqs);
+	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate mixers\n");
 		return ret;
 	}
 
 	ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
-				&reqs->topology);
+			topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate CTL\n");
 		return ret;
 	}
 
-	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
+	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
 	if (ret)
 		return ret;
 
-	if (reqs->topology.needs_cdm) {
+	if (topology->needs_cdm) {
 		ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
 		if (ret) {
 			DPU_ERROR("unable to find CDM blk\n");
@@ -616,20 +608,6 @@ static int _dpu_rm_make_reservation(
 	return ret;
 }
 
-static int _dpu_rm_populate_requirements(
-		struct drm_encoder *enc,
-		struct dpu_rm_requirements *reqs,
-		struct msm_display_topology req_topology)
-{
-	reqs->topology = req_topology;
-
-	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d cdm: %d\n",
-		      reqs->topology.num_lm, reqs->topology.num_dsc,
-		      reqs->topology.num_intf, reqs->topology.needs_cdm);
-
-	return 0;
-}
-
 static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
 				  uint32_t enc_id)
 {
@@ -662,9 +640,8 @@ int dpu_rm_reserve(
 		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology)
+		struct msm_display_topology *topology)
 {
-	struct dpu_rm_requirements reqs;
 	int ret;
 
 	/* Check if this is just a page-flip */
@@ -679,13 +656,11 @@ int dpu_rm_reserve(
 	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
 		      enc->base.id, crtc_state->crtc->base.id);
 
-	ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
-	if (ret) {
-		DPU_ERROR("failed to populate hw requirements\n");
-		return ret;
-	}
+	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
+		      topology->num_lm, topology->num_dsc,
+		      topology->num_intf);
 
-	ret = _dpu_rm_make_reservation(rm, global_state, enc, &reqs);
+	ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
 	if (ret)
 		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index e63db8ace6b940c48e081c9e11926788f6e333a3..62cc2edd2ee03f4acdba99c65ac94c8ac7b7fbf7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -70,7 +70,7 @@ int dpu_rm_reserve(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology);
+		struct msm_display_topology *topology);
 
 /**
  * dpu_rm_reserve - Given the encoder for the display chain, release any

-- 
2.34.1

