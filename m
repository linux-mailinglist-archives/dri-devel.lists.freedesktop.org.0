Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ACC3F7C20
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 20:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8856E40B;
	Wed, 25 Aug 2021 18:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2075.outbound.protection.outlook.com [40.107.102.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02656E40A;
 Wed, 25 Aug 2021 18:20:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxBQmYyk95CgZfH5v9FojAvBIfpUkpOuBQcgjiaHA71a1MX6+49IC526FoFxyVSkgI5sSxo5Gotv64qWo05p7X3nhDE7NnuQwt2/TlmMhzkOQltmf7x7KOpPx6KoQiWcrgzfGE9RC3nvgNoKnZFrCkQU6nJC2AOuwpZz9+ZnNean4vcnLfyJefkPSufvkXd4iY7N8ipkceStwVKq+GWwzievfxZERWszBwYo2N6ULl0hVENMT2VEdATn+Ey/1GdFoy7cIbHxgLLk57IGl/3iH0H6pgTMY58XpTuvGF0sZTttyAc23MqjOHd2NyFetwhALB9m5QEnywPKR7fo3g5Sdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnRQeyNn3tZ1pDTLQztQs2uH49M5BG9vc49n4tFOcAk=;
 b=DOvS0EOTBWHGDxfsNVJGvVP7N4NeV3sV6FaKYWXkZB9EAUx47ygxg0ZjzwMyrUr4uG8eKw3oI6utdAxgxekPn3vvXYlEJfrfT1Ii9OzAj5N9pyMW338ukz81u9Zbo8WmB6DeKTKpmpPqoYHaB0icXQcKLqL9nz+IcP+ccLZIRt7kKUE+3QvPE+T6KZBfLKlxELz2ErON/5Cp4bnYN1ihzDOA4k7x8Ko7EuMVzDp4SG6EQ7PBotestZclyRaSGE/VYntg1rSrXdnGnBzG5cEucU/n+87xi109PCVCr6k3DESQDaJpByEhjlvXd4UPG21xpI0Uan2LGMROzvChqDmigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnRQeyNn3tZ1pDTLQztQs2uH49M5BG9vc49n4tFOcAk=;
 b=SFWW5ifEeUpAk9A3DgHubCG33Y7qQo6sj08YXitHA5oL8Kh+QnP8+h4caAExoJJx4futyyZH9aXMr2YLyi5qdCcnhp0Wpgky4GmXiK5wC7X3ER1ZI7k2iYGm0U48nloytiFKr9wL3nzZpo5IFKripMUfd51Bko48Ze51NTs7P1k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4624.namprd12.prod.outlook.com (2603:10b6:805:e7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Wed, 25 Aug
 2021 18:20:25 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 18:20:25 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v2)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <1629864857-4252-1-git-send-email-Monk.Liu@amd.com>
 <1ef452fc-1f76-8dda-1c74-c540576fe6c6@gmail.com>
 <BL1PR12MB5269567906F233C0B938C32C84C69@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB5269E736907243FDF42D97F384C69@BL1PR12MB5269.namprd12.prod.outlook.com>
 <fff92742-6d09-430d-1dd6-5e0bb7f6a311@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <5d0bbee1-599f-1a84-a9b0-0d70d6239255@amd.com>
Date: Wed, 25 Aug 2021 14:20:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <fff92742-6d09-430d-1dd6-5e0bb7f6a311@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d73f:dbf6:dbb5:c86d]
 (2607:fea8:3edf:49b0:d73f:dbf6:dbb5:c86d) by
 YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 18:20:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85774ffd-f8ae-4307-375e-08d967f5023d
