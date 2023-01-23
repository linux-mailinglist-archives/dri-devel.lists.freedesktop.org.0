Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA7D6784A0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1607C10E538;
	Mon, 23 Jan 2023 18:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CE810E531;
 Mon, 23 Jan 2023 18:24:57 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NHTZ02001422; Mon, 23 Jan 2023 18:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Ji+FAppXotgL8bQEuDA6ylS1qPj07DFCCie3YVYuhB0=;
 b=SgmSWiSE5d1Im02FsNjUYtcNdN8vxFeB2xTzRb4OHuVCKsicb9B7kuIw5lignW6drkoV
 qHqS4gO4SkBOI4+NJ7KOrpTcfFdPdLBQyqgJZD4mLpZUtWtrKolA1By4frV7sz5IqYjV
 NT4jVipxSM5J8iwo7p6gUSoxSCEaHK+ScIGDitDChZDOw182T0oEd8hDPgejeh+Yd5xZ
 O0gbHU7y5W4WHLuHvZhgq509FXQKS1BUB86zXwSSGSsEmNV/0aDZjMf7G137WLT5NWVU
 pHp3s4e3wmnV41nlfBU8R2aWuZ2Toj2DM3JIOSPsnSBVDX052dUV4AD1GBZ4ZRGOk3Jj mQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89f5bjw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIOp26012292
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:51 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:24:51 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 03/14] drm/msm/dp: add configure mainlink_levels base on
 lane number
Date: Mon, 23 Jan 2023 10:24:23 -0800
Message-ID: <1674498274-6010-4-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0gKUgY-g8gIjlMS6356gKFQEaaB2kBOL
X-Proofpoint-GUID: 0gKUgY-g8gIjlMS6356gKFQEaaB2kBOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230176
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mainlink_levels determined when two actions to take place by hardware,
a new BS sequence due to start of video and a static HW MVID is sent
to panel. This patch add function to configure mainlink level properly
base on lane number.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 37 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h |  4 +++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 ++++
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 676279d..7ac37d8 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017-2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021. Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
@@ -359,6 +360,40 @@ void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
 			ln_mapping);
 }
 
+void dp_catalog_ctrl_mainlink_levels(struct dp_catalog *dp_catalog,
+					u8 lane_cnt)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	u32 mainlink_levels, safe_to_exit_level = 14;
+
+	switch (lane_cnt) {
+	case 1:
+		safe_to_exit_level = 14;
+		break;
+	case 2:
+		safe_to_exit_level = 8;
+		break;
+	case 4:
+		safe_to_exit_level = 5;
+		break;
+	default:
+		drm_dbg_dp(catalog->drm_dev, "setting the default safe_to_exit_level=%u\n",
+				safe_to_exit_level);
+		break;
+	}
+
+	mainlink_levels = dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels &= 0xFE0;
+	mainlink_levels |= safe_to_exit_level;
+
+	drm_dbg_dp(catalog->drm_dev, "mainlink_level=0x%x, safe_to_exit_level=0x%x\n",
+		mainlink_levels, safe_to_exit_level);
+
+	dp_write_link(catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
+}
+
 void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
 						bool enable)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1f717f4..990c162 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2017-2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021. Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #ifndef _DP_CATALOG_H_
@@ -92,6 +93,7 @@ u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state);
 void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
 void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_mainlink_levels(struct dp_catalog *dp_catalog, u8 lane_cnt);
 void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index dd26ca6..959a78c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -161,6 +161,8 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
 	u32 cc, tb;
 
 	dp_catalog_ctrl_lane_mapping(ctrl->catalog);
+	dp_catalog_ctrl_mainlink_levels(ctrl->catalog,
+				ctrl->link->link_params.num_lanes);
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
 
 	dp_ctrl_config_ctrl(ctrl);
@@ -1296,6 +1298,8 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 {
 	int ret = 0;
 
+	dp_catalog_ctrl_mainlink_levels(ctrl->catalog,
+				ctrl->link->link_params.num_lanes);
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
 
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

