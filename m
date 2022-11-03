Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C0A618765
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 19:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5F110E79B;
	Thu,  3 Nov 2022 18:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2041.outbound.protection.outlook.com [40.107.105.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EC610E799;
 Thu,  3 Nov 2022 18:22:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKtm0ahJRkrD+1qlAlBzs1XYoIepzTyV+upmqR48Iyh5EcIW3cjRvjq4pbjYy/qBVfTcMUKK8Cbq4DDLSEyoYPiVYU03Fa0lAotWK6Jn6bYe6xZiLVu4l2d6u2uBQG7WS3cifePM5JtLvdewjepASbKG1/fvIfv0NMief38FId358+wyvlS4TJTxePuVnl/PL0zGn0Mxkcl1RDW/0xIPuVOwKTu2nK1NXTSFWvdwPTcUj9PlBdR4vPehZxijl/TNIvWQgMs/+8yFESTBOYDrVxQnKJ32VvEokOAcHR76UYkdmUr4Gj2X/Ie0rtrZtrj/w3G6PttB/UjC94Dlpm9ONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEypwbDE72PNOSHsQ4KOrIxfmlBzUI43Xxc+/tlLyGE=;
 b=K4k8B4JlyFuxNSCYOZA49L50oeehgo0alCLZkr5T2613xfPpk3YSJXBE1YQ5mg6dpsvLt5Ji25EQ1cr9tEZAv2TCr5xZ2QFKO6CR3usKQMuBir9l3+a20JeWHOyCCiahJU69NrBH9kHoZ+Wx0bcLCU9YaxQS1OszPE3piXPhOhHtvzhJ3pAwaFBgNeCoQSYsw4L3jY4mKYmGCIwZ7YbidGv4qqrNvsQTkW8TaKBOUmmEfpnrZoVS+cg6loU8JuA8XhXJLPoVzLv4kg0ILvgcM/LJ5iheIXH2hu0PDZ7YVTDuWTg4Mq86qA0SNkYgEu/jn/bkpT2aLw++Bo/1dVrqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEypwbDE72PNOSHsQ4KOrIxfmlBzUI43Xxc+/tlLyGE=;
 b=zINUvUtTaKwFtxGvHUvnSMkoQQwbQGaAhKAvVo9ATVN+gm2aeX24/R37EM5QKvA72yjMToSK89U2ckmjJqv//CBDs3ft87b9aTicytDJCrl6eHga1c1l6FnEFRXA83AZEb19iwyTZYb4UAznpFIm2/5p0SY3iHeHxlKwKWMdEVUsB2ukzV6hJcL2GBPig8wW1k7/we/uCTwSKP8j8vsGHVMZgKSEEmQqafthOuv+BuoLOaVG69ob+zngH7CMywCRKt0oRebvmA45w61vOSrQgmQptj/3Cojbav0ulqAzXc4jDZTjwWeFBCy32KeKInkIPI3rs6arvsPXp+Ab9638IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AM0PR03MB6195.eurprd03.prod.outlook.com (2603:10a6:20b:159::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Thu, 3 Nov
 2022 18:22:49 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::e9d6:22e1:489a:c23d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::e9d6:22e1:489a:c23d%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 18:22:49 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: Convert users of drm_of_component_match_add to
 component_match_add_of
Date: Thu,  3 Nov 2022 14:22:22 -0400
Message-Id: <20221103182222.2247724-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221103182222.2247724-1-sean.anderson@seco.com>
References: <20221103182222.2247724-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0027.prod.exchangelabs.com
 (2603:10b6:207:18::40) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AM0PR03MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5c91ea-a2b7-43f7-db18-08dabdc86995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: amDTUUEjnKENVBi/YXX+yw61yWN/UWqjQTYltOHhK2bTkUHlYynL8FhsPXNKupuQfdMtA4Q2I6h5YPoyxbaBt2QeN6pqb8wcMhv47M6skqtoZs20EbQSphAGN6DGGpAucx/Cm9jANZzXUN+uBEURpvbZtFb/msR5FGH/Mg3Esz0C0WHWi3cMrIIMHMSwwPyL5eYMVN+UXO5EuD4qT6A8ecHcKE8ed1Tat6a5vYIfKgVxZXE3BQziFs/ERF2tyBbzDJbTcDm7BbQ8IQbXtps08Ulk15nunOzQI+kFvXYK8L/RQKPdtakarFpdmNMEKjdu+C7sxCawe1YuRdPsIaqcjEWDaEu1AAlCHv9xTzfwIgW4HM8lo2YlTUC288nx6bWCHOwFzdBUhSgtsonShv519eMRisfmzdWxH6cTbXf/8SnhQTl+4TUp6H8E0mHZCtevXI0Fz1rc+2uwFb8yCjt7GqwLves//5hirMmeB9yBaOeQe/IKTFi19z2kV066yUF97UUFLuiO2hpA6gPAiCXM9UH6uG+/8uvyZ5vdKS+jwYPT+c3oIeTqpaMHI0FZ9cQgOmO2Zp/2XgLCyL2oQ144ZWL5hVUzjhBjewDfTOMbbjoPPpRmOwyhuQst6bMlsJo/InGj73a0oU2HjozCgkTLblEawuLc786dGyW1NNkkgJjhjT4df2g6ofngPOFJ274iOcYm+Sq7P+FS/+DsVXCG8pvYOg/Kr0ihsPd+aDm3x1Beh8chUK8q1pQRurRetdzG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR03MB4972.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(136003)(396003)(39850400004)(376002)(451199015)(2906002)(8676002)(66556008)(66476007)(66946007)(4326008)(316002)(26005)(6506007)(6512007)(8936002)(36756003)(30864003)(110136005)(44832011)(54906003)(41300700001)(86362001)(5660300002)(7416002)(7406005)(478600001)(6666004)(6486002)(38100700002)(83380400001)(38350700002)(52116002)(186003)(2616005)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DxCnKaejCp/3Y/AOexMoAwSH9u9isLnVxMwzpqxTdPtoUGsHFIftqMmL1hhK?=
 =?us-ascii?Q?9SEt1SMd1J9IfGxRB0ALbjETM4vja3g2DGsFVXu4lo749oZ06kN+ViUQ7s1n?=
 =?us-ascii?Q?25yxbBuRHHaloRi4o0UF7mDPwXE+44o3nx/Si/glWQOLmoahy1SFXsyTbH4v?=
 =?us-ascii?Q?oSTdq6e9uDc8za1llH3yz6xNnMTgZgm8dZ0fTj1U47n05WV9RZHIIstM3ocw?=
 =?us-ascii?Q?6cpxv0/v8eozCEqVgi6t74YyIh03WbGSQ3kIEHXikuUpVtOX6njGtUYYAPyj?=
 =?us-ascii?Q?gcObb2Kk4Hl4Z8gVtRoQqb3a5pPfoCk3wMCSY1q4GKqsu+YuN8n7Dbz6LCno?=
 =?us-ascii?Q?IqEIuV38wuswQG9eDbBpD3f41sxFrePHjZRwvgQbpO2SV7Oxj7LYMmkeivSe?=
 =?us-ascii?Q?RvP/dmfPC6fdOAU1JV8dcqNQfJBwuOg/Frn1ULV//Hn0/c6GRb4do1yFvu+I?=
 =?us-ascii?Q?vuL73mPawPGWSJV08iMcr3a0z7GD0cWYZJ1beKrVxNmradtX9+GU2rA8XfWB?=
 =?us-ascii?Q?v4DU93idpFovKVwQzxjsj9vFHnYeSjLa1r/jviqwYZf/WbiFCu16HO5y7ZxC?=
 =?us-ascii?Q?CAccjKM8vNUkMsl+HO+k3VVRYcpfw1/ltJw3ycNUMySthJACgwamoBIKKdPr?=
 =?us-ascii?Q?SfBBMbzT2SJim2ES2/DRHqQYjysH4ugjHnpzEQ0RwzuaX3A4cYnWWlDigpEe?=
 =?us-ascii?Q?JxjaTgk/dtLEh034jzrlN1Z6b/t6hR1nZ/eov1UlPMapPKiN5Z0aMXafESEM?=
 =?us-ascii?Q?Y2fTCY7L/iFJC4epHK/fR8TuG6McZdXwaveFItK11dmtwUE2WHKqcJ0tm5Ur?=
 =?us-ascii?Q?bgMEVroYMypoinbyBZ86y0ExGCk6HzUUcGSPOZIpwcmypxf+v/f/mjeXBrZ0?=
 =?us-ascii?Q?zt8qAn60TfdUFqzcE3sRgEGf40mFxkUbHf0FNRkxlJbX35kqRzqsXkIz4+9B?=
 =?us-ascii?Q?uaMiiJSe3NQbZTNpXsuv7v2MjMHxHydzz8jHa8MkJgTgnRbn2+CkSCvtvjnt?=
 =?us-ascii?Q?YHWRBgi688uv0zFJs7Q7ITl2PVR2G6v5xi00h9mA59oMI1veDb2GlsBQcia4?=
 =?us-ascii?Q?lLFisan4iK+MvZ7KxvejRmWocitq8GCPzDR/lTcSHsFhjty6zxnd9LUDlMQ4?=
 =?us-ascii?Q?jW50l4NC8jA+duR7TI5QiXSvYSifSdUIrTvEXsBuWF7DB6nLozElbbpWzStA?=
 =?us-ascii?Q?iiEd+JDZW/kZixwVCoRKl636iEji+wIt0RF1SkcA+BlE2LEqRmdaJPtA6Qrn?=
 =?us-ascii?Q?ca1lJ74Hre6XSR01GsWzDxVP8T1Me2BTjnswRCoHrHBIujvU+z2+heTOfhkm?=
 =?us-ascii?Q?U+kHrdKi6D4pCPFOCIKpr4jfdd5eEaU9LnK+Wt1IegpI7QvwdPzGa/7U9frX?=
 =?us-ascii?Q?o8zJO2Ge5HehSNt/wJcOQxo5r+xB6CA4IQ2i0XjecHrfUN4yuB8VmWID39yv?=
 =?us-ascii?Q?03h4L8NOwpqyAnWMtaSD5aY+if9DZHJAQ0ZfBCkySWi4QlELOugnWaX4UYAS?=
 =?us-ascii?Q?tUlp0mWnwS+pvCsqiuvRF1F0EnxiIxzgAZAZO75gH+EXdXViqcpNvp22MRJi?=
 =?us-ascii?Q?YPhhIROHAliR25RVEc00UkXt+jvmbMP7N+MKEqHLdkW/kjLFfkyxxT77sX31?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5c91ea-a2b7-43f7-db18-08dabdc86995
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 18:22:49.0446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0dMgfXQ7kAoHa7NHfZwmxl9quhp5U6+2XkguCWVQjY4uWcpM/de2RBtbkjVEF6mlExF/DV50w8+Ltf/l8TWhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6195
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 John Stultz <jstultz@google.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, linux-arm-msm@vger.kernel.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Tomi Valkeinen <tomba@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every user of this function either uses component_compare_of or
something equivalent. Most of them immediately put the device node as
well. Convert these users to component_match_add_of and remove
drm_of_component_match_add.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  6 ++--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  9 +-----
 drivers/gpu/drm/arm/malidp_drv.c              | 11 +------
 drivers/gpu/drm/armada/armada_drv.c           | 10 ++++---
 drivers/gpu/drm/drm_of.c                      | 29 +++----------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  4 +--
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  3 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  4 +--
 drivers/gpu/drm/msm/msm_drv.c                 | 14 ++++-----
 drivers/gpu/drm/sti/sti_drv.c                 |  3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  3 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c      | 10 ++-----
 include/drm/drm_of.h                          | 12 --------
 14 files changed, 33 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 9fce4239d4ad..e5bf439b799f 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -103,10 +103,8 @@ static void komeda_add_slave(struct device *master,
 	struct device_node *remote;
 
 	remote = of_graph_get_remote_node(np, port, endpoint);
-	if (remote) {
-		drm_of_component_match_add(master, match, component_compare_of, remote);
-		of_node_put(remote);
-	}
+	if (remote)
+		component_match_add_of(master, match, remote);
 }
 
 static int komeda_platform_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index a032003c340c..18e58863a2f1 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -352,11 +352,6 @@ static const struct component_master_ops hdlcd_master_ops = {
 	.unbind		= hdlcd_drm_unbind,
 };
 
-static int compare_dev(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int hdlcd_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -367,9 +362,7 @@ static int hdlcd_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;
 
-	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
-	of_node_put(port);
-
+	component_match_add_of(&pdev->dev, &match, port);
 	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
 					       match);
 }
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 1d0b0c54ccc7..aace8b87c6d3 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -926,13 +926,6 @@ static const struct component_master_ops malidp_master_ops = {
 	.unbind = malidp_unbind,
 };
 
