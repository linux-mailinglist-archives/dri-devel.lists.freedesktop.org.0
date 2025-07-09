Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3893AFE8D7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BC710E7CF;
	Wed,  9 Jul 2025 12:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KM2kJ+34";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013000.outbound.protection.outlook.com
 [40.107.162.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D8E10E7C7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUsTOo+5fa28gxjW3ZAUwg/E4REiH/aUVBk969ZxxDIIGFCPlkLC+LvaHZqqJixI7qdEgrY4TWJFDG7xRvwXRyfn4KQjuFCZuifslVwI5JcqizoEQ9Xv08bEaMozKL72jUPC3MJhjtgcceXSQZi7qpWtSGm/21V/eENW1159fuPUQ1+J7+Q1FGhIBakCnjMWrxOsf/HgSrIk5O3vIH1A1JE9JI39Vy0+8XF4XgwTweoxerwlroBxEmbPFZwXTiSExqqcT7DBC5kz9qLP2KEfQ3AEUnevmDjR0gvMJ2ebfyZL6DrX5liQg9hT2ARXJ8JNcqJBUQgDM7jdp99+g7Dlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpJBaanlyhMvWYvId4L47PL1u7zNX6bfkbS4UW7PcoQ=;
 b=frUvcNx0hsdjmqFJp7sWIfpCd5L+row7sO755YdqxSUAVErD6B3we26AQk580Fg142xWFgprTeUVZPqYooQxTP4Cdsop8sBNbmVAFTDRnGPtMmCFes+G++E6p8MyLs7glR+YMXDLDbFtI0MsI/oKWPROxkzozPpiEcsDoixpeEWVkk1w67nEIUNTU3lTgqyNNzR032aTFgldh+pb04zfUHTrk4shSVhhT3AhXFvsTs5Ahx2Hr1LCeFaOfzyRacDJSL/8LjN4PAWnKKd42lYN9Qdui3csmib9oIZ01RbIrSyOucnA5QucvS+Fvtn51N4ZzmK6jHxpfjue0PdeJVW2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpJBaanlyhMvWYvId4L47PL1u7zNX6bfkbS4UW7PcoQ=;
 b=KM2kJ+34QSnt/s1NwuqRuPj4kHwQ8m7yFgcjESWvQvTfSonZb9Ap6BSHEmyDH9k+DhJLgbwGISLEVp/1/5cpAQI7kuFDfKP6PASCc7ooFw+uG44kUgTs5qsChOt8EBK5wmV9VJ3ob9I6HjhKveN6bVKMgoFMH8zADptVyDEjWCVBg42d45WBbnZpSb+VOnOlOrQZjUJL6mie3dy5XSHgUNyaVq2UoL1QkkR1V/nIe8Onlrk2Cyv1WIihGRtQrbKZOlaRG0He3JhScUWORLS9CwE82rXIqNLX3RgJoqLmnPnEAHc2G40iqJZV+fy9dO5ZZEH6WFQ/d+5RjAYuJIQD6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI0PR04MB10712.eurprd04.prod.outlook.com (2603:10a6:800:261::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:24:46 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 12:24:46 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] arm64: dts: imx943-evk: Add support for DCIF and LVDS
Date: Wed,  9 Jul 2025 15:23:26 +0300
Message-Id: <20250709122332.2874632-8-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0380.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::8) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI0PR04MB10712:EE_
X-MS-Office365-Filtering-Correlation-Id: e6cb036b-3557-4b03-2c28-08ddbee39762
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K8KPQ5jq5E1X42sSMy/+2ThTsNgSX06DGnNXJ+MhnG3XMcVpAkWE4wanhUUl?=
 =?us-ascii?Q?p6CA2m+pL0lL2ABuBaA/6PtYPS+Nz0M150ujo3ZsnMBbNVGyJtCAw8W05R/3?=
 =?us-ascii?Q?051JHrLTk/p6icdhXvyQvqNaiSy/Z49X4yhP84EE5BKRuc9nKg7AfiO6rqko?=
 =?us-ascii?Q?w7FAte348idEKEdwLHv42kMWutzLGP3MTXS5MGHwtp0hlyIgb9uSQwkwHu+a?=
 =?us-ascii?Q?+XhgcpchL2w+mup893wrVsxvOsveVJhv4is02hH+dEe7L2QSnCX8ujmuYehu?=
 =?us-ascii?Q?U1MMvYYEIBKSO00x5TsU4wUioG7LkXvcPM0u74V25AAgi5zFu3tCSBMWGqMU?=
 =?us-ascii?Q?bXb8nvy/Tln8SvrK10snxO6aTqN8MqfIaSC+MzlyiGvwnhWnf8HGcOYGOc+F?=
 =?us-ascii?Q?o04YIU7XI6LJ14qhnaKrmuiCLbtmYdhMDoaczr75BS0065E8GqlKyYwJ6Q6s?=
 =?us-ascii?Q?bxN7SSQ1ry/p5+Rqb+yDGrLpeATsKETdXVpJsZVxqtYV3Dh15XOEHOpNkVWS?=
 =?us-ascii?Q?lF+xTMRybToypPQr9e+vbxhgK5Eogw8WV6RbPKuFA+TQJQYNvMWqoYbE0uPA?=
 =?us-ascii?Q?AkFs4HAwVGjdWLV2mXB0jRT/TJTe3NFXOUYgaQPalXpm0pwyzke15QJ09zag?=
 =?us-ascii?Q?IK1+97hQ5LfPgzTY4eMG5cwkFWfRxM4DBJZsyZBqPU6LWPvv7MgL2BX+p1OF?=
 =?us-ascii?Q?11Wb0vZFod3I4/uZB3mcDIfQYDpVrD1zG970NXIvvDRAnpGVs/VPD004WpOm?=
 =?us-ascii?Q?9Wg8YBCG6KKYy0fBgHzXeMLfkJINRxQTGeLISGHCN7FkDNQz94LiKP3WX34s?=
 =?us-ascii?Q?fCmmjns0l/kxlTdOsq0agQ6yx6ku5kKGgafx/6TkfTmLfxSf8X5kIeOYplo1?=
 =?us-ascii?Q?FEkkCS1X6rvr+3WJTo4mCeKt7v0QVqN8ZPxYnHdXE38lPRE5/khdG/LS2xi5?=
 =?us-ascii?Q?ZLdejiTd49Q5x3DvDuGHcvG9Id8D8+3eE9TzusLPNLJpqBb0W+cQQkJD4eOA?=
 =?us-ascii?Q?w0g/l9IDmPXx3l0wop7fQ4ICK1wLwqnDgjH1u1x9EDbvMLqM7bmhcVKXK3st?=
 =?us-ascii?Q?J3lHwyfRlVYK92QpgviyriYfXRKDSt/EtgVq+h2Bi22gzmL19MtFBU0x8p8i?=
 =?us-ascii?Q?S0LXJCoUXGjn/bDimUaLjM38uJDIkKK0vU06LwQDiMb8rE4xDg+R9l6xz+XX?=
 =?us-ascii?Q?qjg0l+JPuJgfz0O8gVx6DbjF4YO0qNGpt19j/JkxImEge6DvpjHfNEklR8CL?=
 =?us-ascii?Q?jglAJ4sRJTf5VkX+9SboBdMettT/6K0Rvs7kYr/feC3+aDXzSV1iu2ggxNMk?=
 =?us-ascii?Q?Fs2jDsGnY2aspMfnUsWQN9whPwb6aZlVsFVeu+4trqdpyz3pMLFDl87ziz2t?=
 =?us-ascii?Q?O2QToYGwsYdIzLBedHdg1SAA9raEds3s7FIrpHKHGo+aP4wqr+wxWEAZcM/P?=
 =?us-ascii?Q?vbzBMnEwE6M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gZVpT3EnrLMKxoZrXdLTIexVYG0SrI6NLFG0ET7LwZ/1vz5LVNthxeqVayR3?=
 =?us-ascii?Q?N1zHl9Up6a0RWbUTlJD+7bDW2RxtamtGAArC5+4tcx8DSfBZ1QEVBeRwM+Nj?=
 =?us-ascii?Q?R4M0lkAtugMZlW8/sRiXL/cu8kOuN+BtnGuS250bWqm3HG6A4d5rkmd1cP8F?=
 =?us-ascii?Q?mkY1EicBlCEcIWmSa6vthmlYZml7mqpgOYj5EeX+ZZcqeNyVJ9bVOxwCEC+W?=
 =?us-ascii?Q?qaJEBINGOx+Yt2JNKY3RNJO/qiNJloikXgUWIgop6SbmOPrAUmsMp+D64YoW?=
 =?us-ascii?Q?/CTUUok+6qCZ0G0g32Hvuys29YXg8GvMuWF8xYu4kma+o1fsEuPcFzQF3Nzm?=
 =?us-ascii?Q?Gtww5l/JQCcbGobZF3eA5wDegxshOQidjQDve0j+9N3y8aXVEHIwQuYOTCgu?=
 =?us-ascii?Q?t9NqKgp3++iP9Y5jZEKPtRxlpwAQcVjw+GqUGFUk93V2C6WhnZEq3REJrvKx?=
 =?us-ascii?Q?rtQT0uU1o/BUvZY4AlerhNViCVsYwWHjG2WRsWVmUK6XV7XHOTuQWOkGrjDn?=
 =?us-ascii?Q?yGTXV93rZkJNiwLJIGLUjiGXmYfqqFO+8KJmPIE543ZlQPMaJkTE66HVibyz?=
 =?us-ascii?Q?DZrtsMPQxUK8mnw8tm4FCIDCA6zrO7gV7Os0LC7ufnjF3yBJbbVbr2ivF3Fe?=
 =?us-ascii?Q?n1iSjKol2+PuIaAXvmFZ74EImbpyVEkqoKL/svz2qQOGsMpKkM/5O9h3ZnTL?=
 =?us-ascii?Q?JCGdCKdwJBvV9FHJ2XXGWmeegUZnm/Pkkc+y4gO4iezP4uZvWPQZ7dG3WALA?=
 =?us-ascii?Q?zQj8j6YPBTgBVB0TjJVGiPL/Hr/mPMEIhpc6YyCu6i6okCczly/o8DDgZ6O7?=
 =?us-ascii?Q?RUsH14lVhqKWFsYUfMA7SkceLKG+sSgB9DQH51BOtZxlC7YADXGzHhmLIKnV?=
 =?us-ascii?Q?c6+NhoTtXSGBIJ6q7F6oAPGC0SfdyILah45Wh/HsnKRDzA0z2J+xl36XTz1y?=
 =?us-ascii?Q?FQ5eO34PmnNAnu8UVRZFSeap2clN9Tjn8qAbJ+5yaFItsR0KTTTYfEYDnjx7?=
 =?us-ascii?Q?p8Iy3hkdPsEBHPlTONfYqS7DkNSs93Jov7pI04MAWmr9XE0ocegzGPXXHHf+?=
 =?us-ascii?Q?ca0d2kffz3rd7yfNbV1nFTfCXkPMqNR8Ey+BfaUCFiLkfL5fCbn9Uac5GIQM?=
 =?us-ascii?Q?t0na58qqExv8rsW8GNE17CaKE7qZn5ZAV5xvgFJwY1ENPbt7lMfLOK1tbb2b?=
 =?us-ascii?Q?+4Wxi9GsRH0kfOvfzJB4JML7pdIgDgt8cxw+Hx9GXmPwftitJ1e1SKnHVfDK?=
 =?us-ascii?Q?QxyJg3vDt2BfKVeVj/4BeiwvN+8OvV1TzSthPBtW1O/IaBVd0kS7rXaeuAFO?=
 =?us-ascii?Q?bxNO4Y2OAqeYhNfaYdikOAyPUlfBxeUBi8oIz4msGZ+1oTAyYwuo/bPdQa7Q?=
 =?us-ascii?Q?bjX0ZKVMaLOeK5n5Dck5ApNcE9b3nifOA0cY75WYlJmX02nV5oiVonb3KYeC?=
 =?us-ascii?Q?Tqc62bOxoQwEH/oDsjsfYrDvfmdOKzpv7ot/O2FU55gIKWgIJX6e1zHtnQdh?=
 =?us-ascii?Q?F/5pfpMKYBPBo3CpNtfw2RGVQpiA9TVtVuhxz22U+QgnLLGsFhY7LVfAh6iw?=
 =?us-ascii?Q?PSBYbdyv3XHyqE8wLbDcT8omUd6QLCRbxRcwwcun8jdiqHuWULsXwJ6vjJ8m?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cb036b-3557-4b03-2c28-08ddbee39762
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:24:46.5009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDOsjOJKFsIzp/c+h/g/r1MbitZdISYMnub+Udbl1KP6JOuXYArY3w7a6pqZMu/zE3qIoH0+Xwhsgg0gStpowA==
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

