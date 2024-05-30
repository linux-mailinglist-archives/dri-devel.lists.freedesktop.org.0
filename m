Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6618D4360
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C92E10EC90;
	Thu, 30 May 2024 02:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="birZSt60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2077.outbound.protection.outlook.com [40.107.114.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6177510EF21
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:06:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtbjcjPYnl6EZtrGScC2QOSUTH5lc2+bI/ps1nfVGJEp74i+lacPqLZB15Y17aRtkMRaJZPTt+67b3718TqZvLi7A+M3GaE213gW3GgpQQnvTssiB6bKGxRSiU/wLvAgXlFkwguQyTat2K62zH5N7Huvo1L3vTOpVzwAqTWvbYWZ0iRafJO8PEePH2nWbfCSt0S/Wwd8T411PBR2LS3Dxo98rUPrpUX7kZv6yGbObF0hHwJMl78OmYvkaa+6pG86VHooXUO7W3RVgPTsOnn5AWVEgeFGPcS4leta/Iuvb6Eo5itG28ynWGdCi5HjL/maRBAFyaiKmjacmzdRAMwLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjGsaR1b+XxwTO9Q3/woPdYTEnq443MXMgIOL4ktaTs=;
 b=j+g0J3CiU/kxy34tATq2uF6L2ZR4xQd6gXixGGnkR27O3auelcHTN05CJ2qsfygunOhA7832lleUOqspJd3euG64T7Vfj13LFqY7rcJ8D+IH072r9qYyKagY+ZIUXFWUlE3UGv7sRIff5diuM8fX0/VDkM2fIxsFQ4BVlq84c+2sBtViIgsHfHEkjtXRCuIRBd3m4ISwJ82dGakPkAdDfIzz/Dlbof5qglaVCUxHW1vKRXhu1gcieVTRkPxBvqpdRE/IZrKTSoWA/gEmykleGivGZhvbBlzeO/A9dwH5QYgIKF62f25iw8YxGGcRMx4LeTTKK1I3X7kGeBWpGJa6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjGsaR1b+XxwTO9Q3/woPdYTEnq443MXMgIOL4ktaTs=;
 b=birZSt60Lozkygvd/UX6aiOJY/O2vPOm8da3OSjhPU1CKhs0Rd9LCj3JOfOJhKH/dotDXQ4M2cMDr9+OzgUDtaQLZa5d7pYcenQulthuy54RMJo8FJJsB1Yt6qYHkw+GX8BFG6HhxGXrqLv5BvFYgoxgbPPtrylFYMiQXUe/PMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10240.jpnprd01.prod.outlook.com
 (2603:1096:400:1e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 02:06:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 02:06:11 +0000
Message-ID: <87ed9koxyl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 5/9] media: platform: ti: use for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
In-Reply-To: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 02:06:10 +0000
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10240:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e270c2a-d1f9-43f2-6499-08dc804d13c9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|52116005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A0a16wCTaxgvdcabJ/merXRjFpJiFMPjobF6/vL/2BkaWwJOpQr9cLWw9Y7u?=
 =?us-ascii?Q?8Jnn6T36N9IWMEOKUmokEAIkcQmfaCaM1YZ4MRhmsQl4YqK5mcGbUL5ihRH0?=
 =?us-ascii?Q?L3f6qvqLpU6QQ4Z2MV4/ti6AicO5LQB3b0lOtqLP9gdXDIHrfdQmIypzImfk?=
 =?us-ascii?Q?nbbj4pHCC3Fu0X1m1h8ViAUsOwgEM5B1Yw4XXD+oOQOePkoin0ZQYB9ciZpD?=
 =?us-ascii?Q?Vu6mRLJyXhij5462e7diiLcJFGHa3Gr50PhtZjvdOPELo8Puahfd+nB21jT/?=
 =?us-ascii?Q?jTStr8QVgWGIF2Nhi5x8Ot1/F4d4Eu/Qv7NS5HukUaY5iZLbG4kbIf0Kwq69?=
 =?us-ascii?Q?CqmKvPI0e/2UDy9v4Aq3rllj2orfR/zgh1zFHbsYMuSti0DfvJuXn9DKsJ4V?=
 =?us-ascii?Q?Q70Sqa4F4U8Mvs7nPXahzgwTjH0pEBnZLD3G4oHlNfXRhwBmke/zthdZHXVU?=
 =?us-ascii?Q?07OnhOLphB1JkFKwjHBFbP0Hjxew3qe6lmT2uGUU/br/MZM8IV2rttvXdka4?=
 =?us-ascii?Q?XaiQaWzfQdqdtqKH/Hv8u6QRPo+sgZWmRwiQnbe3YI58l79+AAcea2rIYSmG?=
 =?us-ascii?Q?e1BXBaV9fcSgdVSwmFVtjwlHXFgr7ZnfwSoCgedAlNMhK9sVYYUwz3uyu96H?=
 =?us-ascii?Q?8+FzL9Mdbz3FcKSi/O27+bW+iTWCorQ1QO0qTx8nmVqAMx6VqvVt1HW1+M71?=
 =?us-ascii?Q?xlZo1sfHybICpYJoA/d+6Npy0vFongR1+KPNgpsIuneAJ7am29f+/I8izJVr?=
 =?us-ascii?Q?/S2kYk+lEE8FUR6/gEKHK4cCV0UN4jvhczwhcUgKvRKkmEOqBSafMuCfgJEB?=
 =?us-ascii?Q?uHICl3a5pk/qDBmwyieuMsdbBTCxJ3S1vaW9WWneB/kOmn91PbNLCoxKkZMD?=
 =?us-ascii?Q?J2z5hcTcMHGIhdjq/1eiRTEl0l13Fj33/LxCrcQSkoebIJSdddNrDGTGiwV5?=
 =?us-ascii?Q?H6FuhMhbQCtsJ+a89zZkOifrHxYP57HwsbC4i2zl4DWMMj8Dz60zT6va3LXT?=
 =?us-ascii?Q?w4OvPPnG9yphaOI+N8cQPCeJfPkau6YPy+CLzKJuguZlzAkyqOPlXlhAmlnU?=
 =?us-ascii?Q?Q4HPjqO/V0xxW2C28SswDHOZrYO453whnlCbA+aNaSOkxT7dHDjWiSyl+Y+V?=
 =?us-ascii?Q?8L9D129uTq/k3tnmrsZMNqLU0hg1ThZtlw68LlkEVNuPk3Q9PS1e6Ahp4aa4?=
 =?us-ascii?Q?1qNTqHwxcMse6rQjORVpa/ip7Mzk/6NKnBgjE653upKqOK0Cn1CVTGRo4Tnd?=
 =?us-ascii?Q?zFnV9OaVbQvL2TPMIWBJ695d2MFOR/b0hbFehkZMPoQQTCIgCwfXOkXkDhic?=
 =?us-ascii?Q?owQk70+VGkj32awMTqFvYsfzik9GapbKt4DDcrQkj0KjmTUgJHcHSxeMgjcW?=
 =?us-ascii?Q?woRnIjc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(52116005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kfsNTyfeJVeCUT6v1C4CPGz8Vaq5F2mb7H9RtDCsPTn/63Kv4E+kU2toiTFP?=
 =?us-ascii?Q?ZO7VU6wnydNZgUQg6l1j3CsKp22RKjWxRRq9xEXxn0ijDDDO0cT7ok4rPL6Q?=
 =?us-ascii?Q?ZHhhx4ApLHn87RN4g7QXFto1sSk4+Etwcd04e3z3hEKRGLP5dcLclriMWZin?=
 =?us-ascii?Q?t4kd6KogryWvKb2kXLoP+3fIoopqMGVNBG957pd4TkJBaSRcEoW5W+PC6Ii/?=
 =?us-ascii?Q?bZtVis9pTJf5NNxi8OhJfTiLHQCJ0KiBetTEwwZgSzSZs3ovGvkRqCp2GtFI?=
 =?us-ascii?Q?ni9IHbMAMfL23FbLVJ87o0DTnSwKA3eZOlip37Cj5J+PkcqrmxXnPKmDOxGZ?=
 =?us-ascii?Q?iEoHPk/r7JGd3/OMTLxZuPC29y5icJU0l6H738RHtjjj0T4dr/VOd4gD4ikr?=
 =?us-ascii?Q?qfRx2p/kJdJ/g/ZYQv2wnML1mYxBWekZeGvc6Pt/YPVxSy5dEYTkHBzPS6Nf?=
 =?us-ascii?Q?BcWSRf1yxdEhfQ0KqNC7p8/sQ05+lSS56AprVgF/ZHD9XN6fWV2o12cqidnv?=
 =?us-ascii?Q?UQloosIboRxBVBo7M6wy7ji56Wxv9p4Pa7ePA/WS5hs1SQCwerv7FCsIPLsn?=
 =?us-ascii?Q?sR0mSnuAN5KO+pteEU/X+2YfN9iBM1Lkph8/NdT5HmBDuLjHiWDtK+V9acKf?=
 =?us-ascii?Q?wkG5mVOgrDej5XpgXVBE0eR3eO7zFkhnQcH13/8I3JoSTTvAAsDMWyABq4Dm?=
 =?us-ascii?Q?jnjqMURt3Id5ODRhqjGZMtrqFV6Pynj101/mdnUvKtBJ8zaJDMFQkV/arpZs?=
 =?us-ascii?Q?16epzOa8JYMD2tMDpoQaumgxn6SAL7YJi8vUzhekFKGjBzH+J0R+EHVz5+Y6?=
 =?us-ascii?Q?u2cn5KTkq18A5swRCmqEQ9ZY52pG2wFi1Jme6zsfTlf5d/DF7GNqGYr4T6Fn?=
 =?us-ascii?Q?CM6XMpHNWunpnjZbFwRKnDLQbtaDWxr5Pkz4K/MbKS85LJ02UQON1PQLNxTx?=
 =?us-ascii?Q?ExT9d9bozPZfO29fMDmGrac0ecQeW1fGVZHoP2w3Vn4vjc1Sfjph6hTW14EK?=
 =?us-ascii?Q?68Fyr2j0s40FCh5zd3Nr/hMFmRtLRm35UONL99SLohYkO0vy0MhVchVUkzlL?=
 =?us-ascii?Q?oYts1opSemZ0j0GfYK2to/yVroiu+aF/opvdVxFk87T4Z1IPk6qWr+lbm6ck?=
 =?us-ascii?Q?C2GgGap/HAjccC32dG8PE/P0CpN3ThUDR/EYDxUksC2+FPhBxQnFOzwuwaYi?=
 =?us-ascii?Q?0iJtaCvIjRTqD/bFuTplLu9MW/aHAfD0JLLW4KYrFDo7e9OTjAfHDalnkROc?=
 =?us-ascii?Q?dRcRmvOiKO2hcQaHK/GvjGecTEQzWKYATR7H+rICcJDVsv26UQQ0V50If97P?=
 =?us-ascii?Q?wkAcZO8RfQEtMKOaPpAsG+BlvDVn08NPbK9S3UEVsNoEi+VxlGZPpQsaIy84?=
 =?us-ascii?Q?5BZ5m396bfwSD43q0YeDOncr+xPWu0CX5njKHM7b5YIycId6roE2+3F4n45U?=
 =?us-ascii?Q?fOaqkgvebe67dM2BOA42XuwbY/hVd/88RL0mssDVDvNqKoV1t6XNKQ55SlIz?=
 =?us-ascii?Q?LFddZZAJGyXlrEVgrkSx6c16BLPS3rQEHzItz2qilQjaltfnqU/mlgI/jSup?=
 =?us-ascii?Q?Y6T5HZNX3JtanGD7m1UnuMs168QI81LfQXmeHZ1DPWs+gmyi29GiZ0fToWLj?=
 =?us-ascii?Q?bILs5OLA278kJB6c8QMsqaM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e270c2a-d1f9-43f2-6499-08dc804d13c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 02:06:11.3906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIDJN+GKJv0+tciRAkWrN/bhdmscUzH88HIEtclcROmwQvoWoVmH7HQjoFjNV8kZrVp9KzNC+Qwkvs6LdjTWY6bNfTlnN8HPG9lndboIhXE2XNYzEYU5E6BljPGi68/I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10240
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

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
 drivers/media/platform/ti/davinci/vpif_capture.c | 14 +++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 77e12457d1495..009ff68a2b43c 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2287,7 +2287,7 @@ static const struct v4l2_async_notifier_operations vpfe_async_ops = {
 static struct vpfe_config *
 vpfe_get_pdata(struct vpfe_device *vpfe)
 {
-	struct device_node *endpoint = NULL;
+	struct device_node *endpoint;
 	struct device *dev = vpfe->pdev;
 	struct vpfe_subdev_info *sdinfo;
 	struct vpfe_config *pdata;
@@ -2306,14 +2306,11 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 	if (!pdata)
 		return NULL;
 
-	for (i = 0; ; i++) {
+	i = 0;
+	for_each_endpoint_of_node(dev->of_node, endpoint) {
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 		struct device_node *rem;
 
-		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
-		if (!endpoint)
-			break;
-
 		sdinfo = &pdata->sub_devs[i];
 		sdinfo->grp_id = 0;
 
@@ -2371,9 +2368,10 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 		of_node_put(rem);
 		if (IS_ERR(pdata->asd[i]))
 			goto cleanup;
+
+		i++;
 	}
 
-	of_node_put(endpoint);
 	return pdata;
 
 cleanup:
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index c28794b6677b7..16326437767f8 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1487,7 +1487,7 @@ static struct vpif_capture_config *
 vpif_capture_get_pdata(struct platform_device *pdev,
 		       struct v4l2_device *v4l2_dev)
 {
-	struct device_node *endpoint = NULL;
+	struct device_node *endpoint;
 	struct device_node *rem = NULL;
 	struct vpif_capture_config *pdata;
 	struct vpif_subdev_info *sdinfo;
@@ -1517,16 +1517,12 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 	if (!pdata->subdev_info)
 		return NULL;
 
-	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
+	i = 0;
+	for_each_endpoint_of_node(pdev->dev.of_node, endpoint) {
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 		unsigned int flags;
 		int err;
 
-		endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
-						      endpoint);
-		if (!endpoint)
-			break;
-
 		rem = of_graph_get_remote_port_parent(endpoint);
 		if (!rem) {
 			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
@@ -1577,6 +1573,10 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 			goto err_cleanup;
 
 		of_node_put(rem);
+
+		i++;
+		if (i >= VPIF_CAPTURE_NUM_CHANNELS)
+			break;
 	}
 
 done:
-- 
2.43.0

