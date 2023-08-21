Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C6782A49
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CFE10E250;
	Mon, 21 Aug 2023 13:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F46C10E24F;
 Mon, 21 Aug 2023 13:17:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxxt4+Ro2/wTbohWkJAtwOhXBDU4FjTchEasldE83w1wBjZIvtXVNzDwkm+D19J6JXe3zq0fB1ah7gnAEfQpILYgw2xppK/CMz/dpS5Bn2msNiDeT5b6ePLiOzjYv18mRxJWT3JszXm2k+Jveye2UDNNcU+yLQoy31W+EaIT8hXVTtRSVSIUvNMTpbzchNLb/xapQjcs1llGunYBPeBb1yf6AolqknlkWSw1mrCqJ3n9fl90eIji7nQG0OaqZLXe/4HGWSTgZrnHaH18XcmBCuUswqATL0iNHLCafghcB5gjmc67UolWpLgkEFzWlvmYc1pqdNDUBSrOgI92pafMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY37jlXel1wPivlxVebKCpmM59WB95tIZJ0jB0kurbc=;
 b=CKJnmcG7+bX7UCO+0dfMCF6JHJIg2xR2c4L/UTsYZTIMLWOwMUKT5BlI087mHE90RegceS7lN4Qyd0ZRgNtDEfrfLDH+11sY0pkizyIaQ0vZUS+sNQUXuMSIiffDJVGV4ZYih2QbgeQVtdQm6pZTWmsO5++ABGi27fr04FkGOzLuYmqgd+s+hvyDqy0058V7WsfN12DFjKERHKq5MsK0lOIiNMe+SiPTEEYfWR7CNAJT00e/BHbaEeqhXrfwYigCFmtkseyMB7P9KyTcbZ71rP37QBOXs/PLdryfJm1eHwY0Hf0t5CZY7mCDOIBRsm6c1eR6eCs5BAWfiNbLuu4rOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY37jlXel1wPivlxVebKCpmM59WB95tIZJ0jB0kurbc=;
 b=RUY53p0vv+gg0X4rjRZdQh6SRjHuTO2e+lkqYkRrWAypY2b9AyWy81kPmaoXZQxxp5KCPHqhdx+fHKZw8C9g9wG8NZ1alek4jh0FO0DUYwf3AYB9cGMv8qu9uY9uTww7SNVQSTGeYloKLqF950qXOQ12q2oa+Qb/JXGtl+3h8K4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:17:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:17:35 +0000
