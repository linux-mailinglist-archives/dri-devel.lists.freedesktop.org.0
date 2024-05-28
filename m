Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB08D171F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 11:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818B510E0A7;
	Tue, 28 May 2024 09:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SEmAyBdN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638CF10F8E4;
 Tue, 28 May 2024 09:19:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0bEfnLCvj8kQ1zTpT0IqZfMjuquwxChy4PsMuteuSwwlgsH6oEz7Da/TUge3MAWUt109fymnS7iisUcq3B9/7GQMnZS6hsbFmadHRCwWK28wD1DT1nCpgHl3dfLYN9CMOqslnsbnjhjqtuGhXxJ46tIygko+oLWxyTtZ3yJ2cLSuvtENAINQ1mWes0oG3DMLegdNYypwZGsg+L5d0+ZNaU8VRAcu7Yq1hsOcZo4emi9WBWY6zipfUGMNTFCJhh/al4rOgg7CE6TrXF2weL9etNsLz1nMcsL6KQSO3lXqGKl/ayDbPxB7fh9cKDltf2e+VGqTdUWNhRmbx1SyP+2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ga1s3Coy8ko/EBAffAJLCJGEHEYmy9KV4VT/5TE72E=;
 b=gSi0Wot89iVNt5mrxmHIYkz0NrdYBIAMMIG9BMQO8nkaA4qWt+KgngBX4bpwo35jiHvc0uID7dhXqzZldqBg2gMSQZqFoJrxRMAKbZv69Oevbd0MpugrpyBqhzFx9KLtdMHvFT0pf+YDg3FBlwgYDzMRvuC+IFmAl1EQCenS2sfxqVi3WBKNif4Q7r8AAWgIcehD/pBYK7POUWUAgSORbrO/iDw40XtHFUARxLobUBxxhyWdH9cRErhBfXHRyP26J+fUS7iT6uw4D5zzogwAvRWaNGkmz7hEFo9dnODGydZsAGJP3yySUX/N1009jVcUDTnD13wMGu321FcJDnmr1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ga1s3Coy8ko/EBAffAJLCJGEHEYmy9KV4VT/5TE72E=;
 b=SEmAyBdNyYGBysnsrtJNmHKmoJOqJsH84foz+NqTWP40z62fGo8SKH7la/IV4JwgJIoJHEnO6GA7IjBOhN9oNrv9Frr5EL6dgbGSVUEIEYmsnBcBTpKfd4ehW24ozPmHd5bbB1YiOpMVdMcD3vHGt0+fKVL6tQmQuLy+ThZ5+hI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 09:19:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7633.017; Tue, 28 May 2024
 09:19:46 +0000
