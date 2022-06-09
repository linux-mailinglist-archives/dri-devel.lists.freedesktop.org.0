Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A654449A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271AD113F66;
	Thu,  9 Jun 2022 07:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D2D113F69;
 Thu,  9 Jun 2022 07:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2eBN8cvh5Ydf3K8I1dI6l/vO2VcCwJrS6msq1D0tv5VGhiiIrVXBvEvB7H6ZjQ2IXRmMQW5mhwimb3bu5dHID0o5XkrJbby1Mi53gWD4ki5b2yE1n4oFcgC0XTCkzjdQChAKmp9OAy82M/8LVfFBF8TrOCtVjTVR68xRi0v6QUXcTFGhNNm9+Z6/N878+7JkXkLNANULFME/9tRdoHlVDTNil2rJvSHwcPGy+S/P02CbWarYNRhk6byt1p1EqXI5rLw5Npc2uxGbL9dHh6hTTFqjoe15CJmrOI805zgm9tp390SoJOE7Lji/bnEYioGuTfyKqgu1WUwMQGQWRLJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVyQxzxfdIrl/z7vk31vS0jwRP0OJoqbBlSA4ExAnig=;
 b=ElIDmCx/RY2ECPn2yEf/Y4SO/zKR4XHUiVloQUlKjPNaIKyyremGmNH9RnRuQEWKMgb70htG0z8dfjRWkkrEpMQG+wCBBM4aNcOPbWPuOfh3ZH/WktJd/OTJ2ieP5HLTxMyqfE7V2Uob/plMkEBjk4amnRszjCJwF2xi/7fnC+tqCRlogMdPpoeLOIHjfMrs0NWD2SNT29Zke33hAzezAa1dW06d81XXP6SeqcwxvCCr3XYz1f1H2aGhrbvcf5Q6DznD/6nvQHqBPBDL9wj9iIx220+W0akKMfAL13lQeDnmuLQabJWKFJhOdZfLvWcn7T/XKClkoEnUVWV3Yf1GtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVyQxzxfdIrl/z7vk31vS0jwRP0OJoqbBlSA4ExAnig=;
 b=4gx9gViljcpKyJ7cbWu9eVctjEmmyZx/JllFaKMdNquWo43uWm33QXc7Yn0PUjwB10swwXC3DFuWxqt0hazAVudxWCCPKj3YpuIxvEeg27ZQ0gCgqiF2xkYtjA4oF/ioYcBBGeCPt83hfGvsy7xos/Syx7giXbezS0gYB+zNtcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4376.namprd12.prod.outlook.com (2603:10b6:208:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 07:18:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 07:18:28 +0000
Message-ID: <a9b9129e-6881-bb6a-261a-8a30d25fc377@amd.com>
Date: Thu, 9 Jun 2022 09:18:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/8] drm: execution context for GEM buffers v2
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
References: <20220504074739.2231-1-christian.koenig@amd.com>
 <20220504074739.2231-2-christian.koenig@amd.com>
 <9ef430d2-1748-10eb-7708-ae8ad9d47804@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9ef430d2-1748-10eb-7708-ae8ad9d47804@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 389c993a-cee8-4075-9855-08da49e84005
