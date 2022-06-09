Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E886544EF3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 16:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7547D113AC5;
	Thu,  9 Jun 2022 14:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B6C113AC5;
 Thu,  9 Jun 2022 14:28:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTTpjqHU5No/qBap66aam0amFIa2IQ59wXeOkL0EvaIfML3dr/lM0EmuK2v7WUsj67TDGLGIJfM5n5W6CEjFBWKgsrtZjrTYsjLrrCVHJ5GxxDq6FzFV4IkmDwl2ofhHIPy3w6wRulZ8VOj3y/aTpohuFYD09pY+HBYybA+kckfQZOO56ly+YJ2YddHWbJdGKGZZAUqrDL2VntwzSOOjginGeBDX6cMqQZvyCj8EOuaOYWW3FewzBH1hCgDOr3vG6m5tOXHT6Z0QxubQPAPqKwYZ5sQa3NoEkckULGuK/nFNLbVoQ2nvrlb5eXfH2oG6z32E+HSv9RsmIyvyybNaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEV6QbqdW0MYjqsjLUiOke+QOzX4KmLkdLAUQowCleo=;
 b=WNRZtHtes+8ryUYzk6AzlWl3uRvVFMB0jRnomS4YyQpHmctTslxYk3fbHiGX5zyH/x9oY3c7KObGzEHLx6kM2bd9CN/nMMklOnne3raq6Oz6U/2ahfGmx5Hj7kkQ6QuLfzPB3d/cQi+ZrY6WuJaJQt72f6XxrxqeUsXZLhEiH8sICqrhmWkJwQaVg/UEqbQjlSWPWbr5EEbfFqD4j6FpLLrFmHyQZumbv2Ja7aTMFGhDFIks9onlivi0lhb/9b5lhSkduJqVJtmEXyMMBuvn9EhK+tRFKV1RZ0b1krL1bf+5NQqZOwle0TsK5vOOx2gq8cXWPTl88oITuzxR7Kk5mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEV6QbqdW0MYjqsjLUiOke+QOzX4KmLkdLAUQowCleo=;
 b=ds1VoNP2Ba8zzEKVg3ie/vbI3/ZcnvL8xki+kSlIP1ZglwM8lN+hKOq2nrDF1mhqsZvYxr+G6Nri73MFfhgl3b54DYvT7BvAywzNdxHAhg/64JiYF2Jlosg8UyjdCo/N7qB85qzWeblfdA+OQDUYB8Sl58/pO/zBcK+I9dw1wpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM5PR12MB4662.namprd12.prod.outlook.com (2603:10b6:4:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 14:28:40 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3%4]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 14:28:40 +0000
Message-ID: <a09dbe2c-c2bb-4eeb-f68a-fedbabcda796@amd.com>
Date: Thu, 9 Jun 2022 10:28:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/8] drm: execution context for GEM buffers v2
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
References: <20220504074739.2231-1-christian.koenig@amd.com>
 <20220504074739.2231-2-christian.koenig@amd.com>
 <9ef430d2-1748-10eb-7708-ae8ad9d47804@amd.com>
 <a9b9129e-6881-bb6a-261a-8a30d25fc377@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <a9b9129e-6881-bb6a-261a-8a30d25fc377@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::29) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 506cd7a6-032b-406d-03e1-08da4a2458f7
