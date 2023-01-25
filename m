Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A35267B1BD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306B110E79F;
	Wed, 25 Jan 2023 11:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011C010E79F;
 Wed, 25 Jan 2023 11:41:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hh96GsLHqTYBxsBHnCeuWm9vPm54cwXG7tA/LDVfnbG+6cKGLpG63RZzIYsxpdKnOpR3WGdRBDX4cRffgRAEMl7cgLe9bdMPq4aL50+A2g5gyt14uwaJDEltKX+AstM6RUZJl/QZsb/9nsyTc+cyvRhlCSfFb1YLop+cdxqDjwwhG4f7LWGUFZ6aHo+ygPawtJ7Jpt8oFgzI7bxYB4t6FNuKeJXAAPz63x9Hp7/BPvNtBq1VpV+K3ScM0z7tX1Ii2vbTj5qQdYwp7mAYnwx6WvlWGB7Ng1hMcTakajoFnRkxQzDNZx1g0ZPYrWKATNmHK2lomuJ55QNPzzBtsDp/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQJmfZFz+HpxPB5446KdzR7cUAjvp3VKkRBTxNl3Zfk=;
 b=cHoZKK0L8qNWn5RxPBcYw8V0Yp2iUEv7gBnA6mP+PmD/ME43eRUGfeNtWKnVPwML8cyk6VdfdrC52rwZZa2wAlYPUhA10ZEEtjGSSxe0W1nch4xd1Il8APcM5tvka81kXDki6NtgdXVECV7VdYl2okjCj8EWKXeA/z4NvEOi4lo9Xqb/qE0P7CI4hXd6vapsLi3aIy4wkqINY3bV5gBcjCY3pRPwLv1EHXIBKN+W7BZLV6yttWYRecBqtF3ZtUuQmw1anGfviXUbPkadpcGx4++8Aps0I9Ih2nrVq52YyurNOb8a7vVO7QNLER5aR9zMUXk2Y0/73SpIr27F+ZVU5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQJmfZFz+HpxPB5446KdzR7cUAjvp3VKkRBTxNl3Zfk=;
 b=bB2k/yNOd86TauH0XBE3zRY/37oqc+1JEevsYTXwBi4mtavGnCRca2/VJlUD86tMKpnvblv0KlrvIBrDvRrfL/qQC+jnM1vjchBZPPAf1wlbLHFbiozqdP6xjYofpq5d+3R9jEl7Zxm/6strloFmvZlmrAkUQdHPlZh7UfoYhb0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8248.namprd12.prod.outlook.com (2603:10b6:8:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Wed, 25 Jan
 2023 11:41:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Wed, 25 Jan 2023
 11:41:50 +0000
Message-ID: <9326e71e-5fa8-c99b-bfc2-ea74e8d02a59@amd.com>
Date: Wed, 25 Jan 2023 12:41:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/4] drm/amdgpu: Use cursor start instead of ttm
 resource start
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20230125104838.23596-1-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230125104838.23596-1-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 021d7dc5-093b-421f-c97f-08dafec9257b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUVRhcGgTc+MN1a4nO4zvj1tRL+idSMLwdYb26DgObts9MzyJb3q8q3V0PpUDZmta/SRMuCgi+T/SD7Gh2oHuUIRxXOYGdOdumN0lmYTPeE/MLa854wZ4XnjtZGaFOG+fJ981rzr1X2ndu0zCJizPWqgtUKZ0kWVJRRajuVHKoPVCGwED7u6p1l29tGNBcWSBcykezIbaXwtxmtpD8Ja+Xk2Vd11r9nKO7dbk0hDNIQ85PRAvwg306xHd/49860bqvYV1fpCyzIIjqnU3ars4UUDfe4/b2TQ8D7qDKp3PnBRHXFdVdNyloCeiipu8ly6UBGsdD6IMQ3hGyGggmFCChBJdZ7gas2hya7EvMwcq1Cw0gdHafOY/vRQIaOCSMZHz1E1dGKNeCVvtSF5tYtCrfDZfftIwz0PUcLcsmFUVT9wldtUWo0VwuR5ZfHRg9XyLhjnTOu4R8QMwtncj48q5k6bRn7z9gVpaPN1Y3JZw5zjDT5esQDpyCYlNnUW2AIZ/B/5ABttlO6x4OHWd+LOnPKy8zjxDAE7EUx1V1Hzesui1Durys9g5PG6N/Qf0AOBa5D7rlLbhUuBgfGo//nMC2rIL2MvO56TREfe1AfDe8yLBnOfriR7t90wWj5vlOvQMXBPZFyfQrf2nq/OgXiLl0niMZKKhvEV6QuJUe5MUnZpD7eNbHlqGGo0hkeLgM9d5MAez97gDTFXtL9O8Gtff0MnDiracj/wULJ8c8CimOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199018)(5660300002)(8936002)(2906002)(66476007)(66946007)(4326008)(66556008)(450100002)(8676002)(41300700001)(31686004)(478600001)(6486002)(6666004)(6506007)(186003)(6512007)(2616005)(83380400001)(38100700002)(316002)(31696002)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0YzSEtQVkk2V3FuSjRlaHFDV2pKUWsyR0hzdFhFVTUvdkJOTkx1a3RwbWg2?=
 =?utf-8?B?UlhQam1yNC9hb2wvdVhsNzB4QVpNejVBYjdmUU05YUs4MUdqazIxRmwwV1Fx?=
 =?utf-8?B?bzQwTThPamlvQXpXeGVqTDNHUk00Ymw0UEFmRm94ZFBQTUg4YUwybFk0dVVu?=
 =?utf-8?B?YjZDbFhucGhHbmlwUzcyWlhHVFEwQ0VKcHRuTGtkU3NDM1EvUnFhdEdrekNt?=
 =?utf-8?B?Rng1amtGS2M5Nk9WeXJuT2NXaHI1aWxqMThzS3NZMHYyM1ZKUzV5bkZORmZB?=
 =?utf-8?B?VjZiMzJWV2ZkMXBlM0tCdy9uMDRaTFhpaTNhRzhIV082T290UmMyTDk2UVJw?=
 =?utf-8?B?d1FVNm1Oalk1eit0RGQrcWxNU01xVUtqZ2liMFBmMU1LZVMxUXFpWGxoSnht?=
 =?utf-8?B?eEdhVUZTZCtoOGhsRXJoV2pSRUJ6Q1BkU3FuRzgxdE9EN0NjVnM3VnIzSXgy?=
 =?utf-8?B?UWl1MjhPOS9ha0dlQ1NYdEZZeTduQ2FtbkE3bkRLanRZd2hwYnRFYlExN3c2?=
 =?utf-8?B?eE8rZng0dk1IQ09aL1hRV2g1aEw2KzJjNmF2b0ZJaCtTQVhGMUEyUUwyK2tk?=
 =?utf-8?B?YWdVRTJENHN3WjRVY29mcFREZlVScktHaXlmRlNzWEtsbjBzdk9Oc29hdkhT?=
 =?utf-8?B?V3I0RVhxRlZTRzhNREdNcEpkT3JOT3hHOHozZXlURHlHbFNRQTBWelZEUFdZ?=
 =?utf-8?B?U1VKZHJ5THgwdEhpNnE3Z1lPUlM5ckluOFcwanA5cG5KTzV2SDJXYkJBUmZz?=
 =?utf-8?B?OWxONmx1TE0xd3QvN2NYOVNGTVZBdUNtUzdSemZkOG0zeHlRM2ZuWXlONUhO?=
 =?utf-8?B?ck9XM3daazVRMzdZMDZOcC9FNWV3NWJVcDlxQXoyeis2ZURMYmdscXF2aW9Z?=
 =?utf-8?B?RlJla29BbmV3TVMzZHBzQ0NVVWs4R1I4K2ZsNElGR1E2QmtzSThtMXJSTjF5?=
 =?utf-8?B?OXlnSXZOK3hIRHFLT1N1S1F6dFh3bGJZUGtHeExndFVJaU5kdzNzQ0pHZ0F3?=
 =?utf-8?B?bS9mSnBzLy90a2JiTmFvbmhJWXNyeURFekRYaUZkUS85Ly9qV3hUNjZiVjU2?=
 =?utf-8?B?MVZpTm1DcjZzTTNoeDF2SFRlV1cyeWdiaVdtZnlMUjVHeWUvQ3Z1bDdBR3h2?=
 =?utf-8?B?S1RGYWFtYUdHNmlCaTVTeDBhVjVkRWorZlNheWd1bEJ2Q2ZJdlJ5UXBtQjhy?=
 =?utf-8?B?bU9lUHhGWlNVcVBLMzNiM2gvSlFhWXNWYXhQdUZ2UktXU0dTYjZXNFBzZmIv?=
 =?utf-8?B?OGpPRlM4WFpDRTdZLzIwR1RJSThIaEpSWXJBQTMzRkdwTmRZY1NkY2pEdlZO?=
 =?utf-8?B?VVhGUEpKTUtiSGloN2JFekttSnZEL05IL1ZOc1Fqc3ArSFVvWUVTR1orWnNv?=
 =?utf-8?B?TmF5aWd0bE9UdW8zVjdoVDJJV2xVVmVkU2xBMnpjOWtHY3h0aDZCM2x0Yi9j?=
 =?utf-8?B?aUFFVjJCczJFdDQwOTdCWlJaTlN3eGlza1N6d202T0N1TG1KUlI1UXhsUXZJ?=
 =?utf-8?B?ME8rUGJHZXFQMHVOdWZGY0krd2JubzF3OUVUb3pTamxncmhFcGlSNnd3MzJT?=
 =?utf-8?B?K0h1ZU1ZK2hUN2s4MDZBWkQvb3Q1QWlyQ2Rpa1dEdXltNGg5TExIVjZMNmZM?=
 =?utf-8?B?YlhjVWlKRnM2NE9hOUlVM2pxbWN2L3Frc3Z5R3o2VE1BZGM3d09hVElUdjVQ?=
 =?utf-8?B?Y2ViazFoNHNYM0xqS3FQTGxCbGlFWUhMOVVPV0VtOCtXdURrYi9jd29kbjFq?=
 =?utf-8?B?eXZQVzlTWmdmUHVZQVZjTXBSQVhCQldnalkrODYvaVhoTFFaME91aThjY3Qy?=
 =?utf-8?B?d0N5Um0yd2RlTFlsOXBla2dKbG5oeFlITTVmYUkwUWtuMVRrbWdCb3lwcG5Y?=
 =?utf-8?B?QzhBR0VBWW13NUhYSDlVSHRVNnJ3Z2lzbzNJRk1lZFdrUGhkR1k1Y1p2dUlQ?=
 =?utf-8?B?bElDNTJJV2E4Nmp5T2dlbHE2T2FaMlRMc0QwZFJBS3RvRitSVUx2bnVsZnBN?=
 =?utf-8?B?RFd6OXoxQmV4Tnd1L2ZvY1QrWldldlEwUVViSDF1YXRaMjBSKy96MVEwSmJY?=
 =?utf-8?B?bmtkQkVKUWxVb2dITDE4cDVsUjdlTDZFWGpZM3hDTXEwOHlUWVJISzBmdTRC?=
 =?utf-8?B?QllmLzhYaVV2ZFM0aXJkaGlsYkh4QzF5TWEvbmdqOTNSc1FYZURVenl1YkhI?=
 =?utf-8?Q?AhnZHzvZmzyJF3QUe7FQssZ091/8bEgiXA8OsduTEMk6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021d7dc5-093b-421f-c97f-08dafec9257b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 11:41:49.9597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olmeiV+5zTqYHvPDDs2QqWLbdGybgatBdFsQjDJtiAQgrdk5eoOtWIV+cjXEV0N/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8248
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
 arvind.yadav@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.23 um 11:48 schrieb Somalapuram Amaranath:
