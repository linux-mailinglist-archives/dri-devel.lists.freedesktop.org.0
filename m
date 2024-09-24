Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A151B983F52
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2089610E605;
	Tue, 24 Sep 2024 07:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="n86bANTP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62C610E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 07:38:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnWcYNCVa+v+rXNr0BeyRvS/UnnayGGK0gtmWEc516taeg4KGkVHCMqbCQQSJYKsMEwUukbji+L3TfyXHhEijX76F2L6Rv1aovgQjcdwGJY/Mqd4cENmHfa23iD+PEKwzZIkqdOA66xxTMzMhzHNeNLG190cGDXEsf9uQycH878g4kwc29tCQS2ZlK6In5bB5pUux526SOomUajDQ/VyJpf61ftryXCvxrykxpj2tDysztd1nGi/SpvkIVh0zsHn7xPN4c83UXstfS1VJwx6v+azq3XDlznE4zgURJPhFe5E5CdWv9oV/7OedmnKyoNCv7XTNSiEuGKTlH8pBtYmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77N7MB+oAF+Ky4cgJTRYmTkxZ7e/e2XlgfS+4KO0a3Q=;
 b=ro176E2WJ+h/5yT05XiP2b5+gqiyBgnn7huAl6BYmrHr6MA3dxPACdcjPHFmbhQJ2mDcBKApaRk9qZsxFpR8OdxTQjEhnrp/r9zEmPHl7aU+qrgiyYI3k2o7hdfMDnSh8bvKyovj187DTlKGegvyxLH9a/xPIlqdEUaRpxx4A9gmCPchG/ssRL7KVLvowFGILasw9C4NRfuInEVvLT4//SnD9yn32OHqsUJYoSxTU3RuwBDIjHZYN+dlTpk7+Vh30pIMmFhUEbBpRZTufk+HvGpleZNQntb5Ir6Z0x8ZPkfmrhfBsGgNXKBnCF2ozxVKEZ+p+ox0gdlhIgcCQk404g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77N7MB+oAF+Ky4cgJTRYmTkxZ7e/e2XlgfS+4KO0a3Q=;
 b=n86bANTPeDYXkd55nAwkg8Z99AKWpxC64MitZbvFSbNBoqMFDjmnY3YK20GurP+zTciy4jqF1gFV53hN16yde7Z5nZGhGnyC8dzLWTL6qNibu6qYoT4vO9gFwK1pEsDYhLZWrQDVNboHuGEjMN1oPsCvcpWY+ei0NMzFqbVKjb00yusrZEUi7lUjZJ2LDHSXuWgsHJkM30g5V6j4yJ4f83MWecaQJHS3yy3ewDBSxq05VEkJSnyXsezl6AvK2lphR64KzSCVjGPTmopnTHDxAlF6zSjFRv2JtB1d1K834dwH9sTu2tu/XYoxCSu+tEchqND62XxRwp3Xnd6iej5cHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6881.eurprd04.prod.outlook.com (2603:10a6:208:18b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 07:38:48 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 07:38:48 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v17 7/8] arm64: dts: imx8mq: Add DCSS + HDMI/DP display
 pipeline
