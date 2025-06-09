Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E9AD1D7A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DE110E2E5;
	Mon,  9 Jun 2025 12:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EqfunpL9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17D710E340;
 Mon,  9 Jun 2025 12:25:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599XqSM015009;
 Mon, 9 Jun 2025 12:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sH5a9xPmDVGHnbUwrVMQRSAEr2yoWo0DQ6nhxn42gFM=; b=EqfunpL9Jc+02QYD
 4V3K1RH0XN8w2DNLYBPo+mqCAShS3gmQp0bB1DrHVCKO7s0iPkOoVEJYh1qbyld6
 0o2+3Bgsa6YKjTfYMVAEN6xAj4Mox7xnmeZQPIi7CEjJbONCpkREuCiwP50i05o3
 llgx9gJED3q4XapUO2x4IHEV5phHOXwxzzAsY7MPOdXO1HLXlsinYabClEdBVpMr
 VWhUP3CX6/ocgUfOkgKGixq8xTZx8XaZodVrzcjmL2y2f1XId8958FxzYHznBDoZ
 2PUrE5Yood/NF5Qn4wTWdALW/LQzQFrdAyZrSr7HFA85Ds9oo6JkTw6A9Rimc9ry
 YM/qUA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv5vnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:25:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CP1s9022961
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:25:01 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:58 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:54 +0800
Subject: [PATCH v2 35/38] drm/msm/dpu: use msm_dp_get_mst_intf_id() to get
 the intf id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250609-msm-dp-mst-v2-35-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Yongxing Mou" <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471764; l=5422;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=SekhMDezx+lM5kW6z5Wwx+fHgl7KfyjHNs5duzrNkiU=;
 b=QI584t8/eema82aEMR06ACeVTkAyaoKE7qyuuCcoz4nTrM9qbW9Er56NVjjBNd2u5qIezID+f
 IgPSy9oj3d/AJdBCJQ4jDckaEHeoJbqqrn6Lv0Z7x+pQEESnUjz3Sxg
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZSMhK5_qNJq5awpR0DICOGeDv8yq5UAI
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6846d29e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=hpIwTmcM3B3qI48g5FEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZSMhK5_qNJq5awpR0DICOGeDv8yq5UAI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX1Uiy+JQJE+aZ
 4q8rtIB7/6czqoM8xiKzLVOwIL8mN3zQX/aBdPdHoF417uNMtxbnOG6AzhSIMxdSNn0/J/5nlFA
 BjAX9vKVFpPsPyrw70rwyQOVPgn9cgamAvAUHhmt2rFQK4Quld5UpU7brxns7hS+BHlC+o2M9ah
 +SAZ0hr5eQMAzOERITgrSs63/TM9ZZhSDCjxzY5ooiOr0ya5TeTVTGi5cGhWOtAC++nGLrYdx8B
 ah4iTlb5ubiJJLHuUbkgBr+UNQu9UDwwTfuTOTBdeS95znXB/NPYn87VhM9hjtcSUP3a/fHJkYi
 4AXd6fm5XW0pupt9W7gIyryGe0ewlEE0COtuxkov011RsdmcB/0Mxq6eMzLcMzHarc8BlW7bnuE
 uc6EsNi12KPZIoFKj9TmRfeT3COZ8fnmFg+cyfFDMGF2D6m5+9JES9tiuI30SoJJ7cPRWAAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Use msm_dp_get_mst_intf_id() to get the intf id for the DP MST
controller as the intf_id is unique for each MST stream of each
DP controller.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 ++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 43 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 +-
 3 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7020098360e474ee149824a488d912a7ad8ed06a..75cc2d475440fcdc941aa9eb19e78a87e83b5f5f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2611,11 +2611,13 @@ uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc)
 
 static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				 struct dpu_kms *dpu_kms,
-				 struct msm_display_info *disp_info)
+				 struct msm_display_info *disp_info,
+				 int drm_enc_mode)
 {
 	int ret = 0;
 	int i = 0;
 	struct dpu_enc_phys_init_params phys_params;
+	u32 intf_id;
 
 	if (!dpu_enc) {
 		DPU_ERROR("invalid arg(s), enc %d\n", dpu_enc != NULL);
@@ -2658,9 +2660,18 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
 				i, controller_id, phys_params.split_role);
 
-		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+		if (drm_enc_mode == DRM_MODE_ENCODER_DPMST) {
+			intf_id = dpu_kms_get_mst_intf_id(dpu_kms, controller_id,
+							     disp_info->stream_id);
+			DPU_DEBUG("intf_id %d for disp_info->stream_id = %d\n", intf_id,
+				  disp_info->stream_id);
+			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_id);
+
+		} else {
+			phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
+								   disp_info->intf_type,
+								   controller_id);
+		}
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
@@ -2760,7 +2771,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	mutex_init(&dpu_enc->enc_lock);
 	mutex_init(&dpu_enc->rc_lock);
 
-	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
+	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info, drm_enc_mode);
 	if (ret) {
 		DPU_ERROR("failed to setup encoder\n");
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e030476dc4c69448886c29bcfe8ff3105949b129..f82dcf7c6dd31f078bbe4afe55d4667a4867f0b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -574,6 +574,49 @@ static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
 	return -EINVAL;
 }
 
+u32 dpu_kms_get_mst_intf_id(struct dpu_kms *dpu_kms, int controller_id, int stream_id)
+{
+	const struct dpu_mdss_cfg *catalog = dpu_kms->catalog;
+	int i;
+	int cnt = 0;
+	u32 intf_id = INTF_0;
+
+	/* The intf order in dpu_intf_cfg matches the mapping in the DP HPG.
+	 * DPU_8_4_0 - DP Controller intf to stream Mapping
+	 *
+	 * +-------------+----------+----------+----------+----------+
+	 * | stream_id   |    0     |    1     |    2     |    3     |
+	 * +-------------+----------+----------+----------+----------+
+	 * | DP0         | INTF_0   | INTF_3   | INTF_6   | INTF_7   |
+	 * | DP1         | INTF_4   | INTF_8   |          |          |
+	 * +-------------+----------+----------+----------+----------+
+	 *
+	 * DPU_9_2_0 - DP Controller intf to stream Mapping
+	 *
+	 * +-------------+----------+----------+
+	 * | Controller  |    0     |    1     |
+	 * +-------------+----------+----------+
+	 * | DP0         | INTF_0   | INTF_3   |
+	 * | DP1         | INTF_4   | INTF_8   |
+	 * | DP2         | INTF_6   | INTF_7   |
+	 * +-------------+----------+----------+
+	 */
+	for (i = 0; i < catalog->intf_count; i++) {
+		const struct dpu_intf_cfg *intf = &catalog->intf[i];
+
+		if (intf->type == INTF_DP && controller_id == intf->controller_id) {
+			if (cnt == stream_id) {
+				intf_id = intf->id;
+				break;
+			}
+
+			cnt++;
+		}
+	}
+
+	return intf_id;
+}
+
 static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index a57ec2ec106083e8f93578e4307e8b13ae549c08..388cd8f84fd579ce30a69989be5ac116bb727878 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -168,5 +168,5 @@ int dpu_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 
 unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
-
+u32 dpu_kms_get_mst_intf_id(struct dpu_kms *dpu_kms, int controller_id, int stream_id);
 #endif /* __dpu_kms_H__ */

-- 
2.34.1