Add DT nodes for DCIF and LVDS in imx943.dtsi and activate them in
imx943-evk.dts.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 126 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx943.dtsi    |  56 ++++++++-
 2 files changed, 181 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8c3eff9df1a2..e7de7ba406407 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -125,6 +125,132 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 		device_type = "memory";
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+};
+
+&dcif {
+	status = "okay";
+};
+
+&ldb {
+	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
+			  <&scmi_clk IMX94_CLK_LDBPLL>;
+	assigned-clock-rates = <4158000000>, <1039500000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			lvds_out: endpoint {
+				remote-endpoint = <&it6263_in>;
+			};
+		};
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9548_i2c3: i2c-mux@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lvds-to-hdmi-bridge@4c {
+				compatible = "ite,it6263";
+				reg = <0x4c>;
+				data-mapping = "jeida-24";
+				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						it6263_in: endpoint {
+							remote-endpoint = <&lvds_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						it6263_out: endpoint {
+							remote-endpoint = <&hdmi_connector_in>;
+						};
+					};
+				};
+			};
+		};
+
+		i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
 };
 
 &lpi2c3 {
diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 657c81b6016f2..db00a94812e18 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -148,7 +148,7 @@ l3_cache: l3-cache {
 		};
 	};
 
-	clock-ldb-pll-div7 {
+	clock_ldb_pll_div7: clock-ldb-pll-div7 {
 		compatible = "fixed-factor-clock";
 		#clock-cells = <0>;
 		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
@@ -173,10 +173,64 @@ dispmix_csr: syscon@4b010000 {
 
 		lvds_csr: syscon@4b0c0000 {
 			compatible = "nxp,imx94-lvds-csr", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
 			reg = <0x0 0x4b0c0000 0x0 0x10000>;
 			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
 			#clock-cells = <1>;
 			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+
+			ldb: ldb@4 {
+				compatible = "fsl,imx94-ldb";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x4 0x4>, <0x8 0x4>;
+				reg-names = "ldb", "lvds";
+				clocks = <&lvds_csr IMX94_CLK_DISPMIX_LVDS_CLK_GATE>;
+				clock-names = "ldb";
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						lvds_in: endpoint {
+							remote-endpoint = <&dcif_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+		};
+
+		dcif: display-controller@4b120000 {
+			compatible = "nxp,imx94-dcif";
+			reg = <0x0 0x4b120000 0x0 0x300000>;
+			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "common", "bg_layer", "fg_layer";
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>,
+				 <&scmi_clk IMX94_CLK_DISPAXI>,
+				 <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			clock-names = "apb", "axi", "pix";
+			assigned-clocks = <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
+			assigned-clock-parents = <&clock_ldb_pll_div7>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+			nxp,blk-ctrl = <&dispmix_csr>;
+			status = "disabled";
+
+			port {
+				dcif_out: endpoint {
+					remote-endpoint = <&lvds_in>;
+				};
+			};
 		};
 	};
 };
-- 
2.46.1

