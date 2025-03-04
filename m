Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5EAA4D9E9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2F810E562;
	Tue,  4 Mar 2025 10:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="e3MnPn0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7864210E562
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 10:15:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHrzSHmbVEKj/FZSxTDwl6GWpG38rUlWG2euuRHy97rxxOWLpwIEtL82DFdh5G6v/phOvKIkNFZT81zOUJzw4xkE+EgI3byTUBsg1U4eBJkXs9Jfx96WEdHrSkvykiRdVH/tz9i+9VE6YVJidljONrgqMrLyHi8UIIe7cC3hVfMI+ZSZZcl9vUzL02WP/gtMvIpPo6ePh1/iq3FyDUe4ykAntC//qZWD70kqhsI8alzggSP7gcluHmk+f2zJqVct8e96jtyOraZKpAuLoNL7dosVUh9xbJ/8yh0XZJg97NrZ2ns2v+x9GZmSgsNjD2AJ0qpNNsQKtIs5/c7JSyWACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJSDHRgqIhAV5McM9Ea4GDHgePdURwrsqUQF6kOTf0Y=;
 b=GgzMaEyudvE4jU9eJn5JsMg7YVuYdQ/sfK8G8QxwHDpVAmkO0fwiiWs0aWpMmLoqo/kkzJXPHNEFUT+3Ohm0yRkfOBUaO0HFcKsITRnBPLO5vuaqrO9vMzdR/IIuDikbb5hiaNq43zth1NHDuoby2CUvNnm0s6JfwBxULw7xyaL85v9DCMhIg6Wr5ZYRj/3SvU6Df1eV99D9b6TBQzt+8XfXmFhoLeeK0hjmojyK9do/AqTKogILrFuqJBhdyrQTp1ZCqB2ky0yOZ1kQXo91MxE9wG/G06Svh2j5vQ+3PwHxOVedYpUtjIkHelKz+a0BXA+cQHeSKvTwo6mxuCWo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJSDHRgqIhAV5McM9Ea4GDHgePdURwrsqUQF6kOTf0Y=;
 b=e3MnPn0rmGjgjFgZ2gEq/UPD29pq6YBRMqSYekKVi+uym4sUE/fzQKoEaHO2pxVnDSRIRrYHQIvLNo2thzd0Is3HI2PaZwXN1x5tin6qKUr+0g+4vUlmsGYtcqQu2qV209fAI6BwTMonRnhst/o4EtEnh2U4NNVpJa2Xr1iGSiZ0l0ljAbGYL1NhLsTFXaWSi0V4cRQ8sF0BlDt08N+DuZhNfFt1fyZMkuqWJfvZpQYcyht+IbHeKd33luLzUbN40fMISYMM4gbx4zIGQ1+HwYdbLH5NgX73KsVqTQf3t4bwinruc+6VcUDNeU3REIJrfDwAu9rXaEB/UziB/+1JVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9868.eurprd04.prod.outlook.com (2603:10a6:10:4c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 10:14:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:14:59 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH 5/5] drm/bridge: simple-bridge: Add next panel support
