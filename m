Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B18D698275
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 18:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815B810E28F;
	Wed, 15 Feb 2023 17:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2065.outbound.protection.outlook.com [40.107.101.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745A110E28F;
 Wed, 15 Feb 2023 17:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBgqgaz54ANckBCywT2Btc9lGIj97Mwrf5eMtYwSWU5sa3t9ufleeo9vzljHMi23iHrLPDv9GYv8JRyLVt4TikJr5feUkniVtUvVnfX68xx2rHh2/GE0kBlnA6br5nT7mHdS9pDJ5g5R53qkIIxEHGmFfAuQxJcp7gh+9mY3FaHQlyg1jBGOtnxkuP1IQBYg6Z+xBLfINndQiVxo/TwtuubIPUlHynTan/ddMelLq526wVa2trqeA/v4+pAQap9rsRZ2xQPnQ8020qAlCvuqUPMkilIFnJ3+QlD5SGggeOiy8Hao3Vs166wJNEy1pd44r9ZdjX9+YXvzT3WkazCHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ka6ntWLEi4qMXEDaI2jWivNNjLTbCi9gK0Phrc6RbcA=;
 b=S5yUZSqc7isV5MHd8tCCtEJcntOOIzd99k/c/ymzJTlYRDZhxCavSB0d4wyWoSPYByDvU/U99nQA36fRrp1fqJfzhNfNHrufYtRaYUyMQqw3ehyRAnEJ4l1d/NmrXv/wiOQHeT7odx+jXYVD2HxHkb7KmvA4484WSrEFWKAjgX+Tu27di8DjSJ06hHxJLxoc3u2i1bPvfescWu0jN1c5cibdXctvGbYlyH7I9INcEsVHiHezMDGlj+HegDorGRHf8GO4RGFjGhDpilG8DhRPZPXNFo8ag8VasSpZxBCFwDZrLNv5CqqdwgNQLka6HhmPlgaN4/BnZYaMDtYWCdkAtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka6ntWLEi4qMXEDaI2jWivNNjLTbCi9gK0Phrc6RbcA=;
 b=f58OXEnCVZus09zn5OmJpP1ItEaTWOjrVvea1eq1ELapLonQDhMKiH+5acjnDujD/7XRunGiS9WrP+kzq6Ze6gOHHDRF1JS+6VX7nqxD/UujcRK0JbRzPpipED0QeIzeGGSxATrSv6gxe/0YoNp1528FjfZ2kF7wUuCrB5Y4VLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 17:42:44 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 17:42:44 +0000
Message-ID: <c4ef56e2-4177-6be8-9346-9f4eccbb1ae2@amd.com>
Date: Wed, 15 Feb 2023 18:42:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 07/16] drm/ttm: Reduce the number of used allocation
 orders for TTM pages
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
 <20230215161405.187368-8-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230215161405.187368-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4438:EE_
