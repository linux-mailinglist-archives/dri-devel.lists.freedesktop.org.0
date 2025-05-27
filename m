Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C0AC45FF
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 03:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5A710E122;
	Tue, 27 May 2025 01:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cxpbfoWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388B810E122;
 Tue, 27 May 2025 01:40:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlwBcM4NPz7dr7UzVE+ioh65Fkab53TTQB1zzWLma+8DGESMUPg7Fgomiul6qSU5GE59/ce0sh0dXHwPCC0p72Xekl0AraeO7ylAiPUQ8Qew9VCqB6ycB5J9+pbzzLh/PBtLka8V8Wa4hxSQpvWp+TecUoM8l3WOdVCI78SBzyCJl+NJPyprvIwA34CfvfLTXUL20pXVMAM5Eix0Us07hqXHmLOuRHczwrdn+Lhg37XKYG4AkP2YZdXy1BvbBcfU8PFoYKFtsPzTAkhG4oCK6tFxw0D/duKJni/zF+4Kdt49Txk3wj1jcynhKN3ycV7dPSTEmTrgp7WUI+pljrpuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJNPOBYkA332Gm1n/RNP4l4xJ5l6gwQXPoUdntxwna8=;
 b=gWmCa25q1AgXlQA22VGrzsw+9khc6fMXQOc+epOYMhu/1GfkIt5ANA0SgL+SuH6BVbUcZldjFkS/Y4zF/P7i46xm5MfeViB3RPhJHC6ItjlPo4h0hElNkL91m0YMBCOkZGjvQjT9FLCYA9pMwf8LUW6X6PxIJ9aB2/71VjIrSIEo39GwATHpLAN4gEa5g2D97rapqJDoIk+cDQKjp0EmbkqOos4HmeQKvC+tlXT/4lqdClM6mV618LuY7cXQ/7GlVb/UOo+FUNPdWEy/kgYXsitJ//6MkIv6VfJtKdQgFY3xmS9rV9txLaV/YnMLDJ3vy6Hb2gahLez7EzByUCv3ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJNPOBYkA332Gm1n/RNP4l4xJ5l6gwQXPoUdntxwna8=;
 b=cxpbfoWOWc1bXO621JZrT3J/AIJl5xvBPCgkeFEqzcU4kzd/79lndwfw+2D3u7JLmVkWKJVXhVPDzcYwl02Ywx8xSeAyxPsyOqIfkiSdFWPL8qfhufh6jIWlmC9AWMnSYnylOkc4XriwBqmo8p5FfwVcbYta1wdNYnDArhsvg1eJ/ar3nRu6K1uaHjk4ryvaZ1VyaAKGgLtjUqnWePHLwt0yNXwGug3Z3A6F/BBdpy5pTxr3J+iOMgXqzBftzRsbK4ccTvOCrco1OsxreCX/0b9CxppdQcYkgXplhB76/rTeW7xjnowmGRlS2x9muEq14Tn+06VhnKkJmjIswJCfwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB11241.eurprd04.prod.outlook.com (2603:10a6:800:29a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 01:40:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 01:40:43 +0000
Message-ID: <0a88178f-a3f1-4aa1-94e9-6050330ff168@nxp.com>
Date: Tue, 27 May 2025 09:42:11 +0800
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
 <f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
 <20250506224720.5cbcf3e1@booty>
 <67252c36-8b31-4c40-9d89-4f502da4a087@nxp.com>
 <20250526092024.48cae4ae@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250526092024.48cae4ae@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB11241:EE_
X-MS-Office365-Filtering-Correlation-Id: ce86e609-e697-4ec3-b533-08dd9cbf7e8e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3pjQzhjckUxaHBDbkpIQWIxYlJqRSt2bnVaTjk0OFRoaHRzYjZpMndvY01k?=
 =?utf-8?B?QWxjaHdHVDcyaTNCamorSWFERE1BdkJSTjUzemUxQ1luMEVKbmMzbW9zQnB3?=
 =?utf-8?B?ZEc0LzZZcG1xZFBZbUNDMlJndzg3eG9oTU9FNml0eVJDMFg1SXhnUzN1LzBa?=
 =?utf-8?B?bWhDZnIybnk0ODNQejlaTmlaeXlwa3lLcDByT0IzVjhKT0taajd4ZGpTNlRx?=
 =?utf-8?B?Ykl4amVNYmNTZUtwcWg0WmNVWU1paFFLVHB5TXlSczhQa0Yva0NWNW5lMTVM?=
 =?utf-8?B?VVNnQnI4aEVBUjBBSHpjTklLaiszOFBMT0Z3ejNyVXRQSFZERi9xZnF2OTM1?=
 =?utf-8?B?d1RyblFsZGcwR0dTYjJ5bWlMRVY1dEUyZlJtZi9jUWM0L0lVUlZFdm1OVnFP?=
 =?utf-8?B?cWdqcThidmNNNFBqditKa2pid3NnWHB3a2g4Qm9mKzFDWlk5V3RydHQ0ZS9w?=
 =?utf-8?B?OGtpcEZrbUh5T0VnU1ZHYldka1Y3VHdOL084SVViTm5vQ2V5SDVKSFZvL3hm?=
 =?utf-8?B?KytPQVFSSlJ5MjBhVy9FQ0Fxek5VQTlOZmZlYUQxc0hMNldDb2VlU3FORjZW?=
 =?utf-8?B?c3JucHZRRlVmRnBRV3g2Z0NHNHp4WEx2ZEg0K1BrblFYR0pVMUdRakF1eFlq?=
 =?utf-8?B?SmFzWVJSMkdsYWNGblUrWG9oMlFGdlR2SGx6TXdtNkc2UVAxU1VIVC9hRW8z?=
 =?utf-8?B?a290WExza2l3cUtUTUNDTmNsek5wUytiN1JramVObHRVMG11N1REM0EwTEth?=
 =?utf-8?B?Z25SZDdHMzFxcm5wd0toUXA1WVpha1pCOHJwM2JWTFErVDNkT2ZaSW83ck4z?=
 =?utf-8?B?bytwVm16Y3Vjc0t6b0lYN2o0V2xSVjZTc1hVdnZjRndBaWRMVGZOeXpvWkVE?=
 =?utf-8?B?dnRNdlpQMDBYZGRIRzc5SnYvNVVQc1ZsYXhxcWVYYTlYdVdHRzlVM0hTTCtN?=
 =?utf-8?B?NW5lcmtQMGFqT3JBbkFUZUg0ZTNFZmpvczdPNk9sNXFoemNQQjU5REZLMWc0?=
 =?utf-8?B?V2xjSVFsS0pvbnJDRzRCTWZ0b0ZoK2xsclhHYU55OVVUdm1udG9tdE1ZR0h3?=
 =?utf-8?B?ZTNBVnNJdTdFQ08yZWptNE9sMWVmS21tQ0ZMZzROdHk0QUhCV1hqSVRRbDg1?=
 =?utf-8?B?NWR0aTR3RHVCL29XaTA4SUY1bDZUNVRvS1FLV1VIeDdUZ1FhRk93dWd2S0hy?=
 =?utf-8?B?T1RFdysyTkphUmE3VzhoNCtZMDBmejhxUDRoZ1lsZmRPejB5dFhPZ0JIaWx6?=
 =?utf-8?B?c1U0Q05URmhxQU95RlVlenIxWEs1R0pPOTc4THhhQWxuQkt3eUxkR2ZRdG84?=
 =?utf-8?B?VngwazZEM0p6Nnc4T2ZlbDBERGxBdXBQektLMWhIdnQ3amNqZ0oyU0gzWEht?=
 =?utf-8?B?QjdLeVNWdVhSckVTRGxaMWVmWFhvT1NkaHUremJMV2haeWZpQVZqaEJVTkpY?=
 =?utf-8?B?WjlTaEpIRTJMck8xVlIxdG1UQzdkSC9sOFpuSHhxcTVlSGhibjBKTG1UYjNB?=
 =?utf-8?B?enB2SDRTNDArVkR1VTZJS2JuNHhXVlFiYWdJblF6eDZRN096Kzl3NzVLM09s?=
 =?utf-8?B?TlhiUEJmMXhRbHhkVDV6M0FFTTBUVFQ2RDIwQ21sWHdnNHl6bEs4ZEtwcTFn?=
 =?utf-8?B?dWdKZGZCZGhjd2FjYUVON0Z0dkppSjA0NWI3NG43RE9pMm5BUitEM3l1QWxs?=
 =?utf-8?B?Q3NBUytqNUdSZzV6bWI4SFpkaVRBb2pHL3hxODRRVFZxUjB3N0ZFTE1WL2dF?=
 =?utf-8?B?NkZqYmFYOERYcTZZOTg4ODIwN3ZveFR5WEJsMlNOM2cvWVh3RThMRUZJWWRW?=
 =?utf-8?Q?32VE72z/cAsSvy87VlBcqoS2BcASl9ZarqYQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZPWHVneFV6TFdvcUJ2d0N3ck5HZk5WVHU1b0xOYWNQQUw3bkJicTlabytq?=
 =?utf-8?B?UmREdmFKRjlDdHk0QUcybTREa0dCSDZKdnJVc2dKUFY5citSTnBlT1M0MUJM?=
 =?utf-8?B?enlzMTVnOXE1UjdQVWR0dlR2cHVEbHBmM2NiS2s5RHFsMks3d3FZZmMzbU1P?=
 =?utf-8?B?cjQ4ZEw5L215ZmtyRWxQSTIzYlZLd1VKTmZWUVZUQUd1bFJOaDFuWkcrRDZq?=
 =?utf-8?B?YWs4YnFvY05wdlVRbElVZEFCZEZ0U0hCUkFOWjlBcXhlYXlKckpMRVd3dU9G?=
 =?utf-8?B?NkJXWGhsRTVwYlpqREY4WnpDRENxTVA0TFlBWjBXQUtTSGtQaU9WQXFtZzEw?=
 =?utf-8?B?YXh1bzkydmdSbCs0cEhuRUF2ZVZnWGdpY0lJU0dZKzd0NnlndmwrNkxsbEZS?=
 =?utf-8?B?VEpJNmJyL0lHdTV0WndFaXhLdHRZamI3Y0VkbjVMOUtDallrTk50THA0a294?=
 =?utf-8?B?K3AwcndPTTNNYzR5TWRKbndEL0JZbVkxelE2STdTZlBoUkpzWFBGc3hUb3pD?=
 =?utf-8?B?Z3BrTFpEUVowYS9IZnFjb2VPLzZvQTJlaDc4VUNRc3Z3aWhOazNPUTAzSUo3?=
 =?utf-8?B?aVJmOUoyTktSOEEvSVJub2E3SllWUjlnTEkraWt5MU92SGZMZVR3S1RrYUZp?=
 =?utf-8?B?YnU3c0RoeEptSE5CNU1pb2FZRmxVcXUrWWdqb1JBMTc0cENnTHVROGNEUkJL?=
 =?utf-8?B?ZkFSWXMvbEFoWHRyZmFRVzhERCtlMG9JL0RrQWp6Y0hCZGgzTVEwMmVIWWxX?=
 =?utf-8?B?dDg4Q1VkTFpQeEVaZ0xzZXBCYzJSZis4VWdrUU9CU2l0TTdjMVdRUU9FOGFE?=
 =?utf-8?B?cTJ4eitaVVIzdHplZFdXU2NVcFNsbmZ5WEo2VmwxaTk1U3F4Yk12NlRSV1dZ?=
 =?utf-8?B?Z29IbE5tbEtIanRoUTBDbXZQYkpiOUVYWVBLRi9iaDRaMCtCbjRSeC95OGk1?=
 =?utf-8?B?eUdkVzVPb05TMjYwL0I4SHJOcHJ4V1lqVUlNUVhxWDZ2ejl5bFBYQ3RSMWp0?=
 =?utf-8?B?aHFYQStxUDFrT093c1ZKcGtBM2gxUFZXS3ArajZOWjZxQWRzNzByRStoK1Ey?=
 =?utf-8?B?YjVJZ2cwSVFaWVZtM1VSa1R2NzFKM0g2b0xPL0dCM080Rk1FM3pqaU1hZk5x?=
 =?utf-8?B?V0l2UWZTZmlGV1cxQVhvQjdmVUtRVTVtY3R1U3ZCVjR0UzRPaXNSZ1F5L2lV?=
 =?utf-8?B?elVYVXJkZ0VTbHV1QytxL0drbU53UlJLRkZqL0JaSEJuY2NXcWU2emR1ZVpC?=
 =?utf-8?B?clRlVHpvOWhqV2ZMYUpTbUNQcWU2dnZaeEFldUZLME56d0loQ0JESTFxUGlw?=
 =?utf-8?B?ZGZsbVZGdHAwaGkzdkFGWmlCbFEyZFlZcTV6Vm42cGZYemxRKzhKeDJrQmZs?=
 =?utf-8?B?Uk5ZK0p3RHd4NDlkdkpwZHROSGVTOVN1cDZESjNqRGUwN0NydzBPbmRhVTZD?=
 =?utf-8?B?TXRHcXNrSXVSSEJrKzUrRkd2M2NPbzZiSWk1Zmh5eGNmTGsxOGVRSEZTN3ZT?=
 =?utf-8?B?NjVZejVOZWZXb2prSUQzYURQN1lPckdGMloxRXk4a2xsamdRRjIxNUU5SUdW?=
 =?utf-8?B?YS9qZCtFZmsxcEFrbFNEV3kwRVl5dWtyVmVSdGxGaWMwRjhJMDBXOStNOGZ3?=
 =?utf-8?B?S25MZmMxd2pxa3lIMGduV3g2M3o1VncydUtselpJT05RU2dTTkRIbHc1eW1q?=
 =?utf-8?B?S3V5bm81VEE3M1pFTEZXUlZTQjNGc2RPL2xCbUZBNXFVZG5GR1ljUUpPMkMw?=
 =?utf-8?B?bXBzQTA0T3lGTVA0aVhRRjROOEh3eE81OHdTUWdyTk82YmNNeHVPUDFzRmtS?=
 =?utf-8?B?Y1lLUWsycUlRUVBsekNlam5mamRzQjNORHlPbnJhbEJmd1p4TjhjcEZ1aUQz?=
 =?utf-8?B?ZVNrbFgyOW5Fa091N0JPUjJBeXZnenM2MWthSktMQWUxeHhmM1ZzYlFHSnNw?=
 =?utf-8?B?VXJFNmg5aysxemYxM0g2UXRnRzJFcEtpcEgwTUpVUnp3SHdaWWlGVUpuOE5r?=
 =?utf-8?B?SGZuYmE5RmZiVTJlVm1uSjBUYmFGaU85OU1uaUEwT3h1L0p2ZzZJY3BLd2Ry?=
 =?utf-8?B?Y1ZMckUwdkF6bWVobTk0N0t2N2NJT1dIMXMxb0lPNkNiRDh5ZlVsdnIzaTdC?=
 =?utf-8?Q?/Qljje3UiZVhQWFhYxAQVfvQ4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce86e609-e697-4ec3-b533-08dd9cbf7e8e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 01:40:43.4749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsxOlVlJu8fTmopTgTzxSFjqZ+d2D+NcjUsxR+KN7vgpQoqodpNSgM5bjldTfFsDl0h+Pg6fj8XT4tl3yYY+Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11241
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

On 05/26/2025, Luca Ceresoli wrote:
> Hello Liu,

Hi Luca,

> 
> On Thu, 22 May 2025 11:01:13 +0800
> Liu Ying <victor.liu@nxp.com> wrote:
> 
>> On 05/07/2025, Luca Ceresoli wrote:
>>
>> [...]
>>
>>>> After looking into this patch and patch 31(though I've already provided my A-b)
>>>> more closely, I think the imx8qxp_pc and imx8{qm,qxp}_ldb main structures
>>>> should have the same life time with the embedded DRM bridges, because for
>>>> example the clk_apb clock in struct imx8qxp_pc would be accessed by the
>>>> imx8qxp_pc_bridge_mode_set DRM bridge callback.  But, IIUC, your patches extend
>>>> the life time for the embedded channel/bridge structures only, but not for the
>>>> main structures.  What do you think ?  
>>>
>>> I see you concern, but I'm sure the change I'm introducing is not
>>> creating the problem you are concerned about.
>>>
>>> The key aspect is that my patch is merely changing the lifetime of the
>>> _allocation_ of the drm_bridge, not its usage. On drm_bridge_remove()
>>> the bridge is removed from its encoder chain and it is completely not
>>> reachable, both before and after my patch. With my patch it is not  
>>
>> drm_bridge_remove() only removes a bridge from the global bridge_list defined
>> in drm_bridge.c.  drm_bridge_detach() is the one which removes a bridge from
>> it's encoder chain.  It looks like you wrongly thought drm_bridge_remove()
>> is drm_bridge_detach().
> 
> Indeed my sentence was inaccurate, sorry about that.
> 
>> So, even if drm_bridge_remove() is called, the removed
>> bridge could still be in it's encoder chain, hence an atomic commit could still
>> access the allocated bridge(with lifetime extended) and the clock_apb clock
>> for example in struct imx8qxp_pc could also be accessed.  That's why I think
>> the main structures should have the same lifetime with the allocated bridge.
> 
> As the long-term goal is to allow bridges to be hot-removable,
> decoupling the lifetime of the various components is a necessary step.
> Definitely it will open other issues, and especially the removal during
> atomic updates. This has been discussed already, and there is a
> proposed plan to handle it.
> 
> First, here is the grand plan (mentioned in the v3 cover letter):
> 
>  1. ➜ add refcounting to DRM bridges (struct drm_bridge)
>  2. handle gracefully atomic updates during bridge removal
>  3. avoid DSI host drivers to have dangling pointers to DSI devices
>  4. finally, let bridges be removable (depends on 1+2+3)
> 
> We are now at step 1. Your concern, as I understand it, will be
> addressed at step 2. Bridges won't be removable until step 4, so the
> current changes are not introducing a misbehavior but rather preparing
> the ground with all the necessary infrastructure changes.
> 
> Step 2 was discussed in the past [0], and the idea proposed by Maxime
> is to introduce a "gone" or "unplugged" flag and drm_bridge_enter() /
> drm_bridge_exit() functions. The principle is the same as struct
> drm_device.unplugged and drm_dev_enter/exit().
> 
> In a nutshell the idea is:
> 
>  - drm_bridge.unplugged is initialized to false
>  - drm_bridge_enter() returns false if drm_bridge.unplugged == true
>  - any code holding a pointer to the bridge (including the bridge driver
>    itself) and operating on the bridge (including removal) needs to do:
>      if (drm_bridge_enter()) {
>          do something;
>          drm_bridge_exit();
>      }
>  - when the bridge is removed, the driver removal function sets
>    dev_bridge.unplugged = true
> 
> The "do something" above includes any access to device resources,
> including clocks (and clk_apb).
> 
> In other words, two pieces of code can not access the bridge structure
> at the same time. This includes bridge removal VS any atomic operations.
> 
> Do you think this addresses your concern?

Yes, drm_bridge_{enter,exit} address it.

> 
> 
> For you to have a better picture of the path, here's an additional
> clarification about drm_bridge_attach/detach() and
> drm_bridge_add/remove(). As part of step 1 of the grand plan, both of
> them will drm_bridge_get/put() the bridge, so that no bridge is freed
> if it is either in the global bridge_list or in any encoder chain.
> 
> Patches for this are already approved by Maxime [1][2]. They cannot be
> applied until all bridge drivers have been converted to the new
> devm_drm_bridge_alloc() API, so they depend on this series to be
> completely applied. We are getting pretty close: as of now the entire
> series has been applied except for this and another driver.
> 
> [0] https://lore.kernel.org/all/20250129125153.35d0487a@booty/t/#u
> [1] https://patchwork.freedesktop.org/patch/643095/
> [2] https://patchwork.freedesktop.org/patch/643096/
> 
> Best regards,
> Luca
> 

-- 
Regards,
Liu Ying
