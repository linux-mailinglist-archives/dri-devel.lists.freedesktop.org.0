Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F74FAFE8D5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29BC10E7CA;
	Wed,  9 Jul 2025 12:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mauA/Ng1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013000.outbound.protection.outlook.com
 [40.107.162.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA45210E7C7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:24:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClXxkQX0oOEWBV8x48CnW5if6f7zLogMD4NP++MlqeZaB2EiyWbJB2Kdwdv+XNcoqHAqwcNj6eqJRyNffTBguKx2La4KbuTaVPmHUn+JRb6WJCW7qlgJd4RrdPv302mNtkugVz5d8d8I+kIdGPY2F9TDtkMZzkZe3okMyYTWyIXTGM2n8EJrubQCUsM+wdni9wAAHYmJhBNsHZ2DGWfQQRjglB1e7crTuJnHG5M12aEU/QuKRUcvTfIWiTORL4gpNTpnB0ziBculT6rSCtH56RwgfpsTwiwKOMa8wSOKN0r/OSj3CdbXNiqqK5c96dT5YS1cZGx2HmP6MvxAePNk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+51OC+QV61WjBXwJTNQEf+gonsWONtqR84F1FAhwA4=;
 b=LD1RHmg9HN4OfCcQg8LFmfWjTgjbQPjPI1GuNf4iZMODnIfSMnhGS9C5qrEB1NCQiH2fcUZdX1gyBq/SdDiFkHsnWT6RH8wz2fx78SYOj6NWVv/BcuDoA2JUcoBaUgQCumsswOBHXx6B7Us6fWYEdQLLG3o3xKSgRXAZvpQ/1TAjyPBiV0Oc13tadnV5xw+SX5iuc+qsX8i+zcmsmrSwUFayvgKGXxWT7oCe0EZtQFU7cQ+FNXraRwlwXEzNM59LQvxOhCfrt/wcRcQX/VGPRDiKYT+iNouImDqbth1pZjUIdkKjkAca2hS8YasLEalsZz+jRaF+tJLqE6U38j2uEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+51OC+QV61WjBXwJTNQEf+gonsWONtqR84F1FAhwA4=;
 b=mauA/Ng15ml1eG6mEEQqszzLXQYsq+Po1JCt5pl1kCqx2FntmiFAT+dSRv6l4Z6s35V/Og0VXhY29e2xAg9LsLAe+eY0rgGt8KzffTMNnEdX1jb9f7JZN0LsjzDdOA8RHn3IXcU54QQ7lDm3iqdJmcm3zwUH2loP60VTLMDH257mklh+djq8DP1tq5G+C/o++rfsWl3FhhHGZ6caoItd1JOwwJraLmnTn7UBIzknWc2aJojsraFWE0cVgPcx82LWtdc5wd58z/Jkw22ROCAJIsue+0OqQTODB9wIlzhj9/nBHrtBPgqpz+aA1NKnJmcooE//gEAVNz5RbsgkSb/euw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI0PR04MB10712.eurprd04.prod.outlook.com (2603:10a6:800:261::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:24:43 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 12:24:43 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: dri-devel@lists.freedesktop.org, Sandor Yu <sandor.yu@nxp.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/8] drm/imx: Add support for i.MX94 DCIF
Date: Wed,  9 Jul 2025 15:23:25 +0300
Message-Id: <20250709122332.2874632-7-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::11) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI0PR04MB10712:EE_
X-MS-Office365-Filtering-Correlation-Id: c81fe642-0cfe-434a-781b-08ddbee3958b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VjCO5AaA/GwuiRvHYXnRnAKIefltnsq7sT+tvlr3LG1G7DXxFc0mV1WAYQbU?=
 =?us-ascii?Q?ZFEuLo0e2/PxPlgZ+5sSLA6tlwCCCWuvdyL63cCAEGTJBku6mtyc93pTGrmT?=
 =?us-ascii?Q?pcH5b41+pbKaaOjsv9RbqOcHT0xbNIigvdMer6+8K9GSraIQA6g/Nevbke0x?=
 =?us-ascii?Q?waUHWt3Cc40I59+ac8A6St+aevXLYzCWZR+ANudaSbSVPcAwDDUQLpK+s4o2?=
 =?us-ascii?Q?0FCH+/uCBOqhjAorcL8LqJ+jOb9v2GhfgbU0F12v/ceKK81VJASqU9D1tt4Z?=
 =?us-ascii?Q?vVdvyAApfEm5kgqoUe/t3f0GhMKbVg8QdFMutnF0U9jGeEsTWQKFD47Weiq+?=
 =?us-ascii?Q?VygyynbKmd876L9FQ3x22+ehl8/+wuoDYeYF3TSfmCsthXZitgkR/K9O21C8?=
 =?us-ascii?Q?KT4ce99ixdN9XtaTa3xyTLXGh/PzXhSytuoBHezkXB1O4DoJQOOktBL+aqx/?=
 =?us-ascii?Q?LPlLEyyWZHbzMgZfVVua+hGuh0QRJjLMIGAWsxafK/E3xGxOcN5CGa070jUn?=
 =?us-ascii?Q?TWaB/t9q4hHcKPpSs/2wMRP8Z/GEjjTVs9uQb/INjPtsTF5+J2Nebf8VdHDn?=
 =?us-ascii?Q?0RUrrN/Retcsohm5cDvHneqjDbSwjqbShJCAoh5299po2mWCWPJY3ehOOBd/?=
 =?us-ascii?Q?igwH+DT8fl/eY5VgSSXNrhecqhiBER93BoyCRIR8vuDQlLLpgukCDONVCt9g?=
 =?us-ascii?Q?hJUFiHJNrD2MytUcNkJ3kcFYjqrzZUsauSSaY5Gb90HSB9vhS9BAbgFapD19?=
 =?us-ascii?Q?zhZPylyuVtAXeqvz9ikLYvb3zCLTVnai5FV5n8OtDAm6gSSi2W7FJ3PcuVKt?=
 =?us-ascii?Q?iHSMvD1ThZ/AubxiSr/Ds0zwYJzZ14QxYuXOgJIimpK561KJJHV38151a7Qn?=
 =?us-ascii?Q?qh+dONMmwEP1aNgZRn6DqiQzmboWvNA4FzRsblHdSAfKNBQWLjhVoM5HqNul?=
 =?us-ascii?Q?3q4Y0GX+Eh94Tat+RU03BV9/RTIdjfS5F5WXj+Q/gNO87pHqrXvjkSZk2QXb?=
 =?us-ascii?Q?4CzPEq75WGWM3Q6GMLpf2fPg13wGILnMoFMkqgFZqaEgHyXuEUySCXqQ+XgB?=
 =?us-ascii?Q?i2pnvsdLMOVmpY3Pjj7IcBnG3kzmjDBaD9y7xiWD78kcyHMWi562mmX6NZCS?=
 =?us-ascii?Q?ThhQL7IzHI+6W1uOOJOr99mbqcA1wqksE9LPkAiegMgJTrSedfNOB3a3h34Q?=
 =?us-ascii?Q?1FkRKDOikRWsQtu4PQv/0eTh5UPv08+ejB2ofOEfSzuGIcVvNvqrSrdhRcuY?=
 =?us-ascii?Q?cslWKkEow7TJIbUNs7EIQ/7Li+VQFMkxyeIVH53MmEC5Py0BUyoocyUO1MPi?=
 =?us-ascii?Q?epLoMaAz6qXQdJITz0u8MT6/txcb8pcxbyq7ezwcd0rMlbt01iX77+HUhbbU?=
 =?us-ascii?Q?AT8Ael2GkUGRRpjW/kiYeWP37PiksOd17Y/7F99t4+Vi+qby01adzJ9uZy+w?=
 =?us-ascii?Q?50vEY+1F8lBQXaRp2PAYBMS/W8xR8oj2nVWJ9tRRnVhN/WJhPRKeMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kG+nnlSOvBi4QCPVBS6GXjndUzex2I89hUjrxNE+AugwHR71D3xnsEHbA6gX?=
 =?us-ascii?Q?sY3o1Cf2bBiJyrK6BHDsj+XQ3Ea/0aifi4kUxEBmMrg3/2E+KR0Odl9GUydV?=
 =?us-ascii?Q?pM8kG1phBdpCqCzvmloRlxN5Pd1lCytFN6NxNkLvTb2Q673mST3NXTVYxAJ0?=
 =?us-ascii?Q?4bKom0mwuMnWWFovr7GPnhjzQT8Xg/fIJb1jaWXk7geH6jT0w35ootrPek8C?=
 =?us-ascii?Q?4EPn9+NX4G4+8SzlQp+SPO3V0CDGaTBEjiQ8jkeql8/nLe8jcLUMnyYylvL/?=
 =?us-ascii?Q?vcTw7leGUgjt1NWxkKBGjvtiBPhxHEXTeA822YHeF3zY5W1WTX4WKIR/iD0c?=
 =?us-ascii?Q?1NSN0k/mV9v+cGu9wLpj9dKup9EHf1O8CAHiaD3ZFuQtOtfzV8LiomnEbhw2?=
 =?us-ascii?Q?Pg6oPrV4pIg+EJ8RAREGVj6YDjYr2gh6b0mhyobx7jFd7BGnJMjt8Tx04W9d?=
 =?us-ascii?Q?c2kKoUK2D8Iwp1eTF2SXhauQqW9Ymi3o8g9n9jwTBKGfKcQqpeY71DZ2qcde?=
 =?us-ascii?Q?GU2R7/hMRS5OmBnkfqKMxKFH+l6PDhziCZ9+AiH/IVArFNaK5m7dF9Y4Jaqt?=
 =?us-ascii?Q?OR7A4PlHkdtAkN6eng6tppK3z+ts4D+PNZ9BVIia2P35Jg0Apa422KW4nAgj?=
 =?us-ascii?Q?evHGMT3v26tI+mI7wqw0Frb1C2FJIUd/t4rnppTJXQpDUnbNwdKX5ouZRcH1?=
 =?us-ascii?Q?Fs58jnGCGumWfAcx1r1qXqDfMnJxfyd8XkgoFlUozLcq8PonroyVGWI4BJxq?=
 =?us-ascii?Q?Dr8dXa2KU/PIk/tkqhgTNO7t6aUvrimDqb3/lXDMRRfBOu/VMWytpI4KF04h?=
 =?us-ascii?Q?U8HuA5pLJvh3hHpm0oz8RPq9VB2+99P1W50oAMQ67ktiV133VbEhd6Rj2/aX?=
 =?us-ascii?Q?xjyvveoF6GQ6bz/Vp42yDi+KknsUTx01zcukMl/4HIUDpCFOS1gt5sWDYOWb?=
 =?us-ascii?Q?R0Awx9O1AKZFIjHIBDVbRcLVjSmY48oYWAEPqNWla4Z54+Jj8HGQNrN1SYRi?=
 =?us-ascii?Q?6yCtIorKUa6hMVmeELmOICj2Hfzpjnj1Hw8EyjUkBdAbOJoi7UGZbzQL4Nx5?=
 =?us-ascii?Q?pbqCBFsXRCpAGx23ySJRFLUX/gEV3VrDqPI/5rjPVBCSftzljtbRuA3OCarE?=
 =?us-ascii?Q?BqcL+l8S45qzIeg+zbmEofQ89J/giDnO16Z0947olyXMfF1hTk8PP92ZgYWH?=
 =?us-ascii?Q?SAY85aH/I7oQ6iwmAimS5HTIS8HVQn8QtvQwRnTDaUiPQd2N9GDXVAgi33F2?=
 =?us-ascii?Q?+EBfb4zi5lest/5CtftB/D7h+69Y046GHEdJNDIK3JoJcEfZ1QwARGSbg+Hq?=
 =?us-ascii?Q?6nrRgFIOos7Tp6vBSsi/ky+AdtH+QAADcnzlrNpcuMLc05F3VpOxhaRIDqm6?=
 =?us-ascii?Q?ljD6lyMh3h/ItImQ5ID8mdIL6v1wfRXTa+bxWFkZMH8OtPx626k8175VxVzC?=
 =?us-ascii?Q?JOgo1PA7HXvdmP+tFAoC+qr2KMoxCUWF5e63pkqoGMfaVMwc8Lf5RXGmlNNV?=
 =?us-ascii?Q?9uViEyIbAeTfS4FAtaisydah5Oy82uZgbKqGDMJWq6C55FRhF0koqDQK33Bp?=
 =?us-ascii?Q?kvOuXdiWsFvxrJ0t8g2WWcVcI6vG94Q+ZoA+/G5XcUvDDag/ISg/LK9k9Fq0?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81fe642-0cfe-434a-781b-08ddbee3958b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:24:43.6348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onKWWG+Bgjaoir9RObfBpl4wxSyDmSKOunDCNlp0HamqjfceMtj622EK15UbA/zHKG1U01zT+M9WpV55BELlOA==
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

From: Sandor Yu <sandor.yu@nxp.com>

