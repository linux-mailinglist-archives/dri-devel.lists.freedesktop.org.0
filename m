Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5731EB0128A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 07:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC97810E9A7;
	Fri, 11 Jul 2025 05:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="j7C3gyhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3141E10E9A7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 05:07:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjZjqTsM9VRMrHEC6xOKu1YWU4wc7vesl7xSJ8AdiDxCYCafQGaiBcEhAKHQ+ZoIHIh3GUZn2INU71pwve2gMgta/57P/YN5/oOvQlNs9dY57azTqc3n7qfBCBG9HVxR9nT0hAcvkrrXy9eSDtYyVHsLTEhdJhjYDBWUQovMlOGmNeLmIgkqaqlKOU1AZa/g6WhLq+uHqY9ADh4AskyG77gbo8L/oMtNixH+2gQM3tByrUDWApyUbY3Kv3zFJxRvlskq9keZBNYyVDPhGNkABMQ9AWr518EmcOvNWCHblde+vRyxlwFUh2ivvPIP8ymnt6HV8A/a1Cj7FLkcygS03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbSeD1itN6E0wqvvxc/SDs+CsNsvNo5nLNhZPAPMW8k=;
 b=COJmCVRCl/FIEbsxyCSKgYMUiCTm5HJcx9L9j7c2YazwcmmjdoSTRL6aAEZBQoNKqPsFqslGuGhMMH3p549uqm0X/PuLftHtns9lauCskoPcI4aNclJzk22Pzw7HjpfHHfk1eh9iv7ruzWifLI2eHla5gOUQxJHb+dQseaJ4VKC1iVIt4OSG0R0UlUXkAds5ZKzpzyOY1+2bTrLFurqlAlCbPPag4QEa2ApgYwMkQ0EUIBtxsuN3N64Vh+26rBCvVOpMJa1ocDl7+3poDsNGxUM+MYidP4urflhJKQSDJTiJjoPKaE12JGBHJ5x4RCvPBzrxjWqW4cNyyRlQLSHk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbSeD1itN6E0wqvvxc/SDs+CsNsvNo5nLNhZPAPMW8k=;
 b=j7C3gyhjM/nP+4rulBI1OjrQqa9AbULaVqhdwTtP5BhI6I0J1Xb2/z8Vymp0WKTyGIqlHU+kia8f/9YTdPVyTKy7AoOS3KZHA3/ZpL285tx01iJwsLQ9WxLGUXGEfuR7Gx51YrlX30IGXmFSGZ7JmsNoe5qrUTyJcHigFbV8vLDyqeuaTCYo5+AMsYYmshznknNYMaHxXzSfDYuB9OAsIUICn1O9lZ9iSdDEvj21bR0ekxz+Xk5Up7/S23X4kdqo/rOxxoV1TySCRjWJ7JPOdk2dk0o7Y9uDsEz4+cPzj4UPR1oXDMdsKzjbHqe4OF1tdnVQ1oZZqsszAWhkfn8gOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6796.eurprd04.prod.outlook.com (2603:10a6:10:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 05:07:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 05:07:11 +0000
Date: Fri, 11 Jul 2025 01:07:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: imx943-evk: Add support for DCIF and LVDS
Message-ID: <aHCb+nj2qb8+P5Mp@lizhi-Precision-Tower-5810>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-8-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709122332.2874632-8-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AS4P190CA0035.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: ae724cba-9273-4ecd-3408-08ddc038caca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?28lpnxpcgubSlZ+unylCYjf51TjfJnKRn2iDADd1HxBVGA+Y7vMSx7yp1aJK?=
 =?us-ascii?Q?LtEp/pUHHYFg0wlJ5UuFpyLpE91Oqn1DeN9iJinbGZXoR0HRfgU/VqMgtnvS?=
 =?us-ascii?Q?su7VziNhqNMyraCGzLndmc2O1JMpSl+ZJwn8oNoOTH8yQJcTU17rlmXyenUb?=
 =?us-ascii?Q?xjI0PiizyA5U8j+VNZLZ+1TKPa1EVrR1NC122Rbfu+8h/QKCTV0G/2X/RMvl?=
 =?us-ascii?Q?FT3UW2TjOZ3Z9c4GnDC2oGbwGoBfbCr/Izps56EnGt1bIobr/zoq+SNOCEjm?=
 =?us-ascii?Q?UbvvCS5RhIFuG4//JuwUWXSNZO9L6HBZEo/EIjNuJ/fTaEcRvLu06MW+L58H?=
 =?us-ascii?Q?fzGUQNEB0JFQY8es4nQTucLSq9OT6K7eLM423ecK0Ol/bnFUbc9tLlasv7Lq?=
 =?us-ascii?Q?FPsNqfG/ny4brvPhiodHFEsvvdgdPzZkxviBxpb7GXuxZeckq6u1n2Bq9nlQ?=
 =?us-ascii?Q?tUX7WWi1o6gENksFouS5cqAr51DHy6MvtXyDuRuVcVOhgoo8285RpJA1rwae?=
 =?us-ascii?Q?ZAtZg0YgdtqtqMmB1MKwC4/q0K9NGXH3W0GfRbYF0xtsbUi04fFBxRDCkYB8?=
 =?us-ascii?Q?E/+7ja0jVuALbwcvveZFxF6wXpn/SX6RpKrM1EKQLq2C9ZDLx/GCA6VHzVof?=
 =?us-ascii?Q?lkPGg/OSQFbM5/kjetiWq5iIpSampvfFiOwUVR78udacxT2hNsrXTdMN88Gx?=
 =?us-ascii?Q?BM9q0AIRgO+ry4tl0271o0ccR6uILXDhz8f3pf8hdzn1qu+jUb6c5Sap2fgD?=
 =?us-ascii?Q?Nbjkrw+kGjh5F7gMJzWDdaRD3Mxu2912oxuPc5K/Xu18HIIw+YYKFSo+jVGH?=
 =?us-ascii?Q?6cVTf6qOBL0li+vbJp6jSt8xp5Kp6iGc+LzQEem9/TrbuaM/yaDlBtVHFxhK?=
 =?us-ascii?Q?0QvFS7p4jAjOVD2HQjtFObJbs4aJmiJcu8OE3QP9BBoDlMDcyx5MZ3deBw2O?=
 =?us-ascii?Q?2mhZAT2uk4OQ+U5CByd5+y8E4vBox+mUbEhYmE18aQ/zXp3QOiVjP/YatWdA?=
 =?us-ascii?Q?YKO4NqTlspP8CKLMD0Yr5ZuekqjVzfR5A5z4ZjveLABpAMtaj/OeIYfe/TKV?=
 =?us-ascii?Q?INO3DmJWeLMn5N/7QVQMqmbsyCD/oFTs6raNH1TdEbzN2h36BAKn4gxIIU32?=
 =?us-ascii?Q?ri+BxcG54+1117TKndwW8XGJbiNY3y8Fms0ceN3fzQDQerO0CMreN84laSWc?=
 =?us-ascii?Q?V5bCWGKl4zL3VFEcDvSIxCNhGv4hGKtqbChfdUw/X9dyNqHnxawX1vEl5mm+?=
 =?us-ascii?Q?Lba3J0HaAIxLRrz9Q07dUkB6Xb0NmnIVSEx9uqxvWbwCmTM2tU/Thh7b4Wee?=
 =?us-ascii?Q?QuLRIIXSi4/YRq2GhEkBdSv5Pd5IkBqG5Ym+QexUVtn7Z990A50uLM23CLUv?=
 =?us-ascii?Q?sWkMnTy85EVbPmJQjAXCSJaGtk3aejuCQ9y5ngHTniDt87p7teSNy0u4QLp9?=
 =?us-ascii?Q?Z/l2oyntMqRaKZAVLr6U/bnVX19kaH/4opzXzvjJ0Z7W+T0imWhT4yOK9RYa?=
 =?us-ascii?Q?X1eYnDxxdGROzDY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YHkw6wZ30wVQjnkP1ylagxJuf1pbXfe6O4HKQ9GsdPln4Qxx7A8Aj49YjhjV?=
 =?us-ascii?Q?VbWR+zXzD7+jnuJv2mGJ+BHU8wam/Ttf/gYpRnO4CoRhksi9DglRxZwHZGTw?=
 =?us-ascii?Q?XsoznyjnRXGEtIjzgXMZIULO5G9BsjFrQ7u6aMF0VtmdfJoGSsx+vu9lSdLy?=
 =?us-ascii?Q?mnIZQG70seI5eG/1g1BPqZBJyvJoY7MY1rKAPFwP/MauK+KfUPpSIk7Ciulc?=
 =?us-ascii?Q?P6OuNNss4JPKkFxnoCZg1ANmkYw09mSs6xAo5b652RZStrRZhnAtIMU8mAA4?=
 =?us-ascii?Q?45Dw5KjdHkCvS39sMbxSUQsZuzOrrfvUPN7qY4QugwZi242JezZqRENGwPwi?=
 =?us-ascii?Q?jASlcIbz+jjT6hrz7AZvYLjIwuc0VvYmqiumDEFt5NCf2n+5wKQFBDGZvBcl?=
 =?us-ascii?Q?mgxGZsYt7N3VfHGWf5Zvl9eEEE0RE4Dqak2IJpuJ44BKcLvqCZyItU1k35wG?=
 =?us-ascii?Q?eSQgJgs8Q+L6WsEaNc9GQulbpaZz61Gid6igmejSNtPC3LpRGe61g3CLDlRi?=
 =?us-ascii?Q?4/S+Q30gaC7ALcdxzZ4WG4AhYE1uKZ5mNNDjtSbEghqp0Nvl49qpUi5pwfN3?=
 =?us-ascii?Q?gW5vIaUy5uo/DlDoidHzGM5sfJAEBESbf+ka6f64AO4xCp6mVHxf1bV0RGm8?=
 =?us-ascii?Q?gLf09wLjDkEgun6v42dUdOTishdbboykn3PSIsT8wdHhcGMgLMHbSMJvlUWb?=
 =?us-ascii?Q?voum4B1DamsIGxo/SAVIfMLBQs4nVs/Fw4hU0PKwOItXFrcezmt2K4xw+CzM?=
 =?us-ascii?Q?JuNhRsvzav1BcOTjJkFRGMj43ONRYqbA65DrF07fy0Xmq2U0g5cOdR0QMD42?=
 =?us-ascii?Q?lWvtvKmgXT2x6gaygkV8I1X6zYVV+xQuhcryo1V9WiU1zI0RvashS5b3+/vC?=
 =?us-ascii?Q?T88DF7kB9z9L9MROQY0Rq035QM9+mWsLvFIOZX5Hsrve1tziM+gWrqIgr1k0?=
 =?us-ascii?Q?rCq6nz4rawJ3WKj3GNsxwkKOViixkvg5IE5SVi0DV40DU6VzP8QlYsszxIXc?=
 =?us-ascii?Q?TPZgMOFzDKLEpvL7lu+n+fONluUXneKBYfaIvEYhFqxJiv28vXoKsJ/3NWTT?=
 =?us-ascii?Q?52Mq5fdNeTNJEVtLCSaZgz5Y9ykKK9IYEYi/s1V6MXwOzXVfveSwufH96SYR?=
 =?us-ascii?Q?fff7Oj604P60m8/bbJQaAyUFclFPoazDvNFR9MH7wtH5HkxH1UoNvakeP2X7?=
 =?us-ascii?Q?fWN5ZMFLMUHZ1objD109ZghgKJ51OYFccjDMW8Lb1Rp0Iib2skMi7ioUlbfL?=
 =?us-ascii?Q?qrW45i99ze5i6IFZW3aFIaulwEiBWYVXbL0XAS8UuSbsax8yV8Guei5tT72c?=
 =?us-ascii?Q?Ffyo437Vi1s6y9EJtYsZvWnMaxsB1YR/hfjmbgfeC0vO8v1/fuCxnvJ95MnZ?=
 =?us-ascii?Q?ovJ6cpDdCDNqsyFwvZoVLW1LQ6/1fRODLDp45B484DoFzD+OX7pox9b8tfR3?=
 =?us-ascii?Q?VwweRlvwRtLZj3hNrHSHWFkwf4oR/1qtTSpMIxoR5iYcb/lQZCC5bKKRWFvX?=
 =?us-ascii?Q?MgufBEhhaUtTlS3s64+3YUVJm9zrIxiboUdtTceuOjSmV9AXPceBa4t0qTYl?=
 =?us-ascii?Q?7p4KHwzuquOHrvTOtEw0CFviyJ9u/bEVAiSXO5JD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae724cba-9273-4ecd-3408-08ddc038caca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 05:07:11.2744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZHwF6CRaTnJt1vN7K3Twp2iF9ARcoWYGWeFbRtRvjZ+IMIkr/Vdg8jHUxytrTNh/RN9MMAbT1I9YN7mWkLEQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6796
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

On Wed, Jul 09, 2025 at 03:23:26PM +0300, Laurentiu Palcu wrote:
> Add DT nodes for DCIF and LVDS in imx943.dtsi and activate them in
> imx943-evk.dts.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 126 +++++++++++++++++++

Shawn require board dts need sperate patch.

>  arch/arm64/boot/dts/freescale/imx943.dtsi    |  56 ++++++++-
>  2 files changed, 181 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index c8c3eff9df1a2..e7de7ba406407 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -125,6 +125,132 @@ memory@80000000 {
>  		reg = <0x0 0x80000000 0x0 0x80000000>;
>  		device_type = "memory";
>  	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&it6263_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dcif {
> +	status = "okay";
> +};
> +
> +&ldb {
> +	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
> +			  <&scmi_clk IMX94_CLK_LDBPLL>;
> +	assigned-clock-rates = <4158000000>, <1039500000>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;

imx94.dts already set it

Frank
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			lvds_out: endpoint {
> +				remote-endpoint = <&it6263_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&lpi2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	pca9548_i2c3: i2c-mux@77 {
> +		compatible = "nxp,pca9548";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			lvds-to-hdmi-bridge@4c {
> +				compatible = "ite,it6263";
> +				reg = <0x4c>;
> +				data-mapping = "jeida-24";
> +				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						it6263_in: endpoint {
> +							remote-endpoint = <&lvds_out>;
> +						};
> +					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						it6263_out: endpoint {
> +							remote-endpoint = <&hdmi_connector_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
> +		i2c@4 {
> +			reg = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@5 {
> +			reg = <5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@6 {
> +			reg = <6>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c@7 {
> +			reg = <7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
>  };
>
>  &lpi2c3 {
> diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
> index 657c81b6016f2..db00a94812e18 100644
> --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> @@ -148,7 +148,7 @@ l3_cache: l3-cache {
>  		};
>  	};
>
> -	clock-ldb-pll-div7 {
> +	clock_ldb_pll_div7: clock-ldb-pll-div7 {
>  		compatible = "fixed-factor-clock";
>  		#clock-cells = <0>;
>  		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
> @@ -173,10 +173,64 @@ dispmix_csr: syscon@4b010000 {
>
>  		lvds_csr: syscon@4b0c0000 {
>  			compatible = "nxp,imx94-lvds-csr", "syscon";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
>  			reg = <0x0 0x4b0c0000 0x0 0x10000>;
>  			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
>  			#clock-cells = <1>;
>  			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> +
> +			ldb: ldb@4 {
> +				compatible = "fsl,imx94-ldb";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0x4 0x4>, <0x8 0x4>;
> +				reg-names = "ldb", "lvds";
> +				clocks = <&lvds_csr IMX94_CLK_DISPMIX_LVDS_CLK_GATE>;
> +				clock-names = "ldb";
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						lvds_in: endpoint {
> +							remote-endpoint = <&dcif_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dcif: display-controller@4b120000 {
> +			compatible = "nxp,imx94-dcif";
> +			reg = <0x0 0x4b120000 0x0 0x300000>;
> +			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "common", "bg_layer", "fg_layer";
> +			clocks = <&scmi_clk IMX94_CLK_DISPAPB>,
> +				 <&scmi_clk IMX94_CLK_DISPAXI>,
> +				 <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
> +			clock-names = "apb", "axi", "pix";
> +			assigned-clocks = <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
> +			assigned-clock-parents = <&clock_ldb_pll_div7>;
> +			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> +			nxp,blk-ctrl = <&dispmix_csr>;
> +			status = "disabled";
> +
> +			port {
> +				dcif_out: endpoint {
> +					remote-endpoint = <&lvds_in>;
> +				};
> +			};
>  		};
>  	};
>  };
> --
> 2.46.1
>
