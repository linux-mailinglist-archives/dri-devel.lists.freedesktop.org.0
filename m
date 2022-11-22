Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416EF633681
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 09:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FF210E3AB;
	Tue, 22 Nov 2022 08:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5F510E3A9;
 Tue, 22 Nov 2022 08:00:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdcMZJihEEcOiWOLuAN9UdYjLzRP4FBpEvhOJ4XavKlxK1JUGOCe06h5KaId2hn8yl34oUln8a98gaXr7pdi9ANlswqbezCZperT5u452LUgMv2Hk6VtxyB4sAQJcEbEgbSIqXemnriIAlrdgX8344nYLCSaqowJNCOeKQpRK9W5KobZOYvyjRT8iOGn/A0+5vK6h5oomSwkt7Ngqtz2vCJqtfOix+ZKl197yfkKN9DLVCrA5eQq8HJYD5NYoBhhSCoIdfqcLLOCSdQdzdpEAwLsDHn0cPNdd3DFDCdtXYMYr7GevpL/aI5VjsWcjsW3Yv6W2GGrB82Vgtc/O5V9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/324b4Vq4BanEc6DE9Wurz17y4TJLWk5ssP4CxDlpI=;
 b=lKaJ9Ukb8/TIEs4BqQNYLtRhIoGdv7npmRa/us0XWuogZK9k7lYtQdSGhKTN69maM7k5J9XirXBb/3WmFz+ShNbz5JTnvEEc9rBVKMPe651EmJKymldMf3SFZ2wumCOe8IVlG9/80RUGFc5MoOOEmQKoxWcl/ijdEAFMqumrSCk+9iIli2V8ahlc6vxDYdFBajlc68iiHI5nxqCq+1E9J9Kwb5Io57CRyqFEzvUepD64Anfsog81+E4iTvyi5aMU2noFVZopOMCTDdpQ9dsW0+Auq5Uh+qziIrFGap5S3b/yMbopl3oTYrYAAIja/38qofE/JyJiaSG6pME08TImqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/324b4Vq4BanEc6DE9Wurz17y4TJLWk5ssP4CxDlpI=;
 b=FH7dLXzYhFnf+1UOuXMz5rLcDc6gvNhArUooCmqjXBvcL5vF4+U4Ps5Z19IIUvR8LObGPdB9mlLd7D6jGmjQNR+agfmQkbEXX9wdRGXvjayOkXsoFuiknOgiKfgEIxWSOeMcqNPcv0iXasKn2TPqQlb+kXerpf1/9LbjTpQ1YQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4592.namprd12.prod.outlook.com (2603:10b6:806:9b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 08:00:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 08:00:28 +0000
Message-ID: <e6104ecf-96c3-7895-6986-ee9fafbac4ac@amd.com>
Date: Tue, 22 Nov 2022 09:00:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1] drm/ttm: Clean up page shift operation
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20221122075144.505736-1-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221122075144.505736-1-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6a9227-85f9-4fa6-252f-08dacc5f9ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DxNuKt8qDNwo1eLGxqXjaKrikbMkFasIwRUUpV/JHusCx2kIihx3vyaIavykIK6wryDerF+oJ+FZ3DdbPk340LPmZ9xcoO2QKV/bnJQTPcd+A1f3KPPamIXGwtpATXUsBNVPpqwmUGmKtMAP/lBRSY6eFR0BURtW8JRohIOIAtPdr+tzA+M2jvzfeIjccnQ89xZ7/Qhdc3LEDQ/1pw5uhSqiC0jI8HuWkT9zTnkb3/s8CZXSsWkSGON1BaPdOvsZI4q74ttEupNW3pt4M462qYTDWIdJ+Zq/kEVMUmmgeOR5YrSYhcm2+EC0INhENyKmI8RG+6e6Wb9lQA0byocfzblrQPyv8h/ZkL60t7x7KS9wrOcIkXoYxRHMiMQluSRLC/d3Iz/2cSsWfEp36+/SXtAniaNvga0e7VOXUO6vRUbQI+eOgvPSh7yDQHga3uuXkrAx8vdi7IgjHmQg/HA6WyrXfv5ZcTAbGp3lbr/BJHh9CUncDZK08i69ONaCrnMqMpjFQiT62VCx0o10NvAaFcJQRWlOJaQEA3V7mz15Scmtb+m1+ONfsZcmVxX2gtWuk4dmu6wz1K7y0o14uQXafCaG6YubH4LsxsaUUFqP7lD2lS8mXoF2niCvVFizH+BKrkI0mvISGSBp1VutTKx0pRJVgsIMoCcSf3tUjAUIHrdreBxJUcQgO9FWjSnxI1sOxCO+knC71207piFj4227GPTsCtSJlryQqVlx0JLdYSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199015)(2906002)(31686004)(450100002)(2616005)(66556008)(66946007)(41300700001)(36756003)(31696002)(86362001)(4326008)(6506007)(83380400001)(38100700002)(5660300002)(8936002)(6486002)(8676002)(66476007)(186003)(6512007)(478600001)(316002)(6666004)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZqRDMrYk5EbUhhQ2ZqSndGeGc3aWgxN3F3VlRIb1hUSXdRM1BVNWRLM21Q?=
 =?utf-8?B?ZjFoN3VXL01PUnpON1c4QU1zUTR6RjMydmhNRGNlQnZHL0lZV3gyQ0x6c1h1?=
 =?utf-8?B?NHVhYkZsdmQvQ2dGNURFOEVZNzZFSFRGNWY1dTBjL0d4WW5UVEtvRFNOREs5?=
 =?utf-8?B?a0FYRVpOY2dYRGdzc1FsNk5IU0ZSU09EQ3VhYlp1aGJ2K09PM0kyUDY0dHFR?=
 =?utf-8?B?cGJVUjVVbkkzQytmdmxTVnowOHp2dlVhK1U1alpGRXAvdnBmNkNBOEdscERF?=
 =?utf-8?B?bllZTW5DS0JhaTFadSt5aE5MRnl5dEJTbGd2V3NLRXdtdmQ1bXl6RWtPSTdV?=
 =?utf-8?B?ZFpzcmtTL2FqRUZuMlN5Ulo4ZVlwUEkrMDF1N3FpVElXZ3hUckRySEtIR1NZ?=
 =?utf-8?B?cC9PL1prd09wNXNZWkpIUUtOaEd2a004emJQUmFNeTNwUmFtRXN4UEdWUlM1?=
 =?utf-8?B?Z285cm8rN1lPeFFEa1NxYmNBY2QxaWFmbDNDdlVWZFRrcHd0clV1MXUyd244?=
 =?utf-8?B?NDNRVzVxRWxNWUpxMUNJRGZjWUZKRjNFRzROMFZUZndpcU1oRmV2azBlRHZw?=
 =?utf-8?B?bWU1NG1MT3Fpc3g0a3JBNzFOQTFGOGQyUUNJVlR3T2YwT2FiLzN0OW92MS9W?=
 =?utf-8?B?TzdDYlF1disxVzU2ZzZLN3d0aXBDMHZQakVJQWRTVDF1Ull0VWZPdzZEV05p?=
 =?utf-8?B?dDM1ZWV0QXdQZVM2Y1BwZ0QycW5MYUgrRSt3WW1SZWR3ZzRlVlpGQm1WZ1dz?=
 =?utf-8?B?Yyt6QzJtNzZtWFg2Vzk2eVpUTUcyZWU2TE95ak9ITFFtS3BqTFlxOXdNb3Fh?=
 =?utf-8?B?c3crRy9HNDVUN3YyZW95RGlyUUtVc1pQSDNNMmVwOEg4U2F4Q1NxM1l0aENF?=
 =?utf-8?B?SVBiaWZtSjVaTDRLU0N4M0NNTkRZdTljTGgvejZ3U1EzT01YSjhlRDZTTGQx?=
 =?utf-8?B?dmF0dksxN205YmdGZGprS0lqelBNeVhlcjN4bld1K1NxQUdIbm5vd2M0STZq?=
 =?utf-8?B?V2ZPQUQ5Ylo3ZnI3SlpiS0s5YkMrRGtKQkllWnFuVkJNcjVyd3IxM2VDbTha?=
 =?utf-8?B?TUlJc2VudDU4UzI0aXZaRHBnRUdCREc1K0k5em1ZVmxXckEvdXVMTCsyc3da?=
 =?utf-8?B?OEdxMk1tNTFqRDJKWWM2bFJGVEVhZURvTTl3VTQyWEFOdndvbWErK3JYTnMr?=
 =?utf-8?B?c3YyMzRoeVhELzNGa3pzbEtGUWRWRGpOL0gzN3UwVml4WlFHck9ZeEZ0amcz?=
 =?utf-8?B?RmxZWVBDdGp1dXNpNUdMU1NJS3JUdVUvQ053TUZMdXRLa2hWYlc0ZEtrYlAx?=
 =?utf-8?B?K0ZONUE0VXlYTWJnSU0rWmJ2VjBXamxvaW9NK01IL1JWMnhyMDdTbVJvZmly?=
 =?utf-8?B?ZjNENEcrMkhjbGZsMmlEa3NhTDEzYlVuallkUnNNTFlJYVVndUJSdEtRb0Ju?=
 =?utf-8?B?WlM4cUxReFBlcmwzNS8vM3FLaEF3UkpmZHJyUWpIdWl2Z3FQempMMUlxV1VH?=
 =?utf-8?B?dkJLSisrV1FnazVTUnU5UERFbzNSdGJOdFhuTSt3aGtvejJzdnpkb0YrUEZ1?=
 =?utf-8?B?Y2ROR1J5K1Y2UVpuR3ZYTXNBNXNaMWpxU244WXV4UTg4NEhucFVhV1lIRnkw?=
 =?utf-8?B?UmZkN3ZGU3d2bjhsUG9xeVFBd0Z5RytwQmRCOHdkRjJLQnBSazM2bTlIU3kz?=
 =?utf-8?B?K25pYjBtYTdrSE9mVDQzNnBBMSt1WXNOVUhMSHNzTnVXV3ZGZkdsL3R1d3k5?=
 =?utf-8?B?dGlLR0tjRUh6SkRRUkxsM0w5WXdBdE9YVWluWFBuamdYaXNQMGtUTy95bkZW?=
 =?utf-8?B?TTZLSGtzSFh0UHZicE5TeUtGQjRhcTM0aHJMVGFhQnBKNy91eXJoaUU1dmxE?=
 =?utf-8?B?Y3pHYmtRY0c2NnBvNmtxU2JpVWR6bEYxd2wvTENUQUh6NE1lbEZJUXBhVkpv?=
 =?utf-8?B?Zkc1eFVydmZDUi8zYjNPNGVkcmhrWEFJTno2bkFXNmU2M1lVTHRDeHNiblNK?=
 =?utf-8?B?NVFWM0I3ckpYSnJTMk9YTzhSbnZBdVNSL0pnZ0hCQjJ5SW8vdngrMll4c3NN?=
 =?utf-8?B?RFI2RDVCQjV1bUl0dUJTTEVuMzBMMjRWYmZPRXFaTUtrcGdGMmRqQ0UzZitv?=
 =?utf-8?Q?Xr9Yc2dlVxyQJmMN9b57qHEU0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6a9227-85f9-4fa6-252f-08dacc5f9ee3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 08:00:28.7866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUgZGVXd3X2ROEJh1FzgUGC2kaN6y5WfD7WvjAOVw23eCobY21bxCVp78Bs+NqlY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4592
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

