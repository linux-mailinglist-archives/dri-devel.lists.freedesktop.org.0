Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4431F76E487
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 11:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5177B10E0C8;
	Thu,  3 Aug 2023 09:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A3710E071;
 Thu,  3 Aug 2023 09:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mY8KPB96MgrPeOrl5C1kRnIfAooSTJ73wE4RQXa0WMxn1FFSeoao78W5SHY/7/d9gjy6XJcInbmswRovXpjbW87O3Sdb5YJQSO5CwPVaTlacC0su8OXaobbcdaWJp/TNMHqVH7zxFWD6L/6hw5jquhGlxjzmgbqzysu5pKwrSC7vCx4mP1Vx9W/WifVh0pfsUQVoX2dwpEU/i07aBSO1w/FIKthlXi3FEb6Mio/KS6JvFpLcUOF3ed4fBr459j/txH/BnFlR9M7ghcUJZd2sjnl29/ech+bv9R4XJm9pn0Z4H2kf44OqU1/9PpdpenRAbQ7Cj0asvfAS9CjVtQxDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZkYZ7H5kesEErWAFEFHUD/onit1J5DcrrB4ncXST7g=;
 b=SLsN+eoUHfj33tfax0G6u9r1zXevJdIln6k5gC1niMWym1dMkkQfIIVFxWb9TH/8oq2+cAuvvRzcg9jBlkGAPGnypzbIDx8vwR+nnkOhCYjo8QluKphBOJiU1TdgptfJH+CrZehHgLRaywhco+JQRDQkuwnsGBf7vrrhNLHXeuGxA5Bb2TrG526RsjJEcszkE/xZ+zdsb/hliIaw+va1oVP4cTwVCgoB95vdquvn9bscJ6S5wzptcpm27nYeoMeLYDjKORFBUE9cKj/DANAoMkEel7ShdOpdEfTIciQtjvlW0gPgMZi9nf+oWo/+pQzek+KoLa7l/GFGwYtRvTDcJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZkYZ7H5kesEErWAFEFHUD/onit1J5DcrrB4ncXST7g=;
 b=OF2raHEHKykIj87F9y6hYiQprlbhxzTxt87UW11H4qOYti8RabTfdQEHmnInzbO+fxj+ge3ha4S/KW1oLHYFjtJG3sdflw6qkEpICKQN1NBaDuHBzWxKuptUbrRblo5xt8q/x0h7PjkaFNvOrENuWqUWP6/RuBwfJqwdDplHslo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB8297.namprd12.prod.outlook.com (2603:10b6:930:79::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 09:35:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 09:35:36 +0000
Message-ID: <88b40106-e24f-e286-c3a3-363a6b2462ee@amd.com>
Date: Thu, 3 Aug 2023 11:35:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] drm/sched: Add generic scheduler message interface
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-5-matthew.brost@intel.com>
 <efabdbaf-4f38-ae62-3d4e-da5660558886@amd.com>
 <CAKMK7uEdyV+Swtk50KqYUeCr5sOAceT_asB69_Ynz=Nx_z+HkQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uEdyV+Swtk50KqYUeCr5sOAceT_asB69_Ynz=Nx_z+HkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: 5317c025-50ab-4e66-452e-08db9404fd98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDctwElXAvPGZsf2vVNBzkPKFEMwuNKSt2rgOOlIShcd2moFZ2PUEIf4ZFtcWInnG12fH9E2JLlv6sNliouMI6RXqqXinceoOarhxe/+6PSIwl6QIoTTSRnwcd5uXb1iznU4xzVuuM5eZavbE1ugqhtKlo687UpAinyamv60E0Q/p8znUHJnV28B15ggiGtxyIQbT1ZNfD2ip2ZGaeUMOFfGkzuoitD63jpKHShcqjIt0fv/Nk4vSZ84jy1QYxHSs6tKnWd1uaSQZQZqWPvENkGjWicisk+487GO98S0leYEca2Rilyiz38wnhZwX3iqmflKbSgV997AQxohRrd4dLmb4OjTN0RLxD5YlI1h555/Hj95hoC4hCjqUuVNq9v/Bn6Zal5tncdMv6UbuZIndGRvstrz4AnkmRWPZW4LnM8Fvqu5MROoRLclkWxajR0Gj8eMIT2p7zOYXAszGiYhE5Nb83YJUpBVcUlvqVAr/r2BIXDgCf6InBSWjrLIKzT+6kTWYTYSPkX/EXmciEi/N1SIBQ6GuLFoeFOtq33HPvHPMk2+gDRKqO94QMVw/3L+LT676ezxd8S9Nl2gjRQR4P/ckKpjsjYMpTa3UG26QLI2KEcv8lMtlGbYr8WjNkZVeNEA0Lue0hdlsGtPj63PnN82CzfHgI2+ZQwSPP71OdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(2616005)(83380400001)(6506007)(186003)(41300700001)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6916009)(316002)(7416002)(8676002)(8936002)(6666004)(6486002)(15650500001)(6512007)(478600001)(66574015)(38100700002)(36756003)(31696002)(86362001)(31686004)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3VLamJEaUp0ZkxxengwOVBuSSsxdGNFejhWcmRxdFIxK3hDcjFpekZEa1d1?=
 =?utf-8?B?YjNZZnNqVDFrVi9BSG5pZzJodjA2NEhtS0MvNklIa1BjamhtM3laR0VFUi8v?=
 =?utf-8?B?ZUM3aEZLOGh6K1p6RHhvMk1PMlJIeFdkaVRXdzJSa24zZkV2QTdiaXJaOVhq?=
 =?utf-8?B?Wjl0WnNrSmszZm1BMWFBbDllVHpUSys2WGo0S2dkZm5LU2FaSjVPenVYS2h5?=
 =?utf-8?B?NzU1OWFYZlVpeTVCVzVzSU1jdWNGSVpyUk1lT1hER0ZvMmM0Q3MzTFFsRlVq?=
 =?utf-8?B?UytRSHltUmNVRnNPb29CanRKTVBMbXdhTHRXdE5NelJiUmFlU3BsNEl6MFJ0?=
 =?utf-8?B?VWtxYnBFMmQzVVU4a3pVakxiZnZHODk2WW91RVNqS3NvblhxbFc4ZTNKVWxt?=
 =?utf-8?B?eG1SRUJvNDh5UGZrbTg1SFBtVEc3OFgzb0hOT2NCQnRjK2s2WFdHSGQzNlpy?=
 =?utf-8?B?SWIva1Vmb3ovaS9QeUQ1U1BabEZoRSsxYkdVRnZsVW9SVStBR3ZBeFBEOGNh?=
 =?utf-8?B?M051VFk2eE9sZ0ViVG0vVGwzQ2N5S0NJUlFkTzFLZXl5bEhLY2EwUzFDanJ5?=
 =?utf-8?B?ck5HTitaOERLSkZTanpuVS9kNWR1WWZjV1lNaFQyS0ZlVDBZU0o3dzFLMXRU?=
 =?utf-8?B?YjJjUGRVZEhnSjRKZDFvOVVJb290NXA4NjZUQVFhY2l5eG1SUkE4WWs3MmVW?=
 =?utf-8?B?dURwRFVrSDFoeEZNV25iM0RRTGtsWXhJbTI3V3R5NmpXTVgxTUZiTDcydWRv?=
 =?utf-8?B?V04rSWdmKzQ5ZUtIeU8wcEN6a1BOUnJVLzFJTUFidmxjUG1hdWRCN3k4MUNY?=
 =?utf-8?B?bTlRamcvellwWGd2RXROWXlNZW5IdFo0bG9yanBQeEJBQWJERldsU0ROcGxY?=
 =?utf-8?B?NG9PR29XZEFCSXZZSUJCNDkxRXB0bStwSCs1R1NzaTdWMUxUSEhuYUt0Y0Vj?=
 =?utf-8?B?ckJMWjhZRWt6QTJZTngyZlZNN2hsbDRENDRrUmttZU5uSVVYMTl6NGFnamhI?=
 =?utf-8?B?NWZXZENRd1ZkdkFVMC9iMzE4UjY5N0xCY2x6YXFSV1BDdXMxdVZwZjFVQ2dZ?=
 =?utf-8?B?QXYzem1FWTljZnA2OUJCc3BEMGVwYkxtb2JpWFhrbmFTZmdtd1VpbG1MQXFL?=
 =?utf-8?B?MGJDUjN6Q0FBTnRwUjdXcW9uYUhCOUFhTVBNSDA5K1RXM2lLY0Z5UGtZaE9w?=
 =?utf-8?B?azA3S0JRczZXd0lmUzNnUndOSSsraDY5ODlRdS9YWHdBd2p6dXpSZ3pzdmw2?=
 =?utf-8?B?Q1FyMXg2ZkYzdXVOQXVNOXFmTnhCcnAwNmRYZ3JLazUyZm5aeGFkQkYxdC91?=
 =?utf-8?B?L0JDcW41VlFHZWtwV21sNEpVamVOVTQyMTBTNHkyeDNvMDhsWFlXekRaaGtK?=
 =?utf-8?B?dk1nL0h0QlV4Y1FxSFZKdmwxZlJZcDZpYzd4UjRHU01pbXZHZzZ5WEl6dm5J?=
 =?utf-8?B?SUx2T3k1QzVvMUF4YXVFT0NoUDV5QzFqRWRCK05pV1dPZWRzTWpnWkVwRURJ?=
 =?utf-8?B?SlhHR2Myb2pSaXlZamllSGcrVlhLYmo3Y0RDYVlGUm9JK3YyRzd4U3VIVXhB?=
 =?utf-8?B?b2loeUtDbitTSDlUbVQzQXJPbm4wOVdkN2hxQ0JSa1BpOXFrWFIwSmlZNmJD?=
 =?utf-8?B?VmFvY2NqdjJWSE9FV2htdmxGaU1mNHYxVmZLck4rcUtSc1VSVlBSVElkY2Zp?=
 =?utf-8?B?MzkvQzRZdkppUVk0MmpGUXNtU3BWU2xTRHdxVGxaZjVDMVFsMm8wWFJTS3Jo?=
 =?utf-8?B?NCswWm50VWhWdStZQndMV3VSYzQ2cWl1M09DU1lCL2NMZ09pYitUMUtVb2do?=
 =?utf-8?B?NWlWKzVYQ21FaTJ5REhYMXVIbDBKWCs5UFZyRDdVTDhYbUV3d2RyYmdJMWxS?=
 =?utf-8?B?QkhHWWRBNUIyczBHSVlmbmR1UGRTbXppbkZxMjNRejRHd1RuYXpvU2lNTlZJ?=
 =?utf-8?B?bXByWE41WHFZOG0vUHhEZVhZTHhsNjMrNlFpUVFLU1lrdkEyanhhV3huYlVt?=
 =?utf-8?B?SE5TSHN3cEdTVTBnT1IrSHpjcVZCVzFmbU1adVowVDcySkRSdUlhYStxQXcx?=
 =?utf-8?B?Lzh1SU92ZVJRK0k4dHdhNlZqd2tlcjB2S0tuQUxRSVAxN3dzVFpYOS9xdHRL?=
 =?utf-8?B?azhlNVEvRHpMOEIveFVZTWl3TEJ1UGh0UzhObUFJOXprT0hCV0k0M0ZLMXph?=
 =?utf-8?Q?RoUmEx9IRcTc87btINV8vQMLbgjA4bSo+gMvhn1/ZWv7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5317c025-50ab-4e66-452e-08db9404fd98
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 09:35:36.1973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IumTsIrwQmLhylk2fKgwDdSBJbfmhCtfxHQj1OOdDISYRTk9UO5+JTpTTvWb90Td
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8297
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
Cc: Matthew Brost <matthew.brost@intel.com>, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com, lina@asahilina.net,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 robdclark@chromium.org, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.08.23 um 10:58 schrieb Daniel Vetter:
> On Thu, 3 Aug 2023 at 10:53, Christian König <christian.koenig@amd.com> wrote:
>> Am 01.08.23 um 22:50 schrieb Matthew Brost:
>>> Add generic schedule message interface which sends messages to backend
>>> from the drm_gpu_scheduler main submission thread. The idea is some of
>>> these messages modify some state in drm_sched_entity which is also
>>> modified during submission. By scheduling these messages and submission
>>> in the same thread their is not race changing states in
>>> drm_sched_entity.
>>>
>>> This interface will be used in XE, new Intel GPU driver, to cleanup,
>>> suspend, resume, and change scheduling properties of a drm_sched_entity.
>>>
>>> The interface is designed to be generic and extendable with only the
>>> backend understanding the messages.
>> I'm still extremely frowned on this.
>>
>> If you need this functionality then let the drivers decide which
>> runqueue the scheduler should use.
>>
>> When you then create a single threaded runqueue you can just submit work
>> to it and serialize this with the scheduler work.
>>
>> This way we wouldn't duplicate this core kernel function inside the
>> scheduler.
> Yeah that's essentially the design we picked for the tdr workers,
> where some drivers have requirements that all tdr work must be done on
> the same thread (because of cross-engine coordination issues). But
> that would require that we rework the scheduler as a pile of
> self-submitting work items, and I'm not sure that actually fits all
> that well into the core workqueue interfaces either.

