Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87615B7294
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 16:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1608410E77E;
	Tue, 13 Sep 2022 14:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086510E738;
 Tue, 13 Sep 2022 14:56:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DDvLKV030209;
 Tue, 13 Sep 2022 14:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=RA1ipFEdhlLQbSALrHtsi1jAr2KcTAoVnz6bp7Dmpvo=;
 b=M2MBsaDLLsK0hyQ7OMnuQMJmdLsTAH6WLopwpTFv75UxKYfAUOdt2nqKECQCluKJXKyN
 IpXq2Oic6gPD1pWVzx16yCO5O8JdMpNSTgZQHHqIaZ1L0Tz5fwX+TYyvwGnN6WkZnP7Q
 /7EhqzxYHpb3z0wlQ/sXn5jVb+fP1f4dFe3dMgAygFxKBu9zKCkGxAlX3xXL3Egz71eR
 QN0rBQXRgX5ZVM0FSoRxqIz4NEID/KXX8+PJpeM7CgzF6tntJ3k2iAOyE2E/LrE5bNd7
 uF0//nJJ8r3UVTNqtJlLMLLnns1pqEvbS/zaSwni0y/KyrG+yy3iob9MdPdXe2oGIQ14 jA== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjbh1b86e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 14:56:31 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28DEpQPC017888; 
 Tue, 13 Sep 2022 14:51:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3jh46m5drs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 13 Sep 2022 14:51:27 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28DEpQNu017841;
 Tue, 13 Sep 2022 14:51:27 GMT
Received: from vpolimer-linux.qualcomm.com (vpolimer-linux.qualcomm.com
 [10.204.67.235])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 28DEpQiI017897;
 Tue, 13 Sep 2022 14:51:27 +0000
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 8C983403F; Tue, 13 Sep 2022 20:21:25 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 06/15] drm/msm/dp: disable self_refresh_aware after
 entering psr
Date: Tue, 13 Sep 2022 20:21:07 +0530
Message-Id: <1663080676-12936-7-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1663080676-12936-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1663080676-12936-1-git-send-email-quic_vpolimer@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: X8kyxiHvkftOWfR-eXUtNWUyvQEMK5iz
X-Proofpoint-ORIG-GUID: X8kyxiHvkftOWfR-eXUtNWUyvQEMK5iz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_07,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130068
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dianders@chromium.org, quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

Updated frames get queued if self_refresh_aware is set when the
sink is in psr. To support bridge enable and avoid queuing of update
frames, reset the self_refresh_aware state after entering psr.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 3e8912b..818c105 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -100,6 +100,8 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct drm_crtc_state *old_crtc_state;
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state = NULL;
 
 	/*
 	 * Check the old state of the crtc to determine if the panel
@@ -116,10 +118,22 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	if (old_crtc_state && old_crtc_state->self_refresh_active) {
 		dp_display_set_psr(dp, false);
-		return;
+		goto psr_aware;
 	}
 
 	dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
+
+psr_aware:
+	connector = drm_atomic_get_new_connector_for_encoder(atomic_state,
+							drm_bridge->encoder);
+	if (connector)
+		conn_state = drm_atomic_get_new_connector_state(atomic_state,
+								connector);
+
+	if (conn_state) {
+		conn_state->self_refresh_aware = dp->psr_supported;
+	}
+
 }
 
 static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -130,6 +144,14 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	struct drm_crtc_state *new_crtc_state = NULL, *old_crtc_state = NULL;
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state = NULL;
+
+	connector = drm_atomic_get_old_connector_for_encoder(atomic_state,
+							drm_bridge->encoder);
+	if (connector)
+		conn_state = drm_atomic_get_new_connector_state(atomic_state,
+								connector);
 
 	crtc = drm_atomic_get_old_crtc_for_encoder(atomic_state,
 						   drm_bridge->encoder);
@@ -156,6 +178,9 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	 * when display disable occurs while the sink is in psr state.
 	 */
 	if (new_crtc_state->self_refresh_active) {
+		if (conn_state)
+			conn_state->self_refresh_aware = false;
+
 		dp_display_set_psr(dp, true);
 		return;
 	} else if (old_crtc_state->self_refresh_active) {
-- 
2.7.4

