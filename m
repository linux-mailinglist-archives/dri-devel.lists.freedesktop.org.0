Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B8E3B34E6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1A06EC70;
	Thu, 24 Jun 2021 17:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA486EC70
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 17:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKiMtOySVbHf6PxktZzEM6gTs3Ai1E580v/jUIMN1PuMUdOPLOlaZ1lblJ7+kiD4k6kP2J3iswJX6daLpjt4Msbf4JZISplBz5qC/4x81vBPYPXnuc/qur0dtHZSymRrUyFSmG6ZRZWPgLUusUmblaPqkPVMm+LbRlki5Htup6dINslv2DHZexX6xWSfc4uY5aaKqEWSLCgM7ETytmcshmGdWwrYvJU5dT0+4ds1g0nJgXu2s9WAD0V3oPqVV9hzcZHkt6RMn/KUxynXED68GKaZQb8/Nqr3YgTbfDnWeqTs3s+dAXch4QtJx0N7672g4nQ85XPoXB6yPf81qUs9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYOvskiXd7MhEnNtXyw2BtWa8lbFmP22KzTzQtsObWA=;
 b=EF6Gfy1IO71QxzWT91zMCdTHRPNyRTWYNVNU2hctQ8MwFdLs9Pye/lV4aG0LiXb9osq2KR7Soyb5oRYS/QjvWAhw+Tay/foI33CpheE0+UeXhCc9N+fXyUTNuba49Efh1YWje2Af6Al8xACk3vihHHZYlf2hvl1dfYHxood2YZeaDfCoJ4H41ZfoaLbES53sjhRYuHvXNeaR3JxzWYyko2kIzf/EVBHnNhZfwr6eh+VFMdqrx3MLjHc5u+EDbFy32MxQfs2amGrtzkXF0izGKWkHX/ys4tJmFIkeTi6qXEf2ov6uZh603fYFsygwZ4orHoEIkxy8M7zvrdvXI1KzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYOvskiXd7MhEnNtXyw2BtWa8lbFmP22KzTzQtsObWA=;
 b=zUpqNTaVLwA20/I6+A4i5oUBzAuCvPN0UVaapCNviqsUFaerewmObKO7S2Sm82MsnD1v6aVXw8TCWVci3ngCCStGf9CYHGUvGJHES2b3By9DtIAVtlb7J/YbJE8N4nOQw6MbJ8VONZ9SlARRpZC1BO4eySVQGvbe1t48b4y7zec=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 17:38:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 17:38:19 +0000
Subject: Re: [PATCH 10/11] drm/scheduler: Don't store self-dependencies
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-11-daniel.vetter@ffwll.ch>
 <fa721d0e-46d7-b5f3-f846-560b8dad4e58@amd.com>
 <YNTBC04wfQ7ItRq7@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <811e5816-c9d7-72b8-2836-a3d1891bb762@amd.com>
