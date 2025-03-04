Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44270A4D62E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 09:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAD710E513;
	Tue,  4 Mar 2025 08:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DAcIK8LT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32C610E513
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 08:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abIIPGam456NQWNIAW8AUhq8AmJGz4K2B2GkCv4sJSJBpmzWicUlNuy1+zil3z/rzxINe95pGFVdaO/YAwGVzO4xQs4drHCm2LNT60/ntv8FO4zl5IHawoFX4LpNy1jOmyFICldxkezJ1+x5io15dLd9v7TukbSShjWQsBgk/8U9OQXzBOwu/mfPs3lV/clKH5UOmK9QO6hdNCejZK+Jjc3Jx1mcjJqTwR4TR1xJtInj48I0Tmni6Q+orWA0wUYr8Pf2Bw/viQ+XFNQCV27JznM6STj0ZkkxkW3Qqu59BaUWzu0DxsDHGJfMmep8Rll2UxetkcJtREky9PEdFUUPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lx+ewCEYz5pGnVNc0ec9dUYSLkKdcarWZyqc+1qGA60=;
 b=EdaJYwjdaOgMRl3AyRLzFq6lKm+tBSN+xr59RLtqHUawSfl3aUgnxc0cMtYpTrKyMYsLnbwFZSK1jOWtmkQXlpyXUzxfPD+YQWrIHQxVG63vZjWE+bGlC34Y4ik5t0fcLpYO5I3wZ5rb8AcIx/xYk8TpgXfJTucOBjpg7ZIT95oDIHq9oi3omf6cWxGqvzbv9/N5erzGz42pUyQcAkJhfH8hJvtsmbVytiKOuEpRT1Eko/+LsRQH9vbrEA2wfOiymYxgq9MdobEJf7VfZAIGXG4c8VY1LgPEzgmuN2HC1p44ldHtbl0POQVk3HjDsrijp2sGwYUbiS2J7QW7FvBzoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lx+ewCEYz5pGnVNc0ec9dUYSLkKdcarWZyqc+1qGA60=;
 b=DAcIK8LTEwHpf4/dDFQ1QwglBLXn4F1pBPxtckuFXsS3QqT6GOqHMx5MCN3aHBr3AtIAQH++n2hfP1FAT8B2KN8gUwsXnHPwPQCaJvrKBNi99a9e60AIRFEiZ56acsndHiyNw3h7mMffi1LcakhNg0u1zzNEllGKb5Gl8aWZf3fd5ToklPEvtdpHp5e4o2f73rpT3/1Fvgzpx2eA45ejw6oAmTni/ywWGrb4zjT6GTjRsygRmFMJ4buQRtJE914jPjXd2FJciMHdvvSbLODMrPfgdX6CdEsPQ/VGYZBVNOkAI2eApSgFY6thRyyT84KP+pmR5W7lKqp/+pjeyni5fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAWPR04MB9720.eurprd04.prod.outlook.com (2603:10a6:102:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 08:24:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 08:24:02 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, victor.liu@nxp.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, peng.fan@nxp.com, alexander.stein@ew.tq-group.com
Subject: [PATCH v5 2/2] drm/bridge: imx: Add i.MX93 parallel display format
 configuration support
Date: Tue,  4 Mar 2025 16:24:34 +0800
Message-Id: <20250304082434.834031-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304082434.834031-1-victor.liu@nxp.com>
References: <20250304082434.834031-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAWPR04MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f67970-7113-4fe6-8bcc-08dd5af5eb87
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sLq4fOiEdGPKoGwqjE6BmSJuHznt65IxwmGRbv3lT9HCQC/saY3mJ2e1lNjO?=
 =?us-ascii?Q?rXARPI9BjS4Pqfi9SkouztfJ/n919trBJM/SuNkcrDW70yCw2uIjenNr/N95?=
 =?us-ascii?Q?2ahQ5woUJozBTCZ4V6Gm/IxPOb99jA8MaZ8Q4H45E1zdEKsdpw4yClwRDqvl?=
 =?us-ascii?Q?vBJCq4J2lXlLqR7H7vm/BfYFzB61Ejv9BkhTzPe04jFBWOoFZHWchnAiXrAf?=
 =?us-ascii?Q?P0XR/TuqANqefKefPWoFjT9LB3xpWQ47X+SeSJbjAS7TSPFzoJIAPLG9ESCS?=
 =?us-ascii?Q?6fV+dodSIJIeyUuV5XJHP9JiFJudazXafIvNWjxgB1sHyCJKos2IC/HODeOy?=
 =?us-ascii?Q?KMXzv0IGdfdGwxTkTqw9odFPN4JFHbx3yGQcCUbGY/DAC7OBDwhWFEA2Z00W?=
 =?us-ascii?Q?6sMoxT+UXdJuGaLYrk5xGtBDzBucv5HEK6J8FMBejhEm1tIeKDaECUwhWF6A?=
 =?us-ascii?Q?O8EvUFG0NSMxvG1LmgCWGzoN6k12HCv8OLYq0t2UwOKCc+TQ3jfvZY4hALCx?=
 =?us-ascii?Q?nmghWP7839I3woeW6rQMPBO43BR9et3wcKPqSD8HcU6K5BArvDkkaE0igx9P?=
 =?us-ascii?Q?rERbpjLGITGw3oXeBcPZ8+/hjjXv6T4YdVjlGh0VwPOjwRq+SEXo+H6zRMiU?=
 =?us-ascii?Q?t8ireUS+uHXXGBBVpM+d6YOJ+f7uQPe/NduYaaqVASwenwF/ise5Rjd21Sfv?=
 =?us-ascii?Q?JCxx9EzS+7TzDnnlKQ0eUk+l3VOWLAlTu77J4033/3SvEHfQcctoAC3HTan/?=
 =?us-ascii?Q?6DXR9JFvN2XrDD2ZOIm2kNxN5mFcRjJCuKUJLU+Nc2FUW+P3xaekn5kpeBnh?=
 =?us-ascii?Q?Q6G5/BDtYmO2Rqs3xURlvQuX5hAV4/RUdNhYvEY4bK75bzvh4hxSYDZFdaY0?=
 =?us-ascii?Q?hxyel7o58cwTEioXZB6HWvbshguIpHaTRkjP9CKfSFuIlATOv3OGSuj7HxG5?=
 =?us-ascii?Q?xagbRYFzbJdapWhiJw+LSFu+2tV+WXplBmN1GIf6vMYax11uQjAYt6csP06P?=
 =?us-ascii?Q?CjM7WyyNOiPRqIpyXrEe/7O8hgEOwEViDfC40pugNw5x6ddmwJEK4jvj0e40?=
 =?us-ascii?Q?RAPl2CDwWhmHQEuUjDk6Pwo2LnLLQEmu69V+L4c55dyjV4FQo+e3S5wNqD02?=
 =?us-ascii?Q?58c02oimCeVtrL6Y1XtEh8ZYibrgCYlzjWqgNUzRf7S0/14GNiSfyjMXcPEt?=
 =?us-ascii?Q?QyqAON2tXU01Sf4OmUz27ja5e2R9yip1YAcJMDvLxrVTYy99Ba11CO08zxNd?=
 =?us-ascii?Q?84ZrLQh3aPWS5Xb8jxnJJDw38nNBV8+ppCzzpYfhaaVDpzWCqhwLgRj/wNDT?=
 =?us-ascii?Q?HZeNLvyMsbLv8lZ6UrR2wfg4xHvV476pjeQekpfYWYKq7Y0GmK5duTC7ve5A?=
 =?us-ascii?Q?XMiBKT3eLlrEg+kawJbmclisDA4TtG+Urs/Vb7CXgX2qILxECUGmyId68DH3?=
 =?us-ascii?Q?CKDf7fxGB1KDgWZOGMPT3UqvsbSKAJIN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fzPYmP9P5G8SLG26dHwnBlaVB4yLzsAyMsoMXIT2y9k0DzRDZ2uix2drLaBi?=
 =?us-ascii?Q?f7Z0WYGWon8sWKqQ1u0ojBmFIJ+j5FllWnqs7BpmpyOzLJI+C7WZEr8CRYg3?=
 =?us-ascii?Q?GNUF15Hoow+Sbh7zhqXSH7kVfDNhc+shbfH6UjYQWGAhEnFF9P6t10AdOngP?=
 =?us-ascii?Q?2Z04ZmOcMdPeKoQGSAZHQEICRr+M59CDJFD2AQb8L6qc18FTq+LX9PVhWJag?=
 =?us-ascii?Q?LQSFm1a7czWUs9UcmaPe4amJOuv88PZve831SK7/sr5CllR2R89H2qzYqoED?=
 =?us-ascii?Q?T2+diwtylKasQzSCSomrul49zLdxrxP/PQGh6qmVhVEZFQ45BY1TRpnQTRYb?=
 =?us-ascii?Q?SqYSPxqwIZMSKoRRetwHq0bBcWtNnDVFkA9qS8erOUWPkaRB7SghNbjmNyVG?=
 =?us-ascii?Q?r2wsOTAB/Ko2DsqFv0yJZ0UbrkoHw1quNRWIrPP1TlzS8TOczPuabMolk3r1?=
 =?us-ascii?Q?YKp/D0+P1Q/uVMV4X9x2KmT/RQ4eeBBg0nMXG3R1EhFhil1lCaFSzUgTNsqS?=
 =?us-ascii?Q?MZzWck4sr+R7r1nlTBo/u+RAsCul8BzqCIAvk0vEg2Git42J4sElimn+fIXJ?=
 =?us-ascii?Q?SkSGikkVAD1DbdM7rgLQA3jasfDghySYmiU5OfhjZZe7xzKYSreI3T2C62w4?=
 =?us-ascii?Q?CyBQWn5bdexF6K3sJYhCgM1zjqJrsMt000KzEj6PM6f/kdaXUg78qkhSh8UY?=
 =?us-ascii?Q?5t2uUusCQmtO0Le+cDDf/+2ole0wqGFGoVLn7+lR+ALrBwJNe6LKuM5yHIX7?=
 =?us-ascii?Q?JlnO3exdJXCwCLFf6CYf0bpvXNXkKa3ywEGsPzZuT6k6R/J+oTuyGENzTSTp?=
 =?us-ascii?Q?FaKe6xOujb1KzO8g/iDczsNeRQZHjH3G0b44dXifPLmQcKTzW5lTVsnlY8jS?=
 =?us-ascii?Q?lNL1r7FKHY2ova2jKWnNdDaeejgkT8JTfAdf4QJN/MuIFTIGjy9xgc+rPe1J?=
 =?us-ascii?Q?irh3LC5fhZ9wCvLcUww8wMob9WiGqrc0Vdw7HUUCeHHlbp2lwVc84UMv0nPe?=
 =?us-ascii?Q?LUaw/f0T3jJhFZsPPcudnun8S1PmAER5Ej9hKld5/tiBMukwxVdj75K/5siD?=
 =?us-ascii?Q?/sRb+qARc8POicK2YT4o0IXP5fAoZ/KruvA/bPe7eFcfU8PsGICVXnGegZMv?=
 =?us-ascii?Q?61ubZhFnJoPE1Ts1PuO9CK1OMLNx4h9R0soaunVU7dC1sp26jjz1mqVmwNwf?=
 =?us-ascii?Q?tXH701WsMu7jZIjfZ5XDK5YOMMpdJoblOQJQMMNHo38IyXj/qAJsGhOSSSS0?=
 =?us-ascii?Q?s1GQP3K8UnnvjlqJbqQvfY8buHH6aOvLm+Vgv9Ypm/ny4d/Q9kZh+qx0vuIR?=
 =?us-ascii?Q?46+wI0aNnQRpJCMsajHZbrzv9p2Ym4ELdXMTj3yfyLSqfMj/UF22kSCkJTGE?=
 =?us-ascii?Q?ltAHG45gkjwBARNSCT3QEXTwRVWYIlAAjyTiVDoJKc8jj4qbaew2aER3IOlV?=
 =?us-ascii?Q?oVlxF9qb6KjLQvLMecaCWPQuAiVMrfPObOocusFsncDlQVfUHUEOEe9KM7pZ?=
 =?us-ascii?Q?Dw8XMa2hstLJhRzxhtqMpATVP+UtgbD1pRAy9LuNlGux9k349usdD4t3fHCx?=
 =?us-ascii?Q?hCDgReywAW1LyH/+IafRhVC2Y08ezeTCnrI+bbZ7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f67970-7113-4fe6-8bcc-08dd5af5eb87
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 08:24:02.3514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgo+CnOONjejkm2D4NuYnrg4249Ff3J8Y6HkYmeM+/1A6uBROoYLOzFp5XHUZL8WmSPka1CT2exBhg1Q/qlFxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9720
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

NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Add a DRM bridge driver to support the display format configuration.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4->v5:
* Rebase upon next-20250303.  This causes the drop of .remove_new by using
  devm_drm_bridge_add().  Also, this causes API change for
  imx93_pdfc_bridge_atomic_enable().
* Update year of copyright.

v3->v4:
* Use dev_err_probe() in imx93_pdfc_bridge_probe(). (Krzysztof)
* Drop MODULE_ALIAS(). (Krzysztof)
* Update year of Copyright.

v2->v3:
* No change.
* Resend with the patch rebased upon v6.11-rc1.

v1->v2:
* Set *num_input_fmts to zero in case
  imx93_pdfc_bridge_atomic_get_input_bus_fmts() returns NULL.
* Replace .remove callback with .remove_new callback in
  imx93_pdfc_bridge_driver.

 drivers/gpu/drm/bridge/imx/Kconfig      |   8 +
 drivers/gpu/drm/bridge/imx/Makefile     |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 186 ++++++++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb85..51138d74ddfb 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -88,4 +88,12 @@ config DRM_IMX93_MIPI_DSI
 	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
 	  processor.
 
+config DRM_IMX93_PARALLEL_DISP_FMT_CONFIG
+	tristate "NXP i.MX93 parallel display format configuration"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Choose this to enable parallel display format configuration
+	  found in NXP i.MX93 processor.
+
 endif # ARCH_MXC || COMPILE_TEST
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index dd5d48584806..f4ccc5cbef72 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
 obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
 obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
+obj-$(CONFIG_DRM_IMX93_PARALLEL_DISP_FMT_CONFIG) += imx93-pdfc.o
diff --git a/drivers/gpu/drm/bridge/imx/imx93-pdfc.c b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
new file mode 100644
index 000000000000..7dfb87e64197
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2022-2025 NXP
+ */
+
+#include <linux/media-bus-format.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+
+#define DISPLAY_MUX		0x60
+#define  PARALLEL_DISP_FORMAT	0x700
+
+enum imx93_pdfc_format {
+	RGB888_TO_RGB888 = 0x0,
+	RGB888_TO_RGB666 = 0x1 << 8,
+	RGB565_TO_RGB565 = 0x2 << 8,
+};
+
+struct imx93_pdfc {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct device *dev;
+	struct regmap *regmap;
+	u32 format;
+};
+
+static int imx93_pdfc_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct imx93_pdfc *pdfc = bridge->driver_private;
+
+	return drm_bridge_attach(bridge->encoder, pdfc->next_bridge, bridge, flags);
+}
+
+static void imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
+					    struct drm_atomic_state *state)
+{
+	struct imx93_pdfc *pdfc = bridge->driver_private;
+
+	regmap_update_bits(pdfc->regmap, DISPLAY_MUX, PARALLEL_DISP_FORMAT,
+			   pdfc->format);
+}
+
+static const u32 imx93_pdfc_bus_output_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB666_1X18,
+	MEDIA_BUS_FMT_RGB565_1X16,
+	MEDIA_BUS_FMT_FIXED
+};
+
+static bool imx93_pdfc_bus_output_fmt_supported(u32 fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
+		if (imx93_pdfc_bus_output_fmts[i] == fmt)
+			return true;
+	}
+
+	return false;
+}
+
+static u32 *
+imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					    struct drm_bridge_state *bridge_state,
+					    struct drm_crtc_state *crtc_state,
+					    struct drm_connector_state *conn_state,
+					    u32 output_fmt,
+					    unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt))
+		return NULL;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		input_fmts[0] = output_fmt;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_FIXED:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	}
+
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
+static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	struct imx93_pdfc *pdfc = bridge->driver_private;
+
+	switch (bridge_state->output_bus_cfg.format) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		pdfc->format = RGB888_TO_RGB888;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		pdfc->format = RGB888_TO_RGB666;
+		break;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		pdfc->format = RGB565_TO_RGB565;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(pdfc->dev, "Unsupported output bus format: 0x%x\n",
+				     bridge_state->output_bus_cfg.format);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs imx93_pdfc_bridge_funcs = {
+	.attach			= imx93_pdfc_bridge_attach,
+	.atomic_enable		= imx93_pdfc_bridge_atomic_enable,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_get_input_bus_fmts	= imx93_pdfc_bridge_atomic_get_input_bus_fmts,
+	.atomic_check		= imx93_pdfc_bridge_atomic_check,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+};
+
+static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx93_pdfc *pdfc;
+
+	pdfc = devm_kzalloc(dev, sizeof(*pdfc), GFP_KERNEL);
+	if (!pdfc)
+		return -ENOMEM;
+
+	pdfc->regmap = syscon_node_to_regmap(dev->of_node->parent);
+	if (IS_ERR(pdfc->regmap))
+		return dev_err_probe(dev, PTR_ERR(pdfc->regmap),
+				     "failed to get regmap\n");
+
+	pdfc->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(pdfc->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(pdfc->next_bridge),
+				     "failed to get next bridge\n");
+
+	pdfc->dev = dev;
+	pdfc->bridge.driver_private = pdfc;
+	pdfc->bridge.funcs = &imx93_pdfc_bridge_funcs;
+	pdfc->bridge.of_node = dev->of_node;
+
+	return devm_drm_bridge_add(dev, &pdfc->bridge);
+}
+
+static const struct of_device_id imx93_pdfc_dt_ids[] = {
+	{ .compatible = "nxp,imx93-pdfc", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx93_pdfc_dt_ids);
+
+static struct platform_driver imx93_pdfc_bridge_driver = {
+	.probe	= imx93_pdfc_bridge_probe,
+	.driver	= {
+		.of_match_table = imx93_pdfc_dt_ids,
+		.name = "imx93_pdfc",
+	},
+};
+module_platform_driver(imx93_pdfc_bridge_driver);
+
+MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration driver");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

