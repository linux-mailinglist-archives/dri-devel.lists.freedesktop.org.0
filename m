Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E778C3F0714
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E606E81C;
	Wed, 18 Aug 2021 14:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2066.outbound.protection.outlook.com [40.107.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444906E81C;
 Wed, 18 Aug 2021 14:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct8Q+mbbk4PCrvr2oMWAAUJ9azNriA3LUu+2Qi7PSjvJvcSEp3Ic5Qtmn+5B3wIFqUULhZZnqV7Kl3oGwLM5/PeMwUNcJAn1ZuP+PGaK36ihvIzaw+bDBIOS/fYJndz48ecjVFY0HRDhAIKkgmILF6gJemiL2GELrDxBU12PJBzA5ckP0gNWLiyMV/DcOiTh37uyYAkEijM3akUga/6+AbBQWnOd3LYgypeEoRxCCmu5dcT4Pyw49wR0C/UoChE2X+NDwcYTBr5pt/vWvj2ySrfqj3WDqvSFfzTyCzcT4AwQtf6mMJ9dJxG8qSBhvz7s5zEvtyYcIebKe+8XvH7E2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMouY5cPeDnwj3WgIrmcLJgiOJYMB/z3yrQC7CkE4Xw=;
 b=P9MlDPEB9TRvr27k7OKutp6lwIIPl/NG6u6NPL9/Q9O/+o9ypjkSeVOdejrEQ2fG1IHqj33L0o3zGgXZ3kBpXtutdOXQuIeGJvjS3ZTQ4rDnDrIa/0VyUwBhzUSqlop9qjqxidiIoC6+VOtsYvlJS8LIzaM6tuHcztW3aQJWyIl2Du7tGIEckOO2lMuHZLuNPybpXp9UxdsDMn/eiXsgWdEArIKGezqRpzPIfywD6KKAEuXGtEgSqyaIV/7sR+607pB77/N0yFNkAundUCLxXS8XIim/1NusHVkZYUJh/LStFSRq17BMOvhBm9xKu8UNBbgTmIX/V6ekSGEWLaHDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMouY5cPeDnwj3WgIrmcLJgiOJYMB/z3yrQC7CkE4Xw=;
 b=IUOvNVIV1DsSToRjeA1DxIB5+8co8dcC0yV5uWIrz/rA6Z3P/DCxYSKzk/g+gW7TAiNb6pSyOEQAtm75b6JO0s9moT/PU27ezP7gmbOiVKrsI10S2VFyW1BCTn74QI5NsIerrDuZwbgRlaciHgU+V21M80sPm4NYNUQqKlaPJt0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2654.namprd12.prod.outlook.com (2603:10b6:805:73::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 14:51:03 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 14:51:03 +0000
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Alex Deucher <alexdeucher@gmail.com>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "monk.liu" <monk.liu@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
Date: Wed, 18 Aug 2021 10:51:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::41) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:8030:531a:c97a:dc26]
 (2607:fea8:3edf:49b0:8030:531a:c97a:dc26) by
 YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 14:51:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd71daeb-0519-43ce-d923-08d9625799a5
