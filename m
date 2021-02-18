Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E342831E49E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 04:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3986E22F;
	Thu, 18 Feb 2021 03:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B4E6E22F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 03:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf2Aj29d7B7vJBBzdx1mX8qi0V3MDRMC+2pR4V64WWORGbIZHXR+L9LzcrmHI6+sg8ZDDca01sd9E5FiL/T74bIxKuWz5M+FNU3Q1fbnEOxmBcVBa5gNPUYG7CENP73LbrPtGKQbNN8Kk+stfOxPNwsyuAUGjk1/jcCrQIT3IuuxL3pnO9WELV7b0ejNEpBBda26HPJkQjvUj6diZ1/W7mQYHv5kLYN7QAYK1V/yxssXW6UZu/A/arLBOhiPJvRe7lMG7mh7ylPLvcUmfRYwpADOvXxX8ClVzBgiLMDRLmOmbqOnZT35bkhHT2dDUMhVJ1HnxPN2cuLx3MfY+qRQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj0JES/9snIFKFYvpWGezmS51oG4cG1J/fqDc8U/62U=;
 b=A/yrcXewIbL6GcFo8NmsLf5O80orbUOwKkfkMMJpGO/YRHLQmGdmoHh/w5TI5N7GmcTd9iS0K0AiZT+BEB6hvZbOxChiibZsZHUsi1a9fr0uUUcRwPdbA9pGQSshGF+MdONfIeY+7GESJVC/47ZcXxA6nc8/tx5k/CPqJygJYkp1HRBBX7fxuz3lEJDGRkBVBgwti9slRRJTcxNZjElpRBgPXj3TG0D5onC9IatmwMX3ZIIXVpyHto5JGR8adVFUL1Ywbkq1Py8atql4ruL+VCCkgCXrFdnFYVW6mP5Xip/jKqwuz4gpuVEvS45tE9P2RXCgnGRXYuHRbEqfi30FPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj0JES/9snIFKFYvpWGezmS51oG4cG1J/fqDc8U/62U=;
 b=p9wU8cq85g3dXQXOgEP1DF45KFSj0eCg96uRM1zfOOfiZNqEpTnocwGE3oldK8kV+59zJMQpIAN3DG8yDJKiQr8HoBFbfwCB0IMsMrDg1OAJKlKybjY3WUm9XJxVcEi9GzGg+Rl8gMpfp+diG0CQpIutmOlVJ2ierO1WxqHW4Lg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3421.eurprd04.prod.outlook.com (2603:10a6:803:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 03:54:17 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 03:54:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v4 02/14] media: uapi: Add some RGB bus formats for
 i.MX8qm/qxp pixel combiner
