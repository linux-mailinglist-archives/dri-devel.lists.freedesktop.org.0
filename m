Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C2A74BA25
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723BC10E622;
	Fri,  7 Jul 2023 23:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185B510E61F;
 Fri,  7 Jul 2023 23:52:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 367N5Df7028102; Fri, 7 Jul 2023 23:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=dAbBg13hz7CILJZIJ+JIt6hR9JC3RmK2RRjZGrVbRaY=;
 b=naN51xgxEC0LMubv5hCUvanjsvf5pZJlCVq9oy83xs+TkEmLp6zEwPHXIcQ8Y1PLIPTr
 QAzzotEevQY4odRkc44IHEjLICZjAK80R7uJYw0lf3kryqaA+zhb0yHJ6IMEXV4YnUkb
 r8wKUmC2/6hIa0Fdr3InFxOBS1ChCwQazIxsJWsH85tHME2jDRv82WF4V41YVVFVuuQj
 BGt78f2ZfnTRh0ehdqffW7Lufdp9vArNovePWsi5sWzx1vowNjfF5GiOAwxX4uryKgAQ
 VWtGT29/ojUjrCVBlr88eeeowiK9Ew3fB+3GlFqUj3KUhzGulS/Qw9WLCNSxz/G/wjhT kA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpgud1nj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 23:52:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 367Nqo3H008768
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Jul 2023 23:52:50 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 7 Jul 2023 16:52:49 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 1/5] drm/msm/dp: remove pm_runtime_xxx() from dp_power.c
Date: Fri, 7 Jul 2023 16:52:19 -0700
Message-ID: <1688773943-3887-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: tDWCyFgzQHXggdZnctA_h8FpnOiX3uo8
X-Proofpoint-GUID: tDWCyFgzQHXggdZnctA_h8FpnOiX3uo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_14,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070217
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
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since both pm_runtime_resume() and pm_runtime_suspend() are not
populated at dp_pm_ops. Those pm_runtime_get/put() functions within
dp_power.c will not have any effects in addition to increase/decrease
power counter. Also pm_runtime_xxx() should be executed at top
layer.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 5cb84ca..ed2f62a 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -152,8 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
-	pm_runtime_enable(power->dev);
-
 	return dp_power_clk_init(power);
 }
 
@@ -162,8 +160,6 @@ void dp_power_client_deinit(struct dp_power *dp_power)
 	struct dp_power_private *power;
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
-
-	pm_runtime_disable(power->dev);
 }
 
 int dp_power_init(struct dp_power *dp_power)
@@ -173,11 +169,7 @@ int dp_power_init(struct dp_power *dp_power)
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
-	pm_runtime_get_sync(power->dev);
-
 	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
-	if (rc)
-		pm_runtime_put_sync(power->dev);
 
 	return rc;
 }
@@ -189,7 +181,6 @@ int dp_power_deinit(struct dp_power *dp_power)
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
 	dp_power_clk_enable(dp_power, DP_CORE_PM, false);
-	pm_runtime_put_sync(power->dev);
 	return 0;
 }
 
-- 
2.7.4

