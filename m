Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F99E756FE1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 00:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5AB10E00C;
	Mon, 17 Jul 2023 22:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE11D10E00C;
 Mon, 17 Jul 2023 22:35:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36HMTpRn006684; Mon, 17 Jul 2023 22:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=6MJknHTOvGIsh1ufa2YfCm6oqXwZLuROTT92LY6WcEw=;
 b=ax6+58UNRefdDPJopPx3ITJkFhe4Yxnn9LbTtgPIuwSmHquSVR2ubHTkC3Lmk1pi/pe3
 o/3bE13Hx5hIfQOzWVvE8EBUfaWQb1GdUJ6jaa5294l+NCIJQbasdFbIzagLkwVc8Uko
 rDhxeCLTAaDEHXuuXXaaGVMB/ncl3BAaURl2ghvoU+XD50m4HKyElJCL3E4rkYT7IedS
 p/LGazJkzPq63keLcD0gFwuCGNauFWw0QU9Z+rsY3AL45WkNt5bFPCKmMChsJ0SugIii
 UmajClEprayMvaludcWt5iZ5sISb8B0eg57FBHQbXDs07D6/QejWRwt96zhmrW4V8p4B yg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3run0avpnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 22:35:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36HMZ9gw027973
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 22:35:09 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 17 Jul 2023 15:35:08 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: remove drm_bridge_hpd_disable() from
 drm_bridge_connector_destroy()
Date: Mon, 17 Jul 2023 15:34:51 -0700
Message-ID: <20230717223451.16783-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hApjDzxgwLNOgSFs745jCdxe3Dh76AKd
X-Proofpoint-ORIG-GUID: hApjDzxgwLNOgSFs745jCdxe3Dh76AKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=810 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170205
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
Cc: andersson@kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_bridge_hpd_enable()/drm_bridge_hpd_disable() callbacks call into
the respective driver's hpd_enable()/hpd_disable() ops. These ops control
the HPD enable/disable logic which in some cases like MSM can be a
dedicate hardware block to control the HPD.

During probe_defer cases, a connector can be initialized and then later
destroyed till the probe is retried. During connector destroy in these
cases, the hpd_disable() callback gets called without a corresponding
hpd_enable() leading to an unbalanced state potentially causing even
a crash.

This can be avoided by the respective drivers maintaining their own
state logic to ensure that a hpd_disable() without a corresponding
hpd_enable() just returns without doing anything.

However, to have a generic fix it would be better to avoid the
hpd_disable() callback from the connector destroy path and let
the hpd_enable() / hpd_disable() balance be maintained by the
corresponding drm_bridge_connector_enable_hpd() /
drm_bridge_connector_disable_hpd() APIs.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/drm_bridge_connector.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 19ae4a177ac3..3d4e25c2f3d7 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -187,12 +187,6 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	if (bridge_connector->bridge_hpd) {
-		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
-
-		drm_bridge_hpd_disable(hpd);
-	}
-
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 
-- 
2.40.1

