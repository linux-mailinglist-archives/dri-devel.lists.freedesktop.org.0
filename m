Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0485AED989
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED42310E00F;
	Mon, 30 Jun 2025 10:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J7cDzawC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D7110E00F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:15:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3i0KeD7B1+l2MKuJXbGMfCkTie8+c/X6eKb/hVhegxG4ESb4/CjjdMyo8eVftpNouKEHebnCeNl7wwPa+ashRn4LEhQ8E/tDtCRdR02VcAahlnbv9BlINm9HGkr5xx3JjEnZyQY0oX9HEE8iFvehAQDl9ZcKRIyOp1MiLtQ29B0UdroyJMCQSFzAYwKYc1Udgw21wosHKnJMyKnN3WQViC9GO0T6bFduwsXO6dlLPdYigCrQ5LmKQVdGenlySip4yY4wuBvjd69R6tAUNmdERAHNrvepg5ta4wW6fMrnOxqonu0za5FBTuj5xIEaEif5wfqVsyyZ0wQuV0kt8uxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5TX2KIhR7mCUQ12RM7mZ9JXDB+YpWeRfuc6oqTunLM=;
 b=Qwpmrp9vhkCOtZo4J4G0K45EW5ag5J9bCud9cnw+qgmKfk0T3TN1Pfzsji+C9GoxA1qNklCc2pAU5ELsXnDEn8aojBfMPI1YPfIlukzeUBnCwZv3UPGqPzJ+a7jRWySnWS223D9GNmCz7nqDWwXVqQHt1JfSB9nr83sSV6I5L8BjsVo+IAtG1nIl1sC3mKb1kLiVMoIVNaWuVL1HSk5Xq4Pnr6SPtRlMc3aq484r0o5Ds8x+VTP3CsX6qnHUiPRLqpGYR7XVxWlSRTQtCgFGppaoPjGEdoWX4i4kmEZBRGyg8zX+r/h/PC6d2YXBeb+uEgD1a9ILWlnYB7unh3XopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5TX2KIhR7mCUQ12RM7mZ9JXDB+YpWeRfuc6oqTunLM=;
 b=J7cDzawCY5rWT+JL2cExFQ0sTZwFuON1K1+rcIfcqVPqQSs1MrVQGzOv3lEqH6OzTbx2vK6d0Hu1hquphSWahFk8Y1uKY1HoS3iNcPYFSXBvGKo0IQZvLL7IGDJRidyepMUGM9+bDAN1zPNxd5OAAXIj2TZ5zc6827CIgg+Qx1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 10:15:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:15:33 +0000
