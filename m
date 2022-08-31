Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441665A7BD8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 13:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A36310E30D;
	Wed, 31 Aug 2022 11:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACFC10E30D;
 Wed, 31 Aug 2022 11:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hub9Cn+pzO/vT0HIgmf+mb2Z+V1DodAvbozVJLrpJdY2/+7jDTT1uK1S5DxykuF6Gtp70jkTFYXXAtxNKAumLpjLm/MK2b7cBAVT7KLePXB+K70VCNQEb+CgpRaTH4jD7zu5mwNEIl8UPQS4dzqAKkgIrRh14zQUndanJwLooLdbuL4Qogk2nf1Hc9GTFAympNl39dg2ZpYz9tZE0gVBpIoRL6COrdKB1/qi2C8GbCUQ9Tr1J4YP1p1Rf2x8DoiO0Si7D6UB86ZxM6a0eBBPiWMoNpPFBRG6PKAKrmqU0J4Fw5mr5FN8jRAbD74I5I3bMdw4sUtej+ZanY44WqLdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sD7WMkAfRQQx84sw5D5ar4wHZLbU+FZcFCtYR/6kLnI=;
 b=ktTV/r+eWdZY36yoT+PT6lcfKBQYHKtyUGgmqYE/eIbWzascA6VzcVO4IkmoLAbR1rJ+Va5tSL3vz0zz4M/WNZUBmK29WtIzebm3ynJ9rKB1N3rNlMkSawC6eGBpx3SPeD0veW//HkeNg5keuygGs9fHalC2SjEepiw0h5fHiQHbuy9Y/5BlPDYkypxO61Ax2Dw+FC0vf38Vrd9RBr7QRfefKQWhsq1lb9J043zgzYPU3nqCu1Pbe/oqrL+xJmOpm+qP5rxHwm01cFGiTLRTrB6dBZPjTZoukUSdJoX4Aq+2TsD4GEkLEbnl2x+czzmnWejlQHC8RROC8F6sqGrdQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD7WMkAfRQQx84sw5D5ar4wHZLbU+FZcFCtYR/6kLnI=;
 b=TuqHFH9XmvCQ4v2a75sYoxdjNU3bttj0/ppj72V0j0p7SPCaXeq8MUYcX7X/XF1IIWv8vpDd0LEN56uHxDsWKgDUT4LMsqvFpeJENhcl0kGS4ef9gqk72+qTlGuP0KrINESEJ342bPWA1sejA1S9K+uxvNRc8wlsury/M4ifL20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4573.namprd12.prod.outlook.com (2603:10b6:806:9c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Wed, 31 Aug
 2022 11:03:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 11:03:20 +0000
Message-ID: <1392ea7c-88a3-9a56-1ccb-e2f16cd55f72@amd.com>
Date: Wed, 31 Aug 2022 13:03:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] drm/i915: audit bo->resource usage
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20220824142353.10293-1-luben.tuikov@amd.com>
 <1de21f6e-4b11-ee9b-1b54-fd67728766ad@amd.com>
 <cc4c59ad-5d69-b174-5464-bd9896459169@intel.com>
 <ce090a95-a822-5079-7b86-0c949e98cd64@amd.com>
 <3f3715fb-1f2b-83a5-bff7-6e06164e5546@intel.com>
 <9c7cc7ea-dd30-6df5-3f06-97a6c6d254e0@amd.com>
 <55d88b45-6986-de38-d574-d0ce7d06c62e@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <55d88b45-6986-de38-d574-d0ce7d06c62e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0173.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a886578-fe43-4d3b-ea15-08da8b406a34
