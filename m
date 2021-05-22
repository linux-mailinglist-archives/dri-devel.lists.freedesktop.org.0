Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB79138D465
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 10:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EEA6E145;
	Sat, 22 May 2021 08:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892766E0DE;
 Sat, 22 May 2021 08:30:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TC2rV0f8xRZ+wSMU8A0W4mWfLh91dNy/lxkUI719/PhmpB3d4ods3kwrsUry0hpN9tVsMZWEtBDT+WtRdCaXV6S4V5MsIQQmamfaGPWVF9i2CVG3I/yzxC8ZszyKgsj9ZGCl2hkmNmg0lWG+5uaVjvXV7qRaWU2nEnp60v3tl6aeNCO8BnJPM+o/bqhYsY1hj9P5oVHOysDZr95GB/DHchu2mu6//qZr41aoyYfAXL7U9Ad2/SgdliLkbOwP0PZlLOwzp/IDvnEUcy4c75JGlTJCRBXJePSavaRxX18YOHgTMb88JJwem1FMscezGrJXYXxh9RguJNPEOjdmQu2vNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UjYE1tzAt8O/+MafxYqm3BYVBvz1m+sF2m7gtyjV28=;
 b=Zi3W3aasiGae/o+pw+lLtLWlWFdzb+Xs//S2RrMhPPARX8Gt1PTVyf7/0epNjQua0oc/aNsHMqbo7f0YQWEw9ffMEI7qak5g01i6lNwMB7peIn10kWDzNn86scYKE7VNTng5NO9JB2ngB9OxQmA/8Q6FvJTfYA5MCpt35RnGReAw5TfPVHwG/pgTNKWdO1vUjV0os4IChuWKbSJCBf3FyuImXNT5KUpTZXxD3WfiaFnpA/AhEdC3RvYwor2QGUGJSQlC0Bu62WDT9ZikKcgTRGHSQaPIGJbQn3ZZ1Hj4Dr7P3zSB0GIaUddR1EzXJ4PwsNUB4UxU2s1p/HWnwEqPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UjYE1tzAt8O/+MafxYqm3BYVBvz1m+sF2m7gtyjV28=;
 b=icrDINiHccwcEjuZFlJQfRHi3y6JyjR4LwOgVPCbDf1ukthFVZExSHg5p3ODA1Er/rUfhHx3KhrBWSRk91U0jIqpZXoFABQjG1Ud5mdJIqQsoW6u+FE4JKMqp3UgebciwxqvfizZmQdPGNn2lpjvsITZ8akyJoqviohoHw5Vqvg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2418.namprd12.prod.outlook.com (2603:10b6:207:4d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Sat, 22 May
 2021 08:30:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Sat, 22 May 2021
 08:30:27 +0000
Subject: Re: [Mesa-dev] [PATCH 01/11] drm/amdgpu: Comply with implicit fencing
 rules
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
 <YKfFqrlLrikGMn4K@phenom.ffwll.local>
 <CAP+8YyG0o58dQt_tvnJ2ESbeqo02xxvFdifpMwnhz2VYNk8HUw@mail.gmail.com>
 <YKfOymXrB7O4cYVb@phenom.ffwll.local>
 <31467363-e936-879b-8b0d-5a2a92644221@gmail.com>
 <CAKMK7uFswfc96hS40uc0Lug=doYAcf-yC-eu96iWqNJnM65MJQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ae13093e-c364-7b90-1f91-39de42594cd6@amd.com>
Date: Sat, 22 May 2021 10:30:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uFswfc96hS40uc0Lug=doYAcf-yC-eu96iWqNJnM65MJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fbb3:4c00:7f05:a878]
X-ClientProxiedBy: FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fbb3:4c00:7f05:a878]
 (2a02:908:1252:fb60:fbb3:4c00:7f05:a878) by
 FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Sat, 22 May 2021 08:30:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33e70856-f4f9-46da-a7ae-08d91cfbd968