Message-ID: <84445a1a-dd17-4172-b3d6-a616ccc6f490@amd.com>
Date: Tue, 28 May 2024 11:19:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/21] drm/ttm: Slightly clean up LRU list iteration
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240521071639.77614-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da4ee07-b163-4687-c65f-08dc7ef750f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDlmS0RkMGFHdVZjU0pmQS90RjJOMStnZEJqWGdTZGc5RytFcUtmckkwVnVQ?=
 =?utf-8?B?cXFXZVVhenpURitJS2YwN1l4aVcwcGxMam9UdC9aVmFINDVVenlZblBkalhr?=
 =?utf-8?B?K1V2NGFscEc4TkZoQUFNaWRLWXBsNHNUb1lob3VSRHNSTkluYkRNUCtwTERa?=
 =?utf-8?B?NkROdHBra0xmN3NXNG94ZGgreGJNZ0pPYnVRR3YzWTA3Uk15ajRrS3ptZGZ4?=
 =?utf-8?B?cVI0YjZQWStMVVJMbDRKV21PZnFSb2RkcUlyZjNPYWdQek1KdEtseGtlaFJ4?=
 =?utf-8?B?V003cmhma1lFdHRZYldPNUM0U1FCdzdsWXkxZnJZUTEzU290NDg3ZU1xZ3Rq?=
 =?utf-8?B?c1Z6dkhINEJJNUltTnZpY3hCVnJSZW9VOWsyUllWRElILzNISGZ6cFB3WlNo?=
 =?utf-8?B?VktMa1ZjSGhXUVZtK0kwdTRkWUx6VzdkOFpDRjUwNVJDL0xpbWVaZ0ZVTUhQ?=
 =?utf-8?B?MGs0b3k0NDF4aHZWMDVWZjJZVkhGK2FnT3o5K0tPZWhYODQ0UFc1bEEyTDRR?=
 =?utf-8?B?VGRHdWdCRklzRWVrODk3T0Y2bkhkV3d2THNiakNldUZ2RGVZVEhMQnJBZTJL?=
 =?utf-8?B?R05sQmRsNTV1amxkMUpEbmFiZ05oMjYvYjNsNThaUGY1WkEvUlphMGV0VGRx?=
 =?utf-8?B?NTdpOXBvNlNCUGRjMnVtSHl2U09CV3lScWQ5ZkpLUWJtTlhSZ3MzRVFmUnhY?=
 =?utf-8?B?Qzh5TFcvS2p1N0puaUdGZEhueUlaSUV6bHpYK0hRd0dQS1pNeEtUL1V1Q1Fv?=
 =?utf-8?B?R0lDQVpyYzMzVEtZajR1TElYQ3JYTnBqM0VhZUlGUnhrbXlPblF6OWZUL1Ny?=
 =?utf-8?B?OFNEYk8rRkhLK2NuVE5pVVJCOCt3UEtNMU5yY2JJcElRZXgwL1FIZDhScHVt?=
 =?utf-8?B?eDg5NDVpUnR1QzM3RXFpR3FGYlZRR2FsUjZHZGtOVHh3WHVWYTVhKytCa3I5?=
 =?utf-8?B?dmVNV0diWjVOa2QyQzVqb3dKQTRzcGtDdGF3aCsyTGl5SDJXenNVN2tDLzYy?=
 =?utf-8?B?WmE3NnYxbWhvazlUaDZGS1J6bUIzQTFpRXBLN3ZKVkQ0UXNTL1FCUGkyYVBk?=
 =?utf-8?B?b3FwSUc5RjZ3WTFLQTllVG9ENVlFTWgvcG9KQWFPUlNGSk95bk9PYkVHY1Nj?=
 =?utf-8?B?ak1Ha2dyVEUvTmxqTE1xNElFZlJLRUV2S01uUFlvc2I3MEc3Vnc3RWQvNng2?=
 =?utf-8?B?R0RvczFLTjV6UDNucVA2U3dobGJaaVM2NWRjd21Zdkp0MVRvRVFOeGd6QURr?=
 =?utf-8?B?ck1sQ3k3SzEySzFmazdXTjJJd1d2SllDWE9HM3MydUZPcDhjQU00dDRNS1pN?=
 =?utf-8?B?blVCZFZCajZEY1QreXNPbEhBaUdBMEFPSlk3NzRYYkMzbDZEWStFNWlGNEQw?=
 =?utf-8?B?eGxqSDVOQmNLU3BadkdHSUZKdTJsNFlLWjl3R0xuNGs2eWRZQ3dMQmxSbWdI?=
 =?utf-8?B?bEQ0cnNVVWdjWmU2Y2huZmUvZlBEb1ZoNEtJdlZpbHB4V056TVFIdDNqeDcv?=
 =?utf-8?B?eWNQWEQ0dHpFSWM4UWZFK1BCU3pnWUg1Q3UrZGJTY0ZJZnN1VGo0aWlMdVZD?=
 =?utf-8?B?enVTVzJ3NkNIa3lRN2tmbk8xVW4vNUJlYjlRUCtBNnBjdjJUSjNPR2w0OFgr?=
 =?utf-8?B?c0JWK2s4WjZxTThrZyt2NGg2bHB6OGszb0U2UTBiNDk0MEl5T0JmOXpRZzlz?=
 =?utf-8?B?OXJhTHExYTFMZmgzRU1qSUowUHVWZDZ3dUcrN1VZQkdGUVMrcjIzNEhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlI3UlFWMi9SSGF4VEV6WUR3SE5UWWs1MlQxV1UxemwxOVVIN0Vhc1duV01D?=
 =?utf-8?B?aGF0ZkUrRVJ0MEJhYkx2bzBjaXpXZ3BBT21nWisrOFowazU5T216MnRMTnpq?=
 =?utf-8?B?RXRLUkNvM251VDV2QUR1YVdSZ2ttL0hBYnRkd3V2U3lBT2dMalFVZWc4bWw2?=
 =?utf-8?B?eGNheFk3RTltR1g1cEZ5M3JHMGlsYm5pTWRsOS9WNG9hYm5ROU82aytEZU9p?=
 =?utf-8?B?a2xyL0tKZjdnSmlzbEJqaHpWWWwyeHVSV3FhTGFhOTh3M1JyVXlzeHpiWGp3?=
 =?utf-8?B?bEljcE0wUXNnM3h3eGl1NUtEYjNoZC9BSDh1K05RZ2tRN0VBY2VTbzVoNTVG?=
 =?utf-8?B?UTR4VGw1ZWp5cU9NaGNRdmpMRzlZQXJkQ1VESnBNQnZWdVZzbzhZcW9aZFpP?=
 =?utf-8?B?ZVJkQ1JtTWNVV3NHWk11S1MyTXowcGIwMkxZcUNNSmlGTTMva2crbHJxTU5J?=
 =?utf-8?B?SU5IdXNRYU92aDBHR3pLR1JDWHFIL0NZd0RXNVNaTXllZUJxMUFwY0h1Szc2?=
 =?utf-8?B?WVIzWHowWWR2bm9ldjVQS0V6WVkrNFZSazNXNWFXWnVSNEdST3BqRzg4MDF4?=
 =?utf-8?B?MVNNd1Y3cmo0WXpnWnk3TkRuWUNPcUxOQVVVS21GV1dlRDQ5YkRkc0EwMUx2?=
 =?utf-8?B?WFRtTXNvckVnN2ZLNUFvNENqZVhCMmdCZ2hDME9ENUY2OUZ2WE13WXlidnV3?=
 =?utf-8?B?QktOb0k1ZGdVS3ZMdWlRSUJnOXlPMWhxTkkrYTJ6TUZnMEdMdDJIaWRBb0x5?=
 =?utf-8?B?QXlRT3BVdTd3aUk5THNMenVhV2RlT01FK0s3dnhHL2NOMXlXaXVxNVc4T2lh?=
 =?utf-8?B?YkZZaHBZWHRMeEZSS2hWMGcvc01yeG41dGxqTDZZU1pLditZM091WXlDZFpO?=
 =?utf-8?B?by9tWWdMaDJzVHpLWGljUzNsaHU4YTFQNTUrR1JqSC90TnlzMnBHOWdaTVhR?=
 =?utf-8?B?Qll6T09RK1lGKzZtV2dLaFc0bVBwb1lDRm9TcDZEU3plYVVJQmgvcExncVBn?=
 =?utf-8?B?MFVxcFBSMzBQcUpKUEhETnpYQUZwVGNxRU11WVd3eGpXbGY5ZHN0K0w4bDJ5?=
 =?utf-8?B?SThHQ2xWMEhHOTVkL1JWUlMrR0E4NHFSajV5SlNGSTMxdnluSE5SUzF0c3Bz?=
 =?utf-8?B?TWJENkk1cC9hNUpadWtVMnc3aTRTYmdQb25WZG94SE9CY1JORElNcjVoT0p6?=
 =?utf-8?B?VEQ1ODE3TDFzbmlUc2dFY3pnNW1zNUpuV0FSb0hDcHN1Sk56M2VMZTNXZldn?=
 =?utf-8?B?WkRIK1BMVWpaWXhHL0JwUkR4WFpEYkVLbHVicnBLc1ZGc3QzUjUvYVV3c2d6?=
 =?utf-8?B?WTNqeDdPVkFPVGFjNHdIOXB2ZjVPQ1ljTW5McCtnWDVtbjY3SWJIS1NMcm5M?=
 =?utf-8?B?QWhPY3FSNGlwbU5XVTFVMEhTeG0rRHZDWDI0ZFdkSHJoWGZDK1NwWDVrZWNK?=
 =?utf-8?B?RVdTRHhETnE1SmVsTkp6Rzl4TkQwNlZWZ1ZGZzM5KzlYZC9ZdE12MnVEZFhF?=
 =?utf-8?B?MGtLL3lkK3BNbzg0MnkxTUUyWXl4YWRNUkMvRkNrV3BTZW8wb0o0SVY1OU1S?=
 =?utf-8?B?SkIzRXNOdjgraEs1TDJtZ3A2aWJkMldVRDJKUjE0dTJsZlFLYWw2b01DdnJH?=
 =?utf-8?B?MzhhZzZxNitmOWhLOW1JQ1JIY2pCNWRRZURQYVY5V3Jham5nWWZ0QmEvM29l?=
 =?utf-8?B?N2JCa3pyQ3pCUUREdUUyMnZrbW9nc2c2OHNDaTVTR0tnMnV3UlVBNm1YU21w?=
 =?utf-8?B?MWRpRFVtbGNHWENIRkRvVmt2Q2RISDhRbUNPUExFaThGVTBubnQ3TG12Sys4?=
 =?utf-8?B?UlVNb2NxZEFIUnBlT2JqUmFDY25wMW9YMFBEM3hKaEdYT3Q5KytnbWttbm5i?=
 =?utf-8?B?WkpLSUxzbWtycU1iSVY0OTVPK1ZlNW5QTU8vajBVcEtSUFdGNnA4dG9HcCt6?=
 =?utf-8?B?OVFmRnNJaUQ2UXp2bDMxRlliSFlDWTRqLzgyUjVwbnBLSnF0aG9haU1peTZ4?=
 =?utf-8?B?NXo2Ly9BaWVENXNIWTN1Vi8xd3FHdDBSUWF0eEV1MzZQRnBlRllJSXEvRkN1?=
 =?utf-8?B?bjNJeEhBL1diM2hoYldSVDJZS1BJZHF5aEJpNDlydGRZVzJzRHhyc2ZGTTlx?=
 =?utf-8?Q?931tvvLtjT9B1U/GzaerkAiVG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da4ee07-b163-4687-c65f-08dc7ef750f3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 09:19:46.7084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeDHWIbpCpz+P/eliNhEWxOWjrB16xHWQrdCX72MFc2jhrVOuHK65DmY9TaWy+23
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952
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

