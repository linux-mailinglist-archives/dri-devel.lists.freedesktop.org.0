Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69E6B0D24
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3B110E60E;
	Wed,  8 Mar 2023 15:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB3310E60E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 15:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKjC8oX43M//bhoevDZtzY41sjLOiMLYVb1LcImD4UEw4BuqIMVOq8PbkBp2+0nGyD6NWtuS5deNeNSQ82rB8jBuoWwb2xriJW0e1G8XjZcoWeYng06OQhlBpq8WYyBDbQVtyiqnGZansL1f3kYldMbiH7IS2V7eoZ0wAEpBpDR9LntIhXuf1zAmddCsU+Jm4cFX4JIQNN9j0XP1kq2lVf8phrnO/5TRcr0y4n5oEDxBAKBu9fyATYdV6Lg7H7t7UsPPSlKAGTjIOvJ0dkzGqirDx3QH65NQvGlscqD6/kvg+5CyixbwyG5TpmGE4541UlV0Y+mdcwTGxlEVlddu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCRNt3vCcZvQpdhgoNQZq2Xl9owEUwlhakuJ/93hQDY=;
 b=Kxdct5pnYWttFhLtHi/lDyyUZYCHhLnj03ykrIq+WTY7vqquxszoagdrz94skZC1uRpDY8w2e1Oxe10vO5+UhVod65QwwZvFydblJfpF75RiUpnNICHyQs/r9134V/Eu81JsOgYF4NItUmSwiKuVYogNFv0ahMYMd9LlGRsBROpvG04hMiAMkLgJguypBTuiZqdJjkwQJJOALcOWJrQtazFnkh9P/GI8mwuIGRH/40WatkQ8+XxK7Rx+jzQPoaT7W3BvSk3HCh/0BK93j+HNNhuntoWeHzoPwOjbSbcl+glpYavZcyyWEIE1re/UE2qJaNhUDv5ycnuQd8Btr47Svg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCRNt3vCcZvQpdhgoNQZq2Xl9owEUwlhakuJ/93hQDY=;
 b=Xms1m8oRzU0aMhP5vnI+1UGUkImV9J3pvGOlkekvzVDcT9ZDs8klBSIOwx0UKgQL0vL2dDkPzXHq26k47DYwwqf+t0zQ9IW5n07s+pwVr+cAXZ5l6Hxf9LuLXYwPRJyJN9fPEEjsASXp9T6mrAfAum1htn7FZuPacOiJlF/gJ2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5043.namprd12.prod.outlook.com (2603:10b6:610:e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 15:42:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 15:42:47 +0000
Message-ID: <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
Date: Wed, 8 Mar 2023 16:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
 <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c4b218-8d6d-41ad-a246-08db1febc454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SY5M3FDVotZ3R+Yjx1vhrhBKEysG3m+AJy+dPL0qdwMHPaBN+jXGptpRVMeIWU3yIjg/N3tkyQqFT5DkkGRjubUiPrGUj6Z5yqo5DwHFzdsWR4hK2DywdltiGe1jV7IRIiu9Qqt+Ah68s3xmQMSt0wxhpCx3tXT1p7fHlbUb2pKrUgQycUuusv1sqVaPleHMrGKnD7TPOMLTSZDEaEi+Vm3sT5/LTfnFcUohuEEJ0jHEmpDiT2WvAFEu/UYvbLfaQdfEfIxZu8q1OfQt8eFSR893px5ZyAxkFuYr3pQwGdcbPqYq2abUHKR8gqw9vfvMRKvlHY0Sm1f5IyHEELr7HBi6sx9IBMi0cvNxijUWtnX7g5Q1FPpAW7GCV9c32ZzYFMJ6Eo1omYA8nK39HmdSzXHaG26wwUK9xdaJiopDeego62RfjHeykFUa8lCaZnv3R2kUO7U+g0OOKZDBzJVwCL5SJqDxfEC72QAxJkkFw+b+mtCw4aoBlFSXld6QQ8Fv1FphDLloS3u8hPUxrfbF88hVBXzdNtAZBKHgV5DKnYIwJ3oyrYOa9XMkqoDsqZ7YyMTESmxCi+FShDMfNj1quvd+t3J/KiVbJZVbYxG+SkQihWuxlu9Ura2TCptkSJfjpWlL/BoNyTFvDwW4uYQ5PJRjTa8IhSHG1xpNoW7fob0pTh4qxJDj9aPvSwJPY04Tqsz+Q9K0FQufz6BY9IYsU3BXsuKelVVmugG1xb5Srb8bIRsLju5MJKqexEJuu+u+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199018)(2906002)(31686004)(66946007)(4326008)(5660300002)(7416002)(36756003)(8936002)(41300700001)(110136005)(31696002)(66556008)(66476007)(8676002)(86362001)(316002)(54906003)(478600001)(921005)(6486002)(6666004)(38100700002)(6512007)(6506007)(53546011)(186003)(2616005)(83380400001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZTVlB3UEl1K0hxU3ltUCtwU2NOQTRYcENYL1FKV2NuenFwdXVlVVhKeHUw?=
 =?utf-8?B?cG1IMElMWStSM1Q5NVcvOTAxSDhCa1FkVTluZDREajRNOWZHbTU5VlVSR2RE?=
 =?utf-8?B?YlF6RkJnWlQ0Q2VsNGkxNFlDT2lMNjE0Y2xYOHBPcE5iNUh3U1RZMVRYdW9n?=
 =?utf-8?B?RHc0Rjc0c3FQaVpYV2djQmlJUTR3bXNPVDV6eFFJQUpLSUJYaUVhd0Urb2NL?=
 =?utf-8?B?YUMzaHpJSE9qNG40LzRQc3JzYzUySjFZcGtEeXdETzZQTUZacndwUHVGR0N1?=
 =?utf-8?B?T2dPT1lJczNMdnNCRnhjVllRd3NDQW44YmRXRThadHh6eGswTnFPZFdOUkw4?=
 =?utf-8?B?c1RXK3FJYlRldmZnMDN1K1FUR0RhbVdha3llZkJuY1I4YnFPb29FQXF3Vk0x?=
 =?utf-8?B?bGZNOFNMZWE5VTZwT1VxMUJ1bmU4K0N2WVQrQ1o2bXZzS1ZQTkpJdDQ2TUl5?=
 =?utf-8?B?QWM2M01VSDBSR2ZsckRIOGdiZVBic2FSc1BuODNORWNkOU5ncklKcmJVZTho?=
 =?utf-8?B?aUpES2J1WkV0WjR6ZXh2WTVrRHlqcGVxMWkxSGVTWEtHMDB2c0QraGJ0S3hE?=
 =?utf-8?B?bHBtUENWeGpEUGYrb1N6amFFMUs0R2ZndEsrSm4wa0x0aXJtUEVHcXBHZFBP?=
 =?utf-8?B?aDIrSElSSVltdnNsZDQ0aFZYbGZPL3kyK0U3WmdZYmtJOTdZNGVicHRIYnRY?=
 =?utf-8?B?RW5BZnh3dWpLeFMvT0pkRWRodUxtZGRYVy8wR0FleGN1MEpDOHB6WEhjajFx?=
 =?utf-8?B?b1BQTVVuajE4TzBEUHErb3FreFRoWlJsajVlc2tkYWtSNW1rVm1MRlN1bnc0?=
 =?utf-8?B?RjUxNGEvSXhyQU83dVB4SllRTWx6L1FYTFZTeG9HeVdzWUZFbHRncHJDcDgr?=
 =?utf-8?B?L3paMEtZd1J5cFV1SCt1eFo5NlAxeXJLQW53NFlML1VjQnRkL0xmVm9ja0tk?=
 =?utf-8?B?NTR0ck9CSTNtSjAvVldKd0lvTGVEcDhGQy9oVGVXYm1aTmRiWk1ISEszZTZ4?=
 =?utf-8?B?cExZR0lOc05LT2hSclJLbXNUNVdnL3NvMXZVdk1WRkYzaUN5RFFkajhNVUNK?=
 =?utf-8?B?NXRseTlpbDA0QnZ6NkNuRm1kZXI1bW05R1UzSlplY3VmbE15N1huZHpJTHlz?=
 =?utf-8?B?cUZHbC9hdlF6aWdOOUpmb1MvTW95eVV0WUZwSHJkbUNBM1lyQW8vSmU0Nm1N?=
 =?utf-8?B?WXNkakRlVEFFU2JBY3hyWTc0dDJxQUJZcndwdVU4N0dzSmZVb0p4Q2VxQis2?=
 =?utf-8?B?OEhydXNaL0xCczlZKzZFM2Z1T3FIVXhQbkE2ZTNPTGYvQ20ycHh3ZG1FMXdR?=
 =?utf-8?B?QXdIYko3T3hOam5ucUN0NUpWNisrSVBnaUExRmhvS2QyQnF2ZHdYbWN0aHFu?=
 =?utf-8?B?UTUrUDcvbTVzcExtL09ydWx1TksxMTlpZWs5amlCTW94QVlZYjNZVmlITmRN?=
 =?utf-8?B?d29UdUgyZGM3SVc0VDM0MEdRMU95MlhaR3gxMktkZG4zREpOa2dXOVdBRFNO?=
 =?utf-8?B?RXY3TEhwN0NqTEhTUnJMeEpnYUp0VW5VcFVlTjY2N3FTcFVOODF2RjljZW93?=
 =?utf-8?B?ZlZKOU1iVDVBSmZvZStUSUVwMHBVbFhGTnFDbmc1UDVEMUdlbGJxaHIzRk5S?=
 =?utf-8?B?bzA4dlgveGdsQUNDa0d5RjI3ZXA0WG9OR2FkSDlBZi9XZFJjd3h2elQvTzdK?=
 =?utf-8?B?dzhjZm91VU1aNzlpaWlmZlFoWUY2UDlaRFNlWGtNbjBSblIrL1BsaVNEUnF1?=
 =?utf-8?B?bnEyTnc2S3UwVjZXRkhIUXBhV29hdzZqQi9tWWNVZHJWZlF4Mm16Zmg3aUNu?=
 =?utf-8?B?NGx1UXc4ekhWS2pNK2w2aXVURGhISk1jVzZGbnR5OWM3MkQ0Rkk5RWZiQUhl?=
 =?utf-8?B?YWdkbGlabjZybFJYb1hVK2g4K0o3YktaMnNMd0NLMGp0c3QwcUtYZmNsWXp2?=
 =?utf-8?B?UWREUHRzaVRneU9BMnFaZ3ZDL012SlNjNUhpM3h4M1pDM2dVYXcvN0lmVDlE?=
 =?utf-8?B?eDh2aXRlbmN1VU9uUkh5dktyY3Q4TnNlRy9iaDVyM0pxOHhpTWVIaUxrbjhk?=
 =?utf-8?B?RUVoK1BIYVo5a3E5OEJpMEU3dUNkV1RZdHhSYUg0RVZHNVVwZDRtRXNpQVBN?=
 =?utf-8?B?c3FydVpuc3ZXQnZSMURtSThKS1prWXZxc2ZNUUM5aDZKeStvSEdzVTloekZD?=
 =?utf-8?Q?/w6J4Qq3PC7rBXzEGEtOfTx/d4Y/ObY4N/JlrYGL0b0N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c4b218-8d6d-41ad-a246-08db1febc454
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 15:42:47.7994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kCTJe/VeNNy5KSaMLttBB1WZR3Xr8SJYpOfIsQLDrARPjfTNir4KwPkSsXlg/1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5043
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 16:18 schrieb Asahi Lina:
> On 08/03/2023 19.03, Christian König wrote:
>> Am 08.03.23 um 10:57 schrieb Maarten Lankhorst:
>>> On 2023-03-07 15:25, Asahi Lina wrote:
>>>> drm_sched_fini() currently leaves any pending jobs dangling, which
>>>> causes segfaults and other badness when job completion fences are
>>>> signaled after the scheduler is torn down.
>>>>
>>>> Explicitly detach all jobs from their completion callbacks and free
>>>> them. This makes it possible to write a sensible safe abstraction for
>>>> drm_sched, without having to externally duplicate the tracking of
>>>> in-flight jobs.
>>>>
>>>> This shouldn't regress any existing drivers, since calling
>>>> drm_sched_fini() with any pending jobs is broken and this change should
>>>> be a no-op if there are no pending jobs.
>>>>
>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 27
>>>> +++++++++++++++++++++++++--
>>>>    1 file changed, 25 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 5c0add2c7546..0aab1e0aebdd 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -1119,10 +1119,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>    void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>    {
>>>>        struct drm_sched_entity *s_entity;
>>>> +    struct drm_sched_job *s_job, *tmp;
>>>>        int i;
>>>>    -    if (sched->thread)
>>>> -        kthread_stop(sched->thread);
>>>> +    if (!sched->thread)
>>>> +        return;
>>>> +
>>>> +    /*
>>>> +     * Stop the scheduler, detaching all jobs from their hardware
>>>> callbacks
>>>> +     * and cleaning up complete jobs.
>>>> +     */
>>>> +    drm_sched_stop(sched, NULL);
>>>> +
>>>> +    /*
>>>> +     * Iterate through the pending job list and free all jobs.
>>>> +     * This assumes the driver has either guaranteed jobs are
>>>> already stopped, or that
>>>> +     * otherwise it is responsible for keeping any necessary data
>>>> structures for
>>>> +     * in-progress jobs alive even when the free_job() callback is
>>>> called early (e.g. by
>>>> +     * putting them in its own queue or doing its own refcounting).
>>>> +     */
>>>> +    list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>>> +        spin_lock(&sched->job_list_lock);
>>>> +        list_del_init(&s_job->list);
>>>> +        spin_unlock(&sched->job_list_lock);
>>>> +        sched->ops->free_job(s_job);
>>>> +    }
>>> I would stop the kthread first, then delete all jobs without spinlock
>>> since nothing else can race against sched_fini?
>>>
>>> If you do need the spinlock, It would need to guard
>>> list_for_each_entry too.
>> Well this case here actually should not happen in the first place.
> "This should not happen in the first place" is how you end up with C
> APIs that have corner cases that lead to kernel oopses...
>
> The idea with Rust abstractions is that it needs to be actually
> impossible to create memory safety problems for the user of the
> abstraction, you can't impose arbitrary constraints like "you must wait
> for all jobs to finish before destroying the scheduler"... it needs to
> be intrinsically safe.
>
>> Jobs depend on their device, so as long as there are jobs there should
>> also be a reference to the scheduler.
> These schedulers are created dynamically per userspace queue. The memory
> management and reference counting involved make it safe to destroy the
> scheduler even when behind the scenes hardware jobs are still running,
> as long as drm_sched itself doesn't crash on fences firing without a
> scheduler (which is what this patch fixes).

We have originally rejected that approach, but I still think it might 
work if done right.

> This is the power of Rust: it forces you to architect your code in a way
> that you don't have complex high-level dependencies that span the entire
> driver and are difficult to prove hold. In my driver, you can kill a
> process and that destroys the drm_sched, closes all GEM objects,
> everything, even if the GPU is still running jobs from that process. The
> worst that can happen is that the GPU faults as in-use userspace buffers
> are unmapped out from under the running user job, but that's fine (GPU
> faults are recoverable). The actual firmware resources, queues, etc. in
> use are all kept alive until the commands finish executing (or fault,
> which is just an abnormal completion), even if the userspace process
> that owned them is long gone. I've tested this extensively by doing
> things like large-resolution glmark runs in a loop that get `kill -9`'d
> repeatedly, and it works very well! Tons of GPU faults but no firmware
> crashes, no oopses, nothing. And the firmware *will* crash irrecoverably
> if anything goes wrong with its shared memory structures, so that it
> doesn't is pretty good evidence that all this works!

