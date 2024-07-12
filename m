Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D66C92F7E1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1202610EC7F;
	Fri, 12 Jul 2024 09:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="D46eG4aY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C047310EC7F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdg+owAC29zmpQGc/JLl684FmN5DjL4QV3rqJmR4IgJwTf2guEiv1pmBnjog4Y1jc1HbIcuikm/pIAENFaxJxhzUH8xZbgR78hEG2NRsRTyxWdb6VHrElVF8vA82IXm/7BKKqV8t4Kh2nWfS/vH4jTf53VnfvAwHWMHIo/EV8maaGC+9XUdUWi1SLLgbBkwx3+BMdl/ZRM5ZeWwScybr92WEEhdCjQx89blRKMvSB0ZpgtgkUD503OsAGivzk/snH8/pUa5+moWw70LxmpRdV9GJmmm9ccrlgmSIejD4kEA4/DCKvDbKWZyh4EsBPIqwQy9wmUa427xRFKuBe0WzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQQPH3K37fQRuij33BqLGUfpnnDu6fNuRXWr+w3BrOg=;
 b=IbfhVj+eiEMSGOgxaWLZPt1uKtR20LQrGDhCHkXcCxTHizPibqS3z6c+Uab6+Eda5ZfeB/5B+u+1UrPt2qGjUXJsoJ8rYDF+uKeGN1k8s1RIdDuvV4umCcTHCjpdtfWb+9DrYKbjurQjOC/SzqNzWe8HmC7OxtnPZcQSi8aoj4ZR7U6xypk4eA7fSGYgcjO0Gf1kZa14fMFr9m9OEwTPEicILTM5KceAnFc9OFprRDf3k4jiVvXgAgTQ5wQXSreNfy8ugMw00jxweP9f+GeTV767r0yYtSD7ld7gIinuahI3FaEzjg9x4dP6FRy32knK7hVUZWfj5pIiiM3hw7iw/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQQPH3K37fQRuij33BqLGUfpnnDu6fNuRXWr+w3BrOg=;
 b=D46eG4aY5r+g9RTg7y9Krp30f1J2m5YVwfCjwIGK+E4c+1dsSn8WBuzRI7NZdfttDTSFHQrpEgaAlsHLlczLGklFcSwPtj7UB3Cz6Q12wiA98F0zwq0XM3lt0LYMDdZv/0LMDjeWjEsbUeMWSxkEx8qLkOO+WE2LqS5s5OGi+vU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10289.eurprd04.prod.outlook.com (2603:10a6:800:242::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:25:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:25:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [PATCH v2 06/16] drm/imx: Add i.MX8qxp Display Controller display
 engine
Date: Fri, 12 Jul 2024 17:32:33 +0800
Message-Id: <20240712093243.2108456-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240712093243.2108456-1-victor.liu@nxp.com>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10289:EE_
X-MS-Office365-Filtering-Correlation-Id: dd31eb28-4293-4cba-c085-08dca2548c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?izBI2SWORX9fBuHUeqOZzkL2L70pSQhTVW5YsleUTDhIHQJMB2/weg3TGvUO?=
 =?us-ascii?Q?BeFme5vYzqZkRq/ig0I7feZYQkpJ9S4YmY8JfTFjym4ZS235zSN4Xx4517BB?=
 =?us-ascii?Q?qgHwNkdMCVtQmeNv/oL7OF+0qvx0ccPQVlQj0SaoqPrSm0voFh1aiDoMbJnh?=
 =?us-ascii?Q?vsuPKzNokMS9Iq9jHPrqYsnEjmKJNvNWgYiRHgyrxfESEDRMBLApCGeRBG1Y?=
 =?us-ascii?Q?m92v2PdCBT6IGEErUoW1ZejiAp9JjQ4TOA0q+SJsptCyT1qpC2T0C32UN00G?=
 =?us-ascii?Q?CnJv9hI6aHXTYSX87x2R6oOSvAX0Ug7oEIaEL1N3vA7UNihU2awuQg1Th+g3?=
 =?us-ascii?Q?zngD2RpbpSr1ynk1qLamyte6/kW/8iCj9T7LwR5qDheKGGIZCM0FSNMjlAV7?=
 =?us-ascii?Q?DOtEh+izxi8HBsIp4j5HBBo8C/ten3DosE4Vq6aXNiBvA/qycRHbjKZk7TlE?=
 =?us-ascii?Q?3CFZvWTq0/9OlKzrqYw+Y+h0CWN1D23oYKKFBTLmRyhl5Ad7PCEs1N4WL8gs?=
 =?us-ascii?Q?upQLHNUVjxvC0CXCvL0/g2JmEfBnVxxVeYx9XVxUFuy1czhWgE86sObxHVPB?=
 =?us-ascii?Q?B5WUqhZwr9SSyDaeSyZQH095S6WJYM2p48nLqYbuoVyt+WphB4pS0rKyoi1+?=
 =?us-ascii?Q?vIiB3pCx2D+qiw8RziSIHR6p+LIR8IzE90fqZx/gZ5lf374zyICusGrsEB7G?=
 =?us-ascii?Q?DHY/9PJn33EgzgNoSxPBW3khFm8+JaWiiPGpGH5PFCnPubjcM4rFKNTgD03Q?=
 =?us-ascii?Q?HfZ65EVHeRfz6D7MkG6dl8EokLBYZ/1lMous7C3EVCtCv49QHlcOka0n05wZ?=
 =?us-ascii?Q?7eJfEHqz4bGMiNS972QRrKJdcYSM66w3+axlIIizrcjJccGGJlZ8ACmpOODw?=
 =?us-ascii?Q?QrvZpIsO2EAN669au6pIZH6KfNRKbd6cUc4e5WQiMj9OEyy85d1zxZCbmbWn?=
 =?us-ascii?Q?7qD794xLNL8qJtAIAahvQj+PUt8Ur0oL4v7czIwcH0LHsSZG9I2D9JeMt5p0?=
 =?us-ascii?Q?ujm7HjXqrcLefQm83+gMipGvZVsjFcjC7PCZK3shuYrNe8zKL/+b374T60Fz?=
 =?us-ascii?Q?tTymnL4sGQRc/Y5jtuT3mx+wQ6uiSyRjTsGbczWji/FYoaeDDJSkfCIri7B4?=
 =?us-ascii?Q?sIrEtWNcVX+Phn1qtPp4nJIRIrhkraCqbRy0wka6+MyBF7XqMXHKtgM7x7ly?=
 =?us-ascii?Q?7Xe3NNUJ5ZuBuHdjBgMZiMESmaFCsoZaXah62rMED4T0bKmesBfp+mwDRLGF?=
 =?us-ascii?Q?zGVJajAXKWLWj3jhI4T7mh9ABhaSZ4QY7iWYG7aIDDfwjej7h6fGS8lwrqNa?=
 =?us-ascii?Q?C5Yrmu0f2Lb7vEk0nBn2FWNT6A5dLDYDEHACuDBTDocGOSLfaMQtPa0dgL6h?=
 =?us-ascii?Q?QhN+atioTgPwVCknIEKaxOgGWAYjYNPqoEqIlUm2FXErL/tnNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?32zmUcwhwJw6ynHcCCR0izgqaDqFPi+6RJRSgoxgJK3kWcBbFdY84kj/j0XJ?=
 =?us-ascii?Q?pgx/YkS4vvQXfTnmfQDNdFQvO3fqm+o4/2ZyS+PcO6SaSa/mSzew3pUJqKPe?=
 =?us-ascii?Q?gUil0J7je7q0AegoXbU5husYT03d5c8LtLPgDSDRfBM3OloTnOHz/qmZYgMu?=
 =?us-ascii?Q?w64uE7Yb1gR2MspnPhsM7aGPphgDEYVY+1Kqkxv/qsubyxNjtYtSvT0VBXoQ?=
 =?us-ascii?Q?rmRr2pyxoNVrZ9ObI5RbgpWgVKRLEegI7ZR+TGqAYebja/+n1cGPkZsaEwkY?=
 =?us-ascii?Q?panuAkGNSEif96n1Vag702uELQZfMPZ5z1w+iCer/uBn7lgqFEW+vSXn4FDW?=
 =?us-ascii?Q?fr5RhjCeyIF/gbhGL79rB+/tNKCr98g560Jo6k01Q9JPufF9SPEjt3p7h3a2?=
 =?us-ascii?Q?TyKh903S5SVKSwaOhrmN74/RvGHFe/Bf2fIoUDBNNBAVO7ItegtR/Xmde+xs?=
 =?us-ascii?Q?KhSxmzEygWzfABV+X2Einq+YVpd2rkHY3UqryrfM6vkmImobKcsXcyxDfcAt?=
 =?us-ascii?Q?98oqa4UfvNp3yxoDdlb5gCwHhaACDPFmThd5WO16m3hGQSsTgwUhy95AtzvX?=
 =?us-ascii?Q?AbzGughu0+rsbQgAlMUuxPBMvmSDVy7+gFpoLMa35NhvyBmMjejTBObTnxPP?=
 =?us-ascii?Q?efAsVKOsmlfB6jwjuRqbUiaLpY0y+L/mhQ9lkwQl+S7jZxJiolcLBiAH9vN7?=
 =?us-ascii?Q?++sUtG1koCSrFPNi2mGv4Xkau+7eP92Rld31plmV3xlOdKJYxtuNAYYrlBvS?=
 =?us-ascii?Q?L3UlUGUxhy78oG7NM0NkN57Wdj/ieHwV2gq1FIEN3FAxr2nkHqfVykiTwuNH?=
 =?us-ascii?Q?UnU7lb3e3d38T1WhzN7nf181m9gRPT4ChfAfP/w+wqGK14i1Qj8IAF7DLmtc?=
 =?us-ascii?Q?RhJTGAl8RLYcIjGVlAUX09PV/kiHwVduUnVpFyJlLTGTb3p1/Xe8ZZBG/P4i?=
 =?us-ascii?Q?uZXe4f66t3oA4wdnwWpx803KOR0XDQ2xLf8l2XCAeI2k2PBYof9zVN0ZG81G?=
 =?us-ascii?Q?WmX65h7IcALZjUJQXItw+wUVK9ciR/y3d+8r24hhSdwGSYfZ+KMbSHrKadBO?=
 =?us-ascii?Q?UbYwVf5PzHl541amVnH/mWQDHeufEtDSTv2vcWWU1VkyrTKaw4lUQtg0xb6X?=
 =?us-ascii?Q?mjGTUpPDy8cQTO4DKdcgORqkdZ+vJIm3MGEtwmNfyASQ4PDkht9SNilcGd/l?=
 =?us-ascii?Q?SsIy3gmWFTqhVjeETdcV6gUQ16OEXYXnpMXR7MhYGZElQ6R32f8IWVB3E283?=
 =?us-ascii?Q?20hVu3JvknMxyw11k2cIJDwODESUfhuBfYLMtKYZDIClL0lvjOe7K7unrInt?=
 =?us-ascii?Q?oTSFmnUCSduvTenr5g4fobyXaUcny9/zTHpA4pCb3MPtvLQ9Riyj79LfMMbF?=
 =?us-ascii?Q?tnEeJdukfCHmdjEEr62uY4SbBMIdRRR2ToMajSjBm7scUSKhTHkiuHmf27cS?=
 =?us-ascii?Q?3nz6te7VenvCGGY41nXPp79sS18E4/CFlSV9wjqXIj4Qj5OOdRQ+CLfisKgX?=
 =?us-ascii?Q?XfIiaW/hK/AfJbEMduH8jYOlKApNfQ9Gsyw8t2h8lPW4fCMdiQK8mOFoDwCs?=
 =?us-ascii?Q?pWmehYzP5pjf3pJ57yZtpxY625RMEUMjJVHablSG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd31eb28-4293-4cba-c085-08dca2548c7b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:25:20.0317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkfOzYtaoMLIX7qLUJXDkqS+3cXijOtuhlnIxE+M7CUKHX21xWQYmobA7j02/0eGOgvxQX9bPcFldJJBRrkoOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10289
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

i.MX8qxp Display Controller display engine consists of all processing
units that operate in a display clock domain.  Add minimal feature
support with FrameGen and TCon so that the engine can output display
timings.  The display engine driver as a master binds FrameGen and
TCon drivers as components.  While at it, the display engine driver
is a component to be bound with the upcoming DRM driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Use OF alias id to get instance id.
* Add dev member to struct dc_tc.

 drivers/gpu/drm/imx/Kconfig     |   1 +
 drivers/gpu/drm/imx/Makefile    |   1 +
 drivers/gpu/drm/imx/dc/Kconfig  |   5 +
 drivers/gpu/drm/imx/dc/Makefile |   5 +
 drivers/gpu/drm/imx/dc/dc-de.c  | 151 +++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
 drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
 drivers/gpu/drm/imx/dc/dc-drv.h |  24 +++
 drivers/gpu/drm/imx/dc/dc-fg.c  | 366 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-tc.c  | 137 ++++++++++++
 10 files changed, 784 insertions(+)
 create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dc/Makefile
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c

diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
index 03535a15dd8f..3e8c6edbc17c 100644
--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+source "drivers/gpu/drm/imx/dc/Kconfig"
 source "drivers/gpu/drm/imx/dcss/Kconfig"
 source "drivers/gpu/drm/imx/ipuv3/Kconfig"
 source "drivers/gpu/drm/imx/lcdc/Kconfig"
diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
index 86f38e7c7422..c7b317640d71 100644
--- a/drivers/gpu/drm/imx/Makefile
+++ b/drivers/gpu/drm/imx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_DRM_IMX8_DC) += dc/
 obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
 obj-$(CONFIG_DRM_IMX) += ipuv3/
 obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
