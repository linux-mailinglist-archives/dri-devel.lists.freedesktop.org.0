Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3720EF94
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEBE89E86;
	Tue, 30 Jun 2020 07:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0642D89BAF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 02:45:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpPlQEDL6lymuacqqn3ZAGTmax+zySKsnfOA+DYvZEfIg+jRpQOW+xLLxt6UIzUNL2+df919UqFbxuDCXGkbx80StKqd/zUnjqov9BXLq67smZdoqgm899PJSiy7MQ2BHmUEDh+Ku+FuOhkHxAlDW8BqWqT93t3uS9o86x319svTrDZ4SIvo5rUYgLT4gkG46fhC6C9iSrBz00tnHHg7dxkXreuCUqBl1ovp5NO5DVUSWUmqHg+YQxnupDq3YU9NAi1xMdT5XXVq5KjADXMyye/7jrpuEYG8xj8SEHRliOHtXHppYKtlUk7voxD3ci8PwpB0DSP1R4EpFwy/Q/CbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olUYGj60buZqB7HOTDcq/8WMyaSkfI+0r0zCUX/S/+4=;
 b=BdgaCXZp/7E9Yua1l+jX8YqhpxYYgorMCxxhsQUTtHigtvn3wynIomUFp2HKCGCICLbl8vjsOV1kaRX4nXkyYgFvxXyJeSrnVcqf/9DfaggGLTZU8hXpYpmNYJBJwRyveVMizF4GEB5xoyO7nKH/9AXIdILMGVE+cHK0Le9q5D5aaSGOTNyD+gpRwCdg04IoJzWke7SF7ihB6h/9466N5PEMJkiK2Lcy+tfqoa+q5dZFIalPU+9H0v1RMwznr07Z0KBRftz0YEybt8CiX/yKM70WybzQUsdr1tycknv48KNxqnzSEWw3wj3PT2NT7LkxxayvHtL2rkA9xOrvL+u4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olUYGj60buZqB7HOTDcq/8WMyaSkfI+0r0zCUX/S/+4=;
 b=owejo1UO8Uzek2DUuECw+3qHbC1bgfh9JmSVuzV9mXb7SBdZ31kQLNibRfFBQvQU+iMyk3wuxuKVJ1LLtPZnq1VHQHIGytCQju5wpkIEL0RNOLJDs4mjYMOkaAWpToO+sFFoKrcGCvh4hSNQYOLKSmcWrbWt/wtTD5YJDRH6siw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3949.eurprd04.prod.outlook.com (2603:10a6:803:23::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Tue, 30 Jun
 2020 02:45:56 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 02:45:56 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/bridge: dw-hdmi: Always add the bridge in the
 global bridge list
Date: Tue, 30 Jun 2020 10:33:40 +0800
Message-Id: <1593484420-28309-2-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593484420-28309-1-git-send-email-victor.liu@nxp.com>
References: <1593484420-28309-1-git-send-email-victor.liu@nxp.com>
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by
 SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 02:45:51 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e753daec-c18d-41a0-fe98-08d81c9fb67b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3949E9F91DC38C59514F8500986F0@VI1PR0402MB3949.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UlDV5a4Ow1wByVyayR2hV0vbgvQhZDyhF51YQpp3sOpAby9yM0S3Jd4MI2CdqMZpp/u9cW8YphJuQqkFer4V+NMwfc9mLw0tiSBffWBdcv1SjeNIlhy+SrRSCSPn3YfEQTfXAw966alTnbc4IWgdp/6qkiDs2iNb1fS/ZsauSYyFwVK+3bPlXaQ4G9mJf71M7vgt6jMxKTXaaT6emm83nwXh7yHFwQ8kHA0sLF+V9LKx3dnABmTtPHvPUi5QicBRialgT7b4+log1GLsR+QzB1UB3ZWw7v7WZJI6p/5lCLclmGNbG+Jw8peJ4FM+X/AfJ5DifTC0SVPz0AMaQEwxlYB2cSA5YHtiQqWIDtU65cmg3rbYCislyVZgXCuVDbHp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(316002)(83380400001)(6506007)(26005)(2616005)(16526019)(6486002)(54906003)(6512007)(186003)(86362001)(36756003)(956004)(6916009)(6666004)(8936002)(4326008)(69590400007)(66476007)(5660300002)(8676002)(66946007)(478600001)(66556008)(2906002)(52116002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: LS5fR/qcJtDgjdPZRRFED4womjVP/QxLc9cj1Yhi9gYc9H3sFbd5DJTREILx8wfQxTXIddnOYoNUYIZ+dvlTDJpUJa8s5jkTHqKWyA+3FCeBAVv+XmaOuVMLcH2jejzvvhJFkU7Cb/83ar8zbXvJ8J1acWfqZJyhQCD6hcHDKvGHI2cvTGORbelxRvWHb0IV6xfTQWf3DgSaJvBaGhiANrQgAHsht3z3aumbUWvRvshUFeRXsFGLq7pDPutb2Yxj+u7jGl7NpqFgwyDX8z+bhk1DRFOPyDaWFBlRkIfaXIDluQzsazx5nuaWDb3zvK9wOpK+giiwl5cKP1uK3khMn3m79QZhslNUxNTEhX9eokxpJ+kOOIW7mOxQPND2KWC7mQpOEwvO8S37UcY+H8dQAPYOffQBPpv6VYYuNJfX4KPvUPpTOzAoanMOZuNeoGYn1309WhMfIakzP+wUyeTSYpHwnyEmGKpPAansi/ZSUA0=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e753daec-c18d-41a0-fe98-08d81c9fb67b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 02:45:56.2141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnsmIcbxWyquvEa0z+nmivVBWkRqeeQ/clfwPJRjLBpd5U2WQn3rirZBfbZGP2e8+g7UCHn9H6RY6iY5S0Dk3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3949
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
