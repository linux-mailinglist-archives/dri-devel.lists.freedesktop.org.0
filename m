Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB829DF944
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7FB10E63C;
	Mon,  2 Dec 2024 02:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Q4+oYf48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF6010E63C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hq0D/vNxysy71qvfOlKW3+/EGpx14rkxAHlQSnYi43W3B8EAo8g1kP6zwcBJcwoVzCVabJHf5iR+5EJVVTOdm0OFX0SRl26K5vJ0a801HdOQCnB6S3t1D9Z/+IrC6XeuxQXk4bDeVdxvkIbQmwCjqi80lMhrr45XKjhQREzZtg6RiSTf6aBfpIobu6wFEot9mjBXQx4vBHCZy+/LW0AD7ujTi99aGcuJ5obUvYkSk5/1zs1wzTI+HpP93QW7KD6KRU/bew4UjYukIDej1lZFw8C3B6LZMuytSlAoKbaJSpX/GVdS+a3S6wGcgPVdm1PAm+Bd53jiJIAt2wonRo1ZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PV5SRwxuoZc7CYjZOzjkZN6pnNbixXimeGSwtdG4XE=;
 b=xYmun9hIAOs2En1W2Adwa7fC5uatBogAH2OXVRvXL1navH0dAYfzcEKwqp+WZ5bchkRlRad4KQrH8Sfj1xorvnODZtb/6ptr/D3X3jcwMWiUDKf3Hpkbqyfi9De9uc6FHsKLp4sqB29AhSV3omErlQY48jY6wdFbw0v0migtvHT7kZg3oTh71d81P/nrRq2XE6e1k7T4G2DttyM0jyycWJbU1FhSaYsTPR3WCkmJYaMImw7kSS4T/i3mbvEzh6FoHx4cg5QegiOsrGIKLWQdNnvxcAjL/WKn7VwCP4/fwyGE1sSMfj3BZoYxkiiahzVr+0jvBLMOyeC/W328BaJ62Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PV5SRwxuoZc7CYjZOzjkZN6pnNbixXimeGSwtdG4XE=;
 b=Q4+oYf48rf5YGiBXdgvkBEXJzYGRLBF72L6ZBHFmq/n/UVC8vSibGXwhAK4HT/DibICVuBTGwg9YXYL3uJX03YiEHDMLORBXV1IDLmbv9+Aw93fLAT70vhkPONriem/aPoaq0NgYW74zobnhUOtS2l0vD3k6dSoXWXTG8S0TMgSU/cILJzmOZAuVDrF3Ld+EBliPF/p2cpO7rUbpkLcvZaGkEXCAfsTgSfNIGmEi/EBemweYHaJf+buPyt3sP/M99EXfCb9oJXdyx60/J2B9Jpi3NAweRqB/uLMXTkFjM5/K8j2pWC9/nkTjAjGnpI+zBkwnknx4/5IxI3qz64FeIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:58:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:58:52 +0000
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
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [DO NOT MERGE PATCH v5 19/19] arm64: dts: imx8qxp-mek: Add
 MX8-DLVDS-LCD1 display module support
