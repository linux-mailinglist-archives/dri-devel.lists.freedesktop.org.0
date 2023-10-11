Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D529E7C60E4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB0C10E035;
	Wed, 11 Oct 2023 23:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683E210E035;
 Wed, 11 Oct 2023 23:11:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlaE3n62vQW7/TAC+w4m60JzpBdialQx9s7IuxffV1yG7Rq9WHPUXCIW5JPIxNEuQPZKI/rabHxMYKkgzk+Q0sMCj59crTIKG8OS51fbhNKXw7k/h93iK0yOk5GdIcPYuSAZ4MUDGGr98rl156nULz+ZnXwfbSE50RBOGeWXWENdnoJqir4KfogSFb/CxUKO703+t07u5JmlDUCdmS1nQCHJAIqDbsLOtjqql+gbu6Pj05CunY7YNLsyhqJxjLkz0wp63DIJZjc2MGy6/2cnsMgWN08QJtfM/faLJMS3uEFRHCmPZwzA2CrY3xXD8XFKXu7AR2BIsw4yQ5cBzDue6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ3IMwqGQzSF53d3JNMJfkjaMWg3PJUvHDpFj8pR1wM=;
 b=GF+dKYi6U9BUw5Fdqg4zFcyIxNI1IgbWwYkV096RmTZKqb0UUcXxnoPbtJIxCKSjjEQZivJVai9bBOEs8qYdLfnEQN5ECj8q6X3z7iNHAiZy2jZFRdnlaCx3aIcy4ph2ru7aiC48J2PextVvF7Qd2e6CmYH8kFWkeEOA4v5cGY1GVWJ5dLVqtKY02tu22fr12TEkDaupTOD0X373hTeoaE1kJxv5kGP5185gfeTeG3y0zCZA9iFp1xrY5BrtuubISTWH2Y0dkAX6YI9Yt+JPeiZ+hAxHHPmh4NojAFa/52ZLXxOiZEunV5g0KafgXaIlFC1tLbM4JvoBkEZk9/ktNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ3IMwqGQzSF53d3JNMJfkjaMWg3PJUvHDpFj8pR1wM=;
 b=LVpThQVCbkj+9lQTRNDNFpc3Quk9z6wYS0e2UcL3gHPZsSZEAl/kK1UX0tWdzRqBakMoCx6pjmLVfouMj3lDSswbpiq20bdKIo3lQ806FS4TZLcEV3ezEGq76NzXNKlqTlAMsWpC++fTP+dpM9Z+18Hu9lmNqRMCSdA008Gaf/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 23:11:19 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 23:11:19 +0000
