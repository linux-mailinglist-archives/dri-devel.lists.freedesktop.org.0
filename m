Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364CDA48B4F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 23:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA29210E126;
	Thu, 27 Feb 2025 22:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dJF5RPXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4AE10E126
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 22:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fub/fxHHZ68r8eNaaZjgVbOt8SUxk3m2suvnl4KDmLo/1rUL2O7r/X1+Gkt+dNJjqKJjlTxFHNDdkbDj9x6S8AwWas2n6jlXDPzac2pUoD5p4ZoQFRFmkWQ3pojxFcvelsKrAOevHQTpcR+hemk8B2hIIePxEU3TH89EmqhGPx9M62bSBZwatmrhCPpKlUcgYk2Jq4An4tzkx9CgyAh8wrLEiNGH3qiH+jY1aipEQ4EWV7PhOh75VKwcKYL/zFkKnIdv1pAqTTAK6Dp1hfOd61ymTosXf4WJ7hpzh+zcaz/Grmncbg182PSyZQ2EeL2uepdBh8q3vyuJVQ4ThTSQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9V23MCi3VoRImtfFtEF8dv7PO8uam3FlOpsf3cT9GA=;
 b=UcuvdtDTQ4XOaM81ELRRuZmMqR6uHkgeoZg3LEZb8zeHeco/L7OSxtvxn+2v0Czeraecc82q0yWAaUhgVKAT38QpSroY15W3frT+wluJVPxlRP8/I2hVCR+P4nrjeJf8aBw2pxm886jkKrmVp30Y6VsoAVpShlNX6n84pHYOHi7pIeTM2enYonkD/0NGZqnPe2IYY1n9qaGi99P2ChH3f0gGCbP/H8zd7ucZuwmfQBbHRxcQhZgIzBEUUmZ2+9p4nM6DMa5sOQ4ZhF4mb49JM4E5knxwhFjRV8/cMH18M9SK2YawZ8s0WY9PZ/h6Q3CdYWwgPlKUQzR3V2s0TFLWTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9V23MCi3VoRImtfFtEF8dv7PO8uam3FlOpsf3cT9GA=;
 b=dJF5RPXqo4o0UZYvPPsaiE/PPJXPQCcVrcyfCYkNwhWkXg+RZrIAvFJsC/Qy2DSuARCKQp4byuOtQvACuWi0T5oAhFQUEEDEdM2KnohAWMO9E18Qp+38mAX0UgDjT606U3MIxY0gR9JR9J2EWVSOQLE3vKhyyi6On09PR9pLDpu5efVwHeVSIHIvHIEvc2GWFtu3h6O85Zi6PJSULrZn9OaRPAMyIKewwvWgY1x4nomvtmlRMWlxBP+tk0NtBx9/kjfIptFcgKrorS1Jy8wBNiDBJOPuqNyGkuIJ2n7qGmF9crBnM9dbj8Cr2Ksgnovjnbyv0huHen3LTKqhvMndGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10459.eurprd04.prod.outlook.com (2603:10a6:10:56b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Thu, 27 Feb
 2025 22:21:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 22:21:34 +0000
Date: Thu, 27 Feb 2025 17:21:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org,
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
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <Z8DlYjq+87sjS9cU@lizhi-Precision-Tower-5810>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de>
 <Z8CkSUry5puMu6Mx@lizhi-Precision-Tower-5810>
 <d41c9cf5-9ec4-4b9a-b281-653873fb8df0@denx.de>
 <Z8DY14NJYXjwKz7Z@lizhi-Precision-Tower-5810>
 <db903f36-e897-42ed-be46-f0b035303233@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db903f36-e897-42ed-be46-f0b035303233@denx.de>
X-ClientProxiedBy: BYAPR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:a03:100::38) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10459:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9234f7-e753-4005-8ee5-08dd577d1800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rtqT/C5uy1YUdvG3WOQ/0BURej6QRoAnn3Of93FsTKnmTc9OjKQuDVXdAfOk?=
 =?us-ascii?Q?lkap/l0uO4TPGjaLa3FJbqHXC44IyOBo+RRBDn2p7vq52sSPVitVeHge/HlT?=
 =?us-ascii?Q?GP0Fe60+N8+4B1d4tUBoEtD7savsTHxoFh7QXyO/sHkTAFjklQbYkTcM0dhE?=
 =?us-ascii?Q?y9lcsSPqlTIkGUCKpt1P2JPTLq97QAgDIQse7tRtrhUcfLmeXjcLJWPgW8jR?=
 =?us-ascii?Q?BOMxAv543040RzA7QHdFfEyfIaxFNVQe32xc+BNzkbAjp038aDMbbw/W0fJC?=
 =?us-ascii?Q?B3jEUihfUzFsYKuLbrduRp9oYaSbMlNOGBi29RLbF06lMpnjq4Pxu3BAStqq?=
 =?us-ascii?Q?MeJo1cyLOOodINmFd1kuwUHXeYRoNkGtN055m7pXG8c9vJRWWkYU3P5mTGaj?=
 =?us-ascii?Q?MCSyxB3hWCPwmoqd2FCVNIJcc2Mmm5qytjTzgHooLxGFFQL5kTmOr44BCd9D?=
 =?us-ascii?Q?jUNpmon9leQVdubNol67bboqHLKWcVPfprrEtlCXINUzkqFgRwYnwifUs06C?=
 =?us-ascii?Q?pRgfH0AMjqnm/nyczut4R+CvDT/YuWnrQmMfh9lPog0HqoX/NJ8x4x7AYnnw?=
 =?us-ascii?Q?Xa8nnY5sDqFp9wRu7RcW6UXkspO4AV/0VMWtis6f4jyu4DHhm3BFSDkfd5yq?=
 =?us-ascii?Q?eSwNEVwzYeNBVlXBWzFydJG3h43b/2DJ1UAS+dyC3YPPVoZF1+TT4gBozgVR?=
 =?us-ascii?Q?t2T+/1bmNisvIBX7Qc4uEg2mLmNmiT6qm/nOjWvZlA6DuELFwwlwRRDowmwf?=
 =?us-ascii?Q?s/0NnLHO//xeQvQKC8a78yiFZSyY+uDvgLrwrZwh2bLE4OLhq3Xt5lAF2G5d?=
 =?us-ascii?Q?CI/SV1D1PeGW9s1vKOdxNZwbOhP+2Xd5fO6An9LenvgRxOf5Z1x4PIomJe9f?=
 =?us-ascii?Q?P9FNlPOJEhotOJA2OJhYd3nz9LSaYY8+BC3qzcBacnd8sXAWSayFgH5W+aPu?=
 =?us-ascii?Q?Ibxc//RbTr1ULYw+s7GVaMIvGReZxILO50dCAlJFbuujoO97vb1qZ869CsG3?=
 =?us-ascii?Q?MXJXsoRWECvZGTWEMSujLGGV8k3Potm8x0HyA8MreBi6LU4821Za4BC1Z1Ow?=
 =?us-ascii?Q?6GM/f0K62GzXwzW1oHa9JtcOS88QitFhapKRHRERHBUyQ01bzuzv9KTTqa3P?=
 =?us-ascii?Q?c8PUBOlLbHuvRK9Y2CHaZf5CjalxY8xIKMfXL+au6i75icCbCcMQ8b+9/Bva?=
 =?us-ascii?Q?NXUd+cZ5veCXg+MgKCDnLx5KhjeWWsv3zI+t/faDS5f22L+xcPYCqiuG8Dyd?=
 =?us-ascii?Q?geVSVPVrXhjSLfi14AHYEUaIt22fCxNgbWVZq2us+hPU5ane5HGfaTn/8yaB?=
 =?us-ascii?Q?Y7zvDGN+OUPobXHBxMbZxBRnQNAnuBkeDKdbXg3LlVidNMPSNPevATCcOeZ5?=
 =?us-ascii?Q?KQyB1xPUk+LAOLJBM9eEqSqKws2+zYZjVney/EECNlNwoDKx4tc+2PuulVRy?=
 =?us-ascii?Q?/qJUNvWI0WiaHtcv1rtTFBYUZbDI/qjB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H5p3OGumsKhe5Tgdn+wxUQx98vJ3SDH/BsyBFEAjOZdoe1xJuWaRBzrxSvUv?=
 =?us-ascii?Q?FQmxulGw8tJKlf/6Nqz0XBqt9dh1Hh9PduiSP4t0+YHs4eb+e3SlBeGVyUCD?=
 =?us-ascii?Q?MLYhq5Ojkbal7vmH+NKDtOTYhi0BnKFOcIm4C+Q+96OXNHqyjYayn9CbMraQ?=
 =?us-ascii?Q?DwlRfN25P5mgUBn25aeVUXVkjJJT++RgU8IrsLqMbz4ML8sPLTevfKJf7bsn?=
 =?us-ascii?Q?i3FLo6BshBe4/hHPffhC23IFgAknsO10xPPdb51RJ/xamKdNVzx7hVnK7roN?=
 =?us-ascii?Q?hFDdJpGPp096p54VjnQ8KJtMGCG/mDLocd7iA+8q55KLts2bNiwP6X55Nr+G?=
 =?us-ascii?Q?+xIURvWnlLMQE8/pq7g8JDWqw/RhpkLzeoCXhbVX6mCskPfjae/2LV8kjmya?=
 =?us-ascii?Q?6FACjEUtWNuTcnGHuBfZLb5dTeVGscjfx979hU1GagGOHHPNxVyWCVXXO6yi?=
 =?us-ascii?Q?+htOgO5Plhe2ygNUeGe7A6S3UI0VhnXXtmgW+b94E2B/hRXrZP0gCTMXYd7D?=
 =?us-ascii?Q?12oY3eeKptXTV/cE7jAgfPe+ggZOZLjqdjgldHFivdvBg9E+HPb5hMx+GkQv?=
 =?us-ascii?Q?T69kMsw6w37mYd2oGjaUt8+ih77rMZolxqqe4QDtLnCsFuALHtDlA28fyJHF?=
 =?us-ascii?Q?QtMOAziHbZu1YHwdvOV9M41neF0w6a/XkOt1G1meLLwKzae3R6Ufk6yMJX/r?=
 =?us-ascii?Q?XB8my3RW8e1DyvIEBATdve56NAG96qu1cpq20KrQV+9ZoCcghznjlZH2uU6C?=
 =?us-ascii?Q?Te6ZARSVN3Mg20jzWtddYjMLjHRbxCBhffZxT/tv/6Al7MnPRRJCPlvClgnT?=
 =?us-ascii?Q?tUKM0d2dOe8MpDh3w71uAQWUxHboahhRLpkZn9ocd0bKTRJccTKauDzXHK4U?=
 =?us-ascii?Q?IBsTe0G6UE1BDxNeAWPjdQ86uOfZ0MDIUXUz8vgkdNVBJABzJUFK5f98cSPT?=
 =?us-ascii?Q?ZdYR/IowlqF0tX4F6gokdVDhYZn/rzSrkLzfvm48TVZ9Cwjk6jn3VUGONgf0?=
 =?us-ascii?Q?DttAAhB1LnWZCjZQG6sNtBLwFBNpStYJof656ibmNQMObnyadGJZ/gsW/9Zt?=
 =?us-ascii?Q?D4EF3sEsjBZF/JAkEO3PykSzoEQwmUSKvUD94ZbHjtm0K8D9clwiUZP+alVo?=
 =?us-ascii?Q?ii/0z1kuM5iJMLNI7BEgeYZkpwChXXI9hG1/1IFzWL4Hw7wO2m5egXo2G/G2?=
 =?us-ascii?Q?W3OivZw4vo47BJpMZVbzzcyNllbo+O1OtjmppOdzi0eoE2djQK8snZcc0dhW?=
 =?us-ascii?Q?ho4QQqq7DXfbPd0eF71sueXbcxgG9Qp+GuIoBDS4Eav0K3IrQiDeuLFSaM26?=
 =?us-ascii?Q?8ZZCjgidlU1605qNg6LZ9PPm+OL3tlUqpaFqWnEnRpRtFeTJzwmCqu1SDebv?=
 =?us-ascii?Q?lpzB2dGDTstWgpj6blj257zfIJLjp0EAFtN3aetG6qaDWdmxAi+TO5cPM4ot?=
 =?us-ascii?Q?5cRRbbPGh1yOjz5VZQbXonq3YWLyIN/xFUMNYy5jwfRJGXk3WFu9iTycW1IO?=
 =?us-ascii?Q?ImGfnFKfWVIV04UEBhETJQpIPaQzpmHoZuD1pH533f+6l7ddIZf9WUM339KY?=
 =?us-ascii?Q?nZVRBOvsAEKV5ncGB1T4zLEEsB2W0HGMRHhu/xRK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9234f7-e753-4005-8ee5-08dd577d1800
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 22:21:34.3566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I43xhDQ1ahcCZkdidbJIC77n795+wE4TLogmforIdFmRhOrWExv8Ud84EXcFpg5+xyigZXfk4mbmBK+3Ft/+Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10459
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

