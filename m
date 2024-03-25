Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28788889DC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 04:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBE110E56D;
	Mon, 25 Mar 2024 03:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="dgburxym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2075.outbound.protection.outlook.com [40.107.113.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E758210E527
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:05:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1qCsA2Km52QHuOQHnqbdHoh5nGwsW7eNfz6HnfbiL9elYqoWc/tb77NyEx4ECmA4oKCHJSOhlFVEZp05CsdDXD63mMVg9/QiVXRO/2cU0MOQz6WvRbwqIxUe7mognSLGqd/QXeZScfOdvc2ilBCvKiLl/HNYlAjrLU9FxL0Eb/bWKX9KfSkSfA1tW3DOotwoJkHy1I2YEdIWYdmxV+c90n0LXeTY+nJW8cdsWD/pQ4wQZKF39eg+O96ycccU1lwHCexB0QaOA1CTGf4hMz1S2PgunF48lFvncXNJ3vtYQSrh1IAMRlXlu8XOAIhU1eUGv8YgHL4XqafW8qzBvEclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhWU5pMTa0RW9lB2L2jViSSAy9x86pATn/ADdUCQ1qs=;
 b=M1/VjDaFaP6EY9DpcXW2h1LL/38QL6M6PYLcEqAHBQgWTt42eji4hjdxYAanHzH2CzyiGLE2yx+3C3WPFpK78NwcqNZ+dSGY1VIA3PfzfOIPox9v4QAZ4NmByMrsxTbmtjOj+nzhDQPUZ8hUHxyTyH2wT1uOo9ocV2fkvbVLg6t1kXY6wdSPiRvRbxOSGYggPQoA94ecfkOvfoqsEKCKtciKrorz+HpZB6RNtRQ+wwT12wgFXAvMfy1T1SUAsqUUFe47TmrDx2zSg6RSo5lDGNxYZ/JICw4rsBVK047MfmmRtpYF2pACd/ZbIUk6dIagYoJyRZ9WSG4ra1prpgbccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhWU5pMTa0RW9lB2L2jViSSAy9x86pATn/ADdUCQ1qs=;
 b=dgburxymTiuWgPc6tOGUbxYRBIscMmIvWHpHMTDuW/j7q+d/myhWtPyAmOKCR8ZecklAvDUzZcCSaJ5tUOTd3e16V0HvJ5qPaWw8ilqmxVEuq1jfM6zZt0mhSTpIBT3Nmv0dzSTgI1LO2k5YWshNEDSD/2kjT+fNnU4CcznMbhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6966.jpnprd01.prod.outlook.com
 (2603:1096:604:12d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 03:05:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 03:05:39 +0000
Message-ID: <87ttkv57uk.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
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
In-Reply-To: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/8] staging: media: atmel: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 03:05:39 +0000
X-ClientProxiedBy: TYCPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:4::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 457e2ebb-7602-4866-9569-08dc4c78737d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYNz118gGtVvozVPytM99Y7gp2GK2F/PuKOSEGl0g9Usx9eBBjbgFboxdbocuU+qk3TBsIOz1zWZKdvhQRjnV/jzRZrmUfZ8+CdmwixHmg7D4w87dvbqNaeBbO5+Q/lk7QdtgTb/bsmTmX+onHwO43+DtcxsYGz0jy+8KmeT6wzJIPonDMdZm0i1KrOzEWDMR4F2sAaqzNkEtVkJm9qByTdjTBQgyIKLIVnyaVTcXix51/5n20g2fo1L0f6Q+KSlyV4GWKKk40ZKAwkmQaZoEfAVwSa3WXtqiV+1e8mNBWolWEFZb6/08j2U59nr3axo06CO6sqc2cvLIS9IPamTFnXCPTFgeFQFMuiuVkQfVStV2b7c5ClYDMwORdcYGuBQbL2Tq9Iw9HmB9BMqEYlXF8xN1aB//k4ctYbjQjOsESoEbqOxdRJ0BWdTNiuhkfrpvvPQQSe/2CTmtN1MCF5EPuGVxY71HLimdjlfbSFUoHZab7wJqsppaZgOCjC2NM96C7HvM0np8f1stG8RDBu2jnLc+FGenHDk044H6dPYj47m2S92EGHbfEbKJ3VwG+8LEDThcloLBolWCxkNOq5oS+JZs/eurS3Ry9EszPUL8XhdQWUrdX//FskSH/Xn8Z0spXHdm8rgrQbukvD1rnWx3RZSNmhja2HkO0Z/M75JKxCYuY5PwOcmF0iO/TMc8KuS+fpRuvtyX54VZxVrYRwaT4ZLfEe24PmW3PK3wrEhx5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(376005)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jRPJ8qlyeWgtbwcHCpgvmrtn9rULkWCj7Go6cuNRZKNXYpL/R1BAyWSxaNnD?=
 =?us-ascii?Q?OcwwOHY8cfNOP8fdqYfeQb/lCtdxzUVKcXjIwWpIle80DdMjfGSwug5thgp6?=
 =?us-ascii?Q?aThxMHgSIN+ZhiwBRWB+/UlDkKmo/Kn158tGV+1J4svZDxTmFsj7MzyVOzRH?=
 =?us-ascii?Q?G+2ezyXdPp793qO8daFNQVhD9fRpqY0AmqlPHvgr0F9L2W1bj9h4DET37jNy?=
 =?us-ascii?Q?trg8x4cbirNdo3cyOf3IFd/eZPPOBOcxWO6KIPhgTNKkddP92uBgekkEeoeB?=
 =?us-ascii?Q?uVYzdfMv4IjfcosUTuZyMKdylQ72HO11IDjKPWhGYrIQt3aKuIXAxBXBb/2U?=
 =?us-ascii?Q?t56VdteONYuazdgDidSDG+6/aiyZ0WZMDCUb+aiarRMWuc7j/e5jSEB+6T03?=
 =?us-ascii?Q?jz87bikTKiwS2I7/An4a6VHBPUlV+4sn58h2Xi5N3yj5Iwo4m5Rh73WAFpms?=
 =?us-ascii?Q?CAMBehg+tQaskJ2tjGa2c1s/VSNPiSVHKaYiFjdGvaxf7XJuQCVO2uiZDCxQ?=
 =?us-ascii?Q?QEnh40PPSfcKvIzRHmtGqifzfs7bmUI2wgxrK0SC5knoLx6XovxBZ934LkYZ?=
 =?us-ascii?Q?2V4Dw2JB0OPqxl6i9UOkvjqODoQpkgAzVJtkHXngbPIWAHhNf92Oxh8OoBaZ?=
 =?us-ascii?Q?8o9X5nUKt+1C+Uuy9LUsPo6a49WpO8V+36TjxDP+xogdNHxA0MXKg+zfMprp?=
 =?us-ascii?Q?83FUST3TkZqw7I21NztdU4Cjw+OtAJKgODGN8MbIHtm1/DkW0vB43jmBwCJj?=
 =?us-ascii?Q?Bjqn7oY3Tp1tnhogA/ovwTpu7F6QeKgQ5c7esp2U3BOVtN7CPeaU+QVz8rxU?=
 =?us-ascii?Q?+hZNjqRESQ543PL3/zdN6rTdvWb0pxlPia3xzEpJ5eDIL677ImYwwWAovLAq?=
 =?us-ascii?Q?n5x2LccV99kEuVYXBw8QWjrK5Ay1MRV+AXYUIl6B22bWvZB9toJa+YRs4uXj?=
 =?us-ascii?Q?Nedy1m2RLrjute5fJ/84KFoRs/QxFh3SOS09leuzuvP3R0ohSr6ul4GbpB5n?=
 =?us-ascii?Q?kGscKQaRf3Ql/Eq1B+X1U5Jt94lIq43ynggI7RAELWUCFAx1XDVK50CpME1k?=
 =?us-ascii?Q?m/dcpuptRdhnXDgv4SIYu0NU0B/4jc29ia9lkVEDOIIfCgK7PoLA1S+p53Sg?=
 =?us-ascii?Q?1RvCF/lOH8KK1mK3u4qEALWHSWCiL4ZI5k9vigMcZQ+6AYtfrC3Pw6tKVP8f?=
 =?us-ascii?Q?BHmOm0VAN4pCvthY0Fm5rGoE6VA0qbvKLAGcP3eZO0VAgzl15h4nfp3+Lz8S?=
 =?us-ascii?Q?4eMy3cEnEOq1QJ87IiL1zsTdhtpaVqXby33X73RhZ5Zu3W2YZc3+XFDf7OxE?=
 =?us-ascii?Q?8VrWO2Ogewb5sJ3c8IRV/irD/PYYS9SVjHkjQH/Z2ooBEtSzmWJwZ0+4ccmv?=
 =?us-ascii?Q?b1XylCMsZGbYtFKIwTgnM5C4OvqNlGU6hst9NVVTCfOIM9cdzREp8ZEdMsKh?=
 =?us-ascii?Q?ck8n4e+/C3W2bcQWNM8txq6ccbpwGaFC4IeHQPH+Qlu1REGS5iiJ9F6uvQ8y?=
 =?us-ascii?Q?UOL26LL7ahrtCny7K3bxl4Fh6gQROuHBbrFEn3984S9SQULVtDP+YnGUsNSr?=
 =?us-ascii?Q?Xo6FOvgMXWHI3epFc4demb5zdWijoSO+NJ2H+n6CEFmJjXRTF26lRqxFlCOm?=
 =?us-ascii?Q?zCxhU8WMuvZt2BL2RjMUs3M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457e2ebb-7602-4866-9569-08dc4c78737d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 03:05:39.7941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JL3FM5A5KLaDLJdsSp2L+pPB4vxbePao+76mly4RFOYWib0gkHvHUxAUi2xxB7rrhrUfQggvkxKgS7ZCWOByh+OFI2Ij19VQSH+AwSv9f7oAmWo73gQLl5q4OlC+cNu5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6966
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
---
 drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c | 6 +-----
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
index 31b2b48085c5..cbfbec0c6cb5 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama5d2-isc.c
@@ -340,13 +340,9 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 
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
index 020034f631f5..7c477b1d3c48 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
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
2.25.1