Message-ID: <3d40716c-0d2c-4be1-aae6-2c075ea72c1e@amd.com>
Date: Mon, 30 Jun 2025 12:15:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] ttm/pool: make pool shrinker NUMA aware
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-7-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630045005.1337339-7-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0032.prod.exchangelabs.com (2603:10b6:208:10c::45)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: 8010dc63-c11d-43bf-6fc0-08ddb7bf0cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0JJOWpqYmRYaDhleDNGbE5GMW0xR1ZSV09xdHowbk1RaFFCc3dnSFdrdCsr?=
 =?utf-8?B?K0pLanUvSktURFRHQ0JZeTdZcVRjT25pWm4xY3R5V0tKdmhwTFlwbVppYjRX?=
 =?utf-8?B?ZThGdW15alVSSW0zak9WTzF0L1RFNVhjd0RiL09sRHdEZHo2NlZ5M3NzV2x0?=
 =?utf-8?B?b3ZrVGs0aWdnWnhzOHo4ei9mVExxUVFtZVZOVjJyUGwySGdkVzVDTE8xRFhU?=
 =?utf-8?B?eThocjFQTkRDd3JUdEpZbkludDJUUUlnVHV2NXVVd1p0TVFaN0Q2akxZR20z?=
 =?utf-8?B?ZVdOa3p1MFZQbUVTUFQ4OHQ5WXArVGhPL3dxY283MkRXS25rcE53SEhRM0lo?=
 =?utf-8?B?QlEzeTNiSS81aGkwdnBFMWZ5ME5UWDk5cUl2SHdpNTB5VGJiSWFDTXozcFNE?=
 =?utf-8?B?b1FrR3ZWeHJUZEcxSEdPa2svQjNUb3hCOFF6c0hvbjVYRGVqMHZKSThjM3Yy?=
 =?utf-8?B?QjdLL1VVUmlOc2dERGVUV2J1L3NvcFk3ekc1V0x4L2JCdm9qSDZ4V29XcGNy?=
 =?utf-8?B?c1N0TEgyTzFwb0VrRUpNRUgxa0d2KzVZZUlLRzUvd1ViR25xeXhoRW50dlYv?=
 =?utf-8?B?VVlpNkpDYTF3VWxueWh4OWpMRFJkSWdNdjhmRU9FbGkwRnR0cUcwWlJkdWdJ?=
 =?utf-8?B?RjM4MFMyazRSeUkvZHpCQnJsd1FRK05GV3ZEV2RyeHhlVGpNVVV4dmlCUFp1?=
 =?utf-8?B?OW53UFFZck1KU2toWTNxdnZJYkY0cFY0dG5MSGJrWTdrNWw5YnFpRkhUV1VW?=
 =?utf-8?B?TXR1L1Uwci9qMWpCeXBORkxkeUcvZUNybW9wT09DajNBQ0YvYkZRTFI3cEFC?=
 =?utf-8?B?SUZZQlBTM0ZqTWJWUFExc1M1cWdFNVE4ejJ1bmNNampjampUNERBUXhjTDBD?=
 =?utf-8?B?YTZqcllnZEluNVRISGlsWG5PZjZ5M2V2c29JVmZVdUozOFFNNktSSmR2by9I?=
 =?utf-8?B?MXdQeE9HSWU5ZzRsZ1ZVK0NHYmZIeWMyVWJudEZSZm5XRzBWWDBqN0QyYm5q?=
 =?utf-8?B?MFdJMU9qWk10SzZLYW0ySkh0Q0FWNUZ4TWRmY3l0Y0xNbHdmbXVDTVFTN2Qr?=
 =?utf-8?B?OTBBQUlnbGcxeGFhK3pxZlB5d3Z5a2VMWE12ZTMwZVo4UHVNNURMU0hBeG9Y?=
 =?utf-8?B?YlF3ZGl1cWNZVWxKYm9jcFFMcVVGWGNEUnk4Qks3bzRTVzY3WEVzS09tLzho?=
 =?utf-8?B?VkN2YUFua3hJQVo4N3o1UlVXS1hVRDJJQXNJSllxaVZac3FUVHBLbjNmT3px?=
 =?utf-8?B?Zko5a3BKcHpTNWkzeGlHK3FJbUo5QTZuVURPcDBqQWlzcEpYNVdnUjJkNG9o?=
 =?utf-8?B?RW5KUktWQmlsdzdoVXdFM0ZlZkdpdFpBRzRDOVRrbHBaOXJGYnhuZURJOGY2?=
 =?utf-8?B?Unc1MVdxcUFHU1grM0ZaaVB0MHNVN0ZwWkUvQ1NlQlFuV0JxbjR2ekU2SWh3?=
 =?utf-8?B?ZUNId0J6OHA2ZmROQklsWGhkenZoRGdUVXUvMEhPcmpMU1pJRjBMRDQ1cE1T?=
 =?utf-8?B?Y1BzU1RpWDJzZ3VzZEZHSnpTdmhqRWRRa3VOOXIrY1lyZGFObjc4ZTlnSVpU?=
 =?utf-8?B?WjhiMWxkd0h0d0w1M2FXY0tjTDBOOThnTXN4Y2d3VVlwS1ZBandwbk5WVHd5?=
 =?utf-8?B?WGJ6ZmhNQ0lwTkJsWVFXbHhUWFZpR1NWK21UL0hXV2FWQ29YVnBwYStFT1RL?=
 =?utf-8?B?eGV4M2ZFM09DR1NZYy90Vk02YTRNbGJRTHJWZDVsZGZzT2hhZXlFT2pvNnVv?=
 =?utf-8?B?Q2d3dkFqRndQNFpkcm16bHVvbTk2dW9aSjRmMWpRTEdDbC9CelZVVTNhR2xY?=
 =?utf-8?B?SE81cmxDeDNGZzE0d1YxQ21UOGo0dXhqY1V0VzVTNUNxakprZGVLLzFCTzRt?=
 =?utf-8?B?N0hIR0pGSkNncXZpamJiVW9RYmVHc3hyaU5PbXlvUmRaL2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU9nMHBNQ0tzQnBZNU9ZRzZRcEZSdVJQdTk3STJEOXUxV2lsUlVoKzdPUjZN?=
 =?utf-8?B?aDQ5cG11U2U1ZXRpQWs4b0MyTUM0OEJkajhPdXhrUDdaUDBBa2QvZzRJbTV3?=
 =?utf-8?B?SXhObER4VTQyWDNPN3RQeWhMZitNYzljcm9acFpJcmVBZ1lKZzNzUU5xQWhR?=
 =?utf-8?B?N2RhSFlISHFVcXM0cUtlRlVBY3NoTzdlMXpVT1AyRWI4cU15T1VmaG93ejM0?=
 =?utf-8?B?eUV3dE5GZEFtd01GTWwvMXFwWmRxcUtQTlpaZjBveEt2ekxxTGErZDJRSk50?=
 =?utf-8?B?a0wyVUZDZVNwQTJVcTBaUDUxZmZNNFY2My9oRjd1S3F6T20xN2lHKytvUm9p?=
 =?utf-8?B?NmJWdUZYYVhoNzV5ZmF5VDRRMWM4a3BRSmNBcHZFNzhoL2hCN1VIR01GNFNz?=
 =?utf-8?B?Mk1HSFo4TzQrdTl6K1piZ3U0aEJWVitkZ3l1c3hLOGhxR280eG5zVm9obTJj?=
 =?utf-8?B?Ym5LUis0UHRydVFaYjVnOWlGZTAwRS8venN3WUh1ZVplMWUwL25NWW9WN01v?=
 =?utf-8?B?eStCVFRVeGxMdXVnSU1uTDk3TU1HZmJ5T0F2L0JrRllwN2hnZjZiVE45VFgz?=
 =?utf-8?B?MW5GU1crZkhPQ2Z5Rmg4amx2dVc4VW10WlVlV2FPdnpwMkswcWRLcU1XNmdC?=
 =?utf-8?B?aWNFb2V5U1YyVWRPcGRFUk9VNXRoR05JLzNTbVJDREtuczJnSjNyUjFtU0p4?=
 =?utf-8?B?UWNmaGVqM0V0bEF5UmVOY2E0OEw4VWhTUWw2TVgyMC8rUlltUnc3Q3k0MG5G?=
 =?utf-8?B?N29QSEFEOFMwVGZINmRjbjR2dGpuNzMwZUhlaS82MEVYNkphNzlhSGQ3dnhC?=
 =?utf-8?B?SFlCSTlhSG9wL2JKYSttY0oySEp0SENsTEY4U2tDRVpjWFRCclk3TXY3eCtC?=
 =?utf-8?B?MW1xVWZLdmlPaDRzdVRKMndreVZyYVVpMERMWkpNa2NFYWJWNG54N2hmWHJs?=
 =?utf-8?B?WHk4WGxKV1BtR003WVdZOG5BS3BLSjB0OCt4TDQ3Uk14a0RGbnVhV1BSVTRh?=
 =?utf-8?B?by9mN2lJM0NtOGxJeGhWcVM1dTN6bFo0VWppSUxVQWpkNWF4RUJuRFVCYURK?=
 =?utf-8?B?RDVyTjZmb25NQ3JYdWRjZGZ1WTNCbW9CUjFjUFpKVmFNUXBpdWFkN2VkMFlK?=
 =?utf-8?B?VFhzcTczRU8wZUp6ZUtZeTcwZGQ1L3VOZ3ZJQ2s2aHlmN3dnbVBhcEtkYlI1?=
 =?utf-8?B?aENTN2RmdnBiZHRhUWJjamV3WVdzekQrOEFKbTluajYvRzN0RjVxVXFObmww?=
 =?utf-8?B?ZXJWTzhBMUwzKytybzExQTVYQ2l3THM3ZlN5MXJ1ZDFqTlpHZEhzNndySy92?=
 =?utf-8?B?YmxOOG5CUURlMWlsWnp3VFBlUVNsWE5ZNmdHblZBM1lNb0dpWFBUaHo4NHZN?=
 =?utf-8?B?TFFVOXhxWGdyZ2lwOGg4aHVYMFV5cVRNSUFpU3dGcThORmgwaFZRM09pUzBN?=
 =?utf-8?B?ZWd2V3R2RFlNK0VOM0ZDZElQeWsyWktvcXZiNXZtTzdSU2F2Uk53MEVtSmNO?=
 =?utf-8?B?QmZoclZwLytyQlNyLzVSZGZsbVh3WTVycXNpWXBJcUdBN01abXpjblFwK1RK?=
 =?utf-8?B?MVhHVXJqQ0pwY05KWTcySm95dWRZa09YU1JhOUt5MGtzVm5JZXRQSThrMGY2?=
 =?utf-8?B?clI1U0Z5RmdVb29tU2ovRlBYSTRvTitGRWVJa3FSQmNQZFRITkR2bzNxaEJJ?=
 =?utf-8?B?UEdZK2dmNzE5R3ZNb0RjbkxrQ2lGSG5xTlcvY1k1SVEwL0tPdnAxVzRnSDcv?=
 =?utf-8?B?b0tpZUtkdmJNQnQ1S3dVL1paOHpXdWJPSU9uSnUrZ2NrWmtvMFZudUdEZzhY?=
 =?utf-8?B?b0kvWWJaU0RzVnJGZk4zRXdEMnpEdVNEZzhVWDFYbXdPUzBFRFBBeHNlZ3hR?=
 =?utf-8?B?alJBTHlURThCbmZLOGZFUWlTRGtsb0ZxMnJHeXZFMHp1K1o2b1pDVWlMdjNa?=
 =?utf-8?B?c1RwbzdWQ3hlMkovT0tHVUttdkk2OUJwbDdwR2hCOFJUcjM4TFFoMlB3OHJB?=
 =?utf-8?B?WEF4WGtsbEhONitJSUc0bEZqR1FQdzFlcU5rby9lK2dLMWNGWTFud3ZhMzZs?=
 =?utf-8?B?ckRRSlRvWDZwbVhjUDRXaGdjUGh1U0lqOCtLZ3N6RS9jWWJiV0Zza2dQU21P?=
 =?utf-8?Q?M6JSPRAoRS626k2yaxWBfKX29?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8010dc63-c11d-43bf-6fc0-08ddb7bf0cb8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:15:33.7891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNXQN2nWk+WU+Egw/iVCvFFCYnoEBW0QXt1HBIH6GV10f3UV2K/KgDmtW35AGbA0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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

