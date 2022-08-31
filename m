Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A740B5A7D79
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 14:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8640B10E37F;
	Wed, 31 Aug 2022 12:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CAF10E37E;
 Wed, 31 Aug 2022 12:35:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X723Sj7Y3Sj+9qSlW7FoBmA/P2TM3ahZImnNOFJRyHWp2pgqips+QGElRzGowvOqLCceCxvk9O9jTM75cXEqW83cL55V6j9i4VoCIOQAtE2ugFep6I25iuvG2kKscJIFclEXkGHzrTz0+yPdvE70YF4Am0FFMHZqP31j5jb1vYXsuQPK7LpaiFNgdroCX7F51MaTNncQnkP4P9Lul+Yq008NAP379BXYl/Sn5VG5X/VdjJvelFL9CaXKlMv+L1hvcGn4nyYyfhMCxlNdelcl70Mbi+3gwZRZ7EjZyHgqFci4rEFxH7JIHB68LkwmiUTlM988Rlhhx5kHrwxxKzMOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQTtqzaGXr+IxtDU6vZV/YJldt3HDzwXhBGUuXXIPGQ=;
 b=Kcm9szLbBTr31JYgjyeO7cfiiOvC74HOUB5VFfZpSLb3WXFhRBtueMdnrYgq5KUi856WHo7QPc7BWBVAvkH0xpeXRl5PNhV/WHrw97eKZ4X+HFn87aklPkVKYkxU1hF5GGy1iQUWJJ9A7l1wDqkgxerX9MxopBzwtXShiiu8k6Lb8RltEu1SmKb4AmZx8Ah+U5lYzi+0BfzVt9GYd4JPoohqqONxjV+hJSR078uRwi+v7+Ib/S3sfMIEI4TgPOmE6xDIVndZ8T7+N41uMHe4lKrPvsDyitd+a5IMoXj3OcAgVmp6QJ5LxafrNkJ0uPDbG4KOfpMcmK2Gdt8Tos0Mzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQTtqzaGXr+IxtDU6vZV/YJldt3HDzwXhBGUuXXIPGQ=;
 b=AReniGAJMEZgKBIHyxW1u/aG6wR7aj+c8/rCYMxpygfS0M5jqMh99cLpHMiThtVrWdGnPXDSx7dj4q9pFd1AHVf9M0M02enaT8KhN2EH1/roy71gU76I2HFqYIgIvlzs6Sg7CNKAI5144C43etG5OMau61ru/RR1v2OgO9yiygE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4472.namprd12.prod.outlook.com (2603:10b6:208:267::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 12:35:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 12:35:49 +0000
Message-ID: <7047e694-997c-2082-48cb-f9f628c40183@amd.com>
Date: Wed, 31 Aug 2022 14:35:43 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <303ae81e-d9af-6912-8cdb-c881015da634@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ca00b5-45d5-4575-6baf-08da8b4d55cc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4472:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0jziSpM9dfcR9txw4HIWT7zHf0JzMu8+uAmDZgZZdX6Ws3U7qpBY1xYX1NA9yvXrKw3tVEexGwfiXHVQZ9SGo6sXDw47VPRilr0VX8AeHEcevWVvMEBzDTrSGll+OEmRDRutYiXhNWQ+NHx8gPSmRfw3iheECUPjOlcWgpSHhwbRvtM15Mf+YzV7/NfaJYmYPZ++HuUZdV9M4dGWezen9UFayJeduv1Fxj8OxypjaPkSN7i3YfONHtTP5GPVPVBp2HQzHTBDa9a7tj7xHYkktxEt/g6QcBmk4hiqUD0z5Yo6zRyMF3psDGU4qfeNxrj2VgcP83Vsudm+z5IUEEGrB+SDLBOywMnIETkwBcuHqOqNc1mycLkEjkRcYpiL8CaDtJ4ekFxLfTuNOuswwF2FDT7jKLDin8eEO7fXZSBIZWjEog5xcj2dj27lra8zDGlFPxC6Gt9MOJkwzIu93LxiGwmKA+eQFRXiLZEcm6AsotsoOXVxyqVqeCAqDl0NCZlOnaWPp74zNQ3nXTwnkad7YUCLgvU31iuGcLNmr1GU3L+9JIfrgBGUJaagFF9Me8rmuS3BFAbgCtnt3jzBcYqd+GVtt3qrY7L5AHBdXBiUsTUZE19bvZYDpckgouRhECatpWSb+fsuGuSUEN2t+YC7lPMBvfN2SUPR8rtQpefdFBB+RRTA38q6+TX5MVJE0PjCiIZrcce5CMvP6D1dzevJXDuDtLE9qGpbAZWjNR2PTVjVWYRGV5sZ8czFqTRGu1akdsQXtjLCKbcOIfaMfX1byypxn0udzXB2MT6zuoJTtwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(110136005)(5660300002)(4326008)(8936002)(66946007)(66556008)(8676002)(66476007)(36756003)(2616005)(2906002)(31686004)(316002)(6486002)(41300700001)(478600001)(6666004)(6506007)(53546011)(31696002)(86362001)(66574015)(6512007)(186003)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEJ3azhlUll1cEQwbFdyUlUvWHBmZ1lUdXBnOWdGNUZUaE9vSVJHa01Oa0Zo?=
 =?utf-8?B?djQ4NWMrQTBhQjV3Z3Qyc0o1M1VmbGhJVjg4YzUwZDZCYkpycjBuc2R3S3Zl?=
 =?utf-8?B?NW5ObGVsQ2w3WDlpMGhMbVlFUVNCN3hIUWNpUGRIbDAxZ2R6VGVJdzBINzNk?=
 =?utf-8?B?c2tWVEZQUkVuSHY5aE5iZUZNeGdNaUxCbmluQXR4UTg0ck9XZHZURzBaSDcz?=
 =?utf-8?B?Q1RwWGszNGphelpsaVJVRWx0UmR4SXZpOEtxZk5VT0d3dE5KZTAwZGFxRTVL?=
 =?utf-8?B?eW9VOGRaaWJxWHIyamZxYm1ZZmpJTnVNbjJrQVhnWkFuRXZVS2RUNEtuMjlq?=
 =?utf-8?B?dFgxczk4aUlOaW5uR0sxUlRiYjV0LzUwNk9KNXEya1NZTzg0U1FNcmpNcWVy?=
 =?utf-8?B?b1lkS1k3Q2VtQnQ4c3lYcUtpNDU0cnhibTZKQUhjcVVCVDIwbXI1VTFDdmxi?=
 =?utf-8?B?MXhZUEZOc1hWN0VybStZSTczMEd5c1k2dTgyNUNOY0pXZW5wckFSRk0xTCtP?=
 =?utf-8?B?N1VrUTR1bTRudEg5eGpzdVZFRmZieVRNWS93dk1YMlBHTk01UWFHSVRaclh1?=
 =?utf-8?B?cFlyKzk0WEo1VVNCMy9wZ1V2VUNoNUtYeUpWcmVhTDdaRXpTdWRLK2FLUXMz?=
 =?utf-8?B?OXpnd0srUWNDN3picWZTZDdibTQxZkw4bHlGNXMvektYb1R1SVAweHdHR3dD?=
 =?utf-8?B?aUxJdkV0RHVqRGx6VmZzSjZTUzVuUENlc0tseklwUUQrRkRCSXFlRjZETzFM?=
 =?utf-8?B?cytqUVBYRTJReXR0ZDgvYTZLKyt1ODdKZTN2YkVGV2I2Nit0UG5Wdm1mbjFo?=
 =?utf-8?B?d2MxV3VoemhiNURqWi93d1g4ZXl1aU43M3ZNbUFRMW82NGs0L1RQT3BzV2Qr?=
 =?utf-8?B?RHBGaHhhK292SXRxeXFnYys4eGdmdEVmTVRwRnZXWUFJaTl0WkVxTnI5SDR0?=
 =?utf-8?B?VjZ5VEFXTXVsajNTVjIzcWsrY1M4MDVGV2FmUTY5dERBZ1pzMFJ1UWxORVYy?=
 =?utf-8?B?M21oNzl1Vk82TFZvRFpiTFp1cEtyV0kyRGNad3ZPWHBkL2E4RkRCQ1Jya29F?=
 =?utf-8?B?OXZpdkpNT0M2NVNITC9RT1o4RlFXbE1nR2tjYXpreWE3RjZOTU5ZS3pOQXN3?=
 =?utf-8?B?VldjZzVjNDQyN3FUOVVCWkhrWmJUZVVCMHA4ZldRSGRDQS9nK2h3MDg4eW5S?=
 =?utf-8?B?dU0rVWFUa05ObTR0MDFjb09RV3lYeFRFT2pYcVFZRTE1SjFIaU1GbjJIdWU5?=
 =?utf-8?B?NTRhdW1nbVpnTElpRnNIbzVLNWRMNVB4b3VaNWhtSk91QlVSY05OWURyYVA3?=
 =?utf-8?B?VktFS2ZSak9aemVHUnROS2VhWU0rc3ViMjlHaHpZd21hRkZTQmFjVk1qL3hr?=
 =?utf-8?B?RU1MSnlNZ01vK0tPMmk3R2hKR2R6bk5XYloyWDhkbitBS04rTmJDYWg4Nmo1?=
 =?utf-8?B?WmIzYnFlbmdqWDhtNHB0STZ3T0swdHhGdUI0ZnllVk9nbEllK2VVMVU3Q3J2?=
 =?utf-8?B?bVFrSWxnN29UU1Z5U2xyS3NkT0lySDlZQzJEcGxuMVk1anVuRWFJZ1gvTUhk?=
 =?utf-8?B?MGNFdFlIeERvOTVkdEpldUg3d29Qdmh1aU5mdWZsRjFqK1Q2Q29TdTV1dVFa?=
 =?utf-8?B?ekpmdTBLZ09sb2RuSjFRWjI3ZllPbmZzRFpXYWxqSXhBQkNKSHU0QUFOdCt2?=
 =?utf-8?B?QzJpU2phQUxvVFh1eTlpa05UakMwSk1PdEZPb01ZUVFVeGxQT2swYnZhV0F5?=
 =?utf-8?B?YmxVd0s4TmVtWTlFRFgvMWpjK2dOKzg2ZVVDajlUWE53enhRenNTaHQwanNo?=
 =?utf-8?B?RXJXbHo5V28yUDg3RUZsbERrbXA2L3B3RjI4ZXN5d3ZRem1aUEVVVUZwMjk1?=
 =?utf-8?B?RDA5elBrYnliVThZVXoycm1NRWlVVVZDM0N4dVlVdkFHMlZ4aW5PT1k5WURr?=
 =?utf-8?B?cW05M0Vic0lDSHBpZy9KbW9QcGs4ZmdyRVlwV292UHNaaFZOZldRbHNrd25W?=
 =?utf-8?B?VlZkSWxVc3JYZzhHOG9tUG1XaEtzRUY1WE15UktEcllVQTc3RnNqNDF5QVJF?=
 =?utf-8?B?Mjl0MEJLWVA4a3JTSlVXdzMrcFdCR3dYNm5GSjdGcG9MTEpqV3ZUajFZRjBQ?=
 =?utf-8?B?eFN3c0owNGh3R2RSVTVETFFYSmdjU2swdFVJdk5jbnhnT3UvcmtSWHNtTzZz?=
 =?utf-8?Q?sex9LhaHXpLkz+F+b68OiX7jXrRlYmHXVlBtLKfGp6gW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ca00b5-45d5-4575-6baf-08da8b4d55cc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 12:35:49.8142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71kMpGExKrNSWNAgYPHB3dp927/sDDy5soNgwmu+CIP1f12y0iLgYC9ScSEJ+xke
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4472
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

Am 31.08.22 um 14:06 schrieb Matthew Auld:
> On 31/08/2022 12:03, Christian König wrote:
>> Am 31.08.22 um 12:37 schrieb Matthew Auld:
>>> [SNIP]
>>>>>
>>>>> That hopefully just leaves i915_ttm_shrink(), which is swapping 
>>>>> out shmem ttm_tt and is calling ttm_bo_validate() with empty 
>>>>> placements to force the pipeline-gutting path, which importantly 
>>>>> unpopulates the ttm_tt for us (since ttm_tt_unpopulate is not 
>>>>> exported it seems). But AFAICT it looks like that will now also 
>>>>> nuke the bo->resource, instead of just leaving it in system 
>>>>> memory. My assumption is that when later calling 
>>>>> ttm_bo_validate(), it will just do the bo_move_null() in 
>>>>> i915_ttm_move(), instead of re-populating the ttm_tt and then 
>>>>> potentially copying it back to local-memory?
>>>>
>>>> Well you do ttm_bo_validate() with something like GTT domain, don't 
>>>> you? This should result in re-populating the tt object, but I'm not 
>>>> 100% sure if that really works as expected.
>>>
>>> AFAIK for domains we either have system memory (which uses ttm_tt 
>>> and might be shmem underneath) or local-memory. But perhaps i915 is 
>>> doing something wrong here, or abusing TTM in some way. I'm not sure 
>>> tbh.
>>>
>>> Anyway, I think we have two cases here:
>>>
>>> - We have some system memory only object. After doing 
>>> i915_ttm_shrink(), bo->resource is now NULL. We then call 
>>> ttm_bo_validate() at some later point, but here we don't need to 
>>> copy anything, but it also looks like ttm_bo_handle_move_mem() won't 
>>> populate the ttm_tt or us either, since mem_type == TTM_PL_SYSTEM. 
>>> It looks like i915_ttm_move() was taking care of this, but now we 
>>> just call ttm_bo_move_null().
>>>
>>> - We have a local-memory only object, which was evicted to shmem, 
>>> and then swapped out by the shrinker like above. The bo->resource is 
>>> NULL. However this time when calling ttm_bo_validate() we need to 
>>> actually do a copy in i915_ttm_move(), as well as re-populate the 
>>> ttm_tt. i915_ttm_move() was taking care of this, but now we just 
>>> call ttm_bo_move_null().
>>>
>>> Perhaps i915 is doing something wrong in the above two cases?
>>
>> Mhm, as far as I can see that should still work.
>>
>> See previously you should got a transition from SYSTEM->GTT in 
>> i915_ttm_move() to re-create your backing store. Not you get 
>> NULL->SYSTEM which is handled by ttm_bo_move_null() and then 
>> SYSTEM->GTT.
>
> What is GTT here in TTM world? Also I'm not seeing where there is this 
> SYSTEM->GTT transition? Maybe I'm blind. Just to be clear, i915 is 
> only calling ttm_bo_validate() once when acquiring the pages, and we 
> don't call it again, unless it was evicted (and potentially swapped out).

Well GTT means TTM_PL_TT.

And calling it only once is perfectly fine, TTM will internally see that 
we need two hops to reach TTM_PL_TT and so does the NULL->SYSTEM 
transition and then SYSTEM->TT.

As far as I can see that should work like it did before.

Christian.

>
>>
>> If you just validated to SYSTEM memory before I think the tt object 
>> wouldn't have been populated either.
>>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>>>
>>>>>>
>>>>>> I've been considering to replacing the ttm_bo_type with a bunch 
>>>>>> of behavior flags for a bo. I'm hoping that this will clean 
>>>>>> things up a bit.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>>>>       caching = i915_ttm_select_tt_caching(obj);
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>>>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>>>> index 9a7e50534b84bb..c420d1ab605b6f 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>>>> @@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object 
>>>>>>>>> *bo, bool evict,
>>>>>>>>>       bool clear;
>>>>>>>>>       int ret;
>>>>>>>>> -    if (GEM_WARN_ON(!obj)) {
>>>>>>>>> +    if (GEM_WARN_ON(!obj) || !bo->resource) {
>>>>>>>>>           ttm_bo_move_null(bo, dst_mem);
>>>>>>>>>           return 0;
>>>>>>>>>       }
>>>>>>>>
>>>>>>
>>>>
>>

