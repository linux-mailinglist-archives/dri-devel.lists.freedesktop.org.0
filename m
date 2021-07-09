Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6203C2094
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 10:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF68F6E9E3;
	Fri,  9 Jul 2021 08:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EF96E9E1;
 Fri,  9 Jul 2021 08:12:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPl3nLWyhF91z6sVte+AsR/wBUCpJq8XXf/N/duC0kkAuo9vGrPiMTNQyXFRoK2e8dxpRl0/xjGmadhgK3FYHcFlY+NTu0A5uMvZmTS66S3x9EHSQ/8IoYZ3CZSJlH4oP+DivQM6aiaJliPT1MFuSWASxQtj9IragznSbowE1qoQk3rgRlfhvmfI2mec50cgP7uk9Mda12nCi0rx0Zazx7DAyehlQEEVPsq82y/jGttY5Qcb1mOPpa0VBYgPmUUaty7CyMmInS/dvavm6l2cjF7YDwOQ6Yp/LnRMV6iPCx+Y2pUizuHjR6aaXgUZ9zVdtOFZ3QO6xGFECUJfZVkivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQtP5LKf39chchhBLHT73u9NKFDRbbWbAC0EcGk7zgY=;
 b=LQBIpjonYD77xqLSw6lhTpsDPDWb+39LC0EjGp3cDuWg0jRdxDUrF9rUEFJAMd7GihKAvf4+Dq3V6KigD3rOV1lY4e2YXoorImwNBBmvvB/09JBJjq3QSjhCAjqhHYP4YNR2kA5qQk3FIT/KdzwxXaDKo140IvqWjDALRkZaZVDCzt3Y3oo0sU/wY1hdDyX2X+mxYDMaFYyBNv1d9VcDPtNfe9weQnsxnkhIVG3Ud5o2t7b2zgOqq4vKVs/+rqyKacoPB/7wu8Cr/PQpK4iBU+VkJWWfGvBM19McLhvGY79afzYegTmVxSW6buQs5dYbsOokMBCfwplz2Eoo63jFGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQtP5LKf39chchhBLHT73u9NKFDRbbWbAC0EcGk7zgY=;
 b=uXvhA16CfVeeVn9OfKZMkIHK5ypTtao0hIhKlYy4rI6mZ/dcuNwHlgBljjmCiBoNfsP9ssXmtiAehUsHVE7cu9wuvZQYZpX+3DwM2MXC3q8CWX+lHAaAR0sCV7iJ0TR+YkPnVs/DQ5HEW/bd05xkKVZos5lCE96bEjmOVxS/Lvg=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4708.namprd12.prod.outlook.com (2603:10b6:208:8d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Fri, 9 Jul
 2021 08:11:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 08:11:54 +0000
Subject: Re: [PATCH v3 01/20] drm/sched: entity->rq selection cannot fail
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
 <20210708173754.3877540-2-daniel.vetter@ffwll.ch>
 <5588d1c3-833b-bd95-69e6-a103f2e8affa@amd.com>
 <CAKMK7uFuqXdbvqDCerXHW5kiT=LUZEoyrjFMgHjkUQdS1eidDw@mail.gmail.com>
 <871a4619-8a17-134f-9d9c-40a522473946@amd.com>
 <CAKMK7uG8ODwoPz8ztBfn=iBn8iWUOfrMxPkauuAHc=XktoCeGA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3e86fcdd-cfb8-29c0-babb-94aea41b6b4f@amd.com>
Date: Fri, 9 Jul 2021 10:11:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uG8ODwoPz8ztBfn=iBn8iWUOfrMxPkauuAHc=XktoCeGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P193CA0035.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::10) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3da0:55de:64af:96f9]
 (2a02:908:1252:fb60:3da0:55de:64af:96f9) by
 PR3P193CA0035.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 08:11:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fda15103-8449-44f8-b20f-08d942b1367c
