Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7B3F9ADD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 16:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058B36E973;
	Fri, 27 Aug 2021 14:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (unknown
 [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BD66E973
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 14:26:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAgbK50dP/iL4ts30PjHSvGXJZ42dgXuzdF9Yu2K+aly3s3JXCNSHkGbjj1Z0PwDunmn40x5FdU956HnxPgyJODHqIWmjwbOuxBUh68WHoSgKxdfuGhkQC912tPbG/3b7sRTDdWY/3a0uBKMANNp5YzXW5JuWZlFcsUHon0Fdv9MKxDsdVDNRptLAWROu2rDEZHyjL4uJgfUrR8iGt11Tc8tWJRotaK6//BK+qhLxFPU2tjCI+BPTK+dBBqGzRWx77zS5j3wvGBdtUwJ4W9fw15Kqr25JTtfgXdmQHQjITKSb8HGGtU9BsTqeDjLwPfuEEdGDE35yxZmZVC7v9VqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUuJDzhtqWV8MizXMEzypFWHnMPL5vx7s3pk+Wl06/Y=;
 b=GGL/jVE9B14azQma2pm6ZNMgA/HO2dIW4w2Lfrto5gIriLs3C93soUjJhOFEQinDCcV25IwcwGVwPdi1eUYRQNsATexcKrWlp69eEMmixL32H27RIlVERISYarwpnyRnr+OSUgl9DDnlN9PPxAacluWyVpjNJwKn3EOwmq1+g2xmnlxphr7Inc5Fg+zCKu5BNCJJ+BsAxjy8KvI3I33PR738a2Cg2NFnVkYTs13AYpq4mKMU4iKL7c1Gk17DNy0L47U4oqM2VrFid8eIA+OjJ2BndNXLx/jL3oWo4UTq3kC8ySnRjMlPZmNNeaG/obB3Su3FsUteTZm9zQN1u78XKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUuJDzhtqWV8MizXMEzypFWHnMPL5vx7s3pk+Wl06/Y=;
 b=Qvvzar4mkp1Vs8XKfSOcEG1ZIiZ7ntYCMUJzKJb8CBKdhBMz2ikLAAYpa7H0wEJ1rXOnFwXQyYeUTDoqyAzGE6uO4dzIXjGffD7Fjxnnrtlo8skLIyusRXqnRVIohqsC7DZ8eWW8oZ5dg8I11sLedl89cUoNxfXkHpDGyG4IYoo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3679.namprd12.prod.outlook.com (2603:10b6:208:159::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 14:26:28 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 14:26:28 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
 <8c675723-b272-3d81-06c2-fe574a1dff06@gmail.com>
 <BL1PR12MB52691420DCC3A00794168A1284C89@BL1PR12MB5269.namprd12.prod.outlook.com>
 <de91a9d5-e223-3f5c-5226-e1261987a5cb@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <57713f72-caf4-3f33-d594-837875178ea4@amd.com>
Date: Fri, 27 Aug 2021 16:26:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <de91a9d5-e223-3f5c-5226-e1261987a5cb@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0902CA0015.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1ea5:a2d5:a05c:1ebb]
 (2a02:908:1252:fb60:1ea5:a2d5:a05c:1ebb) by
 AM4PR0902CA0015.eurprd09.prod.outlook.com (2603:10a6:200:9b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 14:26:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 552069a1-c364-486f-60d1-08d96966a8a2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3679FB7B1B12E6AAE2F827BB83C89@MN2PR12MB3679.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mFw8oJNOZVeJ3ifMPA6b4/H37X1MTejRruyTQnStpQ36OxgjQVFSVPKNEsdyNNlRGoTWCr3zdelaCVcE5ioIXdmqx02kkaWMrLqg+rUdQLkiNe9Eo6TfZKUnKAsXMZvxWGqjuGJohUpc38gWq7nWZoYkaInAhxYj+EaRL5VXYIpQrlBD8LSzKsy/8c4JGVgf3Z+2jsrEVDtEcuodnzZp2LJG3OQprP7JWsIXGcpjthCya0s1Uy31iYtMdSpdaS5YflWIKummcY8CZnYk8LqLYi9BMw19vvljqL3atmm6e61+I/8fysVwvenytKPT7IiefXwXDKucyvG6ElqAOHH4NA1ui7QG/5jG8cCJmd/C2MsmZDWHcHAEkto9TMejOSlDrlr9WhMSvLUG8131VpT/mslElKfFpP4beD3mHCshHxKh1fp7hVl35645gEcgBOcnbkibiTQzvXL4AupMkE2f5YeSyYgpPtXYpQEg+VnYenRpBQ3nYR5fgNfIRom5N+cvBzEYgNmeGke/zneUvTtHRmhUVnN7OkgqrIkMvb70cx18L2+mJwmWDxDHX+0yc4drxovHeGBYeT9Lx7yB0O2l2i0wquj4TEYhDnTiLvbbIpir24LPYTQxZO4rUOdjPqb+fphWcBlg8wxDZepxB5nIm1UTxpPf5Bm+5R4VlLOXuIor0PdNkgIUzJzEsXO5Vels12zKMLxuR8MjmCoJm5JsnzyzXozByJvFhfBOWDIxCCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(316002)(31686004)(38100700002)(110136005)(2906002)(6486002)(66574015)(36756003)(83380400001)(4326008)(86362001)(5660300002)(66946007)(66476007)(66556008)(186003)(6666004)(31696002)(53546011)(2616005)(8936002)(8676002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T09zdlZYTjh1alRWRTBWMDdCbDltMTBrZnNNeXBhbjRzaU5lMERxcDRCb2NT?=
 =?utf-8?B?dytXaityVnh2T0k2SkZQSStQQ29qR0RIcEQxYlRvcjdGamhGK01XNVh3dUFK?=
 =?utf-8?B?eXc5TTJLdk1xbkFQaEFVaVBQbFRXS2hXMk9QU0M4SlRzRGd6d0pGSmhhK2h2?=
 =?utf-8?B?NEVTa0I4cjBLQWdsTHhyTGxkMzVMaGRZdkVRS1ZPL1BqakVkVHZOM1dudXlJ?=
 =?utf-8?B?TlQyTEUwZzhVall2Zk5HTEE4QnNFYURuK0pDNmVTY295RVpldnU0cnhTditN?=
 =?utf-8?B?SVhNTkZleTZ1Nk55L3orWnlwT0dleVZWNG9sUEROUldmSFVVNDQyWWU0bG9I?=
 =?utf-8?B?WFFYY2Vxa3BLaFF1S2xQWXBqVWU0MDVONSt6ZnVJNlRreFJTTHN5WU8xL3F4?=
 =?utf-8?B?WEhMa3NnSGNlVUllY2QzQktWVG1IQWV2R0l1UWhxS2QrL0lJUG9ZYzM3WHl0?=
 =?utf-8?B?UndldU5VMTF0Uk9SYUNrUTJ3RGJzNStpU1VrdVhsbWt0WjFMSGRURDh4bndX?=
 =?utf-8?B?Njd1NTM0VEQrWjBwRG5uVndBanhPRWtoVmVuM1l3L05xaWZYVTJiQWVBOU5o?=
 =?utf-8?B?WE9GSEZGam9BSFFXR05oOXhvOUZFQWh3b0wxcFJhdU5wWFJBdTM4K0ZFYjdG?=
 =?utf-8?B?VUJVWWkxUEtLYlFCa3R3a01YNEJMT1VXUG5VdXhnMkhFeEh5SU1HVHkwSjZh?=
 =?utf-8?B?eWJMUWZQczZycjZyL0VsRVVLVlVCSWt6V0tpU1JuQ2Z4SmlZbElsRS84ZHJs?=
 =?utf-8?B?a2hqYzJwSGdkRFFjeHhJeTJ5dkVVVVV2SSt0Q21wampZUSsyQlRiL0hzTmpn?=
 =?utf-8?B?ZUJvdnR6UjY2V0VjV3BPVDk2cDZ5OURWN0t4RTUwcndnL2dxZlltQTh6MVdk?=
 =?utf-8?B?UlI0U3VRRjFpcHZlSklWQ0RkUUY1eU9GYXh6S01TaHBGUFk2VGFJMkthL3F1?=
 =?utf-8?B?MW1yV29tbEp4QUJ3aEJ3d016NmZmSW5jbGtJUmJsSnpVb0lzMTdRTTZWK2Rq?=
 =?utf-8?B?REZVRlRwdG5OWjNWNG4zQ1h0b0NZS292SS9oUmhNeHpyeEFuVzBNWUhoZXJS?=
 =?utf-8?B?b05TR1M1aDJnYzcxK04vMmJtY21QNHlWTXdqRTBubzBCcWo5Qjl1eElTVUJt?=
 =?utf-8?B?enNIdnRSUW5PK1h3ekNVUzZrc3AyRnp6OEFPYUc3aE5NcVhBNGRpdzluLzBs?=
 =?utf-8?B?clZLRHZCT0l1ajUwKzZiZWh4L0hWWUVubk1EbllRZE5BOW1DUW1saDZpMFdt?=
 =?utf-8?B?VjVKL2JsSnFHVTB3WWpDWlhwSTMrZnlTSkdmKzA4cnAxQTJoTDIxMjR4WXZF?=
 =?utf-8?B?TWdmN1pzcDMvRjUyTndab2UzYXQycHA3bGx2VktXM2VFcXd1NkdYOE5kRk04?=
 =?utf-8?B?RzZ0cVR0TnZiWFdvTjFWRm51a3JoaXZ6UDgrL3ExRndDdnNtUXJHcFE5dXpK?=
 =?utf-8?B?THpneWY4VlE2RC90aFlKWHdPeS9ENXMrdldtN3JoVndtTlFQRFhQRlJiOUxR?=
 =?utf-8?B?RXZQbGIwalZqYlJDQlFqV1NMR1lRMitYd2kwZlJMYlZLVFdPWmtwdU5sQ3JX?=
 =?utf-8?B?V0ttcjZaNUNKOTBEcTdKNmQ5Si8yZkRhU0VFVWxPM1V2RGFPVS9LSWpDS1lC?=
 =?utf-8?B?K3R4N1FVTGNGVWxsK3JCWTdRcDErLzlNaUxYQTR6VUk4Q21UaHVTVUllR09O?=
 =?utf-8?B?eGprcWpuZmhDTGtuK0pvTUFScXR1Q0pJV3VIaWxkQ2xKdDhJRDJyTHh4QVRq?=
 =?utf-8?B?QzNDYmtKVGYyR21FbnUzT2RWeHMrUm9VKy84TlY4WURPZGFJYkxFbm1uWHpx?=
 =?utf-8?B?WFVEcGdVRUFWOURBK3luUVlQMzNpeUdOb29hRjd3MkVyclhSeXRvYW5EMlA3?=
 =?utf-8?Q?5hXiyXUc7KGWH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552069a1-c364-486f-60d1-08d96966a8a2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 14:26:28.8209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aao6cSma/myvy2ZqbGcBemckwRv8xym09MvfakboOBCIyKZeQMS8R2zg9Fk65OiW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3679
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

Yes, I don't see any good reason for that either.

Christian.

Am 27.08.21 um 15:45 schrieb Andrey Grodzovsky:
> So we agree if (kthread_should_park()) return NULL should go away ?
>
> Andrey
>
>
> On 2021-08-27 3:46 a.m., Liu, Monk wrote:
>> [AMD Official Use Only]
>>
>> Yeah, that "kthread_should_park" is also irrelevant looks to me as 
>> well and it delays the signaled job's cleanup/free
>>
>> Thanks
>>
>> ------------------------------------------
>> Monk Liu | Cloud-GPU Core team
>> ------------------------------------------
>>
>> -----Original Message-----
>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>> Sent: Friday, August 27, 2021 2:12 PM
>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk 
>> <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org; Koenig, Christian 
>> <Christian.Koenig@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
>>
>> I don't think that this will be necessary nor desired.
>>
>> See the job should be cleaned up as soon as possible after it is 
>> finished or otherwise we won't cancel the timeout quick enough either.
>>
>> Christian.
>>
>> Am 26.08.21 um 22:14 schrieb Andrey Grodzovsky:
>>> Attached quick patch for per job TTL calculation to make more precises
>>> next timer expiration. It's on top of the patch in this thread. Let me
>>> know if this makes sense.
>>>
>>> Andrey
>>>
>>> On 2021-08-26 10:03 a.m., Andrey Grodzovsky wrote:
>>>> On 2021-08-26 12:55 a.m., Monk Liu wrote:
>>>>> issue:
>>>>> in cleanup_job the cancle_delayed_work will cancel a TO timer even
>>>>> the its corresponding job is still running.
>>>>>
>>>>> fix:
>>>>> do not cancel the timer in cleanup_job, instead do the cancelling
>>>>> only when the heading job is signaled, and if there is a "next" job
>>>>> we start_timeout again.
>>>>>
>>>>> v2:
>>>>> further cleanup the logic, and do the TDR timer cancelling if the
>>>>> signaled job is the last one in its scheduler.
>>>>>
>>>>> v3:
>>>>> change the issue description
>>>>> remove the cancel_delayed_work in the begining of the cleanup_job
>>>>> recover the implement of drm_sched_job_begin.
>>>>>
>>>>> TODO:
>>>>> 1)introduce pause/resume scheduler in job_timeout to serial the
>>>>> handling of scheduler and job_timeout.
>>>>> 2)drop the bad job's del and insert in scheduler due to above
>>>>> serialization (no race issue anymore with the serialization)
>>>>>
>>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/scheduler/sched_main.c | 25
>>>>> ++++++++++---------------
>>>>>    1 file changed, 10 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index a2a9536..ecf8140 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct
>>>>> drm_gpu_scheduler *sched)
>>>>>    {
>>>>>        struct drm_sched_job *job, *next;
>>>>>    -    /*
>>>>> -     * Don't destroy jobs while the timeout worker is running OR
>>>>> thread
>>>>> -     * is being parked and hence assumed to not touch pending_list
>>>>> -     */
>>>>> -    if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>>>> -        !cancel_delayed_work(&sched->work_tdr)) ||
>>>>> -        kthread_should_park())
>>>>> +    if (kthread_should_park())
>>>>>            return NULL;
>>>>
>>>> I actually don't see why we need to keep the above, on the other side
>>>> (in drm_sched_stop) we won't touch the pending list anyway until
>>>> sched thread came to full stop (kthread_park). If you do see a reason
>>>> why this needed then a comment should be here i think.
>>>>
>>>> Andrey
>>>>
>>>>
>>>>> spin_lock(&sched->job_list_lock);
>>>>> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct
>>>>> drm_gpu_scheduler *sched)
>>>>>        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>>>            /* remove job from pending_list */
>>>>>            list_del_init(&job->list);
>>>>> +
>>>>> +        /* cancel this job's TO timer */
>>>>> +        cancel_delayed_work(&sched->work_tdr);
>>>>>            /* make the scheduled timestamp more accurate */
>>>>>            next = list_first_entry_or_null(&sched->pending_list,
>>>>>                            typeof(*next), list);
>>>>> -        if (next)
>>>>> +
>>>>> +        if (next) {
>>>>>                next->s_fence->scheduled.timestamp =
>>>>>                    job->s_fence->finished.timestamp;
>>>>> -
>>>>> +            /* start TO timer for next job */
>>>>> +            drm_sched_start_timeout(sched);
>>>>> +        }
>>>>>        } else {
>>>>>            job = NULL;
>>>>> -        /* queue timeout for next job */
>>>>> -        drm_sched_start_timeout(sched);
>>>>>        }
>>>>>          spin_unlock(&sched->job_list_lock);
>>>>> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>>>>>                          (entity = drm_sched_select_entity(sched)))
>>>>> ||
>>>>>                         kthread_should_stop());
>>>>>    -        if (cleanup_job) {
>>>>> +        if (cleanup_job)
>>>>>                sched->ops->free_job(cleanup_job);
>>>>> -            /* queue timeout for next job */
>>>>> -            drm_sched_start_timeout(sched);
>>>>> -        }
>>>>>              if (!entity)
>>>>>                continue;