Well testing is no prove at all of a correct design.

>> What could be is that you have allocated a scheduler instance
>> dynamically, but even then you should first tear down all entities and
>> then the scheduler.
> This is about creating a safe Rust abstraction, so we can't impose
> requirements on users like that, the abstraction has to take care of it.
> Unfortunately, the jobs cannot depend on the scheduler at the
> abstraction level. I tried that (putting a reference counted reference
> to the scheduler in the job abstraction), but it doesn't work because a
> job completing can end up dropping the last reference to the scheduler,
> and then you end up trying to stop and clean up the scheduler from a
> callback called from the scheduler kthread itself, which deadlocks. We
> could throw those cleanups into a workqueue or something, but that's
> just adding bandages around the problem that the drm_sched interface
> today is just not safe without this patch...

Well that won't work like this. The scheduler has a pretty clear tear 
down procedure.

And that procedure implies that all entities which might provide jobs 
are destroyed before the scheduler is destroyed.

Destroying the entities in turn cleans up the pending jobs inside of 
them. We could add a warning when users of this API doesn't do this 
correctly, but cleaning up incorrect API use is clearly something we 
don't want here.

> Right now, it is not possible to create a safe Rust abstraction for
> drm_sched without doing something like duplicating all job tracking in
> the abstraction, or the above backreference + deferred cleanup mess, or
> something equally silly. So let's just fix the C side please ^^

Nope, as far as I can see this is just not correctly tearing down the 
objects in the right order.

So you are trying to do something which is not supposed to work in the 
first place.

Regards,
Christian.

>
> So far, drm_sched is the only DRM API that has had such a fundamental
> API safety issue that I had to make a change like this to the C to make
> the Rust abstraction possible/reasonable... drm_sched has also been by
> far the hardest DRM component API to understand from a safety point of
> view, with the most inconsistent documentation about what the
> ownership/freeing rules are, and what objects need to outlive what other
> objects (I had to just read the code to figure most of this out). That's
> also one nice outcome of writing Rust abstractions: it forces us to make
> all these rules and invariants explicit, instead of leaving them as
> unwritten assumptions (almost nobody consistently documents this in C
> APIs...).
>
> If I got it right, anyone using the Rust drm_sched abstraction doesn't
> have to worry about this any more because if they do something that
> would oops with it, their code won't compile. But I need this patch to
> be able to make that guarantee...
>
> ~~ Lina

