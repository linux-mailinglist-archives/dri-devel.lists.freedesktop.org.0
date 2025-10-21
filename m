Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D379BF55DD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A829910E065;
	Tue, 21 Oct 2025 08:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="XQqqyznn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341EC10E065
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:52:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZMzyPESXHq2bQshLgbYsKgHmj8bC/ljQuSKrBSpvmAHqEt+d5CGSTjinRvIXuEPO6KGDAX881jAcO5W641jf0xvXuR/9sc6IOi+aYS1TUYhfnyeA9rrk0HWi5SM19MSkk8pq7825A3MiMAOZrC2QpHjzLCorMnRxE616JR1Ht24gC8ARnAJZYE8ZSuvgCLMFmCUOCsyMmRA4Ukd+xRKmweRBP6URGzrm7N+dahummarskd90Ufo8KHCtz7mRTYZ5jDIg1Zo8LC6ZPWpAnXemUGvsQK5CR4w7iRaEErJKF/0WxC7DCvN8GpbLW5VM/Ao4E8Naw2r1qMFxRPtu2dj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qMzgdbhZ6dEGZbjIVWFEJiCSp7DP00W7ktrnKFQMPU=;
 b=ryvB/HFXGONrFFOsymbZHLvPJcQyJV4Ky1Z+Zhl543gXh9S8sB58qkns5dgXtO6mR2R3tF3NaZDoub+/TEBEI4rsmhJi1xVJ7gD6/EVD4WhmVrJfS2kORGhAMw8JJOZYgSsSt293l1qp0sLYM9IYwVjsYaMPqqPyl0cn+Mmc23mTGtbkeuOqUyNoyKg8p+Pk+OTym2tucw6vVzihst5fAXLkvCEXMnwRhLMukWYIWaSkq/vYZtMRSkzv46VfcXSxeDUFddznxbKx7tEFnn7S5CkXDpk0uxG5wKHmoyhq04inyfpL5gwXDjPmYQF7nxJRMrm/U3BN/NE6WqnahR8Amw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qMzgdbhZ6dEGZbjIVWFEJiCSp7DP00W7ktrnKFQMPU=;
 b=XQqqyznn+NMaGjx47OUNyLwtnh/S1IqDC63aX7VRW/pHxWrDnXylYmw1ALcEL9vmRTg6eulo07q4qMFHOx6a6Br0MRrrZUO6/Z5KT3ZkwSesiKsJ+ngISxbhzGUgCkv4KK1dUaK0md31b+cUa4Qv73UlyhVmBbvAY5E4LpJwmjAGKhHFzqXlbJqjZAev4vHHznaZaikLpz0ZSjBlfBWnYPjrgCURd9CuKrLCVpVEqDoYu0yjnvPsfNdIek2YJCfBzFiGi2yoco1EjU0/QCT8u86HdC7gzOteOp4p2fO2NZtGMLb2jXazNEnJ+X5LEF/WGlmDIf4dZWYaK2UAZ5JNMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9024.eurprd04.prod.outlook.com (2603:10a6:102:20f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 08:51:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 08:51:21 +0000
Message-ID: <7e0fb617-088b-4075-9631-e37645b4c40d@nxp.com>
Date: Tue, 21 Oct 2025 16:51:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-2-shengjiu.wang@nxp.com>
 <aPc9-wYxGB1KYPyQ@phenom.ffwll.local>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aPc9-wYxGB1KYPyQ@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e051b51-b3a8-4103-4fe0-08de107f01d8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3AzVnc1Q0dvYUh5LzEwZnBUd2xOZXRKQ25VK3N1VDIwR1M4dFFqS1Jicmln?=
 =?utf-8?B?QS9nUFN0cGx3Njd2b0o1Tk8ySEpPanJKYmRPQTF0MnNPZEk0NmNUbGE1WVY3?=
 =?utf-8?B?cjBDT2gxL2pwQ0g1b0h3NFNkdnVtZUpJWVRwcm5RdWc0ZjN3OEJmVk1oMCtM?=
 =?utf-8?B?NHNJcXNqMk9oMEhSUDlIdHozem41elRTZjAzMHBBSWltU2duNVllUWVjQzNF?=
 =?utf-8?B?eTNLc1ZnZzhvWDZSUnFndkpRQUdaNExNREw1VnNyenB3Y1VqeEZadDdYQ25j?=
 =?utf-8?B?TjMrVVJpclRtdVBhYkU2L2d3M3ZHb3JaaFBuclkyOEl3aTlEd2tvSEc3YnpW?=
 =?utf-8?B?WnN0bkNhVUNNM2t6SFd4ZGhPUXB3WW05VnRDUWlnbXJjcU1wa05INDNKbGUv?=
 =?utf-8?B?N2pGK3JtK25EZkt3VjM0Z3d2NC9pbFRLSlBhenczOWNydTJRLzFydmU0Zll4?=
 =?utf-8?B?WFp4aWlueHNQK0diVVRVSFhTWEhWT0dDZk5KTTAzWVNSc1pwYUY2N1NMeElk?=
 =?utf-8?B?aHVSUGE0NTl6aXdTUTlXdkI3WmdCeGZkekdOS2hoYUZBNDY2cGJNQzRZUnhw?=
 =?utf-8?B?ZWorbVo2YnhuMFNOeGNtZWVxOVNueVdTbDNwK1dQMDJxTmlXUjhWb2JKY0kz?=
 =?utf-8?B?SVphWno5THZySlFTVTJWYW1QUmI1NEV0Z2lJaytORFN2dTUrVWYwRGZWbG9w?=
 =?utf-8?B?VTZka3VDU0MxSFFhMElHcE5OMlBDdlFCaXlpV0lWb1NER2tRU2pWSFdic0pZ?=
 =?utf-8?B?QkZEOVpCZURzRHdxMEk2dUdMdTRPczRYNC9pTXpUQUdrc01vOWhhVHRaQk9N?=
 =?utf-8?B?U1FzeWIxQnEvU0Z6Y0ZDRnRIZy9idlBoNEsvaWh1akxZUTFOS09uSlFuem5o?=
 =?utf-8?B?Tkd5cHRFaWh6U3EzUWU0S1BPK3NYaFA3YnBPL1prU0hLRU9ZOUIxYThSZTQ0?=
 =?utf-8?B?b1dSVkF5cit3TjFmMFFnYitOd1lYRmVhaUhyTjRWWFBQUVpTV0N0VmNnUFV2?=
 =?utf-8?B?cm5WSXE0QlZZcGFwYTV0L3FYQXRmM3F1WmgrVU0zZmxhV05wWDFsUjFhZHdt?=
 =?utf-8?B?ODdnYUJDRHhXWkpXMGlZc05ISFhNcFhsMENtNy9oT1dMSEJ5QStNSmVtODdQ?=
 =?utf-8?B?Z1N2WEhrL1BCUDFVTEMwN25PN2FlNFBHMGdXazR3T0JneEJnRFk0Mk9paW0y?=
 =?utf-8?B?MDdnODk0dUZWS1hvaXBjWkhDMEUzaHB4dDRIME0veG5Nc1FaY0ZqdFRyMmd0?=
 =?utf-8?B?aC9NcFo1T3E2STdaUWZDdzBQNUdKT2c3SksrMWY5d3FsaGtOelZjMnk1dmt4?=
 =?utf-8?B?UVozZmJoTGc0ZFMrZkdvdDQ4YlI2UW53Wk5RSGQwRkJJR0ZhYVVWTm1nV01i?=
 =?utf-8?B?T3diK0xQRHhNTHRLMGt2NlNOenc1bVBZSHdWaW9vTkRWZ3hTQmRoNVZDWTR2?=
 =?utf-8?B?RjNiYzcwR2Z2VFBMZm45Z1k3c1M0S0ZiZDJ3S1MxaUNSemFnMFJaL2FtL25N?=
 =?utf-8?B?K3QzVW9YeGVGSTJkRFZzNFUwWmpGTnl4NGQzYXAwZzIvWmZkdkFXcU5idFN5?=
 =?utf-8?B?djUxSktHaUFIaVBGdFRaZlFmcGFqeEM5Q2o2RkpqdmJFUGdyWlhrbUxWZ2pK?=
 =?utf-8?B?cFpDQk0rNUd0SnM2R2ZsdFcrYTh4ZVdpTXRobFB5MDZNY0ZUWHo0Qk9aWEli?=
 =?utf-8?B?MW9peFRyaWZ6cFRDK2gxKzA0aDVCZkdhbXFORm8zZ3JYYmR2QWdtUDR0cis2?=
 =?utf-8?B?RktqTGtzUkJVM0hsRUZFM05TUktrTGNtQm4zTG12SFFmNHJtekhiTGlGRHc2?=
 =?utf-8?B?ZUQ4b24yUUY4NklUZjFSOGxKcHFOVFg0Wm5aMjFIMThMWCtGcURUNUQ1cXEw?=
 =?utf-8?B?QmtlWkV1SlF3d0I0ZHZuVFZMSGsyeUhFd1pVRkczZXNMYXlvL3NUUkRVdTJM?=
 =?utf-8?B?ckpkb2xWdmI0VEhQYW5UUFFnSzlFQTdocGFsMmNPaUdGYm9KZHVMQmdia1lw?=
 =?utf-8?B?YmIrNlQ2UXdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE5YQVU1VzRHaGIzS09YbmtIcW16Vzk3U3ZndGh6dlR0MHdsaFBuTjZKY29z?=
 =?utf-8?B?cnR3ZXJxRmZRczZhdk4zY29aUHp5RWlXUXE0S1RITjJpN1VSR0IzVFNwdFpZ?=
 =?utf-8?B?WWZvS3I2QldEeXJkd0haUHhJNGVQTlFqdkd5WFdEazBGZkNkSkVaQVJUdk1j?=
 =?utf-8?B?ZnlYaENSbFNiemEwemNaeXU1Q0Y4Q0dNR2dvZGxIMUJjU0FxQ2kwa2pIM0Vx?=
 =?utf-8?B?Y2h3RHNnZUxKR1pwOGZoZVNPdjArd1FqOGRaaHhnbGs0N3JXbStmR3hqczE1?=
 =?utf-8?B?LzNPZ1pmMVcxalY1Wk8rbW5tVEdOaU9Wd2pFRitVWGV1WllDZVhWcjEyT21V?=
 =?utf-8?B?YWtpSS9aU05BdjlqU1BFL2RXN1RZRXhXMGF0YVlwazZzUC9oZ0JqazMvc29W?=
 =?utf-8?B?eS9HTXJLYUxWbHFtK0JLTERxNElUeEluUWtxc0dDK1Vuc2VTWWhSUEh0QWF0?=
 =?utf-8?B?L3JVREljRXZwMkEvNWU1cVViZ3RRcFFkSE11TjV3clU3QWY5dzJoQXRrWEJU?=
 =?utf-8?B?SHpSZE51eVlEcnUrQ3dzNHg0NS9PWmNoT0gzNVp5d2hVbU5TQUFoMHhUKzVY?=
 =?utf-8?B?V3RWU2hxRnpueE1XWnFjeDNjRXZLTkRnc0VvTzRDS0dTaSsxcU00dlVEc1Ir?=
 =?utf-8?B?NFgyYXFiKzArNUJFMEE2OGttZzI2SEtTY09hZmRQdWtPdm5pcHU3MWJwOHBS?=
 =?utf-8?B?RkhWbTh0OVl3Q1YvN25HajdxTlA5YW42VzVBdG81cFZBYWJFU2ZWWTRWcEJy?=
 =?utf-8?B?NVdISTJmRHI0K1Z1aDFEazY5V0JJOWNkcGZDUWJsUmY3WGtZYUFDQm9vRmtT?=
 =?utf-8?B?eWp2aWdqWkpjRWFWbko1UDdXY2hYZ3pxVEVFZEhCbldXUlZOYWsrNzZYelky?=
 =?utf-8?B?clZHVTZTL1B3UzJJTDNCeWFkakJZM0syZW9renJ3NFFIQlo4VnQ5eExVb25q?=
 =?utf-8?B?VUFBOUVxYVZTZlJuY1U2aHRVcHdPMDc1d3VCNUhwSUpDWkdZMmt2WnBsLzZs?=
 =?utf-8?B?NEo1MlJnUGpFMG4wWlNXWUF4Ui9BWVRNZWZOMFd0dmQrQnBvTGRVeEYvQkJj?=
 =?utf-8?B?RDZueTA5VjNBdEFPODVWZVYzZk9CS0JnWkFXMHdHL0k0WkZ4emc1M0JXZHFw?=
 =?utf-8?B?ZkJiVWsyOGFlQ0RNdmJGY3pBV20rNkl3cTk3NC9YZzYzNlFWVmVDS1B1dnZC?=
 =?utf-8?B?VER6VE0xL1ljdDJ6ME4xSDgzWFJBdDE3RWF1QnNXTWRrNndnZHJZTmtPeTVJ?=
 =?utf-8?B?ZnFUUTJSV0g5MmJXdlR0cjNub0dEdVFhSWFLSFFpNUFERjlJeUs2V3ZjWnEy?=
 =?utf-8?B?dFRmeFdQL3E1c0FqUTJKL1AwdjRQOTNMaHFzSmMyM1VvMHNkVkhZRHoyVmg0?=
 =?utf-8?B?T3FoMXltcVkyTXhmVWRjR25PbGhOeFdPcGI0YlFwMkdMOSswa2ROczhITnJP?=
 =?utf-8?B?bGsyQWI5cUdtLzhNTTlHTVNyTnl2N2Q4eGZJZCtnRHpmQ3NEeVdqV0Nxa3p5?=
 =?utf-8?B?dVdEZEg2bVdFRW9aWlhyaGVvZ3pGRnhxeVB1OEQvV1h2VjZNdGN6cnVWK04w?=
 =?utf-8?B?ai84UjUyeVdlS3pDdGVMaEt2d0hqVTA2eXkzYTd6R0tGY09tL1Y0Mm9PTGRS?=
 =?utf-8?B?aGpoYnZ3c2FOUUMyLzNaN1lRK0tveVRGSVNyL0dwWWxUZGVCd3M1WE5KUHFS?=
 =?utf-8?B?Rk12TWRWcTFzeEZKbGRZTm9saUVoT2swWk01RTZyNzJmRjJwOTBaVHNLenhI?=
 =?utf-8?B?Zm12WUY0UkZQaEtaT0VRQmxXWTJhRnZZMFlsUWZxSHhQZGJ1aWdqcFYyL1pB?=
 =?utf-8?B?SCs0dEVTSnl3ZGlRUzVhUWhCUm13VUFNYVg0S0V5UTdWa25EUFFid2NoK3dJ?=
 =?utf-8?B?NUljZWIyNE5peFN6Q2dwNXE3eGUxbmtWQjFJaWcxN2lXY2F1cFJvcmlwSDRy?=
 =?utf-8?B?MGl3bEUzNVpMb1VHdkZVYVZ5Y3F6TUh2YnNIaCthdm4rbFVHUjhEaGJmUGdL?=
 =?utf-8?B?VkxOR3Y1c09Ld016NUlhRkpjWVk2MFNPWWhHR2tocDc4ODg2SVZIUHVTRXNR?=
 =?utf-8?B?RXY4RlpxM3VCU1d0czk5S0NBYWlxZXd0eE1Md1JXaGJoS2VkRk12emR1eW9Y?=
 =?utf-8?Q?IxP3Qg96cxrdmuZbUqK0icvfA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e051b51-b3a8-4103-4fe0-08de107f01d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 08:51:21.3467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDjSfe84g3HM1OKFjFxMPKc6s5CC/UFZWyLLoiHhwqINUF0ZcH7ZJhvu+6m1zlKtPyXUtFH3i8iLQLjiETsnRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9024
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

Hi Sima,

On 10/21/2025, Simona Vetter wrote:
> On Tue, Sep 23, 2025 at 01:29:55PM +0800, Shengjiu Wang wrote:
>> Add binding for the i.MX8MP HDMI parallel Audio interface block.
>>
>> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
>> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
>> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
>>
>> Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
>> Controller compose the HDMI audio pipeline.
>>
>> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.
>>
>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> dt patches need an ack from dt maintainers before you push them, please
> make sure you follow that for the next changes.

Just want to make sure I may follow that correctly in the future.
As Krzysztof is one of DT binding maintainers and this patch has
Krzysztof's R-b tag, need more ack from DT maintainers?

> -Sima
> 
>> ---
>>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
>>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
>>  2 files changed, 81 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
>> index 05442d437755..6211ab8bbb0e 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
>> @@ -49,6 +49,10 @@ properties:
>>          $ref: /schemas/graph.yaml#/properties/port
>>          description: HDMI output port
>>  
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Parallel audio input port
>> +
>>      required:
>>        - port@0
>>        - port@1
>> @@ -98,5 +102,13 @@ examples:
>>                      remote-endpoint = <&hdmi0_con>;
>>                  };
>>              };
>> +
>> +            port@2 {
>> +                reg = <2>;
>> +
>> +                endpoint {
>> +                    remote-endpoint = <&pai_to_hdmi_tx>;
>> +                };
>> +            };
>>          };
>>      };
>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
>> new file mode 100644
>> index 000000000000..4f99682a308d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
>> +
>> +maintainers:
>> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
>> +
>> +description:
>> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
>> +  Audio Subsystem to the HDMI TX Controller.
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8mp-hdmi-pai
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: apb
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description: Output to the HDMI TX controller.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +  - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/imx8mp-clock.h>
>> +    #include <dt-bindings/power/imx8mp-power.h>
>> +
>> +    audio-bridge@32fc4800 {
>> +        compatible = "fsl,imx8mp-hdmi-pai";
>> +        reg = <0x32fc4800 0x800>;
>> +        interrupt-parent = <&irqsteer_hdmi>;
>> +        interrupts = <14>;
>> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
>> +        clock-names = "apb";
>> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
>> +
>> +        port {
>> +            pai_to_hdmi_tx: endpoint {
>> +                remote-endpoint = <&hdmi_tx_from_pai>;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.34.1
>>
> 


-- 
Regards,
Liu Ying
