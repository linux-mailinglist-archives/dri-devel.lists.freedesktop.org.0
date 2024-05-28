Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EBE8D2902
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73E511238F;
	Tue, 28 May 2024 23:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="PgTziOHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2063.outbound.protection.outlook.com [40.107.114.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F01111223E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:55:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAyHroqtvlBfoUWXi7p+6IzJmyGv2tJYxTyVYqw2danO52fLN0M556gYY2uoEbQuDgnBnsGgneeAu8BffvmRyNisBI+PbcdAAWt5RxSwvyHINbpHuWwyNm+q56WVIKvv8S8+8rZB22dhIOWEUC2p5AQIjmWLkmLIDU2EOVHgJtus0fAXQkkGmnUoRNiIul+oQo8oL2fGSm8roKpS/xUMrGZiVeWck/Hv5yKbj4OvPKVLYK9/iPtHGT6xwMtDaFjNS+l8cgw3TNmJ+Wc/kaaP6a/O6sDkBCnFxx8WHZde9JgncKZqO1s+hTwhFC/j9i4n1MNjlv6R7jYU1vumsA3uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=navUPHBxFMD/qxJrz8ZrM4888Z1ixyx+tcB4YFC0FSg=;
 b=PM11wanl5/q6UU0pFlYUCttbTFZT/DPemhTO4d8KsSF2U5f/GkjcKWnFXKeEex4MThxq7r43nqXKX032u54pVHcWa1P8sllwtTS3MfMAKTdW+UF9ryGXmnW00jIc1YBb4Ey41zp3cvAuDyQZX4NWCKu0m3dIBL730JGIuD4kqNz4jYu8qf1Pcswli49tBOWFbYlR0q6PWwm5mkDlRysStw0CFE1okdQmTq6hxvn/qdTeQBYMJPMvnljRhHQdgZwLDElEKeSvgAnQj8fAeHwpVYPpS2a8J6aMF/PoTNcFVLKwULqr2uh6RJYp/S8ez1hEE69/zKANQc0MODtUSm31aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=navUPHBxFMD/qxJrz8ZrM4888Z1ixyx+tcB4YFC0FSg=;
 b=PgTziOHdFAS7S/tnUuONwYEEcAYrPF6pKCLu5y3+YH3j2TPiUjMQPPskftkVC9i/AoJQCmdati44u++TmxSVsdukRe9EpEG3geclI5Kre8UIdILBU1IwnLp3NwnC5+VweeUBh8LXYiW1rHVOtjE4GUYRn338/xPucQ/GKH0BIIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11224.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 23:55:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 23:55:27 +0000
