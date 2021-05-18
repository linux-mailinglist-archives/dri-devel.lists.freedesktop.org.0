Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AD7387BE0
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E22F6EB98;
	Tue, 18 May 2021 15:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A511B6EB98;
 Tue, 18 May 2021 15:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdRQPQUgyxppC6Wko4p49GcD0Uwv/mWaQV/3WxUjJKTZSYfi9vr/2SbAKRTu2q74zwm/EffOMcjYZmSOBOaaQGHalAcexmhCZdoyhD1bzWYrby4XRny7M885aqnp4+XTZtVyhalt855DluF2ANHSBw26xHZoQdutDDyrDQ1A9OfO+gf39GQsdokINkHRzPECfDffbTwMipejaa/VpxUbLRhVmVXr72mR2CEXj36hOi/fvAO3qIi+LzrC2DR9tm6iuNDjZLJv1O21mcM4VSj6JcBE3y8IOTv19k1fXSLn9NyizlVURk3bGPFAAWUlnSExyr9SsO97D8jCqva68REGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djfm6oFjQkkPHJBrkae49tcmPEDos43Q1lA2uYE/d4Q=;
 b=jyB1wpKlmDY0fqMlohIjD0QPXcesOhnh57dQhxcJ9vMQM8Zx7Kx9QuSTRyEtqzaIdOJgBzfzkjVoAd7tzjsyqDaqxveZ6orwvfMDuyCSEC9+cv9uPYhvyIoWkLIpz8SSvL2fXwjLs0iu4MMlOyzkCjU6HdarBH0WbI/Mj0e6YVqV7TYRHSgJEtzm11h/LJbTrHUyFL/wZJkSsC07o8s1Fzd/KXUN+w6+YxT5UYEjaUKrouQHtvHHL+U5y8VB0D49U7iUYFeBRhhQlv42kCeak0YnyWQtjIC920TFJnCxq9pjdoAh/rrBSp1ZrP3DZh5NH3adrCJSP71X1S4AlrYQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djfm6oFjQkkPHJBrkae49tcmPEDos43Q1lA2uYE/d4Q=;
 b=joY1C5sH7WjswMQJgjlE8wvF5SZzpcWXOuoTWkJSq3FjaWMFthEht9e5pWEMzJGz7axtQIOYvsz4TDeVcJRlsKYPuesUPte6gESsbktQGnkqwrzZjgFiZF7C/oammuFH/dCfNuIGZj3hbsHxLXlUrVJXvhKgLNk7BVErtqd926c=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Tue, 18 May
 2021 15:03:48 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 15:03:48 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
Date: Tue, 18 May 2021 11:03:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
 (2607:fea8:3edf:49b0:19e2:b915:59c1:4860) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Tue, 18 May 2021 15:03:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96ea3784-870e-4fd6-a91a-08d91a0e2399
