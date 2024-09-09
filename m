Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3C970CC2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 06:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C0F10E116;
	Mon,  9 Sep 2024 04:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Ld9ivI4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A16010E116
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 04:38:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZztDk3jfGU9TG/sxNzk9mPDq2426rAXEYg7NjIuYurvYTtJhpJlsDBgq1LjamQIFy9sFZcHASKQy6+s5vtOTqwVkmlUHmvtHQRni6VyXI3XfGCbOIPqzOZmogQkYCqpSCVMdMYQ7k22IOv+O0DpycAceKaeTj0F50WA4B+opKERrqhFu1cXJH/ed1Py+BGR20bzC9+C+WDEdIJRTtqetZHxJsv55rrS3lzbqMrCZ75GMqRCW1sWs7TWKeT4vlIOwsBjwrG/Nx4dnaes80V4qhQDcygXQtB3NI4QLf5QIrUTKz5qtT46UnJooiaUEi2PwgUUwcIFoxSyTlEA0A71nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=255bn+sOcKplFMg38OQrCo8y7INlB2ArovJ85fi3fH0=;
 b=LGKNZn81L0BNDwZ7Rc0OM9hDuUmBl1Bo5ZKPdUH7OUdRi1y2iAdZ/hVE1fX/mFo7wXQ2z9Xzzs6VeqV5PKlhEAemw+35fL7Biiy0ljmwtkUsgxTfSrkANco1JE0PS5XotIVT/pOW4AAg+CEkxcac06MKFIaFSe2kLk/7pHG/M1NpLju7/NglTecmV20XSZSpLcOUVtIcx0nWO79lJI8HSeyOK+wvusL3FwodJRYgHeHySMyQxO9krxQhc0Bm9HSKh9ThN46eJN3gZix03VslQAMyKediVY+040zqZfnprpP+t+zKurKSk+gXoNwRxbW4CBOlo/LjTS3/Iqkjmgs3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=255bn+sOcKplFMg38OQrCo8y7INlB2ArovJ85fi3fH0=;
 b=Ld9ivI4ZsvKXNe05SIr819qHxTPBKXTmH0FgqBjNslEuKSYBim8JyvT9Xuzbsq7Cu1JQBBlF5v1QYkZYNuKNE5H21z7nQh0dbbcVo/1sg9ufihCnGdg/GqO7BoZeU/fGL21OwrYIkt+FHqV7+iXcnBqqawbW2tRMdZ0j492EMw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11267.jpnprd01.prod.outlook.com
 (2603:1096:400:3f2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 04:38:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 04:38:49 +0000
Message-ID: <87bk0xsap3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Thierry Reding <treding@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 resend] gpu: drm: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Mon, 9 Sep 2024 04:38:48 +0000
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11267:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f7261b-4077-48a3-cf93-08dcd0894c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?92dn0K55hIRGT0/U9HPfwFW6vFq2lwCJrLlTZGLNHbKYxstDLWZRqXsfYdcg?=
 =?us-ascii?Q?99lsTjODH//xLKID/tWLVKhmASj2m7eU0WfMojWZT88mqZl/yNiaFFqF+EFT?=
 =?us-ascii?Q?I1ofHWDMaZ9yb+nKGdxt+ZiL3N0t4bLeDiP43CeidGMidwLoq9PEZTiuLy+G?=
 =?us-ascii?Q?YIMARLfnCD2hY/PLV1i3kRuwSmDH8/ntOyYWVnBzd/2GJ531dMEoURXR4KEa?=
 =?us-ascii?Q?78jxAnbE4snvbZ0n5MkTEOhWrP6coi4jIZetfNoFYpRpt51xB4UPU5GqpWCQ?=
 =?us-ascii?Q?b2dybReAH5ohNo4GSBkD8rz53njAz2i9GmOoEixqKOgIF33iOXZlBfRF4KAS?=
 =?us-ascii?Q?9XbrR1edblYVJr+ALqcc19NNYszn2kS9VGQ01mzT65wSHqVTo69P4GjHiiMq?=
 =?us-ascii?Q?sLsyEMdpz+h3nCoPWzJSWqZBxcLPLg8NLkAJqMpgHAycFaJJ1dmzfhShCdfm?=
 =?us-ascii?Q?ciTN56obUpVqn4yvQYa9R2oWEk9EGc5sETlZ36Z2OVj1ngRb+d059YZaD53S?=
 =?us-ascii?Q?/fcp+8kM04kmbu2H4k5JMGCs17JkHHQw76rLAkGDUKUYUuj0MWHOZFQd/rQR?=
 =?us-ascii?Q?DtRkja7ehdwoSYz48yQArr4uauYZTfY+8p+0obuNhlzf0J4LvF9ob3PpkqTI?=
 =?us-ascii?Q?FYJRTv8pn05Jzciewk3V58Mf8emchTeCorMY+sjHeul7EcOubeoHjm1jKPmY?=
 =?us-ascii?Q?j0bMBLUaEH+Z9YGw3hCLOepZOljSUYRbp3b1LmvcRHtWnt4tsZEiIb5ei4dD?=
 =?us-ascii?Q?H6Ojiu0AuFRIBgQ7YOol1zNIM6f69p5OnHwGkCAdnoD6vCdxfrxjpHcDj+Ui?=
 =?us-ascii?Q?PKp4zyXj7jEzZiPZ9asrVFzG5OgpSD0bj3GiQKCRsNjzxWKf+b7JJawj8t19?=
 =?us-ascii?Q?UWaLeC5lFZSujdgZuaVePGDj55ysjKV5PF9llH91GddEdJMvnRYgRfvocm8p?=
 =?us-ascii?Q?SVSLrqVMTfj01XB/tdOV2/5iNKx61daTmGb64Q8tI7XrsABKIwBl8NJWWSoL?=
 =?us-ascii?Q?W9sb2S35wrXA7U9HN0pzPwfbnlcww22h/LXV9qjjK/ls2bnfuCXEY2r2xW4i?=
 =?us-ascii?Q?6phU+c7fihkKijKHo8+82rVYSNO9nwu3AA3WCv4fVuVJP/TD6tYwJlz6Nyg9?=
 =?us-ascii?Q?pAa0sdAdG7+fYsxwkSAEVHwCaFEc3ql2aQ2tTuIlSa3dfMM2fidH8+xbLg/g?=
 =?us-ascii?Q?rjiUoSaQ/fw6RIo0NA7UvbQKJ8ysWwXRoaiynSMQNIBR/36Nd4ZcNA5Od3Cz?=
 =?us-ascii?Q?CcrVUDNxYGyOEQZaHjsJbsKGNhvujT2hLIx/pvDCgdhDcqrHnobyh1XHNcer?=
 =?us-ascii?Q?AY4BBNO5pQXOBSXDP+ag5KSLOwNxhdFJhH59xp86qU9gRvfgk9pZ6HQRlNfQ?=
 =?us-ascii?Q?unHal/tGKxyfRSEe+xqRQ600PmY1iM0YMp9z2/eX5AGqWVe8H0LipmcF2tCO?=
 =?us-ascii?Q?excmqFqF0UQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?liSiHyyF1cibUJqgCOYvMmboZzjMExNEZc596JD/uuXErO/vveRnMot1tRWP?=
 =?us-ascii?Q?vlK+KQEl3jTwfShVGZhmYXbjvvtM7eQjcqKujDYOoIxHbRnfDztEGQhB0OPt?=
 =?us-ascii?Q?xsYMZgMIK5GHBW0r+kbplhwa0vh5lSsIM1PzAbH+GFiiwGwTVsFPJZXYlql+?=
 =?us-ascii?Q?T7YM09WC98cCMoUy6JS7IU8pylq+9mD4YwYGadvBs1GG/t/FvB576BJlzqsu?=
 =?us-ascii?Q?6OI7h5QsXL9BRMCxDCk4OPgkG8hoXeYoa90TFdoIH2+04YP/Cc38TALTWYyD?=
 =?us-ascii?Q?w3fkB5FHwxzDuSoop78kvajncJAmHErrgcvYEqjz1+QV9LnLU/znrHOomTRg?=
 =?us-ascii?Q?O7nIsCuO1c5jD7eb/JLnPLNFVCps4Ai8OkbdCQA1gZ6lfO0ba+tFu2xQ06kS?=
 =?us-ascii?Q?ggJ6eVt6EMyTmCOBnBrt+jJgsFERdGrw3zcx2GrKhciZ3P7dz+NcztBAkHTT?=
 =?us-ascii?Q?imPsuK3ihrRDgRtj8ntGR3zVT8G+jeZAB4DOOzuqGKQA/LuIYPniWPuStkiN?=
 =?us-ascii?Q?4lBv+caYWrbEbILv6xtDE/4H5MvlkXP/c90p53GL1iH/AVZgGUw2NesRKGUs?=
 =?us-ascii?Q?lGsuO3+Beqa62RNg8/4NkZgSqQoBd1Th6dMXLzJcFaoVU45Q3GygxCQj0xPO?=
 =?us-ascii?Q?pq9OdNGlwMwEqrNULLdquM5wL8O2rOcl4F/IA52/p57umoHMgxj4luoOgnqF?=
 =?us-ascii?Q?68FV4jAKC+2TT/nbhxEE3IWTZFp6fKbRATQ8Mj/LE2NFeDB9fdxKBakivfZq?=
 =?us-ascii?Q?4nU8ZpAJQHFm5KASvAvbJ+IuzFn+zdY2bWTAyDZGP2TkY+ynQDybFJ1n9huB?=
 =?us-ascii?Q?svMrooI8cYPTp3lUM61+jZq9o0vw//yPGFfLXJmCU3ZAssrnQgeqYcS3rx9P?=
 =?us-ascii?Q?c9Nj9ZA9vl3Az9/GkYX8djVrP05csaVhSpo5WegtzWZD9Y02MKTp9NVlxI2J?=
 =?us-ascii?Q?9GkMVXBiKMo4gyZJYWBEkkU6ptznavkNfEEz1iCiSr5NF0is+IbatXfP6726?=
 =?us-ascii?Q?6pOeCoGYm9vjX7LJ6HfuMod3petAerOLZrOGwoy7g3lQaLQnymI9arBTU4D+?=
 =?us-ascii?Q?zmGqcmO7RS9QmYeRqRVfJBlWjkcQytNdnYXQPq6N8b6QMTJD2idgUIncV8i2?=
 =?us-ascii?Q?uDxptx+uw/ayPkU524b08Cg6JQx/khEhUsmvCK0oG6DF40SuahVjDom7+Yb8?=
 =?us-ascii?Q?BWcfnKrFngIr8ih/uQYaaTNloIUiugEPsIyr7jUODawh811BS0aK/QT/qP1P?=
 =?us-ascii?Q?3OTj+9pINNSc12WyJgDEEScmve+3sJgiT55zzF6/kK3DPsaVTn62e6aVUX8P?=
 =?us-ascii?Q?MGGdAEDwKaqKYPzS1zRByVGov0dv3LZRfPEngo2pdzfKlplXyzxgCiuB/1GE?=
 =?us-ascii?Q?yjMX4ThpoMe7NUELm904/aCjMoooDcFqYyLSmTcWzcb5zI7roROwtqskXHOh?=
 =?us-ascii?Q?UGJc79puqwUXh/EfSxU8PfsZoIn3PxVGM1aOznkksQRWmyQMi8qjworSPBAi?=
 =?us-ascii?Q?QX1FBQ3Xhmf58E4y89922nw446zPIbldxuJE/zABNelu45f5GPk9x/nSg6d9?=
 =?us-ascii?Q?NdR9ciOUyRF1KYAbIm7rWZLYJqnAJ5Qh8G96/VQDqxFoyL+kL3oGxb9OkABi?=
 =?us-ascii?Q?ThjOSQ8fTW7cHFcXpvAWQnU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f7261b-4077-48a3-cf93-08dcd0894c22
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 04:38:48.8163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soydlZKPTAvgS/ww18kJpeHC4JPSg+8Fyfd9YpZdkrXHjLTSSORh5w/SRuTNd36zcMt+6F33L3TzhwNu9EKUWET/vnaCgffepV3JTuosdHf/ZxQtdA/BRi5AioMbPRHm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11267
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

