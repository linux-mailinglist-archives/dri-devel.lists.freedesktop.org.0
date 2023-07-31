Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A858768FA9
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 10:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C60B10E1C5;
	Mon, 31 Jul 2023 08:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8791810E1C5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 08:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNzsMYoTQ1pM+bJSrAKzzr/BsCfmlUnzruLgZ9HuwMreSt9pHVtV0S1cnp2GP86g5fXyo/rpxuNoq4rOkRa3HbRQv15LMAn4Pgs1sRjztGGvvelY0mHgT06wHhRO0eqyHF4/EhSmHMQ3E/a0J3xY+hm/AQ1T9ky1jkawAcXRd0TGhyz2nDVv5AiTQgCXJWGTWtGg++VpLygFkR1YUEvABw9/u2L+BnT5xVz6Zt+GhW99dKa5vCSLMgcQWQFuo3h3L7nx0WD4jg134bGAjk9YM/J4kVXEUA7BWx60kEc5YV0Bhft+AJuwpcopBvPnbltLDYsLoqWcBsptShUgD2IJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNdoq0dReMDvTRcXhKlpaQ+3HqUaq+YO0Y1wmrG253E=;
 b=N8bOlTUZJi9p+oI2vyvUKaoxz1JJaPxbofYb5VpVZDEB+cDWVFDkqbAfx3UtFCPWtgsSblrXjBNp2mXfj6BGv5Apxi0Bxbcfl+7GS0aL0if9FqZmE8dSXY/bi9conysjU0NNd9pCNAJDrDKdnljcnGKW57pwQ7m2O0Nv4S8Dc9BVJavVNCfuQ92pYciXNHx+UNZhvMuf/8szSo19fWEOGW8sp9m1Km6gMVqptlIGeTWGjgkvOIHbKh1vejxZWbarkDWNNW1sOoc/sleINB2i+MKi0K4V7PR1V26VovQbPbF59dQ/oWVE+d/pownlE61QTjmSwmsNdgjUxo4lbz5R1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNdoq0dReMDvTRcXhKlpaQ+3HqUaq+YO0Y1wmrG253E=;
 b=ogPY3y24v4s3b4/WgVnI1EZdqZqCGisNbRAVz+nN2AEvlavt+VGnjjLHU722izlZuExGMTiHIZR7iszntUbLUxJoeDENnqQMi/rghJwiebAd8WcmBbOYTLGAKVqI433oro+sEcvbwdlWdQAhFgUbRfFQ0fkjNw/+JU5VUYQJg7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.39; Mon, 31 Jul
 2023 08:09:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 08:09:05 +0000
