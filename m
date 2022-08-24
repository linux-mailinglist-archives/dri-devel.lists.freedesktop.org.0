Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 817455A0959
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2991D892B;
	Thu, 25 Aug 2022 07:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E30D8968;
 Thu, 25 Aug 2022 07:00:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O97PtM006553;
 Wed, 24 Aug 2022 17:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=MzU273TktHXkRwWIb+2Y9uuq8kbCxOhMtE+FhhNuK9Y=;
 b=fX14MrY4+U7ygtT7rWbSLybKZClDZYFi0r4LeEKn52yOdEskK+TM8zw3v2fELz5IHH1g
 2Fkx/5RgNQp8P0rvZa+jF3Il5IK0Jozyd/WR47jFVYRy+7wpymtIksKOLMYzWChppiyJ
 kKsB7tJ2qarxwYIKfgqBLIYdpbpOwOntrbGpPYZbGtJ2yjmQFy+a0rRIhoOTumdtST5A
 VS5vUzpJYtjP0ZfjcJ8iVe0oIALrDgwSX0HBt0uoLd5TyiGdURx2+Zy1nf4hvd6APSSp
 3F9Tyur03j5uprJx3cmN9PN1n0KWagGWXYvD5xfnew4n1QVmEgJhngMeZI96KbLGvGut +g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pnc3a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 17:22:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27OHMdS5004742
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 17:22:39 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 24 Aug 2022 10:22:38 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v2] drm/msm/dp: correct 1.62G link rate at
 dp_catalog_ctrl_config_msa()
Date: Wed, 24 Aug 2022 10:22:31 -0700
Message-ID: <1661361751-2173-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 09WZY72ZBAmNfTUXIlwYFAx3dFXwhEbQ
X-Proofpoint-ORIG-GUID: 09WZY72ZBAmNfTUXIlwYFAx3dFXwhEbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_09,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240064
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

At current implementation there is an extra 0 at 1.62G link rate which cause
no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
This patch delete the extra 0 to have mvid and nvid be calculated correctly.

Changes in v2:
-- fix Fixes tag's text

Fixes: 937f941ca06f  ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
eviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7257515..676279d 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -431,7 +431,7 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 
 	if (rate == link_rate_hbr3)
 		pixel_div = 6;
-	else if (rate == 1620000 || rate == 270000)
+	else if (rate == 162000 || rate == 270000)
 		pixel_div = 2;
 	else if (rate == link_rate_hbr2)
 		pixel_div = 4;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