Message-ID: <c7c32797-9ca1-9f78-d3e6-07f827731ee6@amd.com>
Date: Mon, 21 Aug 2023 15:17:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <f6b7c246-fd87-a853-b7c4-e2c1b6727a93@amd.com>
 <ZN5exv1IWJtKL1nJ@DUT025-TGLU.fm.intel.com>
 <9f6554fd-8748-2613-1c90-921b670ad4d9@amd.com>
 <ZN9ufogOQm4xblxm@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZN9ufogOQm4xblxm@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe95210-cb1f-4e0c-37df-08dba248fc0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ZoIPIBQ5E6Zlpf/E2OA3NRL3dC/pHiAViweWSNV+uSWspMTX8s+xSi51uD9n/CW35EpWCoPNyRpxAkQnEkpHQgpjeR+9/dlWMJ3u8RdEavHzdlwX6yLOWBjdZx1NFNVp0Nu6oouZnDV6hzh3eKMAdrunIw/m9k7JbrC9yW9jnWNecisZ+nC/4BbbWSebmKcv3gEguQJO8PYHSnr0hZOgbS0a/7pWlDXUZ4dE079/TBLdnBagE/wGr3n2M/RMiHbRtv5FELA0b06Bkry240nZXxrMVq4xSctOyV2Jbrep0m1S/DQNpldaokV94Gm34GiG1N/R7qIlELEeVWFggF7P0R6kcqaukJx/gzuOKZt3VA1riHreVe97wtC7OKAvF5lAmohYp++RCEkIp14ykYXxfbFHP+PhMzGTtewnVU6kxTfCehshEoMiEMO2004MxsX0htaKZRcHH1y5iQI8xjRNJMA6uku3EJpqeEgcnSFsHvalgKSh+UsVMV791JHmfqnkEMfZTOcVKEfFV3tJC4MfGto8KlBTBF0RyxAqMJtFECFu2JRK6z74LDkm4i9WsGMIiDXmzHunEfP8PgpAZMp03VTI8phftAcPqtr0oP+MNNoV3zpQN0k31Hr8NsSbWWQ/2fdNshMdYVV8jDQUHc+uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(66574015)(2906002)(30864003)(7416002)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(6916009)(66556008)(66476007)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SklzOWhIVVAzaVhHWnk4TzJLWTNkSGpCUFFIejVYYzRMVzczdUFtSmJVRWhm?=
 =?utf-8?B?UlVrbnZJeDdzZlN5dlRHUUVnNnBZZDhNb0xFSVBrRHNHU2lPSGtsS3dIQ3ZC?=
 =?utf-8?B?bkNjdFRFaXBWVjhJZGp5bmxkTTNuaWJ1MW82aE1NcG1XQkcwcU1xTTRHQ3Js?=
 =?utf-8?B?azYzUW9TZ2VwTzZ2R0dWdVMwSFlFaWd1MFRqd2Q2UGZ2RE8wckNmT0JOUTQ3?=
 =?utf-8?B?aE9YT1RXMGVkbFhCcGxEWjVTQ1haNWkxaWE4cXZpYU55RHozS1FQME56Mm5o?=
 =?utf-8?B?ZFhrWW5rYlcrSlVoc2pXOEJLUGE2QkRqL2lZOFBZQXl4ajRSbCs3RjR3cEpm?=
 =?utf-8?B?Vy80ODB6Tkdtc0hJVVJxdmhROEl0c0VrUS9lRkNxbWtwN0dwODc5V3RBOFlu?=
 =?utf-8?B?NVFWemJ1VnlLSk5aUENweXRkNUhhVUwxZ3IybVhWMDl5UHN3VmdzTVZsQnlD?=
 =?utf-8?B?dWk0cVRjTlQwQjZjOGVFVmZPSjB1WmNZUDJyVlZNTWthdEszTVlBY3pMNzd5?=
 =?utf-8?B?eE52UVhJSXFENU9Gb1g4dzJSOGVTTlFQeXNQVDhRNzUxZmlnMEY3aC8wa0pn?=
 =?utf-8?B?djVEdEoyK09OeVhnbHF5K1VQZVdBd1R4WFJkbzRCdVZZMWpCS1U1dDNyRndQ?=
 =?utf-8?B?WUVuWkR6L3ZVRlpyRFZQN1h3aGd0WENwd1daUTZqREVsb25maTFEZ2h2endj?=
 =?utf-8?B?ZzZXRUNwbnNoc1hSbitwUjlxeU12ajM2elR4OGpDbHArMVBGOXpML3M0djBI?=
 =?utf-8?B?ZFNNejJQRVkvQTl4emRkSkdvY0REZjYwVXRTY1p0WC81c1Y1TW5SZTdkY2dU?=
 =?utf-8?B?ellrMC9WQitxbmZuaGQ0a3ZVUmhrdGdRT0Zlak41UnFoYjdjQ0NFMDlOTXpn?=
 =?utf-8?B?eFJXcTErbXlYN2o3NXV6ZkJ0T1U1MHl4QTFsMGNoVTNycmhRZkUxSFNtRWZC?=
 =?utf-8?B?VDFuTWo4TjJ6aC9Cckx4TmdLck5QcmY3N1VmdlpKZU9QOFc5Rkh3WkdVS2NK?=
 =?utf-8?B?QXFwSnVUOWlCMVlpb2dXZUZsekFhOVh1NzBqUXlheHpwUFF3NTBYdVhoblQ4?=
 =?utf-8?B?cllvRkE2T1c1c1NSWWxtNEExb01hMmFnZUJHSWZSRXY2ZVJEU0tDWFltL0JP?=
 =?utf-8?B?eFJkTVZCMmdKMkhwR1orN0RLaXNCT2tmOGtkZ2pzQjhKaEJQQWJISFpENUhv?=
 =?utf-8?B?ZFFIcnZQd2N6aG5FeXBDZjdmenpTb1IrRDVQL0JJZGhvTkFCUGJWVVB0T3l3?=
 =?utf-8?B?Y0JBU20rTkd2dTd5bTBBZ0FoV2JUeEUzYXdBVnRFUE1QbW5yMU1aOUZwUDBi?=
 =?utf-8?B?U3pDelJHMHNyQy9McHE0YUU2VDg5RzkzcHE1c0ptVE90SFg1RkRRTnkzRlpl?=
 =?utf-8?B?eUVyVjh2MnlaSXRhMWlqeHJCYSsxQmg4U3NhS2NFSWFUNWNBVVl6Yit2cUlR?=
 =?utf-8?B?Wm11U3hCY1BLazlxOERmeERtWU44UnBwTXRscnliSFJZK3dEQmluSEFiZlRa?=
 =?utf-8?B?U0J2b3YvUXZRbEVpYW9HMXN3Z0NXWGx6ZUpUKzdYbW1wdEFLNnVDcExNelNy?=
 =?utf-8?B?MzQ5eUU0aWF5am1scHhhcnhlVmh1SU91WUxwMDRSTERqREpCNmhKOG8yeW5B?=
 =?utf-8?B?aUJJUEczRVFzWDZIRVhZMFVlakx5Z0srNWtPdS9PeW1PZno0L1JnSXltUW5E?=
 =?utf-8?B?UFBXZU5tczZtaStScGFxUzkrdjkycytDNWR6RWF4bTd0MlV4NWRSWnBXc0Yy?=
 =?utf-8?B?bEUzbE4vL2VoWkJsaTJzcjM5cHk1OFFoek9PZzJGK3kweE9VZW1aN0hwalJF?=
 =?utf-8?B?YmloUURtbGhpUkJCZmxFNnJvSEljZ3VvNVJyTzMxNVZ5bjhmd1dIQjZseElX?=
 =?utf-8?B?N2tBRmxjaXFjd2cyYXE5QzkraXhjR0NQcndMWU96OUN5MG8rNEhlWjFuajVz?=
 =?utf-8?B?cTdvaVhYV3g4b2o3OFdHTTl2K0VwY1FHS1gvVjdYQnpKQ21DZFpCYWxacURz?=
 =?utf-8?B?aC9QVjMveDZXTTlSSjY1aUdwQVQ0SDFtb3ZIditnaCtHVE9BdkVMQituWnRr?=
 =?utf-8?B?RkFYZDZoZytkM3hYWWRRakZiNEx0QkVQdmREZk84eXJwdGNpV1Q2STlaSlBt?=
 =?utf-8?Q?1kdOgfxaMlR2dNIg0YY/dy133?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe95210-cb1f-4e0c-37df-08dba248fc0a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:17:35.4218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hnSEVDr43MZaUGf/mFGTpPF8Fl8ROITSgEcb788m/rnKMW6bhTAuWRIa1hggs2P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.08.23 um 15:13 schrieb Matthew Brost:
> On Fri, Aug 18, 2023 at 07:27:33AM +0200, Christian König wrote:
>> Am 17.08.23 um 19:54 schrieb Matthew Brost:
>>> On Thu, Aug 17, 2023 at 03:39:40PM +0200, Christian König wrote:
>>>> Am 11.08.23 um 04:31 schrieb Matthew Brost:
>>>>> Rather than call free_job and run_job in same work item have a dedicated
>>>>> work item for each. This aligns with the design and intended use of work
>>>>> queues.
>>>> I would rather say we should get completely rid of the free_job callback.
>>>>
>>> Would we still have work item? e.g. Would we still want to call
>>> drm_sched_get_cleanup_job which removes the job from the pending list
>>> and adjusts the TDR? Trying to figure out out what this looks like. We
>>> probably can't do all of this from an IRQ context.
>>>
>>>> Essentially the job is just the container which carries the information
>>>> which are necessary before you push it to the hw. The real representation of
>>>> the submission is actually the scheduler fence.
>>>>
>>> Most of the free_jobs call plus drm_sched_job_cleanup + a put on job. In
>>> Xe this cannot be called from an IRQ context either.
>>>
>>> I'm just confused what exactly you are suggesting here.
>> To summarize on one sentence: Instead of the job we keep the scheduler and
>> hardware fences around after pushing the job to the hw.
>>
>> The free_job callback would then be replaced by dropping the reference on
>> the scheduler and hw fence.
>>
>> Would that work for you?
>>
> I don't think so for a few reasons.
>
> The job and hw fence are different structures (also different allocs too)
> for a reason. The job referenced until it is complete (hw fence is
> signaled) and the free_job is called. This reference is needed for the
> TDR to work properly and also some reset flows too.