Am 21.05.24 um 09:16 schrieb Thomas Hellström:
> To make the transition to using lru hitches easier,
> simplify the ttm_resource_manager_next() interface to only take
> the cursor and reuse ttm_resource_manager_next() functionality
> from ttm_resource_manager_first().
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++-----------------
>   include/drm/ttm/ttm_resource.h     | 10 ++++---
>   2 files changed, 27 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index db9a7a3717c4..8bfbddddc0e8 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -496,50 +496,44 @@ struct ttm_resource *
>   ttm_resource_manager_first(struct ttm_resource_manager *man,
>   			   struct ttm_resource_cursor *cursor)
>   {
> -	struct ttm_lru_item *lru;
> -
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
> -	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
> -	     ++cursor->priority)
> -		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> -			if (ttm_lru_item_is_res(lru))
> -				return ttm_lru_item_to_res(lru);
> -		}
> -
> -	return NULL;
> +	cursor->priority = 0;
> +	cursor->man = man;
> +	cursor->cur = &man->lru[cursor->priority];
> +	return ttm_resource_manager_next(cursor);
>   }
>   
>   /**
>    * ttm_resource_manager_next
>    *
> - * @man: resource manager to iterate over
>    * @cursor: cursor to record the position
> - * @res: the current resource pointer
>    *
> - * Returns the next resource from the resource manager.
> + * Return: the next resource from the resource manager.
>    */
>   struct ttm_resource *
> -ttm_resource_manager_next(struct ttm_resource_manager *man,
> -			  struct ttm_resource_cursor *cursor,
> -			  struct ttm_resource *res)
> +ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>   {
> -	struct ttm_lru_item *lru = &res->lru;
> +	struct ttm_resource_manager *man = cursor->man;
> +	struct ttm_lru_item *lru;
>   
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
> -	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> -		if (ttm_lru_item_is_res(lru))
> -			return ttm_lru_item_to_res(lru);
> -	}
> -
> -	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
> -	     ++cursor->priority)
> -		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> -			if (ttm_lru_item_is_res(lru))
> -				ttm_lru_item_to_res(lru);
> +	for (;;) {
> +		lru = list_entry(cursor->cur, typeof(*lru), link);
> +		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru)) {
> +				cursor->cur = &lru->link;
> +				return ttm_lru_item_to_res(lru);
> +			}
>   		}
>   
> +		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
> +			break;
> +
> +		cursor->cur = &man->lru[cursor->priority];
> +	}
> +
>   	return NULL;
>   }
>   
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 1511d91e290d..7d81fd5b5b83 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -272,11 +272,15 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>   /**
>    * struct ttm_resource_cursor
>    *
> + * @man: The resource manager currently being iterated over.
> + * @cur: The list head the cursor currently points to.
>    * @priority: the current priority
>    *
>    * Cursor to iterate over the resources in a manager.
>    */
>   struct ttm_resource_cursor {
> +	struct ttm_resource_manager *man;
> +	struct list_head *cur;
>   	unsigned int priority;
>   };
>   
> @@ -438,9 +442,7 @@ struct ttm_resource *
>   ttm_resource_manager_first(struct ttm_resource_manager *man,
>   			   struct ttm_resource_cursor *cursor);
>   struct ttm_resource *
> -ttm_resource_manager_next(struct ttm_resource_manager *man,
> -			  struct ttm_resource_cursor *cursor,
> -			  struct ttm_resource *res);
> +ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
>   
>   struct ttm_resource *
>   ttm_lru_first_res_or_null(struct list_head *head);
> @@ -455,7 +457,7 @@ ttm_lru_first_res_or_null(struct list_head *head);
>    */
>   #define ttm_resource_manager_for_each_res(man, cursor, res)		\
>   	for (res = ttm_resource_manager_first(man, cursor); res;	\
> -	     res = ttm_resource_manager_next(man, cursor, res))
> +	     res = ttm_resource_manager_next(cursor))
>   
>   struct ttm_kmap_iter *
>   ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,

