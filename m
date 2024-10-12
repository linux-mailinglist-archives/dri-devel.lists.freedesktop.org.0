Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B3E99B1A8
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 09:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC21D10E301;
	Sat, 12 Oct 2024 07:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="oTiWvN7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2052.outbound.protection.outlook.com [40.107.103.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D4310E303
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 07:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVCDkGJ1tH4E2KRwxqNMLwI/gku7j3d81o1bMPS6DneGu8HbUPme06pt8y2A9TO+OiY14J/7ZFMtcWocKoLJBCn8kvghH7qqymZBi/u0FWQp41pDduc0r2w86NETpdec8Qzfgtdl/IgYSWxBX5fRgyN4oMJmHnVGzv17KGbZ4hD+qa+Ys0LFzbHBZgWFAc6itySscwJBK1AcWN+f/857HNvgeGaRswp6NP0WcTh/zmlie/j0mCXBNGt7e/x3848d/ODMvpFcqI3ZkAPHuL9CoUKUG0GHRFE5TCzuYLhrxgDVuE1bKyBVZ8jECmapjwBSPvP3SDT/Ey66nlmc3WtuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fidcrZzGUNzVoJL2Q0O5cjkGTvOWG6+aHdEoSp/6b+c=;
 b=fgZ9bViccUW00pW+SDMvBJwd8XN9S1qBCN9OKq160PTp/7/yI9DyFBHhvI8/7AZgQEDR+ejq+dRIeK8tyCB8UQDmyKNBgVZT8m3jAc1kVSKdcNBXXyUUgqswT1/VKxY9R5k593Z23rqmmzrZD5vC67nI6OTDxzlWPZCheeLAQuq0pQfrm2R3En0OTFA37NsofNByF+KPpI+RWmKp7GjXcFI86mhr1FaDgx6z78z3oC4mRsHsfmgLV2AXJ5AuszlE7JGpr0NLFKk8yUVkWLjisvaF15tmYI+jVvB2FG7eLPosBQSHWT7vJkzqvrAnlEtM2Y8EbY34B0pSSfHVykJpIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fidcrZzGUNzVoJL2Q0O5cjkGTvOWG6+aHdEoSp/6b+c=;
 b=oTiWvN7I896Z6gFBo9GOVcon5NSoAzEgRq0h8HUuqSUKI0Av4eKzIJm6Hf0xcv1T8+phHRlzixnoZBYtvebHXTS69aEnC4AP8rdMSxEVB6Ztbv4tmUQhglIMPpwdbskWX8eI0rA+57mz5rPd7Q2Zn47BjyCW4w82/S45i9Zygh5nANDsJKxNVIgJdp/kM2k/2YBzYXPOV4PcuB2jXTsHsnF7GvRtoMwVLBrjxPI3uB1Xmfae1MYmXuYVo6YOA4AayU4oVWXfRxydDL0bdyS7Oe9g57Q52PeWrD6a80bjjBbVrwIZ/7/jrqCm0tOacEPeU0gx/T+69J8MIirxI9HuiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Sat, 12 Oct
 2024 07:37:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 07:37:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Date: Sat, 12 Oct 2024 15:35:40 +0800