Date: Thu, 24 Jun 2021 19:38:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YNTBC04wfQ7ItRq7@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c089:94ee:b4ef:e121]
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c089:94ee:b4ef:e121]
 (2a02:908:1252:fb60:c089:94ee:b4ef:e121) by
 FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Thu, 24 Jun 2021 17:38:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32ac6b12-7d21-434d-ea0c-08d93736dabf
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4551F5D83F3BFD80977AFCAE83079@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Trwe4uibT3kuljQDFMGXFo3Fl/NKnU2IHY315I2tPG+3yPriaQr52KoCs476lAwDo4xF8xxrmrTaO8VcXikaEXTd70gBw7TdxmJmBeSdaHNuDmQ2rYNFyRblhND+AyRLU+S1WaYN31pO/n4GBrQhTxk5Qr973SD1htgCEU+S2l6hSkvWA0NNjlpHgUDaLS1Ko2bfX/Y1toTT6i3Wz+9OJt9jzqiWV10YR4XcfxWp+ECu3hQrANVyG38ruodEl52t8R2s1cinUtRLRxUmLwN1aHs0N8u8/TpMc0wEmsPjIR5xDfs/L+I4mc7RNnmJXbYaw416b8JcNueeAlrpCrNdmMNNth8ha/wKL/xgvKsEmy0lBAQUJHPEMoHpf4y8gtj7WhLnmeCAL+CqzP8be7DhOoOurLAHSDoY/F/ev1ZWYQT4DvyLr1EDOg5r0OGHyqJ3lKqibhKuURDu86U7JHUUxr/g/pDhSFIW9oqBqCqHZPQ42jBHSbmyj/ruE51VIDwH/jSiEQHZVyIkJPgbUIn2Zla3ry8Yjg6rzAQUnqSuLAn6zGjoZYPrA1dc+GW2/yjJeSG4z+/9yMJfkewXhOV2pBM5jfWsS/wKJIwrvjai3MWNhVH53GhSd0h00MHlb5zfKumca7rUXq4OwjgsdpDzANN48wH9fYKky9FOKb8S8lxXL4L7n5QL5toyxfpWYlx8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(6916009)(38100700002)(54906003)(2906002)(4326008)(86362001)(498600001)(66574015)(66476007)(66556008)(6666004)(66946007)(36756003)(8676002)(2616005)(8936002)(186003)(5660300002)(31696002)(16526019)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk9XUFFJaVBVa25mbWV6NDFWRVNibTRyUlRaMjdiaWMrUEVEbGwraDQ2QzJI?=
 =?utf-8?B?OTcyelk0ZERRRlhqaWl3SXlLZEU3QXJKdXAzSmxnN0FSWlBPQ0RWRTVZZ2x5?=
 =?utf-8?B?dnBoUW14U2Q5KyszL0RMUnl0QVMwUTFOVUxzc1ZjWjdtYnNXenFHR09sMFFi?=
 =?utf-8?B?cjhUL25IdStaVHBKK2FmQ09GM2NBZWlvOFc1akV2TE56TmdwVWwwWGpIeUlU?=
 =?utf-8?B?Q2oyb2t2NUU0S3NhamtUYVFGUkFrL1R3L2J4ZFZKVStqamx1emtwYVh1VUdC?=
 =?utf-8?B?cU11WldYR1hvN3lvNjh1VWRsRUgvUVNiZFRwV3NYK1ZTcHphZEFUZkdwUE9O?=
 =?utf-8?B?WUVNRXBrY29pbHI0cG9qanM1ekVxR21CbDRyTmtJQ0hvREJIdEw4OUd0WjJm?=
 =?utf-8?B?MmJMUVZRaCtsM3pUTnhHTjNZalFhNXk3U2F5ZVlHdXlPT2JzT2pzRnBxbDFx?=
 =?utf-8?B?YTZWdHVMVjErcGNrUlVOR2F1aHFIQW9aKy8xSGx2ZXdUcnd3NVZOc0hLSWMv?=
 =?utf-8?B?amZOS2I0czdvM3NtUzFWYVlPVGpGVmd6R1ZScU9iTTBOYXdveVQxSzllNmcy?=
 =?utf-8?B?K1NUSm9zMnBVblg5d09DTnFDQnhRZm1sY2hXZFlUV3I5V2VCaktubVFydTM1?=
 =?utf-8?B?MVhBMTA0QVF2TnEvSzdMazZqVzdUclNlWnRqY3FLWThheTF1YzV2WFNHSk5P?=
 =?utf-8?B?UWkvZ1BYdlRSZXhMVFRmTXRjM0NHTFpnclBnYzJzTDFsbVpPZ1UvK1dXSXpY?=
 =?utf-8?B?aFZ0U0xXUUNlUGUxMXVqeS9nVGN4aVlsakxaVloyTnhjdVZ3NlRYK2RZcTdl?=
 =?utf-8?B?bm1VeXhaU2F3NnE4dTBXMHQ4Zk5pdDdNTUpEU2lIYnYxclZLTDFEZlRTZjJB?=
 =?utf-8?B?S1lpQWQ2Z2NFT2RrOUdVQ1B4OWI1ejVtd3N0OFBSSDZIdS9WdHFEajlsOG1l?=
 =?utf-8?B?UXhZakdzRFJFNitPNjJCZTJsU0poM1RhaXJhQ1drUDZWRzJvYXFTdVJrQTBX?=
 =?utf-8?B?NEV1VTFTWS9Relg0K2d6QzJsSzlwK3RCZWJQZTRIWDRLS2UycFd6Y1A2T3NN?=
 =?utf-8?B?b2kxRVFDeDZVSk1hcWRXRUVmam9vdUZ6dlZBYmVCK2xCRGJPL1F3TnZsWGg3?=
 =?utf-8?B?RTAxTEdGUzJvRy92Z2d4MVFmNEdCT0tUYUQ0R0ZpdHYzWC9zdXBJenZHMmdp?=
 =?utf-8?B?eGZPMU5vMEp2VHZDYWlJdTl5dFpsbzBSTkVXVlFCYlBlSVdRVFdVc1NBREFY?=
 =?utf-8?B?S0pjRHVKSEhCWmVobFNVK2ozU0RWcWZYZDBtYXdwRmQxV0s1WTB1aVd0TGlo?=
 =?utf-8?B?K1hBaHRzYTNuenF2U1RkRklGSXhxTk54eTcvT1BaOEh0M1oyS3E2RXhBNHVB?=
 =?utf-8?B?Y1U0bnZyMVNvUmZGNytTd0RoUGsxaW5lWGlZdEVROFZCL3RMdm9DNnZhMmhj?=
 =?utf-8?B?cCthaTQrZm5zRXZ6RHRzRzQrQ0FZSm9jNk5PWXVjTHlZbHBjU2NuQnZrREdV?=
 =?utf-8?B?eGtCUGJ3bGVmeVk0bE80NUJzOEVNYkJpSTkzandHR3c0YStVdXhWd3ZNRWFx?=
 =?utf-8?B?aXVoeEpKTHVsMHlnTWtVRkJvMFc3WGNsejJxRkYzaFR0b2IyTG5oL0dCMHYy?=
 =?utf-8?B?MnlOaFhCQXJhQ2dHUDJISm5wRGpqOWxOajF5OHd3ZTlxaDBLdm1yWmptY3hH?=
 =?utf-8?B?ZXIzbkpsMXFXNDJjRGVHSkU5WXRnZU5WVzVSQnAxck9TcGgrQ0VsMGNaY0xJ?=
 =?utf-8?B?UVBxbklwUzZWMVBOT1FaamNsdnZWWk52K3g4VWFHcjRWVjd3VWVOQlN3T1Ux?=
 =?utf-8?B?ZVZmdDg1MnRGR0FEclEzMUdLbFJmaFB6c2tDQXBNZTN2MnU3cjhnWkc0V0RH?=
 =?utf-8?Q?e14++vjOYHaND?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ac6b12-7d21-434d-ea0c-08d93736dabf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 17:38:18.9356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InuMO/wfXrHf7PNi1tHpsK1VVuJzJ/Uhroq3vK07R9euVj4QITk2EO4zRe58JFK3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.06.21 um 19:29 schrieb Daniel Vetter:
> On Thu, Jun 24, 2021 at 07:03:10PM +0200, Christian König wrote:
>> Am 24.06.21 um 16:00 schrieb Daniel Vetter:
>>> This is essentially part of drm_sched_dependency_optimized(), which
>>> only amdgpu seems to make use of. Use it a bit more.
>>>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 370c336d383f..c31d7cf7df74 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -649,6 +649,13 @@ int drm_sched_job_await_fence(struct drm_sched_job *job,
>>>    	if (!fence)
>>>    		return 0;
>>> +	/* if it's a fence from us it's guaranteed to be earlier */
>>> +	if (fence->context == job->entity->fence_context ||
>>> +	    fence->context == job->entity->fence_context + 1) {
>>> +		dma_fence_put(fence);
>>> +		return 0;
>>> +	}
>>> +
>> Well NAK. That would break Vulkan.
>>
>> The problem is that Vulkan can insert dependencies between jobs which run on
>> the same queue.
>>
>> So we need to track those as well and if the previous job for the same
>> queue/scheduler is not yet finished a pipeline synchronization needs to be
>> inserted.
>>
>> That's one of the reasons we wasn't able to unify the dependency handling
>> yet.
> That sounds like an extremely amdgpu specific constraint?

Yeah, that's totally hardware specific.

It's just that I don't know how else we could track that without having 
the same separation as in amdgpu between implicit and explicit fences. 
And as far as I understand it that's exactly what you want to avoid.

As I said this turned out to be really awkward.

> You're also the
> only one who keeps track of whether the previous job we've scheduled has
> finished already (I guess they can get pipelined and you don't flush by
> default), so you insert fences.

Yes, exactly that.

> I guess we can add a await_fence_no_dedup or so for amdgpu, but I'm not
> sure why we have to inflict this design constraint on all other drivers?
> At least I'm not seeing anything in lima, panfrost, v3d or entaviv that
> would break with this, and i915 will also be perfectly fine.
>
> Also note: I'm not using this for amdgpu, exactly because there's a few
> funny things going on.

Yeah, exactly the reason why we never unified this.

Regards,
Christian.

> Finally: You _really_ need explicit dependency handling for vulkan in your
> uapi, instead of the kernel second-guessing what userspace might be doing.
> That's really not how vulkan is designed to work :-)

>
> Cheers, Daniel
>
>
>> Christian.
>>
>>>    	/* Deduplicate if we already depend on a fence from the same context.
>>>    	 * This lets the size of the array of deps scale with the number of
>>>    	 * engines involved, rather than the number of BOs.

