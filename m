Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF95A096E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C05D8D49;
	Thu, 25 Aug 2022 07:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAE0D8D29;
 Thu, 25 Aug 2022 07:03:39 +0000 (UTC)
Received: from DM5PR1201MB2474.namprd12.prod.outlook.com (2603:10b6:3:e3::8)
 by MWHPR12MB1629.namprd12.prod.outlook.com (2603:10b6:301:3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Thu, 25 Aug
 2022 04:29:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsmKP/gLTPDGdt8ufaSy+IOZqdxOJmeKt6kq8Yq+nXrUwnBOb+gNe57ZYVB0zOtAVvDw/2hNzerW7PECeAO+hjcIvN2jHV87S0w2azI1EETBEo47Ik5ILEvnAtNWRJIeowaxI1kiTyKyhaG+6+q9/QLGMjiGYCj0GWq7i1o/EkKgZmvo18QDqRRrGJ4bnDgIK4FsPSlvxWKHkV39re4lx2SUJqo8W7XzyLhbnGsaaVLIMjO7UyZnwok9DilEobuaQxZu3bCHc+/FmfBC6QuzESitSyvNXNi0pKXRAH6A3Q62I7tW9EZLjyHjtcX5QEZ2txs4AKjzy+tqj7LJQGHdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ3uyRJc2sW4fLDROsaOju93kEow71OC2zSpufltNBI=;
 b=GeN+24Z+ZRa32XDd1yLSFd+zeNhwYgSjstQp2qJxzHZ2W2aXei/2rlGgHTtCwbB6hgNGSSoVrBqWuuvTF4MGV1CwaBaZCqnUJt2tAnlrrEUrKsXC/nCnxx0T2aZQQoBKG1hTsVD231I/AydwPCpCW4cZbS7ls51lg24qRw8qqA9UeDfuC5oyBODZOxJ/hanIsmuINm/5EGPn7Ylq/6TfU9OeJFf9fn8BGJ4Rk6pSrKz6nsMzpKLqCS9tDHUonIeCEQKzEMQrlcYW4RGdLaGXYFoW0gkVkQKBYcgOJopwSOPNsEvCpVVAbWxopTXWq1r53czBiV45o7m/M+EfCRs8kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ3uyRJc2sW4fLDROsaOju93kEow71OC2zSpufltNBI=;
 b=UuFnbaf2rM4WgBr0m0yj9o8IsCreOdeoEdcOoz3ddvgVbVX07iWMR0XEERJ/x3F4WaxiHifcIhL3OkXGlmkhc5+SQO8OaMXU3doaoK/61opfYOje5+MoZDldXYHh+Avp03bvF3Ftgg4zEieP9WunkWROZN4lXT0AVL/A9T5lM6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR1201MB2474.namprd12.prod.outlook.com (2603:10b6:3:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Wed, 24 Aug
 2022 16:21:05 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 16:21:05 +0000
Content-Type: multipart/mixed; boundary="------------yZMPHS9EUfmM8XwZ0g0XejVu"
Message-ID: <3adcc1ce-434b-3e2e-8748-697addcb7aa3@amd.com>
Date: Wed, 24 Aug 2022 12:21:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
 <d5c45e7a-257b-7c60-33b5-7c103b0b1f93@amd.com>
 <bf0791b0-c917-6b6e-75bf-0c16869aa045@amd.com>
 <1eadb06c-7d2c-0317-a34a-c219c68b93c3@amd.com>
 <54bbcee9-68c7-5b4d-1050-7f098c96a805@amd.com>
 <65722ac9-e76b-8473-e1d5-3209c2d59a89@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <65722ac9-e76b-8473-e1d5-3209c2d59a89@amd.com>
X-ClientProxiedBy: BL1PR13CA0335.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::10) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 086c59fe-7db3-403f-684d-08da85eca4b4
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2474:EE_|MWHPR12MB1629:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1b6N2/XIevAi7cqAL7fHL9nc/UUgrqkQ4vhB0yQnTBUxsqTQb/ZgYu3/3k0AmVoNI63Pm02/VEntQUWwI3dLYDuVrcQE2NdiLbdKVjctYCFpxil3080lhznoV7EgJsv0DZh17J/5/PtZBLfnIVTqxVtfLGBtnzVjqCZAQkYlJPO2IZKBmuUy/zl4v6xQkx9FZ7Icf8HrMCi1hOW1+NPtlPD0Uelnhhsg1P2NVPQ8RUVwNKqD8RYK2xB6uz/y8N1jaycSIlLQOat1Nw4MH7flRsmABd2Mov/TY4zjEg/UJPQXpddwe9UFB4c2xPOKfpZME3wT4u5J53sOiQVF9nAHdUJDaplU488tQRHnY5QpXexqcbjNUPoUTQHLQQ0Caua8NwD4139IEx1uIhrz1j8o0jMfdk4vAP8X4TNmTBsv8aQy4iP/GN/hYDOj0YGc46kG8QT99VPNHdDE6QIpmkVNdN+00o8VBWO/EYYHPxYa40bmXAqi0yIaeT79BQ4lDTNzQd0hyhtjf99uEuUAt/vHU/AwLhz7LxzEHHun5lmJTMZNmaRepkNn+TaGWYmW5D0m6DkgNEkNDNs16zoF4BVdcdq2rmfzNKUKnBmkFgPKgaKbJVeyiBpMTX2e+Dp0QOy3kN2wVBjeEvoOXV0LH2iSrwgu4N4JIYbvf/42rYWID1rt36YIDfmkJzWcLxBFdUyT88Fmppgh9tCgPHqQwFs7Mq7ZCsX5pJ7UhRADLE/3zlC7IbM88k18tpuP3AfA/L2C/n02ZN27gYxL3rUhRxyNJtEdO9Gkb9mmMuKqVz75wc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(186003)(2616005)(38100700002)(83380400001)(36756003)(8676002)(4326008)(66476007)(66556008)(316002)(66946007)(30864003)(86362001)(2906002)(6512007)(5660300002)(235185007)(31696002)(26005)(44832011)(8936002)(6506007)(33964004)(53546011)(478600001)(41300700001)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU9TcmFoUC9VU3NxdlpZNDlsNkVTRVRpdU94OU5IMi9wTGJaVFpGcEVsUVRS?=
 =?utf-8?B?Z2JUU2pYbzJvT2FiMXpWWlNySWtQVzk0dk9lMjl1VUlxV1pWaUV4OFVzeFd5?=
 =?utf-8?B?TkE3NWRqemZDWktxMmRwZS9wWnZmQ0ptSzNoc2N1SVU1L0dDWTh6OFhuNG9v?=
 =?utf-8?B?Nm1BYUh3SlVRclAzUmVSTGNUcnJkOERFV3Rya0M1ZmdySGhGblBXT1Q1M243?=
 =?utf-8?B?Z0oralBsR2FGakVOOWpDNWtSVmZHUVN5RzlEOFV2SHIxcGc3UTBHVklZQzdJ?=
 =?utf-8?B?STU5QWFUNlNac09lbzVlOU01M0VuWEI5N3RReFBhTmlkODVLenU2U1FnUUFM?=
 =?utf-8?B?UVcvN1ZUSU4xWUdzTWNsSzNTY0FIRFdkdkRHQm5WZzU4OE53c3dhcE51VWRs?=
 =?utf-8?B?NWE4M09DbkdZT0pGUWVDdEtDaHp3bDZPajZKanplaGJJN0ZuN2tBZTYvUjN5?=
 =?utf-8?B?NUlNNXgzYy8vcTM3bUs4bEhBMmJqVC9MSC9icGY2ZFgrUVEvcWJwOGg0ZDJx?=
 =?utf-8?B?VzRGZDZXTzZFRTd6VDROMGNZT1RjN3BJbm5CazY0VUN6VVYvUVlyNW5ZQUF5?=
 =?utf-8?B?S2VoQy81OFdSKzg2b3MvOUhoVEhUanZtQ3NmZzcwUWljemF3clFDNHRoZGFp?=
 =?utf-8?B?d1dsNXhwdVQ1QlNUaHpkM2U0SVNFM00vTGZIYjV1b1pFWmkyVW9lTysyQ2tM?=
 =?utf-8?B?ai95RnllTFhvMHlvVlN6cFFsSUV3U0VQR0YzcHpmU29INUVvVVp5blJEcnZ4?=
 =?utf-8?B?QWx1R2o4ekNRV0poSjFxdEQxOTBWWEJUUk1IT2ZCL2h1bUg2TGZLaGhqUHcz?=
 =?utf-8?B?aTVhd3dpdWFDWkl5ZEQ1aGQzbE11WjEvM1RGYVNXZ2NlWFAveG5aOEFmaXlT?=
 =?utf-8?B?eGxMcFhsQ0JxSGRoemJTZUZyTml5NVZaSWlvYjZ6dTVWdi83eDZKdUppa3Z1?=
 =?utf-8?B?a0FvNzUrL3FJekhxNzFQLy9wK0RQekhiWGtaOGRDVlNjcUpKMVp0ZktPZmdm?=
 =?utf-8?B?SjJPSWxqaEQvYWtBc3J5c1NyclRzYmMvTXhSc1Vaa3RLem5wNkUrd2tZZ1hv?=
 =?utf-8?B?SUlNdEp2aE00Vjg2T0FQRVcxN1Npc3RhWjFvMk9hTHVnOWN1aC8yZG9pSy93?=
 =?utf-8?B?T1k2TEtTNjJCc2VMK0g3V2p1dFluOVMvMks5a05UOU4xRzFCaHNOenhGRFhT?=
 =?utf-8?B?dEU5NDBmVlM0NGtuMUZHQ0ZTZXcwZ0ZZL1lxSURrS294Z2RxMkNyUGdMRTll?=
 =?utf-8?B?UkpMRGlyVTlaOEM5cmdyZVlreTBBQ1NxanpseTZ3bVJqbER1ejJGb1ErR0hY?=
 =?utf-8?B?QzVxTUt0MFp4eFk4a3J3amtUUE52TXQ3Nnk0U3phZ2NwNnZZYXlydloxS2kw?=
 =?utf-8?B?SEVEamRWc0tsS1g1MXRjdlAzc0kycVZSckhMRFE2b1ltd2FiMmV5bFVaV0Zw?=
 =?utf-8?B?bU1DM05ualExUmtkdUhCcy9zY3VHSEhFYWo2aWNEcStEcmFRbEpYNi9KanB3?=
 =?utf-8?B?NkJOaERCZDc4WTNPSmw3Tm9CNCtNOTB6ZkJMTVNyWlpVdWtzczdJNmV1U3VK?=
 =?utf-8?B?Q053TVlMelRRZk1XWUJlb0dpcGNuK0tJZEJ2SEZoRWFtancwMENJY1AwemFK?=
 =?utf-8?B?QU1pRHYwMGpUdXVDVGJLUHBUK2s0WjVlMG1WVk9iZHVsUWpWMis0SXVxS1I4?=
 =?utf-8?B?bGRnbHNQMGk0dFI5cmVnWGRsK2pKZ1FqSzc1TlNJTG9sWk84VFJLVFZhV1Z4?=
 =?utf-8?B?OEVuLzBFemJzQ1dzczgwYWhhMkVBQnlUS2xpWTkwclJpVXJpS0kyZDI4MEtY?=
 =?utf-8?B?VWs4NmRQaUhzQ3Eza2NkQjNRdklCdno0RWpuT3J3U0lUT2tRbFBuc1VUVzFo?=
 =?utf-8?B?bHZITjM3cWFydE9YNE9Qb1FHMytyZjREMXAzb01BdWdHblYzekVmeGFRMlZW?=
 =?utf-8?B?bXhmQnVyLzg1aVJ0VU9nY21xUDZLQUpFQ3dNMVNYTlBSRUxHMnRHVVBEQlFG?=
 =?utf-8?B?bFphc3NOcEdMemNqc3N2dnpHMVh3ZXFqbkp0L0o0a2FyQmplSkpEaGVuelg3?=
 =?utf-8?B?TXpxZ2pWcThqQjk3WWNFcTZaVVJ5alc5QW0zNWp6K0NaaWh2ZzN0SUwxWmJ4?=
 =?utf-8?Q?x7aWH7d+iIlndiTTmd35tlnI3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 086c59fe-7db3-403f-684d-08da85eca4b4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 16:21:04.9971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4UW/pPsBV0RuuwUiQDJmNADh2qUzyQgmV38GLlJZVYj8GEdWxRBLiUJuVu/dBoxmpBtCenVmwduqYyZVmuCKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2474
X-OriginatorOrg: amd.com
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
Cc: ckoenig.leichtzumerken@gmail.com, Li Yunxiang <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------yZMPHS9EUfmM8XwZ0g0XejVu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022-08-23 17:37, Luben Tuikov wrote:
>
> On 2022-08-23 14:57, Andrey Grodzovsky wrote:
>> On 2022-08-23 14:30, Luben Tuikov wrote:
>>
>>> On 2022-08-23 14:13, Andrey Grodzovsky wrote:
>>>> On 2022-08-23 12:58, Luben Tuikov wrote:
>>>>> Inlined:
>>>>>
>>>>> On 2022-08-22 16:09, Andrey Grodzovsky wrote:
>>>>>> Poblem: Given many entities competing for same rq on
>>>>> ^Problem
>>>>>
>>>>>> same scheduler an uncceptabliy long wait time for some
>>>>> ^unacceptably
>>>>>
>>>>>> jobs waiting stuck in rq before being picked up are
>>>>>> observed (seen using  GPUVis).
>>>>>> The issue is due to Round Robin policy used by scheduler
>>>>>> to pick up the next entity for execution. Under stress
>>>>>> of many entities and long job queus within entity some
>>>>> ^queues
>>>>>
>>>>>> jobs could be stack for very long time in it's entity's
>>>>>> queue before being popped from the queue and executed
>>>>>> while for other entites with samller job queues a job
>>>>> ^entities; smaller
>>>>>
>>>>>> might execute ealier even though that job arrived later
>>>>> ^earlier
>>>>>
>>>>>> then the job in the long queue.
>>>>>>
>>>>>> Fix:
>>>>>> Add FIFO selection policy to entites in RQ, chose next enitity
>>>>>> on rq in such order that if job on one entity arrived
>>>>>> ealrier then job on another entity the first job will start
>>>>>> executing ealier regardless of the length of the entity's job
>>>>>> queue.
>>>>>>
>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>>>>>>     drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>>>>>>     include/drm/gpu_scheduler.h              |  8 +++
>>>>>>     3 files changed, 71 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> index 6b25b2f4f5a3..3bb7f69306ef 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>>>     	atomic_inc(entity->rq->sched->score);
>>>>>>     	WRITE_ONCE(entity->last_user, current->group_leader);
>>>>>>     	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>>>>> +	sched_job->submit_ts = ktime_get();
>>>>>> +
>>>>>>     
>>>>>>     	/* first job wakes up scheduler */
>>>>>>     	if (first) {
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index 68317d3a7a27..c123aa120d06 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -59,6 +59,19 @@
>>>>>>     #define CREATE_TRACE_POINTS
>>>>>>     #include "gpu_scheduler_trace.h"
>>>>>>     
>>>>>> +
>>>>>> +
>>>>>> +int drm_sched_policy = -1;
>>>>>> +
>>>>>> +/**
>>>>>> + * DOC: sched_policy (int)
>>>>>> + * Used to override default entites scheduling policy in a run queue.
>>>>>> + */
>>>>>> +MODULE_PARM_DESC(sched_policy,
>>>>>> +		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");
>>>>>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>>> As per Christian's comments, you can drop the "auto" and perhaps leave one as the default,
>>>>> say the RR.
>>>>>
>>>>> I do think it is beneficial to have a module parameter control the scheduling policy, as shown above.
>>>> Christian is not against it, just against adding 'auto' here - like the
>>>> default.
>>> Exactly what I said.
>>>
>>> Also, I still think an O(1) scheduling (picking next to run) should be
>>> what we strive for in such a FIFO patch implementation.
>>> A FIFO mechanism is by it's nature an O(1) mechanism for picking the next
>>> element.
>>>
>>> Regards,
>>> Luben
>>
>> The only solution i see for this now is keeping a global per rq jobs
>> list parallel to SPCP queue per entity - we use this list when we switch
>> to FIFO scheduling, we can even start building  it ONLY when we switch
>> to FIFO building it gradually as more jobs come. Do you have other solution
>> in mind ?
> The idea is to "sort" on insertion, not on picking the next one to run.
>
> cont'd below:
>
>> Andrey
>>
>>>>>> +
>>>>>> +
>>>>>>     #define to_drm_sched_job(sched_job)		\
>>>>>>     		container_of((sched_job), struct drm_sched_job, queue_node)
>>>>>>     
>>>>>> @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>>     }
>>>>>>     
>>>>>>     /**
>>>>>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>>>>>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>>>      *
>>>>>>      * @rq: scheduler run queue to check.
>>>>>>      *
>>>>>> - * Try to find a ready entity, returns NULL if none found.
>>>>>> + * Try to find a ready entity, in round robin manner.
>>>>>> + *
>>>>>> + * Returns NULL if none found.
>>>>>>      */
>>>>>>     static struct drm_sched_entity *
>>>>>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>     {
>>>>>>     	struct drm_sched_entity *entity;
>>>>>>     
>>>>>> @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>>>     	return NULL;
>>>>>>     }
>>>>>>     
>>>>>> +/**
>>>>>> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
>>>>>> + *
>>>>>> + * @rq: scheduler run queue to check.
>>>>>> + *
>>>>>> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
>>>>>> + *
>>>>>> + * Returns NULL if none found.
>>>>>> + */
>>>>>> +static struct drm_sched_entity *
>>>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>> +{
>>>>>> +	struct drm_sched_entity *tmp, *entity = NULL;
>>>>>> +	ktime_t oldest_ts = KTIME_MAX;
>>>>>> +	struct drm_sched_job *sched_job;
>>>>>> +
>>>>>> +	spin_lock(&rq->lock);
>>>>>> +
>>>>>> +	list_for_each_entry(tmp, &rq->entities, list) {
>>>>>> +
>>>>>> +		if (drm_sched_entity_is_ready(tmp)) {
>>>>>> +			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
>>>>>> +
>>>>>> +			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
>>>>>> +				oldest_ts = sched_job->submit_ts;
>>>>>> +				entity = tmp;
>>>>>> +			}
>>>>>> +		}
>>>>>> +	}
>>>>> Here I think we need an O(1) lookup of the next job to pick out to run.
>>>>> I see a number of optimizations, for instance keeping the current/oldest
>>>>> timestamp in the rq struct itself,
>>>> This was my original design with rb tree based min heap per rq based on
>>>> time stamp of
>>>> the oldest job waiting in each entity's job queue (head of entity's SPCP
>>>> job queue). But how in this
>>>> case you record the timestamps of all the jobs waiting in entity's the
>>>> SPCP queue behind the head job ?
>>>> If you record only the oldest job and more jobs come you have no place
>>>> to store their timestamps and so
>>>> on next job select after current HEAD how you will know who came before
>>>> or after between 2 job queues of
>>>> of 2 entities ?
>>>>
>>>>
>>>>> or better yet keeping the next job
>>>>> to pick out to run at a head of list (a la timer wheel implementation).
>>>>> For suck an optimization to work, you'd prep things up on job insertion, rather
>>>>> than on job removal/pick to run.
>>>> I looked at timer wheel and I don't see how this applies here - it
>>>> assumes you know before
>>>> job submission your deadline time for job's execution to start - which
>>>> we don't so I don't see
>>>> how we can use it. This seems more suitable for real time scheduler
>>>> implementation where you
>>>> have a hard requirement to execute a job by some specific time T.
> In a timer wheel you instantly know the "soonest" job to run--it's naturally
> your "next" job, regardless of in what order the timers were added and what
> their timeout time is.
>
>>>> I also mentioned a list, obviously there is the brute force solution of
>>>> just ordering all jobs in one giant list and get
>>>> naturally a FIFO ordering this way with O(1) insertions and extractions
>>>> but I assume we don't want one giant jobs queue
>>>> for all the entities to avoid more dependeies between them (like locking
>>>> the entire list when one specific entity is killed and
>>>> needs to remove it's jobs from SW queue).
> You can also have a list of list pointers. It'd be trivial to remove a whole
> list from the main list, by simply removing an element--akin to locking out a rq,
> or should you need to edit the rq's entity list.


So you do mean some kind of FIFO list. I really would want to avoid 
maintaining an
extra data structure, we already have jobs stored in entity SPSC queue, 
and now we will have to add
to a job struct  a pointer to another,  rq wide FIFO list, seems to me 
like a recipe for problems.


Thinking more about it, if I do let each job have it's original 
submission timestamp stored I can go back to my original design
of storing sched entities themself in min heap structure based on 
timestamp of the next job to run in the entity
(head of job list), this way we get O(1) extraction of next job to run 
and it will still be FIFO. The cost will be O(log(# entites in rq))
for updating the min heap on each job extraction based on next head 
timestamp. Still better then linear. On the downside we need to maintain 
an rb tree structure
to store the entitles in parallel to holding them in linear list for 
round robin as it's tpday. I am attaching my original patch to give sense of
it with TODO section were I added this new code. There are actually some 
corner cases with empty SPCP queue becoming full and sampling not the 
head of the
queue but the next one is what we need but i think it's solvable.

In general it seems to me that before doing more complicated design we 
actually need to measure and see if there is really a substantial 
performance hit compared to current RR
or even  compared to possible O(1) extraction solution. No point to 
complicate design if we don't get significant performance improvement 
from it.


>
>>>>> I'm also surprised that there is no job transition from one queue to another,
>>>>> as it is picked to run next--for the above optimizations to implemented, you'd
>>>>> want a state transition from (state) queue to queue.
>>>> Not sure what you have in mind here ? How this helps ?
> I think I've explained this a few times now--each list represents a state and a job/entity
> travels through lists as it travels through states, which states more or less represent
> the state of execution in the hardware--it could be as simple as incoming --> pending --> done.
>
> It allows a finer grain when resetting the hardware (should the hardware allow it).
>
> Note that this isn't directly related to the O(1) mechanism I brought up here. As I said, I was surprised
> to find out none such distinction existed--that's all. Don't fixate on this.
>
> Regards,
> Luben


Right, so this one is a separate  topic regarding the pending job list 
refactoring which we need to discuss and fix separately - i have TODO to 
come back
to your patches from a year ago or so which were addressing this. 
Probably will try to get to this after finishing this work.

Andrey


>
>>>> Andrey
>>>>
>>>>
>>>>> Regards,
>>>>> Luben
>>>>>
>>>> In my origianl design
>>>>
>>>>>> +
>>>>>> +	if (entity) {
>>>>>> +		rq->current_entity = entity;
>>>>>> +		reinit_completion(&entity->entity_idle);
>>>>>> +	}
>>>>>> +
>>>>>> +	spin_unlock(&rq->lock);
>>>>>> +	return entity;
>>>>>> +}
>>>>>> +
>>>>>>     /**
>>>>>>      * drm_sched_job_done - complete a job
>>>>>>      * @s_job: pointer to the job which is done
>>>>>> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>>     
>>>>>>     	/* Kernel run queue has higher priority than normal run queue*/
>>>>>>     	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>>>>>> +		entity = drm_sched_policy != 1 ?
>>>>>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>>>>>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>>>>> +
>>>>>>     		if (entity)
>>>>>>     			break;
>>>>>>     	}
>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>> index addb135eeea6..95865881bfcf 100644
>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>> @@ -314,6 +314,14 @@ struct drm_sched_job {
>>>>>>     
>>>>>>     	/** @last_dependency: tracks @dependencies as they signal */
>>>>>>     	unsigned long			last_dependency;
>>>>>> +
>>>>>> +       /**
>>>>>> +	* @submit_ts:
>>>>>> +	*
>>>>>> +	* Marks job submit time
>>>>>> +	*/
>>>>>> +       ktime_t				submit_ts;
>>>>>> +
>>>>>>     };
>>>>>>     
>>>>>>     static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>>> Regards,
> Regards,
--------------yZMPHS9EUfmM8XwZ0g0XejVu
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-sced-Add-FIFO-sched-policy-to-rq-v7.patch"
Content-Disposition: attachment;
 filename="0001-drm-sced-Add-FIFO-sched-policy-to-rq-v7.patch"
Content-Transfer-Encoding: base64

RnJvbSBjN2ZhZDc5YjE3OTBlNWE0ZjQzZTk1YzM5MGViZjRlNjM4NjYyZmU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lA
YW1kLmNvbT4KRGF0ZTogRnJpLCAyOSBKdWwgMjAyMiAxMjoyNjo1MCAtMDQwMApTdWJqZWN0OiBk
cm0vc2NlZDogQWRkIEZJRk8gc2NoZWQgcG9saWN5IHRvIHJxIHY3CgpBbHNvIGFkZCBlbmJsZW1l
bnQgZmxhZy4KCkFkZCBvcmRlcmluZyBiYXNlZCBvbiBUUwoKU2lnbmVkLW9mZi1ieTogQW5kcmV5
IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyB8ICAgNiArKwogZHJpdmVycy9ncHUvZHJtL3Nj
aGVkdWxlci9zY2hlZF9tYWluLmMgICB8IDEwOSArKysrKysrKysrKysrKysrKysrKysrLQogaW5j
bHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oICAgICAgICAgICAgICB8ICAzOCArKysrKysrKwogMyBm
aWxlcyBjaGFuZ2VkLCAxNTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwppbmRleCAxOTFjNTYwNjRmMTkuLjZlYjQ5
NWRlYzA5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRp
dHkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCkBAIC0z
Myw2ICszMyw4IEBACiAjZGVmaW5lIHRvX2RybV9zY2hlZF9qb2Ioc2NoZWRfam9iKQkJXAogCQlj
b250YWluZXJfb2YoKHNjaGVkX2pvYiksIHN0cnVjdCBkcm1fc2NoZWRfam9iLCBxdWV1ZV9ub2Rl
KQogCitleHRlcm4gaW50IGRybV9zY2hlZF9wb2xpY3k7CisKIC8qKgogICogZHJtX3NjaGVkX2Vu
dGl0eV9pbml0IC0gSW5pdCBhIGNvbnRleHQgZW50aXR5IHVzZWQgYnkgc2NoZWR1bGVyIHdoZW4K
ICAqIHN1Ym1pdCB0byBIVyByaW5nLgpAQCAtNzMsNiArNzUsNyBAQCBpbnQgZHJtX3NjaGVkX2Vu
dGl0eV9pbml0KHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHksCiAJZW50aXR5LT5wcmlv
cml0eSA9IHByaW9yaXR5OwogCWVudGl0eS0+c2NoZWRfbGlzdCA9IG51bV9zY2hlZF9saXN0ID4g
MSA/IHNjaGVkX2xpc3QgOiBOVUxMOwogCWVudGl0eS0+bGFzdF9zY2hlZHVsZWQgPSBOVUxMOwor
CVJCX0NMRUFSX05PREUoJmVudGl0eS0+cmJfdHJlZV9ub2RlKTsKIAogCWlmKG51bV9zY2hlZF9s
aXN0KQogCQllbnRpdHktPnJxID0gJnNjaGVkX2xpc3RbMF0tPnNjaGVkX3JxW2VudGl0eS0+cHJp
b3JpdHldOwpAQCAtNDQzLDYgKzQ0Niw3IEBAIHN0cnVjdCBkcm1fc2NoZWRfam9iICpkcm1fc2No
ZWRfZW50aXR5X3BvcF9qb2Ioc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkKIAlzbXBf
d21iKCk7CiAKIAlzcHNjX3F1ZXVlX3BvcCgmZW50aXR5LT5qb2JfcXVldWUpOworCiAJcmV0dXJu
IHNjaGVkX2pvYjsKIH0KIApAQCAtNTA3LDYgKzUxMSw3IEBAIHZvaWQgZHJtX3NjaGVkX2VudGl0
eV9wdXNoX2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQogCWF0b21pY19pbmMo
ZW50aXR5LT5ycS0+c2NoZWQtPnNjb3JlKTsKIAlXUklURV9PTkNFKGVudGl0eS0+bGFzdF91c2Vy
LCBjdXJyZW50LT5ncm91cF9sZWFkZXIpOwogCWZpcnN0ID0gc3BzY19xdWV1ZV9wdXNoKCZlbnRp
dHktPmpvYl9xdWV1ZSwgJnNjaGVkX2pvYi0+cXVldWVfbm9kZSk7CisJc2NoZWRfam9iLT5zdWJt
aXRfdHMgPSBrdGltZV9nZXQoKTsKIAogCS8qIGZpcnN0IGpvYiB3YWtlcyB1cCBzY2hlZHVsZXIg
Ki8KIAlpZiAoZmlyc3QpIHsKQEAgLTUxOCw2ICs1MjMsNyBAQCB2b2lkIGRybV9zY2hlZF9lbnRp
dHlfcHVzaF9qb2Ioc3RydWN0IGRybV9zY2hlZF9qb2IgKnNjaGVkX2pvYikKIAkJCURSTV9FUlJP
UigiVHJ5aW5nIHRvIHB1c2ggdG8gYSBraWxsZWQgZW50aXR5XG4iKTsKIAkJCXJldHVybjsKIAkJ
fQorCiAJCWRybV9zY2hlZF9ycV9hZGRfZW50aXR5KGVudGl0eS0+cnEsIGVudGl0eSk7CiAJCXNw
aW5fdW5sb2NrKCZlbnRpdHktPnJxX2xvY2spOwogCQlkcm1fc2NoZWRfd2FrZXVwKGVudGl0eS0+
cnEtPnNjaGVkKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKaW5kZXggYzU0
MzdlZTAzZTNmLi41MzBmN2YzZTJhZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jCkBAIC02Miw2ICs2Miw0MiBAQAogI2RlZmluZSB0b19kcm1fc2NoZWRfam9iKHNjaGVk
X2pvYikJCVwKIAkJY29udGFpbmVyX29mKChzY2hlZF9qb2IpLCBzdHJ1Y3QgZHJtX3NjaGVkX2pv
YiwgcXVldWVfbm9kZSkKIAoraW50IGRybV9zY2hlZF9wb2xpY3kgPSAxOworCisvKioKKyAqIERP
Qzogc2NoZWRfcG9saWN5IChpbnQpCisgKiBVc2VkIHRvIG92ZXJyaWRlIGRlZmF1bHQgZW50aXRl
cyBzY2hlZHVsaW5nIHBvbGljeSBpbiBhIHJ1biBxdWV1ZS4KKyAqLworTU9EVUxFX1BBUk1fREVT
QyhzY2hlZF9wb2xpY3ksCisJInNwZWNpZnkgc2NoZWR1bGUgcG9saWN5IGZvciBlbnRpdGVzIG9u
IGEgcnVucXVldWUgKC0xID0gYXV0byhkZWZhdWx0KSB2YWx1ZSwgMCA9IFJvdW5kIFJvYmluLDEg
ID0gdXNlIEZJRk8iKTsKK21vZHVsZV9wYXJhbV9uYW1lZChzY2hlZF9wb2xpY3ksIGRybV9zY2hl
ZF9wb2xpY3ksIGludCwgMDQ0NCk7CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBkcm1fc2NoZWRfcnFf
dXBkYXRlX2ZpZm9fbG9ja2VkKHN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxLAorCQkJICAgICAgc3Ry
dWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSwKKwkJCSAgICAgIGJvb2wgcmVtb3ZlX29ubHkp
Cit7CisJaWYgKCFSQl9FTVBUWV9OT0RFKCZlbnRpdHktPnJiX3RyZWVfbm9kZSkpIHsKKwkJcmJf
ZXJhc2VfY2FjaGVkKCZlbnRpdHktPnJiX3RyZWVfbm9kZSwgJnJxLT5yYl90cmVlX3Jvb3QpOwor
CQlSQl9DTEVBUl9OT0RFKCZlbnRpdHktPnJiX3RyZWVfbm9kZSk7CisJfQorCisJaWYgKHJlbW92
ZV9vbmx5KQorCQlyZXR1cm47CisKKwkvKgorCSAqIFRPRE8gLSBJbiBjYXNlIHRoZXJlIGlzIG5l
eHQgam9iIHBlbmRpbmcgdG8gcnVuIHVzZSBpdCdzIFRTIHRvIHVwZGF0ZQorCSAqIHRoZSBlbnRp
dHkgbG9jYXRpb24gaW4gbWluIGhlYXAuIE90aGVyd2lzZSBqdXN0IHRob3cgaXQgdG8gdGhlICdi
YWNrIG9mCisJICogdGhlIGxpbmUnCisJICovCisJaWYgKGRybV9zY2hlZF9lbnRpdHlfaXNfcmVh
ZHkoZW50aXR5KSkKKwkJZW50aXR5LT5vbGRlc3Rfam9iX3dhaXRpbmcgPSB0b19kcm1fc2NoZWRf
am9iKHNwc2NfcXVldWVfcGVlaygmdG1wLT5qb2JfcXVldWUpKTsKKwllbHNlCisJCWVudGl0eS0+
b2xkZXN0X2pvYl93YWl0aW5nID0ga3RpbWVfZ2V0KCk7CisKKwlyYl9hZGRfY2FjaGVkKCZlbnRp
dHktPnJiX3RyZWVfbm9kZSwgJnJxLT5yYl90cmVlX3Jvb3QsCisJCSAgICAgIGRybV9zY2hlZF9l
bnRpdHlfY29tcGFyZV9lYXJsaWVyKTsKK30KKwogLyoqCiAgKiBkcm1fc2NoZWRfcnFfaW5pdCAt
IGluaXRpYWxpemUgYSBnaXZlbiBydW4gcXVldWUgc3RydWN0CiAgKgpAQCAtNzUsNiArMTExLDcg
QEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX3JxX2luaXQoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVy
ICpzY2hlZCwKIHsKIAlzcGluX2xvY2tfaW5pdCgmcnEtPmxvY2spOwogCUlOSVRfTElTVF9IRUFE
KCZycS0+ZW50aXRpZXMpOworCXJxLT5yYl90cmVlX3Jvb3QgPSBSQl9ST09UX0NBQ0hFRDsKIAly
cS0+Y3VycmVudF9lbnRpdHkgPSBOVUxMOwogCXJxLT5zY2hlZCA9IHNjaGVkOwogfQpAQCAtOTIs
OSArMTI5LDE1IEBAIHZvaWQgZHJtX3NjaGVkX3JxX2FkZF9lbnRpdHkoc3RydWN0IGRybV9zY2hl
ZF9ycSAqcnEsCiB7CiAJaWYgKCFsaXN0X2VtcHR5KCZlbnRpdHktPmxpc3QpKQogCQlyZXR1cm47
CisKIAlzcGluX2xvY2soJnJxLT5sb2NrKTsKKwogCWF0b21pY19pbmMocnEtPnNjaGVkLT5zY29y
ZSk7CiAJbGlzdF9hZGRfdGFpbCgmZW50aXR5LT5saXN0LCAmcnEtPmVudGl0aWVzKTsKKworCWlm
IChkcm1fc2NoZWRfcG9saWN5ID09IDEpCisJCWRybV9zY2hlZF9ycV91cGRhdGVfZmlmb19sb2Nr
ZWQoZW50aXR5LT5ycSwgZW50aXR5LCBmYWxzZSk7CisKIAlzcGluX3VubG9jaygmcnEtPmxvY2sp
OwogfQogCkBAIC0xMTEsMjMgKzE1NCwzMiBAQCB2b2lkIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50
aXR5KHN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxLAogewogCWlmIChsaXN0X2VtcHR5KCZlbnRpdHkt
Pmxpc3QpKQogCQlyZXR1cm47CisKIAlzcGluX2xvY2soJnJxLT5sb2NrKTsKKworCiAJYXRvbWlj
X2RlYyhycS0+c2NoZWQtPnNjb3JlKTsKIAlsaXN0X2RlbF9pbml0KCZlbnRpdHktPmxpc3QpOwor
CiAJaWYgKHJxLT5jdXJyZW50X2VudGl0eSA9PSBlbnRpdHkpCiAJCXJxLT5jdXJyZW50X2VudGl0
eSA9IE5VTEw7CisKKwlpZiAoZHJtX3NjaGVkX3BvbGljeSA9PSAxKQorCQlkcm1fc2NoZWRfcnFf
dXBkYXRlX2ZpZm9fbG9ja2VkKGVudGl0eS0+cnEsIGVudGl0eSwgdHJ1ZSk7CisKIAlzcGluX3Vu
bG9jaygmcnEtPmxvY2spOwogfQogCisKIC8qKgotICogZHJtX3NjaGVkX3JxX3NlbGVjdF9lbnRp
dHkgLSBTZWxlY3QgYW4gZW50aXR5IHdoaWNoIGNvdWxkIHByb3ZpZGUgYSBqb2IgdG8gcnVuCisg
KiBkcm1fc2NoZWRfcnFfc2VsZWN0X2VudGl0eV9yciAtIFNlbGVjdCBhbiBlbnRpdHkgd2hpY2gg
Y291bGQgcHJvdmlkZSBhIGpvYiB0byBydW4KICAqCiAgKiBAcnE6IHNjaGVkdWxlciBydW4gcXVl
dWUgdG8gY2hlY2suCiAgKgogICogVHJ5IHRvIGZpbmQgYSByZWFkeSBlbnRpdHksIHJldHVybnMg
TlVMTCBpZiBub25lIGZvdW5kLgogICovCiBzdGF0aWMgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkg
KgotZHJtX3NjaGVkX3JxX3NlbGVjdF9lbnRpdHkoc3RydWN0IGRybV9zY2hlZF9ycSAqcnEpCitk
cm1fc2NoZWRfcnFfc2VsZWN0X2VudGl0eV9ycihzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycSkKIHsK
IAlzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5OwogCkBAIC0xNjMsNiArMjE1LDU0IEBA
IGRybV9zY2hlZF9ycV9zZWxlY3RfZW50aXR5KHN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxKQogCXJl
dHVybiBOVUxMOwogfQogCisKKy8qKgorICogZHJtX3NjaGVkX3JxX3NlbGVjdF9lbnRpdHlfZmlm
byAtIFNlbGVjdCBhbiBlbnRpdHkgd2hpY2ggY291bGQgcHJvdmlkZSBhIGpvYiB0byBydW4KKyAq
CisgKiBAcnE6IHNjaGVkdWxlciBydW4gcXVldWUgdG8gY2hlY2suCisgKgorICogVHJ5IHRvIGZp
bmQgYSByZWFkeSBlbnRpdHksIHJldHVybnMgTlVMTCBpZiBub25lIGZvdW5kLgorICovCitzdGF0
aWMgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKgorZHJtX3NjaGVkX3JxX3NlbGVjdF9lbnRpdHlf
ZmlmbyhzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycSkKK3sKKwkJc3RydWN0IGRybV9zY2hlZF9lbnRp
dHkgKmZpcnN0LCAqZW50aXR5ID0gTlVMTDsKKwkJc3RydWN0IHJiX25vZGUgKnJiOworCQlzcGlu
X2xvY2soJnJxLT5sb2NrKTsKKworCQlyYiA9IHJiX2ZpcnN0X2NhY2hlZCgmcnEtPnJiX3RyZWVf
cm9vdCk7CisJCWlmICghcmIpCisJCQlnb3RvIG91dDsKKworCQlmaXJzdCA9IHJiX2VudHJ5KChy
YiksIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5LCByYl90cmVlX25vZGUpOworCQllbnRpdHkgPSBm
aXJzdDsKKworCQl3aGlsZSh0cnVlKXsKKworCQkJLyogVXBkYXRlIGVudGl0eSdzIFRTIGZvciB0
aGUgRklGTyBhbmQgdXBkYXRlIHRoZSBGSUZPIGFjY29yZGluZ2x5ICovCisJCQlkcm1fc2NoZWRf
cnFfdXBkYXRlX2ZpZm9fbG9ja2VkKGVudGl0eS0+cnEsIGVudGl0eSwgZmFsc2UpOworCisJCQlp
ZiAoZHJtX3NjaGVkX2VudGl0eV9pc19yZWFkeShlbnRpdHkpKSB7CisJCQkJcnEtPmN1cnJlbnRf
ZW50aXR5ID0gZW50aXR5OworCQkJCXJlaW5pdF9jb21wbGV0aW9uKCZlbnRpdHktPmVudGl0eV9p
ZGxlKTsKKwkJCQlicmVhazsKKwkJCX0KKworCQkJcmIgPSByYl9maXJzdF9jYWNoZWQoJnJxLT5y
Yl90cmVlX3Jvb3QpOworCQkJZW50aXR5ID0gIHJiX2VudHJ5KChyYiksIHN0cnVjdCBkcm1fc2No
ZWRfZW50aXR5LCByYl90cmVlX25vZGUpOworCisJCQkvKiBXZSBjb21wbGV0ZWQgZnVsbCBjeWNs
ZSAqLworCQkJaWYgKCFkcm1fc2NoZWRfZW50aXR5X2lzX3JlYWR5KGVudGl0eSkgJiYgZW50aXR5
ID09IGZpcnN0KSB7CisJCQkJZW50aXR5ID0gTlVMTDsKKwkJCQlicmVhazsKKwkJCX0KKwkJfQor
CisJb3V0OgorCQlzcGluX3VubG9jaygmcnEtPmxvY2spOworCQlyZXR1cm4gZW50aXR5OworfQor
CiAvKioKICAqIGRybV9zY2hlZF9qb2JfZG9uZSAtIGNvbXBsZXRlIGEgam9iCiAgKiBAc19qb2I6
IHBvaW50ZXIgdG8gdGhlIGpvYiB3aGljaCBpcyBkb25lCkBAIC01OTIsNiArNjkyLDcgQEAgaW50
IGRybV9zY2hlZF9qb2JfaW5pdChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iLAogCQkgICAgICAg
c3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSwKIAkJICAgICAgIHZvaWQgKm93bmVyKQog
eworCiAJZHJtX3NjaGVkX2VudGl0eV9zZWxlY3RfcnEoZW50aXR5KTsKIAlpZiAoIWVudGl0eS0+
cnEpCiAJCXJldHVybiAtRU5PRU5UOwpAQCAtODAxLDcgKzkwMiw5IEBAIGRybV9zY2hlZF9zZWxl
Y3RfZW50aXR5KHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCiAKIAkvKiBLZXJuZWwg
cnVuIHF1ZXVlIGhhcyBoaWdoZXIgcHJpb3JpdHkgdGhhbiBub3JtYWwgcnVuIHF1ZXVlKi8KIAlm
b3IgKGkgPSBEUk1fU0NIRURfUFJJT1JJVFlfQ09VTlQgLSAxOyBpID49IERSTV9TQ0hFRF9QUklP
UklUWV9NSU47IGktLSkgewotCQllbnRpdHkgPSBkcm1fc2NoZWRfcnFfc2VsZWN0X2VudGl0eSgm
c2NoZWQtPnNjaGVkX3JxW2ldKTsKKwkJZW50aXR5ID0gZHJtX3NjaGVkX3BvbGljeSAhPSAxID8K
KwkJCQlkcm1fc2NoZWRfcnFfc2VsZWN0X2VudGl0eV9ycigmc2NoZWQtPnNjaGVkX3JxW2ldKSA6
CisJCQkJZHJtX3NjaGVkX3JxX3NlbGVjdF9lbnRpdHlfZmlmbygmc2NoZWQtPnNjaGVkX3JxW2ld
KTsKIAkJaWYgKGVudGl0eSkKIAkJCWJyZWFrOwogCX0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2dwdV9zY2hlZHVsZXIuaCBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaAppbmRleCA5NDRm
ODNlZjlmMmUuLjFjODQxYTI0YjVjMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZ3B1X3NjaGVk
dWxlci5oCisrKyBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaApAQCAtMTk2LDYgKzE5Niwy
MSBAQCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSB7CiAJICogZHJtX3NjaGVkX2VudGl0eV9maW5p
KCkuCiAJICovCiAJc3RydWN0IGNvbXBsZXRpb24JCWVudGl0eV9pZGxlOworCisJLyoqCisJICog
QG9sZGVzdF9qb2Jfd2FpdGluZzoKKwkgKgorCSAqIE1hcmtzIGVhcmxpZXN0IGpvYiB3YWl0aW5n
IGluIFNXIHF1ZXVlCisJICovCisJa3RpbWVfdCAJCQlvbGRlc3Rfam9iX3dhaXRpbmc7CisKKwkv
KioKKwkgKiBAcmJfdHJlZV9ub2RlOgorCSAqCisJICogVG8gaW5zZXJ0IHRoaXMgZW50aXR5IGlu
dG8gdGltZSBiYXNlZCBwcmlvcml0eSBxdWV1ZQorCSAqLworCXN0cnVjdCByYl9ub2RlIAkJCXJi
X3RyZWVfbm9kZTsKKwogfTsKIAogLyoqCkBAIC0yMDUsNiArMjIwLDcgQEAgc3RydWN0IGRybV9z
Y2hlZF9lbnRpdHkgewogICogQHNjaGVkOiB0aGUgc2NoZWR1bGVyIHRvIHdoaWNoIHRoaXMgcnEg
YmVsb25ncyB0by4KICAqIEBlbnRpdGllczogbGlzdCBvZiB0aGUgZW50aXRpZXMgdG8gYmUgc2No
ZWR1bGVkLgogICogQGN1cnJlbnRfZW50aXR5OiB0aGUgZW50aXR5IHdoaWNoIGlzIHRvIGJlIHNj
aGVkdWxlZC4KKyAqIEByYl90cmVlX3Jvb3Q6IHJvb3Qgb2YgdGltZSBiYXNlZCBwcmlvcnkgcXVl
dWUgb2YgZW50aXRlcyBmb3IgRklGTyBzY2hlZHVsaW5nCiAgKgogICogUnVuIHF1ZXVlIGlzIGEg
c2V0IG9mIGVudGl0aWVzIHNjaGVkdWxpbmcgY29tbWFuZCBzdWJtaXNzaW9ucyBmb3IKICAqIG9u
ZSBzcGVjaWZpYyByaW5nLiBJdCBpbXBsZW1lbnRzIHRoZSBzY2hlZHVsaW5nIHBvbGljeSB0aGF0
IHNlbGVjdHMKQEAgLTIxNSw2ICsyMzEsNyBAQCBzdHJ1Y3QgZHJtX3NjaGVkX3JxIHsKIAlzdHJ1
Y3QgZHJtX2dwdV9zY2hlZHVsZXIJKnNjaGVkOwogCXN0cnVjdCBsaXN0X2hlYWQJCWVudGl0aWVz
OwogCXN0cnVjdCBkcm1fc2NoZWRfZW50aXR5CQkqY3VycmVudF9lbnRpdHk7CisJc3RydWN0IHJi
X3Jvb3RfY2FjaGVkIAkJcmJfdHJlZV9yb290OwogfTsKIAogLyoqCkBAIC0yNTgsNiArMjc1LDE0
IEBAIHN0cnVjdCBkcm1fc2NoZWRfZmVuY2UgewogICAgICAgICAgKiBAb3duZXI6IGpvYiBvd25l
ciBmb3IgZGVidWdnaW5nCiAgICAgICAgICAqLwogCXZvaWQJCQkJKm93bmVyOworCisJLyoqCisJ
KiBAc3VibWl0X3RzOgorCSoKKwkqIE1hcmtzIGpvYiBzdWJtaXQgdGltZQorCSovCisJa3RpbWVf
dCAgICAgICAgICAgICAgICAgICAgICAgICBzdWJtaXRfdHM7CisKIH07CiAKIHN0cnVjdCBkcm1f
c2NoZWRfZmVuY2UgKnRvX2RybV9zY2hlZF9mZW5jZShzdHJ1Y3QgZG1hX2ZlbmNlICpmKTsKQEAg
LTUwMSw2ICs1MjYsMTkgQEAgdm9pZCBkcm1fc2NoZWRfcnFfYWRkX2VudGl0eShzdHJ1Y3QgZHJt
X3NjaGVkX3JxICpycSwKIHZvaWQgZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkoc3RydWN0IGRy
bV9zY2hlZF9ycSAqcnEsCiAJCQkJc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSk7CiAK
K3ZvaWQgZHJtX3NjaGVkX3JxX3VwZGF0ZV9maWZvKHN0cnVjdCBkcm1fc2NoZWRfcnEgKnJxLAor
CQkJICAgICAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSwKKwkJCSAgICAgIGJvb2wg
cmVtb3ZlX29ubHkpOworCitzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgZHJtX3NjaGVkX2Vu
dGl0eV9jb21wYXJlX2VhcmxpZXIoc3RydWN0IHJiX25vZGUgKmEsCisJCQkJCQkJICAgICBjb25z
dCBzdHJ1Y3QgcmJfbm9kZSAqYikKK3sKKwlzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50X2Eg
PSAgcmJfZW50cnkoKGEpLCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSwgcmJfdHJlZV9ub2RlKTsK
KwlzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50X2IgPSAgcmJfZW50cnkoKGIpLCBzdHJ1Y3Qg
ZHJtX3NjaGVkX2VudGl0eSwgcmJfdHJlZV9ub2RlKTsKKworCXJldHVybiBrdGltZV9iZWZvcmUo
ZW50X2EtPm9sZGVzdF9qb2Jfd2FpdGluZywgZW50X2ItPm9sZGVzdF9qb2Jfd2FpdGluZyk7Cit9
CisKIGludCBkcm1fc2NoZWRfZW50aXR5X2luaXQoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVu
dGl0eSwKIAkJCSAgZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgcHJpb3JpdHksCiAJCQkgIHN0cnVj
dCBkcm1fZ3B1X3NjaGVkdWxlciAqKnNjaGVkX2xpc3QsCi0tIAoyLjI1LjEKCg==

--------------yZMPHS9EUfmM8XwZ0g0XejVu--
