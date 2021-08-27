Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A23F9EB0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 20:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D906E9A6;
	Fri, 27 Aug 2021 18:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DAF6E9A5;
 Fri, 27 Aug 2021 18:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9X0jbwZjtptDzpBkO0oxvKUVatUpMKrvxRYs0547RNsoZx2yJfUCe4/lkcWZzVa/8UjnhPJnyh/as7EhUvwrRIBRihW/XWaDhyKZ5HxMp5HEZbgB1JC1quIPIPMIrjLgMe12hCcTG2M4HeLHmY8zVBjUN2vPKQ5lFn4OGOClSfusThzZrXS0lHODzgYHe8BuIjgf9v2TeqU7ius0sk0yIjxOSplTzxqpUs3Arufsme6scf21gAdfADynb0YelQ57B806Xrn+1YpCUN2b0t/KRa0sAVI0/D9iAC/2PQnv0zZtEXJ16kvGtPT/iJrgXgvp81fGcFgoSc2BZzZXFSOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ee9B3uZA0VNe5H7/AsbulwCBRAk/dKzrZUIYdVFbQlQ=;
 b=AuwUzx+jlHt1qlTelx+kQcLT4US/S3pTy+9Zc20aJKW4LkuXdbanKCtbFSeNho3BLUlbRXyoC9h5i/kJrO2w2fMLcFmVRDtMq0vR/X1B9FsAesSKOi9CUXTe7qbo7YUbCdYTaO7+y1WnfkfWwNRa6FpCbwx/FnOTpMKHHu26hGBLJ9HYVpJooGsjTs+F0+0boNgDChnlI1Ngdl0Js/lLXkXfMEy5dh8X+0n5MExsFUPvBLAaghVLrF0yWEh2EFpZ2RLuxzM6i77zhMtiTpSrTqU8C6j1REGeuNbRCrE+XH1v7Dlda0KMN2LCtj86g9kCoJXvMeXM3h8SMN8nzflNgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ee9B3uZA0VNe5H7/AsbulwCBRAk/dKzrZUIYdVFbQlQ=;
 b=yfTG5f9SgNl5fjoc5IP8Po5fYrdbT1abXQjxTA8iq1vZCfFYTspHL8e2IAoY1KSP1Dssev92IRLCDB77u8BCVv23t8DnfyZ8D7715yZ01l06m1l8uotrl8spFRUfan5LQ3eh/epl/ThJEkBFo++FdEHRFwn8kN3mbADuxX3hI+c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2799.namprd12.prod.outlook.com (2603:10b6:805:77::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Fri, 27 Aug
 2021 18:22:41 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 18:22:41 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
 <BL1PR12MB5269AAC2FA518CF85724C85D84C89@BL1PR12MB5269.namprd12.prod.outlook.com>
 <257202a9-a670-5b89-f98d-01855b6e41cf@amd.com>
 <da180d36-b5dd-733e-3721-3333b0cf405e@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <9bb9b448-ea93-e8f9-818e-c6d27d4a8264@amd.com>
Date: Fri, 27 Aug 2021 14:22:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <da180d36-b5dd-733e-3721-3333b0cf405e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::7) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1441:7037:5b2:9692]
 (2607:fea8:3edf:49b0:1441:7037:5b2:9692) by
 YT1PR01CA0098.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 18:22:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9adcdd25-6b43-4372-3499-08d96987a841