X-MS-TrafficTypeDiagnostic: SA0PR12MB4400:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4400CCCEACAECE5108A20E2AEA2C9@SA0PR12MB4400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kl2F9RN5eQp8L/diwfId0M85jSyyuC+8Y4hqqPwE6qyZYOWNxhE+s/JOlk4ReqKuFxljusHUuz7sldckPPQ6lkFzGTFVbWfMI896XS/PI2qhFrQUho48g5FRGrhBlPmhOYgVVbrBZ8UtJT8wjnPyRApur0B/oINqA+tPUxGXSA9mn1YfVUUw4TuYr3+YCyFi741vFjvsrkv3kimCJCE848AwHFr1u4gYecTQT9MLNzumU29VqY7WAtCKzYPh5Ee4PFmsZLWx1KhUKaXyabLkVoIoDDtOsbCzP3YqlF9HEkzGUMSKoUW8Qd8be1gHpK7dPbRyPWN8Z65sqnn13G7HxsS1NmyohkzOFefJFkhuxrKNZpup8cHp+bwmUkk2VShv2GAiXocON91OPObPhkkUjdADFwYFcazTy20qhcEKG3VYM3cfSzdI/3b73MhTWxPD8K55imiLsj6izcKTWQDlOGinScY6Kg+bhbM5y2s/pfXkGI6LGn4EuinWkcVZbL+ddHRwkfd0d9w3xKHqL6fENxmQVMahN3aZzpySnSlE2BiSpKPypq+pP/VE4d71vMlMp6ABtajfFR5xPVctPloS9Egk2q5UI/B85ZXesjAKWbOre9aDPSS3CzoukaauCd+Sw56w6QQl/PeoBz6TA6cKaYClN4y4v/OItDSqlcMjBsa+Dp9EMaG5tLBXcj6pQVh3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(6486002)(2906002)(2616005)(316002)(36756003)(38100700002)(478600001)(16526019)(6636002)(31686004)(8936002)(66946007)(44832011)(66476007)(8676002)(86362001)(186003)(52116002)(5660300002)(53546011)(66556008)(4326008)(31696002)(66574015)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UzBUcVRmeU1sV0YranREZytVaGlxWWROTU9jdXpoUnhMZ2tpQUEyNEkrL2kz?=
 =?utf-8?B?TTNlbU1ZaXpJNS9sRms1dmxES2dibk1LWDNYdVQzVGlhNmZCTnpZeTZrdi9a?=
 =?utf-8?B?MXNnQUdJME1IaitwRlU5ZUxzdUUxNDVvd3h1V080djBkeHhNOWdOMnk0QmNr?=
 =?utf-8?B?RTNacnorNmxHSklZSzdGNmh2dC9ybnkzOVp5VUZhNzkvVDRNMWU1N1ZtWTE2?=
 =?utf-8?B?eSs2bStTL3Bvcmg3bjdZbytEakJhTHBlTHJxQjZaa2c2NWt3b2h3L0ZOMFk2?=
 =?utf-8?B?blRFWnpKYklETHNKZnlRVXB5WjVPc1Qwb0gzOStEZWxUeGVDYTUwQ1NzMVZh?=
 =?utf-8?B?Y2g4MHVCRmJFSUdvc05pMHhyVk01WEY4T2w4dVMwd01Udm85U0d4Vi9FeUlP?=
 =?utf-8?B?c1JzQzBGdFdNekQwa2tsYVoxTmRtZGJROXZUTkx0UXJicUJrd05IVDdMOGdv?=
 =?utf-8?B?VktvQ3VuY2JvYWNuZEcreEpVK3hpREEyd1dUTkpkMEg3enBIYXpOWHp1Z3FF?=
 =?utf-8?B?SGNVSjM2aVR5eUhXbVE1OGhkQzNZRUNQajV6Z004VXMrWUcxRmRhbUFpTHF1?=
 =?utf-8?B?eHo5SkZpSnBJeXZwM00yYnNiZ2hPT3FFZG5lRmxjTUgyZE5zcDFORzhLZmFx?=
 =?utf-8?B?QVFSK0pteFkwVHpkUkJEOTRYQkJNQTlZNjE1OVZMcDRIbGU3aVowTzYxakli?=
 =?utf-8?B?ZlRheXFWUmhhelBqYjB6Y2tBOHFKVFMvT0EyRnNSYmJEQzUwRWozcThyRWdX?=
 =?utf-8?B?UlRCMjFJZUllVlBnMkpFeXdma0ViNUQ2aGlhbjVKSUUxRHhCUzlKRE0rYUFB?=
 =?utf-8?B?QldmUWcySU5ESWU1YjlPMXoyUGRHaDNNU0FQVGtPQitKTG1YamhscGxIeTFI?=
 =?utf-8?B?RGg0Zk5aWWR3dlNWREtLRjI2d1B1YUxSY1lreFhWV3NOOXRhZHoxMFB2NVVX?=
 =?utf-8?B?V3pxcHN0dyt5WndGYWZJcEljR1ZycjZhbE1OTU9wM2IyZXYxcHpoYXluTkxW?=
 =?utf-8?B?M2xxMGtpZE5GNlJRQXduY29KUmYxdGQvU2dVenhtZHdDMkNvb3JVWUYzcC9j?=
 =?utf-8?B?VzNSS3ZjdzFVQU41cC9DbkFHREFhV2RUdVpSUHZlaE9sN2pFa2Z2eHZzRVdR?=
 =?utf-8?B?Uyt5ci8xczVkWDUzTkdQR1JuOUVNVjQrMEZTT1EvM0RiUE50SFh0Nkk3QWQw?=
 =?utf-8?B?bDNudENKbW44MEsyYXFvb0FrbWxaWE1uZkpLUmROK0xvNTUwTC8zenlUc0N0?=
 =?utf-8?B?ZFptR0Z4OVVtVzVlWUVrSTEvZmFlQnhoZE4wWWFtQ05uS2F2SlZuRFBDcjMw?=
 =?utf-8?B?Q3pxMDJLcEsvanczZGlhZndhOWJreWJ3dUwySUJ2UndCQUNSVHJxY3hyczFN?=
 =?utf-8?B?YVE4VjNQdTVrbHk5VTJ5RWFSRGhQZFRnandJSFZUZE95NTlCcGE1SExFUjl5?=
 =?utf-8?B?SVgxenhiQkY2WjRQL1hYYkV6T1A5dHhML0hWakFuNHNWOWV6dDA0NDVybUh1?=
 =?utf-8?B?OGREU2ZVM0ppVnFlS2RFOHhWMHFUUGQwRW1VaUo4WVlLeW5uWndVMVpESkIv?=
 =?utf-8?B?YXNkbmFuN0ZNa2Zoc0E5Vm1UUnoyWUhtNXlvWlI4WTRCZk14Qzl3UGR2N1FT?=
 =?utf-8?B?UGVEalFDaFRVMlhBcmQ3OVV2NlIydWpOY0hWU29Yc0g3QkNmSy8wNXRpbjdL?=
 =?utf-8?B?OC9MYTdRMEVJRUVnYk1JQy8wQTBoU1JVbFZwOHJXazJGVjd4UHF6bWFUdTVN?=
 =?utf-8?B?OFBWWmwrN3hZYWR4TW84cFV5UFZ2L3MwOTI1UGdZNE8wUkI5NmUwRmhhZUZD?=
 =?utf-8?B?c1hPTm43bTZtOW1IR3lDczZRelVZeTlhZnFwL1JIVWJ4d3JlRUUxM2k4NzUy?=
 =?utf-8?Q?ya22n447rTjfa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ea3784-870e-4fd6-a91a-08d91a0e2399
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:03:48.0202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ji/Mbg0eM239kDzzg+kRuJn7mNWNnB3SmhdBcWIEDieOXpKfbiUwDtQQ6rcKd1S86nSFU+3Ic64jjFIQjZ9pFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-05-18 10:07 a.m., Christian König wrote:
> In a separate discussion with Daniel we once more iterated over the 
> dma_resv requirements and I came to the conclusion that this approach 
> here won't work reliable.
> 
> The problem is as following:
> 1. device A schedules some rendering with into a buffer and exports it 
> as DMA-buf.
> 2. device B imports the DMA-buf and wants to consume the rendering, for 
> the the fence of device A is replaced with a new operation.
> 3. device B is hot plugged and the new operation canceled/newer scheduled.
> 
> The problem is now that we can't do this since the operation of device A 
> is still running and by signaling our fences we run into the problem of 
> potential memory corruption.


