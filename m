Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41029665704
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 10:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB91D10E4EF;
	Wed, 11 Jan 2023 09:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795BB10E2B1;
 Wed, 11 Jan 2023 09:11:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dF9HWjW+katRGtSk8fyuqzV5hUGjJlLFrgMYnChJaV8LXIHrfPpx/ZPAAX7EEOS0zR3zlLdP3TlzbpVY65deK7CnK6A6Hfo5fhBu/BYYV+is3aCwkgcpSnnqZLuzmm7XKNbN+Adl+BNcWJlhAL/MZUVwlYtoIfOGCOihBFzCH7XoppfM8GpAIvq8cNrfpAADa1UH2eb++4E1PYdYh2CP2QEWcjmE5IoAABafuy4LHPyuPcgcgs/fAne8+coYqz8dschkd9E2QUp9I2rtZ0WSR0IpY9vgm/8clNwv6RH/5CpIjYFrtIrqFk0Fk+o8MkqIfosfzGwyy4S1rKdcTZ4sdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etMkvZ76u8jE/lDZ3/XJcL0z2FHNbQsBiI0pDTURS0g=;
 b=dZksZqZbpWObHap+WdD7BJSrgvyf2puvGqGpDTAGedQTJxkNsOgekPaIrCXSJy1fE2TZeMvTIGD62G6tP+Ru5exaRrhlTFWoMT4q1DBxcyHA3opFJrFFNzFI5krXvppgdCddxUSENDyHTfkuH8SJputo2gvtLlFn2WNvAX+ETRBpS4bAeYxesZ2JQGc77W6qK71BgLJW3pKHNuz7LAd7nn2mzdXXMUN1SvfhTZdgrM05RLWKSTz2PBRMu/9BXeldkBGuN2W/Dr3qLD6ZmHF8I4hkvXSkdTzy45ZOZL2DfAWQQhkRg5wRKyP+RqKrH0DZAIFh1en17RHzyI2+Io5ICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etMkvZ76u8jE/lDZ3/XJcL0z2FHNbQsBiI0pDTURS0g=;
 b=pR4FuOtFqv190afndO+Crjpkti23RvTvFlBi5+Oi8JpMZA+a5nVWbXvsEXaR3URuxpwklSYodlBZfkrX3IAQRZp8fkJRyBYIroxiurp5fjgZCmCuy0ZQaVgsUsVXZe21hVG9tUqLARKLm1pFDpuqqfb/7Jc+wdEU8j+U1h2h2dE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 09:11:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 09:11:35 +0000
