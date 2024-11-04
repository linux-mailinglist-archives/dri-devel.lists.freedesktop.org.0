Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE69BAB68
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC09810E372;
	Mon,  4 Nov 2024 03:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Yu5wrLuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2081.outbound.protection.outlook.com [40.107.104.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C227610E370
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:30:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0/3Of2G+4EInXA2Nt0Uog2BcuTHuAIoGR7c1uP+hSlgJxhW+bsVG9hUZI4Wc8hz7hESkpjGme4m43GETtU7gN3amTMfPhJAyVhKZZ2xYHo65u5mxU2/xkxQocVInmjF+Z1Dtu8kq5VLUpt6nRzoTxgwpxaUlgrOKHxSxjP+drVOnJC7XVDW9jCAPPvhYlQumiVD1BJ5IV9OuICnTYFEr0W8gDpHkGXbcZOpS3LO29ZRDvsuEgGKww/9oZ51ImTfkhj0AEQSZfBbQbfOLyxV4Knz7TnTPxUWQ77X2fPPjPurDCetiS/BlkVQt/R9RoPImumJEubUPmDkpZnr3TS+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMf3jixDKljFvNe09UwCShlLP4xcduUdFvy9xIa7FHw=;
 b=oLQevIZGC5Jk6S85QUcoh8GS7jkeDrEi++yz5joY8y4V/fgux0ApeNRrqdWafuTPga0EM6Pdtf74idYGgX1n/uyxEBHkcUTsqPl/3sKaKiq8mVuQ7pr0o56+h4PyRogZ+2Nxrhzy48OydheW1LsbMb5dWmeEOnEPeBiSIlHsBL7pIdFayCRSkbCaC5mXCJATWYoBH3oHW6S0/0UjT7uu9EliMbx63ujbMdtmUllOas0p/Htb4g4ybN/06BnOhu2ZpvXuQYA/x+jNzmcw0xI6Jw4ROwu4t7Re1n1ccV1BDwI6wHx1Oj/umEfQ6qe4nf1n4pwOiOYGU2uRP+SIZ4Zflg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMf3jixDKljFvNe09UwCShlLP4xcduUdFvy9xIa7FHw=;
 b=Yu5wrLuJxROEwYZWhMZLBnkvLpemX83uyivvn0BbNft2Ofit+XcuAofhTkXUQ5TTSY0Wh16ARbl4sRyVKD0xFRzDVxKz3MK5PbcIQSJbocyN0uxJfFBFN0QBkzosF2y00iTJG5J0Du3FXwnQWQQ9SxRrYdRcHCFy2d6lb4eRyZoS05QlT/8QKf8v/j5vgp6hvxgV5MbleLTLAvX0HvEPDm6pBU1TzcpvuR4YngNvZ9IteOZnsXB4ls1dNjrzvSk/NMXWaRDn4PESkZefXVN42A28vzAnDcOhvfx6sYVkpPV43vbhND4NgRlyaDnH/+fqjxT7HMTmTGCgPwp7ihSyaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:30:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:30:43 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v5 13/13] MAINTAINERS: Add maintainer for ITE IT6263 driver
