Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7B46DF830
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF5C10E82F;
	Wed, 12 Apr 2023 14:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C7F10E81E;
 Wed, 12 Apr 2023 14:18:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKmFer6M4sVrGsxEWu+EuVyGLFieXAGm4+4ZcHhuSdOEomcNM1aWgwCoSZcs4jUeoNS3Y27g80E2vIENhyTyinxVrSNI0mI9SolK8mmPjbl2BM2yUsojoO9g97GRVuBg7sGkalB3OzEgMKhqXLq6xkn5XSRmMUwrsVM+0y7sXmm9L38F7rKRRoUdh35gcRr2n9EpQMmGphmrkmoLNEZvT3Y40oGF1jBuZPCTqmrOtWZnJDvkgiwCNot6QiltQYJx4/YL+cBL6tCt3oqMroOktAt26hpOvkZRjw3fHnxBFutF/RFQUbb4HA6yrGpg2MrqqSFE8Jc3BPZYjMR4avjdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTUpYBq9CMOql5pyvd8fyxGf6s3u68sl6SJgH2xX+WI=;
 b=Wk62PmCuREG7WD8PNilgC+Tt1rastfgrM1VTG0yGISvKgUYYrLPWEhRbEl1LUTj+Apw+tHB9yoDZhqqHNnN2ME29G4nKzo0g1hFWbbKRc6blSKpqfOUZInxySiOmhP5gTragi3PDpPf4/1DvkNc0PB4inBGNSWAMopcviP8srbnWqkuEJFjfKLQhjjYSiLR5mjESNRoFRV6DaZ0vw7qaJYZc6hET6OdAcTzdgAooEX+3sYiZfnFsr4nZgOtHSSCXmVGlSGWVALshm2o5ffn89xF7a6S/OJvYIWbVhJwEbeq94/DO+MsjaPdewZK+QFA2N5/9YTdqRTD36/b2nAceSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTUpYBq9CMOql5pyvd8fyxGf6s3u68sl6SJgH2xX+WI=;
 b=MMEH1ZclekkqCM5MOyNPWkhhbZOFUBY4hDkAoVHDg2kap3QakM3M592yu+IMgEaMIXhi/M/fN51GSsWIeo93sjiZgUw08hXhmA6vn+cNiSN2I0urwu4wRAYwzVWjdqygExegA/6ciP1CrEFk63W2fMDDi8p2ef4c0nFQf2rGjGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7954.namprd12.prod.outlook.com (2603:10b6:806:344::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Wed, 12 Apr
 2023 14:17:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 14:17:57 +0000
Message-ID: <ae672182-f7a4-7107-1071-1561c49bc122@amd.com>
Date: Wed, 12 Apr 2023 16:17:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND v3 2/3] drm/ttm: Reduce the number of used
 allocation orders for TTM pages
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
 <20230404200650.11043-3-thomas.hellstrom@linux.intel.com>
 <ZDUtqsNtXcU4W3O6@phenom.ffwll.local>
 <33b145f1-fce5-95f1-357d-dda128e3548d@amd.com>
 <ZDVkhtx1/uToLM5R@phenom.ffwll.local>
 <CAKMK7uEZdWjs9snGdNpzBthOWz0YSCZh-rNKOGywLWozzpFwbA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uEZdWjs9snGdNpzBthOWz0YSCZh-rNKOGywLWozzpFwbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f4fda2-5491-407c-06b6-08db3b60b6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9CqTq+5IMlE1NFQ2kwIZgfWD1YWmAcnAY6Wc/cRRKDRX2Q5GGXDpYGoS83e+f+1MYSKnjiW46bWugxyDj/afwY4F7Uw2cC0pR1Tla2H+fDgJOoVc89McpulBwi1veEK8IkuBGN7r510LM24EAKaFvKvqStkcJiylS4LkUpFZzX2BkkZ/eMMx474WXgLcaY0gzsl3IfDnFkIlyCcZidiuOAF0N1eK2Oo9mog3OqUkvkuOao/FueMbSXReLuakNe/XNDbZFAwtl3n0TOMiXEz6/YJxaHk5/x026phwhIkqarmmM931afbb8mcNKCsnOsUyUnp2l8nmMah/9AX8EOvBP0+sPwy3o+pyPavn9EoekHM8bpagaoY8b2qAGx3X9+NW7CJB5Z1YKCnm8TdpKbHdYf5v7T0tpre04qedOgQcBnosrwie9uHW6VYyM43OZR9BYvQAa7I1Ilzg2xFCKGObLiRrcmv0+M77bd55qNeMC4kGo0VyDQDALytufyGMwwmGA5VcC/VUnGoJ7wNL6MJkVIsj0XcKejN8LacQ+mIuk7BBFO5X31OE4a9KFb3RqwV87sUcO77Hz6uFV6KGhKEJ65+WTDiTHh9gReWqllj6i6bygamxH7rSghWsxmDXheq13Tp6OLEshxxs8fDH9cvYmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(31696002)(86362001)(36756003)(316002)(54906003)(41300700001)(66476007)(478600001)(6486002)(4326008)(6916009)(966005)(66556008)(66946007)(8676002)(5660300002)(2906002)(8936002)(38100700002)(186003)(83380400001)(6666004)(6506007)(6512007)(66574015)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzhOeFVuN3BkdFh6b2IzREdPM01GTno0YUFCN3JuVU40QzRrV01ZSGR0NjhV?=
 =?utf-8?B?cE5TZkRtMTVFSjhlcFZOOS9pcXRadHY2Mk5HOHM4SnhGbFVHWDZtdnZJenNq?=
 =?utf-8?B?akg0aU5jenJmR2o2SXBwTGJBSWdVd3MwZ2dDalUrTnlGTG02bG80cThYUlNs?=
 =?utf-8?B?ZEdZVkFTUC8zQTA1cDlqY0tLbXl3eFU3TkhKYW80ZHJ4MjFGNHJkS2N4TVpo?=
 =?utf-8?B?VFFxb05pQXBmU1FaVi9lbnBPU2k5OUgxQ2NGdTl5eGtrNUpyTEhwaCt1RXE4?=
 =?utf-8?B?R1FLK3RLRmUwejhmdlpiWjlZcm9oNitoZU5IS25qYU1UVldHbXJQMHpNc3Vk?=
 =?utf-8?B?ckJJYzE0OVE2dnVVRGp6RWgwbExoL3hBWkxvck5zZlc5M3BhU1ZHMnNmNEVk?=
 =?utf-8?B?aDJqVmpHQVNhNWFlOThYZ0ExcFdLVDlnQXVvTWtLUTZ6Zm81SnRtbWtCWFFJ?=
 =?utf-8?B?aW0yS1R6Qm42WElSWVJYUnFpVGRpWEJEOGJYZDhCS1RJRndVUUNFakVqWFVv?=
 =?utf-8?B?ajFZSzBuZHJGVzlMaSsySzNnNS9DRjZlb2JKb2J2NktmUkRmbFBKRHRaZ00y?=
 =?utf-8?B?a0dvSDU5Q3FTRnA3dGpLYUh3eEt2aU5ydTZVa2V2ZmRQL1VSc2FvY3BXa1hH?=
 =?utf-8?B?SUFBcVloK0V3MU1ZeXVkR0hTb1dhTkk4TGhXQVFQU2ZQdWgybG5PRmMvMEds?=
 =?utf-8?B?QUdiNHplUEZGdS9DZG1HaEZnaGM3RitYdnFoZHdESnhTM0gyNi84NUxlYTZi?=
 =?utf-8?B?M0x4UXNHWlo3TWZ0NnovZ2hJT3FSdVVNdjlKa2tGMFZjQ2hwZTQ3SGdMTjVH?=
 =?utf-8?B?bm5RajRFTnhQMy9jVDhzdGNkZGJ5QzZNbEpaOXI2SWg4WkF1V0YzbWdsZ01W?=
 =?utf-8?B?ZDFiemxzcmhuTGxTeWMvd0Fvek1ZMzA0Tk82b01CR3NabU8rSklsRW5XcUlY?=
 =?utf-8?B?cjczNG5mSkIzZHZ5UG9XWXlPaTdCQ2ZtU21jRUdyamNyUnJNWjRZekc5UzR5?=
 =?utf-8?B?c3FkSlhsc0c3NGM2Rm56RGQvWSs5YlcvR2FlZTY5eVh0SmtROVBEWDY3eDdQ?=
 =?utf-8?B?NFBFand0YlVQY3hVNUlRREl4RDB6Tk5FUFlWSm5uSklDdlNyYldhUGc5UFBm?=
 =?utf-8?B?MlZmQ3l1ZWRmZVZKYWxDd3B4anpYUHduNmVBOFY3Qnc1MFNUTVp6ZU0zejZM?=
 =?utf-8?B?QStaZWZydkNjY245dERtOEs2cXo5THdiVHlmTVNTQWpQMHdsOWZKRkpad3J0?=
 =?utf-8?B?WDUrZ0laZUx0Q0NLMDVQcFdoN2dHTzVZQW4xY2dtYzRoSXNuUXlBdWVDSno3?=
 =?utf-8?B?MTNsZXRueXE3bUVFbEduS0dtMXVNUnEydE5oeVJqYXlXb3VCdHNEcnhpVEkw?=
 =?utf-8?B?Z0tzbzEwTFhscVhmS1Jva2l4YWE5NHk5dlZ0UnpwZ0FYUFh0SzdORUc4SDlU?=
 =?utf-8?B?c2w0R0pWUGhDVkdZME8zdlB6a1VEYkhsRmR2WkNxTHpLZ1RMV0xKUXA4N2lP?=
 =?utf-8?B?MnA0dnBYdXFMYSsyZFJxd0x5VlBqZDljaTRQdDNRUUQ4dnpBR0ZYNEZVd3ox?=
 =?utf-8?B?dE5qdlFMenZtaHlUU2FNaWM0RVc0UEV1dWhUaDNsVVFZWW95Ujh1K1VReU9P?=
 =?utf-8?B?RmFKeElNclpqSlFoRG5zRE9KMW9NZ0N1VS90N1o0SktDQnBsRTRGV0puam1m?=
 =?utf-8?B?aW5WUnRaN1JOR1hodE1zUnBNanE2eDhseEFGbjA4S3JKNS9rNk5jc1JGNlZG?=
 =?utf-8?B?NHA4MTU5dlBWanJqZTM1TitRelgyM3gxZU1OUkUrMTlsQUpFMFcrejJLM2pF?=
 =?utf-8?B?U2NIMi9aUUJCVU1jbG5RUlcraDFTV3ArU0l4TWErYjlLbjFYZk9meHlTMG5J?=
 =?utf-8?B?VFRESWRUZ3VxT2xudTl2ZFFaOE1pblgyOXRxVGNMckVZTU5JYXNITDNHOWI4?=
 =?utf-8?B?M2hjNFY0NFBkMWFoeGx4OWE0Wm8zK0xnVS9RMFlTc1E1Y05FN3psNE1Ud09P?=
 =?utf-8?B?Z2Nqdnl5UG0ycnZSbU5SOW1SMkNnMHZiMkNjUE1LSUo2T3V5YjJhTVB3b3Fq?=
 =?utf-8?B?eEFUVDZaYzR4KzhsdWFFL2tlWlhWb0oxYTVTTzVMOVYzOXB3OFF1dXZoOEFH?=
 =?utf-8?B?Zno3aDJPRDlxWjg0bm1BQXFEbDFZM0VsdkRzNnllZlZtOE1Zb1FDcUlSYm9P?=
 =?utf-8?Q?yxSMzpVMHOd90mmxjPj2EwDctPic/FTNNzP3z98QqMHT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f4fda2-5491-407c-06b6-08db3b60b6a9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 14:17:57.3610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0YZSvTAck1kWnO/3iDppsswRZeSwa8Do9rcGctq97nA78co3v9i60jPO8cXqoES
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.04.23 um 11:08 schrieb Daniel Vetter:
> On Tue, 11 Apr 2023 at 15:45, Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Tue, Apr 11, 2023 at 02:11:18PM +0200, Christian König wrote:
>>> Am 11.04.23 um 11:51 schrieb Daniel Vetter:
>>>> On Tue, Apr 04, 2023 at 10:06:49PM +0200, Thomas Hellström wrote:
>>>>> When swapping out, we will split multi-order pages both in order to
>>>>> move them to the swap-cache and to be able to return memory to the
>>>>> swap cache as soon as possible on a page-by-page basis.
>>>>> Reduce the page max order to the system PMD size, as we can then be nicer
>>>>> to the system and avoid splitting gigantic pages.
>>>>>
>>>>> Looking forward to when we might be able to swap out PMD size folios
>>>>> without splitting, this will also be a benefit.
>>>>>
>>>>> v2:
>>>>> - Include all orders up to the PMD size (Christian König)
>>>>> v3:
>>>>> - Avoid compilation errors for architectures with special PFN_SHIFTs
>>>>>
>>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>> Apparently this fails on ppc build testing. Please supply build fix asap
>>>> (or I guess we need to revert). I'm kinda not clear why this only showed
>>>> up when I merged the drm-misc-next pr into drm-next ...
>>> I'm really wondering this as well. It looks like PMD_SHIFT isn't a constant
>>> on this particular platform.
>>>
>>> But from what I can find in the upstream 6.2 kernel PMD_SHIFT always seems
>>> to be a constant.
>>>
>>> So how exactly can that here break?
>> There's some in-flight patches to rework MAX_ORDER and other things in
>> linux-next, maybe it's recent? If you check out linux-next then you need
>> to reapply the patch (since sfr reverted it).
> So I looked and on ppc64 PMD_SHIFT is defined in terms of
> PTE_INDEX_SIZE, which is defined (for book3s) in terms of the variable
> __pte_index_size. This is in 6.3 already and seems pretty old.

