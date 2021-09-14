Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7046640AA18
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 11:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32136E43A;
	Tue, 14 Sep 2021 09:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2AF6E43A;
 Tue, 14 Sep 2021 09:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPs2iRKv5j605zqT69bmT2yaXyB49ttbIMwXr1x48UxzovMpDCN7U4X0FKiejeqnwAb8Lsjf3glMcsCzZLgwor7KJ8YeMSbrq5LJ+fcGDAidJqoTofm1dnK2l+HcxH01wD8c5e+3L6TCiPiyf7Jmm0FHOnBs8b5UVMfXChrY2/bnsppZTc+ljmImE1Frcs2hHT1ySKhEzYhoPUua47NpJdMlOjrBFUXV0oG7uhCMRlcSdjHnH/W4BaiZReCCBw+Me40PdTU3KTnRlpG+uuIDrUTDMUHBgAN00o5xvOdtkkT1WhldmEt0J0fl/ZnMJ3QlmVA5PqUnmIyWdJlA9kolCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=m+goSQlR/4+v1OUu0K+KVvv5+0imPFyAxhwOCqEdCso=;
 b=UvvBu+o/7D7Su7nvjjk2fmxm+E8ZHn3mMilVZF2JFyKmKusJF+zI3kXx2d4PtccEJG8xE2BwLhOM95oEVSYPqKuab2xKm7H+o4h5zg+SLhy0lLfgyzqduanInjcgXQZ3SEC0ug47v/es+a8RKultlghwNBTGJ86s/gu/WBIFUM1Nx+Tu2QDqY1+tjDh2cVcE4CwcPEr/Hu2Jwt76cjLTxKaVq0YQJ4kru9NZDOcr1wp+S7+QlGVZRWJ2VDF/iCaT4kvPHTFVt8es1AYedPxBtryjoWqtg1xYT6JcmhDxUp63MbEKiwOM3eUuj/jU+FJ6xnsWNUjeSBQTAxvVu/FhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+goSQlR/4+v1OUu0K+KVvv5+0imPFyAxhwOCqEdCso=;
 b=Mj5S7Oo9EbvLVVbJZhrb+crPuNlz51sMAyEam/2OYkkJkdCueU3S6byPc5ZUGwVJHEBhdB9TsZaJkle9DrjHMc7trc71b3qYCnuUGqpEaEqJf6SwEY6f4bq1g3xWap3q6Gf8S3NpeLGcCOasS+2s4hnJr4U7CbZr6PL1YeLAFxM=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 09:02:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 09:02:53 +0000
Subject: Re: [PATCH v2 2/7] drm/ttm: add TTM_PAGE_FLAG_SHMEM
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210914085033.2833993-1-matthew.auld@intel.com>
 <20210914085033.2833993-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <106ed881-5cfb-6a73-f50a-32ef6edb5905@amd.com>