X-MS-TrafficTypeDiagnostic: SA0PR12MB4573:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gc2H1fMZCQb6Y37eskxjZy5JBTpJCzmcSKgT8BZZLuu87pfey9c81q/gRS9Avzio4KF8XX6rywNsujhTvivVcSjQpZ3/TAGzESCpW/r040RoXw75KwK5bGYChRbpwn0TKP7DOYrFJpWQYBMJCwPhdOKYVZk0KeBnaDLqcGQkdnOVBqpvmkNvLHC1cZ7skuLgunua1td2M7Gx5878JaR/PmAQBhwNcOSAp1foEfxJhiQbwHuSvYuiLYseFwIKEyvyyCcKdGf0GWUvAN02HbZqu3vbDLkXETuxkTzH2Zp0JdTgJy5h7LyiwBaGikNOa7HALNNnoJpLDLIeVK5w5KnbrDRKLNjG8rkyEP/Q3rf5s5jC8msHxQkAbIpSiP6IVqVPdB8dK7Xpjo+O4+EL/EFWvDWuLbI5A6oyVzjFIJwaDM1xIb6gPbyOqWuppZ6FdWMVrv2pMR56GkHfV1tkeGsWBV02Q/1zjZBor6q3y6LR2y39xJ42CqNoVNB3WxBQCeel8nTFV/I+gPf1cwPGRzFJrYs6lHckFbEIsPZb4dmakUr0DPko7JjvJ09CdRP83NrEvlAkSknyoTEv/MdxtUiWfWY52V4okJTHPxFM+vgX5hU9zkWpEcd8SAVvP2xB0uVpenyFPzi1czYkiXCyv6kwBwjyrIKnQveGPkCjTBnJFihXtxAll2SecEIGAsvsqJwzAWgkLFZjCgceCzql/aHAPjUWaHgBFvoqxlnLNmV3iiJ/fLAJNYY/Py+5QphOll4So5WZcFwpW7a+6uwKYnOIU0bDYCAoaML5nOUAXk4RYzc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(66556008)(86362001)(38100700002)(4326008)(8676002)(66946007)(41300700001)(110136005)(31696002)(8936002)(6486002)(5660300002)(478600001)(316002)(2616005)(2906002)(186003)(6666004)(6506007)(6512007)(66476007)(36756003)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anU2cXIwSVhkS2hQaEhQYjV0dDhkM3hIMGJWRkljU3dLNmloWFREVUZpV1o2?=
 =?utf-8?B?Z1htVGtaMDkrNXZTUWlmOVJkeU9WcTkxYjBqTmh3T2QxS1BsQUROZ0ZZZWxa?=
 =?utf-8?B?MHBCc0taMFRUQkJSeWpXZUtIV054MExjajJzYTVDN0VSMTdLRCt0WGdRSWtK?=
 =?utf-8?B?c0EwYjRsTVQrVlIxMHBJWWsvRHFWY2F0YlBrQmIxQ2N6RGpxMEpLaVRERTdI?=
 =?utf-8?B?MlJpc0VJL3ViZ25ibm4zbm5nU29EQTRRbWh3RlRGRFhjcFAramZFY1ZiSUhh?=
 =?utf-8?B?anpROFBMZEpZdC85ZHViQXAvKzJBRjNJWmJaaEY1YWhnSWloLzZCOEJSbmVz?=
 =?utf-8?B?ZGx0Mkc3Zkt1RWxmbDdmRkNrNGVqNGUxOW9zZW12eHNyM3hqM01OTU5XRkxJ?=
 =?utf-8?B?MU1UNGdZcmI3OWY1OHhOc2RRRUhXTG0vcXpPVjE3UkVjekpnY1dTWE1ZbGR2?=
 =?utf-8?B?cS9uTiszczdHcS95S2tCaERLUFFRSmkyRGlxUjdiMDhoWEwwSzQreEI4aTND?=
 =?utf-8?B?bEZqZ3hvMUttbDRON3QzMTNQaGx0L2k3YmhJellnUXVhSXV0WndHdjZQREcx?=
 =?utf-8?B?Qzl6WmNTNVZlSENLM3VhOHBDb2tWMWtqbnhUUjczYUNJdVFJV0VKSzJqRHJo?=
 =?utf-8?B?RXIrZUVnNWc2cExoTHU5MURtazFUUi8wOXd4OGtTMVRtVjJPTVBEWjFTTklm?=
 =?utf-8?B?OGFxU2gyYmxhWjRyTHhhNktYZkJSOUdqRDZZZTlsSEpRVFlOV2JzcmdSMERj?=
 =?utf-8?B?UEp1c2g3Yngyd1UraC9RTkdQTy9EbWJyRTBxMjBsZzRrUkM2TzNpQnpEWUZL?=
 =?utf-8?B?RlNDWklaYnA2SllrZVBneFBxL2pBS3EyT1QzZHNXc2JFUDJRTElGa1pKNjFN?=
 =?utf-8?B?YmpvL0lIenFGWkpWbXZjZWc1REI0MHBWaEhOTUZmS3ZBR0RMVVE3SVJKYUlT?=
 =?utf-8?B?bHVhMnZ5VnN4dGpNWkRrZ2xEd2hFY2ZxeG11alh5S29uN0ttZG1FaWpadjZr?=
 =?utf-8?B?U2dVYmYxK3ZoQiswdmMydkwvbi8zWUgrdVg0M1UvdHJyWGl1amFKdFpQQWNu?=
 =?utf-8?B?V3NTSEplWkZNMGh2TkhmOXBMcmsrbnJkcTBZTjhlK2x3dmcxYkt0eWR3ZXN5?=
 =?utf-8?B?WFVheDFIc085QjRBU0E5SmNCL2NEelpPT3dNMysyNUlWbjN0Qmh1SDNCSnA0?=
 =?utf-8?B?WTRyZnBIMk1rMjlhYTI3WlNKY2tKbEpoNjlyZEZTK1hoNjlpTkQvN2dMM05S?=
 =?utf-8?B?UmNtTW5mamQrYXNXNktLRGgrZ245VCtLekZFODNLSTdnanFtYjZaZGpSTU1Y?=
 =?utf-8?B?U1RoOW44ZHoyNWNLTGZlZk10VkowRjBxRlQ5SlVOSnEvUldVcmRUVGlYRHZK?=
 =?utf-8?B?UThVeXg2V1ExL0hJc0FJUW1obkkxMUErNGpIOWhxVzd3Y3JUK00zbXIzNGtu?=
 =?utf-8?B?UDZEcU9vNFRxYUlsdnhEeHhOU2ZsdENmb0hYTHBjdGdFTzRkNlR1cHM0amdU?=
 =?utf-8?B?bmxJb3pUWW5TTFNXTkdxWEVydkVlbG0wSS9OK1lpcmw2RERLZllXUGppcEp5?=
 =?utf-8?B?YWVYY1RzWk84cG42clpwbmR0Z2ZZMnJQeWMwTFFQOXhEOUhFSDZnd08vbFR6?=
 =?utf-8?B?VWduOWRpVFNQV2c4eUlpVk1jcW5NbFdGL0x1UDRMdU5xZ0szeEZKMWlyeTkv?=
 =?utf-8?B?UzJnNFZabGZSUldpTmt5R294MjFPMkFNdXIyZ2NWbEFQd0dRbUNZUGVEaHpw?=
 =?utf-8?B?TG9oWDlpUHJtZWZUaXNkRmpaTWNDUDI2OFJNUmhRN0xsVjNRK0wyamNLQ1FY?=
 =?utf-8?B?d2hKYUJqbGs0VlE5M25sN21mVS8zUlZoWUFDbzBKdnZJZkN0YUE5YkFpM2hR?=
 =?utf-8?B?MUJnYmsxU1lnWkdvelBDUXNvNTR3S2xqQkdHOXJJZEowZ29aQnN6SWZGWktY?=
 =?utf-8?B?QWFLREFFWWNjQUFMaGNMOWduRDZzaFBwRkVwQkhHVytka2NxdnowR2pROWV4?=
 =?utf-8?B?Y3ZSV0M3L0hIQ1AwTVpCdFhmSWIyZGdqYVBHeHB3SGxUM1VaZ3FWaEJ0KzRV?=
 =?utf-8?B?OFlIZXV5K20yZXdHSHVEQnlDeFpHUDVkOHZTY0NBWXkxV2l3ZHFkdEJUSVNG?=
 =?utf-8?B?QXdaNFRCNTlPM3dma0RwL3FrMlFWeTZiUDl1QzF1QlZWSDhKVTUya1I3VHlG?=
 =?utf-8?Q?CCQymEmfON+Ib2Sz9s6df//gu9aZwQJKE66vjAHBHmlS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a886578-fe43-4d3b-ea15-08da8b406a34
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 11:03:20.4398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPsGicQkRpiPAOag7pr3fOhauzTqNH+3nQZBBvfme57iPhyFzcoGMCrrQh3AGp9o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4573
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
Cc: Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.22 um 12:37 schrieb Matthew Auld:
> [SNIP]
>>>
>>> That hopefully just leaves i915_ttm_shrink(), which is swapping out 
>>> shmem ttm_tt and is calling ttm_bo_validate() with empty placements 
>>> to force the pipeline-gutting path, which importantly unpopulates 
>>> the ttm_tt for us (since ttm_tt_unpopulate is not exported it 
>>> seems). But AFAICT it looks like that will now also nuke the 
>>> bo->resource, instead of just leaving it in system memory. My 
>>> assumption is that when later calling ttm_bo_validate(), it will 
>>> just do the bo_move_null() in i915_ttm_move(), instead of 
>>> re-populating the ttm_tt and then potentially copying it back to 
>>> local-memory?
>>
>> Well you do ttm_bo_validate() with something like GTT domain, don't 
>> you? This should result in re-populating the tt object, but I'm not 
>> 100% sure if that really works as expected.
>
> AFAIK for domains we either have system memory (which uses ttm_tt and 
> might be shmem underneath) or local-memory. But perhaps i915 is doing 
> something wrong here, or abusing TTM in some way. I'm not sure tbh.
>
> Anyway, I think we have two cases here:
>
> - We have some system memory only object. After doing 
> i915_ttm_shrink(), bo->resource is now NULL. We then call 
> ttm_bo_validate() at some later point, but here we don't need to copy 
> anything, but it also looks like ttm_bo_handle_move_mem() won't 
> populate the ttm_tt or us either, since mem_type == TTM_PL_SYSTEM. It 
> looks like i915_ttm_move() was taking care of this, but now we just 
> call ttm_bo_move_null().
>
> - We have a local-memory only object, which was evicted to shmem, and 
> then swapped out by the shrinker like above. The bo->resource is NULL. 
> However this time when calling ttm_bo_validate() we need to actually 
> do a copy in i915_ttm_move(), as well as re-populate the ttm_tt. 
> i915_ttm_move() was taking care of this, but now we just call 
> ttm_bo_move_null().
>
> Perhaps i915 is doing something wrong in the above two cases?

Mhm, as far as I can see that should still work.

See previously you should got a transition from SYSTEM->GTT in 
i915_ttm_move() to re-create your backing store. Not you get 
NULL->SYSTEM which is handled by ttm_bo_move_null() and then SYSTEM->GTT.

If you just validated to SYSTEM memory before I think the tt object 
wouldn't have been populated either.

Regards,
Christian.

>
>>
>> Thanks,
>> Christian.
>>
>>>
>>>>
>>>> I've been considering to replacing the ttm_bo_type with a bunch of 
>>>> behavior flags for a bo. I'm hoping that this will clean things up 
>>>> a bit.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>>>>       caching = i915_ttm_select_tt_caching(obj);
>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>> index 9a7e50534b84bb..c420d1ab605b6f 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>> @@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object 
>>>>>>> *bo, bool evict,
>>>>>>>       bool clear;
>>>>>>>       int ret;
>>>>>>> -    if (GEM_WARN_ON(!obj)) {
>>>>>>> +    if (GEM_WARN_ON(!obj) || !bo->resource) {
>>>>>>>           ttm_bo_move_null(bo, dst_mem);
>>>>>>>           return 0;
>>>>>>>       }
>>>>>>
>>>>
>>