Date: Tue, 24 Sep 2024 15:36:52 +0800
Message-Id: <856a715c0ba66b42f215357653d46b254c289ea2.1727159906.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727159906.git.Sandor.yu@nxp.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: f6277068-bbf1-45d2-d4f9-08dcdc6bed33
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S7XI6h0gzh0XsOg4h0Ds5uSiuulmAnkcVVCb+1b02UbYKL800NO5ZlwgHwJW?=
 =?us-ascii?Q?k3w3wjYxFdqImfWViylBLs9xU66yx46wLD8Xatxm7Nxnj3viONnKXTkNuru2?=
 =?us-ascii?Q?O092duxhy8fI6DaMcDS392tQjVqNYaERaqGB6s0La9rr3e4p7sE2rqQRRLmG?=
 =?us-ascii?Q?KDiVYPRXpTi1ELjblyQZROt2FxiYFhMLrXf7pM1l2YDww0J+cRph/jkxA/Lo?=
 =?us-ascii?Q?9nRYlOdlNdoWdapJmPpo5k7rJe6NOfUz/rP0aYZ4iCMdBKYeQT4wUHApUF7r?=
 =?us-ascii?Q?dk3nVEx2VReX7tLG0rffei/uYSeE2GTw0Fg1g/Hgk710+dhT5htKKp2njdFQ?=
 =?us-ascii?Q?JvKNa/x1CX2/5Ovs4Ln3kcUK4Nua8xrOpZ9s15xMTL6OymRehiUVU1+jzmxy?=
 =?us-ascii?Q?lsKK4cfIV5g/d16QkwoizhhMcdGIf23+lLQGlo/gdbcODSlOrfId8ePUN3oW?=
 =?us-ascii?Q?BJBGBHt9kMblWjB6ieEr2Ci2OAhD7Ctvo22QfuiktPYt4i2LIfT89fMAIPEj?=
 =?us-ascii?Q?A071eveG7LGkWJVjXnF3kO47Byhp1Y4MfhFBh0w2WdsN3yXxPOEzvcoei0AC?=
 =?us-ascii?Q?9om8OI2tmKXQZJL4ouR8raxPXrmlL4tyVl13S5vGj8wI4RIeqJqi8c0iwr1y?=
 =?us-ascii?Q?Nvu8CaIxeljy+utVR8XyXArQ2G6b3yzkVpkJcPE3Oau/c7xD2982l7qsvefT?=
 =?us-ascii?Q?5vcRZEeR7UnOTw3Au3n0cJ9S4XXClBnf1fjEgxXIGq8Ik5NPgxslGs8AI/VH?=
 =?us-ascii?Q?81Juk6fqimfWSY/iCuNr6yevNknjpSxNXQNMDrqSxZwEf4EEB2DNX6hjSyLW?=
 =?us-ascii?Q?OZ4KY9em3wJAP4GhH08FiqIjGgmkjBfYbQB2AbJReUXy+Mo2yDpXm9nY4m4N?=
 =?us-ascii?Q?JPNP1j/g6GH+4TAfMPuWdwXlbHo1mdrYFPcUlpUSJeD0/zKCl/JnsvCyggxa?=
 =?us-ascii?Q?wAfbdh4hd+OrOoM/fdnE5MPvk2X3Q+0gLI5Qpsa7iBX2ERQ24FbGVZMtMImD?=
 =?us-ascii?Q?/1IiXVCtvlSWN5SpYWuD/lnetOCn/dOPLSEPxjcLqJAgbdsxfMv6qavxaje8?=
 =?us-ascii?Q?q30Nk5JBoNL6hx6Re0LX03fqJGuTRZYzqwR+QPX3ZF6QO6OTb+2ZwjaX3+d0?=
 =?us-ascii?Q?YpSnsCPh3Puulp+4mQNvpkB3aZyGH1cGiF5kmhxeSBOrYuD2DYC6FuiV4U3O?=
 =?us-ascii?Q?BaH6pOoIn/6ZFqiW5EHXkHyBJ4iL/JQB+g6qubYTWf1QOwpech5MVK6olOTx?=
 =?us-ascii?Q?DIWR+Y/L7YrpIQi9JxoJOPQdMYFHu6hIn9ioG4aHTm5FbAvQAtP5A9eDcT8w?=
 =?us-ascii?Q?0eEW6Pi3fCR7Xy0+HVd8JRofVNbDO2agVH/P8dtTZ6rIwfrmhZ8X0bYsWYXI?=
 =?us-ascii?Q?Czgk3RRaGUizF6TpaHeGIq3LtbMRVL845RzzcqVXrr+vzT45ZpFUyfylASF4?=
 =?us-ascii?Q?tD8MXyH/rN4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rLwFrflk+dhxP2zVG6sZ4UtbiKW/ZXhWInhNSI44HzKGl1xV/sl3s5TYw1ga?=
 =?us-ascii?Q?P2xPhOscnKBakAZYZu6QNrl6X6suVRpzP72qddagJ5zztPTmg07NCR+HrRd9?=
 =?us-ascii?Q?cDFtdL1va64lwchPmQ8YsmAdysZohV4I0ZsJRPtxy3H4q0MrVC1ZJsksoFaG?=
 =?us-ascii?Q?BwDZ/UUYpyLE3bA+IM2hY9RCPBQr5jDnOyEwF4Zb6wLpuhJz+4q+YGGYz3kc?=
 =?us-ascii?Q?mSkTEP+sF8RhyEZ28QPhPrNAvjw/3kJHCAB68htMQOwb0VDsBdd7iWfFVCb2?=
 =?us-ascii?Q?+So8m7LkMrI7fUv0W5LwKFRCVpy5wgT0FoN6SlmUjkplGDeALGztKuAHJeyZ?=
 =?us-ascii?Q?JKWN0F4oDj0Qhg7JkqxHdImBrg+VpoU+I0JZGpfRlEuv9k8gW1H05eVDuj6X?=
 =?us-ascii?Q?fKOjaFAWqKUf0aPh6igGIIaq/+RhCb4rzyBxSNtPsqMj4kloWfdWik0iVoGD?=
 =?us-ascii?Q?+XNuxBdD23kmFxAwyjfLBUd0Mi+WNLlAfZmtdZnq2GmFCzLmO1FZADLOEuqp?=
 =?us-ascii?Q?uM2j6zXLWcUpGN4DSEXYsw5Y7SLuJAsBS76zh1cSRFxBv6eFA7X9+osuLC/S?=
 =?us-ascii?Q?izCK1gY+gTO31GnlXHrc6oevtkGWysFd870erMjS+xps+iYN1KV++DPSD+td?=
 =?us-ascii?Q?baxjqeFOzVjn5s7gZHMZmdCfD7hyHeDRYDk/3KJaTggKesJOfXbSY3FdOsrJ?=
 =?us-ascii?Q?VD0e1mz6VN34kYgvmVYIa7pMLlYkUMzztJ0MBpejM1p0+vcxISk/UBEcLbxa?=
 =?us-ascii?Q?aBMc+rtae4ex2FPFXjYQXfxc3O3rNd6nurWPIElGT0opb4+7gv3fkTOK1+Tp?=
 =?us-ascii?Q?StKziF17Ydmj6M45W3hHyfvJoOL/P/BBGnbDHHtb7JSg6+/OQhwYBcvqOVx5?=
 =?us-ascii?Q?KJY2+f/0/Qx1XRbdSy7e+uRkCJWLLaeGiugWOqzSkgY+nF5TfSFNeDQe9Fk1?=
 =?us-ascii?Q?NJOnARG0iDqOkdSXXzVVp12BBOt7yezMQUaSUMfcpL95wRsQmfeFilicGW07?=
 =?us-ascii?Q?IjCystFYE7kOZWPe9i9Qqp1XWzIku1zJPc2E8MyViNrkuWHFybGrMTPuWerQ?=
 =?us-ascii?Q?LdgjhaQXp0nIpfr5PWrSKNgDu5uZ0NaBNjbkC3D4K5tz6Ch4g43v5BWbcPfq?=
 =?us-ascii?Q?GLMuX4kCkrQiY2bPpCDbnt2zD5xP5/V9RcHd7OPTyAl0Z/clCLYCtxpk5GrP?=
 =?us-ascii?Q?EK/wKHumx8gmiYthuzex6twtEDa1rlvG58RSQdoj+Yn/Lujzg9e6EGNyWBF7?=
 =?us-ascii?Q?6EW+mhKnWx7QrY3IN+ZtbCXqSikQaiK+sK2GXox6xqQZCXy/d+z7zZXX3Fje?=
 =?us-ascii?Q?GOXchoerHvZTJPLuUCovZLa/IsSGpa0gY1rCl6OChOXSUAVfB83wzfhZmjam?=
 =?us-ascii?Q?iXhHJd9x/eDoEcsG3Rmaz4AKavEVt1Z/+07cGQStLbiDgWZ00Ue2vfmvxbdo?=
 =?us-ascii?Q?sp18HeE3Zp2e7GaF8pDvPYegPI1O0d5nKYGfVNkVK+AIbCc8N/drgsLaKLGg?=
 =?us-ascii?Q?QJjq0ZNtdJKggxQc0M4LYLu6VLpkzNK3HqeGSJ7XEQLdZuluokCtEsBj1VgH?=
 =?us-ascii?Q?1Z61h+AZw9SfFB44kf9G26QaDCpQsWsxygPmzO5m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6277068-bbf1-45d2-d4f9-08dcdc6bed33
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 07:38:48.1180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRsdWVczZLnqKkJ+ozkC9tzTUqsXxG1fr67T7V9NVqxKl/+KQERUyYcQ/rfh7YZf6CRH2wc6854VrAsRvNg45A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6881
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

