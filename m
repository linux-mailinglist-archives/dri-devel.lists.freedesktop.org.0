Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A00A254493
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 13:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353E96E053;
	Thu, 27 Aug 2020 11:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760073.outbound.protection.outlook.com [40.107.76.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4D46E053
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 11:52:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn4D+VEXP9aIebia6vb926xNSYYxz1HwgV2gDjwq10ZQ7FQoA5rTGGU8qLi6sQ03fUx1Um3nDHeel+etWUd49yeVHW13Lg9nx1tNUGJ+uS0qB+wfae9t7/ELuQNN280U2/xfjZiZn+S53h2ifeFEWVZU2rXD7qMzG2RtQZmmBLfrAu5y0GDThQyv92VRxKTc3/u3qUKtWbNJoGY5dts6rdwSnapXZseRiwai+QHrBlSkGOXeCYkuCFf6OXoSD7uS7rFH/C9us5ACe503+05u/tNXR3rc6exegsQmPVssyHsqWA/BNb2glfpEazVlO25KQIrFK1fXyKLT7FFy7FZ4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVer4HJN/4QZLt6cpECpCkJS+tUPSpLAUO4JheywJUk=;
 b=YB6vrtmdl/GtGXilWsyaWnJfV6OtiY8O3wmeida+k9L853noavuGbGvMSoSvqkFv2EHqNq1GVjX8X01pe3NnyR5Ppbxc2w9ViIPVnSBuDcGHLBh3Z0yNiwCAXB/BuLM0yL0hYeu/rReCwyWOqWwbeta/tF+uYD0LvacRVyKgMx5DyHaSaTvJFtyRwR1/mSa4fB1zOSW+HZc+WMRezTDpHXT/HYTdTbh8IoVRdK1n+ibMshsBYptRjNGOMXhebB1WpM6PPDtgaULrJ2+BlkSJX70yfACzHEiCp3n5LfGmGtf8S9X1G8T7Z9NZ7oONocgPLqDhlIbiJdKmRam2gfLbwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVer4HJN/4QZLt6cpECpCkJS+tUPSpLAUO4JheywJUk=;
 b=WVwegx4vQRWIa7t7h+27oVH7KjJLcBCm/clUAj/iyD0fFOMBYXWGp+8hfVQKzkx8CuPyLT2Rdgh1wDQ9zAUzcv8lAXUdedxXLyFsi6F3TbYY604wkEhY4saHQUmXm7gtCjIev3XWyKjQSAc5Zwt6d4syW/e0TxkIGhscyHzIGLA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3904.namprd12.prod.outlook.com (2603:10b6:208:165::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 27 Aug
 2020 11:52:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.030; Thu, 27 Aug 2020
 11:52:46 +0000
Subject: Re: [PATCH 17/23] drm/ttm: split populated/bound state flags.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200826014428.828392-1-airlied@gmail.com>
 <20200826014428.828392-18-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <472cde7f-39d0-1802-e0cf-58219142de41@amd.com>
Date: Thu, 27 Aug 2020 13:52:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200826014428.828392-18-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:205::22)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:205::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 11:52:44 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0001fff7-c36a-4979-5508-08d84a7fb696
X-MS-TrafficTypeDiagnostic: MN2PR12MB3904:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39042A790B1B8932D763B2B183550@MN2PR12MB3904.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0BnkIhvjEAbR7hQLVNaRqnrU1Z4Qk2Bd2/MWtmcj6k0z90S8VChlnWscPZSJk28yDGTmj9rR143hkRJphu8dE4lcLedgWuPKMBvfcN7ng96VAM4u3K9Z8n8fjjMvUVbz6KCbLcZnXVHg0ypUjsNzP0Urq7WqBCwJTYEjsVq/oxtqn02OU8hOuxMVGtadh1g6YXu6M8zTDEq3F14YTXMuk3F+ljUbJx97rsuDI9DIOfaSzYiHq50OcIPabjgc2O3McmzzOHGiTongmtkqQAr4PKpuP7cT4J3xZlXgYgq8HeM1L1I//GxH2j8DeR+AFefa5WlZtDeYv5r67rm3CJgpZSpVkVqEQbXTcOMwcohNk0AVdeCUjF3TQXVjIHQAhRHW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(4326008)(186003)(6486002)(52116002)(30864003)(86362001)(316002)(16526019)(31686004)(83380400001)(31696002)(2616005)(8936002)(5660300002)(66556008)(66946007)(66476007)(8676002)(6666004)(2906002)(36756003)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: UtT+LSpapZMaw36F8rf+42z20wT1StM7ZJ+fpIQZ2vaISqFQQag/WZiSCj78t7fQjc0Gdl8nWqK46bwuECfapQ1Vm3rZjTcTSdz7kMq6VT7bISUw5dxX5v4jBQYP1+A24unJn2umENBH+hH/ge4iAgq82TOe1LWqDXXeEmorWrnkjMcXhU7cfrvfWi2+jj327r4jkFUEX14I/JZ/Gtt3UmwOtXcxw/pIj+9ST5QglWBPv31RtWiX1qD5WL528tN1Tch9apMpo/qdrYjnuiEj/aS03OzIDEC5LvE/p/hPo/qDsfAB1NebpGOKdWur3P+IRTgZ+4tAH4lUalYu50PMUJ8F9yiKGQ5ZCXM+xuwBQJ56VnnhHukzanaJCPUVQuvUc4C9K9HzrJ5h004yaQJFmtf+PpwSJ5LNMKXMR4EX+DVYqzCCrUs6JaLG7qHsin1fZKFoV4mwJUMINCUVoCVY5MJ0bqYAiD9Dskvkiessz81qmJYmjV8jeIaSso9s/ngqb+JvNDUU/TnGblN8OleFhPBT4Czu0ixO8ExKoc8sCxGJak9wavaxBCuQgd4IQTigdJuNizANIZ3g1CRF+PSXJYGURHBBATN1FosAvVc5SqfyFx9JKRUOcbqRlWEjptAErFXlZu69nrNTYpJYQUrn/fXDECllSwC8TQLnnu5NI3pO2ZrUlKqCA6HH/wh0znHh8zS9eK1CQUjU7VU2HN/8Ng==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0001fff7-c36a-4979-5508-08d84a7fb696
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 11:52:45.9521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhtKqV4olKmpT0srZsGXIojy0FEHuVrVErS5Sltfe5EuUAymBXJEZd5CGoc5vCt8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3904
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.08.20 um 03:44 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> Get bound out is the next step.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ++--
>   drivers/gpu/drm/nouveau/nouveau_bo.c       |  4 ++--
>   drivers/gpu/drm/radeon/radeon_mn.c         |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c        |  4 ++--
>   drivers/gpu/drm/ttm/ttm_bo_util.c          |  2 +-
>   drivers/gpu/drm/ttm/ttm_page_alloc.c       |  6 +++---
>   drivers/gpu/drm/ttm/ttm_page_alloc_dma.c   |  6 +++---
>   drivers/gpu/drm/ttm/ttm_tt.c               | 19 +++++++++----------
>   drivers/gpu/drm/vmwgfx/vmwgfx_blit.c       |  4 ++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
>   include/drm/ttm/ttm_tt.h                   | 10 ++++------
>   11 files changed, 30 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index adac24625191..c1c3691c3b9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1301,7 +1301,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
>   			return -ENOMEM;
>   
>   		ttm->page_flags |= TTM_PAGE_FLAG_SG;
> -		ttm->state = tt_unbound;
> +		ttm->populated = true;
>   		return 0;
>   	}
>   
> @@ -1321,7 +1321,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
>   		drm_prime_sg_to_page_addr_arrays(gtt->ttm.sg, ttm->pages,
>   						 gtt->ttm.dma_address,
>   						 ttm->num_pages);
> -		ttm->state = tt_unbound;
> +		ttm->populated = true;
>   		return 0;
>   	}
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 478e498da965..e9de922ae921 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1264,14 +1264,14 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
>   	struct device *dev;
>   	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>   
> -	if (ttm->state != tt_unpopulated)
> +	if (ttm->populated)
>   		return 0;
>   
>   	if (slave && ttm_dma->sg) {
>   		/* make userspace faulting work */
>   		drm_prime_sg_to_page_addr_arrays(ttm_dma->sg, ttm->pages,
>   						 ttm_dma->dma_address, ttm->num_pages);
> -		ttm->state = tt_unbound;
> +		ttm->populated = true;
>   		return 0;
>   	}
>   
> diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
> index f93829f08a4d..5f57df7e6f08 100644
> --- a/drivers/gpu/drm/radeon/radeon_mn.c
> +++ b/drivers/gpu/drm/radeon/radeon_mn.c
> @@ -53,7 +53,7 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
>   	struct ttm_operation_ctx ctx = { false, false };
>   	long r;
>   
> -	if (!bo->tbo.ttm || bo->tbo.ttm->state != tt_bound)
> +	if (!bo->tbo.ttm || bo->tbo.ttm->bound == false)