Message-ID: <bb05f8ae-dd9c-4cb3-a71e-8fee8ce68945@amd.com>
Date: Wed, 11 Oct 2023 19:11:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v4 02/10] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-3-matthew.brost@intel.com>
 <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
 <ZR4upS/Mkh0lkzJ0@DUT025-TGLU.fm.intel.com>
 <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>
 <1e911601-f126-4e55-35e7-1a5e395b5fd2@linux.intel.com>
 <ZSAkPF1nExMBz89Z@DUT025-TGLU.fm.intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <ZSAkPF1nExMBz89Z@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::32) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd8253c-2de7-47d4-6ae3-08dbcaaf608c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TmR1R0aO/145wyPwEvGBlx1l42hS++FdIuDqHQBOVxKxaJyg+7qBK/owUbgfnEjZP5Ht6UeaL662o61JY8EhiS1P/I1dBsSOc9tTuB1WnxdrOJYkdpfv1lx5Vb9QX+oBB6fWvUQLZ2m75Yu8QD41XVLDdqxG3EButyMVPii/CvQxyuXe+qiuq34zH8TF28z6k/inu7VX5Xm+xmY0LkWLT3SNon7+1OGZEXvcGMtr0TFCH/4U7f7B5tDeinrzJwXr3Uv5zy/Mx++hdcPhApkKx3qOhTKhcnJHOjn7eAZ/cmou1RtTepqctaH4JLNJk0PYfXm16vrXFtPc5AY5tGZBv0irIgE0rA9cUIan7FOZgoV/GpIF3BmTh/on7PF4OyF1V++I/IJ6ggyjoOC/fNXqbT+0x39xfNGfyUY3zSddXPavJHMdZ9JUKisMigwJi7IVGVW5WNFHknJkHugejAlVKtn8yhDc/vpxSWgH27kshp+jH318gnntxhthHuYQOSPav+WV/e0rZ08WoCPHBacm+L9w54gY+3uWQZgx0J1mAuDSz5i2acIh8l1ok0sUNJewDmI+/802olzX+L9YGQ0fMVCJ186UXlyFqHB+33hFyYZBaX1i6IDA0Uc4YkvqvC/evsLTtUuhlmuNj7IbKNutdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39860400002)(136003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66556008)(66946007)(66476007)(316002)(31686004)(4326008)(8936002)(8676002)(41300700001)(36756003)(110136005)(38100700002)(5660300002)(44832011)(7416002)(6512007)(2906002)(6486002)(2616005)(26005)(478600001)(53546011)(86362001)(31696002)(83380400001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0hLbVp2d3FxLzQycG55V1BXbHlGZHRUZjFHVHFIRmdwbm9QeHZ3WW85ZmxH?=
 =?utf-8?B?RmVJMEc2eklrL3JKZTBZQ3AwWnc2ck1Ic3VGSmtwSTJBUkhFRFB3UzB1Mm9U?=
 =?utf-8?B?YzNoaXlMWHJ2WW5hRkFJY3hSYWVRRGhtVDFpZW9RZ3FObEl2TUc2ek1hcTA3?=
 =?utf-8?B?SnpLaWdsend5UGhkNGI5WFBrWGdVWG1JUGRGdkhmOWJzWW1WV1ArK3JZb0Iz?=
 =?utf-8?B?VDIzRTNqL1BjMEZoT3ZCMGRnUURQdTEwbGVzM1BDZkZOZ0Exdkw5RXJmdmhy?=
 =?utf-8?B?SFFOaGQwYlVuMW9VRnpVbUZqQUFMUjNGWE9yS2swcnhjQUxuQ21BcFBMalFZ?=
 =?utf-8?B?OUxSbzNNZm1tdjk1dWhydE84ZklEOStlYzBFN29mbGc1WVdTT2ZFNFhrMW11?=
 =?utf-8?B?bUg1R3JLeER6bCtSclhLbnB5LzVGRU9MdWpTVlNWcW9EUC9NenR6L1Q4QUhw?=
 =?utf-8?B?Z082VnpCaTIrWjZNYjM0U1JUMFAySlpCUFovbVIxc1hCZ25PTldkUHNPMSsz?=
 =?utf-8?B?RXFBZm9iclRFRXBObm5sUVlsMVBxWUhiU2MwZ3g4Q3FUd0JSTUF1YjZWNmkr?=
 =?utf-8?B?bnJoeDZ5c0pYY0lPVGJycE9SRzNaZUIrbi92cWtJWFQzVGVteU9hTE90Z1Nv?=
 =?utf-8?B?U241cElxMXRrY1pLdlN3WHNPTko4dVd6L0pvblFiUmYrZEtXdHk0UlZ5ZzVu?=
 =?utf-8?B?MllVRmxnazBKdkhqREprTThoL3E1Q0dHSExUeFJqYVZPK0h5Umd0QnBMVUc4?=
 =?utf-8?B?YVJucHdiNTdPcnJwZmN6MW9VbCsySWdkeWU1UWdhblllN1FxNTcwaXhqNmdr?=
 =?utf-8?B?a3UyN2djVXB1UEk2QytpWjN1MVg4OXhIMEhITTJaYjJINHQzSmU4Z2phTVFq?=
 =?utf-8?B?akZ3T09KSmpaZEgxbk5CdXV3SkQ0TTVMaXhodENkRnQzalltQmx0eTRkSW5U?=
 =?utf-8?B?YXR1ckptejY0Vk1Xc1NPNGJvRzI1Y1UzaXFpazFHVnpaSmlVQWNoaU1vd3JG?=
 =?utf-8?B?N3NadTVZeEJMTTVsTElvaDI4M2NtSHY0NFRoYk4rdlc5QXk3c3Y3TFduRXJu?=
 =?utf-8?B?UERUbWVaM3RiSGpDa3FzeFlQNHZmbHFSNHRobTcyQU5zeGVRd2FUaWFtZ29n?=
 =?utf-8?B?Mlk2UEhnd25hak11MVRNbmpKaFFtV1lXTkg2dHV5b3p6alE0VDliMjA2QWIx?=
 =?utf-8?B?QW5Na0ZiWk8zWVA1V1hCMjFBV0REV3k2QkRtLzlITENzUTgxSFdrUUpvbVN5?=
 =?utf-8?B?RnlQQmI3Tm8rMjN0cXYvYkFOUGZTT0RwNUJ1Z2thVlRuSlpCMGErbXEzZ0NQ?=
 =?utf-8?B?UjJzQWY3cUU3cVJ6WHF2Q0Nkam5KRENKQno0L1N0SXBTOFFpRnp1R2RVTVNr?=
 =?utf-8?B?TW5qNVBITHhkM0dhQlRLSDk3MTYxQTFNL0lBSDhyZVR0MjBFUnV3c1AyY3Zj?=
 =?utf-8?B?T3RmdlFhRlN6SVg1bm5ZejRPS3NqU1RjZjdGek9pdTZpZExyQnRLc0NDd0tz?=
 =?utf-8?B?SDJSd3RqZDNEK2ZKb09LVm9TUFUxc3ZVMjJmcWlkZzhicTNYUlQyMjBjNUs5?=
 =?utf-8?B?V2tVakppNm9GNnpLamdKdGxtWTd3THU1NXNLaGhzempVUkRpdDA0dWpvUFBm?=
 =?utf-8?B?MHFVWnZaNVE3NDBuRWN5WDJqK1dsWUN4bzArM2s5WW9qalZoVkFLa2FMWDM0?=
 =?utf-8?B?Z0hkZnl1aGttN1Nwa0tVSS9GdmFyYXlNN3RxUlV5RHFGNVZ0dHprcXB0NTgx?=
 =?utf-8?B?RFhTSnNIREZuclIrV2pjYjk1UXJBOHVmUkN5c3N4YUlQSnZQbW8zR0ozemxT?=
 =?utf-8?B?V2ZvdGVxejhGTXdDSzcrOENiUVVvUmhNWk1MUm9QR1FzTEFNVnM2MnZORmpx?=
 =?utf-8?B?bmZlSFRYQW5YWUhPM293dUllWFczVVVlS1JhMUhXelRvZGx2Tm9vaE9XaFBw?=
 =?utf-8?B?bm9GZnBudlFmRGFJL3EyZGxXSWdnbDFNaG1Oa1lxZHpZdnZkVnJyUDhQb3k3?=
 =?utf-8?B?RVd2NmtseHViUjR0NEttRGRvVmxud0ZBQUdIMkpxdFZBWkpQdnp1Vlh1d20r?=
 =?utf-8?B?N09TaWg4Nk9OVzVmU1JEZDFnU2NSQ2ZzVUhCdU5MVTU2RXlnTStSSXB0L0dY?=
 =?utf-8?Q?LcDmcndcrcm5pZX6FRIYT318L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd8253c-2de7-47d4-6ae3-08dbcaaf608c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 23:11:19.2545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qh4PANA3Rr2DqhtDeFcxR5pEHE7fxoON/1gqDRM4zSEzQJEfO+HhO1eqVMH8pYv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-06 11:14, Matthew Brost wrote:
> On Fri, Oct 06, 2023 at 08:59:15AM +0100, Tvrtko Ursulin wrote:
>>
>> On 05/10/2023 05:13, Luben Tuikov wrote:
>>> On 2023-10-04 23:33, Matthew Brost wrote:
>>>> On Tue, Sep 26, 2023 at 11:32:10PM -0400, Luben Tuikov wrote:
>>>>> Hi,
>>>>>
>>>>> On 2023-09-19 01:01, Matthew Brost wrote:
>>>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>>>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
>>>>>> seems a bit odd but let us explain the reasoning below.
>>>>>>
>>>>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>>>>> guaranteed to be the same completion even if targeting the same hardware
>>>>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>>>>> which allowed to reorder, timeslice, and preempt submissions. If a using
>>>>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
>>>>>> apart as the TDR expects submission order == completion order. Using a
>>>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>>>>
>>>>>> 2. In XE submissions are done via programming a ring buffer (circular
>>>>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
>>>>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
>>>>>> control on the ring for free.
>>>>>>
>>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>>> kthread for submission / job cleanup. This doesn't scale if a large
>>>>>> number of drm_gpu_scheduler are used. To work around the scaling issue,
>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>
>>>>>> v2:
>>>>>>    - (Rob Clark) Fix msm build
>>>>>>    - Pass in run work queue
>>>>>> v3:
>>>>>>    - (Boris) don't have loop in worker
>>>>>> v4:
>>>>>>    - (Tvrtko) break out submit ready, stop, start helpers into own patch
>>>>>> v5:
>>>>>>    - (Boris) default to ordered work queue
>>>>>>
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>>>>>>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
>>>>>>   drivers/gpu/drm/lima/lima_sched.c          |   2 +-
>>>>>>   drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
>>>>>>   drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
>>>>>>   drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
>>>>>>   drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
>>>>>>   drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
>>>>>>   include/drm/gpu_scheduler.h                |  14 ++-
>>>>>>   9 files changed, 79 insertions(+), 75 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> index e366f61c3aed..16f3cfe1574a 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>>>>   			break;
>>>>>>   		}
>>>>>> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>>>>> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
>>>>>>   				   ring->num_hw_submission, 0,
>>>>>>   				   timeout, adev->reset_domain->wq,
>>>>>>   				   ring->sched_score, ring->name,
>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>> index 345fec6cb1a4..618a804ddc34 100644
>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>> @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>>>>>   {
>>>>>>   	int ret;
>>>>>> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>>>>>> +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>>>>>>   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>>>>>>   			     msecs_to_jiffies(500), NULL, NULL,
>>>>>>   			     dev_name(gpu->dev), gpu->dev);
>>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>>>> index ffd91a5ee299..8d858aed0e56 100644
>>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>>>> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>>>>>>   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>>>>>> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
>>>>>> +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>>>>>>   			      lima_job_hang_limit,
>>>>>>   			      msecs_to_jiffies(timeout), NULL,
>>>>>>   			      NULL, name, pipe->ldev->dev);
>>>>>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>>> index 40c0bc35a44c..b8865e61b40f 100644
>>>>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>>> @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>>>>>   	 /* currently managing hangcheck ourselves: */
>>>>>>   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>>>>>> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>>>>>> +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>>>>>>   			num_hw_submissions, 0, sched_timeout,
>>>>>>   			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>>>>>
>>>>> checkpatch.pl complains here about unmatched open parens.
>>>>>
>>>>
>>>> Will fix and run checkpatch before posting next rev.
>>>>
>>>>>>   	if (ret) {
>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>>> index 88217185e0f3..d458c2227d4f 100644
>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>>> @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>>>>>>   	if (!drm->sched_wq)
>>>>>>   		return -ENOMEM;
>>>>>> -	return drm_sched_init(sched, &nouveau_sched_ops,
>>>>>> +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>>>>>>   			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>>>>>>   			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>>>>>>   }
>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>> index 033f5e684707..326ca1ddf1d7 100644
>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>> @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>>>>>>   		js->queue[j].fence_context = dma_fence_context_alloc(1);
>>>>>>   		ret = drm_sched_init(&js->queue[j].sched,
>>>>>> -				     &panfrost_sched_ops,
>>>>>> +				     &panfrost_sched_ops, NULL,
>>>>>>   				     nentries, 0,
>>>>>>   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>>>>   				     pfdev->reset.wq,
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index e4fa62abca41..ee6281942e36 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -48,7 +48,6 @@
>>>>>>    * through the jobs entity pointer.
>>>>>>    */
>>>>>> -#include <linux/kthread.h>
>>>>>>   #include <linux/wait.h>
>>>>>>   #include <linux/sched.h>
>>>>>>   #include <linux/completion.h>
>>>>>> @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>   	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
>>>>>>   }
>>>>>> +/**
>>>>>> + * drm_sched_submit_queue - scheduler queue submission
>>>>>
>>>>> There is no verb in the description, and is not clear what
>>>>> this function does unless one reads the code. Given that this
>>>>> is DOC, this should be clearer here. Something like "queue
>>>>> scheduler work to be executed" or something to that effect.
>>>>>
>>>>
>>>> Will fix.
>>>>> Coming back to this from reading the patch below, it was somewhat
>>>>> unclear what "drm_sched_submit_queue()" does, since when reading
>>>>> below, "submit" was being read by my mind as an adjective, as opposed
>>>>> to a verb. Perhaps something like:
>>>>>
>>>>> drm_sched_queue_submit(), or
>>>>> drm_sched_queue_exec(), or
>>>>> drm_sched_queue_push(), or something to that effect. You pick. :-)
>>>>>
>>>>
>>>> I prefer the name as is. In this patch we have:
>>>>
>>>> drm_sched_submit_queue()
>>>> drm_sched_submit_start)
>>>> drm_sched_submit_stop()
>>>> drm_sched_submit_ready()
>>>>
>>>> I like all these functions start with 'drm_sched_submit' which allows
>>>> for easy searching for the functions that touch the DRM scheduler
>>>> submission state.
>>>>
>>>> With a little better doc are you fine with the names as is.
>>>
>>> Notice the following scheme in the naming,
>>>
>>> drm_sched_submit_queue()
>>> drm_sched_submit_start)
>>> drm_sched_submit_stop()
>>> drm_sched_submit_ready()
>>> \---+---/ \--+-/ \-+-/
>>>      |        |     +---> a verb
>>>      |        +---------> should be a noun (something in the component)
>>>      +------------------> the kernel/software component
>>>
>>> And although "queue" can technically be used as a verb too, I'd rather it be "enqueue",
>>> like this:
>>>
>>> drm_sched_submit_enqueue()
>>>
>>> And using "submit" as the noun of the component is a bit cringy,
>>> since "submit" is really a verb, and it's cringy to make it a "state"
>>> or an "object" we operate on in the DRM Scheduler. "Submission" is
>>> a noun, but "submission enqueue/start/stop/ready" doesn't sound
>>> very well thought out. "Submission" really is what the work-queue
>>> does.
>>>
>>> I'd rather it be a real object, like for instance,
>>>
>>> drm_sched_wqueue_enqueue()
>>> drm_sched_wqueue_start)
>>> drm_sched_wqueue_stop()
>>> drm_sched_wqueue_ready()
>>>
> 
> How about:
> 
> drm_sched_submission_enqueue()
> drm_sched_submission_start)
> drm_sched_submission_stop()
> drm_sched_submission_ready()

No.

-- 
Regards,
Luben

