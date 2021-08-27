Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D315A3F9AC6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 16:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AEB6E989;
	Fri, 27 Aug 2021 14:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA976E97C;
 Fri, 27 Aug 2021 14:20:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUwIvw/Q4zddpMz2N6tKd4di69kyh8aBKl3uG023K2m4d0DerKyYCjlMcC2uott5PP3ME1baGpOe4VNY+uekCEbBQ1JxbO2KncrvCigNUBqS3CwjDYma3AP0DIiGMSf90zPdpqAHxPjuzCkJR+HWIRzFDWII3MtFg0rylFNPbp+oga95snqNuqeflkjStYcpjfo2WLhWnJYOtl2Qb+3CoocPJlqX6lmMTCFx9TjI5MzYQkT9gHoRxmStQnr4vKlzoG78qdwIoyMStMkd64PMUoeNBvrjnBAABMDRNksXcyIyIGQ3wml2wiSYjEO6Ra7pVxblXKlqwIL4qZ071DeUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j1N0m9Ihs6a0yT84b/sTUVjBvU87qqMKrbT+vZ5VM0=;
 b=CbxUiO/oSqT//IloNzxXJd5zpF9rawvIUVSyP21+m3JuL4/MHxifESBOSUDQ/UMc8keALei/8laeNfHzmdmChcOGG+x0LRfxbcDVOQHkGQq80T/49byOlLWQRT+Qf7fplrLw0UCxjNnU/Wp780ME8KixCKvOEZifUeLfhvcHVEwPhmsblqkKoZNVNt5Dn26axVaNsl9JWzoPX3AonZLrtaEX8lrjctLnWkwYW7O/+Nkyav7Q0TVZlaLpW/Ak9cyftN3J0OeJazF6GvEnMpCMIjrM4BbyRfkJpgnbDcYLaqUyWRTnTKp3E/klDKcdK47RCcQlvBQA8pMrf/+7py5k9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j1N0m9Ihs6a0yT84b/sTUVjBvU87qqMKrbT+vZ5VM0=;
 b=ejZN6ZpWwgcaqnfO8WLwVPRAJxnmccZLC3S+Wcvap+n3dGf73IoOxpC3iK3wPPGTPUVZk2od5d4G9Gcx6XgBjNtwyhkubCsUGHbC/wCc5wSd5gbdZGsrlhoyx3fD5kYRgy5B+NitNlu43RPmvvBxjiMmmSPakaWBBxUiwHS4M5s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2573.namprd12.prod.outlook.com (2603:10b6:802:2b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 27 Aug
 2021 13:45:45 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 13:45:45 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: "Liu, Monk" <Monk.Liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
 <8c675723-b272-3d81-06c2-fe574a1dff06@gmail.com>
 <BL1PR12MB52691420DCC3A00794168A1284C89@BL1PR12MB5269.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <de91a9d5-e223-3f5c-5226-e1261987a5cb@amd.com>
Date: Fri, 27 Aug 2021 09:45:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BL1PR12MB52691420DCC3A00794168A1284C89@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::22) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1441:7037:5b2:9692]
 (2607:fea8:3edf:49b0:1441:7037:5b2:9692) by
 YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Fri, 27 Aug 2021 13:45:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f03c17c7-279d-41d5-b2b9-08d96960f812
