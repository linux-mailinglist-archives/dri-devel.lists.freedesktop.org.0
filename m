Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C49A9FAAA7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A3610E419;
	Mon, 23 Dec 2024 06:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ixzITOmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FA110E418
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJ1S6gkhZr8l5OYNJwR3yxX6FItnRhJXWCTvgjy8PknZjwUTtN5JfpXOjqvFaj5A0Qb9E9fKQzF/V8184UkIFibS1bR5KGUzhXIPlWOxygh/vZ38IYQjL7UP5fYp/Zjj3sT0E7g52xc6cAHQPftvmb3q+UewEs/rD/vy0OKQUSvlOT05jaLMGnvvdvzIkANXrOwtkWYsFRcKZ/t6gTfbDiCb2BHdbSNw6VYVuV4nhvRF9XHxGG0G+WHGdfubV52sNqjZP20UTKd4dsULVYxJvjaBOk7EOZqQiRrfo/DEiu6YqgAmSHd4Rvx/ZFQ6CwqN3kwa4haJ/jtneEhogGYDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVWiJqCYn9BVBNDFswBQ83dNbOE51ydVJwXHcmF8FbI=;
 b=M+clPqmBrN49I0ws6FiPMFxT23ZIw50EcsI0Pln524anqo7bWw+NrFtLitJtQtkjF7+yh1lBVN+71CoHeTFZSouKiouTRNvmgrCKWEptD1fZ5n2SY2vjCy4ToR7wEDArGUzTS3FsfmYFeZ3TdwSXopmu9oTL8A4Kp05/7WaOs04JOFI1HvPrVvljaXVTIyrnYp75uVryLYmpc/bsLxKu0g2UbkyWDEF3+Gz6v/bRJmQrKHNVL6jVLl4G+S3TGbG3j9LNDOnLI3Kjh4ztLUOqt919amcXJCT9D2bBgADRrhHIQGDtY1JXsyqqOh7sJFaOjTUU/F4FMmwYTiabP/q8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVWiJqCYn9BVBNDFswBQ83dNbOE51ydVJwXHcmF8FbI=;
 b=ixzITOmT3eGVLRzXVTwXQeoU2XGrOFvV5cosJDjMSKJVJ+4sWsN0CGN815yRTd9JtaqIPeJhrtMNkx5ObEkVwjC4SsYJyihNEb84dinCg3TyTx8YsYllaliqHniotSbCpSGASsNy6Rg4pSHrHxLkoPontATpmahxrGua7WpxyoDMoxxekqJJpBNRnMKmKg9znXx8L067HqU4w94/llWkqXj0sLEVGO73aCMUhT3G2M8Y5wxN8mf04dyd8+1qHt1aoWXEqfOOTh+Ys/HToziEOL3VLrSswAz+wOrGmTG/pW2eZwbBNg1uK3HyOs24VTWDSHhBk6g5r2iumFqdIX3ucA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 06:44:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:44:11 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v7 19/19] arm64: dts: imx8qxp-mek: Add
 MX8-DLVDS-LCD1 display module support
