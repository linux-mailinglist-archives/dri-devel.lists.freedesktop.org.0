Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA9DB19FF9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 12:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358E910E157;
	Mon,  4 Aug 2025 10:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eGASx2DC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079B810E14E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 10:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfFb6Xv6IkbT5V7JYMXUxgxCapHrqVjOEQEgM5AKDqxZKjSZhVRD9ALBDR5/h994Qlt9DJhBjKIkMO1hRTZuhsUkJya0Hhnt9ZQN6VKM+eRNnbiVR+9IptEd0Y4RYK0OvOAjG976vvOu+PI9GlfcLolFsLh+qCGpNOYbBeqBmvZWWb90WuqExczj+oXkQLXZsujUcWpZILKXKa6shFfIw2iBtj8PsPACoRrs1VIJuQ/ORmmi5mJMw5nv68QsPMQ/nFIqUEf1LV1JNy7qeYT03Sgf2ngAdaTO6J7FOOUtzXYMxs2RGfZnSzyuSuHvzUdLlYg3VMCTT78JNZK6mgh1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uj15EUleTQEUy9kZ/99nNT+ZfPtKvXwEQCZqtk0kPqI=;
 b=Wzmzt3mpkAgd1ecl5QLbTPXYLY6TMm0DSEfue3BGsC5NtJTPO/N5JDd5jGuJ/5tfiiJLQn2KUP07nJxy3LBw1bL1nXKZsD/jyQqxXv79V+AsP9pZZlLSHbtYoNa93H+wfMdHj5NFW+rX8oa3VMq5eHW6SJiZMiIEoDFtbPEfc/a4zJ7YgBb/8joVlkVPQrxICL6av7nqCinhsyOexgnEpHZJq4ypdBkUWgpKDanncjFBKeu4JiiYcKAFB4lpVmCDoAYkWKXQqL5YFXUuJU2m69qxqDBrBAnEjuVj6sr9R6E9bsnmuElTE9AtE84w13MMXdK7fWa1gq7N49KiuL754A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj15EUleTQEUy9kZ/99nNT+ZfPtKvXwEQCZqtk0kPqI=;
 b=eGASx2DCIXmGccB0PXFzhbBxmO3cRs7pEnR8aHjohFUbALLlKKnSaf83uGLlcv4Nq50mptd8SzjustOXpGxlqruTtzBQEI2Ao9rsB5nkrCF+bewFWetFCqxnxrm7SyVDc9QbkIeitizrm753BMIIV0zu2CYt7BzMQxIoFqM/p4FBAesIuBDHLhsugPFyOdmw7b0MsYM/ZdxaXteprM/wo11sIS1daC3v9NO9hn/jiMgJyGNXhMYBfe13voaS1ZCeiIJx0CHRzw+xJAp7kGI0fTYLOC4Bi6GtLIRvZa6fUIoygooHpoCK8OK1fDs+iQFsFOdzCUk7AwUrnlRDZdzyhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB8265.eurprd04.prod.outlook.com (2603:10a6:10:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:48:39 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 10:48:39 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: imx8mp: Add hdmi parallel audio interface
 node
Date: Mon,  4 Aug 2025 18:47:22 +0800
Message-Id: <20250804104722.601440-7-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250804104722.601440-1-shengjiu.wang@nxp.com>
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: df6e336c-3ce2-4b8d-d1f4-08ddd3447881
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qd4mqIODJpvK4dPICNCdmMyry65SpaG1EzB6BYbRFHFe1O/PZ2h7MQXSu58k?=
 =?us-ascii?Q?VWWuBKpjHRTMF6+7nlI+XGXN9JSwXWJPhDAy+slE8ClWQcP2oe9L4kLb8aA0?=
 =?us-ascii?Q?kL9J75kne5OU5/SCaW/Dhxvxpigl9qAUqyIU55NMhP2i/ElKGMfZfj1AuTW4?=
 =?us-ascii?Q?kSITU1Zr75zWzj5YlzPr+fkEMh3UOYfj9zynK1xMmUQDgBLiEepktZx/eYIB?=
 =?us-ascii?Q?Hpviaay518LAwoW57kFzbDpziqfTroU/nfWJbg0aasOC2bs113JnPYiCTInc?=
 =?us-ascii?Q?D1Jj3XtKMXSOfBi4aMCinQJSmG4bFkwpkSXvLwzguKygeqDc0aaOYqURKcjB?=
 =?us-ascii?Q?i8Oga8gteP5SzIxRDSttMODfbcjwg+XoDeKv0/orRDss4zd/mcRV+HYvaaja?=
 =?us-ascii?Q?Mqz85Yix58IaYWnfP4pasnpj/XGxHwcm75PjGCH+UCZ3poJx4tYF3towcAze?=
 =?us-ascii?Q?wx8bS+gLxmmFTalJxNXfN5Rd+x2vUXY/yheoCp9x/Gsqa4EsettFgRDJFO/X?=
 =?us-ascii?Q?3PNQtGTMxLdYydBW7bDb95H7ykXQQWoIpdafG9GvvU/4/n526POKWMPFDBjl?=
 =?us-ascii?Q?2UbY5zkdb1+JfzHSNZep2JKcm/A9fTGwz+ivNm72T0/FcTtmKvP4IWXJql6H?=
 =?us-ascii?Q?y9D6JVyl3Inmc5jpiGho4pirTNB0UEsocCFqof6UDJcfWoFftVz6mR1R8N3+?=
 =?us-ascii?Q?X76FByHIrIXqVqNCIV8+YdCWtFs8mmLfnURfDqcOXzGQn3yUnDNRGTdE40e7?=
 =?us-ascii?Q?7F28sgsfWDSSl0kNfl63BwGGLy+hx14Lbl/VhFnj2c65IF4n71nMPEDBj2LS?=
 =?us-ascii?Q?nQY+fWkIbjLLplant3iXlvqIcC02sa4jldpcG1iUDaXt9kYTEbbTRMP9Lqbi?=
 =?us-ascii?Q?ejz7C9NcMDktRKTntQJTSUKg694pOz8/WYW9lWUs0UuazygGSluCiya/QwX5?=
 =?us-ascii?Q?F07TmV75NeSBn9zna911lL5JyAhw8hk+33b0mOCZyIigxjzXb9sb10Ee42nH?=
 =?us-ascii?Q?4RcBUMDECqRT9mfR+4Cvx5B6NUWSDd2EVS2eJYGwO+Zc1Dh/AtmpOa+Og7Hh?=
 =?us-ascii?Q?HSQkFROvOygdFBmmwQ4kn0b6yiWZ5bZG/z0tpjRTDf3wXpnVzJVwe1eB9EYD?=
 =?us-ascii?Q?7DcRQ/2yT1KgJfBw/OkCsMEZkxbda+ceOOA9sl/ahyezM7xsC0QGY/KpePf+?=
 =?us-ascii?Q?GdXavWzA2OlRlCEo6X8tKZwmpKyagrC6RzfvZy04j0vXltH5vovJnzBBba5Q?=
 =?us-ascii?Q?IWn/SYw29j29Ne67ATiBtodi2Fwj7ibmH5Fit+Zl5KoSDG/spcMB6+o7/ONu?=
 =?us-ascii?Q?53JWHgS5bUuKbzG1N9VZt2DmHeobsXmrRjd/W1ORcGkhCqrCnU5ScnGYljyE?=
 =?us-ascii?Q?MVqYS2HCXGPrWAZ9SDzvdzsF7zv4Blto1fcmFM8YRMWcGIIWHSS6ip89Y3Ze?=
 =?us-ascii?Q?ThgG7z2eKo2JmgfRNNrIcqAKFh1JPyFVIXLrLbvXEFuoaf0I78tdlzkRBlQ4?=
 =?us-ascii?Q?PFgBFdRzWQ7MjR0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W51S9BYzj5vadMqkLYmb1gSkILXMMiICN/rPC4dNDiDQduy0UlnlqF3C5iNy?=
 =?us-ascii?Q?Q1nX8fwELUkbneAzxGu2WyevTG6N8ydWx/+rpBF8tmiTT2IBwxk2LS5NK7bL?=
 =?us-ascii?Q?wlNWftYaW7urP3g+9SoyiYxhIBFYu9yAi4JrGa6BDY+/1uDJ2wsa3YKHVoZr?=
 =?us-ascii?Q?NbdbFCUJ0/Irfo5m3m+fntCcWFoSjFxDzdAhLCveD7BCP10ea14kY2MllDAD?=
 =?us-ascii?Q?W3ElRLIgJuKoJUzj1C5neO7z63csWKagA67sgNSGmdxwm5oaYG8zBrRvpRU7?=
 =?us-ascii?Q?N5usg58oNUrT97favgZ10TwkdrOjrCg4dae862+yFrYOKDuYrAAs7HoFPzgi?=
 =?us-ascii?Q?oN3cskE5VBs/Z93w1W8FRH6OFgMTKZP/J8tciqca3gX+76RKGDm9HsX1TY2H?=
 =?us-ascii?Q?TMB8jLdbwHIZ9aYO1sHVlMXHlmlhCr1BQED5LZDV0pK+mMbetHRWmF743Oy6?=
 =?us-ascii?Q?J5A67y4zoYeTTbjYpRJLv/5zxfbkCMkpVurkfba3H0QmhMZ0zeB611+fGfLo?=
 =?us-ascii?Q?DVa9rXJZeGIiczY+Lv3IqIXF6b2oZYQfLSqq7naiYQjatGPH0jZ9o9pnIDj+?=
 =?us-ascii?Q?dtKRDV/8kbXcHru0x5+T8gyL0E752FZwWVQUlCNrQ5KGkY+JRGsfvxfPbfu1?=
 =?us-ascii?Q?Y7/IUzJN57VYq0SNS10Ynothn9qnNIfpQo8g6fYFLoGsG14WSZKbo6qfYHv+?=
 =?us-ascii?Q?+SKd22xaIXpR35ggC2UI5G54aDarucohpazTiMdVW66Hf2MPwfgmOp2FqmoL?=
 =?us-ascii?Q?+uSnLfg0ZjAX5DclwMNxEIgudxg6c/ii4IFaL6+lYcOHAbunaPWUwB4pHGxi?=
 =?us-ascii?Q?7rSQSniBMPTZ8Zsb5JjYxtSaUWXySSsRx6e040E+nLNoObzbKBdZ3omw7wUf?=
 =?us-ascii?Q?QeXbp4qXhSBqELYVRNW6IwzX99YQb/fA7XwPBSNLF+iBbDhyWxHSjk3EOR7w?=
 =?us-ascii?Q?E6AxGoNJJX5w2Dg+bVgHvg9+ArfiUb2lWmj4PlkO+6OhWS8dGeMtS2CHm68k?=
 =?us-ascii?Q?GDZ4RXHf9zsRBSQ/+HsI0YjGAIkswPN8SkWeHMb71tZIv+hRZmaAmZ8sKXf6?=
 =?us-ascii?Q?ArHl9cBLRKzdWyRx060I8mHI9HLlTDm2f3yYEyW6eqYau7HjkXxfe4IhxiVw?=
 =?us-ascii?Q?mLbTicCyy/sWdowVkkzbJ0NEUNU8t3S1+wzRS3ngmg9W++el3hbZ3CgsGmgM?=
 =?us-ascii?Q?zLoJA94LuC8Tdo9FAwyM1ZlAWyLgzhepcWHi9e0txWSmk7Si+AEkVEWBiXKZ?=
 =?us-ascii?Q?N9HEciPwC4OHBumMuHFAKb6dvOwKP83NfoayYOvwFd3sP9hQdwIl28/nNZmC?=
 =?us-ascii?Q?jb7uYaSRmd0WILaqd14kV2B3xQosrtb6YC7gvkw4cRGPpV6HdRLOL73pUD5K?=
 =?us-ascii?Q?3HNByV9aNo8U5MiA4uvC7XVgM4obVJlb+gWUQ3tEj0Z8DsNJNLWOnwwCrFW8?=
 =?us-ascii?Q?7Vf7PxOj6LuKMXWzL5mHSESE8DtUZiYEhYvIjtTKF8Vi5xKxkkNc628ElysC?=
 =?us-ascii?Q?YPXBwMpzjK40Eh7V9vANDjVkCfKyPcTrdYE5wLc20J98I3njZdTNj7KvX37/?=
 =?us-ascii?Q?63Di2opE53oxJ7eRakRI11J/5R61LiMYduH3+Wmi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df6e336c-3ce2-4b8d-d1f4-08ddd3447881
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:48:39.2384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtsKYf6Xw/v9LeMKK322vo+k04froDKi1ePqZT1TnOYQ9Y0D9dc717QYwpJTEZua12OgX5r3vyrcL/anqpKeHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8265
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

The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
Audio Subsystem to the HDMI TX Controller.

Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 28 +++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c0cc5611048e..cc9351a5bd65 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -442,6 +442,10 @@ &flexcan2 {
 	status = "disabled";/* can2 pin conflict with pdm */
 };
 
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 841d155685ee..00d8474bd1b1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2066,7 +2066,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
 
 			hdmi_pvi: display-bridge@32fc4000 {
 				compatible = "fsl,imx8mp-hdmi-pvi";
-				reg = <0x32fc4000 0x1000>;
+				reg = <0x32fc4000 0x800>;
 				interrupt-parent = <&irqsteer_hdmi>;
 				interrupts = <12>;
 				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
@@ -2092,6 +2092,24 @@ pvi_to_hdmi_tx: endpoint {
 				};
 			};
 
+			hdmi_pai: audio-bridge@32fc4800 {
+				compatible = "fsl,imx8mp-hdmi-pai";
+				reg = <0x32fc4800 0x800>;
+				interrupt-parent = <&irqsteer_hdmi>;
+				interrupts = <14>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+				clock-names = "apb";
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
+				status = "disabled";
+
+				port {
+
+					pai_to_hdmi_tx: endpoint {
+						remote-endpoint = <&hdmi_tx_from_pai>;
+					};
+				};
+			};
+
 			lcdif3: display-controller@32fc6000 {
 				compatible = "fsl,imx8mp-lcdif";
 				reg = <0x32fc6000 0x1000>;
@@ -2143,6 +2161,14 @@ port@1 {
 						reg = <1>;
 						/* Point endpoint to the HDMI connector */
 					};
+
+					port@2 {
+						reg = <2>;
+
+						hdmi_tx_from_pai: endpoint {
+							remote-endpoint = <&pai_to_hdmi_tx>;
+						};
+					};
 				};
 			};
 
-- 
2.34.1