Message-ID: <200e9d74-7191-b1ed-e5f3-775827550853@amd.com>
Date: Mon, 31 Jul 2023 10:09:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>,
 alyssa@rosenzweig.io, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
 <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
 <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
 <daf48d76-ceee-c82d-a63a-e8e7770a9d83@amd.com>
 <f5de10fa-57d6-a3d0-1cf9-084491aa6025@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <f5de10fa-57d6-a3d0-1cf9-084491aa6025@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: afb177f1-deb1-4b37-03f5-08db919d68a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FBqb3ah5O8FSXMQAlK0mlP8xkHXKzG0GQS08hjV9i9ztPJQ6JuXSQtu3/aQV7eWe5aWr3S/bfkVtOcsQADG7IJ9dw393nUIICDlTZImHr4Hf9VJ/nf8LVXLW4FTSGa9fr0YX4foy08F6fr6dG9pBp655XYz0VZJlnFVZwMS18m3b3woOuMlkVPM540nq8V2Ix2ZWGY0jFVSEUtRSrp5ldF65IWEZxVcv1U3/9HrCuJFFqL/EzxhWXnxDemPwiAVxVnNoWtWuZj/MDcKcGmxBjOM3FPj0HTiwJLO1ICVDzUsOKpAB9sTRayg7It5gCOArXjllXpY5ZrBYJEP9ffVfqi268r2wROM6onqVI8UMv10W+gGLwrnG5ptBIIDwk95kjG1IiV/H8hQ1CkqBF+76Q0IpX2pHF1NNQIT+fuVQvuXN1wszZn4hB9igFp4oTrifT+FNK4+2iVewHkr/sV/eEKmJYvgioYZLJFine4PMEXg9MCkmqIq5RU2B74PQuE9OfaN8gvARKpRT7Pw1yCjy8Ry6UkiQ5Cm0QRWPvJxg68FBQJXvtXxlM66hoJR+bOyL+zAc7Mt1lA83XQieDpJvusF6Yk7o/Qvirz9TCOIsWUhdTFD10VdETBPBDNuWRTwRaLDY1u9pzRlnhqOS65Tp2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199021)(6512007)(6486002)(36756003)(2616005)(6506007)(83380400001)(186003)(66946007)(66556008)(7416002)(110136005)(41300700001)(31696002)(86362001)(66476007)(316002)(4326008)(5660300002)(8936002)(8676002)(31686004)(38100700002)(2906002)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG1MVmlzSU96cEZ3ZkJVZ09OdUQ5aittZjYyTWFESjkvc28zREhjUkpRSmtU?=
 =?utf-8?B?anpQanRPb0JnczNmb2tMQlFLVnpWWjY0eVdyQ3VzU2NnYU9ITlluOVFMR3o0?=
 =?utf-8?B?VkF0Y1F1U0JsYjFsbzZWRWF3UEhsRXFNZWljUjhVNnNnUWFRT3l6Tko1MS8w?=
 =?utf-8?B?KytDSnFncXBRK0tTUDlQaXUvWHJwR1pnWnFtMFZBdFZzNE9nSHhYN3lHV3Z4?=
 =?utf-8?B?b2hJVXRGcUF2Y0Z3aFE3T0ppdWpmS0xPQXQzZ0ZjMkphVzBJTkNIRk5Ib3BF?=
 =?utf-8?B?RjlHdXp4YVJMV2xwbFpXbCs1aWlsSXIxOE1haHJtL3JZNlpuOW1vdE1UYkNu?=
 =?utf-8?B?UmZTdU5hVlJLOEtNOFZMaHdxVXBBWWo4elVHUFU1MjVRRWI0dVBkUVJxVDVT?=
 =?utf-8?B?QndqbVJIMGluWGZGU3FwcVM4ZTEvRWRlR0NBT3dWOE1oN1lEY0NkZzJQNFR6?=
 =?utf-8?B?NFB1N0xsM09wNFJYRXViTzhGdkVLYmg2Wk5TVk5FZVV2SGpEa3BUeWZacFd3?=
 =?utf-8?B?MEQ4ZUNnTWhwQ2l2aTNzUGgyam05ZFRlUXFpNnFueXpxZjUzS2RrUjh0cllG?=
 =?utf-8?B?cGxsNUk3QitLV0dGZHhjOWR5aVBwRkJyT2R1Vm12aWxqVTRBY3o4ZVBnTDQr?=
 =?utf-8?B?bkUvK1EzZHA3Z3c3Vm9zNEtrWHZXZGxTYm96OWk2V0pHejNnUEhKZ0Q4TjRx?=
 =?utf-8?B?WFZvSFBwZXNCdHkxWG83ZEhkMG9mSG5vYUhabkx5cEtVclNzL2RVU0hkR3VD?=
 =?utf-8?B?OEhsT0xaaUZIQjEzVGJnL0NuQVNJT0NlSUc2eVhNbGhLOWZyZW4weUx2Zi85?=
 =?utf-8?B?dUZkWktBYU9kSzF0aU12NGhqdjJHNmZXL3Y4bUFYRCtDRG12Q2ZQcnNUY0Rx?=
 =?utf-8?B?UkJ6enFjR1k0RGtIZmFURFhyeWFTMmVBa2NZWFM2T1lSSE8rNGtLZUtWSWhF?=
 =?utf-8?B?NzBjc1cvY1loRDAwbENSdU55ekwvc3I5QnJ6dzk0UU0yT1RkQ1FFYkd2bHJC?=
 =?utf-8?B?Y05lSG1Xc3RXOFZvT1dpWmpXZEI3NzI0ZjJ3RXYvN1FvZHhoWWIzejZaRHVl?=
 =?utf-8?B?WWFCYXhSTHRidG85MEdwZVltODcycHI0cDdLUHY3Rjl1K0hxYXJvQjg3czlm?=
 =?utf-8?B?NThrSzEzNGc4UndzU1VzemwrVzFCZlpOdHBKNWI4OWhpZnozbVJTZFZvOFR3?=
 =?utf-8?B?LzF2eHpTOEV0bWJPb2t6UWc1NDIvQklrZEl3RE1kNzRZaXBiVjhjTjFsSUx5?=
 =?utf-8?B?eFRHOHc1aWVoQ3E5UW9Md2lYTTRTTGtXa2VPNHV1QnlyKzlJWUVzRGl6S2hj?=
 =?utf-8?B?Y3lMbTFPbjdrNHJHYXd4MmtKajY1NlpLMjBYRFZKcnNPNmRtS1hoTnJRWjA5?=
 =?utf-8?B?Zi9sdU5uZDBvaHNhczNVR21iMGNlNHkzTFJMNHkra3FrQlZXc01WbjNlZXRO?=
 =?utf-8?B?S3ZpWXA3cTZETUVOL3VJSGFmY0Q1ZzBxWklQVDBTTlJFaWhJZWJNVTRJNXR1?=
 =?utf-8?B?Y09XY1pqdTdlYWV4bG9yOUJabi9SZFNzNHdiV0VBM0tFbENraW5mUWYwN0V2?=
 =?utf-8?B?am1KbFFTYVg4VEJYRFR1NWpIWGVxWnlQMVRsVzA3UkZYdURlZnhmNFp2S0ds?=
 =?utf-8?B?ODhPbVlldURNcnBJR1JMR04vRzZWam10Ny8rdnF1QTdvTFE1OFkxak9kZjJl?=
 =?utf-8?B?Q3RxV2xxcTlSbkJ2ZXJ4OEUvbVBIQWlqVlJ6VWR1SlNvNDlUZmF5Q1E0SW9k?=
 =?utf-8?B?NnlPYTM0cVBXWlNwYzhKVEZkWGJ6a1FpVWlKT202QVVOTFRQWW5nUE1zRjM5?=
 =?utf-8?B?RHhOeWNFTmtvU3RldUxIZ1FuMGFYTFJvQ1grVnpYSVVJeENvdlZ2Q0VRa3lo?=
 =?utf-8?B?bE9LZno5d1VTbXVhTkgyS2NYYVg0NFd0QnNCR2c4L3dMV05uMnYxM2lyRUpW?=
 =?utf-8?B?MERmd0dHbFlhcWhNc0tOWVVIQVkzWVlQL3RiRTk4Ujc2Mi9CVlIrOW4rU0tQ?=
 =?utf-8?B?R25kb2ZicnQ4OXFOTFlSejJhb3JXSGJCcDg5WXBsUlRlbklHWmcyNmJJRHNl?=
 =?utf-8?B?cEpycmN4L0czWnp5QW9UMHdQdFd2SGo5MERQNmFZS0g1Q3EraXdGMWtYcFRr?=
 =?utf-8?B?NTNENmxZeDBpMjdaTktZSUZ1cDNXZS85SmczYkF5eVFCVDlFZ0FTQm5aZnkw?=
 =?utf-8?Q?ZTZM2Byz5mtrIusHSa3fQn2fEknxFvZGbKRYFKG/Duk0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb177f1-deb1-4b37-03f5-08db919d68a3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 08:09:05.6663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvXhP2/E4nJiysUuCL0X0fUPgVhQ6/Ky9ccPTsGdrYPXxXVrx57ZJC/ko8Il1lRU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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
