Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6535D37583D
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 18:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC716E1EE;
	Thu,  6 May 2021 16:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338266E1EE;
 Thu,  6 May 2021 16:10:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXu4FRnSpg+isk31hKiyFiK1mawXCDnzAtuyI+GdD7EEPPxRZ+CMwMyvkcU4WvhW6K3avk4k1poCJOSgxAXTye+JGiMMSa4KjyHvofbI4Y7IfMOJ63W/jwHChPEYcJ6K9TdSUGY3uE5+B1dI0rtUqB9K+9mQFqhqc7WJmoIy027nBDIQoPx5S+hOKxyt9RZupO1X7JOL5Yeo6wasfmySjEt8x4chpaqJpLY/UV9IjVApvcloOOZOAWkQ72jvOXhHBnAq+UvBnofqBVVUPby5ZfGcW7Ray1Dqvk5LXT1Ef3UAMfucTv4OT3KOhiH7AFnRuDfY46/jziXuEE8Qpy3k1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/UwVeZpRepIO2X98iq0Qp4lRuvUKtzaPoy1V9Jpe7o=;
 b=Qyt1a7FKTjDpIOYjBrFTArTKdOuKlruftOBtox4c8IsrpAQrgmKBSTEQXAyD87En7V3ObYm785Ef56ckDIxw8BeXMgx2Nsb30TmNSLEsxdvRGzIrM9CYjzipasLIObWtUksZBAKtKjPMWBDqPeWpgrWAr9O3qqafwqJfYDIst8R5PLZE+QUmFQfvcFnvHPLMYGINaoHy1UgDREY/zpNUGU9PfAKVTMKv+KjWYiL2FrtHXON76Cfqob5ZFIuclArjZTreT9sUjE20jRGui4HBCpCDA+juqHwwz8fz78u58836aL7CcYxQxP7q44ZcgNIUDlxjjEtc/qHk2oRrhDBLhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/UwVeZpRepIO2X98iq0Qp4lRuvUKtzaPoy1V9Jpe7o=;
 b=S9qqIZPiyQsXJS7Hdb68F3J42HKv6q9mwyxSRaUXAdX1uPjGJsTc4d88Z2Dl/kZICFWRA6j+nfDxUEJDde/t4BqSLwr/PYeQ22h5Ug0tHV3h1qmk3LrW7ODBicMfOo1K0bfCxbpz4Zy3jupoR6DZ4SphrpmNl60L80oa7P8RNcs=
Authentication-Results: lisas.de; dkim=none (message not signed)
 header.d=none;lisas.de; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5292.namprd12.prod.outlook.com (2603:10b6:408:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Thu, 6 May
 2021 16:10:18 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4087.039; Thu, 6 May 2021
 16:10:18 +0000
Subject: Re: [RFC] CRIU support for ROCm
To: Daniel Vetter <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, 
 Jason Ekstrand <jason@jlekstrand.net>
References: <9245171d-ecc9-1bdf-3ecd-cf776dc17855@amd.com>
 <CAKMK7uGc6hqY0AasiE=rtF2EitGF7MaMxv7FYJ41O9aj8=__Vg@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <232d301f-cf57-85b1-6bbf-11bddc634189@amd.com>
Date: Thu, 6 May 2021 12:10:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uGc6hqY0AasiE=rtF2EitGF7MaMxv7FYJ41O9aj8=__Vg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.116.138.207]
X-ClientProxiedBy: YT2PR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::22) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.138.207) by
 YT2PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.37 via Frontend Transport; Thu, 6 May 2021 16:10:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3188938b-0f25-454b-4771-08d910a9710f
