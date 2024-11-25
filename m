Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8114E9D8271
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D1C10E5F0;
	Mon, 25 Nov 2024 09:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ATPq4A/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4121610E5F0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EldOVN05nDd9cbi4BrOBzhS8lJNxmO2QmFt42XYoBVMVGhUT1ZUFzqktepFbqocB1dFfHsEfLZ+xIH3djqsGm1KPKS0T/PXqZFlPgWgb8JIRS90u4pFQVoqpAaNcsVK7afntAgAs3QWeRAmpKceOEOJVBD16LeeTrML9Hj2M5+gTrYJET9khBFJbZW7Z5Z70wahJFHD5XV0OhrzsYjlVRAXmliryrpiQTK3Rb6aI2fQXnA1ZFP4bfTNXcVqktN/iAjBwETecAT1GlFX1xkB+rEjZRKMsOe21x2NbXh81baGmidSxHOPjHzvWnrlyycjPwgQ1XCWIXut+rYIJBgMF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlDRWuyL54wp6gCAfR0Z30yGWUbPwOprkje730daaMk=;
 b=QdWXXsbF+uIF2Y/lS8QY7VEmAA3eTpkM7yoN5Fhzhy1TWTd6TXNBrpZXfgYkoEXGfc0CzfQsu4PzOw2CANwCJPYgSxS5gao430lv41ifTE/0AQPdeGJeYCcU+npFtxysPnQ6uqL3XK9PFnUnfYoBcnfE+f8rZ972h4Rs5VyKqZBFzgFltv6vKEp7xEe2WMA52o9PUvqe5X267ZJiuQV4ZiQAk97F9Zd5KDk0IrbotfdEuSzorvBPM/LdTcY7NC9diygXiaBa+ePaZOnyeN+9hr/qkT6hgR0IdLm/quCRrtB8e06dteCauxkTsYq5fmzdRR44l7hxJrDVNkdrxByLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlDRWuyL54wp6gCAfR0Z30yGWUbPwOprkje730daaMk=;
 b=ATPq4A/NwkMcWbdLLi5PNZZw8S0o4m2Dxi7/ohWQsocIMhHZuryNf5VKJV47QRtljzoz42OxtpBx0VItRa6hiAPSqSnVrXaV6sPCi7G4bu3ZDObjuZxbMxnN8TzQYyMBEozabig7lVtErBgsfwY+lE7Rv6Bly9RZ0R77OkPs32s6YkIDmZoJxXhQD1WoqcutV2xH7mlRRRPvVApRSRJp3YV/nUaTQtRhNDg0WO7PkghHn41ljDqH7zOVBHpM1AYmG9AAXO/EdafrWxKMeNE22wTK3auZvUz2/CsJIk/CuTccGGRayi7k5NL+nHJLAz3Kx7rUa2f0XfbP22yu/TbiUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10754.eurprd04.prod.outlook.com (2603:10a6:150:225::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Mon, 25 Nov
 2024 09:35:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:35:27 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v4 19/19] arm64: dts: imx8qxp-mek: Add
 MX8-DLVDS-LCD1 display module support
