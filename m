Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039A08D2EED
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 09:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560A011334C;
	Wed, 29 May 2024 07:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="V0gCcy5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201C211334C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:50:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQZ6ssBJJ/g15dFd3aMMNhRonEyH1QugXXoJiJl+GWrnigTA4NPb8c1RqxEFejFzLlE4pVe7dnSnYhh0yURx1Y0ZbkuTpzzIC5/n501BoXZX8Nn2oD32EUHnHEp2ohzW0kLWpS5po03VK0C9YXkWXAQqslWvF6dvL6xqxyzXwbixir5bymXV5kEuk0GTW7yEXlw0najqMbTWQPhXVVlzUx6hZOsoedamFgxKMabkfKpYydARJQg7oj/jZGBw4BI8mSd5IQMsU9sLon7G+pMyaase+GQR34HxQj3u0vsRti1HnPCG24kbEt8evzdQa/FHfa4/rCGBmEVeIZddIVlDRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DX2bT2ktBb052nW/1EYGVTh3IoXr4ytTJwswDHLnATg=;
 b=AJ2r6DVeOIXpr22/RANmvTPHDS1JZhO7b8zQKkltYGh+x3zJMDGAeCz1DCdE+lpZlWcquAzk0PG20Pf89mwgesJkaFSgBcRPsXCnpOt4BJEqwJsLKdBNIHJcA0ESUwTbq7XmFTzldD+ffAmttUEL3uIEGNfuNfvVgU8aM7tA0UM9VuxkQjgq1/Lv6indAGH/iiWnVUrQhPsWStoWIiQkUDwHmPRj9Z4GacshEhK8Slj4EaCHXlYRBc3yAIoSCBQtIjmY9qCcbd4eJPs0q9XY5wpCsvozsBpjJa8nZ+4GGfj8dCmvzSJhEkV1YjdOAphCWWIA2tmnBUAZ7TNEcska+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX2bT2ktBb052nW/1EYGVTh3IoXr4ytTJwswDHLnATg=;
 b=V0gCcy5c/HTf0GWN/CWR5YIFduFKB5p2qf2aFUCZNVH2MH0yJOFWchfZTZJSLu+036YdGqGTKO0Hv/+keqpYMlT9SM8GDxpyyjy08/TxH4c8vVt67069MzCSfzoUXu6XYlvQ0HZbwB7fQsa3xoBY5sBczlUJYoqfSiWyKq3CRsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB8025.eurprd04.prod.outlook.com (2603:10a6:10:1e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 07:50:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 07:50:05 +0000
Message-ID: <091f1d5c-0bff-4dcb-b823-b82989eac628@nxp.com>
Date: Wed, 29 May 2024 15:50:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/bridge: imx93-mipi-dsi: Use dev_err_probe
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240529065400.461633-1-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240529065400.461633-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd5537f-a34c-4c10-cfb6-08dc7fb3f476
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|7416005|376005|366007|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um1GeUtEb3Y2T0hGbzQ2NE0wVkwrSEc5QXVVMTNMZ0RwZngzUGJza3orQ3FI?=
 =?utf-8?B?b2docnBvRmt4VnBmSW5kTGhBSnNxUWtVVk8wQlJ2cGxRenpjREFLUnFOQmw5?=
 =?utf-8?B?OXIzYkpLSExaU3lnWThlbFd1clQ1dU5CRFFIT2FEYnZwZmRuZEdneTl0eHdI?=
 =?utf-8?B?UkxUZktUL0pmY3VVR2xucGQwdWxRTGxSQjRwZ01GS095L3JScTE5eXl6Ykpt?=
 =?utf-8?B?dDdCNzV4T2hCenRuNHdldUZUSHFUSTB6cHFTazRyYzdUdDFjSkpiaFRic2pF?=
 =?utf-8?B?Ymd4ZnlhQ0lqU1FGbndjV0FHM1M0Z1dCUkIyTkNQYkRqcWJUSThoK2ZHTm5k?=
 =?utf-8?B?QzFzVWl2bmFjd3Y3SDBudHRucGRuVFdwNVd4V0JrdHVPdSt6QkdCL2krV01G?=
 =?utf-8?B?dUVTbWx6UVpjZVd6K0EwMTFQV2h1b3JQamExR1NSK0Jiai9xSXozbHBIWG5x?=
 =?utf-8?B?elpjRXpBUG5Xc2ZLOHNLbVhKWS9MRjlMVVBHZ2dlRjZhZEhTYjBVRmJTOGd0?=
 =?utf-8?B?NHlScS9mdWdmSVFSeWJpblRKMnZuVmlRRzFaMWxqSmdCeEtVNjlycVRQeUl1?=
 =?utf-8?B?S29uV1dUSXRJalVUckZNVnIrMCtMM3U1R2QzaWdRVjBsMmRFR2x4UUNHRnRY?=
 =?utf-8?B?aVVCRkJEMHBOS1JMQUd5Nm5KaWhVemNTRGplZnFtYTZjMCt6Wks2aTROT0Nv?=
 =?utf-8?B?cTliVzYxc3MySlRUbFRWVk9SWHJtRi95b251YmdpcnRSeW1OTmo4ZERMOHNo?=
 =?utf-8?B?WGhCRldzSlVtY1ZZSWdnNHRoY1FYSEcyejk3dzZ0NXpsSzU2UjhMYTc3V0Mv?=
 =?utf-8?B?cWhlK2JVOHViVlI5K1NkblJpdGhRU0xTRE1UL0ZLRS9zWW5wdXRuWkdBVW4r?=
 =?utf-8?B?ZHI5enBsODJQOVlTcWczMUkvMk5YdHJFbllHR2VGbmhNcStLRXV6UENqR0JY?=
 =?utf-8?B?YVZwU2Y0aDdiS05sNi9MellQcDFVVit6LzJSTVhCR1F4ZzlTZWFqQ2FFUlVj?=
 =?utf-8?B?ZWhZQUZKYmdlK1RSZEFSM3h6TmhWRkxrMkFITFdyQ0thMXR4cnZKQW0zbGk2?=
 =?utf-8?B?d1BGbVB5N1MvUnZaalVTM04vbkhhME1rZ3o5ajF4WWt3NU15cXhQblQ3V1dE?=
 =?utf-8?B?YVUzU2RlaHI4SEU1ZkxFeFNpRkZKN3d6aEtCcHo4Qkg2NHc5bTlBdlM5VWhB?=
 =?utf-8?B?V2Q2RzZoNW5vSjQwMUtyZnBzZDNkSlNOSmdoeU14TWhoUEJZTWVMeFJwQzdh?=
 =?utf-8?B?ckRVNGc5Ykwvbzd2Y3VTOTBtUDlieDY3N2RqUHF4MUttTC9jcUhMWEljRktM?=
 =?utf-8?B?ZzU1VCtsYVo1VDMyQXVYYkZibVdsUTFFODUzdnZkcWkwM0k3MEM3Wk4wcDRr?=
 =?utf-8?B?RVBlaGtVSnhxYUVGRlVUSVVOUTJsR1QvS3BKREtyUTg4WGdwNk5GOWZvVEdW?=
 =?utf-8?B?UTdFOGpYMDFMbjU3OW8xSGdic2R6aFphcUliYjZPVHRtem9tUDNUb3IvNDJP?=
 =?utf-8?B?OTNiczBBWE1Yanc2UXZyVFBDOTlpc0VZSnFrWlI1UFE3V3pRYXVVdThZYU14?=
 =?utf-8?B?MTkwVWRod3Z1OXl6T0h2aW1uRmFIcWZLb1Njc3A1anA0QkFwY3Q1em93a1lz?=
 =?utf-8?B?WTAyZzRTWkJRQTVJYjE4MzBJWGRsV04xaXZGM3BkUzR6c1BxZWdoQ1JDU0I1?=
 =?utf-8?B?OFhlblp1aWZ2RTdWLzRJbjQ0NTlQK0tYb3RXRTAwNHR1alNRWGN6L2NySlIx?=
 =?utf-8?Q?3P/2xJpEEK5GPKTJxJJl8RBIb1Mexdy3v20bypD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXJKUGFDaHFtWnBEWmdXdnJoMXo3S2tFRHJvSktONkFCa054VklCRlBxSWxP?=
 =?utf-8?B?VFVQZ1NBQU45L0RHbXdsK2dNcU5mQnJzZFFCNG85bGkrZmx2QW1SdXBDVTB3?=
 =?utf-8?B?TklHQS95RGExMHVnNUZnNVpZNGVEY21lMnQ5TndGYkUwTzk2NjA5SEo2bFh4?=
 =?utf-8?B?MmpyVHRjZ1UxU1BvYTd4VDZJaCszWEZKWE92Z0lUblVCR2FhbEpoUHRmRW5t?=
 =?utf-8?B?cFRIaFVycDg2MnJneGVsQXRKTVdnYXFCNktxOEtBb3VRVGhWTnRzcy9rcS8v?=
 =?utf-8?B?S3lJYVRnZlhYRWhKdHZQV3BnWlVTWllNeVp0YzM0TUZlT3dZOUpBWVhJaGRv?=
 =?utf-8?B?bFhUM0xJelpMd3JabEE2eEJvSHRpMWtpN0ZBQ3pNNVVpbUFJbHlZVUZidUta?=
 =?utf-8?B?VVpPUGN5QjlPRlhmd0MxSGE2Rmw0TUlXWjY0QzJ5dmQ5RTZnMmhSS2VvRlF2?=
 =?utf-8?B?T1JZMWZyaXZXb0NKUHhPa29aVDBqR3ZwaW55em9Td1QyWG5RUzB3YzJyOXVJ?=
 =?utf-8?B?QzIwVFF2MWpOZ21nc08vOVlpWFBHbXFORUtZOVFFUmNoTVdpVGxxakxBTmtC?=
 =?utf-8?B?aXl6NFljZnhXcU5ZeVh0cS8zeHhFM2hJU0pQQ1RUQkhudk1SYjlXL0x6VjRO?=
 =?utf-8?B?Y1JNUFpvcGdnUWRqU3RHT0cyK1VWMW9PdkFvT2ltNCtnLzdFVW1wZFM1bXM3?=
 =?utf-8?B?S1ZPZUtMN2ZwQjZSMUowK2tvd2Y3amtQZDhkWlBwU2tDT0R0aTR1T0x4Y0lD?=
 =?utf-8?B?TVp0T3d3SmhrZlJTUlRkTnF5V202M1FVNlp2Ymk5dkFPVFQvY2tDZjVkand3?=
 =?utf-8?B?TmNXdUxUM1huN0cxQ0FCakZ5dnpzcno1RDlSQVloYS9KNTZ4M1JzK1VFYkZw?=
 =?utf-8?B?QWFjOU1sV2pJSVRHSVNucVVaUmwwWFhPelFEeHgzaTJVU1VxY1htVklkbndz?=
 =?utf-8?B?KzVpSkpDa2RCbS9KNmw4SGVGNTBNWWNRT1paSWlXb1lhdVV4L3BiTnZxR2V5?=
 =?utf-8?B?TFZPd004UWRwR3I5UkV2Nm11UlNaQi9HNjFFR25VbGNWcVRLcXNWNC9zU1Rv?=
 =?utf-8?B?eENqZTBiSGpzTHYyTG5YWDZ2L29rZkVnNGVkVm5yZTB6aEtPMStmQm9mZTZY?=
 =?utf-8?B?bE5EdXFZeXREUjdxQmRMVXN1c2xtV3liOExleXZ5Q3M5WW1tZWRJWmwzUkxU?=
 =?utf-8?B?UGQyRVhlRk5KdmREY0tBYy9INy9UK3ZLNm9WYjg2L3MveUF4cm5KKzNYQndx?=
 =?utf-8?B?Wjg2ajI4VStVdFo1MGsxZ1BFc3hreWhIb1FzVWFsQ3ZsSnZONUwzZEFYM0Ey?=
 =?utf-8?B?cGZSUkFpdHNmZGhFMkoyRWRrdmUwTndYTk1DQ0d3VUxuQUhRZXB3WU9MbUtU?=
 =?utf-8?B?UjRYSFpmU2JJRzZuc2VtTmVISGJVTUxFcTcxbWxyVlY5bGgyVENFdVlOZDBt?=
 =?utf-8?B?S2FwbmZPa2lqODZrVllSeWxPV09NWmg5RGQvOHl3UWhDQ3N3TmIzMU9HUXQ2?=
 =?utf-8?B?OWJhMW41SmFJVWlhVTJ5WjltMzNMMml2eHUrdk9kOFNrcTRFRUduVy9vVCtS?=
 =?utf-8?B?V2d5TXBRK0hKUzRDSDRqeXBQd21HY2pBRlpkdnVzazVtRHd6Qk1BVmdnLzBl?=
 =?utf-8?B?OXRPaU1aMzR1eU5BWFoyUTVaaUROZjFHRWp0VWpkaHFvcDBYMU92dEtEa1Bz?=
 =?utf-8?B?aHc0ZWd0cWlxOGdzc1MraGkyVlZyNCtFWTZhNWx5RW90MDVaMUhLTC9KbXdj?=
 =?utf-8?B?ajFySmIyNFZzZWZYNWVlUmp0QzVnbmczdi8rbmFJTE40RVlTSUNuUURIUXJN?=
 =?utf-8?B?c092YnJHdlZ3NGlyWGdsaWVXTUNCck8rNWlFMjE1bXBhUGF5cjRzQ1ZaZmZ4?=
 =?utf-8?B?aGhHZGFJTmZvK3pUTWZnZnVHUTE5Nkg3aWlTNEFtcGNzeXcwdTI2Q0Y1QVY5?=
 =?utf-8?B?T0NmSFluVlBacUd2TUJqNHZWT0NjQkZJbHBpcWdVQ1VRdFdZbjNQeWJhaEc0?=
 =?utf-8?B?Zkw5emhET0VIYVYrbk1TVUlxeDZpem82MHdFVGpSRnUzZ2NWMXVVdk9TUkMx?=
 =?utf-8?B?Z05iSnlHWURINDZqUS8yc3RVTmNVV1VsbXRSMjdEV0ZHbzV6RHRCdW1jM2Yy?=
 =?utf-8?Q?BZiMjzeptkkqHQQnIDlPLSx1x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd5537f-a34c-4c10-cfb6-08dc7fb3f476
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 07:50:05.8513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Nv2dQ6VxDd7t4/lxcLXsFaoE+pXi8FS1KxfxFahwySCfBYbdv555NvAtGqfI6fxDxPhKaEQ0R9Cod00ShcL0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8025
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

On 05/29/2024, Alexander Stein wrote:
> Although very unlike to occur (media_blk_ctrl needs 'syscon' compatible
> removed), it lines up with the other error paths in probe function.

Why media_blk_ctrl needs 'syscon' compatible removed?

device_node_get_regmap may return error pointer other than
ERR_PTR(-EPROBE_DEFER), like ERR_PTR(-ENOMEM).

struct regmap *syscon_node_to_regmap(struct device_node *np)                     
{                                                                                
        if (!of_device_is_compatible(np, "syscon"))                              
                return ERR_PTR(-EINVAL);                                         
                                                                                 
        return device_node_get_regmap(np, true);                                 
}                                                                                
EXPORT_SYMBOL_GPL(syscon_node_to_regmap);

Regard,
Liu Ying

> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Removed unused variable
> * Added missing \n at end of string
> 
>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> index 2347f8dd632f9..13025f47f3902 100644
> --- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> @@ -834,18 +834,15 @@ static int imx93_dsi_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	struct imx93_dsi *dsi;
> -	int ret;
>  
>  	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
>  	if (!dsi)
>  		return -ENOMEM;
>  
>  	dsi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-ctrl");
> -	if (IS_ERR(dsi->regmap)) {
> -		ret = PTR_ERR(dsi->regmap);
> -		dev_err(dev, "failed to get block ctrl regmap: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(dsi->regmap))
> +		return dev_err_probe(dev, PTR_ERR(dsi->regmap),
> +				     "failed to get block ctrl regmap\n");
>  
>  	dsi->clk_pixel = devm_clk_get(dev, "pix");
>  	if (IS_ERR(dsi->clk_pixel))

