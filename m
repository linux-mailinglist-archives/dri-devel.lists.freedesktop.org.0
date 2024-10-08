Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AEB995148
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 16:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563B310E557;
	Tue,  8 Oct 2024 14:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YvMth1VV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA18010E550
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 14:18:28 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4985vcou021306;
 Tue, 8 Oct 2024 14:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gKsmCYkhXMlDqpGR7T5GsjFzXiEzCV3nk0wvpW6MLM8=; b=YvMth1VVfFQJaxvh
 hb1C+Ud0qunMaUXf1tZfB+I326jf2OPnRcqD6kcK1Fd+2cML3z/nyB6xoA0G38fb
 TR6iSTp1ABAratoWVofiVndYPpEj7qkaGfk2HUPC0yGX6/iAHSJXB/3ys6uCV7yR
 QZxN/62bcuvJDsnzjeTRGNU/GGpkSJfw5ezXbFoBugnklMOy1phiiqUupaCnX2yX
 Js9zsZaxP9Ruvg6ekMD0j6iBit0+zrB4ZPnpFVrSbMMgBD0g+uNqED388G04D4PN
 juTlXkrRgf/Bqy5EbPdn9gJCcGjzFejm5FFc3YDv3UYvdA0KkUCANKk0FrX0BTKq
 fB9qdQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xr5qkba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 14:18:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498EIBH6021043
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Oct 2024 14:18:11 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Oct 2024 07:18:11 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 8 Oct 2024 07:17:40 -0700
Subject: [PATCH RFC v2 3/3] drm/panel: Introduce simulated panel bridge API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-jz-test-sim-panel-v2-3-d60046470e6c@quicinc.com>
References: <20241008-jz-test-sim-panel-v2-0-d60046470e6c@quicinc.com>
In-Reply-To: <20241008-jz-test-sim-panel-v2-0-d60046470e6c@quicinc.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728397090; l=4528;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=cIyPW9Z2jzZyEh86fXqhUa+MuKu+8xjoPEs+7ONDo2c=;
 b=9tUmkgHjtKtmvNe7ODal7vwSpmLQH0saKzBK2c9oha69gDxYBzlN3/UOccd4vVRhqIJSwQm2R
 vK2kPXGbhOMDdRjRlBmrlSYGzZ93imkS1JXLtrBGqXkEzxiNmopDOJ/
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: era3619I07jwGVG3p2MzGq8wZtp3rjW5
X-Proofpoint-ORIG-GUID: era3619I07jwGVG3p2MzGq8wZtp3rjW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080091
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

Add separate bridge and drm_panel API for getting the simulated panel.
If the panel_simulation kernel module is enabled, the DRM framework will
get the sim panel bridge instead of the physical panel or bridge.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/bridge/panel.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_panel.c    | 33 +++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  1 +
 include/drm/drm_panel.h        |  1 +
 4 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6e88339dec0f5faee690b7c53e8dcd0f1ee2281c..e703a770a86e60887ecb669011f311210fac695e 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -482,6 +482,30 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_panel_bridge_connector);
 
+/**
+ * drm_get_sim_panel_bridge - return the simulated panel bridge
+ * @dev: device to tie the bridge lifetime to
+ *
+ * This function will return a bridge for the simulated panel.
+ *
+ * Returns a pointer to the bridge if successful, or an error pointer
+ * otherwise.
+ */
+struct drm_bridge *drm_get_sim_panel_bridge(struct device *dev)
+{
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+
+	panel = drm_find_sim_panel();
+	if (IS_ERR(panel))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	bridge = devm_drm_panel_bridge_add(dev, panel);
+
+	return bridge;
+}
+EXPORT_SYMBOL(drm_get_sim_panel_bridge);
+
 #ifdef CONFIG_OF
 /**
  * devm_drm_of_get_bridge - Return next bridge in the chain
@@ -505,6 +529,10 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	struct drm_panel *panel;
 	int ret;
 
+	bridge = drm_get_sim_panel_bridge(dev);
+	if (!IS_ERR(bridge))
+		return bridge;
+
 	ret = drm_of_find_panel_or_bridge(np, port, endpoint,
 					  &panel, &bridge);
 	if (ret)
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 19ab0a794add31f34275d53dfab0a7c0050476e3..1e532f8e5bff99467f058fe0a441141c80ca95d6 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -313,6 +313,39 @@ int drm_panel_get_modes(struct drm_panel *panel,
 }
 EXPORT_SYMBOL(drm_panel_get_modes);
 
+/**
+ * drm_find_sim_panel - look up the simulated panel
+ *
+ * Searches for the simulated panel in the panel list.
+ *
+ * Return: A pointer to the simulated panel or an ERR_PTR() if the simulated
+ * panel was not found in the panel list.
+ *
+ * Possible error codes returned by this function:
+ * - EPROBE_DEFER: the panel device has not been probed yet, and the caller
+ *   should retry later
+ */
+struct drm_panel *drm_find_sim_panel(void)
+{
+	struct drm_panel *panel;
+
+	mutex_lock(&panel_lock);
+
+	list_for_each_entry(panel, &panel_list, list) {
+		bool is_sim_panel = !strncmp(panel->dev->driver->name,
+				"panel_simulation",
+				strlen("panel_simulation"));
+		if (is_sim_panel) {
+			mutex_unlock(&panel_lock);
+			return panel;
+		}
+	}
+
+	mutex_unlock(&panel_lock);
+	return ERR_PTR(-EPROBE_DEFER);
+}
+EXPORT_SYMBOL(drm_find_sim_panel);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_panel - look up a panel using a device tree node
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 75019d16be643ae87f756e131a079feffd9b4d59..8c1ae06ecbcdb2e9d1fba6845bd85a54a9643502 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1006,6 +1006,7 @@ static inline int drm_panel_bridge_set_orientation(struct drm_connector *connect
 }
 #endif
 
+struct drm_bridge *drm_get_sim_panel_bridge(struct device *dev);
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
 struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
 					  u32 port, u32 endpoint);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 10015891b056f816c7a992a2052b36fd26943c5b..c3a5944c35a911b809a6567040cea7bc7da07ba6 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -283,6 +283,7 @@ int drm_panel_enable(struct drm_panel *panel);
 int drm_panel_disable(struct drm_panel *panel);
 
 int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
+struct drm_panel *drm_find_sim_panel(void);
 
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
 struct drm_panel *of_drm_find_panel(const struct device_node *np);

-- 
2.34.1

