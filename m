Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4115421994C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5BC6EA0C;
	Thu,  9 Jul 2020 07:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140074.outbound.protection.outlook.com [40.107.14.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D426B6E96F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 02:06:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbfWjblhSavDnaoOTSDPuAVE4Btie5jTrHfkROF4WE3u/opaAJHdmJmJCV8nxbGzbWpO5XEA5rGheNwlcZwYfGI0M/4Y9gCdYQiuvml9fnZ9lGK/DGXnnSSMbOxyhkqrnf9ODiq3LgQyOA4uBBJSQXgn3KnTWty7nlBqGyG/dCHkqMlGKUwIMSPHCqpqrc+D60+s3rkT0OK4rmain5XRuif0Sl++1Btl5nOxxjtTamwAeDeO6tLjQK5XBKa6Whl7vunBdWPVdLCwTXjnWN47maAzI70KPNs3+7NX+JdaR1uI/dm4/CQr/iEdQA+tUrfQOXMkYiRzMEV918P0dfkWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olUYGj60buZqB7HOTDcq/8WMyaSkfI+0r0zCUX/S/+4=;
 b=PBTAovbkcPxgvshU0zo7X3QTe/IfvQBtiEceWTsIBzBMkYNrVOvVCrKPu1ne3NVfu3EfA6wDD08hhKsqfLVDspPDN7OH3opcV0g40sypcUBcfKbaUeHeAI8Ab9EDJZrHdztq43Zs0zhNiRHz1RjJoQtpr4pmhiBDkj+cGYPlOEqVdrjSmd4bjQYFgZh58Dl+9NfEeh7S114u07oyq+nLDfAaHTkPf42OEBSKX4m8oU3bln3L2h6x/WQWmPp3q9851C+M7blhV+6qnqNxnyX61uoSUgkN3ib1h4+oVkF79X/NhHs9xGFIqRt1C0rfjD7+jexYdZhVGBd2E3LDjMPkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olUYGj60buZqB7HOTDcq/8WMyaSkfI+0r0zCUX/S/+4=;
 b=CP0cNDFfPZMgYnj7adQA/pIgc0xmdAliGyUFgTK/17bsiTDFI7fLHw9gs8P9LDLR4fjdHDEuxLCvfp4q0ua0S1C4keNqfMEvzhramQ6SK1hArn+VPOjGzxPlx58jkCUqa98AS9hqXd4mDsDiFUGIDvA6iJnnrDa3dyIG+GYggvI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Thu, 9 Jul
 2020 02:06:31 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3153.031; Thu, 9 Jul 2020
 02:06:31 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v2 2/2] drm/bridge: dw-hdmi: Always add the bridge in
 the global bridge list
