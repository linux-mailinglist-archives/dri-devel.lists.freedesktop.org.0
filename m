Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54599855164
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951FC10E99F;
	Wed, 14 Feb 2024 18:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RbHMMy2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E262410E8C0;
 Wed, 14 Feb 2024 18:04:20 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41E6rEYx030116; Wed, 14 Feb 2024 18:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=0xgXmforspy5CNI48E+kOSpW6rzmLUnOALYg31ywLm0=; b=Rb
 HMMy2J1KvGKJUsiM/XlZeTvw/plyGfgVYlU5piSb5r5x4lml1LBRmKDwioOP28Es
 PyleL1TnxswhIzi3ZMMtKZCgPlTeajIRtkpEw0ZWXEgChdcdKrBcfBmi5EOKOKM6
 N7jwr+Vn+di/5O07YWi4qOXkMvjgxYNIH1q2ISozA6cIxLRDD02Cd9tjx4dwHP0u
 tFeCxDYxoq5lorAI3QWWgSsi5BrjIhtYFlE4kob9cYsQQ3E+66X5zk0+yA6qow7J
 /c84gRMqacWpziATNAd/LiJZdNNMlY84KijbsS87SN7Nv0K+iRASeWV0fg+6k4Dr
 /kIVGpfY+96j/stOLHig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8myg1s5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:04:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI4HHA011792
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:04:17 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:16 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v3 18/19] drm/msm/dpu: reserve CDM blocks for DP if mode is
 YUV420
Date: Wed, 14 Feb 2024 10:03:40 -0800
Message-ID: <20240214180347.1399-19-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240214180347.1399-1-quic_parellan@quicinc.com>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9WOomfPq02tRQ3eYtM4Q6cj9AKppVkMj
X-Proofpoint-ORIG-GUID: 9WOomfPq02tRQ3eYtM4Q6cj9AKppVkMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402140141
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

Reserve CDM blocks for DP if the mode format is YUV420. Currently this
reservation only works for writeback and DP if the format is YUV420. But
this can be easily extented to other YUV formats for DP.

Changes in v2:
	- Minor code simplification

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6280c6be6dca9..ec53e5f4a696d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -639,6 +639,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
+	struct msm_display_info *disp_info;
 	struct dpu_global_state *global_state;
 	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
@@ -655,6 +656,7 @@ static int dpu_encoder_virt_atomic_check(
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
 	priv = drm_enc->dev->dev_private;
+	disp_info = &dpu_enc->disp_info;
 	dpu_kms = to_dpu_kms(priv->kms);
 	adj_mode = &crtc_state->adjusted_mode;
 	global_state = dpu_kms_get_global_state(crtc_state->state);
@@ -682,21 +684,24 @@ static int dpu_encoder_virt_atomic_check(
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
 
 	/*
-	 * Use CDM only for writeback at the moment as other interfaces cannot handle it.
-	 * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
+	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
+	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
 	 * earlier.
 	 */
-	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
+	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
 		fb = conn_state->writeback_job->fb;
 
 		if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
 			topology.needs_cdm = true;
-		if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
-			crtc_state->mode_changed = true;
-		else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
-			crtc_state->mode_changed = true;
+	} else if (disp_info->intf_type == INTF_DP) {
+		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
+			topology.needs_cdm = true;
 	}
 
+	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
+		crtc_state->mode_changed = true;
+	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
+		crtc_state->mode_changed = true;
 	/*
 	 * Release and Allocate resources on every modeset
 	 * Dont allocate when active is false.
@@ -1137,7 +1142,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	dpu_enc->dsc_mask = dsc_mask;
 
-	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
+	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||
+	    dpu_enc->disp_info.intf_type == INTF_DP) {
 		struct dpu_hw_blk *hw_cdm = NULL;
 
 		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-- 
2.39.2

