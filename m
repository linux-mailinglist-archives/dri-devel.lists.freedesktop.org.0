Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96E7AFE8D9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0147610E7D0;
	Wed,  9 Jul 2025 12:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VTaVgr3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012065.outbound.protection.outlook.com [52.101.71.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D4010E7C7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:24:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlGpvedkcU9XWkJ/wvCgvDS1BLGM6WzJiplvbsThBe3fWIWo6TH0UJMmAKGwQlmQWxet7zmWgr/w0wiBl4fpxFQtAY9JcbR7uKbG7xt7ioboRydktyt05480BLa1eo6SqC6G53pCtnoF8UC+JEEGbda1vqnv8sh0AyHiLQKpGkoI2DJfUBKl/PVWi8WRaZ6lwESnRGLWl0+8WQGUFcpp1Q9Ow6JdkfPFvItLNLYcqAt+2O09WfTRrdgF5VUdsLECcrNnwNc2q6bDGaNov8eFu/LmnlJ9EFqK4CbdmUGSufonxmLfRsAptU/mfIMLCYWa9grzTl7sJDaU9Lh0904Kgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzO8P+gTwHCXUkbUzBI0lT9uUaNGoTme6nCt8TXCxGo=;
 b=IGbuNnSC5F0rPzAfR7KoKwno5X6f1cLP13c1bnE+XS7anlg3qsPSp1gdxmsMU6QzgXy6p0/vkIPY1Vbfx+XSEpIlQixyzBmTG5i8VmnKbfBoFz1UXqhZwqf7mfNVuthl/27TkUR1jN0M/0aD4/iAFyu6mWgT7ReeCViYYzZOWO7vkhg+cgyhAM0A7GOlTgO91L9O4YLydHrjn4vC+WCHBt/JliRnPjE7ZwKB3uMdfM3kxcdUSneqFqtFDCI99l6pbIw61mJlWRDSeY2ZFGpN7ihtyLbWAfQn+KEJfiXGvnwuHAdushoAzNSkdPAC7EM2L/ObBYhLem5+DEpBkm5T9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzO8P+gTwHCXUkbUzBI0lT9uUaNGoTme6nCt8TXCxGo=;
 b=VTaVgr3L9iga+W2IIpsTA6JF7wRtM775HwMwmC5pB72yVDK+JfQ8R5pWiJtc9fh6XKjtNIkkFGmev6G1y4g9VmGPQzV+GjbdaKuUMhAdp0MOUpz21CUhLlwN50c/NpTX8SS7qkVicnEra1AvUTOseKURFbAr3lJPYFXKUupgYplmMzy4o2cqzyDGzKIXI8uSYxEg2Txv45Kz8HT4cfIIOoj/V7RnA3xR+/OjoxdDo7TZbJGD1+j3QUju/fe6eKpuWilUkfa/lfb5irhHpnoYzkETF3x4XS4WwZMdQkeI6AN9OMHyFoWnTXFEzl2DfZICkyZXYMNVfqrhh9+DPLvFuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI0PR04MB10712.eurprd04.prod.outlook.com (2603:10a6:800:261::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:24:49 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 12:24:48 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] MAINTAINERS: Add entry for i.MX94 DCIF driver
Date: Wed,  9 Jul 2025 15:23:27 +0300
Message-Id: <20250709122332.2874632-9-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI0PR04MB10712:EE_
X-MS-Office365-Filtering-Correlation-Id: a3edd547-2b31-49bc-73f8-08ddbee398d0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|19092799006|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e3xcTcOBSqQdWArzjwS4nR0JTCO9MYyg6JBeQx1vL68y1cN37NCvt58KjTiT?=
 =?us-ascii?Q?OqkgjeRRdrIbTu222zQJP1ysYMPeEnfsAYNWEo+TTskRVqFnq+L/d3nS2fRk?=
 =?us-ascii?Q?1m1Ho0gTFHV+U5WyiG7DfmuUFeP9RbP3pOEzbvLKA+omE+aRP5zMUpS2Rjb1?=
 =?us-ascii?Q?rg+YlCH8AToUQkuazGkSfzel+Idr7ojvvfYjKOIfSNEkh911dZECdnQvmuR6?=
 =?us-ascii?Q?SAP3u2gmZE4I2Bkyg2M7REq8RhnNOfu1dw5tUTTn5dh9vyZkEZJV78q9akLE?=
 =?us-ascii?Q?PbuD8lZ+oq+8kx5dSMX8qTlHvSZ9NC92/Tpj3KzpD/NtiLM8tIWggDHSU+k8?=
 =?us-ascii?Q?xTjUqRKv1Zzx+R8aubojovfeMxmb+X7lpJqGz7VdhifZoDWiXP57jFTZHYpw?=
 =?us-ascii?Q?dJ5jtHK2CKfeg+ftcWEQeKFru5cIqsWbiQOxuJyXIuKQ0rhVbJnLDqV7SIlf?=
 =?us-ascii?Q?nlnzRj5tvbTUE8wicpsmafByyeFpnSlRFfSf6OMLT6sVYLy/PFn8110GWI1g?=
 =?us-ascii?Q?g4EKXj0/RKTjBjt8RXG089non2TVJjl6FGPNqYBFSJ6VBUL2CWcFgax0n8R/?=
 =?us-ascii?Q?d0YPXj1BBTU54FateFLajulMh3yXMUo2GjxZaNir1vZxnRj7aCiVU29OJuFP?=
 =?us-ascii?Q?z21Kpyy457oZKw9kzDOap256QpMEvcpqeWrq24W7qkYKSMw2sL9KO//0swcB?=
 =?us-ascii?Q?EMpCDhpkffoSeezTh8sSxkzJ7tbWJv4u0GnqmY9eCX+YazVqnDns/6XagdU7?=
 =?us-ascii?Q?77nYlHoVNSOZJYaiqh+EJ2J3z604oLBNyBcUWMxjm5h+j2QwubWNShSadrtn?=
 =?us-ascii?Q?ozGh6i4nyewDUAGOPnnRoPicfY2Rk+RAwNvukAIA1Pb46sNd3vSdm7sbYT1m?=
 =?us-ascii?Q?hFuLbXxFd/FScPhrUf/sO/+TgMmxEmqb839Eo327+sGeRLb3E4VpFpLQO7gr?=
 =?us-ascii?Q?3GP7MZLfdgaqs0StGCDdDjevFZWCqjLxXd5fqNS4uNjqFpOQssk7OW7PkB1e?=
 =?us-ascii?Q?1VYOjNMIKGruC3gtZNFb4BSFLAFLQCD7lXs8pW5l3JcM9nX7OA155vjEnLFa?=
 =?us-ascii?Q?B21qYW3kr7AJ2Ay+DJWLn3lHPOGNBZuTWDXEGabIFAt3amaOi0sOcqUQeUPS?=
 =?us-ascii?Q?oF71iX79sIGianiNd3Z0BdilDa3t8cSY9D7phifPtZSv1NBkGr4dB7LYp2mA?=
 =?us-ascii?Q?/Wb3vn0zoUDcgeCr4xRpxvRxXLkgpVe5hElkizMvMA9XNB6/gcmqkPeY/PeI?=
 =?us-ascii?Q?pt8SQ/52vGXygChbSzpJvMyD5yzUfRxXph2eDOYH7MBURL3xTzOumkqBJ+g6?=
 =?us-ascii?Q?OwB6VTnAEDx1xA83qgSQfoWK7P27CArZU49pnaPdoIFV3d/lcZ/QshDF24Nf?=
 =?us-ascii?Q?36eBkg8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HWift/0JerXVejzKpXbayQeYCHuIWWoqOqUOyhgqLU8W7BUCw3G1gTgkfEad?=
 =?us-ascii?Q?QL46rbQE0R/5W5lMFpzU9D6u3SIvnpiezs9I48N1N3ifQMIZeuA9wyMtdC+Q?=
 =?us-ascii?Q?EJL9EJWpciaV6kYX/5w2tBO2jjdazGpe18co+n/HvIEckM9mT5fjTowngigQ?=
 =?us-ascii?Q?b09apo7aVUMfkPZwVoqQ39I158c4Oh8xKDgRoEPFMq9kgibN64TxpQrJXxhp?=
 =?us-ascii?Q?xMqyu2c975vXSUUWWlolpmycz0cFTdENeHqovUp0pqmUgPhxXs/vO5WccdaC?=
 =?us-ascii?Q?xapResuvN3mQh2BMwHhkBTu+XoU4lZEkRRo5G22mJ5pvbiH4JeTbvJO9RCfc?=
 =?us-ascii?Q?SO/eO/iXTBpoIaS6XgY7peTJcguZz+7UUglaXyDO78Mw+7n+EzwYzz2uDpIc?=
 =?us-ascii?Q?EkWheEa0P4TkLOjDbloL0QcZYwOLEt//YY6ySvVZBsdw0Xtvfey5P59KO87s?=
 =?us-ascii?Q?7H0+e8Lmb6rGKN5MZKQQM0sVMwUIxsIAcuAcQJmR4weTSK79aH60qnXktpQI?=
 =?us-ascii?Q?OE/bnzGwncnb4hhgt0YABpONu7PrDV/HjkWvKALF25m9PAoQ5EVReVV7iCQe?=
 =?us-ascii?Q?TdKC8cNU24rnJ+vX1OWv2gvSiR2xj9aNK9TmDmJN/8E8EEDnIbG14aL+6Nn2?=
 =?us-ascii?Q?LDtQSvGHM/vLYxbR4SarPQO3V2pxzXsLv0T69QnEyhR7P8xFvxbkhtEwJO69?=
 =?us-ascii?Q?QHs99BFgHpstLy4Q3xSmjh7pP2Svaxjp2yNJ0cwqmT+z34lpfDvmY2ILrWnN?=
 =?us-ascii?Q?3BbUY/qC2A1tc4oMYsiehIEePSUEzmuaNX6mleXx9M8B/zwSRaQNeyVormaR?=
 =?us-ascii?Q?8bycyd4xfB/+qlVDTPgF7k4pbDs3j0Bo1g/l+8CTp6oKsYs3t/LKFw91yAzC?=
 =?us-ascii?Q?A/H1nGSQEcKSVWU0YWm32mPozKecTzI+J106qG3sWBWSgI/SfVQkuhfvGh5Q?=
 =?us-ascii?Q?70mVWv7BDczGZA5mbZrTOmZjFV09q86/6jKiVW4Sxm/oeKBhKUfM0UvqBzvN?=
 =?us-ascii?Q?sD/FzYKoKNjZyyd85MRQqGnTItAsbR3QNV6kyWLdK0aUOfNVnDrmeEXUJBft?=
 =?us-ascii?Q?LinBBX4MA/R6GnFBWDwlnRwsXE3+XvC/25QiOIOweKv4bj0arEVoG4nLCghS?=
 =?us-ascii?Q?WqgmvlfME8Nwhqi654vbrvi/6K1T1eZ789i21TBOka8bnAzlYqaWObq/U/jp?=
 =?us-ascii?Q?kymmRK0vEN6SfPlNc8HHPGe8z6qkE7KhAiRmkPXXcl7E9jfNwiPsCRuN0jW5?=
 =?us-ascii?Q?82DuHroO4MU2EA7OEjg5c5l0Jf8H47P3wRMi1c01IdBloSNw9bQxzr9k/TwA?=
 =?us-ascii?Q?Ya2A3DTG7kPh+CcOp9AZntuCZfO46u5ejo55i7ISJrlZM/nQB/kAEemmCLuk?=
 =?us-ascii?Q?6uZjCW0RL8uej91Jq6mQ2H5MSbkn4nPtftK/i1TFxw4uoNdto6PWHaZk8mtS?=
 =?us-ascii?Q?gmwQHllLxwS/btCx5gETxhbR/Rq032DMeRQLVyTnzDP6p/FnQJSZe4UJNXkY?=
 =?us-ascii?Q?zhubJBFKV9uNY/pq7mdAjs0V6T852SW1UKIi7SGmYMOFZ6cj0KeN1mvsLebz?=
 =?us-ascii?Q?gfDgfUeUe+ta1gK74JGYNX+I8ncTYib4LbCSljyFaK8r6T6fvi36cT3BpxTJ?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3edd547-2b31-49bc-73f8-08ddbee398d0
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:24:48.9101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgIhYEpjEnQLBR15j9Qv5UStTd66z5DTpsc3I+F6x8TSZZ8z7egiN5f0i2TEbJxjPP4wcePzfAdwC1wHPrElNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10712
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

The driver is part of DRM subsystem and is located in
drivers/gpu/drm/imx/dcif.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8be3e0fbe72b8..fbec7e42e693b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18066,6 +18066,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 94 DCIF DRIVER
+M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
+F:	drivers/gpu/drm/imx/dcif/
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>
-- 
2.46.1