Date: Tue, 14 Sep 2021 11:02:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210914085033.2833993-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM9P193CA0002.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM9P193CA0002.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 09:02:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b64a4b01-8bae-404e-93eb-08d9775e6f8d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4253:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4253C8F5C104B93D5EA9654583DA9@MN2PR12MB4253.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oqOnww7d25hmL2OrBz2Q1xlDQgUqedfmdqOES51oSJzH5WyYjh7/lb/qDZ64li8Br+OxMmADgyvPdkrvwkPF2CGLi1l5F6g9G8C/CrwDHqzYopQSHj1XH8FoN1/4wvoQvKJDIjfBhDjUZyy7LGYfG1UDgg1yfn239g3wkAtFGOU0IMP21FUHzKyT9hdVqWMii7c9i6oHDlDF8Tq1IDE7AAV9CS4Hq/fwyXcrmDDRBFLYoHex1bOh+8rOkRo0RxA3sGNW9sgxTszw5Xsrc8vN4M+il5N9MaFYip06/HizYXbH4zbks+7OMLoHXgVcmckain8fxCri71mMFLpX++FURNz0zerdYJE+yQqmRngFnw8orYeuYBvIVgoVqTQTNx8Qm4fIlKC1cEiB8r3cVxMh7TaoBrZ3SIvZCD9DqlUapj3HCZrSKUyzcL0MVCTiLSNY08IePbG3jAXJiS/QJLvAh1DSgA26X1t7z5AOo63+fd3jv6E3gqSFt+sCDI8esCZo2W6SF6C2hT43g8fHpbJ4n5nXoM4lqKZrM/PYMhx6bA7WZVg/h+pzqQfF2sNZ2pyBqvZv5Qvw0JESbXqHjiEMmbRLTs793uuqdqJBGqLHoHKJ6dEo8WfS402vkjZnW3z5dFlRBGLjVutK35+q7W+v0FHMaHCEjXqDFcLqgLb4TquFBnzEv7aOfpX1A5hWb5BB+n2+W3bEkLG3FYwSwwlWFnhaSJC8o1DYqY3RYAQxOZ1+cI5AAyUtlkONiCspov7a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(26005)(4326008)(478600001)(16576012)(316002)(6486002)(186003)(956004)(31686004)(2906002)(83380400001)(31696002)(8936002)(66476007)(6666004)(66946007)(66556008)(5660300002)(8676002)(2616005)(38100700002)(36756003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm5za1V4SjYrQ3FycUJrUE0rRmhvSGFrUG4wcjN2ZEEyQXZvMkM0aEdqQWJO?=
 =?utf-8?B?VXlWWS9jdTliZ0E4L21xVlNxKzdaNnZPZlRUUFByaFRyM1JzWitIQmYwRTR3?=
 =?utf-8?B?dTZhTm5jR3BRdFRaZXlUeTI1VEd6ZWl0U2VKV29iNnVndVpNKzZvbEZqUjN3?=
 =?utf-8?B?dkpKZXB6VlpXUVZtZjdaT096NFVnUm1OanVOQzBJd2NRanFpOHRLNG91Qjha?=
 =?utf-8?B?Wk9VOUR4MHFvbUJad0p3VEd1LzJsV1VYMzZBWE9CMUJxYmczRDFmOGEwUHJR?=
 =?utf-8?B?V00wWDBHeDVObERXdGZoVHdnd3d2WWFPVENpVE5wSlVERmVaZUR0SVM1SzdG?=
 =?utf-8?B?M3hPeHZvS2dHWDd4bDg2WmhIWk5SaUJwdUJ4d2JJN1F6R05qZ1R5R3gvZllx?=
 =?utf-8?B?c3pBSXJCY29DbHMwOGtNRzlEOHhXK0x2TUNXUngxbURsWlp5SXBOMW43Rm5V?=
 =?utf-8?B?WFJNVXVOZG9mRS9BWnVXekNIbXVDY05YSHcxV0RzQXU4aDQ3NDFkNmoyWWY1?=
 =?utf-8?B?dTZOL2wwblp1ZU1udC8rWnJ1RUNZTzljWGtiamgvSFF3cVNSaGdHVVF3MENi?=
 =?utf-8?B?eWVFRnVoUDZGTWhxMmtpQmowMzRJbnlvRTh4ckhXTkRsWHhQYjAwZlh4dElD?=
 =?utf-8?B?L0RwMHlmTXIzTVZ5c3M4MzVDSHU3T0ZXM01yaWNqRnJsUEhMaFN1WGVKb2hp?=
 =?utf-8?B?Y1l1cXZWS2t0UnpJSEZISEp3QzdYeC9VWXArU0ZoMmhyVk1vZHhaTXlkWGFz?=
 =?utf-8?B?S2FJaVdMS09pQUVKa0k1ZHhJM1UrK0FuQll2UmRVeGJXai93ZytyYmRuMkUw?=
 =?utf-8?B?UFdCaDIrZFE0Yjc0dzRIeCtQOUVReVVud2hZWHlhNU11ZzFhdnJ0V2M1dUJo?=
 =?utf-8?B?TEtMQkhTemtBbUNnT3p6QVdqQ01wUHNwY0ZoZTg2NnNCRFhGYzZtTWxBSXo3?=
 =?utf-8?B?ZlU1YVRZYWg5aTRXMlVadlFwN2ZSTmw1alF2RHFpRVM3KzNJSUtIL1J6UW5H?=
 =?utf-8?B?bEt6K0xsUU4wOWJDZmNIMWdOc3N1T3ZtMjhJY1FnbEl0UXBzR2tYKzBtY3c1?=
 =?utf-8?B?VjBXamhPaEEvbENTOTdEcklkTG9QR1ZvaElBc050RFNSbytnb21mLzFEdWxt?=
 =?utf-8?B?U2dLK1hOTHhVci9sQ1lrZlh5d1BoL0VmMURFUFpmU1B3Nk1xMjFLQ3dPL1dL?=
 =?utf-8?B?WGREV2JvbEFXWHZGa29iRmhzQm1QQWp4c0pJVnJuZDFrNVlBcEI1ZHlJTjFl?=
 =?utf-8?B?SjlPdWtLTTh0VVhKUFAxQjhpMnBnVUVtL0dJdHY3cmVpMVBuWUtBWlVNMUk1?=
 =?utf-8?B?dUNEMXc4K2dFVEk2Mk5sQVZxdjZ2ZmVnRFhaM3REbGU4eG9rOEl3MlhXS3RO?=
 =?utf-8?B?S1ljRWZ4M1RmQzMvUThXZTVET3ZibGFFY0dTa3F2RFB6RW9sbCsvTEV1aFRo?=
 =?utf-8?B?SFBFUnlGR3czY3kvM3AzcXBITkN2TGdmamdYdTV0R0JNWUwwK0NoSm1TbXhD?=
 =?utf-8?B?Z0w2MDUrRmRSTjdHQVhiRTRXNmc0aWd3M2E2dHFMaHlGUDJWSnU0VHpBTWRO?=
 =?utf-8?B?dnVHeTk2aHlNTm4zcHh2RWJpaXBEVjExNCtJL3RmdTVlakFtVWFqc3pSblRx?=
 =?utf-8?B?SWl2RUN6YXYzcTI3Ty9ESVdJUndKVkxYSHlHYXdtRlNSQTFxalJKcXJTTFJ5?=
 =?utf-8?B?S1p3a0JsU3V4bGh0NXg4YjcySUY5Qmd4QWhtZFFKZzBnL1VIWG5iaU8yUHY0?=
 =?utf-8?Q?kgAUEtJPUesm5KmKL5ETh1sJLgvKMKnSi0Y/Kun?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64a4b01-8bae-404e-93eb-08d9775e6f8d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 09:02:53.2875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ydsykdo0P2M3txYikHa9+StpAPrayTC2xn7J7SRXnvegFpPIEXXOozu1QMHhz+2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
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

Am 14.09.21 um 10:50 schrieb Matthew Auld:
> Add new flag to indicate special shmem based tt, which can directly
> handle swapping itself, and should be visible to some shrinker.
>
> As part of this we should skip the ttm_pages_allocated accounting, since
> such tt objects should already be reachable, and potentially reclaimable
> by some shrinker, if under memory pressure, and so shouldn't directly
> count towards the swap "watermark" level.
>
> We also need to stop touching the page->mapping and page->index for such
> objects, like in ttm_tt_add_mapping, since shmem already uses these.
> Some drivers seems to depend on the tt mapping/index behaviour for their
> own purposes, so directly using shmem tt likely won't be usable there
> as-is.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c |  4 ++--
>   drivers/gpu/drm/ttm/ttm_tt.c    | 10 +++++-----
>   include/drm/ttm/ttm_tt.h        |  1 +
>   3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index f56be5bc0861..e2131c73dcb6 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -346,8 +346,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   			} else if (unlikely(!page)) {
>   				break;
>   			}
> -			page->index = drm_vma_node_start(&bo->base.vma_node) +
> -				page_offset;
> +			if (!(bo->ttm->page_flags & TTM_PAGE_FLAG_SHMEM))
> +				page->index = drm_vma_node_start(&bo->base.vma_node) + page_offset;

