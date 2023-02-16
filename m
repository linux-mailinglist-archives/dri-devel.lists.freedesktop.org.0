Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CF7698D9A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 08:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E608410E031;
	Thu, 16 Feb 2023 07:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BB610E031;
 Thu, 16 Feb 2023 07:11:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjMgU3tmaxHJkuKA2/d2pS7uLoo7ATqZsEIrTBipyuy3eyCNpwkfOeYQIPcDcO12O2g5M0Odqh6iMQ8BKZKLcawJX8NAC9HBXVf6QJYXVXeh83ox/R7z5tJdqxZZ3mm3wHdNCyyStQR8QQ1UKND8UNegbsvyjkVqlds6UaeD6diU7VS5+3KiEKcd717wqeAn7tsjdn13kj0Y3ORfjNA+3PegaQBK9QE9octb7V1f2upZVoGAyWZ42wT96M5TygVQFQ8n0zbNpUJuJavQ2h5pf6NusBDevMsblQw8+6NjgXp3I1M0i/Rv8zP5LnF8wyvPdWg2ghL57Lr2ITfIz/zMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePlPlbgsvyhODnqSznhM36beWMhHixsJJg/gx0iV1Vw=;
 b=jvt0suWqEOQfBAW6O/ZFLjKRoJMAeS4xhfE0TY7SfcX0T/DECHdVC40k1eOMJ/2na8r/vqMi1RYz0rYFilaQgs1SJQecnc9HbMFjNU5uH8Lu6FPdK1uzl4mHIO24XTquP4scYr0RRPoricCdrBBwxYCnN1buB0BEZhfRL//SmMKXX5dLeBeTzmH29vMveyNWEFqZdexXuwIj5QWMECQ75bGVxautOBNxQSm2YTJDrNbooc1AHeGR/oVO57CBMSDrpcdn5UecMl69QlrXScCvPSBrXlLBpgoTtTQ+udbuo1P/jAr+GaQJBQz08GTgM7VNYla0WCQew2RK8QvFhwyUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePlPlbgsvyhODnqSznhM36beWMhHixsJJg/gx0iV1Vw=;
 b=kKfrI1Vl47H/hKOmam+yNHeyjUAavFUXKLaY8KatBLskkIn1DuHkzct3e9qwt8vfY9VeA8ZhA2gxHu63w9iioO+yDt5sY8Q/2wTkznnHsHpOJKIpAdN2g9IPxdDMAAN/yAolwysKnhk9JczuigyQB9ehiXDOQbbN1UrAbx7L/Os=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5935.namprd12.prod.outlook.com (2603:10b6:8:7e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 07:11:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 07:11:52 +0000
Message-ID: <09edba94-5cb5-9757-ac57-2850cccf9ebe@amd.com>
Date: Thu, 16 Feb 2023 08:11:46 +0100
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
 <6fdacb84-bca3-0645-0bb9-ba8def5bd514@amd.com>
 <0ebad504ed56caed6a4338f346f02b4b59a77a5c.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <0ebad504ed56caed6a4338f346f02b4b59a77a5c.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2b1cf3-7dec-40b3-fc61-08db0fed1460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kiVC8wLs9adkpnELH4iIA0iSmWW648Hs+B/9wAeEVtECKo5Vf3suTnUXDkcxJu8xGrkmTjYyO+9ieKq3mpavV8UzyMRBdhUgh4o1b+vwj9WOPv4XEEsAtj7izzdT1kGqFPRYS6eZMFacS2rM3u3d3zgJlyJ0dw8h1S/mT36L4sEESRcxIRbxw3R51HHvhZYBQto0UzOwsz1oHkj9AL9iWvEWsoqeljgPK/HkgYhEBDRSrqRShinFQ98deoCTopCmz7jWOBmA1YWPNJujxuy0WtRp7HDYggKxNMRG3d7RgbVUyP0uo512qmvMvL7bhtgCE6shzTCN6hwWd9NLCiigtPTqe7Zaq1m8S/NxHmiuO+kgdI4AWmjNWBrl8biS4W2J3DnueFgnnfyQ3OXTUUno3X6PoZKlWM7/czqMZJDBkmKt+moqLL7S7Mrd8A6bsLfwXMlh+gy43c8RMBOiAA/jiSSK3IGCCdnS5Dcq3YOb08DvLMBFl2R7f4q0N7P7E284ouZrosc20tVXB34ekSeS/EeSySGmHzo8r4KB5QOZmIZ2BnTM2vXe/MmRUaFRZcQu302HQ+UKbSqAbf2pLn7YG3Ip7yBlg7zXFQC5oVBgjRSHPT0cXK2wbcW1yIGAkWkIhCmeMnVyVUR8A8xjqWUjasUok+7HC84RlxPe5U+myGtdMXzUmXFBaaGcszRNRbfaesOM409Of8mWRuM7b1HtsWEnpwR5WAlM7NiUkoZ/RKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(478600001)(6486002)(66574015)(83380400001)(86362001)(31696002)(38100700002)(6506007)(6666004)(26005)(6512007)(186003)(36756003)(2616005)(8676002)(66556008)(66476007)(316002)(8936002)(66946007)(7416002)(4326008)(54906003)(31686004)(5660300002)(41300700001)(2906002)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnM2Z0hEaVdxSE1Fbm8xYmFPOGdZL0pnZHkvZFRWbkhkYmo2Y0lKaHcydWgr?=
 =?utf-8?B?VEowalc2TGlENkdVM25BYThaeXBkOXdDbmtvTlhqYjRCWGszbjIvcFRMZ1Fq?=
 =?utf-8?B?N3BXYzNjZkcxSUxHcGUvcGNheC9oTnpRMG8yTmtNejJudXZNWU1hbVhpOStG?=
 =?utf-8?B?LzFiWG9rMHgxY1F1eE5TeCs3OWFwTUlpcCt2ZEdzMEI0ay8zbjZXa3BlcU9J?=
 =?utf-8?B?SnZQalUvRk9iaW45MGN4eHorUW9LVC9XblZoYmt6L1pJd3hlQ0hUUWRqeHhM?=
 =?utf-8?B?NGFPeksrcjc4VnAreG5BTnhFSXBqd2RUYXdOZThsbEQ2blM5cm1ydEpIWkxB?=
 =?utf-8?B?cVowbGVySGluYnZUU2tNeGNDbURHUC9iOHAzWlFhR05HUXlTUjhxRVV3V0ky?=
 =?utf-8?B?SjY5NWVzNFBtZWRsREsvVm9oS2VVLzl5Mk8wZE5jak9BdXYyYlU0MG1iQitl?=
 =?utf-8?B?REE0cDdPNWpDUGNZOVQyZ3p0bHZIcGVabURWRjJvaXlCY2l4LzVkYkN4bUNl?=
 =?utf-8?B?MDZZVFRiSEx1bUdRL3Z6SXNUOS9ITnFPN21OT0x3NHByWDI5b3M3MjB5VDVD?=
 =?utf-8?B?NlkyUlJucUo2SG5BWjh1QTgzL3JBTXU1M2kwTkhPaVVRUkRCb0tSR0tpT3RD?=
 =?utf-8?B?NWZGTklmaUI2WXp5WEw3R3JOakVVZWhheVByczJ5bzZod2s0YkMydG5NVDZ5?=
 =?utf-8?B?NE5UaCtTaFpVbStxbnpXazc3bGR0MzRmL0hYNnZ4TUNPVXV2YjYzaThsZmpi?=
 =?utf-8?B?WG5MNVpUUUJXL0MxUW4wZmxBeGYwTUExTW9Vd210cmJzUkxxT3RGdjAzNkhD?=
 =?utf-8?B?QzRiMkYweis2ZU1ITWRnZjh6dlFjRUxoNG1aWktuNGhGcW1iem9RZ0RNTHNR?=
 =?utf-8?B?VlFvL2NWNTdseTlSN1o1bTg1YWQ4TWFtSFgzT1ZtZlNUb05HRmljOGdkcDRO?=
 =?utf-8?B?ZXk5bngvVUVhV0FvOEhGMmg5RnI5VXBkV2Q0MWRuQzV1OE9vanEramFZTTQr?=
 =?utf-8?B?UjJ2QWdYMzBNcVo2c1JpbVpEWmhoTjNBVmsyN3cvNmV4SHRPUTJIYUc4YVVB?=
 =?utf-8?B?Tzl3VVR2NElETEpGenpEejNJTUEyOFVVTGViUUcwaWVlNWZMRy90ODhPQ05R?=
 =?utf-8?B?R3JHSlIrY1o0OWlBU1MxRVpCc1JNcmtPV2tKVkF1ZmF2dytETHVqd01BbDli?=
 =?utf-8?B?d0NiN1RqaVdXZEZ6VFpXWTBZUDJFZER3TGlBTEVoUlIwV2xyM2RoOXdqK0pI?=
 =?utf-8?B?VkR1NzhUS1NrV1p6ZnhUV2JvbEptdXROcnpON1VaQUFEOTJjS2E3SzZqUXcy?=
 =?utf-8?B?ODVxakk5OWdteml2R1BQQ2hhNTJraHRtVlluTEpRZDB0Y2RXL0RQSHRuY1hN?=
 =?utf-8?B?R21RdWErbGtldHZLWDNsRUlVV0d1WnVGNEZjV0xjNEp4SGkvK3pFZlcwN2Ix?=
 =?utf-8?B?UnhQZDdkaUNHeTFrUUNIQms5RVdPemlnNlFLUjNDQXlMcW1zMjlrMHFYb3Ns?=
 =?utf-8?B?MWdUTmJYZDJwTDJGNWZiRGJiVkw2akhHNndQdUVrMEo3MUlwK2toeW4rcHVT?=
 =?utf-8?B?Si90aDU0TmhBaVd4VjJ3aFpNVklIOGMrZVRheFpsWFBDdUlMWEkwMEZtSE04?=
 =?utf-8?B?aTU0T1Z3RU9wM3RXUzJiU3RDNEEya3Ivak9ybXFKcXNYNTB0ZEN2dnExWEdm?=
 =?utf-8?B?OXF6clo0SFM5N21hUW9xS0ljNHM3ai9CbkJjbzlYOXkrWCtzbjVlOExJMFlm?=
 =?utf-8?B?YzFKc2JvWmw2eitFcjZGUnJtVHpxU2k1WWM2Z0xvbTZGU2ZKV3MrRGd5R2pT?=
 =?utf-8?B?bklpUlNiclBQdzVPQVJXYlhXb1pUK2thbWZzbUtmc3JTL1N4WENFTUpFSmtK?=
 =?utf-8?B?b3RQNU5QOGVVQ2JNb2xnZTlFbjlXM3FPNGJRcUtFcmQ3S0RWY2NGVXUwWmZk?=
 =?utf-8?B?blBvZlI4S2ZCdmw5cGJqY25DWjNhcUVlZ0o0V01ieEd0YUp3SlpTLyt0R2R2?=
 =?utf-8?B?amdzWE1Xb3ppQlFQY0wwQ25SZ3EyeDJ3S0lTS2tTUTN5aUxPS1V1MWo1aCtp?=
 =?utf-8?B?M0ZqT1dFUDZpUjFONTFWMG9RYUZXcjlKc01TZ2t6UmZQeDdxWlprWWNNbVo1?=
 =?utf-8?Q?jLDQsP7p/BXzPB6EtCf9FaLAi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2b1cf3-7dec-40b3-fc61-08db0fed1460
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 07:11:52.8341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AghbYa9KqkhrK2E/2f2P9fbNBQvi04GwmHA+0IZlgKApOJBBfsh31zD737Aa8WhT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5935
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

Am 15.02.23 um 20:00 schrieb Thomas Hellström:
> On Wed, 2023-02-15 at 19:30 +0100, Christian König wrote:
>> Am 15.02.23 um 19:12 schrieb Thomas Hellström:
>>> On Wed, 2023-02-15 at 18:42 +0100, Christian König wrote:
>>>> Am 15.02.23 um 17:13 schrieb Thomas Hellström:
>>>>> When swapping out, we will split multi-order pages both in
>>>>> order to
>>>>> move them to the swap-cache and to be able to return memory to
>>>>> the
>>>>> swap cache as soon as possible on a page-by-page basis.
>>>>> By reducing the page max order to the system PMD size, we can
>>>>> be
>>>>> nicer
>>>>> to the system and avoid splitting gigantic pages.
>>>>> On top of this we also
>>>>> include the 64K page size in the page sizes tried, since that
>>>>> appears to
>>>>> be a common size for GPU applications.
>>>> Please completely drop that.
>>> You mean the 64K page size, or the whole patch?
>> The 64K page size. This was an invention from Microsoft to
>> standardize
>> GPU handling ~15-20years ago.
>>
>> It turned out to be a complete shipwreck and by now 2MiB and 1GiB
>> pages
>> or just flexible hardware which can handle everything seem to become
>> standard.
>>
>>>> This is just nonsense spilling in from the
>>>> Windows drivers.
>>> Agreed, but IIRC on the last RFC you asked me not to drop the 64K
>>> pages, so that's why they are here. I can remove them if needed.
>> We could keep it if it's in any way beneficial, but I'm pretty sure I
>> must have been drunk to ask for that.
>>
>>> The only reason for keeping them from a performance point of view
>>> is
>>> better efficiency on GPUs with 64K page size if not using a
>>> coalescing
>>> IOMMU for dma-mapping.
>> Are any of those still produced? As far as I know neither NVidia,
>> Intel
>> nor AMD still assumes that page size in their hardware for quite a
>> while
>> now.
> Intel still supports 64K PTEs, so we use them where possible, otherwise
> falling back to 4K. Typically we have coalescing IOMMU enabled when
> testing, so can't really see the impact, but TBH I was surprised by the
> number of 64K page allocations TTM spat out with this patch series, so
> I definitely think there is a performance impact with !IOMMU, although
> I can't quantify it ATM.
>
> So then if it's OK with you I'll keep that size for now.

If it makes 64K pages preferred then this is a pretty clear NAK.

What we can do is to support any page size up to at least 2MiB here.

Christian.

>
> /Thomas
>
>
>
>> Regards,
>> Christian.
>>
>>> Let me know what you think is best and I'll adjust accordingly.
>>>
>>> /Thomas
>>>
>>>
>>>> Christian.
>>>>
>>>>> Looking forward to when we might be able to swap out PMD size
>>>>> folios
>>>>> without splitting, this will also be a benefit.
>>>>>
>>>>> Signed-off-by: Thomas Hellström
>>>>> <thomas.hellstrom@linux.intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/ttm/ttm_pool.c | 58
>>>>> ++++++++++++++++++++++++++---
>>>>> -----
>>>>>     1 file changed, 45 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> index 1cc7591a9542..8787fb6a218b 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> @@ -31,6 +31,8 @@
>>>>>      * cause they are rather slow compared to alloc_pages+map.
>>>>>      */
>>>>>     
>>>>> +#define pr_fmt(fmt) "[TTM POOL] " fmt
>>>>> +
>>>>>     #include <linux/module.h>
>>>>>     #include <linux/dma-mapping.h>
>>>>>     #include <linux/debugfs.h>
>>>>> @@ -47,6 +49,18 @@
>>>>>     
>>>>>     #include "ttm_module.h"
>>>>>     
>>>>> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>>>>> +#define TTM_64K_ORDER (16 - PAGE_SHIFT)
>>>>> +#if (TTM_MAX_ORDER < TTM_64K_ORDER)
>>>>> +#undef TTM_MAX_ORDER
>>>>> +#define TTM_MAX_ORDER TTM_64K_ORDER
>>>>> +#endif
>>>>> +#if ((MAX_ORDER - 1) < TTM_MAX_ORDER)
>>>>> +#undef TTM_MAX_ORDER
>>>>> +#define TTM_MAX_ORDER (MAX_ORDER - 1)
>>>>> +#endif
>>>>> +#define TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>>>>> +
>>>>>     /**
>>>>>      * struct ttm_pool_dma - Helper object for coherent DMA
>>>>> mappings
>>>>>      *
>>>>> @@ -65,16 +79,18 @@ module_param(page_pool_size, ulong, 0644);
>>>>>     
>>>>>     static atomic_long_t allocated_pages;
>>>>>     
>>>>> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
>>>>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
>>>>> +static struct ttm_pool_type
>>>>> global_write_combined[TTM_DIM_ORDER];
>>>>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>>>>>     
>>>>> -static struct ttm_pool_type
>>>>> global_dma32_write_combined[MAX_ORDER];
>>>>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>>>>> +static struct ttm_pool_type
>>>>> global_dma32_write_combined[TTM_DIM_ORDER];
>>>>> +static struct ttm_pool_type
>>>>> global_dma32_uncached[TTM_DIM_ORDER];
>>>>>     
>>>>>     static spinlock_t shrinker_lock;
>>>>>     static struct list_head shrinker_list;
>>>>>     static struct shrinker mm_shrinker;
>>>>>     
>>>>> +static unsigned int ttm_pool_orders[] = {TTM_MAX_ORDER, 0, 0};
>>>>> +
>>>>>     /* Allocate pages of size 1 << order with the given
>>>>> gfp_flags */
>>>>>     static struct page *ttm_pool_alloc_page(struct ttm_pool
>>>>> *pool,
>>>>> gfp_t gfp_flags,
>>>>>                                           unsigned int order)
>>>>> @@ -400,6 +416,17 @@ static void __ttm_pool_free(struct
>>>>> ttm_pool
>>>>> *pool, struct ttm_tt *tt,
>>>>>           }
>>>>>     }
>>>>>     
>>>>> +static unsigned int ttm_pool_select_order(unsigned int order,
>>>>> pgoff_t num_pages)
>>>>> +{
>>>>> +       unsigned int *cur_order = ttm_pool_orders;
>>>>> +
>>>>> +       order = min_t(unsigned int, __fls(num_pages), order);
>>>>> +       while (order < *cur_order)
>>>>> +               ++cur_order;
>>>>> +
>>>>> +       return *cur_order;
>>>>> +}
>>>>> +
>>>>>     /**
>>>>>      * ttm_pool_alloc - Fill a ttm_tt object
>>>>>      *
>>>>> @@ -439,9 +466,8 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>>>> struct ttm_tt *tt,
>>>>>           else
>>>>>                   gfp_flags |= GFP_HIGHUSER;
>>>>>     
>>>>> -       for (order = min_t(unsigned int, MAX_ORDER - 1,
>>>>> __fls(num_pages));
>>>>> -            num_pages;
>>>>> -            order = min_t(unsigned int, order,
>>>>> __fls(num_pages)))
>>>>> {
>>>>> +       order = ttm_pool_select_order(ttm_pool_orders[0],
>>>>> num_pages);
>>>>> +       for (; num_pages; order = ttm_pool_select_order(order,
>>>>> num_pages)) {
>>>>>                   struct ttm_pool_type *pt;
>>>>>     
>>>>>                   page_caching = tt->caching;
>>>>> @@ -558,7 +584,7 @@ void ttm_pool_init(struct ttm_pool *pool,
>>>>> struct device *dev,
>>>>>     
>>>>>           if (use_dma_alloc) {
>>>>>                   for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>> -                       for (j = 0; j < MAX_ORDER; ++j)
>>>>> +                       for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>                                   ttm_pool_type_init(&pool-
>>>>>> caching[i].orders[j],
>>>>>                                                      pool, i,
>>>>> j);
>>>>>           }
>>>>> @@ -578,7 +604,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>>>     
>>>>>           if (pool->use_dma_alloc) {
>>>>>                   for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>> -                       for (j = 0; j < MAX_ORDER; ++j)
>>>>> +                       for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>                                   ttm_pool_type_fini(&pool-
>>>>>> caching[i].orders[j]);
>>>>>           }
>>>>>     
>>>>> @@ -632,7 +658,7 @@ static void ttm_pool_debugfs_header(struct
>>>>> seq_file *m)
>>>>>           unsigned int i;
>>>>>     
>>>>>           seq_puts(m, "\t ");
>>>>> -       for (i = 0; i < MAX_ORDER; ++i)
>>>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>                   seq_printf(m, " ---%2u---", i);
>>>>>           seq_puts(m, "\n");
>>>>>     }
>>>>> @@ -643,7 +669,7 @@ static void ttm_pool_debugfs_orders(struct
>>>>> ttm_pool_type *pt,
>>>>>     {
>>>>>           unsigned int i;
>>>>>     
>>>>> -       for (i = 0; i < MAX_ORDER; ++i)
>>>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>                   seq_printf(m, " %8u",
>>>>> ttm_pool_type_count(&pt[i]));
>>>>>           seq_puts(m, "\n");
>>>>>     }
>>>>> @@ -749,10 +775,16 @@ int ttm_pool_mgr_init(unsigned long
>>>>> num_pages)
>>>>>           if (!page_pool_size)
>>>>>                   page_pool_size = num_pages;
>>>>>     
>>>>> +       if (TTM_64K_ORDER < TTM_MAX_ORDER)
>>>>> +               ttm_pool_orders[1] = TTM_64K_ORDER;
>>>>> +
>>>>> +       pr_debug("Used orders are %u %u %u\n",
>>>>> ttm_pool_orders[0],
>>>>> +                ttm_pool_orders[1], ttm_pool_orders[2]);
>>>>> +
>>>>>           spin_lock_init(&shrinker_lock);
>>>>>           INIT_LIST_HEAD(&shrinker_list);
>>>>>     
>>>>> -       for (i = 0; i < MAX_ORDER; ++i) {
>>>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>                   ttm_pool_type_init(&global_write_combined[i],
>>>>> NULL,
>>>>>                                      ttm_write_combined, i);
>>>>>                   ttm_pool_type_init(&global_uncached[i], NULL,
>>>>> ttm_uncached, i);
>>>>> @@ -785,7 +817,7 @@ void ttm_pool_mgr_fini(void)
>>>>>     {
>>>>>           unsigned int i;
>>>>>     
>>>>> -       for (i = 0; i < MAX_ORDER; ++i) {
>>>>> +       for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>                   ttm_pool_type_fini(&global_write_combined[i]);
>>>>>                   ttm_pool_type_fini(&global_uncached[i]);
>>>>>     

