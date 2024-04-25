Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956CD8B1AFB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAAF11A1AA;
	Thu, 25 Apr 2024 06:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CPP7Tto5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7EF11A1A8;
 Thu, 25 Apr 2024 06:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwz4qR/7C1xxYWUgeP8FRZwHZee5ZfRWu8sLfGW9insl8rNiKGxKHXUOiGI2DhK0kAeqLgdPxPdaz3CzroX7qc+pTAITx7cIznWWumE2hxR8aH4i9XkQCoJPY9AldTY2SMZj62VZ55sPTBfAXqm5zjWqy0rdGcRFwPKeb1e4A0WqksTWat7WDsh7fUhbftxVdJobcnDWrQJNkcZ1yf3FQbb7g77nGFLawMshCD5aY5F5cYl3TNnn9jzzU70yzJJ08xah1x4IgJs5gW5vkREqeRKSLMtBaHuwPJIQ8qVZiCJ5sDRUX26Fbxnl9mRhmObr1NmWNpL89W7KgwaPIM1WWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtUcy3pdQugTy8t2Uf0eoLiJCyQrCu0JsDY8z1YCAGI=;
 b=m69KobJcGP5Yw4mnFdoDjTI3oVBmyGRhF3O37R+XXzqod7n/pgE85wWkZoSlqiu2NVkAAhijrgUrGTvIaiYaynz9K0U9nPEA11NgweNPzv2Ag7wmpwR0YyNfj9bvULtrb2BVmhJVgdHd0jzTVqEYBDdTBcXmUA2i7kVIKorw4IniMJ4VXpG0ziLpUxxgkU2kgwW/pwRHcKqofxb7+5B/o+Vhjbmoy23R+7MZ5+/m6qrCrH5ZRLgML+sb/6R6StzFYKJFpC2xGV2l16SFZVhWlSNcKfjCq2HH2Yf4DZr3n8X1OmFLhq8/+sIcVRy64TcsTOKwNG5ydcyK/I+4ug2eHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtUcy3pdQugTy8t2Uf0eoLiJCyQrCu0JsDY8z1YCAGI=;
 b=CPP7Tto5KvSHhcjhvN3QJ6m/tej0xZrwWxizy841G9AtqFKAmeeCNtPJM+oE/w9+I+L47TS5xU4t1G1beD2bdMGwNUzzURpKO5UQZ1FoAjEXqYBlSLTGkUZ3kxgQ8pPHv31BrGDhw/fdnj5AhenAZcUHg+kX8zbm2jm4kQeSJ9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW5PR12MB5623.namprd12.prod.outlook.com (2603:10b6:303:199::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 06:26:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:26:27 +0000
Message-ID: <75959a90-4e52-4911-ac2b-2231ff153e44@amd.com>
Date: Thu, 25 Apr 2024 08:26:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/18] drm/ttm: Do not evict BOs with higher priority
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-13-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240424165937.54759-13-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0362.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW5PR12MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: dc14d1c7-795f-41c6-7005-08dc64f0a356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFdkbld4YktOMXphalN1VS9XSDJIOWpkaldKa0hLOVZTTkozd1VZMkNMUEt5?=
 =?utf-8?B?MldXeUJyMnI0WXB4YVg0WnNENWJ1bzB1blM3d0M1eFNHeWpNa1RoS2VPT3c1?=
 =?utf-8?B?S1pjd2I3bzkrUUF0OEQ3LzlYZlV4bWowTkNQbHJzdXNiZllyMnJyOGlHZTkx?=
 =?utf-8?B?QVR6MjBnZ2p3cnlWNmh3eXp0cnpaMzlkaXptajc2WnVXeUlnNGNnMkZNNFRQ?=
 =?utf-8?B?YVBCUDVRTXFHMW1hTWhZRDdkZFRXQU5TRjV3dGNhNW1tTGM3TXplYkNzOXda?=
 =?utf-8?B?VCtwSTdOUGZ3NmRnZ0djeGMvdDNGdmM5VTI5dksrcjJ3SDBBWkFnTXVKaHh2?=
 =?utf-8?B?RENuMHBWTXEvMGMxRGtoaWZFUW43S0Fhd2YwWCtkTjltWGhreXRwSzFobDdn?=
 =?utf-8?B?NS8vdm5wZUk1SDVPQnZvNXB5NjJ6dEdScFNZZFBQTHNwYUlYYVV0UFZIMWFp?=
 =?utf-8?B?TGFRYnlBaFFFT3NiVWUwcDdvdEJvSEpsQ3VxdXdxMVRvZWtNNE5BblNieTVC?=
 =?utf-8?B?c1dER3B4aUp6MjJXem9GTFZZZU5UU0J3bkYxYVhsZmx1MDZMK2dOT1VWVUJn?=
 =?utf-8?B?ZXFjK1BhVFZCd09wemNWeW5MQXB6dklmSXlVZ3NGSnZtS3BybHFtT3BvdGdU?=
 =?utf-8?B?U2ZEYjJYamZkSnU5S3JNanlJdzlzbkgvWkh1dzE1cjE1K1V2R3R3SDlXK1U5?=
 =?utf-8?B?S3VGbDBGL2F6ZHlPSFZxREJjaFNnTUlZcHgxU0xUdnA5dVpPM2tNYWIrSXlj?=
 =?utf-8?B?M2NoZlRURXNPV3NOcmdGL1B1blR4RE1ER29CTDA0bFJ2SGJYdW53VzhERi8w?=
 =?utf-8?B?OU9RRW9KN21VZTFNYWJSR0YvSXI3SklkMEtNVHFMOERTWStVbjdQQXRrR1ZU?=
 =?utf-8?B?ODhmQjd0ZC9HOGNPNERjMEtXKzhCN0JJbkFQQkN0eU9KcVB2N0FtOUZ6bWph?=
 =?utf-8?B?RXlxSkJXSGRjRGMrUXBQd1FpQnNmdnVZWm05dm1EQW5ZMVBlZy81L3gwdUV5?=
 =?utf-8?B?ckNJVnRYalNXcDJDSm1QcSs5cTFjYkFUenFsT1ozVmxPQzlsSEdrY1Z2NWp6?=
 =?utf-8?B?RU9DRFk3bFBkUitCYlZsOXdYZ2FjV3ZTRlF4MzM1eGcyU1p1eDhBQmtFMG5V?=
 =?utf-8?B?WlJwRk1hM0tHN3FmdUFRU2IwSUtxckZNRG1MZDd5NW5jdWt6aGRYdFFJODFR?=
 =?utf-8?B?K3ZWYnBVQUxWRVQwa0dhc1ZBYUtDVVh2aFVKRjF3U0FMeHlUVDQ1UVdyWjB5?=
 =?utf-8?B?UlhjTmRmeTczUjJ1WS96cXZwcFd1SUw3cWcydDh3dGN3aVBsSmpzMzFuaUY1?=
 =?utf-8?B?R2hhYkxOdTFrcU94VkMzaml0aEZiVnI4dzNnbWJScW9hMEx4SFF6T1pnZFZ2?=
 =?utf-8?B?VGZFbUY5MEFTNGROckhTbEVzNWtRaGJLL1RrUzRNa1dJSEVSMTdFUEhabmM0?=
 =?utf-8?B?ZDd2RnAzMG5lZ0RtK1RsdXVESXloc2t6OGVVcU43YjYvQVZEdTdROHEvYVow?=
 =?utf-8?B?alpBaTFVWWRkYkp3MVlSdEFMRVBrZy9hSzNrMElNVE1DVjN0NXJ1b1M2SHNK?=
 =?utf-8?B?VDR4MHFjNFlNZVVkU0hGUjdIN2FxZXhTZjJsaTN0akg0SUM0N0EreDNtQmVF?=
 =?utf-8?B?TkFnUW5raE53Zlc3TExKV01rc0dmeHMrRncxK2ZadC9aOE8yMUY2dHBPREoz?=
 =?utf-8?B?dTVjR1RXVFJiT2Z1ODFLd0VhTVRNKzV5RjdaaHRIU3FXbmdrYjBxd2NRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2t6TTlkMzRiYmdLUnNvcEZwMEVheWdFQlJ0bytWd1RVTWxOV3hWSTg3aXk3?=
 =?utf-8?B?NUE4aDZOcGF2ektjZmM1ekMzNGxnakt0bzE1MUVkYlA3M2ZEWjZpVnFQM3JT?=
 =?utf-8?B?eVczZnI5MzJKSmwyT3hRTFFCeW9IU0dIcVk4QXVTZkFqRXhER0xDMXRxdVhz?=
 =?utf-8?B?YytqcVVKWDRvR1Z2b21BcE9NeG1SRm1mZDl4cEE5bnBqekx0UXJvcUZUK2p4?=
 =?utf-8?B?VER1NG82Ly9lN2xaVXFQTklSVE43Q0VXRURMcjkyWUdwbXJGYUVDNXlPWnpk?=
 =?utf-8?B?WnltME54cUlBNGZjeThodjI3SWRpQmpiMllmTVNaZy83VUs2RitYQnJFQ2ZK?=
 =?utf-8?B?YWdWSHpvZDl3UlplQmpYTjkvL1lYM0RUNGpOeTZkd0EzV3ZpeCt6MkQ1Rjlw?=
 =?utf-8?B?NEhzNUlINGNJSXlPak1naFd2a0RIM2xYcGwzSDV1Tm16Y3l5dVkxUXNLRjhi?=
 =?utf-8?B?d1VBM2kwQ0hDeTV1MUFmMktvZVpuWHlkZ2FPZEhYbUs3ZjhyWCtHWHkyemNv?=
 =?utf-8?B?bmd3UUdGWEtFc25ab1ZodTFSU3BMeExHVHltbkhIMGlEYldGVnZ3UjNPbmN5?=
 =?utf-8?B?SGo2MzlUSndhTVl3WTQvWTVLemVraXdQWU50MTQ4RW5MK1lUNmNWM1o1VE91?=
 =?utf-8?B?Ym1EV2txUGZtYXJ4UmxqK254Q3h2RnZ6ZHFzM1B0RUI3MVRzaTBEaDNaUVgr?=
 =?utf-8?B?OFZVT2VXT1pqZWlxRy9hUjNlc0hzc0ZXVm9nREpZbjRrK2c1TmR3bzlLQ0cw?=
 =?utf-8?B?R0hnTWJyQThReGJVSm00U2cyYzBlcVBjS3FJL2g2bDMwazNHQUMrT0pZVTVr?=
 =?utf-8?B?Mi9ZOFZaT2RzZXdXQnZwcm4zOGQ2TWJCMVcvUnppNFlWYkpwQ2ZEbXRsWVFV?=
 =?utf-8?B?TmwrWnlwdy9SYUxnMnp5anVGMWNIUWhSWTRuZXNDd1pDRzg0b1c0OUllMFBN?=
 =?utf-8?B?UnlJeCt5TGZnMGhWTG1HcVptZzBLZUwzNStzWjJ0TnpTdS9mN2NTcnREbmND?=
 =?utf-8?B?Kzk3VTNpR2R5NVNSVTRiZVFUbFhCMzhySHdaRzBtc2t1LzlBZEQ0cmVEd2x3?=
 =?utf-8?B?NjFDaDVNUTExaU9YVU5wYktvMHR2MThNSHA2WmRySDd4SlRBcFlrSVE1T2dJ?=
 =?utf-8?B?b0JvK2NvdmJFWTdUS05QK0ExVnZuRnBhS0Y0eVBVQlBZNit5RFYwMmhsd1o1?=
 =?utf-8?B?b1FCWVBtdFd5TjREcnFxUFA2ZFVrM2lyVXczV1V4UVZwOVBORzdhR2diTVln?=
 =?utf-8?B?WkhUbXZFaE9iMHoyRmFzVS9BQVVkdjZiaWNrTWM3cU44aWQvb041dDhOV0dm?=
 =?utf-8?B?UXE2cW94YTZRSUFuMTlaaFRFYlNOK2JHcVlYY1FpbTE5Vi9oME02L0FCR1V1?=
 =?utf-8?B?VHhacmp5aENHWlFGYkRzRURMSStBK3dIYitGaTJKQXIwSHZuVWVEd3BvR0Fr?=
 =?utf-8?B?TlhodVVPYUw5T3poVkZrTGRVZkYwb0JhR0ovSS84WmdzWERGZldQNjBJczNH?=
 =?utf-8?B?Qkoyd1Jqd3Zobnd1T2h6M25CWHMvb3k4c1N4OXNpb3JDdzg4dzBPT1d5d21t?=
 =?utf-8?B?RmlQNFhEOFhNL2haVkhtSnhmSDhVT2J3a1ZKNUhRUzBhanl3MFhEZ1lLNTUy?=
 =?utf-8?B?bzlvMmVpZ0VZQkYwMThMK1Bpdjh3c05mdjN2WVJCRjdCc3E3OTgwQVBPa3JX?=
 =?utf-8?B?d01mNldlVERnSHpOdk1RdjE3VENkcWtvTHgvR3NwK1p1NDdFSXZtZ3VGYUVK?=
 =?utf-8?B?eDJacjl2QUMyZGJXcXdremg2b1grcVNQZTRtT2ljb3A2STlaYzhYbDRGTDN5?=
 =?utf-8?B?a2w0ZmpXQ2tFajdDRGhaVEdRV2FaWDBqYnh5ZFJ5WjBOdnAvbVB2ZHNTU2tC?=
 =?utf-8?B?K2Q2b3hOQWt4RXJiSWpyR0pZS0FaYmdra2R0WC9MWGhBY05Td013VWs0SWFs?=
 =?utf-8?B?V1BXRTJaa3gwaWUyM01hZnRaM292NFlIMVl3VHMzaWVUU2c0S0hMQ0JObk51?=
 =?utf-8?B?WHloNUpScE15WkNBUGVUcEFiNTQ1cmdnWGI5MVRZbzVLS1B1QzJwRTZ3YTdq?=
 =?utf-8?B?Zm5KWFR6K01Ic3ovQ1ZOK1RiSkVscW9VOTUrKzhrcnpOTXovUmFxQjkrWEE3?=
 =?utf-8?Q?gdgrNmcxGqdWvnGkT8/5twC7K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc14d1c7-795f-41c6-7005-08dc64f0a356
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:26:27.6083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zE8C+j+BkJ+AwnPcMhYn6wfOX0y2mFhnlfwv25ObJqNkm9zGY2krID20RLU5BxCR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5623
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

