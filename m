Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067560D9DA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 05:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B1D10E425;
	Wed, 26 Oct 2022 03:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4C110E307;
 Wed, 26 Oct 2022 03:26:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q3FK6S020793;
 Wed, 26 Oct 2022 03:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=yxO68mTGN7QEmF/+uOr86fS3O3e4hbYTA2qgAVwlmt0=;
 b=PXg8qfl3kJy1+x1LzqWV+3cAY69kFLK0nN+/b81tw7kpLewUF8qzmKdqrgzyBPeOWybi
 EPSQZ8TApe64aSCJ+hyyv63oiJvwAfK7aU3LI45NUzAU2W92R/8WlK8RzAd9lDVaFWiq
 qUg6c+Gh8zkyZgTr3tOEyAQKkEutX+3TD+Z+aqN+ZI5QQ9coq5XlWo61Eg/AupfFz228
 RyAGbaMIqqR/Bom+IfuLq9Zk8lgSUtyAcwvyTsOI7TG/iDX5qpk4ElUA0qMSi5gdp9lN
 fvN6ysDYKEX76JUm30x6vD017QlT6V4QXt2/5N9jvrwbhwSybShraNAJwm/b1TliqEAU ng== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kc8m3qqpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 03:26:37 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29Q3Qa9A011476
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 03:26:36 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 25 Oct 2022 20:26:35 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 08/12] drm/msm/dp: Don't enable HPD interrupts for edp
Date: Tue, 25 Oct 2022 20:26:20 -0700
Message-ID: <20221026032624.30871-9-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221026032624.30871-1-quic_bjorande@quicinc.com>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jMVdLQoisdVlVgy-15DnaC9dkct0hONv
X-Proofpoint-GUID: jMVdLQoisdVlVgy-15DnaC9dkct0hONv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_15,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260016
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Kuogee
 Hsieh <quic_khsieh@quicinc.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Most instances where HPD interrupts are masked and unmasked are guareded
by the presence of an EDP panel being connected, but not all. Extend
this to cover the last few places, as HPD interrupt handling is not used
for the EDP case.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---

Changes since v2:
- None

 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a4563a0753b0..3d365950de0f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -610,8 +610,10 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* enable HDP irq_hpd/replug interrupt */
-	dp_catalog_hpd_config_intr(dp->catalog,
-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog,
+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
+					   true);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
@@ -651,8 +653,10 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 			dp->dp_display.connector_type, state);
 
 	/* disable irq_hpd/replug interrupts */
-	dp_catalog_hpd_config_intr(dp->catalog,
-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, false);
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog,
+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
+					   false);
 
 	/* unplugged, no more irq_hpd handle */
 	dp_del_event(dp, EV_IRQ_HPD_INT);
@@ -678,7 +682,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* disable HPD plug interrupts */
-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
 
 	/*
 	 * We don't need separate work for disconnect as
-- 
2.37.3