I am not sure this problem you describe above is related to this patch.
Here we purely expand the criteria for when sched_entity is
considered idle in order to prevent a hang on device remove.
Were you addressing the patch from yesterday in which you commented
that you found a problem with how we finish fences ? It was
'[PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.'

Also, in the patch series as it is now we only signal HW fences for the
extracted device B, we are not touching any other fences. In fact as you
may remember, I dropped all new logic to forcing fence completion in
this patch series and only call amdgpu_fence_driver_force_completion
for the HW fences of the extracted device as it's done today anyway.

Andrey

> 
> Not sure how to handle that case. One possibility would be to wait for 
> all dependencies of unscheduled jobs before signaling their fences as 
> canceled.
> 
> Christian.
> 
> Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
>> Problem: If scheduler is already stopped by the time sched_entity
>> is released and entity's job_queue not empty I encountred
>> a hang in drm_sched_entity_flush. This is because 
>> drm_sched_entity_is_idle
>> never becomes false.
>>
>> Fix: In drm_sched_fini detach all sched_entities from the
>> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
>> Also wakeup all those processes stuck in sched_entity flushing
>> as the scheduler main thread which wakes them up is stopped by now.
>>
>> v2:
>> Reverse order of drm_sched_rq_remove_entity and marking
>> s_entity as stopped to prevent reinserion back to rq due
>> to race.
>>
>> v3:
>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>> and check for it in drm_sched_entity_is_idle
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>   drivers/gpu/drm/scheduler/sched_main.c   | 24 ++++++++++++++++++++++++
>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 0249c7450188..2e93e881b65f 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct 
>> drm_sched_entity *entity)
>>       rmb(); /* for list_empty to work without lock */
>>       if (list_empty(&entity->list) ||
>> -        spsc_queue_count(&entity->job_queue) == 0)
>> +        spsc_queue_count(&entity->job_queue) == 0 ||
>> +        entity->stopped)
>>           return true;
>>       return false;
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 8d1211e87101..a2a953693b45 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>    */
>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>   {
>> +    struct drm_sched_entity *s_entity;
>> +    int i;
>> +
>>       if (sched->thread)
>>           kthread_stop(sched->thread);
>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>> DRM_SCHED_PRIORITY_MIN; i--) {
>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>> +
>> +        if (!rq)
>> +            continue;
>> +
>> +        spin_lock(&rq->lock);
>> +        list_for_each_entry(s_entity, &rq->entities, list)
>> +            /*
>> +             * Prevents reinsertion and marks job_queue as idle,
>> +             * it will removed from rq in drm_sched_entity_fini
>> +             * eventually
>> +             */
>> +            s_entity->stopped = true;
>> +        spin_unlock(&rq->lock);
>> +
>> +    }
>> +
>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for this 
>> scheduler */
>> +    wake_up_all(&sched->job_scheduled);
>> +
>>       /* Confirm no work left behind accessing device structures */
>>       cancel_delayed_work_sync(&sched->work_tdr);
> 