Ah! I missed that one, thanks.

> So revert? Or fixup patch to make this work on ppc?

I think for now just revert or change it so that we check if PMD_SHIFT 
is a constant.

Thomas do you have any quick solution?

Christian.

>
>
>>>>> ---
>>>>>    drivers/gpu/drm/ttm/ttm_pool.c | 30 +++++++++++++++++++-----------
>>>>>    1 file changed, 19 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> index dfce896c4bae..18c342a919a2 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> @@ -47,6 +47,11 @@
>>>>>    #include "ttm_module.h"
>>>>> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>>>>> +#define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>>>>> +/* Some architectures have a weird PMD_SHIFT */
>>>>> +#define TTM_DIM_ORDER (__TTM_DIM_ORDER <= MAX_ORDER ? __TTM_DIM_ORDER : MAX_ORDER)
>>>>> +
>>>>>    /**
>>>>>     * struct ttm_pool_dma - Helper object for coherent DMA mappings
>>>>>     *
>>>>> @@ -65,11 +70,11 @@ module_param(page_pool_size, ulong, 0644);
>>>>>    static atomic_long_t allocated_pages;
>>>>> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
>>>>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
>>>>> +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
>>>>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>>>>> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
>>>>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>>>>> +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
>>>>> +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
>>>>>    static spinlock_t shrinker_lock;
>>>>>    static struct list_head shrinker_list;
>>>>> @@ -444,7 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>>>            else
>>>>>                    gfp_flags |= GFP_HIGHUSER;
>>>>> - for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
>>>>> + for (order = min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages));
>>>>>                 num_pages;
>>>>>                 order = min_t(unsigned int, order, __fls(num_pages))) {
>>>>>                    struct ttm_pool_type *pt;
>>>>> @@ -563,7 +568,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>>>>            if (use_dma_alloc) {
>>>>>                    for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>> -                 for (j = 0; j < MAX_ORDER; ++j)
>>>>> +                 for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>                                    ttm_pool_type_init(&pool->caching[i].orders[j],
>>>>>                                                       pool, i, j);
>>>>>            }
>>>>> @@ -583,7 +588,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>>>            if (pool->use_dma_alloc) {
>>>>>                    for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>> -                 for (j = 0; j < MAX_ORDER; ++j)
>>>>> +                 for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>                                    ttm_pool_type_fini(&pool->caching[i].orders[j]);
>>>>>            }
>>>>> @@ -637,7 +642,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m)
>>>>>            unsigned int i;
>>>>>            seq_puts(m, "\t ");
>>>>> - for (i = 0; i < MAX_ORDER; ++i)
>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>                    seq_printf(m, " ---%2u---", i);
>>>>>            seq_puts(m, "\n");
>>>>>    }
>>>>> @@ -648,7 +653,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
>>>>>    {
>>>>>            unsigned int i;
>>>>> - for (i = 0; i < MAX_ORDER; ++i)
>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>                    seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
>>>>>            seq_puts(m, "\n");
>>>>>    }
>>>>> @@ -751,13 +756,16 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>>>>    {
>>>>>            unsigned int i;
>>>>> + BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
>>>>> + BUILD_BUG_ON(TTM_DIM_ORDER < 1);
>>>>> +
>>>>>            if (!page_pool_size)
>>>>>                    page_pool_size = num_pages;
>>>>>            spin_lock_init(&shrinker_lock);
>>>>>            INIT_LIST_HEAD(&shrinker_list);
>>>>> - for (i = 0; i < MAX_ORDER; ++i) {
>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>                    ttm_pool_type_init(&global_write_combined[i], NULL,
>>>>>                                       ttm_write_combined, i);
>>>>>                    ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
>>>>> @@ -790,7 +798,7 @@ void ttm_pool_mgr_fini(void)
>>>>>    {
>>>>>            unsigned int i;
>>>>> - for (i = 0; i < MAX_ORDER; ++i) {
>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>                    ttm_pool_type_fini(&global_write_combined[i]);
>>>>>                    ttm_pool_type_fini(&global_uncached[i]);
>>>>> --
>>>>> 2.39.2
>>>>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>
>