On Thu, Feb 27, 2025 at 10:34:20PM +0100, Marek Vasut wrote:
> On 2/27/25 10:27 PM, Frank Li wrote:
>
> [...]
>
> > > > > +		gpu: gpu@4d900000 {
> > > > > +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
> > > > > +			reg = <0 0x4d900000 0 0x480000>;
> > > > > +			clocks = <&scmi_clk IMX95_CLK_GPU>;
> > > > > +			clock-names = "core";
> > > > > +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +			interrupt-names = "gpu", "job", "mmu";
> > > > > +			mali-supply = <&gpu_fixed_reg>;
> > > > > +			operating-points-v2 = <&gpu_opp_table>;
> > > > > +			power-domains = <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf IMX95_PERF_GPU>;
> > > > > +			power-domain-names = "mix", "perf";
> > > > > +			resets = <&gpu_blk_ctrl 0>;
> > > > > +			#cooling-cells = <2>;
> > > > > +			dynamic-power-coefficient = <1013>;
> > > > > +			status = "disabled";
> > > >
> > > > GPU is internal module, which have not much dependence with other module
> > > > such as pinmux. why not default status is "disabled". Supposed gpu driver
> > > > will turn off clock and power if not used.
> > > My thinking was that there are MX95 SoC with GPU fused off, hence it is
> > > better to keep the GPU disabled in DT by default. But I can also keep it
> > > enabled and the few boards which do not have MX95 SoC with GPU can
> > > explicitly disable it in board DT.
> > >
> > > What do you think ?
> >
> > GPU Fuse off should use access-control, see thread
> > https://lore.kernel.org/imx/20250207120213.GD14860@localhost.localdomain/
> Did that thread ever go anywhere ? It seems there is no real conclusion, is
> there ? +Cc Alex .

The direction is use access-control to indicate fuse disable. Only
implement detail is under discussion.

Frank
