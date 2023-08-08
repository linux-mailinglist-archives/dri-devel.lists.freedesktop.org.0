Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23341773AA6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 16:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B1010E3B2;
	Tue,  8 Aug 2023 14:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4682410E1C3;
 Tue,  8 Aug 2023 14:15:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsaSmizBa3SgOpKwf72IrAjBLvYxPsiv5tSRzC5YEgEDViWhXdhpXqb/+TXWqVh4XBHnlvsVDucxCOvp7deRrgiqMWqlPvy4Nq+Q4MVhkRvKkA7NJJU8+z3nuPGDiSDg+LJK0y9h1Yc9HMjrXM8J9aMTY5gNLQJ5laDT7OUv8t+rHz0OGEZEaVYyiCYBgDjX2WYkwF/C6K9lKtlBPAajtQXHQ2UxkhyByAPUqVtcFuMCTmAEvUX1zxtaoFqPhNp8TtVYH3j2ZMJoOgsndfGBbTqt4+o8E99JD9FUmQRu2TctwufBfnmyhjrBHVR5pRwYcKWKM9dOoeO1Ouyei7GaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAHNCD5Lh0j9Cw4q6E+hKj615Mb3h1lgIcbPyeH6Va0=;
 b=Pi2EldllnFJs3zcMtCMqHybEF8axBNM84rPPbnU35bpNSD2e1Qp/Cb1jX9dugi9cvVyVJQ/AOiMeyZy8o9OnLsLF5r5Mt5SI8+8sNElMxQPYqx17u4YQvQKZola+KUZAzoSwE6/zxtnbHu7KLHTWqmT5DK3P08mpLzO/A61WfcUGO2+swjYhzZviDLNIsxhkPtaW9Ei9mPrgwgiSugb2reoZJp918dTPdUAxgT21vgIMkXSXFMBJ5selE5oMcakw1RQnQe8nadI/Ei+NEHV40u4KrYrD+mYTFjfpq7eETDU5P4ZEpIo6LSq79AeaL9zpk2ZtaaqdWwxgn3LHPJ7Suw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAHNCD5Lh0j9Cw4q6E+hKj615Mb3h1lgIcbPyeH6Va0=;
 b=WVSRZFYlgIJA3juwgdomtJ5Nsl+CdmTb7rT/nhuak7gsshkvUOULCpXzj8+/3ztN7dFGnO2nQVmx0vu+mNOh9ZNAxA9zQ5lGSh5hLY5LciS83KgIyvKsF7NSdd5tkbHt8cDOysyiiVgryAJwNKbm75rYB0MPYlYM1NCxtpSGkns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CYYPR12MB8872.namprd12.prod.outlook.com (2603:10b6:930:c8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 14:15:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 14:15:02 +0000
Message-ID: <90b19c2c-972b-28f4-2274-aa904f40084f@amd.com>
Date: Tue, 8 Aug 2023 16:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] drm/sched: Add generic scheduler message interface
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-5-matthew.brost@intel.com>
 <efabdbaf-4f38-ae62-3d4e-da5660558886@amd.com>
 <CAKMK7uEdyV+Swtk50KqYUeCr5sOAceT_asB69_Ynz=Nx_z+HkQ@mail.gmail.com>
 <88b40106-e24f-e286-c3a3-363a6b2462ee@amd.com>
 <ZMy73BrH55NGq6Ba@phenom.ffwll.local>
 <ZM0HfRR8CczTLpao@DUT025-TGLU.fm.intel.com>
 <b19bb89c-a814-2519-e037-ee1c33dce02f@amd.com>
 <ZNJL4Sgigy4JsprS@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZNJL4Sgigy4JsprS@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CYYPR12MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: cf1fcdc7-6d0c-435a-c8ef-08db9819db1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSfvW1Fjp/rPgD0/mLsEhfn97twCoaLnS5hMGzKPNVbniGiEvL1BzKVPz5WVPx92SQ8KEwU9eKRDNRAy/XkTobhL9uaKMF5bZAFdUARTrdCeMsZqBri6xPDY3Ac//AWf1+IjeM7OxMlPie+cC1QtiyMKo/zavGUCr9xrT0PJAIUkcknSzFyb0m4BMXCBBjOp30d8/X1wSneiWxDHZ/7nDu3aw+Ldp3fXbBgLcSiAH3342xfaTgXxMllsfRobkYUmfilThkV193bDREbeE6uFMHTKr4uSwutQDBaApVlLiT8UFUghIMGtHmoleTdIhuIYWHlen9WIq7SAN6w+YTrYZ+Nv1c9NKeS0RpqYp/OO36tyXTBRJIs2gFK3DPhB4iHSNe7ikj8R944u7YLvLfUzbSIXrf2GhScKi20KeqSQLlnEeeJcxMe2obiVzzcN2Wc4INSuDLAJuzbeLd+xy9eS7IqEf06ViasuNzqoOfIXTZkktMZtcjLbY7m4XSUcgSWvx/Qyw6bbpkgjxAOVtd29ompwgyP3pNgn48LsrFKAEOhROU5WuXRgmvO7uUmkyqynrrfW/l4DxWZJ4SKka4Fv5zyV3AMAsoWw8ODgfZ2Oc7z8ywRQT/dX78kSqcUgJi8MaKTV/9FmgchcPGbKVqsoKmolhq5F2FuAQXI9yMUgkNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(186006)(1800799003)(86362001)(31696002)(41300700001)(478600001)(6506007)(8676002)(8936002)(7416002)(38100700002)(6486002)(6666004)(2616005)(5660300002)(36756003)(2906002)(83380400001)(15650500001)(31686004)(316002)(966005)(66556008)(66476007)(6916009)(66946007)(4326008)(6512007)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmVrT285MlVCYjJqN0M0Uld3NDR4SjFPY0hwMkRYbitVL3hKTVhaZTk3OFZJ?=
 =?utf-8?B?d2FkeXdOLzNoc0hKS1A5dU1LTTB4TDlINlRYZHl1aE00VWxsTFIxR056Nmd1?=
 =?utf-8?B?b3ZGNEszb3Fra1ZpZFFGZ1NtOU9adE5kdXhReG13VlpUNGRtL0o4OEUzY3FC?=
 =?utf-8?B?bGFyOWsrYkwxdkVTRGUxUWpxS1lHb1lZZGdva1R0NkVvZmZ3alRzL2UzeXhx?=
 =?utf-8?B?Q2RZalZNSElDWGROZ2hMZHFTNVJpSmxJOFVzRTZxRHpPanRsdG4vRFpPLytt?=
 =?utf-8?B?Q2kxdG5rS3JIQkNyL1BvWjR6QmE3cERSUmQ5NDkzTE1jT1k4UUd0QThENFo4?=
 =?utf-8?B?MjhCQ3E1dENMa1FKZkluZmR3ejEyd1VTM1JqQUtMbldDQXR0OWhEOWxnbnFN?=
 =?utf-8?B?Q2JUL0FmWmhrK2lndWlTOTFGM0RtM0pZdzRXd3lFeXY4WW1xSHJ2ZU4xU2xF?=
 =?utf-8?B?QXBzMXQrTDRRUWlvWjFtMTE5MXQwV21iZVhqZWZxREh2Q05ITGVBelhBbDU1?=
 =?utf-8?B?T2daS01oQlYrWVh1Ykhudmh3b2gycnU1R29GTzErTkJaT1FoNk5lOEVXdWlL?=
 =?utf-8?B?VG41aDBIUGU0a0ozSm4wa1lmcXdnbWJEQ0N5RzB3UGpCd0EwZWUzL3NJa3Vu?=
 =?utf-8?B?clNLTVlNOENZTk9iM1puT21PMm0wUXFxR1RkZkJwOWdqVTB5cENEMUZLQ1g4?=
 =?utf-8?B?bUxxSHJ3bzhjZDFaZjJmZkN5cXdvM29GcGc5Umhxc2w2MXNMeG9XejNOWEF4?=
 =?utf-8?B?Zk5CQVZmQzlrb3BwalNHbGhobmhBcXpBWFhTMEtRN1d0V000NmZldFRrUVZW?=
 =?utf-8?B?YU5vMU9rb1l4bk1HU0NqNjFzOEFjTHZrdE5nS1k3ZjJiTVJUWE5OOGdwZGdG?=
 =?utf-8?B?RDEvZmRIQkRYclJHNkI5S051MzI1QjNQNE9wcThINVY4bTdmWnBjNktPQkM4?=
 =?utf-8?B?V1RuL1VoY1NZRGs5dG5wU3ExVXNJT2s5czBtM21Da2ZCUFpNNUNjT21SYkVr?=
 =?utf-8?B?U1ArYWx3N2ZYanZtNStPNnNrY1dlR29NWFhrbG9jU3RhSVVnVzdad29JeGV2?=
 =?utf-8?B?Q0ZCcjZ2ZithRW8zNWJtUk1aRG1BeG9JMFM2cjR2VGJhOGJnQ3VieDBYY1M5?=
 =?utf-8?B?RzNtWkRxM1RSVkZ4THVIVTJCdmZyQ1IrV0lOUVp3Sks1L0hqRUJyNGxsSkY1?=
 =?utf-8?B?TXM1L0U4eVZLamdHYTJYbjY0MVl1UVdaVXlsaXY5aFE2eURqa3FaNmJPd3Js?=
 =?utf-8?B?VU1PaHlETlBKUTBqa05VQy9mQTBhbkl1a0pWWlNtNnJIUUFSU08zWXRIRzJx?=
 =?utf-8?B?WC9pdm40NCtXL0l5NjA0N2NYMTVEb1pqN1dIa2s5RllNMlQxKzhtYVRLYW95?=
 =?utf-8?B?aFFqK0hBSHQyNksxY0JSOVMyL1hqZVYvZWRyeHJMNWNmODZCK0ZVRitlZXN4?=
 =?utf-8?B?UFA3MkJ3ZXBFblYwOXYyYVpOUllqVW8rOWxETTJEbFdmUWx1bVZBMSs4eVBt?=
 =?utf-8?B?czNJVTIzbWVlbVNXbTNkeDl2TTl6M2tBalZEb0xhcjhYcVp6NjVhSFVRL1kr?=
 =?utf-8?B?MTJkZDBSRmk2TVVlbGoxRW1ZdElJVldQQmt0cm93Z3VWdDlwRGp4K2lsMTh5?=
 =?utf-8?B?VDJzSFlibkxyN0kvK2R0TTF5WHEvdGNTc3VkYUMvcjNrNnZKbGxBU2ZpMTdB?=
 =?utf-8?B?YmVxNDdFVDhiRnNsYWJjZ3FwcWJjaGFpWHJuenlVVVlZajk4dEltTDgzRmEr?=
 =?utf-8?B?Q2JIcmhhRmJaeml4Z095UTJTN1lwWTVxYmxYeHMwbUVRcWpYM1NSQ2FaSWRL?=
 =?utf-8?B?eExvTFY4S05lVzlReWt3eGpZVk85aHZWeVVIOHBJN1FCU0tCL2J0cjVOakoz?=
 =?utf-8?B?bXc5a1JFRnFOelExRWJvM2NBRFZvcEs1eC9jay94UnphNmYrOG9jVzJWTTBr?=
 =?utf-8?B?c0pzVGI0N3RhWWNkc2J0dHl0ZWN3YzMrdGdkSlFtZmVLU3JEeVNZRE15ZlBh?=
 =?utf-8?B?Q09RWXU4SkxSNmJFWTFnQ21ndUtpQ2J4WWJMWWJyaTlTblhIZUpBakthVWQ1?=
 =?utf-8?B?UzRuWlpwSmVqWG85TzJkMGpjMy80Wjk1T3dMREtDS3Jtam5ZSDdPamZDWDFS?=
 =?utf-8?B?TEtwRmJhaE1TVDhwMHlXb2QvamVFS2ZKNjFUV0RJdFEvdEJ6dXZRK1pxc0hl?=
 =?utf-8?Q?Z2c6hD7tJg9WeX4gsvIRIDau6Vv3SHJIenzO+ZM6p6ei?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1fcdc7-6d0c-435a-c8ef-08db9819db1b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 14:15:02.2134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pkjj+KfEZxIpCthDhoOkzK15TNcknXmoJXyS+THmjnBwchJQgOY5fGUisiXA5oJD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8872
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

