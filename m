Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A1738550
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E809710E479;
	Wed, 21 Jun 2023 13:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA8D10E479;
 Wed, 21 Jun 2023 13:35:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9IilyOL6BAlM7iOQICqRoc/7pZeba1Y0WIjUQowoj6xhVR1WVysCHH5chH+FUvj8HUKmXB9ekDEK8dvxd+rQImrR8zvZ9pEdMJxTao82hB32p8rDwX40QzKXzyPvVnYP5QHwVBl4JRkDLkKJ2rEMbXrVAEfwqYoaFVfplw0drDA6B8xMqWTduSUZa9H9s02UaYBLEHkUbDsoVKZsAN2c3gT0cCftV0Q8KNV8EK/fdnP/pJr43NJEgaSazxBHaCjQC5BgZ9idLiGWFpjF5vD7xQjge8KLGhJYDauh04i75heyaCCtrQmYj0POI300Vth/cuCK2PfAEZmyFLA/JYrjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoCjHyzpCYDHv3ZeGN6O0J9wYHLDaJap0tOp9Xgc7Ak=;
 b=hkhkXtAmBfFG884v8+0QUw/6gR65xNGu56h3eGI1sXMF0pFlo5UsXoURo4dzOfOtnMkzU2WRKdOMKS2MjNR9x7aSgOv+abag56vN9vU+mCHHP+vsn2R+Sj0Pn8Xb4M86XSj+uzcc4k1s3T25pHeTKv0h3l95BmjwI/r3oVhRwTXv9rsxQWwuQYSDRtSmLU2j/brSQGpcayS+o5VEA2ijfREvXe/EiU+WsLncQnBq+A47BMxDjVSHxaCAd6M1bq3WkMKxVX2z6rtUdPuxcqFtq52k23ygGFJttqTkAaVdud7Er1lj4dxO7rTdaQs+f3CKP73Dwr5kRQMpfb838CvQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoCjHyzpCYDHv3ZeGN6O0J9wYHLDaJap0tOp9Xgc7Ak=;
 b=oPenNsdtiOxDbaT2RUpYLzdrp1RuVj3TiX6IpNDdwhm5UVkgLcdrvjbeH1cXCQGmbUBW+nhlHyKxWvje4gkNoPpLAhB0hlszzHc1LVbJeq4UwcCM5xhQlfunDvqgmYiREczLTOhd1aGmVmlYl5xUncuwcZzsaQf7/GitJDMPSwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 13:35:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 13:35:25 +0000