X-MS-TrafficTypeDiagnostic: SN6PR12MB2799:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27994CE508414321B51C96D1EAC89@SN6PR12MB2799.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7BuvyVe40SmTcJsHaxYov5rkhG17yvF4beGr91/f9a+K3UeBmz0aJ31laN+5HMIvQQ2/54n03LNqxg4M/7mq4yDUyF9KuR31ZMuLzYzrZZDYNTYXzR77LGBEEht9qX0+M7kJtf2IrnAfwSHrf8Jd62aZympTRFGf+MfNJ3IELsYtzoVR+bu8oW3iTzuiu4fUhgRS0URvCHqsZUHMcIysLvCzXnHnGnAwnMdRH7QdX5fvH1bkODn+i+d+nMMh96kQpC2Ff6pQGFX67imNwXIdDYoxZL2rIyRSBXTk/mZRQgd2PRR2P7mmOA6oHzmWHzc8pM15xrIa4pkIdyaS+6F8WF8O/b75pko7azIOTyVIGXlXl/TKdXifcDEhx83J3RgVMQEfERt7HYAZDUxngRNDU5GPDwzeG4sFQwrSElqHkOy32o6DPcLIsJMf4b0x+svj8dRIeHf7twIgN8GhURn7zl+6eGRYmAXy6CYdHHvVybH7rHUOYhb7P8hFQvAVrO2by6bSLyAotmZ/OtZA92E4s7ZNkjIlCpQBoQBPRYWUMbN2e3Cv1boMkoAEaPX5ev6GKa4dtgoHY2RiNgLqAM48bFbk6CHQ3ZQkONet6o1dc+5aq2FNonVvkc0Z0H0KvNxRdxKxQkIu2L/WjmqtMtgklj1ZCfUDHn27nvPj4fQMMx84HHaomA8fAxXj/QQqAniyOqXxENou1ca8oIxpOmZCLdoDmydOrUqIGBIl0/5qR58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(478600001)(2616005)(38100700002)(31686004)(6486002)(66946007)(36756003)(66574015)(2906002)(86362001)(83380400001)(31696002)(44832011)(66556008)(66476007)(110136005)(53546011)(186003)(316002)(8676002)(4326008)(6636002)(966005)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGlXVU5VM3I1cUVKRkZBQXRJNmNOa1FaNElBc3Z1Q0JxWGluTHkzWmFoZURP?=
 =?utf-8?B?OTQyb1lZQ2NCVXBlVlVrRjZZVnBaZzh1emdPdHhJSEdBY2VzbkwyYWJnME5l?=
 =?utf-8?B?aDdTYm5ySnY0WFV0dThXc2s0R3drcmMzZVdPbm16U09ldXowRFZGZUN0a3Uw?=
 =?utf-8?B?K1EwcWgrTkx1dit1Qk52cXZGdDViNldWMGhudzg0WGhmUVQ3Q2IwSHdVWjlp?=
 =?utf-8?B?ZUJrWFMzNE5sRGhlVmNQcHl0NjRGU2JIZWMxaVZBNFlWSEVKc1ZJaTJqNXBl?=
 =?utf-8?B?ZkxlUHRPbkdMYW94QitOMFpiRWlSc3ljQkdTN25WVmZIL1crWERETGRiQk5R?=
 =?utf-8?B?RmZXSFFoVzQ2KzlQTFk2ODRKT2F4RDBSMmVYTmNFaDdiM2owQW01bjRwL0tB?=
 =?utf-8?B?QTYyOHV0T2JobVJ4OUl5TWV6Zzc4QlJwVmtyNUdyRkxBOFFsdUZuUXpUTEVi?=
 =?utf-8?B?cm1GWE5PT2pjWXllb1VkSExaYkNWdGN3K0hkSFRqOXczM0pSL3B6V0lueVBx?=
 =?utf-8?B?cFpGMnJZaE91OTF3R2pKZm04RGoxQXhWVTBpd2cxQXR0Zys1TzhXVHFucTZw?=
 =?utf-8?B?ZE50TFpNUDdJOVBZT0hwbWxvbXphV1dVUStJbDh0TUMrc05HaWcxTkJIdEpT?=
 =?utf-8?B?NnNDK3NEYit2My91T1RIOFNXQnFkamc3cTNDbU5TSUxnaU9uZFFHNVZpczZN?=
 =?utf-8?B?YkNPdVVkSmdxd3p0bm1rdnNod3JrMDVwbnZjL0hnYTFWVEZxeVFmbng3ZDFJ?=
 =?utf-8?B?TFJ1VStaZHYxTzVEWW5jNkgzb0FLVmpwMy9LenFOZnZYQWVGbVFpUmZpUWIx?=
 =?utf-8?B?NXF1bGRhNDZ6TlZURWZKNGFLMzlDaFBXOHZ4K05jRlU0MzU0MExvdFRXR3pQ?=
 =?utf-8?B?bTc0MGZCRlFtZTM4VmJKVVBCWkNEakZYVFV4SWJSRzc4QWt4SEhwM0NhR25l?=
 =?utf-8?B?SXdwZFN6c2hVNFQ2ZmxLM29IRHJ5elhMUmpKVDNscVlIVlRFdHd4U2F1OHdZ?=
 =?utf-8?B?OVgvWHc0ZGlRZFRNWWhDNVQ5NytuWHlVNXJ2OGd4dUxIdnJuUFVvdll3c3U0?=
 =?utf-8?B?aVVidW16a00rZnhRRkNOR3ZNR1dselJQc0wycWRjYmxzdmQ1UllzVGlaVnJk?=
 =?utf-8?B?UXBQdWxoclV3ME9sTFNQUTI0U2xBRUVwUG5XL0hPcjAwUTVZQTlhUXVOYTZM?=
 =?utf-8?B?aE84N3pWSk82OHZJS0xVdzd4TWRuMmgzTlZkeVh2R2RyWnFvSHdzNSs3bkJB?=
 =?utf-8?B?T3hOOURHeUV3OEFMTVdmMHRMWXVib2Q0cHdjWmpNM01DbTE4WWVXUCtERy91?=
 =?utf-8?B?WDdNTWdKYTRWQ1ZPN2dXazB6SUFqU05zQzkvZ3puRkpRY0lyMmFoc25RcW93?=
 =?utf-8?B?OHlGYTI4Z3JnWFd0MG14SWJ1VGtlRFpHNGQyYlIvdWh1TkVhelMwWDB5SWVk?=
 =?utf-8?B?SHQ1VHRnV2I4TzdHeUtZS3BtY2orYkVMNkJ6ZUR2Zi82VndUWTFlNEV1ZnNa?=
 =?utf-8?B?eXM2Ni9DOG9JZ0hnM0VtZWNMN2ZQb1AwY04rOHFkOXlWRURMQmdYMmU5UVBL?=
 =?utf-8?B?UGk0K2NkMGVKNlljQzBuSVNnTnpiMHpCQmd1MDdWUHZYUU95SW02QW9zQlM3?=
 =?utf-8?B?OS9FMXd3Y004eE5nZVNQZExXN1pFRkM5Y2xsRWkxQTdzaVVZWllqWEZUbm9m?=
 =?utf-8?B?SnBHNGRXSlIyT3FmMXRVUThIYWJnL0NVME0vVGdsQ2txdkdXWnRRdFJKRkwy?=
 =?utf-8?B?Rk1rZk1XZTZzZjcxWlpVVWI5YnEyRnEzNEJXdFpXaTFVMDFneG80MTJnbFFK?=
 =?utf-8?B?Mk9MUWFDeWkzWG1HUzRLK1liU0NDZXdvdlBKTXhJei9uc3Bia3F1Ky82aXpx?=
 =?utf-8?Q?e0EMmfeTbmA4f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9adcdd25-6b43-4372-3499-08d96987a841
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:22:41.5741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUbwwv4HVUxHMqqhMRdfse1I0j9HKONcSDKkLcs/R1ZKMFdTJaW4HyFVIVw8DqSVto/HqH+U4BsMauAF9zgsWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2799
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

