Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A20022C1B1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 11:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6384D6E4DE;
	Fri, 24 Jul 2020 09:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48636E4D7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 09:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxW9ZoPHJwL1QtAWejxT17mvM+rd71Dt900/seF4zgpXzaYxHlA6N6BN2xCVjSsLFTOSpwyG1rQa/M41pJ/GN08GZ45Xn30ZGRkgeyRUBn1Xv8PBOSg6julFoT3tViGgnE+I1ACVpWGJEOXaH7lTk4buE3C0yq4u7eIaLVd+l+VzrSJCPZuArl8h/dqm6KMccEaHEi4X9vzLR54vYLCtc+Ccgqt4X8vMTkFB47pPnfs3cfy7xPXAP6AjQsyHlnh2HtoOZnmOIKuDPSeMM1eHUF/86cg4bMQBjVedwz1o8LW8S/CVPh7cVN9cUh9Le4/j+7rI649Sze4jmbbSx5kNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2uXRfjlTeWpExV8Sgs+LYmbLtalszmro9CG33eQzI4=;
 b=c1lCLaQfbD2WdM121STsLptUEPivmCY0n/Uc5huLp3m2SMa2B52lRWsvBkCRLOi0ebMtE4eWh+lZArUwNIHAkiRLDOPq/RqEo0WTH/ZqTHPXjZjKEtRzWx2xtcHJ3tie2b/mR2KxQ7uzS5pr4SviQ+mZB9q6Z3G1VyEn0mVZC2z3SASNfaWDotVKbNJFGJluYTkvzRJf/05Cc91eJ/Z0Ek40X70DPfqJFcsnsV7Vbz2ACEbDxw8UYafgQ3902IeVVKVqN4yYvvGbTil6HQcpBiquOHOZW0vTOgzSvas1spTTGYgPLV8Jt52wPswJCld5TCqE9liQwjdYiZuZdMmxqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2uXRfjlTeWpExV8Sgs+LYmbLtalszmro9CG33eQzI4=;
 b=kdJ9dYfYJK+FFVU9iYZ3AFhANW5VMHBiAYI4mlzOD5ZddTy7VTfCpG0ybRPfPzTh9BwIh0SLf1UhtHsX6LWhaIaXWEE23K9d8/ODYorWLmXdov0aoQZZbYhJAnaspzadZaVMYE/epu9AgkuFd/KqHwweUK63OAf2Ku/KWR5Xvwc=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6960.eurprd04.prod.outlook.com
 (2603:10a6:803:12d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Fri, 24 Jul
 2020 09:08:27 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.028; Fri, 24 Jul 2020
 09:08:27 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v8 3/5] drm/imx/dcss: use drm_bridge_connector API