Message-ID: <3be67d45-03cb-292c-6399-ebc8562860e4@amd.com>
Date: Wed, 21 Jun 2023 15:35:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
 <20230617135434.7dd3a25d@collabora.com>
 <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
 <94f9393a-17fe-321d-c4e1-e12663dc3106@amd.com>
 <e8e93582-e741-564d-4d26-4e507ccb5906@shipmail.org>
 <4ca0aef0-824e-383a-95e3-72bb3685b567@amd.com>
 <2b8ec4e4-5442-952f-e699-300492f2b4f2@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2b8ec4e4-5442-952f-e699-300492f2b4f2@shipmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0c5979-f65f-4d45-b23a-08db725c5ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cT+othCKM6IrXZKg3rYVwV/iPXBQhLJnu+vy1oz36MHDT4Hzbecd3UrzTPWiwaoEGo8sYd+7pgViCtGO1A+pfs+5yAGZz2ekY50/mD9XmDjDWJpIkdfYxymwJSTmFFyq2OVPJLRmb8l9I2FRr6UE0g3dyc/Lk3zFWrjGxiFYJFbGtPQ4TUVav4VZvQQe1oaohpcplEu0gU/eKvvMdsjna6TikeM4hhJ8W5Z1VyoPNaRfQUx2Fwkr7gxVNW8jbxqslL8XrILP3cq0+0LqqnCIBHqpFiarYWRkJ8dh8N/oRHMrvm+tHcKdiut7zQfzxO8jjXasfA74eOdQ4z2MZI5B2qmxs1l3R8Mj+MZ8qx6Cr5xH7IGGZvsJpJzxUjuy5FqOg5dKuE6RNtxzfrzD6QeMCJEDpABCymQbN+5VWE8J2AOufcmvRGhKMn3mvf0TKmKDEV1BkwhwE5m2bxEoF6yGDUS2E1MbSgv6RuonpfhZoRne1QJPKQPR75gNiUfgwyoahu722voWtZLO9RY0haMDWYMBEeqfZO7/FJsXL2xdVRe2l+NT0skGCw4FHfqeXhQjXj+laZcWx+Z18jN3pzEluFEH86ZgqAMvSPO7jOeDae+J786KDklONLGJBL9Q79MRnwpZm7H5DDKhuEWH85j7Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199021)(31686004)(6666004)(478600001)(110136005)(4326008)(66574015)(83380400001)(2616005)(31696002)(86362001)(36756003)(38100700002)(30864003)(2906002)(186003)(53546011)(6506007)(6512007)(6486002)(316002)(66946007)(66556008)(66476007)(8676002)(8936002)(41300700001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3VPcjBzUWJKa28wNkxxb0tIUkFFVGpCdzFVOWVkbDFKemlVdHM1Q3RRL1dF?=
 =?utf-8?B?WXFCS2hwVzVTSVFqSDQ1dTVFZzJQeWxrMG5YK01jSUpwbUMrYWp4S3dXODdS?=
 =?utf-8?B?cnQxK3lKcWp5bDlZYVBCaXZzZ2hrM0NJcHQwZ1VHR3RrVy9JZmFxcWpDL1g1?=
 =?utf-8?B?N2ZTeGRuOVVFaXN0L0lBa0NrUkN3dGpYVk80VStNS3lVanBFRGxHaGtTbVFC?=
 =?utf-8?B?MzRQU1pzOWtrYzhVQ0EwNkNxaGN6SmpvRmZYMm5sd1A0ZU5uMnhPVGp0NUMx?=
 =?utf-8?B?SzlVSkpBRlFVTkgrYVFTU1ZJb1lRUnFjaVRRb2kvL2hwTEZ2TGlUalRQeXh4?=
 =?utf-8?B?N05DZ0hKM0dIWlR1a3VYTk8wSmppSXV5ckhpYjJnOUpQaEhLU2N3bnZZVmZM?=
 =?utf-8?B?dE9BVmxVSmNlMi9TUGJubElXcnlETnR0V05PSEM0dC9USnB5Syt3TGE0Y0Y2?=
 =?utf-8?B?Z2tJSmh6eGNRVWVBU2RKTGxSdHZLallORG5MNEtLOXQ3d1JuVUp2emtGdW4z?=
 =?utf-8?B?KzBvWGhxSUI1Uld5bzRjNnFva3JRcC9ieEZsRCtXOHMramtJOGs5aHAzNlBp?=
 =?utf-8?B?UTliWVF5c21hNUF6eEFlM204RjdxTTZXUWhsblg1WG1BYXlNRHZBR0NXUGRr?=
 =?utf-8?B?QlpDQSsrWWhYMWJYRTFmMHkvZ3RhRTAvQ3BOcWpZUnR0cnhwcGczb09sVkdq?=
 =?utf-8?B?M0owWW8xTjRoNFowbzNsczlKK2FDazM0Y3c3bTI3QVd0c3NWSnJFVzQ3RGZp?=
 =?utf-8?B?U3pQL1dqTFpDSTZsTUxjbzdzRmVXZnh2by9NMHdBVFczWjR5QmhoNGN2OUI4?=
 =?utf-8?B?UWpHdjhxM0YyVG1oKytJa3BVOC95RlAxQUpBbGp3QXZuMXZqLytvb2xNdHdE?=
 =?utf-8?B?bXQ0eG9ONWd6cWYwUGM1VjRUd1doRW4wdS9yTERuN0d3VlZtY2VhWlVGeWdm?=
 =?utf-8?B?SkdjaWlFZXdKZXBkanFsQ2xscVV0S2FiNFpqTVd5VFduOENNa1BPbGszVSsz?=
 =?utf-8?B?eFR0V2ZWdVhrL0R6Z3hudWd0cXNjaG8yUWtNYjZYY2V2SUY2SE5TS1RYbksr?=
 =?utf-8?B?cUE5VXJwZG96S0tuemdQZDV3L0Juc1E2ZW13bzFUODhDNCswTWRZWXA0TzNu?=
 =?utf-8?B?UENWcHdKMzNKM1NZTFc0R1dzMEhzSXlGbERNclJwZm5ydzAycWhwdFN1ZzVB?=
 =?utf-8?B?UGMrN0pNejJvY0JtemZHTVJYZ3NPdEUrOHNISk9yRXhEQVVURHYydkcxSzhH?=
 =?utf-8?B?Yk9LWEVBdlI5cHd4aSsrdEhjeHFXVm9RdXZ1a0RpSXYrV0wzMksrYXVWN2FQ?=
 =?utf-8?B?VTQ1RjQzYWxLdXp3aDd5eWVyQTRJRXlIWkpnWFVDbHhkQXdzNHR5U242M3ZM?=
 =?utf-8?B?Z1BhOTFkU0VGdDduY0R1aFZ1RURSZXhMNDBGVDhtOFd4SExrS1g0cHJzdS8r?=
 =?utf-8?B?TzNOdnJjcTlnK0tBSFBGMlo2ZXdNMzJKVFpiRzN2RnorU2d1ZEhkMEVLOWNX?=
 =?utf-8?B?d1p3ajN3bHk2aHA5TFpjcmVvTnhVazg0RGY5Nk45cm5Jb1VodWxWUFpETkZU?=
 =?utf-8?B?QllWTWZQeDFuWlhiNkFDMmZDeExnS2pXSTNTQnMvZ2FvWVRiY0I3YmRROXJM?=
 =?utf-8?B?NkQyV0pCSktsWGxJWE9QTm5TajBvTkNnVkJBQURkeVhyQnZTN0g0Q25BTXJB?=
 =?utf-8?B?cUg2Q05VWXI0MUo5dktyMG5jQ20vYUVwT29mMUhQM3A3cEM4UDV3V2lhRFFX?=
 =?utf-8?B?d2pGaUYwamJQUThKRG5tQjhNSFdCVU13bEZWdGxPVWljSFRTd1JqYjZUaE5u?=
 =?utf-8?B?c2R5NHNWTFdORzh6bnRPWVlPSnY2bFJwV1RrMDF4TlVsZHg4NnJORkk1TEtD?=
 =?utf-8?B?SEZrNTcvT2hpY1UyWmdvZU9aRkk4clJRUm5JZDMwald5YUw2djAzY0V1RnhD?=
 =?utf-8?B?WDQ2QituelcxSitBZXREaTdMTWQ3bDVLZGc1N2dlY0Z1a2JuRVRUQ3Y1S3pE?=
 =?utf-8?B?dHhrREtpQ1A0ZTdSbEZyMDBoTmNKQTFTaEFKK0UwcldIeGlmSVI0eEl1WmVL?=
 =?utf-8?B?WUdYbWZOTXhrWjlZaVBQWWNCOTgyRDJYckQ2ZC9zMjJ3MDI0TGUxZi9kdHZD?=
 =?utf-8?B?UlFrL2x4Z084S0pJNk5UcG1OYWJCdnJuTTB6STdKdDQ3TFB0L2srdXBnMUo5?=
 =?utf-8?Q?FT64+4gdOz4bBk6WnKj61cB3Or9OIuJ+OH0GWvzEsbyr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0c5979-f65f-4d45-b23a-08db725c5ebe
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 13:35:25.6645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+IA8C2Bb2zN1CKvgrhSXrJPUgruf9+mt8uOXmcZ6v3YBodT9tG5KAXHK6poNYur
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6773
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
Cc: Matthew Brost <matthew.brost@intel.com>, arunpravin.paneerselvam@amd.com,
 felix.kuehling@amd.com, francois.dugast@intel.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.06.23 um 13:06 schrieb Thomas Hellström (Intel):
>
> On 6/19/23 11:48, Christian König wrote:
>> Hi,
>>
>> Am 19.06.23 um 11:33 schrieb Thomas Hellström (Intel):
>>> [SNIP]
>>>>> Sometimes you want to just drop the contended lock after the above 
>>>>> relaxation. (Eviction would be one example), and not add as 
>>>>> prelocked, if the contended object goes out of scope. Eviction 
>>>>> would in some situations be one such example, -EDEADLOCK leading 
>>>>> to an error path where the object should otherwise be freed is 
>>>>> another. Perhaps we could add an argument to prepare_obj() as to 
>>>>> whether the object should be immediately put after relaxation.
>>>>
>>>> I was considering a try_prepare version as well, that should cover 
>>>> this use case.
>>>
>>> That sounds a bit different from this use-case. The use-case above 
>>> would, on -EDEADLOCK actually unlock everything, then lock-slow the 
>>> contending lock and then immediately unlock it and drop.
>>
>> Hui? What would that be good for?
>
> It's for the case where you have nested locking, the contended lock 
> has gone out-of-scope and you're probably not going to need it on the 
> next attempt. I think the refcounted "prelocked" object that is 
> lacking in the i915 variant will resolve all correctness / uaf issues, 
> but still the object might be needlessly carried around for yet 
> another locking round.

Yeah, but that case is so rare that we probably don't need to care about it.

I've changed the implementation so that it should now match the other 
requirements.

Going to send that out now, please double check.

Thanks,
Christian.


>
>
>
>>
>>> It sounds like try_prepare would just skip locking and continue with 
>>> everything locked so far still locked?
>>
>> Correct.
>>
>>>
>>>>
>>>>>
>>>>>> +    ret = drm_exec_obj_locked(exec, obj);
>>>>>> +    if (unlikely(ret)) {
>>>>>> +        dma_resv_unlock(obj->resv);
>>>>>> +        goto error_dropref;
>>>>>> +    }
>>>>>> +
>>>>>> +    swap(exec->prelocked, obj);
>>>>>> +
>>>>>> +error_dropref:
>>>>>> +    /* Always cleanup the contention so that error handling can 
>>>>>> kick in */
>>>>>> +    drm_gem_object_put(obj);
>>>>>> +    exec->contended = NULL;
>>>>>> +    return ret;
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_exec_prepare_obj - prepare a GEM object for use
>>>>>> + * @exec: the drm_exec object with the state
>>>>>> + * @obj: the GEM object to prepare
>>>>>> + * @num_fences: how many fences to reserve
>>>>>> + *
>>>>>> + * Prepare a GEM object for use by locking it and reserving 
>>>>>> fence slots. All
>>>>>> + * successfully locked objects are put into the locked container.
>>>>>> + *
>>>>>> + * Returns: -EDEADLK if a contention is detected, -EALREADY when 
>>>>>> object is
>>>>>> + * already locked, -ENOMEM when memory allocation failed and 
>>>>>> zero for success.
>>>>>> + */
>>>>>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>>>>>> drm_gem_object *obj,
>>>>>> +             unsigned int num_fences)
>>>>>> +{
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = drm_exec_lock_contended(exec);
>>>>>> +    if (unlikely(ret))
>>>>>> +        return ret;
>>>>>> +
>>>>>> +    if (exec->prelocked == obj) {
>>>>>> +        drm_gem_object_put(exec->prelocked);
>>>>>> +        exec->prelocked = NULL;
>>>>>> +
>>>>>> +        return dma_resv_reserve_fences(obj->resv, num_fences);
>>>>>> +    }
>>>>>> +
>>>>>> +    if (exec->flags & DRM_EXEC_FLAG_INTERRUPTIBLE)
>>>>>> +        ret = dma_resv_lock_interruptible(obj->resv, 
>>>>>> &exec->ticket);
>>>>>> +    else
>>>>>> +        ret = dma_resv_lock(obj->resv, &exec->ticket);
>>>>>> +
>>>>>> +    if (unlikely(ret == -EDEADLK)) {
>>>>>> +        drm_gem_object_get(obj);
>>>>>> +        exec->contended = obj;
>>>>>> +        return -EDEADLK;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (unlikely(ret == -EALREADY &&
>>>>>> +        (exec->flags & DRM_EXEC_FLAG_ALLOW_DUPLICATES)))
>>>>>> +        goto reserve_fences;
>>>>>> +
>>>>>> +    if (unlikely(ret))
>>>>>> +        return ret;
>>>>>> +
>>>>>> +    ret = drm_exec_obj_locked(exec, obj);
>>>>>> +    if (ret)
>>>>>> +        goto error_unlock;
>>>>>> +
>>>>>> +reserve_fences:
>>>>>> +    /* Keep locked when reserving fences fails */
>>>>>> +    return dma_resv_reserve_fences(obj->resv, num_fences);
>>>>>
>>>>> Ugh, what is the use-case for keeping things locked here? How 
>>>>> would a caller tell the difference between an error where 
>>>>> everything is locked and nothing is locked? IMO, we should unlock 
>>>>> on error here. If there indeed is a use-case we should add a 
>>>>> separate function for reserving fences for all locked objects, 
>>>>> rather than returning sometimes locked on error sometime not.
>>>>
>>>> We return the object locked here because it was to much churn to 
>>>> remove it again from the array and we are getting fully cleaned up 
>>>> at the end anyway.
>>>
>>> OK, so if we add an unlock functionality, we could just have a 
>>> consistent locking state on error return?
>>
>> Yeah, that should work. Going to work on this.
>
> Great.
>
> Thanks,
>
> Thomas
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>> Thomas
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Thomas
>>>>>
>>>>>
>>>>>> +
>>>>>> +error_unlock:
>>>>>> +    dma_resv_unlock(obj->resv);
>>>>>> +    return ret;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_exec_prepare_obj);
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_exec_prepare_array - helper to prepare an array of objects
>>>>>> + * @exec: the drm_exec object with the state
>>>>>> + * @objects: array of GEM object to prepare
>>>>>> + * @num_objects: number of GEM objects in the array
>>>>>> + * @num_fences: number of fences to reserve on each GEM object
>>>>>> + *
>>>>>> + * Prepares all GEM objects in an array, handles contention but 
>>>>>> aports on first
>>>>>> + * error otherwise. Reserves @num_fences on each GEM object 
>>>>>> after locking it.
>>>>>> + *
>>>>>> + * Returns: -EALREADY when object is already locked, -ENOMEM 
>>>>>> when memory
>>>>>> + * allocation failed and zero for success.
>>>>>> + */
>>>>>> +int drm_exec_prepare_array(struct drm_exec *exec,
>>>>>> +               struct drm_gem_object **objects,
>>>>>> +               unsigned int num_objects,
>>>>>> +               unsigned int num_fences)
>>>>>> +{
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    for (unsigned int i = 0; i < num_objects; ++i) {
>>>>>> +        ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
>>>>>> +        if (ret)
>>>>>> +            return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_exec_prepare_array);
>>>>>> +
>>>>>> +MODULE_DESCRIPTION("DRM execution context");
>>>>>> +MODULE_LICENSE("Dual MIT/GPL");
>>>>>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..b1a5da0509c1
>>>>>> --- /dev/null
>>>>>> +++ b/include/drm/drm_exec.h
>>>>>> @@ -0,0 +1,130 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>>>>>> +
>>>>>> +#ifndef __DRM_EXEC_H__
>>>>>> +#define __DRM_EXEC_H__
>>>>>> +
>>>>>> +#include <linux/ww_mutex.h>
>>>>>> +
>>>>>> +struct drm_gem_object;
>>>>>> +
>>>>>> +/**
>>>>>> + * enum drm_exec_flags - Execution context flags
>>>>>> + */
>>>>>> +enum drm_exec_flags {
>>>>>> +    /**
>>>>>> +     * DRM_EXEC_FLAG_INTERRUPTIBLE: Set to true to use 
>>>>>> interruptible locking
>>>>>> +     * functions.
>>>>>> +     */
>>>>>> +    DRM_EXEC_FLAG_INTERRUPTIBLE = BIT(0),
>>>>>> +
>>>>>> +    /**
>>>>>> +     * DRM_EXEC_FLAG_ALLOW_DUPLICATES: Set to true to allow 
>>>>>> EALREADY errors.
>>>>>> +     */
>>>>>> +    DRM_EXEC_FLAG_ALLOW_DUPLICATES = BIT(1),
>>>>>> +};
>>>>>> +
>>>>>> +/**
>>>>>> + * struct drm_exec - Execution context
>>>>>> + */
>>>>>> +struct drm_exec {
>>>>>> +    /**
>>>>>> +     * @flags: Combinations of DRM_EXEC_FLAG_* flags.
>>>>>> +     */
>>>>>> +    u32 flags;
>>>>>> +
>>>>>> +    /**
>>>>>> +     * @ticket: WW ticket used for acquiring locks
>>>>>> +     */
>>>>>> +    struct ww_acquire_ctx    ticket;
>>>>>> +
>>>>>> +    /**
>>>>>> +     * @num_objects: number of objects locked
>>>>>> +     */
>>>>>> +    unsigned int        num_objects;
>>>>>> +
>>>>>> +    /**
>>>>>> +     * @max_objects: maximum objects in array
>>>>>> +     */
>>>>>> +    unsigned int        max_objects;
>>>>>> +
>>>>>> +    /**
>>>>>> +     * @objects: array of the locked objects
>>>>>> +     */
>>>>>> +    struct drm_gem_object    **objects;
>>>>>> +
>>>>>> +    /**
>>>>>> +     * @contended: contended GEM object we backed off for
>>>>>> +     */
>>>>>> +    struct drm_gem_object    *contended;
>>>>>> +
>>>>>> +    /**
>>>>>> +     * @prelocked: already locked GEM object due to contention
>>>>>> +     */
>>>>>> +    struct drm_gem_object *prelocked;
>>>>>> +};
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_exec_for_each_locked_object - iterate over all the locked 
>>>>>> objects
>>>>>> + * @exec: drm_exec object
>>>>>> + * @index: unsigned long index for the iteration
>>>>>> + * @obj: the current GEM object
>>>>>> + *
>>>>>> + * Iterate over all the locked GEM objects inside the drm_exec 
>>>>>> object.
>>>>>> + */
>>>>>> +#define drm_exec_for_each_locked_object(exec, index, obj) \
>>>>>> +    for (index = 0, obj = (exec)->objects[0]; \
>>>>>> +         index < (exec)->num_objects; \
>>>>>> +         ++index, obj = (exec)->objects[index])
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_exec_until_all_locked - retry objects preparation until 
>>>>>> all objects
>>>>>> + * are locked
>>>>>> + * @exec: drm_exec object
>>>>>> + * @expr: expression to be evaluated on each attempt
>>>>>> + *
>>>>>> + * This helper tries to prepare objects and if a deadlock is 
>>>>>> detected,
>>>>>> + * rollbacks and retries.
>>>>>> + *
>>>>>> + * @expr is typically a function that tries to prepare objects 
>>>>>> using
>>>>>> + * drm_exec_prepare_obj().
>>>>>> + *
>>>>>> + * If we take drm_exec_prepare_array() as an example, you should 
>>>>>> do:
>>>>>> + *
>>>>>> + *    ret = drm_exec_until_all_locked(exec,
>>>>>> + *                    drm_exec_prepare_array(exec,
>>>>>> + *                                   objs,
>>>>>> + *                                   num_objs,
>>>>>> + *                                   num_fences));
>>>>>> + *    if (ret)
>>>>>> + *        goto error_path;
>>>>>> + *
>>>>>> + *    ...
>>>>>> + *
>>>>>> + * Returns: 0 on success, a negative error code on failure.
>>>>>> + */
>>>>>> +#define drm_exec_until_all_locked(exec, expr)        \
>>>>>> +    ({                        \
>>>>>> +        __label__ retry;            \
>>>>>> +        int __ret;                \
>>>>>> +retry:                            \
>>>>>> +        __ret = expr;                \
>>>>>> +        if ((exec)->contended) {        \
>>>>>> +            WARN_ON(__ret != -EDEADLK);    \
>>>>>> +            drm_exec_reset(exec);        \
>>>>>> +            goto retry;            \
>>>>>> +        }                    \
>>>>>> +        ww_acquire_done(&(exec)->ticket);    \
>>>>>> +        __ret;                    \
>>>>>> +    })
>>>>>> +
>>>>>> +void drm_exec_init(struct drm_exec *exec, u32 flags);
>>>>>> +void drm_exec_fini(struct drm_exec *exec);
>>>>>> +void drm_exec_reset(struct drm_exec *exec);
>>>>>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>>>>>> drm_gem_object *obj,
>>>>>> +             unsigned int num_fences);
>>>>>> +int drm_exec_prepare_array(struct drm_exec *exec,
>>>>>> +               struct drm_gem_object **objects,
>>>>>> +               unsigned int num_objects,
>>>>>> +               unsigned int num_fences);
>>>>>> +
>>>>>> +#endif