On 30.06.25 06:49, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This enable NUMA awareness for the shrinker on the
> ttm pools.


Looks good from my side, but the last time I suggested this Sima explicitly told me that it isn't very fruitful. Adding her to comment as well.

Christian.

> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Dave Chinner <david@fromorbit.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 38 +++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 95bbbc843b97..66cd963b24dc 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -416,12 +416,12 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  	return NULL;
>  }
>  
> -/* Free pages using the global shrinker list */
> -static unsigned int ttm_pool_shrink(void)
> +/* Free pages using the per-node shrinker list */
> +static unsigned int ttm_pool_shrink(int nid, unsigned long num_to_free)
>  {
> +	LIST_HEAD(dispose);
>  	struct ttm_pool_type *pt;
>  	unsigned int num_pages;
> -	struct page *p;
>  
>  	down_read(&pool_shrink_rwsem);
>  	spin_lock(&shrinker_lock);
> @@ -429,13 +429,10 @@ static unsigned int ttm_pool_shrink(void)
>  	list_move_tail(&pt->shrinker_list, &shrinker_list);
>  	spin_unlock(&shrinker_lock);
>  
> -	p = ttm_pool_type_take(pt, ttm_pool_nid(pt->pool));
> -	if (p) {
> -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
> -		num_pages = 1 << pt->order;
> -	} else {
> -		num_pages = 0;
> -	}
> +	num_pages = list_lru_walk_node(&pt->pages, nid, pool_move_to_dispose_list, &dispose, &num_to_free);
> +	num_pages *= 1 << pt->order;
> +
> +	ttm_pool_dispose_list(pt, &dispose);
>  	up_read(&pool_shrink_rwsem);
>  
>  	return num_pages;
> @@ -784,6 +781,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  		pt = ttm_pool_select_type(pool, page_caching, order);
>  		if (pt && allow_pools)
>  			p = ttm_pool_type_take(pt, ttm_pool_nid(pool));
> +
>  		/*
>  		 * If that fails or previously failed, allocate from system.
>  		 * Note that this also disallows additional pool allocations using
> @@ -932,8 +930,10 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>  {
>  	ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
>  
> -	while (atomic_long_read(&allocated_pages) > page_pool_size)
> -		ttm_pool_shrink();
> +	while (atomic_long_read(&allocated_pages) > page_pool_size) {
> +		unsigned long diff = page_pool_size - atomic_long_read(&allocated_pages);
> +		ttm_pool_shrink(ttm_pool_nid(pool), diff);
> +	}
>  }
>  EXPORT_SYMBOL(ttm_pool_free);
>  
> @@ -1190,7 +1190,7 @@ static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>  	unsigned long num_freed = 0;
>  
>  	do
> -		num_freed += ttm_pool_shrink();
> +		num_freed += ttm_pool_shrink(sc->nid, sc->nr_to_scan);
>  	while (num_freed < sc->nr_to_scan &&
>  	       atomic_long_read(&allocated_pages));
>  
> @@ -1323,11 +1323,15 @@ static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>  		.nr_to_scan = TTM_SHRINKER_BATCH,
>  	};
>  	unsigned long count;
> +	int nid;
>  
>  	fs_reclaim_acquire(GFP_KERNEL);
> -	count = ttm_pool_shrinker_count(mm_shrinker, &sc);
> -	seq_printf(m, "%lu/%lu\n", count,
> -		   ttm_pool_shrinker_scan(mm_shrinker, &sc));
> +	for_each_node(nid) {
> +		sc.nid = nid;
> +		count = ttm_pool_shrinker_count(mm_shrinker, &sc);
> +		seq_printf(m, "%d: %lu/%lu\n", nid, count,
> +			   ttm_pool_shrinker_scan(mm_shrinker, &sc));
> +	}
>  	fs_reclaim_release(GFP_KERNEL);
>  
>  	return 0;
> @@ -1375,7 +1379,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  #endif
>  #endif
>  
> -	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
> +	mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
>  	if (!mm_shrinker)
>  		return -ENOMEM;
>  

