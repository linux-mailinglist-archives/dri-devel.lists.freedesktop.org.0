Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213F8B1AE43
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 08:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB7D10E24F;
	Tue,  5 Aug 2025 06:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cuxiLdGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A136A10E24F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 06:29:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAI3SEKo3zgzq0Xzb5zeepaHgfZHXh5hOBoZuHtF9QeJbuBssf15zKYVLlnKIF1fklBtvHtmLhmuFv2llfZQNA3+U///vXHnRR7O3M1syrUxBBmVEVGhEH88JAznHq2Jxn1narfcgKdMMQVaoJU3ALn2CzASsJgRnWMEb9oLWh+88OEWujyJKd09O1TEbOO8ZjzPZuGcZgDLr+N7ipANDgSM4coCmfr8CSIfcQRblGooSY2PC7PHNabRI+AEwJNrX/ofBOQRQVHyVonVfOotpUFVCGU8QikWTFfc8OlRCgltKnAPSW8xUizgaZQRNBrRO74bhapCbDiteVS85lUB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2LjwtJ48mA704Uju3XLAQrS5a3l/W7fD6SEWLKDMp8=;
 b=kekC/LuWUDn0O9/yc1RNQ8u467G2PXxzmzen0izgYrE4Bb/BoxiaLNv9lruh/Mgx7xgrzQuI7zFgiQe0nK4FOgBThIJ7ysNESBi0jo+yKk2oaRMqzMFZwzTcGT5FFYWDVy0sJsYt1sZVkDBZIKz98rdyFWMPtw7ZsuDbjcZHbyv9HmmF/V95aCFcErEcAcmYAizxl10Il9HFufzxIzsfRmEHH9x9ItPugBIXwJelLTl+NTshqXT4Scar1yecF/tqyOTqzRWzuUIRG+8zbDIC90lEgj14PGupgjtSoPdoMc1f1s/egwtstP4K4ylHjSADtCNUZflT7usv+BUqKPil2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2LjwtJ48mA704Uju3XLAQrS5a3l/W7fD6SEWLKDMp8=;
 b=cuxiLdGMSqrmmRnQNA4kz6960LmUteFulUQzbpwzrEg6TBkhUyQx9pSSQBVMiD31uQjPcpwgdccQkV4bi0ednmC2zXoM3drzQ0TgQ49RDALnfnu4ZqJxWOcLB0e4jxA5Pq0CzLNHqMkF3zjPo16w8c8RmW7Qn6NrBcqW/ZAzNinKCEqBHHQkTbSwHf18hLWOCq7e22U4SGRz0LyYVhMXHbdhdS/96fZ94y5CgsfCkS92vg7O6T04nXJVh7OXvERwM4EQeFaQf2rF1wLUbIIS0iNBn9GWvk6Luay1wtpQ3aAvWH40bNbK/atyOKGG7hsDMVrkzMm/DoEdcgo6/EXtFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8346.eurprd04.prod.outlook.com (2603:10a6:10:24d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 06:29:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 06:29:04 +0000
Message-ID: <dcbcb017-e25b-4244-8ad3-9c07da99c253@nxp.com>
Date: Tue, 5 Aug 2025 14:30:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm: bridge: Add waveshare DSI2DPI unit driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250804-waveshare-v2-0-0a1b3ce92a95@nxp.com>
 <20250804-waveshare-v2-3-0a1b3ce92a95@nxp.com>
 <9aca40c3-e22a-4d41-bac8-18a7cc8e3e96@nxp.com>
 <8c8d9723-bb0e-4c4b-9fcf-3e1ec46609bd@kernel.org>
 <901dcf27-f9b8-4c21-8012-3c77ea9bdd83@nxp.com>
 <e52b3630-5846-49ac-9abf-3b42e1d585f4@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <e52b3630-5846-49ac-9abf-3b42e1d585f4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 8857aca5-53e6-476e-508f-08ddd3e95fef
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFFySjFpM3dTcDBTanNocEdqekk4ME1lQVFXYW14ZGxPZ1Ftbm9kUC96TUlB?=
 =?utf-8?B?YUxFNyt0eEdsSk9OWklib21PRTNRZjNtMVJja1IxQlVPQi9PNGdUV0FYZith?=
 =?utf-8?B?bmcvT2VCbERhY0M0TVFDNWFIMDJWakZjRjRJYzFwY3dRN2p1R1BMc0N0TnpT?=
 =?utf-8?B?Y1hnMldpK2tSWnJobG4ra29RY2VPdHNQRFZubGw4VEdvWWlzZVRCeVVhWlVr?=
 =?utf-8?B?c0pTZzZwd1VvMyt4U3ViTGg5T2tncHlFclkwWkJzZDZyZ2Exc3haQUdWQ0N5?=
 =?utf-8?B?dDhMd2xqKzFuQVZJUjZpOGx3ODdRaW5vM2JCdVg4RGQ3Ym5JMjkzTEJPQmpU?=
 =?utf-8?B?RHNXZElqMm42YWxwUy8rVHVZclpPd212SnBEMnJkSmxWWkxzcWkwdDl6aGhJ?=
 =?utf-8?B?ODNYcWlVOE9yRnV4YVBvcnRpNTJjMS82V2JMZUVOZkR5Y1ljNzNlK0R5cy90?=
 =?utf-8?B?K1psU1FyNUlpd1dFWW5sL290VVp6Z0NXdzhMd05CazQvclFURkNLeEtlMmpT?=
 =?utf-8?B?eVQ3bWFrS0hRVk9OMG9uaFJlcmI1TS9BTFFBUDlrTE8rYzlmbUNBTnR5bmZ2?=
 =?utf-8?B?S2VuS3c5cUEzVFJoUWNVZzZ5dm9XMVF3cCtacXRaS0p3bVFrRzdpK1R2WTNR?=
 =?utf-8?B?MWdiNXVKUGV0bnFNN1hxcHR0ZnZ0Rko3Y3Evb1ZoN25FQVhUenEycnBadFhy?=
 =?utf-8?B?N1ovSTdlNFo1WHdyUlVBT0JNVVlicFNaVTFNcGFHOWszbkdIME9Pb2d3WC85?=
 =?utf-8?B?QjRSV2FBbVNHZEZLV09WMFN1UzJ1OXVMdHFQWStwSnpvWXh2anNkU0tnZ21W?=
 =?utf-8?B?MGwyWEJRYVFHd1VDK0kvLzRXb0RGRDJUbmY3NVAxWWd0RHNLQWRZZ2dwTXNt?=
 =?utf-8?B?Z2cwVytDeWtoQldTSkNBSU5SUy9HYTdsTEQraW1EQXVmaFA0VzF0WDl6MGYx?=
 =?utf-8?B?NHZFVFhmYnY0RVI0eStrL25JbElleUFVTTg1NS85bFVwdmdUdGF0TG95Q01m?=
 =?utf-8?B?M3QwTnVNYTEvR2k4Z0JyNmhlSXNRby94cjhrTVgzcnVlM3NsODdFeGJMSDJG?=
 =?utf-8?B?di9HUExqZmlBSnBXMXVhQ2JPYUE1TjBVcGZNK0Z5aEhnYmZXQUJRQk95RTVq?=
 =?utf-8?B?REY1QjlqYWtQc20rTGU2SUg0cUs4V2RkeFRoTzNSMWZWLzBsa0wzWjlHTkFM?=
 =?utf-8?B?a0RVOHR3SWhzZjluZXdoMXVJd2tMK2U3aXZwMEJhcENZaDIwNXViaFVUaFFy?=
 =?utf-8?B?anVmWWlIa3BNMTBtS1NqdDVzNTh0V3Y5VjFIYjJkWEpsb1FrMVY4VmIvdWx5?=
 =?utf-8?B?Mk5hdmFScVBMT2NDN0ZlcW9DOXdHRXNJM0hUVU1tblMvenZPZjVsV0xtQUg2?=
 =?utf-8?B?WEhqYXV0U011eGZmeWlFS1Q1blBjUHVlTzZFV0YxKzRnZ3pSMVRZVG9vQ1Fo?=
 =?utf-8?B?UnZoL0g1cXVaSVNGUTNNS1JjL2Jxd1o2OVBFMG51OUEwS3hFdm0xek9mTkda?=
 =?utf-8?B?aFlocEdIa0JWZlNyZG1MOWlMK0hRSkUzWlhTUDd3YXpHT0lNeVhieUNXSTdH?=
 =?utf-8?B?YmFWZU1wT0Z5UmZ1Q3dST01qQmdzNmpjL2x4VGpUN3phUVVTTlo5UFMxTDVq?=
 =?utf-8?B?dlhUWkhqVzlBMk9WYmh2eUszTDJGUFNZQXdqTWQwM3BwUzlHc25RZlJuZWdk?=
 =?utf-8?B?aHpxWWVwNnR6TlhQUENZR1daY2tmZGozeEFMK0NqWE1CMXhQaFF6K2JXTnFm?=
 =?utf-8?B?U2t5RzZkZG92SXRtZ1ArVk80bnVpTUt2aUpuSlh0V3FpSjBubU9JbDdoR2Nm?=
 =?utf-8?B?RDQ2di9Pakx2ZGs1VnUvWm8zQTJPc0hRUW55N3Y0aUZpTjNhZncwaks4anlD?=
 =?utf-8?B?N2NnVE1EREd5WnphTmw0b1JzUUZBSlpRa3RqakhmM0tWT0FUd1RUVWM1QzY0?=
 =?utf-8?B?bXhWQURWV01xSVBCZFJBT1QyWU1WM3NOU2ZIRnZIcUVVclJxKzNyaTNaVHFr?=
 =?utf-8?B?dXpnajM5ZDZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUpWYld3UTBic1Vsa2dwVndOQi9BNUV3SnZueXlGRm1tZ0xlczY2MTVGUklq?=
 =?utf-8?B?Qjg3bkdIaG1YOWlCQ0dGOHNXUUtqekV4R2VhY0xVNkdaNUR0ZldGZk9aZi8z?=
 =?utf-8?B?OGlFUFVtZzFpQS9aOFVEcjE4L2xvOTR0S3JVcHZoUmg4Vm1ZYW9TR1FpT2hy?=
 =?utf-8?B?dThnRENrNlpwaEZDZ0p6aXZrYktkZUZjTmY4NWFxY2xHc2lMRWZtT1RObnZJ?=
 =?utf-8?B?VWJscDlSTWoyTmVmTFRUeFowT0VjUTNNYUtQOVNwWmZ3YkVqTEQvQWFNVlp4?=
 =?utf-8?B?cFZMN1BjWDROWjhMM3h1QTg5V1VGcnFJUWZodXl0UFVMcGppUktCaXFHK1d3?=
 =?utf-8?B?Y25FS3ZSWkZhMlpTTUk1WEc5WFlWd0xoNzVFckhzeExSNTE3L2poZ2NnR3Q2?=
 =?utf-8?B?MzNTRWhTbG05NFpKZDdBMUpacXVLQzVCMnRBVjkvZGhOcWcxM1R5NlBYSTVw?=
 =?utf-8?B?TER2UG1aYWVxOTAzMkZTWkFvZTdCanlUVHBFNll2RkpNYlVnV3RCWUNKTUVq?=
 =?utf-8?B?QUZXaXhWY3EyZEhGby9QbTZnZmg3T1J5a3VYOGpWNTBpNURZcHNMc1R0MSta?=
 =?utf-8?B?b3BNZVZIWElhWjZ0RExWNFNiNUxuV05NZGhpTkdjU3p4c1ZYSkFhN1ErREdJ?=
 =?utf-8?B?ckVzZnY4OE9mMVpaaWNaWmtRVlVjSWIyYlBTdHhMT2llNVBlcEY4Ry8zYzNo?=
 =?utf-8?B?QThhd3ppNUFGTHJCRVg4VE1jQjRkdUk3Yks3TS9IM0FJeGg3Vm9YN1pOU3hp?=
 =?utf-8?B?V084TWYwM3hjS0cyOHFIYWRjb0NYWkNuTUxCQWJtV3BFM1dUSmRxQjZSQno1?=
 =?utf-8?B?bGtQWUdpN1RrbW1qc3U4TEZvcnVZa3R1c3o2eEFXeFRwSjVDdXU3UEszWDdI?=
 =?utf-8?B?aXR0OWtDSW9WYnZxSlBEWlpEaGxla0JSV29HZWplVUVwNmlxcG82dXhuSGQ1?=
 =?utf-8?B?MFAyRXlzdyt3eXVhcmcwbFhMbXJhbjF6QmoxNU96cnNKV3F5d0lOaEt2ZGtR?=
 =?utf-8?B?U3dFT0dQODZiMzhhWmhZSWEvMmpxdXNENjlwQ1NGekxsRldWTGNSOUdTTDJU?=
 =?utf-8?B?WjJsQzRTUDRhSDlzZ3ZHVGxISFlFa1RxT1Uvalh4Z0pEektZbG1JeUUzazBt?=
 =?utf-8?B?THFSVUQ4MWtrVUc3bzhkcFJvUU1yaUU2ZWxGaEp3OGdIN3pmeTRodlo3WEl0?=
 =?utf-8?B?YkExSlhtdVJKUU8vMzRmSGxvSTdBMG1HUkhCdGF6Zjd5TUxLazBlYnRXOEZ0?=
 =?utf-8?B?UkNlYUlJVVZPcXRDaWtFV296OHZ1OFBBRUJZWXJXKzJmRXhMZldidHoyZ0RP?=
 =?utf-8?B?NHRWZm4rS08yVk1WV2xtQldoQ2ZFTzFyT3NRVm5kK2NzQ3RyQllHNEhwaHA3?=
 =?utf-8?B?QVJ6bXpyMThuR2M3V0hXaXQwOFBJSlg2ckgzQTZ3NnM0MWhaV3ZkRmE2cmN5?=
 =?utf-8?B?SlZOamlsd2VETXhCWkg1eklhU1o3dFFqTko0T3V5TER2aXhzN1g3aGdqajVV?=
 =?utf-8?B?a3RSOVNjVjZSYlNyamNuK1VIR0dXOVlhRURFSGF1T3hacFBOMG4vR25xVVZT?=
 =?utf-8?B?eDIrU2E2V2lvWlMzRlRYcHJ4S3dFc0c2UzVnRmJSVzlleDNyNTZkU0p3eEhh?=
 =?utf-8?B?d0IxeWtMUVlHbzhFa1M2aWMyeWlGMlp2THR6TjBDMFVQVGNBMTJhdW91RWFU?=
 =?utf-8?B?ejZvZ00xcTY0SVR1UzNrS0hoS3Bta3FQVTVDL0pGUjIzcHpiL0J6U3p6M1NF?=
 =?utf-8?B?Ti9IZEVYZld6WE9Pc09OdDJ3bGVXWXRMT2RhREtOTjRvV3BIUXVlellRRU1k?=
 =?utf-8?B?eWY1OHRvZ0d4bmR5cCtpTG81ekcxQytVQzd2Q2czczhwanZPMlFOSzZPN21a?=
 =?utf-8?B?S3BIREIwSFhEbGNsWU95RmhqcGs2Z0VqV1Jybi9VU0VDb1U5YU5way8wM0VI?=
 =?utf-8?B?dno3MW1OdmtwZENQVC85Z2JhUGM3VmdtWUQrN2p6WlBjMTh0SFZGU2JxYmlk?=
 =?utf-8?B?amVvSU4vRDhXeUhIbXR5aldMUVpoQjNJQ1FvWXZKSHROR2UvNjZJNW5oYzlZ?=
 =?utf-8?B?MytkNzBLLzJXZm5JVlMwcGhTZFdRRktwUnYyRURqUHk5em5mRzlMaU9Gc0wx?=
 =?utf-8?Q?YkUG6Yn228qmRbZwEWaPTxsq4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8857aca5-53e6-476e-508f-08ddd3e95fef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 06:29:04.8056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgqThz8UMBVjuXTIImn9Tzxrp0oBuwh2fOQ0PAdMQEQ0d/UxtAv6YuBIbtGOwMBI3mCiK9TjwnQDF2D94qHrig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8346
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

On 08/05/2025, Krzysztof Kozlowski wrote:
> On 05/08/2025 08:11, Liu Ying wrote:
>> On 08/05/2025, Krzysztof Kozlowski wrote:
>>> On 05/08/2025 04:22, Liu Ying wrote:
>>>> Hi Joseph,
>>>>
>>>> On 08/04/2025, Joseph Guo wrote:
>>>>> Waveshare touchscreen consists of a DPI panel and a driver board.
>>>>> The waveshare driver board consists of ICN6211 and a MCU to
>>>>> convert DSI to DPI and control the backlight.
>>>>> This driver treats the MCU and ICN6211 board as a whole unit.
>>>>> It can support all resolution waveshare DSI2DPI based panel,
>>>>> the timing table should come from 'panel-dpi' panel in the device tree.
>>>>>
>>>>> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
>>>>
>>>> For next version, you may add:
>>>> Suggested-by: Liu Ying <victor.liu@nxp.com>
>>>
>>> Why?
>>
>> As I replied in the cover letter, I provided general idea for this
>> patch series in NXP down stream kernel.  Same for the DT binding patches.
> 
> General idea to add support for new driver? So like every patch being a
> result of for example task from manager means "Suggested-by"? Since when
> new device support is treated as suggested-by?

Not for new driver, but for architecture level, like treating the MCU and
ICN6211 as a whole unit/DRM bridge and treating the DPI panel as a simple
panel from both DT's point of view and DRM driver's point of view.

> 
> I also do not understand how downstream kernel is relevant here.

That suggestion did happen when I reviewed this patch series for downstream
kernel.  Just shared the information.

> 
> Best regards,
> Krzysztof


-- 
Regards,
Liu Ying