Message-Id: <20241012073543.1388069-7-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012073543.1388069-1-victor.liu@nxp.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2ee53a-de67-45d3-b7ad-08dcea90beeb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3SYeYecyfxjzvWf9lpLShsANiJsHthetDIvZiMgsArVtcmS4SFzPjAFFdvD1?=
 =?us-ascii?Q?OPD9MKSOeViw/7q4GhLF0grj0AVVf9SqcqurSsog9WrWCG8obsv8wC7QJDyy?=
 =?us-ascii?Q?3L+wR49D+csvT69i6D7a2DF1xnZKL8/FHYTvVXXO29NCKCucgF5CAIxHq1ra?=
 =?us-ascii?Q?izWPNtPceao3zlfQ2cXH43CcNjSlH+e5GXEMiZYTFR/iKhi3A9ZwaI/JNdgK?=
 =?us-ascii?Q?RpdDCZ4F5zHLV9zUglWDJCkckCd2/2xJ+wIVZJUa+oOMPzdJcYomSDD2oYID?=
 =?us-ascii?Q?idkl7xj1bqWNF49VnolaAiL+jg7SohF6os5qBsmlGR+OLFo83S79m0aqdk5e?=
 =?us-ascii?Q?B+WikuYQv//T6xiISp0GixaLUvR5OAXU+TwYTMGeCq/iKqqB6e2ri4jP4vQz?=
 =?us-ascii?Q?Rrg3PUr50ey15+i3B8iacQpkEi8XUYYMa810Qi0d5zR9LaKQNiQIMKjcsIvm?=
 =?us-ascii?Q?5ShymQ111Fv2GMvzEiVg47fSsth2Mi9WCl5Nc1vwyHcOqKWSvNxuyXYdbu77?=
 =?us-ascii?Q?/dUm+Pz/Vnb6TG5jp50D7yhxHTJU2PgKxJRPKNN4D4aDvPHW+h0Yw7aSKqcm?=
 =?us-ascii?Q?IP4m53rfSBeufHMAUbBbAD6070QGQqmPJX2itVluJqqK6FPOnt+imB5cxzn/?=
 =?us-ascii?Q?DFgkhjOI9lpsejnM13M+HPyxqystWQ/He/tDGSEc7eRn5LZpv9WT4JxApEuM?=
 =?us-ascii?Q?8pNKjiIlpfWgxPGYW5NSJB+e7sMptXyB66Le1/FRBPQRyB7pqNlrQlilfwB3?=
 =?us-ascii?Q?FZxwUzgTsN7SasQ88oSMgPgWVyd1CpB2C72H7xLfGp1n9UlkeFumU7f6S0PA?=
 =?us-ascii?Q?gQNLJoV8gBUY7870paKC61Zjvzi8tY4rpFwF4k8/8z6mwxrsFOQqHMgnnjPD?=
 =?us-ascii?Q?o4Uurea+NEF6+QJHyfjk55Y46ZFVALpj97L8fv5NUUqsqlD9Mq3+F7B/PSxb?=
 =?us-ascii?Q?1akmNQm1UMGBjyOv2nyNsSC5P+nhABeQSeBa8KrM7L9zlr/+RuXI5PSCaUA3?=
 =?us-ascii?Q?nbTPzYP81EyyRQjLYi2Vzt8UIvMavpOKr7e/X/bu8v4dWGeqgjtsgCCeE7NG?=
 =?us-ascii?Q?1+OWtEw0ReuyGRgPPUIlURJxQ+XE+ImrVPpO7UbaYE3Cxp+k/wMPUR/5pBwh?=
 =?us-ascii?Q?vVfgza+av6QTFvGSSGpzjHoy/w7SW0g7WM6o2JuRMx9LCBaTrk0z/H4lBly0?=
 =?us-ascii?Q?4MIeSwUuGkRlI6BDWKKmgKV26z3qOC2ijDF295bcE3rPAY7Nai0yB+NpptGa?=
 =?us-ascii?Q?/deHEGPr3n5ZWczpJCY+fpymHK1Ifp4Weae2XCGubuq8AFPItpDd28RUxmbP?=
 =?us-ascii?Q?LPwpAecDXolsjaCtFganXPJAuesdxZOG6wlFO1mdGjTmfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a1lNmxCpsnjwItYNAS86ZL0JW3ucucr/zHxuDgBpGUZ5DOUqhTvmsJdxZW14?=
 =?us-ascii?Q?vTSe+W1fHjyoKiBdkM6cLtNKKEu18ZBnEdVqxdfxg//WF6Hw3u3TnW4yelyQ?=
 =?us-ascii?Q?m9SN3dxy6u2FlWFpR3lOtjTtdTp71iyxliT5BR5c0AhkHiy+of3TSDwRCzgT?=
 =?us-ascii?Q?3sQ/ml9clHdrBe9PD5LV0ohSTNQgeGIAWMbnnTZ3NUK1Bb8m9FLrotGVHylv?=
 =?us-ascii?Q?HF+7meOiGhf0U+17nWlpmA8qxxErpTmiXUZPCV0VAFnKPXlEstNuAdfjBPuf?=
 =?us-ascii?Q?9TtVXIE8aQpNAkBsPs6uBAV+Xo0Bx8kw7oPxSRS1JVm3BAHMUsxoNno+rFRE?=
 =?us-ascii?Q?gpHipd3AWQtBca4Q5OLMYrQxgdgKAqCoBcD2me6V+FalTE4niHEPKSd+MOi2?=
 =?us-ascii?Q?2DP+0fZW2ftSVMnnA0qIBiT9ys9Nt1eIknc9CK/rD1zNvQ5cRJfmVzICzeOb?=
 =?us-ascii?Q?KzVnIhSotWqf3gYu3gYKgFSx7QmyrJTsqYrzMpzY+BoUq3x/yhX6qnHCiHLE?=
 =?us-ascii?Q?VbMZawb3kMFxe2XMwBuNrhbmQP/p2EkB3tWfV8AGhddvWpHFC6aUf/MWvtSb?=
 =?us-ascii?Q?4chdHq7ndA4zEb8PR25HKCtfDzNgn6658K1qwpm6wi/vdQvcMkrYQpxGfmHt?=
 =?us-ascii?Q?gtfe2f11hTAEDZdZJL8/KDxeDPfHVrTOMvbWcFUau6qkSRDQDE3saKzWyv5e?=
 =?us-ascii?Q?Ak8KE0msEwnw1S0tOLm88X6KBtcBbCaoMWP6eObTG6BPZ0x/63OO9rKvgcLd?=
 =?us-ascii?Q?bpXnhF8mRXO0wzZeq+mSD9g2x9Svp5P64rYW0s3zvqzNQ7szh8LDXZvlQFht?=
 =?us-ascii?Q?nGoVAT17go6HccxFfCqnmJ7GrT2X+MK6bwWodtOwb5KFrTU3+LH1demV0Bo9?=
 =?us-ascii?Q?z3ovVUbE6DbANNzDv8JCW30vWs2st5a4+r8lDK7a9UUm/XXjmVcqjrKt+ela?=
 =?us-ascii?Q?Cii6XjtGzWc6N9W44GarcM6NZE2/qH41ePxUZe1fXcdgs+4LXm25TC3PKpe+?=
 =?us-ascii?Q?vC47ZY3cOsmPttxzrKBTdY3Ne4Cld9jLP0Wey5ZqBsOHkrcxHLVwuFrk0IZF?=
 =?us-ascii?Q?jfHaPCSPiPhw6wE4iHckpwej7ufsFoc1OaAHT6rMnOODLFwjo9xpnjgSKoq8?=
 =?us-ascii?Q?Vzz3vdRqrG8J+PXVXqpsqDqeCnxyYKS0CgL8A/COrPc2t8JB1oxl3Bp6e2v3?=
 =?us-ascii?Q?m3E1k5uRgSXXyK2LocUHH5vhHUv4ZKAUw7BhmbSOW5RAV0wG2BO6nZX8yLBr?=
 =?us-ascii?Q?bSWvGv/OFi3NtZC3+7/qdOxcLcx8cOSmU0VT5DrvBMBwd8qmK15KeRvnkYgR?=
 =?us-ascii?Q?amKvkOr3l9u7mZKtZBwlet80prL8/js05ofUD6e95KZF4pSMJS2XWZ++Tlox?=
 =?us-ascii?Q?ZFFPWGih4zwBFwCD3+wREhpZSEo0k9SUsesSwSvWfnMiER39JM15kuW52Ymy?=
 =?us-ascii?Q?PrkPBa6YNW1Ej/YxE9aGlPg3T6XhbEvrC7RUzAV6JY7IjEXJ0YZDe+OTjtGv?=
 =?us-ascii?Q?GfoSuGStcLuVmiDCaklDfSAKEX7EmCBtzTyI03DG1Bxo/XfvDg1og7t6lshh?=
 =?us-ascii?Q?bNqoKoaT28dobN/yicgwK7HkYpGLtjss6jP8zrSH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2ee53a-de67-45d3-b7ad-08dcea90beeb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 07:37:38.3483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bA7ZCgLYQv3T1Rj5BAuee5G7yPRVDAc0cyPrH3jsrkcUqx/KfOM7/fSEX04m/TWoMq2ygNCIc/6afHKlorV/IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6986
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

