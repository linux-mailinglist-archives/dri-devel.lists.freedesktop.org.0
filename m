Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6FD9E6575
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B716B10E3F6;
	Fri,  6 Dec 2024 04:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ll8ihjNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16BA10E1E1;
 Fri,  6 Dec 2024 04:33:01 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HadcB005222;
 Fri, 6 Dec 2024 04:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s/1KNkGXIE6KkpVfJ9unxCwJXQDkmsLWHDcIn30laeI=; b=Ll8ihjNkT+JD1mVw
 USL8jV4w57NxqDEIsaLH6oeLNe+MdemtQfsnJAQOj5M9zGKomW5Mi7zb8Oqz5XDw
 kmkFAacq+obXMO1KB+BcZe3/Dxt+dEs/qZIHq7H6YOS8SRal6ielo/is05Ume02A
 OadqWfgs1uAHisfd/XbGSi3Me0hfcWZViSPHHKmXVY/Fr56xGWvkBGp+V++e4jYK
 70VjV4zLro3ZRQtUTDeF2bHR8gp+E3CLTyYXdCrMwh2Q9vSpQUHU4XroEkHKMbaT
 lVoqwdIQm74vkD4/uwaa+8W3yZk9tw69HvKS6ZR4fxyzXPs8VIuj6F6xdP/mgp0b
 9THj9Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba142k7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WV5L006046
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:31 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:31 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:44 -0800
Subject: [PATCH 13/45] drm/msm/dp: separate dp_display_prepare() into its
 own API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-13-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=3399;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=5tunbgTeyWOCAUj6E04fhgyo9/VnUforhGrZOvclA5g=;
 b=R8LJ2mmO4D3LJQNYESD5LPfufIy3rEtRucUa+ih8gZUnh0zBRoBX1XG3FYIv90GG3xlNSWMzs
 Yd7oT/HguV0BaGorSiWYqO8pJDSvL6IzRr0hhFD7uCo3moy9XtGJwBN
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4atnZcKPU-2mUHyJgnbmivcXkfzGEFrp
X-Proofpoint-ORIG-GUID: 4atnZcKPU-2mUHyJgnbmivcXkfzGEFrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=998 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030
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

dp_display_prepare() only prepares the link in case its not
already ready before dp_display_enable(). Hence separate it into
its own API.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 24 +++++++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2f8650d60202deaa90de1a5e0dd6d8bc50f09782..02282f58f1b31594601692b406215cee4ca41032 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1525,26 +1525,36 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *dp)
+void msm_dp_display_atomic_prepare(struct msm_dp *dp)
 {
 	int rc = 0;
-
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display, 0);
-
 	mutex_lock(&msm_dp_display->event_mutex);
 
 	rc = msm_dp_display_prepare(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
-		mutex_unlock(&msm_dp_display->event_mutex);
-		return;
 	}
 
+	mutex_unlock(&msm_dp_display->event_mutex);
+}
+
+void msm_dp_display_atomic_enable(struct msm_dp *dp)
+{
+	int rc = 0;
+
+	struct msm_dp_display_private *msm_dp_display;
+
+	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	if (dp->is_edp)
+		msm_dp_hpd_plug_handle(msm_dp_display, 0);
+
+	mutex_lock(&msm_dp_display->event_mutex);
+
 	if (dp->prepared) {
 		rc = msm_dp_display_enable(msm_dp_display);
 		if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 2a800164cd9c74c29db80dbad15a2dff9fcb93d6..46912a9855b512d9dc6a4edff91ffd21df46e22a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -44,6 +44,7 @@ void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *d
 void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
 void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
 void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_prepare(struct msm_dp *dp);
 void msm_dp_display_mode_set(struct msm_dp *dp,
 			     const struct drm_display_mode *mode,
 			     const struct drm_display_mode *adjusted_mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 4ef3f16a68890bc220d147ac3d04f53ef911f004..920392b3c688821bccdc66d50fb7052ac3a9a85a 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -103,6 +103,7 @@ static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->msm_dp_display;
 
+	msm_dp_display_atomic_prepare(dp);
 	msm_dp_display_atomic_enable(dp);
 }
 
@@ -210,6 +211,7 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
+	msm_dp_display_atomic_prepare(dp);
 	msm_dp_display_atomic_enable(dp);
 }
 

-- 
2.34.1

