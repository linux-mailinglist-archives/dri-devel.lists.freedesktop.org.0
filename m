Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B37729B1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 17:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C2510E1F1;
	Mon,  7 Aug 2023 15:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6611510E1EE;
 Mon,  7 Aug 2023 15:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIGCpE6QSFAj2BHk8jrOwSjZH2eq2NwgYTrTRm3ochFsyiWwe1Im2IyJZeasMRhCMhJA4QpvY2TprPmW7sksuhBfHIqGfJLuOBa/v6QArDFIEZntK+WpIUtI5rvJ+/js8SoGSR4S90ys+sjljLpoQglpGVLuXVXJ2h2V6XO1SpdlTUfxgRrjQ6QpcfTBxYftSjzwMtQDke7blYFZP/C0mcNgpMdd0FU2obtdAYKsUeBL72QptFWoZdh+Oo/v6C/W7Qoj3ULarZHAHbKVkRU8EXq8Tmed6I6iFITUQtzOf9ufVfnl+IZ3QkA1IL0/kDGVvgcMUArLU2oQvPffwMm0mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EegIVydY588PdDVI9gaaUitOn7IixRi6pNwkuC1FC6Q=;
 b=FZGMpKQq/G5ORZduHpuGRgLLTg326bsajcEidiM4fGrkAqHfq0D3XNbO6ifuO9iuRL+Y5Q/PQ1NAZwneTvxy42E1Q99ZH+OoGwyK93aFbZAFVhqL8IwEhAgQ9RW6Ec7GYq0azBSgT0CBED/u3IYiajmCoX6I1KwCUifXH2pfnCexYJiZUk/7I8QYaL8YNJNx5ALF+DFFthyuP1HNMdXpKDaxfGSaXxZX5cjliGr+w9SrixI7UjG6YAnFrco5x97UU30NBgGk9EKMjqHFectfWC6P553XCgD4re603xLPrN4hnZVquz+IrtVoYOs/OHe2byGerr2HF/97y5ZmQ/D9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EegIVydY588PdDVI9gaaUitOn7IixRi6pNwkuC1FC6Q=;
 b=bP3BunkWU1yYQQGrU++UhFGftOTo4w9qImJHTcj8cr9GIKzvACUW8yW7Hp5f2IkH+kBzzbXSeYHBiGnJlNDhTObLlHX6oR/AtrRCLPqpioz5iJpUZUoSxQBLEUmalbJtTBIaMp/WtzNRnSqlfDD0Xg00/8IfrPFkP5LeLtl21FI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5092.namprd12.prod.outlook.com (2603:10b6:610:bf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 15:46:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 15:46:19 +0000
Message-ID: <b19bb89c-a814-2519-e037-ee1c33dce02f@amd.com>
Date: Mon, 7 Aug 2023 17:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] drm/sched: Add generic scheduler message interface
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-5-matthew.brost@intel.com>
 <efabdbaf-4f38-ae62-3d4e-da5660558886@amd.com>
 <CAKMK7uEdyV+Swtk50KqYUeCr5sOAceT_asB69_Ynz=Nx_z+HkQ@mail.gmail.com>
 <88b40106-e24f-e286-c3a3-363a6b2462ee@amd.com>
 <ZMy73BrH55NGq6Ba@phenom.ffwll.local>
 <ZM0HfRR8CczTLpao@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZM0HfRR8CczTLpao@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2441eb-623c-4ac3-c32e-08db975d7198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8temfhztPgtiU7ft6oiLL3GkhT0xrLPMNlrC0I//JvAkNVsdzxrOoMz9mH06abzrpcaSifemf505o0GNvOiAr7eoCrvwJyFqCEDlhFgNtsMfZXCLfEKjhoiJNPM2+tAiUBNqRD4TuR5Y61dLwtBnnHwgGUP790MsVSTw789t8GqYsQ+atRR3CE8GW4EvdgM4lse34/K3cEWorZR/qR6EJbvx9wwVZbZCMeJaqu0WIQG9jYkFmwVQ/zUFDVApMcyqrGZs9hM8f+B1I4uwmd5GXfnQU88stJ/tzsiT8g0mMdE4ziPdVmtsc9RD4smC1B0DJ2GVgIKTBlu8pr/5L3YQcppC0ai07orH/esbX2xKiF+5xVdnYUeZW6rFjyZ8OQUmLn3tUKCT30HyFY4z/qdgQxOHrktkJHu+nh7rECcI1VXuxRSVFKI8gNiJKDERheGVIQNBj68sJ+vDpyGjEtkgBcj3L1PxMSdknWSFM9U1yi9wxsinSmScyjp5FGcOATx38EiwWG+kIRfxkRnI9pG/WEwnYawRBnKBpA1zqbEOF20QZ5WGHU7+wMBsvF5Zf9VaLLhJBsJDi+EdcEkKMY++Qt0sZl3WYpPX7urmUHswqZNI/sg6ljcNJWIWOrlCOKmtwLynUmSld+H9SxAepuk8PycbffT1Q97pd1qrStwDT/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(186006)(1800799003)(2616005)(36756003)(966005)(6512007)(4326008)(316002)(86362001)(478600001)(110136005)(38100700002)(6666004)(66946007)(6486002)(66556008)(66476007)(31696002)(6506007)(41300700001)(15650500001)(8676002)(8936002)(2906002)(30864003)(83380400001)(7416002)(5660300002)(31686004)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDFLT1VDVUNSUFQzQzVDTkNOV04zNlNXQnpKemFEUmt3UThPRG42cy92Rm1G?=
 =?utf-8?B?NkN2czBLU3NOeUJiLzg1cU1RYTVKMXdOSEhLQlZ0MEthcWhoakRWN29raDhP?=
 =?utf-8?B?MnY4N0hrbjZsWk45a1ozaWVWdW85RWpOS2tvVU43d0lHWXNEQXNmSWNKRHd1?=
 =?utf-8?B?dEYybW5temltTGFKUXlXOUxKdHIwbFVQeTMzLzZwZmtKQWdVdVNFTmFabEtR?=
 =?utf-8?B?c2gwTXJ1OTNpUFRobURGNkhCcjBCZTY4OWVuVnJ6c3hObW9SZ21WalBzd25p?=
 =?utf-8?B?dVRjOUdhbUM3eXJ1dnpDRGJxYzVBQzZLOUx2K1BMRGx6ZEdxSlgyc3hOUE9T?=
 =?utf-8?B?YmtmWHNsaEFudmw2K0ZSTUwzUW0rQjdTZmxBbzJFcE9oQUlKN3A1ME9scDVV?=
 =?utf-8?B?SzdTSEpDUUlsVkRaWHVHb0ljRi9LbG9LcVFRZ1M1SktOWlJoMW5qbC9uVzFl?=
 =?utf-8?B?d3VMVHg3OXJBcTlNTFMwTEdLQUVZRUx0bldBZEduZHN3dTBZaG5IUllSWXlq?=
 =?utf-8?B?Nm44QTduMCsvMThIekhXclVuTC9LbzdVcDFvUTYzNXFUTlM0d0NEUmdvNUVD?=
 =?utf-8?B?a1NKZXVyVTkxZitweDlaUjFiY3d3cFlZQlFQNDRXK2FhbmV2azMrcHdyZk1S?=
 =?utf-8?B?Q2E4Qk8rK0dRa2xqMTZlL05hNnpoQURUTXFyZWJWK2Nld3pJMXd6bDRoVDl1?=
 =?utf-8?B?eTM3c0lXSnl3TE9zUjd1eHdVQWkrSFJLVUExTEhBU0EzSmo4RmlOalBrK2Fq?=
 =?utf-8?B?allsQ0xkSldhU2F5N3Z6azdNMDdZTVR5UHNSY3RsNDdJbEN3MG5pZ256TkdC?=
 =?utf-8?B?UHlua0xaeFFJZ1dlRGxZbnVrMlJpdHJnZkh4ZWZ0a1NLeStuZVNHZUt0Q21I?=
 =?utf-8?B?T3VOeWpJeEh2andpS09QUE5yNFNIMlJiUVlHSWdLUGEvcFVUZHZLTFBqZ25S?=
 =?utf-8?B?eDVuZGdkZTY4aTZ3VGFpdkFvOUtEQjB5U1VUVnV5aEd4enVpRHppMUVPeExF?=
 =?utf-8?B?WEtta2Yva3ZYdEFpcS9aZElLWlZkUEMvUjVoODR2OEllVjJxZTdRY0Vsbll0?=
 =?utf-8?B?MkVHcmdwenJFVTVLYlkyaWN5alJkMGhaSDJhMmtVZjBQU3dYU3pwakhWQ29y?=
 =?utf-8?B?T1dzNWR6eE1hSTNlVmJaWTFqYzc0dE1FS2tPTy9YRy9QaEhHTk1nWnd2V0hL?=
 =?utf-8?B?VDFheUdqWGszVkdnVXlSWkIyeGxmVlBEQkc0THR1SDg4UXhCcVljQ3BrZlYv?=
 =?utf-8?B?c2o2VUIwYWhFQmpVTlFqSzQxLzkzNTNTbDloTDZyVHRqRUxTMUgzRzd3SGkw?=
 =?utf-8?B?T0swOFlFVlBMRWVLWVQ2NHM4K0puck4wcnJKUnU3N1FuTVhhRzdYMXhib1hT?=
 =?utf-8?B?UGkrZ0ZHRVdhMEZCeWQyUGpickczMFcyaE51Rnl6OVlkUmtUQ0tUaXcxYmwr?=
 =?utf-8?B?c3RFVngrNGxqckRBUld2U2haNC9jeVBqaXRhaFBFOUxsenU2aTFUcDVEejB0?=
 =?utf-8?B?c3dlN2VGQ3orYk56VXdBZXpUbFRxQWljYkhZWk1UNlhWcUQrSU5EalpTTUpY?=
 =?utf-8?B?NEcxSEJzeXBnRERGUSsvQ1JVQzc3ejVtcWRjYUlTREd3dVhPMysrZ1FhWXdu?=
 =?utf-8?B?aTlVWUVGSnFzWGJhTVhuc2h0KzBUSTNoRTVOZTZ4cEE4Yk1ZLzhRTlQrWTdY?=
 =?utf-8?B?cUZ2c25zTXVMQTl2RWVoSC9BUnJWYUlKOVo2TS82WmJHTGZ4bzRFUUR2NG81?=
 =?utf-8?B?ZW9xbWtPNWdiWTIvTGdxdDRzNHV4WS9qZGtHR1ZGRXMrRVJ0WXdLUy9tM1FE?=
 =?utf-8?B?U01yRTBUdDNLZ3lTZiszK1ByQnNtNmdKQ2t5OG0wNDZLOTJOK1V3T2pQSTFu?=
 =?utf-8?B?MjRVZzk0bVN6R1BSRFJsVlhBVkxFT200L3dMcEFNM0xuMlBPc08zLzBXbFpo?=
 =?utf-8?B?cWxiYzRqVDljQ3M3Z2FoTFlUTFk5bDErMEhQQkVMWFQ5UzZlbFhCZG1Qa24w?=
 =?utf-8?B?VjUvRUtqZlIreEtNUWNvNHR6VXFMT2dwTVFQQSswWmVYOHczUVVDN3ExV3g2?=
 =?utf-8?B?bVVUQ3FPelV1NUd2QUI0bE9ZbW1taFVsUStVUldxUVk0ZkhtSEhWMmtuajds?=
 =?utf-8?B?aGY4aTJ5S3VhODBGQS9qVVhUZ0pRa2p4Q3BRMHVTbGtNNVlOSGRjSGJ5MGwr?=
 =?utf-8?Q?/5vdx9gp8zZG5jTr40MSNoOlmIeoVEsF77d5b0kTY+Sk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2441eb-623c-4ac3-c32e-08db975d7198
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:46:19.8401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rarwMQbXL8RYzFsBii0LM/6/ShfHixXhORAhXpoWVdfooTBzGMeailqCVSQEFEAf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5092
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

