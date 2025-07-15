Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA47B05991
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BB610E59D;
	Tue, 15 Jul 2025 12:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V309nRwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA2310E59D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wy1uphBpOAWUeNZt3rsaNMoKtB43NfchGZ64r4W8WK040me8lz41hZ5kCf/PTXX6E081Fm1e1ycERbFaHYaCtaFda0sAsIu6S+GwEyUS+AcMcm0K9hnKHb0Mc4OqBIoVu9x4Kiruqx2B0njKiwyC3h23IGk/G12/I16y/HJZElp/wsnkvXSpiMJQIVwznFtf/DIv9ChFrSpD/b92iyt8R322nqKH5ZFXLXOAR3zCQAIK9JhRxcDLkzvHD1yzRxVLxwd7/RynU54aOOxt9D7PfbPDETXRkfAKqwhoyieIS5Rq/BR7mpDoEAN+jarwUr0Dlryh8ccICno7Ss6Z1kBUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTF1K21fv02XDvlt6RHumfAyNPbI+ch2IvAlumzfFUA=;
 b=hwqKWLK3AhQlCJ+QGY6Kx5d9lBQsHm+V9J2Q0KoNGSCblqqIiTsBftgvKn3CmJiT7D1wjvcWha7tfwmeBtkgVLsoZkZzQ5vIzq5iYO5xNGSllPTiWCagMY+mhmxLn5Zntzhc3f+cd2dVJDUMozUmExIr7NzFalyMsUyKg61w1PzifpeD3ggVfPqfHCLyg5Z/3vf0GQfjJeR4mpk5tlrIdl//nZvPMGGwZio3+kEV4eHxX6+r21OzLCFgUNrGhSOww+Qe0udnffbYCU7fIgZuCRCk5Jgg7Gq5HUJrkny8lkQ61rnYbXJKExJyu0vQfv9yzt4iORh6nSd42V3px1cmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTF1K21fv02XDvlt6RHumfAyNPbI+ch2IvAlumzfFUA=;
 b=V309nRwZ+i31Zidxd44f7Lf7xfXPfkTCscvsf51+YbnKAW0E0owOsI/8ha804Mx7IivslR6JF8ocDw9jRh5PJ5HRyhuMQzoEJXuqz8HhxsuXycAtZopyt7Z+60Q7QElN60x9IOaJ8ANslB1SyDozf1vhDyzbFJHV+pPWw7X9Z1qw8ktbjfeSLJdLLf4SdMbXvRrPTTG2yFJDwVwUSA9d0OD2GofmIenkkqRXDsQzwr3rfP6qBQNQeZ/nHmT9uFpwCA4X0daWBhwtbi2h3OO1psFt5ksEdo7i18CaU95sQY9eOutbWjV+CeYQeEn7bLPIl5acLYGkhPZp2znir0oQbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA1PR04MB10527.eurprd04.prod.outlook.com (2603:10a6:102:442::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 12:05:37 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 12:05:37 +0000
Date: Tue, 15 Jul 2025 15:05:33 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: imx@lists.linux.dev, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: imx943-evk: Add support for DCIF and LVDS
Message-ID: <xmhc243pyjxrjcxyf3vdodfakk67ukwjqgmqxouvkrjrwo3icu@t65rlpoqspny>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-8-laurentiu.palcu@oss.nxp.com>
 <aHCb+nj2qb8+P5Mp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHCb+nj2qb8+P5Mp@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA1PR04MB10527:EE_
X-MS-Office365-Filtering-Correlation-Id: 046376b2-e0e9-4e73-fe8c-08ddc397e8c4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|19092799006; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zJRg73qymLlq6RlEhjqnK4Xg/WQMbhSEzSUid0JNb9hUKDkSGvHkyL2Yp8pB?=
 =?us-ascii?Q?vEdisz6fJtv4HCmtzGfgU65mWMhEyvrTwnhv9JZeoKiNB5YPk5zQUB0K/tql?=
 =?us-ascii?Q?czQe/aCW+qACKlKy838cUx7M6i8lw6LSf/1UCXOukuRvD+G4B4S5js9fMMPH?=
 =?us-ascii?Q?9rpg0XdGPSUJi8ezWbt7taQeKKD5Bmojz2tVI7uWA33eieMCt6gaUwanwrh0?=
 =?us-ascii?Q?4Nm5j7h66LZ9HtNGDLkY49NFTTRiYCEVsOr00u1EqmgppODejtH2/n48nIJ+?=
 =?us-ascii?Q?7gjZve6yuUk/vaM2SuhqbDLixcL8gbopJHz9Jr9tnzQkzb0TCN40uY3cXL7Q?=
 =?us-ascii?Q?CpvC7vqtLuKHOBN5sA9VPVFauuozwu4gu6o5WCwKOzzZWNQEBfh2kyjgNQis?=
 =?us-ascii?Q?6LnaGFqOCr5e0PwOQtpBqo7RsrysBBDRt+1WJfo6aLzGY72RwjER11apnPsw?=
 =?us-ascii?Q?JMntBd97oCy3l1RnQ2+Cof9Bm5C4QOUqVbALoezvXpowOsYveSaOvFPo2D1y?=
 =?us-ascii?Q?Q6ervQhhjnN7Ji6Ns1xcz+2S64sgv4X27r7Mp3kQ8cUhvu1zL57kiLuKkK4J?=
 =?us-ascii?Q?lUk9kCIx1o8ZA6MbOsl+LFN7QKACj5C47FexjP1jk7vWZ4JQlzNFPt9bjYeW?=
 =?us-ascii?Q?CHZ39dNQcvItL6Ggkn9OJ3LCIqSGnFKVhI3LU+WFm+EFqea3jg58GqDK68Yk?=
 =?us-ascii?Q?upuqwNxgnpDgItc32/sd8WUfi4REV0ny3YQsCPHlSrtbidOtw1SF9k2stshm?=
 =?us-ascii?Q?jiZ5z2j/BV+yKsnAhnmS413lGatp9e8DnqHy589RBCWkrfXEvSpZBd/WQ1GZ?=
 =?us-ascii?Q?rgzOIxs1SRCgQIK6RkLrHXKWiRXOitYU2gfHGAJ0BGjCYtR4Wnweu0F8a2cf?=
 =?us-ascii?Q?CDXlJlz3Xx7xTz5mCRx709QnnE0O1ww4b60XXEWR9QB1ZLewWKFVoZqEP3NW?=
 =?us-ascii?Q?pW8GOW50sIdlEK9QORLx4NoaR0F8Fhm9lTu2i593YepkMpCwknePZBOelF6x?=
 =?us-ascii?Q?/RaxvEiqEBCm/t6A+jjVjSaBNUErB8zSh63hZw+PtsPVSNEzkPYsmYqgc5tW?=
 =?us-ascii?Q?Gc2GMH7NBc21D6qomIcBCYXoo+rFqOLu6z7yhqMhfMm8qaO9iWQRahx3JJqs?=
 =?us-ascii?Q?LDsi9kA6oUq3rnnqGPIJcu0j7AE5Uoqdpxpv6E5zuomIZqG18xwU4snAIvEC?=
 =?us-ascii?Q?EWEBSuhiKQpyItcN2RnnoLhnhgWgRZWuf+WB7YRxl5PGR/znXVygiLpQfbrk?=
 =?us-ascii?Q?ONCZdjH02ULhTKAJzqkFyAtPa8gP5VS4tn3JcASNgOVB2ExlGHXyOeCR54du?=
 =?us-ascii?Q?i4H0d9wyPbyDVCf2zBJBCV2wxoxmqOrDvV9y739RVI3SV/D726XkLvEVjSYa?=
 =?us-ascii?Q?4leloeUuGeAsrmZd0z09tCx3Qv460Zz1JS9J2NFNPD1ysIxxdIUTHjqd6Dv6?=
 =?us-ascii?Q?1I4YtPKA0wU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DWb1nUtbuRMuyO7t2aSwEwOSWPwoI7Boq+6dKl7IpMSrG2W0AzujDnDgCUpO?=
 =?us-ascii?Q?POQspIj+Tkp3OgahDJbJ+czx4oYhgchsJSxH+eI0WW5Q8cCoOhfL0wJyioXp?=
 =?us-ascii?Q?vmwhkmVyBlYQHOtlhvA1Z0sx0Vx07+gwLwPDWSPNgt+FWFGvmcZ3FCFhD4B7?=
 =?us-ascii?Q?d+J6yxQ8O4dARNE3DWnK0m3pmlSs0OkvQqN2KByyWgmhNzwzRdjb1HXbsTvi?=
 =?us-ascii?Q?i3Tik+0C2lOvgscVQ+fc1C4Mkeujx6+th1yefjSuddhu2KJ5xKb5gqrwkQKm?=
 =?us-ascii?Q?WumJqbaX5JSlyPeLWyjeXhR1vKpnWYtFfOdgqOOeYrQDC5BcX1tMtCVpidV6?=
 =?us-ascii?Q?g+0SN76/R1AYsIzyJxoyZhcK+jN1Nvf8iq048LBqAu1J+9rdhz0wjqb9YQ0l?=
 =?us-ascii?Q?dCtpn3MurH27DwrmuPsczP6TrR2b2a0cKg5/+eIVTHwEx+0SyZZgke80Rgc3?=
 =?us-ascii?Q?wmbgnn28xa8NFmkdLAlYLTbaKNlGADMn0gqyg/BdbbaJGdv4b1cbECCYiBJ9?=
 =?us-ascii?Q?gfsue+8bxf6yKmUFI/R3gemWSWWk1/dmtvQquLDXdF7N5t7jS43YUZCcFf9/?=
 =?us-ascii?Q?fbuaXieLOPcx1SSVMc7wGxpuVirfdf4JIs/naHHStj0SOvekajRZc/NhRrhE?=
 =?us-ascii?Q?oNgGSXwsfuEWmX+/BsLiNKSDDl+KqgeJISkCTayeqqPNGOleBLVCAqNYRZ/Z?=
 =?us-ascii?Q?/PjONTR+qey2I3auZkVpmB78XZvWP0d2qk6jwe4Rp0CO9BdM3rnNLyMC9PmB?=
 =?us-ascii?Q?wp2zr982gwsYmZ47EPy28IX2SKvroK+20FMW0JmaKlA0MYuvoDsj48Cv6M/D?=
 =?us-ascii?Q?9k8vIuKQ5/g5cDHBfINujyIF1C7pgElI4Z+6p9Pfs+EEsI1OCPqQaLib7mf2?=
 =?us-ascii?Q?7YJVK7MlTQmknoxiCahjolbiGjJfrQynv6qpkmZ7wGYNjKI4P/GiCHOJK/u8?=
 =?us-ascii?Q?RteW+O1/hb0KwfTzmDh91U0/lCI+qzuQAgnHjKZElGK0qGF3XvPTkLNF0KKc?=
 =?us-ascii?Q?TAu8VO1SXM6+dCMMAsHLe7eTqY+uxaZOwXG1ZJH98fnPQTjwZ0EO5RWAyDne?=
 =?us-ascii?Q?Cds7N59+0K3iRLpV/pa0Q+qmPZv1zgxrB9z6xQ5dUuIupMR7OA+BRF5l9k0l?=
 =?us-ascii?Q?xqj7TToP1Lulb6Fy1A7CNwORJNlE9annBsYaZ1QqiVBdwJtzH2WDmI5HU3EK?=
 =?us-ascii?Q?eAe9PoT676IDRrUgeAOR67TXxnX9ydnIRe2GAFjUExzm3pipozGnwzW+fVp6?=
 =?us-ascii?Q?JOj39laq3HfMExj39EIlXVL6aCr7dG4xeNErjIRzH8o0dbGSsuhHzP48ZsOH?=
 =?us-ascii?Q?Y7QRdCWeSu6E4k0NzxBpMDusvIvRsIhSHX4BPEbuItLvzS2d5Y6yUt9yVKm1?=
 =?us-ascii?Q?Tmegu7aj9jrVIwjkHkF01+8gLFhTvZQlY6nc04gWVW6RlvgNtSkwRgMBIMm2?=
 =?us-ascii?Q?3HMZSpywZiIAoXu1FgIPY/6bnBBDtMy8eRIY0wIG/BVFDLYY/xmE4+shCZse?=
 =?us-ascii?Q?rq3GsfXTqAdpOIblyJIj/jeIU2eiD1cp9QbDjUD4JB5bqJyddS1Maqd5By4d?=
 =?us-ascii?Q?8YW3Pkv2fyRHXe/Qm2zJRDT+zVX1rprlckDemCFj8iYGQpI8GDwToV5+Yn5W?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046376b2-e0e9-4e73-fe8c-08ddc397e8c4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 12:05:37.1214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpwxde+kok035rQ8PFWKHmWwSZjC3/Qd+j5bfFdkRZGTXEU6WpD5v8kc/MHNChaSJW+6zAIqKNs7rKUWvao3og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10527
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

Hi Frank,

On Fri, Jul 11, 2025 at 01:07:06AM -0400, Frank Li wrote:
> On Wed, Jul 09, 2025 at 03:23:26PM +0300, Laurentiu Palcu wrote:
> > Add DT nodes for DCIF and LVDS in imx943.dtsi and activate them in
> > imx943-evk.dts.
> >
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx943-evk.dts | 126 +++++++++++++++++++
> 
> Shawn require board dts need sperate patch.

Ok, I'll create a patch for each file.

Thanks,
Laurentiu

> 
> >  arch/arm64/boot/dts/freescale/imx943.dtsi    |  56 ++++++++-
> >  2 files changed, 181 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > index c8c3eff9df1a2..e7de7ba406407 100644
> > --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > @@ -125,6 +125,132 @@ memory@80000000 {
> >  		reg = <0x0 0x80000000 0x0 0x80000000>;
> >  		device_type = "memory";
> >  	};
> > +
> > +	hdmi-connector {
> > +		compatible = "hdmi-connector";
> > +		label = "hdmi";
> > +		type = "a";
> > +
> > +		port {
> > +			hdmi_connector_in: endpoint {
> > +				remote-endpoint = <&it6263_out>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&dcif {
> > +	status = "okay";
> > +};
> > +
> > +&ldb {
> > +	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
> > +			  <&scmi_clk IMX94_CLK_LDBPLL>;
> > +	assigned-clock-rates = <4158000000>, <1039500000>;
> > +	status = "okay";
> > +
> > +	ports {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> 
> imx94.dts already set it
> 
> Frank
> > +
> > +		port@1 {
> > +			reg = <1>;
> > +
> > +			lvds_out: endpoint {
> > +				remote-endpoint = <&it6263_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&lpi2c3 {
> > +	clock-frequency = <400000>;
> > +	pinctrl-0 = <&pinctrl_lpi2c3>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +
> > +	pca9548_i2c3: i2c-mux@77 {
> > +		compatible = "nxp,pca9548";
> > +		reg = <0x77>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		i2c@0 {
> > +			reg = <0>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c@1 {
> > +			reg = <1>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c@2 {
> > +			reg = <2>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c@3 {
> > +			reg = <3>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			lvds-to-hdmi-bridge@4c {
> > +				compatible = "ite,it6263";
> > +				reg = <0x4c>;
> > +				data-mapping = "jeida-24";
> > +				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@0 {
> > +						reg = <0>;
> > +
> > +						it6263_in: endpoint {
> > +							remote-endpoint = <&lvds_out>;
> > +						};
> > +					};
> > +
> > +					port@2 {
> > +						reg = <2>;
> > +
> > +						it6263_out: endpoint {
> > +							remote-endpoint = <&hdmi_connector_in>;
> > +						};
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		i2c@4 {
> > +			reg = <4>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c@5 {
> > +			reg = <5>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c@6 {
> > +			reg = <6>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c@7 {
> > +			reg = <7>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +	};
> >  };
> >
> >  &lpi2c3 {
> > diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
> > index 657c81b6016f2..db00a94812e18 100644
> > --- a/arch/arm64/boot/dts/freescale/imx943.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> > @@ -148,7 +148,7 @@ l3_cache: l3-cache {
> >  		};
> >  	};
> >
> > -	clock-ldb-pll-div7 {
> > +	clock_ldb_pll_div7: clock-ldb-pll-div7 {
> >  		compatible = "fixed-factor-clock";
> >  		#clock-cells = <0>;
> >  		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
> > @@ -173,10 +173,64 @@ dispmix_csr: syscon@4b010000 {
> >
> >  		lvds_csr: syscon@4b0c0000 {
> >  			compatible = "nxp,imx94-lvds-csr", "syscon";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> >  			reg = <0x0 0x4b0c0000 0x0 0x10000>;
> >  			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
> >  			#clock-cells = <1>;
> >  			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> > +
> > +			ldb: ldb@4 {
> > +				compatible = "fsl,imx94-ldb";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				reg = <0x4 0x4>, <0x8 0x4>;
> > +				reg-names = "ldb", "lvds";
> > +				clocks = <&lvds_csr IMX94_CLK_DISPMIX_LVDS_CLK_GATE>;
> > +				clock-names = "ldb";
> > +				status = "disabled";
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@0 {
> > +						reg = <0>;
> > +
> > +						lvds_in: endpoint {
> > +							remote-endpoint = <&dcif_out>;
> > +						};
> > +					};
> > +
> > +					port@1 {
> > +						reg = <1>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		dcif: display-controller@4b120000 {
> > +			compatible = "nxp,imx94-dcif";
> > +			reg = <0x0 0x4b120000 0x0 0x300000>;
> > +			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "common", "bg_layer", "fg_layer";
> > +			clocks = <&scmi_clk IMX94_CLK_DISPAPB>,
> > +				 <&scmi_clk IMX94_CLK_DISPAXI>,
> > +				 <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
> > +			clock-names = "apb", "axi", "pix";
> > +			assigned-clocks = <&dispmix_csr IMX94_CLK_DISPMIX_CLK_SEL>;
> > +			assigned-clock-parents = <&clock_ldb_pll_div7>;
> > +			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
> > +			nxp,blk-ctrl = <&dispmix_csr>;
> > +			status = "disabled";
> > +
> > +			port {
> > +				dcif_out: endpoint {
> > +					remote-endpoint = <&lvds_in>;
> > +				};
> > +			};
> >  		};
> >  	};
> >  };
> > --
> > 2.46.1
> >
