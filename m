Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9C3A369B8
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 01:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5420410ED4E;
	Sat, 15 Feb 2025 00:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="L+NkluNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E702D10ED43;
 Sat, 15 Feb 2025 00:15:35 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EAC48Y002088;
 Sat, 15 Feb 2025 00:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ih94t1hxQLsxjSGLqI+DzVxJ1wVgpeS141rsSCs4JSE=; b=L+NkluNV0yNJWO+c
 q8x22cPRlbuPXPoFlzjZQXUma7qhFbB57Xf3nkv81uB6Pta+0neD/hrHpSI+oqlB
 JtNhUcJdd4SuaZs5hDtqHSu4t5y+dVJvPbK6Gc/7I14zpHTYzr6J3IPaUEJALej/
 z5THO6GlLKSBIz/NmSy4gNgxJ8HewdwHamCGVMzJvek7GQibND6CpmQg14EJg7ij
 p5SgScAGzH+mPGmzqYIZ+PrKqAcMSw9Topojejg65DjkUVAGwslTRKNZqwgwMjM8
 9H6sPKfOC86tza4Fyor61C5gbUPMNCpoW2RMu9xH7ORjY4c/32owl/STUEY0yVOA
 4r/v5g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s5w4eexy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:15:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0FQjE012713
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:15:26 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 16:15:26 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 14 Feb 2025 16:14:29 -0800
Subject: [PATCH v6 06/14] drm/msm/dpu: Fail atomic_check if multiple
 outputs request CDM block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-concurrent-wb-v6-6-a44c293cf422@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739578524; l=3751;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=7W6Ea+aFfRsj5/jpu0ZzrQ6VDkfBCTxhGks/L0dpItM=;
 b=Zvlj0BMNSDKlITuPqOUFPusLi4i5lGXdLX6jHx6aieJ/BG/db046tKEW/nn5BwkUcSvaBDQEo
 +oTaIkXXLBUCMYE1NXLOw1MQpcQFkmI5eQerFsRC7w9SL0A2xwoEobe
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: M-xq9OaaiLidXVLxRtpBBAotLJ36ixME
X-Proofpoint-ORIG-GUID: M-xq9OaaiLidXVLxRtpBBAotLJ36ixME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Currently, our hardware only supports a single output using CDM block at
most. Because of this, we cannot support cases where both writeback and DP
output request CDM simultaneously

To avoid this happening when CWB is enabled, change
msm_display_topoloy.needs_cdm into a num_cdm counter to track how many
outputs are requesting CDM block. Return EINVAL if multiple outputs are
trying to reserve CDM.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v6:
- cdm_requested -> num_cdm

Changes in v5:
- Changed check to fail only if multiple outputs are requesting CDM
  simultaneously
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 12 +++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  5 +++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ad969a5b9434..0e4f27da9534 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -692,10 +692,10 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 		fb = conn_state->writeback_job->fb;
 
 		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
-			topology->needs_cdm = true;
+			topology->num_cdm++;
 	} else if (disp_info->intf_type == INTF_DP) {
 		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
-			topology->needs_cdm = true;
+			topology->num_cdm++;
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 0fbb92021b18..4da2e47265d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -585,7 +585,8 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
 
 static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       uint32_t crtc_id)
+			       uint32_t crtc_id,
+			       int num_cdm)
 {
 	/* try allocating only one CDM block */
 	if (!rm->cdm_blk) {
@@ -593,6 +594,11 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 		return -EIO;
 	}
 
+	if (num_cdm > 1) {
+		DPU_ERROR("More than 1 INTF requesting CDM\n");
+		return -EINVAL;
+	}
+
 	if (global_state->cdm_to_crtc_id) {
 		DPU_ERROR("CDM_0 is already allocated\n");
 		return -EIO;
@@ -629,8 +635,8 @@ static int _dpu_rm_make_reservation(
 	if (ret)
 		return ret;
 
-	if (topology->needs_cdm) {
-		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id);
+	if (topology->num_cdm > 0) {
+		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id, topology->num_cdm);
 		if (ret) {
 			DPU_ERROR("unable to find CDM blk\n");
 			return ret;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index b854e42d319d..a19dbdb1b6f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -51,7 +51,8 @@ struct dpu_rm_sspp_requirements {
  * @num_intf:     number of interfaces the panel is mounted on
  * @num_dspp:     number of dspp blocks used
  * @num_dsc:      number of Display Stream Compression (DSC) blocks used
- * @needs_cdm:    indicates whether cdm block is needed for this display topology
+ * @num_cdm:      indicates how many outputs are requesting cdm block for
+ *                    this display topology
  * @cwb_enabled:  indicates whether CWB is enabled for this display topology
  */
 struct msm_display_topology {
@@ -59,7 +60,7 @@ struct msm_display_topology {
 	u32 num_intf;
 	u32 num_dspp;
 	u32 num_dsc;
-	bool needs_cdm;
+	int num_cdm;
 	bool cwb_enabled;
 };
 

-- 
2.48.1