Date: Mon, 25 Nov 2024 17:33:16 +0800
Message-Id: <20241125093316.2357162-20-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10754:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f34ec2-4113-4919-1f92-08dd0d347e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4/XeDlgcN+schisSfs7xT+rwRSSypRJ9LR3U3C/NdHjX1L76Xzb2dlGItLLv?=
 =?us-ascii?Q?JnkBczi0b9WrP7aIehnHDyTrvbJoXirebAZLImbjBMa/EKRzJVfVQLRw4Ez7?=
 =?us-ascii?Q?AnXl6eSbrqSDblPhbgp6FYNnOpjP4h9s/l9WLi7C0FUi4WvoQ86TLBPi2kkU?=
 =?us-ascii?Q?3F3J4dCEBGN4T1cJNmDmb3AjfA+eK+xDb1zz6KEMSUyALMs53/z3hF6YlGjo?=
 =?us-ascii?Q?onNTe0M+dHXLCLYF1tTdPvhk5CckxxySZGGY4fowzRXiX79EbxuzHRoLHp2K?=
 =?us-ascii?Q?5zi7yGA4pxtdalb+os9FEapF5klO/ECTg9JrMBVAyxIaf1sqIIj8kbylGvkD?=
 =?us-ascii?Q?3Owv/+hPKCzsXUq8ufRtmAqcE8cwxstmmPzoTNI8YJ1i5gPO4daSZn1bnHAJ?=
 =?us-ascii?Q?pb29duqNRhff/ecJRMCN2kT+9xL5EgfJnW8tEPJOv2gaFQLZo1LjhVTbUFtX?=
 =?us-ascii?Q?wQeMLzbH/UFIu4JdPo9PtrnHO9dbf9qYAudYMMc6MgM0aAsPNlxGjJEFwGwO?=
 =?us-ascii?Q?04Dydwfoqp/Cy2fmjPKYa8sKquJj3HXKm5PqQ/zHCDnW6JvnhkATDgIrXBJr?=
 =?us-ascii?Q?tEpki8FSYZgMutbM2eSJ7tXHd5yt1xY/QlxM5XJy626zF3Nbb8iab8AQosmp?=
 =?us-ascii?Q?iIiX/Fw/T22tgtRQbKhVFLhjgqTTBvq5iv+LjEC34HDWIsgoVGCN4jaBCR1t?=
 =?us-ascii?Q?kHLpZzgfABdYUWY4Ppz1urWo/me3EXnvwcj4LNB0nWqW2zk8muAtrwbtAaMH?=
 =?us-ascii?Q?ElEfGeyxS0cACfS03UBum6aQ9Qq7ayUiAgrd09AkRzruqxndcOw93ra/t3Eq?=
 =?us-ascii?Q?5EmUWmOhft87pBmNQw9YRGQgbHWbV9Ltzi058uzWVrCpVtAFmahiNosatCgs?=
 =?us-ascii?Q?lORtlTWkRIMAGUamKkr1utqPJvSIhc9pBLcr+o/LU24grG5+FivSShpYmDMJ?=
 =?us-ascii?Q?IR0FN1giKS5gFscCwcxVkAhTcMwBv/VRPluNPBOcUjPh8Si7Fm8MptupOchk?=
 =?us-ascii?Q?Ky/lhNZ28s7HPcwXiIOVOF9TeI82gxgc51TXXMTmuPRun8zzzt+kMbHpz2Lf?=
 =?us-ascii?Q?qt3WVNcNGe0BX44seiIzIadxiYDXhGqrV4CEaQHMJEN8Ll8jwA68Cy7T9JOt?=
 =?us-ascii?Q?24oc5vLgz601DVMcBqTVxSxZr7hcMFUwTcDQVqWFM2NGto+qBdnMwGgwPz5t?=
 =?us-ascii?Q?mUM7QjLg0bfvU2eNEgN8NWtgSsemELwcEERGWP35gDSeouE0NPWE/CZ2onL+?=
 =?us-ascii?Q?l49G7dJD9M0eeqFwnJjZ/HtUn/kS2n/sktydq6WC40+UJ1mwkKDFMbycZRLs?=
 =?us-ascii?Q?HMRVoKNjHKX+WgX4RyiLWSU7TJ4NU0wRfQWxdZvc/6j7xPt4H3UeBTU7YwDE?=
 =?us-ascii?Q?/z60KW8j9xP4AMuGXEsJ66zdHHxqF/JM1Xt5I3EmnWzzsNEiwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lssQBRCgOvSw3bNnhUxwtzSMmrnUxHVvQa+9gKI5KFxoRL5Sj69jqBGR0fB9?=
 =?us-ascii?Q?t8SJOfkwOrbz9ULUqWuzZSpiWZvftc6P/9mpajLn4ZoqrBY3nrFzLpjMOrGm?=
 =?us-ascii?Q?jgmnmUNxEaolGULJwfTAEUp55f5xyjleI5V68HvDQsOX/jR54RkJ8TUR4gcm?=
 =?us-ascii?Q?F0IiOnkn8zn52Y0CJ7SEuubIMBpqGHUYgnq/DkR04PiFPeaczS/2PdTLrua8?=
 =?us-ascii?Q?Ra4fr78FFNH3Yri4FrEjFnwdfvnCY+FjhEaFO1uSolP07U4hFRxo2j17W3De?=
 =?us-ascii?Q?1baRyx4BG4t+jH8od4IpaNiAbwN679+Wf+jzmA1ovWywPQzXoVO0DrxcaoCd?=
 =?us-ascii?Q?yx2TQAGh6l/Z3qy1n/eH26czj0GuITw/7R9CS1MRfA3Ovcgn7JxvrgEcRTqD?=
 =?us-ascii?Q?Xa0rNWPmESVF1sneDtqrBJtUIeF+PzERfGj8+vdJRjR10ZZp3gqRbmie7muR?=
 =?us-ascii?Q?7lNON0jlQfrzhknTmZZvmrnSe7c/ug1F28OIzTnhcppDCvB5oQ0QXuHWXMPE?=
 =?us-ascii?Q?id9NWgXRwTVScaNXuycQDXuHFnWRj6Rwd+PYIliYVdoMqLaDOvHT8pUe//OF?=
 =?us-ascii?Q?j3Zz1nMvmCiTuXw/9ikBPvIIRocvt21jikZIS4C1YojvMq3dYwrFss0Vehvi?=
 =?us-ascii?Q?+5LiP/k+Xd1Z6PmHGMn7aLDio+68f2BVnd23+3plS29m9vsEaEKkr43p2IJW?=
 =?us-ascii?Q?UY7j1QAtG+5ycMXd6YBnQ0xzcu1PLLFQVNnbXR6vnjWlKtYY/PxE6rWxC2NL?=
 =?us-ascii?Q?HtvwJ9Vmn1E/Qz5faEA63BNwaLCitJ8uhxTIMy6GgXuP07sCBgQSCi7srcmn?=
 =?us-ascii?Q?j8bMOGAQ4Lj1ZylAbE+LwEApeZaetEKgO5WUfyCKjY6PHSVd+qZETs3Ik/tz?=
 =?us-ascii?Q?3uKeFsw3EPmQZQ3BbKIl/AVfT6aukqoN1Ceoacqi9+Uxn7h+43ew8WPZvLHK?=
 =?us-ascii?Q?u+PITaAVzm4yjpfLl0wyW9GI1/yRkTTOyAk6ZJZ93lpPlAZc++Syljk2t+H8?=
 =?us-ascii?Q?UJrphy2DoCH8JQGe24mAwIzYbhpKfQ0kmZTuJ4pj+LQxiuFahKMb1oAPVcun?=
 =?us-ascii?Q?9u2zGkk3gK803yU7EM9QwCcqyHg2/lhJwnpLdNllXRsRaUZvnNZluWzIXaKL?=
 =?us-ascii?Q?6KHTdeqYj5cx1+NiZVyk1fouu6VoZOLa2ZE0M5rN6Fhg4ls/m1a/iud2C62Q?=
 =?us-ascii?Q?eGcsQmt328VLi0hE5OTvX7YfOOeGfjelUxhwvMH2WFPpDUmT+vaA5ZW/hOy1?=
 =?us-ascii?Q?u/9+M2glKDXaxCYKvsNnMJ0gqfh0MBqaVljOu/iNqpl0CkIuNtWkyoC2AHdu?=
 =?us-ascii?Q?Nw/LJe/a+8HykCeUiy6c1GMjIpWYrSq5OhgXbObeYWWrvVcARmISt5qiAhLK?=
 =?us-ascii?Q?WTCvBuuA1uz2sBlmgpvYGwV3TSE9xJyobPhJF4MqTtlGVfdT+g/v4CqaQRjg?=
 =?us-ascii?Q?sX4QMh7mLpk16UNH9SINNbFr4Iq7jZ1bil0W9Ynj0E7ozdANOw7YqWspaQx7?=
 =?us-ascii?Q?W2M+k0QgGN6kxM8O96vtTccTOMO4kIPFQBD+cr4RFuwQ+4NpjaU86DpL9FMW?=
 =?us-ascii?Q?DV4EEtIznO5ECMAq5UxaxTnEAYFhggHFE1+a734T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f34ec2-4113-4919-1f92-08dd0d347e67
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:35:26.9759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/fbLJ+W/rK0xtp5BRHrzdDBLili2tbip6NOwSPMXthYrHJl8PJUsE6KEfclv4tnd2RMoQsX73BtJOeWGMUAOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10754
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

