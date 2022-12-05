Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1065C64298F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 14:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1971910E230;
	Mon,  5 Dec 2022 13:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9265410E211;
 Mon,  5 Dec 2022 13:39:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwngNbjfpEz1zArLem2DrHPbG9QR/nJ0OBucFe1Y5Ojz+CVYqfO9+or+4tYoVhbsswGt5BehPSXm8eon6mpIxIvdfhakurvYXSyuY+x+42WFg23Z9e5TIkU86FE/Uy9t0QRUjazLN1kjTxDwlXF7lmtw4kk3jFUdhq/RcfQ0UR3492/kYp3e9/0/gKaxNCzcIDE+U//4jQPqV1DSJQ5/YFrUlZhI1wWM7IXVyhlkL/e6HHhpF579iQn3+LtYPfPscnY8/ZFpBoujfp4grOmdCxPyQypMLIwNrIh5HmffoZARJtth6Wjw+UHb99G1RmU/MtOZITm7wlVKWA4Zy2yymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14R2V23rhRLej+iPs7wGFMnHd+sKfKuofvRyBBooXZw=;
 b=ni1w4X//uD+ixnqTjwiMaF9PNDSB6g2Vz5+GFFuQeSh7/EzG0KW9reywbJD+c29uWBzc8InxaxfuREwK4Ba+8ixnHyfFOPONIBQjJ5O7q/IyU4CcPYofVRERBQIbF+aJHAzYPgcR7M1zJyoKSRs5ZcsEXjXdq3JB89A3B6BemxQZn5l4poFuSCxh8tK5XKqOMs3yBaZqZS2LQ01cviU3br7ujMs1umnMuCTFde83JnEVOtCIQGzWRXmCZ3EZqhlJTnA7RxTcDpdyZi3TyYYLHxr6/Dalx52VYKECjeTbv8mwVZdgEZHWmRqu8EOLceNRpGa1B97iRVTRNuJdpykBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14R2V23rhRLej+iPs7wGFMnHd+sKfKuofvRyBBooXZw=;
 b=24W3AlOHU2WR5b8RfkZO20Fy+Bv7FYvztEAXgFpxQi5R+88ShdrRzlCvkTUZoJS15+4FL05CNkNpJ9CtptS+dVChz1b87kR/TUXCnBUI8zmuNlNfKcI/U5QegPGH30WJ6vvlyCzlfb5rcMjwSe1Bwv7APpvwIJNb2oAPTH7uw+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7160.namprd12.prod.outlook.com (2603:10b6:510:228::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 13:39:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 13:39:47 +0000
Message-ID: <a7c5f157-ff42-4e87-cc79-33ba6a15a138@amd.com>
Date: Mon, 5 Dec 2022 14:39:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/9] drm/ttm: use per BO cleanup workers
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-3-christian.koenig@amd.com>
 <8ff841e3-8eef-9ec2-2ba5-4907f18873c0@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <8ff841e3-8eef-9ec2-2ba5-4907f18873c0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ea4cec-a4b0-496f-2656-08dad6c62bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rEzjOFTLdgB8kg2d29PuBN5Ao2rNE4NFB3z4+RsOsIFHynK+dK5xJCT5PQA2GjeGzi42hEzhFbfo2K2Ni7ZxA89TvL09xC498YD+Mp9iYdGlN6VADaJqi+X4C//Ml67PtYtLKFur6vkT6W7vq198gW5jBrlDxEDmgbEIwawliKA2O7pn/N6O76k7BkZ18f7TU9iRtzZuG3DYBKJ9ybG56QPJ8Ngvdn/MWB8Vr1AkfN8vKXUnkfnP2roM8aNCRQcG6qoktTzRcMRqBikGTaj0HHSSAEho2A1oK627xg3QC7PLKRW/G3D4tw9PQl3HrqDlpTlMbjXv9MuzY+LOcnKQEkUV07q38KPmTnogEpo056cvygLlccanFCOTBx9S161kBCwTa6A83qLLU7tAd+JuCi9D2oTk049WbqD1VQfUGcIKGs5+wYtQfSB9NtD5+nAVqG7HptgU2Q2xJvGZRNHEXTjMFluyXtbG41FXblqTHylVX2bq9E8Dc8IvA5dpEUYQLLzL+bWjziV2dRRfh/rE33x/9SGGgeQTvGONczqQzxY+3s4b6aYqh17IXtbgBLWYQHUtMv1D0EXi7t8EAUb0PSrspl1WpFZkuX0QttGNqd225X/k5K1y5zMtDctk4lFk+Tkjjhy5pyQxqUW3JqYKby1IMHyDKv/nuW/bEj1RudOexEwuX95IoRVrfkaC8aTprN6U7ryjNyWqSS1gQ7tO9XNFGrcIyNkazlpUsfXjNQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(36756003)(66574015)(316002)(6486002)(6512007)(53546011)(6506007)(6666004)(186003)(110136005)(2906002)(4001150100001)(31696002)(86362001)(83380400001)(66556008)(66476007)(31686004)(38100700002)(8676002)(66946007)(41300700001)(2616005)(478600001)(450100002)(5660300002)(8936002)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlJkR2Zja0RLOE5QMWRFREpxQWcxc3dhQ2JldHBXN2MzTUdRSno2aCsybGNv?=
 =?utf-8?B?UnpsZGFsQWFqdDlGU0pQRlRxc1BkS1AwUCsyNkFzK1dxQW5FNWFKMDFIb2t1?=
 =?utf-8?B?eWM5Q1JCam1pWWJtWDJPREI5SjdxcGlzdlJFdnhZS1hRM1VSekM0YkJPd294?=
 =?utf-8?B?VzVuYVUrNGpuRjJZUi9iOUMwdU1meUI0Q3Y2UDJld05pdXV1WFB4cEpSb1Zx?=
 =?utf-8?B?M3VVS0NmQ24wcUlYV1ByamZJTHVodkJsR2VMSi9WOEZJekVPOXNXZzQyUDk5?=
 =?utf-8?B?UkZEZFpMbTV6Mmd1Zmk2dk5JcHhHL2tuZnBBL0oyc0QyRm0zczdYMzg4OGNU?=
 =?utf-8?B?aWlpWmZrVThvY0JlR3o0N0lPMFIyVldwbC9LMjl6Ujlmbi83MEZvakZzRW5C?=
 =?utf-8?B?eFJlSGpNZ0RYcEZ1SEtxS1k5NlppVDZXVyt6YnJCYVdzb0dINTRZa1o5UVV1?=
 =?utf-8?B?UDhRTUdPMWVEQnU1VE1VeVQ0RHhyR2VscTNUNkJpd3RsSldBdjRlTUhOQ2lj?=
 =?utf-8?B?cDhiYVl2NjFqUmliSUtrN09HT1NGNGpGeUdlV0YzMGlHNExTUWVXYVZkMVg4?=
 =?utf-8?B?eUJYbGVlbW1NODdrbUp6eW5IODJyRjR5L005ZTZhTVdVK0tDeHdHbDNMQXUv?=
 =?utf-8?B?NXhUZXZoQnRqbWhwdjBBVnV0SWNCeUhmS1VtOGxtNUlKb1ZzS0F4WmsvcjZJ?=
 =?utf-8?B?bWF6V2RmK29wSGZjT1hOeUJXZit2V2R6Q3lQVTVrVzg1OFB3WVdYS1kvYzBh?=
 =?utf-8?B?N3hUcGgwam0yVk95ZjVHVjdmR2hVdERSb0VIVHQxR3J1eG5HazlKcnBiQTRp?=
 =?utf-8?B?ai9CMks2MXZkNjdsR3UwNkF0cUdFT3p3SThqdXBQN0VqdENuRkJURGdIa3ZN?=
 =?utf-8?B?eFNxOWc1cnhNeUx4cENBYS8rYjVZcHl4bmtOWC9FcU5rRlpEZjgzVFFwdnpQ?=
 =?utf-8?B?N2NOclJRaGhDaFhEMDhQRnFwODdjSnFSOW1HK2RGVVo1VC95V292dERNRWts?=
 =?utf-8?B?NmhhZVdKNmtacHRJa0xseDdJR1pFbjFrcE9sUGo3Y2tGMGloS3dvZ1ltSisz?=
 =?utf-8?B?QVh3NHRnYWFaMTdORitGTWJjOUhxamF5eS8xT3BvNmlBb2dSRG5tdGtSZXla?=
 =?utf-8?B?UGR4S0lRU2FKd1FLM0ROZU5HTzI5YnAyenRFMmVXV0lTUkFLL3dIU0pFMUo4?=
 =?utf-8?B?bVZ6K2lXQnRiSVMwMFl3TTBzUnJBZW1aSXdoNkFzaVowSW1ydTN0U1BSK2I3?=
 =?utf-8?B?dloyUXlOOC9QRGh0Rml2QzJIRFg2N1ZEcjlSeHJPazF2dlRNRklnWUZJS21D?=
 =?utf-8?B?bXltcWt2K2tQQTZtZWoyT2gxbVM1aGZ2SklLUVZXRFF5Z1F1cS92dzhidENZ?=
 =?utf-8?B?MUhHd3RobFBGbjVvWmNTNzBiWWwyang2VWRzRnhmaFZGaHl1eE9maENmNnBT?=
 =?utf-8?B?UStSUFV0L2FCTGVYWmNKeGdnLy9YaStzaXJYTFVqK3U1OEkzc2J0NnFhM3ZW?=
 =?utf-8?B?MmpBdVpDejNWTkhDaEwxb3crQzQybW1DR1Bia0Vrd2FNZjlpWituQ2VtdDlJ?=
 =?utf-8?B?bTAvVDFCeWsvTWRGUzBRV1hCQjlMVC9uSVNsKzN4NU45aW81NUNOL2EzdEl4?=
 =?utf-8?B?Qks1UmNDWmZaWlp4akwvZTg5TExGVGZ4ZHptWkpJSURzN2FCc3NUdXFEYnZR?=
 =?utf-8?B?TUdHVzhiN2xWWEdDUTRHMXZEbWJiVWJhTlUrUDJFUEpNcUUxMHBxRHVuZ2Rq?=
 =?utf-8?B?NGYrQXBNVzA0cmhNSm5EWW9oS05VaStXNENGMVR1UTFTbmFMcUdDaVNDMlJu?=
 =?utf-8?B?T0hyVm9ndVoyeGRrcE9KbXp3VTIyRkVaRzByMGQ1bXdqTjJNcWtiaXZGVEVE?=
 =?utf-8?B?NjM3b1hVL1hZYjByRngxQlpwMEFpNmllQVRVYlM1dWpjK3dSOGJuQThldmRs?=
 =?utf-8?B?Y0dobldUV2FZakVxZTNFdnc2VElzRDhWRnQwTWdpYTFZWHBtY1JwM1JtVFpN?=
 =?utf-8?B?QVljNWt4bURJU0hzOVhwM1owR3phZURNREpNNGlPRVRmS1ZKWGFBTXdaOWY5?=
 =?utf-8?B?VjQzVTMvNCtSNXowWVIyZFUrbzBZY3E0WmZMMW8yU0U1aFJ1d0pEb3hsdzJa?=
 =?utf-8?B?TzgrdmllSHpYNGRkKzVJNi93bndkZ2huU0FlenNpOXJvbWRXT3ZkZ2ozNnND?=
 =?utf-8?Q?W2FUzXiJu5NANVHOdHbTTLvK+8g+PKeYsrRyfe9+ZfaB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ea4cec-a4b0-496f-2656-08dad6c62bb2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 13:39:46.9121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Re9rc42eldM2muKNzhuVZeAhCwjddeQBCf5x+d+bG1PkbhQyOwY929xrYOeiapxh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7160
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

