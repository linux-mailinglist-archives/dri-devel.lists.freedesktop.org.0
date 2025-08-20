Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4CB2D2B2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 05:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8B510E121;
	Wed, 20 Aug 2025 03:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="M4Bnk36F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011053.outbound.protection.outlook.com
 [40.107.130.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2195410E121;
 Wed, 20 Aug 2025 03:48:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gerxbV4oV06iNPEQUApgBjh6zz0VEs/eBXVV1v3v+6+sw4lhf+ua0gYyShsTP8rDScunPNs0JBf/AQOmyFi4Koe5hfl8DX3EtsrmEmizQ6lxTOUXWsKje92jTW/ymd4JGT9wmBuKcisfCkbtsnPO+nE8X66HyalkYxTu+fVrJmiVGP/iADugnOhF2wfc1JqMrY6UxiDU6IYLDjwl1V1u0QjCJJ8bjHC9oUIElAUl2XjmLLuFuJVpVEwH0FHPoS+YibMpUYaKxPjJlQ8JqAqGYGOvvLzfMWsVfpyjD+Yw6s4q90zw4b+bcoHQjf5SDnMJvDiszufCpg65oryLieSm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN0FiuqxPGRn+fuPa1XL5ZPnsrmVhhMD4p11zy3soR8=;
 b=f3XH9X13D54+iG14a+x7+KDetWlRxIn7IGq6x63/U3eDP4sUyfP0dCozOh7z0ATV+OhAwlYI16TLeeUaOK3r14gwwqGPzhL80w9jfZ7EMVGjQdcw4nCpuq4q8WsZsHrTtTHQxNOeKybnmDqZzC9clPKp9Y3OrXSjsJNfkUebm+Sm70HVjlrZQn1aLfoStCBe5nBvKWe5qhjexho2oOIuZcRChPH8rQ11KIs3qQ1Nzo1hpOxc89d5GtmYbEnv5Rz/9KbVyF9QnrMe80Ewct6Ga4IOnj+1JGsfmaBUE/+QbjhoHWjpQJnYtI70NZhymNKzMzlHNB8ZWpqo5Ur8UnSk4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN0FiuqxPGRn+fuPa1XL5ZPnsrmVhhMD4p11zy3soR8=;
 b=M4Bnk36F/xKML1xqHd94+eAO9oaOlCGab7xwvyW6CwSCbmq2SrJ5fGmJRib5v30nTvfQcLW8gVRIbRruM5rKgh2qlfmphkTb8cA1HxSdCwu/UvuPDDPzXvFr0QnwiKz4/nNBcjo/uEmUaxiV7/XCl9LZ0sA1L78Yva58SY1tMra742oYgD/f+leMyagCbFeWASlcEJDUGQs6cimL2Q9ydqmUYO8O4xy3HqTWy9/ifwzTjXpDyjQ6iLb139IgHdiGS+NrXkxS2b20VYrY8hbhbXAtKipNJ/PImylywOGecvZSH3ALEFj0X/sm5INbdLKiJhIvHZFGJEFkxJ+Q1862BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU0PR04MB9695.eurprd04.prod.outlook.com (2603:10a6:10:321::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 03:48:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 03:47:59 +0000
Message-ID: <af8ff1d3-7ba0-450d-9211-690ea9d166be@nxp.com>
Date: Wed, 20 Aug 2025 11:49:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] drm/bridge: lontium-lt9611: declare supported
 infoframes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-4-7595dda24fbd@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250819-drm-limit-infoframes-v2-4-7595dda24fbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU0PR04MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: d548bb0c-0353-4bb9-72fc-08dddf9c5b40
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|19092799006|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjB0Z1g4MVdlQVhIN0J3cUJiMlI5K1hIWTNFQ2pQaW9nL3gvZkFydHJ5b3NF?=
 =?utf-8?B?Rll2cTVvMkF3L2t0dUNRVXVWa0VIWjVLUUgxdFBIZFVvSysxcjFVbng4aWUy?=
 =?utf-8?B?a1dEZ0V6cENac2NPVVNHWTBJa2Vpak96VXNqNWYzNThtdlU0emhGRkVqbGRn?=
 =?utf-8?B?MW9MQmFjOEZtSXdIUWpUWWdiVHFvNENLN1F4bXJYWmV5bUpaWXhyaE9QaEt2?=
 =?utf-8?B?aHNad2ppUTZ6UkRnL05STCtmdVFDNS9xU1YrOVgreXVKems3NEIvb3AyY0Zp?=
 =?utf-8?B?bFgrMU8zTXdlanphbnQybC9LdEx3UTV4WTIrc09YNVk4d1QxZUprYW95SHdW?=
 =?utf-8?B?T3JTMjlpTTA2QUVYZG81NWZhSkxEQXpQMDFTSm5jcXhNVk5wb1RWQnRKdHhO?=
 =?utf-8?B?NWJtY2l4aHI3YXJTaGRCOFpWOEE3ODQ3QkFjOXMyZUZvQ05QcXhnTWFrcVNZ?=
 =?utf-8?B?ZU9jeEk5ZHJRT1RKdVMvTzM3NXExTXAxQ2tCN01sYUNJV2RuU0JyZW5vcExB?=
 =?utf-8?B?MmpqQS85VUxTbXY4bEk1SUYxb2JrNE9LRnNpc1Jxc2c5TE5sOXhSWUVBa2xJ?=
 =?utf-8?B?OUMzaFl4ZnVOVUY1V2M5ZEtCR0lwR3dnNE1BTnNMaFlhb0Y4VnY5d3FRRjF6?=
 =?utf-8?B?TzMrWWhjNkFYTHVoK3FJMWJYZ2g0MFVVVThTNVEzLzRETmNxQm9vbVN1Qjho?=
 =?utf-8?B?TG9rNlpiM015UVF2QUlYUTBGSWIwcGZJZDk1QWhLSU1iWVBibllGYnZmVXlL?=
 =?utf-8?B?Y0xlTzY1aFJOQjRaTnQyZkRRMEgxV3ZpQUtzVU1KQlY4KytMNmltTS9jZHRu?=
 =?utf-8?B?N1VpRHI2TmVQanV3dUlDTmVGSU84eDk0ckJyOVRSVjRQYmF1RzR4cGpHc0lU?=
 =?utf-8?B?bm1jNjVrWHlkUmp5U21Ob2thWWpwZW5WNldFT3VWQTNmdEtmaVRoZ1Q1OHlR?=
 =?utf-8?B?emQ5OVF3UEpzVDBaYi93dEFjdlcvNlh5dEpNam9FanRMeTc5dlRwd3Rwei9z?=
 =?utf-8?B?SFJwQmRWODhseHpHSU9tNjVDMk5icjFGSmtOL2lQeEJ2SUpBOWJhMWJJK0dT?=
 =?utf-8?B?ZUVmMTk0Tjh4NHAyMFVtSVR6WVk1Sm9mV1Q2Q0hVZ2lCOW4wVW5xemtoS1V4?=
 =?utf-8?B?bFByZC9VZlJXR1N5N2pSbGJwNmM3QmNTNEswZ3ZVNURDLzM1cTJrQ2pQQjNw?=
 =?utf-8?B?Q2dYMGh6eXRucVdXcXk0QXB2bVFvdFFveXRBQ0U4RFhHaHF3Nkc3OGZaSFU3?=
 =?utf-8?B?SFlBbENyblRoUDhlV0dYd09qNUZDS3JiVnMvZkpZeVBidVhTaEVtamlENUly?=
 =?utf-8?B?N2liSVcxcU1vck1VK1NYQis3VjR1U05sQ040WjgrZjRTd2U1OVg1R3A4eDla?=
 =?utf-8?B?UElvMWlOaDIwcjQyUERWU254ZU5peVQrdUtYdGt0dzFrQ2xJY01Ba3VJNEpP?=
 =?utf-8?B?MHY4cjJJVFMrN0kxUzJEZTVkZlBuSE95MEZHakxhK0tPbmJaMk1xVjBSc3pw?=
 =?utf-8?B?TE8xYmRPWEdCb3NCbXF0cEw5dG0zOTc1KzA2Y2dBMjEzWUNSN1hKODBGMmMx?=
 =?utf-8?B?bUdBS0s5TjBiNzNrUFhTVUd6WEluNHJNblJLbGtiQ0ZibmJPN1pWeFF6VkpF?=
 =?utf-8?B?SlVKeXpNQXljdkcwOGlyblVySkFWNGJCSjQ1MElqTE9uaWF2M2M3aWFaTVZy?=
 =?utf-8?B?UE5xemdtd0tvTHE2cGVTamlldHg5MmZ1bXJDWGNCZG5INmlJa2ovRFloK2Vw?=
 =?utf-8?B?SUdQdTZrV1p4QU8wdlZaRkVSWUxjZGYyMU5BT1JRK2p1Z01UUEM3WjIycHEr?=
 =?utf-8?B?MzFKcHlISEJBUUhmNzhGbnlRaHpWZFRPaUVCZnMzcWNjdTA4V0Ezak5yczJi?=
 =?utf-8?B?bVRlU1ptbEV3SFpTcE5kMDh2SE5Wb0VKOU5vVVpFRWk5ZmEvSTJFUkZPODRM?=
 =?utf-8?B?dE4vVTRrQ1hJZ3FmaWZCNDdURnBpaHVoQVVkTFc4bVZCSGFESUJBVWJxR0Nt?=
 =?utf-8?B?SGp0WlZmSlJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTg2d0MzZmNYenl1UTh0djhMSzI0QndUdVFyYTFPOHE3TVkvR0t3QWphRjI5?=
 =?utf-8?B?NEpzWlVJeG5COEhCaUtpK0pzcklDdDZOTjdQRFBGM0EraUljMXdxekZzZXpH?=
 =?utf-8?B?VlpuazRiZ3dHMk5aZVk3RmhmQmJsNEd1ZGZURGlPbnJkQm5zWlIvTTdCY1Rm?=
 =?utf-8?B?SkkwMWNkL0pyK0lGek80RmM2cnIrOUxPTTdyU0dKRHpCV1JTR3l2ZU9Xb0dB?=
 =?utf-8?B?ZEFERG9jbVVvTEpRbklHY1VNa1JCQzA1ZDk1RDgwcXdRQzdVUjhBTVJPRndz?=
 =?utf-8?B?TDgvRW1sMDVTdWZRc0xCOVVlbWh6akRULzFMSThnOWxqSjIwalo5UkFNbWxt?=
 =?utf-8?B?THNkai81YXc1M0szOHNqdVFBUkFUcTV5dlp6SE5yeGxHMS9xUDBEU0RkR0NL?=
 =?utf-8?B?NDQ0OU1aVHA3Tk9DRVlkbzNWNHBHOHVwZ0Vsak9kcWhUZDhLV0NWcHIyMytU?=
 =?utf-8?B?eFI0RkdZSG9oVVJIWndjMmFqUTljdHNSNFdxYVd5RWVyblBSM3E0TUFXV1l4?=
 =?utf-8?B?WXBRdHZ6ZnFOWDRIVFpReGh1YVd3UzBUWTU2TmhkeVN1a1NvYXREVWlaTU5t?=
 =?utf-8?B?NG0yazUvRm0rdnlPMTZra2Y2TzB3UjlheWFTZ1lPdFZ5ZWtETEhUSE5ZV09y?=
 =?utf-8?B?czZSRGE4MWJENUpMaERWOS8vc1lPVTdpYjFJSWdGV0l1Q0w0TjA4YSt6MUhu?=
 =?utf-8?B?aFV0YkM2eCtyTTBkWEp5azd5Wm0veW5QeFI5NkVveEtXd2R0eEs3SCs1Tlha?=
 =?utf-8?B?VGRxRkxaMlNNdnVRRElQR0dDakI1YjZzM3FlWTZXL3dzazhjc1VKcFRsSXI4?=
 =?utf-8?B?a3pkeFgzQk50czdQMStYellOREhKZG5OTFlrK2cxbHZNT1RySldmUjdtUjBF?=
 =?utf-8?B?cnhQZUNscW9HTFZIaTlvVzRsVDFjQU1QKzg5VDNhNmxLWHZjNzcvMWorZFhE?=
 =?utf-8?B?OVllMndNVStjK0Jvb2U4dWRqcEJ4R3pmbUU5NFZCcDhaVFZsV0RGelA4S3E1?=
 =?utf-8?B?ZVBVdWZUNDRiOW9uNXowUFQwYllodDhMaGMrMk9xTURTYTh5KzBrUnRXOHpr?=
 =?utf-8?B?aVc2M0dNaVVGOFlROXdLWVp6THYxWHF6ZHhFbE1VS1c0OXVNNVNoUjdTdFlv?=
 =?utf-8?B?cnh3SEl6ZnI5VjBPcTBUSkNRRzdCeSsxUkU0ckh1VCtuK0VaRTAvcytCOURW?=
 =?utf-8?B?VGRSb09QdlNQcW1iUWN4VUUrb2s5aFovSVlIM3dJVzY3bVArcGovL3FNc2JL?=
 =?utf-8?B?RjJ1aHlRb1FSTlJYbjZGSkUvWCszdUsvRGphQ3F4eHZ2NGVvaHJmaWpzSlg4?=
 =?utf-8?B?SW1qMEVOVm1HNnJGVnVDN0FJcGo0dDBrYWcyMUg3R05RdFJsRXF2ZEI4akJF?=
 =?utf-8?B?cGxXOXFkMTNMaGY4ZzNKaTZzcEV3MzNuY1ZoelorOStwMnVCazUwb3JNb2pD?=
 =?utf-8?B?WGxVTlArU2N5S3J5VHl5QWNVUjZEdWNjL01OanAvSkphR0N1cUFDbVRyU3Jq?=
 =?utf-8?B?WlpDUW1nWndUaU5UZTNQMHF6SWpJVHJXckNyK3A0T2YydzdHamhIWFc2aUox?=
 =?utf-8?B?cmFybDBvTWR6dDdYV1JtYlNqOVFHM3BLT0hjMEt4OVh1azdSRjZ0eTl5c1Vp?=
 =?utf-8?B?Tlk5T08yUzRzYjlwS0VtakM0WTdjUUJNelFQc05QQjV6azlYYi9vblh1aHBm?=
 =?utf-8?B?NlRydUt3dEJSZnZieXhZK3Q3Q25hcEdKNmE5bHhRSXBoc1NabmU1M0kxcUYw?=
 =?utf-8?B?TWUwQ1Byc1dJeXRyU3JZdHNUWHF1RU9Zc1RsT2wzQ0tacFY4VlMvVzRKeFZX?=
 =?utf-8?B?N1FMa3JvK0dtalZFU1NhckJaQ1pFVWx3Tm10QklNVG4wbFF0ZTJmL3djZ2Y4?=
 =?utf-8?B?akFSc1RHWEYxR3ZCcW5zMzNEUWRSY2VrQzF1VkJiTjM4R3UxUHpjZk5mcHZ5?=
 =?utf-8?B?ZXM4TkIvSGpuRXdPNzQ0bm9TZHdsTCs5ME8vOUxYN3RQeVVZVmlVeWdKcW9h?=
 =?utf-8?B?dU92L29UZ3l6WURkd0JPSmczSm42ejFyOUw5TWhqUVAyU01pM2xicVlJdFNa?=
 =?utf-8?B?NHA5Y3RyVGwyVGM1ZU11dFIvYzJxaGtoSXJwNmc4NWZPNGdOTEJLZHVOMERH?=
 =?utf-8?Q?nbN7zKKb6tw34hjmrN/k38Yab?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d548bb0c-0353-4bb9-72fc-08dddf9c5b40
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 03:47:59.8059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzTEiUn+6+uLR1kcm5UBeyCQ8eB6bwF6IPK3LnF2HlF2/13lOLqTL/TasRmWHgdqNES5MdKn+qfiRp50p7oMkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9695
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

On 08/19/2025, Dmitry Baryshkov wrote:
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index a2d032ee4744715b88eb66883edf69bab4c274b0..08cb6958b9154dbc516aeb0623a8fb5e4af1df92 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1136,6 +1136,10 @@ static int lt9611_probe(struct i2c_client *client)
>  	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  	lt9611->bridge.vendor = "Lontium";
>  	lt9611->bridge.product = "LT9611";
> +	lt9611->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
> +		DRM_CONNECTOR_INFOFRAME_AVI |
> +		DRM_CONNECTOR_INFOFRAME_SPD |
> +		DRM_CONNECTOR_INFOFRAME_VENDOR,

Ah, ',' should be replaced with ';'.

Nit: Align DRM_CONNECTOR_INFOFRAME_* vertically.

>  	lt9611->bridge.hdmi_audio_dev = dev;
>  	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
>  	lt9611->bridge.hdmi_audio_dai_port = 2;
> 

-- 
Regards,
Liu Ying
