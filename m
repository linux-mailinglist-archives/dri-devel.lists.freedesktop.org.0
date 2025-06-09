Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7BFAD1D4B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BBA10E2B3;
	Mon,  9 Jun 2025 12:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="h8YTqnLg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A25C10E2B3;
 Mon,  9 Jun 2025 12:24:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599LIU1029821;
 Mon, 9 Jun 2025 12:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6i/d4jWA7tfbOkZHja+gm+7k5OvPocLWjPhcpqvGPc0=; b=h8YTqnLgk6/y4vsd
 TKvmeyFoJe+AB0Buu6Ec2eOY+AZTsQZiyrEM0vqQq76Zyc/+SeNXjMKrXqzgpVj8
 UHQPkK5VG4Iq6THrUnXNyGuXi7+oXxNo/vbznlHBYLFTLTOULslo+lLW7/EKN997
 mXPicfAPoRhXVmtiJgsIeUitXKlk0v/hCJl9zmumR+3+oxylSivlcGqc7lkVzvTb
 OGm3PkOf1WQhkn+WcRoOyz6eenSISvgfgGk1cQW8+16G07wYW4DzH+zqVWR0RxCd
 E9j/Z3xuVb9110arY95xXyw8jjDe6shXBgs9rI/VC7F7EDBjJQmg4norCCsOrE9T
 lqoh1g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11x5mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CNoed012979
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:23:50 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:46 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:35 +0800
Subject: [PATCH v2 16/38] drm/msm/dp: add support to program mst support in
 mainlink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-16-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471757; l=3799;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=Z3O5umx6BeZC/zbUSLRyOp2OdTcLuJDoa4UEBkmiYys=;
 b=Sk/c0J78cOY0qPRPe8BHTaQe1RaE/U50PZPZAE2rz3r7az/9ahOzVEWc2hHEsw6MVYxb3jKkj
 WdMekXlNOFzDcbeaLnL68VFyFcLs2hI/8nBCeioHgM8pz9XoDJSSIIU
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: d9MnM6f4TOe9qpFcq5K855LDglPSgATe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX8vvT28AsL4Az
 DBH21zkMxXW3Ow+M5wy4qSNgFHxjiW2ysK/GgTqjGrlnLSZLxPzLBzsQCnNe6W6iByPJAxXmt3A
 u3jwgorPA3DHwZTqz+3dusPNnWyoHqeHJUPz0NJy3YvzFn08NG8MY9io95Tl9yhvCFitsXsjt5/
 mQTzD8ttUJ0cp7PGiPvSwEcw1EeFmEwvQ/Wnjzgu0wAqUV2kXDvsJ7eMEBxf0iVeQ8Wb2INpt+a
 X9XGBuLutTdtG5dWnvEWHzJgSBrEoUjTgLobcifuHJrEghj8Y9EkriCBKFfuL/6P7HO3fNaVpdy
 pAj3DXrVTFFZvn1pGskYOpbJshjWSTxMifoIXBTU3Uh4d6mcOjwgDfO8VMD2CeE9aspucxEy7b+
 aU4GVMmnXR5WPJNDpIsm1GUZJRKkF1oltw6bM+1vy9wodj/nrb7gHjVhXDZ7qbI+8t28Uthf
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846d262 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=70zgNBqiKpQYKxUpz5MA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: d9MnM6f4TOe9qpFcq5K855LDglPSgATe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=856 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
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

Add support to program the MST enabled bit in the mainlink
control when a mst session is active and disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 ++++
 drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
 4 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index e6920008356991ad0c023664d5e286433ccf5d0b..ff0fb742d122646dd45fcd868a61532c630419d1 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -407,6 +407,23 @@ void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catal
 	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, val);
 }
 
+void msm_dp_catalog_mst_config(struct msm_dp_catalog *msm_dp_catalog, bool enable)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+							      struct msm_dp_catalog_private,
+							      msm_dp_catalog);
+
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
 						bool enable)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 88ef98c9b0cb2d273a0c190ff7b2783b5e254937..e2c5e0235834527998d40caddd1649b434e1f180 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -130,5 +130,6 @@ void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_
 /* DP MST APIs */
 void msm_dp_catalog_trigger_act(struct msm_dp_catalog *dp_catalog);
 bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *dp_catalog);
+void msm_dp_catalog_mst_config(struct msm_dp_catalog *dp_catalog, bool enable);
 
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 0088fefd88e517e01bb66f02661c877173181d8a..64d9862841a22b8298c6e4eb6e488834e38ddcd0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -184,6 +184,9 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
 	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
 
+	if (ctrl->mst_active)
+		msm_dp_catalog_mst_config(ctrl->catalog, true);
+
 	msm_dp_ctrl_config_ctrl(ctrl, msm_dp_panel);
 
 	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
@@ -2167,6 +2170,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy = ctrl->phy;
 
 	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	msm_dp_catalog_mst_config(ctrl->catalog, false);
 
 	ctrl->mst_active = false;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index b993487925dbd78e8f78e09fbf52ab38f268b71a..f079c1132d5aa9a97a0bef314e31f64977d7ffc4 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -109,6 +109,7 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_MST_EN			(0x04000100)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.34.1