Am 22.11.22 um 08:51 schrieb Somalapuram Amaranath:
> Remove page shift operations as ttm_resource moved
> from num_pages to size_t size in bytes.
> v1 -> v2: fix missing page shift to fpfn and lpfn
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 +---
>   drivers/gpu/drm/ttm/ttm_range_manager.c    | 13 ++++++-------
>   2 files changed, 7 insertions(+), 10 deletions(-)
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

The amdgpu changes should probably be a separate patch.

>   	} else {
>   		/* Memory should be aligned at least to a page size. */
>   		page_align = ALIGN(bp->byte_align, PAGE_SIZE) >> PAGE_SHIFT;
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 0a8bc0b7f380..6ac38092dd2a 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -83,9 +83,10 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   
>   	spin_lock(&rman->lock);
>   	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
> -					  PFN_UP(node->base.size),
> +					  node->base.size,
>   					  bo->page_alignment, 0,
> -					  place->fpfn, lpfn, mode);
> +					  place->fpfn << PAGE_SHIFT,
> +					  lpfn << PAGE_SHIFT, mode);
>   	spin_unlock(&rman->lock);
>   
>   	if (unlikely(ret)) {
> @@ -119,11 +120,10 @@ static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
>   				     size_t size)
>   {
>   	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
> -	u32 num_pages = PFN_UP(size);
>   
>   	/* Don't evict BOs outside of the requested placement range */
> -	if (place->fpfn >= (node->start + num_pages) ||
> -	    (place->lpfn && place->lpfn <= node->start))
> +	if ((place->fpfn << PAGE_SHIFT) >= (node->start + size) ||
> +	    (place->lpfn && (place->lpfn << PAGE_SHIFT) <= node->start))
>   		return false;
>   
>   	return true;
> @@ -135,10 +135,9 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
>   				     size_t size)
>   {
>   	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
> -	u32 num_pages = PFN_UP(size);
>   
>   	if (node->start < place->fpfn ||
> -	    (place->lpfn && (node->start + num_pages) > place->lpfn))
> +	    (place->lpfn && (node->start + size) > place->lpfn << PAGE_SHIFT))
>   		return false;

This looks good but can't be complete. We have a couple of place where 
node->start and node->size is used outside of TTM.

See drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h and 
drivers/gpu/drm/i915/intel_region_ttm.c for example.

Those need to be updated as well.

Regards,
Christian.


>   
>   	return true;