Date: Mon, 23 Dec 2024 14:41:47 +0800
Message-Id: <20241223064147.3961652-20-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 779e89dc-0ab6-4c5a-7d25-08dd231d3530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sxb8y4J/4GPqCj+vxGWL/OG+LJ4RZ2iIYYCA3Vt8bR1G7W88QnrInD3IBc1G?=
 =?us-ascii?Q?b1dgqJk7INL52So1mQJXJHW2+tf5bLHKowiigl6hrTn9AALaLa6lRnpAk99D?=
 =?us-ascii?Q?f5sPOexuwrFRVH6O9EDToI5PhL6jH9bPhXahHDMePPSB+mN4RgKppTZ2RiZl?=
 =?us-ascii?Q?fzahqNYy+2L/BqAH6b0BWrYIvMxYLAYnH6ptckIoAajF6v4S7QKornvwbrNz?=
 =?us-ascii?Q?1axWzPFrFRQNzgheQ+0Ja32KiZlz9KIwPF9V4GA563P/hkcGhz97HSo3o0EL?=
 =?us-ascii?Q?xAtTqFvScC5wC4AkA09HYqKGIiM3Y/tJmBkAfiIirPiebWP1N6qOZA0YCh25?=
 =?us-ascii?Q?CXJ/bpfjQPJssJuuFzHlw6GWfJdTmOfe1obRG2LXtVEZi7zfdZpTzhfkzmHH?=
 =?us-ascii?Q?owraeev0PZkJ9Ys78LYRi1Gg0bIS2+/Tw17ruVVY+00Dre3zS4pQPbQlnP0x?=
 =?us-ascii?Q?+L2Q7h/cuiwT7ZuHcaKzRjiSQ6dgNw4Kft5mOpXhGkBjlPyWJh5fQ1FVms1X?=
 =?us-ascii?Q?2zOkrmvvbXq70ZgD3I1mBt+AvvwKtMXS0Xrfkj9Lch6V8uUiFn5nUKcQL/ia?=
 =?us-ascii?Q?UgWiGCRgL/5N4Sz5xUekwz0zv1yvHBK6L5rJ7Hz92at6Lhzx3hA3SjfAyx6s?=
 =?us-ascii?Q?zxtgfCMe0zYYQYDm8dJSR5F4l3zhdvLkCWS+/4Vte/3aohANYjYilZw7DWcR?=
 =?us-ascii?Q?ThNfHVeF5PkFGMgpjVyAxjATCBL84d+qm6S8v9B2VQllUUaXE2beU/qM6N5L?=
 =?us-ascii?Q?22t3XdlXVi8r+Iiq/jBzeSgpvtzlQVOy3MVGTlHRSr2cTIpD09/QU6cEK0A7?=
 =?us-ascii?Q?qxSfboE4yRZczgUt0D+6+Z8HOCgIFLzSDH1dvPKANZDYpwCzWhBfjpMcL7Oj?=
 =?us-ascii?Q?vHLHb1x0kJKY7oCqQjKsUM8h0sC3yPH/sSZG3+GWmsq38QaoF4Th1sHfX54+?=
 =?us-ascii?Q?ZXfasdRh1/J7WwNn8ec0nAa6hbjuwEaT1kyN8qlUeth+nK4NSTzW/XY6OAHc?=
 =?us-ascii?Q?HZsCAPusrIp/0fMfoAToOhr6ca6GT5x975aRWWey1UL8seT22gmLQSUqJabM?=
 =?us-ascii?Q?v9gqjAyd+vQ/TGFYlkUhuA+Qoir6ZyUug/Rjzrn+GP1cMJCGM9JJZlI4ofvi?=
 =?us-ascii?Q?WzZkkIPN4Zi4kXwYVd2v0ONh+AUrIxc5YpRO0qJ1MyjuY0PdQbMuQR8YOfGb?=
 =?us-ascii?Q?j3CkEWa5rgIpAyk5pLjAqBbyESA2gx881dCK9SmYqojBsqOg4FJ2+tXs7N5n?=
 =?us-ascii?Q?T8oKFp1Gt9Lll8Mcl4qIK58ytniNrHvPU0ypDPogQ6zDOKecjvcNTo0NOTfq?=
 =?us-ascii?Q?zVIastWuwAUUxv06Ig8sCeUHVKyMJ8Wl/hR5TMOJcKuRfcJMMfv2D6A5WcAa?=
 =?us-ascii?Q?3+dGps1IObipNa7QxS/XF2FvPmfOoM+7QH4uOYgt/ZQ9rj5HbUZ+Pa1e4WyE?=
 =?us-ascii?Q?ftrsj5b3e2U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l+vkiyMyL0LAZtENfbuUTgvdIFEkkGfiy1FDPOy75uTWzB6OX8EjuPrlxrwU?=
 =?us-ascii?Q?g+hK3qu60krOSjPX/CkCBtG9OM1sSCd991wRL/ce4+KcX+jt88YFR1pXIGod?=
 =?us-ascii?Q?BcF3xJqVpNbw20kYYnAsGpuQuVIjSkq0uW4lC3KFZClSxfmxPUc0BaAYm5ek?=
 =?us-ascii?Q?wrp/zxdZXDMjNzqerQrpLDXNf8qVKm1aAD/0ZtAJVmfWm2nyQz1KZJvBb3/J?=
 =?us-ascii?Q?sScHzU/7M5+FbioZVZ8R+/coAoT7i3EvYhzBzk1ckrIYwHT5DioLyJB6mCgV?=
 =?us-ascii?Q?Rt/SXE7NJEW3meBcmgrXy97aO8h5XuBtklPbhAvXF9S1cnNwMentxaPkKanC?=
 =?us-ascii?Q?TptvM0iR2YCS9MzJQM3lgvv1jFn7UXWt2aUD7MPJNSDsCqqeXGnNi/g1b1WM?=
 =?us-ascii?Q?m2ZLJLBoclBzH8BgNCuxcroNc+0/m6492gGcL2K7wfLzbxfcJE22RsmDMu8b?=
 =?us-ascii?Q?Btw5rEngEviuPJ+QIgoNptOfH0jFPoXLQVpjk4nP2ZbGnYorZf48RwAlayd/?=
 =?us-ascii?Q?MQNmvyZOl3xvX3bALdnP6Bo+kk77pUP/1UbwJihrU+21WKJQ7bVym3Qy9CS4?=
 =?us-ascii?Q?SsnqNuMUKHySlp7hwFkYCIf4OZQrnO0aTH/A/L9YiUqriJhOqhPsQxLXGdyP?=
 =?us-ascii?Q?SL2n5mzC+eWvQmdedlGKAukVFDbNPnPsyf0x4B/LcK64YpFG/EcCybDypyOw?=
 =?us-ascii?Q?6IUpYj8HUx2G0VIQgEJoNCASNGuVkpDustQAll/aI3lxVhzpNvMzsYURE3e0?=
 =?us-ascii?Q?ZpHBYryGTkpcG/KF9DAXhMYCH+NoTso1/mTa76YK6b8ArdCbwUVN9DqGCMi+?=
 =?us-ascii?Q?7up3CXIdAp+ehmGMs6B4MG4F+JW19bMUdd2n5Fv+1BJWXZth8SAPNWR+0bP4?=
 =?us-ascii?Q?EZ5lVo6iZJGxqOMQpN4c9iO/a0cikDAiRYMhGj3JfYnPBZ6QB72x9STa8/Tc?=
 =?us-ascii?Q?726dMbur67aynUMsL9tr5y2z4QcPK1p3K6D/qeVhfrje6B40FhbdUelzb9W8?=
 =?us-ascii?Q?K2QohICCZ1h+0iOe0ZrGEOXlPwW3XCpJKUcEEukof/wUZLcwLtLsB9d7Srhn?=
 =?us-ascii?Q?qsi7kIt6g/5NNq+9Q/HqCnEPli7mk54aLIT22zDcYgdgoDxjdzjiZedsHR1V?=
 =?us-ascii?Q?PN8CX3UsuHZ0lUXqRQvz8h+zbyePsJv8hD9vY2C3kl902mOYAg2mLvgAiD0h?=
 =?us-ascii?Q?N5XA13zpEWZ0b0etJ6jHVZqhtxZ1lgLjdulAROV9YY9t2hsCiJ03XdpXUWqH?=
 =?us-ascii?Q?f2c/hkewaj/qsH47RvIQ97drtr3VOYdt8E3rBosrhBllY62pgYNUID7/tAVa?=
 =?us-ascii?Q?Wzctp1SXm5Lp+zn5KQq4/mISuf78wZqVsHZ6bF5f/v7rsieqg4OK8oxyBGAP?=
 =?us-ascii?Q?ULPTAcFZ1GslG6spLIyzoOtG5miYvBUOr7poq3ZxHYS/0JKSUIhf7JFOMjIo?=
 =?us-ascii?Q?ccFDgfVkBcCkVx8yJXOlnnsIWk4jkOlwaqTA8VUs7261Rxv/u76HuEtWDVd/?=
 =?us-ascii?Q?tlQU9C0oFpNG72UXOzAJi6JAL/LdYgsJB6q1uQFTm+2GA/N7zodkSoi775tq?=
 =?us-ascii?Q?J1Yv+CCnW3THphQnDNXZZtqCsB84jHLqaCDjLCWT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779e89dc-0ab6-4c5a-7d25-08dd231d3530
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:44:11.2285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to0hMLRP6nUifXGnd6uJ984GkY8AAkCaa/5l2F4Zkbl2VttKed4b1eTW6He96MT8/rboC9fpck1qRC8BTwglvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
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
v7:
* No change.

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
index 839432153cc7..408240b0002b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -267,6 +267,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
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