X-MS-TrafficTypeDiagnostic: DM5PR12MB4662:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB4662F4C708DE4B79FBBC7C9B92A79@DM5PR12MB4662.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qts+GRZGheaA+oBowq17NWW7rsB1Rfal9okIsn+jdnObrwKiKYJ2OnE9VubfamdVcu10cfsqpYm76Xe68d3jT98kD7P9epGLeUiso33aMPds8Kukb5ACZM24N8HP9O7wGUZoX7S9jAaXGhJXQD+cOiF7hP5Fa13bFpA9HOSWRTWMUgBYp/+lLWd4Vdn+XEkhIfDcFIabPOuKRS3TC2KmteX63/K5ZWQ28YBOFOnm/dB5zl9lKoHySgBP8SQesi1u6Ep7opxcLQ1gikfyoVvFARs4DqqcL/zT7gTa4F6uE1DZqt4QKZM+jN0j61xSycIdsBCpd4ks3R61cuQz8/3MyRECjWY0Xtlpjluytuj+Mxz6GQCDLIYn+QMB96PKKR3ycpGRqjaldRX0Crkll60ycWJFOwHVvWYZGiP8fpvgXbBYIBHLOg2mMtiSZzC2fzaKPP02Cl8bXNuYZp7wBoVf9JOyolEC59QwbDwGPZiZMv0g1QytcIP/nbgEkwxUSxUezX7D2pFDkzWWTmGJ1x5cTgIZfeO0rY9bu82DdZo4EVjSp1ZR6ElID1Tw+p0xn/Z9dB3PUPuvRnHUvK/kxxyeM0U7IZBdPcDr9VMq84byU3ggZDinKV3UmS3kASmXhHjwD0NlcC/oU+5GXLhBls432igKAJ5jvsc2a99DBLJYozTMkrzFtRyVPAHEPpK3yiZSnecUhpX36b8+3fLeHDhLA7te5ZvHY2aADDzZHhlrhpPIZoTndxon1qdPTcJXYjq7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(31696002)(26005)(6512007)(66574015)(66946007)(6486002)(5660300002)(6506007)(186003)(83380400001)(508600001)(2906002)(8936002)(36756003)(2616005)(38100700002)(86362001)(6666004)(110136005)(66556008)(8676002)(316002)(31686004)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmZjVUw2QXFqY0dYNGJFa3VCSUs0OXFEZlIwVWtpcXgybllteVRaTE5lTFFD?=
 =?utf-8?B?YUFwQUVqTUQ5a2dwUm9tcDFnSU95emdHc04xUHZXUmx0Mlgwc09iMHV3WFJC?=
 =?utf-8?B?eU5HTm5oZHBBZVpSOCs0WnN6S2NqajU5Zml0aWVqQkp1aTMzRllaM3pYNU16?=
 =?utf-8?B?Vm5VczJuYkZoNENkVTBCVWE2ekgvTkZHZm9jTTlFYkxDSDRXTGI3WngrMTJN?=
 =?utf-8?B?aDVLZEt2U3NHYXFXK3Y2VExDTy9yeFFMUmVxZ1BCTWd4aXdTKzZ1bDV0aFZ0?=
 =?utf-8?B?bHk0Y2V2cis2ZDBpek1IMGc2Qi9NQ25DUGQ4SUdaRHVQZVkwTlltaGZTdmxp?=
 =?utf-8?B?M2FhRGo1ejJ6RnlXV1VHYWV6T0RuQ2RMOVZhRmg0b1k0TXdoUWRJazdxVjY5?=
 =?utf-8?B?OVROMUV6cVJ4VFFMRDRGY25uWkkxNTVOaGdpa0pFdUI4T3MyeXE4WVdLL0Vj?=
 =?utf-8?B?ZHRYRnFtNlhtRTVraUZiUXBNWThKN0lMamloRWFISndUNFdsdzJCdEdlaXlP?=
 =?utf-8?B?bWhPS1QxeTFYSi8yM1RsYVlicDFWUEFDTmlNK1kvd2VXQ01Gb3lTbnlrcmFZ?=
 =?utf-8?B?ZTR3ZXVaWi9sRFU1MUEzUXRwUjQwZlRnRDNNeVNxYlZKUURBblpUQkVqS1Mv?=
 =?utf-8?B?ajNxZGMyRWxsVlVGMWpBZWRqMjFvSnZzTm1mMTlpYlhPRnZ6RXo0d1FETmg1?=
 =?utf-8?B?QUZNQWtweGt5dXRRZUNJaTNyYW05UFJ0bTJrNzJxRDNtc0Z4MGtCMGlyd0xv?=
 =?utf-8?B?VmxPZ3k3d3pRdVYzUVQvQnlxd3Zzbndhb251Vmp5aTFaVWlCM3RINnNZYldx?=
 =?utf-8?B?ZzIrTTBFbGpKQTlJYlBqcGV5RTFxM3dLL3R2U3ZDN3BZNkl5QzdpNXVpWW5x?=
 =?utf-8?B?bW92aDNsMmVqNzB6S1JLU2JDZmZ4eXVTTzFycDBydTBMTkxvT2V2R2JLQ2xp?=
 =?utf-8?B?RWp0UlpUbHdCQk1xRmhiTXd3TkV6bkwzMEQySW9ZamNpN3M1NlVrZTlCRTcw?=
 =?utf-8?B?OEg5RHFrVE9DdWVUNUtZTmgxc282WCt4OEU1RzVZYVZGOHBmcnEwUXlvTjQz?=
 =?utf-8?B?aU0yRVEwaHBuQXFaMFU2NG5JeUFrZVFlVVY5WkVHam5wUWtBbWVDWnp1V250?=
 =?utf-8?B?USsxeXZDWVBxeWdDc1J3eENKUTdSNHpQVTdnYWFPd3l2SHRnd2NlY0RwMjcr?=
 =?utf-8?B?ajkwVnBHc1RMZks4cW43eE11dXdseXY2SjhMOWRZaU5HUGRhSjVwck9DRnpS?=
 =?utf-8?B?dzdlRmluSGFRZklhdTVMZmVsYnAybnl5T2YvQXRjbWwwcEIrNFViNFlnMUZk?=
 =?utf-8?B?VDlLSWtEVkRpZTZ0L3hGN2dvKzVVTHRwaXZWdCtFNENaZWJXSmdXS3JQS2Uy?=
 =?utf-8?B?MWg4S1NsMVcxSmUxM0ljYkIyaDZJRS80UndkQlFOQlBuakg3bDZWUzN4SE9M?=
 =?utf-8?B?RnpFM3NydVEwYng0OFc5Zys1THQvb3VWdTIyakVUSzYxNUw3QUcwZTlJOW4w?=
 =?utf-8?B?alNMV202ZTM5ZzZpSWREWDlmQWxqbUt5VkUzc3U5eE4raHBVNElWUzg2MzRk?=
 =?utf-8?B?SFFhYWlmK1REdE1ma3ovUk5lYy9zaEZ1K0dOamNJRUlDc0JQUGNzRFp6anhj?=
 =?utf-8?B?NzIvSytlK1JFOGE2bUhDRjFhbHduZlVCcnlzMktvOXpuOUJteVNDd3Vxamoy?=
 =?utf-8?B?Y29ZYml0TEVwUThRcFhvYk1ObnNkYTZFUXNKejhMbkJHWEV1YnE5NDNLUXZL?=
 =?utf-8?B?VkRFZjUrVktwYmVFalJBbTJleGlWNHR3anpEbVFJU09GV1NETkNaOXNYaEZK?=
 =?utf-8?B?TG9zRlF0ZG54V3RLbmdiSDlvVUJJQmJEWlNSNHk4T0ZGZHNXU0VSRkR5d2FD?=
 =?utf-8?B?dXRrUDVjcGdBZEJuWUJxYWZMc01YVFNSWHh2U0lQU25adDFNdFJqdlNXTVN6?=
 =?utf-8?B?R01QT3pSeitZRXRhMC9XVUUydkNNMnh3TnRVNVVKZXFzVGwvdjVzaEx1eERT?=
 =?utf-8?B?QUtWcVNRaUF1ZVowMDFBS0luTzhvR29WYWkxbW1ZT2p6MCtkSHQwZHVXcXAv?=
 =?utf-8?B?V1FqVUlGZm83VmZhNGdRK1JHcWtqN2w1SU1ETjFDWTRIbDNqMU16MG1DZEZM?=
 =?utf-8?B?WmdxWEdWaWRUN0RQWkJhR2luMDZERkFkY01Za1FFOVExdUdUZ1g5M0h0UTJY?=
 =?utf-8?B?WC8yTnFWaUx0eVhpSTVKb2VhR3JaNHl6N1hJNXBocE9lSFpLZ2VJN3NZYmVr?=
 =?utf-8?B?MXBxeHdGd24vbk1VdmxvVFd6QzVkTFErRUF3cEl5VE5IekZUaWhWcG84b2hh?=
 =?utf-8?B?VENOdEl2R29uQlVQSUs5a1dKbmdhbWRLWWJQRS9oOHIvU0d6NlpBdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506cd7a6-032b-406d-03e1-08da4a2458f7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 14:28:39.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rc+p8ox3TVGOnFq+jJmZNo8j+OGgqOTpaZvPM7dlhLeOjWsGFAM6qctH4OkERKXnqQp7VQ3vueBL+D/Go1uElA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4662
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


