Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6553C3F8F89
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 22:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99F26E8AE;
	Thu, 26 Aug 2021 20:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2082.outbound.protection.outlook.com [40.107.95.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026846E8AC;
 Thu, 26 Aug 2021 20:14:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfRUL3Y079sRola0yBGNj6z5IjUYJKYnKgBMMbiUuunAYDtFZhXqbigoNmiaP0CYBWsLaqu/EQIw6uLjJnE9a2Zk6IlR9mFzVp9n0+9Mss4jApVXZ0yy0ZShJep48H0Zh6BXqowtxFOJTQGEKpauyQ99zgwvizgpXUYlAmesIy5tbe7Xu83DGu0VoQOGJn5Hh588KzXmO9ky+0bC1VfALt2r/XvdL/x/hSkDJ8MKUBbgO//Ago23qnQtEQJOmIu86ygUUmTZkbr8zGCw5KdLgzf5+kT/Ej62kCDNurp6pvt0FSRNpc6wyNWlS6SOIH+VWmVEbRcEadteyH2RSB1LQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/6A21IvByXKs6e0Nas3qCy19wGElIkSOMle+rUi7Xc=;
 b=Ju6g1cnusxJCKVB9QKXrJyJWtBZ8DFX5lJOhT57VSOcV3lJgnf2qkOWThP8Tpspe3+rc26pb5S59LNPOUTYo7ZKanaInl0p4sW5zqyzcs1JrVz8WFYS6ZMG/KfnKnS7ZuqAh1+D3ycAzEwasDiE77PC86br0sUxd6BcBZRV2Htgto1EO/dpoZxwZUfp99fMhZPIRo+yy8lpStAovINQhZH8AfxM/Cq99/l//ny+j5ziTEb3xabBJxDttUBT4DHVPaXH8MClmrNPSUZxUAM1wXIaXGt5c9VHPPmWJyhiGngbsCKzPe3W9VAnIDrf6XtjavkUh3+HJM4AOaU6+SqSzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/6A21IvByXKs6e0Nas3qCy19wGElIkSOMle+rUi7Xc=;
 b=gdGlsHCJv2RMjos9SSm4eMMobHfkH5i7QXDBk6o8f99MbxoWHxYiNoTHlKZOmxKen21JnZu+xHlKsLiWLxHEHvEhJIDQ45N6hqoyDVrJ7z1o7tChH88lR7WEfH7ThONITrcuaDylKxa7oYmif7QVW5pRpmYYaEJ0+akis6k4KGY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2477.namprd12.prod.outlook.com (2603:10b6:802:28::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Thu, 26 Aug
 2021 20:14:28 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 20:14:28 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 "Christian.Koenig@amd.com" <Christian.Koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
Message-ID: <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
Date: Thu, 26 Aug 2021 16:14:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
Content-Type: multipart/mixed; boundary="------------5F3DE39190F318289F3EFF90"
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::10) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:80cf:5155:1abb:d396]
 (2607:fea8:3edf:49b0:80cf:5155:1abb:d396) by
 YT3PR01CA0064.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 20:14:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69152b62-2149-416f-ba52-08d968ce1b74
