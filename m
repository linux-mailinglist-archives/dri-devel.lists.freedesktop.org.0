Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4AD8D4366
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1D910F195;
	Thu, 30 May 2024 02:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="MktLtXW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2079.outbound.protection.outlook.com [40.107.114.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CAB10EF21
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:06:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQbMBu21rySj3PORydf+uwqovN0Na3Xo/wwsu6ymE6kzV6St9DSp+I3LZ9+zb9twpGhxUHzEeUWpuJMW2+lluS80qgK3n+eoG09Q87RgTPJDpoHALJ8AGDjR7b89nsTUNcxKcJSBWfKGffq6TXaC4pVm7p+6lYGocaljlHLWz9Mj+O7YD7uFLZezIT4f/NxdV3JTrU2wCMhSIP+CnkqAA+/w11kKPnE1IuU+BuvncZnksDDmPd07RhtbIykdkegrfUWM4rGvmwbhsR3SCmYV7x3lcNomGz8IoaitAc3WXE4zmm/woj00Lpmr6F9/1xV5SzKcHeuOl4XbMB9GUz+sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3vqksv/GybRwRfvf5iD9mFwpkjoL6qLD9V40ien6ds=;
 b=RDuyzVpgiMMIcJI7t6njuFQ1u30vEnCepsgxj++7JCbIAC5yt8HuX19ec5E0lQs/QyFIi7L3duQztj3EMDvctN+2CXWpT876i8F8aKj97p7hkKFIK1LwkRmasJyY/2fy8pYFhZsb7d1J1Q1QeyhVIyklU70rAAcbeKFqk0p299kV9ekQp/Q8NrYWjIR9jGdq409TJOrsn3Nk5s3n0ln2GXk/XiocekS3UlOUHi1QvSmsiLOVQkVB3k0IZleN9X5F0pbqSQMCOiJTj23Ww7hRefpyuiG0dkiDBWwZimSdiutkgaYJOm2+3G/7CfVnP7ojSujrRp3Rps5qRCubyQJL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3vqksv/GybRwRfvf5iD9mFwpkjoL6qLD9V40ien6ds=;
 b=MktLtXW+kERu0TJZ0xgVIv2U58Y1mtPN32S4upArIDTKlMwyCmT8huCol5n9DwB6wdykAjwnEqUhD66jAjAy78c70H/uJtBHhJBzmYHa6GgZPL5tofiLu+O1clgw6yCj5y4VpfpdK4QqDAmoXog+dg/SGEUO79s2txhDTpGHKJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10240.jpnprd01.prod.outlook.com
 (2603:1096:400:1e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 02:06:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 02:06:22 +0000
Message-ID: <87bk4ooxya.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 7/9] staging: media: atmel: use for_each_endpoint_of_node()
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
Date: Thu, 30 May 2024 02:06:22 +0000
X-ClientProxiedBy: TY2PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:404:e2::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10240:EE_
X-MS-Office365-Filtering-Correlation-Id: b346091e-4670-4687-7704-08dc804d1a5b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|52116005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kP/PvU/hdK+bTMlepqnj5JciKcfw6TtD9k09coo+DxivqqPc18WcNAB24ffU?=
 =?us-ascii?Q?bOOPwhG5i5Ja6urBv8PaBQt5U+7OGmIpRummoAJdvJLI3WoiXzGsY/6/nXW6?=
 =?us-ascii?Q?re70lh6KFkvwH21/DJiNakAKqHQDHTi9nCB9fsqXs63R6o+swj3hmZMItmrC?=
 =?us-ascii?Q?fk9W1cwYncxWCpre6lifBP0E5BbIEZpDll2lClz6cXD7yd5ueqOq1PX1kc72?=
 =?us-ascii?Q?QqdEv8NOF+DjiYZs7Dzk3MZgQDeGV2WZQ+qKwkdh98JZuHmuy207VeJC7wsN?=
 =?us-ascii?Q?vhL4HUhMMxCCnNTJhHL+OxpaSdlmXNTSmui1pCvktDntSNt+PGzylYhfqG3/?=
 =?us-ascii?Q?dokowLc3fmtE1jMvop3PQH98hPRrILCeU4A1N2qUcHpOL5VQt1Gc9zLNMzGD?=
 =?us-ascii?Q?Z8zysjPZDS9/ZkE6BDXWTlbKwJgXok2UCcn+BRQKS/mnOOI/upaDt0G2LCGK?=
 =?us-ascii?Q?tiRNzjv0rR+yrFaFvhRxw8qemRnWtiNxrorjRd6OsjjSttK4ddMQ0JEEzid2?=
 =?us-ascii?Q?NnneYZbx+Ta0ZxszGI25eKCZF4MEZhn9GjH+/LGqCZCG1gPw58v4mgmLSlOs?=
 =?us-ascii?Q?okOxOHp6B7SUmDhqLMWC2T1SPM5mlwCtvsUNgCC7+9jtn7rlzRa3AOgA7+Ws?=
 =?us-ascii?Q?U4muMKFlUD3/fOP9lZ2N+n85qZd3D628KrDsdUPeq0fbFdmdhz1lifvHhvJN?=
 =?us-ascii?Q?IBT0oKE9xmVrDoPGyfRfuAjWsTdyNiGUSWp4BNdtvoCYVThdSwoJf1+2udPP?=
 =?us-ascii?Q?GxWwomCy9DBAfLsj08uj+L04iZT6bDEud9NF3JleAGHjVGKZRTXaGyB8S8je?=
 =?us-ascii?Q?N4wIpKfA0pS4wHIA4c/+topORVpK6k26qrXaKCxiNk4G7JJEKaWyQMEmJGKc?=
 =?us-ascii?Q?hbq8oX32iMVjAX7yOai3Hn85Py0Z4zCQv2NpeB9l/Sw5NIt5PrmDpc4QVexE?=
 =?us-ascii?Q?vvlQQRdJLYmpd+9VarEb22PaYJeAjycr59GFap1JcKkRAsM92/2fyYFnqN/F?=
 =?us-ascii?Q?X3tFJJePAwxxST/viKQgNEGOKYEtY724V42sXz974KHLwfA1wURIuNn3wpl5?=
 =?us-ascii?Q?ncs5W7DZ4Ksg87Gf+Aw3oSFK+U84uLtkLGMV0btlrgt7iTTNF0mSai05KSla?=
 =?us-ascii?Q?r2t61FYylaXGwVwA58ElZPEGRATAV8HvK3g66iWodIxjGJN34MPLmsqu6PzD?=
 =?us-ascii?Q?5OInI3vO41mFBsf5WAJPcXTh+z6zhhbseBXjkPwvoAp1nQNlVWS69DvK0Ylo?=
 =?us-ascii?Q?PVgeLLlJcKMh7B+u9J4Z+0G8CHDCuqEOaPkIOwr/tcebegFdIdORfF5Pkyi2?=
 =?us-ascii?Q?FkHLwLCHNSWnKUubfXYDdz0a4zOjoBTtJqqANJQEdMEVVQs9a5KBSfVQIl9R?=
 =?us-ascii?Q?S7JMUZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(52116005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DoBipfDvMLpTVvlYAzeaoS2bHJyP/lELte+N3CZqkmYV5cU8daxC2DydTwFz?=
 =?us-ascii?Q?LcJFhjmgWxPb/wPuHqlGjlpPloxfHcX4X6K6ScwjX4fSx0LDVOCyjNiMHltk?=
 =?us-ascii?Q?Krk5DzzV89LrBCnI/OvUw1Xraza9lPBg9+pWfS1Sj5c3zPjPORgXeQi2WE3E?=
 =?us-ascii?Q?2vC478WK7F3Y0WS02VrXveEZs0IIbiCZCFYEabuW+Ifu80QC48j6WO8ggLL4?=
 =?us-ascii?Q?s2kdevWrjA/K7E3WapcOPFY9/8MhBYgVfd+tieNsjsvxuzCx2qqkncwb4E7t?=
 =?us-ascii?Q?DRkULfO4T0K0sowzAun8szHoRrxcKgPkDsLUOedA+Qd9A90ZfU+kpOBJ16cq?=
 =?us-ascii?Q?OYA699YiFSMBx4R9rKozJRsISb8KqOJYAOp/xyHrKPrCha78nQRvKC8vAhw6?=
 =?us-ascii?Q?O3OJDgPEMThIMKlz/l0A+MnuGPnQcGZaI9UJX0nexQzjhwi19FZMm65EA9JS?=
 =?us-ascii?Q?XO1jrcot8bHexMtei6M2xT/3jyR0Xd4hNeQTB4kjcSilh3axVD1YcDtdkhIY?=
 =?us-ascii?Q?7ehM3ljD1NkT5DF60mVP64oe3QpgjscZObUaLOMBLX4QczMdvYD00mGNyM3y?=
 =?us-ascii?Q?gDwc5J7iIemnnpKKHDWdYvG77TxwQUMBlWru/llwINfVUATp0CsCML1Q1beq?=
 =?us-ascii?Q?Gy/L4HU2s7MgLGQ71sD7TPF0Qlot1nu3UVAl9U5YF0K6yA+T9ngj5qE34BdS?=
 =?us-ascii?Q?toQHANSA5YyBIp2JgopPR4RU+DWjakt+SkjWpdRQwa6YEWbwHKLJfmmYSqQz?=
 =?us-ascii?Q?vMIQTZwx5HgXLOuL0Cv2s1RIpVYnM4Q5i+b4kTZ1s8cZMy71GW8Q9uwYyZ9Y?=
 =?us-ascii?Q?xAg321EYyTeMMKxbN8GhMNdWfyuD81VWbC6+igWGwMy3AQw0hKBGHoFkJ9+9?=
 =?us-ascii?Q?qObFVcCnMuJ3Z3wR2RZ8Qlgr/6bvY4td2ikTJylsPS4p92OXqrK7F8Z9ZT/A?=
 =?us-ascii?Q?5V+KHAzDdty0X5yml1dAKNXapdnOKYAQE9gjoFX81JX4ExmW5FGLPZ80pyrN?=
 =?us-ascii?Q?ele3psSzaQjxPae38rYawiAwOegSU2kUOYTuTBGG0dNp9GRqU1N9ANN/qbes?=
 =?us-ascii?Q?qHRYl7ERVQ/mmHZNBwowVc9HHBhLZG4DIUsjFjmUiunkHkjA5nCxjyRvTP2e?=
 =?us-ascii?Q?BW+DRy09Dn2kEknHgvpOQLH4gez217+ux0yoB8sKP39ThMrRH/c39ZlyDmkL?=
 =?us-ascii?Q?t1eO8e62W3CLvoCVh7MxCIlcG1xPLVqmkvMhfdgCwQ1oy/gPoVpm+HnsjOro?=
 =?us-ascii?Q?aXKErachRd3jKhS/MncE1gVhmzJF2SIXYdUoqs1Cp7X2836DdNJwrgHZH3Kq?=
 =?us-ascii?Q?TUT3RzdJ4GTrvWQGupiYDHHh8y5/AxG0Z5xd5NTzkNBZeMueDQSAHAEMZDTq?=
 =?us-ascii?Q?rxUF1cBl4Z8osxwu22JeqIfGA9+2md+61OITccGHPJ9LW+kQtr2FiIRLpMM1?=
 =?us-ascii?Q?l7qNfyMnfZUzMLcjDnWeG1so4MF7NECq84xxOB5jEF2kysPoAXRco7ewI21H?=
 =?us-ascii?Q?bKNpToyj1JUVm3hl4M/KsZ6XydOma+vCePJHyVPN7RKpsCO/qF0MBQkUGnMD?=
 =?us-ascii?Q?KZxWxlDtXfDFBJNjo9bOOcBnlcJrP2eOfP8TdWgdoOMgU/cbh0Xt8/Kua5yS?=
 =?us-ascii?Q?d9phJBEsnnElmSzYzlRKRGA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b346091e-4670-4687-7704-08dc804d1a5b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 02:06:22.3795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+ejKOmGF7XaIvLJjd+e5bKicvRwKSBHttSraQjDjWlQs9dBtQAJAvPfOJ+B3ZFsXbZpw0VjXi8hEMYTmAOmmhOQX12dJGdrXyjT+DCjqnTfw6ypAc0u7KmmQTuB4uvW
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
 .../staging/media/deprecated/atmel/atmel-sama5d2-isc.c    | 8 ++------
 .../staging/media/deprecated/atmel/atmel-sama7g5-isc.c    | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index 31b2b48085c59..3b28a232418a9 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -333,20 +333,16 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
 	int ret;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
 
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
-
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 020034f631f57..e559beb099f71 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -316,7 +316,7 @@ static const u32 isc_sama7g5_gamma_table[][GAMMA_ENTRIES] = {
 static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
 	int ret;
@@ -326,13 +326,9 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 
 	mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
 
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
-
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-- 
2.43.0

