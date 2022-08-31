Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67205A78B5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 10:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563C510E230;
	Wed, 31 Aug 2022 08:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F11110E22C;
 Wed, 31 Aug 2022 08:16:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCksT6BOL+5iO86ehofOZYs1waBiT3TN59d0Hj0GgsIQXFoQxUZA3jgodl7W1phgbZgq4GIsHsVWgL6CfXCr5WQSxHDvRoVfwLXcAusQY2oxW641HoiTr94Jb4lnhBcX4ZqIWbEjsOgQFTB2k++HxKvfm0CzW45U6gGXPnGu0sXJTWxSvt6Mz6TbSkS+vM0qWj/fTYcIW8BJOztHC9/WiROMU7K+wZOZtw2EpZA8E50px7XWuGsJ7y3hlbbYLFm1VaxYajQOZXiy4ObsL8Nw0g+2xtRa85Xg/WgZpPpDofgvkulax1ZucOK29uUJI3y02TAbJD+XpF+W0NM2qf5BgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnOvtDq0X6MPyFEXHDeFegyG/Ek38LO4We4ipVVQ8gM=;
 b=Ow2ka1rEno2egHOHDO24tXSefIquZ8faVmpJv31LoIZKDRYbI6pNQTvy91Tj+Vq81vSyLEUiUsTX5gXAs4QkKvEc3kHGAhh4bu/1z/k4kV9D3CH8GyPOiKlu1/BZ1x5+ElQEtVvJXQxcmITRsgFvKQ3qUTQ8O1B6fiwck7veRKybZbAnFwYk91G4NLv16JZPPH6G5n9b5psD5mb/kaxRL0rAn6vOQPcFOPU1eISCjEhTMvY6gS91f0PDUnwEcAJHpp0g/VN//Y5GYii+NdpW/6nquyrgQNYUxH276PB+rix9mVCmC+YPIDsXeXrZQBKG0iAIJkZCqP9Z5mWZEJoDUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnOvtDq0X6MPyFEXHDeFegyG/Ek38LO4We4ipVVQ8gM=;
 b=1km+qpMLtvtxbs5PjqSie4D6bX25TFVuhh+aeyYBMU7AVbzQaFw4b1iEfK9L2VMuXyuisST6povyhWEBTWvM3MdzZOfvc4mEQDkQQ41dkFTe+/p1EH9LlpxFvwGRigWZLIg8/pJveJbaOoSDrtTnRgMA955A+Mp6uVCw2u88Uko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 08:16:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 08:16:31 +0000