X-MS-TrafficTypeDiagnostic: SN1PR12MB2477:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24779932862DDE3A88991369EAC79@SN1PR12MB2477.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dYsxLaCx1NS2bVl8iCYtzjUe5bIkrrMXKQ+N159WDEXHaobSof800MEG7K78MYZbdVyMUPHyqY158by4G0A0rlPmhywo/2K/lcXw37mbJ9Gc8U7fuDEGZYU6WFsDlTo853BvRSjRpJZ53OhZAEwa7h50xjxehqzopz3iznIQHodC30Lj8ZYkLKH0Clu9yyhDkR/H8VqqZpXYen2vxaKRByO8sG9LtJHlmqRBfOLo+/4YYl2gzPCC0yXPT3T5vpa5i2GX7NkPBkUSlRPjYWAldgPGAu3mAQZ1mGWhZCKsVQGgKSH4AkGts4KbyMMLdkn2NzrjYLjMTYgSOmIeuj80hSXpikURcUQ9VptgHsVKSxvAmmCLqRZ9+QVaplkFT1U7Jy3EizGmwCc4NS9ZRdyLT0MMKc3ih0/IsPZ+MvB5TpqQRhELlrribureqvyOfVPFGGGBA2Z8PFMRUAQjXyHXDdKicd6acdpVlKpn3Gkof0ciR+gtM83mdqB7UP3TXl6vdHBAEj+DiopPX8D67o+7FSwz8jO0x9QxmHVwR/8AhiBbnmf7VRaaoyODVjoW+alRHpfdY9u1shkemHhdRjPAyVlox6LGovEIWldgeoIZgSm0VWr0Zo2z42USHgFatxQdbwlUxIZ2S6aTbdIEyg15+YVoR9qyNdrZXWpaoFKBXBl5KmUZwHgCCsdRHMT2aSkjhrbu76YGI82TRGdbkcDKum0jIb6z+n978iIaXTnqc+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(450100002)(8676002)(83380400001)(478600001)(38100700002)(2906002)(66616009)(186003)(316002)(36756003)(6636002)(53546011)(44832011)(66476007)(66946007)(66556008)(8936002)(5660300002)(110136005)(4326008)(235185007)(31686004)(86362001)(2616005)(6486002)(33964004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0k0UHZndEtNcmNpN1JRUGRpQnhvdWhNYUVTSFBSOUhFS2dRNXNOVDAvN21I?=
 =?utf-8?B?S0w4WTRZa21VMWFDcEpIbGpOcUhqc2lMK0c0cjBERGtEcS82MmNpRDdrd3Zh?=
 =?utf-8?B?ai8wc2phMUN6cGhFUjZldUlkY3Q5djFwa0FEMTFtZGJQeFFjMGpHbkxXZzNJ?=
 =?utf-8?B?dmJGZy82bTJCU29NU3VxRTlIZFZtOTMvV2RsZG54Nkp1YmhKcU5JNkpBcVJH?=
 =?utf-8?B?L1RjTkdZV2ZzSE0xWUlpdUpIOTR3dUFUd0xnR3g0OHJra2Rnam8xaHBTaElt?=
 =?utf-8?B?YlplU2plbVR6Y1NSRTlXR0t6bllIVmlDak5maVBZbHNoMHdKWnk0OEhaTmhu?=
 =?utf-8?B?UEsxd3Bxd2hZWEhnek80SUZ4R09Tb0EyWDlmd2FpMWMxQlloTFlGbjN2WGJa?=
 =?utf-8?B?RlNPUzA4YUJCYmlYazE1cSt5Rm55aTJBM2E4Vmp4eEdCZzZzajVSWnlGc0Jl?=
 =?utf-8?B?bmNmazk1b0g5SXJoM1JWK2RmRjNaU1ZDWWs2ZVFzUlcxTnpNT2JXRFFwWXc0?=
 =?utf-8?B?UXZwUlZEeHd5bjIwWEdIaGZuL3lWQmpaU2hLVzJ1REkrRmtZeTNhelNJWG1y?=
 =?utf-8?B?VGxYR29CbHUxd2VWQVVxMXJ5bi9yckt6aU96c1g1QmVHa0lBR094NEdTRmI0?=
 =?utf-8?B?NkdURk83L21sNUFISmRMVTFPMjhocmRIVlpDM2RGZ1NJSnlhNTRvSEFVZkVn?=
 =?utf-8?B?V1pYelRxbXAzZnN1RENWYUg4T2NrdVVVYTA4Rlc0TDFyOVBvVGFHQmFhU25K?=
 =?utf-8?B?Zy9qeG4rVGt2VW15NDg2MDcvNkVoOE9WUDc5eHVHTDB0aXJuNHRQVDlITHJs?=
 =?utf-8?B?bHljY0pIWDcyNjFOOUlDVlovNExJeXJqNGFWZGQyVDRhRXJCRW9hZEdKcVQv?=
 =?utf-8?B?cjY4Y0ZPRkRFU0ZtcElMT3Y4S1EzV2tNbmp3clNNdXdERk5kSlg2OHVwNER3?=
 =?utf-8?B?K1FaRmdLQ1ZrK3pZeWhadGNLK3hzbWpoZHB2Nlo0S0NkUjQzaFlaZWFoZnNE?=
 =?utf-8?B?cVExczAxdlExY04yQ0RtY1BlV1htVWFBVCtNNVRzdkx0eCs5UzJkWm95K1dz?=
 =?utf-8?B?ME8vMzZyNkxKRkU5VDZUK3JmWjR6djNLOXF6SjFUSFl6LzZTNzlQcjBaZlR4?=
 =?utf-8?B?L0U5VkpPMkJKOS92WGZWeUZvVTkxVTc1MHlrbkpZa2pmWm1RbjV1bkozVFRY?=
 =?utf-8?B?N1pOMnFjc0ZFTU41UVZKN3pDR2N1aWhQS3hIV2JsWS84T2hVMllHNWF2cEtD?=
 =?utf-8?B?S3Q5c2NlZ2YvMDZqd3pEeFB5TEZBTzBMeHIrZzhtQ1BoVmYvcVpmNEFsQnRx?=
 =?utf-8?B?TjNRVkllQWdHVWhtQ0tjWXNZSmxZSFhxdytmYzlzRUN5M1I5KzBzQm9BMDhp?=
 =?utf-8?B?L0JTL0R1dzBTYmNUQ1I5dS81bEYvWS9zRDdnRzJOWWZveUt2R0c1ZWZJZjV4?=
 =?utf-8?B?ZEMxaVg3c0hQS1JNTjJoTEpXc1MvRjVnRW84VytBZ0FSTXpjdmZFSUwxTjA5?=
 =?utf-8?B?SlF2NzBWV1VaZzBLck5oVVJQazkyd2dwSXV1OHQxQTZ6QkhsQmpVR1N1ak1L?=
 =?utf-8?B?U0ZMZktkdHVuVnlhaUNmZzZOMUVuZUFWUkg2eGdhOVZpeS9DczVIV3pIbm5w?=
 =?utf-8?B?S3JCRTdyQW1yWHV6dmtjc2JlSHNhL08wSEZJZ0NFNmtTQXVHSWxINjlMYXVB?=
 =?utf-8?B?UWQzMVBMVXdjL0RTSzFaaFBsb1cwb0dXTnU3WGJnZWNldGNaRTMwTEQwZEcz?=
 =?utf-8?B?MnBWODk1aFJxR2k2VVA1dGV4c1RvT0N0aS84dkIreTZ6YUdOeG9lVGRUQ2Rk?=
 =?utf-8?B?T0tMdktVcXpUTVVRUzZ2MXA4SGFWdHd0K201UVB5YVBlaGdxb0I3SFdIUDZm?=
 =?utf-8?Q?M44EPl2+byJmQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69152b62-2149-416f-ba52-08d968ce1b74
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 20:14:28.7489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04ApJcT5JEAOLotb4/kniJchNssKEeotD2N+QnpLMWlj/lwTd9yIz6aVrQI54y21KooJ+1AfC3UNgqzRr/Gy5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2477
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

--------------5F3DE39190F318289F3EFF90
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Attached quick patch for per job TTL calculation to make more precises 
next timer expiration. It's on top of the patch in this thread. Let me 
know if this makes sense.

Andrey

On 2021-08-26 10:03 a.m., Andrey Grodzovsky wrote:
>
> On 2021-08-26 12:55 a.m., Monk Liu wrote:
>> issue:
>> in cleanup_job the cancle_delayed_work will cancel a TO timer
>> even the its corresponding job is still running.
>>
>> fix:
>> do not cancel the timer in cleanup_job, instead do the cancelling
>> only when the heading job is signaled, and if there is a "next" job
>> we start_timeout again.
>>
>> v2:
>> further cleanup the logic, and do the TDR timer cancelling if the 
>> signaled job
>> is the last one in its scheduler.
>>
>> v3:
>> change the issue description
>> remove the cancel_delayed_work in the begining of the cleanup_job
>> recover the implement of drm_sched_job_begin.
>>
>> TODO:
>> 1)introduce pause/resume scheduler in job_timeout to serial the handling
>> of scheduler and job_timeout.
>> 2)drop the bad job's del and insert in scheduler due to above 
>> serialization
>> (no race issue anymore with the serialization)
>>
>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 25 ++++++++++---------------
>>   1 file changed, 10 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index a2a9536..ecf8140 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct 
>> drm_gpu_scheduler *sched)
>>   {
>>       struct drm_sched_job *job, *next;
>>   -    /*
>> -     * Don't destroy jobs while the timeout worker is running OR thread
>> -     * is being parked and hence assumed to not touch pending_list
>> -     */
>> -    if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>> -        !cancel_delayed_work(&sched->work_tdr)) ||
>> -        kthread_should_park())
>> +    if (kthread_should_park())
>>           return NULL;
>
>
> I actually don't see why we need to keep the above,
> on the other side (in drm_sched_stop) we won't touch the pending list
> anyway until sched thread came to full stop (kthread_park). If you do 
> see a reason why
> this needed then a comment should be here i think.
>
> Andrey
>
>
>> spin_lock(&sched->job_list_lock);
>> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct 
>> drm_gpu_scheduler *sched)
>>       if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>           /* remove job from pending_list */
>>           list_del_init(&job->list);
>> +
>> +        /* cancel this job's TO timer */
>> +        cancel_delayed_work(&sched->work_tdr);
>>           /* make the scheduled timestamp more accurate */
>>           next = list_first_entry_or_null(&sched->pending_list,
>>                           typeof(*next), list);
>> -        if (next)
>> +
>> +        if (next) {
>>               next->s_fence->scheduled.timestamp =
>>                   job->s_fence->finished.timestamp;
>> -
>> +            /* start TO timer for next job */
>> +            drm_sched_start_timeout(sched);
>> +        }
>>       } else {
>>           job = NULL;
>> -        /* queue timeout for next job */
>> -        drm_sched_start_timeout(sched);
>>       }
>>         spin_unlock(&sched->job_list_lock);
>> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>>                         (entity = drm_sched_select_entity(sched))) ||
>>                        kthread_should_stop());
>>   -        if (cleanup_job) {
>> +        if (cleanup_job)
>>               sched->ops->free_job(cleanup_job);
>> -            /* queue timeout for next job */
>> -            drm_sched_start_timeout(sched);
>> -        }
>>             if (!entity)
>>               continue;

