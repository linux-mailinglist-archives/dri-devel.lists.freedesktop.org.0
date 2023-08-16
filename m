Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F977EC4A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 23:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCA810E3DA;
	Wed, 16 Aug 2023 21:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D685410E3D9;
 Wed, 16 Aug 2023 21:55:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GverWTXj2gTV3y6tt5rLMQzGdT2OQxFVBibqpStk1QQJLkyRfGefmf8GE8+eO73zXA3zU3kEOUBHdTxNwhZRzRgRMidSaMgKdLEV2NdxocFOVgHMBoZuExl2o7H6gS4ExvVtf6Bh5PdOCYBoyG9jBtiDvLc+Om7yd/evUaJOpP69Cn0jJ0iFbj7NO9pSM8d2OMMYyCYKn2SnQNI1NFNj62tqvUyzZsMu9r89a0m0V3PJy63x8V29RFx6P6Qnrpyj0abvOLdCC0OC3zZnq3AlGh7gw1KdEo4SWHsDUGkhifirnnQ2Rs77d+zi0h7haIVpyQIiIeBzpKAiNebKXn9nbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqxWyfoHes1whrd0h4izP14UJojhI+05eKFRJCpU248=;
 b=k5MU9y6OoNQDU9TXRVqUlIWKUcOmqh+d8jFz+BkdF+cr+ox+UOpjYBg8sacmTF3Hvz9Cv/M12ESxer+AFwWN3OgWhaTBvm24UoOhyVW+H5TUaiuHN6aip5h3wZPmYpuaFIPZh4oxMxPlqWGPVYgOB9w7YzXfiLtVdbUV0qGTW8Zrgj2UQPzQ7GXcZGBr/bm5nIHu9x2XY7eORprPQd+/6tlTBLsyMQ6FSHzhjtMwpL8TsP9K+kqjDntzIl2/qG1e5rh6Wnuhd91mXYOVXX/JwCIZ/4CQF+2KU2V2ykqF6FkyFmw4AgfT4s4bMBUU8Y659QSUgiDObosbhQzqHh344w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqxWyfoHes1whrd0h4izP14UJojhI+05eKFRJCpU248=;
 b=xxeb9sEdbmNCrXN7JX003Adt49Ls6W8SFTVGakncEEEr241IyM2zTSF0MGbvKFRj3IbzKoTUl6mBqJGTFYMZm+IHAoBXVfjrP87KE2ekquZfAq2mf0Wz1XB2REba1rS13hGTfjqQBLygGLhzzbAWfPs+SLgq8T91fD+ZEYvOgqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS0PR12MB7780.namprd12.prod.outlook.com (2603:10b6:8:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 21:55:30 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 21:55:30 +0000
Message-ID: <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
Date: Wed, 16 Aug 2023 17:55:23 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Implement svm without BO concept in xe driver
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>, Philip Yang <Philip.Yang@amd.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0326.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS0PR12MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: e4740b29-00e8-433b-246c-08db9ea3823b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hq0qsH0scIa7WJ5UFRAjoPFActGpbKVm/b4Ius6USDWUn48aOwmhHBROBtFRklEmymXd3M+CPcvoMm7Gw+1qWaTOiWeUXlECaS9B8EDbkF5yVXxcqvw7UU9xExkGnOVIbESJBkfeuPHqqwKmQX/J7x7yCdsrU6guAhUJm+yZi8nOw+nJq8l6utb656U/ROQOjcySvbvvn1/rNwUlk39Xsn2qTobyFuhMddSg8/Fuq75y92gipSmQaUh6fvDyAU3OtI6gDfLGII+53U3S7TTwz3+ol2WtofyB7FbwDH6L2Sse6Jck+WWDutNvMztKKHCvDPKUmHtrz/KIAXgseOcxX22pOPFhajM/FvlmSCBDUB2se7/naBoLub5pleT8RYYzF3i+IieXbR+f181uMRztvHwiINCsWYmyi+/gwREO9JNnDIKGv5gAoRp+H6gRPOcDZ/pJzkTCaTLXzelmpLCk8AhaivhrsnrWSwd0B6cEfQPIzMSP5PCV5KNqMQDMbm2k9CwMpCiXLSyl7kgw5I6x3fivahXh7gRQH7qB1M6v1AYXimmZuoh+7xTy2/9GZQnkUGajMLXd2nJSt1HSsMbR2W9ggBNSiUqoh62Dd3NZenVtjqKJ6LKyYmQMUKmChVDsfOtRiZ+XDWGN1Jm4piM/s+kvZ4MLdetE807TchFogBE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(921005)(66946007)(66556008)(66476007)(110136005)(5660300002)(41300700001)(44832011)(31686004)(66574015)(38100700002)(8676002)(8936002)(66899024)(2906002)(83380400001)(26005)(478600001)(86362001)(53546011)(6512007)(31696002)(36756003)(6506007)(6666004)(6486002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anMxUDJRK00wUnNKSG00NVhwYzBsaS9oY2hXa016dlpCSGJkSmhzQXJsVVE5?=
 =?utf-8?B?amZlTU9XTXZISGUrRzE5RUJzc0U1TTR1UktNOFVWTzhlcVY3VWxqVzk3dmM5?=
 =?utf-8?B?d2wrYUsxL1JBTmMxTXVLQnh6R1ZLeFBrSkpPaVQrc1FTUHZQczF3aEEzVTJn?=
 =?utf-8?B?YUNHeWVEYXRld1NXNGFJaExubENQZE1UaEx0MFQyeVUyZjJvVzFtYmRuWUVy?=
 =?utf-8?B?ODlUd1Y3MjQvYndhUE5tYlR6eHZGUEVmQ3JzdzVqSlEweEJTdU1va1krczFo?=
 =?utf-8?B?djJ0WGdtNXUyclU2U2pia2JBOEhMMDJ0SkZKS2h3dkhhM1UzZU9KZkpaODJT?=
 =?utf-8?B?RXJFT2VQOE5kSXUyQ1Bhd0x3SUpYS2o1SGNRZXplL25pS2ZrR293Z0lmUTRF?=
 =?utf-8?B?LzJHMmVUYXA3S0xuUFNNM3FtemJwQWIxRmdNTU9RTXpkeHJFeUJQVFI4ektQ?=
 =?utf-8?B?TFc0K24yRmRxcEYxNXVjZXpOcG43Tm1seFROT3lZenF6Y0hRSmlPRnN3eXI5?=
 =?utf-8?B?S2FhR003VVNlQXhYYlZtemxBTXBpRUZ3KzVGOHcrZXpqNnNUTXJqMENxN2Fu?=
 =?utf-8?B?S08zaEMrbzBSTnJQUnoxOXUwSzNKYjZpZWIvUHc5S2FZODNlTFJENllhUTlZ?=
 =?utf-8?B?NnVrVmt3a0pPZjBBd1hKZldlRmFxU3hFSlhKQkZueVpjeEk2NjJCenpxRjAx?=
 =?utf-8?B?UmRLOWh1THUzSjdPOHYrQ1RzR2dmVGN4WmxGT1I2ajgrTUpaMzhXU0FGVXdM?=
 =?utf-8?B?bG8waFBhSjZVOVR4aGxlbERrUDhLN2NFbWpCQWRBMDhHWmdFTjd2RkdlNFR5?=
 =?utf-8?B?SDlmV2YxeWlHTHhEWmpjNTJIZGNlRlMwS0tUdlh4ZGZqaU1WRGZwVHYvdXlC?=
 =?utf-8?B?NkRsaFlhd0pDdVFQQWFFMnJwRmlWSm8xMjNIYnpQcWdKeWF1OVlST1pLaTY2?=
 =?utf-8?B?UEwvdlNmeWRLQjNmWGNHMDNoQmpzVkpNMFBDVkNJcncvc0hTQ1lUZCtKQ3NQ?=
 =?utf-8?B?aDQzanJlaU44RlRNbkxIK3BTbmY0dDFrNjM0TmlLZEYrelM1OVJ3eHBaRE1W?=
 =?utf-8?B?SVkrdmloOTBRd1hQWUozMEZOZ2tMeXFYOVZtUmxNQ2xIQTZnNWZzTDV1MGdJ?=
 =?utf-8?B?Mk42c2h4V1B1bWV2VkNoL2NGQno5THhFZWNTV3IrWTQ0NnR1NkkzTUMzbHZT?=
 =?utf-8?B?R0JiRXpUQUp4M080bm5CNnVFQjM4MGlyWTBUU3JoZDVpYkxTNGVueHpUVFBI?=
 =?utf-8?B?a1NHYzZxaXJvNjdJNm4wSmptN0VYTm05ZlRaYi9yWTJDUENqOXF6aU50WlNH?=
 =?utf-8?B?UjRQTEV3SmM2Zkt2dDQySmVXOUgxc003Y0hRRlV2VXJNZHNzOEhGU2dnNzM2?=
 =?utf-8?B?S1EzM01pOFB4c2d3TzB6ZHVyUzNsc1RCQVphZEwxSEE5SVg5YXJGeHM3N20v?=
 =?utf-8?B?NUg1YkZDb1FkKzMxK0lYV0ZLcmRWUGxETklMTW45RGpvNTRlekhNM3N5SDJG?=
 =?utf-8?B?MHlwZmNERVg2MHd4YzJVS2dNRmFHc0NKaG1BVHNPL2dxSWhsalFYRVVqdHBG?=
 =?utf-8?B?MlZWK3Y0WVZSUHFvUnJybzF2S0Yvd1N0THdmOENENFJVVXY2VjRWWXk3NTFQ?=
 =?utf-8?B?aTh1VXNMTVJ6MEIwanE2OFNSR3B2QmF0bS9vd0JwbWVOZHhGc3Q0dzJSMnJu?=
 =?utf-8?B?NEJsUCthUWJPRW5TRjQrWkl4R3Y3K3ovdlFucjlPUTI4c2V0aEU5bWorYTJY?=
 =?utf-8?B?TGE1c1I0QzRtbTFBNnJ2MEtQWTlsTS93cW5McGNEdGxZTnpyVWNyclhabHNV?=
 =?utf-8?B?ajVETi82SWxPUjYva2prVnJwb1RWUDYvR0QwczVYeWwrZ1pqSlNEQ0QrUDQ3?=
 =?utf-8?B?RGJtZ2d0M2hsR0JtZ0k1NW54YlpXVEw3bllpKzVYSmNyZ3F4dUtVbDhLRWtW?=
 =?utf-8?B?dUFPVFp5dWpiVWQ3RHNOWExGZDNtZmZwZi9VNUR6ZDdKUkZXUHc5WDRvbGI1?=
 =?utf-8?B?aDVXMkN2Skh1V1Nab3BzMi9mN05FOHRwcXVGVU5SNVR0VVFmNnQ1SzVWNTBl?=
 =?utf-8?B?dlNlRTBnamxwdTVnbmNHUG9GYkJwQVlSZWtSYWpKdnZENFNFd1F1Nzl3Z1FH?=
 =?utf-8?Q?RfsewxAxWGdX9rf0JenH7uWww?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4740b29-00e8-433b-246c-08db9ea3823b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 21:55:30.6051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONPFGOIP/0EQZq1vE5a2/EVemFHvst0VvgP+cWb9kFlBuK16NmVOnC1aChsD4Zd5EOW/RyTzcPBec/yJOfxBWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7780
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

On 2023-08-16 13:30, Zeng, Oak wrote:
> I spoke with Thomas. We discussed two approaches:
>
> 1) make ttm_resource a central place for vram management functions such as eviction, cgroup memory accounting. Both the BO-based driver and BO-less SVM codes call into ttm_resource_alloc/free functions for vram allocation/free.
>      *This way BO driver and SVM driver shares the eviction/cgroup logic, no need to reimplment LRU eviction list in SVM driver. Cgroup logic should be in ttm_resource layer. +Maarten.
>      *ttm_resource is not a perfect match for SVM to allocate vram. It is still a big overhead. The *bo* member of ttm_resource is not needed for SVM - this might end up with invasive changes to ttm...need to look into more details

Overhead is a problem. We'd want to be able to allocate, free and evict 
memory at a similar granularity as our preferred migration and page 
fault granularity, which defaults to 2MB in our SVM implementation.


> 	
> 2) svm code allocate memory directly from drm-buddy allocator, and expose memory eviction functions from both ttm and svm so they can evict memory from each other. For example, expose the ttm_mem_evict_first function from ttm side so hmm/svm code can call it; expose a similar function from svm side so ttm can evict hmm memory.