-static int malidp_compare_dev(struct device *dev, void *data)
-{
-	struct device_node *np = data;
-
-	return dev->of_node == np;
-}
-
 static int malidp_platform_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -946,9 +939,7 @@ static int malidp_platform_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;
 
-	drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
-				   port);
-	of_node_put(port);
+	component_match_add_of(&pdev->dev, &match, port);
 	return component_master_add_with_match(&pdev->dev, &malidp_master_ops,
 					       match);
 }
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 0643887800b4..c0211ad7a45d 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -184,10 +184,12 @@ static void armada_add_endpoints(struct device *dev,
 
 	for_each_endpoint_of_node(dev_node, ep) {
 		remote = of_graph_get_remote_port_parent(ep);
-		if (remote && of_device_is_available(remote))
-			drm_of_component_match_add(dev, match, component_compare_of,
-						   remote);
-		of_node_put(remote);
+		if (remote) {
+			if (of_device_is_available(remote))
+				component_match_add_of(dev, match, remote);
+			else
+				of_node_put(remote);
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 7bbcb999bb75..0a474729ddf6 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -78,24 +78,6 @@ uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_of_find_possible_crtcs);
 
-/**
- * drm_of_component_match_add - Add a component helper OF node match rule
- * @master: master device
- * @matchptr: component match pointer
- * @compare: compare function used for matching component
- * @node: of_node
- */
-void drm_of_component_match_add(struct device *master,
-				struct component_match **matchptr,
-				int (*compare)(struct device *, void *),
-				struct device_node *node)
-{
-	of_node_get(node);
-	component_match_add_release(master, matchptr, component_release_of,
-				    compare, node);
-}
-EXPORT_SYMBOL_GPL(drm_of_component_match_add);
-
 /**
  * drm_of_component_probe - Generic probe function for a component based master
  * @dev: master device containing the OF node
@@ -130,10 +112,9 @@ int drm_of_component_probe(struct device *dev,
 			break;
 
 		if (of_device_is_available(port->parent))
-			drm_of_component_match_add(dev, &match, compare_of,
-						   port);
-
-		of_node_put(port);
+			component_match_add_of(dev, &match, port);
+		else
+			of_node_put(port);
 	}
 
 	if (i == 0) {
@@ -171,9 +152,7 @@ int drm_of_component_probe(struct device *dev,
 				continue;
 			}
 
-			drm_of_component_match_add(dev, &match, compare_of,
-						   remote);
-			of_node_put(remote);
+			component_match_add_of(dev, &match, remote);
 		}
 		of_node_put(port);
 	}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 1d2b4fb4bcf8..4a0dba34a6e7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -590,8 +590,8 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			if (!first_node)
 				first_node = core_node;
 
-			drm_of_component_match_add(&pdev->dev, &match,
-						   component_compare_of, core_node);
+			of_node_get(core_node);
+			component_match_add_of(&pdev->dev, &match, core_node);
 		}
 	} else {
 		char **names = dev->platform_data;
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 73ee7f25f734..fc736759274f 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -273,8 +273,7 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 	if (!remote)
 		return -ENODEV;
 
-	drm_of_component_match_add(dev, &match, component_compare_of, remote);
-	of_node_put(remote);
+	component_match_add_of(dev, &match, remote);
 
 	return component_master_add_with_match(dev, &kirin_drm_ops, match);
 }
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index ab0515d2c420..75a19e6b85c0 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1445,8 +1445,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	if (!np)
 		return ingenic_drm_bind(dev, false);
 
-	drm_of_component_match_add(dev, &match, component_compare_of, np);
-	of_node_put(np);
+	component_match_add_of(dev, &match, np);
 
 	return component_master_add_with_match(dev, &ingenic_master_ops, match);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 91f58db5915f..9ca265129659 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -779,8 +779,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DSI) {
 			dev_info(dev, "Adding component match for %pOF\n",
 				 node);
-			drm_of_component_match_add(dev, &match, component_compare_of,
-						   node);
+			of_node_get(node);
+			component_match_add_of(dev, &match, node);
 		}
 
 		ret = mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 28034c21f6bc..1152da3d58dc 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -5,6 +5,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/component.h>
 #include <linux/dma-mapping.h>
 #include <linux/fault-inject.h>
 #include <linux/kthread.h>
@@ -1148,10 +1149,9 @@ static int add_components_mdp(struct device *master_dev,
 			continue;
 
 		if (of_device_is_available(intf))
-			drm_of_component_match_add(master_dev, matchptr,
-						   component_compare_of, intf);
-
-		of_node_put(intf);
+			component_match_add_of(master_dev, matchptr, intf);
+		else
+			of_node_put(intf);
 	}
 
 	return 0;
@@ -1180,9 +1180,9 @@ static int add_gpu_components(struct device *dev,
 		return 0;
 
 	if (of_device_is_available(np))
-		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
-
-	of_node_put(np);
+		component_match_add_of(dev, matchptr, np);
+	else
+		of_node_put(np);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 7abf010a3293..3ae4b73dfa92 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -238,8 +238,7 @@ static int sti_platform_probe(struct platform_device *pdev)
 	child_np = of_get_next_available_child(node, NULL);
 
 	while (child_np) {
-		drm_of_component_match_add(dev, &match, component_compare_of,
-					   child_np);
+		component_match_add_of(dev, &match, child_np);
 		child_np = of_get_next_available_child(node, child_np);
 	}
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index d06ffd99d86e..a67c2010c7a2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -323,7 +323,8 @@ static int sun4i_drv_add_endpoints(struct device *dev,
 	     of_device_is_available(node))) {
 		/* Add current component */
 		DRM_DEBUG_DRIVER("Adding component %pOF\n", node);
-		drm_of_component_match_add(dev, match, component_compare_of, node);
+		of_node_get(node);
+		component_match_add_of(dev, match, node);
 		count++;
 	}
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 3b86d002ef62..0138ce02a64f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -155,11 +155,6 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	return ret;
 }
 