X-MS-TrafficTypeDiagnostic: BN9PR12MB5292:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB52924C481BCBCB9040B214D192589@BN9PR12MB5292.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uy9zc59f3YW0IvyzYfBd07zUcw0LZWY7DcvdYyXPbbNVpRuNjYm694mg/i2hWXZ+xngfpxRvEc8KmNH9tZb/aoI6BD4bTa2U2omeayVs83IBDERq2a5d+/379MTJMw9ykEcuZRO/8dbgh4xDBYeJDYCHL+bfzk3CDx4BuriPjtN+dL6/UfdP1kYuiaaqzVPz1miahb6DDq1/aySXmSyoLHJMbLKAmM3ZzYepVPVzuluUT6zMa6EfxWKg+GxDt2I0TQL1rJfPM4himW+mtHMZkNiGKcbmRGf+EyCbQfM6vdxhXkvbT0BnY+e1dp07OVRxo+9T8TUxJqBvKZd0W+sCBCsWXJ3mmFhEb4Dz1glUWsNLc3zIycMJKi3m4LaJhZi495kZ3hNGiHptUL8G27Saa/NFGBq/OBrVFNe4oeJJojM/pe5XqqZPvhDcaJYsxYMGh2kEf4GwoxZhuCkCT/ZDhdtCwy/QT2BBzMWvlBW77oJJONOifp1gYYVv3rz5igfHGpFBp/0mYnQe2B4HoxDdeu/R49VQghG/mXa0cfzvw0+zbNq9liboxXSrA5hdL9tYxW1MgSJT07TvFNKQ2zrk56tdovSqoPMdUQKYg66ODn1XHrANmJUlVakysQZdqzZoIBW3Nzb8AXU2ttaNI0QR+mMpcOc/OWLc/JXeninsBHyrvnog78mntAMgVy5GUSGdejQcxTL6SIolr/woFFFY9psZ/6cFus0LYBsIGd33PRGfkxKQj6PC7FatlDfzBK1aVzVept642Nx1MkB+IR+QSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(31696002)(110136005)(2906002)(30864003)(16576012)(54906003)(4326008)(44832011)(8936002)(966005)(6486002)(5660300002)(316002)(36756003)(31686004)(7416002)(86362001)(478600001)(956004)(83380400001)(2616005)(8676002)(16526019)(186003)(66476007)(66946007)(38100700002)(66556008)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzRmc0pjeWl4aml3NmNEODNNNmVCS0ZhRHR5VEM1K3FWYVJGcFhybXdQU25z?=
 =?utf-8?B?Wjg5M0ExMkl6M2VSM3l6LzJ4NzgrM2pJMit5d1czUzUwUkI1MXZLZlZDOEpW?=
 =?utf-8?B?cnk3WXZCbzh2L2h3OGlPem1BZHp0RVpxWHRYY1ZvdElBMnBjV1pNd2VXOWIy?=
 =?utf-8?B?amMrTjNCQVRFVUY0RVhBN2djZkxlbUJZb2RlcE5Gai9OUWV1QU5yOWJaZGtF?=
 =?utf-8?B?TmJwQllNQkxzR2p1cEZhN1lxVGlUZTlkTjFMWE9DTndxaGdLS20rZ3Y4aUV5?=
 =?utf-8?B?TW1uQmtadlF2a29UTFIveXFYcDNzZi95emxWN3pZSGJQODRvakhPcVJidXFu?=
 =?utf-8?B?THREZFFrSHk2MFpjc1E0TXVPQXNldWVJTG1iYWRESTl4aFk2ZzN3L1ZGcE9C?=
 =?utf-8?B?RHphMHpEblRVWGthajZYWXJ0cDhJOTJ5eE1lSVFDOGJYKzhrYVBBeHIzNkE0?=
 =?utf-8?B?c0Q3cGJBRkc3VW5tWVA2blJ1d1ZPZlR4b3hXRmlTN2MyeTBQRk9lTVRZN2RT?=
 =?utf-8?B?ZERnUVZWbVlWS1JkRzBqaVJnTE1PVGxkUzBiNGZyTDJLVWFoRkJqRkcyL3dR?=
 =?utf-8?B?Smkrc2xmeHBUODQ0R3JDaWJ4YjUzVDJlRXRQcEp2d0dISFZ3b2E4dTl5cG9q?=
 =?utf-8?B?eUlUMmxaNHdPckFQdCtCTndRTXVwSC9aWmg3Tzh0RVZLT3BsOGlJTmFlQkth?=
 =?utf-8?B?VGJ6K3RkUXpxMzBra0NoZXFsblIwZG0wNHpHNnZRbHRqbXordkxzVTZheUhl?=
 =?utf-8?B?THdBTEViNktHdTJmZWZCOXNaSWFtZDZ3UTduS3dKQnFVZ09Lb0w5UDVpVGYw?=
 =?utf-8?B?OFY5WmVaajdMSnVtTjZuSFpWR0lsNkZjQm1BUmNwYk1UMEx1b21kS1pDeHdV?=
 =?utf-8?B?UUVuUXlRTW1naFN1bkQzK3lyT0JDSFpPallxRlFXNlFlbXZXLy96dmtrbllm?=
 =?utf-8?B?TFEyalU2dklVWTFBTWJyQk82cHduVHU2UGN1NzJRQmpIa2NqTXpiaUhzTjFO?=
 =?utf-8?B?SU9GNDJIVnJxSmY1eU5lbFl1T0Q0UkhVZE9VQWVDcmZodnVuQ0Y5aWFOeWRX?=
 =?utf-8?B?NXppQnMyc2JHRE0xTmZOVjFFYUpySmZCQW55SjloZGJLVVlCTkJUb1VweWI5?=
 =?utf-8?B?Qzkwc2tQbnB6eFlGUFk2dERZZzVhMkVNMkl6MWJFeklqMk5SaHVuM2NjVGFO?=
 =?utf-8?B?c2pJd084L2VHVjZYVWgySHltaXZVVnI2NHArbnRyS2dUWE5YdzNHaTkzMmVr?=
 =?utf-8?B?WFVmcjFKUThhdjlPU0RvN1RGNmdacDdZMmZYekpMcmtPTG9OQmhJbXorZ1lu?=
 =?utf-8?B?c1p3RXBCS1A0SjA2b290UlZyUEthRkZHZE9Pa1RhdGlaRi9Oc1N0U2hMRHZY?=
 =?utf-8?B?cVFKWGZxdUxVdjl6Tll4eEpqMVVqeWVZaVUxc1BFVDBLNURHNlkvcXZVMFZT?=
 =?utf-8?B?OHI4M3N2Qk9VZVpQOGVOR3J2M1Z4Wk55Rlg5UlhQQnhpQXJBK25HZUYwNWhk?=
 =?utf-8?B?cm9QTzRaRlE4SVhmMkR5TS9YYUs2anVFcFlMdGo0bjJrWDd4TVVYa01RTjgv?=
 =?utf-8?B?L3V6M2wxV3B3Tm5PTmUwMUdFd3h2Mk9aeUxKWHR0RkhkOTVoS0dyS0UrekdF?=
 =?utf-8?B?bkZOWTd2dWg0YWNGMFd2aGdiM0IwLzFYa3hNQXBqbS9qTCt4aDBBcHBzMlhP?=
 =?utf-8?B?Z2s4SVZoaXIxLzd2N0E5azhlNG5ySU40anU4ajF5amU1UnI0dHRuT3U3VlZk?=
 =?utf-8?B?VGl2aW84cjJrVmNxbUVOTWlrL0EvMTBtZWlHT3FybGhrSXBWN0M1N1RXWDc2?=
 =?utf-8?B?SmV2RDIwdEg3aEljN0thUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3188938b-0f25-454b-4771-08d910a9710f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 16:10:18.4459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sy2ob3GsQ1KPOVTZJ6MubdJYcY4DVdxJYQEzWjd2HGZXaOgOf1tlAuRwguPgWhSBibuL8/4IFg3DQp6snO0mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5292
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
Cc: Alexander Mihalicyn <alexander@mihalicyn.com>,
 Pavel Emelyanov <ovzxemul@gmail.com>, "Bhardwaj,
 Rajneesh" <Rajneesh.Bhardwaj@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pavel Tikhomirov <snorcht@gmail.com>, criu@openvz.org, "Yat Sin,
 David" <David.YatSin@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Adrian Reber <adrian@lisas.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-05-04 um 9:00 a.m. schrieb Daniel Vetter:
> On Fri, Apr 30, 2021 at 09:57:45PM -0400, Felix Kuehling wrote:
>> We have been working on a prototype supporting CRIU (Checkpoint/Restore
>> In Userspace) for accelerated compute applications running on AMD GPUs
>> using ROCm (Radeon Open Compute Platform). We're happy to finally share
>> this work publicly to solicit feedback and advice. The end-goal is to
>> get this work included upstream in Linux and CRIU. A short whitepaper
>> describing our design and intention can be found on Github:
>> https://github.com/RadeonOpenCompute/criu/tree/criu-dev/test/others/ext-kfd/README.md
>>
>> We have RFC patch series for the kernel (based on Alex Deucher's
>> amd-staging-drm-next branch) and for CRIU including a new plugin and a
>> few core CRIU changes. I will send those to the respective mailing lists
>> separately in a minute. They can also be found on Github.
>>
>>     CRIU+plugin: https://github.com/RadeonOpenCompute/criu/commits/criu-dev
>>     Kernel (KFD):
>>     https://github.com/RadeonOpenCompute/ROCK-Kernel-Driver/commits/fxkamd/criu-wip
>>
>> At this point this is very much a work in progress and not ready for
>> upstream inclusion. There are still several missing features, known
>> issues, and open questions that we would like to start addressing with
>> your feedback.
> Since the thread is a bit split I'm dumping the big thoughts here on this
> RFC.
>
> We've discussed this in the past, but I'm once more (insert meme here)
> asking whether continuing to walk down the amdgpu vs amdkfd split is
> really the right choice. It starts to feel a bit much like sunk cost
> fallacy ...

