Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5F4A4DCE3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98AD10E3EF;
	Tue,  4 Mar 2025 11:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="a1K/DQf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2051.outbound.protection.outlook.com [40.107.249.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F53E10E3EF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:47:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8czsFs1vOHSzBJc5PKVRtHq0iYJoaDPa/uUipmlQr5KCdSqfqWSoGTbnySxoIxVukp9MqwHhK9t+jxWxQf5aiSOzaPl080dtciCUEsaIKWQiBNUa0fnZsQBC0ydNiSz7tDHbePZfRbAwqMFDWsT4lKXP9+QTsyrcZGiNq150s2HENttGUG0nSl/hzbyhI8L0zk936P8aDKHLfoIz3kDBH6aLKfeSRVmYgilL8EdyOc+zZw9wqI2YtVtCWR0MBNkFwTfRXEvEJ6IJ3djxdeB3i7r7r7Awa7j9YzYEZQSb6isfbwH4Hb4fuT/DlNWq4bnmN8IzGf0c5HuzPWFwyHyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FQWwSMk1pXjJ5rv4h9JyeEI66ifEq7rayNCQ0WpAZw=;
 b=RXkDYl+VchBi3xYCA1IhdvIA/GCCFyC8zuLvXx4cw0VMyumQlb+28vctLIPQTwpG2pNlLm205tNxUQeWVSvZuw1C5eMZP9O/ezLWxPZSKEdReQZH+GXYXbaTUL9tcNNEB7hr/2eoY+OJXvStTIttQVsTUlvpcBdaBm/IwcjuNle3NXr+ufYqzOx4eHQxsFaZOPV/yLwQtvPyJqhR6PMAztSZCh9S0NxWb66Ot49J1K+QGFhB8toIIU5WoSOYw5yOyFGuipcRTN7gSB/ILmUmWF5C658hMSQv44zCpwaXEfziIsI9RC84wWtvSExBD3E2GKb91lIUvjvrHVvV3cEm0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FQWwSMk1pXjJ5rv4h9JyeEI66ifEq7rayNCQ0WpAZw=;
 b=a1K/DQf7Exs5Sanymt23LCFr4QOlo69DY4pN+S3QUrI3wvnwUIhmA6yy8FXhXM9abHtSn4ckuG3NYgFWU+v3Y8GYMo6sGfMWtHfz+/8MisGsVP4D8p40mhd0tPED2HSOFTCp4p127PNF01HZIVHisKhapImrp7kdPmefqsykdww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10686.eurprd04.prod.outlook.com (2603:10a6:800:25d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 11:47:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 11:47:00 +0000
Message-ID: <0e54f70a-0b07-4ead-96fb-add2bbdaf787@cherry.de>
Date: Tue, 4 Mar 2025 12:46:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/rockchip: lvds: Hide scary error messages on
 probe deferral
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250301173547.710245-1-heiko@sntech.de>
 <20250301173547.710245-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250301173547.710245-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6f8bf8-586a-41a7-08b7-08dd5b124633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NElLU3FRZDNZU3FHM0VQeFFUZngxWjVqSnhScFR1RDFxbUw2NDZtSXk0SkVw?=
 =?utf-8?B?aXNCbVhGeVZ0VGpkaW9QOGZ3Q0dXKzhyTlkwR1JYWW12Yi9JVW1Ia3ZyNmVC?=
 =?utf-8?B?Z0lVUVpkQUpRUWM3NWFpc2lGRERybUI0ckQ2bVhIWnVTN0U1eFJ1OGQ5azZK?=
 =?utf-8?B?VkxsczZjeENUNnhqTlQ0eTNoMFhtZXdXNnNGZkNDU0Q5QmxDUVpTYUlnbXRR?=
 =?utf-8?B?Mm1JZUYrZVVreU0weUNKSzN6NTNGd0FadUN1MGR1Q2VXNTVxZVNHNUx2NURJ?=
 =?utf-8?B?MU5JMlMwdTZMVnhieUpHZ2Q0WlhLVnVlSWxKd0hzRHg1djdod0ZvQ05sM3FM?=
 =?utf-8?B?WWVkMElNNDZPZytXZldYVnJ2OEVRMlBEQ0czakIrY1FSamFzd3NjMDhnc2lW?=
 =?utf-8?B?OHl2RnBMOU5mMXAxaFFnTEVEdzM1d3orVmNiK1NXdGxTa1dCSmlVMHQrb3A5?=
 =?utf-8?B?VHFQY3Faa1ZCc1YrNkpSYUZtcTBabCtXWXVGck9OZkMxZlFxWUVVQVpYOUFp?=
 =?utf-8?B?NXdqNllMTW5ta1NjMXE0L0t1aUE4cSs1V2JXTGlXd2NSTERoeEZEUWNrVnV5?=
 =?utf-8?B?dUtOOCsrRmdqTmtxN3FBK1AvWis4ZnVKeDJCbWhETkIxZis4enRGbTlrWGxN?=
 =?utf-8?B?bDFCQlhKR25ZQXJoK2J0cjdSSjJuV1pWajJzQ2NtOERacTR2UEJvK3JqS3R6?=
 =?utf-8?B?UzZOSFFaOXR6VVRQWW5pV0o4M1FWdHFpTTMvSUYwUUszV2JSTmVvU2YwcWRU?=
 =?utf-8?B?K2ZMZURneGNNdjQwVzEvYWFpcnFkQlVRYk1pcmlJVHUrL1dLcXRqcFhhZWJo?=
 =?utf-8?B?WUlNcVZTdnJGVURkTDR3WFhNbnRkY0drbHpacHBHUUREemtkWFUyRVNGa3hM?=
 =?utf-8?B?cG1oUUF1bk1WWkNWeUpvZktGU0JjMmhUQWkzekdNMTZxeGh5QXROQTd1eTlh?=
 =?utf-8?B?d3Y2b3c0Z2gyWUNNM2Y3R3J2OU1VWXk5UHV5L085S3haV1ZiWmNIYi90OFNm?=
 =?utf-8?B?NXkzQXBWVjhRMUNhUlZETlBWOWdKZ2hwRzhjcEtNNTNjTHVSWkpFbVRveWhp?=
 =?utf-8?B?VFdsTEpZT2xYZzVoYzQ3S1VCdUw5THk4TEswV0hTZUZoSythZmU3QjhlYURJ?=
 =?utf-8?B?MDJZMFlFc2tEa3NsczR0eGoxTzlmQWc0NS9IUG5UU0I5dTRzZEJwVXl2Y3h2?=
 =?utf-8?B?dWZib2ZOR0dKd282akMwaHZOR2hBbDdWNHd3RFVoZmI4QnJzdmpiT2xjQUVD?=
 =?utf-8?B?VWtjNElseGc0TWlDNlB2bmtoUG5CdFBQeFQyWlZwa2N6bzB5cXNCRDlleVR5?=
 =?utf-8?B?aTNmYzc5TTIwakVTVEx1UzZMd29rTmM1N0VlUStmalRCSVdUdVd0N0tndklx?=
 =?utf-8?B?T3RrcTBFaXlCZlY4OUFialFmbUNNTW9WNEJ1T1hCV0NmdFhjMElUeTdyOXEz?=
 =?utf-8?B?aDd2UllzeWdTYWRoOVFEeVZPRnFRTURBVGo1bFBVMWVneHBIc2k0VVoxQ0JC?=
 =?utf-8?B?L3pDQkJPVEZENmZvczNqenQzU2JNTzFxRUpuOEQ2NUVHMVd4ODVIL3o2U3R6?=
 =?utf-8?B?V0NHSk5JQWZoREpjdERQcjJna3FaMVU0L2dJanlzLy9qbkdlWFBEMmFTc2hr?=
 =?utf-8?B?RitBK2NTT1FoQ0phdUNnVjRWQldKRnprUnUzRnFlQ3diL0RTRXZkU3lrcXZL?=
 =?utf-8?B?dDE2MDB2NEV1TjZzQjMvWWViYVNEdWRwN3FoNW5tV0d5ekhDV2VrU2FJRjY3?=
 =?utf-8?B?MlNqQU5PRXVVTTlERE1oM3FDSUdGWnNiUEgzWkZHSktlSElqS2F6MVVaSEJy?=
 =?utf-8?B?eHJrWXhUZWNhb0R6YjV0d3NXWDAySmdHcGFmY0xISUFBYWZCRy9ma2RHSm5o?=
 =?utf-8?Q?Q+X63SHQqslTJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8897.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnpNS0ZEeEZkOWhSYkFUcmNWWVpXUDNjWUFEYktzUHlEV2pXRzRpTDByMGk1?=
 =?utf-8?B?YVE5VUVieVc0Mks0cUVCWVZEM29YTlFIUHh6cUZNYjZFYXdrbkM2VTRlRVAr?=
 =?utf-8?B?TEt3RkhkdUdKdWs0OXBOcGswTHNYanBzNGNDTEthb20rK1hMU2J4eW5TUEQ2?=
 =?utf-8?B?WldvR1YzZis1a1l0Rk1xNGdYNVNRR0xvR2JYVHo1UWpicW1FSkxXN0ZvY3Zw?=
 =?utf-8?B?Y3hsajZnVlN3TmZnQ1F3T1dEZHFsSlN1MmV2ZFQ2WE5GMHRNK3Nnd2krV21w?=
 =?utf-8?B?UW1reTYxZGRZSkJIdTN1c0k5V0VJalBoR1NudVVQVE9tVXpIdnJjblEwUGdt?=
 =?utf-8?B?UlV2VkhQVW9aazZzT3BkUndibjRxa1A2RExBemxHVGlkekllRkM1Q2ZxZDF6?=
 =?utf-8?B?Z0ZhZHJ4SFNnanJQdm9RVGNLUjdRNEFzNmVOSXdmV3ZtNE1SUndXNEV5TVAy?=
 =?utf-8?B?Mjl4aldvRVdxbmQ1enFVRitMRW1vL0JwbGc4WWdHRmNVNzFDQ3cyMFF4MUVy?=
 =?utf-8?B?aUFmcU5KaXExZmh0WUV5UDJnN2ZBU0JyTzZNMHYwdWhqYWQvcUhGREI5aEw4?=
 =?utf-8?B?ZVJzV0R6L2Ezd0NrdHd1VExPV05qdjNUWWJsemRyT3A1K3FZL1NRUlFlcURy?=
 =?utf-8?B?RHpha3AzbVk2Z2tzQkMzUHltRS9QNkRnY3Z4czViamkzR0hVOSs3OUN6bmph?=
 =?utf-8?B?QzlhOER2TlRxMUJkTnFXZ1pJbVdGaUZjL1k2QTduelN0UzYwSVJFWS9IOWRD?=
 =?utf-8?B?dXNOc2hZMDVMUzBLTXZIV1FvYUN1TjVTTXh1UndvQ1JwMU9DSUFZN0ZiSTM1?=
 =?utf-8?B?aDNGZDJhU0o5dEV1NW5ZbWpTUU5qVEZaanlka3RPZWg1ZHJkU1h3L1B2UE9C?=
 =?utf-8?B?WDBCYVRIbnhKVS9XRStwWEhrakVDVTZVNExxUnI4emxoTENheFBVWGRUWGlk?=
 =?utf-8?B?cnlaYi9qZVU1c2RxWUpNaFFyT3BGTWhqcXBrcEpkeDJIQ0dIRFNyRHU4eGlR?=
 =?utf-8?B?ellIczI3Yi9UWWVZeStPTmtTc1FEc3BmYVF1ZG9EenpsbkVGdzYvSTlYNEFU?=
 =?utf-8?B?YkxBYmVkb2FGbE1HdkptRHo1RHY0LzhyS051VjlTRjYvWk50bWdKb3RvcFdY?=
 =?utf-8?B?L2tSNzRPNEtHY2x1YnFYTkV3M3ZySVlaTUhnUFR6ODIvbGZWSnJXaE9vV1ZF?=
 =?utf-8?B?VVg3d0I5V2dUV0k3RGdHelFSaU9LK1VqVmp0WXBiWlVUaGxmelhMeXd4cUdH?=
 =?utf-8?B?OWlBRUh3UVBQd1pkQjhrVWFaNk5nU1FxSG5idWhnVWZxcjZzS1JmR3hOay9j?=
 =?utf-8?B?VXd4R2F2VFBCZWVub1h0QW9LVGExQlNmd0srT09rcGkyTzZsYzlPYkR1ZDQv?=
 =?utf-8?B?am1HbUlIZXVJZFBqVERYMm5GWHFoSWtNUmVGRElmZjBlbHBHaGdJdEp4RUpu?=
 =?utf-8?B?WEhmbUsyRUFhOVRhR1diMndkSHhxOGc3UkJtZDZTS2doT0pWMU9PR0NRdkJF?=
 =?utf-8?B?RjBvMWF1amwwVTZLTGxaR0pLLzlXbnQzblpPbXJsaGgvWmFwT0JPckFiWXZy?=
 =?utf-8?B?bnp0QTRRRXhBaDFUaXl1UzVrQ3YrWk1QaWtXYkdFRDlGT28vSytCekViM0RG?=
 =?utf-8?B?aFBqMU9GUlVSazlLUjhhV3V2ZSs3NkJDTGk2cnZ3b3ZVOTBQN0x6N3BaMHVv?=
 =?utf-8?B?bDJ1eUdpWjFHWTg2V2JVbEo3cCtQMDBIWld5YWI2MzJ6Nk1SOGNZQ1BaY3dM?=
 =?utf-8?B?T1UzMHZINy9sRXJTNk9zd09hSGJtODhGS1ZscW9pOTMzUEpWNHhPK1ZvSUxv?=
 =?utf-8?B?MUd3a2hWV3hjZjA5V3R3MFEzZkRGVUwrRENRRUl5YWIxS0RKd0ZLdHRGUmpB?=
 =?utf-8?B?bml5S2MyQ3NwdjdqL2lKbSttTUZwWStSSzR0TUkrYTNxbkNQUDcyYkxRRXJX?=
 =?utf-8?B?VlNjK1d6aCtQcmc5R2Y5NjdwaFBtVUFxR2dJOUFvdm5uT3NEM3B1RFkzY2lB?=
 =?utf-8?B?VmR5UHB6QS9LVHk1Q2JITEZZTUtxM3kyYTdnZVJLVFhzTWYydjB2aFV1MTJ5?=
 =?utf-8?B?ck50bGdqTHcyQUdDQllzdzRod3luU3ZVNFZMOWxBMFQ4U3FmYkYzckJ2Rmx1?=
 =?utf-8?B?T0FRbVlTWkJmbHBlVlhYb0dTcWRqKzE5UEFIL3Q5dWt5d2thUWhxbGVkY3ZS?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6f8bf8-586a-41a7-08b7-08dd5b124633
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 11:47:00.3146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvlW9GC7SAwDVYbeg08CgbhkAkT1en9wEc0NMpFOKeOyIVVXfPa5ZsCFpVOv/Myb3cBBeBSWS7C7JbQhiW2csyTwtofLYMkhmrWImo7rB4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10686
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

Hi Heiko,

On 3/1/25 6:35 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Commit 52d11c863ac9 ("drm/rockchip: lvds: do not print scary message when
> probing defer") already started hiding scary messages that are not relevant
> if the requested supply just returned EPROBE_DEFER, but there are more
> possible sources - like the phy.
> 
> So modernize the whole logging in the probe path by replacing the
> remaining deprecated DRM_DEV_ERROR with appropriate dev_err(_probe)
> and drm_err calls.
> 
> The distinction here is that all messages talking about mishaps of the
> lvds element use dev_err(_probe) while messages caused by interaction
> with the main Rockchip drm-device use drm_err.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   drivers/gpu/drm/rockchip/rockchip_lvds.c | 61 ++++++++++--------------
>   1 file changed, 26 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index ecfae8d5da89..d8b2007123fa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -453,10 +453,9 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
>   		return PTR_ERR(lvds->regs);
>   
>   	lvds->pclk = devm_clk_get_prepared(lvds->dev, "pclk_lvds");
> -	if (IS_ERR(lvds->pclk)) {
> -		DRM_DEV_ERROR(lvds->dev, "could not get or prepare pclk_lvds\n");
> -		return PTR_ERR(lvds->pclk);
> -	}
> +	if (IS_ERR(lvds->pclk))
> +		return dev_err_probe(lvds->dev, PTR_ERR(lvds->pclk),
> +				     "could not get or prepare pclk_lvds\n");
>   
>   	lvds->pins = devm_kzalloc(lvds->dev, sizeof(*lvds->pins),
>   				  GFP_KERNEL);
> @@ -465,14 +464,14 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
>   
>   	lvds->pins->p = devm_pinctrl_get(lvds->dev);
>   	if (IS_ERR(lvds->pins->p)) {
> -		DRM_DEV_ERROR(lvds->dev, "no pinctrl handle\n");
> +		dev_err(lvds->dev, "no pinctrl handle\n");
>   		devm_kfree(lvds->dev, lvds->pins);
>   		lvds->pins = NULL;
>   	} else {
>   		lvds->pins->default_state =
>   			pinctrl_lookup_state(lvds->pins->p, "lcdc");
>   		if (IS_ERR(lvds->pins->default_state)) {
> -			DRM_DEV_ERROR(lvds->dev, "no default pinctrl state\n");
> +			dev_err(lvds->dev, "no default pinctrl state\n");
>   			devm_kfree(lvds->dev, lvds->pins);
>   			lvds->pins = NULL;

Should those be dev_err if they are not breaking anything? After all, 
the device will actually probe? Maybe dev_warn would be more appropriate?

Maybe a separate patch since we had DRM_DEV_ERROR already, so switching 
to dev_err in one and then lowering the log level in a second would make 
"more" sense?

>   		}
> @@ -547,11 +546,10 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   	lvds->drm_dev = drm_dev;
>   	port = of_graph_get_port_by_id(dev->of_node, 1);
> -	if (!port) {
> -		DRM_DEV_ERROR(dev,
> -			      "can't found port point, please init lvds panel port!\n");
> -		return -EINVAL;
> -	}
> +	if (!port)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "can't found port point, please init lvds panel port!\n");
> +
>   	for_each_child_of_node(port, endpoint) {
>   		child_count++;
>   		of_property_read_u32(endpoint, "reg", &endpoint_id);
> @@ -563,8 +561,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   		}
>   	}
>   	if (!child_count) {
> -		DRM_DEV_ERROR(dev, "lvds port does not have any children\n");
> -		ret = -EINVAL;
> +		ret = dev_err_probe(dev, -EINVAL, "lvds port does not have any children\n");
>   		goto err_put_port;
>   	} else if (ret) {
>   		dev_err_probe(dev, ret, "failed to find panel and bridge node\n");
> @@ -581,8 +578,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   		lvds->output = rockchip_lvds_name_to_output(name);
>   
>   	if (lvds->output < 0) {
> -		DRM_DEV_ERROR(dev, "invalid output type [%s]\n", name);
> -		ret = lvds->output;
> +		ret = dev_err_probe(dev, lvds->output, "invalid output type [%s]\n", name);
>   		goto err_put_remote;
>   	}
>   
> @@ -593,7 +589,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   		lvds->format = rockchip_lvds_name_to_format(name);
>   
>   	if (lvds->format < 0) {
> -		DRM_DEV_ERROR(dev, "invalid data-mapping format [%s]\n", name);
> +		dev_err(dev, "invalid data-mapping format [%s]\n", name);
>   		ret = lvds->format;

nipitck:

ret = dev_err_probe(dev, lvds->format, "invalid data-mapping format 
[%s]\n", name);

>   		goto err_put_remote;
>   	}
> @@ -604,8 +600,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
>   	if (ret < 0) {
> -		DRM_DEV_ERROR(drm_dev->dev,
> -			      "failed to initialize encoder: %d\n", ret);
> +		drm_err(drm_dev,
> +			"failed to initialize encoder: %d\n", ret);
>   		goto err_put_remote;
>   	}
>   
> @@ -618,8 +614,8 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   					 &rockchip_lvds_connector_funcs,
>   					 DRM_MODE_CONNECTOR_LVDS);
>   		if (ret < 0) {
> -			DRM_DEV_ERROR(drm_dev->dev,
> -				      "failed to initialize connector: %d\n", ret);
> +			drm_err(drm_dev,
> +				"failed to initialize connector: %d\n", ret);
>   			goto err_free_encoder;
>   		}
>   
> @@ -633,9 +629,9 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   		connector = drm_bridge_connector_init(lvds->drm_dev, encoder);
>   		if (IS_ERR(connector)) {
> -			DRM_DEV_ERROR(drm_dev->dev,
> -				      "failed to initialize bridge connector: %pe\n",
> -				      connector);
> +			drm_err(drm_dev,
> +				"failed to initialize bridge connector: %pe\n",
> +				connector);
>   			ret = PTR_ERR(connector);
>   			goto err_free_encoder;
>   		}
> @@ -643,8 +639,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);
>   	if (ret < 0) {
> -		DRM_DEV_ERROR(drm_dev->dev,
> -			      "failed to attach encoder: %d\n", ret);
> +		drm_err(drm_dev, "failed to attach encoder: %d\n", ret);
>   		goto err_free_connector;
>   	}
>   
> @@ -706,24 +701,20 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
>   
>   	lvds->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
>   						    "rockchip,grf");
> -	if (IS_ERR(lvds->grf)) {
> -		DRM_DEV_ERROR(dev, "missing rockchip,grf property\n");
> -		return PTR_ERR(lvds->grf);
> -	}
> +	if (IS_ERR(lvds->grf))
> +		return dev_err_probe(dev, PTR_ERR(lvds->grf), "missing rockchip,grf property\n");
>   
>   	ret = lvds->soc_data->probe(pdev, lvds);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "Platform initialization failed\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Platform initialization failed\n");
>   
>   	dev_set_drvdata(dev, lvds);
>   
>   	ret = component_add(&pdev->dev, &rockchip_lvds_component_ops);
>   	if (ret < 0)
> -		DRM_DEV_ERROR(dev, "failed to add component\n");
> +		return dev_err_probe(dev, ret, "failed to add component\n");
>   

Should this rather be drm_error? I believe this is related to the 
Rockchip DRM main device?

Otherwise looks good to me,

Cheers,
Quentin
