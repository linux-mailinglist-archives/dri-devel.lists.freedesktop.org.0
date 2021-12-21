Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A352E47BA6D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 08:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE79110E43D;
	Tue, 21 Dec 2021 07:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2072.outbound.protection.outlook.com [40.107.102.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE6910E43D;
 Tue, 21 Dec 2021 07:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fD1EdA4XknwKucdZF8IcVSSdfzmDXfsuHW1V470+zFX3imxtN/b4Wh1L6h+j+v3vPAbyUtK5CYeehCLZxNPpV7QBbXvsYVXpTACeL1yswk559zgfAri7RoUVTkbC2WQvHYDWIz0SR/wNXI62Y2fm/bBPhH53Rw4KPiNS1GIPNn4HzH0miFvLHr4L3DsVGzJ9CPQwKIaTKljmZr7sjiC73IFYu/+gUQLN1ngrvKoZS3j5zfylyHTBf4MiQ2HYYKZaOtDBmsTApxk6o4HaVb6UyY0fjnB4n1C4kU+y2PbvDbQeOmYgAqTmR1Zl3PJ+MMN6CBlTMchU/GWtsXw9zsDOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1gOabUEzEctbH0dzQHG/Mm9Xz2bVKjndinnqg7vmfA=;
 b=XG1JjOKuOe5bkxEZY5xtCL5SQ0LEg2+8fZyrz4B6gOfIGVINQUvHfGEMdwb0qynr7Q0ZKPcsul6bm3w8qPInA+2GlSh5ULJe1twY8U1d646c+XuOIkHLelVceHrBxzLyn9+2WOjbWWDW/yPTdtTxgUBTj4B0jyffUzAVwDLcEF6gMOrV6C6Xdv+7dBKdihRi/YRuue1lPf+wBmnfJbTHZfOqfxRVGiCRjLAhsmoawptqs9GGanC4EVdx7+7KYVRRzmHc7dPETGllHgW+r8tHLLiLWfuZNVAMIqHHiKnXzDgMwVqhzwCxVhaEP2Qh2BB/yBdAeGj9t2qS0ENIheNRWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1gOabUEzEctbH0dzQHG/Mm9Xz2bVKjndinnqg7vmfA=;
 b=tj27HFrnmzNIzkm3n0URQ9F3ZS9dXzi8yUvMfMSFv3NqA3vac47uK+r2EItDroGJuYUpTF1LsDhOD9W3qoCcTvDJvAnc79M9Ett1w740opFEYw/takXdf+cj1DUyM0Ns3Ah8ApEjQlmmYtrD6G0wYLyxXezYbDiFstv1I5VxnkU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0191.namprd12.prod.outlook.com
 (2603:10b6:301:56::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 07:05:16 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4801.020; Tue, 21 Dec
 2021 07:05:16 +0000
Subject: Re: [RFC 2/6] drm/amdgpu: Move scheduler init to after XGMI is ready
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-3-andrey.grodzovsky@amd.com>
 <d7872062-e99a-03be-c52e-d27a7022de09@gmail.com>
 <98c9e91d-adb8-3ee9-7c4c-567c214c34a9@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <42944d1a-efc1-87fe-20bb-466cfc9ad9a0@amd.com>
Date: Tue, 21 Dec 2021 08:05:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <98c9e91d-adb8-3ee9-7c4c-567c214c34a9@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e02ba9f9-0074-4a43-655b-08d9c4503dbc
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0191:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB019189276EF6ACEF36E43FCA837C9@MWHPR1201MB0191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WDqDi+b0D2KRMpBdTXhEIjqY/x3uPhBHCT5oHkDWlD4onQFknGE4y9b4rd28gg/3kipo5r0cyXpFk/vxg34qGtd6G87JhhgXI3CgSEHKbxOxSAj9nX7FieTzG6A11xuJo8LUY9Uu6k+RNjGqnFf2sSkMkFYg9JbUfZNypQfdwYTe7JRTBH0aEOknk65S/yQ9CewI19ckVoGPg77iv/zAjoS3QsVKyjHx7g462ynTS6MGJTdUe4EHuP1JNdFkkdMQ5kTClm9agkdnhvDVveW5lV1q7QAbq4jkWzb5+79WiEcKQPkW73ZwnMIbs5Gqs3luzCCHzTvn8sP+78MQi7cBIlkr7tk0Xlrr+9Wc821BOL2cYa5fWxQPpoqFUUDgK8Zv/ojn5LnQMHAHu8trdpjLJ/mzQ5w1pBUV8LMD98Sv9vxD4YigB8JchhE709lCeyLcFn8JOjoQSPMJLvIUupm9Mz75JnS6IHb/8zOGhZv7EVcCBW9u7l+ldcHGa1f/fYxLvIAEStHkMGK1RGrV9mGPueNqfdhZNx7QiEdrEICrQPLNk8bk6kkkoC5K0YmY+IINmhbvFEn8HFkeQVsSW7MyCdX5VyBhBUjuagTbKlhyACd8a5cAKpdvLb0U5/e7nTIPkw9kJyeoOt2z/uNcBdQE0uMmQCz4LjJSYNrhYE5YtLWKI/rGOE9w9vi7JwUfmNwMHzkDhTnjbu+RJGvWXqi1W1/B1cLSxszokrvbhoig172b68UEr7oyyETVOHZJR+0d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(66556008)(66476007)(66946007)(83380400001)(6666004)(38100700002)(4326008)(6486002)(6512007)(110136005)(53546011)(8676002)(36756003)(5660300002)(31696002)(4001150100001)(316002)(8936002)(2906002)(86362001)(508600001)(26005)(66574015)(6506007)(186003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlVJVGpRVG5uT3Zqdm1oRTlXalc3OW9LNDlUNFNmQzBVWnpndUcxMFZHdTRI?=
 =?utf-8?B?RGhHRTF4MzlXT2ZkZjJFYkU0akpLU0trU1VTUkVFaW1uMGJQSXgxZERzZ1ZM?=
 =?utf-8?B?VHF0OThLOENoQ0graDk4UElLMzY2UEdRY3BwU0FJeDluc2luQ0phSkFhaytq?=
 =?utf-8?B?N3E4TGU3NW9UTE9uaVRlcE5hcU0vTEs3d0JjeXlqYklPK3ZjeHNyQ2x3UVYy?=
 =?utf-8?B?M21wMHNBUENjRG9GVVFjSGpLNkdYRXhBS3dzU0trWS9ZR2JIYWVNWmxHRVJF?=
 =?utf-8?B?VDdmTkZLdm9NbjNhUktDS1FGVWNYdXgwM25iU25YaEl4bHJRckE2RTc0cDdZ?=
 =?utf-8?B?dE96aEhQRGNScjhDd1ppcmpuQWVxZDM5cXpZelVNMDhRbGpJRjBpRkJSK2VP?=
 =?utf-8?B?YU9QajVabEZlaDR2WXZuekt3QkJ3cWRYeUhQbXZUcjFkcFpOZ1hkSjNCVDht?=
 =?utf-8?B?QWlYc3pjQ2VEdWV4ZVpSdWRQYS9vcThtdkQzOWc2R2JpcHR1UmZkRExhRFBP?=
 =?utf-8?B?SDZmeU4yaHpBc2lTZk9PbFR1em00OE4xcURXdWI5NGUxbFh6ZzFvbDczMnkw?=
 =?utf-8?B?RkxlZ0RhSC9xZWhJanpYcTJadTByUTYyOVNFT296MGpkNWZaN09zMTBpd3Aw?=
 =?utf-8?B?SGQ4Yno5NHZJOUs1aDlibysyZ0w2NStkSktsbS9PWU9LS3lUNEpLMDkzWkpY?=
 =?utf-8?B?SG9yT1VDdGU5OWZ3ekR0bmUvRUhIYk4xankzM2RuU1cvTmRvelJVY3NRNDg5?=
 =?utf-8?B?dEFzaDVVaC9tTnJvTW9RVlhvWWhVUzNVWUpxY2V3NE40UFFITVE2TkpuODZG?=
 =?utf-8?B?ZlBrMlV6QWVYL3NQQU5HQ1A5Rnk2RWdDdTRXaWhHdkhod0JqbmNqZ1BnRzJS?=
 =?utf-8?B?emVKcU5HcVZHOVZua0RZQWZIZWM5R2trWHJHb3JaRzYxK2NqL2pvdmNZTzNl?=
 =?utf-8?B?WEd0cU9pS3JnK0NHcG5jUTc3Uy91VHlEYWdudnpLZ0YwRXBXaFFvYWZSU2xr?=
 =?utf-8?B?OGkyRytlc1dxelVFNTdzSjdEYmZFZWM4Q203d1ZUeDdxTHBJSkQ2NEZCejQr?=
 =?utf-8?B?anlxVHYzUzkwTXpxa2FTbC9nTThwWnlHSW1WdW1sMkdmT2xGQXEzMVJITHlM?=
 =?utf-8?B?N3ZHN2xqSnZnTjZtZi9DN3Bvc1g1dlJFdURXZzlXVXVBVVR5K0lmeEdwbzJ4?=
 =?utf-8?B?V0VYTEpFMHVxM252WEtDdUxkZVF5cGZwNDFFZmttRjVJNUhDVk9ZVFcwSXpP?=
 =?utf-8?B?eDZUYVFHTmp5NEk3ekd4NmptdFdvbVZKaktjc1o0T3FIeFZJS0tiT0FhWk5L?=
 =?utf-8?B?aEQ3U3hQUE1NN1dCN21nY3JuNU93SVBFS1dPNHJuZnZRSW5MdjRXU2JyY3Qr?=
 =?utf-8?B?cTdlRlc3L1NjcVNzTDhidlZid3QxS2RLc2JmN2VNc0JWcmoyeUExV1d2aUZ2?=
 =?utf-8?B?RHNadTJmNDNoL1hyaFhFVjhYMHdianF0TUtrejF0ZGZ3ZUJGQWt0bU9MK0hU?=
 =?utf-8?B?RTA4ZWcyNXVBYnloWVhKK1dGNURNUGVKOW9ONkh2b2FOcUR6eCtwNWJqOXA4?=
 =?utf-8?B?c1FybS9rbTArc2xYc0FLZnVvd2VWY1JuU1pjdC80eWVCMW0ydHZjTHZSVGdr?=
 =?utf-8?B?WmdqdG1GRERPSXFHS2VPcWJLV3lhOXI2WDNWc04rTGRvbjF4YngvTmRiNlpH?=
 =?utf-8?B?d0xZS0tRSUR0azNDVlNIYUNlaVpQeTNjRVpSeVdzNE1SczAzU0dVdmtVZ3po?=
 =?utf-8?B?dVJ6T25OeTNMdEJuWG9wMFpvZ1RrVHhiejBaWGpUQys3MFQzNGxnc2crYzhL?=
 =?utf-8?B?MXN6TUl3QTRnZzNXbGtKSlgzcDNJWmh6N3J3bndaUkg0MTdlSnRmV3VRUU1Y?=
 =?utf-8?B?bU5xL1g4VTZtZWQ4TUk4L2FVdTlRVFA2MVpIdzhTQ2Yvc084bXJ5eHdDekVD?=
 =?utf-8?B?bzJDK05QK1YyeFVnTVBhUS9DM2ZPU2ROeEx1bytNWTc3QWFPc0N4M3lNNHZQ?=
 =?utf-8?B?MGRLb1pJWkNab01YcnpmRHpFKy9NRmhlQ1NuMzJ2V0Z1L1lKdzFSZFU5L3hI?=
 =?utf-8?B?TnEvMUZaeTExMzY0bUoxS0ZhQzlDbld3UFRablNKVXAyOCt5eGJYR2JvWm9M?=
 =?utf-8?Q?4lC8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02ba9f9-0074-4a43-655b-08d9c4503dbc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 07:05:16.4509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI7w4v75tSjkNBYV2HqRbSOh6C/acfoLoDUFTDd8wRQ/8PJ3avrz3pRybpZ/y+KJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0191
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.12.21 um 22:51 schrieb Andrey Grodzovsky:
>
> On 2021-12-20 2:16 a.m., Christian König wrote:
>>
>>
>> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
>>> Before we initialize schedulers we must know which reset
>>> domain are we in - for single device there iis a single
>>> domain per device and so single wq per device. For XGMI
>>> the reset domain spans the entire XGMI hive and so the
>>> reset wq is per hive.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 
>>> ++++++++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
>>>   3 files changed, 51 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 5f13195d23d1..b595e6d699b5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2284,6 +2284,47 @@ static int amdgpu_device_fw_loading(struct 
>>> amdgpu_device *adev)
>>>       return r;
>>>   }
>>>   +static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>> +{
>>> +    long timeout;
>>> +    int r, i;
>>> +
>>> +    for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>> +        struct amdgpu_ring *ring = adev->rings[i];
>>> +
>>> +        /* No need to setup the GPU scheduler for rings that don't 
>>> need it */
>>> +        if (!ring || ring->no_scheduler)
>>> +            continue;
>>> +
>>> +        switch (ring->funcs->type) {
>>> +        case AMDGPU_RING_TYPE_GFX:
>>> +            timeout = adev->gfx_timeout;
>>> +            break;
>>> +        case AMDGPU_RING_TYPE_COMPUTE:
>>> +            timeout = adev->compute_timeout;
>>> +            break;
>>> +        case AMDGPU_RING_TYPE_SDMA:
>>> +            timeout = adev->sdma_timeout;
>>> +            break;
>>> +        default:
>>> +            timeout = adev->video_timeout;
>>> +            break;
>>> +        }
>>> +
>>
>>
>>> +        r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>> +                   ring->num_hw_submission, amdgpu_job_hang_limit,
>>> +                   timeout, adev->reset_domain.wq, 
>>> ring->sched_score, ring->name);
>>> +        if (r) {
>>> +            DRM_ERROR("Failed to create scheduler on ring %s.\n",
>>> +                  ring->name);
>>> +            return r;
>>> +        }
>>
>> Maybe better put that into amdgpu_ring.c. But not really a hard 
>> requirement, more a gut feeling.
>>
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +
>>>   /**
>>>    * amdgpu_device_ip_init - run init for hardware IPs
>>>    *
>>> @@ -2412,6 +2453,10 @@ static int amdgpu_device_ip_init(struct 
>>> amdgpu_device *adev)
>>>           }
>>>       }
>>>   +    r = amdgpu_device_init_schedulers(adev);
>>> +    if (r)
>>> +        goto init_failed;
>>> +
>>>       /* Don't init kfd if whole hive need to be reset during init */
>>>       if (!adev->gmc.xgmi.pending_reset)
>>>           amdgpu_amdkfd_device_init(adev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> index 3b7e86ea7167..5527c68c51de 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> @@ -456,8 +456,6 @@ int amdgpu_fence_driver_init_ring(struct 
>>> amdgpu_ring *ring,
>>>                     atomic_t *sched_score)
>>>   {
>>>       struct amdgpu_device *adev = ring->adev;
>>> -    long timeout;
>>> -    int r;
>>>         if (!adev)
>>>           return -EINVAL;
>>> @@ -477,36 +475,12 @@ int amdgpu_fence_driver_init_ring(struct 
>>> amdgpu_ring *ring,
>>>       spin_lock_init(&ring->fence_drv.lock);
>>>       ring->fence_drv.fences = kcalloc(num_hw_submission * 2, 
>>> sizeof(void *),
>>>                        GFP_KERNEL);
>>> -    if (!ring->fence_drv.fences)
>>> -        return -ENOMEM;
>>>   -    /* No need to setup the GPU scheduler for rings that don't 
>>> need it */
>>> -    if (ring->no_scheduler)
>>> -        return 0;
>>> +    ring->num_hw_submission = num_hw_submission;
>>> +    ring->sched_score = sched_score;
>>
>> Probably better to set that in the caller and drop the parameters 
>> from the amdgpu_fence_driver_init_ring() function completely.
>>
>> Christian.
>
>
> I noticed that at least num_hw_submission is validated within the 
> function so not sure we should then discard the parameters.

Good point. It also doesn't make sense to move this check up because the 
power of two requirement comes from the fences, doesn't it?

Ok in this case just keep it like it is.

Christian.

>
> Andrey
>
>
>>
>>>   -    switch (ring->funcs->type) {
>>> -    case AMDGPU_RING_TYPE_GFX:
>>> -        timeout = adev->gfx_timeout;
>>> -        break;
>>> -    case AMDGPU_RING_TYPE_COMPUTE:
>>> -        timeout = adev->compute_timeout;
>>> -        break;
>>> -    case AMDGPU_RING_TYPE_SDMA:
>>> -        timeout = adev->sdma_timeout;
>>> -        break;
>>> -    default:
>>> -        timeout = adev->video_timeout;
>>> -        break;
>>> -    }
>>> -
>>> -    r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>> -               num_hw_submission, amdgpu_job_hang_limit,
>>> -               timeout, NULL, sched_score, ring->name);
>>> -    if (r) {
>>> -        DRM_ERROR("Failed to create scheduler on ring %s.\n",
>>> -              ring->name);
>>> -        return r;
>>> -    }
>>> +    if (!ring->fence_drv.fences)
>>> +        return -ENOMEM;
>>>         return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> index 4d380e79752c..a4b8279e3011 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> @@ -253,6 +253,8 @@ struct amdgpu_ring {
>>>       bool            has_compute_vm_bug;
>>>       bool            no_scheduler;
>>>       int            hw_prio;
>>> +    unsigned         num_hw_submission;
>>> +    atomic_t        *sched_score;
>>>   };
>>>     #define amdgpu_ring_parse_cs(r, p, ib) 
>>> ((r)->funcs->parse_cs((p), (ib)))
>>