Am 24.04.24 um 18:57 schrieb Friedrich Vock:
> This makes buffer eviction significantly more stable by avoiding
> ping-ponging caused by low-priority buffers evicting high-priority
> buffers and vice versa.

And creates a deny of service for the whole system by fork() bombing.

This is another very big NAK.

Regards,
Christian.

>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       | 9 +++++++--
>   drivers/gpu/drm/ttm/ttm_resource.c | 5 +++--
>   include/drm/ttm/ttm_bo.h           | 1 +
>   3 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 3047c763eb4eb..eae54cd4a7ce9 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -776,6 +776,7 @@ static int ttm_mem_evict_wait_busy(struct ttm_buffer_object *busy_bo,
>   int ttm_mem_evict_first(struct ttm_device *bdev,
>   			struct ttm_resource_manager *man,
>   			const struct ttm_place *place,
> +			unsigned int max_priority,
>   			struct ttm_operation_ctx *ctx,
>   			struct ww_acquire_ctx *ticket)
>   {
> @@ -788,6 +789,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   	spin_lock(&bdev->lru_lock);
>   	ttm_resource_manager_for_each_res(man, &cursor, res) {
>   		bool busy;
> +		if (res->bo->priority > max_priority)
> +			break;
>
>   		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
>   						    &locked, &busy)) {
> @@ -930,8 +933,10 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   			return ret;
>   		if (ctx->no_evict)
>   			return -ENOSPC;
> -		ret = ttm_mem_evict_first(bdev, man, place, ctx,
> -					  ticket);
> +		if (!bo->priority)
> +			return -ENOSPC;
> +		ret = ttm_mem_evict_first(bdev, man, place, bo->priority - 1,
> +					  ctx, ticket);
>   		if (unlikely(ret != 0))
>   			return ret;
>   	} while (1);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 1d6755a1153b1..63d4371adb519 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -431,8 +431,9 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>   		while (!list_empty(&man->lru[i])) {
>   			spin_unlock(&bdev->lru_lock);
> -			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
> -						  NULL);
> +			ret = ttm_mem_evict_first(bdev, man, NULL,
> +						  TTM_MAX_BO_PRIORITY,
> +						  &ctx, NULL);
>   			if (ret)
>   				return ret;
>   			spin_lock(&bdev->lru_lock);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 8f4e6366c0417..91299a3b6fcfa 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -396,6 +396,7 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>   int ttm_mem_evict_first(struct ttm_device *bdev,
>   			struct ttm_resource_manager *man,
>   			const struct ttm_place *place,
> +			unsigned int max_priority,
>   			struct ttm_operation_ctx *ctx,
>   			struct ww_acquire_ctx *ticket);
>   void ttm_mem_unevict_evicted(struct ttm_device *bdev,
> --
> 2.44.0
>