Am 04.08.23 um 16:13 schrieb Matthew Brost:
> [SNIP]
> Christian / Daniel - I've read both of you comments and having a hard
> time parsing them. I do not really understand the issue with this patch
> or exactly what is being suggested instead. Let's try to work through
> this.
>
>>>>> I'm still extremely frowned on this.
>>>>>
>>>>> If you need this functionality then let the drivers decide which
>>>>> runqueue the scheduler should use.
> What do you mean by runqueue here? Do you mean 'struct
> workqueue_struct'? The scheduler in this context is 'struct
> drm_gpu_scheduler', right?

Sorry for the confusing wording, your understanding is correct.

> Yes, we have added this functionality iin the first patch.
>
>>>>> When you then create a single threaded runqueue you can just submit work
>>>>> to it and serialize this with the scheduler work.
>>>>>
> We don't want to use a single threaded workqueue_struct in Xe, we want
> to use a system_wq as run_job() can be executed in parallel across
> multiple entites (or drm_gpu_scheduler as in Xe we have 1 to 1
> relationship between entity and scheduler). What we want is on per
> entity / scheduler granularity to be able to communicate into the
> backend a message synchronously (run_job / free_job not executing,
> scheduler execution not paused for a reset).
>
> If I'm underatanding what you suggesting in Xe we'd create an ordered
> workqueue_struct per drm_gpu_scheduler and the queue messages on the
> ordered workqueue_struct?