X-MS-TrafficTypeDiagnostic: SN1PR12MB2573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2573195743C1344398B4F749EAC89@SN1PR12MB2573.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dIYyR3lawv7XaNtZxyCZs8pnr1FgTnHnVZIsXpwCWUXpjJXRkc1oSQT4t/FBBJfW5pG1NoZD45g3/VmjXf/IDoT65wp76A2M+uxhw+8DL4BucB6Bp6tidZlCp9V0nA+t7pR/OskGE6maPm+3A5OTfUmfNNGk5P3eB6LDtL2fFPRuQPTRFedgrzkZSnK7UACEBc/mNGkJ26NhvG6B7NuiXeHkIo4mPzKK8EQNQA/iVjx/KqE3UNJxqHBIo3f8y6751wZd6UJppsqz/ZfG1rDcbhaD3S+Ob8GWR6pQ35IHK01ahi5Uj2Ebli7CRAf1AInmSuF/yD/9iAp+pCpvuwsjAT16DJpwc0B3ZMszmHKPIXhL31q10Xd2GE74uz5bvMX+Sq3DNeZw5DZMzRECYMH431hxXYPkHThUGiHBoJeWZ1S6RhGAFSQUnGCuuDWgLdzQG/6FWJoS7HlX4HFeu4kIBg5lWr7++Xam55lxDuFAWHuVHV+spWufuJq1y0VftSkTMkEL4408xhX+toQ64g2y3vzCuLUQhj8KRlZUcJOPd0oSx8lR/zBqquIjOq/jhmfDokuXY4M520BHyRSQGSdnA1TTwL15L7UlmBpq4W9USoUUs5UMGHeaxJ0KKN2lnjYSSCoU+zfCMuBfTVOSOGbI8evPDS0cmYSLNrpnCEtRY56YaohRmhX0zTy2BKvCCUId1Ps/X2JjEmBRbubresMSnHE0dVAbML+AyaO8nGO8Jdk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(66476007)(31696002)(83380400001)(86362001)(31686004)(110136005)(66574015)(186003)(2906002)(36756003)(53546011)(6636002)(316002)(4326008)(5660300002)(478600001)(6486002)(8676002)(8936002)(38100700002)(44832011)(66946007)(2616005)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVZvWTJ3OUVlMTFycE1ERkJIK1FORmZYcTZjVnNiR1ZaUEM3bG14d3l1LzdN?=
 =?utf-8?B?S2p5UVNDR2hCd04vVnpaaWIrR0ppS2lyK3ZiM0VLMVNuVm1ZNXh2KzFMOFFl?=
 =?utf-8?B?Y1U1ZTNHS3dSWmw4dDNackZxQ3o4Q21xaFdDbDBKNkprbWtWM1RQQUNMczho?=
 =?utf-8?B?L1JqanJHcW1VUGVER3g2WHRJUGJMM2s3M1dpYzB4TndQbkYxTDJOZDZEbmVQ?=
 =?utf-8?B?RXBlRk5zemptWlZNcW12MEs0c0dHMVFCMEJiK29GNUNHK012K09zZkt3K0R4?=
 =?utf-8?B?QklydlpCeGtYNkN2d2lOalQwNENqc0paSXI3QTJvWnRZWFZQSGxneTU3MHdX?=
 =?utf-8?B?cUZwbm1Qd1V3ZlVFWm45V3hUMXhWVC9PYnllc2ZwajVYSGtTTjE5bUs5RFNq?=
 =?utf-8?B?V2lJa2xEbHJaZTU4UWtUOWFxa1BTb0F3NlBLS0pYSnZIMlFHNGJaYmpkM0NJ?=
 =?utf-8?B?S09WOUF0MkZMMFlYVzRoL21NVnBVSHNpWnhTSlN6TFF5VnVTNnNNSHQ0bWti?=
 =?utf-8?B?dnpGUEhkSFZnVzBmbDZiKzFydksrWExDdk5pWWl1WDZzTzJ2dXQ2aEtoZncz?=
 =?utf-8?B?ejYvUFVYVnhpb28rTGxweGZ0cXhKcGc2aFl2djUwUWhDQitZNjBkTVBIWDk1?=
 =?utf-8?B?Y2NUQmg4UFZHSU5udFM3aGJRY3k2YllZQzFMSUxzbSt4ZkZzU3Fpb0hMSzlR?=
 =?utf-8?B?Q01kdE5MajlDQWQ4NWRIMmpwWkZpOCszTkJZMDh2UEp0RDF3V0R3MmlON1Y5?=
 =?utf-8?B?MkI4NkFYWjJaR2RYSC9GUndwbTZ2aFEyQkg0Z2N2NG1SaDNjWWVEMUkyVlRX?=
 =?utf-8?B?VEtiYjk3Z1NnY1NsaWxXdUE4Sk9EcUc5Tmk3akt4ZEtibmtzSUZSa2lrRkVP?=
 =?utf-8?B?Z0luQUNWd0MyREZoa2tiRENPdjl1VXRnYm1LcnZ1ajFoUDQ3cVMyZzdoZVRL?=
 =?utf-8?B?eVVPcGMxMHlYREFYbzlvSGQ3OU9RbG00T2RUeVRSYVJSV2x1eTVvL0l1SHI3?=
 =?utf-8?B?cW9rOEptaUpuRHRQYUlHdnhEVDVWYXc2MDdnZ3RKaitOcUNSOGRrRGZCb0l3?=
 =?utf-8?B?RHUyekwyUTF0cUJZQ2NqRW9lUjN5UDdXdVVtRXFzUlZNai8rUEQyWGl5c0V4?=
 =?utf-8?B?Um9QcnRvdjZkblBIT29PRVNmcnZHY2pLV1QxbEgvSzU5Ymhyd1pVK0Y3K3pQ?=
 =?utf-8?B?YjZ1ZzQraXM5TElkdmphdktmVlk0TUI2ZkM4S2RkMjlIbU1HbHdCNHhzQW1i?=
 =?utf-8?B?S1VnT1VQeXl2N2NTME8yTjRyY0FWb3V0dERmN1JybG5sM2ozZnhONmtnTXJh?=
 =?utf-8?B?d0pzZWFKajM4TWZjTmZrWGJHOHlQOXBUM25menNPVW41SlNDZGRJWHoyWUtq?=
 =?utf-8?B?QkMrT3lSWjdYZC9YUFMyUUNLdzkyaG1JYXNOUnllYzZNYkpoQklpSEZmdzBL?=
 =?utf-8?B?WUZ3OWxTMk82RTJid2IzMDEvVzBnNW1WNWpLNTh3RUNiU0dMeVNuL0xjcHlC?=
 =?utf-8?B?OG1hNFhPMDc2R0tKeXk0WkUwbG1zc0szVVZHTW9zdXNQaU8yNENmNWh4SGlE?=
 =?utf-8?B?dUFtN3RHd0ZwdWZWU0lNaThEaXlrMUtRQzZrbzVtOGFPY1dod2Y0aGl4YThS?=
 =?utf-8?B?ejA3aWxBcnl3N3YyTEJDWlpTaXpiL3ZsQ3ZFOWVxVjM2Z2JTcFFOVlZSZjJC?=
 =?utf-8?B?NWMzRyt6OS90NjJHK0FCbjBqN1gyMFJ5SmljV281Q0UxaXBHdUhpN0RUdm5y?=
 =?utf-8?B?WDhSS1poekNTTmJ5ZEFqdVJmY0JuU0ovcVdyU1prQUwzZ1pGdkRRcWI3d045?=
 =?utf-8?B?RW9tTk1HNVdwUkwzS1ovSkZvZFVINUI3aDQ3Vkd2ZElUbllWdFA0QzZSczRE?=
 =?utf-8?Q?Aeh9br/pLmjPP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03c17c7-279d-41d5-b2b9-08d96960f812
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 13:45:45.1016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ejwIH5Xs+bUREunkUUG7sxztOGI4W+C5w8WQ67GPQj2/m3VzMIQX4AwFuWKP/Zr1MDmx3hBUUEoHuaUGUPmlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2573
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