new file mode 100644
index 000000000000..32d7471c49d0
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/Kconfig
@@ -0,0 +1,5 @@
+config DRM_IMX8_DC
+	tristate "Freescale i.MX8 Display Controller Graphics"
+	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
+	help
+	  enable Freescale i.MX8 Display Controller(DC) graphics support
diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
new file mode 100644
index 000000000000..56de82d53d4d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
+
+obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
new file mode 100644
index 000000000000..2c8268b76b08
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_managed.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+
+#define POLARITYCTRL		0xc
+#define  POLEN_HIGH		BIT(2)
+
+struct dc_de_priv {
+	struct dc_de engine;
+	void __iomem *reg_top;
+};
+
+static inline struct dc_de_priv *to_de_priv(struct dc_de *de)
+{
+	return container_of(de, struct dc_de_priv, engine);
+}
+
+static inline void
+dc_dec_write(struct dc_de *de, unsigned int offset, u32 value)
+{
+	struct dc_de_priv *priv = to_de_priv(de);
+
+	writel(value, priv->reg_top + offset);
+}
+
+static void dc_dec_init(struct dc_de *de)
+{
+	dc_dec_write(de, POLARITYCTRL, POLEN_HIGH);
+}
+
+static int dc_de_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_de_priv *priv;
+	int ret;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg_top = devm_platform_ioremap_resource_byname(pdev, "top");
+	if (IS_ERR(priv->reg_top))
+		return PTR_ERR(priv->reg_top);
+
+	priv->engine.irq_shdld = platform_get_irq_byname(pdev, "shdload");
+	if (priv->engine.irq_shdld < 0)
+		return priv->engine.irq_shdld;
+
+	priv->engine.irq_framecomplete =
+				platform_get_irq_byname(pdev, "framecomplete");
+	if (priv->engine.irq_framecomplete < 0)
+		return priv->engine.irq_framecomplete;
+
+	priv->engine.irq_seqcomplete =
+				platform_get_irq_byname(pdev, "seqcomplete");
+	if (priv->engine.irq_seqcomplete < 0)
+		return priv->engine.irq_seqcomplete;
+
+	priv->engine.id = of_alias_get_id(dev->of_node, "dc0-display-engine");
+	if (priv->engine.id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", priv->engine.id);
+		return priv->engine.id;
+	}
+
+	priv->engine.dev = dev;
+
+	dev_set_drvdata(dev, priv);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	dc_drm->de[priv->engine.id] = &priv->engine;
+
+	return 0;
+}
+
+static const struct component_ops dc_de_ops = {
+	.bind = dc_de_bind,
+};
+
+static int dc_de_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_of_platform_populate(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = component_add(&pdev->dev, &dc_de_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_de_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_de_ops);
+}
+
+static int dc_de_runtime_resume(struct device *dev)
+{
+	struct dc_de_priv *priv = dev_get_drvdata(dev);
+	struct dc_de *engine = &priv->engine;
+
+	dc_dec_init(engine);
+	dc_fg_init(engine->fg);
+	dc_tc_init(engine->tc);
+
+	return 0;
+}
+
+static const struct dev_pm_ops dc_de_pm_ops = {
+	RUNTIME_PM_OPS(NULL, dc_de_runtime_resume, NULL)
+};
+
+static const struct of_device_id dc_de_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-display-engine", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_de_dt_ids);
+
+struct platform_driver dc_de_driver = {
+	.probe = dc_de_probe,
+	.remove_new = dc_de_remove,
+	.driver = {
+		.name = "imx8-dc-display-engine",
+		.of_match_table = dc_de_dt_ids,
+		.pm = pm_sleep_ptr(&dc_de_pm_ops),
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
new file mode 100644
index 000000000000..3417059c40b9
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_DISPLAY_ENGINE_H__
+#define __DC_DISPLAY_ENGINE_H__
+
+#include <linux/device.h>
+#include <drm/drm_modes.h>
+
+#define DC_DISPLAYS	2
+
+enum dc_fg_syncmode {
+	FG_SYNCMODE_OFF,	/* No side-by-side synchronization. */
+};
+
+enum dc_fg_dm {
+	FG_DM_CONSTCOL = 0x1,	/* Constant Color Background is shown. */
+	FG_DM_SEC_ON_TOP = 0x5,	/* Both inputs overlaid with secondary on top. */
+};
+
+struct dc_fg {
+};
+
+struct dc_tc {
+	struct device *dev;
+};
+
+struct dc_de {
+	struct device *dev;
+	struct dc_fg *fg;
+	struct dc_tc *tc;
+	int irq_shdld;
+	int irq_framecomplete;
+	int irq_seqcomplete;
+	int id;
+};
+
+/* Frame Generator Unit */
+void dc_fg_syncmode(struct dc_fg *fg, enum dc_fg_syncmode mode);
+void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m);
+void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode);
+void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode);
+void dc_fg_enable(struct dc_fg *fg);
+void dc_fg_disable(struct dc_fg *fg);
+void dc_fg_shdtokgen(struct dc_fg *fg);
+u32 dc_fg_get_frame_index(struct dc_fg *fg);
+int dc_fg_get_line_index(struct dc_fg *fg);
+bool dc_fg_wait_for_frame_index_moving(struct dc_fg *fg);
+bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg);
+void dc_fg_secondary_clear_channel_status(struct dc_fg *fg);
+int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg);
+void dc_fg_enable_clock(struct dc_fg *fg);
+void dc_fg_disable_clock(struct dc_fg *fg);
+enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
+void dc_fg_init(struct dc_fg *fg);
+
+/* Timing Controller Unit */
+void dc_tc_init(struct dc_tc *tc);
+
+#endif /* __DC_DISPLAY_ENGINE_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
new file mode 100644
index 000000000000..e5910a82dd4d
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "dc-drv.h"
+
+static struct platform_driver * const dc_drivers[] = {
+	&dc_de_driver,
+	&dc_fg_driver,
+	&dc_tc_driver,
+};
+
+static int __init dc_drm_init(void)
+{
+	return platform_register_drivers(dc_drivers, ARRAY_SIZE(dc_drivers));
+}
+
+static void __exit dc_drm_exit(void)
+{
+	platform_unregister_drivers(dc_drivers, ARRAY_SIZE(dc_drivers));
+}
+
+module_init(dc_drm_init);
+module_exit(dc_drm_exit);
+
+MODULE_DESCRIPTION("i.MX8 Display Controller DRM Driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
new file mode 100644
index 000000000000..e1290d9a0a99
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef __DC_DRV_H__
+#define __DC_DRV_H__
+
+#include <linux/platform_device.h>
+
+#include <drm/drm_device.h>
+
+#include "dc-de.h"
+
+struct dc_drm_device {
+	struct drm_device base;
+	struct dc_de *de[DC_DISPLAYS];
+};
+
+extern struct platform_driver dc_de_driver;
+extern struct platform_driver dc_fg_driver;
+extern struct platform_driver dc_tc_driver;
+
+#endif /* __DC_DRV_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
new file mode 100644
index 000000000000..3e9a8abee93e
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_managed.h>
+#include <drm/drm_modes.h>
+
+#include "dc-de.h"
+#include "dc-drv.h"
+
+#define FGSTCTRL		0x8
+#define  FGSYNCMODE_MASK	0x6
+#define  FGSYNCMODE(n)		((n) << 6)
+#define  SHDEN			BIT(0)
+
+#define HTCFG1			0xc
+#define  HTOTAL(n)		((((n) - 1) & 0x3fff) << 16)
+#define  HACT(n)		((n) & 0x3fff)
+
+#define HTCFG2			0x10
+#define  HSEN			BIT(31)
+#define  HSBP(n)		((((n) - 1) & 0x3fff) << 16)
+#define  HSYNC(n)		(((n) - 1) & 0x3fff)
+
+#define VTCFG1			0x14
+#define  VTOTAL(n)		((((n) - 1) & 0x3fff) << 16)
+#define  VACT(n)		((n) & 0x3fff)
+
+#define VTCFG2			0x18
+#define  VSEN			BIT(31)
+#define  VSBP(n)		((((n) - 1) & 0x3fff) << 16)
+#define  VSYNC(n)		(((n) - 1) & 0x3fff)
+
+#define PKICKCONFIG		0x2c
+#define SKICKCONFIG		0x30
+#define  EN			BIT(31)
+#define  ROW(n)			(((n) & 0x3fff) << 16)
+#define  COL(n)			((n) & 0x3fff)
+
+#define PACFG			0x54
+#define SACFG			0x58
+#define  STARTX(n)		(((n) + 1) & 0x3fff)
+#define  STARTY(n)		(((((n) + 1) & 0x3fff)) << 16)
+
+#define FGINCTRL		0x5c
+#define FGINCTRLPANIC		0x60
+#define  FGDM_MASK		0x7
+#define  ENPRIMALPHA		BIT(3)
+#define  ENSECALPHA		BIT(4)
+
+#define FGCCR			0x64
+#define  CCGREEN(g)		(((g) & 0x3ff) << 10)
+
+#define FGENABLE		0x68
+#define  FGEN			BIT(0)
+
+#define FGSLR			0x6c
+#define  SHDTOKGEN		BIT(0)
+
+#define FGTIMESTAMP		0x74
+#define  FRAMEINDEX_SHIFT	14
+#define  FRAMEINDEX_MASK	(0x3ffff << FRAMEINDEX_SHIFT)
+#define  LINEINDEX_MASK		0x3fff
+
+#define FGCHSTAT		0x78
+#define  SECSYNCSTAT		BIT(24)
+#define  SFIFOEMPTY		BIT(16)
+
+#define FGCHSTATCLR		0x7c
+#define  CLRSECSTAT		BIT(16)
+
+#define KHZ			1000
+
+struct dc_fg_priv {
+	struct dc_fg fg;
+	struct device *dev;
+	void __iomem *reg;
+	struct clk *clk_disp;
+};
+
+static inline struct dc_fg_priv *to_fg_priv(struct dc_fg *fg)
+{
+	return container_of(fg, struct dc_fg_priv, fg);
+}
+
+static inline u32 dc_fg_read(struct dc_fg *fg, unsigned int offset)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+
+	return readl(priv->reg + offset);
+}
+
+static inline void
+dc_fg_write(struct dc_fg *fg, unsigned int offset, u32 value)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+
+	writel(value, priv->reg + offset);
+}
+
+static inline void
+dc_fg_write_mask(struct dc_fg *fg, unsigned int offset, u32 mask, u32 value)
+{
+	u32 tmp;
+
+	tmp = dc_fg_read(fg, offset);
+	tmp &= ~mask;
+	dc_fg_write(fg, offset, tmp | value);
+}
+
+static void dc_fg_enable_shden(struct dc_fg *fg)
+{
+	dc_fg_write_mask(fg, FGSTCTRL, SHDEN, SHDEN);
+}
+
+void dc_fg_syncmode(struct dc_fg *fg, enum dc_fg_syncmode mode)
+{
+	dc_fg_write_mask(fg, FGSTCTRL, FGSYNCMODE_MASK, FGSYNCMODE(mode));
+}
+
+void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+	u32 hact, htotal, hsync, hsbp;
+	u32 vact, vtotal, vsync, vsbp;
+	u32 kick_row, kick_col;
+	int ret;
+
+	hact = m->crtc_hdisplay;
+	htotal = m->crtc_htotal;
+	hsync = m->crtc_hsync_end - m->crtc_hsync_start;
+	hsbp = m->crtc_htotal - m->crtc_hsync_start;
+
+	vact = m->crtc_vdisplay;
+	vtotal = m->crtc_vtotal;
+	vsync = m->crtc_vsync_end - m->crtc_vsync_start;
+	vsbp = m->crtc_vtotal - m->crtc_vsync_start;
+
+	/* video mode */
+	dc_fg_write(fg, HTCFG1, HACT(hact)   | HTOTAL(htotal));
+	dc_fg_write(fg, HTCFG2, HSYNC(hsync) | HSBP(hsbp) | HSEN);
+	dc_fg_write(fg, VTCFG1, VACT(vact)   | VTOTAL(vtotal));
+	dc_fg_write(fg, VTCFG2, VSYNC(vsync) | VSBP(vsbp) | VSEN);
+
+	kick_col = hact + 1;
+	kick_row = vact;
+
+	/* pkickconfig */
+	dc_fg_write(fg, PKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* skikconfig */
+	dc_fg_write(fg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
+
+	/* primary and secondary area position configuration */
+	dc_fg_write(fg, PACFG, STARTX(0) | STARTY(0));
+	dc_fg_write(fg, SACFG, STARTX(0) | STARTY(0));
+
+	/* alpha */
+	dc_fg_write_mask(fg, FGINCTRL,      ENPRIMALPHA | ENSECALPHA, 0);
+	dc_fg_write_mask(fg, FGINCTRLPANIC, ENPRIMALPHA | ENSECALPHA, 0);
+
+	/* constant color is green(used in panic mode)  */
+	dc_fg_write(fg, FGCCR, CCGREEN(0x3ff));
+
+	ret = clk_set_rate(priv->clk_disp, m->clock * KHZ);
+	if (ret < 0)
+		dev_err(priv->dev,
+			"failed to set display clock rate: %d\n", ret);
+}
+
+void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
+{
+	dc_fg_write_mask(fg, FGINCTRL, FGDM_MASK, mode);
+}
+
+void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
+{
+	dc_fg_write_mask(fg, FGINCTRLPANIC, FGDM_MASK, mode);
+}
+
+void dc_fg_enable(struct dc_fg *fg)
+{
+	dc_fg_write(fg, FGENABLE, FGEN);
+}
+
+void dc_fg_disable(struct dc_fg *fg)
+{
+	dc_fg_write(fg, FGENABLE, 0);
+}
+
+void dc_fg_shdtokgen(struct dc_fg *fg)
+{
+	dc_fg_write(fg, FGSLR, SHDTOKGEN);
+}
+
+u32 dc_fg_get_frame_index(struct dc_fg *fg)
+{
+	u32 val = dc_fg_read(fg, FGTIMESTAMP);
+
+	return (val & FRAMEINDEX_MASK) >> FRAMEINDEX_SHIFT;
+}
+
+int dc_fg_get_line_index(struct dc_fg *fg)
+{
+	u32 val = dc_fg_read(fg, FGTIMESTAMP);
+
+	return val & LINEINDEX_MASK;
+}
+
+bool dc_fg_wait_for_frame_index_moving(struct dc_fg *fg)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(100);
+	u32 frame_index, last_frame_index;
+
+	frame_index = dc_fg_get_frame_index(fg);
+	do {
+		last_frame_index = frame_index;
+		frame_index = dc_fg_get_frame_index(fg);
+	} while (last_frame_index == frame_index &&
+		 time_before(jiffies, timeout));
+
+	return last_frame_index != frame_index;
+}
+
+bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg)
+{
+	u32 val;
+
+	val = dc_fg_read(fg, FGCHSTAT);
+
+	return !!(val & SFIFOEMPTY);
+}
+
+void dc_fg_secondary_clear_channel_status(struct dc_fg *fg)
+{
+	dc_fg_write(fg, FGCHSTATCLR, CLRSECSTAT);
+}
+
+int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+	u32 val;
+
+	return readl_poll_timeout(priv->reg + FGCHSTAT, val,
+				  val & SECSYNCSTAT, 5, 100000);
+}
+
+void dc_fg_enable_clock(struct dc_fg *fg)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+	int ret;
+
+	ret = clk_prepare_enable(priv->clk_disp);
+	if (ret)
+		dev_err(priv->dev, "failed to enable display clock: %d\n", ret);
+}
+
+void dc_fg_disable_clock(struct dc_fg *fg)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+
+	clk_disable_unprepare(priv->clk_disp);
+}
+
+enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz)
+{
+	struct dc_fg_priv *priv = to_fg_priv(fg);
+	unsigned long rounded_rate;
+
+	rounded_rate = clk_round_rate(priv->clk_disp, clk_khz * KHZ);
+
+	if (rounded_rate != clk_khz * KHZ)
+		return MODE_NOCLOCK;
+
+	return MODE_OK;
+}
+
+void dc_fg_init(struct dc_fg *fg)
+{
+	dc_fg_enable_shden(fg);
+	dc_fg_syncmode(fg, FG_SYNCMODE_OFF);
+}
+
+static int dc_fg_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_fg_priv *priv;
+	struct dc_de *de;
+	int id;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->reg))
+		return PTR_ERR(priv->reg);
+
+	priv->clk_disp = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk_disp))
+		return dev_err_probe(dev, PTR_ERR(priv->clk_disp),
+				     "failed to get display clock\n");
+
+	id = of_alias_get_id(dev->of_node, "dc0-framegen");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	priv->dev = dev;
+
+	de = dc_drm->de[id];
+	de->fg = &priv->fg;
+
+	return 0;
+}
+
+static const struct component_ops dc_fg_ops = {
+	.bind = dc_fg_bind,
+};
+
+static int dc_fg_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_fg_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_fg_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_fg_ops);
+}
+
+static const struct of_device_id dc_fg_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-framegen", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_fg_dt_ids);
+
+struct platform_driver dc_fg_driver = {
+	.probe = dc_fg_probe,
+	.remove_new = dc_fg_remove,
+	.driver = {
+		.name = "imx8-dc-framegen",
+		.of_match_table = dc_fg_dt_ids,
+	},
+};
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
new file mode 100644
index 000000000000..29f42496a409
--- /dev/null
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/component.h>
+#include <linux/container_of.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_managed.h>
+
+#include "dc-drv.h"
+#include "dc-de.h"
+
+#define TCON_CTRL	0x410
+#define  CTRL_RST_VAL	0x01401408
+
+/* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
+#define MAPBIT3_0	0x418
+#define MAPBIT7_4	0x41c
+#define MAPBIT11_8	0x420
+#define MAPBIT15_12	0x424
+#define MAPBIT19_16	0x428
+#define MAPBIT23_20	0x42c
+#define MAPBIT27_24	0x430
+#define MAPBIT31_28	0x434
+#define MAPBIT34_32	0x438
+
+struct dc_tc_priv {
+	struct dc_tc tc;
+	void __iomem *reg;
+};
+
+static inline struct dc_tc_priv *to_tc_priv(struct dc_tc *tc)
+{
+	return container_of(tc, struct dc_tc_priv, tc);
+}
+
+static inline void dc_tc_write(struct dc_tc *tc, unsigned int offset, u32 value)
+{
+	struct dc_tc_priv *priv = to_tc_priv(tc);
+
+	writel(value, priv->reg + offset);
+}
+
+static void dc_tc_set_fmt(struct dc_tc *tc)
+{
+	/*
+	 * The pixels reach TCON are always in 30-bit BGR format.
+	 * The first bridge always receives pixels in 30-bit RGB format.
+	 * So, map the format to MEDIA_BUS_FMT_RGB101010_1X30.
+	 */
+	dc_tc_write(tc, MAPBIT3_0,   0x17161514);
+	dc_tc_write(tc, MAPBIT7_4,   0x1b1a1918);
+	dc_tc_write(tc, MAPBIT11_8,  0x0b0a1d1c);
+	dc_tc_write(tc, MAPBIT15_12, 0x0f0e0d0c);
+	dc_tc_write(tc, MAPBIT19_16, 0x13121110);
+	dc_tc_write(tc, MAPBIT23_20, 0x03020100);
+	dc_tc_write(tc, MAPBIT27_24, 0x07060504);
+	dc_tc_write(tc, MAPBIT31_28, 0x00000908);
+}
+
+void dc_tc_init(struct dc_tc *tc)
+{
+	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
+	dc_tc_write(tc, TCON_CTRL, CTRL_RST_VAL);
+	dc_tc_set_fmt(tc);
+}
+
+static int dc_tc_bind(struct device *dev, struct device *master, void *data)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct dc_drm_device *dc_drm = data;
+	struct dc_tc_priv *priv;
+	struct dc_de *de;
+	int id;
+
+	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->reg))
+		return PTR_ERR(priv->reg);
+
+	id = of_alias_get_id(dev->of_node, "dc0-tcon");
+	if (id < 0) {
+		dev_err(dev, "failed to get alias id: %d\n", id);
+		return id;
+	}
+
+	de = dc_drm->de[id];
+	de->tc = &priv->tc;
+	de->tc->dev = dev;
+
+	return 0;
+}
+
+static const struct component_ops dc_tc_ops = {
+	.bind = dc_tc_bind,
+};
+
+static int dc_tc_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = component_add(&pdev->dev, &dc_tc_ops);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to add component\n");
+
+	return 0;
+}
+
+static void dc_tc_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &dc_tc_ops);
+}
+
+static const struct of_device_id dc_tc_dt_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dc-tcon", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dc_tc_dt_ids);
+
+struct platform_driver dc_tc_driver = {
+	.probe = dc_tc_probe,
+	.remove_new = dc_tc_remove,
+	.driver = {
+		.name = "imx8-dc-tcon",
+		.of_match_table = dc_tc_dt_ids,
+	},
+};
-- 
2.34.1