I like this option. One thing that needs some thought with this is how 
to get some semblance of fairness between the two types of clients. 
Basically how to choose what to evict. And what share of the available 
memory does each side get to use on average. E.g. an idle client may get 
all its memory evicted while a busy client may get a bigger share of the 
available memory.

Regards,
   Felix


>
>
> Today we don't know which approach is better. I will work on some prove of concept codes, starting with #1 approach firstly.
>
> Btw, I talked with application engineers and they said most applications actually use a mixture of gem_bo create and malloc, so we definitely need to solve this problem.
>
> Cheers,
> Oak
>
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: August 16, 2023 2:06 AM
>> To: Zeng, Oak <oak.zeng@intel.com>; Felix Kuehling <felix.kuehling@amd.com>;
>> Thomas Hellström <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>; Welty, Brian <brian.welty@intel.com>;
>> Philip Yang <Philip.Yang@amd.com>; intel-xe@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org
>> Subject: Re: Implement svm without BO concept in xe driver
>>
>> Hi Oak,
>>
>> yeah, I completely agree with you and Felix. The main problem here is
>> getting the memory pressure visible on both sides.
>>
>> At the moment I have absolutely no idea how to handle that, maybe
>> something like the ttm_resource object shared between TTM and HMM?
>>
>> Regards,
>> Christian.
>>
>> Am 16.08.23 um 05:47 schrieb Zeng, Oak:
>>> Hi Felix,
>>>
>>> It is great to hear from you!
>>>
>>> When I implement the HMM-based SVM for intel devices, I found this
>> interesting problem: HMM uses struct page based memory management scheme
>> which is completely different against the BO/TTM style memory management
>> philosophy. Writing SVM code upon the BO/TTM concept seems overkill and
>> awkward. So I thought we better make the SVM code BO-less and TTM-less. But
>> on the other hand, currently vram eviction and cgroup memory accounting are all
>> hooked to the TTM layer, which means a TTM-less SVM driver won't be able to
>> evict vram allocated through TTM/gpu_vram_mgr.
>>> Ideally HMM migration should use drm-buddy for vram allocation, but we need
>> to solve this TTM/HMM mutual eviction problem as you pointed out (I am
>> working with application engineers to figure out whether mutual eviction can
>> truly benefit applications). Maybe we can implement a TTM-less vram
>> management block which can be shared b/t the HMM-based driver and the BO-
>> based driver:
>>>      * allocate/free memory from drm-buddy, buddy-block based
>>>      * memory eviction logics, allow driver to specify which allocation is evictable
>>>      * memory accounting, cgroup logic
>>>
>>> Maybe such a block can be placed at drm layer (say, call it drm_vram_mgr for
>> now), so it can be shared b/t amd and intel. So I involved amd folks. Today both
>> amd and intel-xe driver implemented a TTM-based vram manager which doesn't
>> serve above design goal. Once the drm_vram_mgr is implemented, both amd
>> and intel's BO-based/TTM-based vram manager, and the HMM-based vram
>> manager can call into this drm-vram-mgr.
>>> Thanks again,
>>> Oak
>>>
>>>> -----Original Message-----
>>>> From: Felix Kuehling <felix.kuehling@amd.com>
>>>> Sent: August 15, 2023 6:17 PM
>>>> To: Zeng, Oak <oak.zeng@intel.com>; Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>>>> <matthew.brost@intel.com>; Vishwanathapura, Niranjana
>>>> <niranjana.vishwanathapura@intel.com>; Welty, Brian
>> <brian.welty@intel.com>;
>>>> Christian König <christian.koenig@amd.com>; Philip Yang
>>>> <Philip.Yang@amd.com>; intel-xe@lists.freedesktop.org; dri-
>>>> devel@lists.freedesktop.org
>>>> Subject: Re: Implement svm without BO concept in xe driver
>>>>
>>>> Hi Oak,
>>>>
>>>> I'm not sure what you're looking for from AMD? Are we just CC'ed FYI? Or
>>>> are you looking for comments about
>>>>
>>>>     * Our plans for VRAM management with HMM
>>>>     * Our experience with BO-based VRAM management
>>>>     * Something else?
>>>>
>>>> IMO, having separate memory pools for HMM and TTM is a non-starter for
>>>> AMD. We need access to the full VRAM in either of the APIs for it to be
>>>> useful. That also means, we need to handle memory pressure in both
>>>> directions. That's one of the main reasons we went with the BO-based
>>>> approach initially. I think in the long run, using the buddy allocator,
>>>> or the amdgpu_vram_mgr directly for HMM migrations would be better,
>>>> assuming we can handle memory pressure in both directions between HMM
>>>> and TTM sharing the same pool of physical memory.
>>>>
>>>> Regards,
>>>>      Felix
>>>>
>>>>
>>>> On 2023-08-15 16:34, Zeng, Oak wrote:
>>>>> Also + Christian
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Oak
>>>>>
>>>>> *From:*Intel-xe <intel-xe-bounces@lists.freedesktop.org> *On Behalf Of
>>>>> *Zeng, Oak
>>>>> *Sent:* August 14, 2023 11:38 PM
>>>>> *To:* Thomas Hellström <thomas.hellstrom@linux.intel.com>; Brost,
>>>>> Matthew <matthew.brost@intel.com>; Vishwanathapura, Niranjana
>>>>> <niranjana.vishwanathapura@intel.com>; Welty, Brian
>>>>> <brian.welty@intel.com>; Felix Kuehling <felix.kuehling@amd.com>;
>>>>> Philip Yang <Philip.Yang@amd.com>; intel-xe@lists.freedesktop.org;
>>>>> dri-devel@lists.freedesktop.org
>>>>> *Subject:* [Intel-xe] Implement svm without BO concept in xe driver
>>>>>
>>>>> Hi Thomas, Matt and all,
>>>>>
>>>>> This came up when I port i915 svm codes to xe driver. In i915
>>>>> implementation, we have i915_buddy manage gpu vram and svm codes
>>>>> directly call i915_buddy layer to allocate/free vram. There is no
>>>>> gem_bo/ttm bo concept involved in the svm implementation.
>>>>>
>>>>> In xe driver,  we have drm_buddy, xe_ttm_vram_mgr and ttm layer to
>>>>> manage vram. Drm_buddy is initialized during xe_ttm_vram_mgr
>>>>> initialization. Vram allocation/free is done through xe_ttm_vram_mgr
>>>>> functions which call into drm_buddy layer to allocate vram blocks.
>>>>>
>>>>> I plan to implement xe svm driver the same way as we did in i915,
>>>>> which means there will not be bo concept in the svm implementation.
>>>>> Drm_buddy will be passed to svm layer during vram initialization and
>>>>> svm will allocate/free memory directly from drm_buddy, bypassing
>>>>> ttm/xee vram manager. Here are a few considerations/things we are
>>>>> aware of:
>>>>>
>>>>>    1. This approach seems match hmm design better than bo concept. Our
>>>>>       svm implementation will be based on hmm. In hmm design, each vram
>>>>>       page is backed by a struct page. It is very easy to perform page
>>>>>       granularity migrations (b/t vram and system memory). If BO concept
>>>>>       is involved, we will have to split/remerge BOs during page
>>>>>       granularity migrations.
>>>>>
>>>>>    2. We have a prove of concept of this approach in i915, originally
>>>>>       implemented by Niranjana. It seems work but it only has basic
>>>>>       functionalities for now. We don’t have advanced features such as
>>>>>       memory eviction etc.
>>>>>
>>>>>    3. With this approach, vram will divided into two separate pools: one
>>>>>       for xe_gem_created BOs and one for vram used by svm. Those two
>>>>>       pools are not connected: memory pressure from one pool won’t be
>>>>>       able to evict vram from another pool. At this point, we don’t
>>>>>       whether this aspect is good or not.
>>>>>
>>>>>    4. Amdkfd svm went different approach which is BO based. The benefit
>>>>>       of this approach is a lot of existing driver facilities (such as
>>>>>       memory eviction/cgroup/accounting) can be reused
>>>>>
>>>>> Do you have any comment to this approach? Should I come back with a
>>>>> RFC of some POC codes?
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Oak
>>>>>
