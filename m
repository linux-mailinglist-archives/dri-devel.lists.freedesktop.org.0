Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF3B698347
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 19:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A819110EB58;
	Wed, 15 Feb 2023 18:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1FA10EB28;
 Wed, 15 Feb 2023 18:26:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+gVZMghgKCtdJim75A9HuQaNqtiElCQT9YWO/UhjD3pl/ZYPrTrwfRg/YgRiwSRjSa7Lbf0xqJzVDofQ7DFO7s2gSp47pkOay6hMZR48jY65YNvUcO0KMN6e5YUVFqgBuzQoJFG3dgaLL0HGWj9JUqXddmN7g10ZQM5bKsm36sTw894EzxpX1flVZDSuaYLGFgMxDwT25dOqiG4fGzC4QyqzRui49QxK6SRYDLefO+NoA2MMv10m2eKZMuC6/HBae18Qj1pfvcyfifF8mtk2mrvtF0B2lkqjkQ1mamZTBT3C5Bq1uQ5bEfkkRxGgQ5Tg0Q9IOMj5L7mZWP175+Efw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYVcxXdrE0zIFwzt2JyAAXyIc6i9D8bz419cK34TRAk=;
 b=f6zAlSdq+DdubY/g6Dy/ieIh6oEHaNkJ2q3YweQMFamY4s/mKrE44/98hyhRxl61X5FNE/bvOsepMKJTf/0zEpWbrMyRsHYsSVDEWWJ3pu+J90l7VPg5loGuBUPS5U5hUIGAWL5bzei4+ID95A45HIjPJkDB88QuwnPyImWihRdWO+6g2E6ELwpaoO97nrdzYHhlqVYZrS8rG7ESzD0Rb2VRQKSxaVYZftJZNO52p95RAX0gkFoFBf60bwQBGzV7DAdYi2Zdz0nU+bEGOb12oqAVkL8/dn4LW2aMUc7rcRivTx2NoT+rcpjy15MDpfCgOkfFyHOEpdEiJTB3vX9fsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYVcxXdrE0zIFwzt2JyAAXyIc6i9D8bz419cK34TRAk=;
 b=dIfnrwKuNFj4qz2ttKYzsAt3mEzVVhN2CjYnc1VoV6Lz6+p/64IeeFBR2W71BbJ74ZfKpycDhaXK7aMJ/PywI4x9NYnQZGsGveBjSHGc5TJzEry8PxQHkJ+NUbXMROc9g8zkoXFppx4kb1p8Cjs4AlmGCLhHOn+WFBHiyXaf6Gw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 18:26:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 18:26:32 +0000
