Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8899E6578
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B8710E3D7;
	Fri,  6 Dec 2024 04:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kV5psZZT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC97910E3D5;
 Fri,  6 Dec 2024 04:33:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaNsg031094;
 Fri, 6 Dec 2024 04:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d/9ZSTTXtRnXmIF+33BrFbE+fsjXNHdjAdnU/aTP228=; b=kV5psZZTpfZE8tks
 7/r2XAlFUS0Gl0ABtGTDhqdouI6Ggf1w++mXmiG0AKEcqMZY+p10jUsBCSc7BZXV
 Jg15GAiMxfGMHYaRZVILJdcTP+crM2OutAQsXF+b6IsqgE/izr6iummUcAA+8YoG
 PA8LaS9ltY8MC+0Ow8ROkEXlcYfa2W8gYTzAQUt7JSkOVv1HHPYeTG/uD2fWEsN0
 d/WHRH9eWUvTCqea6ROyKJzbiLYwPTqxhQbCww2CepKAW3mmqY4S+p1YmIHu9Tc+
 tPGu3/29Jjp3a6LdWpiOQQ9nGShQ4/wB8WIODigRmcK6qvBBuNX542mR2mRHNwI/
 bNOYzg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be171vk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WQP4022077
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:26 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:26 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:35 -0800
Subject: [PATCH 04/45] drm/msm/dp: split msm_dp_panel_read_sink_caps() into
 two parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-4-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=3912;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=O7K9KXynHx+HKkM3vcUTEnz5fNebROZsrmh2ErueRW0=;
 b=Exey94bSXEYAIOmzUmA6zqiYmTIAezXmg8Fzf7KCmeIJ8w/Jmx2/OrF6mqm5u49yNOraptHOn
 F+gn3ue+wznCyxelRWzTJBBbGiNr1pX0aAcOMXn7jdwAMqddFMP9ZMM
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Td-a8zZiD6qn25SiiSuQ3QqK0gAoaNg1
X-Proofpoint-ORIG-GUID: Td-a8zZiD6qn25SiiSuQ3QqK0gAoaNg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

In preparation of DP MST where link caps are read for the
immediate downstream device and the edid is read through
sideband messaging, split the msm_dp_panel_read_sink_caps() into
two parts which read the link parameters and the edid parts
respectively.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  6 +++++-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 25 +++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  5 ++++-
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index be26064af9febf4f4761e21ea7db85ab1ac66081..052db80c6a365f53c2c0a37d3b69ea2b627aea1f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -372,7 +372,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
+	if (rc)
+		goto end;
+
+	rc = msm_dp_panel_read_edid(dp->panel, connector);
 	if (rc)
 		goto end;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 5d7eaa31bf3176566f40f01ff636bee64e81c64f..d277e9b2cbc03688976b6aa481ee724b186bab51 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -108,8 +108,8 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 	return min_supported_bpp;
 }
 
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
-	struct drm_connector *connector)
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
+				struct drm_connector *connector)
 {
 	int rc, bw_code;
 	int count;
@@ -150,8 +150,19 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 
 	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
 					 msm_dp_panel->downstream_ports);
-	if (rc)
-		return rc;
+	return rc;
+}
+
+int msm_dp_panel_read_edid(struct msm_dp_panel *msm_dp_panel, struct drm_connector *connector)
+{
+	struct msm_dp_panel_private *panel;
+
+	if (!msm_dp_panel || !connector) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
 	drm_edid_free(msm_dp_panel->drm_edid);
 
@@ -163,13 +174,11 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 		DRM_ERROR("panel edid read failed\n");
 		/* check edid read fail is due to unplug */
 		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
-			rc = -ETIMEDOUT;
-			goto end;
+			return -ETIMEDOUT;
 		}
 	}
 
-end:
-	return rc;
+	return 0;
 }
 
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7a38655c443af597c84fb78c6702b2a3ef9822ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -59,7 +59,10 @@ void msm_dp_panel_dump_regs(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
-			u32 mode_pclk_khz);
+			      u32 mode_pclk_khz);
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *dp_panel,
+				struct drm_connector *connector);
+int msm_dp_panel_read_edid(struct msm_dp_panel *dp_panel, struct drm_connector *connector);
 int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
 void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);

-- 
2.34.1