X-MS-TrafficTypeDiagnostic: SN6PR12MB4624:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4624B0C76B33BF035AFBF3E4EAC69@SN6PR12MB4624.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3oa+K3Hjn3AqAOXGOOmTzXL/jdIVXp0JwblW7trPBF8kwNFraZCGwQZaBh5xNOlRLGn24mPvcPDbyXnuHWiI2sg29ZSKd9Loll96Qlmrch4ksKFvtBjV/ObNoc7CMWxfj7Noyw5iruiwhDnTFNsMGyJHfyE52tvIiSblnDOyuZbyAdyM+YXJ/6C40Oud6eOB6DTkCu1vwKbMcgHbV8+JF3kzXlnKrimsQaOZxd5nzdEBvtpaNECPppBP3Hx02EBPSZ0bjSif6qm4rUyCFjDwWoQ8SCo+kb0FgIa/ljde+dQvujvQpqSumrDU6fo3TmYe5hXvkBxy4WPN4HNQQEfpVsgAHEWhbdnYMcC4lrE7alpQgklLKqeFzmmCspeJXwRrU1fJM79Jc31Mhk96YItueomQT/AEebLsybxz9WQduVPzrlOgIS6aWN+hjNgJwX1oV1KkPrI2dJoFWLL62eXoCW08EXDpUrWQBaz/8C5COpjd1nGj0rkob3CCLX7f37iWIKnuq32TTa93u7RUXgv8BsyJgq4eE5HuNEOsdFUNS2d8QSJXeuD7/1jj8F2o4xm2cBVCysqvO/AVichiQTR4en8cVj1fXCObnZ8r45UAqBbds5rDjeXA9cgzGyvp0atKAIltX7MdrR14c9ye6L6vsu2S/DszUVfbv8vrkxBi68mMe1uaBWc3uCrol8L3e6zSM3add4Wsmhq8f0Ml9wZQVIK4Mw+9h12J1RXP5rHxVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(66946007)(8676002)(478600001)(6486002)(66574015)(38100700002)(5660300002)(31686004)(8936002)(186003)(31696002)(36756003)(2906002)(44832011)(2616005)(316002)(66556008)(83380400001)(66476007)(86362001)(110136005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXREZDNoQi9CTTYzNVpJeU5VN2hoQitsTm5tZ2dkQXNOd000WEdoRnBmY1Q4?=
 =?utf-8?B?Nzhhc0pveXBQd2l5cnhpUC9YT01IbFRMLzgybU9CcmZlVXh6NzQ3TXBoaGll?=
 =?utf-8?B?cjRCWlp6TlU3azUzTUNLcWZWdm5hYzM0VmEzV0RPOGtSZCtuSWtaL3JXVEw1?=
 =?utf-8?B?NHZmK3lLQkQvTUN6OHZNbW4vNGdXNUo0L1NUTnY3UGRFRklHdDRoeFNScXBo?=
 =?utf-8?B?L0s0dE0rbEFKR2Y2cVpJRzU0bWdibG5BSnM3bUc5SjNFbVFhYnN4NmxJdHNs?=
 =?utf-8?B?Z1U5VTJLS3ZJOFNQb2wxYk40TnVidE1meXhmV1h6MmgvWHNiSFVxRVhQRFF4?=
 =?utf-8?B?NGxVZXU1S1d0TXYxcWlScWNTTUVvNTNrTWRQY2Q0QzdFL0o1dWxnblQvY3dS?=
 =?utf-8?B?TWlKL1Z6TytSekNvTFVSUlZ5RXRGYTk4VGdpVkN0S2dnUkMycWszVHlES3JC?=
 =?utf-8?B?bnRWSUFTZmtkSkxGc3pUWk9WQ25PVnZUb2VzZlcrQjBzdTRsdk41VElsV0cy?=
 =?utf-8?B?Mlp5Vngrc3hLRzk4aURGeUtBSXl6dlhUamV0anJSeDlPaVVGc0daREdNREJU?=
 =?utf-8?B?N3JmbEJ0U2pNaTl3SlBHY01nclQ0SnpVOEFSbVJ2RUxLWkQ4ZU51Mk85WVlL?=
 =?utf-8?B?dlRPVDFidndncU8xTDV0b0VQQ1R4VTkweGNHdVhPempnT1orVUk3T3dKbXVI?=
 =?utf-8?B?L09RYWlZWHh6STBuQ2ZlT0NOcmdTMmE1NVFiaVg2bHh1QlQ2L3FoZ2x0YlFV?=
 =?utf-8?B?ZE1DTTVNSURoVWd0a1Q5UC9Ic09Xa1JHYzE0RG1MU1gxMnZ4d3NwODVoVTNz?=
 =?utf-8?B?MDE5ekJVaDl1VlBUTDZGV21POHBLUmhQOFpFOXpxMWNkWmJ6OWR3em0ySGhY?=
 =?utf-8?B?NXBWcGJUOTQrZmM1K2hJQ0VidVp0MVdJbklSV2dyZXNFTUlmcnpPVjRINjl5?=
 =?utf-8?B?REM0eWNQdjloWkU5aGRzMzV4ZXlrVyswQmY2eWtOOFcxQzVWYlk0MXdHd1I0?=
 =?utf-8?B?WDgycGtSajk0c0JaZEtoeFlWU3VRVkczMXZUcHpPbEh1eTI0NVBVQzdZYnk1?=
 =?utf-8?B?NmNsZk4yZzlzTEExTGJMSVBZbEh1eTNzZVZzOVJGU1pkNXNCNzVWb3RHZWsz?=
 =?utf-8?B?ZXg4OU9yYkUxQ2N0MFNnTTA5anBRdnlDYldDKzZla3VkaXFJUFZPNmdydmhs?=
 =?utf-8?B?N1NNNyszR2Y1Qll6eU43V0U1VFBpMGtScnUzVlBwZE1KY2xUWEJ4N05rdVlE?=
 =?utf-8?B?aUlKMG44R0JydU9YV1ZqVU9rWkcwcXJ3L05LSlA5VU5Qei9YYTNLZTRPWFc5?=
 =?utf-8?B?dytQOEcvaHFYSDN4NzRiS2NkdjE3ZDV1Q3h5UFF3cWp3Q2ZUSE9NdDRXekxL?=
 =?utf-8?B?cjV4NkdEY095NzJzS2kva2dkaG1YWC96aHRaZXVpaldBUlYzRWZzYTNCQUsr?=
 =?utf-8?B?U1Y3TkIvdWlzaWZxRFJwUE5IVjBCWmR6WlBnZE5nN3pURDVwUFZIWENTMXFT?=
 =?utf-8?B?T294YWhGdlN6bytZb0pkaFJwcTZDUXR5ZWkrNS9rUzlyVGhGS1ZMZXRZa3hj?=
 =?utf-8?B?Y1JkcjhqZ2dTUlpmNzF3dDRXRm82ZW5kdzhGZXRHb1FRczlrbUFWVVRhRVFy?=
 =?utf-8?B?MkNTeTNkcmZQN3M5UENUNXJJNk5KUTVGRXRqb3VXS3VkbnFmVmRHRkdXbUZk?=
 =?utf-8?B?UnBjRWdQV25HVyswVTVXQkJybXUwWjVGTDJ2VjNqYXlKVjA2ZyswZUJiWHM1?=
 =?utf-8?B?c2RFdlpOck9hVXU5aHdyK3BMR3lML3krc2VzajhFbXdjclBVY1c2QXoxb0dR?=
 =?utf-8?B?NVhualh0VzJzNU5xazNHcHpjbUEzNndFcng0SnlndGRrSUJpcUJCZHFYSU5B?=
 =?utf-8?Q?yhEVCf8PB1d7i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85774ffd-f8ae-4307-375e-08d967f5023d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 18:20:25.4469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RTgkV+YVbRhaenN3d5/1rEsZG4BbMX3jfJlxv0QeVA7a+BKgYtlrkGDG20kiXP+TM2jq3i3uVmEAprbLLdcgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4624
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


On 2021-08-25 8:11 a.m., Christian König wrote:
> No, this would break that logic here.
>
> See drm_sched_start_timeout() can be called multiple times, this is 
> intentional and very important!
>
> The logic in queue_delayed_work() makes sure that the timer is only 
> started once and then never again.
>
> All we need to take care of is to cancel_delayed_work() when we know 
> that the job is completed.


Seems to me you can only do it for empty pending list otherwise you risk 
cancelling a legit new timer that was started
by the next job or not restarting timer at all since your timer was 
still pending when next job tried to start it again (the common case).
For non empty pending list you have to adjust the currently active TDR's 
timer from your's
job TTL to TTL to the next job after you or just restart it as Monk does 
it here which prolongs the timeout more then required but still ok i guess.

What about returning to the old scheme of timer sched_work per job so 
each job has it's own timer and we don't share it and everything
is precise for each job, using the locking scheme we already have today 
the actual TDR handler will execute only once while
all the other arising from the guilty job hang will be rejected (for 
amdgpu, for other drivers it probably requires same locking or we can 
move this to the scheduler layer)

Andrey


>
> This here works as intended as far as I can see and if you start to 
> use mod_delayed_work() you actually break it.
>
> Regards,
> Christian.
>
> Am 25.08.21 um 14:01 schrieb Liu, Monk:
>> [AMD Official Use Only]
>>
>> I think we should remove the cancel_delayed_work() in the beginning 
>> of the cleanup_job().
>>
>> Because by my patch the "mode_delayed_work" in cleanup_job is already 
>> doing its duty to retrigger the TO timer accordingly
>>
>> Thanks
>>
>> ------------------------------------------
>> Monk Liu | Cloud-GPU Core team
>> ------------------------------------------
>>
>> -----Original Message-----
>> From: Liu, Monk
>> Sent: Wednesday, August 25, 2021 7:55 PM
>> To: 'Christian König' <ckoenig.leichtzumerken@gmail.com>; 
>> amd-gfx@lists.freedesktop.org
>> Subject: RE: [PATCH] drm/sched: fix the bug of time out calculation(v2)
>>
>> [AMD Official Use Only]
>>
>>>> The timeout started by queue_delayed_work() in 
>>>> drm_sched_start_timeout() is paired with the cancel_delayed_work() 
>>>> in drm_sched_get_cleanup_job().
>> No that's wrong, see that when we are in cleanup_job(), assume we do 
>> not have timeout on this sched (we are just keep submitting new jobs 
>> to this sched), Then the work_tdr is cancelled, and then we get the 
>> heading job, and let's assume the job is not signaled, then we run to 
>> the "queue timeout for next job" thus drm_sched_start_timeout() is 
>> called, so this heading job's TO timer is actually retriggered ... 
>> which is totally wrong.
>>
>> With my patch the timer is already retriggered after previous JOB 
>> really signaled.
>>
>> Can you be more specific on the incorrect part ?
>>
>> Thanks
>> ------------------------------------------
>> Monk Liu | Cloud-GPU Core team
>> ------------------------------------------
>>
>> -----Original Message-----
>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>> Sent: Wednesday, August 25, 2021 2:32 PM
>> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v2)
>>
>> Well NAK to that approach. First of all your bug analyses is incorrect.
>>
>> The timeout started by queue_delayed_work() in 
>> drm_sched_start_timeout() is paired with the cancel_delayed_work() in 
>> drm_sched_get_cleanup_job().
>>
>> So you must have something else going on here.
>>
>> Then please don't use mod_delayed_work(), instead always cancel it 
>> and restart it.
>>
>> Regards,
>> Christian.
>>
>> Am 25.08.21 um 06:14 schrieb Monk Liu:
>>> the original logic is wrong that the timeout will not be retriggerd
>>> after the previous job siganled, and that lead to the scenario that
>>> all jobs in the same scheduler shares the same timeout timer from the
>>> very begining job in this scheduler which is wrong.
>>>
>>> we should modify the timer everytime a previous job signaled.
>>>
>>> v2:
>>> further cleanup the logic, and do the TDR timer cancelling if the
>>> signaled job is the last one in its scheduler.
>>>
>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 29 
>>> ++++++++++++++++++++---------
>>>    1 file changed, 20 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index a2a9536..8c102ac 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -305,8 +305,17 @@ static void drm_sched_job_begin(struct 
>>> drm_sched_job *s_job)
>>>        struct drm_gpu_scheduler *sched = s_job->sched;
>>>           spin_lock(&sched->job_list_lock);
>>> -    list_add_tail(&s_job->list, &sched->pending_list);
>>> -    drm_sched_start_timeout(sched);
>>> +    if (list_empty(&sched->pending_list)) {
>>> +        list_add_tail(&s_job->list, &sched->pending_list);
>>> +        drm_sched_start_timeout(sched);
>>> +    } else {
>>> +        /* the old jobs in pending list are not finished yet
>>> +         * no need to restart TDR timer here, it is already
>>> +         * handled by drm_sched_get_cleanup_job
>>> +         */
>>> +        list_add_tail(&s_job->list, &sched->pending_list);
>>> +    }
>>> +
>>>        spin_unlock(&sched->job_list_lock);
>>>    }
>>>    @@ -693,17 +702,22 @@ drm_sched_get_cleanup_job(struct 
>>> drm_gpu_scheduler *sched)
>>>        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>            /* remove job from pending_list */
>>>            list_del_init(&job->list);
>>> +
>>>            /* make the scheduled timestamp more accurate */
>>>            next = list_first_entry_or_null(&sched->pending_list,
>>>                            typeof(*next), list);
>>> -        if (next)
>>> +        if (next) {
>>> +            /* if we still have job in pending list we need modify 
>>> the TDR timer */
>>> +            mod_delayed_work(system_wq, &sched->work_tdr, 
>>> sched->timeout);
>>>                next->s_fence->scheduled.timestamp =
>>>                    job->s_fence->finished.timestamp;
>>> +        } else {
>>> +            /* cancel the TDR timer if no job in pending list */
>>> +            cancel_delayed_work(&sched->work_tdr);
>>> +        }
>>>           } else {
>>>            job = NULL;
>>> -        /* queue timeout for next job */
>>> -        drm_sched_start_timeout(sched);
>>>        }
>>>           spin_unlock(&sched->job_list_lock);
>>> @@ -791,11 +805,8 @@ static int drm_sched_main(void *param)
>>>                          (entity = drm_sched_select_entity(sched))) ||
>>>                         kthread_should_stop());
>>>    -        if (cleanup_job) {
>>> +        if (cleanup_job)
>>>                sched->ops->free_job(cleanup_job);
>>> -            /* queue timeout for next job */
>>> -            drm_sched_start_timeout(sched);
>>> -        }
>>>               if (!entity)
>>>                continue;
>
