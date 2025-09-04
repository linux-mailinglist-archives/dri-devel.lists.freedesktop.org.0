Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F144B43628
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 10:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F03E10E9B0;
	Thu,  4 Sep 2025 08:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JxcHDMYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013008.outbound.protection.outlook.com
 [40.107.162.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD12A10E9AD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 08:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqnLgX4lxbz1jQ3o1Z3GqEvxL8XenEwnNhSZ6CV6gchDnMyjl7NkxWR1Sjkajh0HGGW6z4LshYmYyz4Pg0ftRhMMn6T9bRSHErUtPeahvB/lAayUsYcsMkZLad7iuGBlmv3Wue8VVjYaI7l6iSDVALUUalaunq1bwagDWVTbKEojMIxxDiUCz7MZdtPMRTNY5s6V/1hf6WjVm23/cSLwaUJM1+JLAwVQCFB8/K6rlpOgSctbVw8XpQhfNsNyvqSWOarJaJ1nkRIwYiL6ay5QhK+PZTiKNaOcHDfUT2IvdC0Yp0qHajqALO3IbsiUqA94uzeC3TzseHEg00Ysf+cJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu3E1WjY4WmyqXOsrv2s9p7xCmhaD8t/JWDK9bjZqR8=;
 b=EpGnCjYHwOgz6efgvOPjTr31mMZhgZcMHYMJ2h+Lfq5LSPXx4aQmypdr0/plcbpUJDuQ4hrgFDm8TrvSzngsNYxKszKYQbscHtn9OeiCwZVoKg3psr6sMn8Bi2CWNVJ7bLwX5QuxoYK5syaIcn5RKGqT5ttAJXZc26ZS8CUb4CrqrBvMySPDo1hdctJnojv6km0nYVbarjI4WhlUNPyuqQ9fcwV1S54XVhjWxqaONazjH7N4GIPt618H83tI9xFq6o1XDMOK8APWI/9tkfbAZldc0JCKAYgtK4urYM9dblJhFMrYUwe/RwKal+dYMFXfTaY1ASyynm+0Tc7xgt3IhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zu3E1WjY4WmyqXOsrv2s9p7xCmhaD8t/JWDK9bjZqR8=;
 b=JxcHDMYdnVW/NTn9ZxQ2U/I8+35Rukj3RgHb/TQtnqdv4sC+ykduG6aXzGRxVI+BvgsHh73j6brcdcYaRWMy0SWY5LnPHuENaldvT1hMu2TYz9unng54wf3LanUkzdnUklWlEHZu/7R8D0WAkO/GhNebQDZiQFcYNvQmmnsRF7ysIR049EdA/D5zIRDPPfTzC8aYEnkHXqm6xAmLO+ycDHCjNbCwiLZElcccIAn8zkXQhG5CH77dAJUkVQwB6bhOWojdrLeD+1abDzkpA9GKNCu/WhpkAvZEG55QydJAV4c5Z/2YxnmNNOjUrIggY8qs/S2Geiw5R6Xmxnv/k/nOsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB11033.eurprd04.prod.outlook.com (2603:10a6:102:484::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 08:43:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 08:43:15 +0000
Date: Thu, 4 Sep 2025 17:54:35 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <20250904095435.GD13411@nxa18884-linux.ap.freescale.net>
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-10-marex@denx.de>
 <6144881.lOV4Wx5bFT@steina-w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6144881.lOV4Wx5bFT@steina-w>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0237.apcprd06.prod.outlook.com
 (2603:1096:4:ac::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB11033:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e67714-b2b9-4d62-fea0-08ddeb8f16e3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qJwvdSgTM9wqciqBkPNEYOm5QqwFhS9WjBgI7jsW9+KYR0SJ1KmBGc43njk9?=
 =?us-ascii?Q?ToShLVU4l3GXQuSicXoAWaGZNQXMQPkoxWpIl/H6rDSilgeAmU22V0AXBze0?=
 =?us-ascii?Q?bMNvWddTpEn34dj5/TqhQF1TavSw++JWj4BBBUsAt1L7wz6XTNw9RfBul3t5?=
 =?us-ascii?Q?BooybzZptpstN28V1ESJLhKXiflX972exY7q7M8fwD7X7uyYJH3tIOLn0bCj?=
 =?us-ascii?Q?HGZh6RwsxwcvSwgWpruH+qYR5uVrePyhbJAxcEmoPHGle66CydRpq42ueaPA?=
 =?us-ascii?Q?VvlqmFyIHX/BC9nzjuewAP6o5g8NWYnsa97Q0R9AbvJ/A98tYbhqNpLUq/hN?=
 =?us-ascii?Q?qUhBMrT4A845ed9ufeo+yrr+RNmuCK5egfNt9rrRxfGw5MlPbrsi2INbP46b?=
 =?us-ascii?Q?e5NGZRp1oq/Sv3CDJ3rQYnpeR6QS9jkHZQjYCHQ+GMYmyON7T8TTVmrWsHdb?=
 =?us-ascii?Q?e8GIaudeVyj3dT1kgasRtRDUxDrm93pox6AhmqreV/t6RAhlGoUhAsRufI2g?=
 =?us-ascii?Q?a7fgVbiIMLSFi7jydJWk2QiMLctYBrrq4MFYP0e0Z6mwvwKye2of9ESOSE01?=
 =?us-ascii?Q?qkyoSadiLk8/kvYOrkw3RiRXxTkEOhD1F0rfqU2tdbzVhDdyUGL5nSGMU+J9?=
 =?us-ascii?Q?QcoAx/B8wHUdGKZl3w4k5CEkZTQWjBAwoWD/X2fp1aEdbdJZhlHkjta3MvoJ?=
 =?us-ascii?Q?oSouqjtFd1AIclscZNvp3dQV2VSvFEzSt3q5seWs0iKgmiHTUKKwNtqEMMlZ?=
 =?us-ascii?Q?WoNkIflwpFeELrpOzI4tNEupe4r3Fs3l0MFXYLSRC9xaHnekj8buUW90aOcN?=
 =?us-ascii?Q?i6C6ZqvLjowMsSkN4ilyOfgKhwSS9u3ou1eaAO38mJU7korK9JC00nvgn74Q?=
 =?us-ascii?Q?m9rCFRwNKC9CnfY3WQE5mtXaA+ChVhSO6cskWAslRyQRoakJZPDfMV6ctTRz?=
 =?us-ascii?Q?2/1KMo+Z0fn4FVl9l7SigPYooJPLqQ6Y9J48n27TkDS80hESmjexoxA65E8x?=
 =?us-ascii?Q?50+G8UTCx9SHPl0rVUuB8QS7vDrxm49n7R+t1jAYC0ormO+rIjMil9s2hRjd?=
 =?us-ascii?Q?qleFvym+2N5y2tFUDMC4xq8KEn3mTUlE2Vzll7youSgwqzR0MuzzDJzLfq/O?=
 =?us-ascii?Q?PWnPFqXP0PimmXyFE8CEgDsGabn+VB6Y5WLQNtBSIuplk/SIsAZHkFfY3l30?=
 =?us-ascii?Q?ev2+S9a2pNm6tsPYdHBBthyAeAoyehipaRGuiNM8YnLrILA1Gd4Ynh/Jg1MD?=
 =?us-ascii?Q?bntb9t6xdpuWgdckM85yyz/DAE1RkeZ9b4GsG085zlIYUsSJYjLJsrcs3oZv?=
 =?us-ascii?Q?JkfFkrpZlfTVgP55mEMUMs/mHjXCpFVDv9K9cJBEdT1LUNFJrSQgxElwCPr4?=
 =?us-ascii?Q?5wMqTkooXiUGHVK55k8l7VxfVwm/CRcCC+c7layy+YEaby82xS4oFP4YoOuV?=
 =?us-ascii?Q?x7ASyrlK5Is=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YUnpARJVRG/eT9IyCpWE+H8wEAuhxDzvcQ5z17Rliu7cIYgsb/b1aa/pwyCa?=
 =?us-ascii?Q?vweq/fDGy21fppdEIjyPji+KcFfqHQZuFdPnaDwvPyfrWznvbW7Y0bjQVv9W?=
 =?us-ascii?Q?YBn8pJPrnCcXyw8Qp6QteWGbQAduVdlIydc5EJraZqBuJXrfuAWFstWBBtc8?=
 =?us-ascii?Q?0nW2iijBVdiAWU34mV/kaAjPQ/kCH5evuFgRVswQedmxmRHV5DZfZaEfoIHo?=
 =?us-ascii?Q?/T2OMoqv9uqdeiayfxMN96jkovxZQproflCxvAx533YZRuBY/7kMjV2koFpE?=
 =?us-ascii?Q?YdmesIiypJAEhzQrydMLieAwqQWHj2+vETBBBb2CcTAYGVxdNi+bNV0nWeQd?=
 =?us-ascii?Q?CCKGbQ631pVB9DqLnjWQ7LJ+qMDDXfZpgKHMYBhr/HQNuMwU+kKrMhv/LfTq?=
 =?us-ascii?Q?1khMTmovHABNaprJkqkdKH4MFicj5nw3v8Kj7M5YT8APq8Chx9Y3vaKNk28H?=
 =?us-ascii?Q?qqZPntSB9OE2vkT9CsV9CaViHFNXMK317+3/+SfDBEKWsvt3CfzJAXmJOJsy?=
 =?us-ascii?Q?GUXrr38MSlLuM7W6EV5BhuxaNC4i3Z8lVNDtZmqz8L9xpU+HxilE2kHk+i22?=
 =?us-ascii?Q?JLZe9v1sXiDBn1JLHhK+yYDaxsZXdmEGxrYsB26YdFNLNB2X5EifHuJ6MCch?=
 =?us-ascii?Q?diNT9516hhmGnZx3Aj/Qtwpp1fBpS1Re+8rgTw7o5CqpbzI7x+LGurv6Lp1x?=
 =?us-ascii?Q?6Xft+czBOD3Zlh+4bjpRYMx76X/bstgtKO+Xhr2v5L8Mxx/HDWCUqDhK/Y8S?=
 =?us-ascii?Q?pdYeR+ZS4FiPgHLeyqgsdzqKVCqJSTcr5HB/Ko0qV5PXd3yO5L/3NtZm0Ogi?=
 =?us-ascii?Q?qy1H6FgnF7zzMtzHtCEodxJlIkqCnhghM0gahYnOkHpVlCcpWkB+KlBSq1yo?=
 =?us-ascii?Q?XgNj2hW/TRvhg2sBgr0R09Giu4jaNknzGg9QDwOTiDlhKtjT/fNA8L1qDA4f?=
 =?us-ascii?Q?hSlliCzb0aD21kwQgUULL7kh4QAVH1A0jk1uvChma8TIAxRh3OxwguWh8mvj?=
 =?us-ascii?Q?6S0A1EjtLiO+GT8lmSOxR5FT/FrlXzSIWVXBtdtG1ZiX57kr5lbaJIJH2RrI?=
 =?us-ascii?Q?CZBkORg9qbvSYMHZ1BzM7vTQXLbIdCHjlf6fYI0eivqEri56o2eWBOV2dcXX?=
 =?us-ascii?Q?6UQCmCipk1I08Sg91BQSvvF6Kint62XWQDQsaz3Rj/z7FMB+RtE5qn7zx/W2?=
 =?us-ascii?Q?LwSFXIsbDunAsOl7sY7O/yEmPKfVYk8HKW7SVrg4BNbvcm4mZ8CkVjuuekLP?=
 =?us-ascii?Q?M3iLMmngcGS2BnHL9BxcHF27KKXv19O01W2iM1EC/54i70gJX5G+RGlqobC1?=
 =?us-ascii?Q?qRE5IcXetwAFiQhGxyJ6aLAjJSDaULfDUAnFhiSz/HoZE91TIcrbeochsXPp?=
 =?us-ascii?Q?GL2XEpgdbLqIEMFQsFcnubVWb0jK1BCJfJOMF+6rMgJd7W5LN5KdBhZARP3D?=
 =?us-ascii?Q?F8ngQLVMTdRw1PIV0uMM3giwrutxf+xLovu3r2ykWyTOpk5k23aN7xybznzq?=
 =?us-ascii?Q?vLR2QBnyywc4MZAg2fLZ7fXqh/iH/XsZqXqml4YJylLq/g2PWqbNCkQcWnNs?=
 =?us-ascii?Q?4IYlcBK0VSWRUB1svH0rnnL/S3+bGYFg880cvcY6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e67714-b2b9-4d62-fea0-08ddeb8f16e3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 08:43:15.5749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yy49sAcY9t+0Cg57pzj7Rz+jAcWP0fcTIZbSDt3NuiJEGN8mGqEwitBsUv8YFioeeAs2LaBNAZ73AnzAAwEY0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11033
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

On Mon, Mar 24, 2025 at 08:02:06AM +0100, Alexander Stein wrote:
>Am Freitag, 21. M?rz 2025, 21:05:59 CET schrieb Marek Vasut:
>> The instance of the GPU populated in i.MX95 is the G310,
>> describe this GPU in the DT. Include description of the
>> GPUMIX block controller, which can be operated as a simple
>> reset. Include dummy GPU voltage regulator and OPP tables.
>> 
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Sebastian Reichel <sre@kernel.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>> V2: - Drop regulator-{always,boot}-on from fixed-gpu-reg regulator
>>     - Keep the GPU and GPUMIX always enabled
>>     - Switch from fsl, to nxp, vendor prefix
>>     - Fix opp_table to opp-table
>>     - Describe IMX95_CLK_GPUAPB as coregroup clock
>>     - Sort interrupts by their names to match bindings
>> ---
>>  arch/arm64/boot/dts/freescale/imx95.dtsi | 58 ++++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 9bb26b466a061..3acdbd7fd4eee 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -249,6 +249,35 @@ dummy: clock-dummy {
>>  		clock-output-names = "dummy";
>>  	};
>>  
>> +	gpu_fixed_reg: fixed-gpu-reg {
>> +		compatible = "regulator-fixed";
>> +		regulator-min-microvolt = <920000>;
>> +		regulator-max-microvolt = <920000>;
>> +		regulator-name = "vdd_gpu";
>> +	};
>> +
>> +	gpu_opp_table: opp-table {
>> +		compatible = "operating-points-v2";
>> +
>> +		opp-500000000 {
>> +			opp-hz = /bits/ 64 <500000000>;
>> +			opp-hz-real = /bits/ 64 <500000000>;
>> +			opp-microvolt = <920000>;
>> +		};
>> +
>> +		opp-800000000 {
>> +			opp-hz = /bits/ 64 <800000000>;
>> +			opp-hz-real = /bits/ 64 <800000000>;
>> +			opp-microvolt = <920000>;
>> +		};
>> +
>> +		opp-1000000000 {
>> +			opp-hz = /bits/ 64 <1000000000>;
>> +			opp-hz-real = /bits/ 64 <1000000000>;
>> +			opp-microvolt = <920000>;
>> +		};
>> +	};
>> +
>>  	clk_ext1: clock-ext1 {
>>  		compatible = "fixed-clock";
>>  		#clock-cells = <0>;
>> @@ -1890,6 +1919,35 @@ netc_emdio: mdio@0,0 {
>>  			};
>>  		};
>>  
>> +		gpu_blk_ctrl: reset-controller@4d810000 {
>> +			compatible = "nxp,imx95-gpu-blk-ctrl";
>> +			reg = <0x0 0x4d810000 0x0 0xc>;
>> +			#reset-cells = <1>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>> +			assigned-clock-rates = <133333333>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>> +		};
>
>With the SM release lf-6.12.3-1.0.0 AP does not have any access to
>this BLK_CTRL anymore. See [1]

Right. In configs/mx95evk.cfg, BLK_CTRL_GPUMIX is assigned to M33P, and
System manager will automatically handle this reset.

Regards
Peng

>
>Best regards,
>Alexander
>
>[1] https://github.com/nxp-imx/imx-sm/blob/master/sm/doc/rn_cl.md#sm-184-deassert-the-gpu-reset-when-the-gpumix-is-powered-up-rn_detail_sm_184
>
>> +
>> +		gpu: gpu@4d900000 {
>> +			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>> +			reg = <0 0x4d900000 0 0x480000>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			clock-names = "core", "coregroup";
>> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "job", "mmu", "gpu";
>> +			mali-supply = <&gpu_fixed_reg>;
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_GPU>;
>> +			power-domain-names = "mix", "perf";
>> +			resets = <&gpu_blk_ctrl 0>;
>> +			#cooling-cells = <2>;
>> +			dynamic-power-coefficient = <1013>;
>> +		};
>> +
>>  		ddr-pmu@4e090dc0 {
>>  			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
>> 
>
>
>-- 
>TQ-Systems GmbH | M?hlstra?e 2, Gut Delling | 82229 Seefeld, Germany
>Amtsgericht M?nchen, HRB 105018
>Gesch?ftsf?hrer: Detlef Schneider, R?diger Stahl, Stefan Schneider
>http://www.tq-group.com/
>
>
