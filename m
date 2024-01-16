Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACEC82FC89
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 23:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DF810E600;
	Tue, 16 Jan 2024 22:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07EE10E5E0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 22:22:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40GMHVC8018853; Tue, 16 Jan 2024 22:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=hUoQUsfqmmEa3pzrtXgZQhTbgJ2D9+Maj4v0QuaJ2d0
 =; b=k4yF9wXfntbrrHMEe/FPk7x4aR7R7gG2wnPeCSZx7gnljxDeXpTXhDPSRsH
 fnlS7uKvesFZnyHWzWVyyKxBPvaJ6evUQrgkULtyUvEmFt/7beRJ5RBkEJxBS5x8
 zZvPrQK1aybKL4Igc64BkqADvIhvCTYJsFibgfVQwvtGCEAoQk55zAGWkpr4myy8
 0rIszAF11PA2JtZMPboZv/3j00Li2a+ZHxUMqQgwPjoE0WehRVcnnSIZ2vyyKWVk
 MhkM1E/9ws29Q43OXHSHDr5FV5y3QRUBAVdE8HGvmebxa2V4nv/BQCWAHhBI1f3c
 IWY4uVyCXfQ0g7VB4kfeTMqW3Tg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnmq0j53a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 22:22:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40GMMP3d013083
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 22:22:25 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 14:22:24 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 16 Jan 2024 14:22:07 -0800
Subject: [PATCH RFC 4/4] drm/msm/dsi: Add simulated panel support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240116-jz-test-sim-panel-v1-4-f9511f46c9c7@quicinc.com>
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
In-Reply-To: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-f0463
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705443743; l=2811;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=G6H7BdeN/Ihqcy5woTkqJ3iH1GBNpVprDUyaGOsUtM0=;
 b=qbG5XZZuJGvZKisIkwxFZNK1JX2l6Z9/mdYeFL9rVdsxD6AcIXXSXJlQHvVixFtRXUsEjLFKV
 pfCtSXBekMmCEsimCGU8yS2qJKh6Gj+ITSCIaaAcgeqV+8nuE7JrnFP
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 47l8lmtJLXXM-rGSFh8Gl5bZAQh4G-T-
X-Proofpoint-ORIG-GUID: 47l8lmtJLXXM-rGSFh8Gl5bZAQh4G-T-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401160173
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
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the sim_panel_enabled module parameter.

When set, this parameter will force DSI to select the simulated panel
instead of the physical panel.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 4 ++++
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 9 ++++++++-
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 8 +++++++-
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index c6bd7bf15605c..daea84f5e3c0c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -5,6 +5,10 @@
 
 #include "dsi.h"
 
+bool sim_panel_enabled;
+MODULE_PARM_DESC(sim_panel_enabled, "Use simulated panel");
+module_param(sim_panel_enabled, bool, 0444);
+
 bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
 {
 	unsigned long host_flags = msm_dsi_host_get_mode_flags(msm_dsi->host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index deeecdfd6c4e4..fa0cab09fff71 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -35,6 +35,8 @@
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
+extern bool sim_panel_enabled;
+
 static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc_config *dsc);
 
 static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
@@ -2009,7 +2011,12 @@ int msm_dsi_host_register(struct mipi_dsi_host *host)
 	if (!msm_host->registered) {
 		host->dev = &msm_host->pdev->dev;
 		host->ops = &dsi_host_ops;
-		ret = mipi_dsi_host_register(host);
+
+		if (sim_panel_enabled)
+			ret = mipi_dsi_host_register_sim_panel(host);
+		else
+			ret = mipi_dsi_host_register(host);
+
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 896f369fdd535..e33e6be7309f2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -30,6 +30,8 @@ struct msm_dsi_manager {
 
 static struct msm_dsi_manager msm_dsim_glb;
 
+extern bool sim_panel_enabled;
+
 #define IS_BONDED_DSI()		(msm_dsim_glb.is_bonded_dsi)
 #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
 #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
@@ -507,7 +509,11 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
 	int ret;
 
 	int_bridge = msm_dsi->bridge;
-	ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
+
+	if (sim_panel_enabled)
+		ext_bridge = drm_get_sim_panel_bridge(&msm_dsi->pdev->dev);
+	else
+		ext_bridge = devm_drm_of_get_bridge(&msm_dsi->pdev->dev,
 					    msm_dsi->pdev->dev.of_node, 1, 0);
 	if (IS_ERR(ext_bridge))
 		return PTR_ERR(ext_bridge);

-- 
2.43.0

