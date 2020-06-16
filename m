Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585261FC731
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4276E517;
	Wed, 17 Jun 2020 07:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACCD6E883
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 09:16:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlGjakecxW0Qc3RKrRMZYDriwTymIt8+hBH3SFvwr2ng+aOXJWDk4aS0oDUjIx8+GO25hCkDLLtABruuofFuXN1Dg29rqdu8TXIdKstLwkvOHzaPfeYAnM+xjPA4JSB9a4K3JIZttcBIr2h2xviQg9ZQPHQzsJl/fYcYT8EfQHysbWF0TJxZcOnVHNTbjzrzBE88UVihsrkrnZUcVACQ17bBJ6aERhdLTT2NMEnJexxWKNMtg3ESFvz1QUa5PpsxWt5SIaMd7fm4TW0t4LLChpGfW56OnWiqGMs1b8/oWY5EzuZY46QontHGn3tWXWPUTYCr9XfVV04MyPRGor1B9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t77HwjFouhlGLqQi4b1Nupg8Ek7b2rhk4wP2JDAJkGY=;
 b=HmH3ndoJnkYYIQxqJMRbrQCuT1sf9SYIMiZMo2/Tn3p5nt5pstcxXnDbPCcBqkIVP9YBgv/dh0eCF/+MmIIjdLPD1DQEf6LPYRawnv//qdlGmq7QNDMJwCaI8f0NLYmO5cruhVMpFHuIgioqUwGTnJoXc4ftmjspifciNETRkgCVMLmcnSGOvT8jPBvDWs7HnuqjHTmi6yhVgMQoPbeIgI0RvNodfGRETGNkuAEV7fgmeL7LOhVuazXJBtdCXRS1d8C041V4B1RcrCmOlz+KfptSDB2imcrcuMAZTQjB0OAcS6GrWpn0UFGKfutLnYn31xS9qJLf6X1uMBP99bXzcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t77HwjFouhlGLqQi4b1Nupg8Ek7b2rhk4wP2JDAJkGY=;
 b=HPCGwOZ+FvB9sjYVnpNfDII5YuWxLNVVcVXG7tuBE/wZJ+5EOshywCQ7DNhEJ6hcY3f/jtnrNtjYTXoVhdhkUY6XbYB9mQeXLVuaJvu6LG1trEiV72rLoMN+RsCM+41f4jGN4UXgwnG85WP1wgi4bKe9nc/qtzeFcFEPov594mE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5087.eurprd04.prod.outlook.com (2603:10a6:803:5d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.26; Tue, 16 Jun
 2020 09:16:13 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 09:16:13 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: dw-hdmi: Always add the bridge in the global
 bridge list
Date: Tue, 16 Jun 2020 17:04:52 +0800
Message-Id: <1592298292-17634-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592298292-17634-1-git-send-email-victor.liu@nxp.com>
References: <1592298292-17634-1-git-send-email-victor.liu@nxp.com>
X-ClientProxiedBy: SGAP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::35)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SGAP274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3088.19 via Frontend Transport; Tue, 16 Jun 2020 09:16:08 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fc37c0d0-1a0a-4dce-0310-08d811d5ea4e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5087D6B491161E8896FAA647989D0@VI1PR04MB5087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 04362AC73B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LmWP0ytafJWi250EiXcTWGqFO68qbEsREzKJOoGnjtyBJPERSv3KNkSVmbXyCuDhH69IwfeEkU9lOu4orm4IbSNYv3y7wf95u+9E1rCeFyieI88r9sIOnxCjO1SbZfsGDxYDrvrZFQM9AjCK1hvAOmb5V7KdB1pzLG0HFW3eXDd1tPo+WYc8sYZhFZwZOZpUOqoqgfhZMWGnozd1gdfBp6O/a6V7dMIgYQJwYVwm/GiwyFxDz53y8iMK8LVYVfCCES2yJDDoxTINeNMhXq+s8Cx6QPmvy9ylddmbzcWgnkyhc+4rEdIrN1BAzuoXhuj3izBAMIcRQgQ5MzoLNx7WIrxD5GlRAJ6beY3Hvmq+XdgP2XoO4p83zG6FEFf3EbZK1c7GIBVaD1Gi9+CaO4feUiZ0ZJBvCkeicwSFgECZ8SWl9sWV8Q0K9wNRXSfq/jgWl7I05wBt5nAugd0AEvdTeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(66476007)(6506007)(26005)(6486002)(2906002)(8676002)(7416002)(966005)(8936002)(6666004)(66946007)(316002)(66556008)(186003)(2616005)(52116002)(69590400007)(4326008)(83380400001)(36756003)(478600001)(6512007)(6916009)(16526019)(5660300002)(956004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: EN1trwI1q3kn5lperpGtXzqcGuS6yEMiKGQbEo24KApFAkesestqv6f/zY2ac1QYGpYrao1rtA3jYUZMgaNZaUFYcaxdiZbe7o0mMIEoRmYdYHYKRJLduqk3u105eX4yqSqK7C//15MI/K3vUHPLHvTTfvUPIE1NK6XIsaPy1ed0N7f8kPd5d7GMF1JoUQMRnhxzDESH08F7iXob4GL6IcaDv2DhtSjGNIgoWwkTCgAYiPyPt/kxRGqy8qrfpR9vNj6/NY8ZslySZ+alw9GrQ/IHbsV+4yMiqVx/OM2Pvssw+HkRL3gesw98i3rnSNDVtp7xJWQTOG70ZKies5eVSF9pfAIyIbDfbaMg1BR7oNOzC94WPmX5Hzrw0ONyJ/GeL0PDghldcTBYcNcv5EUe5qFw2VyDUaCYroO99hnZAY+/c78X0hp670pcyVEBT23R4vK4L9IOXbFQD7HlKJk9hsXrFuYw6y5vGr1UzrZNbkk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc37c0d0-1a0a-4dce-0310-08d811d5ea4e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2020 09:16:13.2221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BrrjVs3kHrddC3tYe4kF0X3ZuvlCns6WFNujppsuTH8IPrlDqDeStfHk1V8EK14kX0PQhBQ+ulOObj+b2vqGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5087
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: joabreu@synopsys.com, jernej.skrabec@siol.net, darekm@google.com,
 jonas@kwiboo.se, airlied@linux.ie, narmstrong@baylibre.com,
 architt@codeaurora.org, a.hajda@samsung.com, boris.brezillon@collabora.com,
 Laurent.pinchart@ideasonboard.com, linux-imx@nxp.com, cychiang@chromium.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It doesn't hurt to add the bridge in the global bridge list also for
platform specific dw-hdmi drivers which are based on the component
framework.  This can be achieved by moving the drm_bridge_add() function
call from dw_hdmi_probe() to __dw_hdmi_probe().  Moreover, putting the
drm_bridge_add() function call prior to the interrupt registration and
enablement ensures that the mutex hpd_mutex embedded in the structure
drm_bridge can be initialized in drm_bridge_add() beforehand, which
avoids accessing the uninitialized mutex in case people want to call
function drm_bridge_hpd_notify() with the mutex locked internally to
handle hot plug detection event in the interrupt handler dw_hdmi_irq().

Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Dariusz Marcinkiewicz <darekm@google.com>
Cc: Archit Taneja <architt@codeaurora.org>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: dri-devel@lists.freedesktop.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Laurent,

I may see the uninitialized mutex accessing issue with
i.MX dw-hdmi after applying your below patch set[1].
I think patch '[22/27] drm: bridge: dw-hdmi: Make connector creation optional'
triggers the issue.

[1] https://patchwork.kernel.org/cover/11569709/

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 34 ++++++++++++++-----------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index da84a91..4711700 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3247,17 +3247,25 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	dw_hdmi_init_hw(hdmi);
 
+	hdmi->bridge.driver_private = hdmi;
+	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
+#ifdef CONFIG_OF
+	hdmi->bridge.of_node = pdev->dev.of_node;
+#endif
+
+	drm_bridge_add(&hdmi->bridge);
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto err_iahb;
+		goto err_irq;
 	}
 
 	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
 					dw_hdmi_irq, IRQF_SHARED,
 					dev_name(dev), hdmi);
 	if (ret)
