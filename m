Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959136543CF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 16:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7F810E544;
	Thu, 22 Dec 2022 15:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7E410E53E;
 Thu, 22 Dec 2022 15:06:08 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BME4Nkj004839; Thu, 22 Dec 2022 15:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Ogr/QPsfLlqyPywPveHgZK+CHgRo4MIzWIESAwaYdFY=;
 b=lccPXrXkk7woqGzpx6eDg7frytsFAak2MJeJxqPwfzdA0QDNBcBQ1KzkoBCznIE6dXvI
 uY8DE3cegiSK1WRs/ccBe5MUSbRnEZaKA+UQZ5boSUF8uegW4xx+rIK8KHtVK0LmKkKn
 2F06wDH/KVClxOY+wxKfS1gplttSmTfnu7lXIRTKguiY/PlPVHkwpju9oC65sJ3cNmgO
 g3G+ueeyBUNhQtwUOqHeJXdhw0xmtl412dnn1TVIJXR0Ndcr6A32AqbMK5Dqh2YIWc6E
 xJCs0Fu3UfqrubjW11ij5is2NzbfiKZFwhxJ2RGnWdYrvPiJBFyfyKLS3PEHnJmLcofB Rw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mmkrx0tj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 15:06:05 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BMF64mJ015330
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 15:06:04 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 07:05:59 -0800
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v10 08/15] drm/bridge: add psr support for panel bridge
 callbacks
Date: Thu, 22 Dec 2022 20:34:55 +0530
Message-ID: <1671721502-16587-9-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671721502-16587-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1671721502-16587-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: k3e_R3sC7zgiX0Pjl6SZDIWVfvO8QJe-
X-Proofpoint-ORIG-GUID: k3e_R3sC7zgiX0Pjl6SZDIWVfvO8QJe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_08,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212220131
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

This change will handle the psr entry exit cases in the panel
bridge atomic callback functions. For example, the panel power
should not turn off if the panel is entering psr.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/bridge/panel.c | 48 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 3558cbf..5e77e38 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -113,6 +113,18 @@ static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state;
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
+	if (!crtc)
+		return;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
+	if (old_crtc_state && old_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_prepare(panel_bridge->panel);
 }
@@ -121,6 +133,18 @@ static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state;
+
+	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
+	if (!crtc)
+		return;
+
+	old_crtc_state = drm_atomic_get_old_crtc_state(atomic_state, crtc);
+	if (old_crtc_state && old_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_enable(panel_bridge->panel);
 }
@@ -129,6 +153,18 @@ static void panel_bridge_atomic_disable(struct drm_bridge *bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+
+	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
+	if (!crtc)
+		return;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
+	if (new_crtc_state && new_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_disable(panel_bridge->panel);
 }
@@ -137,6 +173,18 @@ static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+
+	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state, encoder);
+	if (!crtc)
+		return;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
+	if (new_crtc_state && new_crtc_state->self_refresh_active)
+		return;
 
 	drm_panel_unprepare(panel_bridge->panel);
 }
-- 
2.7.4

