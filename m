Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C335B228E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 17:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF5C10EB42;
	Thu,  8 Sep 2022 15:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F75910EB3D;
 Thu,  8 Sep 2022 15:38:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288DZ9hU030911;
 Thu, 8 Sep 2022 15:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=Yv0FuTQbVv84IVdZh7TlEzUrjVusKhcsqSV7puFnrF4=;
 b=Tp2BAGNs954+gUTqEQW8SFkVM0McXDgBV4SorWvCW1GSJz3BIK20yBj6iR6h0vz9xPbc
 fZ84FOe3PIPnPAmNxVvfeY8kFnNyQlYqYyioWv0Ip4v+ZU5Vv/LtAgsYHuHleHZ2jK5z
 IMFvaM2m02NIfBdtRyUpoCwGepIPkTL0af0NhBLYCw1EDJkLn4lG8brhIe862nJnRBeM
 CAvU9S7o+mW0Qq4ieQ7XDyr88ebFsioTAP7l1P0Kuvj3RTDOCAKvjWhpb574nPiXAZt+
 XjNMp18tfTcmlW9aEqVfnG4vP+rDVZuREtCm0LppviudpdP4wBDe1ocljuxmCUTu0U44 4A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jfeuurvr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 15:38:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 288FciVQ020803
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Sep 2022 15:38:44 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 8 Sep 2022 08:38:43 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v3] drm/msm/dp: cleared DP_DOWNSPREAD_CTRL register before
 start link training
Date: Thu, 8 Sep 2022 08:38:36 -0700
Message-ID: <1662651516-30283-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: O0BQrB8OKZgfOMgkhGtdW3SswoLNLfVF
X-Proofpoint-GUID: O0BQrB8OKZgfOMgkhGtdW3SswoLNLfVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_10,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080057
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DOWNSPREAD_CTRL (0x107) shall be cleared to 0 upon power-on reset or an
upstream device disconnect. This patch will enforce this rule by always
cleared DOWNSPREAD_CTRL register to 0 before start link training. At rare
case that DP MSA timing parameters may be mis-interpreted by the sink
which causes audio sampling rate be calculated wrongly and cause audio
did not work at sink if DOWNSPREAD_CTRL register is not cleared to 0.
This patch also make sure bring sink out of D3 power-down mode into D0
(normal operation mode) successfully by retrying 3 times.

Changes in v2:
1) fix spelling at commit text
2) merge ssc variable into encoding[0]

Changes in v3:
-- correct spelling of DOWNSPREAD_CTRL
-- replace err with len of ssize_t

Fixes: 154b5a7da0fd ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 13 +++++--------
 drivers/gpu/drm/msm/dp/dp_link.c | 21 ++++++++++++---------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index ab6aa13..2c74c59 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1245,8 +1245,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 {
 	int ret = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
-	u8 encoding = DP_SET_ANSI_8B10B;
-	u8 ssc;
+	u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
 	u8 assr;
 	struct dp_link_info link_info = {0};
 
@@ -1258,13 +1257,11 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 
 	dp_aux_link_configure(ctrl->aux, &link_info);
 
-	if (drm_dp_max_downspread(dpcd)) {
-		ssc = DP_SPREAD_AMP_0_5;
-		drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
-	}
+	if (drm_dp_max_downspread(dpcd))
+		encoding[0] |= DP_SPREAD_AMP_0_5;
 
-	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
-				&encoding, 1);
+	/* config DOWNSPREAD_CTRL and MAIN_LINK_CHANNEL_CODING_SET */
+	drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, encoding, 2);
 
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
 		assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 36f0af0..7b5ecf5 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -49,23 +49,26 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
 					struct dp_link_info *link)
 {
 	u8 value;
-	int err;
+	ssize_t len;
+	int i;
 
 	if (link->revision < 0x11)
 		return 0;
 
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
+	len = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
+	if (len < 0)
+		return len;
 
 	value &= ~DP_SET_POWER_MASK;
 	value |= DP_SET_POWER_D0;
 
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	usleep_range(1000, 2000);
+	/* retry for 1ms to give the sink time to wake up */
+	for (i = 0; i < 3; i++) {
+	        len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
+		usleep_range(1000, 2000);
+		if (len == 1)
+			break;
+	}
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

