Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EF4AAACD0
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 04:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3118210E16D;
	Tue,  6 May 2025 02:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MGa1Acnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F4D10E167;
 Tue,  6 May 2025 02:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDaoqgEWgjyfSw/rB7H7hI7OvHydC/4EzkKF+wodstKmfWkTXWG6Vm5kSflbV9g17T0trNip9XJWcBmIbeGM2upOrwcsE3atnjWzzjbCPstL22XrhOViWRRaF6S/LoqUEIcZVUsWT3K/2uqiVssvdPODLAjG8jhVTDhlG0xZQKumLDg+5NBXpqIphe5dkeebgXYWTOe2p0ZjVJ9Kbd3SIUhV4FGb+7ZeiwK7kN4wQvjLYicUzagfUFy60OOgzaHEThG7U3T3GZ9/rLMvjL1nvEwKLr1ChJXRjs2Vbf5VrvBTSfFqcXTq5oHhWXMUFkb8wdr9A+bHBHGAlzZffX0DiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63b9Aunr8opOU4+8ybjrFTZV2qklprm0iPPtYTehS40=;
 b=lK9mxmjFxUQplUjrg/1aTVxY8IlFdBP8CIQm3UExl8sXUT8Y4q2psH2NqdpDhIKHBXMiH226lkIbN/A8rI+q7ee89K1kT9P7dwfpYBirtdpLamYidpZVFxwswtXOiw3o9G89+1D9M7SnTHfv9Fnnct2nwTQ1YaKx0hJ1MuVxQsr4SjphQdD5I3u6HVmBThUaM19GzxgOAaDN8LbZX4N9U2nBAzbUvkzJlMTHFj4muMkmOUQV5DQgvXQqQTx0Yo1mdVRYkYmyUf69J8Ihww1qXdX2KqywaL+IFTUAmWbPRFHQ7y3Hq1BaHOODAK3PawE2FjrM6Ae8E2ooR+BeCSZjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63b9Aunr8opOU4+8ybjrFTZV2qklprm0iPPtYTehS40=;
 b=MGa1Acnpxa1YUxn0JeMOGaDDNSDAP0j9d80xA4kNPGtDKAIU3mwDAK0TEvjnJeVxdmuwFX/xXotQtQnPdbG/tC84vgou4D4tNReLww8slsnl+trg0U0ESgZxdOCd8fPlgaz1AjLRw2k2GLIZXEuYpCPuRkO2kJhZzrysDmLpRUtjUewIATn8EyT3LT3ncy49HBkSSizfjyM0qD/3TgHrTpKZYloWzGPcb+KdaVMs4Ek00EYgs3JM/NoLS13wk0rtcHNaryO3h213MkEmk9EMU9/g+CllnrPdvg8ncBu7B7UHspr1Jczqp8WlTYDnKJ8u4yS+3coViT/qId847oywRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9223.eurprd04.prod.outlook.com (2603:10a6:102:2a2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 02:23:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 02:23:22 +0000
Message-ID: <f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
Date: Tue, 6 May 2025 10:24:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/34] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa
 <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
 <553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
 <20250430112944.1b39caab@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250430112944.1b39caab@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: e11c5380-bd1a-484a-07d4-08dd8c44f8eb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?di9meTl0cmhuNno2azdPN2k0YkZ5STNyMk94OTRTT2grWTJWQjRGazEreG5x?=
 =?utf-8?B?aWx1RWVaUTU4Q2t5M0JpeXZGVVd1MTc3N2JuVkZlanByQ3RxRFZhWFdqQXBI?=
 =?utf-8?B?NmdQTy9hL0NRNmJPWEc3TDhSS2FHc0p2WFdJc3R4bURwTVZxV1VhVzhPUmFI?=
 =?utf-8?B?elBHTGJQaHVEVTBSdG1XMkVFSlhYYzlpU1V5UHAzWDBDM1VpbjlhQjdBK2ov?=
 =?utf-8?B?TmlRSkgvU0RaQWJMSktKV3JoaUsvSFQ1SDVpV0IyeW4yd3ErZmk1cWhyanlB?=
 =?utf-8?B?d1pEcE9SV0RNYm5vUEdYSXA4d0JDTzMrV1crelhSWi9ETnNERVpkWGN2ekk2?=
 =?utf-8?B?QlhpZ1NsUElDVlZLdGFLd3NMcVMwOXh1VWtPMk1mTkdHbnp6cmFFQ2xhVzFY?=
 =?utf-8?B?aFdrUjlEUzVCVG5oUU5UcWpPWU1YNHl5SWxBSjRZVkx2YzdEYmI2dWVaMGNj?=
 =?utf-8?B?b0I1VlRMWWMzWGFmV1h3OXNVYzMwQmZBL2FMS2Jtc0dUdVdaeEtxcS9aZWU4?=
 =?utf-8?B?N0FNUjVoSURzMFBjMG9reHE3bTFoZHBuclB5bVpZVGhHMG9CNFJWUGlNTE1T?=
 =?utf-8?B?aldDbWRPV0x2Vm8zOVh2R3F6TjR5bHB2VVJVZ3pWUFpVdXR4UVRlV0Fwb0p2?=
 =?utf-8?B?clRjYlplQVBMWktjdXFKUGZtSThZZFAwK0d3S0kwM20veTVkaFNXWElCdUNu?=
 =?utf-8?B?ZjIzbWNIWmY3eVVlRm1EajlWenNYVlFiTGkyQmw0bXJTc1BWZDFFN0hZWERy?=
 =?utf-8?B?bVNrWlI3Zk5NcVdKVEdqVDZPek8rTG5FSnE1NWdPWXdxRlJrVjA1WWRKQXlz?=
 =?utf-8?B?UmREaW5YSkFQaVU3bzc4dUt2YkhiVzZzT0Q0dEgydWhINjBYNXBtYXhFdHVF?=
 =?utf-8?B?RThRViswcHAxdDdvR3J5cVltNWdjS3FKL3pzYjRrOHBjNjZpVVlUaFVIYWVT?=
 =?utf-8?B?cElyb1hGR1ZMRGVZOElJOGd0eGw0QkYxU2pBT21IUDAyQ0J4STRDbFNxb3R0?=
 =?utf-8?B?VEVtWkM0ekYvNGtJbmpNWGt1OHNtSTQ1VGE3c1hWcnkycWJkVjI3TEVNYmcy?=
 =?utf-8?B?ejZJWWphR2pmUlZ0dFFUaTJ1NEUrbFE5WmlKQ0xqOG4yRS9hZW1yMDByZ0RG?=
 =?utf-8?B?cyt4eFA2a1BrbEkyc3VNSmFZUTFzMlBaamFwRnMzNFVKSVRhV3lLQlk2QUVL?=
 =?utf-8?B?MXVjZm92NDVYRnlCV1FtaFg3Zi93NHp0akZEL1oraUpCc3dtY200WGRsTGdM?=
 =?utf-8?B?cGxWQXgrKzl1MzNJVUVDYWlQMWFUOE9nZ29jcTVBVHI5cWdZOVQwT3lndE5Y?=
 =?utf-8?B?NUJabnFKUEFZRnJvOEdabCtxR0I4MWJwU0EyekZ0b25sSzFBVGNDUkZmTGRr?=
 =?utf-8?B?a292azYwQUgrUWRqZWloU1hNY0tIcjBTQzFLY0daR0w3T1poYktYQkJvZXNY?=
 =?utf-8?B?YkpIYjlSUEJObkNOYm5hVWYxSzZOTEtzWkdPTjliOEhXYlVIMHN3ZzhNeDNU?=
 =?utf-8?B?MFZ0b25mUTloV1VtUXA0ODZZOTZaZVA0U01xdytiYkNuNy9ZUTV2a3c1U2hy?=
 =?utf-8?B?RWRXTmhYTlpuVGdGT0lOZHMrMmFIbWluQ0hEWWx1ZUhjWVFrQmpRbVI2TFo0?=
 =?utf-8?B?U1dNVlJzUWNKYWJkN203M3dlYWNWMDUyOG40RGJHZGY0WDhSWUxvTHNoNUVP?=
 =?utf-8?B?Z0MybTBJTXNNOWh1YjAya3hWb0xDNUcvU2xjTVhYWHY2bUlWM1RqeXhka0ww?=
 =?utf-8?B?c3BORGw0VURXZ2IxMmtOajA4NGJGVDdwTndTSDV3VVdwOGNmRTBIeUp1Ny9N?=
 =?utf-8?B?eE9ZcEdjYmxXTjZYRGw4R3RhNVBuNndqeko1ajROWmVZOEdPbzdEN3ZvSzhF?=
 =?utf-8?B?eHFCeHBxOUFCb25qS2ZrcTZsRE5ndks0QWhCYkMraXoxeWRzN3BXUUg0WUJG?=
 =?utf-8?Q?6kyeynkRelI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkdjUzBrYm4xZThrUXpMNk93WjJTTDFUUko3Si9rd1RMeXlNREFrdjJ6TXJp?=
 =?utf-8?B?U1hBL3lyZ1prNlh5M3pwd2l2SUVXVGplWmdDRnZhYWMySjBVeGxkOXNGOUJC?=
 =?utf-8?B?ckc5TjNpMzQ0Yi83MGNaeTFGZXlnR1cyLzM4K2dIZ3FRMkpTSk9BUjRXR2lQ?=
 =?utf-8?B?eElMdTIwRWpqcnpuNUdwci84L0w0OUhxNUJweWJxMDBrbEltcGt3U0FKUC9Y?=
 =?utf-8?B?ZlVzSU1uQm83RzBOeWFhUGZzR2V0QXZqQVBRVlJjMnFBalBWK21EWVA3STAy?=
 =?utf-8?B?UFcxZmpUeEt3cFhUNUd6QXFOZEVKZTE0bWl2QW5IR2kzOFMvcEowd1pRVDR6?=
 =?utf-8?B?NFhQdW1VZXoxV0VIdWRHaERDdjFMNEd3UjlrQ21BODNWbnJWTW04Z2pBajRY?=
 =?utf-8?B?Njk0QWRCd1RQZmoycHZDOUZiYzY2eWEraVpmanBXSjdEa21zempFVElmS2sr?=
 =?utf-8?B?K1N6QTlRcVgrR1Brc2VzRSt6MTNBWGRMamRKT0R4b0NIUlRhQi9ubVlBSjR4?=
 =?utf-8?B?Y29yaXY3cGV4VXQvcldqcy9ZT29BVDZIeXhmYWFVdy9WVXdqVXBzdXptNVBQ?=
 =?utf-8?B?RnRJaGdwc2tRRkhnSWtRTDlHSFk1WGVCN094WVY0TVA3cEFGWGg1VE9ZckEw?=
 =?utf-8?B?djhHeVo1eEE3Nk1aaHc4cWw0dDUzWExkbWtpclZMYmQxRG03YVVtVHJLN0pH?=
 =?utf-8?B?M0Q1N1NXeWFscmg5M3lqaENUWmVyalZEYUdyL2ZMMUxvWlNNaFJJRUw4Tjlk?=
 =?utf-8?B?S1FoSTdsOE80ZCtmb25kYm5JVHJiN1NDUm1WTFZoclpUTkh5Rk1zS21paXlP?=
 =?utf-8?B?cU1FUC9uMmFtNG9tVzFuOVRtaDR2cmpCL3pqclVQSW51S1JORHJrVjJCV2NU?=
 =?utf-8?B?Ung5RHZMU1ArbWR3K09yUWdDQTR0RFJpVTU3M3daM1BxVjBvaWlWMjRPYmpk?=
 =?utf-8?B?RHdnUE9DT25GUEFXNlEra3FSSnB3RHQvU3ZyL0gvZDV2ZVBLUmozMEtLQncy?=
 =?utf-8?B?ZDlPS2ZNOFZ3LysvSmU1VkwzcVV2MFhTNDV2am94eUN3WnVqRU53R01rbUtZ?=
 =?utf-8?B?amVxM2gvRzZPOVV1UGtrdXRDL3BTcUdrVlBRL0NnVWFVUXRxWWJ6YnFvQ3d1?=
 =?utf-8?B?bmtaWTUyU1FnbVpncVgxYWNRU2pib1JQc0thQkxFNGpWak9QdW9UdlgrTS84?=
 =?utf-8?B?T1Bsckd5T3lLN0lkWmsydVJ2blJCWS93bi9YSVU1WjdTMGxyeDVmQU94SjZV?=
 =?utf-8?B?bkxDMTN6cWlsMmVrc2VkejlZejZHZTRVV2tpVHJ6Mm5YR2Q1ejkzT3ZtR1pZ?=
 =?utf-8?B?M09OWmlzSWtUMWdPOTFoT1FTS2VENHd5TGlpcnF2OG5QZ2ErUk52TGsvT3F2?=
 =?utf-8?B?YWt5Y3luQmhqdWJ1WkxLZXZZVGRXdDJkOXArL1NsV29ENFJHWm14TkpqVHE5?=
 =?utf-8?B?YS90aTlyelloNFZmSHFEV3IvWVJVNThlTTZlRkZGOVRnWUtjOTZhRVZvbmVQ?=
 =?utf-8?B?cmNJWnp1VndUaGhqNTZEZUthRk9LdHBJYWFtd2RQL0V3TGN1MUNYY1NUSFhZ?=
 =?utf-8?B?cmdpZmxsN0Ywc2NjcXphZmd5cWg3SHpRL2h4dyt0LzRhcWxhOFFaNFIvbnQ5?=
 =?utf-8?B?V3lsc0NSYWpHRndWTWZiSXRCdmV0OUY0NWEvcTAyYjRlQXppNUhmdnFKQTNz?=
 =?utf-8?B?NU5IK25RbzRKNVZQVkQ1V2hzdzdUUlNHTU12dDZ1MERaY1RXNUFmVFA4a1No?=
 =?utf-8?B?aGdoOGd6STRkL2ZGYWVFWXJibzhNc2Y1WGNDRWFxcWh0QVBuK2lETmgvWmJ3?=
 =?utf-8?B?WjBjNGVxWWlwWVo0cDVQSThtM1kyR2dpd0xvMU14RlVzRElyVTN5WVBsSVVo?=
 =?utf-8?B?V2RqTDZJaWU4ZWgwNjY4YWF2cW02ZlpYYU1mYXBoQS9TbXNPdURma01FRmtP?=
 =?utf-8?B?anpncDNFVTE4dS8zOVVoOVBtQ0xraHVwWS9SWDZPZ1U5TEIvRWtoaHA1cWJE?=
 =?utf-8?B?aWdGaVFzall5bWJ4WDVWZ3dxUiszanltS29UL1lSMUNmNUtNeVc2MEVlL2hI?=
 =?utf-8?B?bGlKd0VFOThGUk9LT08xY2pJRTlscWp0a0twbHAwTTc4dHo2dXJKc05LQTZo?=
 =?utf-8?Q?TXPOCszcRt+Zb5Jz8Y/x0VPyS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11c5380-bd1a-484a-07d4-08dd8c44f8eb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 02:23:21.9794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUp1VcJJNpJskboapS7NuaShR20VTVbnHdxV7uJ7Q1ku2ku9Jw63SRw3TL7rd6/mvfxcqQQBrbKtozT5Kmfabg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9223
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