> cleanup PAGE_SHIFT operation and replacing
> ttm_resource resource->start with cursor start
> using amdgpu_res_first API.
> v1 -> v2: reorder patch sequence
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 ++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 10 +++++++---
>   2 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 25a68d8888e0..2ab67ab204df 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1346,6 +1346,7 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
>   	struct ttm_operation_ctx ctx = { false, false };
>   	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
> +	struct amdgpu_res_cursor cursor;
>   	unsigned long offset;
>   	int r;
>   
> @@ -1355,7 +1356,8 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	if (bo->resource->mem_type != TTM_PL_VRAM)
>   		return 0;
>   
> -	offset = bo->resource->start << PAGE_SHIFT;
> +	amdgpu_res_first(bo->resource, 0, bo->resource->size, &cursor);
> +	offset = cursor.start;

That won't work like this. We use a virtual resource start for this 
check here.

>   	if ((offset + bo->base.size) <= adev->gmc.visible_vram_size)
>   		return 0;

Just replace this whole test with calling amdgpu_bo_in_cpu_visible_vram().

>   
> @@ -1378,7 +1380,8 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	else if (unlikely(r))
>   		return VM_FAULT_SIGBUS;
>   
> -	offset = bo->resource->start << PAGE_SHIFT;
> +	amdgpu_res_first(bo->resource, 0, bo->resource->size, &cursor);
> +	offset = cursor.start;
>   	/* this should never happen */
>   	if (bo->resource->mem_type == TTM_PL_VRAM &&
>   	    (offset + bo->base.size) > adev->gmc.visible_vram_size)