There were already patches floating around which did exactly that.

Last time I checked those were actually looking pretty good.

Additional to message passing advantage the real big issue with the 
scheduler and 1 to 1 mapping is that we create a kernel thread for each 
instance, which results in tons on overhead.

Just using a work item which is submitted to a work queue completely 
avoids that.

Regards,
Christian.

>
> Worst case I think this isn't a dead-end and can be refactored to
> internally use the workqueue services, with the new functions here
> just being dumb wrappers until everyone is converted over. So it
> doesn't look like an expensive mistake, if it turns out to be a
> mistake.
> -Daniel
>
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 52 +++++++++++++++++++++++++-
>>>    include/drm/gpu_scheduler.h            | 29 +++++++++++++-
>>>    2 files changed, 78 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 2597fb298733..84821a124ca2 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1049,6 +1049,49 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_pick_best);
>>>
>>> +/**
>>> + * drm_sched_add_msg - add scheduler message
>>> + *
>>> + * @sched: scheduler instance
>>> + * @msg: message to be added
>>> + *
>>> + * Can and will pass an jobs waiting on dependencies or in a runnable queue.
>>> + * Messages processing will stop if schedule run wq is stopped and resume when
>>> + * run wq is started.
>>> + */
>>> +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
>>> +                    struct drm_sched_msg *msg)
>>> +{
>>> +     spin_lock(&sched->job_list_lock);
>>> +     list_add_tail(&msg->link, &sched->msgs);
>>> +     spin_unlock(&sched->job_list_lock);
>>> +
>>> +     drm_sched_run_wq_queue(sched);
>>> +}
>>> +EXPORT_SYMBOL(drm_sched_add_msg);
>>> +
>>> +/**
>>> + * drm_sched_get_msg - get scheduler message
>>> + *
>>> + * @sched: scheduler instance
>>> + *
>>> + * Returns NULL or message
>>> + */
>>> +static struct drm_sched_msg *
>>> +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
>>> +{
>>> +     struct drm_sched_msg *msg;
>>> +
>>> +     spin_lock(&sched->job_list_lock);
>>> +     msg = list_first_entry_or_null(&sched->msgs,
>>> +                                    struct drm_sched_msg, link);
>>> +     if (msg)
>>> +             list_del(&msg->link);
>>> +     spin_unlock(&sched->job_list_lock);
>>> +
>>> +     return msg;
>>> +}
>>> +
>>>    /**
>>>     * drm_sched_main - main scheduler thread
>>>     *
>>> @@ -1060,6 +1103,7 @@ static void drm_sched_main(struct work_struct *w)
>>>                container_of(w, struct drm_gpu_scheduler, work_run);
>>>        struct drm_sched_entity *entity;
>>>        struct drm_sched_job *cleanup_job;
>>> +     struct drm_sched_msg *msg;
>>>        int r;
>>>
>>>        if (READ_ONCE(sched->pause_run_wq))
>>> @@ -1067,12 +1111,15 @@ static void drm_sched_main(struct work_struct *w)
>>>
>>>        cleanup_job = drm_sched_get_cleanup_job(sched);
>>>        entity = drm_sched_select_entity(sched);
>>> +     msg = drm_sched_get_msg(sched);
>>>
>>> -     if (!entity && !cleanup_job)
>>> +     if (!entity && !cleanup_job && !msg)
>>>                return; /* No more work */
>>>
>>>        if (cleanup_job)
>>>                sched->ops->free_job(cleanup_job);
>>> +     if (msg)
>>> +             sched->ops->process_msg(msg);
>>>
>>>        if (entity) {
>>>                struct dma_fence *fence;
>>> @@ -1082,7 +1129,7 @@ static void drm_sched_main(struct work_struct *w)
>>>                sched_job = drm_sched_entity_pop_job(entity);
>>>                if (!sched_job) {
>>>                        complete_all(&entity->entity_idle);
>>> -                     if (!cleanup_job)
>>> +                     if (!cleanup_job && !msg)
>>>                                return; /* No more work */
>>>                        goto again;
>>>                }
>>> @@ -1177,6 +1224,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>
>>>        init_waitqueue_head(&sched->job_scheduled);
>>>        INIT_LIST_HEAD(&sched->pending_list);
>>> +     INIT_LIST_HEAD(&sched->msgs);
>>>        spin_lock_init(&sched->job_list_lock);
>>>        atomic_set(&sched->hw_rq_count, 0);
>>>        INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index df1993dd44ae..267bd060d178 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -394,6 +394,23 @@ enum drm_gpu_sched_stat {
>>>        DRM_GPU_SCHED_STAT_ENODEV,
>>>    };
>>>
>>> +/**
>>> + * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
>>> + * message
>>> + *
>>> + * Generic enough for backend defined messages, backend can expand if needed.
>>> + */
>>> +struct drm_sched_msg {
>>> +     /** @link: list link into the gpu scheduler list of messages */
>>> +     struct list_head                link;
>>> +     /**
>>> +      * @private_data: opaque pointer to message private data (backend defined)
>>> +      */
>>> +     void                            *private_data;
>>> +     /** @opcode: opcode of message (backend defined) */
>>> +     unsigned int                    opcode;
>>> +};
>>> +
>>>    /**
>>>     * struct drm_sched_backend_ops - Define the backend operations
>>>     *  called by the scheduler
>>> @@ -471,6 +488,12 @@ struct drm_sched_backend_ops {
>>>             * and it's time to clean it up.
>>>         */
>>>        void (*free_job)(struct drm_sched_job *sched_job);
>>> +
>>> +     /**
>>> +      * @process_msg: Process a message. Allowed to block, it is this
>>> +      * function's responsibility to free message if dynamically allocated.
>>> +      */
>>> +     void (*process_msg)(struct drm_sched_msg *msg);
>>>    };
>>>
>>>    /**
>>> @@ -482,6 +505,7 @@ struct drm_sched_backend_ops {
>>>     * @timeout: the time after which a job is removed from the scheduler.
>>>     * @name: name of the ring for which this scheduler is being used.
>>>     * @sched_rq: priority wise array of run queues.
>>> + * @msgs: list of messages to be processed in @work_run
>>>     * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>>>     *                 waits on this wait queue until all the scheduled jobs are
>>>     *                 finished.
>>> @@ -489,7 +513,7 @@ struct drm_sched_backend_ops {
>>>     * @job_id_count: used to assign unique id to the each job.
>>>     * @run_wq: workqueue used to queue @work_run
>>>     * @timeout_wq: workqueue used to queue @work_tdr
>>> - * @work_run: schedules jobs and cleans up entities
>>> + * @work_run: schedules jobs, cleans up jobs, and processes messages
>>>     * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>>>     *            timeout interval is over.
>>>     * @pending_list: the list of jobs which are currently in the job queue.
>>> @@ -513,6 +537,7 @@ struct drm_gpu_scheduler {
>>>        long                            timeout;
>>>        const char                      *name;
>>>        struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
>>> +     struct list_head                msgs;
>>>        wait_queue_head_t               job_scheduled;
>>>        atomic_t                        hw_rq_count;
>>>        atomic64_t                      job_id_count;
>>> @@ -566,6 +591,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>
>>>    void drm_sched_job_cleanup(struct drm_sched_job *job);
>>>    void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>>> +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
>>> +                    struct drm_sched_msg *msg);
>>>    void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
>>>    void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
>>>    void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>

