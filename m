Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A891698251
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 18:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C37710E290;
	Wed, 15 Feb 2023 17:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F99C10E290;
 Wed, 15 Feb 2023 17:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP063RSpPCfw1f1FuQfG6ZoOwvwbW4h6EPLmug0JfxT0BYsHeYal9jV1qyxRvA+dTiol3g9wC6HE3pKBdt3nn/zuSNcpcCAEKPjSz+tqtb+OcMpbhJnCvi2NnTZNTDTsq4H5mZ2S7CjUhh4XRImOsmUuEX46AxQHkjloH3HJtVvk3uJiZGcf6BHSXAEyzTw5BDI0PVdbfmGU57QeHVdb9kBMDq1+7C1o6TsImnL7QDGBANvs8rsC0pd/qViDIJQPhXWzeMtDrj+qN3QCF0fXRTVzKvqyz3X/fBkK0KDKFp+on+89K4AOC3pDBlyOYbws98SJb8wxpqPq0bBee2K1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJyHANp3hltcegx8qahYxU1b6yOqA6+afokXVz4mdY8=;
 b=Mj9p5Q63TWw3VvnVXnxB+5CaBCu0MUlHPcrHfgzKh+HbMiDHnkdJ4zwm3pF70icXgCarw9WQbbTJwFcDeZIdxcrpcZHM6VZn7FRdDHGtUaQCuiJFwmtLqMVmgJGOJvRln7kOH7gokHEE3Dy9qpJO4wIX5r8hqXsG6kDNcCctxWzfh+kkOuo2boxpN5tNFzsaMG+Hjfom0RxvXlcPGuFb1YcFDlObRg/A9Jtdyyj8b0qfqNR6kQPKuxfsrHMKIvpOTFhEhwF3H45M3j1KdvxHnzHbsn6BBPdFi/Idbs7IENsj62bpbFpaU5ZAAj3EKwp/3ASqZPd26RprO7wGSyPhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJyHANp3hltcegx8qahYxU1b6yOqA6+afokXVz4mdY8=;
 b=ji+hgU0VTM++cnLOSvzWKNiTRSswMObMj3xDs8HCtBSuhb0sMl9otlfa7tTifYnpgkqz7A2tZU2z8T/awpG/u02My0fchL+CXC7NAJJaJZIYFHk7aDJBWsB2hm8EMzFhywacoRHjPwPPxV2b1vD7uVnSGLkwRB7xGnWLmB6DF9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5357.namprd12.prod.outlook.com (2603:10b6:5:39b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Wed, 15 Feb
 2023 17:40:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 17:40:01 +0000
Message-ID: <cd40bc2a-641b-4faf-d153-9f4ab922e5f8@amd.com>
Date: Wed, 15 Feb 2023 18:39:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 04/16] drm/ttm, drm/vmwgfx: Update the TTM swapout
 interface
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
 <20230215161405.187368-5-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230215161405.187368-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5357:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8ca815-fa21-456e-5c50-08db0f7ba9cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZfNdvGSKyHCLIqo2AT2PmbgJ/7xx1MtjALEL9pdLaJkdNEZNUncs3YAESPm/dIWo424U4LfO12/1WMAXxizRfawNP17zxPqsRqLZILs7btpwpYSWDs2jn6zQxuLfrAAAR8bLhvLNBwLAZmVka754J0Wd5AkFvx0pZFxzz+3Y3478dBNklKJevvESXT5kUE422CwriaL2Ppjy6/N8mW/OE9Tu/jDao6NUDkYcbIoK0OiL+TmNWD+Q0PwvdVAsdGD/WiRgZ1cdK77EEruCh8PeNu8olTmiIsnt2Og8xmJb8ogXOfUGeZe5Fj47sKqjcDGzcc91IDYDSR2SyRILQNRPKr9YbPAe/ZCKrOaux4qxB9WewdqbUMQg0ljn4MUxtUOuMyVN7pMj+8qq24Q7nW4J57I6VKaGOPTW6bN590rILl8MtGo3xJS/vIhyG4+Dx7CNxypsvzSns3DpiI5CVJU91to9gumIQrdtkfrSpEQux/k1ufTdMfyqgbKoHrLLUhEPyvuukfunkkSjTQxFXIvA2gyyOQvJtTDo71eWm4BeIkcA4sGXIsOxVXf9cOy6DJb2AIf6FqhcNN9C4SQ6oYOs3To6C9yc/mES5YlIZgy0hknBN7bJlIoA5XMZsoQU4bxWL5+mXto/ZCu0vCYZqcRm6AlkttWxIpxjf6OfKAmz+ncX9RIMiuRFVCs4w3RfIXmvcADup9zxMQ06J0J6KLfRmmgDeDKeCnJYh8YTbBzgw0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(5660300002)(7416002)(30864003)(6486002)(2906002)(31696002)(36756003)(6666004)(86362001)(6506007)(186003)(6512007)(478600001)(2616005)(15650500001)(4326008)(8676002)(41300700001)(83380400001)(31686004)(66476007)(66556008)(54906003)(38100700002)(66946007)(8936002)(316002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG96aDIyQzIvdUgyVThmaEliSkVWV3JIQy9BNXlhU0pod0xsQ0tLYTJZbEJ6?=
 =?utf-8?B?SklFejhBOE1xY2kwc1g1R3VuZVFqbDRkL3FNV1BVcytjdTBFcGRZZUJUUVNr?=
 =?utf-8?B?U1lmbGpNN0N4K1Jvd1BBVG1yVFQ5VENHL2tVK0JWNExnaXdyOTM1RWdrTTlV?=
 =?utf-8?B?VHJPMUZxcHJ0clVJR0JhSXdRSHdybzhUZVEvYjZRdzU5K1NJazZrVGhrejlT?=
 =?utf-8?B?QnFMcEdXUTgvQmw0czZsVUcvVm9zN2d6bzQ0c2VXMGw5T0pqNWpRS1BOZGRv?=
 =?utf-8?B?QUJWZnJReUR3OXhmTE9GVE5iSEJHYmZoWVhueTJKTzJoWDN0L1k4aUt6ZFhx?=
 =?utf-8?B?UFBPcjk2LzVmSjFwSFdSemhWM3FkQ2NtNmYrRVozTzRENk13K3NIOC8wRGtI?=
 =?utf-8?B?OEhieFlGSlZDOENaR0RobTFCd2cxeFhKTFBvV0t0MytubUpQVjF3UzY2Mzdi?=
 =?utf-8?B?ZU1tR0tVU0FxY3crbzZTNTZBUW14bWlmMWhsUXlrRmZ4ZzlXZXNxVXlJMlhq?=
 =?utf-8?B?YXMzeFFOT0svTjFReVA1WU4rQklQVC9renhVTlFBSm43WUx0TTdKUjRrSTFI?=
 =?utf-8?B?KzdxbE9zZVovZGd3aFU2Zy9za2dHSWttb25GR0hFSGlLZUZMWWNvSHJYT0hw?=
 =?utf-8?B?TWZCRDIvM0RJa293dXJyY1c5UmRoeno3NXNvZllLeXhQS1hWYzBaUlhJM0M0?=
 =?utf-8?B?a0xRaXRaN3IrRzBMR3d6MTI0aktpU0JBbjRJOEVLZUZ1Y0d1bWtZdjZ2Y0hR?=
 =?utf-8?B?amlUWGxablF0aE1iYzBZOFJyRFFJNGlFRjh6dXF4NkUrM1I5UkpxbmlCNHZD?=
 =?utf-8?B?aGxqaGdtRlRCVGs4Zm94eC84b1YvN21GZW5MdkdhbTlkRHd1bWpOdTZZZzNm?=
 =?utf-8?B?a0NOTFRXekYvaXl0eDlqaUlTSmdIanNXa1R1c0R4SVk3eW9pTGVPUFhTSDZJ?=
 =?utf-8?B?QUhvNkdPc3ZmZUxHYndIK1VQOFJSK3drb1FUamMvaG12Z1hkTWxuZWRZOVZK?=
 =?utf-8?B?RTNmYkp3aWxNbTdTN2ZRcmE3NHhWS1RCaE1FUExuemtDcEVZdnMraS8zVnZu?=
 =?utf-8?B?RzgrZ0p2ZW95WE90d1RjSWdGOHdBMnloRnJNR1NKamJtL3IwaVhKTDNsYkFx?=
 =?utf-8?B?L1BOTFo0dTFpdTVxOC9MM0R1L2I3dTJWMlV1V2xBM1JIR044R3RkR3RhOEZz?=
 =?utf-8?B?SkJybFlMUmZXSUZDem02UUNzNS9jTGxRVHcybjZGK1VYV0hodld6dnZFREU4?=
 =?utf-8?B?YVVhWmJ4eXU3dTYvSVAxZkNiMXRYTTYwRWpyNURTaktTL0p0ZHBOeTlVTU1J?=
 =?utf-8?B?UWJ2M1k3SjNXZEp1MHl6aTFzelZiMkcwb2tWZnZjRHE3blhWMFg0MStvTklI?=
 =?utf-8?B?TktqNExjNjgvaGVNOG1OZnlNZGo4SXNOaHZ3MUtzMlZVRkxPRlRCODlicUNM?=
 =?utf-8?B?UTVrMjBlMzBSalgybDYxSlltSks4Q0grazYrRnpQcmdNZXA2Nld4WTN1Q1Nh?=
 =?utf-8?B?aTdUU20rNE4xM04yZzk1QlBmWjNNUkxycm4vK3dteEl4N3llSmNNOWxrTE5n?=
 =?utf-8?B?M3dvVDI1dkduTit2Mko1UXQ5cnJqeXdCL1Y4TktFTXBoWHl1L1BNdGEwN1JU?=
 =?utf-8?B?ZmNMNGhhZldhWEQ1QUNkNmtpUW5hN1dKTXNuWjYwL1lqMnFpMVQ3ZlRRRnZa?=
 =?utf-8?B?QUtWWVFvTkk2a1RRUUtYWU94ZGczdXozbkdMMmRCZFBUMEtXSEMzQi9Tdno3?=
 =?utf-8?B?dE1PWXlZRHYrZUE0b21sM3c2WHphOHZiVE9aaWZ6WmY2L2NBUVVhaldRWk03?=
 =?utf-8?B?OHltbktmamtyL1lSZUx2OWNNMkFIaVJoOERYbFUyUXdSR3lVTUhHc2Y4Qmsw?=
 =?utf-8?B?RzdRbzFDQXlsWnJPT3NXVjd2aEQzb1pCK2NLYS9XNjRLMSt1THhuTnBKcGpQ?=
 =?utf-8?B?NVRYdTdOL09oN1ZhMnBYKzNEWEp3ZFkrbHdRWHFKQUtCRDl4RWlLc1k1REJT?=
 =?utf-8?B?RDRLdTV0SDFaOGpnUFNGY3pqc2h1L3N6S0R3NWFHSmRaNXk5ZmsrOGY0QjJR?=
 =?utf-8?B?OUdNenVMUTQ5ajJ5UVlWbHJydnZJdXh5MGp4clc3YS9PWkZqQkdpL1FQWjl3?=
 =?utf-8?B?MkY1MVI5T0cxbVVCMnQ2VDAxT0U0OGxOSUw3b0xNVnZJR3BsUUtCT05kYW55?=
 =?utf-8?Q?rOnHhZKy9qbnphzk7wwwKzzNd8lAG20BgF0T9g8f7yCk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8ca815-fa21-456e-5c50-08db0f7ba9cc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 17:40:00.9849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ACpQgmMC2O5fQhyguWrTDb9lvZt5FdfjF6d4xlGz6ZdVTtKJ5Syn05vqFsXh9fw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5357
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>,
 NeilBrown <neilb@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, linux-graphics-maintainer@vmware.com,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.23 um 17:13 schrieb Thomas Hellström:
> Update the TTM swapout interfaces for better compatibility with a shrinker.
> - Replace number-of-pages int return with a long to better match the
>    kernel's shrinker interface.
> - The gfp_flags parameter to ttm_xx_swapout() currently only takes the
>    GFP_KERNEL value and shouldn't really be needed since the shrinker we
>    hook up in upcoming patches sets a allocation context to match reclaim.

> - Introduce a shrink reason enumeration and a driver callback to shrink
>    buffer objects.

Is that really necessary? This is mid-layering once more.

If drivers want to implement driver specific shrinking they should 
register their own shrinker callback.

Christian.


>    The TTM_SHRINK_WATERMARK reason is going to still be handled using the
>    existing shmem copy, and will be used by pool types that don't lend
>    themselves well to shinking (dma_alloc pool) and when drivers explicitly
>    requests swapout.
>    The TTM_SHRINK_SWAP and TTM_SHRINK_PURGE reasons originate from a
>    shrinker and is to be handled by a new driver callback, bo_shrink().
>    Helpers for the new driver callback are provided in upcoming patches.
>
> Cc: linux-graphics-maintainer@vmware.com
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c        | 38 ++++++++++++++++----
>   drivers/gpu/drm/ttm/ttm_device.c    | 55 +++++++++++++++++++++--------
>   drivers/gpu/drm/ttm/ttm_tt.c        | 23 ++++++------
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  3 +-
>   include/drm/ttm/ttm_bo.h            |  4 +--
>   include/drm/ttm/ttm_device.h        | 36 +++++++++++++++++--
>   include/drm/ttm/ttm_tt.h            | 17 +++++++--
>   7 files changed, 136 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 882c2fa346f3..e5c0970564c0 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1114,13 +1114,29 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
>   }
>   EXPORT_SYMBOL(ttm_bo_wait_ctx);
>   
> -int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> -		   gfp_t gfp_flags)
> +/**
> + * ttm_bo_swapout() - Swap out or purge a buffer object
> + * @bo: The buffer object.
> + * @ctx: The ttm operation context.
> + * @reason: The swapout reason.
> + *
> + * Try to swap out or purge the contents of a system memory backed buffer
> + * object. The function needs to be called with the device's LRU lock held.
> + *
> + * Return: -EBUSY if the bo lock could not be grabbed or the object was
> + * otherwise busy. Otherwise the number of pages swapped out or negative
> + * error code on error. Iff the function didn't return -EBUSY, the
> + * LRU lock was dropped, and LRU traversal needs to restart.
> + */
> +long ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> +		    enum ttm_shrink_reason reason)
>   {
>   	struct ttm_place place;
>   	bool locked;
>   	long ret;
>   
> +	lockdep_assert_held(&bo->bdev->lru_lock);
> +
>   	/*
>   	 * While the bo may already reside in SYSTEM placement, set
>   	 * SYSTEM as new placement to cover also the move further below.
> @@ -1142,8 +1158,12 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	}
>   
>   	if (bo->deleted) {
> +		long num_pages = bo->ttm->num_pages;
> +
>   		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
>   		ttm_bo_put(bo);
> +		if (!ret)
> +			return num_pages;
>   		return ret == -EBUSY ? -ENOSPC : ret;
>   	}
>   
> @@ -1184,13 +1204,17 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	 * Swap out. Buffer will be swapped in again as soon as
>   	 * anyone tries to access a ttm page.
>   	 */
> -	if (bo->bdev->funcs->swap_notify)
> -		bo->bdev->funcs->swap_notify(bo);
> +	if (bo->bdev->funcs->bo_shrink && reason != TTM_SHRINK_WATERMARK) {
> +		ret = bo->bdev->funcs->bo_shrink(bo, ctx);
> +	} else {
> +		if (bo->bdev->funcs->swap_notify)
> +			bo->bdev->funcs->swap_notify(bo);
> +		ret = ttm_tt_swapout(bo->bdev, bo->ttm);
> +		if (!ret)
> +			ret = bo->ttm->num_pages;
> +	}
>   
> -	if (ttm_tt_is_populated(bo->ttm))
> -		ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
>   out:
> -
>   	/*
>   	 * Unreserve without putting on LRU to avoid swapping out an
>   	 * already swapped buffer.
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index ae2f19dc9f81..7eadea07027f 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -116,19 +116,28 @@ static int ttm_global_init(void)
>   	return ret;
>   }
>   
> -/*
> - * A buffer object shrink method that tries to swap out the first
> - * buffer object on the global::swap_lru list.
> +/**
> + * ttm_global_swapout() - Select and swap out a system-memory-backed bo.
> + * @ctx: The operation context.
> + * @reason: The reason for swapout.
> + *
> + * Select, based on round-robin a TTM device and traverse the LRUs of
> + * that specific device until a suitable bo backed by system memory is found
> + * and swapped-out or purged.
> + *
> + * Return: Positive value or zero indicating the size in pages of the
> + * bo swapped out. Negative error code on error.
>    */
> -int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
> +long ttm_global_swapout(struct ttm_operation_ctx *ctx,
> +			enum ttm_shrink_reason reason)
>   {
>   	struct ttm_global *glob = &ttm_glob;
>   	struct ttm_device *bdev;
> -	int ret = 0;
> +	long ret = 0;
>   
>   	mutex_lock(&ttm_global_mutex);
>   	list_for_each_entry(bdev, &glob->device_list, device_list) {
> -		ret = ttm_device_swapout(bdev, ctx, gfp_flags);
> +		ret = ttm_device_swapout(bdev, ctx, reason);
>   		if (ret > 0) {
>   			list_move_tail(&bdev->device_list, &glob->device_list);
>   			break;
> @@ -139,14 +148,29 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>   }
>   EXPORT_SYMBOL(ttm_global_swapout);
>   
> -int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> -		       gfp_t gfp_flags)
> +/**
> + * ttm_device_swapout() - Select and swap out a system-memory-backed bo.
> + * @bdev: The device whos bos are considered for swapout.
> + * @ctx: The operation context.
> + * @reason: The reason for swapout.
> + *
> + * Traverse the LRUs of a specific device until a suitable bo backed by
> + * system memory is found and swapped-out or purged.
> + *
> + * Return: Positive value or zero indicating the size in pages of the
> + * bo swapped out. Negative error code on error.
> + */
> +long ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> +			enum ttm_shrink_reason reason)
>   {
>   	struct ttm_resource_cursor cursor;
>   	struct ttm_resource_manager *man;
>   	struct ttm_resource *res;
>   	unsigned i;
> -	int ret;
> +	long ret;
> +
> +	if (reason != TTM_SHRINK_WATERMARK && !bdev->funcs->bo_shrink)
> +		return 0;
>   
>   	spin_lock(&bdev->lru_lock);
>   	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
> @@ -156,16 +180,19 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   
>   		ttm_resource_manager_for_each_res(man, &cursor, res) {
>   			struct ttm_buffer_object *bo = res->bo;
> -			uint32_t num_pages;
> +			struct ttm_tt *tt;
>   
>   			if (!bo || bo->resource != res)
>   				continue;
>   
> -			num_pages = PFN_UP(bo->base.size);
> -			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> +			tt = bo->ttm;
> +			if (!tt || (reason == TTM_SHRINK_PURGE &&
> +				    !ttm_tt_purgeable(tt)))
> +				continue;
> +			ret = ttm_bo_swapout(bo, ctx, reason);
>   			/* ttm_bo_swapout has dropped the lru_lock */
> -			if (!ret)
> -				return num_pages;
> +			if (ret >= 0)
> +				return ret;
>   			if (ret != -EBUSY)
>   				return ret;
>   		}
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index ab725d9d14a6..a68c14de0161 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -239,22 +239,21 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>   
>   /**
>    * ttm_tt_swapout - swap out tt object
> - *
>    * @bdev: TTM device structure.
>    * @ttm: The struct ttm_tt.
> - * @gfp_flags: Flags to use for memory allocation.
>    *
> - * Swapout a TT object to a shmem_file, return number of pages swapped out or
> - * negative error code.
> + * Swapout a TT object to a shmem_file.
> + *
> + * Return: number of pages swapped out or negative error code on error.
>    */
> -int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
> -		   gfp_t gfp_flags)
> +int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm)
>   {
>   	loff_t size = (loff_t)ttm->num_pages << PAGE_SHIFT;
>   	struct address_space *swap_space;
>   	struct file *swap_storage;
>   	struct page *from_page;
>   	struct page *to_page;
> +	gfp_t gfp_flags;
>   	int i, ret;
>   
>   	swap_storage = shmem_file_setup("ttm swap", size, 0);
> @@ -264,7 +263,7 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>   	}
>   
>   	swap_space = swap_storage->f_mapping;
> -	gfp_flags &= mapping_gfp_mask(swap_space);
> +	gfp_flags = GFP_KERNEL & mapping_gfp_mask(swap_space);
>   
>   	for (i = 0; i < ttm->num_pages; ++i) {
>   		from_page = ttm->pages[i];
> @@ -315,12 +314,14 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
>   	       atomic_long_read(&ttm_dma32_pages_allocated) >
>   	       ttm_dma32_pages_limit) {
> +		long r = ttm_global_swapout(ctx, TTM_SHRINK_WATERMARK);
>   
> -		ret = ttm_global_swapout(ctx, GFP_KERNEL);
> -		if (ret == 0)
> +		if (!r)
>   			break;
> -		if (ret < 0)
> +		if (r < 0) {
> +			ret = r;
>   			goto error;
> +		}
>   	}
>   
>   	if (bdev->funcs->ttm_tt_populate)
> @@ -379,7 +380,7 @@ static int ttm_tt_debugfs_shrink_show(struct seq_file *m, void *data)
>   {
>   	struct ttm_operation_ctx ctx = { false, false };
>   
> -	seq_printf(m, "%d\n", ttm_global_swapout(&ctx, GFP_KERNEL));
> +	seq_printf(m, "%ld\n", ttm_global_swapout(&ctx, TTM_SHRINK_SWAP));
>   	return 0;
>   }
>   DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 2588615a2a38..292c5199d2cc 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1514,7 +1514,8 @@ static int vmw_pm_freeze(struct device *kdev)
>   	vmw_execbuf_release_pinned_bo(dev_priv);
>   	vmw_resource_evict_all(dev_priv);
>   	vmw_release_device_early(dev_priv);
> -	while (ttm_device_swapout(&dev_priv->bdev, &ctx, GFP_KERNEL) > 0);
> +	while (ttm_device_swapout(&dev_priv->bdev, &ctx, TTM_SHRINK_WATERMARK) > 0)
> +		;
>   	vmw_fifo_resource_dec(dev_priv);
>   	if (atomic_read(&dev_priv->num_fifo_resources) != 0) {
>   		DRM_ERROR("Can't hibernate while 3D resources are active.\n");
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 8b113c384236..6b45e0b639e0 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -375,8 +375,8 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>   int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>   void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
> -int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> -		   gfp_t gfp_flags);
> +long ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> +		    enum ttm_shrink_reason reason);
>   void ttm_bo_pin(struct ttm_buffer_object *bo);
>   void ttm_bo_unpin(struct ttm_buffer_object *bo);
>   int ttm_mem_evict_first(struct ttm_device *bdev,
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 4f3e81eac6f3..6bd2abf712ab 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -35,6 +35,21 @@ struct ttm_placement;
>   struct ttm_buffer_object;
>   struct ttm_operation_ctx;
>   
> +/**
> + * enum ttm_shrink_reason - Reason for shrinking system memory
> + * @TTM_SHRINK_WATERMARK - A watermark limit was reached. Not from reclaim.
> + * @TTM_SHRINK_PURGE - A request for shrinking only purged objects.
> + * @TTM_SHRINK_SWAP - A request for shrinking any object.
> + *
> + * This enum is intended for the buffer object- and shrink method selection
> + * algorithms. It's not intended to leak to or be used by TTM drivers.
> + */
> +enum ttm_shrink_reason {
> +	TTM_SHRINK_WATERMARK,
> +	TTM_SHRINK_PURGE,
> +	TTM_SHRINK_SWAP,
> +};
> +
>   /**
>    * struct ttm_global - Buffer object driver global data.
>    */
> @@ -207,6 +222,19 @@ struct ttm_device_funcs {
>   	 * adding fences that may force a delayed delete
>   	 */
>   	void (*release_notify)(struct ttm_buffer_object *bo);
> +
> +	/**
> +	 * Shrink the bo's system pages, Either by swapping or by purging.
> +	 * @bo: Bo the system pages of which are to be shrunken.
> +	 * @ctx: Operation ctx. In particular the driver callback should
> +	 *       adhere to the no_wait_gpu and interruptible fields.
> +	 *
> +	 * This is also notifying the driver that the bo is about to be
> +	 * shrunken and the driver should take care to unbind any GPU bindings
> +	 * and to note that the content is purged if @bo->ttm is purgeable.
> +	 */
> +	long (*bo_shrink)(struct ttm_buffer_object *bo,
> +			  struct ttm_operation_ctx *ctx);
>   };
>   
>   /**
> @@ -268,9 +296,11 @@ struct ttm_device {
>   	struct workqueue_struct *wq;
>   };
>   
> -int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
> -int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> -		       gfp_t gfp_flags);
> +long ttm_global_swapout(struct ttm_operation_ctx *ctx,
> +			enum ttm_shrink_reason reason);
> +
> +long ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
> +			enum ttm_shrink_reason reason);
>   
>   static inline struct ttm_resource_manager *
>   ttm_manager_type(struct ttm_device *bdev, int mem_type)
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index cc54be1912e1..627168eba8f6 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -87,6 +87,7 @@ struct ttm_tt {
>   #define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
>   #define TTM_TT_FLAG_EXTERNAL		BIT(2)
>   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
> +#define TTM_TT_FLAG_DONTNEED		BIT(4)
>   
>   #define TTM_TT_FLAG_PRIV_POPULATED	BIT(31)
>   	uint32_t page_flags;
> @@ -180,8 +181,8 @@ void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm);
>    * Swap in a previously swap out ttm_tt.
>    */
>   int ttm_tt_swapin(struct ttm_tt *ttm);
> -int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
> -		   gfp_t gfp_flags);
> +
> +int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm);
>   
>   /**
>    * ttm_tt_populate - allocate pages for a ttm
> @@ -223,6 +224,18 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
>   struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
>   					    struct ttm_tt *tt);
>   
> +/**
> + * ttm_tt_purgeable() - Whether a struct ttm_tt's contents is purgeable
> + * @tt: The struct ttm_tt to consider.
> + *
> + * Return: Whether the contents is purgeable in the sence that the owner
> + * doesn't mind losing it as long as it gets notified.
> + */
> +static inline bool ttm_tt_purgeable(struct ttm_tt *tt)
> +{
> +	return tt->page_flags & TTM_TT_FLAG_DONTNEED;
> +}
> +
>   #if IS_ENABLED(CONFIG_AGP)
>   #include <linux/agp_backend.h>
>   