Date: Thu,  9 Jul 2020 10:02:36 +0800
Message-Id: <1594260156-8316-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594260156-8316-1-git-send-email-victor.liu@nxp.com>
References: <1594260156-8316-1-git-send-email-victor.liu@nxp.com>
X-ClientProxiedBy: SG2PR01CA0110.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::14) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by
 SG2PR01CA0110.apcprd01.prod.exchangelabs.com (2603:1096:4:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3174.20 via Frontend
 Transport; Thu, 9 Jul 2020 02:06:25 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d4753355-2259-4e32-876a-08d823acb278
X-MS-TrafficTypeDiagnostic: VI1PR04MB7183:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB71837FC2AD79AC6D87A2304398640@VI1PR04MB7183.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RuUk2G9VXtEvvN0Vg7WTD6X8vZZxaxR1P3z9+5aqRoChtfW5gaPEK/O3vyapCMekrEwPbOGM6GFz49AG6EcfsUbIi8GLHvxErAnQYFKTLG8SmgkH1rIFNqfcnv5GkwRKReZHMfjxydgmzKVoZ0jNx2uM96VtBFNkQfqShTyUWrBlWX07mKB/KqC3YW6E8DW9r2RmTgE4W4qAcYMlnDssNN0FtQFXMHfBJY6B6ciBNq12GBARAhU75Qs4N83S35nQwyS+xeKytE2ogJjx0C4KeNMyJmugC2ijr1eFDmjJ4JvbW9uVv4FsqaKA+c+G4TZ2UCaeod/GsFc8rHCtSZoxAvLPzkCYyaTffFwCxzPHk+qB/aAXeg3SRpr85OsVGtcY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(6916009)(66556008)(69590400007)(66946007)(66476007)(478600001)(54906003)(5660300002)(316002)(2906002)(52116002)(6666004)(8676002)(6506007)(86362001)(7416002)(8936002)(6512007)(6486002)(4326008)(956004)(2616005)(186003)(16526019)(83380400001)(26005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: px54b1esd4sQJI73KZ7mYSG4TFRJ5AUTojx4wN9O6TzJTBPwO28cFwfmiAjqu2aB3U0IHnjOqShZEhsmxOVvTBmLA6HE0OzwdqVfuOkof/Uq5+Xr5wEZZfCEpK1uqSoTgXnDODAG0JI7aKf6weFSdlWsnu2l6MlN3g+7BPPFGSk8w5Jf80kRu9J/UgoDQKU4fNnXzu9EZ+CrXUMJd5fbS/kybM4h2cqFytHNcDMOutqibx/I2dSQGXm0AID9e2ybMkMBOTlV599vp7MkI9rQErD1QXxYt+PbXeBozSs/2JlT9EsX1AQ1H3cD5EGckbnRF4aTEhxgj1WddFc5fliW/XAveG2LQpofND4yue2/z8GCKfcEddN68ucwPGdb+o5uhW9MINI0XcFLuf1Q4hnT//t+HZkvwtwZe44WxaBtnC7c7irXEzguzTK3cMJQhH4haS1+0D8O761VApQblj2ISrjOIbEM7jldkFH4wCmzNfE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4753355-2259-4e32-876a-08d823acb278
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 02:06:31.1443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54A1uPVzyDSoIzXG3vTykvNWIyPNg/88iIAh0eINa+EyqM0mwNxIh7BNx0eWLFb5DAFu/S36xsB5pxX+SagqzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:06 +0000
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
Cc: Jose Abreu <joabreu@synopsys.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Dariusz Marcinkiewicz <darekm@google.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 NXP Linux Team <linux-imx@nxp.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It doesn't hurt to add the bridge in the global bridge list also for
platform specific dw-hdmi drivers which are based on the component
framework.  This can be achieved by moving the drm_bridge_add() function
call from dw_hdmi_probe() to __dw_hdmi_probe().  A counterpart movement
for drm_bridge_remove() is also needed then.  Moreover, since drm_bridge_add()
initializes &bridge->hpd_mutex, this may help those platform specific
dw-hdmi drivers(based on the component framework) avoid accessing the
uninitialized mutex in drm_bridge_hpd_notify() which is called in
dw_hdmi_irq().  Putting drm_bridge_add() in __dw_hdmi_probe() just before
it returns successfully should bring no logic change for platforms based
on the DRM bridge API, which is a good choice from safety point of view.
Also, __dw_hdmi_probe() is renamed to dw_hdmi_probe() since dw_hdmi_probe()
does nothing else but calling __dw_hdmi_probe().  Similar renaming applies
to the __dw_hdmi_remove()/dw_hdmi_remove() pair.

Fixes: ec971aaa6775 ("drm: bridge: dw-hdmi: Make connector creation optional")
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Put drm_bridge_add() in __dw_hdmi_probe() just before it returns
  successfully so that the bridge shows up in the global bridge list
  late enough to avoid potential race condition with other display
  drivers. (Laurent)
* Rename __dw_hdmi_probe/remove() to dw_hdmi_probe/remove()
  respectively. (Laurent)
* Cc'ed Sam.

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 44 +++++++++----------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 137b6eb..748df1c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3179,9 +3179,11 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
 		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
 }
 
-static struct dw_hdmi *
-__dw_hdmi_probe(struct platform_device *pdev,
-		const struct dw_hdmi_plat_data *plat_data)
+/* -----------------------------------------------------------------------------
+ * Probe/remove API, used from platforms based on the DRM bridge API.
+ */
+struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
+			      const struct dw_hdmi_plat_data *plat_data)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -3438,6 +3440,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		hdmi->cec = platform_device_register_full(&pdevinfo);
 	}
 
+	drm_bridge_add(&hdmi->bridge);
+
 	return hdmi;
 
 err_iahb:
@@ -3451,9 +3455,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(dw_hdmi_probe);
 
-static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
+void dw_hdmi_remove(struct dw_hdmi *hdmi)
 {
+	drm_bridge_remove(&hdmi->bridge);
+
 	if (hdmi->audio && !IS_ERR(hdmi->audio))
 		platform_device_unregister(hdmi->audio);
 	if (!IS_ERR(hdmi->cec))
@@ -3472,31 +3479,6 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
 	else
 		i2c_put_adapter(hdmi->ddc);
 }
-
-/* -----------------------------------------------------------------------------
- * Probe/remove API, used from platforms based on the DRM bridge API.
- */
-struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
-			      const struct dw_hdmi_plat_data *plat_data)
-{
-	struct dw_hdmi *hdmi;
-
-	hdmi = __dw_hdmi_probe(pdev, plat_data);
-	if (IS_ERR(hdmi))
-		return hdmi;
-
-	drm_bridge_add(&hdmi->bridge);
-
-	return hdmi;
-}
-EXPORT_SYMBOL_GPL(dw_hdmi_probe);
-
-void dw_hdmi_remove(struct dw_hdmi *hdmi)
-{
-	drm_bridge_remove(&hdmi->bridge);
-
-	__dw_hdmi_remove(hdmi);
-}
 EXPORT_SYMBOL_GPL(dw_hdmi_remove);
 
 /* -----------------------------------------------------------------------------
@@ -3509,7 +3491,7 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
 	struct dw_hdmi *hdmi;
 	int ret;
 
-	hdmi = __dw_hdmi_probe(pdev, plat_data);
+	hdmi = dw_hdmi_probe(pdev, plat_data);
 	if (IS_ERR(hdmi))
 		return hdmi;
 
@@ -3526,7 +3508,7 @@ EXPORT_SYMBOL_GPL(dw_hdmi_bind);
 
 void dw_hdmi_unbind(struct dw_hdmi *hdmi)
 {
-	__dw_hdmi_remove(hdmi);
+	dw_hdmi_remove(hdmi);
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_unbind);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
