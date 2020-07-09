Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8252421A51B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 18:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA116EABF;
	Thu,  9 Jul 2020 16:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9F06EAC0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 16:47:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMJ+R17q7PlNstwbussEpk4oRQdImgZ/3AVJSGPNsRfrE1+lj6n73OkXs1CNdijIB2CkaM479Q+aBq8Esx+KWXhE2yqUX8NtmQj8n6QWeF7t7ClsdvDSpnXemM+wpBEPMurcQy48EVDrRSDJMOqwa3K0n2m3vagPtAoI9mOzWrmVa/LtOYllQjdjgHJ5OGKZKeTZWRX7//WDUDEoqxsxN9MyHCsZapfCUe/lnbSgkfTxlXUqLEDptUX/bH0iQmiQVLHpoxdP8V1G5zCcCuPWM9+TBlkYegy76pTx0Mw5xlVt7/ygy/0ZE8H8zT5dLx3sh0DSC/1IE2rMzWO2jnZ7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G0pmY3HBJ6yfVN+c3uzn+EzTE3XdeEWEP+1nMQ0/oY=;
 b=eKGfPTzl3liRALAPU01ZTnU5aWQa95feQNfYvqaxNbiDlfl3EVrlneo61dFimYq0sg3+66PVFDpLsTTZ6uphecPthKraCPcQ9MRJBoLxv9cOMk5ZiyGH5nDltuHw75GZmCJFm0cJLebDp2lf017Uerau+Mtk9PTN/46wFcQn5vQggr3yDSzd7Ul1G0GZDYWk6pNqfccQRH8IzXCeoyrHHbvJ71iSuRiPUg1B36GlXwybBWn99P6Jv551QC0QbXYWz5L51yrdSogH4euj0rVJ4GwpyLQAMyzjHqSdkXdaY9FSJWVqGQJvbIrbA0lIU3wlmbaDuLeYJty6xt3mnS0xIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G0pmY3HBJ6yfVN+c3uzn+EzTE3XdeEWEP+1nMQ0/oY=;
 b=UTWY6eW1Y9rPBQq+ziOgC0EuZLnfNpP0Pnmqo0f+seZfXv0nz+0/yFUAtSHKHyWjF1+hk6dpVa2dhYMmtTytlOkvsl8OcPFVGkqkWdcL1e02SJiOl8OyEB/v2Ku7rCSv2urMibjB2d8gGLNAjX1Z9P43mm7EDcFpC6V926eSQJg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6239.eurprd04.prod.outlook.com
 (2603:10a6:803:fd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 16:47:56 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3153.029; Thu, 9 Jul 2020
 16:47:56 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v5 3/5] drm/imx/dcss: add component framework functionality
Date: Thu,  9 Jul 2020 19:47:31 +0300
Message-Id: <20200709164736.18291-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
References: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18)
 To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 16:47:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 63f7766f-8213-490a-fb1b-08d82427d466