X-MS-TrafficTypeDiagnostic: SN6PR12MB2654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB265447AC96930BB6288852B5EAFF9@SN6PR12MB2654.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnRnTN58u7BPWoSnGTKGjYXWI6g5sIPwhtRLXPLTFjM89zELW/OY9IanSV53CofaidyxoYWEC88y633WDTV5lxmlvHoIVmD2k8r7kVhWiUOsh5LQl+cBj3QjMC53xCAAcUB8gPUh81BTffvfCQsRkNbo27t+zOVB+qT/XuWAtZhMOqp/bQmBgeYsZ2M5nZaQ0MrJ0JY5XIo2Syjrnn+BhcUe+BNyOsNoSmJEfZXJSwdf4z7kH6BI1EMAbDEUljmHjj+xdvvALe0HM/nwXiYdDkKvHwzOxidoKY34hOLVakCxUQPKYWH13JNV1vZHWiuMSrtSXzeHEhJsRvuD7fbYlknTHzVp3NNPWIdaHj6Rh8/hjaAAYLHN84xwfvDQgU2iAe0/6nsx4zgFCpxlry1UHChRFOwO9a/UB8VyeME3JiqvNjcmyA2oCsHW0mooGg0o9TKCsLi/uNhZL4UJ2wfZ2KPgSww6SeggM7S+jqbtGtub/oOt7GPpgImt+Ki05FuGeU/Lkqh1dra2wNVtTL+GoWZVWjkGb4G492zs/EZ8UpRM7sOr/97oGg5DSLiQDbuopbl+zmWMCSyy/1cm/2BzGz1K55meI8XuG1z48L39acmHIdjuHaK/1VIB/vLJfgvICQIXX3sAoMF6PfP1HgOzgx5JyjB7KvimOBKR7tXgNuIm+JnFCxNKniKYOYMZQfMlDOYiHNEhoxrglkVJkeF9yf1UGl550z3yG1TLfj64rd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(4326008)(2906002)(2616005)(83380400001)(5660300002)(53546011)(478600001)(66556008)(66476007)(6916009)(66946007)(36756003)(44832011)(8936002)(31696002)(6486002)(31686004)(316002)(86362001)(38100700002)(186003)(54906003)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEl0S1laaE1UdUJzb25XaDlMUzBhTXkyckpocjluKzFYTWE0WEl5VEFNbmdY?=
 =?utf-8?B?ODZxMzlEOGxlbTZYdHh2eVVRNlZ3Qlk5aVlZMjRNanMwYUE3dmV5U05wWHIy?=
 =?utf-8?B?cTRrWU9KSVI3NW9uT2tnZ09KUWhjU2c0cHFVQjNDWkdPc09UcWt3ZFNLYStR?=
 =?utf-8?B?OHJwSWQvYVdrRnNGcU1OVXRWNncvcU05OFhTNkFxcEl5bFBid2s3ZXBFeFRD?=
 =?utf-8?B?LzhHT0pCOWc5RjhRYUJJRS9ST1luQlJydi9tUjV6dWJacEtWc0ZaZ2dEbmR2?=
 =?utf-8?B?eC9uWmwxb0NsdWFvNm5IRGlOOTNCZjJIbVBVaWdyL0t4RS85cVlqcnBJK0l4?=
 =?utf-8?B?ZGwvZmsrei9raWNVczV6UlZtU2IxMkI2MW5qWEx6L3dXWWNOOUlpWmZYUDlY?=
 =?utf-8?B?WVpNQzQxVStTQ3lUdVlENlVQMFk2bitwUHlNRndtRmFkQ3NZaEc1SWtraTZ2?=
 =?utf-8?B?U29QclI3NUtmTVBnWnhNQVRSZk9PcGtvNytPOG5XanJXSUhGMmxMc21FYjNI?=
 =?utf-8?B?ZWpvYzc1TVgxeXZvMnpkbnBmejZhcHAyNEdtTEZVQTk2d2d6a3pVd3VVRkVQ?=
 =?utf-8?B?c25xZTJzTEQ2YUFEU0tkVjRsaGVBMXVWUUZKOWxqN3ljYmFUNVVQYlE1ais0?=
 =?utf-8?B?UnBIUGVITjlkc1JxR2NVTktXTlB1TFMwQ1A3YmYrUnBQNW1uclFhMVdpT1hS?=
 =?utf-8?B?cWhuSWhiTmJwc3J1ZVdER3U5T1d3L0xWRXFjRktkSjQyWlh4SC83Rzc0TG5F?=
 =?utf-8?B?YWNheUhvSXcyWjVzUi9MRzhzci92Z0tzaXhjbTBUK0dFQ0ZHckhFdVk5SzhC?=
 =?utf-8?B?TTByUU5QUTlLMW1xemRhSEtRMmg1ZGtNM0prWW1PQWRHNGJURUVmY0E1Q2pm?=
 =?utf-8?B?UmlNZTRsby9pNnl5dVprNEdnVVFsQ2Y1KzBVYmY0Q2x3Zlp1UHJsdVhLcHow?=
 =?utf-8?B?OS9rQW5SSmkwMXl3MzBFdzd3WTZjTWVwWTZNQ3N4NGdBYjZIK3E0anZaQXlp?=
 =?utf-8?B?ZWRZb0VTWmtlMk55cVJCYWFHMGR0OHBZQzltelU5bnU4NUFNTnl0VHRqVDhm?=
 =?utf-8?B?VUdNVmNtTStkUTRFVmhtR0kwK0Q3K1o5WWM1NmJpTzkxTkQ4WGNueHJFb2d5?=
 =?utf-8?B?VE82aDVLRElodkFhWThuYkZDU1lyV243R2NmSmd5ZjQvWHJIVmh6Lys1MnA0?=
 =?utf-8?B?Y2tFdGlDeThPOVd6UHJlTkNvMXV5dE5SQ21YQjJCR05KWkt1NTVwWnVQMjhs?=
 =?utf-8?B?QmlHL1NVQWxqNUhUcTVHS0ZSWlZBVzlhMU4rVWVBSFNHQkxkUjlTTno2NnBt?=
 =?utf-8?B?eEwrSTVyQW1UenFJSEl4bVY5ZmlnUUprUUpWMHZndThETTJwY05vcGswT2xp?=
 =?utf-8?B?cThNYUpwTDkwZmJGU0dIRXdZUnd5VmdnQ0djRWVtV2d1SVBiRVI3UEJVRWpl?=
 =?utf-8?B?U09DZzVWb1NZTmV6RU44QmpSTlJGcU54VUJwVTFQckljYWhxYVpySXRhV1VE?=
 =?utf-8?B?eFY4OWlDQ2NZYlBoUzltK2QxanpPQ1REcVlBbnlvQW9MK0JRUjJnanQ3dEdM?=
 =?utf-8?B?T0o1M0NYTVFIemt1bUs4b3RUVk5kOGx2NENoYWpWQXc3TUQxWno3ZFRUVEhj?=
 =?utf-8?B?SURJd1FJeGorTmhyUXU2cWliOFROK1hsbkV3OGhuTnZvL3BEbjhqRlpEeDg3?=
 =?utf-8?B?Zk1LNTFDdG1heTJscHlDTVF0a1VWMnBnL3NoNnYzMlVydnpURVBYWmt1SUVT?=
 =?utf-8?B?UDhueEM5RlVrRmgxaG1RWE92aTg0TnJIYzFCSGtxcGpRQ0VhZlltbkI0d250?=
 =?utf-8?B?VThiVStBck5hQXRSQ29GYjdUVDdSOTEwbGxsWXJQMUNrWnUwUm9YMHNBM3VF?=
 =?utf-8?Q?vtW2LdAY6k37I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd71daeb-0519-43ce-d923-08d9625799a5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 14:51:02.9975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jv4ZsaMOq9TEyLW3IqdTu0TDxjO+YAU6KIHtigMkWghuh6QmAxkvy6+TxMavj10M7ZwFXjqXbyU7lqIQvW0c/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2654
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