Same here, just call amdgpu_bo_in_cpu_visible_vram() instead.

> @@ -1491,9 +1494,11 @@ u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo)
>   u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct amdgpu_res_cursor cursor;
>   	uint64_t offset;
>   
> -	offset = (bo->tbo.resource->start << PAGE_SHIFT) +
> +	amdgpu_res_first(bo->tbo.resource, 0, bo->tbo.resource->size, &cursor);
> +	offset = cursor.start +
>   		 amdgpu_ttm_domain_start(adev, bo->tbo.resource->mem_type);
>   
>   	return amdgpu_gmc_sign_extend(offset);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c5ef7f7bdc15..ffe6a1ab7f9a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -849,6 +849,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>   	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(ttm);
> +	struct amdgpu_res_cursor cursor;
>   	uint64_t flags;
>   	int r;
>   
> @@ -896,7 +897,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   	flags = amdgpu_ttm_tt_pte_flags(adev, ttm, bo_mem);
>   
>   	/* bind pages into GART page tables */
> -	gtt->offset = (u64)bo_mem->start << PAGE_SHIFT;
> +	amdgpu_res_first(bo_mem, 0, bo_mem->size, &cursor);
> +	gtt->offset = cursor.start;
>   	amdgpu_gart_bind(adev, gtt->offset, ttm->num_pages,
>   			 gtt->ttm.dma_address, flags);
>   	gtt->bound = true;
> @@ -916,6 +918,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
>   	struct ttm_operation_ctx ctx = { false, false };
>   	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(bo->ttm);
> +	struct amdgpu_res_cursor cursor;
>   	struct ttm_placement placement;
>   	struct ttm_place placements;
>   	struct ttm_resource *tmp;
> @@ -927,7 +930,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   
>   	addr = amdgpu_gmc_agp_addr(bo);
>   	if (addr != AMDGPU_BO_INVALID_OFFSET) {
> -		bo->resource->start = addr >> PAGE_SHIFT;
> +		bo->resource->start = addr;

This doesn't belong into this patch and would break if only this patch 
is applied.

Please move it into a later patch.

Apart from those comments that looks good now,
Christian.

>   		return 0;
>   	}
>   
> @@ -949,7 +952,8 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, tmp);
>   
>   	/* Bind pages */
> -	gtt->offset = (u64)tmp->start << PAGE_SHIFT;
> +	amdgpu_res_first(tmp, 0, tmp->size, &cursor);
> +	gtt->offset = cursor.start;
>   	amdgpu_ttm_gart_bind(adev, bo, flags);
>   	amdgpu_gart_invalidate_tlb(adev);
>   	ttm_resource_free(bo, &bo->resource);