Am 2022-06-09 um 03:18 schrieb Christian König:
> Am 09.06.22 um 02:05 schrieb Felix Kuehling:
>> [SNIP]
>>> + *
>>> + *        ret = drm_exec_lock(&exec, boB, 1);
>>
>> Where is drm_exec_lock? It's not in this patch.
>
> I've renamed this function to drm_exec_prepare_obj() but forgot to 
> update the documentation. Going to fix this, thanks.
>
>>
>>
>>> + * drm_exec_continue_on_contention(&exec);
>>> + *        if (ret)
>>> + *            goto error;
>>> + *    }
>>> + *
>>> + *    drm_exec_for_each_locked_object(&exec, index, obj) {
>>> + *        dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
>>> + *        ...
>>> + *    }
>>> + *    drm_exec_fini(&exec);
>>> + *
>>> + * See struct dma_exec for more details.
>>> + */
>>> +
>>> +/* Dummy value used to initially enter the retry loop */
>>> +#define DRM_EXEC_DUMMY (void*)~0
>>> +
>>> +/* Initialize the drm_exec_objects container */
>>> +static void drm_exec_objects_init(struct drm_exec_objects *container)
>>> +{
>>> +    container->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
>>
>> Should this be kvmalloc? You're using kvrealloc and kvfree elsewhere.
>
> The initial number of objects tracked should be small enough so that 
> we can use kmalloc() directly.

Ok. It just seems weird to allocate with kmalloc and then kvrealloc the 
same pointer. But if that's safe it doesn't matter.

BTW, if the caller already knows the number of BOs it wants to add, 
would is make sense to add that as a parameter to drm_exec_objects_init 
to save you all the reallocs?


>
>> [SNIP]
>>>
>>> +/**
>>> + * drm_exec_prepare_obj - prepare a GEM object for use
>>> + * @exec: the drm_exec object with the state
>>> + * @obj: the GEM object to prepare
>>> + * @num_fences: how many fences to reserve
>>> + *
>>> + * Prepare a GEM object for use by locking it and reserving fence 
>>> slots. All
>>> + * succesfully locked objects are put into the locked container. 
>>> Duplicates
>>> + * detected as well and automatically moved into the duplicates 
>>> container.
>>> + *
>>> + * Returns: -EDEADLK if a contention is detected, -ENOMEM when memory
>>> + * allocation failed and zero for success.
>>> + */
>>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>>> drm_gem_object *obj,
>>> +             unsigned int num_fences)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = drm_exec_lock_contended(exec);
>>
>> If this succeeds, it won't reserve any fence slots for object. Is 
>> that a problem?
>
> No, the contended object should be re-presented later on and then we 
> allocate the fence slots.