Date: Mon,  2 Dec 2024 10:56:35 +0800
Message-Id: <20241202025635.1274467-20-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: bd10f0b1-ba36-4b5b-6ce6-08dd127d4102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JokQEZvpn/jzkVhiTXV2qdI2LrwIrSONj7x2DZqpEoD8d251ZAYCar7RYvpA?=
 =?us-ascii?Q?AZdigNisEupMvePGeDv8EqPlI1MqofL41BTUlqYu62MS+2XK072U9YANqV0r?=
 =?us-ascii?Q?Cgkce17pZyIfC/JQjlwE3T1WKLr1jckCoiL0TQhht8XkDCPw98ER/m5d0PCm?=
 =?us-ascii?Q?krE+S6Kfrltoy4BlkW/0xKsN6mfgv+mkJZxAsmyxScpeMVeZmXiHtUCluuwO?=
 =?us-ascii?Q?QBL1JYVhbbQvDYX926lan33sc8GcGqbDw0HK19+CS52zoirr0PI3CZQU1vMg?=
 =?us-ascii?Q?dV5Ptsx9ubfLhT8rrl7OK75SNyO8VuHWXZwnUDjsaEpg4RPCxKsid9PTdFYP?=
 =?us-ascii?Q?Fx7pfZ0LSwKal8RKYWTL0+vbluQF2Y67yx2RXnidQzlauFQ4bNCteVjYm1X9?=
 =?us-ascii?Q?Fk7t8bG9dV6TLn6umc4/nHDXH6roMa1Z1hLgUVf4IGqrDuUfkKMpX9OMacZ3?=
 =?us-ascii?Q?hEYYu+uiHE4BogoGmCyKXTm+JKpP1623HPhnP5KjlAUWyimXHSXv9Krx0Jea?=
 =?us-ascii?Q?oer43VsoTP6SuMX/b5gCRCDUWgDBeMPtdxUSLJAIJZSWqw9LzWTYjfdshEUO?=
 =?us-ascii?Q?z8FQxPTaSGQG0+jIjW/iZfco03aVOiuatB0ENpfXMCPBTQmMmsHOzlXk53J1?=
 =?us-ascii?Q?1ogruw11GxRh1b1mc8JprMAroasfyCOeDAPCwfCLYOd26nonstMwgB4s4MgQ?=
 =?us-ascii?Q?1zO+USS0Au2QMQh44BBQ5DR1XPneA1itsjkoXxoB0UL3OdaWeRjRrdIbfrz7?=
 =?us-ascii?Q?eTVDH0gemwxfegZziwJGG9kpopPL4aByB2v8+YUuBQfO7gnrlHVebOznfQFW?=
 =?us-ascii?Q?TU+E4FeNKFzojIOZ4pPz4yBnIKUvHBBI5L6iNgWi7MrNkyfb9x0Yd6UHCEoG?=
 =?us-ascii?Q?dcWm3lFOc12HwaeuETLmge3pExtIZGl68PY7Yx3DSe6kPIgA3y6VlkbO/EQh?=
 =?us-ascii?Q?JT5yqeDNSbQKqYCIrOQQIhl2UcLEYvK3NaH2wQ9N/QPpb1dnfnrrsTqgZxwt?=
 =?us-ascii?Q?IBO7yTvDE+3NPYgaj3G457PrqfYfcQak/XhcycEETkc8Fz8ZGr0PLwHIG+E1?=
 =?us-ascii?Q?319ap0qAQ7a5QMFWngbmFEMt57h4oLwbFy5+ZqaXDdapxD8ZlaFbgvv/8tEm?=
 =?us-ascii?Q?bn7iSGysER8ffWAGzDlCMUqFNvDOJXcv3x/DLfhi9bBUpLvSTp8ql1jWCNOM?=
 =?us-ascii?Q?TSwRpah3yuDPFTvhERz8oNrYtmhFXVHRvUNgvjsIninBc0Pt3UEv0IXIeCBa?=
 =?us-ascii?Q?ytBAmf5QIcFUz48LMtsRp1Pgy6LSpN5ouVBQWsDo3bzXm+yckJYZq+5cj5i1?=
 =?us-ascii?Q?4Clvfbmru2LazbLHSwSQvg+pmjfdpmjluEjHM+0amdbQFSJ/e1dkn/ugJ1+5?=
 =?us-ascii?Q?W+Wlx+st/+xYW1nj0NzcjhoTLHiVxu+OMbOsChmo+ebo660pSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0PTHmDRctTCl4ahS5hqsjfMV7sxXeZvh66A4Wr/M12/lHlOQu3s/nVR5Fzlx?=
 =?us-ascii?Q?Tk+XEt0J9z/G3HY3S/YwszZwkl3D401UmIsJBdHEefUgfywxr195l0cDA7Gx?=
 =?us-ascii?Q?F4ieaKAUULKzYUXzn7l3Myzr0qvL5tyXmneVK5XzApJ4P0uQysXv5v/1sedJ?=
 =?us-ascii?Q?yqRVco76MuS6eXuurO8aYvOGRScUgBcMN6r+szQlgES7bpGvbaweqkqkcoxN?=
 =?us-ascii?Q?+5AF+Io+eR22bI7tz9udc6sF/17vuDTxYcNmDmQKlWSHmiE3OtUy1un+3O6W?=
 =?us-ascii?Q?Nzt3c5kWmoP8I7sXk/OjZPc33jrYTD0jgGkKhKV48v+SngN8l6Do3ua6g//9?=
 =?us-ascii?Q?eGKKdM/l3MEcafCOTurNbusjwbxOwmjTE5Pnsn6UMlw/FnQx+YExMIfwvQxu?=
 =?us-ascii?Q?zrd+7qsbK/KOAzsvmpMH5RbLLLgdbQfUbJS5dKyxw/K4EIuHxTRFWYKHLXkI?=
 =?us-ascii?Q?lCS4YFC14GCg8tvLlbzg08H5gut97yhyosQ6C8xFXM/2LNoClNJRIY/ZTVSa?=
 =?us-ascii?Q?jurxIxJerOULIPlvgqFAM6vszXqJEYMDFEfRprjPKcAfp9RMv/LnPtaFrTId?=
 =?us-ascii?Q?h9zTGuVS/yyysFZe7jXWUHV21M1lDCWABVhF5iBGaxUunGe2pQnYveZBsGfo?=
 =?us-ascii?Q?gl1rcE7NfBtGoUSkcKAsnDsSRWEmGtSdEmLG7KPd4PHM+9jJ1A55WjqN+Fdu?=
 =?us-ascii?Q?8f9lXkrfrymbGJzkS8MOR6iDKqIRAZBLxQLZbtj5GLwPie/3Jurnk3pJhTI3?=
 =?us-ascii?Q?m+2ZZXYEvtzX5WpvR7aqPHqGd/PtpE33MqSRQk6bKKuXv59D12NUnnDpIAHJ?=
 =?us-ascii?Q?oXQVU+Wje9pibERQOy3c4cCDMVNqKpEB2tMQ9lDC2f1s0iJs6hckF0GgwSN9?=
 =?us-ascii?Q?jsqK04yfXbil3yK7irpGTdehMhIJMYEC55l/U5DNblRD1wid+4YRwal4c+U9?=
 =?us-ascii?Q?dFKlqp4H9r1djEt7dbahQPX+THMPamiPQdU3VIfWzI05dPWKC8wy04Ez2FZy?=
 =?us-ascii?Q?OpEzVHa8EN9lmWq2J+7oADKOPxjou6I+loy/kgAsOG4owLBvEFXek3GzYLGW?=
 =?us-ascii?Q?tdvDx+tOCeOC8cfd5NKdGKz43L89gTxcyAHt7xDWsJirC16NnYiDLukjgGRZ?=
 =?us-ascii?Q?Jfq5C59lG89uxDjbl5xD171Q1/aVZT2+qjTUhl4zv0ELfNyXU3DSRSRaNd4z?=
 =?us-ascii?Q?Mudh9AYGeF+VkX8yu1TYfdZ3m3h+WM00l0QKuMJXeJgr7zx4ivdtnb4YFh2Q?=
 =?us-ascii?Q?4wAaLWHSwGuhhzAW40TfzBhUNm26HQNavBxmrGUOHCPqGQxoRtrMrBqQEx1c?=
 =?us-ascii?Q?CxPdehYeY6i3BIpgjp5ofAEV3ujHis3FelFbLaPmcj1J8uPupmWfQm99veYD?=
 =?us-ascii?Q?pMesAzT+MgCPCbSLza7rCz0LJPn1BZ3T93h10CPqoflu/KnOJnx1q2vEVBhG?=
 =?us-ascii?Q?2m2/TuYNh+mNqfdJlOxXJdiUbQh7zYkNu+OFG9uH0hvqfzt+AAhJa1Xghf9e?=
 =?us-ascii?Q?UOwpW1rXjlxuoSDNv6HGpQqhi20+4hpSDNuEQeIhfMoo9q1K79dmebCEa2re?=
 =?us-ascii?Q?CM1D/Hm1CM8ArkRajuWTR47izjHXgsrox0DmBgLR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd10f0b1-ba36-4b5b-6ce6-08dd127d4102
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:58:52.8933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyvyvolLNqSn0SLhD4r4DMsCZu1DHJ0SWLEqBy6CvkCpdz6l0mnfMTnV2GEd/7DhUndyAMfrZ6a1cf4RvtVy9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643
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