X-MS-TrafficTypeDiagnostic: BL0PR12MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2418405E376A3914A34B906083289@BL0PR12MB2418.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2qFiHU5HKyvw7xMfYE8it7B+srcUkAOonTYxAhRfTvkS/B0DNKIDQlySrH+QKOOniWf3cPe5amaKcTvWfsjp6JyZYs1QNXsX3cprt6CwUF+6TJbu/UKYHU/qgndMK08m9LO1Lftd6EeGOSPZNCrJZY2fziRAYM3w9ef+ghz2UyyyC3cjnq5cLyfL/RqioxaAJbzpc0d6urxpW+Q8d7HnEB5X/zy2kHj+DMFnkZPaJumfaJfHxdtPrFNCXRCifwBQCiANzd5sNKeHqkyJO3RumQLbS5BuGBfjWTZoa1MVjCknsdDU6gFoAD845sphOqsoQ/m/MSH8u5EnOqywIAeVhYMKKBx51ia5ngl/yEoTrv2A3fr5e6q1PVQw/JXWkp4KAOUrvth6CSX6DDqZjoWKEQkVLsbCHa9rwL/nSGN/A6VZNi3cyy17pT+rlEZ7sCOck4EfDZRQfkLDmPOg8zSMPt1jOEfGO9r0vWfbM/2dZDah85hc0XKsDLTj7gcP9QrQjNqvR3P3jfvngB52oe5VSkaFA6ZpOFTi39Zlv51Yleqi1zAMd0MTN2zTk86DYtvTT6PdTlQkfJoAj4KAVS9Dsw2+SDh7W/3LPqCUf0jTFkuC6VFHQUQyM0mlKo1X3OL25D6z33n528mvVRXFfGFoBr6BRy2UAuo+qg7cfXaucz9kei/zLJCuoQiP3QvHvghgE4E5l5hQDpsu8FQ7bDOix5+2r0iKnTfxSVSRxhTikmLgIHH3eUStAeTjTwN1gyiejYCTf2gyzexlmbGpn+saEeSlJGWEBnyv+OGwlYPUX35HN/VAmX/McHyFeHXO2JST
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(31696002)(7416002)(66946007)(66476007)(66556008)(16526019)(54906003)(110136005)(186003)(5660300002)(86362001)(2616005)(6486002)(316002)(966005)(45080400002)(478600001)(38100700002)(36756003)(4326008)(52116002)(6666004)(8936002)(31686004)(8676002)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VktpSTlnZVZjblBoQ2tYVkt6b1ZIRTZJdHhPTXFKSkllUmZQdHZ4bDI0TTda?=
 =?utf-8?B?NjJvMEVNRXdMblpWT2hCbmpGUXpJeCtaU0RaZERmMURZQk9sallqK05WMHVo?=
 =?utf-8?B?V1BSSW1FMWRHUlBCazBZYks1WFNMeEFBUktBZkw4TUpMTmg3UjRUTnp1RlJ6?=
 =?utf-8?B?RlBXTFo3QmNrTGhOQ2RtOGM1alJVOEJ6UlFsSm81MFRLWS9tTjVPQlBxSEdU?=
 =?utf-8?B?OHNMbno4akpUaUJKWTN6dFRSK0hmdDJYNG02VmFxT2trNVNIRGpzc1g2V20r?=
 =?utf-8?B?bUtMQXdiUXNZeU1iMzFKZkl1enRVUzJ2N2lvZFg5YTdUT2FMeGVMS0gyRzBU?=
 =?utf-8?B?MHJJK1F3TmVBNmNEaGIxWXJ4N2Fpc3doaFUxSUh4RlpSUHZwZkV0MWtDOTJj?=
 =?utf-8?B?bVpIVWNWNVJtS0t5cDNvTDFOZ3lMWnUyWm1PMnpkTXpDV1ZhWUV6YmlVKzhq?=
 =?utf-8?B?SCtBU1VaUjgzSXZKUFhKQ1FmZG9QUHA1Rjdyc3dreDVzUEN0MnBJSk5OSEds?=
 =?utf-8?B?TkhsWWtlOFZWMlB5Y3J4alpaczBCN2lHV0lCRUdacHgvNXJENmZPa1NmV3JR?=
 =?utf-8?B?enBmU0JLWVdKNko5Qk5iUkJTd2lSS1RGOU13OW9sc2liazRxVlhHOHI1ZHpr?=
 =?utf-8?B?aGFJeFd3a05aNDdFTFBaQklHV3NBVExVN04ySndxdEs1dEVyRThnYnR3V2Vy?=
 =?utf-8?B?TVdUNHBuWEovZm5PTW8zdFFHSXYyaWEwTFlpVDhJQWZuVmVzcStCNEZaSkdM?=
 =?utf-8?B?ZkVIazcwM0RmbDN1MzU0SE5XYlNvenliWERaM05qM1hhK1NEQ2JHR1BwRjFx?=
 =?utf-8?B?aEQ5d01KUW5WMlM4MysvdklCYTFNN0JjdmRFU3k1c2E0cDk5NzkyUDRRR2pE?=
 =?utf-8?B?aitBaVBPc01zbU5JZmczRk9Rd0FCa3JMM002ZnZYMld4UG9ockxqUnRhNFMz?=
 =?utf-8?B?WXl0NitFV1FQelhiTHR4M1ZKQmF3YnhDYUdZbnpNc1RGQWh4UWFRZUZzNy9p?=
 =?utf-8?B?eGx5S2FGdHBDRkpCNWJuRFlzcWxNOGhCR1lIbTljMFdjUWVXenQ5TTlKNWxJ?=
 =?utf-8?B?UVZ1TUJjRUl1SnNXVjZzYWRoMHg0UmZGcHFkNGE4WjFQdERzdWdlT3lUTTVB?=
 =?utf-8?B?UHFzclA1dEJDamRiOHV6Y2lpWlVvVjRUUHFWY2h4TWo0TDhlK3lZdEdsWGxu?=
 =?utf-8?B?eFJiR3FCSnRWUjh2Z1loTlR5K1EzczlOakptZjlEVzEwaFkzeS9pZi9vNTl2?=
 =?utf-8?B?M1hsL2pHSTVuY05DUjR6K2JJWHJkSVNxbmdQWVQ2cUUzdUYzMlhzYzdpZ2hk?=
 =?utf-8?B?WDB4NzNwQnROL3pPY1BBNnovUW9vNWU0WHE5Zkg0OFdKSEdDRkhLYytObWc3?=
 =?utf-8?B?ZG44dkErMHhkV3JMeTVtVzNGV0JoMGxYNmFocEdHL0wxeFZCN1dmcE5KUm5J?=
 =?utf-8?B?WXNBMVBybnRQZkttWnpIMExJOTZ3US94VVVLOWs0cTVNbHptSjEydWJZTzVJ?=
 =?utf-8?B?RmpCMnhrYWFYU0daLytXMGVsZUNGK3diWDVzYzcvZ2MvRjFPRHBXejI3c2Er?=
 =?utf-8?B?d0xDN0FnMjgrMThQSy9MdEFLYlQvOU5NR21aUkxpTndBbTJ5NnlOTkgvZ0pj?=
 =?utf-8?B?eHhPaFdwdk4wMU5oSGdQL0ZoUFVzMEF6QzFOVTVDNjJyS0M1dElpMkhhMWJV?=
 =?utf-8?B?OVZaK3JKNUxzT0RRUW5tZ1diRVJPTHdRR0VKWWlaaTFxTnBPeHkweXpXV1lO?=
 =?utf-8?B?d0pQM013TlQxNHYzRkFZZk9NL3FvdldKVUw1dW5mVEwzU3E3aDdQd200Y2R4?=
 =?utf-8?B?THpzMWpaRGo2YmlwbGdQaXRnanFmYkVSc0txVFFlMjR3Qyt1ZDgxKzh6WUcx?=
 =?utf-8?Q?8CugjURHYPFgo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e70856-f4f9-46da-a7ae-08d91cfbd968
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2021 08:30:26.8614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1q3HgXU/wuyHRKbFkKQAykZ5L7V+2ei/v2zy0kc7rkHmVKzNPoZjJ6z+Jp3z50U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2418
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>, Dennis Li <Dennis.Li@amd.com>,
 Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.21 um 20:31 schrieb Daniel Vetter:
