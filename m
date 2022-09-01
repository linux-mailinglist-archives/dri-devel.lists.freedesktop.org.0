Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4645A9170
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 10:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9290310E63D;
	Thu,  1 Sep 2022 08:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E0210E63D;
 Thu,  1 Sep 2022 08:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da4iKGpP/WBbIiY0Cr0edUAzh+cTRUn51Y9/QsqVkEQRC6RXq+rOkLX60luTKyVHNTQza+Lexam/RzYrQy2fgU/L2kXfiqsLDJi2o1z/frYjXFuGsCAQAei7zRSIBVyP2wDtb+utnykt0j5766XWYCqXoRaj1ZWxG2iqoPBGitlV3O7Bo/+iu28NkoOWKYlAHfBfubLU6DIsDMTz2oV0Ef2CD7aArt5Onz4t1LpYH68QCYk1lBj587jUa0w0okdQ25tRJfTltlfFPSuuFpjSrDDDehe08/vH0YlAWqgcCn/bt8v1i/iDSQWt/0VyGIOOOPWwfGKrgZptWXzc6465Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ojgFlsCqmEgjEqkrOOdnqW/eEL34kqUy5XiYLy12aA=;
 b=WYbA/vgpTaMm/O8Y6DTtEV4qjZHkc5ZEAfIrJS70sqAp/VpceNSXYCBTvIfbUlBgekrM3Of0tmslnfUhp2oVzRhD4Yzpk/qLpeH/9tf8uPKcLDA7tIRoH+sUwI3xvXnQ26ip5SOGPeG/G7KyU3wtPrK4bd4NaINvHUpiMWoITH4q8DHq1E7FN9qh8zUoTRUend3CuIMvXKc/p9MNDPB6JLFjt0fabMOCBuLi4eiNY6fJie2sufo3G5jizXnEDcyTDSYt6rEjd3V0U6ezBK0LXqXRAEmAeplzbQVT6ttMs+eCbnOdefu5RqFKpnfer0FENc8d4lHPsNajRduopfQPeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ojgFlsCqmEgjEqkrOOdnqW/eEL34kqUy5XiYLy12aA=;
 b=sNQknNSxDfhNoQEYL+qCu8o8WsygHUbArCbF+sBWt6WHs7MCHmAq3PMBgsoqYv5dYktBcUolr4CjYj6vJkv67EoyIohrQbL6FAUcAOggh6KgxumzXmdlcLyUP9D2D2t8E1NPriAOGdhktpfHTmcorn3KC94wrWsKmn2V0N1zSWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 08:00:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 08:00:13 +0000
Message-ID: <e74ee9bf-82b7-68ba-13b2-4511e73b52e8@amd.com>
Date: Thu, 1 Sep 2022 10:00:06 +0200
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
 <1392ea7c-88a3-9a56-1ccb-e2f16cd55f72@amd.com>
 <303ae81e-d9af-6912-8cdb-c881015da634@intel.com>
 <7047e694-997c-2082-48cb-f9f628c40183@amd.com>
 <50b37045-87de-04d0-7464-afcb5f9a2a0d@intel.com>
 <06f90d85-2f31-e815-fd5a-f19af141df63@amd.com>
 <d96ee168-f298-63fe-058c-cd421e2c49a0@intel.com>
 <aa115f44-3771-fd37-8ac5-d831d13021fb@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <aa115f44-3771-fd37-8ac5-d831d13021fb@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65c050eb-72ca-4ea0-9779-08da8befff01
