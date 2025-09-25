Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF606B9D3FF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 04:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD62710E26E;
	Thu, 25 Sep 2025 02:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bXQ2CW6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E913E10E26E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:57:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ttq8JdwschLUV0IYshRyuC0SYib2/486dSyYGSkA5zBEnqk05LTQoKLDpDetSpf5srAVj7RKlhrWy6AP5u9T2nBp84bj9SUm12gWe6Nih3NATixX02VNV79adZlQyIB+d/n6gCkkNL65EN6bHn071IerZe21IhZfnQbVz0jzIj389rFz0CNZjCCEY5tlySOUIqfYXQSXtspizqHf2+zSe2lJZbgR/3MUr41KGEvilP9Dw+xu8AracyAircevKtUW+5Kt5FGR+Cig/7gz4E2eDFNC3yuixlgT1JzrLp2XD6tRGytBglBiaL+gj4c3yXY9XjNHuwkeLTsUw2R6pn+QoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBMGwwXjzc/+YQPQQIT+QiMqEBKvZ+f5tr+AKAkfSmc=;
 b=b3Wxs5qqMmcszteSgBpoGhFmzbAEiDdDR5H1X4B7ABlmRcfWqjQnihDP85FDwEzU0TeMGnleRd0HBP7xMvlQzPMjN9QB8Wda8hbmJ6/0b1wxyiukRZ3CaeOBlQhzj653QL/tlocqqHiawFIC2iXdIDTlYNxzPZMrE+I/5HC5y6ZdxY43ABMFHx9M5A3DR/PRDB5XBImYBl1uEgBRObz3GhhXQUvq1sE67/qG2cQWRclTtcWd52oOgZf3Fg7OQVBmIdJOeY8VkSLgHNv2dXx1wmpmh2EOU/q+K3gSLEphya5T7abd8n7oDcQSRuTe0eS71KM9BujP1lUSBmeU5xf3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBMGwwXjzc/+YQPQQIT+QiMqEBKvZ+f5tr+AKAkfSmc=;
 b=bXQ2CW6I9kkz93pc+CBXIrUWghiDaU4Y7UIC5TZ9zmVRGjSFrwSiL5TWzWhyj9jhECCFkgqmLTtO1VcvquN6FO6s7n6uzDdbOxN2Y5DT6fcCcbJ1h/1Rfxn17FsMnnRCOj/FuxD6MQOaBHpm3CzVX4L3BQdj8k1Q8Gnm/DMPAqHCov+cXzyzUG1AWXiGBJO5kJq76xFRiv2DPKeMKV6Af+l5BLIkJ/6huSIrRswvEwFYm9uxLmttV0v+0NShaaMS/M0w9+uNVN8Sb487Z5nalBSOYhfzAoT3QJVxcbPkKPj8mK99qw4W1b49KKBFTh1NYog3I3eeE1xcbChWur85yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8908.eurprd04.prod.outlook.com (2603:10a6:20b:40b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 02:56:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 02:56:58 +0000
Message-ID: <215aff22-7923-4925-afa9-7663cd524b42@nxp.com>
Date: Thu, 25 Sep 2025 10:58:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] drm/imx: dc: Add DPR channel support
To: Frank Li <Frank.li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-7-5d69dc9ac8b5@nxp.com>
 <aNLnBbSr5BGDvmsG@lizhi-Precision-Tower-5810>
 <eb070dbc-1e8e-437a-b519-69709b3feae4@nxp.com>
 <aNQNn9EwZzCjapB6@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aNQNn9EwZzCjapB6@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea4c181-76d7-4a08-2621-08ddfbdf3161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djZ2b2pIUGZvaW1WOXZZVmhacHhic2JxSFZ1N1N6SWRKVk85SlJKUHJLbGt5?=
 =?utf-8?B?d3hmaW94QytIWGtITWgzYzBWS0FSbjNpVUhhOStWMGlEajM1bzRiWXN2Zi84?=
 =?utf-8?B?L0pmZ2NOejNXYzc4Y1dyOHdDYUcwYmlpcnhBRWZjUlcyVDdLaitpZlJMMGN6?=
 =?utf-8?B?VktqNWxITFI0bTJvd0lOcWxCZlNFSHA4K1pWUTlLWkYyUFlWZm9lTU95Zit5?=
 =?utf-8?B?djEyUFdJQ0FMa0NheFN1ODdLNE5hWEFoeU5RNG01RmxFcFJjNlhBMW9CSXFU?=
 =?utf-8?B?SlhhelFmc2VhQUdVUE9yQzBXV1ZEdEJ2ZVhWQ2UyN1VhckZNYjMzbFJsQjJP?=
 =?utf-8?B?N2xnUGNYbC9GZGNIM0oyZ1kyWWZOdWZoeUpRMElDbFRBYTdiZkVpaWNHL3g2?=
 =?utf-8?B?bU5LaFU2c1FZc1hrZG04Y2MyK1FtbWpFWnM4N2t5MWlDV0hmbFlrTlEzTi92?=
 =?utf-8?B?VVVldmNjZ0NaNW5BRDdESWcwOEloU2dQL25CTUV3V2FUSFgyWVUvQUVLNUNo?=
 =?utf-8?B?dFRaWkJ2V0p2YmFvZzIvenhsK3NrN0h3NytlR1J1T29QTzlUSW1MY2poSElM?=
 =?utf-8?B?RjlETFBVSjBCWjhYWkNtQlo3djlMRXNXem9QbnVrY2lLWURTMG42RUk3REZl?=
 =?utf-8?B?YXJCNHJNVkNDM2M4S2FQYzJjakZEdG1BTUlQZGtSTE8zR0ZKbExDS3BNVldT?=
 =?utf-8?B?VDNKOGZZZlBIaCtHZzIvS2pqWDRpMEc1eEw2ckUydmpIMWtNY3N0Q0tHK0lx?=
 =?utf-8?B?Nk5KSERJR0NRQ2tDWXUvSGdDMmk1Y0MzVnRielBpdmRzclcyZ2p1blZMRWxL?=
 =?utf-8?B?MlIxOEpHckVPcHExVVFpRzRjZkNFcUFUcVl4L0NDN3pJc3RtVXppc3hQQjV2?=
 =?utf-8?B?SXJmSG9KeUh5UlRPbGl5dHRDR0txZHlrQlpxYUd1bnR1MnVyczJES0tRZVV1?=
 =?utf-8?B?cGgzNGN6czJrQjllZnQvalpKd0QwRmVRT3ZOQmwrTXZjaldkc2FiaDJxVmZZ?=
 =?utf-8?B?YnliMW1tZlFGelhsVlFKTzg0OVhhbjdUNEd1bEtWcGRmbEttRmhPQmR1dUtP?=
 =?utf-8?B?VkdDajVVY3VMNmJZcnVHV0pqVWRNZExDamV0YXh3aW1tMVF3VjdmQ1FwSjBE?=
 =?utf-8?B?YmIwYTZuT0Q0bzZQci9UY2E5bENUbitybDFXdnQxVnRYYTd0UURsSnoxMGFP?=
 =?utf-8?B?TzJRY0FFZm9WdU5iZXhSZGpaSzNDUjdZYzVSNTVhZEpadi9WbWVxeGtBVDZS?=
 =?utf-8?B?Y0NYNWFnZVRnVkxwaTJ4Tkd4UkRCczlhMGphSkJQaG9rb0JNQ0VUSEdHZjA5?=
 =?utf-8?B?TS9QQ1IvYTdrOU1EQzdUTDlLUG84Z1lDOExRVXFPeDVxb2RBanNPd2lJRk96?=
 =?utf-8?B?Qmx1ZXNKaHg5MzJYMDM0NUFzQ2tDLzRZY1Q1NDlkM1ExektvNWtPWUFzVEVt?=
 =?utf-8?B?RTRmWVlpd2hFSlZoVEtUb2tEeXQ1cFkxdnlldzc0NnBvMCttOSswWVgzUFhz?=
 =?utf-8?B?UXJoNW9OSVFmS3g4SDB2ZVRqWkRrUWpQSnJLQmd1Y0ZUdU9UM044V0dqSkh0?=
 =?utf-8?B?WHJTZFJCZ1BIQ29pWjBLWEtIWkZaSG8velF5YTRpWkdhWHQzLzA0bEtkVjdx?=
 =?utf-8?B?SFdDbXcrc0VQNUVhZDFIU1BuOWlNM0c2cjJkZ1d1cDNONTFldTN5OXYxdkNn?=
 =?utf-8?B?UlpySFg5UjZTclc5QlNTOFhlTTQyYmR1eEx4Wk5QQzB3UHU3TytxVkJxRzlJ?=
 =?utf-8?B?NXFURXNtY3orMFc0Z3puUWs5WHh2UndiTThpRHRkTEpkT1dDdHdrdjJmdEE4?=
 =?utf-8?B?Y2c1RjExTDhadVdzbEFNR1RGeDVXaGpvRUhvdU9WdEs2S1c2Z3hZRy9YblE2?=
 =?utf-8?B?c0RyTUlMY1BnbzVib2ViMFBxM0tMNGdHK0d5U0h4Mm5HaGc2a2FLOE1jZHNy?=
 =?utf-8?Q?rv/iXzP3CXtcwbirXmfqnZ+paUYhE3li?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmdVb0ppbEVWaXkyTzJERGloWGxaaG5obnpKOVo0dWZUTE44MitvLzhYT3dY?=
 =?utf-8?B?cFoyUlJGcXhpWmoyTkFOK0FKR3hnWjNoZXV4S2ZyN1hGRDhFblNaMDNPVHND?=
 =?utf-8?B?aUpVTFhLM0haUjFxUXQ2MkdLaVRHdzUwM2dKZFRCYUNSc1ZSUitURFBSZzYv?=
 =?utf-8?B?T2xnYzFsbHR5eXpkWlpvcUNueHNsdkNzNGxrcEtFcFNmeTNUTUNrTldRM2oy?=
 =?utf-8?B?MGtxRk9MQzYvSXZrK2o5T0k1aUxGNEdLUXp5UkFWWWU5eW9obFVRd1BjQmJE?=
 =?utf-8?B?dlozUVdKS3VjZk5GOEdzb3NJTkllVzlTSDJ6dHRMMldwSjFTTVVPeWdrR0lP?=
 =?utf-8?B?Umc4aGVzSGFpVjFTcHc4dGtUa05Yc1FMM3Q5a2R4dDFUa0J2eXVGcHVlWWlj?=
 =?utf-8?B?RFhXUk9yVVI0b1dmbzZmMGVUZ3dGdUJCaUk0SkovSm1FdFBHS0xhMjVWczNU?=
 =?utf-8?B?dGZqUVFnc0tsNG9GOGQ1MWt4c1gwQlB3ZWZaVFV1a1lVcFNEbEcwSVZFdS9u?=
 =?utf-8?B?NHhCWGl2L1V2ZzdaYllzZ1FQYU5JZGRLQURMWFJnazdYd3NuamtwV0EyUHZa?=
 =?utf-8?B?SU0wVFJYWTRkR3prejlObC82WkJDcVhRRWsrd2t3bTNwZUF5MzRUVStrbTc3?=
 =?utf-8?B?N0xVM2NpK1pyZXpKLys4cUU0NVVUaHBpMXYxOUpKK3pKK0xlMTZmallHUmVE?=
 =?utf-8?B?VlpmaXhBV3ZtdnJkaWluWnlKbWJ5ZFIvRlc5OVord2wwWWI0bzMvQUZOazRT?=
 =?utf-8?B?bVBpVm5GUmdKMkNENnNlWXdaUmhzaXVtN0psdGsyTVJtRkFDbm9yYVlxQ0tO?=
 =?utf-8?B?NGcvY0thUWxNY3IrbWpFbCtycDgvQVJCY3BGQ2NDNitkaUp5US9raXc2RVVY?=
 =?utf-8?B?NHNSTk5hT3JBSk5vZmEvckd6TUNtY3RGU0hxWDF4bUVuRE16dnNXOVJvY0hv?=
 =?utf-8?B?WWYvM0NxZjR4dVc4dkMrVlZYOHFib09STlRuYmN2SlEyZHNxZjBSTnQ4bStm?=
 =?utf-8?B?OWkvL0Y4eTF3c3liUXdZZTRONmV5dHNSWkVSNnpFOG9QK3RHQ2Y5alRmZ3Vs?=
 =?utf-8?B?ZUk1bEZYVHg1VmM0aUIzaVhLa05Bb2FKK1NZK3M0UDVHNGJTR2paMkFiOXFG?=
 =?utf-8?B?SXdtNWkyc3NsR3kxSHpFdmVjaHZZUlUwanFYSWUweHdBOXpXc1BPR2hVYmRr?=
 =?utf-8?B?VGlLTWJNZzZJQ0p1c1owMXRscUIxUncvbW51akZySUVSNlVxWTJYdjN2UjU1?=
 =?utf-8?B?dDMyODRySkR2RVlaSnU1NW10YUZVMmh6K3R4bkk3L3F4dGl1MCtPdkVlQXhU?=
 =?utf-8?B?alpSOHJyc3NNaEZnak42OHdzbUh2eVZVVXphYS95dnlBVnl1ZCtZRmdsMUVt?=
 =?utf-8?B?UDVDajJJWVlWZmkzaFFDUEk2QlVlNGtqRlp5VVRNam5hM1ZDT0oyVlE2bUpM?=
 =?utf-8?B?R0dRcWdZRjdNMTQydVRabzU2QkNmb1UrL2hmdEhrS3E2UDBYMG9nRkQ1QTkz?=
 =?utf-8?B?U0wzZmRaMkh1emlrMDlwMmdmcllMc2tTU2FtVUdVQmRyZEtUTlJRZWUxRFR4?=
 =?utf-8?B?RHEyZGlXL3Q5R0ovTk9jSkg0ZWNjZmZsRHRjWUM5MkdEbndKQi8zWGQxeCtU?=
 =?utf-8?B?ZGxHNDFvNUVGTjdUakxPdE1nTnU3MzFvQ3VFd0J1UHQwL2gwcmFWbHFRdUxY?=
 =?utf-8?B?NnBUaDFIQmZLS21iNkR1TFBJd0ZscXV6Q3Z5cUQ0aythNDhCRkRvQjhUMWZB?=
 =?utf-8?B?bGhtMDkzb2xZbUFQenFkUzJteG1Yc3VYclpCOE44TDJ3WXl4bFN5cEg4cnFE?=
 =?utf-8?B?TU16eWsrc1hmcXpISUJNbmdiTlZvMTYxb3F5cVN4M05aaVhkZTg1a3BRSVp2?=
 =?utf-8?B?RkdPZ013QXQrNlUwQTVQdGdMREd1eG9MT08wditMc01xZFFlcVc1V09NTkV5?=
 =?utf-8?B?VTdPQWNhQ2puVGNDM0p5Nnc5eWN2MkNuT040UUxOL0pFWE1lcTJTYm94cTkr?=
 =?utf-8?B?SmhMdndXeU11TUV2Q3JNQUlWd3JTU2xRVXQyL1YrdjBlTURYc2Y2aGdPekJk?=
 =?utf-8?B?VUpOazAvaXJxSnhPdTlyUjFUZTl4aExZR1AxeERQdTFtdjJNNEZOVGNzMnRU?=
 =?utf-8?Q?q20yWW2phObXGibRTdXjFL1f9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea4c181-76d7-4a08-2621-08ddfbdf3161
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 02:56:58.3960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jw9OyNbLmZ1yrx2qnhPpHJAXvjC9KqCm6jkbMf+Ekcz9ADAkFNOYr7g9IWtsUqraZ09aC2o/IZ0WzBySJUNvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8908
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