-		goto err_iahb;
+		goto err_irq;
 
 	/*
 	 * To prevent overflows in HDMI_IH_FC_STAT2, set the clk regenerator
@@ -3290,12 +3298,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 			hdmi->ddc = NULL;
 	}
 
-	hdmi->bridge.driver_private = hdmi;
-	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
-#ifdef CONFIG_OF
-	hdmi->bridge.of_node = pdev->dev.of_node;
-#endif
-
 	if (hdmi->version >= 0x200a)
 		hdmi->connector.ycbcr_420_allowed =
 			hdmi->plat_data->ycbcr_420_allowed;
@@ -3357,6 +3359,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	return hdmi;
 
+err_irq:
+	drm_bridge_remove(&hdmi->bridge);
 err_iahb:
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
@@ -3371,6 +3375,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 {
+	drm_bridge_remove(&hdmi->bridge);
+
 	if (hdmi->audio && !IS_ERR(hdmi->audio))
 		platform_device_unregister(hdmi->audio);
 	if (!IS_ERR(hdmi->cec))
@@ -3396,22 +3402,12 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 			      const struct dw_hdmi_plat_data *plat_data)
 {
-	struct dw_hdmi *hdmi;
-
-	hdmi = __dw_hdmi_probe(pdev, plat_data);
-	if (IS_ERR(hdmi))
-		return hdmi;
-
-	drm_bridge_add(&hdmi->bridge);
-
-	return hdmi;
+	return __dw_hdmi_probe(pdev, plat_data);
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_probe);
 
 void dw_hdmi_remove(struct dw_hdmi *hdmi)
 {
-	drm_bridge_remove(&hdmi->bridge);
-
 	__dw_hdmi_remove(hdmi);
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_remove);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