Message-ID: <c15c5f15-4356-1181-cf2f-6b4d8405a34a@amd.com>
Date: Wed, 11 Jan 2023 10:11:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/4] drm/amdgpu: Clean up page shift operation and GWS
 and OA
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20230111063524.2374038-1-Amaranath.Somalapuram@amd.com>
 <20230111063524.2374038-3-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230111063524.2374038-3-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: a0304a02-62dd-42e0-b260-08daf3b3d6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGutY+OBi5KF3Pt5dSbBUaUvtqTIM1Dohxa3EaC2oRHR1V9BFwOfVm+2QK59xoLnFS3uXpNtJ9iYlCeP1rRT8DnhWh3RPlPyIX0zEiOA3w/WQmslqh4al+fVGh9Z3K10ue1hiZkGCjJsiDbEcI4Otyi0731KaiVBkfE2W/YaQwekMbLR3MEKp4T1eKnf4yktd8o/7lUvxM98XUJgmpIK9uIlvV2A6hgwh7z/WENYkx2vD7613nvqGTHTdDUIciF8NNDj8xivVXB769NB0j2MvMgntFjSqtLceF4CIkzMi42+kAv6HWfDnyg7az+0FlNa87i5Qirq2iCkZK4WtxGUcH6Qy6IJLbTRDhb6Nz/ihjgpgoDakv4nl4+PRGB1I0V0FDyBNfK/iGwwaeRsYXOPHY4jknKe8w6ojsg39sq9egTphq9NEMFIRLPz4Uz39WjMNpFgN4dKZv7/4o9NgxX6XEeYicchQCr6kjMbBFK1CiFT+gv94dqJ17DEAVIwyZqfPxqZzKPeYF8dgs9qdH2z+xrejmeUNJT0qCXyKrOFAhHMiAA6NoXUOJR8yuhhpH9ewYw1XaONXwLlEu3FrIaofkJ/O8hu/vzMAbotL4yf1GloTCa2vSZ8wkS5PpTGnoRVyS7p/HWb5WR6zt+D0aeOPLGm8jtR/EEb09bCJe7/GmHQAOrCUe+E6EutVj/7QlI8kN0JOoB5T6YxJdL7JwpRyekiqIrCy9XtcLBu7RdVNGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(2906002)(31686004)(4326008)(5660300002)(31696002)(86362001)(36756003)(8936002)(41300700001)(8676002)(66476007)(66946007)(66556008)(38100700002)(316002)(450100002)(6486002)(83380400001)(6506007)(2616005)(6666004)(6512007)(478600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU82N3g5ajE1V3NRd1FBUlppY29MQUZ5a2xaeDU2MmZaTnlzbFZVL3RWNERR?=
 =?utf-8?B?TTFFenVnaDdmeFppb3lrdmYyRnM5aWxoRUIyd1Y4UG04UnpoclBIU3BzSzNs?=
 =?utf-8?B?a0VCNGV4YmNYZTl4ZWVCdldjM2pURTNWZWtrcUplV01nRWowUkZyeWhIRUsy?=
 =?utf-8?B?Umg4bzh2TUhjaEl3Z2I0QTV0aU5BMjdMMWJSUUVqWmR6N3dMMkREd202aFN3?=
 =?utf-8?B?b2ovVmlzQlNRSFl3WVJTanhxQWVQVWd3UXMvekdzei9TS3gwdWg2a00ySWdv?=
 =?utf-8?B?OEY4cjQ3N25NV3VYU0tCb2JvaEE4OUhLMUorYlFRRWV0YVlEWXRaMFlNb0Fs?=
 =?utf-8?B?NEVOM3dvbDlWSm83eWY2b3BURXdnZ0JIaE5SMUpSWDhzd2toOUZOZ3lyZ2x4?=
 =?utf-8?B?R0VUSFNVcjZSMWREb0dNU3lPVVRvM2toODZMMFVrVnU3bDdoNDAyOUNDRHFn?=
 =?utf-8?B?R1JQRzZ2WkY1Z2pZYTNsOWRRdUpXVml4TmUwTHltcnkxcHd0d1I2M29LMWp4?=
 =?utf-8?B?MThITzM4OEFYcGI3aU1qSzI0UTJDU0ZUVzluZEF0Z2wvVS9ocWlVVWxsZENj?=
 =?utf-8?B?TUQ4d04vcGErVkRVWDd6ckF4UE4xbkdYdnQ5RVpoRWlFaXhHZ1BGUWI4MXd2?=
 =?utf-8?B?ejArWWZtQlBrQXdmb3Y4UjhRcnpTNjhCQ0hDcEZPSFNOWjBnSnFOdE5md2Yz?=
 =?utf-8?B?c0hSS0dHUzNuSHJDcVJQMUl0Wm5MSWlLUXRSeUt4N1JPa3NMOG42Wm04Nkd1?=
 =?utf-8?B?ZjIrSVdvYitTbG5YQlNwZ2NyR1NsQ0dvdTZsc2xWWnRTbUVjTzBIdHZNY0sy?=
 =?utf-8?B?VjgxZk8wYjFJNmJpY1Vkbk8rMWVjckpnRmZBQTZacTRmaDFmUytudmVsZ2FC?=
 =?utf-8?B?RXJMQzIvaml0UXI4aEFQTE5qQnJjQ0x1TkVPTmtwTXhab0R6bWtpUURvQnZI?=
 =?utf-8?B?OXJIa1piTkYrTEw1MlVjL3ZEU3NDMWtNbFBNaWNqR0R3UVNEOHNNaG9LQmxM?=
 =?utf-8?B?TmhjdlRYWFlZcTN2NlNGYktjdHhqOGxSNlFRVVd2RXRlc0t0U2FidU9mNWRD?=
 =?utf-8?B?dmtZNUwyOTVMR2NHdk1qKzNVeGxnS3R1WkVaSEFrWHJieWVVK3laU1FJcW9S?=
 =?utf-8?B?Snl2MEwxMm1jajRtcG5VbnZHS051NXB4UWVyd09OSEptSVhuQWVMRE1rbkRU?=
 =?utf-8?B?SVVLYVRUdzdaNHlweHBRK01IWTNZRDdIK0h1ZFlvajQrRDZ3UGd1WDNtck5a?=
 =?utf-8?B?RytWbzJoSVhRUU5oczUvdzRFSmdIWjk5aFh6SlJibXVRaFhOemk3L215QnNr?=
 =?utf-8?B?eTJteU52aWVIU0hweFJaTFFUaE9PdW1LcWFXenMzRXJ3K2thSTFJMG4xMENv?=
 =?utf-8?B?dXhyUlZkZUZuSnZoSFJrb1JyU1Z6MnRsRk5DSXoxWlRWSHQvSXdrR2tScGJa?=
 =?utf-8?B?bFcwcVdCZXp5UEh6UGRkeldwWHNES0Y0cVpkTHU4RHY0a2tYZFcvTm5GejRx?=
 =?utf-8?B?a2JZd1c0c0dyeWRjWFc5WFJtTWlLbStZTHovK0sxQXF1dHFnb1JrbnU1VWpG?=
 =?utf-8?B?N0l6c0p4VFFmeWgrbUNQK0pudWZienowaEw3QzdMWWllRnNKdW1qRGlpejNO?=
 =?utf-8?B?RDNpa1MvOUtNQ25pdjlSaFVqanF2SUVtd2tlSTc1RnpxUEdoTGdOOXdaTW1m?=
 =?utf-8?B?ZkN5eVYwY1hMS0JUd0dldG5sRHpiYzgvUnZzajQzZWloa1UrTUNZQjNHMml6?=
 =?utf-8?B?OFJCNnAzQVFpMVZyM0JEVEU3TVRxYTNuMzdqcGlhVkc2ek1aUFVmRDEzZUh0?=
 =?utf-8?B?c0svNTVoZ09WSExHakd1cjBKejR6d2x6d29PdE93NGd4N1JacU1SdlV1MjJI?=
 =?utf-8?B?Z3k0elBvS1pEVWN4VVFJVTkrSzdqYkU5c3hxMlRGc25Oc0NlUkNQNGRxbm1H?=
 =?utf-8?B?bGdhNzh6MjlUcDdJZkE5SWZ3SUR0TSttUjFKVHFvbFMxdHdMdmVuVFRtOHMy?=
 =?utf-8?B?Q2dMMUhoMVQ5OFZncU5JZVFhc3FTRUMrQ3BvR3JlY2EvbkNtQzVPd044OXZO?=
 =?utf-8?B?eVNnV1NGWG9YdWNGZzNsSFNDSkdoVE9oenlsM1REZ3RZNjhjYmxQcUtPaUls?=
 =?utf-8?B?OVBhSktmYXpsczNCVjNWcmNRWEN4K203R0hYMklPa0ptdzhiM2FPOU9oYWo1?=
 =?utf-8?Q?v5srVLyyqxeqR1ms5Dj9/Xv15DCJ3ApVHyL8CWeQ7Bes?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0304a02-62dd-42e0-b260-08daf3b3d6c0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 09:11:35.6025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMxKm3sfwblhOtfqs4geDGrSwQiqj/ATZziaIoV2RPzUHnsKKffL/EuwzSUXfkOM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8131
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.01.23 um 07:35 schrieb Somalapuram Amaranath:
> Remove page shift operations as ttm_resource moved
> from num_pages to size_t size in bytes.

This patch here is at least missing to remove the shifts in 
amdgpu_job_set_resources():


         if (gds) {
                 job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
                 job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
         }
         if (gws) {
                 job->gws_base = amdgpu_bo_gpu_offset(gws) >> PAGE_SHIFT;
                 job->gws_size = amdgpu_bo_size(gws) >> PAGE_SHIFT;
         }
         if (oa) {
                 job->oa_base = amdgpu_bo_gpu_offset(oa) >> PAGE_SHIFT;
                 job->oa_size = amdgpu_bo_size(oa) >> PAGE_SHIFT;
         }

As well as adjusting the call to amdgpu_ttm_init_on_chip() to be in 
bytes and not pages.

There are probably more places which I missed to mention as well.

Regards,
Christian.

>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c     |  4 +---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h | 12 ++++++------
>   2 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 974e85d8b6cc..19ad365dc159 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -541,12 +541,10 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA)) {
>   		/* GWS and OA don't need any alignment. */
>   		page_align = bp->byte_align;
> -		size <<= PAGE_SHIFT;
> -
>   	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
>   		/* Both size and alignment must be a multiple of 4. */
>   		page_align = ALIGN(bp->byte_align, 4);
> -		size = ALIGN(size, 4) << PAGE_SHIFT;
> +		size = ALIGN(size, 4);
>   	} else {
>   		/* Memory should be aligned at least to a page size. */
>   		page_align = ALIGN(bp->byte_align, PAGE_SIZE) >> PAGE_SHIFT;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 5c4f93ee0c57..f92b61350efe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -91,11 +91,11 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   		break;
>   	case TTM_PL_TT:
>   		node = to_ttm_range_mgr_node(res)->mm_nodes;
> -		while (start >= node->size << PAGE_SHIFT)
> -			start -= node++->size << PAGE_SHIFT;
> +		while (start >= node->size)
> +			start -= node++->size;
>   
> -		cur->start = (node->start << PAGE_SHIFT) + start;
> -		cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +		cur->start = (node->start) + start;
> +		cur->size = min(node->size - start, size);
>   		cur->remaining = size;
>   		cur->node = node;
>   		break;
> @@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   		node = cur->node;
>   
>   		cur->node = ++node;
> -		cur->start = node->start << PAGE_SHIFT;
> -		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +		cur->start = node->start;
> +		cur->size = min(node->size, cur->remaining);
>   		break;
>   	default:
>   		return;

