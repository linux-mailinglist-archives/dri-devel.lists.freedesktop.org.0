Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16570BA2668
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 06:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F61110E1C1;
	Fri, 26 Sep 2025 04:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="secTXW+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0B910E1C1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 04:45:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=he0QugnoLYbGlna5z2h36wWORP9LPYILozgX7sTKnd1iXj1qkCZf1zPJOshlSHywgBjGFluoOhJc2FNNOd2NFYo7DHjzBbUnzzg+NkoSynysVJUtFDtTLsfAnEoYADufk00UAspQfLMLDeWUkAXQAbNG9obXONDpAjpiXXq3DVv9C1HODR+0nGyL7MM2YXveYge5ZtMmmGyJN+fFso1DTncf34mECkUx15r4ldMQt2gH3KoO16mYLX0r6ip/jDdkTrZ7KIFeambMadzCJNVFjJBCAKdxqE5dVtIM/gUg68/y9qTPvEoVDs3bZD3qFw+8pBmNGQkzl7hWz/TXBUxnmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMV+JxTkEFD53EZTISLJI2Shg2nj0O/Gh+fCEhoWlo8=;
 b=kygPpm+bZBegdvzTtu0RAKDEuc5CjEPkFqqiLGhdR2/8HK4ROxPnYk6rYkNsWUBvqXPXGvmDozZqn3vySIbB3YQxBnuTVxMPx8qCZrJ7snxIbOiPmGatERZlsIzCQFsu6cK4htJ+Yr+nxlrJuatg5WxGxMMWLucrwziJShcyWUJItHN6NyahCOIoOoa+UNmSZWdDUxELENfehuKZNJqSTMHckofKSDA1tEtEOYzuYhx6X0BeBSNQA9w4QWvLhHTWtu02nOvOvOgj5mUOJ7imefO+UGbNWq+9jpv3zlyMqdYUw0liD+yPEtjZLCR1WiC7WuwYbjHiNlTHHCJFr9KpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMV+JxTkEFD53EZTISLJI2Shg2nj0O/Gh+fCEhoWlo8=;
 b=secTXW+YZmWu4sFExDQbIW68QlQhRHIE5+OhxUWQG4F38iI6BowOj/o6okjkS569vYsun000n/u+nOWqxp96uIMp1IBxNin5mv3+VKwPpA+Tv1puOO14xO0DNfmddDTx0S9uyrfbqlWTMovjApVFrfR+ymoNj1Bmntg0NgYQBbwE//kJtO105qpukHrCK+NlgzTsogC0RtpuQN0AzSSCKa04uPhKDn6TIFhpo2d/VnsFKkx0qtx9b+x7HdZMg6Xnq/XCy2/W+FCIoq9g5Nr1iDgnj30OYP9iRdBQKOtU6Jg+XG5xnBY79lcyiAcqBbjharKKdw0L1LZXqrZR2xu+FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 04:45:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 04:45:13 +0000