--------------5F3DE39190F318289F3EFF90
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-sched-Add-TTL-per-job-for-timeout-handling.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-drm-sched-Add-TTL-per-job-for-timeout-handling.patch"

From d4671ce3c3b18c369b512cd692aec3769f37e11a Mon Sep 17 00:00:00 2001
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Thu, 26 Aug 2021 16:08:01 -0400
Subject: drm/sched: Add TTL per job for timeout handling.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 16 ++++++++++++++--
 include/drm/gpu_scheduler.h            |  2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ecf8140f6968..c8e31515803c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -306,6 +306,7 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 
 	spin_lock(&sched->job_list_lock);
 	list_add_tail(&s_job->list, &sched->pending_list);
+	s_job->ts = get_jiffies_64();
 	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
@@ -695,10 +696,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 						typeof(*next), list);
 
 		if (next) {
+			uint64_t ttl;
+
 			next->s_fence->scheduled.timestamp =
 				job->s_fence->finished.timestamp;
-			/* start TO timer for next job */
-			drm_sched_start_timeout(sched);
+
+			/*
+			 * Make precise calculation how much time should be
+			 * left for the next job before reaming timer. In case
+			 *  it's TTL expired scheduler TO handler right away.
+			 */
+			ttl = get_jiffies_64() - job->ts;
+			if (likely(ttl < sched->timeout))
+				mod_delayed_work(system_wq, &sched->work_tdr, ttl);
+			else
+				mod_delayed_work(system_wq, &sched->work_tdr, 0);
 		}
 	} else {
 		job = NULL;
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d18af49fd009..80cc23e799cf 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -182,6 +182,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * @s_priority: the priority of the job.
  * @entity: the entity to which this job belongs.
  * @cb: the callback for the parent fence in s_fence.
+ * @ts: ts to messure for how long the job been running in jiffies
  *
  * A job is created by the driver using drm_sched_job_init(), and
  * should call drm_sched_entity_push_job() once it wants the scheduler
@@ -198,6 +199,7 @@ struct drm_sched_job {
 	enum drm_sched_priority		s_priority;
 	struct drm_sched_entity         *entity;
 	struct dma_fence_cb		cb;
+	uint64_t 			ts;
 };
 
 static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
-- 
2.25.1


--------------5F3DE39190F318289F3EFF90--