On 04/30/2025, Luca Ceresoli wrote:
> Hello Liu,

Hi Luca,

> 
> On Tue, 29 Apr 2025 10:10:55 +0800
> Liu Ying <victor.liu@nxp.com> wrote:
> 
>> Hi,
>>
>> On 04/25/2025, Luca Ceresoli wrote:
>>> This is the new API for allocating DRM bridges.
>>>
>>> This driver embeds an array of channels in the main struct, and each
>>> channel embeds a drm_bridge. This prevents dynamic, refcount-based
>>> deallocation of the bridges.
>>>
>>> To make the new, dynamic bridge allocation possible:
>>>
>>>  * change the array of channels into an array of channel pointers
>>>  * allocate each channel using devm_drm_bridge_alloc()
>>>  * adapt the code wherever using the channels
>>>
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> [...]
> 
>>> @@ -345,8 +351,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>>>  free_child:
>>>  	of_node_put(child);
>>>  
>>> -	if (i == 1 && pc->ch[0].next_bridge)
>>> -		drm_bridge_remove(&pc->ch[0].bridge);
>>> +	if (i == 1 && pc->ch[0]->next_bridge)  
>>
>> Since this patch makes pc->ch[0] and pc->ch[1] be allocated separately,
>> pc->ch[0] could be NULL if channel0 is not available, hence a NULL pointer
>> dereference here...
> 
> See below for this.
> 
>>> +		drm_bridge_remove(&pc->ch[0]->bridge);
>>>  
>>>  	pm_runtime_disable(dev);
>>>  	return ret;
>>> @@ -359,7 +365,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
>>>  	int i;
>>>  
>>>  	for (i = 0; i < 2; i++) {
>>> -		ch = &pc->ch[i];
>>> +		ch = pc->ch[i];
>>>  
>>>  		if (!ch->is_available)  
>>
>> ...and here too.
> 
> This is indeed a bug, I should have checked the pointer for being
> non-NULL.
> 
> Looking at that more closely, I think the is_available flag can be
> entirely removed now. The allocation itself (ch != NULL) now is
> equivalent. Do you think my reasoning is correct?
> 
> Ouch! After writing the previous paragraph I realized you proposed this
> a few lines below! OK, removing is_available. :)
> 
> [...]
> 
>> On top of this patch series, this issue doesn't happen if I apply the below
>> change:
> 
> [...]
> 
>> @@ -351,7 +349,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>>  free_child:
>>         of_node_put(child);
>>  
>> -       if (i == 1 && pc->ch[0]->next_bridge)
>> +       if (i == 1 && pc->ch[0])
>>                 drm_bridge_remove(&pc->ch[0]->bridge);
> 
> Unrelated to this patch, but as I looked at it more in depth now, I'm
> not sure this whole logic is robust, even in the original code.
> 
> The 'i == 1' check here seems to mean "if some error happened when
> handling channel@1, that means channel@0 was successfully initialized,
> so let's clean up channel 0".
> 
> However my understanding of the bindings is that device tree is allowed
> to have the channel@1 node before the channel@0 node (or even channel@1
> without channel@0, but that's less problematic here).
> 
> In such case (channel@1 before channel@0), this would happen:
> 
>  1. alloc and init ch[1], all OK
>  2. alloc and init ch[0], an error happens
>     (e.g. of_graph_get_remote_node() fails)
> 
> So we'd reach the free_child: label, and we should call
> drm_bridge_remove() for ch[1]->bridge, but there's no code to do that.
> 
> To be robust in such a case, I think both channels need to be checked
> independently, as the status of one does not imply the status of the
> other. E.g.:
> 
>   for (i = 0; i < 2; i++)
>       if (pc->ch[i] && pc->ch[i]->next_bridge)
>           drm_bridge_remove(&pc->ch[i]->bridge);
> 
> (which is similar to what .remove() does after the changes discussed in
> this thread, and which I have queued for v3)
> 
> What's your opinion? Do you think I missed anything?

The pixel combiner DT node would be added in imx8-ss-dc{0,1}.dtsi, please
see the case for imx8-ss-dc0.dtsi introduced by an in-flight patch[1].  As
channel@{0,1} child nodes always exist(DT overlay cannot effectively delete
any of them) and channel@0 always comes first, there is no problematic case.

> 
> Thanks for taking the time to dig into this!

After looking into this patch and patch 31(though I've already provided my A-b)
more closely, I think the imx8qxp_pc and imx8{qm,qxp}_ldb main structures
should have the same life time with the embedded DRM bridges, because for
example the clk_apb clock in struct imx8qxp_pc would be accessed by the
imx8qxp_pc_bridge_mode_set DRM bridge callback.  But, IIUC, your patches extend
the life time for the embedded channel/bridge structures only, but not for the
main structures.  What do you think ?

> 
> Best regards,
> Luca
> 

[1] https://lore.kernel.org/dri-devel/20250414035028.1561475-17-victor.liu@nxp.com/

-- 
Regards,
Liu Ying
