Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C93F9A89
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D866E96D;
	Fri, 27 Aug 2021 13:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB6D6E96D;
 Fri, 27 Aug 2021 13:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rxozl0jbrvOAOHdi+SzfJp7whcQZm4TcAeaU8EmsxC0+wCbETB9UN+h7mmFuOYNQAOSop3ywFYmGe2HnxJJHTfFrBcLjO5M6KeBjyGYAPM54KIYynTQD30c3CUkFYrWeyoXPDMTDRfAnZwslA/7kM5KVB39xcicY0qpVJ3NhegOirqfgX7o/GKcd8dBQt9SfSixAOr2GZ6frpgdejVSMbTRr5H5t1Oj95w5WeifCGrQ/nYdmPNx9ACsVNHz1EneiJBuSsJrYN16SKOdeE4uDWLtAbETqaqGvrBbg+7jiGrCw+J58L5r0z9jK50tPLTNrs09FabAYbekA5/YXeBgYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McDSjk5Gkx/eDMiYzCBAFBCSnlZFhUZKl55oin2SBhg=;
 b=Zr9HxZyZ9VGSuZNeBNh9+xK5W6XmaF10ZlpHIhSrs0vIgwR/31zed92KrVF2IeRnCj9ZGmwI9u3OdDCXnT9EzrEwBsJnTpE/a/pz6RuW6ZXBXakL+3HixwxBQo602FTegzH2DAAER58x6KJV+Db5D4o/T1A+wDNFbhLqo+eN4pdHMQ1OTsxpaRuG+6MDVUNv8oOQYkDVN3mGKO+/K13lCyUq+onWVBlZeRb933vlfnNEFmSTIQuw2y5KqzkVAg8DHjwrICBhEGSUafxBifs4DOsbqhv5lxllUax015I/bUMy7JOU4myFvuSnY7vbkwKD7HzlSnp5MyzdaYNOQHdK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McDSjk5Gkx/eDMiYzCBAFBCSnlZFhUZKl55oin2SBhg=;
 b=0jkhuebTC+kiEA/CCfNYMZXVig0RW5D1s0D1IwsSwAJwwi0HpFqf9Wag/rAeeiuqCai77KyMYctHSAiqnYqlS6Dwnxvxc3EW0om9vzv48GxBamvzpnwd7ckKYXeex41P3TphFpjzmkiaXZIJGgryIBEl94n8CZZV6Go1ISxruuc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2398.namprd12.prod.outlook.com (2603:10b6:802:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Fri, 27 Aug
 2021 13:57:41 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 13:57:41 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
 <BL1PR12MB5269AAC2FA518CF85724C85D84C89@BL1PR12MB5269.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <257202a9-a670-5b89-f98d-01855b6e41cf@amd.com>
Date: Fri, 27 Aug 2021 09:57:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BL1PR12MB5269AAC2FA518CF85724C85D84C89@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT2PR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1441:7037:5b2:9692]
 (2607:fea8:3edf:49b0:1441:7037:5b2:9692) by
 YT2PR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 13:57:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 409d9abc-78d1-43fd-2fd2-08d96962a32f