X-MS-TrafficTypeDiagnostic: BL0PR12MB4708:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4708CE4BCDB37D813AEF056283189@BL0PR12MB4708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gY0q2LCBKsk3gYFuQxzubJAhGQT6uZxZ3tzulMhWdX+yYi9Mqr+JTAHr0ldjhEI+smH1LgezUGRSSKHhfnK3E7OICG6DbYeTklJEERT+5QVqQqgIVuJWQCW8kZQM1IGDRwYRE1wcOWPPiK4VYKKxJI9nf6Kiet2klwLYywiJrnVVSv+CTqpDMUntO5b7mK5381dOqERVJY6NQNFbXxPSImV66cQUD2ciy0Vu6VC51onc+ZKEbvqzuuzJOPWlKme2TeAXjdbuyY4bqtH0M3bFzs5QkBnEHv6kGIRyTyD+T36mGCSPhibj9QZbaIm9Lo/d7aFH4U2pIEND7+GwV6VNDJD2Qh7hrlYZX39TlhGcPzNnRqFtLdN4SvgQ7t36NpNs5jwXQKNajgTEGmdhvCj3ZrvD+GfA0zLM0NrGrp0NadZcGOKFoez6Sydj9MU0p+y8REsIqzYd2lrSeRJNqqQkX0LBG5rP2Y1kbL9blF4zeyImbdmwnfSbgo/3HKMHKhjj3mTuf894nUWDRVt2ghpiI3lm8xDDglSvYcLfOcqgsleR5x1PVbE/Q5uPuQSzWAaqYxOwlyLX5JOGMLaLSLXD1QLQTVcQLcHFfidm2Fqx1nD0QBPDjZ59wuIuz0xL6w+8TZviIyvtEcOnMHEIkhg2bol86eBjD3zTOKQituBVsNgCY67y2kt3eMv0apNsibhCQeVJb4Mj+9O8wWLv8X/yUZy5itrS5yEVq1g+IWWkLQrxmzTitbvPvc0zCHxAbrUQbx4njUOvCiq7MY2r9l5561ea1VQ2ZqUWblVly1TbCbKt54SazM2HaNs86xc3jEqKyC8NHeQK0fkalZNblhucKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(39840400004)(346002)(54906003)(66556008)(66476007)(6916009)(5660300002)(31686004)(38100700002)(966005)(66946007)(8676002)(4326008)(66574015)(316002)(36756003)(6666004)(2906002)(2616005)(478600001)(8936002)(53546011)(45080400002)(83380400001)(186003)(31696002)(6486002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ZZeWpxZjhFRUoyMFVoaWVMQnBmdFl0MzRQMk1hVW11WDh5Z1VpbVZWYXYx?=
 =?utf-8?B?N2xyQ05FNnFxUVA4ZDJpNmtuekRXOWVOZUNYL3hwRUNjL1RLaHVmL05RcXdF?=
 =?utf-8?B?bCt3V2htQXpOZ24ya3NPOHc2UlFrWVFOcVBhQlB3T2xDNlRFUHlFNHpkK094?=
 =?utf-8?B?SFl3bTkwbFRmTVpSMFRtUWcrajc4ek9Db21aU0JZK2c5V1Q4L1R4bHdKZnNE?=
 =?utf-8?B?RGFxNTFENFFjdjRISXdnUXc0VTBDeG5DU0NGT2RWaVVIV2lablZuMENHemlk?=
 =?utf-8?B?Q0pqL2hQcDJwZFpUU1JLdlRhVDBtSzRVQTlXOHp1NnQrS0VPWlUrTk5ra2VH?=
 =?utf-8?B?NzdheGJUYkVOQ0lxU29CQzh1UGZSNzVUTTdmZmJjSEtOeUNvL1JqRStxeUFm?=
 =?utf-8?B?T1p4NndDNnBOUVpEcmQxdUpOZ0V5cUtoa0R3d0VCVHlNTlJESDRuY2xzZTQr?=
 =?utf-8?B?WmMzR05YTHJHRkkrREx5dy90WWoyQ3ViT3JEVlF2bVBKaUY0dDFGYVhVZVJt?=
 =?utf-8?B?WVB0Rk14WUI1dkRNNWh6QmVTdHIvdFk4cTNjRFlIZ29jaktaR3dFMlV3ZlBw?=
 =?utf-8?B?SzFUN1YrNzR6SmNraXZSajdBbGNKQ1RoNmptc2pRYnFEZmhscVYybSt1QVoy?=
 =?utf-8?B?K2I3RlNDQnF4ZHFlNlpha0xOSTNVVTNVRTlEaDZxRnJnbEtvREZaOGlxWTMr?=
 =?utf-8?B?VHEvejRFdDAwc3l3cWpxRk50N0JRVGVMWnZxaFFVSXJCeEV2ZG1pcWFhZkh1?=
 =?utf-8?B?cENmMFZKUVB1MmRrU3Z6QitBOG1sYTN4RGtsZEFTZVkyOXNZaDFJNVNnQU1o?=
 =?utf-8?B?ZHNubHduQ0JKY0FQUFliTVI2T3FaVEZOdDdBZ1J2TGtwOVYwc1FCNVg4Zzhs?=
 =?utf-8?B?bzc4TFRQa1RxVHo2V0RYZldaYThDRWpuUGxnN2dNUDBEejJSdjBpdTFEOVdZ?=
 =?utf-8?B?NU1makpKTThHbFB0MGdIYUJqQlRjN01rdk1PWTdNWk5YV0RTMG1nNmREbEFS?=
 =?utf-8?B?VzBYcVVSbWxSNEJ1dktQUnArOU9pY0p4L2prMVUwZHBJVjc0ckVXL0NtUkUw?=
 =?utf-8?B?VUdzTy9heVhCbG13M0lLak50TFVmeHhrNE56WG9ndDVnRDNtQTQvQ3JyQi8v?=
 =?utf-8?B?M1NBVnpmYzVvTXFCNlVjb29NY0t4RCtINDk3SVBQUFUxT1E1a0pHbWVkM1Ar?=
 =?utf-8?B?c0hpZ0lFSlhUUUtvc3JTVFRpa2N1bW1vUjRheHhQL0tPRHVUWkt4QVgrWW5h?=
 =?utf-8?B?ZHltK3BwQ2VhVG12dUFRWTJ3c2VuSEpoRHhmMEJ3ZzMrcUxTZlNDa1VWL1ll?=
 =?utf-8?B?WjZvWGhITVlTZnhVYWovZm13Vk5GQjQvc3Q2KzlQV0dhemk4UDQyOG1YeDNH?=
 =?utf-8?B?endWVW9nTE41SnlCNmhvZjJCTGxkTFJhTVYwRnpTUUhUamsxMnlUem83WTc1?=
 =?utf-8?B?ZkNLMnYvakw0dzE4eklob1R1SldxeWUxMkVvVTBSTUVXMDRiOFBiV2I4UVJl?=
 =?utf-8?B?OWN1Mkk3TWVoZWtlSWRLWWNYaG5zNlNxQytocTZiL29FNExqOTJGK3krNE1C?=
 =?utf-8?B?Q0VVaVo0NUZ4cTFXbmpSQ1A3bzhqR0dSa2xwcW5jQkRQNUdISXdqT1MxWksx?=
 =?utf-8?B?Q0pUNG96cVZjaDlSbUVkeXRML0tPSWQ1d3IzU3laaVRUYlI3MUk5Rkl2bjg1?=
 =?utf-8?B?VklJQ0FGZUltNksvbUJVMjRjQUp5eHJMeFpOdG9oMFBrNXlSY0VEUnpmSWJB?=
 =?utf-8?B?eU4xeVU2N1ZnZTQ0aGpISVNVSFN4NHViQ011cHZ0dlFTRGVLWnpuTmg1WnZQ?=
 =?utf-8?B?Zm9Nb2lvd1hCc0VTOWsvNHlMRFdBQlpLSGdGTktZTGFaak9RL3ZCNW1kVnlu?=
 =?utf-8?Q?4T8mgb5dc9cj1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda15103-8449-44f8-b20f-08d942b1367c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 08:11:54.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q34rjrYr6w/LArpxjG8yAgSTtO2+9zYVa1qHbKNOmmDVn/RXM5kM/OmEDqwfzzxV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4708
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.07.21 um 10:00 schrieb Daniel Vetter:
> On Fri, Jul 9, 2021 at 9:23 AM Christian König <christian.koenig@amd.com> wrote:
>> Am 09.07.21 um 09:14 schrieb Daniel Vetter:
>>> On Fri, Jul 9, 2021 at 8:53 AM Christian König <christian.koenig@amd.com> wrote:
>>>> Am 08.07.21 um 19:37 schrieb Daniel Vetter:
>>>>> If it does, someone managed to set up a sched_entity without
>>>>> schedulers, which is just a driver bug.
>>>> NAK, it is perfectly valid for rq selection to fail.
>>> There isn't a better way to explain stuff to someone who's new to the
>>> code and tries to improve it with docs than to NAK stuff with
>>> incomplete explanations?
>> Well as far as I understand it a NAK means that the author has missed
>> something important and needs to re-iterate.
> It comes around as very screaming at least to me (all uppercase and
> all that) and personally I only associate it with unchecked angry
> kernel maintainers on lkml celebrating their status and putting down
> some noobs for shits and giggles. I think here on dri-devel you're the
> only one doing it regularly.

I've learned a different meaning for this.

A NAK in communication means that something was missing and you should 
re-try. E.g. think about RS-232 ACK/NAK mode.

>> It's just to say that we absolutely can't merge a patch or something
>> will break.
> Well yeah I know that when a patch breaks something I can't merge it.
> For drm-intel we also documented that clearly, but for drm-misc it's
> not spelled out. I'll fix that.
>
>>>> See drm_sched_pick_best():
>>>>
>>>>                    if (!sched->ready) {
>>>>                            DRM_WARN("scheduler %s is not ready, skipping",
>>>>                                     sched->name);
>>>>                            continue;
>>>>                    }
>>>>
>>>> This can happen when a device reset fails for some engine.
>>> Well yeah I didn't expect amdgpu to just change this directly, so I
>>> didn't find it. Getting an ENOENT on a hw failure instead of an EIO is
>>> a bit interesting semantics I guess, also what happens with the jobs
>>> which raced against the scheduler not being ready? I'm not seeing any
>>> checks for ready in the main scheduler logic so this at least looks
>>> somewhat accidental as a side effect, also no other driver than amdgpu
>>> communitcates that reset failed back to drm/sched like this. They seem
>>> to just not, and I guess timeout on the next request will get us into
>>> an endless reset loop?
>> Correct. Key point is that there aren't any jobs which are currently
>> scheduled.
>>
>> When the ready flag is changed the scheduler is paused, e.g. the main
>> thread is not running any more.
>>
>> I'm pretty sure that all of this is horrible racy, but nobody really
>> looked into the design from a higher level as far as I know.
> Yeah the scheduler thread is fine because it's stopped, but it also
> doesn't look at sched->ready, so it can't race. What does race is new
> submissions, and if they stuff something into the queue then I'm
> wondering what happens to that. Also what happens to the requests
> already in the queue.
>
> Eventually I guess userspace notices the ENOENT, tears down the
> context, and the kernel then also tears down the context and cleans up
> the mess. But it's rather inglorious until it collapses down to a
> coherent state again I think.
>
> Or is there something with the scheduler restart flow which is
> guaranteed to catch these, and we're maybe just missing a bunch of
> barriers?

I honestly have no idea. Never looked so deeply into the big picture of 
this.

I've just tried to play fire fighter and stopped people from touching 
the flag during GPU reset when it isn't necessary.

> Either way I think a proper interface to terminally wedge a sched
> would be good, so that at least we can pass back something meaningful
> like -EIO. And also tell "the gpu died" apart from "the driver author
> tore down the scheduler while it was still in use", which I think we
> really should catch with some WARN_ON.
>
> Anyway for the immediate issue of "don't break amdgpu" I think I'll
> reshuffle the split between job_init and job_arm again, and add a big
> comment to job_init that it can fail with ENOENT, and why, and what
> kind of interface would be more proper. i915 will need the terminally
> wedged flow too so I'll probably have to look into this, but that will
> need some proper thought.

Yeah, the functionality is absolutely necessary.

Regards,
Christian.

>
> Cheers, Daniel
>
>
>> Christian.
>>
>>
>>
>>> -Daniel
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> We BUG_ON() here because in the next patch drm_sched_job_init() will
>>>>> be split up, with drm_sched_job_arm() never failing. And that's the
>>>>> part where the rq selection will end up in.
>>>>>
>>>>> Note that if having an empty sched_list set on an entity is indeed a
>>>>> valid use-case, we can keep that check in job_init even after the split
>>>>> into job_init/arm.
>>>>>
>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
>>>>>     drivers/gpu/drm/scheduler/sched_main.c   | 3 +--
>>>>>     2 files changed, 2 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index 79554aa4dbb1..6fc116ee7302 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -45,7 +45,7 @@
>>>>>      * @guilty: atomic_t set to 1 when a job on this queue
>>>>>      *          is found to be guilty causing a timeout
>>>>>      *
>>>>> - * Note: the sched_list should have at least one element to schedule
>>>>> + * Note: the sched_list must have at least one element to schedule
>>>>>      *       the entity
>>>>>      *
>>>>>      * Returns 0 on success or a negative error code on failure.
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 33c414d55fab..01dd47154181 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -586,8 +586,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>         struct drm_gpu_scheduler *sched;
>>>>>
>>>>>         drm_sched_entity_select_rq(entity);
>>>>> -     if (!entity->rq)
>>>>> -             return -ENOENT;
>>>>> +     BUG_ON(!entity->rq);
>>>>>
>>>>>         sched = entity->rq->sched;
>>>>>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cb9b28b2956e14b4aa4d008d942af9c86%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637614144309261704%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=nLQwH3aealjdS0cPWLqSUvwTmx2pQa1%2B5B%2BSKpLY%2BHE%3D&amp;reserved=0

