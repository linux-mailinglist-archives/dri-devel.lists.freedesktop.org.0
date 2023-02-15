Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238FB698352
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 19:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CE710E29F;
	Wed, 15 Feb 2023 18:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7B510E0B5;
 Wed, 15 Feb 2023 18:30:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqPtAetQ260o+/keasKjvJ5LKGLYSJkTNcg0hGqx8tEWDDL8r7QOQiZMgM75GLslxMHf0I8XHMD1CDpWUm5enXrWm++0ZEZ45IPVaNmoGCsp6gJBh5bPod/R2q0zKsuZ5MG3YaG9FnYr7tkmUU/FxNzej3MiuOZsmt93YqmgwKrs3INM9VQZ4vw0SMGlVK5qAWAJjUgUWHqusCQGc9QJrdqAGy9xKQw4uEonoubRUBV9ZU6Bvk2z31y82KZOQGrfV+FlH8gauvHn0t0q6P8jqNqqHpUJm6/exOmrSsSwz+oAupPhqvSYDqAtuey/wPhCMoqrRr5mXrCGpMDaWxD5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MltqT+d5ESd+pFLe08ckZbNOz7j3FwSRdVvpL1+itvI=;
 b=ZjUSfspaZpbUIREpV8g1E+ZE2EFzypsVjqESLRY5rchZPNAU81QZy5AgQH+KVE0+hhM5GSczWFPIXNtI2RmPFTiByg4xU3/+gr0ikSt9SozqfddXF13PhSHY1haiHz7lrXCLbH/EpvU+efgRlHrdXiCpw2RPWltoK8kxcq4Tk2X82NpZt595/CilnPHmgVXxk6pSBaZN+ENMZwDqiM81peVqTef/P155J9t1QqA53X7a7FN1W25R2MelN+DzgQoAQwsi8SLsTiOGy6aRu4JrOhrVUco8gcvfK5TOTkXo273vCx8sLDRFjkXNV3+HLF1A/3yDseivK0ZwBCRKHQFsAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MltqT+d5ESd+pFLe08ckZbNOz7j3FwSRdVvpL1+itvI=;
 b=4HBrd4wz3vcSyXcJeiWHjvyoZ2g4fwXdtZjd32d0WgmOKlWppblOl1VMv0jaeZOHCbTHZeKA8BsNPThjL8GhKq98+8kMlFgD87p4/nmXhpeMBTvlMoueFk3+HBuIR+fiizynr5b8a8uHHtLWXb3WLtbv4VCCbov+asPUOqx4ESs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6122.namprd12.prod.outlook.com (2603:10b6:a03:45b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 18:30:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 18:30:42 +0000
Message-ID: <6fdacb84-bca3-0645-0bb9-ba8def5bd514@amd.com>
Date: Wed, 15 Feb 2023 19:30:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 07/16] drm/ttm: Reduce the number of used allocation
 orders for TTM pages
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
 <20230215161405.187368-8-thomas.hellstrom@linux.intel.com>
 <c4ef56e2-4177-6be8-9346-9f4eccbb1ae2@amd.com>
 <81f935b26890642f48793c7b7c5685e445bfe0f2.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <81f935b26890642f48793c7b7c5685e445bfe0f2.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 453ddabc-f0e2-4f43-5132-08db0f82be61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZigXq+LA9Gu2pneT1RHN+A49IIfJidYqQcUPckZSeuCP8llWUQ2UHlV0zypihMiuhcRPHyAA8OzzEc6wc4rE0FErBESr8F5MqR+bL65n77alQs4wZTgDdLXvXWLGcmEPT4EjS5PwNXSWtZa8SLCn70XgoRu4DgzDeA2FFlk8DdSAUS+2PypQ0fwOLZsyjd1vZ5j+awLoQMt5HNF0U1PRaGsME3jxEM7QnERaEgGmjWoUSgxSt1xXKwKiaoByZ5WGunQNNGSGJhfgt2pgHtNs8CJv/nD/yWEuagWHO1umV+fJ9kqWQOJrFsA8kJWmWQWn8bRmtyEyZa0PIPqpHiScYkTYuLoUnXiK11rx5elRLyK+E0Km4jbji9UtnUpeAYOSlyex7JGgblifijtWEPJTzQzD+9o/b4K2QYqbyeGzhBHF8jj45iNKC7Drbsyr8DBfR+8pGvCzdz54Ov3b3Zbbg13c1qP7gM+t2HClgwxlVBu2Vi5S6YlTqkv5FE86yCmzKsOt5q5BWpYcAO3xlmcOHF7JKzsZtWpsH+NsYAnyAhZqrdMKUs9d+tUy8sG0lvAMOaYBdkJ1IxIrVh/PeH4bsPqInk5GvZ7xK3wN6vo9kWYQX2zwj0NbugqisWA3al8u/jTBFcDYGDMW7K0PZ7CyvF2H6a/69+AIEM1SNbO44thk9LCvdVLC8MNsekhopSrOUzxJRYdAC4OoudZX1ndZtjfn+fQkABqOq+zjh7FYCs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199018)(6512007)(36756003)(478600001)(6486002)(6666004)(38100700002)(186003)(6506007)(66476007)(66574015)(83380400001)(54906003)(8936002)(5660300002)(31696002)(2906002)(45080400002)(7416002)(86362001)(2616005)(41300700001)(316002)(66946007)(66556008)(8676002)(4326008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHdCbW0xUWhkdnkvNDR1WmthWHZ1WFpmVHNFT0R4MDg4dkpxQ0dJTGRVRkRT?=
 =?utf-8?B?aVFuVmY4cEhoVmJiSmYxZm5IOFZrTXk5RHV1YmtkSmM2MHo1ZkFFaVRjM3hY?=
 =?utf-8?B?STBXNkh2a3krQ3NkMEVZcEh6dVdxVGdpbUZhbUZiTllpNUZZWnFmSWtxeDEv?=
 =?utf-8?B?U3psVEZ2a01oYXp2ZFlsdHl1OVBnNXhlbHB6b0VlSThFbEFnbmRqZSs5alBi?=
 =?utf-8?B?RFVDKzVjL1VlMGQ4V1IweXNTNlhMRVV6Zy9jTHg0bldRdFl3UVgxSHl2bTRa?=
 =?utf-8?B?MTJaTFVmNkFadkVkNStrQXZiM0Iwejl4VE1yd3ZZSHE1QWczL05rUmcra0sw?=
 =?utf-8?B?cXp5MnlTRncrQi9mK01qelV3RU1wNXF4QUdpZ0UrQ1BTU3FqWEVzYk1qZDlo?=
 =?utf-8?B?UEpkKzRtVEE4dFB0d3lJSlpGY0d5WnN4RkJCRlJYeFZjMWtVeXVuQ0dVMTVY?=
 =?utf-8?B?ZVJIREhodS9ObG4wVjJSeHBoelMrWGlYRFJmUTVKeFQyWEgvTktHV2lpTEhr?=
 =?utf-8?B?ZkF1WW1iMExSL2JxN0ROdkdsdm9EQVdiQTZNL0twSlZpSDlHYW1zbWJoczVL?=
 =?utf-8?B?bzdza2lkcUxmV2lURUxpR0dncVZsUDBOYi9OM0p1aEhGUE43Z2lSckF0Nzhk?=
 =?utf-8?B?eiswdWt4Ni9VU3FZeVVxODVpQXRBMVNWNGtzMENsWXNSdGNvWjNZNkYydkJn?=
 =?utf-8?B?WTFKaWl1d2NVOTZ1dU5NWjhlait0Ym9wUTYvZ1FsL0VqNHpGUENOY3AySTAx?=
 =?utf-8?B?RExHdlJtUm9TWFNaOHhoRE5KMk00WFA3RVNUaFFnN3U5U1hxZzdQcjk5VWtl?=
 =?utf-8?B?SUFqU3hnOGhIb2Z6d0x5KzRwYlBOM1MwN2tHeUN3MTBQSmdSY2RjVTM4b2xD?=
 =?utf-8?B?R2ZRQ2w4MTJjNUVRMEJXek02aDJvTGZ2ZS9VUGpVV2ljeDRScmFpWkdONE9u?=
 =?utf-8?B?OE1hejdnYldsU09wMW9CQUZ4YXM5cUFJTWxucFgyc0F5SXREK094bHlLUHhO?=
 =?utf-8?B?d1VtVzZLNERwOUJPYW5lT3VTdVdqWmd6aUpvOXNOK0JaSzRqeHJrSENvYjNI?=
 =?utf-8?B?WTdTeWlQT2VERWx4Q1pna2hQZWtheXJrZzYyL2ZzR0FZT0tyQ3lZay91TGRj?=
 =?utf-8?B?dFF1NlR4MEZKNHV1d0llQXZLQWREM1BlWExEazgzcXpRcHhHNkVmZzFyYUtx?=
 =?utf-8?B?ZGd3NXoxa0gxME8vQ01MSVZTaGNUNHVRWGFKSGh2Z2ZaakVmbytYQy9kMlNG?=
 =?utf-8?B?d0xzWXJGZ0UwOFJiQ1FkeEFaSmpOVExkeDNSbjlwVFlPdkI1ZTg3WlR4bXpH?=
 =?utf-8?B?UzEvQUJBMGpaK05jVUNBaDhidjNKbGhXTVBjOXFQak9SOUtTZ2QxOHNhYUNz?=
 =?utf-8?B?bDZhWHlTVzVGUVlDcVNrdkJobTMrOXk2R1Q4RVF5cEJGUUFLa1lXekRialFl?=
 =?utf-8?B?MkxaK2ZIUmZ0emU0NGozYzBBNTBxM2F5cWgrWFVtS25OaDNBYzNkb25NaDFS?=
 =?utf-8?B?UVRzNHlBN2ZxZ3JaOXdjM2ZWZWt6K0lTb0FJaktrNzd5ME5EU3MrYWNNbEwv?=
 =?utf-8?B?bWZEODR1MC8zVVNGcFU2NkVTa1A0enRWV1YrOWoxQUttQVBpbmxxbThqODR6?=
 =?utf-8?B?RUlwS1FmRjZ2dGxNbzNidkJFYk1PQ3hSVWE3TGFIS3dJQmU2SnRocHI5dU13?=
 =?utf-8?B?bFVpbXpXQng0dXozS0xzK0ZCekxreU5xUXczdTdjWlJWTDc1L2gvdGgrTWxn?=
 =?utf-8?B?T3ozbkpTQ2VJdzhmNG1DOThPYlB3bllsWDFJdWlOVG5mS2dnLzRYN1lCRy8v?=
 =?utf-8?B?SlVOSjRST3BQT0QvOU5xOERwdmM5VVQzSTFkZnh2bFJFU1lUZHo0anh0aHJN?=
 =?utf-8?B?alFXQldXb2VpM0lSdVU0Vi9nT3habDFwTzhZL3RLNmZuZDhnUTdTckFwRlM1?=
 =?utf-8?B?aStqaTNKY0FLWlNRUnNRSFVIOUZpNVIxdWg1MFpjRjFBZ2VoOWpWTFBjWXBa?=
 =?utf-8?B?K203bTl3QjFkMTRQRU9Eek40OGkyZkNhQzdjK01wK1dqd2w1Rzl5VkFSajIr?=
 =?utf-8?B?WGR6dWpSN3Z1UFFodHp4NEIxWm8yejhhcnY4Vm94VlNYTU9iTS9nUEFaVmpE?=
 =?utf-8?B?Y1d4a2tvOEQyQSs2N2pMRnF2UEdjb3ZYK243UElRUXh5MTJNSWNSQW1qWDNY?=
 =?utf-8?Q?3JaDJroZEL98s8ivDs4zfg4W+I5fTK2yvUJ+piGA8dC5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453ddabc-f0e2-4f43-5132-08db0f82be61
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 18:30:42.0864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phgC6lWCabTnLRVvjN9MjkhCpPvPQZUu+0XJxXSDyFZl6DcTnBe8BuLAS4UGdsvU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
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

Am 15.02.23 um 19:12 schrieb Thomas Hellström:
> On Wed, 2023-02-15 at 18:42 +0100, Christian König wrote:
>> Am 15.02.23 um 17:13 schrieb Thomas Hellström:
>>> When swapping out, we will split multi-order pages both in order to
>>> move them to the swap-cache and to be able to return memory to the
>>> swap cache as soon as possible on a page-by-page basis.
>>> By reducing the page max order to the system PMD size, we can be
>>> nicer
>>> to the system and avoid splitting gigantic pages.
>>
>>> On top of this we also
>>> include the 64K page size in the page sizes tried, since that
>>> appears to
>>> be a common size for GPU applications.
>> Please completely drop that.
> You mean the 64K page size, or the whole patch?

The 64K page size. This was an invention from Microsoft to standardize 
GPU handling ~15-20years ago.

It turned out to be a complete shipwreck and by now 2MiB and 1GiB pages 
or just flexible hardware which can handle everything seem to become 
standard.

>> This is just nonsense spilling in from the
>> Windows drivers.
> Agreed, but IIRC on the last RFC you asked me not to drop the 64K
> pages, so that's why they are here. I can remove them if needed.

We could keep it if it's in any way beneficial, but I'm pretty sure I 
must have been drunk to ask for that.

> The only reason for keeping them from a performance point of view is
> better efficiency on GPUs with 64K page size if not using a coalescing
> IOMMU for dma-mapping.

Are any of those still produced? As far as I know neither NVidia, Intel 
nor AMD still assumes that page size in their hardware for quite a while 
now.

Regards,
Christian.

>
> Let me know what you think is best and I'll adjust accordingly.
>
> /Thomas
>
>
>> Christian.
>>
>>> Looking forward to when we might be able to swap out PMD size
>>> folios
>>> without splitting, this will also be a benefit.
>>>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_pool.c | 58 ++++++++++++++++++++++++++---
>>> -----
>>>    1 file changed, 45 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index 1cc7591a9542..8787fb6a218b 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -31,6 +31,8 @@
>>>     * cause they are rather slow compared to alloc_pages+map.
>>>     */
>>>    
>>> +#define pr_fmt(fmt) "[TTM POOL] " fmt
>>> +
>>>    #include <linux/module.h>
>>>    #include <linux/dma-mapping.h>
>>>    #include <linux/debugfs.h>
>>> @@ -47,6 +49,18 @@
>>>    
>>>    #include "ttm_module.h"
>>>    
>>> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>>> +#define TTM_64K_ORDER (16 - PAGE_SHIFT)
>>> +#if (TTM_MAX_ORDER < TTM_64K_ORDER)
>>> +#undef TTM_MAX_ORDER
>>> +#define TTM_MAX_ORDER TTM_64K_ORDER
>>> +#endif
>>> +#if ((MAX_ORDER - 1) < TTM_MAX_ORDER)
>>> +#undef TTM_MAX_ORDER
>>> +#define TTM_MAX_ORDER (MAX_ORDER - 1)
>>> +#endif
>>> +#define TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>>> +
>>>    /**
>>>     * struct ttm_pool_dma - Helper object for coherent DMA mappings
>>>     *
>>> @@ -65,16 +79,18 @@ module_param(page_pool_size, ulong, 0644);
>>>    
>>>    static atomic_long_t allocated_pages;
>>>    
>>> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
>>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
>>> +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
>>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>>>    
>>> -static struct ttm_pool_type
>>> global_dma32_write_combined[MAX_ORDER];
>>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>>> +static struct ttm_pool_type
>>> global_dma32_write_combined[TTM_DIM_ORDER];
>>> +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
>>>    
>>>    static spinlock_t shrinker_lock;
>>>    static struct list_head shrinker_list;
>>>    static struct shrinker mm_shrinker;
>>>    
>>> +static unsigned int ttm_pool_orders[] = {TTM_MAX_ORDER, 0, 0};
>>> +
>>>    /* Allocate pages of size 1 << order with the given gfp_flags */
>>>    static struct page *ttm_pool_alloc_page(struct ttm_pool *pool,
>>> gfp_t gfp_flags,
>>>                                          unsigned int order)
>>> @@ -400,6 +416,17 @@ static void __ttm_pool_free(struct ttm_pool
>>> *pool, struct ttm_tt *tt,
>>>          }
>>>    }
>>>    
>>> +static unsigned int ttm_pool_select_order(unsigned int order,
>>> pgoff_t num_pages)
>>> +{
>>> +       unsigned int *cur_order = ttm_pool_orders;
>>> +
>>> +       order = min_t(unsigned int, __fls(num_pages), order);
>>> +       while (order < *cur_order)
>>> +               ++cur_order;
>>> +
>>> +       return *cur_order;
>>> +}
>>> +
>>>    /**
>>>     * ttm_pool_alloc - Fill a ttm_tt object
>>>     *
>>> @@ -439,9 +466,8 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>          else
>>>                  gfp_flags |= GFP_HIGHUSER;
>>>    
>>> -       for (order = min_t(unsigned int, MAX_ORDER - 1,
>>> __fls(num_pages));
>>> -            num_pages;
>>> -            order = min_t(unsigned int, order, __fls(num_pages)))
>>> {
>>> +       order = ttm_pool_select_order(ttm_pool_orders[0],
>>> num_pages);
>>> +       for (; num_pages; order = ttm_pool_select_order(order,
>>> num_pages)) {
>>>                  struct ttm_pool_type *pt;
>>>    
>>>                  page_caching = tt->caching;
>>> @@ -558,7 +584,7 @@ void ttm_pool_init(struct ttm_pool *pool,
>>> struct device *dev,
>>>    
>>>          if (use_dma_alloc) {
>>>                  for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>> -                       for (j = 0; j < MAX_ORDER; ++j)
>>> +                       for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>                                  ttm_pool_type_init(&pool-
>>>> caching[i].orders[j],
>>>                                                     pool, i, j);
>>>          }
>>> @@ -578,7 +604,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>    
>>>          if (pool->use_dma_alloc) {
>>>                  for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>> -                       for (j = 0; j < MAX_ORDER; ++j)
>>> +                       for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>                                  ttm_pool_type_fini(&pool-
>>>> caching[i].orders[j]);
>>>          }
>>>    
>>> @@ -632,7 +658,7 @@ static void ttm_pool_debugfs_header(struct
>>> seq_file *m)
>>>          unsigned int i;
>>>    
>>>          seq_puts(m, "\t ");
>>> -       for (i = 0; i < MAX_ORDER; ++i)
>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>                  seq_printf(m, " ---%2u---", i);
>>>          seq_puts(m, "\n");
>>>    }
>>> @@ -643,7 +669,7 @@ static void ttm_pool_debugfs_orders(struct
>>> ttm_pool_type *pt,
>>>    {
>>>          unsigned int i;
>>>    
>>> -       for (i = 0; i < MAX_ORDER; ++i)
>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>                  seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
>>>          seq_puts(m, "\n");
>>>    }
>>> @@ -749,10 +775,16 @@ int ttm_pool_mgr_init(unsigned long
>>> num_pages)
>>>          if (!page_pool_size)
>>>                  page_pool_size = num_pages;
>>>    
>>> +       if (TTM_64K_ORDER < TTM_MAX_ORDER)
>>> +               ttm_pool_orders[1] = TTM_64K_ORDER;
>>> +
>>> +       pr_debug("Used orders are %u %u %u\n", ttm_pool_orders[0],
>>> +                ttm_pool_orders[1], ttm_pool_orders[2]);
>>> +
>>>          spin_lock_init(&shrinker_lock);
>>>          INIT_LIST_HEAD(&shrinker_list);
>>>    
>>> -       for (i = 0; i < MAX_ORDER; ++i) {
>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>                  ttm_pool_type_init(&global_write_combined[i], NULL,
>>>                                     ttm_write_combined, i);
>>>                  ttm_pool_type_init(&global_uncached[i], NULL,
>>> ttm_uncached, i);
>>> @@ -785,7 +817,7 @@ void ttm_pool_mgr_fini(void)
>>>    {
>>>          unsigned int i;
>>>    
>>> -       for (i = 0; i < MAX_ORDER; ++i) {
>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>                  ttm_pool_type_fini(&global_write_combined[i]);
>>>                  ttm_pool_type_fini(&global_uncached[i]);
>>>    

