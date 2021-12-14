Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6F473FD8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 10:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D0D10E380;
	Tue, 14 Dec 2021 09:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B5510E37F;
 Tue, 14 Dec 2021 09:51:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgSbRMSJU3fgf+yWdiXQSade8yZR5gNharMOuAvYCiHCPiuDo1gXuVa9yRBCUiZY9CQxld/Mi87zXoeGoCIlTwvIkzE0SGaFLkOxBG3U42FVwwrBETUex3hU58OyR49IyZeylIazJmctKaLXJdXv1IcGXRtbqBaTVWGNWmSA/gIgrH5osPumTZl9EkakyErrmcrNGl+JYltoxndD/0vL7I7a5j5DECm1qnSnA2mOp7pZJEHyh9cs+RwOJ+DJu1cBM5pu63XWm8vmWgQzSoFjSpFaGlQz7VZzmTGxgtrZLAA2REbGKlGDKzIuEI70oBoHIhSLXPMTxbJfLW+8b7ai0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paJeH/CFVEnQdILeHBQ1Nw+QJs+aqZ2uDG5aNA+WkMs=;
 b=jSMnY5XxIfsDZf5gGQp1awSD0Kn33rYXqpSvqaPsYZ802kl5q2ff8/05512c2B9anJJE/kKI40voVHtMfPBYL+w8a0pbrVLVM/j2YGhwQsJmbXV9XtKedZMnE+KNBEueCeKpY9zxQ2xdOn5mI1OSMF/RiIOegU1YJaMafOdYCPRArWWhzE6msQ9TJPGmMzq8gpz7lfOt/BDQh4kTdSjPBbYg2qS8RyZOgn+4oZ6djI5S82bki4VqSBALQHCiYFBgGBLPyBq1kNqxvgpSpCEKjsMDt82ubhmcGsTon+LX3EWvfhmFOiyChchvJoWHwa3UH0Wl9g5qZGrhZQX4r63Niw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paJeH/CFVEnQdILeHBQ1Nw+QJs+aqZ2uDG5aNA+WkMs=;
 b=VA8xrF4CxNyNmf34xqPkR2eC2DZ//JeR+19uxDWukotiDh6A590TT9w3A7kEA8d9QiK9Fe0As8wgdE59hAmB0p/mf3pvD+z431tTGrkd8QxBK8XrhzbGVpmU+AkYglvM4j/kUeU+MDNJH7KFe36bJVRb851o90t67HV5v3i6IVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1614.namprd12.prod.outlook.com
 (2603:10b6:301:f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 09:51:27 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Tue, 14 Dec
 2021 09:51:27 +0000
Subject: Re: [PATCH 1/3] dma-buf: make the flags can be configured during dma
 fence init
To: "Huang, Ray" <Ray.Huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20211213063422.2232155-1-ray.huang@amd.com>
 <5adca96a-e2bb-833a-e470-807a22b9b2fc@amd.com>
 <DM5PR12MB250468603570AFC28C211F56EC759@DM5PR12MB2504.namprd12.prod.outlook.com>
 <152dd115-1155-20cb-879a-d4756146edb0@amd.com>
 <DM5PR12MB25040492913BA8FCA15F18D4EC759@DM5PR12MB2504.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8ccd7aef-944b-0277-f590-f6f9b646b091@amd.com>
Date: Tue, 14 Dec 2021 10:51:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <DM5PR12MB25040492913BA8FCA15F18D4EC759@DM5PR12MB2504.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM8P251CA0018.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::23) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a7f470-2d53-4e08-2e89-08d9bee74bf8
X-MS-TrafficTypeDiagnostic: MWHPR12MB1614:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB16147DE79B66329F20ABC6D183759@MWHPR12MB1614.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OxqtmBRAIhHLiphrpX/wAx8ZzlgO9tiA3EZEenMbcq67i4PBuVFbRShS4WuB2MfOgCdIWqv7x2EiCXbXiH7C+k56Jh9eF1aoqUTMGuBcEbIqmuKl0XgM/4vSP+fo4YYNuN7OCuVRCctKUpK9IQWAQiK7HZvB7G2VhXVtx+FWRpYa4UpH1uG51Ah9Z1nROQ73VF62Z2+vnWMuMhceGrwnH6sx4Q+C4rQpgz3KMAqp7xoaA0x/LqXDtdACOdWclBPMDuPUtZVemidLEpGgRScM31DoTiJ6MwZzYT0hgzkzlXQ0Ve63g4Jor8Gd0TTXy88W5kubfd1YRTBassufj15ll7FOlf4kmUufZrzmCc2+GvkPEkKuYazu5bjHLQjAyRC1FDPV2qztBp7RUOFvbS7feHvw2A3IJ+eL+7mEuGVlDnP+ZUOBjvIzUszxm2LU/iOpU4rAQU2SJc7wSA9qAC2sDqcnX66lPn+1LslXosU4bQsF4UEP6w3rqdYpIpXUUmR5kbZhY9v3JtFPbRlkUSdEW3bAjWtexYPlSM/HwmqEkBp2k+AFP/6XqAOS/uulUwoxTZN9HyGW+lyMVHfneylMFut8q2w74NVBcnkkZylsEZBCvGYIOeHUI72BPYbfPiPebsDVy7y5jrrDRZjO3TSDD11BMg4hcpFehAbU4A9TaFEppgLyIsnZyw+WTKqcx699UwRAKdMaHyJZbw5B65/D1S6d4GmsP3lxI4fC9LwGHYvmcCVjFuPmpZP+WTlD+6eL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(38100700002)(6506007)(8936002)(66946007)(66556008)(36756003)(31696002)(186003)(66476007)(86362001)(2906002)(6512007)(4326008)(6486002)(2616005)(31686004)(5660300002)(83380400001)(26005)(8676002)(316002)(508600001)(110136005)(6666004)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFNGVEJ5MUxaakN6STRBK2hlcUJTYStwR3dpY282dWRKYi92eStWRDBwSkNE?=
 =?utf-8?B?U1NXZzRzQUNpWi9YUHVjc0MyVlRtSWtxTUNTSVY5SnV1Uk1zcnVrOVFJbHA3?=
 =?utf-8?B?VEZ4RVNXWUNRSVVXM3ZwOVZtZVFUMTJacWU5eFRwczdDaExtMmJ2em1OMTZY?=
 =?utf-8?B?cTJlM1hLcE1aamNVRVJBRFF1T2x0WUVnNWhka2IzVjkvQU9Dc1ppM1BaYWxI?=
 =?utf-8?B?NERLdXlydHpYd0ZiVnRGeW9SQ0VvalgxbEJGbnd1T251Y0JkOU9aZG5VWGw3?=
 =?utf-8?B?QlRkRE9NOUt0aVMxc2xKZzA0ZGhUSUtVdGxrSTdaTmZtcktKVXkwYU94aVhu?=
 =?utf-8?B?NmR3NFR0TlgzMlRsZUlUN1NvUVpmbXJ1ZFBROThETTcxZEM1dEdyVGE1S1lW?=
 =?utf-8?B?c1ZSc2gwVEhaTGN3cjNNbHV4TG9qNTNXdGJyK3dhTCtzL09xZHk5dTJLQnlj?=
 =?utf-8?B?UGNwUlVHVUhNVE9zTHRpRlZKMkc2Y1dIbU9WUDV3a2pwNW5lUFhESkF1QzJy?=
 =?utf-8?B?eEVmSW4vaUlCT0MzeUlabUlhU2FjZ0EvOS9mUXlGNm8zcjdsL2oyS1JtTzM2?=
 =?utf-8?B?MWVwT0doMFhrZkxyNk5GSlRqK0FCUDZoTUxxTjA3aGxCL0xpZkl4dzNZS1Aw?=
 =?utf-8?B?UXBwU1JGWTdDOHp0LzRMNWlDcjFxb3RuVUJmc2xOei9ObXU1OHpkckxXeDRM?=
 =?utf-8?B?Y2VnT3pWcWYxcDNiSHJVOU12V2JPTzdWRUVoOURWTVFOOHkzVDArMlJyeG9T?=
 =?utf-8?B?V2x2SnhvSlBEdzJaZk5lSnZEdFhyNkVvMThqajhWbTF6NkNicVdMY2hEamZp?=
 =?utf-8?B?bkhLU3JiS2pHdEExaVQzSll5YmswZXBUM095czdocW1kNmxyTktGbzJpTGNS?=
 =?utf-8?B?ZllRKzM3bHJhMER2VUlhdEVWcEo1MWRtbWNMZFdJZjJnT2tzWVFOaXY2ejBJ?=
 =?utf-8?B?M0hUSGEzYllzaFVkWUpMTytmZE5NVnZ3Ry9CaDlqV2NrZXVpY3plOEROMjY2?=
 =?utf-8?B?V29ReTdiWTVoNDh5d1ZxTzQ1eWpsd1I3WUlVbVBScENtbCs1Ky9hZnpkdHNL?=
 =?utf-8?B?UjY1Ky9UajkxdWhFRm01aDJ1MFhxd0w2eUhHWE9LQjR6bUJWS1drdWhudlBJ?=
 =?utf-8?B?TUNOVGMreTFOc2EvWDlPcWtvK1YrNzhiVnpXbC9TV1pvaytQa3dpbjFCU1o0?=
 =?utf-8?B?RXJQY1Y2YkpDenArMVJMWW9ubzRpamg5S21IUElEdmJ4Qk9BajlsdmEzVURh?=
 =?utf-8?B?dVg2YUJDVU1LQm5iVEU5NXlNa1cvMGttVlF4NC9VMkJrSEc5Wm9XWVFrS0RH?=
 =?utf-8?B?cVBZdS9xeE5WS016OE1MN1oxSXFjMk1vN0N4OGZGYVhxMVZOOGZ2Z1ZRa1dN?=
 =?utf-8?B?elRQWUxSdXJrcERDdmc5Umc2K0tlUnZxK08vQ1czSXBTUUJwR0JWZGVENXdm?=
 =?utf-8?B?SEZOcUpLVnlGanp4L1g2UmtxdWZsUzVSZWdZYTA3eXg2TC9KWUY5U3MzTjVs?=
 =?utf-8?B?dW1NOGJrTmcxLzV1YXlUelQyY0J6RW82dUdsWXNHdzVhaUtmRVZCczlJa3lJ?=
 =?utf-8?B?ZldMQUlsem1JQ2Z3RmNmZHdFUWVsdWl6YjFnWWlJVHBhNXM0SjdXNGhhMXRh?=
 =?utf-8?B?RE9XcE9vTUoxUDZqVGl2eVlDK3BmWXR1b1IybXVYVnhxcGN1VGlCUGRocEp4?=
 =?utf-8?B?WkZFZG0xbUZtOHhMWWlPTHhid08waFl3djIvdzVFZm1oeGp6UEZuVllRTHlz?=
 =?utf-8?B?Wnl3c211c3V1V214UWltQ29iNzViTzRiaDFSZHg3Umt3UVhnWm1sRExFOW9w?=
 =?utf-8?B?Ny9mc3AvaDdDcEJ4TGQ3Nng4TC82MFJDcmNBZzN4UHgwVUQzYWFxMllsbDMr?=
 =?utf-8?B?T3I1Q3NSeHNWQnBWd1ZKcG55S3ZIamF4NG1ScFlYMjQ0RE9Rc0JCQjZsdTNU?=
 =?utf-8?B?QVJhaU9hc3RTcCtFOVRqMlZoM2RaU3VRejRvQ0V6U1Y5ZGFHZ0QyZ0oxSGlB?=
 =?utf-8?B?eEhwc09vVEE2cGYxQ3VWakJlbWRwdjNYbUJBVitsa1FSQlVuWXZzZVNTZGVW?=
 =?utf-8?B?TUhQL2FINXBXTjRHVWNLaXNtUVlLR0JRZDVpQzczUDcveXRWRGlSeklFbXlS?=
 =?utf-8?Q?WgAM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a7f470-2d53-4e08-2e89-08d9bee74bf8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 09:51:27.3433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tV0b3zZ75Hz+8NBgn4RLdZYzc/W4FHsgMGIFQi7EHAnTgE5Yu3643tY32KaIQMSu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1614
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liu,
 Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.12.21 um 10:44 schrieb Huang, Ray:
> [AMD Official Use Only]
>
>> -----Original Message-----
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Tuesday, December 14, 2021 5:24 PM
>> To: Huang, Ray <Ray.Huang@amd.com>; dri-devel@lists.freedesktop.org;
>> Daniel Vetter <daniel.vetter@ffwll.ch>; Sumit Semwal
>> <sumit.semwal@linaro.org>
>> Cc: amd-gfx@lists.freedesktop.org; linux-media@vger.kernel.org; Deucher,
>> Alexander <Alexander.Deucher@amd.com>; Liu, Monk
>> <Monk.Liu@amd.com>
>> Subject: Re: [PATCH 1/3] dma-buf: make the flags can be configured during
>> dma fence init
>>
>> Am 14.12.21 um 10:19 schrieb Huang, Ray:
>>> [AMD Official Use Only]
>>>
>>>> -----Original Message-----
>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>> Sent: Tuesday, December 14, 2021 4:00 PM
>>>> To: Huang, Ray <Ray.Huang@amd.com>; dri-devel@lists.freedesktop.org;
>>>> Daniel Vetter <daniel.vetter@ffwll.ch>; Sumit Semwal
>>>> <sumit.semwal@linaro.org>
>>>> Cc: amd-gfx@lists.freedesktop.org; linux-media@vger.kernel.org;
>>>> Deucher, Alexander <Alexander.Deucher@amd.com>; Liu, Monk
>>>> <Monk.Liu@amd.com>
>>>> Subject: Re: [PATCH 1/3] dma-buf: make the flags can be configured
>>>> during dma fence init
>>>>
>>>> Am 13.12.21 um 07:34 schrieb Huang Rui:
>>>>> In some user scenarios, the get_timeline_name callback uses the
>>>>> flags to decide which way to return the timeline string name. Once
>>>>> the trace_dma_fence_init event is enabled, it will call
>>>>> get_timeline_name callback to dump the fence structure. However, at
>>>>> this moment, the flags are always 0, and it might trigger some
>>>>> issues in get_timeline_name callback implementation of different gpu
>>>>> driver. So make a member to initialize the flags in dma_fence_init().
>>>> Well that doesn't make much sense to me.
>>>>
>>>> None of the dma_fence callbacks is called from the dma_fence_init
>>>> function (or at least shouldn't). So drivers always have the
>>>> opportunity to to adjust the flags.
>>>>
>>>> So please explain the rational again?
>>> Once we enable trace_dma_fence_init event, we will call get_driver_name
>> and get_timeline_name callback function to dump the names in
>> dma_fence_init().
>>> At that time, the flags are always 0. However, in
>> amdgpu_fence_get_timeline_name(), it will check the flags
>> (AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT) to select which way to get
>> the ring.
>>> If the fence should be actually embedded in the job (will be set after that),
>> it still will trigger a kernel panic (please see patch2) because it go with a
>> wrong way. Because we cannot set the flags at the start of dma_fence_init.
>> That is the problem.
>>
>> Well then I think we should fix the whole approach instead because what
>> you try to do here is utterly nonsense. You can't modify the ops structure on
>> the fly because that is used by all the fences.
>>
>> Instead please just duplicate the amdgpu_fence_ops() and separate them
>> into two structure, one for each case.
>>
>> This way we should also be able to completely drop the
>> AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT flag.
>>
> OK, you mean this flag is not one of them in standard dma_fence_flag_bits and it AMD specific, so we would better to drop this to align the dam_fence structure design?

Well yes and no. We can use driver private flags, it's just that for 
this use case it doesn't make much sense.

See what the functions do, for example amdgpu_fence_enable_signaling():

        if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
                 struct amdgpu_job *job = container_of(f, struct 
amdgpu_job, hw_fence);

                 ring = to_amdgpu_ring(job->base.sched);
         } else {
                 ring = to_amdgpu_fence(f)->ring;
         }

         if (!timer_pending(&ring->fence_drv.fallback_timer))
                 amdgpu_fence_schedule_fallback(ring);

         return true;