From DT point of view, in general, drivers should be asking for a
specific port number because their function is fixed in the binding.

of_graph_get_next_endpoint() doesn't match to this concept.

Simply replace

	- of_graph_get_next_endpoint(xxx, NULL);
	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);

Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2 -> v3
	- based on latest linux-next/master
	- Add someone to "To" who is thought to be Maintainer

 drivers/gpu/drm/drm_of.c                              | 4 +++-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..b6b2cade69ae 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -504,6 +504,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
  * Gets parent DSI bus for a DSI device controlled through a bus other
  * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
  *
+ * This function assumes that the device's port@0 is the DSI input.
+ *
  * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
  * request is unsupported, -EPROBE_DEFER if the DSI host is found but
  * not available, or -ENODEV otherwise.
@@ -516,7 +518,7 @@ struct mipi_dsi_host *drm_of_get_dsi_bus(struct device =
*dev)
 	/*
 	 * Get first endpoint child from device.
 	 */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return ERR_PTR(-ENODEV);
=20
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/driver=
s/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 4618c892cdd6..e10e469aa7a6 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -400,7 +400,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c=
)
 	rpi_touchscreen_i2c_write(ts, REG_POWERON, 0);
=20
 	/* Look up the DSI host.  It needs to probe before we do. */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return -ENODEV;
=20
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 4f8f3172379e..8c29b719ea62 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -288,7 +288,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpg=
u)
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
 	 */
-	endpoint_node =3D of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
+	endpoint_node =3D of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1)=
;
 	if (endpoint_node) {
 		encoder_node =3D of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
--=20
2.43.0