Hi Daniel,

Thanks for the feedback. I have some comments to your specific points
below. This is my own opinion at this point and may not reflect AMDs
position. I'm starting some internal discussions about unifying the KFD
and graphics APIs in the long run. But IMO this is going to take years
and won't be supported on our current compute GPUs, including Aldebaran
which isn't even released yet.


>
> - From the big thread we're having right now on dri-devel it's clear that
>   3d will also move towards more and more a userspace submit model.

I'll need to start following dri-devel more closely and take a more
active role in those discussions. If there is an opportunity for a
unified memory management and command submission model for graphics and
compute on future hardware, I want to be sure that our compute
requirements are understood early on.


>  But
>   due to backwards compat issues it will be a mixed model, and in some
>   cases we need to pick at runtime which model we're picking. A hard split
>   between the amdgpu and the amdkfd world gets in the way here.

Backwards compatibility will force us to maintain KFD at least for GFXv9
and older AMD GPUs. As I understand it, the new user mode command
submission model will only be viable on GFXv10 or even newer GPUs. GFXv9
is our architecture for current compute GPUs (including Aldebaran which
is still in development), so this is going to be important for us for
years to come.


>
> - There's use-cases for doing compute in vulkan (that was a discussion
>   from Feb that I kicked again in private, since I think still
>   unresolved). So you need a vulkan stack that runs on both amdgpu and
>   amdvlk.

By amdvlk, do you mean AMD's "pro" driver that supports our non-RADV
Vulcan driver?


>
> - Maybe not yet on amd's radar, but there's a lot of cloud computing. And
>   maybe they also want CRIU for migrating their containers around. So that
>   means CRIU for amdgpu too, not just amdkf.

Our strategy for compute support (OpenCL, HIP, OpenMP and mayby future
C++ standards) is to use ROCm on all current and future GPUs starting
with GFXv9. As long as ROCm is based on KFD, that means our compute
stack runs on KFD. We don't see KFD as something mutually exclusive with
graphics. They are different ioctl APIs, but they're sharing the
hardware and memory and are meant to work together.

We are already planning to add CRIU support to our render node API
because video acceleration on our compute stack still relies on Mesa and
the render node CS API.

I admit, that we are not currently considering Vulcan as part of our
compute stack. I don't think it makes sense to build Vulcan on top of
ROCm because we have no plans to add graphics support to ROCm. What
commonality there is between Vulcan and other compute APIs will need to
be addressed at a lower level. If graphics is moving to user mode
command submission and a shared virtual memory model, I see an
opportunity to move ROCm to a common ioctl API on those future hardware
generations.