From: Alexander Stein <alexander.stein@ew.tq-group.com>

This adds DCSS + MHDP + MHDP PHY nodes. PHY mode (DP/HDMI) is selected
by the connector type connected to mhdp port@1 endpoint.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 68 +++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index e03186bbc4152..6bd7d2b2aba2f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1602,6 +1602,74 @@ aips4: bus@32c00000 { /* AIPS4 */
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
 
+			mdhp_phy: phy@32c00000 {
+				compatible = "fsl,imx8mq-hdptx-phy";
+				reg = <0x32c00000 0x100000>;
+				#phy-cells = <0>;
+				clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+				clock-names = "ref", "apb";
+			};
+
+			mhdp: bridge@32c00000 {
+				compatible = "fsl,imx8mq-mhdp8501";
+				reg = <0x32c00000 0x100000>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "plug_in", "plug_out";
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+				phys = <&mdhp_phy>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mhdp_in: endpoint {
+							remote-endpoint = <&dcss_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mhdp_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dcss: display-controller@32e00000 {
+				compatible = "nxp,imx8mq-dcss";
+				reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+				interrupt-parent = <&irqsteer>;
+				interrupts = <6>, <8>, <9>;
+				interrupt-names = "ctxld", "ctxld_kick", "vblank";
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+					 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
+					 <&clk IMX8MQ_VIDEO2_PLL_OUT>,
+					 <&clk IMX8MQ_CLK_DISP_DTRC>;
+				clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+				assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+						  <&clk IMX8MQ_CLK_DISP_RTRM>,
+						  <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
+				assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_SYS1_PLL_800M>,
+							 <&clk IMX8MQ_CLK_27M>;
+				assigned-clock-rates = <800000000>,
+						       <400000000>;
+				status = "disabled";
+
+				port {
+					dcss_out: endpoint {
+						remote-endpoint = <&mhdp_in>;
+					};
+				};
+			};
+
 			irqsteer: interrupt-controller@32e2d000 {
 				compatible = "fsl,imx8m-irqsteer", "fsl,imx-irqsteer";
 				reg = <0x32e2d000 0x1000>;
-- 
2.34.1

