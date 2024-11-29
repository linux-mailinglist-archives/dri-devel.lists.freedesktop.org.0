Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2DA9DC247
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 11:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D3410EDE3;
	Fri, 29 Nov 2024 10:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="H8YhtMSo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA3F10EDBD;
 Fri, 29 Nov 2024 07:59:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASNS0BH008537;
 Fri, 29 Nov 2024 07:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 II2/7psObqJRlsSmixY+Ggt+3kD1fPFPDHteJnLJoHc=; b=H8YhtMSofNZ6wBac
 xEJmiE9/FZ/HnqhWSLDYINaSimBS9JGLL1i76U46rJ78/sQ8ccGYuNhxMBTWMWdx
 1IZxG+eKQ79WAcBNEgYhXQP9HPmtCmaIyB7BhqRLatxKRCda26gaJR4i4ojv7ZB7
 kEltlPEvszeoEmlQCWH/6Kn6LfE5IjCoV1UYmSiH/rqQ/7oihlw2OraWIuTv+zzK
 QnxW1T/KSERx8T5LxTfwfjIIkrkalmY3lyTD7znSteQiNZ1RD5WDMrR6s/56/5WR
 ej5nP7l9/3MK0vXTECuR0n0h+5tuU5OUdoaWiwwPISJPwfjiMmD3oIX9Fu7hUbGk
 WHQwbg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xw4uk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 07:59:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT7xUot002405
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 07:59:30 GMT
Received: from szioemm-lnxbld002.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 23:59:23 -0800
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Date: Fri, 29 Nov 2024 15:57:47 +0800
Subject: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, <quic_lliu6@quicinc.com>,
 <quic_fangez@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-gpio@vger.kernel.org>, Xiangxu Yin <quic_xiangxuy@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732867104; l=2567;
 i=quic_xiangxuy@quicinc.com; s=20241125; h=from:subject:message-id;
 bh=8/3LW4+HPMUH3aM6Hz1Gx/rY/UZuscAxr5Yaled+Z7o=;
 b=G3+ykvG9P/7rP22hO6S3tlsV/sAxb9L6sNlRmGe1v6SRTHRQd/4A7dZQFnEDkI9H1iMJIWDpA
 YoDSHhmniFEBhv6kKCHT07eU5pb/szmuB54w515UGd7NOEWik1Oh+Kb
X-Developer-Key: i=quic_xiangxuy@quicinc.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rYGwnjnVYvOgnDwaNjXYrSxj40c4jqrs
X-Proofpoint-ORIG-GUID: rYGwnjnVYvOgnDwaNjXYrSxj40c4jqrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290064
X-Mailman-Approved-At: Fri, 29 Nov 2024 10:41:17 +0000
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

Add a mechanism to retry Link Training 2 by lowering the pattern level
when the link training #2 first attempt fails. This approach enhances
compatibility, particularly addressing issues caused by certain hub
configurations.

Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 49c8ce9b2d0e57a613e50865be3fe98e814d425a..b1862294cb98c9f756b0108b7670cb42de37bae4 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1220,7 +1220,7 @@ static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
 }
 
 static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
-			int *training_step)
+			int *training_step, bool downgrade)
 {
 	int tries = 0, ret = 0;
 	u8 pattern;
@@ -1243,6 +1243,28 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 		state_ctrl_bit = 2;
 	}
 
+	/*
+	 * DP link training uses the highest allowed pattern by default.
+	 * If it fails, the pattern is downgraded to improve cable and monitor compatibility.
+	 */
+	if (downgrade) {
+		switch (pattern) {
+		case DP_TRAINING_PATTERN_4:
+			pattern = DP_TRAINING_PATTERN_3;
+			state_ctrl_bit = 3;
+			break;
+		case DP_TRAINING_PATTERN_3:
+			pattern = DP_TRAINING_PATTERN_2;
+			state_ctrl_bit = 2;
+			break;
+		default:
+			break;
+		}
+	}
+
+	drm_dbg_dp(ctrl->drm_dev, "pattern(%d) state_ctrl_bit(%d) downgrade(%d)\n",
+		pattern, state_ctrl_bit, downgrade);
+
 	ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
 	if (ret)
 		return ret;
@@ -1311,10 +1333,14 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	/* print success info as this is a result of user initiated action */
 	drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
 
-	ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
+	ret = msm_dp_ctrl_link_train_2(ctrl, training_step, false);
 	if (ret) {
-		DRM_ERROR("link training #2 failed. ret=%d\n", ret);
-		goto end;
+		drm_dbg_dp(ctrl->drm_dev, "link training #2 failed, retry downgrade.\n");
+		ret = msm_dp_ctrl_link_train_2(ctrl, training_step, true);
+		if (ret) {
+			DRM_ERROR("link training #2 failed. ret=%d\n", ret);
+			goto end;
+		}
 	}
 
 	/* print success info as this is a result of user initiated action */

-- 
2.25.1