As I mentioned to Monk before - what about cases such as in this test - 
https://gitlab.freedesktop.org/mesa/drm/-/commit/bc21168fa924d3fc4a000492e861f50a1a135b25
Here you don't have serialized sequence where when jobs finishes 
processing and second starts, they execute together  concurrently - for 
those cases seems
to me restarting the timer for the second job from scratch will let it 
hang much longer then allowed by TO value.

Andrey

On 2021-08-27 10:29 a.m., Christian König wrote:
> I don't think that makes sense.
>
> See we don't want to start the time when the job is inserted into the 
> ring buffer, but rather when it starts processing.
>
> Starting processing is a bit swampy defined, but just starting the 
> timer when the previous job completes should be fine enough.
>
> Christian.
>
> Am 27.08.21 um 15:57 schrieb Andrey Grodzovsky:
>> The TS represents the point in time when the job was inserted into 
>> the pending list.
>> I don't think it matters when it actually starts to be processed, 
>> what matters is when this job was inserted into pending list because 
>> right at that point you arm the TO timer (when no other is running 
>> already)
>> and so when the previous job completes and you cancel and rearm again 
>> you can use that TS from the next job in pending list to calculate 
>> how much time has actually left for it to run before TDR must be 
>> initiated
>> and not just give it again full TO value to run even if it has 
>> already been running for a while.
>>
>> Also, i am not sure also about the assumption that what we measure is 
>> processing by HW, what we measure is from the moment it was scheduled 
>> to ring to the moment the job completed (EOP event). At least that 
>> what our TDR timer measures and so it makes sense to set the TS at 
>> this point.
>>
>> Andrey
>>
>> On 2021-08-27 3:20 a.m., Liu, Monk wrote:
>>> [AMD Official Use Only]
>>>
>>> what is that 'ts' representing for ? it looks to me the jiffies that 
>>> it get scheduled to the ring,  but a job scheduled to the ring 
>>> doesn't represent it's being processed by hw.
>>>
>>> Thanks
>>>
>>> ------------------------------------------
>>> Monk Liu | Cloud-GPU Core team
>>> ------------------------------------------
>>>
>>> -----Original Message-----
>>> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>>> Sent: Friday, August 27, 2021 4:14 AM
>>> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org; 
>>> Koenig, Christian <Christian.Koenig@amd.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
>>>
>>> Attached quick patch for per job TTL calculation to make more 
>>> precises next timer expiration. It's on top of the patch in this 
>>> thread. Let me know if this makes sense.
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
>>>> (in drm_sched_stop) we won't touch the pending list anyway until sched
>>>> thread came to full stop (kthread_park). If you do see a reason why
>>>> this needed then a comment should be here i think.
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
>>>>>                          (entity = 
>>>>> drm_sched_select_entity(sched))) ||
>>>>>                         kthread_should_stop());
>>>>>    -        if (cleanup_job) {
>>>>> +        if (cleanup_job)
>>>>>                sched->ops->free_job(cleanup_job);
>>>>> -            /* queue timeout for next job */
>>>>> -            drm_sched_start_timeout(sched);
>>>>> -        }
>>>>>              if (!entity)
>>>>>                continue;
>