Cc: asahi@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.07.23 um 12:33 schrieb Asahi Lina:
> [SNIP]

> I've already tried to explain the issue. The DRM scheduler design, as 
> it stands today, makes it impractical to write a safe Rust abstraction 
> for it. This is a fact. Christian has repeatedly NAKed my attempts at 
> changing it to make such a safe abstraction possible, and is clearly 
> opposed to the fundamental lifetime requirements change I am trying to 
> make here. Therefore, we are at an impasse.
>
> It's unfortunate, but given this situation, the DRM scheduler will not 
> be available to Rust DRM drivers. I thought the goal of the DRM 
> subsystem common code was to cater to multiple drivers and usage 
> approaches, with an emphasis on doing things "right" and avoiding 
> design issues that are common mistakes in driver design. Clearly, this 
> is not the case for all of DRM, at least not the DRM scheduler.
>
> In software engineering, complex lifetime requirements are an 
> anti-pattern, which is one reason why Rust draws a line between safe 
> and unsafe APIs. For a safe API, it is up to the API developer to 
> design it such that it cannot be misused in a way that causes memory 
> safety issues, and the only lifetime requirements it can impose are 
> those that can be expressed in the Rust type system and statically 
> checked at compile time. The DRM scheduler's complex chain of lifetime 
> requirements cannot, and wrapping it in enough glue to remove those 
> lifetime requirements would require about as much code as just 
> rewriting it, as well as add unacceptable duplication and overhead.
>
> In kernel Rust, we strive to only have safe APIs for components which 
> have no fundamental reason for being unsafe (things like direct memory 
> mapping and raw hardware access). The DRM scheduler does not fall into 
> one of those "inherently unsafe" categories, so it doesn't make sense 
> to provide a raw unsafe API for it.