>
> - What's much worse, and I don't think anyone in amd has realized this yet
>   (at least not in a public thread I've seen). In vulkan you need to be
>   able to switch from compute mode to dma-fence mode after
>   pipelines/devices have been created already. This is because winsys are
>   only initialized in a second step, until that's done you have to
>   pessimistically assume that the user does pure compute. What's worse for
>   buffer sharing you don't even have a clear signal on this stuff. So
>   either
>
>   - you figure out how to migrate all the buffers and state from amdkfd to
>     amdgpu at runtime, and duplicate all the features. Which is rather
>     pointless.
>
>   - or you duplicate all the compute features to amdgpu so that vk can use
>     them, and still reasonably easy migrate to winsys/dma-fence mode,
>     which makes amdkfd rather redundant.

The basic "compute features" that ROCm depends on are a
shared-virtual-memory model and user mode command submission. If those
become part of the graphics ioctl API, I see no problem with
implementing proper Vulcan compute on top of it.

For more consistent support for tools such as debugger, profilers, CRIU,
etc. it would make sense to have a common ioctl API for ROCm and Vulcan,
which would effectively deprecate the KFD API. And I'm definitely open
to working on that for future HW generations that can support it.

We'll probably have to pick a target GPU where we make such a switch,
and use the time until then to get things ready, prototyping in current
GFXv10 or newer GPUs. This feels to me a bit like the transition from
radeon to amdgpu, where GFXv7 was supported by both for some time.

 

>
>   I've discussed this problem extensively with Jason Ekstrand, and it's
>   really nasty.
>
> So purely from a technical pov, only looking at the AMD perspective here,
> this doesn't make much sense to me. The only reason to keep doubling down
> on amdkfd I'm seeing is that you've built your compute rocm stack on top
> of it, and because of that the only option is to keep doing that. Which
> stops making sense eventually, and we're getting to that point for sure.

As long as our compute GPUs are based on the GFXv9 architecture, I think
we don't really have an alternative than to double down on KFD. We can't
just stop work on KFD and tell our customers that they'll not get any
new features for the next 2 or 3 years that it takes to build a common
upstream memory management and scheduling API and the HW that can
support it.


>
> The other side is a bit the upstream side, but that's a lot smaller:
>
> - vulkan compute is one of the more reasonable ways to get cross vendor
>   compute ecosystem off the ground. At least from what I know from
>   background chatter, which you guys probably haven't all heard. amdkfd
>   being the single very odd driver here requiring entirely different uapi
>   for compute mode is not going to be great.

Like I said, KFD is not exclusive with anything else.

Vulcan may be a good option for desktops. For HPC uses or general
portable non-graphics compute code, I think something like OpenMP or
future C++ standards would be a better way forward. There is no
technical reason why both cannot coexist in the same application.


>
> - CRIU will need new access rights handling (for the save/restore/resume
>   stuff you're adding). Generally we standardize access rights checks
>   across drivers, and leave everything else to render drivers (command
>   submission, memory management, ...). By adding CRIU support to amdkfd
>   we pretty much guarantee that we wont be able to standardize CRIU access
>   rights across drivers. Which just plains sucks from an
>   upstream/cross-vendor ecosystem pov.

By access rights, do you mean requiring root for some ioctls, or being
ptrace-attached for others? These are driven by how CRIU works and
interacts with its target processes. I think they will apply equally to
any driver implementing CRIU support. I don't see how graphics drivers
specifically drive standardization of CRIU access rights.


>
> And yes we'd still need a per-driver criu plugin in userspace, but the
> same is true for amdvlk/radv/anv/ and all the other drivers we have:
> Driver is different, access right management is still the same.
>
> And secondly, just because nvidia refuses to collaborate in any
> standards around gpu compute doesn't mean that's a good reason for us to
> do the same in upstream.
>
> Thirdly, it sounds like this is the first device-driver CRIU support, so I
> think we need a solid agreement/standard here to set as an example for
> everyone else. There's all the AI accel chips and fpga-for-compute stuff
> that I expect will eventually also gain CRIU support.

Sure. My experience with CRIU so far is, that CRIU requires root (even
without our plugin). Regardless of that, CRIU attaches to the target
process with ptrace. The kernel's security policy for allowing ptrace
access is influenced by many factors. We chose not to duplicate this in
the driver. Therefore we check whether the caller of our CRIU dump ioctl
is ptrace attached. If it is, it means it has passed all the kernel's
security checks. We deliberately do not want to implement our own
security policy in the driver.

There would be ways to remove the root requirement from our CRIU
restore-ioctl, if that becomes a requirement for CRIU. It would mean
some sanity checking of the HW state that's getting restored.


>
> So I'm asking once more, is this _really_ the right path forward? Both for
> amd (at least long term), but also somewhat for upstream.

I think long-term it makes sense to plan for a unified API. For current
hardware I don't see a way to get there for multiple reasons:

 1. Maintaining backwards compatibility with existing user mode
 2. Lacking HW capabilities for graphics user mode command submission
    and HW scheduling

Therefore KFD will be important for AMD's compute GPU strategy and our
customers for years to come. Not being able to continue developing it
upstream would be a major impediment for AMD. Again, this is my personal
opinion.

Regards,
  Felix


>
> Cheers, Daniel
>
>
>> What's working and tested at this point:
>>
>>   * Checkpoint and restore accelerated machine learning apps: PyTorch
>>     running Bert on systems with 1 or 2 GPUs (MI50 or MI100), 100%
>>     unmodified user mode stack
>>   * Checkpoint on one system, restore on a different system
>>   * Checkpoint on one GPU, restore on a different GPU
>>
>> Major Known issues:
>>
>>   * The KFD ioctl API is not final: Needs a complete redesign to allow
>>     future extension without breaking the ABI
>>   * Very slow: Need to implement DMA to dump VRAM contents
>>
>> Missing or incomplete features:
>>
>>   * Support for the new KFD SVM API
>>   * Check device topology during restore
>>   * Checkpoint and restore multiple processes
>>   * Support for applications using Mesa for video decode/encode
>>   * Testing with more different GPUs and workloads
>>
>> Big Open questions:
>>
>>   * What's the preferred way to publish our CRIU plugin? In-tree or
>>     out-of-tree?
>>   * What's the preferred way to distribute our CRIU plugin? Source?
>>     Binary .so? Whole CRIU? Just in-box support?
>>   * If our plugin can be upstreamed in the CRIU tree, what would be the
>>     right directory?
>>
>> Best regards,
>>   Felix
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch/