Am 29.11.22 um 22:14 schrieb Felix Kuehling:
> On 2022-11-25 05:21, Christian König wrote:
>> Instead of a single worker going over the list of delete BOs in regular
>> intervals use a per BO worker which blocks for the resv object and
>> locking of the BO.
>>
>> This not only simplifies the handling massively, but also results in
>> much better response time when cleaning up buffers.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>
> Just thinking out loud: If I understand it correctly, this can cause a 
> lot of sleeping worker threads when 
> AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE is used and many BOs are freed 
> at the same time. This happens e.g. when a KFD process terminates or 
> crashes. I guess with a concurrency-managed workqueue this isn't going 
> to be excessive. And since it's on a per device workqueue, it doesn't 
> stall work items on the system work queue or from other devices.

Yes, exactly that. The last parameter to alloc_workqueue() limits how 
many work items can be sleeping.

> I'm trying to understand why you set WQ_MEM_RECLAIM. This work queue 
> is not about freeing ttm_resources but about freeing the BOs. But it 
> affects freeing of ghost_objs that are holding the ttm_resources being 
> freed.

Well if the BO is idle, but not immediately lockable we delegate freeing 
the backing pages in the TT object to those workers as well. It might 
even be a good idea to use a separate wq for this case.

>
> If those assumptions all make sense, patches 1-3 are
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Thanks,
Christian.