-static int dev_match_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 int tilcdc_get_external_components(struct device *dev,
 				   struct component_match **match)
 {
@@ -173,7 +168,8 @@ int tilcdc_get_external_components(struct device *dev,
 	}
 
 	if (match)
-		drm_of_component_match_add(dev, match, dev_match_of, node);
-	of_node_put(node);
+		component_match_add_of(dev, match, node);
+	else
+		of_node_put(node);
 	return 1;
 }
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 10ab58c40746..685c44dc1dae 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -33,10 +33,6 @@ uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 			    struct device_node *port);
 uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 				    struct device_node *port);
-void drm_of_component_match_add(struct device *master,
-				struct component_match **matchptr,
-				int (*compare)(struct device *, void *),
-				struct device_node *node);
 int drm_of_component_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
 			   const struct component_master_ops *m_ops);
@@ -69,14 +65,6 @@ static inline uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 	return 0;
 }
 
-static inline void
-drm_of_component_match_add(struct device *master,
-			   struct component_match **matchptr,
-			   int (*compare)(struct device *, void *),
-			   struct device_node *node)
-{
-}
-
 static inline int
 drm_of_component_probe(struct device *dev,
 		       int (*compare_of)(struct device *, void *),
-- 
2.35.1.1320.gc452695387.dirty