On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
>> On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
>>> On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
>>>> On 2021-08-18 10:02 a.m., Alex Deucher wrote:
>>>>
>>>>> + dri-devel
>>>>>
>>>>> Since scheduler is a shared component, please add dri-devel on all
>>>>> scheduler patches.
>>>>>
>>>>> On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
>>>>>> [Why]
>>>>>> for bailing job, this commit will delete it from pending list thus the
>>>>>> bailing job will never have a chance to be resubmitted even in advance
>>>>>> tdr mode.
>>>>>>
>>>>>> [How]
>>>>>> after embeded hw_fence into amdgpu_job is done, the race condition that
>>>>>> this commit tries to work around is completely solved.So revert this
>>>>>> commit.
>>>>>> This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
>>>>>> v2:
>>>>>> add dma_fence_get/put() around timedout_job to avoid concurrent delete
>>>>>> during processing timedout_job
>>>>>>
>>>>>> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
>>>>>>     1 file changed, 5 insertions(+), 18 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index a2a953693b45..f9b9b3aefc4a 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>     {
>>>>>>            struct drm_gpu_scheduler *sched;
>>>>>>            struct drm_sched_job *job;
>>>>>> +       struct dma_fence *fence;
>>>>>>            enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
>>>>>>
>>>>>>            sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>>>> @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>
>>>>>>            if (job) {
>>>>>>                    /*
>>>>>> -                * Remove the bad job so it cannot be freed by concurrent
>>>>>> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>> -                * is parked at which point it's safe.
>>>>>> +                * Get job->s_fence->parent here to avoid concurrent delete during
>>>>>> +                * processing timedout_job
>>>>>>                     */
>>>>>> -               list_del_init(&job->list);
>>>>>> +               fence = dma_fence_get(job->s_fence->parent);
>>>> While this is true for amdgpu, it has no meaning for other drivers for whom
>>>> we haven't
>>>> done the refactoring of embedding HW fence (parent) into the job structure.
>>>> In fact thinking
>>>> about it, unless you do the HW fence embedding for all the drivers using the
>>>> scheduler you cannot
>>>> revert this patch or you will just break them.
>>> btw, why did you do that embedding? I do still have my patches with
>>> dma_fence annotations floating around, but my idea at least was to fix
>>> that issue with a mempool, not with embeddeding. What was the motivation
>>> for embedding the wh fence?
>>> -Daniel
>>
>> The motivation was 2 fold, avoid memory allocation during jobs submissions
>> (HW fence allocation) because as Christian explained this leads to deadlock
>> with
>> mm code during evictions due to memory pressure (Christian can clarify if I
>> messed
> Yeah that's the exact same thing I've chased with my dma_fence
> annotations, but thus far zero to none interested in getting it sorted. I
> think it'd be good to have some cross-driver agreement on how this should
> be solved before someone just charges ahead ...
>
>> this explanation). Second is to exactly revert this patch because while it
>> solved the issue
>> described in the patch it created another with drivers who baildc out early
>> during TDR handling
>> for various reason and the job would just leak because it was already
>> removed form pending list.
> Can't we reinsert it before we restart the scheduler thread? It might need
> a separate list for that due to the lockless queue tricks. Or am I
> thinking about the wrong kind of "we lost the job"?
> -Danile


If you look at the original patch it would reinsert it even earlier - 
right after stopping the  SW scheduler thread, and even then it was to 
late for
some drivers as they would decide to return back from their TDR handler 
even before that. It is solvable but in an ugly way as far as I see, you 
need to
require each driver in his code to put the job back in the list if they 
do it before reaching the place where scheduler framework does it. Kind of
spaghetti code seems to me.

Andrey


>
>> Andrey
>>
>>
>>>
>>>> Andrey
>>>>
>>>>
>>>>>>                    spin_unlock(&sched->job_list_lock);
>>>>>>
>>>>>>                    status = job->sched->ops->timedout_job(job);
>>>>>> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>                            job->sched->ops->free_job(job);
>>>>>>                            sched->free_guilty = false;
>>>>>>                    }
>>>>>> +               dma_fence_put(fence);
>>>>>>            } else {
>>>>>>                    spin_unlock(&sched->job_list_lock);
>>>>>>            }
>>>>>> @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>
>>>>>>            kthread_park(sched->thread);
>>>>>>
>>>>>> -       /*
>>>>>> -        * Reinsert back the bad job here - now it's safe as
>>>>>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>> -        * bad job at this point - we parked (waited for) any in progress
>>>>>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>> -        * now until the scheduler thread is unparked.
>>>>>> -        */
>>>>>> -       if (bad && bad->sched == sched)
>>>>>> -               /*
>>>>>> -                * Add at the head of the queue to reflect it was the earliest
>>>>>> -                * job extracted.
>>>>>> -                */
>>>>>> -               list_add(&bad->list, &sched->pending_list);
>>>>>> -
>>>>>>            /*
>>>>>>             * Iterate the job list from later to  earlier one and either deactive
>>>>>>             * their HW callbacks or remove them from pending list if they already
>>>>>> --
>>>>>> 2.25.1
>>>>>>