Message-ID: <ce090a95-a822-5079-7b86-0c949e98cd64@amd.com>
Date: Wed, 31 Aug 2022 10:16:26 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cc4c59ad-5d69-b174-5464-bd9896459169@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0479.eurprd06.prod.outlook.com
 (2603:10a6:20b:49a::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af062478-b614-4ee3-32ce-08da8b291c57
X-MS-TrafficTypeDiagnostic: PH7PR12MB6441:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgL+s8YjgCLkSYqVkH0cFoUxeg9Ol9lYQvNnGeidpBNyEA9yuOsAQlHQ1kyUu6ve/NS++F66kJcopWUI2Tm/nXebHXsDUEpF6RUJLbtnjsz8MTBZqWazWeZb9iTSV8qP/Mt31IrTK5mwLZAh8zjLUFAVhBSIPeEb+GtwZ/Ni5mFtDBdXpyPxy+57jbomeK1rmmCby/HOcFCXRoAQW341kGbSTSqfqpVRPuUPfZzNrrO5gnh1ufD1M6SiKRHjTgXvtaaJL47Yf8emeZYxzgerz/lX7e6h2N1tvKVmAHjz4JGnYoRk0Lo2YHD1k6kf9qmxhBTQxJdGE2Xf/yWGgYlcOjal3P9DiGQp1hRiUHgMuU+Q3M0igf4BhbuMM68tov5ivD4Fpzwo2Mfa8eg2WwtpAOdx6RQuMqpGDJL3bJ4iLK7ahumqOFGbC5CnKLy+Xa+/CZ/Rbv/zDe7Q8ssxPVgFeoA8FR9gMI584OygdHUW2LNuINgckw0vMHbscTZqpiKIZXTeIm/oIkEX3LIF46fV/d/NTC8ghx3zc+A7iXpQJa0e7oJcVaF1vyqPKqghIu/GGiuZHdNrMjKNphENjSFjk0OqXWAAKZr+1yXuTCaeu/cj4Zo86kTTvQWwEJXL0dN7+xK4NHHBqApwN1gdTPouTexzxc8jw/YDKzeGQx9cwfppOFOfec6YobVnOOsIjqw7ZdGcyoJcoaNuMEnB3mFX8lMIAywgRrd5yASK5EOj6rnhji0bcE6nYGPK6jeKCZicPsIaSLv9Mr03t36+qBdMxzjINoXJSu29gw1Wz3fh/8VKdZFbjgJeHHNsQW6FhlPt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(6666004)(53546011)(186003)(66574015)(38100700002)(110136005)(31686004)(36756003)(45080400002)(6506007)(86362001)(966005)(6486002)(316002)(5660300002)(41300700001)(8936002)(6512007)(2906002)(2616005)(478600001)(31696002)(66946007)(66556008)(66476007)(8676002)(4326008)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3FwdUlJdGk4ZjYrRU9MMldDMGpDNkh1aTJESXpENGp3eGY0ZE1aZ0FmWmZV?=
 =?utf-8?B?cTdPRnhYeXZVNkpLWWtMODJTYzVycDRpbWY0d3I1NjJ2dW90R0RseEloekNP?=
 =?utf-8?B?SE50VWlQODNTdWxzTXBzRlVqR2ZnUVE0NUErNkZDNEJVelFPaTJ2eG1jb3Zw?=
 =?utf-8?B?RDdMRWdBbjhFZFJ5OXVCZHpCcHFwbzZOR3pkUUhpeVpxTnUzVXBxNnJ3bkxh?=
 =?utf-8?B?R2dXNUJuZGtnZDdOYW9mUE9qaG1zTGQxZ3p3alpTYjZ6TERDQ1RmS0ZIdFBN?=
 =?utf-8?B?N1RCKzlFVUlsUnA4VDhOUUU4NmRUdllRWTBka3UyVklOMkcxTmhtNnhWaUQ5?=
 =?utf-8?B?TzdqZ0ZJRHRaTzNtZ09nQ0R2dzZGUTVSb2FzREtlRHBMUGlxM3BoUjZPUThP?=
 =?utf-8?B?Mml3amNZZ1dwTTlaOUV0b0N4dk90YkpiaUFtdlRXTFFqbjVkTzdmbjFnSnZV?=
 =?utf-8?B?aElXSGxsOVZsb1ZETzlNd1p4U2pacWR3cmExNE1oREhBZ2dKMnFNRVRsZlUy?=
 =?utf-8?B?cDNSVERMSDNZc0syeUVrdXQ1dXZVbWFVa0ZKYWZHS0lBMnp2WkNaYTVEd2pB?=
 =?utf-8?B?VkNvazA0SlRGS1NDMkdFQlVvVFJRTFd5UHkwN0pLMzBsK1A0UWJCNWdTb3Vx?=
 =?utf-8?B?N3BSRTR6U1Y4MkdUa2ZtajVIeFhLT1BqRmthb1JUaWxCNDhuOTZaN1hmRDVJ?=
 =?utf-8?B?MmZHNUJkRnd4bGNIS2V1amxmQTV1OWp5VW1qbEVPbEV1NDc0ZGhDS0JEcnRS?=
 =?utf-8?B?SFJ5S2NkUlQ5SktiZ0k3RjVYM1VCMElmMi85dC9KK1VnT0RaQ2ZReXZBSk10?=
 =?utf-8?B?RzRCdlFndmtIRVRzOXB6Wm5QWTdMMGVGWndBMTdrM3dZSGFKSTFhZlNrSk1I?=
 =?utf-8?B?ckNSZlcwZVFBSkFYdjJrcDlybmFtZzJJKzhKMklEQnJrNzl4Ykl0MUV3T0hV?=
 =?utf-8?B?ZVZuY3JHZlJqU0J4c0Zzd1p4czNaVnFjQThuemNXbXVWWFNZVmN2NDVXOUZ1?=
 =?utf-8?B?d0oxQU5ZSkQ0MHR0ZDFaRjZ2bE45cCtjOGNPQUpxU2VxZWRnQWJYdXZCdzNl?=
 =?utf-8?B?NUhYdWtmK1RuN015MXhzUFl4cTNUcVlxdEpZaWo5ZXNEaXl5cFJVYVo5M1hH?=
 =?utf-8?B?c2hnY01Ddkxzak1aajg2SmQ3d1pPdTVUbHltekdnWGgrVjlaM0JhaFJQUUpk?=
 =?utf-8?B?SktHQnVQa0MzNkFZcHIxS1N5bW5Wd3BjMkNwOVh3ZTVlc2hnd3lTRW4xRjhq?=
 =?utf-8?B?cWJHRDRqaVJDUm9jekFPVW1hWjl6b1pVd3dNeUI2K3VmcUpRdVRCTG9OY1Uz?=
 =?utf-8?B?UDYzWVJHN01WTEpvVWxJZ1hpcU5uR2FWMzhXblFaQnQrbWVPdmRNbmJUdGpX?=
 =?utf-8?B?Rlozd3llY200cDhjTVNsQitzTFhVRVhJT0tXYmYwTnJMbDUrN3VkeFgvRVFC?=
 =?utf-8?B?UzNIbHhmTmg5bk1pN3RsL1ViVVBGWUd6b0xJcUZhUmswTlp6Z3dpNWV5SmVD?=
 =?utf-8?B?cHRGRWZySFNIWFhaeEVHZjB6OEFzeG1XUStXc2ZSV1VCRFRiQU9vQ1JSQTBU?=
 =?utf-8?B?TGNDcTF6cURNd1F5anhqNkloaWlXN0xhSEw4NGhaQWdkaTdHL0xVSGh4anFq?=
 =?utf-8?B?VjVLSmYremFNRnBVcXpMVi9GUXpUUnByeVVQVmZINFVDRncrTTJQOXJJYUwx?=
 =?utf-8?B?TDZZRWg5WlRkTHg1N3JDUWpTWTlFRkNUS3VoNVp1MFRWUVZQVy80NFBHYXRt?=
 =?utf-8?B?cEdiZXNEYUpVaUNKSWlHVXEyWnpPc2hQN1JYSER2RmNsWlV5bjMzdFR5NHdp?=
 =?utf-8?B?enlrS0liSEV4aUZXdXZkNHVuMEFrMHRBNWdQdEdzUmM2b2VMcVQwdHdkLzNU?=
 =?utf-8?B?U21qUmkzSUxSNytzcGdJZk05TzM2SzIwSk44V0wyZDQ0UWV0UEZhc2lVWllq?=
 =?utf-8?B?UFFSQnFuKzk0QnFicEgzQmFWQ0RNWTlzUi91Q1BTMnBCckx5M1NvWWNRLzNz?=
 =?utf-8?B?K0lXSVBYQVN3NlkzM2ZjYm5EOEt5Y1B1VzRKeVJ3RkFINE8weWhZZTlzT3Ru?=
 =?utf-8?B?YlM5eUk5Z0xxS3BVajJWaDlQMmh5MTBQdTRPQ2VXcnByNFdyT2VmS1VCSE43?=
 =?utf-8?B?cnhJcmtWNHZEcnBXa2o2WEsra3ZwWDQwK2IrMCtDRXJrNFVnU0RodmpBMTVp?=
 =?utf-8?Q?RyrIJM7kUety+F3UCLRk0uhWmyGUN74Mf3YTxHuVjqNF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af062478-b614-4ee3-32ce-08da8b291c57
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 08:16:31.2836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kL1Ub68je/aew0+oePATsDwRYSIVhQR1R+HWXqtrjXmyFqvLbvmsFjA+Rvh3RydO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
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

Hi Matthew,

Am 30.08.22 um 12:45 schrieb Matthew Auld:
> Hi,
>
> On 30/08/2022 08:33, Christian König wrote:
>> Hi guys,
>>
>> can we get an rb/acked-by for this i915 change?
>>
>> Basically we are just making sure that the driver doesn't crash when 
>> bo->resource is NULL and a bo doesn't have any backing store assigned 
>> to it.
>>
>> The Intel CI seems to be happy with this change, so I'm pretty sure 
>> it is correct.
>
> It looks like DG2/DG1 (which happen to use TTM here) are no longer 
> loading the module:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel-gfx-ci.01.org%2Ftree%2Fdrm-tip%2FPatchwork_107680v1%2Findex.html&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Caa9bdb0e31064859568708da8a74b899%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637974531164663116%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=UW8BEnIFXHawhAfLUcknGmE88g2wwAiTLAQ3Y5v1pFA%3D&amp;reserved=0? 
>
>
> According to the logs the firmware is failing to load, so perhaps 
> related to I915_BO_ALLOC_CPU_CLEAR, since that is one of the rare 
> users. See below.
>
>>
>> Thanks,
>> Christian.
>>
>> Am 24.08.22 um 16:23 schrieb Luben Tuikov:
>>> From: Christian König <christian.koenig@amd.com>
>>>
>>> Make sure we can at least move and alloc TT objects without backing 
>>> store.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 6 ++----
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
>>>   2 files changed, 3 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index bc9c432edffe03..45ce2d1f754cc4 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -271,8 +271,6 @@ static struct ttm_tt *i915_ttm_tt_create(struct 
>>> ttm_buffer_object *bo,
>>>   {
>>>       struct drm_i915_private *i915 = container_of(bo->bdev, 
>>> typeof(*i915),
>>>                                bdev);
>>> -    struct ttm_resource_manager *man =
>>> -        ttm_manager_type(bo->bdev, bo->resource->mem_type);
>>>       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>>       unsigned long ccs_pages = 0;
>>>       enum ttm_caching caching;
>>> @@ -286,8 +284,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct 
>>> ttm_buffer_object *bo,
>>>       if (!i915_tt)
>>>           return NULL;
>>> -    if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
>>> -        man->use_tt)
>>> +    if (obj->flags & I915_BO_ALLOC_CPU_CLEAR && bo->resource &&
>>> +        ttm_manager_type(bo->bdev, bo->resource->mem_type)->use_tt)
>>>           page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>
> AFAICT i915 was massively relying on everything starting out in a 
> "dummy" system memory resource (ttm_tt), where it then later 
> "transitions" to the real resource. And if we need to clear the memory 
> we rely on ZERO_ALLOC being set before calling into the 
> i915_ttm_move() callback (even when allocating local-memory).
>
> For ttm_bo_type_device objects (userspace stuff) it looks like this 
> was previously handled by ttm_bo_validate() always doing:
>
>   ret = ttm_tt_create(bo, true); /* clear = true */
>
> Which we would always hit since the resource was always "compatible" 
> for the dummy case. But it looks like this is no longer even called, 
> since we can now call into ttm_move with bo->resource == NULL, which 
> still calls tt_create eventually, which not always with clear = true.
>
> All other objects are then ttm_bo_type_kernel so we don't care about 
> clearing, except in the rare case of ALLOC_CPU_CLEAR, which was 
> handled as per above in i915_ttm_tt_create(). But I think here 
> bo->resource is NULL at the start when first creating the object, 
> which will skip setting ZERO_ALLOC, which might explain the CI failure.
>
> The other possible concern (not sure since CI didn't get that far) is 
> around ttm_bo_pipeline_gutting(), which now leaves bo->resource = 
> NULL. It looks like i915_ttm_shrink() was relying on that to 
> unpopulate the ttm_tt. When later calling ttm_bo_validate(), 
> i915_ttm_move() would see the SWAPPED flag set on the ttm_tt , 
> re-populate it and then potentially move it back to local-memory.
>
> What are your thoughts here? Also sorry if i915 is making a bit of 
> mess here.

First of all thanks a lot for taking a look. We previously got reports 
about strange crashes with this patch, but couldn't really reproduce 
them (even not by sending them out again). This explains that a bit.

The simplest solution would be to just change the && into a ||, e.g. 
when previously either no resource is allocated or the resource requires 
to use a tt we clear it.

That should give you the same behavior as before, but I agree that this 
is a bit messy.

I've been considering to replacing the ttm_bo_type with a bunch of 
behavior flags for a bo. I'm hoping that this will clean things up a bit.

Regards,
Christian.

>
>>>       caching = i915_ttm_select_tt_caching(obj);
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> index 9a7e50534b84bb..c420d1ab605b6f 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> @@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, 
>>> bool evict,
>>>       bool clear;
>>>       int ret;
>>> -    if (GEM_WARN_ON(!obj)) {
>>> +    if (GEM_WARN_ON(!obj) || !bo->resource) {
>>>           ttm_bo_move_null(bo, dst_mem);
>>>           return 0;
>>>       }
>>

