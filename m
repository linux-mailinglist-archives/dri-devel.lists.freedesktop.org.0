Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3624B77FBD9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 18:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C9D10E525;
	Thu, 17 Aug 2023 16:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F52D10E4FE;
 Thu, 17 Aug 2023 16:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DufcRq0Qfo48onbyo5Z91r+VO9Qj3GvHcov9wlpyVqo/LNf0LzbGOshhaihdx3v1wsrcinpTMd8QOXIkBcTb8xOxQWGrfFCqxeExzY2fGxuTqjrbKmAZRg0uB3TdRUplS6nPIEv6WWdAvZXgiPs3xhfw1qCKOvFQRxgNtgN3hRCXr9TofG6EGJ5t1IKoYGBQd3fW2LPyxR5qPzt9eftVL8WeCfvMZ/0EpgDg+rGyzEBlM4Bx6W4lcA+IulTeOGh9W7WOn3i7ymcgWjYD0gUi9Y+DekJ2wOC8IdwRBAzwm1FGwdNl/O4iRYATLLUJDRuVBnO8/dFo5DPVkensAk25jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8eUp6cx52RC0ar05Iy9ilqj9wF8rCvaMKX5LMz6POk=;
 b=d9/POg7h1BvhAI7I3Lnx5h5AgGeYgbtEWbTAsHpzF/M/vD6/Ga4iik+KBZx9zp+62fMl7z3kqHDkXApCJWrZC8vbB/1kAfCVegQ90TaiJF0G81ckApUx2K2YRl88vyD6wtI83FU6ZFsTTutbsncMQpo08Z4HXBIOOhC1SCKjoT9X3ES9M0N+0Gk4v5WBNIM33Ownw7edXSoAX8+pJmTwNbl0w2SsW8h1GikTYigBHJN30rYU8WNyJxcrLlIf88sGg6tnYvAOMK2xgbdvgdJnRaQNBqPbJFN0DedIibuEWZEzzT2Gq274ZKUim+WDl38QOG0pu8y74RIrkmIVJZj4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8eUp6cx52RC0ar05Iy9ilqj9wF8rCvaMKX5LMz6POk=;
 b=k4WQJ78V5fxnH6Kugzh3EH+QIQe5uJIlItOVkJ6pH7dp+tnaxrOvXkuTjc6p1hL1Y8qEY3zygb7Ht/UMYdQP6txRFXWFYNc+6ZoOEcGHNAIlxE4GOpsObUOZ7vxSVdWS4TP0iQhhnlGMIjW22J37mnxMiG2xykmz9B4jbsBZOXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6690.namprd12.prod.outlook.com (2603:10b6:806:272::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 16:17:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 16:17:17 +0000
Message-ID: <0d5af79a-ba3a-d4be-938f-81627db65b50@amd.com>
Date: Thu, 17 Aug 2023 18:17:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
 <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: f7907fcb-73a1-42e4-c95b-08db9f3d6cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gc6Vjw4XRAIVt7Eb6RP0RI2h51mXMi7uJdEJcai2z6RjBfDXMGJdDxPH7/276pqYOQ1ktKBUzTJXAIeZnkxp2wGULHEAlL4YP1QkH8tJ+zVZcIGWguC0PLyj+FRUFJ8l28mgXBAMfmxKkrb8Xu84J1LM3kZcIWWBT+3Urzrz16mjLqlJhlk9wGPRfRb/OdjuaBQPbE0gJoIfGdpzOK8Pw3SxoUnV0JFnQ/Gjlq+rRwd83bu9bfmQFgG5cAYNYJOQhdRq/vjCbKErYt/FrFa9j+5xna6FzX34wOZnBar54USb47poIYKVIGrsCgllHyi3wBa/SC4Fka/9JTtHniRD3i55iPTfDyH6nm5JQ9r77fltdTvi5/ovNkgEBx6y50NeQbl3kgLaCKXpfckTSDK4z+Dc+BnILzQ4SryepuKa4JMKeGvfjXe/gKXZfQnXxlXwBUtib0jv+mmmq51ja7crNab/rVAYu9G+ByUbLphBNkzzFglEhCF87NQsNDusXMm0yb0LVGgaAV5ZUouH2aHzbIOOjGsZSKJWXq2QFR+aPNk0nlRnWYHR6CXScIvIO5sVeWzDDZ0OrdllFzEworXv59zF7nExiixE52pVA7CYipUyaqZrFB7jJudpF/nh/i3YR/3RI33+cYQRYVy840bwEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199024)(186009)(1800799009)(36756003)(86362001)(31696002)(31686004)(83380400001)(8936002)(5660300002)(8676002)(4326008)(2906002)(41300700001)(26005)(6666004)(53546011)(6506007)(2616005)(66574015)(6486002)(6512007)(478600001)(7416002)(316002)(110136005)(66476007)(38100700002)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzJUa0QwK0FWTlNaazVlUVFDTHF2a1NMTU53U0hHWGZ0bUZmbzNCZHhMTW9v?=
 =?utf-8?B?bTlSOVhaMFhmTXhKZDl6L1VYNGlTdlFNb0paOTZvRGxsc0N6WkR0eEhkcTNI?=
 =?utf-8?B?T2tCZVlTS1cyOG5LY1Z3V2tEUGJZVjE5ZzBZMVd3UlowYmpkbm9mTjdHMnZJ?=
 =?utf-8?B?Y2pRZXZjU3JlWGVxNjhocnNsVjJ5NEtzREp0UDBvYm9DWjhtQVMwV29rK01K?=
 =?utf-8?B?N0FIYlVENG9IZUhkV2gvdjA3aE1ra3JGaEpKanV0Uy9sYTBobVFnRFhFdWZn?=
 =?utf-8?B?KytUVWFJVUt5OE82dHU4Qld0WWtycjVubE9NY2dRMzhVZjFZcEJrN1Q1dERs?=
 =?utf-8?B?ZzV2NjkvOERZRnFBelFyM3JEalcyNHpXMkluaU5hWmtjNWFOZDE4MDBnQXp2?=
 =?utf-8?B?Snhqc2RBaEdEdUhQYkNKcUlCaUc1cWxtL0wxVHZ5T3J1ZzJ2eHYycjB2Rkpr?=
 =?utf-8?B?bThRL1NpcFhwV3l3VGF4UjN3eXpVbUhIVlc2RXdzMDhNZktaSVlRYVRiajYv?=
 =?utf-8?B?K2g0SGxjRHF6NE1lWXVUckdKMjhTaURWdlhJejQ2TjZSSzNRbm01K0syWjNC?=
 =?utf-8?B?MTlGRCt3NTJCVGw0S240d2VUaElQWDU0b3d0cnZseVlGOUlxMTFHQWRtazh6?=
 =?utf-8?B?RU5NZnhkV2VTZ3IrSG9oYmZRQnhkMlZMb1Nudk5NTjVYQzdkNHJjSzQzdnBu?=
 =?utf-8?B?ZC9CczE0eUJ4Y3VKUk9hUUdQOTh2dDFqNjBFVFNOcGFzQmVFYzlHREg4aHlX?=
 =?utf-8?B?eVJ6bzl1eERUSWxhZnFVRThadWx5TEE4bStuQUpRWTFXNnJDcHpsNGxtT3pU?=
 =?utf-8?B?T0Q4N3krdlVNR2tzRW5HdlRzOWExdmVFWTcwLzhDRDJjamJIZTMrWWRrVTcv?=
 =?utf-8?B?UFhiSnBHN1RaYXg1NzBvUVdZeDhzeUlaalU3M3EvUExXYzVPbDRtVkpFKy9F?=
 =?utf-8?B?UXltQTh0NXI4eWc4MENES29HUEtWaGFZR29LOVhEOGdZTXE5VklQdFlYaWFu?=
 =?utf-8?B?SDFneFZVQys0RUNhbnZGcjBQNjgzdWEwWEFhWlVhS2hwWXZaVlZwS0Y3cS9Y?=
 =?utf-8?B?Tkc0QW9YRUdmZEFRV3k4ZFc5NjJYTHBBTEVRNUh5OGFZU3EyK2NISkNkSnVp?=
 =?utf-8?B?MklzcEJQR09tRUtjK0hNV0RYN2RCWXlyVXRNdXRHdW9ERk5EOUtrL0s2WEpp?=
 =?utf-8?B?N05ISzB2VTR3MkRmUXpvcllFRyt0UEg3ZDR4UGdiM0hMRDBqYnBDVkxPMFlK?=
 =?utf-8?B?ZDZJWDJkRFBidG9QSVRqOFhyOXQvNkVzeTdQMnpKQlI4VElwa0FOSzUzWmc0?=
 =?utf-8?B?Q2RTMXU0WVlqQW1nazNJVC9mcmpsbFZUTVRZZmRTOVk4MlVlRWR5Rk1WSHpj?=
 =?utf-8?B?bmVyOFNLWStFSVNxN2VLWXIrRzZlaUluWHIzV2xLdUJQR1lzR25rVFdwRFdH?=
 =?utf-8?B?NnJBeVV6MDNOZzlrN0w5dHFJTFhZL2ZveUVha2hEamxNanNzVmdCdHRzUDFB?=
 =?utf-8?B?YU0weSs3MllRbDFTVkNEcWxSVzAxL3hjVDN6ODREV2plOXpXMjZUREJvK2tX?=
 =?utf-8?B?NkFWczh6MU90Qzk3a0JKc251NS9JM2cyd3pRbWpwQTAwUkpwektyb2QrQld4?=
 =?utf-8?B?Q20zblJLd241T3J2MjdUM3FwYnFGaHFqRWk4UVBUMkNWdXB6c2czOFZZUjNj?=
 =?utf-8?B?Rmpra0xBcUkwZnJPRHY0emc5M2huWVBhalNxOHp1dFdDd0JjNmxBbmR4TGl2?=
 =?utf-8?B?YVpZQnVLYTVzbGRPZ2EyWFFkTGRTK0Y1QTJ3L2x4Mm9HZkloZjFJNzZtdUFl?=
 =?utf-8?B?UHZ5c0NvTUhocCt5RHpQN21LTGZiRVY3dTFrM003YnBxclRaczVtYUhmUjZ5?=
 =?utf-8?B?ckJWYzJYb254aWc0OUs1Szlvd3ZnKzZXY3BUZ0lJdlZ4TXhscDBEeE1wZ1Jo?=
 =?utf-8?B?SHNLaWMrSVpUVHFLVnNzaWxmQmlzTFUzYmJOMWRibnhhN0FmUkdRMlM0alJl?=
 =?utf-8?B?ZWJyVnRpR1ErRXh6WDR2SlVhTUdpbklYUndIN0pLaE90aFI2Qk5WMExCM1M5?=
 =?utf-8?B?bzFYbTdabG9kYnErZWRZbnhNTnBEQlRYc0ZEMFMxUStWQlY2NS9JanBRU0RX?=
 =?utf-8?Q?PIH27iZpR+w81NNGjSgpT72Ll?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7907fcb-73a1-42e4-c95b-08db9f3d6cd6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:17:17.2877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io8Vqz2egN2RflUzqZmkyNNu/G/dlmwoBI9prc6YPZSEDF6dEjZ+zrHWdOqdS6MZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6690
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
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.08.23 um 14:48 schrieb Danilo Krummrich:
> On 8/17/23 15:35, Christian König wrote:
>> Am 17.08.23 um 13:13 schrieb Danilo Krummrich:
>>> On 8/17/23 07:33, Christian König wrote:
>>>> [SNIP]
>>>> My proposal would be to just keep the hw_submission_limit (maybe 
>>>> rename it to submission_unit_limit) and add a submission_units 
>>>> field to struct drm_sched_job. By default a jobs submission_units 
>>>> field would be 0 and the scheduler would behave the exact same way 
>>>> as it does now.
>>>>
>>>> Accordingly, jobs with submission_units > 1 would contribute more 
>>>> than one unit to the submission_unit_limit.
>>>>
>>>> What do you think about that?
>>
>> I think you are approaching this from the completely wrong side.
>
> First of all, thanks for keeping up the discussion - I appreciate it. 
> Some more comments / questions below.
>
>>
>> See the UAPI needs to be stable, so you need a maximum job size 
>> otherwise it can happen that a combination of large and small 
>> submissions work while a different combination doesn't.
>
> How is this related to the uAPI being stable? What do you mean by 
> 'stable' in this context?

