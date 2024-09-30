Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28EE989A0D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 07:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CB510E2C8;
	Mon, 30 Sep 2024 05:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="mwyOwt7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC63010E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 05:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gE9b2wfaQ2ARL8XN5y/l9sa0m3lmwkcYv+LvD/R6cXOZALNU2jDnJKpaQS17szpblY1UQ4HyVVfTW6MGlh5fGXlioVd/Xgbu2zRx644/hPZ0PR98MRvFKkz9pDrLTllUuoYHct9GzxYa6y2CBQEybRXvN7oTpJFeBkerHu2Tw7BR2V4F2BYYNehiV3jhtq5LemFMNS4ShPW82PUwR0vMq8V7xTrQ6vdrOzLU4LU6A1QrMs77Yb1KkFxzr5zrJdcK3liU9Ian3JcwGzBUcYEMZE2q9roKxcKdKYvBxpYpV/fXbNwIbL33xvpYzr2eU+YfgpvV5Xo+T17NTxY2GhlGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6Oji03SVoTMa3oYkLGr5ybi5qGJHtv1w5u6U78+rm0=;
 b=waUnPnJVr5m8ef4hLiUkxQz8FmrHzFAvIYz2OOrrXXmYgGsQKLhLme+JmlzNJ5KbpTjxrdCX1t/yI+KnPurtBP5uVOTe3mHpFgB+rxIw+kFDGTrqNRS3rkGccgMq0UygGOluJg3ivTneGvETht0EXDU/axW+cV46psL3g3LGtbvOQfD0IqdOZzcdd4MHXQAJgzJm7fHZaxfb3NiRDmcJ5sQUfXS8WhiYVC3NKgq+F85FEEp+cbqtWJyk7MdGrjDKB0vgGyiUhfF4K8aaRPlr0fo3L2+4mfkSHcFoiYpa6u0ltnG3TRgo5CyxVAS0eGpwjzSa4m9KlQBCQWSDytqCAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6Oji03SVoTMa3oYkLGr5ybi5qGJHtv1w5u6U78+rm0=;
 b=mwyOwt7+39galNdwBqZv9V6nA1wjlsHvRltld/cQ3etxClTf6kwxbEvyLKMXnwiZlnCV9rlZPpW7jySviBDNRhV16ydUep5xs5HfjyYSmiYskbNjyYMDkXehr3OEc+qjRK71F5g2Z03EsBQY/gMtChmoKguEgc6B1dqrNZDQAmNfCxQtpzYwocchHXaI/urt+/0/9rgLZxVBpqnVdNcb8VXOkDCwe4SHv7+VhMB7mSjUs4riTArNyE0w0leJizfq6WeSyuzz2/sqXnZi5FXaGJFPu33o2k0XMqnG/8O87E/mcFT1/LW5GTBCcD5nzb6zU/0Gx47ETzCdjWJgILfRrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10536.eurprd04.prod.outlook.com (2603:10a6:150:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 05:29:19 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 05:29:19 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de
Subject: [PATCH 3/8] drm/bridge: fsl-ldb: Get the next non-panel bridge
Date: Mon, 30 Sep 2024 13:28:58 +0800
Message-Id: <20240930052903.168881-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930052903.168881-1-victor.liu@nxp.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10536:EE_
X-MS-Office365-Filtering-Correlation-Id: a3086a82-9146-4f74-c3a3-08dce110d508
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?daaSKI0bwNGz6wXcsluKvQ5CHNFzElhbasE76pDKx7yPQfhzmur3zilw6def?=
 =?us-ascii?Q?q8UPDf/ZrzOhiLQrWl9uRrk+dh2L8nsLw0Wrg/B/OLhF9uHpHv9GuiAyW4+U?=
 =?us-ascii?Q?EC0vn1XKgMAOnGxF6Rxtt3qY3tgRJEn17YGuPgCA+XEGYdB95OtegadZt9ph?=
 =?us-ascii?Q?JkxuGA4HR3Fi7s8H4pojUzu7Aw0I9liYoNOM9i0nJuUIN91qNm+Gj4d9wANk?=
 =?us-ascii?Q?BLH6Vk7a/AYixCv2G+FjWJRHFG/7BdPm1aTU5iJpEku7Nbf1gwCF/xV2ORqI?=
 =?us-ascii?Q?+Obj9nV8Q38pdpXsPbjHSZMXDdnOCHzRBku6DC8myjKB3tRnXVMyAKJfM70W?=
 =?us-ascii?Q?f4nmB/L3sv1q9BXx4dodaxO8ou7cXm8aPyOpEctntM8DfSaiOgMHEm+pcLAX?=
 =?us-ascii?Q?TJAr3CCCFTj1ZLoimsgmjQEbW/F529ZZmiuW6AMVl9AzzwAkxxXmiEjpMxFg?=
 =?us-ascii?Q?EB14LL7OIkZ7CN2GFUxZm2tLGrp/xM7cbnXNyaSbzIaqFI/c0dhKlQbq6y18?=
 =?us-ascii?Q?2wH8C1OOX0LgHkxSAGYifvT8PS7sZPzkqjYU95G/pHnrYlXDF58zilg5D7A/?=
 =?us-ascii?Q?mCaZyMcBfGCKiT12jl6PbLCnleSm7zk4SHr++KNjAZgq4ijKA8MhJO6+bOdC?=
 =?us-ascii?Q?ZJdCXnDr0cLasVuEPwzEDGFm/1LJlFf6Wg9JfLuSkeKocitXUMoAbL1CfUmj?=
 =?us-ascii?Q?znrOrVhviLudh5XS0nrjtctsdirLQ//GtHRAx1p8oFoGzxn6gBfHjhtaJaz3?=
 =?us-ascii?Q?ewVi7KGJd21s6z8+We/HPEJnZxhyUYAP4TdDZJ5iSB5WcHtjWY/4BJmK0jcY?=
 =?us-ascii?Q?Nzq1OHIJO0k9ZKJV8anrqs7yGQ3Hbctp/BlUbcJ+wfoWuiEJp6fFbnljY5nA?=
 =?us-ascii?Q?QXVnjFi/Aga/GvedqoqvaACmSUoAd+Dh1mgzNzHYOSCjcHaiISaMtHRP4XZX?=
 =?us-ascii?Q?6JC8WI/rKR1x7AXkOYwAinjexdlrXjygC4QiYI3t1lfWL48mMpr4SeXCrLJB?=
 =?us-ascii?Q?y4wJ+K3k9gr9gecgJiwDPYxvTpw9yiYbpudT1d4M3H39FqRFvQADi20vsXOD?=
 =?us-ascii?Q?TaNxUchdOmBCX2xi0yQkBZzomO+M0uRoh5CWdD5lJYkg1r1eKY7EuNLfctIr?=
 =?us-ascii?Q?Uc4b7zy2ZnSmtSi0d81P8YCS73Shum9Zwm0ljmJLzrF4YKaEGWkN/y2sg49B?=
 =?us-ascii?Q?oyPUTDurVjK6xX2+FR3bOIXpiT6Xbf1ptOqlPhmNCZmBO+nR/JSafofSOAH8?=
 =?us-ascii?Q?ehD3Mn2nUOi98X421fDP0EAzEfVqGUk4SV4QGIK88R+xIjh2XEIdkhAAPOom?=
 =?us-ascii?Q?L/+i0oMGKFcBolNISvyIuCFsUJF3+g/Eg0OwJH+YbzVAgFWyeRpe21iQmBXM?=
 =?us-ascii?Q?fy5712vdceY5GVw9/B0A3ky3MEuLlmTvzzTUJUZGc+qg+kN0jw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H2rHVBS49sSFI0srMLVyUATsLKbX5ri3GAOu8Qb8WNuU9lKZ7TRwF+qt7jPR?=
 =?us-ascii?Q?wX7NBpQkftdXSTJQfpFPL4HHyDeW4/W4Sf7yyNnSvoDvr4jGRbl5L4pee49r?=
 =?us-ascii?Q?eDu8Eevwnjlwchmoak1OvNOrAMdwuiBWC3/mpHk52U0QhfRJ6g5hYTo8asy5?=
 =?us-ascii?Q?k4vwHKuaf7NhEFhIZjPGJNSbJI9LH60TtHrl77SN6e5oxBYwoLmR1m3jftkX?=
 =?us-ascii?Q?4k/AvXsejq8mP1SiQBlO2sRGFy19nX0426Fx1t/3a72QD6PXmmn9UGUa1hWE?=
 =?us-ascii?Q?IS/TpAWsVv+7eYq/rzrVLfNZRU6/rkhqzwEYiI9aFeiBtt17+X89DlhbfFCW?=
 =?us-ascii?Q?1jNTqYKsc27Xd0klS81/NEbpok4eamjfPZ4qBU+9uxvzvETQphtfD5wID1fI?=
 =?us-ascii?Q?ydtzlQtk+2G71tywi0NNnbjdziujmf5BKdo9/WWiZY5sz/AFihxpAN0y6N5s?=
 =?us-ascii?Q?Um8+8GlXUHuSIvXlcQ9xlkIChGnMdGd92Xb9moQ6uvOSu0ml8y1RY91nNUKQ?=
 =?us-ascii?Q?hIcxlvhdKWCWzFD05qWOqeRC6Ghh/LcQZrKW7qthcmeAiD8FC2adbB9dk/il?=
 =?us-ascii?Q?c1PeLjiz4suq1BngFqAffzXVuVKot8ik28WX5QjE1Fdc3mP2TR7sKeeXjsIa?=
 =?us-ascii?Q?3F15jY++Si1D3Rke5mvf3EtIfY7MKnis5TEGQ+NMfHN2khZer5WAhBxY8eCR?=
 =?us-ascii?Q?XniWzziROKh/Yb8PNLCPAQ35eL7JJbN5RRrS+AFPGvOKQrooyz0oRfFm8tAz?=
 =?us-ascii?Q?IbqYEbYPq2yoh2INENKYqi7UGJMUVNScqmVRjgkRR5DZGC3i0/ULKwcpZuXl?=
 =?us-ascii?Q?8c9ELIipSf8r5Iz2mgswAovVr+OdpC0SwcIk71lCz60xFNDoba2y727SJnkp?=
 =?us-ascii?Q?yZWVMNA5b7K2rjiOM6MWMl55JnekV/lDTLrxwvcYPXWdb5CRJeL79KAcMEk8?=
 =?us-ascii?Q?s0fNy6TZ2Meo9/SaVn2v2yVGuHcTDPNdv46z9XWNcvbBrOWBaNFebTlaQ5D4?=
 =?us-ascii?Q?+iYWSqW/KPUOfVsI7TXuw9OEmGR7mp/JcGp7EllLFHftYwg/+qURDxa+ZhbM?=
 =?us-ascii?Q?524+72IPtvM6F3/wRC4FUslsGU3G8X5RKAp1CyJFeEYNYu3q6nBQY81RoNu5?=
 =?us-ascii?Q?0TrjfeXFuo8shgGeROVTAD4OIwy+6BOOwhDOfSJCGwUtE3/nl0YLT4uMSybl?=
 =?us-ascii?Q?0LPhTgR1jD0G9StZhDHpQHprBvi+1einWMbxW01M8t1dTa/rDu6BI945ypyG?=
 =?us-ascii?Q?7/NkCYgkop6JFZbvXFXc86Evre4OPcYdYxZ+b/r3jlweggtw7nPSBOBYhe56?=
 =?us-ascii?Q?P0QcbLJcuNa5mlqpdllwS5hjBZbFI9tM/CRvpHkY9xmH9neHPH7lEPX052cL?=
 =?us-ascii?Q?m+g1F8+C4RmqoeRISFvoDf3t5VEibBOm4tN8Q1mE5Qxo0SmHFIimSN6mzotN?=
 =?us-ascii?Q?XGIrtnuxg3x6Knbzi8Fjfi4x6m2sLp5latUtLhkVATA81EnFhq+DlOBjL01c?=
 =?us-ascii?Q?VmBGQ2nopydlmbP5mwsSVQAmuDxXPtAWhRdRAZep7GjK7xrczFdhbL5vUhMr?=
 =?us-ascii?Q?JOhCXBOJ54bL+lsd4Xuve2dWLizbP6u9s8Q8CnaP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3086a82-9146-4f74-c3a3-08dce110d508
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 05:29:19.1407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hScZlPRph/Tqt2qM6qUMY5uAqgqqzOUwatvHWeNoyjSghEdxxcj7X26bQg7y2wyDHa0ydh2nZ67NEKbG9niMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10536
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

The next bridge in bridge chain could be a panel bridge or a non-panel
bridge.  Use devm_drm_of_get_bridge() to replace the combination
function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
to get either a panel bridge or a non-panel bridge, instead of getting
a panel bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04f..b559f3e0bef6 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -15,7 +15,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 
 #define LDB_CTRL_CH0_ENABLE			BIT(0)
 #define LDB_CTRL_CH0_DI_SELECT			BIT(1)
@@ -86,7 +85,7 @@ static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 struct fsl_ldb {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_bridge *panel_bridge;
+	struct drm_bridge *next_bridge;
 	struct clk *clk;
 	struct regmap *regmap;
 	const struct fsl_ldb_devdata *devdata;
@@ -117,7 +116,7 @@ static int fsl_ldb_attach(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	return drm_bridge_attach(bridge->encoder, fsl_ldb->panel_bridge,
+	return drm_bridge_attach(bridge->encoder, fsl_ldb->next_bridge,
 				 bridge, flags);
 }
 
@@ -292,9 +291,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -318,33 +315,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(fsl_ldb->regmap))
 		return PTR_ERR(fsl_ldb->regmap);
 
-	/* Locate the remote ports and the panel node */
+	/* Locate the remote ports. */
 	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
 	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
 	fsl_ldb->ch0_enabled = (remote1 != NULL);
 	fsl_ldb->ch1_enabled = (remote2 != NULL);
-	panel_node = of_node_get(remote1 ? remote1 : remote2);
 	of_node_put(remote1);
 	of_node_put(remote2);
 
-	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
-		of_node_put(panel_node);
-		return dev_err_probe(dev, -ENXIO, "No panel node found");
-	}
+	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
+		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
 
 	dev_dbg(dev, "Using %s\n",
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
-
+	fsl_ldb->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
+						      fsl_ldb->ch0_enabled ? 1 : 2,
+						      0);
+	if (IS_ERR(fsl_ldb->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(fsl_ldb->next_bridge),
+				     "failed to get next bridge\n");
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;
-- 
2.34.1

