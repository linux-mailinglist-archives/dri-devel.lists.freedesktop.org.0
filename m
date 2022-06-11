Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3128D54754D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A75D10E47B;
	Sat, 11 Jun 2022 14:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF7710E47B
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:13:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/BKE545qdqG/MR5LceaqEqRSTZcUkiZupdpizdan9wErP43qQ7vo+w4kAR4TuIi0kuLIEVBvg3Mp0s2G/CHdftrq0zXdziJtvZKSW+YymBX3ah4ZVMe0G0f9TeViOsZO0wyfYPWbNSnd9jqdTcfthRDRYufREW/cQllpoDOpD2ImWoMPDmkOPr/bN7ptjKBsfDv7uXO8JC4s6FW8bu5LN+oWDrOAxWPyibz63jtpe7iuLiQH+sp+F+zoB0jQaDRjl5omoMhTdxyXUeM5ebfvKoYHlE7/j/dFueGcN5TfL1emw/JLVAyWDNxwMGlYBm6GIolxv5ia2a83U9Lys66vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DnUWEOsEtka9J39JoFas6+F/5dT8mgaVhBQ4SY40aI=;
 b=UeJZ7Zxi2l31w1Xs5EnBNNK4Xu4V4ZvDxxoaA/UddfJypCfbKjlmmbFXu5kQE5bO5i7yGocAYygodnBr6uIFZ5WkYO7ATNhgAktdqj+CxTVRmxsk7kMYxCgXICpatFsJJg1Tc28VOiq7aI8NmBfl3X0d/92aY9TcpucLcoF8wlpsfVdnQWfT/YtRVAJpweL+3wYLa2aanQtS4c7qDGRgdh6mZfaCVLDKvUd9jI9OLIBSc5Fs8RrFYGH3rKeLCjXHld1eSBAzAz0zWUoS5v6dcMo/ViuKmuuy7nhfWDCQ45aiiOmdq/3ii8U8vbTo9bAeNWpDVUNp5GLy0k0RYkMkHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DnUWEOsEtka9J39JoFas6+F/5dT8mgaVhBQ4SY40aI=;
 b=n+NtSiullbXSoL9m4mHilo7GlDVcrC84ptONP75mKCQiZ1MOpBq7sqRPcuEwu8MrVyNg8Hx0ObInLWUrbQ0UI8VuccAaRkaz8ZYcpO9ZsiZPln8qqg9vbQR9vH+96hGdztw0QJgh/umeiI+ByJdPf4D40vm/E0TeGC7Bb8MFayI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:12:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:12:59 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 01/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Sat, 11 Jun 2022 22:14:08 +0800