Add basic HDMI video output support. Currently, only RGB888 output
pixel format is supported.  At the LVDS input side, the driver
supports single LVDS link and dual LVDS links with "jeida-24" LVDS
mapping.

Product link:
https://www.ite.com.tw/en/product/cate1/IT6263

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Add AVI inforframe support.  (Maxime)
* Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
* Rename it6263_reset() to it6263_hw_reset().  (Biju)
* Check number of LVDS link data lanes.  (Biju)

 drivers/gpu/drm/bridge/Kconfig      |   8 +
 drivers/gpu/drm/bridge/Makefile     |   1 +
 drivers/gpu/drm/bridge/ite-it6263.c | 919 ++++++++++++++++++++++++++++
 3 files changed, 928 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 3eb955333c80..93f99682a090 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,6 +90,14 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
+config DRM_ITE_IT6263
+	tristate "ITE IT6263 LVDS/HDMI bridge"
+	depends on OF
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  ITE IT6263 LVDS to HDMI bridge chip driver.
+
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 7df87b582dca..f3776dd473fd 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
+obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
 obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
new file mode 100644
index 000000000000..9b3318792f15
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -0,0 +1,919 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/hdmi.h>
+#include <linux/i2c.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+
+/* -----------------------------------------------------------------------------
+ * LVDS registers
+ */
+
+/* LVDS software reset registers */
+#define LVDS_REG_05			0x05
+#define  REG_SOFT_P_RST			BIT(1)
+
+/* LVDS system configuration registers */
+/* 0x0b */
+#define LVDS_REG_0B			0x0b
+#define  REG_SSC_PCLK_RF		BIT(0)
+#define  REG_LVDS_IN_SWAP		BIT(1)
+
+/* LVDS test pattern gen control registers */
+/* 0x2c */
+#define LVDS_REG_2C			0x2c
+#define  REG_COL_DEP			GENMASK(1, 0)
+#define  BIT8				FIELD_PREP(REG_COL_DEP, 2)
+#define  OUT_MAP			BIT(4)
+#define  JEIDA				0
+#define  REG_DESSC_ENB			BIT(6)
+#define  DMODE				BIT(7)
+#define  DISO				BIT(7)
+#define  SISO				0
+
+#define LVDS_REG_3C			0x3c
+#define LVDS_REG_3F			0x3f
+#define LVDS_REG_47			0x47
+#define LVDS_REG_48			0x48
+#define LVDS_REG_4F			0x4f
+#define LVDS_REG_52			0x52
+
+/* -----------------------------------------------------------------------------
+ * HDMI registers are separated into three banks:
+ * 1) HDMI register common bank: 0x00 ~ 0x2f
+ */
+
+/* HDMI genernal registers */
+#define HDMI_REG_SW_RST			0x04
+#define  SOFTREF_RST			BIT(5)
+#define  SOFTA_RST			BIT(4)
+#define  SOFTV_RST			BIT(3)
+#define  AUD_RST			BIT(2)
+#define  HDCP_RST			BIT(0)
+#define  HDMI_RST_ALL			(SOFTREF_RST | SOFTA_RST | SOFTV_RST | \
+					 AUD_RST | HDCP_RST)
+
+#define HDMI_REG_SYS_STATUS		0x0e
+#define  HPDETECT			BIT(6)
+#define  TXVIDSTABLE			BIT(4)
+
+#define HDMI_REG_BANK_CTRL		0x0f
+#define  REG_BANK_SEL			BIT(0)
+
+/* HDMI System DDC control registers */
+#define HDMI_REG_DDC_MASTER_CTRL	0x10
+#define  MASTER_SEL_HOST		BIT(0)
+
+#define HDMI_REG_DDC_HEADER		0x11
+
+#define HDMI_REG_DDC_REQOFF		0x12
+#define HDMI_REG_DDC_REQCOUNT		0x13
+#define HDMI_REG_DDC_EDIDSEG		0x14
+
+#define HDMI_REG_DDC_CMD		0x15
+#define  DDC_CMD_EDID_READ		0x3
+#define  DDC_CMD_FIFO_CLR		0x9
+
+#define HDMI_REG_DDC_STATUS		0x16
+#define  DDC_DONE			BIT(7)
+#define  DDC_NOACK			BIT(5)
+#define  DDC_WAITBUS			BIT(4)
+#define  DDC_ARBILOSE			BIT(3)
+#define  DDC_ERROR			(DDC_NOACK | DDC_WAITBUS | DDC_ARBILOSE)
+
+#define HDMI_DDC_FIFO_BYTES		32
+#define HDMI_REG_DDC_READFIFO		0x17
+#define HDMI_REG_LVDS_PORT		0x1d /* LVDS input control I2C addr */
+#define HDMI_REG_LVDS_PORT_EN		0x1e
+#define LVDS_INPUT_CTRL_I2C_ADDR	0x33
+
+/* -----------------------------------------------------------------------------
+ * 2) HDMI register bank0: 0x30 ~ 0xff
+ */
+
+/* HDMI AFE registers */
+#define HDMI_REG_AFE_DRV_CTRL		0x61
+#define  AFE_DRV_PWD			BIT(5)
+#define  AFE_DRV_RST			BIT(4)
+
+#define HDMI_REG_AFE_XP_CTRL		0x62
+#define  AFE_XP_GAINBIT			BIT(7)
+#define  AFE_XP_ER0			BIT(4)
+#define  AFE_XP_RESETB			BIT(3)
+
+#define HDMI_REG_AFE_ISW_CTRL		0x63
+
+#define HDMI_REG_AFE_IP_CTRL		0x64
+#define  AFE_IP_GAINBIT			BIT(7)
+#define  AFE_IP_ER0			BIT(3)
+#define  AFE_IP_RESETB			BIT(2)
+
+/* HDMI input data format registers */
+#define HDMI_REG_INPUT_MODE		0x70
+#define  IN_RGB				0x00
+
+/* HDMI general control registers */
+#define HDMI_REG_HDMI_MODE		0xc0
+#define  TX_HDMI_MODE			BIT(0)
+
+#define HDMI_REG_GCP			0xc1
+#define  AVMUTE				BIT(0)
+#define  HDMI_COLOR_DEPTH		GENMASK(6, 4)
+#define  HDMI_COLOR_DEPTH_24		FIELD_PREP(HDMI_COLOR_DEPTH, 4)
+
+#define HDMI_REG_PKT_GENERAL_CTRL	0xc6
+#define  ENABLE_PKT			BIT(0)
+#define  REPEAT_PKT			BIT(1)
+
+/* -----------------------------------------------------------------------------
+ * 3) HDMI register bank1: 0x130 ~ 0x1ff (HDMI packet registers)
+ */
+
+/* AVI packet registers */
+#define HDMI_REG_AVI_DB1		0x158
+#define HDMI_REG_AVI_DB2		0x159
+#define HDMI_REG_AVI_DB3		0x15a
+#define HDMI_REG_AVI_DB4		0x15b
+#define HDMI_REG_AVI_DB5		0x15c
+#define HDMI_REG_AVI_CSUM		0x15d
+#define HDMI_REG_AVI_DB6		0x15e
+#define HDMI_REG_AVI_DB7		0x15f
+#define HDMI_REG_AVI_DB8		0x160
+#define HDMI_REG_AVI_DB9		0x161
+#define HDMI_REG_AVI_DB10		0x162
+#define HDMI_REG_AVI_DB11		0x163
+#define HDMI_REG_AVI_DB12		0x164
+#define HDMI_REG_AVI_DB13		0x165
+
+#define HDMI_AVI_DB_CHUNK1_SIZE		(HDMI_REG_AVI_DB5 - HDMI_REG_AVI_DB1 + 1)
+#define HDMI_AVI_DB_CHUNK2_SIZE		(HDMI_REG_AVI_DB13 - HDMI_REG_AVI_DB6 + 1)
+
+#define MAX_PIXEL_CLOCK_KHZ		150000
+#define HIGH_PIXEL_CLOCK_KHZ		80000
+
+struct it6263 {
+	struct device *dev;
+	struct i2c_client *hdmi_i2c;
+	struct i2c_client *lvds_i2c;
+	struct regmap *hdmi_regmap;
+	struct regmap *lvds_regmap;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct drm_connector connector;
+	struct gpio_desc *reset_gpio;
+	u8 lvds_link_num_dlanes;
+	bool lvds_dual_link;
+	bool lvds_link12_swap;
+};
+
+static inline struct it6263 *bridge_to_it6263(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct it6263, bridge);
+}
+
+static inline struct it6263 *connector_to_it6263(struct drm_connector *conn)
+{
+	return container_of(conn, struct it6263, connector);
+}
+
+static bool it6263_hdmi_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HDMI_REG_SW_RST:
+	case HDMI_REG_BANK_CTRL:
+	case HDMI_REG_DDC_MASTER_CTRL:
+	case HDMI_REG_DDC_HEADER:
+	case HDMI_REG_DDC_REQOFF:
+	case HDMI_REG_DDC_REQCOUNT:
+	case HDMI_REG_DDC_EDIDSEG:
+	case HDMI_REG_DDC_CMD:
+	case HDMI_REG_LVDS_PORT:
+	case HDMI_REG_LVDS_PORT_EN:
+	case HDMI_REG_AFE_DRV_CTRL:
+	case HDMI_REG_AFE_XP_CTRL:
+	case HDMI_REG_AFE_ISW_CTRL:
+	case HDMI_REG_AFE_IP_CTRL:
+	case HDMI_REG_INPUT_MODE:
+	case HDMI_REG_HDMI_MODE:
+	case HDMI_REG_GCP:
+	case HDMI_REG_PKT_GENERAL_CTRL:
+	case HDMI_REG_AVI_DB1:
+	case HDMI_REG_AVI_DB2:
+	case HDMI_REG_AVI_DB3:
+	case HDMI_REG_AVI_DB4:
+	case HDMI_REG_AVI_DB5:
+	case HDMI_REG_AVI_CSUM:
+	case HDMI_REG_AVI_DB6:
+	case HDMI_REG_AVI_DB7:
+	case HDMI_REG_AVI_DB8:
+	case HDMI_REG_AVI_DB9:
+	case HDMI_REG_AVI_DB10:
+	case HDMI_REG_AVI_DB11:
+	case HDMI_REG_AVI_DB12:
+	case HDMI_REG_AVI_DB13:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_hdmi_readable_reg(struct device *dev, unsigned int reg)
+{
+	if (it6263_hdmi_writeable_reg(dev, reg))
+		return true;
+
+	switch (reg) {
+	case HDMI_REG_SYS_STATUS:
+	case HDMI_REG_DDC_STATUS:
+	case HDMI_REG_DDC_READFIFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_hdmi_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HDMI_REG_SW_RST:
+	case HDMI_REG_SYS_STATUS:
+	case HDMI_REG_DDC_STATUS:
+	case HDMI_REG_DDC_READFIFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_range_cfg it6263_hdmi_range_cfg = {
+	.range_min = 0x00,
+	.range_max = HDMI_REG_AVI_DB13,
+	.selector_reg = HDMI_REG_BANK_CTRL,
+	.selector_mask = REG_BANK_SEL,
+	.selector_shift = 0,
+	.window_start = 0x00,
+	.window_len = 0x100,
+};
+
+static const struct regmap_config it6263_hdmi_regmap_config = {
+	.name = "it6263-hdmi",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.writeable_reg = it6263_hdmi_writeable_reg,
+	.readable_reg = it6263_hdmi_readable_reg,
+	.volatile_reg = it6263_hdmi_volatile_reg,
+	.max_register = HDMI_REG_AVI_DB13,
+	.ranges = &it6263_hdmi_range_cfg,
+	.num_ranges = 1,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static bool it6263_lvds_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LVDS_REG_05:
+	case LVDS_REG_0B:
+	case LVDS_REG_2C:
+	case LVDS_REG_3C:
+	case LVDS_REG_3F:
+	case LVDS_REG_47:
+	case LVDS_REG_48:
+	case LVDS_REG_4F:
+	case LVDS_REG_52:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_lvds_readable_reg(struct device *dev, unsigned int reg)
+{
+	return it6263_lvds_writeable_reg(dev, reg);
+}
+
+static bool it6263_lvds_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == LVDS_REG_05;
+}
+
+static const struct regmap_config it6263_lvds_regmap_config = {
+	.name = "it6263-lvds",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.writeable_reg = it6263_lvds_writeable_reg,
+	.readable_reg = it6263_lvds_readable_reg,
+	.volatile_reg = it6263_lvds_volatile_reg,
+	.max_register = LVDS_REG_52,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static const char * const it6263_supplies[] = {
+	"ivdd", "ovdd", "txavcc18", "txavcc33", "pvcc1", "pvcc2",
+	"avcc", "anvdd", "apvdd"
+};
+
+static int it6263_parse_dt(struct it6263 *it)
+{
+	struct device *dev = it->dev;
+	struct device_node *port0, *port1;
+	int ret;
+
+	ret = of_property_read_u8(dev->of_node, "ite,lvds-link-num-data-lanes",
+				  &it->lvds_link_num_dlanes);
+	if (ret) {
+		dev_err(dev, "failed to get LVDS link number of data lanes: %d\n",
+			ret);
+		return ret;
+	}
+
+	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
+	if (IS_ERR(it->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
+				     "failed to get next bridge\n");
+
+	port0 = of_graph_get_port_by_id(dev->of_node, 0);
+	port1 = of_graph_get_port_by_id(dev->of_node, 1);
+	if (port0 && port1) {
+		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
+		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
+			it->lvds_dual_link = true;
+			it->lvds_link12_swap = true;
+		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
+			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
+			it->lvds_dual_link = true;
+		}
+
+		if (!it->lvds_dual_link) {
+			dev_err(dev,
+				"failed to get LVDS dual link pixel order\n");
+			ret = -EINVAL;
+		}
+	} else if (port1) {
+		ret = -EINVAL;
+		dev_err(dev, "single input LVDS port1 is not supported\n");
+	} else if (!port0) {
+		ret = -EINVAL;
+		dev_err(dev, "no input LVDS port\n");
+	}
+
+	of_node_put(port0);
+	of_node_put(port1);
+
+	return ret;
+}
+
+static inline void it6263_hw_reset(struct it6263 *it)
+{
+	if (!it->reset_gpio)
+		return;
+
+	gpiod_set_value_cansleep(it->reset_gpio, 0);
+	fsleep(1000);
+	gpiod_set_value_cansleep(it->reset_gpio, 1);
+	/* The chip maker says the low pulse should be at least 40ms. */
+	fsleep(40000);
+	gpiod_set_value_cansleep(it->reset_gpio, 0);
+	/* addtional time to wait the high voltage to be stable */
+	fsleep(5000);
+}
+
+static inline int it6263_lvds_set_i2c_addr(struct it6263 *it)
+{
+	int ret;
+
+	ret = regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT,
+			   LVDS_INPUT_CTRL_I2C_ADDR << 1);
+	if (ret)
+		return ret;
+
+	return regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT_EN, BIT(0));
+}
+
+static inline void it6263_lvds_reset(struct it6263 *it)
+{
+	/* AFE PLL reset */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), 0x0);
+	fsleep(1000);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), BIT(0));
+
+	/* software pixel clock domain reset */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST,
+			  REG_SOFT_P_RST);
+	fsleep(1000);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST, 0x0);
+	fsleep(10000);
+}
+
+static inline void it6263_lvds_set_interface(struct it6263 *it)
+{
+	/* color depth */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
+	/* output mapping */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
+
+	if (it->lvds_dual_link) {
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), BIT(1));
+	} else {
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, SISO);
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), 0);
+	}
+}
+
+static inline void it6263_lvds_set_afe(struct it6263 *it)
+{
+	regmap_write(it->lvds_regmap, LVDS_REG_3C, 0xaa);
+	regmap_write(it->lvds_regmap, LVDS_REG_3F, 0x02);
+	regmap_write(it->lvds_regmap, LVDS_REG_47, 0xaa);
+	regmap_write(it->lvds_regmap, LVDS_REG_48, 0x02);
+	regmap_write(it->lvds_regmap, LVDS_REG_4F, 0x11);
+
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_SSC_PCLK_RF,
+			  REG_SSC_PCLK_RF);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, 0x07, 0);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_DESSC_ENB,
+			  REG_DESSC_ENB);
+}
+
+static inline void it6263_lvds_sys_cfg(struct it6263 *it)
+{
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_LVDS_IN_SWAP,
+			  it->lvds_link12_swap ? REG_LVDS_IN_SWAP : 0);
+}
+
+static inline void it6263_lvds_config(struct it6263 *it)
+{
+	it6263_lvds_reset(it);
+	it6263_lvds_set_interface(it);
+	it6263_lvds_set_afe(it);
+	it6263_lvds_sys_cfg(it);
+}
+
+static inline void it6263_hdmi_config(struct it6263 *it)
+{
+	regmap_write(it->hdmi_regmap, HDMI_REG_SW_RST, HDMI_RST_ALL);
+	regmap_write(it->hdmi_regmap, HDMI_REG_INPUT_MODE, IN_RGB);
+	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, HDMI_COLOR_DEPTH,
+			  HDMI_COLOR_DEPTH_24);
+}
+
+static enum drm_connector_status it6263_detect(struct it6263 *it)
+{
+	unsigned int val;
+
+	regmap_read(it->hdmi_regmap, HDMI_REG_SYS_STATUS, &val);
+	if (val & HPDETECT)
+		return connector_status_connected;
+	else
+		return connector_status_disconnected;
+}
+
+static enum drm_connector_status
+it6263_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct it6263 *it = connector_to_it6263(connector);
+
+	return it6263_detect(it);
+}
+
+static const struct drm_connector_funcs it6263_connector_funcs = {
+	.detect = it6263_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int it6263_read_edid(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct it6263 *it = data;
+	struct regmap *regmap = it->hdmi_regmap;
+	unsigned int start = (block % 2) * EDID_LENGTH;
+	unsigned int segment = block >> 1;
+	unsigned int count, val;
+	int ret;
+
+	regmap_write(regmap, HDMI_REG_DDC_MASTER_CTRL, MASTER_SEL_HOST);
+	regmap_write(regmap, HDMI_REG_DDC_HEADER, DDC_ADDR << 1);
+	regmap_write(regmap, HDMI_REG_DDC_EDIDSEG, segment);
+
+	while (len) {
+		/* clear DDC FIFO */
+		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_FIFO_CLR);
+
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS,
+					       val, val & DDC_DONE,
+					       2000, 10000);
+		if (ret) {
+			dev_err(it->dev, "failed to clear DDC FIFO:%d\n", ret);
+			return ret;
+		}
+
+		count = len > HDMI_DDC_FIFO_BYTES ? HDMI_DDC_FIFO_BYTES : len;
+
+		/* fire the read command */
+		regmap_write(regmap, HDMI_REG_DDC_REQOFF, start);
+		regmap_write(regmap, HDMI_REG_DDC_REQCOUNT, count);
+		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_EDID_READ);
+
+		start += count;
+		len -= count;
+
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS, val,
+					       val & (DDC_DONE | DDC_ERROR),
+					       20000, 250000);
+		if (ret && !(val & DDC_ERROR)) {
+			dev_err(it->dev, "failed to read EDID:%d\n", ret);
+			return ret;
+		}
+
+		if (val & DDC_ERROR) {
+			dev_err(it->dev, "DDC error\n");
+			return -EIO;
+		}
+
+		/* cache to buffer */
+		for (; count > 0; count--) {
+			regmap_read(regmap, HDMI_REG_DDC_READFIFO, &val);
+			*(buf++) = val;
+		}
+	}
+
+	return 0;
+}
+
+static int it6263_connector_get_modes(struct drm_connector *connector)
+{
+	struct it6263 *it = connector_to_it6263(connector);
+	const struct drm_edid *drm_edid;
+	int count;
+
+	drm_edid = drm_edid_read_custom(connector, it6263_read_edid, it);
+
+	drm_edid_connector_update(connector, drm_edid);
+	count = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(drm_edid);
+
+	return count;
+}
+
+static const struct drm_connector_helper_funcs it6263_connector_helper_funcs = {
+	.get_modes = it6263_connector_get_modes,
+};
+
+static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+
+	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0;
+}
+
+static void
+it6263_bridge_atomic_disable(struct drm_bridge *bridge,
+			     struct drm_bridge_state *old_bridge_state)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, AVMUTE, AVMUTE);
+	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
+	regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
+		     AFE_DRV_RST | AFE_DRV_PWD);
+}
+
+static void
+it6263_hdmi_avi_infoframe_configure(struct it6263 *it,
+				    struct drm_connector *connector,
+				    const struct drm_display_mode *mode)
+{
+	struct hdmi_avi_infoframe frame;
+	u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
+	int ret;
+
+	ret = drm_hdmi_avi_infoframe_from_display_mode(&frame, connector, mode);
+	if (ret) {
+		dev_err(it->dev, "failed to setup AVI infoframe: %d\n", ret);
+		return;
+	}
+
+	ret = hdmi_avi_infoframe_pack(&frame, buf, sizeof(buf));
+	if (ret < 0) {
+		dev_err(it->dev, "failed to pack infoframe: %d\n", ret);
+		return;
+	}
+
+	/* write the first AVI infoframe data byte chunk(DB1-DB5) */
+	ret = regmap_bulk_write(it->hdmi_regmap, HDMI_REG_AVI_DB1,
+				&buf[HDMI_INFOFRAME_HEADER_SIZE],
+				HDMI_AVI_DB_CHUNK1_SIZE);
+	if (ret) {
+		dev_err(it->dev, "failed to write the 1st AVI infoframe data byte chunk: %d\n",
+			ret);
+		return;
+	}
+
+	/* write the second AVI infoframe data byte chunk(DB6-DB13) */
+	ret = regmap_bulk_write(it->hdmi_regmap, HDMI_REG_AVI_DB6,
+				&buf[HDMI_INFOFRAME_HEADER_SIZE +
+				     HDMI_AVI_DB_CHUNK1_SIZE],
+				HDMI_AVI_DB_CHUNK2_SIZE);
+	if (ret) {
+		dev_err(it->dev, "failed to write the 2nd AVI infoframe data byte chunk: %d\n",
+			ret);
+		return;
+	}
+
+	ret = regmap_write(it->hdmi_regmap, HDMI_REG_AVI_CSUM, buf[3]);
+	if (ret)
+		dev_err(it->dev, "failed to set AVI infoframe checksum: %d\n",
+			ret);
+}
+
+static void
+it6263_bridge_atomic_enable(struct drm_bridge *bridge,
+			    struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct it6263 *it = bridge_to_it6263(bridge);
+	const struct drm_crtc_state *crtc_state;
+	struct regmap *regmap = it->hdmi_regmap;
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	bool is_stable = false;
+	struct drm_crtc *crtc;
+	unsigned int val;
+	bool pclk_high;
+	int i, ret;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	mode = &crtc_state->adjusted_mode;
+
+	regmap_write(regmap, HDMI_REG_HDMI_MODE, TX_HDMI_MODE);
+
+	it6263_hdmi_avi_infoframe_configure(it, connector, mode);
+
+	/* HDMI AFE setup */
+	pclk_high = mode->clock > HIGH_PIXEL_CLOCK_KHZ ? true : false;
+	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, AFE_DRV_RST);
+	if (pclk_high)
+		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
+			     AFE_XP_GAINBIT | AFE_XP_RESETB);
+	else
+		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
+			     AFE_XP_ER0 | AFE_XP_RESETB);
+	regmap_write(regmap, HDMI_REG_AFE_ISW_CTRL, 0x10);
+	if (pclk_high)
+		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
+			     AFE_IP_GAINBIT | AFE_IP_RESETB);
+	else
+		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
+			     AFE_IP_ER0 | AFE_IP_RESETB);
+
+	/* HDMI software video reset */
+	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, SOFTV_RST);
+	fsleep(1000);
+	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, 0);
+
+	/* reconfigure LVDS and retry several times in case video is instable */
+	for (i = 0; i < 3; i++) {
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_SYS_STATUS, val,
+					       val & TXVIDSTABLE,
+					       20000, 500000);
+		if (!ret) {
+			is_stable = true;
+			break;
+		}
+
+		it6263_lvds_config(it);
+	}
+
+	if (!is_stable)
+		dev_warn(it->dev, "failed to wait for video stable\n");
+
+	/* HDMI AFE reset release and power up */
+	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, 0);
+
+	regmap_write_bits(regmap, HDMI_REG_GCP, AVMUTE, 0);
+
+	regmap_write(regmap, HDMI_REG_PKT_GENERAL_CTRL, ENABLE_PKT | REPEAT_PKT);
+}
+
+static enum drm_mode_status
+it6263_bridge_mode_valid(struct drm_bridge *bridge,
+			 const struct drm_display_info *info,
+			 const struct drm_display_mode *mode)
+{
+	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? MODE_CLOCK_HIGH : MODE_OK;
+}
+
+static int it6263_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	int ret;
+
+	ret = drm_bridge_attach(bridge->encoder, it->next_bridge, bridge,
+				flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret < 0)
+		return ret;
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
+	it->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
+			       DRM_CONNECTOR_POLL_DISCONNECT;
+
+	ret = drm_connector_init(bridge->dev, &it->connector,
+				 &it6263_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(&it->connector,
+				 &it6263_connector_helper_funcs);
+	drm_connector_attach_encoder(&it->connector, bridge->encoder);
+
+	return 0;
+}
+
+static enum drm_connector_status it6263_bridge_detect(struct drm_bridge *bridge)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	return it6263_detect(it);
+}
+
+static const struct drm_edid *
+it6263_bridge_edid_read(struct drm_bridge *bridge,
+			struct drm_connector *connector)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	return drm_edid_read_custom(connector, it6263_read_edid, it);
+}
+
+static u32 *
+it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	if (it->lvds_link_num_dlanes == 3)
+		return NULL;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
+static const struct drm_bridge_funcs it6263_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.attach = it6263_bridge_attach,
+	.mode_valid = it6263_bridge_mode_valid,
+	.atomic_disable = it6263_bridge_atomic_disable,
+	.atomic_enable = it6263_bridge_atomic_enable,
+	.atomic_check = it6263_bridge_atomic_check,
+	.detect = it6263_bridge_detect,
+	.edid_read = it6263_bridge_edid_read,
+	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,
+};
+
+static int it6263_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct it6263 *it;
+	int ret;
+
+	it = devm_kzalloc(dev, sizeof(*it), GFP_KERNEL);
+	if (!it)
+		return -ENOMEM;
+
+	it->dev = dev;
+	it->hdmi_i2c = client;
+
+	it->hdmi_regmap = devm_regmap_init_i2c(client,
+					       &it6263_hdmi_regmap_config);
+	if (IS_ERR(it->hdmi_regmap))
+		return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
+				     "failed to init I2C regmap for HDMI\n");
+
+	it->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(it->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
+				     "failed to get reset gpio\n");
+
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplies),
+					     it6263_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get power supplies\n");
+
+	ret = it6263_parse_dt(it);
+	if (ret)
+		return ret;
+
+	it6263_hw_reset(it);
+
+	ret = it6263_lvds_set_i2c_addr(it);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set I2C addr\n");
+
+	it->lvds_i2c = devm_i2c_new_dummy_device(dev, client->adapter,
+						 LVDS_INPUT_CTRL_I2C_ADDR);
+	if (IS_ERR(it->lvds_i2c))
+		dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
+			      "failed to allocate I2C device for LVDS\n");
+
+	it->lvds_regmap = devm_regmap_init_i2c(it->lvds_i2c,
+					       &it6263_lvds_regmap_config);
+	if (IS_ERR(it->lvds_regmap))
+		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
+				     "failed to init I2C regmap for LVDS\n");
+
+	it6263_lvds_config(it);
+	it6263_hdmi_config(it);
+
+	i2c_set_clientdata(client, it);
+
+	it->bridge.funcs = &it6263_bridge_funcs;
+	it->bridge.of_node = dev->of_node;
+	it->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	drm_bridge_add(&it->bridge);
+
+	return 0;
+}
+
+static void it6263_remove(struct i2c_client *client)
+{
+	struct it6263 *it = i2c_get_clientdata(client);
+
+	drm_bridge_remove(&it->bridge);
+}
+
+static const struct of_device_id it6263_of_match[] = {
+	{ .compatible = "ite,it6263", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, it6263_of_match);
+
+static const struct i2c_device_id it6263_i2c_ids[] = {
+	{ "it6263", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
+
+static struct i2c_driver it6263_driver = {
+	.probe = it6263_probe,
+	.remove = it6263_remove,
+	.driver = {
+		.name = "it6263",
+		.of_match_table = it6263_of_match,
+	},
+	.id_table = it6263_i2c_ids,
+};
+module_i2c_driver(it6263_driver);
+
+MODULE_DESCRIPTION("ITE Tech. Inc. IT6263 LVDS/HDMI bridge");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