This patch adds support for the i.MX94 Display Control Interface.

Signed-off-by: Sandor Yu <sandor.yu@nxp.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/imx/Kconfig           |   1 +
 drivers/gpu/drm/imx/Makefile          |   1 +
 drivers/gpu/drm/imx/dcif/Kconfig      |  12 +
 drivers/gpu/drm/imx/dcif/Makefile     |   5 +
 drivers/gpu/drm/imx/dcif/dcif-crc.c   | 211 ++++++++
 drivers/gpu/drm/imx/dcif/dcif-crc.h   |  52 ++
 drivers/gpu/drm/imx/dcif/dcif-crtc.c  | 696 ++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.c   | 293 +++++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.h   |  87 ++++
 drivers/gpu/drm/imx/dcif/dcif-kms.c   | 101 ++++
 drivers/gpu/drm/imx/dcif/dcif-plane.c | 269 ++++++++++
 drivers/gpu/drm/imx/dcif/dcif-reg.h   | 326 ++++++++++++
 12 files changed, 2054 insertions(+)
 create mode 100644 drivers/gpu/drm/imx/dcif/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dcif/Makefile
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.h
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.h
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-kms.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-plane.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-reg.h

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index 3e8c6edbc17c2..1b6ced5c60b51 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 source "drivers/gpu/drm/imx/dc/Kconfig"
+source "drivers/gpu/drm/imx/dcif/Kconfig"
 source "drivers/gpu/drm/imx/dcss/Kconfig"
 source "drivers/gpu/drm/imx/ipuv3/Kconfig"
 source "drivers/gpu/drm/imx/lcdc/Kconfig"
diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
index c7b317640d71d..2b9fd85eefaa3 100644
--- a/drivers/gpu/drm/imx/Makefile
+++ b/drivers/gpu/drm/imx/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_DRM_IMX8_DC) += dc/
+obj-$(CONFIG_DRM_IMX_DCIF) += dcif/
 obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
 obj-$(CONFIG_DRM_IMX) += ipuv3/
 obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