Stable is in you don't get indifferent behavior, not stable is in the 
sense of backward compatibility. Sorry for the confusing wording :)

>
> The Nouveau uAPI allows userspace to pass EXEC jobs by supplying the 
> ring ID (channel), in-/out-syncs and a certain amount of indirect push 
> buffers. The amount of IBs per job is limited by the amount of IBs 
> fitting into the ring. Just to be clear, when I say 'job size' I mean 
> the amount of IBs per job.

Well that more or less sounds identical to all other hardware I know of, 
e.g. AMD, Intel and the different ARM chips seem to all work like this. 
But on those drivers the job size limit is not the ring size, but rather 
a fixed value (at least as far as I know).

>
> Maybe I should also mention that the rings we are talking about are 
> software rings managed by a firmware scheduler. We can have an 
> arbitrary amount of software rings and even multiple ones per FD.
>
> Given a constant ring size I really don't see why I should limit the 
> maximum amount of IBs userspace can push per job just to end up with a 
> hw_submission_limit > 1.
>
> For example, let's just assume the ring can take 128 IBs, why would I 
> limit userspace to submit just e.g. 16 IBs at a time, such that the 
> hw_submission_limit becomes 8?

Well the question is what happens when you have two submissions back to 
back which use more than halve of the ring buffer?