Message-Id: <20220611141421.718743-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220611141421.718743-1-victor.liu@nxp.com>
References: <20220611141421.718743-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:4:91::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5f5d974-98dc-4869-a0d1-08da4bb47d40
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB63479CBD87C749C7DEA3877798A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WrIQIxmxArCwBZCwdEcLn67GaMlGAFphSeiHnqpIkaGT5sVd4gsfqws/L9IAQGS/FROW3YQerGxSw7AKu6v4EeUReL7WNU7ZFTSoLIUK9TJGcpUNsPmhplrmLf1WDfqdByNnMMqwSAH7E1Xu8zBy021vCIf06/wOJJrmdAlxEy0gPAXInwZetEvEI+JEooMKQFy4IOzgw3MglhaBp5Ywubmpd/IQc/gGMhKbT58Z6a10oqq1tshI/ieK70JqmkfIDPkiErmjjYMR9WTKZZ1KIyGa70VKJ/ezRFxZQ13acUbkkxsyngDjWTHvHKmF5HIDAOqtNOHUXFEWp8/7HQEhXlWymrpXchZ0Cr9sedzMIT028aPRiDuayUkxleSuP2ubF0IvwuXXB4L4UEb3KYFeCBHwz9bJnl8eJbYIoH+SORKw2AV4eByORA+/hs2iXKTzD49urbYHiJyuahvBk0R1a8+x6UGimdBgv+If7Z43jiQ1T4/p/jI+vBnUbuvLB+p/Bg0rzwZn52Vu+Aln79/BK6JDC6hxJ2HOWwjEsoc7Uig+r6Jv+Wl137xdzLGkz2u9Sr3/0l9cKmo/LVIE5qJ3rmCmklQTIVwzcjDsjez8kpQC22chKtxUYjwBkfhngi9D1d2TkvxkUR965mMNHar8BcazybY7BZRBFSkQoXejmbLvmEQ+Pi3aiQd7lXYBRk08E1HsicTxmzR3C0rdUpFw0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(36756003)(83380400001)(52116002)(38350700002)(38100700002)(6512007)(26005)(6506007)(6666004)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/jerfXVpOOSCVnzIOTo6dAnc/AFiL/bLQYY6JqKXVkVkX3vHnKnoM8CKTLH4?=
 =?us-ascii?Q?eFEAPMe7zEiKZ0E9bTMaVpZeRXxWENQnQWkNyS6jFOsvnusaVt95Q3Vbwsnu?=
 =?us-ascii?Q?v6KXHErnMDHx3Es6s4iIlorb0vxZWvMxVShH9q/uy9xwJbq5ZJ6OyMC2PxdZ?=
 =?us-ascii?Q?wJlWQ/VsybnTRnwhYNKeOkwr/hHgSJ5iwj6E/dSjVJKI1s3e59Hdc9tojAsS?=
 =?us-ascii?Q?+Ys7fS6gNlf1qOrJdKUADa1bPVGciJorSGCbkmYpXbxZEiDq2SP3huD0mURO?=
 =?us-ascii?Q?lnSRmgaGNxpMdO5lKcxm2Wcht+kqmfBsOZ8muhWpBKFEDTGw5/cSW8ZayGPY?=
 =?us-ascii?Q?7QjxVDlqV82Q/vaHx5CJi2PXdyYqdBRoK+J+N/Yrx20NWZj3EUTUAnhARnq0?=
 =?us-ascii?Q?tANGX/VsxRewmy+c3KW+lnSfVBlOuHY0iz5ZH2cuggwjlxpi4wUrHePYk0gE?=
 =?us-ascii?Q?4iQ24lneNv0G/9fQlteVb/gOAh+g4AiFJ0fERLSxxZIYa0yYS6ddeZonQsR2?=
 =?us-ascii?Q?BBC2uKLrDN2nUB128sKqG9TjKyx7/RZXifOUasJRZpSwJrAECkfg+4ugbgAy?=
 =?us-ascii?Q?FpBrqRmmtTb4ygV61RH/qD/s1PvB5upFX7Or0y7DsGVj6/Kd4rlQmiqZw6d9?=
 =?us-ascii?Q?tvGcBYtUVmQ7uzGP8qQvQMHDeKVy/MydtKLVJ3OzoQQFAaWrZthOCGowKqXY?=
 =?us-ascii?Q?KpzuITP2LH74CKdAdw55bc0qlXAwQvrQaHZirHB9V/gOp+u0xzZ9mbgar5cV?=
 =?us-ascii?Q?mxLuaY9SiaHaAYwrGROevJc8upYUHrEGpnT7uuo8EmVcjTyT2MRxLYquqjBB?=
 =?us-ascii?Q?e3Ydzhv5O6iAMXo+a4rr6gTWLUzoXrzdQmnsf+ckhDQbd0SjZdtlmnY1hHjh?=
 =?us-ascii?Q?/q1i+utpfB/4fzyY3NKOoBJ7Fzhm946+DrKMOySbkJmEXwyTPp25fJfAoPNm?=
 =?us-ascii?Q?SJWN1RfD+R8S4IVSrRRYO8Cr+b4YcMwjpiovK8c4mwKHjpTShWP7WKpikTdy?=
 =?us-ascii?Q?c/ekN11UGaaUwbUB+W34MaV4PFDJGRTOTO5HkY+vmYWhXUDQhV0LawIh0p0s?=
 =?us-ascii?Q?WLJtSDeZGzU//XarV8vGilPuOdmgozWKzVSzwRPPGRcIGj/4tRIRHvWQJ5a3?=
 =?us-ascii?Q?BsuDIZEqbMnoQOqCSebo2NTkjVF4O+PUdIlmUoMJ5wM9k8MZ7xkZsxprqspo?=
 =?us-ascii?Q?VH20XkI3lnfMSL2SkFjfQp5Sxzp5TnZpF0sRa1m+hKTBURwqpZw8qwcWdPD/?=
 =?us-ascii?Q?r6qrOwfRqmV0uhP5cnzoZnEHb+B5JJunKYiXY3yQ1qnTDGKkGB5NnTYh3/zE?=
 =?us-ascii?Q?CtuH9oxSnZ+B99hES5ddObwhbPc0D39DwTYgIitdAs8zirIbPRM0a1EXwkff?=
 =?us-ascii?Q?AnqVryp1OEEkLieVcMUSQM9STaXDZy/GMgZQtH33r396ON+zaLoxD4Fy5DpG?=
 =?us-ascii?Q?SyEbTNLt4LZaqsfjbFAhk3RcY7E7hMbzi2E0Ve45J70yh5UF5nb1kCiQD+rR?=
 =?us-ascii?Q?ly2o4Ud7aMcIUutz2VGIvi7IpcUQxlQrOa268AeMVPJHbw6ixhfj/8CrOnB/?=
 =?us-ascii?Q?mJ0VEL31FcXVE6i687/3RKbg2+88oUAZ/R3JmUMfeXJO5FRI8zlQ8EAIPTu5?=
 =?us-ascii?Q?EwVZ7AI75/WslMfpmkDI1pJPR46LMIOs6KLluOgY1Kzw4g1CdgVZKi+IiHwb?=
 =?us-ascii?Q?ymb5VNvZeJ6gZCtJtv2brAInDbf1VIhcwQ8Nc9Z2kIj+ZMLaPrJdTx5/2/PS?=
 =?us-ascii?Q?skUetT6Y+A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f5d974-98dc-4869-a0d1-08da4bb47d40
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:12:59.5492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EwC2w73LetbJSynptDlwRW/Ee4lBlV7KyP5NGYXZauLDM/Qd5yXR+AF1lJODq9Du8zY+G+I26wmxhneNyNXMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6347
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
The RGB pixels with padding low per component are transmitted on a 30-bit
input bus(10-bit per component) from a display controller or a 36-bit
output bus(12-bit per component) to a pixel link.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* Add Laurent's R-b tag.

v4->v5:
* Add Robert's R-b tag.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 include/uapi/linux/media-bus-format.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11ee243a..ec3323dbb927 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101e */
+/* RGB - next is	0x1022 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -59,9 +59,13 @@
 #define MEDIA_BUS_FMT_RGB888_3X8_DELTA		0x101d
 #define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
 #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
+#define MEDIA_BUS_FMT_RGB666_1X30_CPADLO	0x101e
+#define MEDIA_BUS_FMT_RGB888_1X30_CPADLO	0x101f
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
 #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
 #define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
+#define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
+#define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
 #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
 
-- 
2.25.1

