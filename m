Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB0F9E1045
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 01:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDDC10E89C;
	Tue,  3 Dec 2024 00:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Hvcw3jKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9431A10E883;
 Tue,  3 Dec 2024 00:39:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2KU1xK011334;
 Tue, 3 Dec 2024 00:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CGAy285+Ap8X45IoJ32yK9EFvGsvP/RImqPBvNwlEHM=; b=Hvcw3jKSWNnC3B3j
 NwjSUsmcifRxvcXkvNyI6Pzw959GIRT74vSAbhekXW4L+GMWdaH8qKU+KNrsO1Nu
 AMqvqUFX/zkqJjy17MTolrzeVcNbMDMI/lHQ5ZL7qr7Q+ysmTzX2NxyXWzN7a65F
 iDwpSkS2X4LC/S+O19hln7TPCVbursFQTsX3rbQLnwT3m2l+cqnbRyg0Z8AGP7yr
 1s47JhKQvP2bOh40QOMtStVIbKdPTxDwO8cdS03u0ttjziFUuRMlbYYamwdtc2kw
 6/6ibYkgDKsQDSBhU2Eqw2fiu+7hUlZElxU6/7RKkK6Fd9EYYxDvEGY+daVk2hj7
 E4o3rg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mpb9m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 00:39:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B30dMhG020557
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Dec 2024 00:39:22 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 16:39:21 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 16:39:03 -0800
Subject: [PATCH 4/4] drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-hpd_display_off-v1-4-8d0551847753@quicinc.com>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
In-Reply-To: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, Stephen Boyd <swboyd@chromium.org>,
 "Doug Anderson" <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 "Bjorn Andersson" <quic_bjorande@quicinc.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733186360; l=1725;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=JDeyPOy+yLJYgNCcXbssRDVsV9iiD2C0BptxDxcCDCQ=;
 b=+lG1RLKkdCSVtkJ1BBC6V1q7APgWmqraYICOUfKQBxwNGTEE7RhQyEovD1Vhn4Ms8/PHPlbzk
 EyXdKGQBTy1CuoEsN3OETWoY7kTG0GAKYDuM5pFtXfKfl+bycEgKYiz
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _5LUvbaDvYd4A2fVPts6TaBdGveGLhu_
X-Proofpoint-GUID: _5LUvbaDvYd4A2fVPts6TaBdGveGLhu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030002
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

ST_DISPLAY_OFF check in msm_dp_bridge_atomic_enable() is used to check
that if the display was disabled while still hotplugged, phy needs
to be re-initialized. This can be replaced with a different check as
it just means the hpd_state was still ST_CONNECTED but without display
being powered on. Replace the ST_DISPLAY_OFF check with a combination
of connected and power_on checks.

Since all consumers of ST_DISPLAY_OFF have now been removed,
drop ST_DISPLAY_OFF from the list of hpd_states as technically
this was never a 'hpd' state anyway.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 831876aa5b35..340366bdb277 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -48,7 +48,6 @@ enum {
 	ST_MAINLINK_READY,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
-	ST_DISPLAY_OFF,
 };
 
 enum {
@@ -1522,7 +1521,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	state =  msm_dp_display->hpd_state;
 
-	if (state == ST_DISPLAY_OFF) {
+	if (state == ST_CONNECTED && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
@@ -1580,8 +1579,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	} else {
-		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);

-- 
2.34.1

