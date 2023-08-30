Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0678E2A9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 00:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904F910E621;
	Wed, 30 Aug 2023 22:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE77410E618;
 Wed, 30 Aug 2023 22:50:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37UMWgT0007483; Wed, 30 Aug 2023 22:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=q87LW2eEB/llL8GSFj2ud4YTJgoxNipI3tGm6OCnAyA=;
 b=T5QaRwYdEKvKuoHRhEoyTeQNdQEpBD/wUO4UfaYHBoCn1zpvTBJdg5Xmk3lshuTwpwOq
 uRXyTDmm5h3l9Anx88rqOCab8YDIaMElYM3CYCQTBH7z55NFvS8f04VHYCGadc8kcURQ
 eqy83hNu429SxDrdV+zgSpa9SqFU62AM5/67L6bIRtwt3vNqoq00hkMFDqrCc7vVuBnr
 5vxtzHd6QOKbw2xB0yVDnoCfXrCpVHzHy/csCKylGw3rgnLtsDHiEuqKFVzFXl+rANWe
 S5Ig3LNXVl8jvmcZKgFOqzb6s8vvql48J7hFa90n6VLoBdJB0qpCWor0P/dPRKxl19VV Dg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3st3whsc2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:50:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37UMnxRj020937
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:49:59 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 30 Aug 2023 15:49:58 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH 08/16] drm/msm/dpu: add support to allocate CDM from RM
Date: Wed, 30 Aug 2023 15:49:01 -0700
Message-ID: <20230830224910.8091-9-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1hrrnWWR0eK0aDt94rSTnHRyvjIhxo2c
X-Proofpoint-ORIG-GUID: 1hrrnWWR0eK0aDt94rSTnHRyvjIhxo2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_18,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300206
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even though there is usually only one CDM block, it can be
used by either HDMI, DisplayPort OR Writeback interfaces.

Hence its allocation needs to be tracked properly by the
resource manager to ensure appropriate availability of the
block.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 45 +++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  4 +-
 5 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6cf6597148fd..582680804016 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -663,7 +663,7 @@ static int dpu_encoder_virt_atomic_check(
 
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, topology);
+					drm_enc, crtc_state, topology, false);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 34f943102499..07f75f295844 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -98,6 +98,7 @@ enum dpu_hw_blk_type {
 	DPU_HW_BLK_DSPP,
 	DPU_HW_BLK_MERGE_3D,
 	DPU_HW_BLK_DSC,
+	DPU_HW_BLK_CDM,
 	DPU_HW_BLK_MAX,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index b6f53ca6e962..61aa58643fda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -136,6 +136,7 @@ struct dpu_global_state {
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
 	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
+	uint32_t cdm_to_enc_id;
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7b6444a3fcb1..e7d4beb4661e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -29,10 +29,12 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
 /**
  * struct dpu_rm_requirements - Reservation requirements parameter bundle
  * @topology:  selected topology for the display
+ * @needs_cdm: whether the display needs a CDM block for the current mode
  * @hw_res:	   Hardware resources required as reported by the encoders
  */
 struct dpu_rm_requirements {
 	struct msm_display_topology topology;
+	bool needs_cdm;
 };
 
 int dpu_rm_destroy(struct dpu_rm *rm)
@@ -505,6 +507,26 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
 	return 0;
 }
 
+static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       struct drm_encoder *enc)
+{
+	/* try allocating only one CDM block */
+	if (!rm->cdm_blk) {
+		DPU_ERROR("CDM block does not exist\n");
+		return -EIO;
+	}
+
+	if (global_state->cdm_to_enc_id) {
+		DPU_ERROR("CDM_0 is already allocated\n");
+		return -EIO;
+	}
+
+	global_state->cdm_to_enc_id = enc->base.id;
+
+	return 0;
+}
+
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
@@ -530,15 +552,25 @@ static int _dpu_rm_make_reservation(
 	if (ret)
 		return ret;
 
+	if (reqs->needs_cdm) {
+		ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
+		if (ret) {
+			DPU_ERROR("unable to find CDM blk\n");
+			return ret;
+		}
+	}
+
 	return ret;
 }
 
 static int _dpu_rm_populate_requirements(
 		struct drm_encoder *enc,
 		struct dpu_rm_requirements *reqs,
-		struct msm_display_topology req_topology)
+		struct msm_display_topology req_topology,
+		bool needs_cdm)
 {
 	reqs->topology = req_topology;
+	reqs->needs_cdm = needs_cdm;
 
 	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
 		      reqs->topology.num_lm, reqs->topology.num_dsc,
@@ -571,6 +603,7 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
 		ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
+	_dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
 }
 
 int dpu_rm_reserve(
@@ -578,7 +611,8 @@ int dpu_rm_reserve(
 		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology)
+		struct msm_display_topology topology,
+		bool needs_cdm)
 {
 	struct dpu_rm_requirements reqs;
 	int ret;
@@ -595,7 +629,7 @@ int dpu_rm_reserve(
 	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
 		      enc->base.id, crtc_state->crtc->base.id);
 
-	ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
+	ret = _dpu_rm_populate_requirements(enc, &reqs, topology, needs_cdm);
 	if (ret) {
 		DPU_ERROR("failed to populate hw requirements\n");
 		return ret;
@@ -644,6 +678,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		hw_to_enc_id = global_state->dsc_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->dsc_blks);
 		break;
+	case DPU_HW_BLK_CDM:
+		hw_blks = &rm->cdm_blk;
+		hw_to_enc_id = &global_state->cdm_to_enc_id;
+		max_blks = 1;
+		break;
 	default:
 		DPU_ERROR("blk type %d not managed by rm\n", type);
 		return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 29b221491926..74262d3cb6c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -69,13 +69,15 @@ int dpu_rm_destroy(struct dpu_rm *rm);
  * @drm_enc: DRM Encoder handle
  * @crtc_state: Proposed Atomic DRM CRTC State handle
  * @topology: Pointer to topology info for the display
+ * @needs_cdm: bool to indicate whether current encoder needs CDM
  * @Return: 0 on Success otherwise -ERROR
  */
 int dpu_rm_reserve(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology);
+		struct msm_display_topology topology,
+		bool needs_cdm);
 
 /**
  * dpu_rm_reserve - Given the encoder for the display chain, release any
-- 
2.40.1