I still have a rather bad feeling about that.

This should either not be necessary any more in general or the shmemfile 
approach doesn't work correctly.

Please send a patch to remove this for everybody instead and we will see 
if that really works or not.

>   			pfn = page_to_pfn(page);
>   		}
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index dae52433beeb..cc4815c1f505 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -293,7 +293,7 @@ static void ttm_tt_add_mapping(struct ttm_device *bdev, struct ttm_tt *ttm)
>   {
>   	pgoff_t i;
>   
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> +	if (ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))

Maybe you should re-use the TTM_PAGE_FLAG_SG for this and/or rename the 
flag to better describe what it does.

Something like TTM_PAGE_FLAG_EXTERNAL or similar? The only other use 
case for TTM_PAGE_FLAG_SG which comes to my mind is controlling if the 
pages array is allocated or not.

Christian.

>   		return;
>   
>   	for (i = 0; i < ttm->num_pages; ++i)
> @@ -311,7 +311,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	if (ttm_tt_is_populated(ttm))
>   		return 0;
>   
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))) {
>   		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>   		if (bdev->pool.use_dma32)
>   			atomic_long_add(ttm->num_pages,
> @@ -349,7 +349,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	return 0;
>   
>   error:
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))) {
>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>   		if (bdev->pool.use_dma32)
>   			atomic_long_sub(ttm->num_pages,
> @@ -364,7 +364,7 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
>   	pgoff_t i;
>   	struct page **page = ttm->pages;
>   
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> +	if (ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))
>   		return;
>   
>   	for (i = 0; i < ttm->num_pages; ++i) {
> @@ -384,7 +384,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   	else
>   		ttm_pool_free(&bdev->pool, ttm);
>   
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))) {
>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>   		if (bdev->pool.use_dma32)
>   			atomic_long_sub(ttm->num_pages,
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 89b15d673b22..20d550185065 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -42,6 +42,7 @@ struct ttm_operation_ctx;
>   #define TTM_PAGE_FLAG_ZERO_ALLOC      (1 << 6)
>   #define TTM_PAGE_FLAG_SG              (1 << 8)
>   #define TTM_PAGE_FLAG_NO_RETRY	      (1 << 9)
> +#define TTM_PAGE_FLAG_SHMEM	      (1 << 10)
>   
>   #define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
>   