Date: Mon,  4 Nov 2024 11:28:06 +0800
Message-Id: <20241104032806.611890-14-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: 59cd2c0f-dd53-4b86-0bfd-08dcfc811033
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PWCbGwpDiSEFJB1w90yTAGE39vV4zUFOM0cT2cueSDD9/ReJUzvhCMNp/Tjk?=
 =?us-ascii?Q?XC8J36K6CpvStUJU+YAv2CPbRA8dbIRyPy8vl0g5bemmkWggsGC8Wi2E6ijM?=
 =?us-ascii?Q?cekTvP2hN9y5iFVd5UX/bIIRijBhYbaQqr1tlVhhob60WpdJYm8ZnthyFv/H?=
 =?us-ascii?Q?ksAd8gNxG2BQ4O87BmRiULIEhRUdVFAEzy2Oop/WL89/CuZLNPF4CSSVnqH/?=
 =?us-ascii?Q?e+HwEnjZrM/lG4GiqJMqZwLRe1Ir1Jn2BIk8xcrGXahlompGygiS5CsU2bLX?=
 =?us-ascii?Q?Lxz7SYY1ihQQ6aqVd/aLa/fQu/ym5dl/whrgvy4Jr8v39ldMQs+GTNRQt62m?=
 =?us-ascii?Q?EYthbX1OfG6xYwOrq0BzU1llDZ978vGHo8wJJ5tChlTVDAx5NB6dgQeL0du7?=
 =?us-ascii?Q?520EjpAtTsFYYbCMpA+aPrjbRvK6m37Ugv65itP8lcInV1dLGmTssP6A/g6/?=
 =?us-ascii?Q?82AmI8EWtgMbrNVQbmAVBK8f17xRVx1BjTEJa+otmR5B7bum6pmjW6utYxey?=
 =?us-ascii?Q?huZi4c/sqoRiv2osRiVjhI5xCsOSHDKfWagic0ZAAU9adDfjzvkn+jjJQYCM?=
 =?us-ascii?Q?x9d0NS3Xn28H6/qF9vQxOSi36tZrHgI6aGVO9iF42lJKrAXCo1k0yoYBVUvh?=
 =?us-ascii?Q?L5BUhN1wn1v0SNABfhtzzHFJ6EzI9JnKXQ7qe+Y1Xbz3KPvOgpoN2c9ALapU?=
 =?us-ascii?Q?wGePR1Yv8/za9wM/Ofp9K27jJWWPFuQy7Go8P5hkWe+3ijePWO25OXpun4Dy?=
 =?us-ascii?Q?sdbn7+9c5bmfS2rO5vpnUwfJkFHFY/mjRxUzYedhf/Ko+mT+Fbix/NY14Zih?=
 =?us-ascii?Q?IbgnmczEG6HZiAmZEZHWjEmIGnLqXFAVZdCABoMVLiR7uYMUvY4JHqBLY3ca?=
 =?us-ascii?Q?39aSzJ+0EFcNMzj7re9Ejua91HTFKSfthaTao3CJT1y+kCTKlP8UEgrsDo+9?=
 =?us-ascii?Q?P5v+ejeaxsRpimohxu9IW52YA8v9JFx1nAnRXZM9YITrkjYz83Hla14cwD/T?=
 =?us-ascii?Q?Ot6IwTcCfjjoE4dcZeiwi96mokSDxdWjtvr9saKtWaaX0UbgpHQyDSDzZwzL?=
 =?us-ascii?Q?mJ5xgH+ahwWY/Xf2u3rcRw9pra3+x6HxsssLxoIANJZ0FRqfIRynCU5GcxTo?=
 =?us-ascii?Q?ZThqGlffQ40VN0qaDMcf3oloTXJYM49TD4eUMTyLQpD2pOX7mn2NcM2cQRcU?=
 =?us-ascii?Q?aGyPPJ7gmOSfVj/a8yPDFY1lb3C0abPzQ1ZeUoZCmfAB+6Zk/6M5Nr1BFqsj?=
 =?us-ascii?Q?Ek4t52ladcinwBmtqyohflJx9Xzes6sWBr811wnS8/pkCofnm+iESHp69jK+?=
 =?us-ascii?Q?+CEQahXvDqudMdSLfDHlvFt8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jJ4R+Mb7gWyMMTLMZ90yRhevTy7eEf/Wx/lXLbcv5B6hOQyfJYGXASrn6TkF?=
 =?us-ascii?Q?wOhECBq/cF9t9eq4BPItJJ7kuw2iBBDV8XTYFmLoiPpV+iM1VZbxtqQr6t3y?=
 =?us-ascii?Q?AJRzOmS/zrskYQFac9O9iouH1vH/r8NwmKoXY41/yAgzb1Zs1kwuQi35srEZ?=
 =?us-ascii?Q?1xUG4MKVpeO/BB7TJySnldNPP2Tq71xNG/iLLEteLFwEVKOn5hxWKmcl+P1Z?=
 =?us-ascii?Q?c4FSW3qDgTGBFBDxL2mmLlltm/BYmHQr46vdsYC4x1zwZM5f+gsZWKYPcPmJ?=
 =?us-ascii?Q?9Xw1UpNLh1ErniMWGGLGeMHDBUXwM25Vh280KTvyKHlhmbUbAj8jLbcfEVIC?=
 =?us-ascii?Q?vE2W+8IjjGv79pwIKCVcALiiN9GuzgB5YVuaa8MT3i1Hnb4dyeW1xsKayFyD?=
 =?us-ascii?Q?eDG2R5dP5NYlXaP/xluEJnYD0iTWCzX9EfRHN0Vj/Ip3Zf0hN1yvby29jdyX?=
 =?us-ascii?Q?fPPaJfUyD6zPK3hltbM8LgEaWAAIckB42F5hfL4AJocbnCgrdcjy5pITIUIc?=
 =?us-ascii?Q?daCwm0S91VbA4eV7DGYP6xLq/HWy4s2JTYM7jLVpi8ksz//WZ6ZZxC/WFKoN?=
 =?us-ascii?Q?JSzt3DtvaY+nxboAnsAroIN7jCqzeKPnovSBN8AFML/D4W9gtsouMwwKt2Vf?=
 =?us-ascii?Q?YRoZMUkUOprI4xY+OtPn1/ng+LmFEjv77LKXfeApejwXvDE4Fj/n+IQUf3mr?=
 =?us-ascii?Q?v9HuhKzQDszzw+rHwXRe1FKxnLZDh4xuErDdueuI3zEnG+kKHz3MV9ypc3nS?=
 =?us-ascii?Q?9V+PEpD/rjefDKsDHcU8TGDKnIoYGqJNmmYfKTLvIoyvAxQuiYlLFyH6m+pz?=
 =?us-ascii?Q?9G0ISD0KaBqu5ucY8ycpEFgNqFkUvFxJmmVIqiuqM7iXNRQPF7GA4kn2CsQC?=
 =?us-ascii?Q?uIgVo+TNPEjXSjJOHzaPocXuLnfjhLovwQAh2ggeDJ0eugwD9g6wWxDbWwsZ?=
 =?us-ascii?Q?AM1sZAk3AW0eZmbDViTz3h2yZFHfk/NXV2bbq0abyclRDb4sebGrWb9Gf/02?=
 =?us-ascii?Q?TQRs2NZE8yb/TDb/KnWQ316V7eV+kyw3omq4EG+v0Rt9He51HqZ67T5YyYjt?=
 =?us-ascii?Q?Wg08hB6KdFl/25/2p2y3kpbvGQwBAnz7Zyvrj6lp14bIPeRhdWlRdLSZTpCN?=
 =?us-ascii?Q?USHTD0BeS2bExSWX1FUwDz1zIkgKlxYWELCAFHB7RL1qRuZ6apFw+gk1QYMu?=
 =?us-ascii?Q?A2AndAEwrn2gLZ/utt5Gq5z2piYAGQNYI1p8noM0rm9/jyVf1wOtmoVV+QeT?=
 =?us-ascii?Q?gDnXAzPpW6tmVPOFgZKcqYbRq7fqD71nv7C4CqlBh5MWFweYATKtyEa+ADC7?=
 =?us-ascii?Q?2WP29fKM2Kd3osmsbzAG3RH4p/Z9Ooh2kHRMXoACBlifYG3+PFKjk0sknFsI?=
 =?us-ascii?Q?u5Ce8z3AagfDJw6Rfm7JG4qcy5UmCI3S/hsMXG6wNcNo9IR0Xm94J+22mKDI?=
 =?us-ascii?Q?BiaTilB/E+plmZPdHA1pOlOyOcS6kQNRY7cPNoO+y7wbXvzHYmB0x9fwYazX?=
 =?us-ascii?Q?4VjoDgE0bqw1hHIkQ1CPIgFe608ubDZltcHzc4Jn2UfPkzwFFJLfd5A6O35V?=
 =?us-ascii?Q?11+1MbLJ7cgNVflPiZuKymIfGqAzbRIHU/8vxru8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cd2c0f-dd53-4b86-0bfd-08dcfc811033
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:30:43.5160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSH9KIv0FYKS5q5H4lECaKxhMlpSbP4I3AsOnpkiDyqcWPvxRyWNhX2fHVeWyNxW85tRfH/suht/uzNOPLE1rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602
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

Add myself as the maintainer of ITE IT6263 LVDS TO HDMI BRIDGE DRIVER.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v5:
* Add Dmitry's A-b tag.

v4:
* No change.

v3:
* No change.

v2:
* New patch.  (Maxime)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f34d168b041..63200174ee65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12223,6 +12223,14 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/tuners/it913x*
 
+ITE IT6263 LVDS TO HDMI BRIDGE DRIVER
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
+F:	drivers/gpu/drm/bridge/ite-it6263.c
+
 ITE IT66121 HDMI BRIDGE DRIVER
 M:	Phong LE <ple@baylibre.com>
 M:	Neil Armstrong <neil.armstrong@linaro.org>
-- 
2.34.1