Date: Thu, 18 Feb 2021 11:41:43 +0800
Message-Id: <1613619715-28785-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0144.apcprd06.prod.outlook.com
 (2603:1096:1:1f::22) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR06CA0144.apcprd06.prod.outlook.com (2603:1096:1:1f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 03:54:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2063acad-4b68-4758-be43-08d8d3c0dd2b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34214D690C4D0E13B9589A1098859@VI1PR0402MB3421.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GCQA8smv5Yiz7Pp4A0SKrV40K0A5ds9A4RfDci49aGg7brGnCUwTL4hGB9tOsL6rBdVT3PNMWLywY9ISBxpglUttnQzBXum+XwP9u3B4o7/baZkPLOHqvyfyViRQ21ZaC05Q0hiocxBHKLjvvJathT3lnoyRRgk7gTBQWPDDqTuqXviezYksemWI1EijSfgv06NIFgp0pe9KUxqhq6ssBpPWgwkLJjOjrn0dDvmAV0ssLa6cOeFeT7VRFASYK78MwcYV/ADRwviP4Y3Om+Naag27/b/UNC7cbtWYuXWoBa0MLEOgB+C+Fvdp7df+RugAnxZH85Jo407UerI1tCWxMFXEShB+9yO7jIK6GFjKfValVTWlvntVcugg/kEqdHCeZRwc1mMfRTbtqwn8+lE4qg77yBJfyGgaHLjo7SHmQ4LAi1JYhb+JZkoqtNc2VYmE2cTqVroP2sUWOZaI/iy9+fvgSB1dJqHQEfQc3qZtTxcklwvpcecw9nA7iZMZnNj0hhb38Te4e3iHna5r5S7Ab+PVSPHhFWamTippR4POvYEBgqYB2+kp2WPyihKKT+G7is1v02z3G3+J6iTJSnTTlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(83380400001)(52116002)(478600001)(86362001)(5660300002)(6666004)(69590400012)(6486002)(8936002)(956004)(186003)(26005)(7416002)(6512007)(2906002)(66946007)(2616005)(8676002)(316002)(66476007)(16526019)(36756003)(66556008)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O+20wBGeIe/H4GcTTp1EbravtAq4vEsXKhG238NycOzu3cCq1J5W0rQbZh4n?=
 =?us-ascii?Q?UNxB3Mw9YiyldK2FrvTO4CdS2zQIX8nNc6jgamZeia6QckWBv7N6tbzqlev9?=
 =?us-ascii?Q?REj3jqg8W6/jrA77Vm8bzFzYvj2YMZ+vTwJQEKNl91hOmKj95aAe/OgP207u?=
 =?us-ascii?Q?DrAezsenp1c4DJhioL6UCrc5Aq+FAtBWXFfIB2q6qNMV94QNAluiykArOslY?=
 =?us-ascii?Q?mN7fECPib7aTBi9ewWcTN3RtvvjMi25hCv0p5bZ5U0NZRD27A0d5GDEVwUzO?=
 =?us-ascii?Q?v7JuAqP5+rtHyrIHCzRO+uZYAviyIPATc6CKEz4WjcMvNq9V4mbDKKFmJQtX?=
 =?us-ascii?Q?LfMFm8Cec99DVxGt6jIoDYsxUouIQqq0GHr/5aul1WmQos+zXSC8T+Brxlog?=
 =?us-ascii?Q?OIGTCs/CQY9QWKJDuAJOi/KUKy8Pd6W8XUZ4EBPfq973t3pwSRdE76lInU0M?=
 =?us-ascii?Q?Xk2iNSrpA5swbcwZ3SzILpa3WJIg9ob7TaeAvjRPrywB2fGuiPiqyj5zvLya?=
 =?us-ascii?Q?0xW/XOZowcqcyMO2kr1d0lRf7H2kIs+gwzTlFrMO4Nj7RBK+UGESKa/u/s84?=
 =?us-ascii?Q?zh+OxxIe6yb8lipRjYvwa+mXPUczdxzOSAMTDV2JlqaGZAKPXxFUBiYi+3wO?=
 =?us-ascii?Q?nXoveaNF+dyXfmU9TBiT0fQ5S3p/761CbJmA3aeCv19vWpW2h32oPCbTIeSc?=
 =?us-ascii?Q?0sgOrDxCEeN4Uizcx8hHC3hVsO5wAwiGKYURjfz6dS6sxfHt91dRiVJpurt3?=
 =?us-ascii?Q?F6xTD+sOgWFZoXJFp+vVaNlpldw4FgnakI8wbZwTMbHgFLUQiK7H2vse+n4w?=
 =?us-ascii?Q?o3mPkNJqh3BarmkEjbkE5WcH0JmGyGxhI+moLhmAltuAmsqHPYYLG2DaB9Hi?=
 =?us-ascii?Q?yip2ibaxApFEn6+yuZ0UO+VU7BYsEQTxlVDvad5Bo1I2PIVYs276+rOKOiK1?=
 =?us-ascii?Q?amOCmTgSvDTAhfkWX3Ez2QYL/Bhua3zuUZ/j6UCi8zMqU7W06rMVQ7E2oe9H?=
 =?us-ascii?Q?piocYHAkVwDHEKghBkaQvFDRoDjWO9eLX7fwrCUaWtFPu0NJSQSZ35sT8ZNu?=
 =?us-ascii?Q?iOuKbTbta/gKTpP4kdtD+yeeVmBqoNlTZpzu0b0ral6FwVUZHSXJz6ON9CDS?=
 =?us-ascii?Q?5KgVA0dl3Qn5r+iFQ6zE+7xt61rxAzro3a0DN8QJ4trMJ5Io0MU+F+6jFRkc?=
 =?us-ascii?Q?lvavt58aGimZx+z85CHV4lIbDaqapk1EcAeACTD2xTda1BsAoRs4B6l7hk3T?=
 =?us-ascii?Q?vVeDnu1NtMlNyEdutF6sEj4abYAaun6m0HTP0J72i6DlhnFwxogERoET+MCM?=
 =?us-ascii?Q?hV3oQc53cMwipEpeF4HB8zNr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2063acad-4b68-4758-be43-08d8d3c0dd2b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 03:54:17.2986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmEksu7eCXsuAATdxQMt4n7O97g/kWok46Tvo3rDSl+bdRBX/fvzPQCRI9ekVbxSxA8F0z+2ZEfIqooJssHwIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3421
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 s.hauer@pengutronix.de, jonas@kwiboo.se, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 mchehab@kernel.org, shawnguo@kernel.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds RGB666_1X30_CPADLO, RGB888_1X30_CPADLO, RGB666_1X36_CPADLO
and RGB888_1X36_CPADLO bus formats used by i.MX8qm/qxp pixel combiner.
The RGB pixels with padding low per component are transmitted on a 30-bit
input bus(10-bit per component) from a display controller or a 36-bit
output bus(12-bit per component) to a pixel link.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* No change.

 include/uapi/linux/media-bus-format.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11e..ec3323d 100644
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