X-MS-Office365-Filtering-Correlation-Id: c71fad76-172b-4b64-cfa6-08db0f7c0b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qDakDE3Jq//U9FdsxJiimesFDIHPoRC7pqlv17FpBv0MXN1J0jgCRUv7oj7cozMuq0MmEktIIqwX3I3z18e2rt8hLFKHOAhJ7VozZyuKSRvwu0UYf37pluezxZEzytSbvhUY5ncdmo26zKeNDtul4lbU/0QoZwYBQ9SVrhrWRZdDqVehp7dhZdjBLEXXFReUdMNo8kjOlt2ax9TZbVRYt/8dlqDtk5BVNCIr6xSm3oYy9kfco0NDhrqn2FgLccuv2LEZm77YgIGmNA+5Fy/bqQAQj7Jo8DX5LL54tWYMU+pTv75czafW19qgWfdvvkhK/7hB4x1S5Oo/6y5WWoA4JbPxzhIJ5dqTRjtTjJaHYeD/EQ85EiZDIGVE30J/KcPNAJgoDtpdFmT+f90EjPGc8GnpL7En958DjXj2n3CFNwADHw8cNVkAoRqB/5yTNYCB+Xa3cS/Fq0+nH/Af6SKnmuLwLxrEKokEhc8V6gh4dOn6jzTgsRn8GKuz+bzA/DK86T2a6vDeG9pU6iSIywtXNftUWUDJklw1NzSmHMXs/8c5YK+hnI97Cz4MyJmf9ZwaC+UQ6rOBvjclNSMFP+uPclNBBXIdfmSPoyishyinr1djJj2KnZ6nS5nEHYiWi6WhW/ekTkLEHtU2c8tBCa+nmBXgk9KZPKiz6HzIcXUfr2Qlc+sdJgyHDM+wq6LeyaLr+lR1uOM50LnqdYiehKlHosGej9TieRS79is8VKsLthQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(5660300002)(54906003)(7416002)(66476007)(316002)(31686004)(38100700002)(2906002)(8936002)(31696002)(66946007)(8676002)(41300700001)(6486002)(4326008)(66556008)(478600001)(6666004)(6506007)(36756003)(6512007)(186003)(86362001)(2616005)(83380400001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUkwdTFQekdtRXZQSE4wUU80aWNqditTQkI3U1Z6U0lTYzdNcDFyR0hSS0R3?=
 =?utf-8?B?eEhSQ0FjbFBUcEN0eDNzLzdPZE4yT3NHNDYzb1YrV1RxWXhrQ2NmSjJMKzQx?=
 =?utf-8?B?clQyZXRpdnhvb2N2cFZoV2VQUzhIanlHYkd2dUlmcURvN3graHUxQUlaNkx5?=
 =?utf-8?B?dWIzMm9rajl3cTUzN1lPanpFWEdhVVMwc3d1L3FtZWNUWlA3d0JqRjNxNDBX?=
 =?utf-8?B?aXRiOTRRMWxxNmRPTGNFK3loSlBJUVV0SDN1dnV0K3dHTXo4MmV3MnNzMUFC?=
 =?utf-8?B?ZnRxaUJGeEtMTjdFeWVqVXBmWStxZTZPejI1V0hNd1BaRHBYUUg3ck5wTXJN?=
 =?utf-8?B?MS9zS0hzSU0rRlFtSGZ4Z1pOSzJGMHRzWDUzTFc5T0NLY1lycFRCdnpXeTJz?=
 =?utf-8?B?ZDhtS1RCSzZObDY1cUlRSUhqYnZIcGlpQjlVaWU2TG9YZHRwM2JCMmphTnRy?=
 =?utf-8?B?S1I4REsrNWR1OVBsc2pjMkpKaTdpOUxOamNrRVdzWTJJcCtjME9VWFVwNWt0?=
 =?utf-8?B?bVJqb2pjcDVtekJWakJGa1BsdXB4QzVKWDBMUVJXYitabFdpRU9FNzlTcC8y?=
 =?utf-8?B?SC9teXRaZkVKRXZraTExNE10cTJTR0Y1SlA2T0pzc3J0WUFIZ1M1aTdCTlpO?=
 =?utf-8?B?bEozL2g5WEFoVi85OUlUdWdsUTFJZDBQOThMSHowaGovVXpkanlEcWxmMU9I?=
 =?utf-8?B?SWZFdU5TUm80Y3lneUVIOXluUExVd1Y3T0hRaURteWYveHdHM0tpbk1IQU9K?=
 =?utf-8?B?VzhFNUQ0TFFKU2FSN3FUYWNEZFB3OVErMkhHY25NN1N4VC8raWhHL3IxZk5h?=
 =?utf-8?B?V0FpclZFejFkNVR2NmN2Vk83UjJEa2prZnhnVFBhcDFxL2tpVi9KN3lVQ3lY?=
 =?utf-8?B?MUtJczdNN1YwK1owSmJGZDZaQWEvNno2SERIM2RUeUE0dVhFL0UwQmo5RFoy?=
 =?utf-8?B?WWlzWHFhN05PQlRieDZRN042cHVQRHFrYlVqVEFWTWw4ajNtTkw0SC9SS1lm?=
 =?utf-8?B?UnY0TGJjaW8rc3cvejdVaUk2VXBhREVjay95SmdMcFFMZXRmb3c1ajlyODRH?=
 =?utf-8?B?UjVDSmFjQmVxbWRxUi9GUHEvSGxtbUZhUFBhUGNMUDhoQUxQQUtzQUJsWjZk?=
 =?utf-8?B?U0xvdmMwaFhWbWxveUN6WkdNcFp6K1pSZ1lraUhKaVQ2aDUrTGpmTyt2V1N5?=
 =?utf-8?B?V28yUzlub2c3ZExaeURPQTAzUTgzVzNFa3JLWG5kTHkrMnRXME1kdlo2MFBT?=
 =?utf-8?B?clRhWkRvNW9tQ0N0b2p0NmcySVNKS0JGbWM0eHlqcWhpU2pjQndJb2R4TjFp?=
 =?utf-8?B?OUNMZGt4VEg1RlVpdVptZFdqTWcyKzhTNGw3bW4zMGI2aEQ4ZWdCYXJWY0R2?=
 =?utf-8?B?eFJ1TVNLcitWS0xKVXJPV3ZDSHVWTDZRbEp5RFdIcUM2NXI0Zjh6OUdhK2t4?=
 =?utf-8?B?UkdsZEtySEk0aktHNDVza0ZrQmh5M0twSjkrQ015ZGEwcDBFa3A2cHU5RU92?=
 =?utf-8?B?WjZqQkMxSWQ3TmZyTGFhQmdQeFcxV2xXK2k3aysyZFdCZmtiWEN3YW1ZU1Vs?=
 =?utf-8?B?OXQzZU1UWVFMV09tNVFlaE9Lck0rSGYzb3o3T0ZsSS9WcU5nazRoVWRISVNN?=
 =?utf-8?B?RnZlVEFvQnVYVk5OVVNjRkY0VnErS2dVMmFDNUJEUHMxVnJQaHRwazE2WjRH?=
 =?utf-8?B?MW1KTzQ1UHAydGxIWHQ2cTV5eHhEVEM5OVNndVI5ZHVHWXlZU09lSDRUdS9w?=
 =?utf-8?B?dkxqVDhxbFhLZ0M0blRSQ2tmNjJtYzZPcVdHbEZ6bDZkNUozbUcrNGlvVmta?=
 =?utf-8?B?QXBvNkRxZTQ2VmhxMCthMWl3VUZxK0ZzZFNXeEovcmVGc29Beld1M1lDNnUy?=
 =?utf-8?B?RmV2V01iL3hCVGJ2MWJDdVl0c2xCWWlMTEppZ0NoTHBLSWU2RlVDYUlXdWNK?=
 =?utf-8?B?KzZQendTNG8xNnBBdlRrZExLMDBZQmxlajhjMDR2N2NycEgyWG53Uk1Bd2Jq?=
 =?utf-8?B?SEJiUmQ5cHhZR0pUWHVuaUpUTkZaMXpZQk9wbFV4dmFwVUVhczdSQXdzZVdw?=
 =?utf-8?B?UGN5WGZYWWd6REVZb3FFaTRRTm1oVG45eW9XMVFPR3ptTitVUVRLUWhOSkI1?=
 =?utf-8?B?czhjZHUxc05jNFZYR0NXcU5hSnJCNlBSeHZnb1lIdHBTT25zN3F0dlZ6VnhU?=
 =?utf-8?Q?NnUUbPmQdri5Ub+UzZtYEua9umXdNZzXd0wv/rEGafwZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c71fad76-172b-4b64-cfa6-08db0f7c0b70
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 17:42:44.7235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP5Rq9vnulrZSv4vgE/8HyPX3/T7OG65qpGt7ZpSecSWh6j/V6AdT8JuazlQ/1pT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
 intel-gfx@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.23 um 17:13 schrieb Thomas Hellström:
> When swapping out, we will split multi-order pages both in order to
> move them to the swap-cache and to be able to return memory to the
> swap cache as soon as possible on a page-by-page basis.
> By reducing the page max order to the system PMD size, we can be nicer
> to the system and avoid splitting gigantic pages.


> On top of this we also
> include the 64K page size in the page sizes tried, since that appears to
> be a common size for GPU applications.

Please completely drop that. This is just nonsense spilling in from the 
Windows drivers.

Christian.

>
> Looking forward to when we might be able to swap out PMD size folios
> without splitting, this will also be a benefit.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 58 ++++++++++++++++++++++++++--------
>   1 file changed, 45 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 1cc7591a9542..8787fb6a218b 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -31,6 +31,8 @@
>    * cause they are rather slow compared to alloc_pages+map.
>    */
>   
> +#define pr_fmt(fmt) "[TTM POOL] " fmt
> +
>   #include <linux/module.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/debugfs.h>
> @@ -47,6 +49,18 @@
>   
>   #include "ttm_module.h"
>   
> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
> +#define TTM_64K_ORDER (16 - PAGE_SHIFT)
> +#if (TTM_MAX_ORDER < TTM_64K_ORDER)
> +#undef TTM_MAX_ORDER
> +#define TTM_MAX_ORDER TTM_64K_ORDER
> +#endif
> +#if ((MAX_ORDER - 1) < TTM_MAX_ORDER)
> +#undef TTM_MAX_ORDER
> +#define TTM_MAX_ORDER (MAX_ORDER - 1)
> +#endif
> +#define TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
> +
>   /**
>    * struct ttm_pool_dma - Helper object for coherent DMA mappings
>    *
> @@ -65,16 +79,18 @@ module_param(page_pool_size, ulong, 0644);
>   
>   static atomic_long_t allocated_pages;
>   
> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
> -static struct ttm_pool_type global_uncached[MAX_ORDER];
> +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>   
> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
> +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
>   
>   static spinlock_t shrinker_lock;
>   static struct list_head shrinker_list;
>   static struct shrinker mm_shrinker;
>   
> +static unsigned int ttm_pool_orders[] = {TTM_MAX_ORDER, 0, 0};
> +
>   /* Allocate pages of size 1 << order with the given gfp_flags */
>   static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   					unsigned int order)
> @@ -400,6 +416,17 @@ static void __ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt,
>   	}
>   }
>   
> +static unsigned int ttm_pool_select_order(unsigned int order, pgoff_t num_pages)
> +{
> +	unsigned int *cur_order = ttm_pool_orders;
> +
> +	order = min_t(unsigned int, __fls(num_pages), order);
> +	while (order < *cur_order)
> +		++cur_order;
> +
> +	return *cur_order;
> +}
> +
>   /**
>    * ttm_pool_alloc - Fill a ttm_tt object
>    *
> @@ -439,9 +466,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	else
>   		gfp_flags |= GFP_HIGHUSER;
>   
> -	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
> -	     num_pages;
> -	     order = min_t(unsigned int, order, __fls(num_pages))) {
> +	order = ttm_pool_select_order(ttm_pool_orders[0], num_pages);
> +	for (; num_pages; order = ttm_pool_select_order(order, num_pages)) {
>   		struct ttm_pool_type *pt;
>   
>   		page_caching = tt->caching;
> @@ -558,7 +584,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>   
>   	if (use_dma_alloc) {
>   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> -			for (j = 0; j < MAX_ORDER; ++j)
> +			for (j = 0; j < TTM_DIM_ORDER; ++j)
>   				ttm_pool_type_init(&pool->caching[i].orders[j],
>   						   pool, i, j);
>   	}
> @@ -578,7 +604,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>   
>   	if (pool->use_dma_alloc) {
>   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> -			for (j = 0; j < MAX_ORDER; ++j)
> +			for (j = 0; j < TTM_DIM_ORDER; ++j)
>   				ttm_pool_type_fini(&pool->caching[i].orders[j]);
>   	}
>   
> @@ -632,7 +658,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m)
>   	unsigned int i;
>   
>   	seq_puts(m, "\t ");
> -	for (i = 0; i < MAX_ORDER; ++i)
> +	for (i = 0; i < TTM_DIM_ORDER; ++i)
>   		seq_printf(m, " ---%2u---", i);
>   	seq_puts(m, "\n");
>   }
> @@ -643,7 +669,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
>   {
>   	unsigned int i;
>   
> -	for (i = 0; i < MAX_ORDER; ++i)
> +	for (i = 0; i < TTM_DIM_ORDER; ++i)
>   		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
>   	seq_puts(m, "\n");
>   }
> @@ -749,10 +775,16 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   	if (!page_pool_size)
>   		page_pool_size = num_pages;
>   
> +	if (TTM_64K_ORDER < TTM_MAX_ORDER)
> +		ttm_pool_orders[1] = TTM_64K_ORDER;
> +
> +	pr_debug("Used orders are %u %u %u\n", ttm_pool_orders[0],
> +		 ttm_pool_orders[1], ttm_pool_orders[2]);
> +
>   	spin_lock_init(&shrinker_lock);
>   	INIT_LIST_HEAD(&shrinker_list);
>   
> -	for (i = 0; i < MAX_ORDER; ++i) {
> +	for (i = 0; i < TTM_DIM_ORDER; ++i) {
>   		ttm_pool_type_init(&global_write_combined[i], NULL,
>   				   ttm_write_combined, i);
>   		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
> @@ -785,7 +817,7 @@ void ttm_pool_mgr_fini(void)
>   {
>   	unsigned int i;
>   
> -	for (i = 0; i < MAX_ORDER; ++i) {
> +	for (i = 0; i < TTM_DIM_ORDER; ++i) {
>   		ttm_pool_type_fini(&global_write_combined[i]);
>   		ttm_pool_type_fini(&global_uncached[i]);
>   