This is not completely correct. The DRM scheduler provides a dma_fence 
interface as wrapper around hardware dma_fence interfaces.

This interface is made to allow core Linux memory management to query 
the progress of hardware operations.

So you are working with something very low level here and have to follow 
restrictions which Rust can't enforce from the language because it 
simply can't know about that at compile time.

> Doing so would just expose Rust code to the kind of subtle safety 
> implications that cause memory problems every day in C. If I were to 
> use drm_sched's unsafe API "as is" in my driver, it would *by far* be 
> the least auditable, most complex usage of unsafe code in the entire 
> driver, and I have no confidence that I would be able to get it right 
> and keep it right as the driver changes.
>
> I don't see a reason why this cannot be simply fixed in drm_sched, but 
> Christian disagrees, and has repeatedly (and strongly) NAKed my 
> attempts at doing so, and indeed NAKed the entire premise of the 
> change in lifetime requirements itself. So here we are. There is no 
> solution that will work for everyone that involves drm_sched.
>
> So I don't have a choice other than to just not use drm_sched and roll 
> my own. I will happily move that Rust implementation to common code if 
> another Rust driver comes along and wants to use it. I'm not sure if 
> that kind of thing can be easily made available to C drivers in 
> reverse, but I guess we'll cross that bridge when a C driver expresses 
> interest in using it.

Well, to make it clear once more: Signaling a dma_fence from the 
destructor of a reference counted object is very problematic! This will 
be rejected no matter if you do that in C or in Rust.

What we can do is to make it safe in the sense that you don't access 
freed up memory by using the scheduler fences even more as wrapper 
around the hardware fence as we do now. But this quite a change and 
requires a bit more than just hacking around 
drm_sched_fence_get_timeline_name().

>
> So far it seems existing C drivers are happy with drm_sched's design 
> and complex lifetime requirements, even though they aren't even 
> documented. Perhaps they managed to reverse engineer them from the 
> source, or someone told the authors about it (certainly nobody told me 
> when I started using drm_sched). Or maybe a bunch of the drm_scheduler 
> users are actually broken and have memory safety issues in corner 
> cases. I don't know, though if I had to bet, I'd bet on the second 
> option.
>
> Actually, let's do a quick search and find out!
>
> panfrost_remove() -> panfrost_device_fini() -> panfrost_job_fini() -> 
> drm_sched_fini()
>
> There is a direct, synchronous path between device removal and 
> destroying the DRM scheduler. At no point does it wait for any jobs to 
> complete. That's what patch #3 in this series tries to fix.
>
> In fact, it doesn't even keep the entities alive! It calls 
> drm_dev_unregister() before everything else, but as the docs for the 
> DRM driver lifetimes clearly say (see, docs!), objects visible to 
> userspace must survive that and only be released from the release 
> callback. drm_sched entities are created/destroyed from 
> panfrost_job_open()/panfrost_job_close(), which are called from 
> panfrost_open() and panfrost_postclose(), which are the userspace file 
> open/close functions.
>
> That one I fix in the Rust abstraction already (that one's relatively 
> easy to fix), so it doesn't need a drm_sched patch from my point of 
> view, but it is yet another subtle, undocumented lifetime requirement 
> that is, evidently, impossible to know about and get right without 
> documentation.
>
> Meanwhile, panfrost_fence_ops has no remove() callback, which means 
> there is no reference path stopping device removal (and therefore 
> scheduler teardown) or even module unload while driver fences are 
> still alive. That leads to the UAF patch #2 in this series tries to fix.
>
> In other words, as far as I can tell, the panfrost driver gets 
> *everything* wrong when it comes to the DRM scheduler lifetime 
> requirements, and will crash and burn if the driver is unbound while 
> jobs are in flight, anyone has a file descriptor open at all, or even 
> if any shared buffer holding a DRM scheduler fence from it is bound to 
> the display controller at that time.