Date: Tue,  4 Mar 2025 18:15:30 +0800
Message-Id: <20250304101530.969920-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304101530.969920-1-victor.liu@nxp.com>
References: <20250304101530.969920-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0188.apcprd04.prod.outlook.com
 (2603:1096:4:14::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9868:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e06c5a3-bc35-4302-d5f1-08dd5b056b70
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mmi1NxmNmAb6RDhuFt19ZQVliSAphHE64y+eRC8flGLPiMDIwdo6/+A6K3XB?=
 =?us-ascii?Q?Nkuv45tYa9BMrvDDrnMNqtFpi19WdyLQTvQAHELveeRRZUpG6yKpVlN0ysO5?=
 =?us-ascii?Q?cUdjtqI9ctCpEDlsAPHxFuDqVDKS6UTx84l1COvScROwp09NYiD/QulpgWLs?=
 =?us-ascii?Q?FVQ3NCDnkV2bVAgWvV/xnoWYgoxBro1DAVhfwL+vXUNXmzGXwOTTML9nXkDM?=
 =?us-ascii?Q?S7UdsSB+TuZMieSj1DPt6tIJ85J0qDP1Nl2yYEQA/YcktDMud4W06p5W6sDI?=
 =?us-ascii?Q?MwMWFVtAV8B0esWoM+wDbccxNV8UOWgQVfnH3C1kbV1Gz5sjzjo4XEDnSJT2?=
 =?us-ascii?Q?9Tru5ByWfCEw+nXDjnJGQYyKAA/YX6fmX66eFDK9y5LM6hY/6VxdnF0Q20dD?=
 =?us-ascii?Q?Ac/WWXoKDJXE6oAE+a4Y8qkFLK3nUF5gyL/niA36M4/KgdAxMJx9ZA+/dBWY?=
 =?us-ascii?Q?rmw1XVy+JvwrChqaDpZSyRC/zLvxsmhENv38Gd3eN1IefqYcU1+yr39bbRKn?=
 =?us-ascii?Q?FyGUSTi78yw78sy4B+EJq1ZYkzbsyrCleD3AKwHxL9leFkHBQYnOk6SFMdUP?=
 =?us-ascii?Q?67j6/SRCrfZWEwsa3SgESHOp9JI5RDJH+78ImdkFlgqjKutG0I5IISVxWGet?=
 =?us-ascii?Q?wWRUIfbw/rqKioF3RIxD8xkoemHySXtyNXOm74UQJKjb+c6XRvaFHhKiItLx?=
 =?us-ascii?Q?oCRpgJMlJHevwf4DYTiDYW3yl4fLqCpOI/sxTfdmzxHT/c0KYbH0s0vxdU5n?=
 =?us-ascii?Q?lnXsPUJmVStaHlvM6i+2RlzzhykdZtX9teiTt3yi3DTqAeDVgdLPyAD/moLW?=
 =?us-ascii?Q?7Qsn+oVWJiTue2YQKSVhMkBvqD2D5j8zeE/q7kLxJVDXwGP1k+id91A5Ivs1?=
 =?us-ascii?Q?6Jg2dvxlwSQpXTMdeE/jl7ac1bPleQFAGy1u9PJvchBTxFWW2UKs60aLbLqq?=
 =?us-ascii?Q?M53w0Dna+Kbgz/9PUczQVXYIcVF5cPo7Ed8QzXWGnRZDBj5ZR7wmMwrTMZB2?=
 =?us-ascii?Q?NogO2SO7usxLaDhTFrBSF8xbT5om7LEhu+Ehp/zV5Hi+vIHMpij3m6JXqvNj?=
 =?us-ascii?Q?kmZSK/0II+mcKlsM+QDwXRzvrdM3fwyMOZtq9wqdi27Re17yreRwN2To6GYA?=
 =?us-ascii?Q?79V9klkLPDhhHjkWUraJv/A5B48dKJBJGUDXx2OYPenrq9C56HZDFC3Gvxor?=
 =?us-ascii?Q?ZZQEcn1JVKmaYSfAHGX1+jObaG9VvsnZFjrfmDKfoJo9vuEvASJNIhHynpLt?=
 =?us-ascii?Q?1TcdRHq8C58NXmp2N51Q3SRuM3c2v4uX+AI7gXY/5YY3/JXLHqN5AzSoqZmw?=
 =?us-ascii?Q?G0MLbE7BkZFx2s6aR+CIj5wTi2RoquFrPf2isjSXetCRkkKa63iDVeA+vPvj?=
 =?us-ascii?Q?vgJdmEZQXqAv3DdrpUOkPsp5YT/if2YHhOExxaEEW54rev3bNeOeYP0IYfmb?=
 =?us-ascii?Q?cTojLQLdPXm9fJrHwlRlB01DD3Uz3F7/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(1800799024)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9emBCAUYFQNYUdvF22VpUWcNcEmfTQHfxVtxfAfKOBll1X5b3sms+iFwOhjb?=
 =?us-ascii?Q?Ffk+JE8YsdmfCS3XttlE9T0xGSZ2j8CPpbDe10IeFmerDym+hEYyqZpHhIxn?=
 =?us-ascii?Q?qCpAP0auD2ijHxcUspuQSiNw5Iz3eOquVoYwDpybyQdJ6zFqC+ZQvkVnPXV/?=
 =?us-ascii?Q?6+YQCMP/5dehSbDWr/90v05yobtT9/1pWdF8aGcx2WBi5ZYCPUyCmuAG19fV?=
 =?us-ascii?Q?46RX8O4acVDZky4HVV7zBe+OduPiq4mUMMK+v1RsYg/yuXIm3q54SQt+ncVR?=
 =?us-ascii?Q?4bF4hW7GLRzF3LShBx0UtN03PuY5qEaI50xzQ7wSym0sf4Kqb+QTrHTS+vUr?=
 =?us-ascii?Q?ozpOxqwYhbt07Ezt586YN+71ssKeq35Ok2JEfET5baJheox45cNi8nTkUb98?=
 =?us-ascii?Q?t6rQrW/5R+/mvO9yqiYs3BVrVuuJ+POpD9hTVa8C8WSpntX0ldjI2pn6k109?=
 =?us-ascii?Q?JZsObB3yRUphhrz5mqQszHsjlZtG+1HLcm+stmdxZM9GYOy1HBcaMJNLsyz6?=
 =?us-ascii?Q?dLW6gwEGrEcxEEzghvqwCQcO4NpsL7rOCBmVpj6aDHhk4FgjpSdbfJ2EZUpH?=
 =?us-ascii?Q?/INb6mRLBlvT0D8wv/G24LfKn9k++ZldpwX+GDIIjwlqhJVI9lqO51065eD6?=
 =?us-ascii?Q?bZvM7b4u5Pgx+uVpcaw3prheDG16tvjTlp/JJhTtUNtPYdp6xH28dKQpJjGk?=
 =?us-ascii?Q?YV9O9OvFjkYDvcc6gu01zuY7h9FanqYj/LRexpqGplsbVirx1SozuK/KyHJh?=
 =?us-ascii?Q?paxNyAUNqH5UKrPltzSKD0HiC5k9Vs7qcvRbJHBdFc4f4SzS0fsbUOCaUUVJ?=
 =?us-ascii?Q?n2HNW+1mGMU+1z7pcT87XPrpJ6+saDUUxw5OQKCnMT6h/KO2ziAo72urcnvC?=
 =?us-ascii?Q?cK4RMucFHdylejKisZgpjSag+YJm1MwXiM28BAwhP9iPlRWPOjYLemGwXQYY?=
 =?us-ascii?Q?frcY6feRGe8X0Hy+WxkMjvIBq0EUmAhnDq1M9BM7fLpdZ+L5q8IZ1hzs/Q4d?=
 =?us-ascii?Q?hKNg/siF/6TlxazVG3GCePOO8P3qPkcS1XA7S/dOhOm0qgZwMHjVSug9OCM3?=
 =?us-ascii?Q?s2Ufs+D0pXhOQwOKt22PeCKa+3dEtmV5b9KpMLAKzDamX2V1VhrjgihiNI8Y?=
 =?us-ascii?Q?GgSzVCyEHqBbElJGorHNSyZVzJKLaAT2aI6fcvEFhUfKZsWY5nOI0F7HPU51?=
 =?us-ascii?Q?7pj78zY1QImF3SuF+LJHUGDssYZxWDEkSB40ZPHUF+g4Cju3TWd0sCFpwDob?=
 =?us-ascii?Q?pPJ3lFjJFH+LT8Qsq8N3oc0i+RfJpe55qAW+yms+1fRZTCLZb/fl/8EIKlTA?=
 =?us-ascii?Q?LJ6e2CKFRuu82hx+3xbbuuMn378lWg5+Av4SmyvoBIYaAzWuhC24SKBFLG1E?=
 =?us-ascii?Q?1yRm33B3zgH3aO0r8nYg8WluCnDtZtiMUFNXpfleFDUkz9UyF55IQjUKRCxT?=
 =?us-ascii?Q?hQvCwnQGzyQ6h/+DojUj33upxrFXadxbUHNTLbQ64aDutRdxDch/8gK3L/JN?=
 =?us-ascii?Q?9rCEE1mwSCjQZkM7TbJD+9CaDDgX3IvYz7L2eKDdH4Tc73ejKqwEuautMGg9?=
 =?us-ascii?Q?V3M+4XAsukePN07qkFRhX3xo/wSiK47sxEgk4/X5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e06c5a3-bc35-4302-d5f1-08dd5b056b70
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:14:59.4277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uFJXMpH3BJRZe0AaWQpMgYGiGfVcU2tQO72mMtBvmDI9p1mDQ/m38jUSbzGeB4h3Z16PZWhk11Fes5DaMonvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9868
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

The next bridge connected to a simple bridge could be a panel, e.g.,
a DPI panel connected to a DPI color encoder. Add the next panel support,
instead of supporting non-panel next bridge only.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/Kconfig         |  1 +
 drivers/gpu/drm/bridge/simple-bridge.c | 32 ++++++++++++++++----------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index d20f1646dac2..92187dbdd32b 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -310,6 +310,7 @@ config DRM_SIMPLE_BRIDGE
 	tristate "Simple DRM bridge support"
 	depends on OF
 	select DRM_KMS_HELPER
+	select DRM_PANEL_BRIDGE
 	help
 	  Support for non-programmable DRM bridges, such as ADI ADV7123, TI
 	  THS8134 and THS8135 or passive resistor ladder DACs.
diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index c0445bd20e07..4c585e5583ca 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -19,6 +19,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -35,6 +36,7 @@ struct simple_bridge {
 	const struct simple_bridge_info *info;
 
 	struct drm_bridge	*next_bridge;
+	struct drm_panel	*next_panel;
 	struct regulator	*vdd;
 	struct gpio_desc	*enable;
 
@@ -114,6 +116,10 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
 	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
 	int ret;
 
+	if (sbridge->next_panel)
+		return drm_bridge_attach(bridge->encoder, sbridge->next_bridge,
+					 bridge, flags);
+
 	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
@@ -247,7 +253,6 @@ static int simple_bridge_get_dpi_color_coding(struct simple_bridge *sbridge,
 static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
-	struct device_node *remote;
 	int ret;
 
 	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
@@ -257,17 +262,20 @@ static int simple_bridge_probe(struct platform_device *pdev)
 	sbridge->info = of_device_get_match_data(&pdev->dev);
 
 	/* Get the next bridge in the pipeline. */
-	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
-	if (!remote)
-		return -EINVAL;
-
-	sbridge->next_bridge = of_drm_find_bridge(remote);
-	of_node_put(remote);
-
-	if (!sbridge->next_bridge) {
-		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
-		return -EPROBE_DEFER;
-	}
+	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, -1,
+					  &sbridge->next_panel,
+					  &sbridge->next_bridge);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Next panel or bridge not found\n");
+
+	if (sbridge->next_panel)
+		sbridge->next_bridge = devm_drm_panel_bridge_add(&pdev->dev,
+								 sbridge->next_panel);
+
+	if (IS_ERR(sbridge->next_bridge))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->next_bridge),
+				     "Next bridge not found\n");
 
 	/* Get the regulator and GPIO resources. */
 	sbridge->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
-- 
2.34.1