So we agree if (kthread_should_park()) return NULL should go away ?

Andrey


On 2021-08-27 3:46 a.m., Liu, Monk wrote:
> [AMD Official Use Only]
>
> Yeah, that "kthread_should_park" is also irrelevant looks to me as well and it delays the signaled job's cleanup/free
>
> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
> Sent: Friday, August 27, 2021 2:12 PM
> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
>
> I don't think that this will be necessary nor desired.
>
> See the job should be cleaned up as soon as possible after it is finished or otherwise we won't cancel the timeout quick enough either.
>
> Christian.
>
> Am 26.08.21 um 22:14 schrieb Andrey Grodzovsky:
>> Attached quick patch for per job TTL calculation to make more precises
>> next timer expiration. It's on top of the patch in this thread. Let me
>> know if this makes sense.
>>
>> Andrey
>>
>> On 2021-08-26 10:03 a.m., Andrey Grodzovsky wrote:
>>> On 2021-08-26 12:55 a.m., Monk Liu wrote:
>>>> issue:
>>>> in cleanup_job the cancle_delayed_work will cancel a TO timer even
>>>> the its corresponding job is still running.
>>>>
>>>> fix:
>>>> do not cancel the timer in cleanup_job, instead do the cancelling
>>>> only when the heading job is signaled, and if there is a "next" job
>>>> we start_timeout again.
>>>>
>>>> v2:
>>>> further cleanup the logic, and do the TDR timer cancelling if the
>>>> signaled job is the last one in its scheduler.
>>>>
>>>> v3:
>>>> change the issue description
>>>> remove the cancel_delayed_work in the begining of the cleanup_job
>>>> recover the implement of drm_sched_job_begin.
>>>>
>>>> TODO:
>>>> 1)introduce pause/resume scheduler in job_timeout to serial the
>>>> handling of scheduler and job_timeout.
>>>> 2)drop the bad job's del and insert in scheduler due to above
>>>> serialization (no race issue anymore with the serialization)
>>>>
>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 25
>>>> ++++++++++---------------
>>>>    1 file changed, 10 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index a2a9536..ecf8140 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct
>>>> drm_gpu_scheduler *sched)
>>>>    {
>>>>        struct drm_sched_job *job, *next;
>>>>    -    /*
>>>> -     * Don't destroy jobs while the timeout worker is running OR
>>>> thread
>>>> -     * is being parked and hence assumed to not touch pending_list
>>>> -     */
>>>> -    if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>>> -        !cancel_delayed_work(&sched->work_tdr)) ||
>>>> -        kthread_should_park())
>>>> +    if (kthread_should_park())
>>>>            return NULL;
>>>
>>> I actually don't see why we need to keep the above, on the other side
>>> (in drm_sched_stop) we won't touch the pending list anyway until
>>> sched thread came to full stop (kthread_park). If you do see a reason
>>> why this needed then a comment should be here i think.
>>>
>>> Andrey
>>>
>>>
>>>> spin_lock(&sched->job_list_lock);
>>>> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct
>>>> drm_gpu_scheduler *sched)
>>>>        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>>            /* remove job from pending_list */
>>>>            list_del_init(&job->list);
>>>> +
>>>> +        /* cancel this job's TO timer */
>>>> +        cancel_delayed_work(&sched->work_tdr);
>>>>            /* make the scheduled timestamp more accurate */
>>>>            next = list_first_entry_or_null(&sched->pending_list,
>>>>                            typeof(*next), list);
>>>> -        if (next)
>>>> +
>>>> +        if (next) {
>>>>                next->s_fence->scheduled.timestamp =
>>>>                    job->s_fence->finished.timestamp;
>>>> -
>>>> +            /* start TO timer for next job */
>>>> +            drm_sched_start_timeout(sched);
>>>> +        }
>>>>        } else {
>>>>            job = NULL;
>>>> -        /* queue timeout for next job */
>>>> -        drm_sched_start_timeout(sched);
>>>>        }
>>>>          spin_unlock(&sched->job_list_lock);
>>>> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>>>>                          (entity = drm_sched_select_entity(sched)))
>>>> ||
>>>>                         kthread_should_stop());
>>>>    -        if (cleanup_job) {
>>>> +        if (cleanup_job)
>>>>                sched->ops->free_job(cleanup_job);
>>>> -            /* queue timeout for next job */
>>>> -            drm_sched_start_timeout(sched);
>>>> -        }
>>>>              if (!entity)
>>>>                continue;
