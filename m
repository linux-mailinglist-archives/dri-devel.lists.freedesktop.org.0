Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FB99DB4B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 03:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5F910E12E;
	Tue, 15 Oct 2024 01:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="lG20H/D7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0DB10E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 01:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTRM5jl+fV0ULQjF+J/JSAuueAh4UStccJ1a0iLnB24Kp3+lW4wrjWt3jy0vyjXF+wAeDq1cbuz1Q24KttEWXCjRw+ZkLyRHTPEuWhL/lvsmQ82PkIO440qBw0trx6koDINmTNqkFSAwWFZv7YayB/EeeyUQI70Ute3mo3F/dUA/wQuUnq6fMXAPChCc31MKx2r5XMFMNAKrX6WNzJdOVwDd28kzzsy/+D+TuW8Lq/SIoBByTw+Nge4FEeZABF5eQIksj8VlvoDKrFGcTXiiWnZIm6K23aiind2iIPAdJ2KVgjSorY3t/83igdfUO2bCPxCunNakUsiyGoV18mjbHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wh/L1bAIdslP4DMMoq6VB2uhENE/TfWDMUfeLShKnWg=;
 b=FUwPaxHCWrR6gAg1vvHXzjJp8W6zorZfmDbzTxg2mml1e2+QW2p315D1hdpE+NZ7j0k/toRtBxtxfW49dUJYXp5ZsKEgko3fTUkjMZSEYf/ypl065/p5vmNzIlZk0/bXMhxhxQ5GeFSGe3sjJZEyB2/aq5SDajQHBQ4uQbJ09zB/2yCjalgvWlrMLBJkMfZYykYPHr8IftRwQ1R5M0wQtJroL0Glr9JtR37OIx6U2w5I221uYPd04hdgt+qBJK5ZBVuGSA8zxWAUXMa5aHVtV1AxGw7/PHuCiPoK8EgD/Ig1/Uyc7hS1eq/3Dv2GOgmIx5g1WZ1mvCUls/zJxTQGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wh/L1bAIdslP4DMMoq6VB2uhENE/TfWDMUfeLShKnWg=;
 b=lG20H/D7vW5j+T60akxxgAaXRVf8E/61i5iMKU3+ofFtscpP1lAGsO1rmsfJKfiUNAHpUu18v6Ct6cxIRA/N4ruoWIVFGi71gqFN8NkTM+dBBk7eeEwpQARb1BfsnkZnY2LfRTtkBmUdC7cz3XqARb1gne64VyTVXfVuv4stO+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11377.jpnprd01.prod.outlook.com
 (2603:1096:400:3f6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 01:28:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 01:28:29 +0000
Message-ID: <8734kyqhmq.wl-kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>, dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5] gpu: drm: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Oct 2024 01:28:29 +0000
X-ClientProxiedBy: TYCP286CA0224.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11377:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e588275-3de6-4bd3-3ffd-08dcecb8acbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1DZLAwPY+JPzglLiK3M42Y9Z2aUs8rCZQRIJpmLa1fnnsuqfGzCbsZ8WF+0Z?=
 =?us-ascii?Q?t4SlyxAydXIa+q4DANkdmoAKXB6K0zgIN1kGlbjzhxD8kal9w9IUXWTC5GZ8?=
 =?us-ascii?Q?7niA4oFpJPdvAkMGmuT7UxjBOYMu5oiMRMPsRrifKXqHEj/diVJGh5lqXJxl?=
 =?us-ascii?Q?y1rJO328o25fzUYhh07Njq2o8UrNXurqWcO6xi/E5pGqwSZ4uRQTwDMf6bL/?=
 =?us-ascii?Q?DfWkbY8RibG+dcn3u2fZDg54vkFIQJkdT4bYhXzpqQJVCHuIsrUEDCF1nEA4?=
 =?us-ascii?Q?2XLOW7p4BqSt3U/WxvenJS8Cnkl74Si88Y7m+Q/0kp+neufyEX4s0GEQOVZv?=
 =?us-ascii?Q?6hmyIy3rm0i3qrpp4DlSWahrFa41S1rCX0oxXLS+2gXO7lvIXmNdyDD1Venj?=
 =?us-ascii?Q?4MGXoNnbE5FpYAlSMDsy1vCv56nMTgWglTux78TVFO7quvooWWicPn4oqCJ+?=
 =?us-ascii?Q?rlNuSQD7K2Zsnu5LUdnu4pWPB4dD2gqJB5L5mmu6El5u9ccJUnr0aeqBfy+M?=
 =?us-ascii?Q?GuLdmEAszYTuJmKAm4brMvuaQ973ZOjjmgi5BXYEGasPGgIAzK+VM4otlO6f?=
 =?us-ascii?Q?tRSCOw1XVt2W8BLjaPL07uvpRxZotcSx0XJqYbpn2ipngWPKQRuilY0uA510?=
 =?us-ascii?Q?LwrhaGQYez2ax207XFEltdCLyc9S+7piJ4kGj0ZPm31wcdDTWuWFafEJAnis?=
 =?us-ascii?Q?4g1kQvgh/JHjtvyFVP80AxFeRB2BZT0OBZDDQCCfKnSRl3ce+5qhpvZAWV3R?=
 =?us-ascii?Q?Adlp9ig5vkKwptn4QYJY/rW/lCNccCaV7u759mJbgZM7vTmwDai758k1G0bI?=
 =?us-ascii?Q?143ShdAd3wZk3JaWJt8sCe7z56Bz3HU5NegiAnpYGjBicyMzP++Sd1vxdFUY?=
 =?us-ascii?Q?qjNqTHNJ/T4+njC9GuxxUpd09/M9SvazS12anWm01K+sVuhl06Ety4gQoO3a?=
 =?us-ascii?Q?ezYAUpyNUHIAOHXBx/IdMRZor5rgIEh3THsWs3bLnVxrj0dpoKgJicJ2nWFz?=
 =?us-ascii?Q?RGRmHSk7cnAgEg3X85B8pejjQG75rwW4mfYRMp8houeAheWrT8YYtBvIu9uR?=
 =?us-ascii?Q?EQqbKPlP1lVeUoUHQm9HRL7JFsElUAwmpiTBqSoGL8UwTBekRyJ5e/DVu4rA?=
 =?us-ascii?Q?BRtko88S2+LjQLJCNA7xttnuFAW3Jj5OmLp3UWnAgSyXMCjvBqQ3u364yQ60?=
 =?us-ascii?Q?2xr3SrK2pHmKN2b9L2HbUpoAFJBUiieC+EXjpdO+Td/M86Ppnc/Hg1w84plf?=
 =?us-ascii?Q?KvBEGyaxmiSZapn3GF6a1r5lk6Smtr2qwTLSdBkOFPRVRPygGGpy13EzYIvP?=
 =?us-ascii?Q?X7bRtuCP5m+Q+jNy8TDtXENPpIfcuJW+DeRDJqAwk28GRIBISSEQERDn/DR9?=
 =?us-ascii?Q?Knv9ulU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kqAhFcXXNxJRkU4R+YbgYrPgu5arKlqHh54kTbCeq8rOveOFQjefoa4h6kRt?=
 =?us-ascii?Q?Jqa9XH0vGSva7dKzERlGlFrLu9pbtY5IG/i5E3G5KyAySJX5YqKyWPOYsTmz?=
 =?us-ascii?Q?UrmqzoSU8OvmgHQi3vkCIzS50xooINsOje8ifO7MviExa8/4cTVNw2R1VMRu?=
 =?us-ascii?Q?TGZSAJ0TmezdAUH48H0NxEKrD610D6MvRfhweEd36Psx3MYnlwYHq1PxA54E?=
 =?us-ascii?Q?0g0P2Q8eBgIOj6BBFUsKz++F/z2+KvhlrDFq17D16OkqKynlcuar3ajdOrbB?=
 =?us-ascii?Q?vYFsqqemZG0CBlDjFmPipmnbxYIEpyo7PEU9CmzbTUjFYxeXO4rChvX4GnIe?=
 =?us-ascii?Q?aOBwyP2Yra/ZPfY1NWUd00TfIO+SJoHSVcadarpfA5fIdoeAeMdbEitVANMj?=
 =?us-ascii?Q?83RMs8dE2hxLONnfy8FY48f8D5tmrzAJihicRaSGbxJ2V8lfUImo/D4m58RO?=
 =?us-ascii?Q?0z2GhBKrxb/cUMOMTrH4FaBWrtVJSiA86t3lZ+gjtw2K4tVujgkNqwtJMmKs?=
 =?us-ascii?Q?FiUY9W0AGyxPk2adOcd7CbA/fZGVKCsw84Xyf4nofAaYlT0LbffRShhzakRV?=
 =?us-ascii?Q?PMfJ6ZTB1S61NmIrRO0TsZY3V7jfN2ugebdY4QVFCUDXWj/8rTEelA2mS9es?=
 =?us-ascii?Q?lVlT4TnOdl/X6vzqSq7SDVmq4mneKXMii12cIxxgRqRkIA2VeghWHLxSxdzY?=
 =?us-ascii?Q?zc5q27IcMBfngGUaUFNGJo9nSaOp0PEDnquFzn09rHSfkhSXMPXZHbsBH0yX?=
 =?us-ascii?Q?Vvia+Uq8EV3JwGmyuScGbiRxzRXd0mT/gqCzyuB4clPRZL2vMcTsc9uvPVuV?=
 =?us-ascii?Q?nLjq6CWSWF0S60Yz8zxf0+o4TQEUGJGOdImSvUZyo/HcjOgM8dI5mLn40zs3?=
 =?us-ascii?Q?kM/3FZl28VqVvmN60SsJRSR4wEHTtL7S8cN3R47YR01bKHa8m48lKhfzZG4A?=
 =?us-ascii?Q?A0lQrLSo13VdFDp8QkyRlmBMpErIY4OqLuozLNKrIO1Fb4UdYZyWNccrO3bW?=
 =?us-ascii?Q?yfEI9+vYUtaLqXUkL9eHFYSh4WzG26/w+6lMWS9nfYBFAhiQde4A/cQpsULX?=
 =?us-ascii?Q?QkpNJ0kmAHIIVu8Lk43d3YzO/aL6SE+exF6fPBjZahlXujvJBVppryvmsMPb?=
 =?us-ascii?Q?lgpljMNgV9r6901H/26EeNqsrUe9SbInYS9pWYzTbySDCSUYi4wWC6OiYOh3?=
 =?us-ascii?Q?l/obCzByNscG9BcbfN1W/lHQAcLmftUOOFZ1muELBmfZwj+AYMMbRtGorGHp?=
 =?us-ascii?Q?tr2rD2hhJ65jawDEgBdbr6OqcTcpIYdS70dpT2p4jZRuV/1SF9p7+5X+tNpq?=
 =?us-ascii?Q?amJUbFcUSM0LCfZWug+VHhjCxpFcP1kSQW4+hKGhzRwf2wFybITQt+5//LN4?=
 =?us-ascii?Q?iZLrHvcnUfXZOZZhSkmNcvPKZPPs3HP+HB7+NtKWE0d2QZegH1u/Zjb0++MP?=
 =?us-ascii?Q?6TM6xHd45cR2RH+KPe32ccq6r0+FxKNNnGsB0fCvFlnSHN87ColclJzIE8zJ?=
 =?us-ascii?Q?xcTuYEsYCmgWlXYeXFnky1+hbpBA1mLLB/QTYUZsMmukb3Z+ko3xnvUhl4vQ?=
 =?us-ascii?Q?0PF2Zzi2UtPttrdpBHxNuUa4EO8/40QDTHO6DA9eQjDKQWpSO2xnASDSNoPG?=
 =?us-ascii?Q?/YOFBCChrXu5lFvvl5V/BCA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e588275-3de6-4bd3-3ffd-08dcecb8acbd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 01:28:29.7186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+p/exHOaasbob93rQzju28r/rUApeAUYWYSp+mKHKS3qtMN+bptAH3oyn8C4IcbZRO0/BkJNNb6uvXjKDj+rTMYkY1mWCTHhgQ030+zKANG+ZHy4HnHTANTkmQMW0Jh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11377
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
- 1 month passed, but nothing happened.
- rebased on latest linus branch
- add Dmitry Reviewed-by

 drivers/gpu/drm/drm_of.c                              | 4 +++-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3c..b6b2cade69aeb 100644
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
index 4618c892cdd65..e10e469aa7a6c 100644
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
index 4f8f3172379e3..8c29b719ea626 100644
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

