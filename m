Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F20B1EFF1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 22:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC7810E98E;
	Fri,  8 Aug 2025 20:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iikqmAQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011043.outbound.protection.outlook.com
 [40.107.130.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E2410E98B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 20:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8fJOmiL5d3mLgMUv+uXsyOuh8vUXWZiRcA4ODygGdXRu9T+kjHE6/Q4A7GYT8Jg7Cvb8dyxhJK8WB4aTYuBIphT932rb/bhlhVPfGQrXfnrWrurY7gwJpq4ZjVoSA9DSJk5zKOtajdsIxVrVmFuOebx2XaLcQ4imR5/Q8gDh8oJiaq1j2D2GD6dEqchVsQZx7+LPsUKvixSUvXwt1SDze2lcp/16Yl/dkWVhltoAYzXOLHbyywZIiqX9VmOSx0/v+MwnMwYsVTuUg+aK6Uy6lchRtaL5w/k1/lBMYXXXxevzDG7RvbEnZXnIO37mEqEuFvqHHVbJ7/2lSNukIUN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55BvJL466GLoH0PCMYJT/pvEAFNCjeJd9vgg1qYVt+4=;
 b=DpuDZ4E/ZGD3AI41ARB7eA2466G6f10flQZkZ9GfhtTYILU6vV+s0q5RFSVAATIs0awk1LYd6kr50Ee+zYDhGLSQYCA5DHGdFafwAErvrZoYNb43HPZY1dgaMayAcgQFKe+FgC2L1jPgMU9EeOnVZicXUMuUJV6NioUEkcSR0TvTEpYLtpuujd69PmRCglGBEwFyM0NQfyYhCwxMXtyxpVrWg+lDQEPcWU2zM4+vfF8ZENbywXot+NeSaGNk0ZllFvkdUZE7A+z6T+2NLMzCw/8htZfnhAbBsGoyxDMz0wVzT7vSszLS3CWY5yPcIkjTWxD7qIVPeib6id7VdZuP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55BvJL466GLoH0PCMYJT/pvEAFNCjeJd9vgg1qYVt+4=;
 b=iikqmAQlf0LOMLI7vnibhQf3C77HoKY/GAbhHshrwZtm6UsUxY+R7u9s2ihoXGW0mMxcNgkaMLYnpAcL2y4/DpLGITQA2uJTbk7KN5cmtoo4OrAynGQKztNCKTe0lQnymEQqA30wanQjau4ETdLo6XB1sHqulePN7XMARyIg7lDtgxYHhBaO2xEL0SgLeG5txMQY712f5S5uMMzjk6aNDLiRsBxkHHq9elr5qxtz1q8jhRZ9jnTLKknOKbAhRf+fBfubYmVFPqLxBipJioo8+fls8vyX9gBZReftQXQykTVa/J6oAdXLexZLJo175XARGVTzgClBfw3wjyzOPKfHGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB9474.eurprd04.prod.outlook.com (2603:10a6:10:368::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 20:54:32 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 20:54:25 +0000
Date: Fri, 8 Aug 2025 16:54:12 -0400
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
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 6/7] arm64: dts: imx8mp: Add hdmi parallel audio
 interface node
Message-ID: <aJZjKCRehvj9Spke@lizhi-Precision-Tower-5810>
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
 <20250808080617.2924184-7-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808080617.2924184-7-shengjiu.wang@nxp.com>
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: 1781a522-b9f6-4cd1-f6eb-08ddd6bdc24b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1GzF++TC1avvXmfhjClsBr04W+Bc6wryvA2ouwp7LciNCOGPGZge1RdJ1s4k?=
 =?us-ascii?Q?bhr/zWpAEbC4iWLzybSqMmHMVyJFBcwMQ4snx0dFYg3upUL+Ho94nk2m3mDI?=
 =?us-ascii?Q?dm6ANf8pXJ39y/VW5jqFF3/aMx/f021mvyTybjS0ZblrajclKs9vcw7lz5al?=
 =?us-ascii?Q?dZkNDeL2oF5aglOl19sZdSOV0qsuACaUvHaAUzeTvhZh2uBp6qivaccwhc1i?=
 =?us-ascii?Q?Oh2WgNIkTyTs2LgVt2SlMg9pPjs6fIURfZXpkJ4Jjgk8mpwWQrhlJRM+4sqr?=
 =?us-ascii?Q?a1Drhpx30H9rZpmNkctYQ9mX0tiN90vA5FZ2uJ1NlwPTChTl8OTTB05XnFrB?=
 =?us-ascii?Q?sX0niNnK05vRMtJuKrMJgMPo/PaJmn50aIakS4lG5dWzs7A1pfd/xJD3QmYb?=
 =?us-ascii?Q?o9cqRKezU3fjkunXipMr655/jE54Ua3q7yqpz7ErbX/+J1oyv0wFBSQS5PUF?=
 =?us-ascii?Q?T/9ByE6ZFuWyHZOG6/JCmmFApNFhkOnlq1bKAEkFk7nsl3QTqsS0pOsoYwsI?=
 =?us-ascii?Q?Qb0ZPYTYUQ1eiE1rDrY93AkpcsMLtr8wYbNI2bWy+1shwG6TrTDW7WAjdwVM?=
 =?us-ascii?Q?uNCPjaSKPuUQnDn7YDTh0X/Q//TQSPHt3/n9tjMrkt4AZbpa2HhFoomXYUJZ?=
 =?us-ascii?Q?m0cJiWc7EzYluWcDuvlh9RK3e6rnuLiDhc7j6nGF8sC9EIe6TtcEY9B97B7z?=
 =?us-ascii?Q?QoNQSBLzyE+efz7Epq8kEjbCKU1HnVzGJN3EC5Za7ti4Wejme+ULtTchHx/B?=
 =?us-ascii?Q?/qDHM8w8VdrLt3AfXPBj97rv5m3bDxWe26seT8QVr1BTr3EsDrYz2e0vc/XC?=
 =?us-ascii?Q?lQWUhR60gX8QeXoYG9Sy5/fOE8hKr9biL1kE07958aW5kJzQ2YUVPIK6tAf+?=
 =?us-ascii?Q?SRWZjx3Ej2FwDSDTv3zEYRaSj16b1rGYteBHkW/Rbdt4lTIo7Z/id7gkNEgL?=
 =?us-ascii?Q?Z23qRih38U4J7/fDIW40ZHabvuoMvHYrVFYeYLqPOab2wuKiouFz/JF+QS1M?=
 =?us-ascii?Q?Db9kef6tgW9blf7OYUxKaCOOPw1mreRAiKGVpOd4Gsw+laQYCsVf28DJhJlQ?=
 =?us-ascii?Q?V0z41WtB1qpkU22KQ/rdBANPOj27iqWTTFWxboEhAdcXgyMtTqm3tYpLSSh1?=
 =?us-ascii?Q?94es1Oa7DfMHZNK5HUfs4/OXr/w81ime6kY+CLnyQiBKTDErllM9nA55dI3B?=
 =?us-ascii?Q?0Ko0XojMhXPw4tc34RyH+M9No1RxuPWKpwulOZFVZKY7Lrxhf4QYIdz1Aapv?=
 =?us-ascii?Q?WymIx1/2sm+z58+BmySQlXZorC7NIc6wuo9i9xZsQ9b4T8QOUY7yCJpp9lMJ?=
 =?us-ascii?Q?/ujL4pMBv1VfqFHnkWjyBVRetze4ktHiEQ5fr6e6MyrPXepCGZxp0V7AlnJt?=
 =?us-ascii?Q?pz9UQ2+WwtaKRER7ws9hv+pi/fD9k+iUz6IH2fie/TTMFhgrhdcf4O47l9E7?=
 =?us-ascii?Q?msjryRNGM+kidc9t2+aLWdq7GxZKkaoKTJxbNueplRWP4XJNpMvlhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5KAuv0XZPjGzymAbLAPMMED0bBwP1JeisLaKgK7mtKF6WA3wQ6oU2kCuhJzC?=
 =?us-ascii?Q?E5Dmxbqt4NbkIA107DVVwgWDxXkl/DRY7e9grwKW5yI5HU36Jut7VaX/EcJe?=
 =?us-ascii?Q?phfeZhwoMvmkbZzUU1Y5cskG1eaZxJVrmLmAVPhBPqFTriDeUv43uoPsbxnF?=
 =?us-ascii?Q?75Y1NOJH8wWTPd+eLiGNoZdTLnc9Wpn+kXQ6LEJ0MWuLW5jnxKRSsB5IjuKr?=
 =?us-ascii?Q?/dpsfjHDQDnaadgC0VnLrK+F1RrINfjz5jdWG4oNHV/TSLKHE2qz9XRh8CPx?=
 =?us-ascii?Q?SvUYYCKpeKu+XsUqixzNFKAb7xuU6wUOUp8k8x2LU0rw0dzp5tXdsVuwNo0l?=
 =?us-ascii?Q?l9HD+hvEt1cN5y5KyTJb+1H1symzN+jNYSl+bswI5tviDN0/PTeJqMk4touI?=
 =?us-ascii?Q?1mCroUYkv7Ky6usRfyvr+oPSGQv3Q6NIaOW3+D0uhf55feTRrYENxeKmlyUw?=
 =?us-ascii?Q?CHAkTMtfGUr0FNeBi+HI8Ov4OiKakUA66W/uj4/jkpcwwXL//GvzUjZapgzC?=
 =?us-ascii?Q?j8+cCaEZMJa3srVGaZgmYZ3kSaeCUtT5adfoV+yhfPBPfMCjRz9wPQ9U/b4s?=
 =?us-ascii?Q?YFo2NPfTYYqN00HBSSpnVKMPeZpdZntQ/zvP11W9h8grBC5wZY6dEBVBAnqt?=
 =?us-ascii?Q?pwjES7wA67/6OwBreguhe28zCenxarLQlvJqyKfz2FiExLrwVBO/2xqtXVVg?=
 =?us-ascii?Q?L+o1knsQOp0wCHCIaakMUNMztgIBO28NC5IOu5luzi1csHsbcqWiLLIMToQZ?=
 =?us-ascii?Q?LfzwfCs5/o70/oQu3bGMp5F39DwjFZ1Iyawkqr+C8jHIAs+6+JJ0Za+Z0iK2?=
 =?us-ascii?Q?pAqwsUATkWKwHX/WKWq+HkErCBDuydPG0dQbbTNmFjN+WzOXh3qr2Wan194d?=
 =?us-ascii?Q?SBcEBSN6hmwSuONDMLpJdBqtP4B43twpd8qjQVSTUWl8zy6WELVPc7AERgJK?=
 =?us-ascii?Q?fHAlml2LgnAHRPx3aMPGhEKHZjqbofp+i4SNkUEOzaaRV8NrBPX6CrFg6A23?=
 =?us-ascii?Q?+3R0kQtGvQzg3Uv1wFDffbH3agIovuRA3tIKtBUGiY9rgj7efPgDM00wveof?=
 =?us-ascii?Q?kY4NxiUU4U97rcn0mXWXet3Wx5eTmxg+KtWHzqI6dgcwAAfOIh63alTrFK0o?=
 =?us-ascii?Q?P3TeSTkCnDHO+xjx0xQ2TKwTYguk2A23uhWfxxBhKqkocNXeVbfiCG6Ju+hS?=
 =?us-ascii?Q?+oqzvgzahgXSdWF9vy9Bp4auVVssd8Dt+QFDX1kJtFtA+j0vNO9IJX2VgLrf?=
 =?us-ascii?Q?B/95rQ3fSuuNAynsEu4tnw4E9lOTxDIv1hHMrMy6e3amyqvIZEwgqG6iHvDi?=
 =?us-ascii?Q?6B7YOMpgq/agwxE7DROJpVZP3ozx8sor1l9b91/eOhU1V2OVNvnEmjhxDf2f?=
 =?us-ascii?Q?3CkD8WaCEnok+X9KdpQ1oEGDtUbX91Etmnc3xM+5ylPPZDqvl4iBkjny8gL0?=
 =?us-ascii?Q?BfWp4Kig/Py/8rzPuvYylCfKV4FcDR1rNhE64JCuDRUWUF4cBw/7rnBpU/Iz?=
 =?us-ascii?Q?iyRtPeE0eGF5ZDV20mF1tB/yZSpWyiRHxht8wp3lauADRCmFS8J1iFscyj7u?=
 =?us-ascii?Q?ndeT/4VDkUg0wnC6lkc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1781a522-b9f6-4cd1-f6eb-08ddd6bdc24b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 20:54:25.8339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kco9vPok4aPy6hOmHNxDA4wotjzhbpzc6vMNQMERCRMaAllvnry+epOl6Y4sEy9hrmstAZYBQYRXxA1jMQe/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9474
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

On Fri, Aug 08, 2025 at 04:06:16PM +0800, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> Audio Subsystem to the HDMI TX Controller.
>
> Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 28 ++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 841d155685ee..00d8474bd1b1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2066,7 +2066,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
>
>  			hdmi_pvi: display-bridge@32fc4000 {
>  				compatible = "fsl,imx8mp-hdmi-pvi";
> -				reg = <0x32fc4000 0x1000>;
> +				reg = <0x32fc4000 0x800>;
>  				interrupt-parent = <&irqsteer_hdmi>;
>  				interrupts = <12>;
>  				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
> @@ -2092,6 +2092,24 @@ pvi_to_hdmi_tx: endpoint {
>  				};
>  			};
>
> +			hdmi_pai: audio-bridge@32fc4800 {
> +				compatible = "fsl,imx8mp-hdmi-pai";
> +				reg = <0x32fc4800 0x800>;
> +				interrupt-parent = <&irqsteer_hdmi>;
> +				interrupts = <14>;
> +				clocks = <&clk IMX8MP_CLK_HDMI_APB>;
> +				clock-names = "apb";
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
> @@ -2143,6 +2161,14 @@ port@1 {
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