That is exactly what I want to avoid, tying the TDR to the job is what 
some AMD engineers pushed for because it looked like a simple solution 
and made the whole thing similar to what Windows does.

This turned the previous relatively clean scheduler and TDR design into 
a complete nightmare. The job contains quite a bunch of things which are 
not necessarily available after the application which submitted the job 
is torn down.

So what happens is that you either have stale pointers in the TDR which 
can go boom extremely easily or we somehow find a way to keep the 
necessary structures (which include struct thread_info and struct file 
for this driver connection) alive until all submissions are completed.

Delaying application tear down is also not an option because then you 
run into massive trouble with the OOM killer (or more generally OOM 
handling). See what we do in drm_sched_entity_flush() as well.

Since adding the TDR support we completely exercised this through in the 
last two or three years or so. And to sum it up I would really like to 
get away from this mess again.

Compared to that what i915 does is actually rather clean I think.

>   Also in Xe some of
> things done in free_job cannot be from an IRQ context, hence calling
> this from the scheduler worker is rather helpful.

Well putting things for cleanup into a workitem doesn't sounds like 
something hard.

Question is what do you really need for TDR which is not inside the 
hardware fence?

Regards,
Christian.

>
> The HW fence can live for longer as it can be installed in dma-resv
> slots, syncobjs, etc... If the job and hw fence are combined now we
> holding on the memory for the longer and perhaps at the mercy of the
> user. We also run the risk of the final put being done from an IRQ
> context which again wont work in Xe as it is currently coded. Lastly 2
> jobs from the same scheduler could do the final put in parallel, so
> rather than having free_job serialized by the worker now multiple jobs
> are freeing themselves at the same time. This might not be an issue but
> adds another level of raceyness that needs to be accounted for. None of
> this sounds desirable to me.
>
> FWIW what you suggesting sounds like how the i915 did things
> (i915_request and hw fence in 1 memory alloc) and that turned out to be
> a huge mess. As rule of thumb I generally do the opposite of whatever
> the i915 did.
>
> Matt
>
>> Christian.
>>
>>> Matt
>>>
>>>> All the lifetime issues we had came from ignoring this fact and I think we
>>>> should push for fixing this design up again.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
>>>>>     include/drm/gpu_scheduler.h            |   8 +-
>>>>>     2 files changed, 106 insertions(+), 39 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index cede47afc800..b67469eac179 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -213,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>      * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>>      *
>>>>>      * @rq: scheduler run queue to check.
>>>>> + * @dequeue: dequeue selected entity
>>>>>      *
>>>>>      * Try to find a ready entity, returns NULL if none found.
>>>>>      */
>>>>>     static struct drm_sched_entity *
>>>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>>>>     {
>>>>>     	struct drm_sched_entity *entity;
>>>>> @@ -227,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>     	if (entity) {
>>>>>     		list_for_each_entry_continue(entity, &rq->entities, list) {
>>>>>     			if (drm_sched_entity_is_ready(entity)) {
>>>>> -				rq->current_entity = entity;
>>>>> -				reinit_completion(&entity->entity_idle);
>>>>> +				if (dequeue) {
>>>>> +					rq->current_entity = entity;
>>>>> +					reinit_completion(&entity->entity_idle);
>>>>> +				}
>>>>>     				spin_unlock(&rq->lock);
>>>>>     				return entity;
>>>>>     			}
>>>>> @@ -238,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>     	list_for_each_entry(entity, &rq->entities, list) {
>>>>>     		if (drm_sched_entity_is_ready(entity)) {
>>>>> -			rq->current_entity = entity;
>>>>> -			reinit_completion(&entity->entity_idle);
>>>>> +			if (dequeue) {
>>>>> +				rq->current_entity = entity;
>>>>> +				reinit_completion(&entity->entity_idle);
>>>>> +			}
>>>>>     			spin_unlock(&rq->lock);
>>>>>     			return entity;
>>>>>     		}
>>>>> @@ -257,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>      * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>>>      *
>>>>>      * @rq: scheduler run queue to check.
>>>>> + * @dequeue: dequeue selected entity
>>>>>      *
>>>>>      * Find oldest waiting ready entity, returns NULL if none found.
>>>>>      */
>>>>>     static struct drm_sched_entity *
>>>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>>>>>     {
>>>>>     	struct rb_node *rb;
>>>>> @@ -271,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>     		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>>>     		if (drm_sched_entity_is_ready(entity)) {
>>>>> -			rq->current_entity = entity;
>>>>> -			reinit_completion(&entity->entity_idle);
>>>>> +			if (dequeue) {
>>>>> +				rq->current_entity = entity;
>>>>> +				reinit_completion(&entity->entity_idle);
>>>>> +			}
>>>>>     			break;
>>>>>     		}
>>>>>     	}
>>>>> @@ -282,13 +290,54 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>     }
>>>>>     /**
>>>>> - * drm_sched_submit_queue - scheduler queue submission
>>>>> + * drm_sched_run_job_queue - queue job submission
>>>>>      * @sched: scheduler instance
>>>>>      */
>>>>> -static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
>>>>> +static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>>>     {
>>>>>     	if (!READ_ONCE(sched->pause_submit))
>>>>> -		queue_work(sched->submit_wq, &sched->work_submit);
>>>>> +		queue_work(sched->submit_wq, &sched->work_run_job);
>>>>> +}
>>>>> +
>>>>> +static struct drm_sched_entity *
>>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue);
>>>>> +
>>>>> +/**
>>>>> + * drm_sched_run_job_queue_if_ready - queue job submission if ready
>>>>> + * @sched: scheduler instance
>>>>> + */
>>>>> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>>>> +{
>>>>> +	if (drm_sched_select_entity(sched, false))
>>>>> +		drm_sched_run_job_queue(sched);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_sched_free_job_queue - queue free job
>>>>> + *
>>>>> + * @sched: scheduler instance to queue free job
>>>>> + */
>>>>> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
>>>>> +{
>>>>> +	if (!READ_ONCE(sched->pause_submit))
>>>>> +		queue_work(sched->submit_wq, &sched->work_free_job);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_sched_free_job_queue_if_ready - queue free job if ready
>>>>> + *
>>>>> + * @sched: scheduler instance to queue free job
>>>>> + */
>>>>> +static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
>>>>> +{
>>>>> +	struct drm_sched_job *job;
>>>>> +
>>>>> +	spin_lock(&sched->job_list_lock);
>>>>> +	job = list_first_entry_or_null(&sched->pending_list,
>>>>> +				       struct drm_sched_job, list);
>>>>> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>>>> +		drm_sched_free_job_queue(sched);
>>>>> +	spin_unlock(&sched->job_list_lock);
>>>>>     }
>>>>>     /**
>>>>> @@ -310,7 +359,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>>>>     	dma_fence_get(&s_fence->finished);
>>>>>     	drm_sched_fence_finished(s_fence, result);
>>>>>     	dma_fence_put(&s_fence->finished);
>>>>> -	drm_sched_submit_queue(sched);
>>>>> +	drm_sched_free_job_queue(sched);
>>>>>     }
>>>>>     /**
>>>>> @@ -906,18 +955,19 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>>>>     void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>>>>     {
>>>>>     	if (drm_sched_can_queue(sched))
>>>>> -		drm_sched_submit_queue(sched);
>>>>> +		drm_sched_run_job_queue(sched);
>>>>>     }
>>>>>     /**
>>>>>      * drm_sched_select_entity - Select next entity to process
>>>>>      *
>>>>>      * @sched: scheduler instance
>>>>> + * @dequeue: dequeue selected entity
>>>>>      *
>>>>>      * Returns the entity to process or NULL if none are found.
>>>>>      */
>>>>>     static struct drm_sched_entity *
>>>>> -drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>> +drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>>>>     {
>>>>>     	struct drm_sched_entity *entity;
>>>>>     	int i;
>>>>> @@ -935,8 +985,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>     	/* Kernel run queue has higher priority than normal run queue*/
>>>>>     	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>     		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>>>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>>>>> +			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
>>>>> +							dequeue) :
>>>>> +			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
>>>>> +						      dequeue);
>>>>>     		if (entity)
>>>>>     			break;
>>>>>     	}
>>>>> @@ -1024,30 +1076,44 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>     EXPORT_SYMBOL(drm_sched_pick_best);
>>>>>     /**
>>>>> - * drm_sched_main - main scheduler thread
>>>>> + * drm_sched_free_job_work - worker to call free_job
>>>>>      *
>>>>> - * @param: scheduler instance
>>>>> + * @w: free job work
>>>>>      */
>>>>> -static void drm_sched_main(struct work_struct *w)
>>>>> +static void drm_sched_free_job_work(struct work_struct *w)
>>>>>     {
>>>>>     	struct drm_gpu_scheduler *sched =
>>>>> -		container_of(w, struct drm_gpu_scheduler, work_submit);
>>>>> -	struct drm_sched_entity *entity;
>>>>> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
>>>>>     	struct drm_sched_job *cleanup_job;
>>>>> -	int r;
>>>>>     	if (READ_ONCE(sched->pause_submit))
>>>>>     		return;
>>>>>     	cleanup_job = drm_sched_get_cleanup_job(sched);
>>>>> -	entity = drm_sched_select_entity(sched);
>>>>> +	if (cleanup_job) {
>>>>> +		sched->ops->free_job(cleanup_job);
>>>>> +
>>>>> +		drm_sched_free_job_queue_if_ready(sched);
>>>>> +		drm_sched_run_job_queue_if_ready(sched);
>>>>> +	}
>>>>> +}
>>>>> -	if (!entity && !cleanup_job)
>>>>> -		return;	/* No more work */
>>>>> +/**
>>>>> + * drm_sched_run_job_work - worker to call run_job
>>>>> + *
>>>>> + * @w: run job work
>>>>> + */
>>>>> +static void drm_sched_run_job_work(struct work_struct *w)
>>>>> +{
>>>>> +	struct drm_gpu_scheduler *sched =
>>>>> +		container_of(w, struct drm_gpu_scheduler, work_run_job);
>>>>> +	struct drm_sched_entity *entity;
>>>>> +	int r;
>>>>> -	if (cleanup_job)
>>>>> -		sched->ops->free_job(cleanup_job);
>>>>> +	if (READ_ONCE(sched->pause_submit))
>>>>> +		return;
>>>>> +	entity = drm_sched_select_entity(sched, true);
>>>>>     	if (entity) {
>>>>>     		struct dma_fence *fence;
>>>>>     		struct drm_sched_fence *s_fence;
>>>>> @@ -1056,9 +1122,7 @@ static void drm_sched_main(struct work_struct *w)
>>>>>     		sched_job = drm_sched_entity_pop_job(entity);
>>>>>     		if (!sched_job) {
>>>>>     			complete_all(&entity->entity_idle);
>>>>> -			if (!cleanup_job)
>>>>> -				return;	/* No more work */
>>>>> -			goto again;
>>>>> +			return;	/* No more work */
>>>>>     		}
>>>>>     		s_fence = sched_job->s_fence;
>>>>> @@ -1088,10 +1152,8 @@ static void drm_sched_main(struct work_struct *w)
>>>>>     		}
>>>>>     		wake_up(&sched->job_scheduled);
>>>>> +		drm_sched_run_job_queue_if_ready(sched);
>>>>>     	}
>>>>> -
>>>>> -again:
>>>>> -	drm_sched_submit_queue(sched);
>>>>>     }
>>>>>     /**
>>>>> @@ -1150,7 +1212,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>>     	spin_lock_init(&sched->job_list_lock);
>>>>>     	atomic_set(&sched->hw_rq_count, 0);
>>>>>     	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>>>> -	INIT_WORK(&sched->work_submit, drm_sched_main);
>>>>> +	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>>>> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>>>>>     	atomic_set(&sched->_score, 0);
>>>>>     	atomic64_set(&sched->job_id_count, 0);
>>>>>     	sched->pause_submit = false;
>>>>> @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>>>>>     void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>>>>>     {
>>>>>     	WRITE_ONCE(sched->pause_submit, true);
>>>>> -	cancel_work_sync(&sched->work_submit);
>>>>> +	cancel_work_sync(&sched->work_run_job);
>>>>> +	cancel_work_sync(&sched->work_free_job);
>>>>>     }
>>>>>     EXPORT_SYMBOL(drm_sched_submit_stop);
>>>>> @@ -1287,6 +1351,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
>>>>>     void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
>>>>>     {
>>>>>     	WRITE_ONCE(sched->pause_submit, false);
>>>>> -	queue_work(sched->submit_wq, &sched->work_submit);
>>>>> +	queue_work(sched->submit_wq, &sched->work_run_job);
>>>>> +	queue_work(sched->submit_wq, &sched->work_free_job);
>>>>>     }
>>>>>     EXPORT_SYMBOL(drm_sched_submit_start);
>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>> index 04eec2d7635f..fbc083a92757 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -487,9 +487,10 @@ struct drm_sched_backend_ops {
>>>>>      *                 finished.
>>>>>      * @hw_rq_count: the number of jobs currently in the hardware queue.
>>>>>      * @job_id_count: used to assign unique id to the each job.
>>>>> - * @submit_wq: workqueue used to queue @work_submit
>>>>> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>>>>>      * @timeout_wq: workqueue used to queue @work_tdr
>>>>> - * @work_submit: schedules jobs and cleans up entities
>>>>> + * @work_run_job: schedules jobs
>>>>> + * @work_free_job: cleans up jobs
>>>>>      * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>>>>>      *            timeout interval is over.
>>>>>      * @pending_list: the list of jobs which are currently in the job queue.
>>>>> @@ -518,7 +519,8 @@ struct drm_gpu_scheduler {
>>>>>     	atomic64_t			job_id_count;
>>>>>     	struct workqueue_struct		*submit_wq;
>>>>>     	struct workqueue_struct		*timeout_wq;
>>>>> -	struct work_struct		work_submit;
>>>>> +	struct work_struct		work_run_job;
>>>>> +	struct work_struct		work_free_job;
>>>>>     	struct delayed_work		work_tdr;
>>>>>     	struct list_head		pending_list;
>>>>>     	spinlock_t			job_list_lock;