That can much cleaner be done as

static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
{
         if (!timer_pending(&ring->fence_drv.fallback_timer))
amdgpu_fence_schedule_fallback(to_amdgpu_fence(f)->ring);
         return true;
}

static bool amdgpu_job_fence_enable_signaling(struct dma_fence *f)
{
....
}

If we want to avoid the duplication of logic we should just move the 
timer_pending() check into a separate function.

Regards,
Christian.

>
> Thanks,
> Ray
>
>> Regards,
>> Christian.
>>
>>> Thanks,
>>> Ray
>>>
>>>> Christian.
>>>>
>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>> ---
>>>>>     drivers/dma-buf/dma-fence.c | 2 +-
>>>>>     include/linux/dma-fence.h   | 7 +++++++
>>>>>     2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence.c
>>>>> b/drivers/dma-buf/dma-fence.c index 066400ed8841..3e0622bf385f
>>>>> 100644
>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>> @@ -952,7 +952,7 @@ dma_fence_init(struct dma_fence *fence, const
>>>> struct dma_fence_ops *ops,
>>>>>     	fence->lock = lock;
>>>>>     	fence->context = context;
>>>>>     	fence->seqno = seqno;
>>>>> -	fence->flags = 0UL;
>>>>> +	fence->flags = ops->init_flags;
>>>>>     	fence->error = 0;
>>>>>
>>>>>     	trace_dma_fence_init(fence);
>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>> index 1ea691753bd3..f9270c5bc07a 100644
>>>>> --- a/include/linux/dma-fence.h
>>>>> +++ b/include/linux/dma-fence.h
>>>>> @@ -131,6 +131,13 @@ struct dma_fence_ops {
>>>>>     	 */
>>>>>     	bool use_64bit_seqno;
>>>>>
>>>>> +	/**
>>>>> +	 * @init_flags:
>>>>> +	 *
>>>>> +	 * The initial value of fence flags (A mask of DMA_FENCE_FLAG_*
>>>> defined).
>>>>> +	 */
>>>>> +	unsigned long init_flags;
>>>>> +
>>>>>     	/**
>>>>>     	 * @get_driver_name:
>>>>>     	 *

