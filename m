Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0701A91EFF5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 09:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DC110E53D;
	Tue,  2 Jul 2024 07:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z1JtHh/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5933710E53D;
 Tue,  2 Jul 2024 07:21:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5WBaNcctcMAhwh1jj1KItB4qEltxAKmHkR3IeyO58C32J4x9oCZ43RI8q8Hejyj12sDkEBCrRjDw5v1qpH2zLX97YZ3lOrF6sQjaKt6GNvW8jhfkY0wMrmAmOSik+vwH+0lYAf4XpP+eme8o6sbHdK4OIelkTSBTQxoykjvrUnL+zjrB49AATAR5pV8LYhzYVfHj2KUC4IRedAAQCeMHNPTXWzq8ohxNX9oqHVxE3AOW9Zkp5JamH0MFEFYDFeKOCGQlpQp6qKA0utjt572Q5HkSeQWT6txCvn/K+cIN9j5EGnEsMFeOiGpeQxa3tXdCtW97I85fNgwKRJu/LZ64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ac7pRg1IsVrdwTwehAmv3dpc/qrvWvYhio8HTbpz7Tk=;
 b=LMUy35SM6Pq0phPCZOIhT5XwX3kVm40fm6jxbafT9K3BhE+1Im0B+natCgNS4cemBaA+nwN8gDYs8upEXrbas83dPlwnHajALeLjiM0VBG0cLzDBfvckrM5DZUntQYVdHJFAo5uthWfW020RLSdqnQXunbw1OUW3eVLfgmZb88l6j0OrEH18rfQWTbpCaO6yaUWnvs8chFvjwJBYw25ynNOdLxRiTcoq28QqFYsgz3cuGSE63koeCDWQhUTeD9PLBnegyPwOCgAYFxSXTREKIFbH3Xpo00T8ADllHyyr+hFasBiM2LFP1uwGQ6yl0o5PH4sT/AQjv6i0W9g/bPzYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ac7pRg1IsVrdwTwehAmv3dpc/qrvWvYhio8HTbpz7Tk=;
 b=Z1JtHh/yiBjg0dQjlylTJjJBKy8ab9EwVqKGhI69K6Soiqiv7j9gVilh656Gf/ivI51h/2GlHFcGN1IGK4cnorsR5n1MSCUz/AXHQfJf7Tja+NZQEBR8EsPy9MUYngtgT/gUKzMaTE5Q0Uf8umEKWd0O29t6oonsZm3nwFxsbhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7989.namprd12.prod.outlook.com (2603:10b6:a03:4c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Tue, 2 Jul
 2024 07:21:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 07:21:47 +0000
Message-ID: <534aada9-45c8-4ec8-85c9-8b28bd676c55@amd.com>
Date: Tue, 2 Jul 2024 09:21:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/etnaviv: export client GPU usage statistics via
 fdinfo
To: Lucas Stach <l.stach@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
References: <20240701171447.3823888-1-l.stach@pengutronix.de>
 <20240701171447.3823888-4-l.stach@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240701171447.3823888-4-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0429.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 744e5793-b3ac-4e00-a260-08dc9a67a1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHkwMUFQSmQ4c3NNU083R1o5OHordWZQbmd2SnB4aEJtNW5uVm9oRFZwMDNS?=
 =?utf-8?B?M0hPUGVsN2RGMkxiY1JjUjlnZXpTTnJhaysvUFo2V2xNem9sSm5hRkwxZ2c2?=
 =?utf-8?B?NjBtWXBtSEo0YWovbVZtTnBsQmYwTisxeTBoL0dQcXM3WDkybUhUYVBtQzJq?=
 =?utf-8?B?RFU0QmlSbDJXbmg2dmExQTd6cWtJcEYrbTljY1FrOTczUDJTSWFTei9lcGNr?=
 =?utf-8?B?Ykh4MzhST0hMRzI0ejhyS0VVYXN5b20rdFhhd0VSb1dYTGw1aThjc2hEWUpZ?=
 =?utf-8?B?YUZDR0t4Y29XbmZwY0dWcndNRUNVTFo5NjI1SWluYmxKWEdZTC9sRUg3TUgr?=
 =?utf-8?B?Wm44QW96RWRIRDFST3FObHFoZmQwMEIxaFU2NHJYUFRVSFYrM1h1NUo0Y21p?=
 =?utf-8?B?UUx4UERtSDNDVWhaWUtDdWRaMG5XbXhuMFUxWlRUdWFxbFBqUTVIVmp1RCtU?=
 =?utf-8?B?ak9NbEtCUWZkaE90emZEeFIwL1ZIUE02TUpJWXJUdWlyTWFidFlxSmh0cFdv?=
 =?utf-8?B?bGt4MnFmWTY2M0I5cVVuTURKUUdZS3JwOXZQc3Y5NlA2cmhEdGE5cVhjdkZC?=
 =?utf-8?B?WDJTL3NqMnRBdTdpZ2prQ3FQbEdUaEVwZkcwQ08rVDhYZVNRb1BzSGtKemwr?=
 =?utf-8?B?UCs3bGxCT2syYjIrRTJTWmlpSTFpWHJqUk1MNTVaU2ZIaEx6OURiTld1bHRs?=
 =?utf-8?B?d2FJYzZKbWtMWTNjcXVGRWtBMWN4QU5KNlg0ZU1rS3pkbVFxalNKZzYycVBl?=
 =?utf-8?B?YklxVnlNbTJRMndtWUpOREVMSTd1OXppaWVNeTZDa1hTRkV0ckkwdFRrWHZF?=
 =?utf-8?B?dmJ2OWZObHhYUGNzbnRrUjZicWkvQzdzOUU3cjYvekxwSUF2bER1SktNNE9l?=
 =?utf-8?B?cXZJWUlTd1BHaWs0eXhVTkl6bEl6SFpaMnlZMFVURHRUZE1iOG8yZVU0d21P?=
 =?utf-8?B?dXBHOVJ1bmwwVkFOajFaOTJ1WFVyM2ZndjBnbkdZcng1ODd1bzlCTzJWQ0Vv?=
 =?utf-8?B?cEdya1pnNlgxbWlCQkpqSkdQQ2Zid09HOEgrNFowLzNaZS9sa3d3YXpEMzVG?=
 =?utf-8?B?VGROc1g0WGU3TkpweGo0bEJaSndiMnZnUXdtTW5mVk4xZ0E3Vmc3b2Y4SXlI?=
 =?utf-8?B?MkpnWnk5TmpyOTZJUGg2UDd6YVRYL1hBSjdaNnFDeElOUEV1K0xtZWx6OVFZ?=
 =?utf-8?B?eFpLd3RVdFdUME14bkN1c2FDK2VrQkw0QitNNHFWM0YwbFNYbVZlTzNJZ05Q?=
 =?utf-8?B?cnkvUkg5dWUxMjZ6NFA1TzVncUNvclVEYzFiZ0doODBWUFlyZGcxMlRUOHky?=
 =?utf-8?B?L2NSWUhxZTQrRjMzK0N6VzVTSUFtbVU0d1hmWTVyeDAvK3RIT05ySW1CM3ZY?=
 =?utf-8?B?NUR6NFdLcVdaNTRKWm5VeWZ1NVpJZzNqVXdMMnJ1ZTBEZTJDYWU4Qkc3MlNm?=
 =?utf-8?B?Zm9xcmpYYzRVa255R3l0N0pwbG0yYnlBWE9YeEhqNEl6ekhmT2tVY0QzZm1H?=
 =?utf-8?B?dXRybWR3VGwzQWVBQVpQUExWdHpVYmRkUGFrVWZrMlJzWmcyR00zZDJtUVQ3?=
 =?utf-8?B?WDJ5TCtqUWhjckFKb0JOZU9DSXp6Wm9nWjVjZVo3a1AxazlQd2RXZlAvRXpw?=
 =?utf-8?B?TXo4eCs5eUowblpQNld0emgvdWdxUDEwVjZ0MWtPSExsU0pmKzVFRWpqWWxq?=
 =?utf-8?B?TVRpOU5BdDgxR3V3NE01ZHpNVjdOR1JwQ2lQZ0tLUzFRSlJ4aFNxWHl5VUNl?=
 =?utf-8?B?YkNUMGthVVpuMEo3SmZjTnkyd2l1VWR1cGV5MHFRKzRaY2tuMlQ0SHZhTWsz?=
 =?utf-8?B?ZjB1Y1BQS2QwT3V4bjVZdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU51OE1FdGRuWEY0ZHVWd3J5ams0WTMxUk1JTlV0Um9acTZCY3dPVkhjTTl6?=
 =?utf-8?B?YThMK1kyamtZbG1Rbk55Ry9GNHc4WUdRTHlWYndTTU5OSVZhTnc1cldLN3p5?=
 =?utf-8?B?VVlXZ1MzNVJ0YjV3Q2hGY01oTzkzRzNxaURBSUdIZUxHbFE2ZkRsV1o3ak5J?=
 =?utf-8?B?VDdLOVhyOUg4TVJrWHVpRUxuVjJhY2dHM3c1TVg3c2EreFdQRUwzb3czYkRj?=
 =?utf-8?B?Tkd0QkoyZ05GVmlnQTUwYVhVbk5xOGVMUSs1U1FjbkNsZlo2Zy94SnhoRDBs?=
 =?utf-8?B?SVBPNWc3SFh3d04zRy9GTUFzSW9UWWFUZXlkOFkrWDlCaW9oM3V6bGRVOGRv?=
 =?utf-8?B?NnIrcUZsZXExc1NmaFNMb2VxM0xsMUJtYUtndjVPcE5ieERYT0M4eTFGdHZ2?=
 =?utf-8?B?Tlcwdk9lMnl5S0RTVElNYW50aUhydzNpcFdFY09BTlZpNTN2aEU0a2RmclE4?=
 =?utf-8?B?VUNJVFF6MHlncjdSSlpTZ1hDTjBSR3pWeUQ4SVJLRjFGbW01anYwQVBONUpT?=
 =?utf-8?B?dW9Rb3pHcUpxaFBCblVMYjZ4aHZHTlhrSm1RUUYxUjMvU1RCb0E0RU0vVEpL?=
 =?utf-8?B?QkVyQmhyWHNNeVdwZkxqZW83dWhURFFSY3FSdFMydDZnMjRLaFQ3Yll6b1l4?=
 =?utf-8?B?Q0hOWU1GOGhKOUpwK2s3cUpQa05xMDNNbTY5bzQzc1B6VzVuZndCakdvUE56?=
 =?utf-8?B?UlVHL0tVWEpEZHZ0elI4TlRCQXpteEdBUXk3Mk1Qc0F1NndSSHJZYlA5bVcy?=
 =?utf-8?B?S3NEM1JDRzBrSGhYbGJaaW51WHZCcjRCVU1qVDBFV2dOVWkxWHNwL3ZVVTNn?=
 =?utf-8?B?T2RNZ2NzYW94SWkrNU94UUIyOXJUSVdmb3pFSmVoTGhyMy9YTXRDOFp4ZTJD?=
 =?utf-8?B?UXR6MEVtdnlHYUI0czV5UnE5bVVESHZqaGtlWERVc2wwTG1LSFdGcTFVUmQ2?=
 =?utf-8?B?Q0s5VG1aWW1kaEZyZ1pTZkFtQUpGamp2dU1pQ0NCSW9WT05YR1hvOWNNNW5w?=
 =?utf-8?B?RGZ1Y1VNcXhidHM5UHI2djlTZk83aGNDdElwSnFuRnRjSnBJSTk4L1FZMnc2?=
 =?utf-8?B?YWxmT1ByWHFMK2sza1o3aWpPVGRxUmhCM0QzZTVZaFFMQUlRWUZNTysyZWJw?=
 =?utf-8?B?TEZJRmVqVlhWUi9RZDh0bjcrNzk4UlpjaWIxYTdueldMQ2lhaWR0eGhGNHlJ?=
 =?utf-8?B?dndRQzBnek1EbHZ6QTlZOEFtbHJwelVsY0JxQXhsRDRTTFF4M3JyTENXbUY4?=
 =?utf-8?B?c2hXckwrWVRhZWc3aEcxRmY4cHI4L3AxRUx4SVBHOXgweVRWZVhFYWZoSmdM?=
 =?utf-8?B?YkNvVVRZeWE1Uzl0U2hFWUZ5akJNTXo0Z01hdUdsTHFjQjlOYmdYT2lNQkVm?=
 =?utf-8?B?LzhqL1FjMHhUVnZvRTk1TVUraUpIejJkeFBhekdIN0lMVWRGc1lsMUFVWnUw?=
 =?utf-8?B?VVFhdFhJZDV4Y1pxN0cyWnN5Q2o4QlBFNm1uSUdGZmdKRHFzdkRIS3VheUMy?=
 =?utf-8?B?cWVZQmdoMmU0bU9PT1c5UEt4bDJZOCtSZTc1NUZCQXpENWR2Z09NVTFMMVN0?=
 =?utf-8?B?YTUrTldlYXVoT0lyb0V1LzRMa2RrY2xKeEMyYTY2UmpYV3pPZldQZ0RYODVK?=
 =?utf-8?B?QmlvODhaZjl6a0ZWYnJnRU0xOWJ1QVFmK2tBSFdxOXBRSHYwbmwySHVjNzAw?=
 =?utf-8?B?ZWhuOFNkZUlGMUk0UG1oSHpDeXdpK3FXQ2tHOWZ6V1AvcG43VENKQlp3SlNG?=
 =?utf-8?B?Nzh6YlVtektYOHhWd3JzREZuM0VETkk5OVRSVTA3T0JMejZRTlJHQ01YMnFi?=
 =?utf-8?B?YXErcm9ZSk1HUUdnclg5anhqV01qWm1INW4zd0lXNG1rcm43V05aZ2VLczlo?=
 =?utf-8?B?WmpBeFBNRm5JY2h4bFZLNW1weWxJZVVjalhSeit0RmVjVDh2VEp3TTdHTmZK?=
 =?utf-8?B?dzZzMnVBSDZSYVpDekxzNk94ZUpPS3lMdVR3M3FjL0ErUlBUc1BheDQrUTMr?=
 =?utf-8?B?Ky9IU1RNRXBDY09WdjZibTQ2Wmc1NWYxY1hCV3RsdjY2UVJmVGdpZDg4UFhS?=
 =?utf-8?B?U05NSkl4WUtGWkVaRjMzRGVkVS9UVnhLMkoyTWZQQlRZQUtRU1VJNGIwdmhM?=
 =?utf-8?Q?qtVbjlFBfvxEiEHm9O9Uv0qoE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 744e5793-b3ac-4e00-a260-08dc9a67a1d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 07:21:46.9480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNDtZHSfRojo3gebUfoJGlrg5ptUf0gat52C8rFhKWHjnUNS0d8hDPrrmzMYQ3uq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7989
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

Am 01.07.24 um 19:14 schrieb Lucas Stach:
> This exposes a accumulated GPU active time per client via the
> fdinfo infrastructure.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Acked-by: Christian König <christian.koenig@amd.com>

Sorry that I couldn't find time to finalize and upstream that patch set 
myself.

Regards,
Christian.

> ---
> v2:
> - new patch
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c | 32 ++++++++++++++++++++++++++-
>   1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 6500f3999c5f..f42b982f9a16 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -24,6 +24,7 @@
>   #include "etnaviv_gem.h"
>   #include "etnaviv_mmu.h"
>   #include "etnaviv_perfmon.h"
> +#include "common.xml.h"
>   
>   /*
>    * DRM operations:
> @@ -488,7 +489,36 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>   	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>   };
>   
> -DEFINE_DRM_GEM_FOPS(fops);
> +static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +	struct drm_file *file = f->private_data;
> +	struct drm_device *dev = file->minor->dev;
> +	struct etnaviv_drm_private *priv = dev->dev_private;
> +	struct etnaviv_file_private *ctx = file->driver_priv;
> +
> +	/*
> +	 * For a description of the text output format used here, see
> +	 * Documentation/gpu/drm-usage-stats.rst.
> +	 */
> +	seq_printf(m, "drm-driver:\t%s\n", dev->driver->name);
> +	seq_printf(m, "drm-client-id:\t%u\n", ctx->id);
> +
> +	for (int i = 0; i < ETNA_MAX_PIPES; i++) {
> +		struct etnaviv_gpu *gpu = priv->gpu[i];
> +
> +		if (!gpu)
> +			continue;
> +
> +		seq_printf(m, "drm-engine-pipe%d:\t%llu ns\n", i,
> +			drm_sched_entity_time_spent(&ctx->sched_entity[i]));
> +	}
> +}
> +
> +static const struct file_operations fops = {
> +	.owner = THIS_MODULE,
> +	DRM_GEM_FOPS,
> +	.show_fdinfo = etnaviv_fop_show_fdinfo,
> +};
>   
>   static const struct drm_driver etnaviv_drm_driver = {
>   	.driver_features    = DRIVER_GEM | DRIVER_RENDER,

