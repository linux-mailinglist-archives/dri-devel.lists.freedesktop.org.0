Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC378C3B1B
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 07:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F1110E0EA;
	Mon, 13 May 2024 05:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jibfKuJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2088.outbound.protection.outlook.com [40.107.247.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F0110E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 05:56:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKIXbm1nm3RlTo0HdClfTRfnWR6/8F5HEeFxadw9VaqjjPXex0cJdfjWOlFK10ysw88JgteinU+PTJbx923zGZ8Uy+PtITkcwr5NjSoQyKm/AHy2+OSTWDTcDtmpfAyeYWf2saTABdRRptt6D9CuSrHbVfaUed2w9JXvNTi7Io3U3NCQJPsPr8cV40JoBDA20aWJ1tlAECwX9YIgSmyYf9dJE3x/QOMHvawVDHn3CYbnfuM7OLg2eNOjcOUkkFCNZlsUcXbZ9Xap/HsDjR/pSt+dEeuBFPXo2qdiWaBtRpIC0UPV/YXBMveWNAtEHSv0LWfvmxF0sibXmcJasn2YUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh/JApK8tLnIkZENMUl4JPNQy+hfN8rstZKGhAN8NZk=;
 b=YguzHof7XIBoH6cw246gU53iwq+ODsFNx1lTgPU02CBewIWMZD7CuF04SUQl8n8nv1oqG4JkCAt1/UM0+S6CFC5irmhDvdUcUOILz4NIbLYm0lobFoo9OrpM2Ec1IwXJcmWPnZ32/I036JtFAx+MdgPKIpa/kc6dpNbtWdWChqOI1r2miwmBUslRCpP6oEh0jfGbWkOBJywnSt/WSl3UxR7uXlyI31pPBSzLcRhBMPSyBUdWzXGas56Un0vx4fnSqF6ny+FfI79NLMUbLe0dGHJ7LMgtjPVFf+YqelCnSg7xcYhAKKysxbpiyiZ4F0HAS//re4WgpXZ41o8Ej6Ijrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh/JApK8tLnIkZENMUl4JPNQy+hfN8rstZKGhAN8NZk=;
 b=jibfKuJVZIxovJhStSOSecGsl9EIPAIa3rKllkxrtf0gt7fbN7ZumdqtCeAM+l86/fjYlBEt1H8OpxfDXNZpLHSB1nzW/0Wq2LBMSvdeL6oOWc7Hu1pEC9txIQd8QmYB/L1EGgqFzzrL0sXOgiUxZ+1rOEiK8bpAIiy5sKz8UNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7839.eurprd04.prod.outlook.com (2603:10a6:102:c9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 05:56:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 05:56:24 +0000
Message-ID: <c1a69a18-4db2-4625-80c2-a7536347e15f@nxp.com>
Date: Mon, 13 May 2024 13:56:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: imx: Remove redundant checks on existence of
 bridge->encoder
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240511150816.326846-1-sui.jingfeng@linux.dev>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20240511150816.326846-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:4:7c::33) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae3c044-4b2c-49e4-c39a-08dc73116bdd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|7416005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTNhdzFDMWxlWCtiK2ZONmliVlptZzdVS1R0WERSeFBDcEtpQXlPT1kyQUl6?=
 =?utf-8?B?T0x0N3V5M01zYVR2RWFkQnpzYk81bUh6d0JPS3BKelhkNFdSZzhkamc0Q3lD?=
 =?utf-8?B?QisxUjd2aXdVV0RvZW5HN0VJLzcwamJLOWVVd0l3UlMwZ1ZoK05yMTFrbDRw?=
 =?utf-8?B?OU96c1Z3enN2V1ovNG5hc0lNUnJiSmVsOHQ0U0d3UnBQZHhUaFU5RFgyU3Uz?=
 =?utf-8?B?VmtYY1NibXB4TURtSXYrd2lyeit1VTc0aGFHQk9mVzJLdjdVMFRZZEErMmRw?=
 =?utf-8?B?YkRHVHJrS2g4dXVuOEp4MEJ3Vkgwc0h3bjNFdExXby9IUXlqUWsrSUR0Kzlz?=
 =?utf-8?B?cGZjOVRlWXhwaHpVSUNrQ24wdE5KYTgyOUpuOHhnUG5wNDRRWXBSZ0dPMk4v?=
 =?utf-8?B?U1MzY1BYS2txRTgwdm1yL01POVdPM29yZUpuM3VvR3BwazBGYm5FaE05dE1h?=
 =?utf-8?B?OFRxRGxUem16WW5wKzZDVHhvWEIyZ1IyWldIOHVSZkEyNlFDbVRNYVhxVGpl?=
 =?utf-8?B?Nm1Fb2ZweTE5UEczejU0RXRlZkJVcHVVZWE4ZjRsTnJrTnc5MzBMVGdJMStC?=
 =?utf-8?B?VVJ3TXlSYmY4Y2thWDF0bGRsaE1QdTM0dHhuS1JYRHVzWFp5blRuWVBQVlB4?=
 =?utf-8?B?MEEraFNzb2JrYlVGZUVWcmh4d2xPWFR5M2MvU1NtY0QzMkVIdUs3aHpyZkhL?=
 =?utf-8?B?YTU5NUVwZ29nUnVIS3UzMXFaRk5USE0veXg0UVJaeFpLdTd5b0pPZHdkY1Ju?=
 =?utf-8?B?VWJQQ0U4K0xQRitqMEs3MitYbEVFamVHc2tMMklZWUNmaW9hRzdXVjVwU3JM?=
 =?utf-8?B?eG5wQ2psT0twWEZwLytsUUJWWE9QcXcwTWQ2S2o4M3BKVnVOVHlwN2drTlZk?=
 =?utf-8?B?K2U3VWRYYlZHLy9hN2llajBwNURMVXhiNVM4eFppLzlBb3JJbm5DQ3ZZVmlq?=
 =?utf-8?B?enJ3UmN2NEp4VXdwWG5oY0lEQWJoNkxwem5jVkM4SWhrOWNobnpZTEd4UDJr?=
 =?utf-8?B?VWFyZ3ZWNW5NM1M4R255YmhmUVNPd1lDNVhLbVNKamRraVFmU2E3ZmFydSs4?=
 =?utf-8?B?bWJpYVBGZUJoWWs5Q0JEK3UwWVg2VStscEowNEZXb2JVbHptU1dWbkxncWcx?=
 =?utf-8?B?RnFLMVQ3Ukh6NW1jbW8vOEVnM3hTcG5GSnBUQnBjc3pPVUlmY2V1aERVN0ZI?=
 =?utf-8?B?WDcrQ0VnSS9pTWVyUTVaZC9hOGNOdkJ5REFhL1JhUlcyeSs4MWp1bW9oUUth?=
 =?utf-8?B?aGR3V0FPUXFCaVRoUTFNbUpVbDlLN2tINWlteWdQZXRBVkREQXpIaUJLQ3RL?=
 =?utf-8?B?aTBLYlNoem52bk9JTC92TDB3L2dsWm50OG1qZDZHdWlOazh3Z0VyWkVET2ox?=
 =?utf-8?B?S0xQRjBlRU50NVN4c0pMK3JmNUJzWTYwZllDYnRFSmdiQ0JBbUhhRXRYd0NM?=
 =?utf-8?B?RFJnUnpIWkRySTlPV1BsVUxrVHJlcVpUUzc1SjZDWFNsVG13RFFTdHl1TlJy?=
 =?utf-8?B?Mld0Q29XbFpDcm4vTDBaMDRSWWpMaVlvWk5zN0FaUm9uV2ZiTzUyQS9pQjVK?=
 =?utf-8?B?NTVqZjhKcjlRN0oycUxWOVlpdUR5SmxsTGpOSGhyeHdiMUoxd2R5Y1F5dU1k?=
 =?utf-8?B?cWVNZ1BEV3ZNd2hWNEJoUnpXblJsUE13dU8ycDBNRzRjTnVOQU5FNzlDaW9F?=
 =?utf-8?B?SW52cWpwV0JEbjB5UGg1ZmxVd2ZML01Bb3N0N2lKOHVkYlVsYzJaRVlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXVMUGVRTFhIcUV6TDYySGFRcGxML0p3MnQ4cHJnQ3ZqaTZTakFjaVFONnk3?=
 =?utf-8?B?dVgrY05IQ3hsU1ZsT3pJNG15Yk1OcDlLdzlOcG5IaFFZa2o5NWM1VlY2U1FX?=
 =?utf-8?B?bUFVdjdBQTlqRHF6aXhpRnhjb0laYm1Fd3lGR0FGRWYrWk9QdXM5VDlyWk03?=
 =?utf-8?B?Mjh2cHgxZExzM0tWSFJKS1ArcGFoSWJ3RU14NmJzbER0eWRwK0pqVHh5YjV6?=
 =?utf-8?B?Tyt1T3U2b3FNY0VpVVRjYVE3NytBOWV0MDh4eHhFNTJ3QjBzNzlsYlNScFl4?=
 =?utf-8?B?Rk5tNTh1c0kwQ3NLTDA4ZEFFbFlTOVQ1T2FTa29qd3dDdE94Nk5LNzUxWVZO?=
 =?utf-8?B?aDBHa1I5OTlpTkM4cnl5TXRRcFJJU1FEbExUNlpVQ1hjNWZsaStUOHF3Mmh6?=
 =?utf-8?B?d0M4dHV4OWZueEF0Q29WTVRnZWVsWkU2Mi9QSU5rcTl3Z3JUZ3o1RFlZOW5t?=
 =?utf-8?B?Q1grUmd0TnlOeUZCYjdPbmQxME84OXV3OTd0RE5Hd21TNjllWGx1bFU5eE92?=
 =?utf-8?B?dEwxdzdQaDlScjd1ZjhzbzFEWm15bWd5Rk5INFVsWEp6YzJtNEZPQUNqRUxJ?=
 =?utf-8?B?UDR6NlFzV1hrMy8rQkJLcWdqU3lCNG1TL2pzV3c2QmJvMDNPcFdUcWN3d3VF?=
 =?utf-8?B?NmdpQ1ZqcStFem5iTDY3Vld2TklQYS9sSldpN1NBcWFMbmxZTmtzM3ZtVVRG?=
 =?utf-8?B?RDVWYTdXL29Mb3ZVZklvWW5lZWIvUHRmK2NWMG5GRS9lNklzNVdENnd1WFNZ?=
 =?utf-8?B?V05hbCsrVWdNVlZhVkROblU4NGpDWWYva3hKc0dnVEMwdHZqSFErNEZiYlVB?=
 =?utf-8?B?MFNUYlBvRGRaUWZ4a2dzdXlzV0JLZnBSb3AzV3RXY0dhTXlXdXlSSy9NZmJ5?=
 =?utf-8?B?dkd3SVBNTDdtcEk1Y0JxZVVWNzNPc29FQVFZY25LMkFzMU1COWMzbGhwd0dY?=
 =?utf-8?B?aE45dFZrelcyZXd2NEZ6eE42eWNhNW5kRXlUYmtaTmI2NTY2ZysvemoybDRS?=
 =?utf-8?B?aWtVSWI0MUFNUk12R2pzMUlkekg4RnBmN09hU21hVmswR0dLRWlnTE5icjRo?=
 =?utf-8?B?azRVbGFxWDkvaVA2YXppa1pHTHZBTWwvamxzQVZ0eGxoMTF2ZWxLM1FIZGRl?=
 =?utf-8?B?RE0zRkRKNEY0Y2p3cXRlUWRmdm5jVTNYRnJjTGY3T3A3dGltSElLNFhnVlU2?=
 =?utf-8?B?cWR2MEY5dityVisvZm50TGo0Y3BxVGFDL3hEVWJ6K2lobEhTQUZ4YkQvejhR?=
 =?utf-8?B?SjZQenRHUnBMaG9pNVBZeCsvRXFidkJHdk1uTm1LL2VkR3pHMzFBVzg4Z0Fi?=
 =?utf-8?B?TGRNSFRUTTVOQWpKRDdlNWdmN2FVWlV0T3VxTG0zWUJ1QmFUY3dKMlIraXo2?=
 =?utf-8?B?ek5KcDIydDZXL2lRT3orazlIUWdzMFVGdWxyeW1rNEt1TFp2UHNXZXpTSm9V?=
 =?utf-8?B?NUs0QS9jZEs3TmJVMjlVbDdaNStRTkJBaVNVNi9VQkRRNUVvcGlvR09NNzE4?=
 =?utf-8?B?QTZ4dVRLRFc3WjFPQjZqMHhucTdSWlZ1aXFDMWVYOE5ZRm1EeVZYQ1BxaUp0?=
 =?utf-8?B?TDBtc1h5U0ZMZmpWYS9kVWxFOHNHd0djRW1sL3ZMMjJyQnVWMDR2RjUzeDd3?=
 =?utf-8?B?V01FOFFhbkFVdW5obXQ2Z0tmNGNxdVVNWVJ0YitRbHBxOGRtdWVQWGl0aXll?=
 =?utf-8?B?cWFjNCtkZ0tRY3N4dTJYR1kza0JZWFRaWDJPR0F1eU1nQkJrb1Z4Nm45V2Fs?=
 =?utf-8?B?YU5BMVJPYm55d1VtNmNDRWY3UGJ3TzBiVDc4eVM3SEFETGpsYzlHY2VNU1dI?=
 =?utf-8?B?WklHUGtYdllWYS9yTDlWT3VqWDlGbkF4NEtmSHo4b25uRGprVDJ6elhYVldJ?=
 =?utf-8?B?UlB2dFR3RkI1cFJTZGUwN3hWVjZhdEJSVlpETmcvSmhOMHBTSlRnTUJrOXJo?=
 =?utf-8?B?RTZreDlMNDQ0ZDJqbGE3cDhQVWViT1BOdGM0eGNHODNIbjZPRjJTRTIrRnJt?=
 =?utf-8?B?aW9EMSt6TUtzcUZNa3lHaFYxYkRPZy92V1VtWTFSc1RDL1RQcTQ0Y2ZuWnF5?=
 =?utf-8?B?bXM1ZVl1SGY4N2FER3k1L2daNDgvaXZHWit4VUg3Z2xWWmpQRjFvOXg3cnVH?=
 =?utf-8?Q?rP67eQc+R5HXZvnDPDppwyAgo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae3c044-4b2c-49e4-c39a-08dc73116bdd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 05:56:24.3905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rf1XQCkUFNjknnCSlJE/FiaCK0g8ZO6syUQvkCelxOrB1Xv9YW9oXV1O+vk5yct+I9dA2+TXmC8QMx6EiVDkSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7839
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

On 5/11/24 23:08, Sui Jingfeng wrote:
> The check on the existence of bridge->encoder on the implementation layer
> of drm bridge driver is not necessary, as it has already been done in the
> drm_bridge_attach() function. It is guaranteed that the .encoder member
> of the drm_bridge instance is not NULL when various imx_xxx_bridge_attach()
> function gets called.

Nit:
ldb_bridge_attach_helper() doesn't follow the fashion of
imx_xxx_bridge_attach(), not even the other bridge attach
functions touched by this patch do.  Maybe, reword as
"when various i.MX specific bridge attach functions are
called."

Regards,
Liu Ying

> 
> Remove the redundant checking codes "if (!bridge->encoder) { ... }".
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c         | 5 -----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 5 -----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     | 5 -----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        | 5 -----
>  4 files changed, 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> index 6967325cd8ee..9b5bebbe357d 100644
> --- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> @@ -116,11 +116,6 @@ int ldb_bridge_attach_helper(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		DRM_DEV_ERROR(ldb->dev, "missing encoder\n");
> -		return -ENODEV;
> -	}
> -
>  	return drm_bridge_attach(bridge->encoder,
>  				ldb_ch->next_bridge, bridge,
>  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> index d0868a6ac6c9..e6dbbdc87ce2 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -119,11 +119,6 @@ static int imx8qxp_pc_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		DRM_DEV_ERROR(pc->dev, "missing encoder\n");
> -		return -ENODEV;
> -	}
> -
>  	return drm_bridge_attach(bridge->encoder,
>  				 ch->next_bridge, bridge,
>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> index ed8b7a4e0e11..1d11cc1df43c 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> @@ -138,11 +138,6 @@ static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		DRM_DEV_ERROR(pl->dev, "missing encoder\n");
> -		return -ENODEV;
> -	}
> -
>  	return drm_bridge_attach(bridge->encoder,
>  				 pl->next_bridge, bridge,
>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> index 4a886cb808ca..fb7cf4369bb8 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> @@ -58,11 +58,6 @@ static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		DRM_DEV_ERROR(p2d->dev, "missing encoder\n");
> -		return -ENODEV;
> -	}
> -
>  	return drm_bridge_attach(bridge->encoder,
>  				 p2d->next_bridge, bridge,
>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);