Date: Fri, 24 Jul 2020 12:07:32 +0300
Message-Id: <20200724090736.12228-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
References: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::45) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Fri, 24 Jul 2020 09:08:25 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79270560-1750-413d-962a-08d82fb1205e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6960:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6960ADCECDC63B7C0A168E09BE770@VI1PR04MB6960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1AgqHUlv3Y2rW/pD1rWjpWZEL/38NQ2DWY1veqDIx6pTLq3+GYvyZPeO7vss/kpHLBGzTRvST1D7dnmPS3T4atBmRuAF1wh7GvbhyywCvETAvSRDJt4woKMNkV/HZm+wH0yQNLJJ+CGM1Ov++NGidwbAE1MeXnSRTJOaPI3m2rd/dAhTWB7RZPsaWXngHZfZ5eBkXzyv/zxS5NtTWziVOKY9QImrymyt+tGruiomcGPvWucnQnfOC+phTUMAumPjfIS5Hrs1XaFyQ+8B1LEzlC2M3amlROXr+yT7LM5R+sJln1R1bHYMebi8WB/KlUFaLl89fF0n6NpbxDpUjdoIxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(26005)(5660300002)(186003)(86362001)(6506007)(83380400001)(478600001)(1076003)(16526019)(52116002)(2616005)(66556008)(66946007)(66476007)(54906003)(6512007)(6666004)(956004)(8676002)(2906002)(6486002)(4326008)(7416002)(44832011)(8936002)(110136005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 9cbS0ljE5Wk47HYfUDZBG1mLVSMQG1Hhbgp2NQgj2YMSYjMPwa1PPdka5fi2E8qoFwylDtNfJYL5EBeEejsObssosWFm9Exgm4epx5qeZ0PCIIRnd7GV6P9wu3NO3XJqc9/Rm50UskV2GC264yf6cRjdQRan3K3ix5Gq7Zix+HfyKlil+NBIRXiZ7rlvo8PphVQLaPjV9V0OuqIqPO+pgI0mmDyOlienQhlW0BGffKngcijMcX3+PbxLd4KA7NcvzIniO3ilnXuyMQlb6qZhfanD1cC/AErwkncGTFq9cKY7b0PNssBRu67BHbFTIi8xg9eomzNuu7l0OVk4O1YX66G0r27KznvoEIHHszdj8T+vof4MpmC4N0KtqU/aMXf5dYxLSImY/0rPggUm9LlRJN89YNP1SlG5Nm2jchZ/rytHrWBGf345lGy6jhobleN2iWfVTpDM1R7ibiuKkLzG8c8MtXRtjjOqjKxPHXVJU7E=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79270560-1750-413d-962a-08d82fb1205e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 09:08:27.3870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pqcYG1tVfGD97/Wx1t8WZN6zFhQ44qUej17U83PiwXJUmTxMceP0LXjaw3tvjr9c6e+GnFh2uTlHd0JWvIYUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6960
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
Cc: agx@sigxcpu.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 laurentiu.palcu@oss.nxp.com, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Make use of drm_bridge_connector API to have the connector initialized by the
display controller.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 17 +++++++++++++---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 31 ++++++++++++++++++++++++-----
 drivers/gpu/drm/imx/dcss/dcss-kms.h |  1 +
 3 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 83a4840435cf..c849533ca83e 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -8,9 +8,12 @@
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_device.h>
 #include <drm/drm_modeset_helper.h>
 
 #include "dcss-dev.h"
+#include "dcss-kms.h"
 
 static void dcss_clocks_enable(struct dcss_dev *dcss)
 {
@@ -247,9 +250,13 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
 int dcss_dev_suspend(struct device *dev)
 {
 	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
+	struct drm_device *ddev = dcss_drv_dev_to_drm(dev);
+	struct dcss_kms_dev *kms = container_of(ddev, struct dcss_kms_dev, base);
 	int ret;
 
-	drm_mode_config_helper_suspend(dcss_drv_dev_to_drm(dev));
+	drm_bridge_connector_disable_hpd(kms->connector);
+
+	drm_mode_config_helper_suspend(ddev);
 
 	if (pm_runtime_suspended(dev))
 		return 0;
@@ -266,9 +273,11 @@ int dcss_dev_suspend(struct device *dev)
 int dcss_dev_resume(struct device *dev)
 {
 	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
+	struct drm_device *ddev = dcss_drv_dev_to_drm(dev);
+	struct dcss_kms_dev *kms = container_of(ddev, struct dcss_kms_dev, base);
 
 	if (pm_runtime_suspended(dev)) {
-		drm_mode_config_helper_resume(dcss_drv_dev_to_drm(dev));
+		drm_mode_config_helper_resume(ddev);
 		return 0;
 	}
 
@@ -278,7 +287,9 @@ int dcss_dev_resume(struct device *dev)
 
 	dcss_ctxld_resume(dcss->ctxld);
 
-	drm_mode_config_helper_resume(dcss_drv_dev_to_drm(dev));
+	drm_mode_config_helper_resume(ddev);
+
+	drm_bridge_connector_enable_hpd(kms->connector);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 3ca49d0a3e61..135a62366ab8 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -74,7 +75,7 @@ static const struct drm_encoder_funcs dcss_kms_simple_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-static int dcss_kms_setup_encoder(struct dcss_kms_dev *kms)
+static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
 {
 	struct drm_device *ddev = &kms->base;
 	struct drm_encoder *encoder = &kms->encoder;
@@ -103,7 +104,23 @@ static int dcss_kms_setup_encoder(struct dcss_kms_dev *kms)
 		return ret;
 	}
 
-	return drm_bridge_attach(encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret < 0) {
+		dev_err(ddev->dev, "Unable to attach bridge %pOF\n",
+			bridge->of_node);
+		return ret;
+	}
+
+	kms->connector = drm_bridge_connector_init(ddev, encoder);
+	if (IS_ERR(kms->connector)) {
+		dev_err(ddev->dev, "Unable to create bridge connector.\n");
+		return PTR_ERR(kms->connector);
+	}
+
+	drm_connector_attach_encoder(kms->connector, encoder);
+
+	return 0;
 }
 
 struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
@@ -131,18 +148,20 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 
 	drm->irq_enabled = true;
 
-	ret = dcss_crtc_init(crtc, drm);
+	ret = dcss_kms_bridge_connector_init(kms);
 	if (ret)
 		goto cleanup_mode_config;
 
-	ret = dcss_kms_setup_encoder(kms);
+	ret = dcss_crtc_init(crtc, drm);
 	if (ret)
-		goto cleanup_crtc;
+		goto cleanup_mode_config;
 
 	drm_mode_config_reset(drm);
 
 	drm_kms_helper_poll_init(drm);
 
+	drm_bridge_connector_enable_hpd(kms->connector);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto cleanup_crtc;
@@ -152,6 +171,7 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 	return kms;
 
 cleanup_crtc:
+	drm_bridge_connector_disable_hpd(kms->connector);
 	drm_kms_helper_poll_fini(drm);
 	dcss_crtc_deinit(crtc, drm);
 
@@ -167,6 +187,7 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
 	struct drm_device *drm = &kms->base;
 
 	drm_dev_unregister(drm);
+	drm_bridge_connector_disable_hpd(kms->connector);
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 	drm_crtc_vblank_off(&kms->crtc.base);
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.h b/drivers/gpu/drm/imx/dcss/dcss-kms.h
index 1f51c86c6986..dfe5dd99eea3 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.h
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.h
@@ -29,6 +29,7 @@ struct dcss_kms_dev {
 	struct drm_device base;
 	struct dcss_crtc crtc;
 	struct drm_encoder encoder;
+	struct drm_connector *connector;
 };
 
 struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
