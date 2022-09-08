Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295E55B285E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 23:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA98D10E6D7;
	Thu,  8 Sep 2022 21:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F1210E6D4;
 Thu,  8 Sep 2022 21:18:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288Ju1qM019269;
 Thu, 8 Sep 2022 21:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=w/wD8BcUtkpwAsqfRAeRE4enhVaNgSTfXYBMfuE5VC4=;
 b=LtENIrmiFnUiMdUDwUNhGDKyKvNdMXtnQLukf8CIZ87Pz60QpyC6SpHf+EE2g6pybTlY
 QI+B1gfVtKZw0F5zBnGTZo0AKnGYWt9/4lTarjgPyID3xp9V0JYwuoURZj3z316ln1iK
 KigU/bHHnDFwAd4y+Qu27XKaribOyMCj05KWXieAxyS8OtfEYqGuaVmlI7EKejrgQ7rc
 K5sFd38AHBseY+U+bOwvLpX7G4leHXEPGTB3Cth0sOQhE+Ldq0ED8J9OZiqt1kMpy27S
 6diNZRq4fq8vUMx9eUVLwSnslD6fVBGz5rdbzWF2MPYLtB+rwaxVMp53bm32dnoIoywJ iw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jer1x673p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 21:18:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 288LIowu000622
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Sep 2022 21:18:50 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 8 Sep 2022 14:18:49 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v4 1/2] drm/msm/dp: cleared DP_DOWNSPREAD_CTRL register before
 start link training
Date: Thu, 8 Sep 2022 14:18:36 -0700
Message-ID: <1662671917-17194-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1662671917-17194-1-git-send-email-quic_khsieh@quicinc.com>
References: <1662671917-17194-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fYTNsKOWfFy7OREgKdznfrTktV96SSGj
X-Proofpoint-GUID: fYTNsKOWfFy7OREgKdznfrTktV96SSGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_12,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209080076
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

DOWNSPREAD_CTRL (0x107) shall be cleared to 0 upon power-on reset or an
upstream device disconnect. This patch will enforce this rule by always
cleared DOWNSPREAD_CTRL register to 0 before start link training. At rare
case that DP MSA timing parameters may be mis-interpreted by the sink
which causes audio sampling rate be calculated wrongly and cause audio
did not work at sink if DOWNSPREAD_CTRL register is not cleared to 0.

Changes in v2:
1) fix spelling at commit text
2) merge ssc variable into encoding[0]

Changes in v3:
-- correct spelling of DOWNSPREAD_CTRL
-- replace err with len of ssize_t

Changes in v4:
-- split into 2 patches

Fixes: 154b5a7da0fd ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

