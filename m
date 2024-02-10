Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A5F8501FA
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 02:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE071120DE;
	Sat, 10 Feb 2024 01:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="m/LnaZiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502501120DE;
 Sat, 10 Feb 2024 01:52:53 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41A1p7nu023619; Sat, 10 Feb 2024 01:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=9X9x++ZHykO+Kv+Lh/6v5pbxvgrhNu5HCyRLwD2MJ9o=; b=m/
 LnaZiYTBbkj2R5VO3fYncKl9Bo1iA/Fp8l/zRJccQEBQMQVOHOsi9ztpkhu1K+Bt
 qVQJ9bXmAbgQVMGTBVYS/NzhD/mHo2sA7bLpxNio6q+XsH2iEtt9nJzghJJNnA3n
 AdaYrZIzSZtEMAMXACtthhgl24YpJbknsVCiI+GPkkHTcKymTQxTsWyTcFv1Sx1F
 smDGFOzTiT6HHMdcw3XBPJBnjVqG5IO/V4JcE4YukStmjvM1qH1ezOJ9GuFEEgqT
 FYRQESjdmc/hGeHBmx/b8L6NB4xRDhnQKAtLO/6ou0pIqiGJGcbWXF8M9GML3SKq
 QfcRTyBEStxAJQKIWlQw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5ann2km0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41A1qoLr022598
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:50 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 9 Feb 2024 17:52:49 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v2 17/19] drm/msm/dpu: modify timing engine programming for
 YUV420 over DP
Date: Fri, 9 Feb 2024 17:52:08 -0800
Message-ID: <20240210015223.24670-18-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240210015223.24670-1-quic_parellan@quicinc.com>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oCGl61GUlzVl7bcK5p0PmwUcR5eV89vc
X-Proofpoint-GUID: oCGl61GUlzVl7bcK5p0PmwUcR5eV89vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_01,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=758
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402100012
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

Adjust the encoder timing engine setup programming in the case of video
mode for YUV420 over DP to accommodate CDM.

Changes in v2:
	- Move timing engine programming to this patch

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 3f102b2813ca8..fb46d907312a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -235,8 +235,9 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 {
 	struct drm_display_mode mode;
 	struct dpu_hw_intf_timing_params timing_params = { 0 };
+	struct dpu_hw_cdm *hw_cdm;
 	const struct dpu_format *fmt = NULL;
-	u32 fmt_fourcc = DRM_FORMAT_RGB888;
+	u32 fmt_fourcc;
 	unsigned long lock_flags;
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };
 
@@ -255,17 +256,21 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
 	drm_mode_debug_printmodeline(&mode);
 
-	if (phys_enc->split_role != ENC_ROLE_SOLO) {
+	fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
+
+	if (phys_enc->split_role != ENC_ROLE_SOLO || fmt_fourcc == DRM_FORMAT_YUV420) {
 		mode.hdisplay >>= 1;
 		mode.htotal >>= 1;
 		mode.hsync_start >>= 1;
 		mode.hsync_end >>= 1;
+		mode.hskew >>= 1;
 
 		DPU_DEBUG_VIDENC(phys_enc,
-			"split_role %d, halve horizontal %d %d %d %d\n",
+			"split_role %d, halve horizontal %d %d %d %d %d\n",
 			phys_enc->split_role,
 			mode.hdisplay, mode.htotal,
-			mode.hsync_start, mode.hsync_end);
+			mode.hsync_start, mode.hsync_end,
+			mode.hskew);
 	}
 
 	drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
@@ -273,6 +278,9 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	fmt = dpu_get_dpu_format(fmt_fourcc);
 	DPU_DEBUG_VIDENC(phys_enc, "fmt_fourcc 0x%X\n", fmt_fourcc);
 
+	hw_cdm = phys_enc->hw_cdm;
+	if (hw_cdm)
+		intf_cfg.cdm = hw_cdm->idx;
 	intf_cfg.intf = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
-- 
2.39.2