Message-ID: <63d9b7a9-1d03-c434-df77-055969c42517@amd.com>
Date: Wed, 15 Feb 2023 19:26:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 02/16] drm/ttm/pool: Fix ttm_pool_alloc error path
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
 <20230215161405.187368-3-thomas.hellstrom@linux.intel.com>
 <c60e39bd-4a3c-5870-1fbf-7a6f0594a505@amd.com>
 <85166ca49f556c9faef7a0d76cb1e826c0014ce6.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <85166ca49f556c9faef7a0d76cb1e826c0014ce6.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 929ff8d4-c92c-4bc7-fc2c-08db0f8229dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vev3er1ye7cUr1ZZnz/YrficVv9nko0ADnN12k8xMSu9WhrI5vmLv3gHSmjQOXQceprJ2/5Rin40Qck2XI163R+OOPhIcCkP9+wWdPgmUDGGFAX497ABbMBnQ3PReSyXEN70VU5CI5v+UDxQyM6xNNrIHNwmNiVIyxIRfghOFc5vVdO8cKVVjFpxZHY0qAXKRWj5sGnxizAgXeFBePfB2zfWqKE9ti2bQGyNMO1F8Xjk+ljkrJeo9MwAYgtNuz4kpaW7GV3w8Qb0LnaUwshOK/DWAhbgF6bj0eU/cz2MTVMmw2I3i9Fa0kylcjnirqJSqod0xeHZpKHz8xwMMwMhSS/fD2HrdK6ca+QJZKJ1/jEJZIFOxBTlAeMD4n8+WL5AKbLWhCp2+TGcKxd+IjIHFmsK0+ikIzXk8k5NG1HfALtEF21hcKNEyPC8VCfDdQATCDFYNTmxUfdFjeeKL+pjVYxbzbn6PKD5WU3bBbeZMja5kpOaxrjajU7+p3QvYtmCubqnNdSc4TWuT6tXvdcggUKKt2fvA5/4KM/IOhaGCiFZHguJ824GJh8tTMDKjoF/PlRjW0LlRMetQa2jPWBRXdtZpPWxHSCkY5H5M+Co/ycKzdA/l/jG4NLieqDFz6RuK2Hz47HBJYxYBmfqimaAzp4NpMZdCWkFG4IB5e3CeVOnr0SqNYUwYARsUig73OLJggyU8DnZCuV1VS4FmaerioX7xw48YG1H3ih0JDTQIo0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199018)(4326008)(66476007)(8936002)(316002)(54906003)(6486002)(2906002)(66556008)(478600001)(41300700001)(66946007)(31686004)(8676002)(6666004)(6512007)(186003)(2616005)(66574015)(83380400001)(6506007)(38100700002)(31696002)(5660300002)(7416002)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlREdmtwclR3UVFNY2VlcHZGdzE5d1piVGQ3ZmRtbnUwd05iNkVleFhtR2Jn?=
 =?utf-8?B?dlU5K3N4RlRQQ1gyU0hwbWlDZUtGdjZvTSs3MXp6Tld3eFoyUzFqZmRxU2wy?=
 =?utf-8?B?dFRZUzJoeVl3cTl6RDZXL1U1S201amNaSjJ0cHMwVmFWc0xRa2JYdGFSY29D?=
 =?utf-8?B?Q1o3YnlvajJQbHVZVnVlcktaQTdpUjdDSlRNTUlRaWNNVm8xSnFRZXNXRFkx?=
 =?utf-8?B?NldoNmZoWjNzT3RFOVFYK2FDRmtxcThPTjRnYXdjaWdNa1IvOUswa1BqTzFT?=
 =?utf-8?B?eGZuelVNS3dvdkJUL09tT1Q3TCtrVWRKZE1mZVEybTJYb2x5bkVXcE51M1M5?=
 =?utf-8?B?TUtWMzBqV21tVE93Umd1Y3psNjVNMzhGYzRDT3dlVWViSXlsK3hieXg4Ymxw?=
 =?utf-8?B?Ukd4WHdOeGdrN2RweWJTZDZJam83MHRzWUprYTZ3cGhUTGg1aUMyUEc5TUJE?=
 =?utf-8?B?TitXYTRLcStwRitZT0VGWjNCOFZoVldFbjJUZGhpenY3ZzdGaFpmVFFZZUVo?=
 =?utf-8?B?YWpoTElWYlhLTTBuSW4yTEdRNE1Nd2U0Z2VtK2kxWUd3WHArbzZjakZ0ek9o?=
 =?utf-8?B?YW9hRzlsbU1KWE1qZER4eHRwRk5kOWFjci9zdFdTanhKTkNNUkFmTnVneGdT?=
 =?utf-8?B?cTl4K2V6ZGlaQ29DTlZkWXMwc0YxNjNKKzVTbnU1RlFEV3hyWHk4d3dBZ0NI?=
 =?utf-8?B?WU1KdjdNMmw2R0RSUkRqbUM3OUpiYnZTWUFVcVJPREZ2QlhCMDltM0NLcnNN?=
 =?utf-8?B?UUo1U2cvL1BWTWVYZFBnWlhxTmd1UWtsalRTTitBTVVFMDdVc25JSWhqY3c1?=
 =?utf-8?B?NGp0ZmhiaUZ4TXFZRDNxOS9YaHRnNTZEOWZrVXBoU2pWUHAwcHh2Rmw1YkNm?=
 =?utf-8?B?aDBRNFFtNlFSbndSODlPay9TRS8rOHJOU0R3OGVIbm1zNU9PVTY3eWUyMXFh?=
 =?utf-8?B?T2cweXhISUtRa2ZJdzN4eXlyU083d2ZmTncyd1RCY0l3WnNucDJsQk92Mk9z?=
 =?utf-8?B?akU3QVhad2UwRUNxOGpMSzhOMTV0MzJnaWhOOW9EanhqZFpYMndjUWV2YTN4?=
 =?utf-8?B?N2M3VVljWndPa0RHNWFnUTU5eTlxWC9nd2s1emd1cjFkcTFGenpaS2NQQ3p0?=
 =?utf-8?B?NmdHYVdwampIbEZOUVZ2UGVVV3RtNzcxNUZKd01COHV6eE53ZzBjbm8zKytJ?=
 =?utf-8?B?VGNrL1FpTzZpSlJUVEk1Y1Y2WExXRlhMc2FFQlROU2pOSGNGMW5EcXFzZzVT?=
 =?utf-8?B?d3JsaG1TQ1hOMG02V0VUd0kyNFR6U2Y2WjlMbmxIVmN6dFp1QVAzMFBRcjlz?=
 =?utf-8?B?V1ozbE43aG1MT0FiY1dxSUZXYU5mWHFORVJib25IelNwbTRLUWt2WERDVzBa?=
 =?utf-8?B?SWJpdDdDZHlXMjJldnBIdkViZ2Q2WUJwOVU0WGdMNVdQTTVQN1I1cEVCam5o?=
 =?utf-8?B?YUFZN1Avb09XNnlBZ3dMRmJsemlvd1lDYlA5WmNlNWN1YVpVZmtzL3dDOFZn?=
 =?utf-8?B?MEFCbWlBV0VKdjEwT3FmQnkvd0tTMkt4cExWWmNncVVPbTNYUVdkbUl0YmJz?=
 =?utf-8?B?b3k2KzNEekptK095V3FKaU5iWG1FV25xcFpqY3JhU0hLNU4zRVhBQTJhYnNO?=
 =?utf-8?B?Q3J0M3J3TlppSSs0Y0NtNm9JY1RBcU9DWm9JUmEyNDNML1lZeTJZblB1RDE0?=
 =?utf-8?B?Wjk3M0hDbzd0QUxLMkg5djhsVFk3VjhxODgvZ1UxVWswMWxLck96UlJsYUpF?=
 =?utf-8?B?UjFVdkc4Y0dnMGtWTWpZNnR2RzF4WDRnemwrbitaeXlVTTIzTGtKNUJPZkRK?=
 =?utf-8?B?aENHejgvcDI1NlVEeGU0WldPbkNEbTNHWU9jODA0czZodWpUTnY5MWIwTXBG?=
 =?utf-8?B?amxodmVNMVg4VkRRRXVyNHJxMCtha0hzQWwzNTlZL0kwSEhrWTlBNng5WTgv?=
 =?utf-8?B?VmlMeEdTTGNzMG5FZElzTWNhMzQ1Vm56NmVnYXRKdEdCcHJEVm8yVTFsejVV?=
 =?utf-8?B?L1hUYmcrR0Z6TS9lclhpYzQwZHVKSGsrdFpVSlV4UlUzbGJYbEZaS2QrWnB5?=
 =?utf-8?B?SXpSckgvNmVHVmlCcktjbU9DNUN1QnpNNzN0Y3AxODl4RytpWjhEUHE1cG5y?=
 =?utf-8?B?YlQ5YVlLRWpoNVFWOGV5cFVKcFFtVTRoWi9hSC8wV1JkTnFMZnlDQUh5ZWJS?=
 =?utf-8?Q?vDATHAPIL96lyA3Y6G1SlVGq7Utl4BYG3va+n7p0/fbR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929ff8d4-c92c-4bc7-fc2c-08db0f8229dc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 18:26:32.7757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8V6ccpYbUlkGHkLh/C9J02uwmYAVn2Yu8Gl4wx7aij5seD0KUat1CPPxfrHu91A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890
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
 Dave Hansen <dave.hansen@intel.com>, Huang Rui <ray.huang@amd.com>,
 linux-graphics-maintainer@vmware.com, Peter Xu <peterx@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Madhav Chauhan <madhav.chauhan@amd.com>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.23 um 19:02 schrieb Thomas Hellström:
> On Wed, 2023-02-15 at 18:31 +0100, Christian König wrote:
>> Am 15.02.23 um 17:13 schrieb Thomas Hellström:
>>> When hitting an error, the error path forgot to unmap dma mappings
>>> and
>> I don't see where this happens?
>  From what I can tell, ttm_pool_page_allocated() maps the page for dma,
> If we later hit an error, ttm_pool_free_page() will leak the mapping.

Ah, I see. Good point.

>
>>> could call set_pages_wb() on already uncached pages.
>> Yeah, but what's the problem?
> Umm, at least if you try to set WC on an already WC'd page, the
> set_pages_ code will spam dmesg with warnings.
> Not sure if set_pages_wb() on WB pages does the same, nor if it
> issues unnecessary global cache / tlb flushes or whether that will
> change in the future.
> The point of avoiding the set_pages_wb() when already WB is you don't
> have to check, and you don't have to care.

Please just open code the error handling then. That helper function 
looks horrible complicated to me.

Alternatively we could have a free function for a range of pages.

Regards,
Christian.


>
> That said, the __ttm_pool_free() is used also in upcoming patches.
>
> /Thomas
>
>
>> Regards,
>> Christian.
>>
>>> Fix this by introducing a common __ttm_pool_free() function that
>>> does the right thing.
>>>
>>> Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Madhav Chauhan <madhav.chauhan@amd.com>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Huang Rui <ray.huang@amd.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_pool.c | 74 +++++++++++++++++++++--------
>>> -----
>>>    1 file changed, 45 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index aa116a7bbae3..1cc7591a9542 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -367,6 +367,39 @@ static int ttm_pool_page_allocated(struct
>>> ttm_pool *pool, unsigned int order,
>>>          return 0;
>>>    }
>>>    
>>> +static void __ttm_pool_free(struct ttm_pool *pool, struct ttm_tt
>>> *tt,
>>> +                           struct page **caching_divide,
>>> +                           enum ttm_caching initial_caching,
>>> +                           enum ttm_caching subseq_caching,
>>> +                           pgoff_t num_pages)
>>> +{
>>> +       enum ttm_caching caching = subseq_caching;
>>> +       struct page **pages = tt->pages;
>>> +       unsigned int order;
>>> +       pgoff_t i, nr;
>>> +
>>> +       if (pool && caching_divide)
>>> +               caching = initial_caching;
>>> +
>>> +       for (i = 0; i < num_pages; i += nr, pages += nr) {
>>> +               struct ttm_pool_type *pt = NULL;
>>> +
>>> +               if (unlikely(caching_divide == pages))
>>> +                       caching = subseq_caching;
>>> +
>>> +               order = ttm_pool_page_order(pool, *pages);
>>> +               nr = (1UL << order);
>>> +               if (tt->dma_address)
>>> +                       ttm_pool_unmap(pool, tt->dma_address[i],
>>> nr);
>>> +
>>> +               pt = ttm_pool_select_type(pool, caching, order);
>>> +               if (pt)
>>> +                       ttm_pool_type_give(pt, *pages);
>>> +               else
>>> +                       ttm_pool_free_page(pool, caching, order,
>>> *pages);
>>> +       }
>>> +}
>>> +
>>>    /**
>>>     * ttm_pool_alloc - Fill a ttm_tt object
>>>     *
>>> @@ -386,8 +419,9 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>          dma_addr_t *dma_addr = tt->dma_address;
>>>          struct page **caching = tt->pages;
>>>          struct page **pages = tt->pages;
>>> +       enum ttm_caching page_caching;
>>>          gfp_t gfp_flags = GFP_USER;
>>> -       unsigned int i, order;
>>> +       unsigned int order;
>>>          struct page *p;
>>>          int r;
>>>    
>>> @@ -410,6 +444,7 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>               order = min_t(unsigned int, order, __fls(num_pages)))
>>> {
>>>                  struct ttm_pool_type *pt;
>>>    
>>> +               page_caching = tt->caching;
>>>                  pt = ttm_pool_select_type(pool, tt->caching,
>>> order);
>>>                  p = pt ? ttm_pool_type_take(pt) : NULL;
>>>                  if (p) {
>>> @@ -418,6 +453,7 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>                          if (r)
>>>                                  goto error_free_page;
>>>    
>>> +                       caching = pages;
>>>                          do {
>>>                                  r = ttm_pool_page_allocated(pool,
>>> order, p,
>>>                                                             
>>> &dma_addr,
>>> @@ -426,14 +462,15 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>                                  if (r)
>>>                                          goto error_free_page;
>>>    
>>> +                               caching = pages;
>>>                                  if (num_pages < (1 << order))
>>>                                          break;
>>>    
>>>                                  p = ttm_pool_type_take(pt);
>>>                          } while (p);
>>> -                       caching = pages;
>>>                  }
>>>    
>>> +               page_caching = ttm_cached;
>>>                  while (num_pages >= (1 << order) &&
>>>                         (p = ttm_pool_alloc_page(pool, gfp_flags,
>>> order))) {
>>>    
>>> @@ -442,6 +479,7 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>                                                             tt-
>>>> caching);
>>>                                  if (r)
>>>                                          goto error_free_page;
>>> +                               caching = pages;
>>>                          }
>>>                          r = ttm_pool_page_allocated(pool, order, p,
>>> &dma_addr,
>>>                                                      &num_pages,
>>> &pages);
>>> @@ -468,15 +506,12 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>> struct ttm_tt *tt,
>>>          return 0;
>>>    
>>>    error_free_page:
>>> -       ttm_pool_free_page(pool, tt->caching, order, p);
>>> +       ttm_pool_free_page(pool, page_caching, order, p);
>>>    
>>>    error_free_all:
>>>          num_pages = tt->num_pages - num_pages;
>>> -       for (i = 0; i < num_pages; ) {
>>> -               order = ttm_pool_page_order(pool, tt->pages[i]);
>>> -               ttm_pool_free_page(pool, tt->caching, order, tt-
>>>> pages[i]);
>>> -               i += 1 << order;
>>> -       }
>>> +       __ttm_pool_free(pool, tt, caching, tt->caching, ttm_cached,
>>> +                       num_pages);
>>>    
>>>          return r;
>>>    }
>>> @@ -492,27 +527,8 @@ EXPORT_SYMBOL(ttm_pool_alloc);
>>>     */
>>>    void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>>>    {
>>> -       unsigned int i;
>>> -
>>> -       for (i = 0; i < tt->num_pages; ) {
>>> -               struct page *p = tt->pages[i];
>>> -               unsigned int order, num_pages;
>>> -               struct ttm_pool_type *pt;
>>> -
>>> -               order = ttm_pool_page_order(pool, p);
>>> -               num_pages = 1ULL << order;
>>> -               if (tt->dma_address)
>>> -                       ttm_pool_unmap(pool, tt->dma_address[i],
>>> num_pages);
>>> -
>>> -               pt = ttm_pool_select_type(pool, tt->caching,
>>> order);
>>> -               if (pt)
>>> -                       ttm_pool_type_give(pt, tt->pages[i]);
>>> -               else
>>> -                       ttm_pool_free_page(pool, tt->caching,
>>> order,
>>> -                                          tt->pages[i]);
>>> -
>>> -               i += num_pages;
>>> -       }
>>> +       __ttm_pool_free(pool, tt, NULL, tt->caching, tt->caching,
>>> +                       tt->num_pages);
>>>    
>>>          while (atomic_long_read(&allocated_pages) > page_pool_size)
>>>                  ttm_pool_shrink();