Yeah, that is perfectly correct what you wrote.

Daniel and I have gone back and forth multiple times how we should 
design this and we opted to not use direct pointers for the contexts 
because that allows for simpler driver implementations.

The DRM scheduler doesn't document the lifetime requirements because it 
doesn't define the lifetime requirements. From the design the DRM 
scheduler is supposed to be an component wrapping around DMA fences. And 
those DMA fences have the necessary lifetime definition.

Now DMA fences have their live cycles explained in the structure 
documentation, but it doesn't really talk much about the requirements 
for dma_fence_ops implementations. We should probably improve that.

So yes, drivers need to keep the structures which might be accessed by 
userspace alive even after the underlying device is removed. But 
signaling dma_fences is completely independent from that.

>
> This is why this kind of design is not allowed in Rust.

Well it is allowed, it's just not safe.

Regards,
Christian.

> Because nobody gets it right. *Especially* not without docs. I 
> assumed, like the authors of the Panfrost driver clearly assumed, that 
> the DRM scheduler API would not have these crazy undocumented hidden 
> requirements. The only reason I found out the hard way is I happen to 
> create and destroy schedulers all the time, not just once globally, so 
> I would hit the bugs and dangling pointers much more often than 
> Panfrost users who, most likely, never unbind their devices. But we 
> both have the same problem.
>
> I think I've done all I can to explain the issues and try to fix them, 
> so the ball is in your court now. If you want to keep the current 
> design, that's fine, but Rust code will not be a drm_sched user in 
> that case. And the rest of the DRM folks in the C world will have to 
> contend with these issues and fix all the problems in the C drivers 
> (I'm sure panfrost isn't the only one, it's just literally the first 
> one I looked at).
>
> As for me, I'm happy to write a simple workqueue-based Rust scheduler 
> suitable for firmware-managed scheduler devices. Honestly, at this 
> point, I have very little faith left in my ability to fix all these 
> issues in drm_sched (I know there's at least one more lurking, I saw a 
> NULL deref but I wasn't able to reproduce it nor divine how it 
> possibly happened). That, combined with the hostility from the AMD 
> folks about my attempts to improve drm_sched even just a little bit, 
> makes that decision very easy.
>
> Farewell, DRM scheduler. It was nice trying to work with you, but 
> things just didn't work out. I won't be submitting a v2 to this series 
> myself. Please ping me if you fix all these fundamental design issues 
> with drm_sched and think I might actually be able to use it safely in 
> Rust one day. If the API design is solid and safe and the 
> implementation done in a way that inspires confidence at that time 
> maybe we can yank out my Rust solution when the time comes and switch 
> back to drm_sched.
>
> Just please don't expect me to do the work any more, I've done 
> everything I can and this now has to come from you, not me. I've spent 
> way more time understanding drm_sched, auditing its code, 
> understanding its design intent, trying to fix it, and getting yelled 
> at for it than it would take to write a new, clean, safe Rust 
> scheduler. I don't regret some of the time spent (some of the 
> implementation details of drm_sched have taught me useful things), but 
> I'm not prepared to spend any more, sorry.
>
> ~~ Lina
>