X-MS-TrafficTypeDiagnostic: VI1PR04MB6239:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB623935EC8112746EA554C51BBE640@VI1PR04MB6239.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sXy6vGRZkYB/jd1LqUXAlmY2V4J3aPN/5T2PYqHFg/3U2ivl8183YKAAGTcwu1pAloOXViv8fZNqaPR20KMhYCVuoc9b9pO9OpJ6I0pMaYmxSw9lIZ6LAhOrlVJq/V6IqNDjKDIz3oSDEVH1asFxChHE1WgAQJYwz1O39oDsj3iBxEttZo00UIOsHGx9CX5fJxWNbN+WbfsgTl+XiIVSsqru2yMGz0b22K1jqPJou0fHyX1DvlD3LLiGu3mB4OYEaJPMA0hZOehammEDSnWJ9t3QcPcYS9bV6iyVm/bHqm61knywhUfCB0QZSSNjvydVue93FfU+M7Qz29BS582o9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(8936002)(66556008)(66476007)(186003)(16526019)(6666004)(52116002)(1076003)(86362001)(6486002)(6506007)(66946007)(4326008)(5660300002)(2616005)(26005)(956004)(7416002)(2906002)(83380400001)(110136005)(478600001)(316002)(44832011)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ITqDA/CUu1ALkKXFNbiG+hxfiYQeH2h8+SwD8Q+5e7SGb4vB/T82RqQ+Jzq8K+sk34ZjVriW3CTuKHghLm8YmnpBGCrp6YFCJFi46OQR9L6MjWA41eGTDOMpKuYhq9EXUuhZjVZ6MCKCF8lib2e/JeuXyU2X1EhC4ImWC1JYMYFVmcBeEr23eS0K1FJkQgX4KzG2kv48/Uf2B6kP48YAfCuju4MoboMaLBU49P/0zxBj9ADgST6S4jflpkf3zNzl8Pwzd6Me7z6c1vlPJGc+UPnfp97kyD0MehguIajv+tQc+Qe52lmUO9F4emDBMMgthuY9qfJXedZ7Frp0Dm07wOJ1VKctEIEb5OPCpqmo+DOFQxR9w3Dn1iL3wie8gT7HR/S+5qPKdHtNz/rPzHo/iU5txjm6dtUDRI/C9L8oW+MkKqJuoHHQs9pagA763d57veSHOAMh4qPk/mHh8ZfjNmNEkJKxvlR/IpKTi0XSMoY=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f7766f-8213-490a-fb1b-08d82427d466
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 16:47:56.0427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyEnx0eIuBxTaEKxjy5RwlJlhujijWnNBKMbEgy3/JuYjZY5/iALTQ7Yux/9eTTGGF0Y7mfBVw4DrtO3EgnK7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6239
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
 dri-devel@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Component framework is needed by HDP driver.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
---
 drivers/gpu/drm/imx/dcss/dcss-drv.c | 89 ++++++++++++++++++++++-------
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 14 ++++-
 drivers/gpu/drm/imx/dcss/dcss-kms.h |  4 +-
 3 files changed, 80 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 8dc2f85c514b..09d0ac28e28a 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/component.h>
 #include <drm/drm_of.h>
 
 #include "dcss-dev.h"
@@ -14,6 +15,8 @@
 struct dcss_drv {
 	struct dcss_dev *dcss;
 	struct dcss_kms_dev *kms;
+
+	bool is_componentized;
 };
 
 struct dcss_dev *dcss_drv_dev_to_dcss(struct device *dev)
@@ -30,30 +33,18 @@ struct drm_device *dcss_drv_dev_to_drm(struct device *dev)
 	return mdrv ? &mdrv->kms->base : NULL;
 }
 
-static int dcss_drv_platform_probe(struct platform_device *pdev)
+static int dcss_drv_init(struct device *dev, bool componentized)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *remote;
 	struct dcss_drv *mdrv;
 	int err = 0;
-	bool hdmi_output = true;
-
-	if (!dev->of_node)
-		return -ENODEV;
-
-	remote = of_graph_get_remote_node(dev->of_node, 0, 0);
-	if (!remote)
-		return -ENODEV;
-
-	hdmi_output = !of_device_is_compatible(remote, "fsl,imx8mq-nwl-dsi");
-
-	of_node_put(remote);
 
 	mdrv = kzalloc(sizeof(*mdrv), GFP_KERNEL);
 	if (!mdrv)
 		return -ENOMEM;
 
-	mdrv->dcss = dcss_dev_create(dev, hdmi_output);
+	mdrv->is_componentized = componentized;
+
+	mdrv->dcss = dcss_dev_create(dev, componentized);
 	if (IS_ERR(mdrv->dcss)) {
 		err = PTR_ERR(mdrv->dcss);
 		goto err;
@@ -61,7 +52,7 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, mdrv);
 
