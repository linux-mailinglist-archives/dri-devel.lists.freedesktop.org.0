Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE5673BC5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A6710E961;
	Thu, 19 Jan 2023 14:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB6E10E95B;
 Thu, 19 Jan 2023 14:27:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30JDUI4Y017506; Thu, 19 Jan 2023 14:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=mg1G511mraPPM1d/O19Mnb7zPe1Zxrun8vS23LcqFw0=;
 b=Q1tZCOtX4QXgkcS8WAcAoVF5MU+H2n+GG79aJw9CO7IFuzxwZKkhVVCXzPx+9P1GuLCT
 cMSmWU8WOqoHillxAyslgeCO2ZHoXI9CHjrcuarodlYEEzhsbXqTxwd+TdTnQtgUHgZp
 L09zbayUIEB2VPsXjjelKtjT3Lr5/n1p7q8Qn9EM3Eaz72jEVucfDRa9td0+BCWVfEPS
 iVYSwvBvC9MdXS5zzrZHsPlFCfjOVV5fnZB5XjM0lyroHpLy4G+ZzgAseehn+kiRP/js
 jGCb1XmawrcQOkJotYzm9eDbVN26dracxfrCwAvO3jOszZnZPT3czqHesnjsEXlahKgu xg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n70eyh7bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 14:27:21 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30JERK3B014972
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 14:27:20 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 06:27:15 -0800
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH Resend v11 06/15] drm/bridge: use atomic enable/disable
 callbacks for panel bridge
Date: Thu, 19 Jan 2023 19:56:24 +0530
Message-ID: <1674138393-475-7-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qAeJRbDDJZabJwyVPDm6m9Z0Jc40jg0v
X-Proofpoint-GUID: qAeJRbDDJZabJwyVPDm6m9Z0Jc40jg0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_09,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 mlxscore=0 mlxlogscore=928
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190115
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use atomic variants for panel bridge callback functions such that
certain states like self-refresh can be accessed as part of
enable/disable sequence.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/panel.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index e8aae3c..04e9fb0 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -109,28 +109,32 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 		drm_connector_cleanup(connector);
 }
 
-static void panel_bridge_pre_enable(struct drm_bridge *bridge)
+static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 
 	drm_panel_prepare(panel_bridge->panel);
 }
 
-static void panel_bridge_enable(struct drm_bridge *bridge)
+static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 
 	drm_panel_enable(panel_bridge->panel);
 }
 
-static void panel_bridge_disable(struct drm_bridge *bridge)
+static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 
 	drm_panel_disable(panel_bridge->panel);
 }
 
-static void panel_bridge_post_disable(struct drm_bridge *bridge)
+static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
+				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 
@@ -159,10 +163,10 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
-	.pre_enable = panel_bridge_pre_enable,
-	.enable = panel_bridge_enable,
-	.disable = panel_bridge_disable,
-	.post_disable = panel_bridge_post_disable,
+	.atomic_pre_enable = panel_bridge_atomic_pre_enable,
+	.atomic_enable = panel_bridge_atomic_enable,
+	.atomic_disable = panel_bridge_atomic_disable,
+	.atomic_post_disable = panel_bridge_atomic_post_disable,
 	.get_modes = panel_bridge_get_modes,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.7.4