On 09/24/2025, Frank Li wrote:
> On Wed, Sep 24, 2025 at 02:41:50PM +0800, Liu Ying wrote:
>> On 09/23/2025, Frank Li wrote:
>>> On Tue, Sep 23, 2025 at 10:07:57AM +0800, Liu Ying wrote:
>>>> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
>>>> It fetches display data, transforms it to linear format and stores it
>>>> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
>>>> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
>>>> driver to support the DPRC.
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v2:
>>>> - Manage clocks with bulk interfaces.  (Frank)
>>>> - Sort variables in probe function in reverse Christmas tree fashion.  (Frank)
>>>> ---
>>>>  drivers/gpu/drm/imx/dc/Kconfig   |   1 +
>>>>  drivers/gpu/drm/imx/dc/Makefile  |   6 +-
>>>>  drivers/gpu/drm/imx/dc/dc-dprc.c | 465 +++++++++++++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
>>>>  drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
>>>>  drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
>>>>  drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
>>>>  drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
>>>>  8 files changed, 522 insertions(+), 3 deletions(-)
>>>>
>>> ...
>>>> +
>>>> +static void dc_dprc_reset(struct dc_dprc *dprc)
>>>> +{
>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
>>>> +	fsleep(20);
>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
>>>> +	fsleep(20);
>>>> +}
>>>> +
>>>> +static void dc_dprc_enable(struct dc_dprc *dprc)
>>>> +{
>>>> +	dc_prg_enable(dprc->prg);
>>>> +}
>>>> +
>>>> +static void dc_dprc_reg_update(struct dc_dprc *dprc)
>>>> +{
>>>> +	dc_prg_reg_update(dprc->prg);
>>>> +}
>>>> +
>>>> +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
>>>> +{
>>>> +	guard(spinlock_irqsave)(&dprc->lock);
>>>> +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
>>>> +}
>>>> +
>>>> +void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
>>>> +		       unsigned int width, unsigned int height,
>>>> +		       unsigned int stride,
>>>> +		       const struct drm_format_info *format,
>>>> +		       dma_addr_t baddr, bool start)
>>>> +{
>>>> +	unsigned int prg_stride = width * format->cpp[0];
>>>> +	unsigned int bpp = format->cpp[0] * 8;
>>>> +	struct device *dev = dprc->dev;
>>>> +	unsigned int p1_w, p1_h;
>>>> +	u32 val;
>>>> +	int ret;
>>>> +
>>>> +	if (start) {
>>>> +		ret = pm_runtime_resume_and_get(dev);
>>>> +		if (ret < 0) {
>>>> +			dev_err(dev, "failed to get RPM: %d\n", ret);
>>>> +			return;
>>>> +		}
>>>> +
>>>> +		dc_dprc_set_stream_id(dprc, stream_id);
>>>> +	}
>>>> +
>>>> +	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
>>>> +	p1_h = round_up(height, 4);
>>>> +
>>>> +	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
>>>> +	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
>>>> +	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
>>>> +	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
>>>> +	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
>>>> +	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
>>>> +	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
>>>> +
>>>> +	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));
>>>
>>> Is it okay to access register if start is false since
>>> pm_runtime_resume_and_get() have not called.
>>
>> Yes, it is okay, because dc_dprc_configure() is supposed to be called
>> continously for multiple times(OFC, fine for only once as well).  For
>> the first time, start is true in order to enable the DPRC.  After the
>> first time(DPRC is running), it is called with start == false to do
>> things like page-flip(update frame buffer address).
>>
>>>
>>>> +
>>>> +	val = LINE4 | BUF2;
>>>> +	switch (format->format) {
>>>> +	case DRM_FORMAT_XRGB8888:
>>>> +		/*
>>>> +		 * It turns out pixel components are mapped directly
>>>> +		 * without position change via DPR processing with
>>>> +		 * the following color component configurations.
>>>> +		 * Leave the pixel format to be handled by the
>>>> +		 * display controllers.
>>>> +		 */
>>>> +		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
>>>> +		       G_COMP_SEL(1) | B_COMP_SEL(0);
>>>> +		val |= PIX_SIZE_32BIT;
>>>> +		break;
>>>> +	default:
>>>> +		dev_err(dev, "unsupported format 0x%08x\n", format->format);
>>>> +		return;
>>>> +	}
>>>> +	regmap_write(dprc->reg, MODE_CTRL0, val);
>>>> +
>>>> +	if (start) {
>>>> +		/* software shadow load for the first frame */
>>>> +		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
>>>> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
>>>> +
>>>> +		/* and then, run... */
>>>> +		val |= RUN_EN | REPEAT_EN;
>>>> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
>>>> +	}
>>>> +
>>>> +	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
>>>> +
>>>> +	dc_dprc_enable(dprc);
>>>> +
>>>> +	dc_dprc_reg_update(dprc);
>>>> +
>>>> +	if (start)
>>>> +		dc_dprc_enable_ctrl_done_irq(dprc);
>>>> +
>>>> +	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
>>>> +		width, height, stride, format->format);
>>>> +}
>>>> +
>>>> +void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
>>>> +{
>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
>>>> +	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
>>>> +}
>>>> +
>>>> +void dc_dprc_disable(struct dc_dprc *dprc)
>>>> +{
>>>> +	dc_prg_disable(dprc->prg);
>>>> +
>>>> +	pm_runtime_put(dprc->dev);
>>>
>>> You call pm_runtime_put() in dc_dprc_disable(), but not call
>>> pm_runtime_resume_and_get() at dc_dprc_enable().
>>
>> Yes, dc_dprc_configure()(start == true) is designed to get RPM and
>> dc_dprc_disable() to put RPM.
>>
>> dc_dprc_enable() just sets PRG to non-bypass mode.
>>
>>>
>>> Is it more reasonable to call pm_runtime_resume_and_get() in dc_dprc_enable()
>>>
>>> dc_dprc_enable()
>>> {
>>> 	...
>>> 	pm_runtime_resume_and_get();
>>> }
>>>
>>> dc_dprc_configure()
>>> {
>>> 	unconditional call
>>> 	pm_runtime_resume_and_get()
>>> 	...
>>> 	pm_runtime_put()
>>
>> Here, as RPM is put, it's possible to actually disable the power domain,
>> hence possibly lose all the DPRC configuration done between RPM get and
>> RPM put.  So, this doesn't make sense.
>>
> 
> Okay,
> 
> dc_dprc_enable()
> {
> 	...
> 	pm_runtime_resume_and_get();
> }
> 
> dc_dpdr_disable()
> {
> 	pm_runtime_put();
> }
> 
> dc_dprc_configure()
> {
> 	pm_runtime_resume_and_get();
> 
> 	if (start)
> 		dc_dprc_enable(dprc);
> 
> 	pm_runtime_put();
> }
> 
> Look more reasonable for pair get()/put().  after first start, ref count
> will not reduce 0 by pm_runtime_put();.

Then, as dc_dprc_disable_repeat_en() also accesses DPRC register, it needs
the RPM get/put too?  Same for PRG driver APIs, dc_prg_{enable,disable,
configure,reg_update,shadow_enable} access PRG registers.  Though adding
RPM get/put to all of them should work, I don't see much point in having
the get/put dance.

> 
>>>
>>> 	if (start) //look like only need enable when start is true
>>
>> I may add this check in next version.
>>
>>> 		dc_dprc_enable(dprc);
>>> }
>>>
>>>> +
>>>> +	dev_dbg(dprc->dev, "disable\n");
>>>> +}
>>>> +
>>>> +void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
>>>> +{
>>>> +	dc_prg_disable_at_boot(dprc->prg);
>>>> +
>>>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
>>>> +
>>>
>>> you have runtime functions dc_dprc_runtime_suspend()
>>>
>>> If runtime pm status is correct, needn't call clk_bulk_disable_unprepare().
>>>
>>> Look like call pm_runtime_put() here to let runtime pm management clks.
>>>
>>> otherwise, runtime pm state will not match clock enable/disable state.
>>>
>>>> +	dev_dbg(dprc->dev, "disable at boot\n");
>>>> +}
>>>> +
>>>> +static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
>>>> +{
>>>> +	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
>>>> +
>>>> +	dc_prg_shadow_enable(dprc->prg);
>>>> +
>>>> +	dev_dbg(dprc->dev, "CTRL done handle\n");
>>>> +}
>>>> +
>>> ...
>>>> +
>>>> +static int dc_dprc_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct device *dev = &pdev->dev;
>>>> +	struct device_node *np = dev->of_node;
>>>> +	struct resource *res;
>>>> +	struct dc_dprc *dprc;
>>>> +	void __iomem *base;
>>>> +	int ret, wrap_irq;
>>>> +
>>>> +	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
>>>> +	if (!dprc)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	ret = imx_scu_get_handle(&dprc->ipc_handle);
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
>>>> +
>>>> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>>> +	if (IS_ERR(base))
>>>> +		return PTR_ERR(base);
>>>> +
>>>> +	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
>>>> +	if (IS_ERR(dprc->reg))
>>>> +		return PTR_ERR(dprc->reg);
>>>> +
>>>> +	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
>>>> +	if (wrap_irq < 0)
>>>> +		return -ENODEV;
>>>> +
>>>> +	dprc->num_clks = devm_clk_bulk_get_all(dev, &dprc->clks);
>>>> +	if (dprc->num_clks < 0)
>>>> +		return dev_err_probe(dev, dprc->num_clks, "failed to get clocks\n");
>>>> +
>>>> +	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to get SC resource %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
>>>> +	if (!dprc->prg)
>>>> +		return dev_err_probe(dev, -EPROBE_DEFER,
>>>> +				     "failed to lookup PRG\n");
>>>> +
>>>> +	dc_prg_set_dprc(dprc->prg, dprc);
>>>> +
>>>> +	dprc->dev = dev;
>>>> +	spin_lock_init(&dprc->lock);
>>>> +
>>>> +	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
>>>> +			       IRQF_SHARED, dev_name(dev), dprc);
>>>> +	if (ret < 0) {
>>>> +		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
>>>> +			wrap_irq, ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	dev_set_drvdata(dev, dprc);
>>>> +
>>>> +	ret = devm_pm_runtime_enable(dev);
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int dc_dprc_runtime_suspend(struct device *dev)
>>>> +{
>>>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
>>>> +
>>>> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int dc_dprc_runtime_resume(struct device *dev)
>>>> +{
>>>> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
>>>> +	int ret;
>>>> +
>>>> +	ret = clk_bulk_prepare_enable(dprc->num_clks, dprc->clks);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	dc_dprc_reset(dprc);
>>>> +
>>>> +	/* disable all control IRQs and enable all error IRQs */
>>>> +	guard(spinlock_irqsave)(&dprc->lock);
>>>> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
>>>
>>> write one 32bit register is atomic, look like needn't spinlock.
>>>
>>> Only other place use dprc->lock is in dc_dprc_enable_ctrl_done_irq(), which
>>> write 32bit clr register.
>>
>> No, dc_dprc_wrap_irq_handler() uses the lock to protect register access too,
>> so it's needed.
> 
> guard only protect after it.

scoped_guard() called by dc_dprc_wrap_irq_handler() protects register access
too.

> 
> in dc_dprc_runtime_resume()
> 
> +	/* disable all control IRQs and enable all error IRQs */
> +	guard(spinlock_irqsave)(&dprc->lock);
> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);
> +
> +	return 0;
> 
> +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
> +{
> +	guard(spinlock_irqsave)(&dprc->lock);
> +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
> +}
> 
> How spin lock protect register access?

With the error and control IRQs, dc_dprc_wrap_irq_handler() and
dc_dprc_enable_ctrl_done_irq() could have concurrent access to IRQ_MASK
registers(though there is SET/CLR/TOG register variants, they have a
shared read-out value).

> 
> 1: IRQ_MASK <= IRQ_CTRL_MASK;
> 2: IRQ_MASK + CLR <= IRQ_DPR_CRTL_DONE;
> 
> 2 possilbe result:
> 	1 happen after 2
> 	2 happen after 1
> 
> Frank
> 
>>
>>>
>>> Frank
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>> ...
>>>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
>>>> +{
>>>> +	prg->dprc = dprc;
>>>> +}
>>>> +
>>>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
>>>> +{
>>>> +	return prg->dprc;
>>>> +}
>>>> +
>>>>  static int dc_prg_probe(struct platform_device *pdev)
>>>>  {
>>>>  	struct device *dev = &pdev->dev;
>>>> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
>>>> index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
>>>> --- a/drivers/gpu/drm/imx/dc/dc-prg.h
>>>> +++ b/drivers/gpu/drm/imx/dc/dc-prg.h
>>>> @@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
>>>>  struct dc_prg *
>>>>  dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
>>>>
>>>> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
>>>> +
>>>> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
>>>> +
>>>>  #endif
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>
>>
>> --
>> Regards,
>> Liu Ying


-- 
Regards,
Liu Ying