X-MS-TrafficTypeDiagnostic: SN1PR12MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2398E8A3BFE98E9223C973DBEAC89@SN1PR12MB2398.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjcCVCtDWQiZ6SV6Lhp945C85+C1nlEIoyjoZX5Whrb7dNE27SRqGKmegYRT+opgEB+VX4LYrrn9IJTTr2ynoflhjdaCxwIvARGc/LBoOLtoUntssVJ49VigyZo7osChp91KSm4LCJDUg/nq0ZKnKqPYoHZMan3vjodm6B0yQharNFmtoo3xwmvCiAXEJPNBVBpTFdO4kLnEiMDsfbxy3usDXbTinNsWXI2omefeUXrT90QvCuko+3wUltXJPIsmsw14T2HuSLZLY0RVLf+eAmRys51rYMFeR14FVao2KmD49yD0pVTkxHc4TX19Wl30UPxDq6YHkHVN4X9M2aNDUJ3X24gLMRNGFhyKYCziDPWbRnI2ESvLYsalT1qJJGQaXH6W629X2Wl55+o01tvRkBhYJo2YO91qZPhawZz3ajz+qv3pt9A+P4Pm8NEnenCc3V2AYQHb2BNLsi56c37G9B2PIW/s9hLDZyQ4wXsGjwu6BzyDa/NJxdWM3OHotu2GCkK2D/dcoSJC3O+mTReYaOByySa4bUygquMqG7jxltRF+aoQRDd6hyOpuUNAgVkNbzQ/M7JgWQn9ZO0iTVkdsGouZGt3nGcA+xtenm9QAhrXi157K5c2e+pSMLU7fXY7lL/RZUsCkBRBvNs02xlcRk95itOABxdUPtOj+VxZfKrUMgVtXc5CN1f4UqMM09eMDBOf20cxwpN3icYf7Yr4UOOcqtchS7TBzCE0K5gWw7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(8936002)(6636002)(5660300002)(36756003)(83380400001)(8676002)(31686004)(86362001)(478600001)(53546011)(66556008)(31696002)(2616005)(110136005)(38100700002)(66946007)(450100002)(186003)(4326008)(66476007)(6486002)(2906002)(316002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVpyZ2U4RW9zdW1RVFRBeWtIUUsxYW9PNjZPcHErMTNKTnMxbVM3V3ZvSUZK?=
 =?utf-8?B?VU1BNVZRYjNlejJQY3Z5MGs4ZWI5TlBFZHRxYzU3MGhibVBnMGtSTFRHS05K?=
 =?utf-8?B?bU5La1E4c1BtdHVJMW91Sk8zRW15aTVHaUhhcjY5dE1BTCtMbFJVd2RtZmN0?=
 =?utf-8?B?cDQwTVcvT3QyVWJUMk5Fa1ZmRnJML2pRQXpzZFRGZ3FlRzNJQlZaamE0b1JU?=
 =?utf-8?B?WU5yRFFVY2dJRjUrSy9WV3JwdTEzMjdGcElzVlFPbm5YWmRycENqSjhxdHZh?=
 =?utf-8?B?dU50WU0zS0w3Zko2Yms3MjZEclZ4MWgzZTA5eTFSY0N4M0x1NEVWTDAzYUo5?=
 =?utf-8?B?MVVGUE43clFGejJzYWtNMEhmUHB3VEFPYWR4ZW9JNHljc2NBaVNYWm5OaHJL?=
 =?utf-8?B?MFBxVEpjeEJ2RnpCVitPVDhDbWIwMkJORlhISDNOeHh4djAzYXFVNk0yNVVn?=
 =?utf-8?B?SlRKekw2aDBKdUw2QWhsQnREQU5nSGc0ZWhJMG5SaFZZVCs2cmtHdnJuT1RB?=
 =?utf-8?B?T1ljMGxzV2ZUTmRVNkxjeUpta2FXb0N2ck5UdkJDUkdwbm11V0dXQ0c5K1Iv?=
 =?utf-8?B?RFF2RXFhRXRQcmxBdTl6L29NTnRET1dLTEp1TlFVSXA4QXFkb0VkNFdJZDFy?=
 =?utf-8?B?WW94dzYrTmdsZytGdmpWT1hpRkFhOEZDbWFrMWFsakxlSk1BTzB5M1Nva3Jn?=
 =?utf-8?B?aDhLT3VBbk92ZzR6OHI2ZUZyZVNJcytjUnV4UUZGdzZDSFZKK3R4R2Z0Mkkr?=
 =?utf-8?B?bGJsNVVsZzNONU1QWHhoRGsrN3BQSHJxemY3V2R6alQvMVJaMlBKc0g5NnRq?=
 =?utf-8?B?Y0FiNHR6LzVFWHlncUY0c1hsWURDY3Fpb2tXdFRhN3BrUWtiV1hOYUh0SVBX?=
 =?utf-8?B?T0dlL0FtL2lwMVpOUnNjZHVnT0ZDUm1Kd21YK1g1S09vSW16d3lhd09ack1z?=
 =?utf-8?B?OW56cklQR0VPdVI5U1ZBMndYbmtaWi92SHdUNFovWlIyUjVFWHNJeXVYaExU?=
 =?utf-8?B?S3YzSG5GVTlGczZvVlZZSHJ4UEV4WWtPSXhHR2g5UjFQWkxBV3ZGN1hid3BN?=
 =?utf-8?B?OGNXeU5iWmF4RTVQUTNOMWVscERRb2VRMjZBajhhNHNTRlZaN0wrWC9aNHAw?=
 =?utf-8?B?d09kUExKb0c5S0lVVXArdVNqMEN2b3FKT0VwSzFRb3UrUjV0bnR6OENVVVVq?=
 =?utf-8?B?SmswWTlOcVErbzB0b3dKYlNIcnozYzV4dVBhbVcrd2RZOWF2NWRiN0NYbFhm?=
 =?utf-8?B?dlNiZ3crQnRkSnlhTmt4a3RLWUk2U0hzWVA1ZkhzcWtUU2g3dHRIQm1kMElj?=
 =?utf-8?B?d1gva3d2RFZTeUc3MnpSbjhGYmdUcGYzVXZINkZXbGlSdDVWZk16dmF0Mmtu?=
 =?utf-8?B?NEhSRGpOKzl3UzgwQWFJZDVUemVlbCtSRU9QYlE3Y3JuK0FuSlplbXlPZ2Ni?=
 =?utf-8?B?c1EwSWxNSDF5QlE1SFFLSFlWMDFBRWJFaW1hdmU1VEw5YU1QazFLK004TzRR?=
 =?utf-8?B?OTdkVWxpdTl0Zi8vckc1YVFHeFVDVXhWd0E1MWpUTmlsY2N3aTVTc2xjT2hD?=
 =?utf-8?B?NEx4L2ZLMXRGbHpMODR3NkpWK203RWNrTjROK3pPMkJZUkZKek5nZzhMU0pX?=
 =?utf-8?B?VXpxRW1iQ1JhcUVudXZqclpYWHd4RWphdkxEQ1pYUTkvRm82V0NpMm10Unlq?=
 =?utf-8?B?Ujd0eGMydEZqMytzQnNTMGJOamRUWm10dUNMK1ZrQmhCSDJySlo4LzNNMXR0?=
 =?utf-8?B?WlQ1RUdDZnRIQWYyQXFKK21GVi9FN0VrSzNmZDh2Y3VlVkJWTW5NK210THFW?=
 =?utf-8?B?UUJBK3RPZ1pQVWZQRlMwaWduWmk1S1EwdUp1dE81RXRHa2w2Um1JN255eExT?=
 =?utf-8?Q?MmHa7u6DxnrgB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409d9abc-78d1-43fd-2fd2-08d96962a32f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 13:57:41.6645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MJV8/jN5LiqO5dGfXIoXuHZzXRW3VEJRd4h0WzkVZwtXqkaQA5sL0zVrnmo5mpnCCBh8tQ2/a9nfsKmGxNq4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2398
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

The TS  represents the point in time when the job was inserted into the 
pending list.
I don't think it matters when it actually starts to be processed, what 
matters is when this job was inserted into pending list because right at 
that point you arm the TO timer (when no other is running already)
and so when the previous job completes and you cancel and rearm again 
you can use that TS from the next job in pending list to calculate how 
much time has actually left for it to run before TDR must be initiated
and not just give it again full TO value to run even if it has already 
been running for a while.

Also, i am not sure also about the assumption that what we measure is 
processing by HW, what we measure is from the moment it was scheduled to 
ring to the moment the job completed (EOP event). At least that what our 
TDR timer measures and so it makes sense to set the TS at this point.

Andrey

On 2021-08-27 3:20 a.m., Liu, Monk wrote:
> [AMD Official Use Only]
>
> what is that 'ts' representing for ? it looks to me the jiffies that it get scheduled to the ring,  but a job scheduled to the ring doesn't represent it's being processed by hw.
>
> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Sent: Friday, August 27, 2021 4:14 AM
> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
>
> Attached quick patch for per job TTL calculation to make more precises next timer expiration. It's on top of the patch in this thread. Let me know if this makes sense.
>
> Andrey
>
> On 2021-08-26 10:03 a.m., Andrey Grodzovsky wrote:
>> On 2021-08-26 12:55 a.m., Monk Liu wrote:
>>> issue:
>>> in cleanup_job the cancle_delayed_work will cancel a TO timer even
>>> the its corresponding job is still running.
>>>
>>> fix:
>>> do not cancel the timer in cleanup_job, instead do the cancelling
>>> only when the heading job is signaled, and if there is a "next" job
>>> we start_timeout again.
>>>
>>> v2:
>>> further cleanup the logic, and do the TDR timer cancelling if the
>>> signaled job is the last one in its scheduler.
>>>
>>> v3:
>>> change the issue description
>>> remove the cancel_delayed_work in the begining of the cleanup_job
>>> recover the implement of drm_sched_job_begin.
>>>
>>> TODO:
>>> 1)introduce pause/resume scheduler in job_timeout to serial the
>>> handling of scheduler and job_timeout.
>>> 2)drop the bad job's del and insert in scheduler due to above
>>> serialization (no race issue anymore with the serialization)
>>>
>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 25
>>> ++++++++++---------------
>>>    1 file changed, 10 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index a2a9536..ecf8140 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct
>>> drm_gpu_scheduler *sched)
>>>    {
>>>        struct drm_sched_job *job, *next;
>>>    -    /*
>>> -     * Don't destroy jobs while the timeout worker is running OR
>>> thread
>>> -     * is being parked and hence assumed to not touch pending_list
>>> -     */
>>> -    if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>> -        !cancel_delayed_work(&sched->work_tdr)) ||
>>> -        kthread_should_park())
>>> +    if (kthread_should_park())
>>>            return NULL;
>>
>> I actually don't see why we need to keep the above, on the other side
>> (in drm_sched_stop) we won't touch the pending list anyway until sched
>> thread came to full stop (kthread_park). If you do see a reason why
>> this needed then a comment should be here i think.
>>
>> Andrey
>>
>>
>>> spin_lock(&sched->job_list_lock);
>>> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct
>>> drm_gpu_scheduler *sched)
>>>        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>            /* remove job from pending_list */
>>>            list_del_init(&job->list);
>>> +
>>> +        /* cancel this job's TO timer */
>>> +        cancel_delayed_work(&sched->work_tdr);
>>>            /* make the scheduled timestamp more accurate */
>>>            next = list_first_entry_or_null(&sched->pending_list,
>>>                            typeof(*next), list);
>>> -        if (next)
>>> +
>>> +        if (next) {
>>>                next->s_fence->scheduled.timestamp =
>>>                    job->s_fence->finished.timestamp;
>>> -
>>> +            /* start TO timer for next job */
>>> +            drm_sched_start_timeout(sched);
>>> +        }
>>>        } else {
>>>            job = NULL;
>>> -        /* queue timeout for next job */
>>> -        drm_sched_start_timeout(sched);
>>>        }
>>>          spin_unlock(&sched->job_list_lock);
>>> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>>>                          (entity = drm_sched_select_entity(sched))) ||
>>>                         kthread_should_stop());
>>>    -        if (cleanup_job) {
>>> +        if (cleanup_job)
>>>                sched->ops->free_job(cleanup_job);
>>> -            /* queue timeout for next job */
>>> -            drm_sched_start_timeout(sched);
>>> -        }
>>>              if (!entity)
>>>                continue;