Yes, correct.

> This seems pretty messy to me as now we have
> open coded a solution bypassing the scheduler, every drm_gpu_scheduler
> creates its own workqueue_struct, and we'd also have to open code the
> pausing of these messages for resets too.
>
> IMO this is pretty clean solution that follows the pattern of cleanup
> jobs already in place.

Yeah, exactly that's the point. Moving the job cleanup into the 
scheduler thread is seen as very very bad idea by me.

And I really don't want to exercise that again for different use cases.

>
>>>>> This way we wouldn't duplicate this core kernel function inside the
>>>>> scheduler.
>>>> Yeah that's essentially the design we picked for the tdr workers,
>>>> where some drivers have requirements that all tdr work must be done on
>>>> the same thread (because of cross-engine coordination issues). But
>>>> that would require that we rework the scheduler as a pile of
>>>> self-submitting work items, and I'm not sure that actually fits all
>>>> that well into the core workqueue interfaces either.
> This is the ordering between TDRs firing between different
> drm_gpu_scheduler and larger external resets (GT in Xe) an ordered
> workqueue_struct makes sense for this. Here we are talking about
> ordering jobs and messages within a single drm_gpu_scheduler. Using the
> main execution thread to do ordering makes sense in my opinion.

I completely disagree to that.

Take a look at how this came to be. This is a very very ugly hack and we 
already had a hard time making lockdep understand the different fence 
signaling dependencies with freeing the job and I'm pretty sure that is 
still not 100% correct.