Message-ID: <87h6eh4hld.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 1/8] gpu: drm: use for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: <prabhakar.csengg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
In-Reply-To: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 23:55:26 +0000
X-ClientProxiedBy: TYBP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: 636e146b-575c-40cb-29a2-08dc7f71a5db
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ikoi1hWInQWF85TyOHfWyKWRO4SkxAHDmeGF6+Lb1RpqJpFm9qSgpQfhZXNH?=
 =?us-ascii?Q?quRRXtiEHI3hR93LmydbgMvs+kK9Y9k4B4vwjUmIF5n+PowCDaYDaUh56l4w?=
 =?us-ascii?Q?kSNz/AHFfjuJHtGaLZUk4cmZVX1xuxjmmir7glBFM0XAYRTAAlZQZD+hs522?=
 =?us-ascii?Q?5Z91tt2HmuXtH4STxxUJEs8ruIJ+VNYPaKCIUbM1mvNqGY1FDxHhCpO/PwGT?=
 =?us-ascii?Q?LOVH/ib/CBnb8w/PDvhjPDBb+nyIeT/PHCZavuueR3CleEAV186+jh/5hrMv?=
 =?us-ascii?Q?Jnh+iWrd0C2wXryJs4SchkosNeB4uqc03NKN3Cf9vSCZgrRNVmQclkfJRKdk?=
 =?us-ascii?Q?5rnVmLrmdsxwUxSzmIn4wssoM0aqWbjNRyU2w0JaB/wMbX9XO/IP33EG2Z6s?=
 =?us-ascii?Q?j9JmE2kqyt5sPBw1WSPfAIa+sxC2i5CKdohNYk7CD8/Anxw7FOpdQcBawlql?=
 =?us-ascii?Q?VUrZxa+udiIP83kXSH7/tGJos52MzoGpffWo1fKe8SiqYLWvumaiCtxKUFqC?=
 =?us-ascii?Q?UAOBhbtLjkrnhm4eKFWPwFwOvNRzEg2wQVDqVu6/WKdiFylyR9i0MsFnT0DC?=
 =?us-ascii?Q?eUgwxsGl5pILZgUxcRczLKchPQR1/GP66C0woN22VUtcEiFvsfCDub3uwGH3?=
 =?us-ascii?Q?PNw1MmlmsJ4MI3ybkaeguqZV3RorLaT+8Qgn0sc3S7oOAHlK7OW3VVG3ELvF?=
 =?us-ascii?Q?TVB01sgGaDSvhOT5xsl8SO3MuUBFnbBjWHSxB1Wm86FUDFBS3xlemteksQeB?=
 =?us-ascii?Q?5oFHEc4Mtgq+31PHQFa25cdK3zbc9++a3Wb9BVZYoTA5hX2+8Y+80P+7/kDO?=
 =?us-ascii?Q?1adq1ycHMB/kogwEcBbXMi8d7ACuMfg8c46kQIa9FP2kFIuyM0IeSayc52l6?=
 =?us-ascii?Q?Nc1LydSXerq1nSJA1bMXoNL/MxCAk9JaxOxsu1gL5Mr86kCnAQNmLKSzJ/Xe?=
 =?us-ascii?Q?uxdlEEKK/tXMsHJWuf2DWDU7mOTLCxGEm3nt9+WwqpIpS438PqsrPAmUXIch?=
 =?us-ascii?Q?7KMp8pgks8f+EOhbPshXBOQoWUcBICAEhkcslCehr7xpWLRRExZZLBsXpQQk?=
 =?us-ascii?Q?dyl3X66yGy3kBKsjQqOqMzZR83j9l7W7yNaFVpwR6j32arDwiO4voKusDa3i?=
 =?us-ascii?Q?4+vVDQ8DzuSLehMMa4HgGxWWqlls9WvKe3N6vYLURWFr6jU8TTOAvHVzyApO?=
 =?us-ascii?Q?l0qtNEQhMtMgz4lz6FRVcOSjhG1+6M+rBtSI+hQMZPJXF4JgOfjXPBeCTgQu?=
 =?us-ascii?Q?KRoZO6TO2yxrTDem53SzD8NQC8WjLSnInmnQi4JNoihgAVq6vNJ9/TnIS12+?=
 =?us-ascii?Q?vhKGmYQStgb7/UunOOcuQHGaEYAXcIUjlHRxOMTAwR8rWhc+xC338RTTexC2?=
 =?us-ascii?Q?h3biiEA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xkgZIfCidWYBRwZPdbm1pD040ZyC4v5nML7JMJtL80Pse7lWfd4K2EpsWs5t?=
 =?us-ascii?Q?SkHsmm5jWjvsvZtYWAszZus8CyZAJB5gOvhyxoBpX5X8yLxCoPRwVD7AeRDN?=
 =?us-ascii?Q?rAr/djtO8oVBQTXKmFliZILlYKlOIHEgLF4RS39iXcLxAJfDyaSXR6hZsCb0?=
 =?us-ascii?Q?Ua0B1hqGVR3Pmbk17gMyZ+MmFVipMQwEYqVoN/6MZyq3M72hMzzpq5nF1oiK?=
 =?us-ascii?Q?oNqlm5nTiLc6K8iLcsBawxWp3rOTUPgzn92kEKyL7gTPfVx9BImCCaB6tUpP?=
 =?us-ascii?Q?5kk9bPr3c3HQ2VgoUI7Tq3o750aPlXCirnfhZlUPprH60ctOzzI7ABqb8r2t?=
 =?us-ascii?Q?xzuBccKboYILZozVjBK3vZDVwNV466eiUE7B8iQoeS8YtVcSIIAfq4K7UDcB?=
 =?us-ascii?Q?aZQK/vEfyLNkULZ7koDQq8PLFM6P9NTR4D624Vhl71oCBEzj9RQKJPTCMm7c?=
 =?us-ascii?Q?MLN2JV6lL0KmAbnGG2L/4Rh1leJbuKO/k9GbMdHtOYksSa/V5BpV+ZHcJXfn?=
 =?us-ascii?Q?9z82sM6FK1/g9/QCCEEyEdtZBV7NXaVPguWU/sDrm1j5CbzHQDWmmEnrLf+W?=
 =?us-ascii?Q?ARbNausMOu+4sFKQcdCeLjPgBxN9PnOQxyWdIkfpOAuOyKg3F05JCQUCl5zP?=
 =?us-ascii?Q?g980ydUvK7cZLeNXkZezyAyKQDriLRXcSV5j06aO2EJurEM2Rq+dNdvpxjYQ?=
 =?us-ascii?Q?e+EKdbIzQN3RZI/o1kFA/KzyJB06pgt9/rFAsW6tPhKSJvp33da09p0rQftS?=
 =?us-ascii?Q?z9au7+4u5gaFchOsI0VQhuYNhkh4XYsWrZh11nXlQqUkjjzIb3Pggrg774rI?=
 =?us-ascii?Q?aKNnGCOiqjefRTqHNl1eBNwoGOpF48vkIjHZ7HGb/VrzESp5qTLvR6x3uNe9?=
 =?us-ascii?Q?0Ct+PHD4oc/OkIGVD98NcSmDlk50p2IF9nKnlJlH9FpYFqzdXqOA6XN+mjml?=
 =?us-ascii?Q?zGS3Gej38R/Bp2ZrT6lfXGO4T3P5/tRqB5Y03Bz8qQ6r7at19Xy0ghtI6gM2?=
 =?us-ascii?Q?tfUjmg8UZD8uRNa2BaLsqUZtZ8i6aTJHMhbuKfttO+v86gvxFnuHweU4vvI/?=
 =?us-ascii?Q?lArEdvgSzQwdQbDK+auF8Bju0DBqXsa6reJKiVc14xVNDK4YjoiNEFfYc/bG?=
 =?us-ascii?Q?fdY7kDvHf6MbG1SQ7tVqg+02D6ywVhJYh8YahJUsoXf2E9Qtvi+VuD7n8CiJ?=
 =?us-ascii?Q?mOzhSJ+XTNAy2fzPptzWDwDjvRnKpgt9Zo1hg9bl7bocjuY3BAO4uT17kxOK?=
 =?us-ascii?Q?osMoKMfay9ZVkrGl9sO51iT9CGYqbrEP43NfPcLqCh0EN6Q3+rPRGspnH10F?=
 =?us-ascii?Q?stXOyyk2X/qa1s90WafySRC4jnGrxI6IFmy84eUeEJ/QW1s40Ik7RgiaG89Z?=
 =?us-ascii?Q?KyleKYoCKdptUlrfRKfq6J0fx7mVdAqsDLlFdSKj4tfId09IiSo1pyXiCcuk?=
 =?us-ascii?Q?W+OovfzaT8UwnOtvqkKPNSY23r9CcWfwSpWX2lft6PmEHxyMDRcbA3nmOrro?=
 =?us-ascii?Q?XLUc/RaSCe+MFW9gswF3z3kPY/FKQtQlAeFz8ZccAjXaqJ4RulaLQo+dCNtb?=
 =?us-ascii?Q?JmJL0/T6bPLF4UhMjVOjX1pGbDR5SJQj61n2y5zAVtNLRLAy53DY49jZk2Jj?=
 =?us-ascii?Q?MTHdAnK8mKrAeG627tRR5hI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636e146b-575c-40cb-29a2-08dc7f71a5db
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:55:27.1410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjjU+niKUX/BBNfFo4fyZl9bNnbayNEnf2F+bm+sqvC3+LKhEPTSEYEpb9Lx5eWD8yPvex+O18V7hO5qkGg1VIRtQcNLvaOa8C9pO9G4OgbCo/dY5PNKSQleSAB38xeJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11224
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
 drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 050ca7eafac58..5f8002f6bb7a5 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -242,8 +242,7 @@ static void omapdss_walk_device(struct device *dev, struct device_node *node,
 
 	of_node_put(n);
 
-	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
+	for_each_endpoint_of_node(node, n) {
 		struct device_node *pn = of_graph_get_remote_port_parent(n);
 
 		if (!pn)
-- 
2.43.0