Ok. Along with all other objects, because drm_exec_cleanup will have 
cleaned up the lists.


>>>
>>> +    if (unlikely(ret == -EALREADY)) {
>>> +        struct drm_exec_objects *container = &exec->duplicates;
>>> +
>>> +        /*
>>> +         * If this is the first locked GEM object it was most likely
>>> +         * just contended. So don't add it to the duplicates, just
>>> +         * reserve the fence slots.
>>
>> I don't understand this. Seems a bit arbitrary. Is it even legal to 
>> try to add the same object twice? I thought duplicates was for 
>> different objects that share the same reservation, not actually the 
>> same object on the same list twice.
>
> Yes, it's legal to try the same object twice. That can easily happen 
> when userspace specifies the same handle twice for a submission.
>
> The other possibility is that we had a contention, backed off and then 
> locked the contention first and then re-tried everything else once more.
>
>> Maybe you meant to compare with 
>> exec->locked.objects[exec->locked.num_objects-1], assuming that 
>> drm_exec_lock_contended just succeeded locking a previously contended 
>> object, and the caller retried locking that same object again?
>
> Yes, that's pretty much the idea. But then exec->locked.num_objects is 
> just 1 so that's equal to checking exec->locked.num_objects[0].

Ok. I missed that after drm_exec_continue_on_contention the 
drm_exec_cleanup will clean up the lists and we start over locking all 
the objects. Why can't drm_exec_cleanup just lock the contended object 
itself? I think that would make it more obvious that the contended 
object is always the first one that gets locked and added to the list.

Thanks,
   Felix


>
> On the other hand we would also catch cases where we lock the same 
> object multiple times directly behind each other. Need to think about 
> that a bit.
>
>>> +         */
>>> +        if (exec->locked.num_objects && exec->locked.objects[0] == 
>>> obj)
>>> +            container = NULL;
>>> +
>>> +        ret = drm_exec_obj_locked(container, obj, num_fences);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +    } else if (unlikely(ret)) {
>>> +        return ret;
>>> +
>>> +    } else {
>>> +        ret = drm_exec_obj_locked(&exec->locked, obj, num_fences);
>>> +        if (ret)
>>> +            goto error_unlock;
>>> +    }
>>> +
>>> +    drm_gem_object_get(obj);
>>
>> The container already gets a reference to obj. What is this extra 
>> reference for? And where does it get dropped?
>
> Need to double check this, might be that it's just a leftover.
>
> Thanks,
> Christian.
>
>>
>> Regards,
>>   Felix
>