X-MS-TrafficTypeDiagnostic: LV2PR12MB5845:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RbHfnDVXGEyxdnOMMH/B53N6A8v9tVhvuXPGYLg+oM/R2FnTP+hZFAX4wb5M+eBLw0RQwUtzUxmRgwRCImKH4VgDKKxNSQuaJEiOuLWJjgkKqzTaSrbRXnl6qLfgmU35wlCAH55TfbBxCkj7eOnLbs+AiihSuaDqcK3yJa6ogw5j8rmcRG0+mp9kL2SUYWy1kAWCnCPVZagQ4DfnMNKXCVK+PUof0Qfba7kaz1XfFMpso4FCYPEkIskFZ8k32/mYUQk1TE/REYPbLjHxaMNeSRZZFuNq8vtZ8CvY3V5E1jf2D448DEO6etl+QAk33lgCdUninCXvdISEGa4zoQHCB0QrB5/HI2NFZkDp9cNtP6oWxm9+Bqa5B2aodV2qBRCkQJV9c7jzSJJouWQpBS/RLrO9yKZycsTCrDxcf8t70Uq64ChPo9hyqV7+lr681ylqpNEuSiydSG8kIbBV7uPBLEvusomPZqh5Cf1EOqqbs749NTl8Cu7BBxZZJ+lqVmxXwVr/GFCO4RWBlI/B/tRTY9Gs2DDb5NFHRKRHFqcfg3rSYWmONYDBlwUoBudEoygVCMdTRd0+jVWfOgp/KOQg0+BqIpN17iKWG60rQGEZk1sevHR8O8wJKh8VIi70IYg2JbWLd3ku4HJvIacVMdTwT+mhOADIifGuANFCV0epTLd3jqavjZjVXpubCDNVwCe0Q6Rids0LBxcQ4iuXGLAVCKFuIs7ZPs+2izJwPtyFTJFKLz5fMuxDeeDSrCGzdGZK8k9xWy8sg2YEu/EwXzHqGrjM1rxx72UwMrjRNl4OR7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(8936002)(110136005)(5660300002)(66556008)(4326008)(66946007)(478600001)(31686004)(66476007)(8676002)(6666004)(41300700001)(66574015)(53546011)(186003)(6506007)(26005)(6512007)(2616005)(2906002)(83380400001)(38100700002)(86362001)(36756003)(31696002)(6486002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHZlRlRlMlNidCt0b21pcUdVRTZBS2tPU2M2ZFdCNjI5NXlRTXl1Ri9rUDdi?=
 =?utf-8?B?UVZ3NVZiMy9hbTFVVHVYM1NEdUdRMmQ2MGRpUmhNcVRIdndsS3A1SERHRlhh?=
 =?utf-8?B?ZkxvWmh4WlBuRjFJM1h3YUYyY0gyL0dROVRRd0MzcU5yTi9zaW9RZ2Z6OTdE?=
 =?utf-8?B?UGZEVFNVMHNpUlVScjg0b2tTY1BlMTVzLzQzMXVTU1BqbGRpS2pDYlhtMUlM?=
 =?utf-8?B?ai9NNVJKMTUyT3gvUitKZmh1RjF6Y085dzZ1R2ROVmk5VVRYclV0eHhnYlNx?=
 =?utf-8?B?SmM3QmlLb05pbEF0cERGdFIrS2h3ZW1hQlFYRDkrVnd1bE9kK0xnZTRCQndP?=
 =?utf-8?B?QzNqQUd2ak1XRnRVMk1nRWtTdDlKeDFYdS96VzBFdlFRODlPL2M1SFh0bEov?=
 =?utf-8?B?QzJKMFM3TFZGaGZ4RlFDcTl2Qm9BTHJsY3BhS0tHM3cwdVd2bGpoVVhWV2pM?=
 =?utf-8?B?VGlTQ1JyM2FvblM4amd1RWg4RUcvWmJMcXgrMkw5Q0RRME02anhQZVByUm1N?=
 =?utf-8?B?ei8zbldISVdtRGJmN1hQeDRZMEtrT2VsNmpLOHpTYXUxSGF2TUhsWnp3NzFq?=
 =?utf-8?B?NUhHVTZvT1kzWkJRYUtWeVdpV2ptb1BCZFBDQUtIOUl6WGhaMytpc2t1Y3Vw?=
 =?utf-8?B?c3VDU0F2S2lpUldrWFp0d0J2L0xHd1dmdTFVRVhjdFUyQi9yY2p2dUFyaEFi?=
 =?utf-8?B?YUZjWVo4Skg1dDczWlRwWTRWOXJ2Q1ZVbjdEbnA5aHlvWWJFNGdvY05KVzlm?=
 =?utf-8?B?VE1KY2g2L0l0SW1vUldKMUVqTzd3ci9TVmIra1U4OGJIRDVsWnA3Zk9GTnc2?=
 =?utf-8?B?M1F2K1krc215L2t6UlBtS3R6UDlaR1JScVQrOWFDV0R3RmgyRHBaSnVKd0Y5?=
 =?utf-8?B?S292S1BsbFQxN2o2Zy94dEZpWmlqMnVjemFCeVJNTFVvK1RXNFRCQnB3TlNJ?=
 =?utf-8?B?eXF0bG96RUN0UGppMjN3OVJ6YmNBMGZuRkhJSFUwc3ZOSWIwOE9zNkJ2ZDZX?=
 =?utf-8?B?Q2dKTnFQVGJ5NUJPK2tXM08rVHYwUGVYTHFIQzgxRGdBY096cWhCbWIwTUNp?=
 =?utf-8?B?SzVsN1A4ZE9hbzAwNW9VUmNIQzVhTlB3bFhxSEdickVwamxCZkhOc1U5V1dX?=
 =?utf-8?B?M0dBT3FyTUtSdlpjM0svTUhZVmhrYzJ5eDlmTWtuT2xPQndJanBhS2JVK2ZO?=
 =?utf-8?B?NHRmMmxtZ0k2Y0VNaURLSVVyUDlHRzQybUgwNGp1Ky81MHFjQTB4NUJUODN5?=
 =?utf-8?B?YnkyRm12a3U0YU5wWmZaUUw4eFRNUEZWeGJpSmVSWXhCUWJPcktiNGxpR3p4?=
 =?utf-8?B?NGZmenhKUXhjYVNFTUZ1Z09ZTFZGQlZSS29aZ1N5bzBrMVVDdWtnNFNZanl5?=
 =?utf-8?B?TDJZTWtzNmphL1ZnaHRYdzFMSHY3cGp2b2RSQmw1bDBEeGdjL2RDMGhsbGsz?=
 =?utf-8?B?UVdmVTB4bGZrY0IvbUVWRzF0d2JnR1M3cEJoTEFPOWdMVUoxMVRKQ3RtMXkx?=
 =?utf-8?B?TjV1SWZ5bGdpOTJUS1NDdW1BdWZlZkdMQUJJeDh6VW9yOC9oS1F5RlZTQ1kx?=
 =?utf-8?B?WktwN3o2OEFsNGxUL3h6SzhMSU1JZVhpcG9aMlFQeDFXSG03clNSNzdnSE1w?=
 =?utf-8?B?YTNPbWhWLzc5bGVlamw4eWxZTC9WNVptUVZ4djNINXBmNkJCVnNEbWgwQmds?=
 =?utf-8?B?VDk4OWxxWk9VQWV1K0lQVHhqS2hEdHVrMkgvbHJOUmEyaVVCMy9NVTNlWjR6?=
 =?utf-8?B?M2NneTlFdFVGa0Y3bXlnMk9UOXM2UzVxbmNOQ2s3TVlQeWhvZG9BRzhmVG1z?=
 =?utf-8?B?WllMaUlvZ1dLNExEWWdleFl1ODNCOVZFZzZUMVRlYjNBR0hGUFNZdEhWc211?=
 =?utf-8?B?aHdwRW9ZdFZ1TjFQZktBaHZCajdXWlBWSHUvR3hqcjVYdVpSaWFVRDQyOTR5?=
 =?utf-8?B?WUZpMEVzeHpQYmxJTXJuUWlDaDVCTmExc3dSMk5mQkpjcDg3dlRvdE9aRU9N?=
 =?utf-8?B?QVp5YisyeHFVcFFkQWI3YU5zSTRZcGZWYWZ2YmVQRWtSRUptRVl6bHh2YkJQ?=
 =?utf-8?B?WWtmOXFyMlhETytzUk81Y0pLVmVrcXdXRjhGUDlRY3dWanhCUUU0Q0cxelN3?=
 =?utf-8?Q?uKVH98vkvmGpRZHiPOJQBpEuK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c050eb-72ca-4ea0-9779-08da8befff01
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 08:00:12.5741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RvpPyvNhvFMxxJhsdDKKtTIyuBcZkhVBRXUKAihR4WXcsH29xHNhZHShG+1Rby5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845
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

Am 31.08.22 um 18:32 schrieb Matthew Auld:
> On 31/08/2022 15:53, Matthew Auld wrote:
>> On 31/08/2022 14:34, Christian König wrote:
>>> Am 31.08.22 um 14:50 schrieb Matthew Auld:
>>>> On 31/08/2022 13:35, Christian König wrote:
>>>>> Am 31.08.22 um 14:06 schrieb Matthew Auld:
>>>>>> On 31/08/2022 12:03, Christian König wrote:
>>>>>>> Am 31.08.22 um 12:37 schrieb Matthew Auld:
>>>>>>>> [SNIP]
>>>>>>>>>>
>>>>>>>>>> That hopefully just leaves i915_ttm_shrink(), which is 
>>>>>>>>>> swapping out shmem ttm_tt and is calling ttm_bo_validate() 
>>>>>>>>>> with empty placements to force the pipeline-gutting path, 
>>>>>>>>>> which importantly unpopulates the ttm_tt for us (since 
>>>>>>>>>> ttm_tt_unpopulate is not exported it seems). But AFAICT it 
>>>>>>>>>> looks like that will now also nuke the bo->resource, instead 
>>>>>>>>>> of just leaving it in system memory. My assumption is that 
>>>>>>>>>> when later calling ttm_bo_validate(), it will just do the 
>>>>>>>>>> bo_move_null() in i915_ttm_move(), instead of re-populating 
>>>>>>>>>> the ttm_tt and then potentially copying it back to local-memory?
>>>>>>>>>
>>>>>>>>> Well you do ttm_bo_validate() with something like GTT domain, 
>>>>>>>>> don't you? This should result in re-populating the tt object, 
>>>>>>>>> but I'm not 100% sure if that really works as expected.
>>>>>>>>
>>>>>>>> AFAIK for domains we either have system memory (which uses 
>>>>>>>> ttm_tt and might be shmem underneath) or local-memory. But 
>>>>>>>> perhaps i915 is doing something wrong here, or abusing TTM in 
>>>>>>>> some way. I'm not sure tbh.
>>>>>>>>
>>>>>>>> Anyway, I think we have two cases here:
>>>>>>>>
>>>>>>>> - We have some system memory only object. After doing 
>>>>>>>> i915_ttm_shrink(), bo->resource is now NULL. We then call 
>>>>>>>> ttm_bo_validate() at some later point, but here we don't need 
>>>>>>>> to copy anything, but it also looks like 
>>>>>>>> ttm_bo_handle_move_mem() won't populate the ttm_tt or us 
>>>>>>>> either, since mem_type == TTM_PL_SYSTEM. It looks like 
>>>>>>>> i915_ttm_move() was taking care of this, but now we just call 
>>>>>>>> ttm_bo_move_null().
>>>>>>>>
>>>>>>>> - We have a local-memory only object, which was evicted to 
>>>>>>>> shmem, and then swapped out by the shrinker like above. The 
>>>>>>>> bo->resource is NULL. However this time when calling 
>>>>>>>> ttm_bo_validate() we need to actually do a copy in 
>>>>>>>> i915_ttm_move(), as well as re-populate the ttm_tt. 
>>>>>>>> i915_ttm_move() was taking care of this, but now we just call 
>>>>>>>> ttm_bo_move_null().
>>>>>>>>
>>>>>>>> Perhaps i915 is doing something wrong in the above two cases?
>>>>>>>
>>>>>>> Mhm, as far as I can see that should still work.
>>>>>>>
>>>>>>> See previously you should got a transition from SYSTEM->GTT in 
>>>>>>> i915_ttm_move() to re-create your backing store. Not you get 
>>>>>>> NULL->SYSTEM which is handled by ttm_bo_move_null() and then 
>>>>>>> SYSTEM->GTT.
>>>>>>
>>>>>> What is GTT here in TTM world? Also I'm not seeing where there is 
>>>>>> this SYSTEM->GTT transition? Maybe I'm blind. Just to be clear, 
>>>>>> i915 is only calling ttm_bo_validate() once when acquiring the 
>>>>>> pages, and we don't call it again, unless it was evicted (and 
>>>>>> potentially swapped out).
>>>>>
>>>>> Well GTT means TTM_PL_TT.
>>>>>
>>>>> And calling it only once is perfectly fine, TTM will internally 
>>>>> see that we need two hops to reach TTM_PL_TT and so does the 
>>>>> NULL->SYSTEM transition and then SYSTEM->TT.
>>>>
>>>> Ah interesting, so that's what the multi-hop thing does. But AFAICT 
>>>> i915 is not using either TTM_PL_TT or -EMULTIHOP.
>>>
>>> Mhm, it could be that we then have a problem and the i915 driver 
>>> only sees NULL->TT directly. But I really don't know the i915 driver 
>>> code good enough to judge that.
>>>
>>> Can you take a look at this and test it maybe?
>>
>> I'll grab a machine and try to see what is going on here.
>
> Well at least the issue with the firmware not loading looks to be 
> fixed now.
>
> So running some eviction + oom tests it looks it now does:
>
> /* eviction kicks in */
> i915_ttm_move(bo):  LMEM -> PL_SYSTEM
>
> /* shrinker/oom kicks in at some point */
> i915_ttm_shrink(bo):
>     bo->resource = NULL, /* pipeline_gutting */
>     shmem ttm_tt is unpopulated and pages are correctly swapped out
>
> /* user touches the same object later */
> i915_ttm_move(bo):  NULL -> LMEM, bo_move_null()
>
> So seems to incorrectly skip swapping it back in and then copy over to 
> lmem. It just allocates directly in lmem.
>
> And previously the last two steps would have been:
>
> i915_ttm_shrink(bo):
>     bo->resource = PL_SYSTEM, /* pipeline_gutting */
>     shmem ttm_tt is unpopulated and pages are correctly swapped out
>
> i915_ttm_move(bo):
>     PL_SYSTEM -> LMEM,
>     ttm_tt is repopulated and pages are copied over to lmem

Mhm, crap. That indeed looks like it won't work.

How about changing the code like this:

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index c420d1ab605b..1ee7d81ddcbc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -560,7 +560,17 @@ int i915_ttm_move(struct ttm_buffer_object *bo, 
bool evict,
         bool clear;
         int ret;

-       if (GEM_WARN_ON(!obj) || !bo->resource) {
+       if (GEM_WARN_ON(!obj)) {
+               ttm_bo_move_null(bo, dst_mem);
+               return 0;
+       }
+
+       if (!bo->resource) {
+               if (dst_mem->mem_type != TTM_PL_SYSTEM) {
+                        hop->mem_type = TTM_PL_SYSTEM;
+                        hop->flags = TTM_PL_FLAG_TEMPORARY;
+                       return -EMULTIHOP;
+               }
                 ttm_bo_move_null(bo, dst_mem);
                 return 0;
         }

That should result in allocating a TTM_PL_SYSTEM resource first and then 
moving from that to the final destination.

Thanks,
Christian.