I think using ! instead of "== false" would look better here.

Christian.

>   		return true;
>   
>   	if (!mmu_notifier_range_blockable(range))
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index f5cbe5d13d33..f9e4e64a6d64 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -615,14 +615,14 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
>   			return -ENOMEM;
>   
>   		ttm->page_flags |= TTM_PAGE_FLAG_SG;
> -		ttm->state = tt_unbound;
> +		ttm->populated = true;
>   		return 0;
>   	}
>   
>   	if (slave && gtt->ttm.sg) {
>   		drm_prime_sg_to_page_addr_arrays(gtt->ttm.sg, ttm->pages,
>   						 gtt->ttm.dma_address, ttm->num_pages);
> -		ttm->state = tt_unbound;
> +		ttm->populated = true;
>   		return 0;
>   	}
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 3b17fe3cb57a..d5d841270e38 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -251,7 +251,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   	 * Don't move nonexistent data. Clear destination instead.
>   	 */
>   	if (old_iomap == NULL &&
> -	    (ttm == NULL || (ttm->state == tt_unpopulated &&
> +	    (ttm == NULL || (!ttm->populated &&
>   			     !(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)))) {
>   		memset_io(new_iomap, 0, new_mem->num_pages*PAGE_SIZE);
>   		goto out2;
> diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> index b40a4678c296..2d30a2deadb5 100644
> --- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
> +++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> @@ -1044,7 +1044,7 @@ ttm_pool_unpopulate_helper(struct ttm_tt *ttm, unsigned mem_count_update)
>   put_pages:
>   	ttm_put_pages(ttm->pages, ttm->num_pages, ttm->page_flags,
>   		      ttm->caching_state);
> -	ttm->state = tt_unpopulated;
> +	ttm->populated = false;
>   }
>   
>   int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
> @@ -1053,7 +1053,7 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>   	unsigned i;
>   	int ret;
>   
> -	if (ttm->state != tt_unpopulated)
> +	if (ttm->populated)
>   		return 0;
>   
>   	if (ttm_check_under_lowerlimit(mem_glob, ttm->num_pages, ctx))
> @@ -1083,7 +1083,7 @@ int ttm_pool_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>   		}
>   	}
>   
> -	ttm->state = tt_unbound;
> +	ttm->populated = true;
>   	return 0;
>   }
>   EXPORT_SYMBOL(ttm_pool_populate);
> diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> index faefaaef7909..9a3b7145d9cb 100644
> --- a/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> +++ b/drivers/gpu/drm/ttm/ttm_page_alloc_dma.c
> @@ -894,7 +894,7 @@ int ttm_dma_populate(struct ttm_dma_tt *ttm_dma, struct device *dev,
>   	unsigned i;
>   	int ret;
>   
> -	if (ttm->state != tt_unpopulated)
> +	if (ttm->populated)
>   		return 0;
>   
>   	if (ttm_check_under_lowerlimit(mem_glob, num_pages, ctx))
> @@ -982,7 +982,7 @@ int ttm_dma_populate(struct ttm_dma_tt *ttm_dma, struct device *dev,
>   		}
>   	}
>   
> -	ttm->state = tt_unbound;
> +	ttm->populated = true;
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(ttm_dma_populate);
> @@ -1076,7 +1076,7 @@ void ttm_dma_unpopulate(struct ttm_dma_tt *ttm_dma, struct device *dev)
>   	/* shrink pool if necessary (only on !is_cached pools)*/
>   	if (npages)
>   		ttm_dma_page_pool_free(pool, npages, false);
> -	ttm->state = tt_unpopulated;
> +	ttm->populated = false;
>   }
>   EXPORT_SYMBOL_GPL(ttm_dma_unpopulate);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 1b9960085d11..ee6fda175da6 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -156,7 +156,7 @@ static int ttm_tt_set_caching(struct ttm_tt *ttm,
>   	if (ttm->caching_state == c_state)
>   		return 0;
>   
> -	if (ttm->state == tt_unpopulated) {
> +	if (!ttm->populated) {
>   		/* Change caching but don't populate */
>   		ttm->caching_state = c_state;
>   		return 0;
> @@ -214,7 +214,7 @@ void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
>   
>   	ttm_tt_unbind(bdev, ttm);
>   
> -	if (ttm->state == tt_unbound)
> +	if (ttm->populated)
>   		ttm_tt_unpopulate(bdev, ttm);
>   
>   	if (!(ttm->page_flags & TTM_PAGE_FLAG_PERSISTENT_SWAP) &&
> @@ -232,8 +232,8 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   	ttm->num_pages = bo->num_pages;
>   	ttm->caching_state = tt_cached;
>   	ttm->page_flags = page_flags;
> -	ttm->state = tt_unpopulated;
>   	ttm->swap_storage = NULL;
> +	ttm->populated = false;
>   }
>   
>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> @@ -311,9 +311,9 @@ EXPORT_SYMBOL(ttm_dma_tt_fini);
>   
>   void ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
>   {
> -	if (ttm->state == tt_bound) {
> +	if (ttm->bound) {
>   		bdev->driver->ttm_tt_unbind(bdev, ttm);
> -		ttm->state = tt_unbound;
> +		ttm->bound = false;
>   	}
>   }
>   
> @@ -326,7 +326,7 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
>   	if (!ttm)
>   		return -EINVAL;
>   
> -	if (ttm->state == tt_bound)
> +	if (ttm->bound)
>   		return 0;
>   
>   	ret = ttm_tt_populate(bdev, ttm, ctx);
> @@ -337,7 +337,7 @@ int ttm_tt_bind(struct ttm_bo_device *bdev,
>   	if (unlikely(ret != 0))
>   		return ret;
>   
> -	ttm->state = tt_bound;
> +	ttm->bound = true;
>   
>   	return 0;
>   }
> @@ -395,7 +395,6 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev,
>   	int i;
>   	int ret = -ENOMEM;
>   
> -	BUG_ON(ttm->state != tt_unbound && ttm->state != tt_unpopulated);
>   	BUG_ON(ttm->caching_state != tt_cached);
>   
>   	if (!persistent_swap_storage) {
> @@ -462,7 +461,7 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
>   {
>   	int ret;
>   
> -	if (ttm->state != tt_unpopulated)
> +	if (ttm->populated)
>   		return 0;
>   
>   	if (bdev->driver->ttm_tt_populate)
> @@ -491,7 +490,7 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
>   void ttm_tt_unpopulate(struct ttm_bo_device *bdev,
>   		       struct ttm_tt *ttm)
>   {
> -	if (ttm->state == tt_unpopulated)
> +	if (!ttm->populated)
>   		return;
>   
>   	ttm_tt_clear_mapping(ttm);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> index 0cd21590ded9..77205f92bc9b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -464,13 +464,13 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
>   	if (!(src->mem.placement & TTM_PL_FLAG_NO_EVICT))
>   		dma_resv_assert_held(src->base.resv);
>   
> -	if (dst->ttm->state == tt_unpopulated) {
> +	if (dst->ttm->populated == false) {
>   		ret = dst->bdev->driver->ttm_tt_populate(dst->bdev, dst->ttm, &ctx);
>   		if (ret)
>   			return ret;
>   	}
>   
> -	if (src->ttm->state == tt_unpopulated) {
> +	if (src->ttm->populated == false) {
>   		ret = src->bdev->driver->ttm_tt_populate(src->bdev, src->ttm, &ctx);
>   		if (ret)
>   			return ret;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 6757be98be14..1925c41d2bda 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -623,7 +623,7 @@ static int vmw_ttm_populate(struct ttm_bo_device *bdev,
>   	struct ttm_mem_global *glob = vmw_mem_glob(dev_priv);
>   	int ret;
>   
> -	if (ttm->state != tt_unpopulated)
> +	if (ttm->populated)
>   		return 0;
>   
>   	if (dev_priv->map_mode == vmw_dma_alloc_coherent) {
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 534d0ef24072..c6e88f01062e 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -57,7 +57,8 @@ enum ttm_caching_state {
>    * @be: Pointer to the ttm backend.
>    * @swap_storage: Pointer to shmem struct file for swap storage.
>    * @caching_state: The current caching state of the pages.
> - * @state: The current binding state of the pages.
> + * @populated: if the backing store is populated
> + * @bound: if this object has been bound to a global table.
>    *
>    * This is a structure holding the pages, caching- and aperture binding
>    * status for a buffer object that isn't backed by fixed (VRAM / AGP)
> @@ -69,11 +70,8 @@ struct ttm_tt {
>   	unsigned long num_pages;
>   	struct file *swap_storage;
>   	enum ttm_caching_state caching_state;
> -	enum {
> -		tt_bound,
> -		tt_unbound,
> -		tt_unpopulated,
> -	} state;
> +	bool populated;
> +	bool bound;
>   };
>   
>   /**

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