-	mdrv->kms = dcss_kms_attach(mdrv->dcss);
+	mdrv->kms = dcss_kms_attach(mdrv->dcss, componentized);
 	if (IS_ERR(mdrv->kms)) {
 		err = PTR_ERR(mdrv->kms);
 		goto dcss_shutoff;
@@ -79,19 +70,73 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int dcss_drv_platform_remove(struct platform_device *pdev)
+static void dcss_drv_deinit(struct device *dev, bool componentized)
 {
-	struct dcss_drv *mdrv = dev_get_drvdata(&pdev->dev);
+	struct dcss_drv *mdrv = dev_get_drvdata(dev);
 
 	if (!mdrv)
-		return 0;
+		return;
 
-	dcss_kms_detach(mdrv->kms);
+	dcss_kms_detach(mdrv->kms, componentized);
 	dcss_dev_destroy(mdrv->dcss);
 
-	dev_set_drvdata(&pdev->dev, NULL);
+	dev_set_drvdata(dev, NULL);
 
 	kfree(mdrv);
+}
+
+static int dcss_drv_bind(struct device *dev)
+{
+	return dcss_drv_init(dev, true);
+}
+
+static void dcss_drv_unbind(struct device *dev)
+{
+	return dcss_drv_deinit(dev, true);
+}
+
+static const struct component_master_ops dcss_master_ops = {
+	.bind	= dcss_drv_bind,
+	.unbind	= dcss_drv_unbind,
+};
+
+static int compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static int dcss_drv_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct component_match *match = NULL;
+	struct device_node *remote;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	remote = of_graph_get_remote_node(dev->of_node, 0, 0);
+	if (!remote)
+		return -ENODEV;
+
+	if (of_device_is_compatible(remote, "fsl,imx8mq-nwl-dsi")) {
+		of_node_put(remote);
+		return dcss_drv_init(dev, false);
+	}
+
+	drm_of_component_match_add(dev, &match, compare_of, remote);
+	of_node_put(remote);
+
+	return component_master_add_with_match(dev, &dcss_master_ops, match);
+}
+
+static int dcss_drv_platform_remove(struct platform_device *pdev)
+{
+	struct dcss_drv *mdrv = dev_get_drvdata(&pdev->dev);
+
+	if (mdrv->is_componentized)
+		component_master_del(&pdev->dev, &dcss_master_ops);
+	else
+		dcss_drv_deinit(&pdev->dev, false);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 3ca49d0a3e61..bb009f3a878f 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -12,6 +12,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <linux/component.h>
 
 #include "dcss-dev.h"
 #include "dcss-kms.h"
@@ -106,7 +107,7 @@ static int dcss_kms_setup_encoder(struct dcss_kms_dev *kms)
 	return drm_bridge_attach(encoder, bridge, NULL, 0);
 }
 
-struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
+struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss, bool componentized)
 {
 	struct dcss_kms_dev *kms;
 	struct drm_device *drm;
@@ -135,7 +136,11 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 	if (ret)
 		goto cleanup_mode_config;
 
-	ret = dcss_kms_setup_encoder(kms);
+	if (componentized)
+		ret = component_bind_all(dcss->dev, kms);
+	else
+		ret = dcss_kms_setup_encoder(kms);
+
 	if (ret)
 		goto cleanup_crtc;
 
@@ -162,9 +167,10 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 	return ERR_PTR(ret);
 }
 
-void dcss_kms_detach(struct dcss_kms_dev *kms)
+void dcss_kms_detach(struct dcss_kms_dev *kms, bool componentized)
 {
 	struct drm_device *drm = &kms->base;
+	struct dcss_dev *dcss = drm->dev_private;
 
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
@@ -173,5 +179,7 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
 	drm->irq_enabled = false;
 	drm_mode_config_cleanup(drm);
 	dcss_crtc_deinit(&kms->crtc, drm);
+	if (componentized)
+		component_unbind_all(dcss->dev, drm);
 	drm->dev_private = NULL;
 }
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.h b/drivers/gpu/drm/imx/dcss/dcss-kms.h
index 1f51c86c6986..9b3bc7be9e84 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.h
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.h
@@ -31,8 +31,8 @@ struct dcss_kms_dev {
 	struct drm_encoder encoder;
 };
 
-struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss);
-void dcss_kms_detach(struct dcss_kms_dev *kms);
+struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss, bool componentized);
+void dcss_kms_detach(struct dcss_kms_dev *kms, bool componentized);
 int dcss_crtc_init(struct dcss_crtc *crtc, struct drm_device *drm);
 void dcss_crtc_deinit(struct dcss_crtc *crtc, struct drm_device *drm);
 struct dcss_plane *dcss_plane_init(struct drm_device *drm,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