> [SNIP]
>> We could provide an IOCTL for the BO to change the flag.
> That's not the semantics we need.
>
>> But could we first figure out the semantics we want to use here?
>>
>> Cause I'm pretty sure we don't actually need those changes at all and as
>> said before I'm certainly NAKing things which break existing use cases.
> Please read how other drivers do this and at least _try_ to understand
> it. I'm really loosing my patience here with you NAKing patches you're
> not even understanding (or did you actually read and fully understand
> the entire story I typed up here, and your NAK is on the entire
> thing?). There's not much useful conversation to be had with that
> approach. And with drivers I mean kernel + userspace here.

Well to be honest I did fully read that, but I was just to emotionally 
attached to answer more appropriately in that moment.

And I'm sorry that I react emotional on that, but it is really 
frustrating that I'm not able to convince you that we have a major 
problem which affects all drivers and not just amdgpu.

Regarding the reason why I'm NAKing this particular patch, you are 
breaking existing uAPI for RADV with that. And as a maintainer of the 
driver I have simply no other choice than saying halt, stop we can't do 
it like this.

I'm perfectly aware that I've some holes in the understanding of how ANV 
or other Vulkan/OpenGL stacks work. But you should probably also admit 
that you have some holes how amdgpu works or otherwise I can't imagine 
why you suggest a patch which simply breaks RADV.