I only see two possible outcomes:
1. You return -EBUSY (or similar) error code indicating the the hw can't 
receive more commands.
2. Wait on previously pushed commands to be executed.
(3. Your driver crash because you accidentally overwrite stuff in the 
ring buffer which is still executed. I just assume that's prevented).

Resolution #1 with -EBUSY is actually something the UAPI should not do, 
because your UAPI then depends on the specific timing of submissions 
which is a really bad idea.

Resolution #2 is usually bad because it forces the hw to run dry between 
submission and so degrade performance.

>
> What is the advantage of doing that, rather than letting userspace 
> submit *up to* 128 IBs per job and just letting the scheduler push IBs 
> to the ring as long as there's actually space left on the ring?

Predictable behavior I think. Basically you want organize things so that 
the hw is at least kept busy all the time without depending on actual 
timing.

>
>>
>> So what you usually do, and this is driver independent because simply 
>> a requirement of the UAPI, is that you say here that's my maximum job 
>> size as well as the number of submission which should be pushed to 
>> the hw at the same time. And then get the resulting ring size by the 
>> product of the two.
>
> Given the above, how is that a requirement of the uAPI?

The requirement of the UAPI is actually pretty simple: You should get 
consistent results, independent of the timing (at least as long as you 
don't do stuff in parallel).

Otherwise you can run into issues when on a certain configuration stuff 
suddenly runs faster or slower than expected. In other words you should 
not depend on that stuff finishes in a certain amount of time.

>
>>
>> That the ring in this use case can't be fully utilized is not a draw 
>> back, this is completely intentional design which should apply to all 
>> drivers independent of the vendor.
>
> Why wouldn't we want to fully utilize the ring size?

As far as I know everybody restricts the submission size to something 
fixed which is at least smaller than halve the ring size to avoid the 
problems mentioned above.

Regards,
Christian.

>
> - Danilo
>
>>
>>>
>>> Besides all that, you said that filling up the ring just enough to 
>>> not let the HW run dry rather than filling it up entirely is 
>>> desirable. Why do you think so? I tend to think that in most cases 
>>> it shouldn't make difference.
>>
>> That results in better scheduling behavior. It's mostly beneficial if 
>> you don't have a hw scheduler, but as far as I can see there is no 
>> need to pump everything to the hw as fast as possible.
>>
>> Regards,
>> Christian.
>>
>>>
>>> - Danilo
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Because one really is the minimum if you want to do work at all, 
>>>>> but as you mentioned above a job limit of one can let the ring run 
>>>>> dry.
>>>>>
>>>>> In the end my proposal comes down to tracking the actual size of a 
>>>>> job rather than just assuming a pre-defined maximum job size, and 
>>>>> hence a dynamic job limit.
>>>>>
>>>>> I don't think this would hurt the scheduler granularity. In fact, 
>>>>> it should even contribute to the desire of not letting the ring 
>>>>> run dry even better. Especially for sequences of small jobs, where 
>>>>> the current implementation might wrongly assume the ring is 
>>>>> already full although actually there would still be enough space 
>>>>> left.
>>>>>
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Otherwise your scheduler might just overwrite the ring buffer 
>>>>>>>> by pushing things to fast.
>>>>>>>>
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Given that, it seems like it would be better to let the 
>>>>>>>>> scheduler keep track of empty ring "slots" instead, such that 
>>>>>>>>> the scheduler can deceide whether a subsequent job will still 
>>>>>>>>> fit on the ring and if not re-evaluate once a previous job 
>>>>>>>>> finished. Of course each submitted job would be required to 
>>>>>>>>> carry the number of slots it requires on the ring.
>>>>>>>>>
>>>>>>>>> What to you think of implementing this as alternative flow 
>>>>>>>>> control mechanism? Implementation wise this could be a union 
>>>>>>>>> with the existing hw_submission_limit.
>>>>>>>>>
>>>>>>>>> - Danilo
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> A problem with this design is currently a drm_gpu_scheduler 
>>>>>>>>>> uses a
>>>>>>>>>> kthread for submission / job cleanup. This doesn't scale if a 
>>>>>>>>>> large
>>>>>>>>>> number of drm_gpu_scheduler are used. To work around the 
>>>>>>>>>> scaling issue,
>>>>>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>>>>>
>>>>>>>>>> v2:
>>>>>>>>>>    - (Rob Clark) Fix msm build
>>>>>>>>>>    - Pass in run work queue
>>>>>>>>>> v3:
>>>>>>>>>>    - (Boris) don't have loop in worker
>>>>>>>>>> v4:
>>>>>>>>>>    - (Tvrtko) break out submit ready, stop, start helpers 
>>>>>>>>>> into own patch
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>

