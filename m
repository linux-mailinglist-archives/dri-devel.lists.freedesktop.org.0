Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 215A45FC4E9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCA110E47D;
	Wed, 12 Oct 2022 12:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212FA10E420;
 Wed, 12 Oct 2022 12:02:55 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29C7xxo8009758;
 Wed, 12 Oct 2022 12:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=RA1ipFEdhlLQbSALrHtsi1jAr2KcTAoVnz6bp7Dmpvo=;
 b=ZjvIVUz9WMhRRqq4CKqbIaikWX1G83vxIfLYduc3YCDnzQrIm0RZm9T5V9s1V16byQxt
 1zu1evnEgkG8GO6Xk0cpd2vNmwNAhYgDB9IDU6YmDpO8DEhSax+XVm1AwJkmmn/7/GVU
 JXDLrGMcEYvCn+RzNgIXrUN+jJHzddUvVfF46HHoP/LwGL2vKwtHEFK4iYn2jhIqgvFB
 jJ+SBpzwasWKDvzXHxJQ+Ypfmum98ZnVoUdEuhkJGhd9WOsICxSqViwTPo8YggV2sX3C
 7YquJReGaCSNHv7qg7TVlxPlnijg9SVJLPGcojZe9T/sQOM0rcoaeGUFkdOYsEWzJA4s mQ== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k5kar1n9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 12:02:52 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 29CC2mtR026937; 
 Wed, 12 Oct 2022 12:02:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3k3jpu0t2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Oct 2022 12:02:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29CC2mg6026897;
 Wed, 12 Oct 2022 12:02:48 GMT
Received: from vpolimer-linux.qualcomm.com (vpolimer-linux.qualcomm.com
 [10.204.67.235])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 29CC2mA4026870;
 Wed, 12 Oct 2022 12:02:48 +0000
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id CC7353EAB; Wed, 12 Oct 2022 17:32:46 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v8 06/15] drm/msm/dp: disable self_refresh_aware after
 entering psr
Date: Wed, 12 Oct 2022 17:32:30 +0530
Message-Id: <1665576159-3749-7-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1665576159-3749-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1665576159-3749-1-git-send-email-quic_vpolimer@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: IKs39UZb7NjAZKiWTRg4xseJzK310Lth
X-Proofpoint-GUID: IKs39UZb7NjAZKiWTRg4xseJzK310Lth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_06,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120079
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