Date: Fri, 26 Sep 2025 13:57:01 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 "Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Xianzhong Li <xianzhong.li@nxp.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <20250926055701.GC8204@nxa18884-linux.ap.freescale.net>
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925203938.169880-2-marek.vasut@mailbox.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 8778e29d-4eb3-4023-8046-08ddfcb77b5c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wiykVvjblgma5A6FB2/CywxHVA6k2eRRhJor38m4DJ3Dl4/v4kcWWWsuHkTz?=
 =?us-ascii?Q?t70gLd9dqwlohW3I0WX4f4jCjawH0887JLKVYepZBx7Q+bZ7CIyPPZpkAd13?=
 =?us-ascii?Q?yeJ2m5IfJoqw3/z34Ldt3NlQ+3NDGjuWs2yL3KbvIEjVQjqjEEGI+IuAElsu?=
 =?us-ascii?Q?evjx+KZaL6UWxTBIzpd8vMPIhHJM+Aol+C3LPL6WUYy0L+yT46NcP8ETjnjz?=
 =?us-ascii?Q?bd7MiBilstvofARhtGverfoDbXPNbNMLZjtFJfE89UVWun0BsKny8nCEvtpZ?=
 =?us-ascii?Q?fx8XPrZbtYiXGOE7gLEnn0nhYosRtwFrlPCPY9yWalWdf89t1rwjODMkXZs+?=
 =?us-ascii?Q?//3epDOdi+wVeJF5KbtOGuhDrjWEVjD6dsH+jcJh5EX8M2/+LXXqoY9vBlOm?=
 =?us-ascii?Q?9IcQ5lrMx9+Sxe0ZREECGXmSaWZQG+qmpBr/VXhsRR3gPTbjUb85yFJqTP8i?=
 =?us-ascii?Q?8Rsc4BbgCN4jwOxaD4Tk0YNy2xVFYB81fnT5nsli7ZMeaqzUOXU4eX6pQ9Jw?=
 =?us-ascii?Q?/3jZMdWK2MzdXSYlUJ4McuiV9qaW6nzaH4GOJ8UHE/C75OoK1H7FCtIHY2Mv?=
 =?us-ascii?Q?7B8MPY3dH8QExAHQtQxIgqFD0uuNkDK6yPX0REvOSSbccGv3X1S2gOMVxCyz?=
 =?us-ascii?Q?eYyRbhDPquC7oyF+GOJkJr6E7qR2GmSYS2AORiov06C1l3Fat82ATO6MMIJq?=
 =?us-ascii?Q?8hWrCNwyNeWwJ7WQMv/6XehzRFR3KARY/s9UTcGMTcr9F66NHvQhOID59RMw?=
 =?us-ascii?Q?6E/TA19MQLJa51IdzXS6YY4mdaPYxjLWp9YvgShdC7qMH07L0M1Sgkyu1AU/?=
 =?us-ascii?Q?SYPq7O7JrV/t2wwTJIaHKB+QLSMRUTrz6fwi+k89qOmVn6jl9cM6OIPvV7s7?=
 =?us-ascii?Q?rMOM1rQGAGawAYICraDcuT1hbav5zbnNijGnt4ZblWk50X+/Rr5Yb95027XF?=
 =?us-ascii?Q?s/7utWTRdfpZ1cQyEJL5UstAwlS+sMBnAqpFr95KFjdRQYUTZkCYCfYnzYZp?=
 =?us-ascii?Q?qjfuWDATOlUzQ6xUpT0n7BOcvzgSp4Bzh5p+S593VjHscrbLNTPVx7XkS2ma?=
 =?us-ascii?Q?7Pzi9nJ0ctSdxlHFbituX+4B+qFbQGHIUh+qhSKSbshWJd/lznC8khdvnmrP?=
 =?us-ascii?Q?60/8Dz0j72Tkx1NGlECHYsaIR/AjgN20ETBqO8yPFc7iBinLCI7Z3ZHwSFN6?=
 =?us-ascii?Q?Wy5y6i2yJ/n72gd1FnnF8HAFTyIK3gQTE34/1GA3BrROKbc8ZQwcn+uod+/A?=
 =?us-ascii?Q?+sn6vhjR8RtCaEIXRhsj+CwkGDYNmTqFuIRa+L75GVbYXR5Fsy9yn9YsZK0O?=
 =?us-ascii?Q?UxZqeaKIEFgEcoPXG3QkSPqV9T/8wKhNPNGOipsxrayw/zSNBY4uYkjK2jTm?=
 =?us-ascii?Q?r6UsKodM+Wpg6S48vlQU0ngNrrcyerSiqD3Xbzh0WpUBwHfrclA948o24Qav?=
 =?us-ascii?Q?wIOc1yvCFcxCKbeaoCwDyAZMJb6MykugcbCYL4Fne2aEJKO6A8QG3A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NkG1DcANrHtUlFBD+KB3LOupZc6dzw6p82GXvNebjtsTYfPGCVltJ2eJFuuJ?=
 =?us-ascii?Q?RSj/DvNGRDAi6LsTFxbacQYpndPiN9s8moccfunXboXpZFZvUO/OQAJmJkaZ?=
 =?us-ascii?Q?giGO+qW5teHrQ/Zli0PEBn3ZughcwZrrWOf6wFtU1NW+yfbJMJtoz8SzFjVc?=
 =?us-ascii?Q?wrPHE/X4RgY2B6064DBg+r42fp7azIby6DjvMNcYhS+mVfClIb0QfHvsukL9?=
 =?us-ascii?Q?h7hLJVHkQC1dr+vQMFsVZ22PZ7pfDzRVpye0xK3g7T6xzEdaO6DfX4gPSqsE?=
 =?us-ascii?Q?x0uDqGgQRlasS1JLNFNBSdY5/nuDRiwQ67At1kePz6cW89fUDLNL+xj72BRV?=
 =?us-ascii?Q?GEatyhq2M/PAn8PhytQunJnJ+CWwfnDZvNV5IIP/cMG7YP4fmqbPO1smm6aS?=
 =?us-ascii?Q?FT4dtzONdktXZSD8TtTbtuzINnLRyJl0ICi3gpqiKw2nTp7LrsHySUMX/etc?=
 =?us-ascii?Q?E/aIE4mFh+6mot1i/uhVz5qHEENNpqFVbWNmagTOdgedWEhUHlJVtKoDEft4?=
 =?us-ascii?Q?0vrYhyvMm87vVWyKVyNR4haOGGSN6eirrdP4D2bWSJs99JwT1FDp/bttidJX?=
 =?us-ascii?Q?OOjr9x0wCPLL4YGbrQAzbvrfcnWwR7jMlOVp79nSGW3BFWekETmy8IQKLogM?=
 =?us-ascii?Q?hukImCHfyAYPCTbKkNPNk1pf2ngrkxKV2/tKoeNQ/i/to3XO2Q2mqMAE3s61?=
 =?us-ascii?Q?4/T+KjLVinBMRwB4RCo3zh//WRO8CmScckwwv9F5Nb+yyoxMi2xUTNLDsjIa?=
 =?us-ascii?Q?SprR/HnbIpcIJh6C7VC6CZyEXQ3OJWw0dUS+H+gYFXgDsC4pVyGe+qn1TCih?=
 =?us-ascii?Q?ML0RStRlnu4MHlqe6Mh3t026bAYE2LFqJ3ShIFgsw1zh44T6fcO8prnyVa2J?=
 =?us-ascii?Q?9lxjua/mojGeTjq5Mmzyy8JQxX3aSVBaamEdm137f45Y8ZCLFtsMyz0+/sON?=
 =?us-ascii?Q?JpNBhypSUvRKZk5tWDF+BMGD2aiNlFPKLb7BRdwHip7sy3G+Ea0cXDHoII/m?=
 =?us-ascii?Q?2fhfyWo2ce9EPev1sDrc8TmsEXpmC3dqnNmwhPvNUoB5wuvr9OlQMpt7n+2G?=
 =?us-ascii?Q?f6nJQRqW45E2pepNZEwoACV6khLsUt5T9U56H2ENeL7/cmvCYanlfXuCTRWM?=
 =?us-ascii?Q?1ppE7L5G8R8shxFArIvsa25ONkqkY5W+z6Y3BwgPfXTe15eknT5LctfbWwjY?=
 =?us-ascii?Q?q+9BvpmJJCk4lgxgOs88rjO7QggEYvGRsPNLTaQDk8yShLVOuLGqNbdopPjn?=
 =?us-ascii?Q?B0pBwRiRGY26Ll8wQDop4ybFwFVsyL3EY7XMQ1uFq3AhN2uN62oumN/AsECp?=
 =?us-ascii?Q?dQ9+7AtGnjNyLwO7n6FY5csAhsGeSRc7mXMoz9XlqXi35HTm9zLWubTTkpKA?=
 =?us-ascii?Q?vVvm/TD1/om9qZi4Fr3zjWWWUlGTQ2sXRmTm/PgTcz0/18dTC7s47L2PAQJm?=
 =?us-ascii?Q?s77CFOsUdrTOmvpMXwkrtu9nzogIELZgaZ7AbobiIyjn35vIGaFKx+FcDz8f?=
 =?us-ascii?Q?ZVjxBirZF4DaUkTG1+FOX2wnXCtS1Wkh/v/dil881mar3WE5t+7RUw2SvmfC?=
 =?us-ascii?Q?dU6Tvf3EmU+bxY7SECA1NsdYp3r87VKttbuohczg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8778e29d-4eb3-4023-8046-08ddfcb77b5c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 04:45:13.7309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLCjsdNIHKe2piUXToLIuX0HbiZuURawFLfLueZK8x+KcFxv6ce42TysmGpaPgo1i2+4ZjRoldXEPBvEUavX0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
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

Hi Marek,

On Thu, Sep 25, 2025 at 10:38:31PM +0200, Marek Vasut wrote:
>The instance of the GPU populated in i.MX95 is the G310, describe this
>GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
>
> 
>+		gpu: gpu@4d900000 {
>+			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>+			reg = <0 0x4d900000 0 0x480000>;
>+			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
>+			clock-names = "core", "coregroup";
>+			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
>+				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
>+			interrupt-names = "job", "mmu", "gpu";
>+			mali-supply = <&gpu_fixed_reg>;
>+			operating-points-v2 = <&gpu_opp_table>;
>+			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>+			#cooling-cells = <2>;
>+			dynamic-power-coefficient = <1013>;

Sorry for my ignorance, would you please share how to get the value?

Thanks,
Peng

>+		};
>+
> 		ddr-pmu@4e090dc0 {
> 			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
> 			reg = <0x0 0x4e090dc0 0x0 0x200>;
>-- 
>2.51.0
>