I mean we are working together for years now and I think you know me 
pretty well, do you really think I scream bloody hell we can't do this 
without a good reason?

So let's stop throwing halve backed solutions at each other and discuss 
what we can do to solve the different problems we are both seeing here.

> That's the other frustration part: You're trying to fix this purely in
> the kernel. This is exactly one of these issues why we require open
> source userspace, so that we can fix the issues correctly across the
> entire stack. And meanwhile you're steadfastily refusing to even look
> at that the userspace side of the picture.

Well I do fully understand the userspace side of the picture for the AMD 
stack. I just don't think we should give userspace that much control 
over the fences in the dma_resv object without untangling them from 
resource management.

And RADV is exercising exclusive sync for amdgpu already. You can do 
submission to both the GFX, Compute and SDMA queues in Vulkan and those 
currently won't over-synchronize.

When you then send a texture generated by multiple engines to the 
Compositor the kernel will correctly inserts waits for all submissions 
of the other process.

So this already works for RADV and completely without the IOCTL Jason 
proposed. IIRC we also have unit tests which exercised that feature for 
the video decoding use case long before RADV even existed.

And yes I have to admit that I haven't thought about interaction with 
other drivers when I came up with this because the rules of that 
interaction wasn't clear to me at that time.

> Also I thought through your tlb issue, why are you even putting these
> tlb flush fences into the shard dma_resv slots? If you store them
> somewhere else in the amdgpu private part, the oversync issues goes
> away
> - in your ttm bo move callback, you can just make your bo copy job
> depend on them too (you have to anyway)
> - even for p2p there's not an issue here, because you have the
> ->move_notify callback, and can then lift the tlb flush fences from
> your private place to the shared slots so the exporter can see them.

Because adding a shared fence requires that this shared fence signals 
after the exclusive fence. And this is a perfect example to explain why 
this is so problematic and also why why we currently stumble over that 
only in amdgpu.

In TTM we have a feature which allows evictions to be pipelined and 
don't wait for the evicting DMA operation. Without that driver will 
stall waiting for their allocations to finish when we need to allocate 
memory.

For certain use cases this gives you a ~20% fps increase under memory 
pressure, so it is a really important feature.

This works by adding the fence of the last eviction DMA operation to BOs 
when their backing store is newly allocated. That's what the 
ttm_bo_add_move_fence() function you stumbled over is good for: 
https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/gpu/drm/ttm/ttm_bo.c#L692

Now the problem is it is possible that the application is terminated 
before it can complete it's command submission. But since resource 
management only waits for the shared fences when there are some there is 
a chance that we free up memory while it is still in use.

Because of this we have some rather crude workarounds in amdgpu. For 
example IIRC we manual wait for any potential exclusive fence before 
freeing memory.

We could enable this feature for radeon and nouveau as well with an one 
line change. But that would mean we need to maintain the workarounds for 
shortcomings of the dma_resv object design in those drivers as well.

To summarize I think that adding an unbound fence to protect an object 
is a perfectly valid operation for resource management, but this is 
restricted by the needs of implicit sync at the moment.

> The kernel move fences otoh are a bit more nasty to wring through the
> p2p dma-buf interface. That one probably needs something new.

Well the p2p interface are my least concern.

Adding the move fence means that you need to touch every place we do CS 
or page flip since you now have something which is parallel to the 
explicit sync fence.

Otherwise having the move fence separately wouldn't make much sense in 
the first place if we always set it together with the exclusive fence.

Best regards and sorry for getting on your nerves so much,
Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>> -Daniel
>>>
>>>
>>>
>>>>> Are you bored enough to type this up for radv? I'll give Jason's kernel
>>>>> stuff another review meanwhile.
>>>>> -Daniel
>>>>>
>>>>>>>                   e->bo_va = amdgpu_vm_bo_find(vm, bo);
>>>>>>>           }
>>>>>>> --
>>>>>>> 2.31.0
>>>>>>>
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cf0852f38c85046ca877908d91c86a719%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637572186953277692%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Vgz%2FkXFH4CD6ktZBnxnXFhHTG5tHhN1%2BDyf7pmxak6c%3D&amp;reserved=0
>