Am 08.08.23 um 16:06 schrieb Matthew Brost:
> [SNIP]
>> Basically workqueues are the in kernel infrastructure for exactly that use
>> case and we are trying to re-create that here and that is usually a rather
>> bad idea.
>>
> Ok let me play around with what this would look like in Xe, what you are
> suggesting would be ordered-wq per scheduler, work item for run job,
> work item for clean up job, and work item for a message. That might
> work I suppose? Only issue I see is scaling as this exposes an
> ordered-wq creation directly to an IOCTL. No idea if that is actually a
> concern though.

That's a very good question I can't answer of hand either.

But from the history of work queues I know that they were invented to 
reduce the overhead/costs of having many kernel threads.

So my educated guess is that you probably won't find anything better at 
the moment. If work queues then indeed don't match this use case then we 
need to figure out how to improve them or find a different solution.

Christian.

>
> Matt
>
>> Regards,
>> Christian.
>>
>>> Matt
>>>
>>>> Or what am I missing?
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Worst case I think this isn't a dead-end and can be refactored to
>>>>>> internally use the workqueue services, with the new functions here
>>>>>> just being dumb wrappers until everyone is converted over. So it
>>>>>> doesn't look like an expensive mistake, if it turns out to be a
>>>>>> mistake.
>>>>>> -Daniel
>>>>>>
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c | 52 +++++++++++++++++++++++++-
>>>>>>>>      include/drm/gpu_scheduler.h            | 29 +++++++++++++-
>>>>>>>>      2 files changed, 78 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> index 2597fb298733..84821a124ca2 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> @@ -1049,6 +1049,49 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>>>>>      }
>>>>>>>>      EXPORT_SYMBOL(drm_sched_pick_best);
>>>>>>>>
>>>>>>>> +/**
>>>>>>>> + * drm_sched_add_msg - add scheduler message
>>>>>>>> + *
>>>>>>>> + * @sched: scheduler instance
>>>>>>>> + * @msg: message to be added
>>>>>>>> + *
>>>>>>>> + * Can and will pass an jobs waiting on dependencies or in a runnable queue.
>>>>>>>> + * Messages processing will stop if schedule run wq is stopped and resume when
>>>>>>>> + * run wq is started.
>>>>>>>> + */
>>>>>>>> +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
>>>>>>>> +                    struct drm_sched_msg *msg)
>>>>>>>> +{
>>>>>>>> +     spin_lock(&sched->job_list_lock);
>>>>>>>> +     list_add_tail(&msg->link, &sched->msgs);
>>>>>>>> +     spin_unlock(&sched->job_list_lock);
>>>>>>>> +
>>>>>>>> +     drm_sched_run_wq_queue(sched);
>>>>>>>> +}
>>>>>>>> +EXPORT_SYMBOL(drm_sched_add_msg);
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * drm_sched_get_msg - get scheduler message
>>>>>>>> + *
>>>>>>>> + * @sched: scheduler instance
>>>>>>>> + *
>>>>>>>> + * Returns NULL or message
>>>>>>>> + */
>>>>>>>> +static struct drm_sched_msg *
>>>>>>>> +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
>>>>>>>> +{
>>>>>>>> +     struct drm_sched_msg *msg;
>>>>>>>> +
>>>>>>>> +     spin_lock(&sched->job_list_lock);
>>>>>>>> +     msg = list_first_entry_or_null(&sched->msgs,
>>>>>>>> +                                    struct drm_sched_msg, link);
>>>>>>>> +     if (msg)
>>>>>>>> +             list_del(&msg->link);
>>>>>>>> +     spin_unlock(&sched->job_list_lock);
>>>>>>>> +
>>>>>>>> +     return msg;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>      /**
>>>>>>>>       * drm_sched_main - main scheduler thread
>>>>>>>>       *
>>>>>>>> @@ -1060,6 +1103,7 @@ static void drm_sched_main(struct work_struct *w)
>>>>>>>>                  container_of(w, struct drm_gpu_scheduler, work_run);
>>>>>>>>          struct drm_sched_entity *entity;
>>>>>>>>          struct drm_sched_job *cleanup_job;
>>>>>>>> +     struct drm_sched_msg *msg;
>>>>>>>>          int r;
>>>>>>>>
>>>>>>>>          if (READ_ONCE(sched->pause_run_wq))
>>>>>>>> @@ -1067,12 +1111,15 @@ static void drm_sched_main(struct work_struct *w)
>>>>>>>>
>>>>>>>>          cleanup_job = drm_sched_get_cleanup_job(sched);
>>>>>>>>          entity = drm_sched_select_entity(sched);
>>>>>>>> +     msg = drm_sched_get_msg(sched);
>>>>>>>>
>>>>>>>> -     if (!entity && !cleanup_job)
>>>>>>>> +     if (!entity && !cleanup_job && !msg)
>>>>>>>>                  return; /* No more work */
>>>>>>>>
>>>>>>>>          if (cleanup_job)
>>>>>>>>                  sched->ops->free_job(cleanup_job);
>>>>>>>> +     if (msg)
>>>>>>>> +             sched->ops->process_msg(msg);
>>>>>>>>
>>>>>>>>          if (entity) {
>>>>>>>>                  struct dma_fence *fence;
>>>>>>>> @@ -1082,7 +1129,7 @@ static void drm_sched_main(struct work_struct *w)
>>>>>>>>                  sched_job = drm_sched_entity_pop_job(entity);
>>>>>>>>                  if (!sched_job) {
>>>>>>>>                          complete_all(&entity->entity_idle);
>>>>>>>> -                     if (!cleanup_job)
>>>>>>>> +                     if (!cleanup_job && !msg)
>>>>>>>>                                  return; /* No more work */
>>>>>>>>                          goto again;
>>>>>>>>                  }
>>>>>>>> @@ -1177,6 +1224,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>>>>>
>>>>>>>>          init_waitqueue_head(&sched->job_scheduled);
>>>>>>>>          INIT_LIST_HEAD(&sched->pending_list);
>>>>>>>> +     INIT_LIST_HEAD(&sched->msgs);
>>>>>>>>          spin_lock_init(&sched->job_list_lock);
>>>>>>>>          atomic_set(&sched->hw_rq_count, 0);
>>>>>>>>          INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>>> index df1993dd44ae..267bd060d178 100644
>>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>>> @@ -394,6 +394,23 @@ enum drm_gpu_sched_stat {
>>>>>>>>          DRM_GPU_SCHED_STAT_ENODEV,
>>>>>>>>      };
>>>>>>>>
>>>>>>>> +/**
>>>>>>>> + * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
>>>>>>>> + * message
>>>>>>>> + *
>>>>>>>> + * Generic enough for backend defined messages, backend can expand if needed.
>>>>>>>> + */
>>>>>>>> +struct drm_sched_msg {
>>>>>>>> +     /** @link: list link into the gpu scheduler list of messages */
>>>>>>>> +     struct list_head                link;
>>>>>>>> +     /**
>>>>>>>> +      * @private_data: opaque pointer to message private data (backend defined)
>>>>>>>> +      */
>>>>>>>> +     void                            *private_data;
>>>>>>>> +     /** @opcode: opcode of message (backend defined) */
>>>>>>>> +     unsigned int                    opcode;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>>      /**
>>>>>>>>       * struct drm_sched_backend_ops - Define the backend operations
>>>>>>>>       *  called by the scheduler
>>>>>>>> @@ -471,6 +488,12 @@ struct drm_sched_backend_ops {
>>>>>>>>               * and it's time to clean it up.
>>>>>>>>           */
>>>>>>>>          void (*free_job)(struct drm_sched_job *sched_job);
>>>>>>>> +
>>>>>>>> +     /**
>>>>>>>> +      * @process_msg: Process a message. Allowed to block, it is this
>>>>>>>> +      * function's responsibility to free message if dynamically allocated.
>>>>>>>> +      */
>>>>>>>> +     void (*process_msg)(struct drm_sched_msg *msg);
>>>>>>>>      };
>>>>>>>>
>>>>>>>>      /**
>>>>>>>> @@ -482,6 +505,7 @@ struct drm_sched_backend_ops {
>>>>>>>>       * @timeout: the time after which a job is removed from the scheduler.
>>>>>>>>       * @name: name of the ring for which this scheduler is being used.
>>>>>>>>       * @sched_rq: priority wise array of run queues.
>>>>>>>> + * @msgs: list of messages to be processed in @work_run
>>>>>>>>       * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>>>>>>>>       *                 waits on this wait queue until all the scheduled jobs are
>>>>>>>>       *                 finished.
>>>>>>>> @@ -489,7 +513,7 @@ struct drm_sched_backend_ops {
>>>>>>>>       * @job_id_count: used to assign unique id to the each job.
>>>>>>>>       * @run_wq: workqueue used to queue @work_run
>>>>>>>>       * @timeout_wq: workqueue used to queue @work_tdr
>>>>>>>> - * @work_run: schedules jobs and cleans up entities
>>>>>>>> + * @work_run: schedules jobs, cleans up jobs, and processes messages
>>>>>>>>       * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>>>>>>>>       *            timeout interval is over.
>>>>>>>>       * @pending_list: the list of jobs which are currently in the job queue.
>>>>>>>> @@ -513,6 +537,7 @@ struct drm_gpu_scheduler {
>>>>>>>>          long                            timeout;
>>>>>>>>          const char                      *name;
>>>>>>>>          struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
>>>>>>>> +     struct list_head                msgs;
>>>>>>>>          wait_queue_head_t               job_scheduled;
>>>>>>>>          atomic_t                        hw_rq_count;
>>>>>>>>          atomic64_t                      job_id_count;
>>>>>>>> @@ -566,6 +591,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>>>>>>
>>>>>>>>      void drm_sched_job_cleanup(struct drm_sched_job *job);
>>>>>>>>      void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>>>>>>>> +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
>>>>>>>> +                    struct drm_sched_msg *msg);
>>>>>>>>      void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
>>>>>>>>      void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
>>>>>>>>      void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>>>> -- 
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> http://blog.ffwll.ch