>
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>>   drivers/gpu/drm/i915/i915_gem.c            |   2 +-
>>   drivers/gpu/drm/i915/intel_region_ttm.c    |   2 +-
>>   drivers/gpu/drm/ttm/ttm_bo.c               | 112 ++++++++-------------
>>   drivers/gpu/drm/ttm/ttm_bo_util.c          |   1 -
>>   drivers/gpu/drm/ttm/ttm_device.c           |  24 ++---
>>   include/drm/ttm/ttm_bo_api.h               |  18 +---
>>   include/drm/ttm/ttm_device.h               |   7 +-
>>   8 files changed, 57 insertions(+), 111 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 2b1db37e25c1..74ccbd566777 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3984,7 +3984,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device 
>> *adev)
>>       amdgpu_fence_driver_hw_fini(adev);
>>         if (adev->mman.initialized)
>> -        flush_delayed_work(&adev->mman.bdev.wq);
>> +        drain_workqueue(adev->mman.bdev.wq);
>>         if (adev->pm_sysfs_en)
>>           amdgpu_pm_sysfs_fini(adev);
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c 
>> b/drivers/gpu/drm/i915/i915_gem.c
>> index 8468ca9885fd..c38306f156d6 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -1099,7 +1099,7 @@ void i915_gem_drain_freed_objects(struct 
>> drm_i915_private *i915)
>>   {
>>       while (atomic_read(&i915->mm.free_count)) {
>>           flush_work(&i915->mm.free_work);
>> -        flush_delayed_work(&i915->bdev.wq);
>> +        drain_workqueue(i915->bdev.wq);
>>           rcu_barrier();
>>       }
>>   }
>> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c 
>> b/drivers/gpu/drm/i915/intel_region_ttm.c
>> index cf89d0c2a2d9..657bbc16a48a 100644
>> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
>> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
>> @@ -132,7 +132,7 @@ int intel_region_ttm_fini(struct 
>> intel_memory_region *mem)
>>               break;
>>             msleep(20);
>> -        flush_delayed_work(&mem->i915->bdev.wq);
>> +        drain_workqueue(mem->i915->bdev.wq);
>>       }
>>         /* If we leaked objects, Don't free the region causing use 
>> after free */
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index b77262a623e0..4749b65bedc4 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -280,14 +280,13 @@ static int ttm_bo_cleanup_refs(struct 
>> ttm_buffer_object *bo,
>>           ret = 0;
>>       }
>>   -    if (ret || unlikely(list_empty(&bo->ddestroy))) {
>> +    if (ret) {
>>           if (unlock_resv)
>>               dma_resv_unlock(bo->base.resv);
>>           spin_unlock(&bo->bdev->lru_lock);
>>           return ret;
>>       }
>>   -    list_del_init(&bo->ddestroy);
>>       spin_unlock(&bo->bdev->lru_lock);
>>       ttm_bo_cleanup_memtype_use(bo);
>>   @@ -300,47 +299,21 @@ static int ttm_bo_cleanup_refs(struct 
>> ttm_buffer_object *bo,
>>   }
>>     /*
>> - * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
>> - * encountered buffers.
>> + * Block for the dma_resv object to become idle, lock the buffer and 
>> clean up
>> + * the resource and tt object.
>>    */
>> -bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
>> +static void ttm_bo_delayed_delete(struct work_struct *work)
>>   {
>> -    struct list_head removed;
>> -    bool empty;
>> -
>> -    INIT_LIST_HEAD(&removed);
>> -
>> -    spin_lock(&bdev->lru_lock);
>> -    while (!list_empty(&bdev->ddestroy)) {
>> -        struct ttm_buffer_object *bo;
>> -
>> -        bo = list_first_entry(&bdev->ddestroy, struct 
>> ttm_buffer_object,
>> -                      ddestroy);
>> -        list_move_tail(&bo->ddestroy, &removed);
>> -        if (!ttm_bo_get_unless_zero(bo))
>> -            continue;
>> -
>> -        if (remove_all || bo->base.resv != &bo->base._resv) {
>> -            spin_unlock(&bdev->lru_lock);
>> -            dma_resv_lock(bo->base.resv, NULL);
>> -
>> -            spin_lock(&bdev->lru_lock);
>> -            ttm_bo_cleanup_refs(bo, false, !remove_all, true);
>> -
>> -        } else if (dma_resv_trylock(bo->base.resv)) {
>> -            ttm_bo_cleanup_refs(bo, false, !remove_all, true);
>> -        } else {
>> -            spin_unlock(&bdev->lru_lock);
>> -        }
>> +    struct ttm_buffer_object *bo;
>>   -        ttm_bo_put(bo);
>> -        spin_lock(&bdev->lru_lock);
>> -    }
>> -    list_splice_tail(&removed, &bdev->ddestroy);
>> -    empty = list_empty(&bdev->ddestroy);
>> -    spin_unlock(&bdev->lru_lock);
>> +    bo = container_of(work, typeof(*bo), delayed_delete);
>>   -    return empty;
>> +    dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, 
>> false,
>> +                  MAX_SCHEDULE_TIMEOUT);
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +    ttm_bo_cleanup_memtype_use(bo);
>> +    dma_resv_unlock(bo->base.resv);
>> +    ttm_bo_put(bo);
>>   }
>>     static void ttm_bo_release(struct kref *kref)
>> @@ -369,44 +342,40 @@ static void ttm_bo_release(struct kref *kref)
>>             drm_vma_offset_remove(bdev->vma_manager, 
>> &bo->base.vma_node);
>>           ttm_mem_io_free(bdev, bo->resource);
>> -    }
>> -
>> -    if (!dma_resv_test_signaled(bo->base.resv, 
>> DMA_RESV_USAGE_BOOKKEEP) ||
>> -        !dma_resv_trylock(bo->base.resv)) {
>> -        /* The BO is not idle, resurrect it for delayed destroy */
>> -        ttm_bo_flush_all_fences(bo);
>> -        bo->deleted = true;
>>   -        spin_lock(&bo->bdev->lru_lock);
>> +        if (!dma_resv_test_signaled(bo->base.resv,
>> +                        DMA_RESV_USAGE_BOOKKEEP) ||
>> +            !dma_resv_trylock(bo->base.resv)) {
>> +            /* The BO is not idle, resurrect it for delayed destroy */
>> +            ttm_bo_flush_all_fences(bo);
>> +            bo->deleted = true;
>>   -        /*
>> -         * Make pinned bos immediately available to
>> -         * shrinkers, now that they are queued for
>> -         * destruction.
>> -         *
>> -         * FIXME: QXL is triggering this. Can be removed when the
>> -         * driver is fixed.
>> -         */
>> -        if (bo->pin_count) {
>> -            bo->pin_count = 0;
>> -            ttm_resource_move_to_lru_tail(bo->resource);
>> -        }
>> +            spin_lock(&bo->bdev->lru_lock);
>>   -        kref_init(&bo->kref);
>> -        list_add_tail(&bo->ddestroy, &bdev->ddestroy);
>> -        spin_unlock(&bo->bdev->lru_lock);
>> +            /*
>> +             * Make pinned bos immediately available to
>> +             * shrinkers, now that they are queued for
>> +             * destruction.
>> +             *
>> +             * FIXME: QXL is triggering this. Can be removed when the
>> +             * driver is fixed.
>> +             */
>> +            if (bo->pin_count) {
>> +                bo->pin_count = 0;
>> +                ttm_resource_move_to_lru_tail(bo->resource);
>> +            }
>>   -        schedule_delayed_work(&bdev->wq,
>> -                      ((HZ / 100) < 1) ? 1 : HZ / 100);
>> -        return;
>> -    }
>> +            kref_init(&bo->kref);
>> +            spin_unlock(&bo->bdev->lru_lock);
>>   -    spin_lock(&bo->bdev->lru_lock);
>> -    list_del(&bo->ddestroy);
>> -    spin_unlock(&bo->bdev->lru_lock);
>> +            INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
>> +            queue_work(bdev->wq, &bo->delayed_delete);
>> +            return;
>> +        }
>>   -    ttm_bo_cleanup_memtype_use(bo);
>> -    dma_resv_unlock(bo->base.resv);
>> +        ttm_bo_cleanup_memtype_use(bo);
>> +        dma_resv_unlock(bo->base.resv);
>> +    }
>>         atomic_dec(&ttm_glob.bo_count);
>>       bo->destroy(bo);
>> @@ -946,7 +915,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, 
>> struct ttm_buffer_object *bo,
>>       int ret;
>>         kref_init(&bo->kref);
>> -    INIT_LIST_HEAD(&bo->ddestroy);
>>       bo->bdev = bdev;
>>       bo->type = type;
>>       bo->page_alignment = alignment;
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index ba3aa0a0fc43..ae4b7922ee1a 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -230,7 +230,6 @@ static int ttm_buffer_object_transfer(struct 
>> ttm_buffer_object *bo,
>>        */
>>         atomic_inc(&ttm_glob.bo_count);
>> -    INIT_LIST_HEAD(&fbo->base.ddestroy);
>>       drm_vma_node_reset(&fbo->base.base.vma_node);
>>         kref_init(&fbo->base.kref);
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index e7147e304637..e9bedca4dfdc 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -175,16 +175,6 @@ int ttm_device_swapout(struct ttm_device *bdev, 
>> struct ttm_operation_ctx *ctx,
>>   }
>>   EXPORT_SYMBOL(ttm_device_swapout);
>>   -static void ttm_device_delayed_workqueue(struct work_struct *work)
>> -{
>> -    struct ttm_device *bdev =
>> -        container_of(work, struct ttm_device, wq.work);
>> -
>> -    if (!ttm_bo_delayed_delete(bdev, false))
>> -        schedule_delayed_work(&bdev->wq,
>> -                      ((HZ / 100) < 1) ? 1 : HZ / 100);
>> -}
>> -
>>   /**
>>    * ttm_device_init
>>    *
>> @@ -215,15 +205,19 @@ int ttm_device_init(struct ttm_device *bdev, 
>> struct ttm_device_funcs *funcs,
>>       if (ret)
>>           return ret;
>>   +    bdev->wq = alloc_workqueue("ttm", WQ_MEM_RECLAIM | WQ_HIGHPRI, 
>> 16);
>> +    if (!bdev->wq) {
>> +        ttm_global_release();
>> +        return -ENOMEM;
>> +    }
>> +
>>       bdev->funcs = funcs;
>>         ttm_sys_man_init(bdev);
>>       ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
>>         bdev->vma_manager = vma_manager;
>> -    INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
>>       spin_lock_init(&bdev->lru_lock);
>> -    INIT_LIST_HEAD(&bdev->ddestroy);
>>       INIT_LIST_HEAD(&bdev->pinned);
>>       bdev->dev_mapping = mapping;
>>       mutex_lock(&ttm_global_mutex);
>> @@ -247,10 +241,8 @@ void ttm_device_fini(struct ttm_device *bdev)
>>       list_del(&bdev->device_list);
>>       mutex_unlock(&ttm_global_mutex);
>>   -    cancel_delayed_work_sync(&bdev->wq);
>> -
>> -    if (ttm_bo_delayed_delete(bdev, true))
>> -        pr_debug("Delayed destroy list was clean\n");
>> +    drain_workqueue(bdev->wq);
>> +    destroy_workqueue(bdev->wq);
>>         spin_lock(&bdev->lru_lock);
>>       for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>> index 7758347c461c..69e62bbb01e3 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -92,7 +92,6 @@ struct ttm_tt;
>>    * @ttm: TTM structure holding system pages.
>>    * @evicted: Whether the object was evicted without user-space 
>> knowing.
>>    * @deleted: True if the object is only a zombie and already deleted.
>> - * @ddestroy: List head for the delayed destroy list.
>>    * @swap: List head for swap LRU list.
>>    * @offset: The current GPU offset, which can have different meanings
>>    * depending on the memory type. For SYSTEM type memory, it should 
>> be 0.
>> @@ -135,19 +134,14 @@ struct ttm_buffer_object {
>>       struct ttm_tt *ttm;
>>       bool deleted;
>>       struct ttm_lru_bulk_move *bulk_move;
>> +    unsigned priority;
>> +    unsigned pin_count;
>>         /**
>> -     * Members protected by the bdev::lru_lock.
>> -     */
>> -
>> -    struct list_head ddestroy;
>> -
>> -    /**
>> -     * Members protected by a bo reservation.
>> +     * @delayed_delete: Work item used when we can't delete the BO
>> +     * immediately
>>        */
>> -
>> -    unsigned priority;
>> -    unsigned pin_count;
>> +    struct work_struct delayed_delete;
>>         /**
>>        * Special members that are protected by the reserve lock
>> @@ -448,8 +442,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>>     int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>                void *buf, int len, int write);
>> -bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>> -
>>   vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
>>     #endif
>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
>> index 95b3c04b1ab9..4f3e81eac6f3 100644
>> --- a/include/drm/ttm/ttm_device.h
>> +++ b/include/drm/ttm/ttm_device.h
>> @@ -251,11 +251,6 @@ struct ttm_device {
>>        */
>>       spinlock_t lru_lock;
>>   -    /**
>> -     * @ddestroy: Destroyed but not yet cleaned up buffer objects.
>> -     */
>> -    struct list_head ddestroy;
>> -
>>       /**
>>        * @pinned: Buffer objects which are pinned and so not on any 
>> LRU list.
>>        */
>> @@ -270,7 +265,7 @@ struct ttm_device {
>>       /**
>>        * @wq: Work queue structure for the delayed delete workqueue.
>>        */
>> -    struct delayed_work wq;
>> +    struct workqueue_struct *wq;
>>   };
>>     int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t 
>> gfp_flags);