diff --git a/drivers/gpu/drm/imx/dcif/Kconfig b/drivers/gpu/drm/imx/dcif/Kconfig
new file mode 100644
index 0000000000000..f16652c49d211
--- /dev/null
+++ b/drivers/gpu/drm/imx/dcif/Kconfig
@@ -0,0 +1,12 @@
+config DRM_IMX_DCIF
+	tristate "DRM support for NXP i.MX943 DCIF"
+	select DRM_KMS_HELPER
+	select VIDEOMODE_HELPERS
+	select DRM_GEM_DMA_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	depends on DRM && OF && ARCH_MXC
+	depends on COMMON_CLK
+	help
+	  enable NXP i.MX943 Display Control Interface(DCIF) support
diff --git a/drivers/gpu/drm/imx/dcif/Makefile b/drivers/gpu/drm/imx/dcif/Makefile
new file mode 100644
index 0000000000000..b429572040f0e
--- /dev/null
+++ b/drivers/gpu/drm/imx/dcif/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+imx-dcif-drm-objs := dcif-crc.o dcif-crtc.o dcif-drv.o dcif-kms.o dcif-plane.o
+
+obj-$(CONFIG_DRM_IMX_DCIF) += imx-dcif-drm.o
diff --git a/drivers/gpu/drm/imx/dcif/dcif-crc.c b/drivers/gpu/drm/imx/dcif/dcif-crc.c
new file mode 100644
index 0000000000000..2af363bd96169
--- /dev/null
+++ b/drivers/gpu/drm/imx/dcif/dcif-crc.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_rect.h>
+
+#include "dcif-crc.h"
+#include "dcif-reg.h"
+
+#define MAX_DCIF_CRC_NUM       4
+
+static int dcif_crc_config(struct dcif_dev *dcif, struct drm_rect *roi, int ncrc)
+{
+	int pos, size;
+
+	if (ncrc >= MAX_DCIF_CRC_NUM)
+		return -EINVAL;
+
+	pos = DCIF_CRC_POS_CRC_HOR_POS(roi->x1) |
+	      DCIF_CRC_POS_CRC_VER_POS(roi->y1);
+	size = DCIF_CRC_SIZE_CRC_HOR_SIZE(roi->x2 - roi->x1) |
+	       DCIF_CRC_SIZE_CRC_VER_SIZE(roi->y2 - roi->y1);
+
+	regmap_write(dcif->regmap, DCIF_CRC_POS_R(ncrc), pos);
+	regmap_write(dcif->regmap, DCIF_CRC_SIZE_R(ncrc), size);
+
+	regmap_set_bits(dcif->regmap, DCIF_CRC_CTRL,
+			DCIF_CRC_CTRL_CRC_EN(ncrc) | DCIF_CRC_CTRL_CRC_ERR_CNT_RST);
+
+	return 0;
+}
+
+void dcif_crtc_enable_crc_source(struct dcif_dev *dcif,
+				 enum dcif_crc_source source,
+				 struct drm_rect *roi,
+				 int ncrc)
+{
+	if (ncrc >= MAX_DCIF_CRC_NUM)
+		return;
+
+	if (source == DCIF_CRC_SRC_NONE)
+		return;
+
+	if (dcif->crc_is_enabled)
+		return;
+
+	dcif_crc_config(dcif, roi, ncrc);
+
+	regmap_set_bits(dcif->regmap, DCIF_CRC_CTRL,
+			DCIF_CRC_CTRL_CRC_MODE | DCIF_CRC_CTRL_CRC_SHADOW_LOAD_EN |
+			DCIF_CRC_CTRL_CRC_TRIG);
+
+	dcif->crc_is_enabled = true;
+}
+
+void dcif_crtc_disable_crc_source(struct dcif_dev *dcif, int ncrc)
+{
+	if (!dcif->crc_is_enabled)
+		return;
+
+	if (ncrc >= MAX_DCIF_CRC_NUM)
+		return;
+
+	regmap_clear_bits(dcif->regmap, DCIF_CRC_CTRL, DCIF_CRC_CTRL_CRC_EN(ncrc));
+
+	dcif->crc_is_enabled = false;
+}
+
+/*
+ * Supported modes and source names:
+ * 1) auto mode:
+ *    "auto" should be selected as the source name.
+ *    The evaluation window is the same to the display region as
+ *    indicated by drm_crtc_state->adjusted_mode.
+ *
+ * 2) region of interest(ROI) mode:
+ *    "roi:x1,y1,x2,y2" should be selected as the source name.
+ *    The region of interest is defined by the inclusive upper left
+ *    position at (x1, y1) and the exclusive lower right position
+ *    at (x2, y2), see struct drm_rect for the same idea.
+ *    The evaluation window is the region of interest.
+ */
+static int
+dcif_crc_parse_source(const char *source_name, enum dcif_crc_source *s,
+		      struct drm_rect *roi)
+{
+	static const char roi_prefix[] = "roi:";
+
+	if (!source_name) {
+		*s = DCIF_CRC_SRC_NONE;
+	} else if (!strcmp(source_name, "auto")) {
+		*s = DCIF_CRC_SRC_FRAME;
+	} else if (strstarts(source_name, roi_prefix)) {
+		char *options, *opt;
+		int len = strlen(roi_prefix);
+		int params[4];
+		int i = 0, ret;
+
+		options = kstrdup(source_name + len, GFP_KERNEL);
+
+		while ((opt = strsep(&options, ",")) != NULL) {
+			if (i > 3)
+				return -EINVAL;
+
+			ret = kstrtouint(opt, 10, &params[i]);
+			if (ret < 0)
+				return ret;
+
+			if (params[i] < 0)
+				return -EINVAL;
+
+			i++;
+		}
+
+		if (i != 4)
+			return -EINVAL;
+
+		roi->x1 = params[0];
+		roi->y1 = params[1];
+		roi->x2 = params[2];
+		roi->y2 = params[3];
+
+		if (!drm_rect_visible(roi))
+			return -EINVAL;
+
+		*s = DCIF_CRC_SRC_FRAME_ROI;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int dcif_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
+				size_t *values_cnt)
+{
+	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
+	enum dcif_crc_source source;
+	struct drm_rect roi;
+
+	if (dcif_crc_parse_source(source_name, &source, &roi) < 0) {
+		dev_dbg(dcif->drm.dev, "unknown source %s\n", source_name);
+		return -EINVAL;
+	}
+
+	*values_cnt = 1;
+
+	return 0;
+}
+
+int dcif_crtc_set_crc_source(struct drm_crtc *crtc, const char *source_name)
+{
+	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_rect roi = {0, 0, 0, 0};
+	enum dcif_crc_source source;
+	int ret;
+
+	if (dcif_crc_parse_source(source_name, &source, &roi) < 0) {
+		dev_dbg(dcif->drm.dev, "unknown source %s\n", source_name);
+		return -EINVAL;
+	}
+
+	/* Perform an atomic commit to set the CRC source. */
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_atomic_state_alloc(crtc->dev);
+	if (!state) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	state->acquire_ctx = &ctx;
+
+retry:
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (!IS_ERR(crtc_state)) {
+		struct dcif_crtc_state *dcif_crtc_state;
+
+		dcif_crtc_state = to_dcif_crtc_state(crtc_state);
+
+		dcif_crtc_state->crc.source = source;
+		dcif_copy_roi(&roi, &dcif_crtc_state->crc.roi);
+
+		ret = drm_atomic_commit(state);
+	} else {
+		ret = PTR_ERR(crtc_state);
+	}
+
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		drm_modeset_backoff(&ctx);
+		goto retry;
+	}
+
+	drm_atomic_state_put(state);
+
+unlock:
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	return ret;
+}
+
diff --git a/drivers/gpu/drm/imx/dcif/dcif-crc.h b/drivers/gpu/drm/imx/dcif/dcif-crc.h
new file mode 100644
index 0000000000000..ea1b18362a344
--- /dev/null
+++ b/drivers/gpu/drm/imx/dcif/dcif-crc.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DCIF_CRC_H__
+#define __DCIF_CRC_H__
+
+#include <linux/types.h>
+
+#include "dcif-drv.h"
+
+static inline bool to_enable_dcif_crc(struct dcif_crtc_state *new_dcstate,
+				      struct dcif_crtc_state *old_dcstate)
+{
+	return old_dcstate->crc.source == DCIF_CRC_SRC_NONE &&
+	       new_dcstate->crc.source != DCIF_CRC_SRC_NONE;
+}
+
+static inline bool to_disable_dcif_crc(struct dcif_crtc_state *new_dcstate,
+				       struct dcif_crtc_state *old_dcstate)
+{
+	return old_dcstate->crc.source != DCIF_CRC_SRC_NONE &&
+	       new_dcstate->crc.source == DCIF_CRC_SRC_NONE;
+}
+
+static inline void dcif_copy_roi(struct drm_rect *from, struct drm_rect *to)
+{
+	to->x1 = from->x1;
+	to->y1 = from->y1;
+	to->x2 = from->x2;
+	to->y2 = from->y2;
+}
+
+#ifdef CONFIG_DEBUG_FS
+int dcif_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
+				size_t *values_cnt);
+int dcif_crtc_set_crc_source(struct drm_crtc *crtc, const char *source_name);
+void dcif_crtc_enable_crc_source(struct dcif_dev *dcif,
+				 enum dcif_crc_source source,
+				 struct drm_rect *roi,
+				 int nCRC);
+void dcif_crtc_disable_crc_source(struct dcif_dev *dcif, int nCRC);
+#else
+#define dcif_crtc_verify_crc_source	NULL
+#define dcif_crtc_set_crc_source	NULL
+#define dcif_crtc_enable_crc_source	NULL
+#define dcif_crtc_disable_crc_source	NULL
+#endif
+
+#endif /* __DCIF_CRC_H__ */
diff --git a/drivers/gpu/drm/imx/dcif/dcif-crtc.c b/drivers/gpu/drm/imx/dcif/dcif-crtc.c
new file mode 100644
index 0000000000000..cf92498b343af
--- /dev/null
+++ b/drivers/gpu/drm/imx/dcif/dcif-crtc.c
@@ -0,0 +1,696 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/irq.h>
+#include <linux/media-bus-format.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+
+#include "dcif-crc.h"
+#include "dcif-drv.h"
+#include "dcif-reg.h"
+
+#define DCIF_MAX_PIXEL_CLOCK		148500000
+
+/* -----------------------------------------------------------------------------
+ * CRTC
+ */
+
+/*
+ * For conversion from YCbCr to RGB, the CSC operates as follows:
+ *
+ * |R|   |A1 A2 A3|   |Y  + D1|
+ * |G| = |B1 B2 B3| * |Cb + D2|
+ * |B|   |C1 C2 C3|   |Cr + D3|
+ *
+ * The A, B and C coefficients are expressed as signed Q3.8 fixed point values and
+ * the D coefficients as signed Q9.0.
+ */
+static const u32 dcif_yuv2rgb_coeffs[3][2][6] = {
+	[DRM_COLOR_YCBCR_BT601] = {
+		[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+			/*
+			 * BT.601 limited range:
+			 *
+			 * |R|   |1.1644  0.0000  1.5960|   |Y  - 16 |
+			 * |G| = |1.1644 -0.3917 -0.8129| * |Cb - 128|
+			 * |B|   |1.1644  2.0172  0.0000|   |Cr - 128|
+			 */
+			DCIF_CSC_COEF0_L0_A1(0x12a) | DCIF_CSC_COEF0_L0_A2(0x000),
+			DCIF_CSC_COEF1_L0_A3(0x199) | DCIF_CSC_COEF1_L0_B1(0x12a),
+			DCIF_CSC_COEF2_L0_B2(0x79c) | DCIF_CSC_COEF2_L0_B3(0x730),
+			DCIF_CSC_COEF3_L0_C1(0x12a) | DCIF_CSC_COEF3_L0_C2(0x204),
+			DCIF_CSC_COEF4_L0_C3(0x000) | DCIF_CSC_COEF4_L0_D1(0x1f0),
+			DCIF_CSC_COEF5_L0_D2(0x180) | DCIF_CSC_COEF5_L0_D3(0x180),
+		},
+		[DRM_COLOR_YCBCR_FULL_RANGE] = {
+			/*
+			 * BT.601 full range:
+			 *
+			 * |R|   |1.0000  0.0000  1.4020|   |Y  - 0  |
+			 * |G| = |1.0000 -0.3441 -0.7141| * |Cb - 128|
+			 * |B|   |1.0000  1.7720  0.0000|   |Cr - 128|
+			 */
+			DCIF_CSC_COEF0_L0_A1(0x100) | DCIF_CSC_COEF0_L0_A2(0x000),
+			DCIF_CSC_COEF1_L0_A3(0x167) | DCIF_CSC_COEF1_L0_B1(0x100),
+			DCIF_CSC_COEF2_L0_B2(0x7a8) | DCIF_CSC_COEF2_L0_B3(0x749),
+			DCIF_CSC_COEF3_L0_C1(0x100) | DCIF_CSC_COEF3_L0_C2(0x1c6),
+			DCIF_CSC_COEF4_L0_C3(0x000) | DCIF_CSC_COEF4_L0_D1(0x000),
+			DCIF_CSC_COEF5_L0_D2(0x180) | DCIF_CSC_COEF5_L0_D3(0x180),
+		},
+	},
+	[DRM_COLOR_YCBCR_BT709] = {
+		[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+			/*
+			 * Rec.709 limited range:
+			 *
+			 * |R|   |1.1644  0.0000  1.7927|   |Y  - 16 |
+			 * |G| = |1.1644 -0.2132 -0.5329| * |Cb - 128|
+			 * |B|   |1.1644  2.1124  0.0000|   |Cr - 128|
+			 */
+			DCIF_CSC_COEF0_L0_A1(0x12a) | DCIF_CSC_COEF0_L0_A2(0x000),
+			DCIF_CSC_COEF1_L0_A3(0x1cb) | DCIF_CSC_COEF1_L0_B1(0x12a),
+			DCIF_CSC_COEF2_L0_B2(0x7c9) | DCIF_CSC_COEF2_L0_B3(0x778),
+			DCIF_CSC_COEF3_L0_C1(0x12a) | DCIF_CSC_COEF3_L0_C2(0x21d),
+			DCIF_CSC_COEF4_L0_C3(0x000) | DCIF_CSC_COEF4_L0_D1(0x1f0),
+			DCIF_CSC_COEF5_L0_D2(0x180) | DCIF_CSC_COEF5_L0_D3(0x180),
+		},
+		[DRM_COLOR_YCBCR_FULL_RANGE] = {
+			/*
+			 * Rec.709 full range:
+			 *
+			 * |R|   |1.0000  0.0000  1.5748|   |Y  - 0  |
+			 * |G| = |1.0000 -0.1873 -0.4681| * |Cb - 128|
+			 * |B|   |1.0000  1.8556  0.0000|   |Cr - 128|
+			 */
+			DCIF_CSC_COEF0_L0_A1(0x100) | DCIF_CSC_COEF0_L0_A2(0x000),
+			DCIF_CSC_COEF1_L0_A3(0x193) | DCIF_CSC_COEF1_L0_B1(0x100),
+			DCIF_CSC_COEF2_L0_B2(0x7d0) | DCIF_CSC_COEF2_L0_B3(0x788),
+			DCIF_CSC_COEF3_L0_C1(0x100) | DCIF_CSC_COEF3_L0_C2(0x1db),
+			DCIF_CSC_COEF4_L0_C3(0x000) | DCIF_CSC_COEF4_L0_D1(0x000),
+			DCIF_CSC_COEF5_L0_D2(0x180) | DCIF_CSC_COEF5_L0_D3(0x180),
+		},
+	},
+	[DRM_COLOR_YCBCR_BT2020] = {
+		[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+			/*
+			 * BT.2020 limited range:
+			 *
+			 * |R|   |1.1644  0.0000  1.6787|   |Y  - 16 |
+			 * |G| = |1.1644 -0.1874 -0.6505| * |Cb - 128|
+			 * |B|   |1.1644  2.1418  0.0000|   |Cr - 128|
+			 */
+			DCIF_CSC_COEF0_L0_A1(0x12a) | DCIF_CSC_COEF0_L0_A2(0x000),
+			DCIF_CSC_COEF1_L0_A3(0x1ae) | DCIF_CSC_COEF1_L0_B1(0x12a),
+			DCIF_CSC_COEF2_L0_B2(0x7d0) | DCIF_CSC_COEF2_L0_B3(0x759),
+			DCIF_CSC_COEF3_L0_C1(0x12a) | DCIF_CSC_COEF3_L0_C2(0x224),
+			DCIF_CSC_COEF4_L0_C3(0x000) | DCIF_CSC_COEF4_L0_D1(0x1f0),
+			DCIF_CSC_COEF5_L0_D2(0x180) | DCIF_CSC_COEF5_L0_D3(0x180),
+		},
+		[DRM_COLOR_YCBCR_FULL_RANGE] = {
+			/*
+			 * BT.2020 full range:
+			 *
+			 * |R|   |1.0000  0.0000  1.4746|   |Y  - 0  |
+			 * |G| = |1.0000 -0.1646 -0.5714| * |Cb - 128|
+			 * |B|   |1.0000  1.8814  0.0000|   |Cr - 128|
+			 */
+			DCIF_CSC_COEF0_L0_A1(0x100) | DCIF_CSC_COEF0_L0_A2(0x000),
+			DCIF_CSC_COEF1_L0_A3(0x179) | DCIF_CSC_COEF1_L0_B1(0x100),
+			DCIF_CSC_COEF2_L0_B2(0x7d6) | DCIF_CSC_COEF2_L0_B3(0x76e),
+			DCIF_CSC_COEF3_L0_C1(0x100) | DCIF_CSC_COEF3_L0_C2(0x1e2),
+			DCIF_CSC_COEF4_L0_C3(0x000) | DCIF_CSC_COEF4_L0_D1(0x000),
+			DCIF_CSC_COEF5_L0_D2(0x180) | DCIF_CSC_COEF5_L0_D3(0x180),
+		},
+	},
+};
+
+static enum drm_mode_status dcif_crtc_mode_valid(struct drm_crtc *crtc,
+						 const struct drm_display_mode *mode)
+{
+	if (mode->crtc_clock > DCIF_MAX_PIXEL_CLOCK)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static void dcif_set_formats(struct dcif_dev *dcif, struct drm_plane_state *plane_state,
+			     const u32 bus_format)
+{
+	const u32 format = plane_state->fb->format->format;
+	struct drm_device *drm = &dcif->drm;
+	bool in_yuv = false;
+	u32 reg = 0;
+
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		reg |= DCIF_DPI_CTRL_DATA_PATTERN(PATTERN_RGB565);
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		reg |= DCIF_DPI_CTRL_DATA_PATTERN(PATTERN_RGB888);
+		break;
+	case MEDIA_BUS_FMT_RBG888_1X24:
+		reg |= DCIF_DPI_CTRL_DATA_PATTERN(PATTERN_RBG888);
+		break;
+	case MEDIA_BUS_FMT_BGR888_1X24:
+		reg |= DCIF_DPI_CTRL_DATA_PATTERN(PATTERN_BGR888);
+		break;
+	case MEDIA_BUS_FMT_GBR888_1X24:
+		reg |= DCIF_DPI_CTRL_DATA_PATTERN(PATTERN_GBR888);
+		break;
+	default:
+		dev_err(drm->dev, "Unknown media bus format 0x%x\n", bus_format);
+		break;
+	}
+
+	regmap_update_bits(dcif->regmap, DCIF_DPI_CTRL, DCIF_DPI_CTRL_DATA_PATTERN_MASK, reg);
+
+	reg = 0;
+	switch (format) {
+	/* RGB Formats */
+	case DRM_FORMAT_RGB565:
+		reg |= DCIF_CTRLDESC0_FORMAT(CTRLDESCL0_FORMAT_RGB565);
+		break;
+	case DRM_FORMAT_RGB888:
+		reg |= DCIF_CTRLDESC0_FORMAT(CTRLDESCL0_FORMAT_RGB888);
+		break;
+	case DRM_FORMAT_XRGB1555:
+		reg |= DCIF_CTRLDESC0_FORMAT(CTRLDESCL0_FORMAT_ARGB1555);
+		break;
+	case DRM_FORMAT_XRGB4444:
+		reg |= DCIF_CTRLDESC0_FORMAT(CTRLDESCL0_FORMAT_ARGB4444);
+		break;
+	case DRM_FORMAT_XBGR8888:
+		reg |= DCIF_CTRLDESC0_FORMAT(CTRLDESCL0_FORMAT_ABGR8888);
+		break;
+	case DRM_FORMAT_XRGB8888:
+		reg |= DCIF_CTRLDESC0_FORMAT(CTRLDESCL0_FORMAT_ARGB8888);
+		break;
+
+	/* YUV Formats */
+	case DRM_FORMAT_YUYV:
+		reg |= DCIF_CTRLDESC0_FORMAT(CTRLDESCL0_FORMAT_YCBCR422) |
+		       DCIF_CTRLDESC0_YUV_FORMAT(CTRLDESCL0_YUV_FORMAT_VY2UY1);
+		in_yuv = true;
+		break;
+	case DRM_FORMAT_YVYU:
+		reg |= DCIF_CTRLDESC0_FORMAT(CTRLDESCL0_FORMAT_YCBCR422) |
+		       DCIF_CTRLDESC0_YUV_FORMAT(CTRLDESCL0_YUV_FORMAT_UY2VY1);
+		in_yuv = true;
+		break;
+	case DRM_FORMAT_UYVY:
+		reg |= DCIF_CTRLDESC0_FORMAT(CTRLDESCL0_FORMAT_YCBCR422) |
+		       DCIF_CTRLDESC0_YUV_FORMAT(CTRLDESCL0_YUV_FORMAT_Y2VY1U);
+		in_yuv = true;
+		break;
+	case DRM_FORMAT_VYUY:
+		reg |= DCIF_CTRLDESC0_FORMAT(CTRLDESCL0_FORMAT_YCBCR422) |
+		       DCIF_CTRLDESC0_YUV_FORMAT(CTRLDESCL0_YUV_FORMAT_Y2UY1V);
+		in_yuv = true;
+		break;
+
+	default:
+		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
+		break;
+	}
+
+	regmap_update_bits(dcif->regmap, DCIF_CTRLDESC0(0),
+			   DCIF_CTRLDESC0_FORMAT_MASK | DCIF_CTRLDESC0_YUV_FORMAT_MASK,
+			   reg);
+
+	if (in_yuv) {
+		/* Enable CSC YCbCr -> RGB */
+		const u32 *coeffs =
+			dcif_yuv2rgb_coeffs[plane_state->color_encoding][plane_state->color_range];
+
+		regmap_bulk_write(dcif->regmap, DCIF_CSC_COEF0_L0, coeffs, 6);
+
+		regmap_write(dcif->regmap, DCIF_CSC_CTRL_L0,
+			     DCIF_CSC_CTRL_L0_CSC_EN |
+			     DCIF_CSC_CTRL_L0_CSC_MODE_YCBCR2RGB);
+	} else {
+		regmap_write(dcif->regmap, DCIF_CSC_CTRL_L0, 0);
+	}
+}
+
+static void dcif_set_mode(struct dcif_dev *dcif, u32 bus_flags)
+{
+	struct drm_display_mode *m = &dcif->crtc.state->adjusted_mode;
+	u32 reg = 0;
+
+	if (m->flags & DRM_MODE_FLAG_NHSYNC)
+		reg |= DCIF_DPI_CTRL_HSYNC_POL_LOW;
+	if (m->flags & DRM_MODE_FLAG_NVSYNC)
+		reg |= DCIF_DPI_CTRL_VSYNC_POL_LOW;
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
+		reg |= DCIF_DPI_CTRL_DE_POL_LOW;
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+		reg |= DCIF_DPI_CTRL_PCLK_EDGE_FALLING;
+
+	regmap_update_bits(dcif->regmap, DCIF_DPI_CTRL, DCIF_DPI_CTRL_POL_MASK, reg);
+
+	/* config display timings */
+	reg = DCIF_DISP_SIZE_DISP_WIDTH(m->hdisplay) |
+	      DCIF_DISP_SIZE_DISP_HEIGHT(m->vdisplay);
+	regmap_write(dcif->regmap, DCIF_DISP_SIZE, reg);
+
+	reg = DCIF_DPI_HSYN_PAR_BP_H(m->htotal - m->hsync_end) |
+	      DCIF_DPI_HSYN_PAR_FP_H(m->hsync_start - m->hdisplay);
+	regmap_write(dcif->regmap, DCIF_DPI_HSYN_PAR, reg);
+
+	reg = DCIF_DPI_VSYN_PAR_BP_V(m->vtotal - m->vsync_end) |
+	      DCIF_DPI_VSYN_PAR_FP_V(m->vsync_start - m->vdisplay);
+	regmap_write(dcif->regmap, DCIF_DPI_VSYN_PAR, reg);
+
+	reg = DCIF_DPI_VSYN_HSYN_WIDTH_PW_V(m->vsync_end - m->vsync_start) |
+	      DCIF_DPI_VSYN_HSYN_WIDTH_PW_H(m->hsync_end - m->hsync_start);
+	regmap_write(dcif->regmap, DCIF_DPI_VSYN_HSYN_WIDTH, reg);
+
+	/* Layer 0 frame size */
+	reg = DCIF_CTRLDESC2_HEIGHT(m->vdisplay) |
+	      DCIF_CTRLDESC2_WIDTH(m->hdisplay);
+	regmap_write(dcif->regmap, DCIF_CTRLDESC2(0), reg);
+
+	/*
+	 * Configure P_SIZE, T_SIZE and pitch
+	 * 1. P_SIZE and T_SIZE should never be less than AXI bus width.
+	 * 2. P_SIZE should never be less than T_SIZE.
+	 */
+	reg = DCIF_CTRLDESC3_P_SIZE(2) | DCIF_CTRLDESC3_T_SIZE(2) |
+	      DCIF_CTRLDESC3_PITCH(dcif->crtc.primary->state->fb->pitches[0]);
+	regmap_write(dcif->regmap, DCIF_CTRLDESC3(0), reg);
+}
+
+static void dcif_enable_plane_panic(struct dcif_dev *dcif)
+{
+	u32 reg;
+
+	/* Set FIFO Panic watermarks, low 1/3, high 2/3. */
+	reg = DCIF_PANIC_THRES_LOW(1 * PANIC0_THRES_MAX / 3) |
+	      DCIF_PANIC_THRES_HIGH(2 * PANIC0_THRES_MAX / 3) |
+	      DCIF_PANIC_THRES_REQ_EN;
+	regmap_write(dcif->regmap, DCIF_PANIC_THRES(0), reg);
+	regmap_write(dcif->regmap, DCIF_PANIC_THRES(1), reg);
+
+	regmap_set_bits(dcif->regmap, DCIF_IE1(dcif->cpu_domain),
+			DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1);
+}
+
+static void dcif_disable_plane_panic(struct dcif_dev *dcif)
+{
+	regmap_clear_bits(dcif->regmap, DCIF_IE1(dcif->cpu_domain),
+			  DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1);
+	regmap_clear_bits(dcif->regmap, DCIF_PANIC_THRES(0), DCIF_PANIC_THRES_REQ_EN);
+	regmap_clear_bits(dcif->regmap, DCIF_PANIC_THRES(1), DCIF_PANIC_THRES_REQ_EN);
+}
+
+static void dcif_enable_controller(struct dcif_dev *dcif)
+{
+	/* Enable Display */
+	regmap_set_bits(dcif->regmap, DCIF_DISP_CTRL, DCIF_DISP_CTRL_DISP_ON);
+
+	/* Enable layer 0 */
+	regmap_set_bits(dcif->regmap, DCIF_CTRLDESC0(0), DCIF_CTRLDESC0_EN);
+}
+
+static void dcif_disable_controller(struct dcif_dev *dcif)
+{
+	u32 reg;
+	int ret;
+
+	/* Disable layer 0 */
+	regmap_clear_bits(dcif->regmap, DCIF_CTRLDESC0(0), DCIF_CTRLDESC0_EN);
+
+	ret = regmap_read_poll_timeout(dcif->regmap, DCIF_CTRLDESC0(0), reg,
+				       !(reg & DCIF_CTRLDESC0_EN), 0,
+				       36000); /* Wait ~2 frame times max */
+	if (ret)
+		drm_err(&dcif->drm, "Failed to disable controller!\n");
+
+	/* Disable Display */
+	regmap_clear_bits(dcif->regmap, DCIF_DISP_CTRL, DCIF_DISP_CTRL_DISP_ON);
+}
+
+static void dcif_shadow_load_enable(struct dcif_dev *dcif)
+{
+	regmap_write_bits(dcif->regmap, DCIF_CTRLDESC0(0), DCIF_CTRLDESC0_SHADOW_LOAD_EN,
+			  DCIF_CTRLDESC0_SHADOW_LOAD_EN);
+}
+
+static void dcif_reset_block(struct dcif_dev *dcif)
+{
+	regmap_set_bits(dcif->regmap, DCIF_DISP_CTRL, DCIF_DISP_CTRL_SW_RST);
+
+	regmap_clear_bits(dcif->regmap, DCIF_DISP_CTRL, DCIF_DISP_CTRL_SW_RST);
+}
+
+static void dcif_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					   struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_destroy_state(state);
+	kfree(to_dcif_crtc_state(state));
+}
+
+static void dcif_crtc_reset(struct drm_crtc *crtc)
+{
+	struct dcif_crtc_state *state;
+
+	if (crtc->state)
+		dcif_crtc_atomic_destroy_state(crtc, crtc->state);
+
+	crtc->state = NULL;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
+}
+
+static struct drm_crtc_state *dcif_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct dcif_crtc_state *old = to_dcif_crtc_state(crtc->state);
+	struct dcif_crtc_state *new;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new->base);
+
+	new->bus_format = old->bus_format;
+	new->bus_flags = old->bus_flags;
+	new->crc.source = old->crc.source;
+	dcif_copy_roi(&old->crc.roi, &new->crc.roi);
+
+	return &new->base;
+}
+
+static void dcif_crtc_mode_set_nofb(struct drm_crtc_state *crtc_state,
+				    struct drm_plane_state *plane_state)
+{
+	struct dcif_crtc_state *dcif_crtc_state = to_dcif_crtc_state(crtc_state);
+	struct drm_device *drm = crtc_state->crtc->dev;
+	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc_state->crtc);
+	struct drm_display_mode *m = &crtc_state->adjusted_mode;
+
+	dev_dbg(drm->dev, "Pixel clock: %dkHz\n", m->crtc_clock);
+	dev_dbg(drm->dev, "Bridge bus_flags: 0x%08X\n", dcif_crtc_state->bus_flags);
+	dev_dbg(drm->dev, "Mode flags: 0x%08X\n", m->flags);
+
+	dcif_reset_block(dcif);
+
+	dcif_set_formats(dcif, plane_state, dcif_crtc_state->bus_format);
+
+	dcif_set_mode(dcif, dcif_crtc_state->bus_flags);
+}
+
+static void dcif_crtc_queue_state_event(struct drm_crtc *crtc)
+{
+	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc->state->event) {
+		WARN_ON(drm_crtc_vblank_get(crtc));
+		WARN_ON(dcif->event);
+		dcif->event = crtc->state->event;
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static struct drm_bridge *dcif_crtc_get_bridge(struct drm_crtc *crtc,
+					       struct drm_crtc_state *crtc_state)
+{
+	struct drm_connector_state *conn_state;
+	struct drm_encoder *encoder;
+	struct drm_connector *conn;
+	struct drm_bridge *bridge;
+	int i;
+
+	for_each_new_connector_in_state(crtc_state->state, conn, conn_state, i) {
+		if (crtc != conn_state->crtc)
+			continue;
+
+		encoder = conn_state->best_encoder;
+
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		if (bridge)
+			return bridge;
+	}
+
+	return NULL;
+}
+
+static void dcif_crtc_query_output_bus_format(struct drm_crtc *crtc,
+					      struct drm_crtc_state *crtc_state)
+{
+	struct dcif_crtc_state *dcif_state = to_dcif_crtc_state(crtc_state);
+	struct drm_bridge_state *bridge_state;
+	struct drm_bridge *bridge;
+
+	dcif_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	dcif_state->bus_flags = 0;
+
+	bridge = dcif_crtc_get_bridge(crtc, crtc_state);
+	if (!bridge)
+		return;
+
+	bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
+	if (!bridge_state)
+		return;
+
+	dcif_state->bus_format = bridge_state->input_bus_cfg.format;
+	dcif_state->bus_flags = bridge_state->input_bus_cfg.flags;
+}
+
+static int dcif_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	bool enable_primary = crtc_state->plane_mask & drm_plane_mask(crtc->primary);
+	int ret;
+
+	if (crtc_state->active && !enable_primary)
+		return -EINVAL;
+
+	dcif_crtc_query_output_bus_format(crtc, crtc_state);
+
+	if (crtc_state->active_changed && crtc_state->active) {
+		if (!crtc_state->mode_changed) {
+			crtc_state->mode_changed = true;
+			ret = drm_atomic_helper_check_modeset(crtc->dev, state);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void dcif_crtc_atomic_flush(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+	struct dcif_crtc_state *old_dcif_crtc_state = to_dcif_crtc_state(old_crtc_state);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct dcif_crtc_state *dcif_crtc_state = to_dcif_crtc_state(crtc_state);
+	bool need_modeset = drm_atomic_crtc_needs_modeset(crtc->state);
+	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
+
+	dcif_shadow_load_enable(dcif);
+
+	if (!crtc->state->active && !old_crtc_state->active)
+		return;
+
+	if (!need_modeset && to_disable_dcif_crc(dcif_crtc_state, old_dcif_crtc_state))
+		dcif_crtc_disable_crc_source(dcif, 0);
+
+	if (!need_modeset)
+		dcif_crtc_queue_state_event(crtc);
+
+	if (!need_modeset && to_enable_dcif_crc(dcif_crtc_state, old_dcif_crtc_state))
+		dcif_crtc_enable_crc_source(dcif, dcif_crtc_state->crc.source,
+					    &dcif_crtc_state->crc.roi, 0);
+}
+
+static void dcif_crtc_atomic_enable(struct drm_crtc *crtc,
+				    struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, crtc->primary);
+	struct dcif_crtc_state *dcif_crtc_state = to_dcif_crtc_state(crtc_state);
+	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
+	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
+	struct drm_device *drm = crtc->dev;
+	dma_addr_t baseaddr;
+
+	dev_dbg(drm->dev, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
+
+	/* enable power when we start to set mode for CRTC */
+	pm_runtime_get_sync(drm->dev);
+
+	drm_crtc_vblank_on(crtc);
+
+	dcif_crtc_mode_set_nofb(crtc_state, plane_state);
+
+	baseaddr = drm_fb_dma_get_gem_addr(plane_state->fb, plane_state, 0);
+	if (baseaddr)
+		regmap_write(dcif->regmap, DCIF_CTRLDESC4(0), baseaddr);
+
+	dcif_enable_plane_panic(dcif);
+	dcif_enable_controller(dcif);
+
+	dcif_crtc_queue_state_event(crtc);
+
+	if (dcif->has_crc && dcif_crtc_state->crc.source != DCIF_CRC_SRC_NONE)
+		dcif_crtc_enable_crc_source(dcif, dcif_crtc_state->crc.source,
+					    &dcif_crtc_state->crc.roi, 0);
+}
+
+static void dcif_crtc_atomic_disable(struct drm_crtc *crtc,
+				     struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct dcif_crtc_state *dcif_crtc_state = to_dcif_crtc_state(crtc_state);
+	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
+	struct drm_device *drm = crtc->dev;
+
+	if (dcif->has_crc && dcif_crtc_state->crc.source != DCIF_CRC_SRC_NONE)
+		dcif_crtc_disable_crc_source(dcif, 0);
+
+	dcif_disable_controller(dcif);
+	dcif_disable_plane_panic(dcif);
+
+	drm_crtc_vblank_off(crtc);
+
+	pm_runtime_put_sync(drm->dev);
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc->state->event && !crtc->state->active) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static const struct drm_crtc_helper_funcs dcif_crtc_helper_funcs = {
+	.mode_valid	= dcif_crtc_mode_valid,
+	.atomic_check	= dcif_crtc_atomic_check,
+	.atomic_flush	= dcif_crtc_atomic_flush,
+	.atomic_enable	= dcif_crtc_atomic_enable,
+	.atomic_disable	= dcif_crtc_atomic_disable,
+};
+
+static int dcif_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
+	int domain = dcif->cpu_domain;
+
+	/* Clear and enable VS_BLANK IRQ */
+	regmap_set_bits(dcif->regmap, DCIF_IS0(domain), DCIF_INT0_VS_BLANK);
+	regmap_set_bits(dcif->regmap, DCIF_IE0(domain), DCIF_INT0_VS_BLANK);
+
+	return 0;
+}
+
+static void dcif_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct dcif_dev *dcif = crtc_to_dcif_dev(crtc);
+	int domain = dcif->cpu_domain;
+
+	/* Disable and clear VS_BLANK IRQ */
+	regmap_clear_bits(dcif->regmap, DCIF_IE0(domain), DCIF_INT0_VS_BLANK);
+	regmap_clear_bits(dcif->regmap, DCIF_IS0(domain), DCIF_INT0_VS_BLANK);
+}
+
+static const struct drm_crtc_funcs dcif_crtc_funcs = {
+	.reset			= dcif_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= dcif_crtc_atomic_duplicate_state,
+	.atomic_destroy_state	= dcif_crtc_atomic_destroy_state,
+	.enable_vblank		= dcif_crtc_enable_vblank,
+	.disable_vblank		= dcif_crtc_disable_vblank,
+	.set_crc_source		= dcif_crtc_set_crc_source,
+	.verify_crc_source	= dcif_crtc_verify_crc_source,
+};
+
+irqreturn_t dcif_irq_handler(int irq, void *data)
+{
+	struct drm_device *drm = data;
+	struct dcif_dev *dcif = to_dcif_dev(drm);
+	int domain = dcif->cpu_domain;
+	unsigned long flags;
+	u32 stat0, stat1, crc;
+
+	regmap_read(dcif->regmap, DCIF_IS0(domain), &stat0);
+	regmap_read(dcif->regmap, DCIF_IS1(domain), &stat1);
+
+	if (stat0 & DCIF_INT0_VS_BLANK) {
+		drm_crtc_handle_vblank(&dcif->crtc);
+
+		spin_lock_irqsave(&drm->event_lock, flags);
+		if (dcif->event) {
+			drm_crtc_send_vblank_event(&dcif->crtc, dcif->event);
+			dcif->event = NULL;
+			drm_crtc_vblank_put(&dcif->crtc);
+		}
+		if (dcif->crc_is_enabled) {
+			regmap_read(dcif->regmap, DCIF_CRC_VAL_R(0), &crc);
+			drm_crtc_add_crc_entry(&dcif->crtc, false, 0, &crc);
+			dev_dbg(drm->dev, "crc=0x%x\n",  crc);
+		}
+		spin_unlock_irqrestore(&drm->event_lock, flags);
+	}
+
+	if (stat1 & (DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1)) {
+		u32 panic = stat1 & (DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1);
+
+		dev_dbg_ratelimited(drm->dev, "FIFO panic on %s\n",
+				    panic == (DCIF_INT1_FIFO_PANIC0 | DCIF_INT1_FIFO_PANIC1) ?
+				    "layers 0 & 1" : panic == DCIF_INT1_FIFO_PANIC0 ? "layer 0" :
+				    "layer 1");
+	}
+
+	/* W1C */
+	regmap_write(dcif->regmap, DCIF_IS0(domain), stat0);
+	regmap_write(dcif->regmap, DCIF_IS1(domain), stat1);
+
+	return IRQ_HANDLED;
+}
+
+int dcif_crtc_init(struct dcif_dev *dcif)
+{
+	int ret;
+
+	ret = dcif_plane_init(dcif);
+	if (ret)
+		return ret;
+
+	drm_crtc_helper_add(&dcif->crtc, &dcif_crtc_helper_funcs);
+	ret = drm_crtc_init_with_planes(&dcif->drm, &dcif->crtc, &dcif->planes.primary, NULL,
+					&dcif_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(&dcif->drm, "failed to initialize CRTC: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dcif/dcif-drv.c b/drivers/gpu/drm/imx/dcif/dcif-drv.c
new file mode 100644
index 0000000000000..95fa5bf227ff5
--- /dev/null
+++ b/drivers/gpu/drm/imx/dcif/dcif-drv.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/of_platform.h>
+#include <linux/regmap.h>
+
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_dma.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "dcif-drv.h"
+#include "dcif-reg.h"
+
+#define QOS_SETTING			0x1c
+#define  DISPLAY_PANIC_QOS_MASK		0x70
+#define  DISPLAY_PANIC_QOS(n)		(((n) & 0x7) << 4)
+#define  DISPLAY_ARQOS_MASK		0x7
+#define  DISPLAY_ARQOS(n)		((n) & 0x7)
+
+#define DCIF_CPU_DOMAIN			2
+
+#define DRIVER_NAME			"imx-dcif-drm"
+
+DEFINE_DRM_GEM_DMA_FOPS(dcif_driver_fops);
+
+static struct drm_driver dcif_driver = {
+	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	DRM_GEM_DMA_DRIVER_OPS,
+	DRM_FBDEV_DMA_DRIVER_OPS,
+	.fops			= &dcif_driver_fops,
+	.name			= "imx-dcif",
+	.desc			= "i.MX DCIF DRM graphics",
+	.major			= 1,
+	.minor			= 0,
+	.patchlevel		= 0,
+};
+
+static int dcif_set_qos(struct dcif_dev *dcif)
+{
+	struct drm_device *drm = &dcif->drm;
+	int ret;
+
+	ret = regmap_update_bits(dcif->blkctrl_regmap, QOS_SETTING,
+				 DISPLAY_PANIC_QOS_MASK | DISPLAY_ARQOS_MASK,
+				 DISPLAY_PANIC_QOS(0x3) | DISPLAY_ARQOS(0x3));
+	if (ret < 0)
+		dev_err(drm->dev, "failed to set QoS: %d\n", ret);
+
+	return ret;
+}
+
+static void dcif_read_chip_info(struct dcif_dev *dcif)
+{
+	struct drm_device *drm = &dcif->drm;
+	u32 val, vmin, vmaj;
+
+	pm_runtime_get_sync(drm->dev);
+
+	regmap_read(dcif->regmap, DCIF_VER, &val);
+
+	dcif->has_crc = val & 0x2;
+
+	vmin = DCIF_VER_GET_MINOR(val);
+	vmaj = DCIF_VER_GET_MAJOR(val);
+	DRM_DEV_DEBUG(drm->dev, "DCIF version is %d.%d\n", vmaj, vmin);
+
+	pm_runtime_put_sync(drm->dev);
+}
+
+static const struct regmap_config dcif_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.fast_io = true,
+	.max_register = 0x20250,
+	.cache_type = REGCACHE_NONE,
+	.disable_locking = true,
+};
+
+static const char * const dcif_clks[] = {
+	"apb",
+	"axi",
+	"pix",
+};
+
+static int dcif_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct dcif_dev *dcif;
+	struct drm_device *drm;
+	int ret;
+	int i;
+
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	dcif = devm_drm_dev_alloc(&pdev->dev, &dcif_driver, struct dcif_dev, drm);
+	if (IS_ERR(dcif))
+		return PTR_ERR(dcif);
+
+	/* CPU 0 domain for interrupt control */
+	dcif->cpu_domain = DCIF_CPU_DOMAIN;
+
+	drm = &dcif->drm;
+	dev_set_drvdata(&pdev->dev, dcif);
+
+	dcif->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dcif->reg_base))
+		return dev_err_probe(drm->dev, PTR_ERR(dcif->reg_base),
+				     "failed to get reg base\n");
+
+	dcif->irq[0] = platform_get_irq(pdev, 0);
+	if (dcif->irq[0] < 0)
+		return dev_err_probe(drm->dev, dcif->irq[0],
+				     "failed to get domain0 irq\n");
+
+	dcif->irq[1] = platform_get_irq(pdev, 1);
+	if (dcif->irq[1] < 0)
+		return dev_err_probe(drm->dev, dcif->irq[1],
+				     "failed to get domain1 irq\n");
+
+	dcif->irq[2] = platform_get_irq(pdev, 2);
+	if (dcif->irq[2] < 0)
+		return dev_err_probe(drm->dev, dcif->irq[2],
+				     "failed to get domain2 irq\n");
+
+	dcif->blkctrl_regmap = syscon_regmap_lookup_by_phandle(np, "nxp,blk-ctrl");
+	if (IS_ERR(dcif->blkctrl_regmap))
+		return dev_err_probe(drm->dev, PTR_ERR(dcif->blkctrl_regmap),
+				     "failed to get blk-ctrl regmap\n");
+
+	dcif->regmap = devm_regmap_init_mmio(drm->dev, dcif->reg_base, &dcif_regmap_config);
+	if (IS_ERR(dcif->regmap))
+		return dev_err_probe(drm->dev, PTR_ERR(dcif->regmap),
+				     "failed to init DCIF regmap\n");
+
+	dcif->num_clks = ARRAY_SIZE(dcif_clks);
+	dcif->clks = devm_kcalloc(drm->dev, dcif->num_clks, sizeof(*dcif->clks), GFP_KERNEL);
+	if (!dcif->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < dcif->num_clks; i++)
+		dcif->clks[i].id = dcif_clks[i];
+
+	ret = devm_clk_bulk_get(drm->dev, dcif->num_clks, dcif->clks);
+	if (ret)
+		return dev_err_probe(drm->dev, ret, "cannot get required clocks\n");
+
+	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(drm->dev, ret, "failed to set dma mask and coherent\n");
+
+	pm_runtime_enable(drm->dev);
+
+	ret = devm_request_irq(drm->dev, dcif->irq[dcif->cpu_domain],
+			       dcif_irq_handler, 0, drm->driver->name, drm);
+	if (ret < 0) {
+		dev_err(drm->dev, "failed to install IRQ handler: %d\n", ret);
+		goto err_irq_install;
+	}
+
+	dcif_read_chip_info(dcif);
+
+	ret = dcif_kms_prepare(dcif);
+	if (ret)
+		goto err_irq_install;
+
+	ret = drm_dev_register(drm, 0);
+	if (ret) {
+		dev_err(drm->dev, "failed to register drm device: %d\n", ret);
+		goto err_register;
+	}
+
+	drm_client_setup(drm, NULL);
+
+	return 0;
+
+err_register:
+	drm_kms_helper_poll_fini(drm);
+err_irq_install:
+	pm_runtime_disable(drm->dev);
+	return ret;
+}
+
+static void dcif_remove(struct platform_device *pdev)
+{
+	struct dcif_dev *dcif = dev_get_drvdata(&pdev->dev);
+	struct drm_device *drm = &dcif->drm;
+
+	drm_dev_unregister(drm);
+
+	drm_kms_helper_poll_fini(drm);
+
+	drm_atomic_helper_shutdown(drm);
+
+	pm_runtime_disable(drm->dev);
+}
+
+static int dcif_runtime_suspend(struct device *dev)
+{
+	struct dcif_dev *dcif = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(dcif->num_clks, dcif->clks);
+
+	return 0;
+}
+
+static int dcif_runtime_resume(struct device *dev)
+{
+	struct dcif_dev *dcif = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(dcif->num_clks, dcif->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	ret = dcif_set_qos(dcif);
+	if (ret) {
+		clk_bulk_disable_unprepare(dcif->num_clks, dcif->clks);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dcif_suspend(struct device *dev)
+{
+	struct dcif_dev *dcif = dev_get_drvdata(dev);
+	int ret;
+
+	ret = drm_mode_config_helper_suspend(&dcif->drm);
+	if (ret < 0)
+		return ret;
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+	
+	return dcif_runtime_suspend(dev);
+}
+
+static int dcif_resume(struct device *dev)
+{
+	struct dcif_dev *dcif = dev_get_drvdata(dev);
+	int ret;
+
+	if (!pm_runtime_suspended(dev)) {
+		ret = dcif_runtime_resume(dev);
+		if (ret < 0)
+			return ret;
+	}
+
+	return drm_mode_config_helper_resume(&dcif->drm);
+}
+
+static const struct dev_pm_ops dcif_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dcif_suspend, dcif_resume)
+	SET_RUNTIME_PM_OPS(dcif_runtime_suspend, dcif_runtime_resume, NULL)
+};
+
+static const struct of_device_id dcif_dt_ids[] = {
+	{ .compatible = "nxp,imx94-dcif", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dcif_dt_ids);
+
+static struct platform_driver dcif_platform_driver = {
+	.probe	= dcif_probe,
+	.remove	= dcif_remove,
+	.driver	= {
+		.name		= DRIVER_NAME,
+		.of_match_table	= dcif_dt_ids,
+		.pm		= pm_ptr(&dcif_pm_ops),
+	},
+};
+module_platform_driver(dcif_platform_driver);
+
+MODULE_AUTHOR("NXP Semiconductor");
+MODULE_DESCRIPTION("i.MX94 DCIF DRM driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/imx/dcif/dcif-drv.h b/drivers/gpu/drm/imx/dcif/dcif-drv.h
new file mode 100644
index 0000000000000..f4073c90b40d4
--- /dev/null
+++ b/drivers/gpu/drm/imx/dcif/dcif-drv.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DCIF_DRV_H__
+#define __DCIF_DRV_H__
+
+#include <linux/clk.h>
+#include <linux/irqreturn.h>
+#include <linux/kernel.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_vblank.h>
+
+struct dcif_crc;
+
+struct dcif_dev {
+	struct drm_device drm;
+	void __iomem *reg_base;
+
+	struct regmap *regmap;
+	struct regmap *blkctrl_regmap;
+	int irq[3];
+
+	unsigned int num_clks;
+	struct clk_bulk_data *clks;
+
+	struct drm_crtc crtc;
+	struct {
+		struct drm_plane primary;
+		struct drm_plane overlay;
+	} planes;
+	struct drm_encoder encoder;
+
+	struct drm_pending_vblank_event *event;
+	/* Implement crc */
+	bool has_crc;
+	bool crc_is_enabled;
+
+	/* CPU domain for interrupt control */
+	int cpu_domain;
+};
+
+enum dcif_crc_source {
+	DCIF_CRC_SRC_NONE,
+	DCIF_CRC_SRC_FRAME,
+	DCIF_CRC_SRC_FRAME_ROI,
+};
+
+struct dcif_crc {
+	enum dcif_crc_source	source;
+	struct drm_rect		roi;
+};
+
+struct dcif_crtc_state {
+	struct drm_crtc_state	base;
+	struct dcif_crc		crc;
+	u32			bus_format;
+	u32			bus_flags;
+};
+
+static inline struct dcif_dev *to_dcif_dev(struct drm_device *drm_dev)
+{
+	return container_of(drm_dev, struct dcif_dev, drm);
+}
+
+static inline struct dcif_dev *crtc_to_dcif_dev(struct drm_crtc *crtc)
+{
+	return to_dcif_dev(crtc->dev);
+}
+
+static inline struct dcif_crtc_state *to_dcif_crtc_state(struct drm_crtc_state *s)
+{
+	return container_of(s, struct dcif_crtc_state, base);
+}
+
+irqreturn_t dcif_irq_handler(int irq, void *data);
+int dcif_crtc_init(struct dcif_dev *dcif);
+int dcif_plane_init(struct dcif_dev *dcif);
+int dcif_kms_prepare(struct dcif_dev *dcif);
+
+#endif
diff --git a/drivers/gpu/drm/imx/dcif/dcif-kms.c b/drivers/gpu/drm/imx/dcif/dcif-kms.c
new file mode 100644
index 0000000000000..80ba95d2e5d3e
--- /dev/null
+++ b/drivers/gpu/drm/imx/dcif/dcif-kms.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "dcif-drv.h"
+#include "dcif-reg.h"
+
+static int dcif_kms_init(struct dcif_dev *dcif)
+{
+	struct drm_device *drm = &dcif->drm;
+	struct device_node *np = drm->dev->of_node;
+	struct drm_connector *connector;
+	struct drm_bridge *bridge;
+	int ret;
+
+	ret = dcif_crtc_init(dcif);
+	if (ret)
+		return ret;
+
+	bridge = devm_drm_of_get_bridge(drm->dev, np, 0, 0);
+	if (IS_ERR(bridge))
+		return dev_err_probe(drm->dev, PTR_ERR(bridge), "Failed to find bridge\n");
+
+	dcif->encoder.possible_crtcs = drm_crtc_mask(&dcif->crtc);
+	ret = drm_simple_encoder_init(drm, &dcif->encoder, DRM_MODE_ENCODER_NONE);
+	if (ret) {
+		drm_err(drm, "failed to initialize encoder: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_bridge_attach(&dcif->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		drm_err(drm, "failed to attach bridge to encoder: %d\n", ret);
+		return ret;
+	}
+
+	connector = drm_bridge_connector_init(drm, &dcif->encoder);
+	if (IS_ERR(connector)) {
+		drm_err(drm, "failed to initialize bridge connector: %d\n", ret);
+		return PTR_ERR(connector);
+	}
+
+	ret = drm_connector_attach_encoder(connector, &dcif->encoder);
+	if (ret)
+		drm_err(drm, "failed to attach encoder to connector: %d\n", ret);
+
+	return ret;
+}
+
+static const struct drm_mode_config_funcs dcif_mode_config_funcs = {
+	.fb_create     = drm_gem_fb_create,
+	.atomic_check  = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static const struct drm_mode_config_helper_funcs dcif_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
+int dcif_kms_prepare(struct dcif_dev *dcif)
+{
+	struct drm_device *drm = &dcif->drm;
+	int ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	ret = dcif_kms_init(dcif);
+	if (ret)
+		return ret;
+
+	drm->mode_config.min_width	= 1;
+	drm->mode_config.min_height	= 1;
+	drm->mode_config.max_width	= 1920;
+	drm->mode_config.max_height	= 1920;
+	drm->mode_config.funcs		= &dcif_mode_config_funcs;
+	drm->mode_config.helper_private	= &dcif_mode_config_helpers;
+
+	ret = drm_vblank_init(drm, 1);
+	if (ret < 0) {
+		drm_err(drm, "failed to initialize vblank: %d\n", ret);
+		return ret;
+	}
+
+	drm_mode_config_reset(drm);
+
+	drm_kms_helper_poll_init(drm);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dcif/dcif-plane.c b/drivers/gpu/drm/imx/dcif/dcif-plane.c
new file mode 100644
index 0000000000000..54ab8edd11e0c
--- /dev/null
+++ b/drivers/gpu/drm/imx/dcif/dcif-plane.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_fb_dma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_rect.h>
+
+#include "dcif-drv.h"
+#include "dcif-reg.h"
+
+static const u32 dcif_primary_plane_formats[] = {
+	/* RGB */
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_XRGB8888,
+
+	/* Packed YCbCr */
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY,
+};
+
+static const u32 dcif_overlay_plane_formats[] = {
+	/* RGB */
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_XRGB8888,
+};
+
+static inline struct dcif_dev *plane_to_dcif_dev(struct drm_plane *plane)
+{
+	return to_dcif_dev(plane->dev);
+}
+
+static inline dma_addr_t drm_plane_state_to_baseaddr(struct drm_plane_state *state)
+{
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_gem_dma_object *dma_obj;
+	unsigned int x = state->src.x1 >> 16;
+	unsigned int y = state->src.y1 >> 16;
+
+	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
+
+	return dma_obj->dma_addr + fb->offsets[0] + fb->pitches[0] * y + fb->format->cpp[0] * x;
+}
+
+static int dcif_plane_get_layer_id(struct drm_plane *plane)
+{
+	return (plane->type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
+}
+
+static int dcif_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	struct drm_framebuffer *old_fb = old_plane_state->fb;
+	struct drm_crtc_state *crtc_state;
+
+	if (!fb)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, &dcif->crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	/*
+	 * Force CRTC mode change if framebuffer stride or pixel format have changed.
+	 */
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY && old_fb &&
+	    (fb->pitches[0] != old_fb->pitches[0] || fb->format->format != old_fb->format->format))
+		crtc_state->mode_changed = true;
+
+	return drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING, DRM_PLANE_NO_SCALING, true,
+						   true);
+}
+
+static void dcif_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
+	int layer_id = dcif_plane_get_layer_id(plane);
+	struct drm_framebuffer *fb = new_state->fb;
+	u32 crtc_x, crtc_y, crtc_h, crtc_w;
+	u32 layer_fmt = 0, yuv_fmt = 0;
+	dma_addr_t baseaddr;
+	u32 reg;
+
+	if (!fb)
+		return;
+
+	crtc_x = new_state->crtc_x;
+	crtc_y = new_state->crtc_y;
+	crtc_h = new_state->crtc_h;
+	crtc_w = new_state->crtc_w;
+
+	/* visible portion of plane on crtc */
+	regmap_write(dcif->regmap, DCIF_CTRLDESC1(layer_id),
+		     DCIF_CTRLDESC1_POSX(crtc_x) | DCIF_CTRLDESC1_POSY(crtc_y));
+	regmap_write(dcif->regmap, DCIF_CTRLDESC2(layer_id),
+		     DCIF_CTRLDESC2_WIDTH(crtc_w) | DCIF_CTRLDESC2_HEIGHT(crtc_h));
+
+	/* pitch size */
+	reg = DCIF_CTRLDESC3_P_SIZE(2) | DCIF_CTRLDESC3_T_SIZE(2) |
+	      DCIF_CTRLDESC3_PITCH(fb->pitches[0]);
+	regmap_write(dcif->regmap, DCIF_CTRLDESC3(layer_id), reg);
+
+	/*  address */
+	baseaddr = drm_fb_dma_get_gem_addr(new_state->fb, new_state, 0);
+
+	drm_dbg_kms(plane->dev, "[PLANE:%d:%s] fb address %pad, pitch 0x%08x\n",
+		    plane->base.id, plane->name, &baseaddr, fb->pitches[0]);
+
+	regmap_write(dcif->regmap, DCIF_CTRLDESC4(layer_id), baseaddr);
+
+	/* Format */
+	switch (fb->format->format) {
+	/* RGB Formats */
+	case DRM_FORMAT_RGB565:
+		layer_fmt = CTRLDESCL0_FORMAT_RGB565;
+		break;
+	case DRM_FORMAT_RGB888:
+		layer_fmt = CTRLDESCL0_FORMAT_RGB888;
+		break;
+	case DRM_FORMAT_XRGB1555:
+		layer_fmt = CTRLDESCL0_FORMAT_ARGB1555;
+		break;
+	case DRM_FORMAT_XRGB4444:
+		layer_fmt = CTRLDESCL0_FORMAT_ARGB4444;
+		break;
+	case DRM_FORMAT_XBGR8888:
+		layer_fmt = CTRLDESCL0_FORMAT_ABGR8888;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		layer_fmt = CTRLDESCL0_FORMAT_ARGB8888;
+		break;
+
+	/* YUV Formats */
+	case DRM_FORMAT_YUYV:
+		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
+		yuv_fmt = CTRLDESCL0_YUV_FORMAT_VY2UY1;
+		break;
+	case DRM_FORMAT_YVYU:
+		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
+		yuv_fmt = CTRLDESCL0_YUV_FORMAT_UY2VY1;
+		break;
+	case DRM_FORMAT_UYVY:
+		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
+		yuv_fmt = CTRLDESCL0_YUV_FORMAT_Y2VY1U;
+		break;
+	case DRM_FORMAT_VYUY:
+		layer_fmt = CTRLDESCL0_FORMAT_YCBCR422;
+		yuv_fmt = CTRLDESCL0_YUV_FORMAT_Y2UY1V;
+		break;
+
+	default:
+		dev_err(dcif->drm.dev, "Unknown pixel format 0x%x\n", fb->format->format);
+		break;
+	}
+
+	if (plane->type == DRM_PLANE_TYPE_OVERLAY && yuv_fmt == CTRLDESCL0_YUV_FORMAT_Y2UY1V) {
+		dev_err(dcif->drm.dev, "Overlay plane could not support YUV format\n");
+		return;
+	}
+
+	reg = DCIF_CTRLDESC0_EN | DCIF_CTRLDESC0_SHADOW_LOAD_EN |
+	      DCIF_CTRLDESC0_FORMAT(layer_fmt) | DCIF_CTRLDESC0_YUV_FORMAT(yuv_fmt);
+
+	/* Alpha */
+	reg |= DCIF_CTRLDESC0_GLOBAL_ALPHA(new_state->alpha >> 8) | ALPHA_GLOBAL;
+
+	regmap_write(dcif->regmap, DCIF_CTRLDESC0(layer_id), reg);
+}
+
+static void dcif_overlay_plane_atomic_disable(struct drm_plane *plane,
+					      struct drm_atomic_state *state)
+{
+	struct dcif_dev *dcif = plane_to_dcif_dev(plane);
+
+	regmap_update_bits(dcif->regmap, DCIF_CTRLDESC0(1),
+			   DCIF_CTRLDESC0_EN | DCIF_CTRLDESC0_SHADOW_LOAD_EN,
+			   DCIF_CTRLDESC0_SHADOW_LOAD_EN);
+}
+
+static const struct drm_plane_helper_funcs dcif_primary_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= dcif_plane_atomic_check,
+	.atomic_update	= dcif_plane_atomic_update,
+};
+
+static const struct drm_plane_helper_funcs dcif_overlay_plane_helper_funcs = {
+	.atomic_check	= dcif_plane_atomic_check,
+	.atomic_update	= dcif_plane_atomic_update,
+	.atomic_disable = dcif_overlay_plane_atomic_disable,
+};
+
+static const struct drm_plane_funcs dcif_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+int dcif_plane_init(struct dcif_dev *dcif)
+{
+	const u32 supported_encodings = BIT(DRM_COLOR_YCBCR_BT601) |
+					BIT(DRM_COLOR_YCBCR_BT709) |
+					BIT(DRM_COLOR_YCBCR_BT2020);
+	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+				     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
+	int ret;
+
+	/* primary plane */
+	drm_plane_helper_add(&dcif->planes.primary, &dcif_primary_plane_helper_funcs);
+	ret = drm_universal_plane_init(&dcif->drm, &dcif->planes.primary, 1, &dcif_plane_funcs,
+				       dcif_primary_plane_formats,
+				       ARRAY_SIZE(dcif_primary_plane_formats), NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(&dcif->drm, "failed to initialize primary plane: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_plane_create_color_properties(&dcif->planes.primary, supported_encodings,
+						supported_ranges, DRM_COLOR_YCBCR_BT601,
+						DRM_COLOR_YCBCR_LIMITED_RANGE);
+	if (ret)
+		return ret;
+
+	ret = drm_plane_create_alpha_property(&dcif->planes.primary);
+	if (ret)
+		return ret;
+
+	/* overlay plane */
+	drm_plane_helper_add(&dcif->planes.overlay, &dcif_overlay_plane_helper_funcs);
+	ret = drm_universal_plane_init(&dcif->drm, &dcif->planes.overlay, 1, &dcif_plane_funcs,
+				       dcif_overlay_plane_formats,
+				       ARRAY_SIZE(dcif_overlay_plane_formats), NULL,
+				       DRM_PLANE_TYPE_OVERLAY, NULL);
+	if (ret) {
+		drm_err(&dcif->drm, "failed to initialize overlay plane: %d\n", ret);
+		return ret;
+	}
+
+	return drm_plane_create_alpha_property(&dcif->planes.overlay);
+}
diff --git a/drivers/gpu/drm/imx/dcif/dcif-reg.h b/drivers/gpu/drm/imx/dcif/dcif-reg.h
new file mode 100644
index 0000000000000..224f1d18f8c81
--- /dev/null
+++ b/drivers/gpu/drm/imx/dcif/dcif-reg.h
@@ -0,0 +1,326 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright 2025 NXP
+ */
+#ifndef __DCIF_REG_H__
+#define __DCIF_REG_H__
+
+#include <linux/bits.h>
+
+/* Version ID Register */
+#define DCIF_VER				0x0
+
+/* Parameter Registers */
+#define DCIF_PAR_0				0x4
+#define DCIF_PAR_1				0x8
+
+/* Display Control and Parameter Registers */
+#define DCIF_DISP_CTRL				0x10
+#define DCIF_DISP_PAR				0x14
+#define DCIF_DISP_SIZE				0x18
+
+/* Display Status Registers */
+#define DCIF_DISP_SR0				0x1C
+#define DCIF_DISP_SR1				0x20
+
+/* Interrupt Enable and Status Registers, n=0-2*/
+#define DCIF_IE0(n)				(0x24 + (n) * 0x10000)
+#define DCIF_IS0(n)				(0x28 + (n) * 0x10000)
+#define DCIF_IE1(n)				(0x2C + (n) * 0x10000)
+#define DCIF_IS1(n)				(0x30 + (n) * 0x10000)
+
+/* DPI Control and Sync Parameter Registers */
+#define DCIF_DPI_CTRL				0x40
+#define DCIF_DPI_HSYN_PAR			0x44
+#define DCIF_DPI_VSYN_PAR			0x48
+#define DCIF_DPI_VSYN_HSYN_WIDTH		0x4C
+
+/* Control Descriptor Registers, n=0-1*/
+#define DCIF_CTRLDESC0(n)			(0x10000 + (n) * 0x10000)
+#define DCIF_CTRLDESC1(n)			(0x10004 + (n) * 0x10000)
+#define DCIF_CTRLDESC2(n)			(0x10008 + (n) * 0x10000)
+#define DCIF_CTRLDESC3(n)			(0x1000C + (n) * 0x10000)
+#define DCIF_CTRLDESC4(n)			(0x10010 + (n) * 0x10000)
+#define DCIF_CTRLDESC5(n)			(0x10014 + (n) * 0x10000)
+#define DCIF_CTRLDESC6(n)			(0x10018 + (n) * 0x10000)
+
+/* CLUT control Register */
+#define DCIF_CLUT_CTRL				0x1003C
+
+/* FIFO Panic Threshold Register, n=0-1 */
+#define DCIF_PANIC_THRES(n)			(0x10040 + (n) * 0x10000)
+
+/* Layer Status Register 0, n=0-1 */
+#define DCIF_LAYER_SR0(n)			(0x10044 + (n) * 0x10000)
+
+/* Color Space Conversion Control and Coefficient Registers for Layer 0 */
+#define DCIF_CSC_CTRL_L0			0x10050
+#define DCIF_CSC_COEF0_L0			0x10054
+#define DCIF_CSC_COEF1_L0			0x10058
+#define DCIF_CSC_COEF2_L0			0x1005C
+#define DCIF_CSC_COEF3_L0			0x10060
+#define DCIF_CSC_COEF4_L0			0x10064
+#define DCIF_CSC_COEF5_L0			0x10068
+
+/* CRC Control, Threshold, and Histogram Coefficient Registers */
+#define DCIF_CRC_CTRL				0x20100
+#define DCIF_CRC_THRES				0x20104
+#define DCIF_CRC_HIST_COEF			0x20108
+#define DCIF_CRC_ERR_CNT			0x2010C
+#define DCIF_CRC_SR				0x20110
+#define DCIF_CRC_HIST_CNT_B(n)			(0x20114 + (n) * 4)
+
+/* CRC Region Position, Size, Value, and Expected Value Registers, n=0-3 */
+#define DCIF_CRC_POS_R(n)			(0x20214 + (n) * 0x10)
+#define DCIF_CRC_SIZE_R(n)			(0x20218 + (n) * 0x10)
+#define DCIF_CRC_VAL_R(n)			(0x2021C + (n) * 0x10)
+#define DCIF_CRC_EXP_VAL_R(n)			(0x20220 + (n) * 0x10)
+
+/* VER - Version ID Register */
+#define DCIF_VER_GET_FEATURE(x)			FIELD_GET(GENMASK(15, 0), x)
+#define DCIF_VER_GET_MINOR(x)			FIELD_GET(GENMASK(23, 16), x)
+#define DCIF_VER_GET_MAJOR(x)			FIELD_GET(GENMASK(31, 24), x)
+
+/* PAR_0 - Parameter Register 0 */
+#define DCIF_PAR_0_LAYER_NUM(x)			FIELD_PREP(GENMASK(3, 0), x)
+#define DCIF_PAR_0_DOMAIN_NUM(x)		FIELD_PREP(GENMASK(5, 4), x)
+#define DCIF_PAR_0_AXI_DATA_WIDTH(x)		FIELD_PREP(GENMASK(7, 6), x)
+#define DCIF_PAR_0_CLUT_RAM_NUM(x)		FIELD_PREP(GENMASK(11, 8), x)
+#define DCIF_PAR_0_CSC_NUM(x)			FIELD_PREP(GENMASK(13, 12), x)
+#define DCIF_PAR_0_CRC_REGION_NUM(x)		FIELD_PREP(GENMASK(18, 16), x)
+#define DCIF_PAR_0_BACKUP(x)			FIELD_PREP(GENMASK(31, 28), x)
+
+/* PAR_1 - Parameter Register 1 */
+#define DCIF_PAR_1_LAYER0_FIFO_SIZE(x)		FIELD_PREP(GENMASK(3, 0), x)
+#define DCIF_PAR_1_LAYER1_FIFO_SIZE(x)		FIELD_PREP(GENMASK(7, 4), x)
+
+/* DISP_CTRL - Display Control Register */
+#define DCIF_DISP_CTRL_DISP_ON			BIT(0)
+#define DCIF_DISP_CTRL_AXI_RD_HOLD		BIT(30)
+#define DCIF_DISP_CTRL_SW_RST			BIT(31)
+
+/* DISP_PAR - Display Parameter Register */
+#define DCIF_DISP_PAR_BGND_B(x)			FIELD_PREP(GENMASK(7, 0), x)
+#define DCIF_DISP_PAR_BGND_G(x)			FIELD_PREP(GENMASK(15, 8), x)
+#define DCIF_DISP_PAR_BGND_R(x)			FIELD_PREP(GENMASK(23, 16), x)
+
+/* DISP_SIZE - Display Size Register */
+#define DCIF_DISP_SIZE_DISP_WIDTH(x)		FIELD_PREP(GENMASK(11, 0), x)
+#define DCIF_DISP_SIZE_DISP_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
+
+/* DISP_SR0 - Display Status Register 0 */
+#define DCIF_DISP_SR0_AXI_RD_PEND(x)		FIELD_PREP(GENMASK(4, 0), x)
+#define DCIF_DISP_SR0_DPI_BUSY(x)		FIELD_PREP(GENMASK(14, 14), x)
+#define DCIF_DISP_SR0_AXI_RD_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
+#define DCIF_DISP_SR0_TXFIFO_CNT(x)		FIELD_PREP(GENMASK(23, 16), x)
+
+/* DISP_SR1 - Display Status Register 1 */
+#define DCIF_DISP_SR1_H_CNT(x)			FIELD_PREP(GENMASK(11, 0), x)
+#define DCIF_DISP_SR1_V_CNT(x)			FIELD_PREP(GENMASK(27, 16), x)
+
+/* INT0 - Interrupt Enable/Status  Register 0 for Domain 0/1/2 */
+#define DCIF_INT0_VSYNC				BIT(0)
+#define DCIF_INT0_UNDERRUN			BIT(1)
+#define DCIF_INT0_VS_BLANK			BIT(2)
+#define DCIF_INT0_HIST_DONE			BIT(5)
+#define DCIF_INT0_CRC_ERR			BIT(6)
+#define DCIF_INT0_CRC_ERR_SAT			BIT(7)
+
+/* INT1 - Interrupt Enable/Status Register 1 for Domain 0/1/2 */
+#define DCIF_INT1_FIFO_PANIC0			BIT(0)
+#define DCIF_INT1_FIFO_PANIC1			BIT(1)
+#define DCIF_INT1_DMA_ERR0			BIT(8)
+#define DCIF_INT1_DMA_ERR1			BIT(9)
+#define DCIF_INT1_DMA_DONE0			BIT(16)
+#define DCIF_INT1_DMA_DONE1			BIT(17)
+#define DCIF_INT1_FIFO_EMPTY0			BIT(24)
+#define DCIF_INT1_FIFO_EMPTY1			BIT(25)
+
+/* DPI_CTRL - DPI Control Register */
+#define DCIF_DPI_CTRL_HSYNC_POL_LOW		BIT(0)
+#define DCIF_DPI_CTRL_VSYNC_POL_LOW		BIT(1)
+#define DCIF_DPI_CTRL_DE_POL_LOW		BIT(2)
+#define DCIF_DPI_CTRL_PCLK_EDGE_FALLING		BIT(3)
+#define DCIF_DPI_CTRL_POL_MASK			GENMASK(3, 0)
+
+#define DCIF_DPI_CTRL_DATA_INV(x)		FIELD_PREP(GENMASK(4, 4), x)
+#define DCIF_DPI_CTRL_DEF_BGND_EN(x)		FIELD_PREP(GENMASK(5, 5), x)
+#define DCIF_DPI_CTRL_FETCH_OPT(x)		FIELD_PREP(GENMASK(9, 8), x)
+#define DCIF_DPI_CTRL_DISP_MODE(x)		FIELD_PREP(GENMASK(13, 12), x)
+#define DCIF_DPI_CTRL_DATA_PATTERN_MASK		GENMASK(18, 16)
+#define DCIF_DPI_CTRL_DATA_PATTERN(x)		FIELD_PREP(GENMASK(18, 16), x)
+#define PATTERN_RGB888				0
+#define PATTERN_RBG888				1
+#define PATTERN_GBR888				2
+#define PATTERN_GRB888				3
+#define PATTERN_BRG888				4
+#define PATTERN_BGR888				5
+#define PATTERN_RGB555				6
+#define PATTERN_RGB565				7
+
+/* DPI_HSYN_PAR - DPI Horizontal Sync Parameter Register */
+#define DCIF_DPI_HSYN_PAR_FP_H(x)		FIELD_PREP(GENMASK(11, 0), x)
+#define DCIF_DPI_HSYN_PAR_BP_H(x)		FIELD_PREP(GENMASK(27, 16), x)
+
+/* DPI_VSYN_PAR - DPI Vertical Sync Parameter Register */
+#define DCIF_DPI_VSYN_PAR_FP_V(x)		FIELD_PREP(GENMASK(11, 0), x)
+#define DCIF_DPI_VSYN_PAR_BP_V(x)		FIELD_PREP(GENMASK(27, 16), x)
+
+/* DPI_VSYN_HSYN_WIDTH - DPI Vertical and Horizontal Pulse Width Parameter Register */
+#define DCIF_DPI_VSYN_HSYN_WIDTH_PW_H(x)	FIELD_PREP(GENMASK(11, 0), x)
+#define DCIF_DPI_VSYN_HSYN_WIDTH_PW_V(x)	FIELD_PREP(GENMASK(27, 16), x)
+
+/* CTRLDESC0 - Control Descriptor Register 0 */
+#define DCIF_CTRLDESC0_AB_MODE(x)		FIELD_PREP(GENMASK(1, 0), x)
+#define ALPHA_EMBEDDED				0
+#define ALPHA_GLOBAL				1
+#define DCIF_CTRLDESC0_YUV_FORMAT_MASK		GENMASK(15, 14)
+#define DCIF_CTRLDESC0_YUV_FORMAT(x)		FIELD_PREP(GENMASK(15, 14), x)
+#define CTRLDESCL0_YUV_FORMAT_Y2VY1U		0x0
+#define CTRLDESCL0_YUV_FORMAT_Y2UY1V		0x1
+#define CTRLDESCL0_YUV_FORMAT_VY2UY1		0x2
+#define CTRLDESCL0_YUV_FORMAT_UY2VY1		0x3
+#define DCIF_CTRLDESC0_GLOBAL_ALPHA(x)		FIELD_PREP(GENMASK(23, 16), x)
+#define DCIF_CTRLDESC0_FORMAT_MASK		GENMASK(27, 24)
+#define DCIF_CTRLDESC0_FORMAT(x)		FIELD_PREP(GENMASK(27, 24), x)
+#define CTRLDESCL0_FORMAT_RGB565		0x4
+#define CTRLDESCL0_FORMAT_ARGB1555		0x5
+#define CTRLDESCL0_FORMAT_ARGB4444		0x6
+#define CTRLDESCL0_FORMAT_YCBCR422		0x7
+#define CTRLDESCL0_FORMAT_RGB888		0x8
+#define CTRLDESCL0_FORMAT_ARGB8888		0x9
+#define CTRLDESCL0_FORMAT_ABGR8888		0xa
+#define DCIF_CTRLDESC0_SHADOW_LOAD_EN		BIT(30)
+#define DCIF_CTRLDESC0_EN			BIT(31)
+
+/* CTRLDESC1 - Control Descriptor Register 1 */
+#define DCIF_CTRLDESC1_POSX(x)			FIELD_PREP(GENMASK(11, 0), x)
+#define DCIF_CTRLDESC1_POSY(x)			FIELD_PREP(GENMASK(27, 16), x)
+
+/* CTRLDESC2 - Control Descriptor Register */
+#define DCIF_CTRLDESC2_WIDTH(x)			FIELD_PREP(GENMASK(11, 0), x)
+#define DCIF_CTRLDESC2_HEIGHT(x)		FIELD_PREP(GENMASK(27, 16), x)
+
+/* CTRLDESC3 - Control Descriptor Register 3 */
+#define DCIF_CTRLDESC3_PITCH(x)			FIELD_PREP(GENMASK(15, 0), x)
+#define DCIF_CTRLDESC3_T_SIZE(x)		FIELD_PREP(GENMASK(17, 16), x)
+#define DCIF_CTRLDESC3_P_SIZE(x)		FIELD_PREP(GENMASK(22, 20), x)
+
+/* CTRLDESC4 - Control Descriptor Register 4 */
+#define DCIF_CTRLDESC4_ADDR(x)FIELD_PREP(GENMASK(31, 0), x)
+
+/* CTRLDESC6 - Control Descriptor Register 6  */
+#define DCIF_CTRLDESC6_BCLR_B(x)		FIELD_PREP(GENMASK(7, 0), x)
+#define DCIF_CTRLDESC6_BCLR_G(x)		FIELD_PREP(GENMASK(15, 8), x)
+#define DCIF_CTRLDESC6_BCLR_R(x)		FIELD_PREP(GENMASK(23, 16), x)
+#define DCIF_CTRLDESC6_BCLR_A(x)		FIELD_PREP(GENMASK(31, 24), x)
+
+/* CLUT_CTRL - CLUT control Register */
+#define DCIF_CLUT_CTRL_CLUT0_SEL(x)		FIELD_PREP(GENMASK(0, 0), x)
+#define DCIF_CLUT_CTRL_CLUT1_SEL(x)		FIELD_PREP(GENMASK(3, 3), x)
+#define DCIF_CLUT_CTRL_CLUT_MUX(x)		FIELD_PREP(GENMASK(29, 28), x)
+#define DCIF_CLUT_CTRL_CLUT_SHADOW_LOAD_EN(x)	FIELD_PREP(GENMASK(31, 31), x)
+
+/* PANIC_THRES_L0 - FIFO Panic Threshold Register For Layer 0 */
+#define DCIF_PANIC_THRES_LOW_MASK		GENMASK(11, 0)
+#define DCIF_PANIC_THRES_LOW(x)			FIELD_PREP(GENMASK(11, 00), x)
+#define DCIF_PANIC_THRES_HIGH_MASK		GENMASK(27, 16)
+#define DCIF_PANIC_THRES_HIGH(x)		FIELD_PREP(GENMASK(27, 16), x)
+#define DCIF_PANIC_THRES_REQ_EN			BIT(31)
+#define PANIC0_THRES_MAX			511
+
+/* LAYER_SR0_L0 - Layer Status Register 0 for Layer 0 */
+#define DCIF_LAYER_SR0_L0_FIFO_CNT_MASK		GENMASK(9, 0)
+#define DCIF_LAYER_SR0_L0_FIFO_CNT(x)		FIELD_PREP(GENMASK(9, 0), x)
+
+/* CSC_CTRL_L0 - Color Space Conversion Control Register For Layer 0 */
+#define DCIF_CSC_CTRL_L0_CSC_EN			BIT(0)
+#define DCIF_CSC_CTRL_L0_CSC_MODE_YCBCR2RGB	BIT(1)
+
+/* CSC_COEF0_L0 - Color Space Conversion Coefficient Register 0 For Layer 0 */
+#define DCIF_CSC_COEF0_L0_A1(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
+#define DCIF_CSC_COEF0_L0_A2(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
+
+/* CSC_COEF1_L0 - Color Space Conversion Coefficient Register 1 For Layer 0 */
+#define DCIF_CSC_COEF1_L0_A3(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
+#define DCIF_CSC_COEF1_L0_B1(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
+
+/* CSC_COEF2_L0 - Color Space Conversion Coefficient Register 2 For Layer 0 */
+#define DCIF_CSC_COEF2_L0_B2(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
+#define DCIF_CSC_COEF2_L0_B3(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
+
+/* CSC_COEF3_L0 - Color Space Conversion Coefficient Register 3 For Layer 0 */
+#define DCIF_CSC_COEF3_L0_C1(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
+#define DCIF_CSC_COEF3_L0_C2(x)			FIELD_PREP_CONST(GENMASK(26, 16), x)
+
+/* CSC_COEF4_L0 - Color Space Conversion Coefficient Register 4 For Layer 0 */
+#define DCIF_CSC_COEF4_L0_C3(x)			FIELD_PREP_CONST(GENMASK(10, 0), x)
+#define DCIF_CSC_COEF4_L0_D1(x)			FIELD_PREP_CONST(GENMASK(24, 16), x)
+
+/* CSC_COEF5_L0 - Color Space Conversion Coefficient Register 5 For Layer 0 */
+#define DCIF_CSC_COEF5_L0_D2(x)			FIELD_PREP_CONST(GENMASK(8, 0), x)
+#define DCIF_CSC_COEF5_L0_D3(x)			FIELD_PREP_CONST(GENMASK(24, 16), x)
+
+/* CTRLDESC0_L1 - Control Descriptor Register 0 for Layer 1 */
+#define DCIF_CTRLDESC0_L1_AB_MODE_MASK		GENMASK(1, 0)
+#define DCIF_CTRLDESC0_L1_AB_MODE(x)		FIELD_PREP(GENMASK(1, 0), x)
+
+/* CRC_CTRL - CRC Control Register */
+#define DCIF_CRC_CTRL_CRC_EN(x)			(1 << (x))
+#define DCIF_CRC_CTRL_HIST_REGION_SEL(x)	FIELD_PREP(GENMASK(17, 16), x)
+#define DCIF_CRC_CTRL_HIST_MODE			BIT(21)
+#define DCIF_CRC_CTRL_HIST_TRIG			BIT(22)
+#define DCIF_CRC_CTRL_HIST_EN			BIT(23)
+#define DCIF_CRC_CTRL_CRC_MODE			BIT(28)
+#define DCIF_CRC_CTRL_CRC_TRIG			BIT(29)
+#define DCIF_CRC_CTRL_CRC_ERR_CNT_RST		BIT(30)
+#define DCIF_CRC_CTRL_CRC_SHADOW_LOAD_EN	BIT(31)
+
+/* CRC_THRES - CRC Threshold Register */
+#define DCIF_CRC_THRES_CRC_THRESHOLD_MASK	GENMASK(31, 0)
+#define DCIF_CRC_THRES_CRC_THRESHOLD(x)		FIELD_PREP(GENMASK(31, 0), x)
+
+/* CRC_HIST_COEF - CRC Region Histogram Coefficient Register */
+#define DCIF_CRC_HIST_COEF_HIST_WB_MASK		GENMASK(7, 0)
+#define DCIF_CRC_HIST_COEF_HIST_WB(x)		FIELD_PREP(GENMASK(7, 0), x)
+#define DCIF_CRC_HIST_COEF_HIST_WG_MASK		GENMASK(15, 8)
+#define DCIF_CRC_HIST_COEF_HIST_WG(x)		FIELD_PREP(GENMASK(15, 8), x)
+#define DCIF_CRC_HIST_COEF_HIST_WR_MASK		GENMASK(23, 16)
+#define DCIF_CRC_HIST_COEF_HIST_WR(x)		FIELD_PREP(GENMASK(23, 16), x)
+
+/* CRC_ERR_CNT - CRC Error Counter Register */
+#define DCIF_CRC_ERR_CNT_CRC_ERR_CNT_MASK	GENMASK(31, 0)
+#define DCIF_CRC_ERR_CNT_CRC_ERR_CNT(x)		FIELD_PREP(GENMASK(31, 0), x)
+
+/* CRC_SR - CRC Status Register */
+#define DCIF_CRC_SR_HIST_CNT_SAT_MASK		BIT(13)
+#define DCIF_CRC_SR_HIST_CNT_SAT(x)		FIELD_PREP(GENMASK(13, 13), x)
+#define DCIF_CRC_SR_HIST_SAT_MASK		BIT(14)
+#define DCIF_CRC_SR_HIST_SAT(x)			FIELD_PREP(GENMASK(14, 14), x)
+#define DCIF_CRC_SR_HIST_BUSY_MASK		BIT(15)
+#define DCIF_CRC_SR_HIST_BUSY(x)		FIELD_PREP(GENMASK(15, 15), x)
+#define DCIF_CRC_SR_CRC_STATUS_MASK		BIT(31)
+#define DCIF_CRC_SR_CRC_STATUS(x)		FIELD_PREP(GENMASK(31, 31), x)
+
+/* CRC Region Histogram Counter Register For Bin n */
+#define DCIF_B_BIN_CNT_MASK			GENMASK(20, 0)
+#define DCIF_B_BIN_CNT(x)			FIELD_PREP(GENMASK(20, 0), x)
+
+/* CRC_POS - CRC Position Register */
+#define DCIF_CRC_POS_CRC_HOR_POS(x)		FIELD_PREP(GENMASK(11, 0), x)
+#define DCIF_CRC_POS_CRC_VER_POS(x)		FIELD_PREP(GENMASK(27, 16), x)
+
+/* CRC_SIZE - CRC Size Register */
+#define DCIF_CRC_SIZE_CRC_HOR_SIZE(x)		FIELD_PREP(GENMASK(11, 0), x)
+#define DCIF_CRC_SIZE_CRC_VER_SIZE(x)		FIELD_PREP(GENMASK(27, 16), x)
+
+/* CRC_VAL - CRC Value Register */
+#define DCIF_CRC_VAL_CRC_VAL_MASK		GENMASK(31, 0)
+#define DCIF_CRC_VAL_CRC_VAL(x)			FIELD_PREP(GENMASK(31, 0), x)
+
+/* CRC_EXP_VAL - CRC Expected Value Register */
+#define DCIF_CRC_EXP_VAL_CRC_EXP_VAL_MASK	GENMASK(31, 0)
+#define DCIF_CRC_EXP_VAL_CRC_EXP_VAL(x)		FIELD_PREP(GENMASK(31, 0), x)
+
+#endif /* __DCIF_REG_H__ */
-- 
2.46.1

