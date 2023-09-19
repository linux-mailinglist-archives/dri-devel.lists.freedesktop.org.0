Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705717A69DE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 19:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F8C10E148;
	Tue, 19 Sep 2023 17:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284C510E13D;
 Tue, 19 Sep 2023 17:48:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JHJ8M3001928; Tue, 19 Sep 2023 17:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=0zyjwSc7Gp9FW1Ruyc85byvlIpWv6PcC5mSxYwi2VsA=;
 b=CrgtiCoVRj358PBCuKy0cG3LdrFrKBznC3pAuKnsz0Y67j1dkd6NiCwKFRn3U3nHnW3t
 A0mBGQF0PwG67aqXjMSFU3kuy5PH5S19PficrkneMMx5q9js76jtwYOqkKLMtxygRxRH
 AJeMmpjtFiEF/YgwQr0Z4Dtjmke/j7BixHBT/UCPhgJlBSqYD94ciBMPbPgp7ZvrbMt9
 WX8rD7GJkl4Cz8Qf0/nI+hMP6ISH45VZFZ3zLyUKn3noPbjYP23KcIHWG2EASfFF7OGF
 vQr5NtpdOSi3jimoX86Lim0Yq8jU3f3EXVC/1AU55RATO5O7OMR6WWpnPNCXzVeArIv/ AQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6trqjkhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 17:48:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38JHmNTO015473
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 17:48:23 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 19 Sep 2023 10:48:22 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: remove drm_bridge_hpd_disable() from
 drm_bridge_connector_destroy()
Date: Tue, 19 Sep 2023 10:48:12 -0700
Message-ID: <20230919174813.26958-1-quic_abhinavk@quicinc.com>
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
X-Proofpoint-GUID: Tt0V_lMivdnpfIUFqMTVGbH9nQxcbIYY
X-Proofpoint-ORIG-GUID: Tt0V_lMivdnpfIUFqMTVGbH9nQxcbIYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_09,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 mlxlogscore=838 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190152
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
 linux-kernel@vger.kernel.org, quic_parellan@quicinc.com,
 laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_jesszhan@quicinc.com,
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
drm_bridge_connector_disable_hpd() APIs which should get called by
drm_kms_helper_disable_hpd().

changes in v2:
	- minor change in commit text (Dmitry)

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1da93d5a1f61..c4dba39acfd8 100644
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