X-MS-TrafficTypeDiagnostic: MN2PR12MB4376:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4376F0D2A9C9E946B2ACA1BE83A79@MN2PR12MB4376.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5NCdGjGRy8YdKGRGfe80Xd4clN/mdaRCaQeKxf98fMuUlV7p8nc2vhuYiDVRg0G/zuLU/Yp98NxTnTNj++CMsHE2HwaKF2CXkh8Zkv72VksfyEE/UIHOtxOargq7DMxt+kMLbwHRF8bqgAN4gZZpaTtRwNGcJkP1fi3wcVBdfhfVRuJv2uy5CxcVzlmVvBr3LotyE8tm4G1lLuRCmtieZvziefBNK9XMqn+1fzRI71bNxygS2mDJyIulEHO5hKyVfvsU0Ex7avGobw7bpVQB488bTsAn+smOQ4GCi0G31XucIWqV8xMkX9gagq5m4yCKHgGdruG9Si9U7pp+83lMgBfi+kEAzJKWq3HhlJqkG5aVNHGd4zyGU8huTfJswwnqE4mz60N6AIzihBm6w+8ouLmXivHBqJLb31jNp/uFB6l8GbOhte8Hzz0a7VKk62rwvSbocPcEydJ+EwymAAdca2sM+pAOAHN3ZETqoemmpYrydClrhvdEQwDtqQnVYbV4PhKy8qDRStx/MdAKiHbAA/sSi7PG9lq9X1/lNWI0cnxUFCtlUcdvmBJ4CoXnpeaBK5g0VB39z6X2QGaNp7H2j3wm8jsuLmTXWyzbNb7bXSpXC7qkGXrmgLYy1bu/wXbGVcc/5EvfgmRnY/47uP3jiDQrm/VpCPW3dY6GYqjQvW2LI6c/vJwogYJhK7Bqh22YNAtOzoBiDQAoADm7Pth5RzWumhdJlAwcgba+99YvwSMjglZW/P4Zuarfej0FzjkP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(31686004)(8936002)(36756003)(66946007)(66476007)(316002)(66556008)(8676002)(6666004)(6486002)(6506007)(110136005)(2906002)(508600001)(83380400001)(38100700002)(6512007)(2616005)(86362001)(31696002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVJFNnlqOS9sZjRiZlptVG0va2Y2ZXR6d1hUZXRITEkrSGpVL0FQeHhLT0o5?=
 =?utf-8?B?WUNLZ0N3TjBYbWtaU2FTVTNEb1piQkJCMXUzYk5FdW03SW9KSi8yT0w5UVJF?=
 =?utf-8?B?amVGaFdXdTJtTnh6a0lzZ0JGT255NEZNS05pNVAxbmVSdkVtcHFVNkcydDVE?=
 =?utf-8?B?RG94MzJlSTJaaWxHQTdCZDRuSG5Za0h2UU9xNTJBV21tZTM1L0F3emhxT1E1?=
 =?utf-8?B?WncwK1NIQlNNeWcrVWRuTVNDaGsrc1ZDeEpTbm5MVENKakVJOWtNKzd5WklF?=
 =?utf-8?B?dTVtVGRVWWdGUVJmRXZydDFrZk5QVkZqcEpiMjVwNjV0NVRNai9GbHNrbDQ4?=
 =?utf-8?B?dkZ2VzRtUnB2SUp0VUZLT1p4WG5rclV5SFhrRkVKMnNJQ1FsQXhvaWVub1dy?=
 =?utf-8?B?RVBLQjdSZklsWVUzMzBDbWRNNFBFL2hyK0VOOWZCbjlUY0QySjJ4OHdpeG9Z?=
 =?utf-8?B?VGpZMEhwMEpZWC9KT3ZKNUl6KzVRb2NKbHJmSnBjRkV3WFFlNWxvRFY4ZFlO?=
 =?utf-8?B?KzZTeTZ1VWM0U3ozbnhiZDFQazJHeGs0VGROSmJ0ekQ3dVFFKzNHeVZLV2VD?=
 =?utf-8?B?NjYxVGFING5Za2FIRk11eUpWUVhVNW41Rkd2T1RIWUs0bGFxaEdKQ1lHa3R5?=
 =?utf-8?B?ZVBlTjZYZWVhYlNCMThWWHZPbElZRSthbHZvMEF4Zlo0OXJBVU40bmVaUk1z?=
 =?utf-8?B?SDhCWEFQRDBGcGVHeVZ0K2swQmwvbDBXS09XWVc4SWl1U2NuRkVDOTZpR1ln?=
 =?utf-8?B?UFI2QWttQWxBQkxnQ2dHNk05MEVMZldwTGFoaldxbm5LRms1ZHU3M1RJZ0pD?=
 =?utf-8?B?MGRnMVJBcFRPYW1XZmlpbHNQUmF1SmVjQjBBeXMydG9sYmRjVjhXNjVJSU5r?=
 =?utf-8?B?M1FxeVVZT1cza3VUbmduWElpRk8vZ2VvNElwTGo4aXUvU1o3clRycExBZkFC?=
 =?utf-8?B?Qm51aEJQdkRUQ0FKZWpSTkpmTitMWTgrd2l0cVo5eXBaRVJOeGd6cTlUeFVJ?=
 =?utf-8?B?aWxoWFpMdFpxSVBnQ05nWldkZTl2cWZ6MU8zZXhjSTk4L1FleVFvVjZtR2xk?=
 =?utf-8?B?d1RucVZhV3dQTkNseEszTERvbUdIN1lJdXd3aGpFWHVodGhzWmVUb0wrMUN5?=
 =?utf-8?B?MVVmUDYwRGFXTEdBVlNnQ1N5RlJJYkRuVy9aTzg4ZnZhdk91UmVvWFpEUzRa?=
 =?utf-8?B?M01vQVNkQWY2QTN3S2VWL0ZnWWROc1BaTmRWOGpIOG9TRXhoN2VCRXF3ckdI?=
 =?utf-8?B?KzY0S2FOTXZoNGNJUkQrVURaWmNkMWpTWUEva28vRVpVVXA1VlFIVjJQYXl0?=
 =?utf-8?B?T0h3aVFESzh3QUdYT0N5UXU1azlwRE9nRVZHNVI5SDl2SGVRblV2Wlh3OFAz?=
 =?utf-8?B?OEVsdXJ3OUFnUDZRWStlcVQ0MUNFZWRmcXg3MStYWWo3Nm1qNGYrVExrcHFk?=
 =?utf-8?B?YWVoUUxHaFZwaXFtZmNGL1JyaEFPS3RLK0F3T2g4cHRpTTZHMWQ1NHJkMnUv?=
 =?utf-8?B?YUJ4ckJYVXU1aS9VczYrSGMrWmhrT2ZPWityUCtMZVZnQTJBSE9kQWs1WEdH?=
 =?utf-8?B?L25PbXhLbnpqNW02aEp0WUtKMVhsaE5yNDNKY25GQklydm01bzNlY0FNQ3Zy?=
 =?utf-8?B?Y1lRS0FQZVRZRnFDQ2V1YmhqeEN1NURSSUtMYUF6QVlpNXhjS1AvQWxYUUpR?=
 =?utf-8?B?bllaeVROWVNLZzhXdEJ2MytEbGpFWXZ4MDFKeVByc3NickNwYXVXanVSYjRz?=
 =?utf-8?B?TzQxYXowbmdFTXFBeE5icGQ5UUVtZVpzSjBPR2N1bkpONHJRS3M1Y0wwRm0w?=
 =?utf-8?B?SlEzbkYyLzhyVkNVL2tvVkNiQTUvZUtYWjBUa0J5VlZRdVlHVHBaMU9VVE5r?=
 =?utf-8?B?RjlPekwxWnlta3ZsdndxUS94ZC81ZGtiMnkwcG5nZ1lFWVludk5sdlk2OU9p?=
 =?utf-8?B?dFlkL0Q5bGJYcC9taUllTVJxVm16L0Z2bmFtdnpnWFFRSGVQYjdJRWdrZXJt?=
 =?utf-8?B?ZDVkcitxZVUzajBPMVBacStOdGhFZU5Na3lOdXBIektFeXhCU0k0MWQrTGlX?=
 =?utf-8?B?bDFWS096eDlMYktiY2V1eWJIY09velNBSlpaWUJxenhRdkNvY1pTajVZYVhP?=
 =?utf-8?B?KzNwQzJzZ2hvVGZaQnZEdnRiOTJmaDUrbXp5TXhZdFMxcEVHRG40ajhLY2N0?=
 =?utf-8?B?eHhYZ0ozY3M0NmNVa2s4aHkvV2owZDltZjR4WmVUSG9kYzZlV0ZZUExXZkpD?=
 =?utf-8?B?Z2Q0dks4NE5wSTBQWnM1ZDlwdmJ2Smt3L3MyRFNEYUh3eElmMzU4U2p2dTJi?=
 =?utf-8?B?b2MwZ3djd3F4aEpUaFQrMGV4Nks3MlcxMUNma0lCY0lOemRhL1FWdXhTMUxY?=
 =?utf-8?Q?3iCoFFhA/KEk270roX+mlD7+ow1XuwPvwTB+oZcPY9/aN?=
X-MS-Exchange-AntiSpam-MessageData-1: m0EYGQuxlkG+bw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 389c993a-cee8-4075-9855-08da49e84005
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 07:18:28.4507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJHb3n5psLQuUCmLc7M7hkIqOWaWvqb7jVUgHJH+RZ5O0GjwaPIHjYEVf2cisMEK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4376
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

Am 09.06.22 um 02:05 schrieb Felix Kuehling:
> [SNIP]
>> + *
>> + *        ret = drm_exec_lock(&exec, boB, 1);
>
> Where is drm_exec_lock? It's not in this patch.

I've renamed this function to drm_exec_prepare_obj() but forgot to 
update the documentation. Going to fix this, thanks.

>
>
>> + * drm_exec_continue_on_contention(&exec);
>> + *        if (ret)
>> + *            goto error;
>> + *    }
>> + *
>> + *    drm_exec_for_each_locked_object(&exec, index, obj) {
>> + *        dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
>> + *        ...
>> + *    }
>> + *    drm_exec_fini(&exec);
>> + *
>> + * See struct dma_exec for more details.
>> + */
>> +
>> +/* Dummy value used to initially enter the retry loop */
>> +#define DRM_EXEC_DUMMY (void*)~0
>> +
>> +/* Initialize the drm_exec_objects container */
>> +static void drm_exec_objects_init(struct drm_exec_objects *container)
>> +{
>> +    container->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
>
> Should this be kvmalloc? You're using kvrealloc and kvfree elsewhere.

The initial number of objects tracked should be small enough so that we 
can use kmalloc() directly.

> [SNIP]
>>
>> +/**
>> + * drm_exec_prepare_obj - prepare a GEM object for use
>> + * @exec: the drm_exec object with the state
>> + * @obj: the GEM object to prepare
>> + * @num_fences: how many fences to reserve
>> + *
>> + * Prepare a GEM object for use by locking it and reserving fence 
>> slots. All
>> + * succesfully locked objects are put into the locked container. 
>> Duplicates
>> + * detected as well and automatically moved into the duplicates 
>> container.
>> + *
>> + * Returns: -EDEADLK if a contention is detected, -ENOMEM when memory
>> + * allocation failed and zero for success.
>> + */
>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>> drm_gem_object *obj,
>> +             unsigned int num_fences)
>> +{
>> +    int ret;
>> +
>> +    ret = drm_exec_lock_contended(exec);
>
> If this succeeds, it won't reserve any fence slots for object. Is that 
> a problem?

No, the contended object should be re-presented later on and then we 
allocate the fence slots.

>>
>> +    if (unlikely(ret == -EALREADY)) {
>> +        struct drm_exec_objects *container = &exec->duplicates;
>> +
>> +        /*
>> +         * If this is the first locked GEM object it was most likely
>> +         * just contended. So don't add it to the duplicates, just
>> +         * reserve the fence slots.
>
> I don't understand this. Seems a bit arbitrary. Is it even legal to 
> try to add the same object twice? I thought duplicates was for 
> different objects that share the same reservation, not actually the 
> same object on the same list twice.

Yes, it's legal to try the same object twice. That can easily happen 
when userspace specifies the same handle twice for a submission.

The other possibility is that we had a contention, backed off and then 
locked the contention first and then re-tried everything else once more.

> Maybe you meant to compare with 
> exec->locked.objects[exec->locked.num_objects-1], assuming that 
> drm_exec_lock_contended just succeeded locking a previously contended 
> object, and the caller retried locking that same object again?

Yes, that's pretty much the idea. But then exec->locked.num_objects is 
just 1 so that's equal to checking exec->locked.num_objects[0].

On the other hand we would also catch cases where we lock the same 
object multiple times directly behind each other. Need to think about 
that a bit.

>> +         */
>> +        if (exec->locked.num_objects && exec->locked.objects[0] == obj)
>> +            container = NULL;
>> +
>> +        ret = drm_exec_obj_locked(container, obj, num_fences);
>> +        if (ret)
>> +            return ret;
>> +
>> +    } else if (unlikely(ret)) {
>> +        return ret;
>> +
>> +    } else {
>> +        ret = drm_exec_obj_locked(&exec->locked, obj, num_fences);
>> +        if (ret)
>> +            goto error_unlock;
>> +    }
>> +
>> +    drm_gem_object_get(obj);
>
> The container already gets a reference to obj. What is this extra 
> reference for? And where does it get dropped?

Need to double check this, might be that it's just a leftover.

Thanks,
Christian.

>
> Regards,
>   Felix

