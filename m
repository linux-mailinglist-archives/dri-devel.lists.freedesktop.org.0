Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64160B0A86E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F5C10EA00;
	Fri, 18 Jul 2025 16:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GVWuR/is";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012036.outbound.protection.outlook.com [52.101.71.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF9710EA00
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:30:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gw+GuXmdOG41PzzmMkxElxYT5O2D8NJQDhNmsqKzFo/MFaPyme9Kb16mZa7gYzf0wd1+1xvRVrE1q5gGpPYv+UWMloZ65R8PqHj4Mii/NeE5yhMiLTSYHw20U81RKaw2QGrjF08qMkt1Xqw49dkae7KhCTM7/nspEp4LCMAIWRfvpmDfVL403R9dZKKlOYRZXbIHdlV2iesVlFVuIGGpWdQkfcs5ZdlBOJ00lUCnLV3yV14H5zpUGUE5GcUX9CsKsOiTFQUsKvCxVMf3Zk5ywgQ5qzETOIgx3bNx+5pT7Q2GMsEWpFzFCpjQL26ovcQiqJFqPouol9/xK4vFRaplmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvXe1yKDpr756NGxJ95GZ0REAUOznDvcHRtIaSZeNFE=;
 b=ZwfdpI+EIbRfMfShG9sH3u+AAnejt2ec3rdwVmBo8UBxpmhcjt8/RMp465Zt12nAWJIEE3urjrsLYGhCkeRLA2bXEbQJOp2N7HwgwltQ1WT8656BCvEyOe83mRdf7lxXSh5oOVwrt+utt6teXzs/l4I2EZVqywRZB4MsneJrum5oCKcYz9fTq/8ZnLtR37VKabLvdWBPPfz72FngdA/AYrTLsZVLNwcsk0ZrAXriP/KH/KILL3+Q7fsKQdZw0O+MU+oBRq/SehHgGS+2CTeyG13xlfsGsVFeq1j80MYXDY5RLMClr6OsOzoJDMK6SP3pO6YFZd8UrlEmGBxDYtfjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvXe1yKDpr756NGxJ95GZ0REAUOznDvcHRtIaSZeNFE=;
 b=GVWuR/ispjaifhKYPjgxz/cq7zfx2Iph+U3rIFQdMeg/uVxpiQm2jz5wdUmFgv8EOlNCUc7bYYcbWAD29IoP2qSDEyqZKz7InDwRFHjZREPXljmXtX78yQ0vkbFnc9TEeITemZmWiUaAKE4Tvr47bkAq8mqvEofPOiDKXU1z7673kbRFLb8CxMrBnPIxejFphMzCExXpAo2YqhLJ5OnC3qzH6OZSGIEI4p4L+r/Fd6rpiLC3CjllOmiuWgb2Ge+lN5iPAz+7yFodHPNQT6YH+kIm3surfssULBtt52CMQAYgan/PNTLHhC41k4Di3sGMUn4rnAtMDsKoVHwMaPxW9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7580.eurprd04.prod.outlook.com (2603:10a6:10:1f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.26; Fri, 18 Jul
 2025 16:30:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 16:30:15 +0000
Date: Fri, 18 Jul 2025 12:30:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de, shengjiu.wang@gmail.com
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Add hdmi parallel audio
 interface node
Message-ID: <aHp2jxNRPfYGUiUY@lizhi-Precision-Tower-5810>
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-5-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718101150.3681002-5-shengjiu.wang@nxp.com>
X-ClientProxiedBy: AS4P192CA0029.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 1315cf79-7910-43a2-86b2-08ddc6186023
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xwLXG4QYr9Gbl8LVTGYB1YlsyX20E+piEsfgt1QHtA1+ShHHZZK1eOVQAsz2?=
 =?us-ascii?Q?aHVzRM15f4Zzi6j8gxq11JhzfS3pZie3ePvZScOOKUHu1pqEvKnP6XZHUq+7?=
 =?us-ascii?Q?PzYFDpIZg9xudqJl9VEUUPPdX3XsiTNZbbjkU1ZNkLUOTXIPqfEo621S7K5l?=
 =?us-ascii?Q?q6GMOeZ93rkEqHeQVFITtRdNXf1ovCQBRJcLAvXGjzRnt64F/EC5d3T6QSUJ?=
 =?us-ascii?Q?qzlCyUlAfh8HR3MRBMEoGoSTptePQ8lKr3gpuYbeEWj1KjJeZQa/bC7rT+Pt?=
 =?us-ascii?Q?jpobPQ4wsmiJqN57bYqaV8Z+VmPIwGDQ+qRVBXsmqnDvlIbYL49Zvy+UCPYJ?=
 =?us-ascii?Q?zU+10WiA14a78ShWVlm15wmjN9UH19NialVDEjoTx9EWYr/PLvgUzx8eRVxM?=
 =?us-ascii?Q?hrqW5K2V76oSuTOGfMdbH7SCrcyj0qGpE0ECGdmwPY7lvgE5pE+vSSb22v1l?=
 =?us-ascii?Q?80hu/N4ca8GC8FfqNZzo4o3jemWNZIqIF92vZU+3T9U5zseultq6cqGkPkQ0?=
 =?us-ascii?Q?x6d8yqlrd4JgPBNYn7nfNJKBAep4oqHx7wqerRKFvpTkS1Wst3SmZ9O7ppTd?=
 =?us-ascii?Q?Kae2b9WYdCueRttPqVKwGdQ/6etp1XS257Gt7FYtM8rRc0u/RH+yQtnhgttS?=
 =?us-ascii?Q?hVNONMxpZJQ0QoCQufzbanWDRBCWqjkp7tnIuzCXyFsADojmma5a7tiw+r7y?=
 =?us-ascii?Q?29IvJC7dCS94U0MaHjn9lK8I/oMkH+lmL3InVjHdsv7OXQoA0cXRtofHUcoW?=
 =?us-ascii?Q?FIeUBj0ohXv7HlWOg5BpEdK5xm7y3MP2fbZRiQgIdlYuHynD3Y/00nm2FwZa?=
 =?us-ascii?Q?jdSEwdaOin7oJAsNFgA8O3PTD6GgJG9Zs+diYj6OawYZ+IWA6TNKXwkIrXbX?=
 =?us-ascii?Q?PAGqOC5esld4Xxv3S0B6Vg0V5COCi7yepmuTuRSen7BDRZplD5sWW26bQgDm?=
 =?us-ascii?Q?o/in+4tc1PCJxyPy9qN6wCo0EIeTgeB/R63VHuQlgy9qeZdcZB5gmCbXz//4?=
 =?us-ascii?Q?YJjO0bE9+t42JTFHP9NA7EeVqTsSpMvkFBy1KaED9oYTmjn5bhUGradJvA8o?=
 =?us-ascii?Q?ZZ2kBeql03iUIHfMDN+7aFTa73Y1GIJttg1PEWUPJiM82BRnvKmN07uANqMO?=
 =?us-ascii?Q?EG1a4zhp6DTbuAiinMxvKE9B2W1DiQ6fQj5cUOyEilxdAxw3HrdK3r0pd08u?=
 =?us-ascii?Q?4OO0XliNlgnUSWivgDYX+xZKo4C02UdS6mBMgH9vO7+GhXYoZ56wCZCV3oFw?=
 =?us-ascii?Q?nHiudA4D/GHMYkeTuH6rCJ4S9GuhsHpiRfd9FjIVxI1ZpQ5RZfD6ncEoiS94?=
 =?us-ascii?Q?tbYsFR3OJZCVwzGuPlOeg4gPX+Tm97U5jIiygu4kmtNRMek6whh1Vyi+BMLQ?=
 =?us-ascii?Q?Ivhlwr0f86Fu+OxhxBrdvZsuXxBzZI1vl9eFWa1jdNoZj+TkLAXy5ABN+XN4?=
 =?us-ascii?Q?VqrwIJx2ZcNOO1lYxKjhy2rt4w7s9BtfPotlsd4vFm/8cF3xn9DbJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tMlLRX/jqGM4MuNybhPROqt8Sm8BSAgr+4xQlrSXFCSbCH4+pRmWcjQhhTzO?=
 =?us-ascii?Q?GBCBbVcix34DFUqBW+CmZuF1wH47A3Dfrcd7gFZcyMpgXpd7yk/uRQBUJQ3B?=
 =?us-ascii?Q?DhY73Qw4NLsHY2/HIRK0hZFh/dKLdAqEDo7LAwujfuEVEwfBaeCsrYOXmld3?=
 =?us-ascii?Q?C3J3mrVMiGMYjkPtiz5Yj7SYXYfQofoDm7hgWkRx3AL4mpASJbHOyCbX7Fsw?=
 =?us-ascii?Q?OXCpKMycVFJAmV+zQYAZA0HUECJBY8gBhUVvg7m/My0W1U+KOpgzMYud/uyv?=
 =?us-ascii?Q?PCqkX/fhiR2bH/GCpGcWPGKyq+EJfGhSlzawwc/b4Vdvc9cZ1TxZ9NfKfxlf?=
 =?us-ascii?Q?7MH93lufDgdxUk+bw1E12vN4nrXqBB+awYG1XlpPpTXbNUZ4VgUOHpOBlqqf?=
 =?us-ascii?Q?7ybMoAKUWj9hg60GOkOjmJIoGEMv0yl/VKLCVx5nTu7IzyiYHGvIpPJvPHgH?=
 =?us-ascii?Q?4fZXR48DLIfx+UyjmlBclZv6u6oBc49P/a/aiN76nNRq4WuSxDap+0HKTMNd?=
 =?us-ascii?Q?BUc5pKOchm/DIq5BRkE4YWVDi7H6IzZ2mv/a0eB8cA1hBggfMP3AX+366Vt1?=
 =?us-ascii?Q?3enzfSMskuMxJJBviFRvgIpvtGjXI9gET8jyVsNsUHHCkZTSPRrql10nU9Xg?=
 =?us-ascii?Q?yPDqArgDoNObbeOXRiVW8AfJHT1U4/FzgilFlSeJYDFaBC7+KdZe9FhfiYNs?=
 =?us-ascii?Q?Eh3i0I5NWaIybsJPkge/tHhuwh/V0lIX/m/XVx8RhRxZr9AxGLMJ3215GSLR?=
 =?us-ascii?Q?V6XZuogJ1NNjfubjgi4yYe1QzyC7LKGuMOHEpw821v5cZfm6kWa9VME8EBzV?=
 =?us-ascii?Q?sNduTY0AEFmV2M9iX/220+Z7DZI3CDDsh/v/DFmPtbzH+BDIwmptKqZKF5WJ?=
 =?us-ascii?Q?VeY6ss/oApVE07SQpUl50NAIpRf7yfOi3eVgbC6o3rBJkZeoAv7JjfzhJ3Vn?=
 =?us-ascii?Q?RrCAo1UbslbH2QmuIXn7QFmOYNogZ0M64Rl8oz3Hkvm8pTo5EzqjRrAr3lDy?=
 =?us-ascii?Q?5MH4Jt81s6yuDn1KnOJ97uRpVpBC9uBM1VRmDSbkD2cFehGG1sAerTcNLpGE?=
 =?us-ascii?Q?IYtFrNahAF9dWXY1vKlr4aFUYSqjVmOAIXmZ5l38N5G5CEKE356kuPj93Oc7?=
 =?us-ascii?Q?i9LDX0eDZmQTZOGQXixsEd29fb3m2eQuVGGDBJssfV4pvz/yobeEevp1Qpu4?=
 =?us-ascii?Q?11W/SK8yabWSU0H2Q2cEUY5e2esJh9Yh2b5NB1Yac25++Mu8lLAi8bPGGw/K?=
 =?us-ascii?Q?EkYJz637RAopcsQaENCDY23Yj/JA17lSjTsSFTLx6VfTMU3ffYWuDYHzJ0oa?=
 =?us-ascii?Q?eb0XYr2b89dWXADIlerQmTUiBuleAPkgg+dikZxp+6rxZqrFfRf2LF9N1k+N?=
 =?us-ascii?Q?4LPKgUlQlSZAr6zMW6Amq+rkVzB/hqgtTX3PG2I0k+ZwYUBWUveoNKBkWV0p?=
 =?us-ascii?Q?3CltsfmIHn4Z0iS3Qv0eBkzXJC3EGYuRimNXHkWezHfohKmOUYgw023M19ve?=
 =?us-ascii?Q?NklX6w6M4RJV+9+3TfTJ56AvjkTXE+yeRId0HsBYrpn5t1JQFYA8K5uob1pU?=
 =?us-ascii?Q?2Cfi0761davdqXrt/ISpc/6yNtdCeoZXqUVP7Psy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1315cf79-7910-43a2-86b2-08ddc6186023
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 16:30:15.2611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9bkn8q9ZDR7DJWPb3AJg4fnW1aPT0cMI8YXfh+RHHOofDMZvKbeOQUz9LMOfWZbj4MvzfomR7zmo+cbVldbrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7580
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

On Fri, Jul 18, 2025 at 06:11:50PM +0800, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.

Remove " a digital module that acts as the" is more straightforward.

>
> Correct the register map of hdmi_pvi, which is overlapped with the
> hdmi_pai device.

Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 26 +++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index c0cc5611048e..cc9351a5bd65 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -442,6 +442,10 @@ &flexcan2 {
>  	status = "disabled";/* can2 pin conflict with pdm */
>  };
>
> +&hdmi_pai {
> +	status = "okay";
> +};
> +
>  &hdmi_pvi {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index bb24dba7338e..6e5a41f46309 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2063,7 +2063,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
>
>  			hdmi_pvi: display-bridge@32fc4000 {
>  				compatible = "fsl,imx8mp-hdmi-pvi";
> -				reg = <0x32fc4000 0x1000>;
> +				reg = <0x32fc4000 0x800>;
>  				interrupt-parent = <&irqsteer_hdmi>;
>  				interrupts = <12>;
>  				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
> @@ -2089,6 +2089,22 @@ pvi_to_hdmi_tx: endpoint {
>  				};
>  			};
>
> +			hdmi_pai: hdmi@32fc4800 {

commit message it is bridge device, maybe audio-bridge is good node name

Frank
> +				compatible = "fsl,imx8mp-hdmi-pai";
> +				reg = <0x32fc4800 0x800>;
> +				interrupt-parent = <&irqsteer_hdmi>;
> +				interrupts = <14>;
> +				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> +				status = "disabled";
> +
> +				port {
> +
> +					pai_to_hdmi_tx: endpoint {
> +						remote-endpoint = <&hdmi_tx_from_pai>;
> +					};
> +				};
> +			};
> +
>  			lcdif3: display-controller@32fc6000 {
>  				compatible = "fsl,imx8mp-lcdif";
>  				reg = <0x32fc6000 0x1000>;
> @@ -2140,6 +2156,14 @@ port@1 {
>  						reg = <1>;
>  						/* Point endpoint to the HDMI connector */
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +
> +						hdmi_tx_from_pai: endpoint {
> +							remote-endpoint = <&pai_to_hdmi_tx>;
> +						};
> +					};
>  				};
>  			};
>
> --
> 2.34.1
>
