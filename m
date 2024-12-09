Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B0B9E89E1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3116F10E479;
	Mon,  9 Dec 2024 03:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kB6jAg42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2042.outbound.protection.outlook.com [40.107.249.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA80D10E479
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nk1SXELkIo1oMjXo0WtkAqMm/ovgifL/920LILHFkI/z3HO4DeRAsWLaoD8dIB+F5xCLWmYc+CfQZOmlKkuY/l1vAcArMRAPKXO0c1SQxaBPb7r6cksoNMj82BVRWbto+Dzpshgf4KJBYFuK3r4VTspkrg1ndMd2X1jN4iilyFXnHCaQSOR9O25/MCxqLfv/7T2VJM6Vras0tpdjbVGlOaRXhE010qivr2fFf2gXVko/fpQKG+HpDc+66xyJuioCDR1aLw9NijOx8Xr8T7qQIWA4m0DgT53zNAGmJCjLbfDk8o1YBN+kpHF/NpTyN6I65QhywTeGO9bkSuPI2P3rSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K950ozANv5TmVw6Rfr+icFPUPDmhdyaY5OogI5ZGRt8=;
 b=At+G6rcOWQONQrspnrFwYJ1d/+9lPvYtgYqT7N+DCrRt8Y0rkVJCIVf1oyWshXAH/kahFxxmi8BXNSzNBfHZAvOLhUJNbA2hgXPQXJi9eHf8Wvviwlc5oHU45CdLm/gpZ8cnViLapd7Su4+svMZ5mKyHbmkuYyp3VKxvpLlJUGBkaOQq8LC+3Qe6xkWs5lIBf21uIOCLD/BrM0Hs/hk1VN1D0pTpzZJtaOTV6kQH3B+g+S+9DQYLzUewja9sZfrrC8q1f4PpSefM7VTNFm/aZ00BCjXHF60vYDLZerLLlwFe3l/Jot9zafHaBDTkRdXjHqbAcXYYGbjv46qwSOTdbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K950ozANv5TmVw6Rfr+icFPUPDmhdyaY5OogI5ZGRt8=;
 b=kB6jAg42qYjIE0hSyO1d4sq02ceN+5TGABfi47zP6tsYST8u1nlzDj2XZKiAeHccJYpl/By/Uh6kpIsNTWw/3CoArNh+hj6lk58onLDWQqYDsywMlFtHQZyAYTNvADI8DG/jDHDCcGERUnzH5njhWtsPrSAlmQdaauXbobzZIIqRymFQmqyUK8JPyCohnhUwlOiRQbUXyRSMrVspVsLukmBaIUnW7jQlLzeDX/giWWRg3fZ7MkHvWxXA3mBMxakwBcXK+By/47pN7djH8ScFhejxl+m51OvAzqjX0l+3dPEKpq0Cd12nGe3O/KReE/TZVORtoT8TuXOsQfqCPeSVtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 9 Dec
 2024 03:42:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:42:02 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@baylibre.com
Subject: [DO NOT MERGE PATCH v6 19/19] arm64: dts: imx8qxp-mek: Add
 MX8-DLVDS-LCD1 display module support
Date: Mon,  9 Dec 2024 11:39:23 +0800
Message-Id: <20241209033923.3009629-20-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209033923.3009629-1-victor.liu@nxp.com>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 58343e10-0cb0-4c12-968b-08dd18037139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RZ4Tbu2Zwg4o7/klKRD830gc9YiyTQEIhaOUSnBT2cbKHScjdUoTAgeEawQ2?=
 =?us-ascii?Q?/qbc9tacrEDlRCOeAz5yBICh/HKwPBnGvmVnD6Zq9LWKo85wJB5C6NRq6C3N?=
 =?us-ascii?Q?9UhwXOOlJ3G5TEslcazb4Y1pjUe4fnwhBvd+HL9VGmkecsI01C/ew9gBXidQ?=
 =?us-ascii?Q?XIg1zVrUpZFq9tpNTmi92nIcn39ek9RWLUW5n/9MgP5EQ2FlS+RAmjCg8fAm?=
 =?us-ascii?Q?Lb2cASSpVp4n4/Z4Kw26fI3OxHVxcAsObgp5FydsZ/ujZRH7/m7OMNV6LFP9?=
 =?us-ascii?Q?FltMvFZ43SCTJ16Nd4XnlHRoLWng83ZMcoEuCWHcEDpyKHvrp3OGW+x7e6P3?=
 =?us-ascii?Q?R34kus6hpGtqLjqAbmBbX+N6mWcusu8D+4KilZdr9YiJmnGPVj4lsCF9/Z/W?=
 =?us-ascii?Q?GcEVaSCpBlqDS4PMZ0TEQ8UhSlGFDEozepF6IV9QLo9vRhWbmtnCYoCp+T9/?=
 =?us-ascii?Q?4aLP8os0toZiQfVq4c0RaYhUAbVJK1DEZt19or+2guHp2OorWd5JkWsNLfJR?=
 =?us-ascii?Q?FQyAM/eWiOFyrBxkrbIn1d7QqNTCOj6SCkgXZmj1ZvhhHWINK51x8aFRLxh3?=
 =?us-ascii?Q?j+GOlSpjcM3Od21oMEH8/1sq/CKE28FPqkADQNLWGpEQ2a6qXUIr2pQ4nfy9?=
 =?us-ascii?Q?1wWpaXU1gTl7mFKNryleFS8wgYZuhoKMcd9iF3nLfun0KNWd45PgiiyTXoq9?=
 =?us-ascii?Q?3ZkkCBWcTClNB850FHcPZyN2ymNjz0XJ11NUbh1hFPsWpMK4+npZ0UxXLgyv?=
 =?us-ascii?Q?VleM2Jpx6cwAi6f24QVbO6qJY8AUkzlI22h2Dx7KkKmbZl1go5tFbANsNRDN?=
 =?us-ascii?Q?cpyBRV0Dht3ibtFggqCeZIKHHhnSGFViWvl7ywcs79x7n9/EdvBqHgFTrocO?=
 =?us-ascii?Q?XFx4UL8+JAxP/WJQCLGY9s2f4jP8o36ev05Q3zXSGDOYkgIn8klX7zU01Mfm?=
 =?us-ascii?Q?PaXHguPTDCUaBsIAznPsYjEpbYcNh1AkMTZSb6eGuRqg6zu09QiSe4k+I8Lv?=
 =?us-ascii?Q?71sjf6eWTsOCKxcTArrIiTtcnbZZYmtTveiRX18Jd5wBQPHyInFwvsTQkbC3?=
 =?us-ascii?Q?Gg4pL6VEJ19+jsXM0iFd6q56hwf5thRo8kXLrDY+lhUrEnsjOat7A39nDWY9?=
 =?us-ascii?Q?v3zXvbHEaulEsVvIh3rkxNoTBoek3ET0EPtY5AkoHCj8xv6x0yEa+HDuz+Ck?=
 =?us-ascii?Q?1co1FMFL/sCwaPagrJbuNtkUvfx7u1hxxGpb0Z2sAdOD7NY6PeYZ3gwo9ByF?=
 =?us-ascii?Q?u7R21iRlxlBI/10aFj5AYIuCWsDDd3Sv9C/aFgejy7WBG4mUO+AK9YcMDZEu?=
 =?us-ascii?Q?ms6rOeVnFwitIqbOo7K8dXRC2d0XJQk45ixkFHSaHqjAioRk1NoKfDOPd9TB?=
 =?us-ascii?Q?hVVLLWkL0RAipCKPnAFiR71UbfE0NfNGRdOp4Ys6xRkPp8BNKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rvdiFu9W8R4Y9+BiVE3IrWgH9Zlnc4m4yP7c5XKyE10gK5tf6k6+J5mEPB/X?=
 =?us-ascii?Q?6eaQoxM6Q4JnA3mgd/9wj/M48ovpsPrmV8muZIhYIFafZAlSw0hmWKcKNsDu?=
 =?us-ascii?Q?juuQZy49gOhseJ0dn2w9X8yWV8ddWZN4UzVpdzpEXwCwHGkMXsFcMaA9iYq/?=
 =?us-ascii?Q?lktk9II8gJ8GInDR+7LiKKm5wOyVnBm9k7iYjEu3Gtqzg+Ku6QRlvRK1fyom?=
 =?us-ascii?Q?aw+GwBwJa5PG8p9FSkmu9rn2BkXRZ7FPySFGAcHv+Bq/1FE7JH8jnW80+XJz?=
 =?us-ascii?Q?4VIx71dXpRXzP29sFBkeGdTE8Edj7EWdJoWOmXb3SUzGI3chUOYh2xLuLV5p?=
 =?us-ascii?Q?GA4OHysng0RLkDNLhVm5AnBDYUPYcr58zKie4Z8G8czltk876EXBgUtlL8FJ?=
 =?us-ascii?Q?GSzpey4ZN24tRW2kcGRZAz+ohHg+50B7xpC4r/O+sMMFZy9y4HK9QFYGw+E4?=
 =?us-ascii?Q?5nGbAoRHMAKuOA7tWKc4r4qAuUyRkareLH0GvnjNrtbm9p5W2tf4BepahWN4?=
 =?us-ascii?Q?zcc2zcb8LZRSlWGHoZGksETBE7Z6r9+jgTElbsm2xawbgX9P67B1M3psmc56?=
 =?us-ascii?Q?eGk0Ep2MEnGEtPE12z6kEYU3TKYgJtU8dW1sUntZchWdJaoRW7Oy+Sb3RGDA?=
 =?us-ascii?Q?8DxW3G9SpuvlAfDh0fFMh1510WaXKls2LGIcphLnBSXn4mEdSLojNzsqK3PA?=
 =?us-ascii?Q?tkeQ+u9Gsjw1yxVtl0x+sw0Il7nXevIuJzvmFI4cXpc4xeuyIgIaFc9DXoBc?=
 =?us-ascii?Q?1tYY7qvSnG7MjvZGuYIvXwR8fLCrMzpfM7+rLp3lHkbiNodyDmRRQPnuBr6F?=
 =?us-ascii?Q?AOaywLfPF94vX4f2k7vOJsDpTgvZJlE5dARY2grqEwIya6vcgVlDvEx1GSwZ?=
 =?us-ascii?Q?s/KXHr3in0phzvZbN/kOsYUMjAnYsyfypPzlDXy8FDqK7IyduNLj2ctAdBMX?=
 =?us-ascii?Q?7CrfWX29jatyHRlvfPI5ez8bYec1nkQmSxVQoHJe0iw+GSv46pf0J1Hxs4Yd?=
 =?us-ascii?Q?JaTdJ7Mql3YfTYQ+1buAZ6u+iFlN9cL2dcbBrxi6Rw2XlW0eV8N91Zwbk+vK?=
 =?us-ascii?Q?EMrLdEOKPCT2YhS/umxheUpid/WbTXmI1WRiGQWAO17E+zUGCMnVqp4l1hLJ?=
 =?us-ascii?Q?5msQAIHGIphSQXPZUL9dUluQMgR7e8VTzdscDEg93ZjOd/DKi6vXWTmEqlGx?=
 =?us-ascii?Q?J3ACNPkXpsE7WSo/4Q8GuKMVTMcGeL2uA3JjxeR5Qt4Ay1zWn2xNAOaqv4WT?=
 =?us-ascii?Q?5vTUSvyqCqlEe2PaLs91b5lnlhrcS20swAM02ZX+jgXoGdcJNVOH7/AOSwjo?=
 =?us-ascii?Q?jPyW/Df47fZRIkBh4GCxuJY0bMTeaDrw3xSKOcu6ZE8iWCwitXD3reL+luZj?=
 =?us-ascii?Q?ymer9bfTjaOKAfcrYUZLNqzFfbzNl4Z3k+NzQBhIZ2ak73DkkPStFxznip66?=
 =?us-ascii?Q?NM+vU1GiSPFLjLjvt6q457JNy+nzTQBsniL6A3kyWWNVjXLrwLx9XV5b69/G?=
 =?us-ascii?Q?KoAiNy397GRm74Ys49jypiD5TKfC0GfAXN1eCYIUz2Cv44QqwqRlAjvP7bv5?=
 =?us-ascii?Q?y1ac94Vvuu3lZIL2iyvPn2dODLSjcngduLIeLaXp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58343e10-0cb0-4c12-968b-08dd18037139
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:42:02.2661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3G8lHgyHvm8wmgRN0eyz2Ib02u/qQ+W9OHTUB10CVctNeN/EUjBIEdBGoHUdmsSqkzVx7uflXp5RJ/w57tHig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438
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

MX8-DLVDS-LCD1 display module integrates a KOE TX26D202VM0BWA LCD panel
and a touch IC.  Add an overlay to support the LCD panel on i.MX8qxp
MEK.  mipi_lvds_0_ldb channel0 and mipi_lvds_1_ldb channel1 send odd
and even pixels to the panel respectively.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch. (Francesco)

 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  30 +++
 3 files changed, 217 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 42e6482a31cb..a22476e81cc7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -254,6 +254,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
+
+imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd-dtbs += imx8qxp-mek.dtb imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
new file mode 100644
index 000000000000..7ddd90e68754
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+&{/} {
+	panel-lvds0 {
+		compatible = "koe,tx26d202vm0bwa";
+		backlight = <&backlight_lvds1>;
+		power-supply = <&reg_vcc_per_3v3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_lvds0_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_lvds1_in: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+		};
+	};
+};
+
+&backlight_lvds1 {
+	status = "okay";
+};
+
+&dc0_framegen0 {
+	assigned-clocks = <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC0>;
+	assigned-clock-parents = <0>,
+				 <&clk IMX_SC_R_DC_0_PLL_0 IMX_SC_PM_CLK_PLL>;
+	assigned-clock-rates = <940320000>;
+};
+
+&dc0_pixel_link0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			status = "okay";
+		};
+	};
+};
+
+&dc0_pc {
+	status = "okay";
+
+	channel@0 {
+		status = "okay";
+	};
+};
+
+&mipi_lvds_0_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fsl,companion-ldb = <&mipi_lvds_1_ldb>;
+	status = "okay";
+
+	channel@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+		status = "okay";
+
+		port@1 {
+			reg = <1>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_lvds0_in>;
+			};
+		};
+	};
+};
+
+&mipi_lvds_0_phy {
+	status = "okay";
+};
+
+&mipi_lvds_0_pxl2dpi {
+	fsl,companion-pxl2dpi = <&mipi_lvds_1_pxl2dpi>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
+				status = "okay";
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
+				status = "okay";
+			};
+		};
+	};
+};
+
+&mipi_lvds_1_ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	channel@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+		status = "okay";
+
+		port@1 {
+			reg = <1>;
+
+			lvds1_out: endpoint {
+				remote-endpoint = <&panel_lvds1_in>;
+			};
+		};
+	};
+};
+
+&mipi_lvds_1_phy {
+	status = "okay";
+};
+
+&mipi_lvds_1_pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm_mipi_lvds1>;
+	status = "okay";
+};
+
+&mipi_lvds_1_pxl2dpi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_lvds_1_pxl2dpi_dc0_pixel_link0: endpoint@1 {
+				status = "okay";
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1: endpoint@1 {
+				status = "okay";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index c7b4015c7bf7..cb999be00c22 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -21,6 +21,16 @@ chosen {
 		stdout-path = &lpuart0;
 	};
 
+	backlight_lvds1: backlight-lvds1 {
+		compatible = "pwm-backlight";
+		pwms = <&mipi_lvds_1_pwm 0 100000 0>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <100>;
+		power-supply = <&reg_vcc_12v0>;
+		status = "disabled";
+	};
+
 	imx8x_cm4: imx8x-cm4 {
 		compatible = "fsl,imx8qxp-cm4";
 		mbox-names = "tx", "rx", "rxdb";
@@ -58,6 +68,20 @@ dsp_vdev0buffer: memory@94300000 {
 		};
 	};
 
+	reg_vcc_12v0: regulator-vcc-12v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_12V0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	reg_vcc_per_3v3: regulator-vcc-per-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_PER_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	reg_usdhc2_vmmc: usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "SD1_SPWR";
@@ -785,6 +809,12 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
 		>;
 	};
 
+	pinctrl_pwm_mipi_lvds1: mipilvds1pwmgrp {
+		fsl,pins = <
+			IMX8QXP_MIPI_DSI1_GPIO0_00_MIPI_DSI1_PWM0_OUT		0x00000020
+		>;
+	};
+
 	pinctrl_pcieb: pcieagrp {
 		fsl,pins = <
 			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021
-- 
2.34.1

