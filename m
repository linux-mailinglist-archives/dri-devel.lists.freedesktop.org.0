Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC3A216B3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 04:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740CE10E14E;
	Wed, 29 Jan 2025 03:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GDHD033N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEC110E73F;
 Wed, 29 Jan 2025 03:21:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2gZLC027400;
 Wed, 29 Jan 2025 03:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h7ZGdEB8IPqoRZo8zbuflNeMGgTjoGvYlvvy9b79qEQ=; b=GDHD033NULTE69uf
 T+KBSS/VO/61NmeAmMffgB0Y02f/zdX3cTbg20DmLiNbS3m1vuRaeRKJOBCRx4Xb
 aBJTBVFtcPAQMjCI5t4hATHUKjVr+eMV7CUIB6UoKl37u/1kG1ICHr0T7LIOqE4/
 MJzqFXqkilSeWpa8nsRF0uzTiPddIehhdBOho57i/ChMZsKQrZqVtH3MJC6WNP14
 0OPz0kskOqCgVQFOPAQ7wtb4JfoKDytxkoa9GG0gIYPLEzNpL7x4WCVMzOmQYKRP
 RYtUEeQNjrkZJEvPq5PVdwoq7xQjTya7g510aJJz/IUpovZM+H9JFK7Z6PhAivll
 D7jp0w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f5mrgqbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:21:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T3L7GR003998
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:21:07 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 19:21:06 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 28 Jan 2025 19:20:38 -0800
Subject: [PATCH v5 06/14] drm/msm/dpu: Fail atomic_check if multiple
 outputs request CDM block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-concurrent-wb-v5-6-6464ca5360df@quicinc.com>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
In-Reply-To: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
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
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738120865; l=3936;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=3XkwsP9c8T5+zw5yTgWjcZcAktaxrT/cKBRDJ+Z+8dk=;
 b=D24J52MyvhX5zLxv+eF+SO3+BwInyC2p+ZYswMwHtUAPBCvw1Lv/oVSLsl6vJrt6ZFxcJTtiI
 3j2el1WjbIdAhEszvvf+7/jSYgp8R6W7Re7um/9QLP1gwFeCYIRdzLC
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OZA8VSSRgsueftEjbiS-dJWvIgWu6EDA
X-Proofpoint-ORIG-GUID: OZA8VSSRgsueftEjbiS-dJWvIgWu6EDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501290026
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
msm_display_topoloy.needs_cdm into a cdm_requested counter to track how
many outputs are requesting CDM block. Return EINVAL if multiple outputs
are trying to reserve CDM.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v5:
- Changed check to fail only if multiple outputs are requesting CDM
  simultaneously
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 12 +++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  5 +++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index bd6fef8eb8f267cde4ebe1155be39ce69e786967..99db194f5d095e83ac72f2830814e649a25918ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -692,10 +692,10 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 		fb = conn_state->writeback_job->fb;
 
 		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
-			topology->needs_cdm = true;
+			topology->cdm_requested++;
 	} else if (disp_info->intf_type == INTF_DP) {
 		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
-			topology->needs_cdm = true;
+			topology->cdm_requested++;
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 0fbb92021b184c4792ddfe059e98b3acf7bc7cc6..dca3107d1e8265a864ac62d6b845d6cb966965ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -585,7 +585,8 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
 
 static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       uint32_t crtc_id)
+			       uint32_t crtc_id,
+			       const struct msm_display_topology *top)
 {
 	/* try allocating only one CDM block */
 	if (!rm->cdm_blk) {
@@ -593,6 +594,11 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 		return -EIO;
 	}
 
+	if (top->cdm_requested > 1) {
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
+	if (topology->cdm_requested > 0) {
+		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id, topology);
 		if (ret) {
 			DPU_ERROR("unable to find CDM blk\n");
 			return ret;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index b854e42d319d2c482e4e1732239754979f6950dd..7716c226cd7a270a1bac052dc085f5ed84cb9c26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -51,7 +51,8 @@ struct dpu_rm_sspp_requirements {
  * @num_intf:     number of interfaces the panel is mounted on
  * @num_dspp:     number of dspp blocks used
  * @num_dsc:      number of Display Stream Compression (DSC) blocks used
- * @needs_cdm:    indicates whether cdm block is needed for this display topology
+ * @cdm_requested:    indicates how many outputs are requesting cdm block for
+ *                    this display topology
  * @cwb_enabled:  indicates whether CWB is enabled for this display topology
  */
 struct msm_display_topology {
@@ -59,7 +60,7 @@ struct msm_display_topology {
 	u32 num_intf;
 	u32 num_dspp;
 	u32 num_dsc;
-	bool needs_cdm;
+	int cdm_requested;
 	bool cwb_enabled;
 };
 

-- 
2.34.1