>
>>> There were already patches floating around which did exactly that.
>>>
>>> Last time I checked those were actually looking pretty good.
>>>
> Link to patches for reference.
>
>>> Additional to message passing advantage the real big issue with the
>>> scheduler and 1 to 1 mapping is that we create a kernel thread for each
>>> instance, which results in tons on overhead.
> First patch in the series switches from kthread to work queue, that is
> still a good idea.

This was the patch I was referring to. Sorry didn't remembered that this 
was in the same patch set.

>
>>> Just using a work item which is submitted to a work queue completely avoids
>>> that.
>> Hm I should have read the entire series first, since that does the
>> conversion still. Apologies for the confusion, and yeah we should be able
>> to just submit other work to the same wq with the first patch? And so
>> hand-rolling this infra here isn't needed at all?
>>
> I wouldn't call this hand rolling, rather it following patten already in
> place.

Basically workqueues are the in kernel infrastructure for exactly that 
use case and we are trying to re-create that here and that is usually a 
rather bad idea.

Regards,
Christian.

>
> Matt
>
>> Or what am I missing?
>>
>>> Regards,
>>> Christian.
>>>
>>>> Worst case I think this isn't a dead-end and can be refactored to
>>>> internally use the workqueue services, with the new functions here
>>>> just being dumb wrappers until everyone is converted over. So it
>>>> doesn't look like an expensive mistake, if it turns out to be a
>>>> mistake.
>>>> -Daniel
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/scheduler/sched_main.c | 52 +++++++++++++++++++++++++-
>>>>>>     include/drm/gpu_scheduler.h            | 29 +++++++++++++-
>>>>>>     2 files changed, 78 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index 2597fb298733..84821a124ca2 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -1049,6 +1049,49 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>>     }
>>>>>>     EXPORT_SYMBOL(drm_sched_pick_best);
>>>>>>
>>>>>> +/**
>>>>>> + * drm_sched_add_msg - add scheduler message
>>>>>> + *
>>>>>> + * @sched: scheduler instance
>>>>>> + * @msg: message to be added
>>>>>> + *
>>>>>> + * Can and will pass an jobs waiting on dependencies or in a runnable queue.
>>>>>> + * Messages processing will stop if schedule run wq is stopped and resume when
>>>>>> + * run wq is started.
>>>>>> + */
>>>>>> +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
>>>>>> +                    struct drm_sched_msg *msg)
>>>>>> +{
>>>>>> +     spin_lock(&sched->job_list_lock);
>>>>>> +     list_add_tail(&msg->link, &sched->msgs);
>>>>>> +     spin_unlock(&sched->job_list_lock);
>>>>>> +
>>>>>> +     drm_sched_run_wq_queue(sched);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_sched_add_msg);
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_sched_get_msg - get scheduler message
>>>>>> + *
>>>>>> + * @sched: scheduler instance
>>>>>> + *
>>>>>> + * Returns NULL or message
>>>>>> + */
>>>>>> +static struct drm_sched_msg *
>>>>>> +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
>>>>>> +{
>>>>>> +     struct drm_sched_msg *msg;
>>>>>> +
>>>>>> +     spin_lock(&sched->job_list_lock);
>>>>>> +     msg = list_first_entry_or_null(&sched->msgs,
>>>>>> +                                    struct drm_sched_msg, link);
>>>>>> +     if (msg)
>>>>>> +             list_del(&msg->link);
>>>>>> +     spin_unlock(&sched->job_list_lock);
>>>>>> +
>>>>>> +     return msg;
>>>>>> +}
>>>>>> +
>>>>>>     /**
>>>>>>      * drm_sched_main - main scheduler thread
>>>>>>      *
>>>>>> @@ -1060,6 +1103,7 @@ static void drm_sched_main(struct work_struct *w)
>>>>>>                 container_of(w, struct drm_gpu_scheduler, work_run);
>>>>>>         struct drm_sched_entity *entity;
>>>>>>         struct drm_sched_job *cleanup_job;
>>>>>> +     struct drm_sched_msg *msg;
>>>>>>         int r;
>>>>>>
>>>>>>         if (READ_ONCE(sched->pause_run_wq))
>>>>>> @@ -1067,12 +1111,15 @@ static void drm_sched_main(struct work_struct *w)
>>>>>>
>>>>>>         cleanup_job = drm_sched_get_cleanup_job(sched);
>>>>>>         entity = drm_sched_select_entity(sched);
>>>>>> +     msg = drm_sched_get_msg(sched);
>>>>>>
>>>>>> -     if (!entity && !cleanup_job)
>>>>>> +     if (!entity && !cleanup_job && !msg)
>>>>>>                 return; /* No more work */
>>>>>>
>>>>>>         if (cleanup_job)
>>>>>>                 sched->ops->free_job(cleanup_job);
>>>>>> +     if (msg)
>>>>>> +             sched->ops->process_msg(msg);
>>>>>>
>>>>>>         if (entity) {
>>>>>>                 struct dma_fence *fence;
>>>>>> @@ -1082,7 +1129,7 @@ static void drm_sched_main(struct work_struct *w)
>>>>>>                 sched_job = drm_sched_entity_pop_job(entity);
>>>>>>                 if (!sched_job) {
>>>>>>                         complete_all(&entity->entity_idle);
>>>>>> -                     if (!cleanup_job)
>>>>>> +                     if (!cleanup_job && !msg)
>>>>>>                                 return; /* No more work */
>>>>>>                         goto again;
>>>>>>                 }
>>>>>> @@ -1177,6 +1224,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>>>
>>>>>>         init_waitqueue_head(&sched->job_scheduled);
>>>>>>         INIT_LIST_HEAD(&sched->pending_list);
>>>>>> +     INIT_LIST_HEAD(&sched->msgs);
>>>>>>         spin_lock_init(&sched->job_list_lock);
>>>>>>         atomic_set(&sched->hw_rq_count, 0);
>>>>>>         INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>> index df1993dd44ae..267bd060d178 100644
>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>> @@ -394,6 +394,23 @@ enum drm_gpu_sched_stat {
>>>>>>         DRM_GPU_SCHED_STAT_ENODEV,
>>>>>>     };
>>>>>>
>>>>>> +/**
>>>>>> + * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
>>>>>> + * message
>>>>>> + *
>>>>>> + * Generic enough for backend defined messages, backend can expand if needed.
>>>>>> + */
>>>>>> +struct drm_sched_msg {
>>>>>> +     /** @link: list link into the gpu scheduler list of messages */
>>>>>> +     struct list_head                link;
>>>>>> +     /**
>>>>>> +      * @private_data: opaque pointer to message private data (backend defined)
>>>>>> +      */
>>>>>> +     void                            *private_data;
>>>>>> +     /** @opcode: opcode of message (backend defined) */
>>>>>> +     unsigned int                    opcode;
>>>>>> +};
>>>>>> +
>>>>>>     /**
>>>>>>      * struct drm_sched_backend_ops - Define the backend operations
>>>>>>      *  called by the scheduler
>>>>>> @@ -471,6 +488,12 @@ struct drm_sched_backend_ops {
>>>>>>              * and it's time to clean it up.
>>>>>>          */
>>>>>>         void (*free_job)(struct drm_sched_job *sched_job);
>>>>>> +
>>>>>> +     /**
>>>>>> +      * @process_msg: Process a message. Allowed to block, it is this
>>>>>> +      * function's responsibility to free message if dynamically allocated.
>>>>>> +      */
>>>>>> +     void (*process_msg)(struct drm_sched_msg *msg);
>>>>>>     };
>>>>>>
>>>>>>     /**
>>>>>> @@ -482,6 +505,7 @@ struct drm_sched_backend_ops {
>>>>>>      * @timeout: the time after which a job is removed from the scheduler.
>>>>>>      * @name: name of the ring for which this scheduler is being used.
>>>>>>      * @sched_rq: priority wise array of run queues.
>>>>>> + * @msgs: list of messages to be processed in @work_run
>>>>>>      * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>>>>>>      *                 waits on this wait queue until all the scheduled jobs are
>>>>>>      *                 finished.
>>>>>> @@ -489,7 +513,7 @@ struct drm_sched_backend_ops {
>>>>>>      * @job_id_count: used to assign unique id to the each job.
>>>>>>      * @run_wq: workqueue used to queue @work_run
>>>>>>      * @timeout_wq: workqueue used to queue @work_tdr
>>>>>> - * @work_run: schedules jobs and cleans up entities
>>>>>> + * @work_run: schedules jobs, cleans up jobs, and processes messages
>>>>>>      * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>>>>>>      *            timeout interval is over.
>>>>>>      * @pending_list: the list of jobs which are currently in the job queue.
>>>>>> @@ -513,6 +537,7 @@ struct drm_gpu_scheduler {
>>>>>>         long                            timeout;
>>>>>>         const char                      *name;
>>>>>>         struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
>>>>>> +     struct list_head                msgs;
>>>>>>         wait_queue_head_t               job_scheduled;
>>>>>>         atomic_t                        hw_rq_count;
>>>>>>         atomic64_t                      job_id_count;
>>>>>> @@ -566,6 +591,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>>>>
>>>>>>     void drm_sched_job_cleanup(struct drm_sched_job *job);
>>>>>>     void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>>>>>> +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
>>>>>> +                    struct drm_sched_msg *msg);
>>>>>>     void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
>>>>>>     void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
>>>>>>     void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

