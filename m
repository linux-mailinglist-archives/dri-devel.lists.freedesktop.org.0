Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAAB6B1080
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 18:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EA110E6CE;
	Wed,  8 Mar 2023 17:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADF510E6CE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 17:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdR+EIqFy9PB4qqKDVDykGmtF3Yq59mhOrGSw2vIM44k/spJwjTsymvGphhAHlyGUPJBKK7ispvzryXpcX8/mudCRPxXpuHScT7IdHLQHk7o0lEsEBVzrvrO/PjXh8HTn/KbHTfWJlvjlVzfaBiUjx6Ykj8h/kPbFOoGZ5xYs2vsqmtWb7vLjZr+MYobiIW5pdR9cjqjQiHKD7TXxjYhsycvPRL67vMRy7QdKUS6Cca+kZWBQ9Q6D+Pma7YWlIJXowzOyct6QXUSv3XXFZP9yIE5tcTCJ5LWKjBnrambzcWSoIGcH7gSoHTEqCwA9SbJu+lk7NkZWFzdw2be6adPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DRGCLrMgITp6W8gjiyvddvuR9xqhplDm3BWv8XIqN8=;
 b=ItLvLRmaA6xmWmBPBWS1ipTRP1gdSjADqx70UgZkP/1iSGWIQsCD1Q9016eddpwk7Rc0kTOTYany3ldfakW+27sUZmbHvbSeEAvXjPlFIDqosuSASyKV84lB1g7Z0L35jeYfCtg0zgvy6CuG+x8tL8gly9op/hNDSwzzeWgBzzDchFeI56iEN/UUs436GLLZaKslXMwn3KdbHYQj/jidd7HcXP6A3SVRq5A8jxLgv4RHwz91YJDE2gyGWluRhhFNY3BOOZWPmqAq2YwSeXJqtGKGoaapVYKv6cpACqf13pwEV0V/jKgbzWeq0GJsaL2+nrbYPLQLUW7uiSq2R7R0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DRGCLrMgITp6W8gjiyvddvuR9xqhplDm3BWv8XIqN8=;
 b=trIOnfCxowdmxlX0hgNqB/ApEM7EtdWklNMNuhhjMbOgOB9wruh/oV9yYHqnjaMwovtvhudX1GDeTOFDBXWQs/Fp4F/K9W6xNAUQfVTChG8416jJ4hJQgpr9KWHf3d2nld20nW28NoNBjPtMJJHjFwNgbyXmftnYAHXDAzsSl2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB8611.namprd12.prod.outlook.com (2603:10b6:303:1ed::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 17:57:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 17:57:29 +0000
Message-ID: <b0aa78b2-b432-200a-8953-a80c462fa6ee@amd.com>
Date: Wed, 8 Mar 2023 18:57:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
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
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <a075d886-0820-b6fb-fcd0-45bfdc75e37d@asahilina.net>
 <2b1060e9-86ba-7e16-14f1-5b5fa63de719@amd.com>
 <9f76bb68-b462-b138-d0ad-d27c972530d4@asahilina.net>
 <a39c6b40-f190-002d-ae1c-8b58c6442df2@amd.com>
 <4bbfc1a3-cfc3-87f4-897b-b6637bac3bd0@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <4bbfc1a3-cfc3-87f4-897b-b6637bac3bd0@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c9346a-7727-4d1c-c07d-08db1ffe9568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: txGRKntXXuEkUDr19v6xa9qdVixH3Q2eI3k4d98mk6qafSzUf+MlqmOWAcsSVZwzpZFi5ZObIs0S2VmKctQ2AnEO9yFys1baPmDjsnBLtJ/0w02dSPxa31jWLM8KF5UqmRPAImm9RwO/n5P8jPT7B7ICimVlHzPjVFDSnB8QZ8ijwY/XUJXBiKrYJ3rd4nA9FquqvbXYuAKzhrxt9Z0SgWBlAqnU/z6O1eGm0WOfrzdX7iF4m7hb23DjRYopIJkiWNDCaDNGnL6JZriNQ44BQuPXq166LKThbWAeSedWXuR6vLH8GfmGgQE0NkNIYf6YuldQ9umtm648btSvhBHuJQa6ndUHjdxQ2WV8xqCKN9tLnK2M9CO9ASfxcaWVim+rvOAtdhaDHb6I7sL9uU3kLyvNVqa3jMRWtwf1HgLmplqMw2wTqrEdY3GaZdXqGrYhB7u46vfbf58mFjjYP2gK9mnD3Df1HXBfM9/cnJ/JbssdwUWhbkGZjOT6dsZIMiHnecU76fdiVw894npXZ5XV4P7y5pPaqK4oSi6RAPV5WliqHL2RsoKPKPraTNu2tyPaH4W67dGuYwflFhuUAHJS9n7Ooqc6ipF/+JnaWozr2VGAA5JXZY4k+V5sEU5aOXgBc7NVxfCvmW6MfIJPTcmh6pKzp2YyQZdiawy5YM/SORh+EfJG9zeeFay7beiH6bLefJsMNWVlBq1EExL0/KnbmkssETzGiN+ZyNw0HnJTj1xxjPNOUuYhig5yIZpL0zw3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199018)(38100700002)(31696002)(86362001)(921005)(66476007)(36756003)(8936002)(4326008)(8676002)(7416002)(5660300002)(2906002)(41300700001)(66946007)(66556008)(6486002)(186003)(66574015)(83380400001)(110136005)(478600001)(54906003)(2616005)(6512007)(6666004)(316002)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjBoVXl5R0tJdFo4RUpsYUxpcWRyRW5qa0FtL1ArcmlkSG44c0NUQ0lQMnR6?=
 =?utf-8?B?bnVPQ29LOG5HTDZTclhBZUM0dlFUNXl2aEpWazBUdWdla1F2Z3laWCtCb2Iy?=
 =?utf-8?B?SUVJRkxVUVoxcVd5SDNwOVR1RUxXM3Fid2ZkNjB4V1p3d2dEelAyZ3Q4NGF3?=
 =?utf-8?B?dTBuVW80eUp2Ylh5MEdkZkFuaEtaRXFsRGh3MjU2N2YrcFE3bmh2RkxWeGZZ?=
 =?utf-8?B?ak00WjFCSzZFck4xNVdnT0pCaENSQkMzbDdqcnNtQkphZFZhL1ZJbnFrZG5R?=
 =?utf-8?B?Q0J1NnVGNDRLQituN0IrM0M2K0tIT2c5TVhpdGdYYkc4bC8vdTM0UlBMNzhC?=
 =?utf-8?B?bkJwQ2hLZTZDY2poYUwvclgvblN5aVBrbnF3VjNjSWovRUZGZENTOW9zemVZ?=
 =?utf-8?B?QnYrUi92Tzd0NDMwb3F1TGlvR1NEc3NsVkxrd3hPclJQUm1FL3MvTXRiRUx3?=
 =?utf-8?B?ZjhWbFQ0dGFuczRFL2JDeHZKdEtuR3I2cUIwSjhkVVNFQTV6SVRtRVBPN1dk?=
 =?utf-8?B?VE1tRitKZjVpZWlRTktHellpYVI5NHRrQjEwck5BT3dROWQ4QjNCZ1JsWlJt?=
 =?utf-8?B?ZXlnTzlKM3oxV2pBcVFIdnBhNkJLM0dEWXdjMTBTa2d3MCsyd1lzWGlYRVNL?=
 =?utf-8?B?dzEwQ0pXVzNmVXlIM3lmS1o3UEl4clNpQVpsc0c1dGx5WUdKZklyQ0tIMURK?=
 =?utf-8?B?TDkxQlRlZ2gxcm1uUzJnWWFHU0paa2YvUG55T3dGQXdNWTNHblVSYnEwNm9P?=
 =?utf-8?B?K0pnOWZkaVp0bXBvU1dkVzVKVlUra3JlQVlPdFFKTzFpSDN0YVI5UGIxaXBl?=
 =?utf-8?B?ZGRPYmJ3S2Y1UEdnVTV0bE0rOUNyWk5tOWZIQjUrS29xODJvSEFkZ1p4a3dC?=
 =?utf-8?B?OTBZOVI4SDlXM2dQNVhzM1gwSkJrUisvSDlPSWVVeU9lcnY4WVFLM3JaRnBj?=
 =?utf-8?B?NWFYL1NRcUQ1WDRkeHh1L3hqVzZwSGZzdXV2QnNmWnNvUHVhTHBWd0dwc2lp?=
 =?utf-8?B?RmNZdy9GMXF4R2w3VXVQYWlXLzNCaUdyWkM0TldNWFBRdU1FQThMNFA0aVZl?=
 =?utf-8?B?MTFzME91NXRuVGEyczNvMWlkR0tkZkJrMDJBb2k4dTBsR3ZrSlBsOHdaNzNW?=
 =?utf-8?B?SE1aQ2RrNFQrQ3hwRzA1eUlnSjltejNTZmZ6OTNoLzd6dGtsMkF6SVc1MXVa?=
 =?utf-8?B?ekpKYy9VTWN4RnM1NWd2eGN0S1U1NnhhVWV6S3J0MmszUG1JcE5rbGhvU0pn?=
 =?utf-8?B?WEN0ZHgzMFIrMUdUcVpWdUNrcGtKdEtCZUI2NS8xZitpOWZ5SmhoL0JhL2RO?=
 =?utf-8?B?ODYzVk9PZ0Fpa0ttNDRCZjhQb0I0VkhZL1NhVGtFY2tBZUxEMzR0K2FXVUI2?=
 =?utf-8?B?d0h2dUVRRzN4NjQ2YjQ1U2toUFRtMmJ5alNGN0QwcTdQNWFoTzU0SUpTd0dR?=
 =?utf-8?B?cnhTWGc5THdPeWUvT2xVb1VCam1HdGpxWStwZGVJTEJlWDFLc1JPOUJvRzBr?=
 =?utf-8?B?NFgxNXlNOHQ1YzhHOHpTMi9rM1FrVERGemVGZW90d0tPU3FBbWZwZHB1NFBS?=
 =?utf-8?B?VGZmSU93bjhEL2VoWVFKdHhCaWJiMEVxbWswR1Z2VDM3TW9QRXpwUnV4Z2lW?=
 =?utf-8?B?RUNoMUxrV1JjNGd2RVhUc1hGL0lEdHJTc1k0MDRiSzlDWjVGWERwYWYxWjA5?=
 =?utf-8?B?M3RSNVNkNDV3U0syQzArVFBjVU9SWHJQL1kvb2FKaVpFQ0FvZWY5NmN1ejZo?=
 =?utf-8?B?bTkrVFA0dXdHQ0RVeXYwY3F3Ymg1TUQ5L0M3M1NlRUk1QW82ZVowK1Z3eit1?=
 =?utf-8?B?OHBVQXIwWkRVRTgzcnluL2xOQmVISjY2ejgxaGNYb1F1ekJ0bk9hU2E3UTI1?=
 =?utf-8?B?WE83bjFwQXJQMXdTaTN2RVZoWkkxUHc1TWdlQXloYmtkYTZnWjhqU0VGV3Nq?=
 =?utf-8?B?RmY1NURwejhXSkRSUVQ1U09TN25DbXFjQXdvU2daL1hZVUFMYyszVDVsa2xH?=
 =?utf-8?B?YUIva0lpNGpBWUdwZlk3VDBBNkdXNXc3bWlZMVV4Y2F4bVdzUmtCaUt2cHFW?=
 =?utf-8?B?aHQ0Q1JHSm1LTlkycDVITkNXd0ZMa3c5Y2FLalBhT1JJU3h4YjBtU3NJTmxI?=
 =?utf-8?B?TTd6SVNQUnVtdEt0aXorTFE1QktrZkI3NnE3WlJGYXZxbWc2YnlZU3BUV1lD?=
 =?utf-8?Q?GRzaXGzqIOHu3iNmcWVI/xLwu8ehLG7/qgePd7w6eHtr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c9346a-7727-4d1c-c07d-08db1ffe9568
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 17:57:29.3756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wtAZPftS904q5HsrVYtlZUalkOG4Ml8dnco6jH1zc2qSxuw9SYqce7xoNDcWeFl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8611
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

Am 08.03.23 um 17:44 schrieb Asahi Lina:
> On 09/03/2023 00.30, Christian König wrote:
>> Am 08.03.23 um 15:53 schrieb Asahi Lina:
>>> [SNIP]
>>>> The background is that core memory management requires that signaling a
>>>> fence only depends on signaling other fences and hardware progress and
>>>> nothing else. Otherwise you immediately run into problems because of
>>>> circle dependencies or what we call infinite fences.
>>> And hardware progress is exactly the only dependency here...
>> Well then you should have a fence for that hardware progress.
> I do, it's the prior job hardware completion fences that drm_sched
> already knows about!
>
> Yes, I could return those in the prepare callback, it just means I need
> to start stashing fence references in the underlying firmware job queue
> command objects so I can find out what is the oldest pending fence is,
> and return it when a queue is full. As long as drm_sched doesn't mind if
> I keep giving it fences (since multiple commands can have to complete
> before there is space) or the occasional already signaled fence (because
> this process is inherently racy), it should work fine.

Well this handling is intentional and necessary, but see below for a 
more in deep explanation.

> If you think this is the better way, I'll do it that way and drop this
> patch. It just seemed simpler to do it with another callback, since
> drm_sched is already tracking those fences and doing a hardware queue
> limit check anyway, and that way I can avoid tracking the fences down
> into the hardware queue code... *

Well it's not the better way, it's the only way that works.

I have to admit that my bet on your intentions was wrong, but even that 
use case doesn't work correctly.

See when your callback returns false it is perfectly possible that all 
hw fences are signaled between returning that information and processing it.

The result would be that the scheduler goes to sleep and never wakes up 
again.

That's why we have that rule that all dependencies need to be expressed 
by those dma_fence objects, cause those are design with such races in mind.

> (But I still maintain what I'm trying to do here is entirely correct and
> deadlock-free! If you prefer I use prepare_job and return prior job
> fences from that instead, that's very different from NAKing the patch
> saying it's broken...)

As I said we exercised those ideas before and yes this approach here 
came up before as well and no it doesn't work.

> * If you're wondering how the fences get signaled at all then: callback
> closures that capture a reference to the fence when firmware commands
> are constructed and submitted. I know, I know, fancy Rust stuff... ^^
> If you'd rather have me use the fences for the blocking, I'll probably
> just drop the signaling bit from the closures so we don't need to keep
> two redundant fence references in different places per command. I still
> need the closures for command completion processing though, since I use
> them to process statistics too...
>
>> I see that we have a disconnection here. As far as I can see you can use
>> the can_run callback in only three ways:
>>
>> 1. To check for some userspace dependency (We don't need to discuss
>> that, it's evil and we both know it).
>>
>> 2. You check for some hw resource availability. Similar to VMID on
>> amdgpu hw.
>>
>>       This is what I think you do here (but I might be wrong).
> It isn't... I agree, it would be problematic. It doesn't make any sense
> to check for global resources this way, not just because you might
> deadlock but also because there might be nothing to signal to the
> scheduler that a resource was freed at all once it is!
>
>> But this
>> would be extremely problematic because you can then live lock.
>>       E.g. queue A keeps submitting jobs which take only a few resources
>> and by doing so delays submitting jobs from queue B indefinitely.
> This particular issue aside, fairness in global resource allocation is a
> conversation I'd love to have! Right now the driver doesn't try to
> ensure that, a queue can easily monopolize certain hardware resources
> (though one queue can only monopolize one of each, so you'd need
> something like 63 queues with 63 distinct VMs all submitting
> free-running jobs back to back in order to starve other queues of
> resources forever). For starters, one thing I'm thinking of doing is
> reserving certain subsets of hardware resources for queues with a given
> priority, so you can at least guarantee forward progress of
> higher-priority queues when faced with misbehaving lower-priority
> queues. But if we want to guarantee proper fairness, I think I'll have
> to start doing things like switching to a CPU-roundtrip submission model
> when resources become scarce (to guarantee that queues actually release
> the resources once in a while) and then figure out how to add fairness
> to the allocation code...
>
> But let's have that conversation when we talk about the driver (or maybe
> on IRC or something?), right now I'm more interested in getting the
> abstractions reviewed ^^

Well that stuff is highly problematic as well. The fairness aside you 
risk starvation which in turn breaks the guarantee of forward progress.

In this particular case you can catch this with a timeout for the hw 
operation, but you should consider blocking that from the sw side as well.

>> 3. You have an intra queue dependency. E.g. you have jobs which take X
>> amount of resources, you can submit only to a specific limit.
>>       But in this case you should be able to return fences from the same
>> queue as dependency and won't need that callback.
> Yes, I can do this. I can just do the same check can_run_job() does and
> if it fails, pick the oldest job in the full firmware queue and return
> its fence (it just means I need to keep track of those fences there, as
> I said above).
>
>>       We would just need to adjust drm_sched_entity_add_dependency_cb() a
>> bit because dependencies from the same queue are currently filtered out
>> because it assumes a pipeline nature of submission (e.g. previous
>> submissions are finished before new submissions start).
> Actually that should be fine, because I'd be returning the underlying
> hardware completion fences (what the run() callback returns) which the
> driver owns, and wouldn't be recognized as belonging to the sched.
>
>>> I actually know I have a different theoretical deadlock issue along
>>> these lines in the driver because right now we grab actually global
>>> resources (including a VMID) before job submission to drm_sched. This is
>>> a known issue, and to fix it without reducing performance I need to
>>> introduce some kind of "patching/fixup" system for firmware commands
>>> (because we need to inject those identifiers in dozens of places, but we
>>> don't want to construct those commands from scratch at job run time
>>> because that introduces latency at the wrong time and makes error
>>> handling/validation more complicated and error-prone), and that is
>>> exactly what should happen in prepare_job, as you say. And yes, at that
>>> point that should use fences to block when those resources are
>>> exhausted. But that's a different discussion we should have when
>>> reviewing the driver, it has nothing to do with the DRM abstractions nor
>>> the can_run_job callback I'm adding here nor the firmware queue length
>>> limit issue! (And also the global hardware devices are plentiful enough
>>> that I would be very surprised if anyone ever deadlocks it in practice
>>> even with the current code, so I honestly don't think that should be a
>>> blocker for driver submission either, I can and will fix it later...)
>> Well this is what I thought about those problems in amdgpu as well and
>> it totally shipwrecked.
>>
>> We still have memory allocations in the VMID code path which I'm still
>> not sure how to remove.
> We don't even have a shrinker yet, and I'm sure that's going to be a lot
> of fun when we add it too... but yes, if we can't do any memory
> allocations in some of these callbacks (is this documented anywhere?),
> that's going to be interesting...

Yes, that is all part of the dma_fence documentation. It's just 
absolutely not obvious what all this means.

> It's not all bad news though! All memory allocations are fallible in
> kernel Rust (and therefore explicit, and also failures have to be
> explicitly handled or propagated), so it's pretty easy to point out
> where they are, and there are already discussions of higher-level
> tooling to enforce rules like that (and things like wait contexts).
> Also, Rust makes it a lot easier to refactor code in general and not be
> scared that you're going to regress everything, so I'm not really
> worried if I need to turn a chunk of the driver on its head to solve
> some of these problems in the future ^^ (I already did that when I
> switched it from the "demo" synchronous submission model to the proper
> explicit sync + fences one.)

Yeah, well the problem isn't that you run into memory allocation failure.

The problem is rather something like this:
1. You try to allocate memory to signal your fence.
2. This memory allocation can't be fulfilled and goes to sleep to wait 
for reclaim.
3. On another CPU reclaim is running and through the general purpose 
shrinker, page fault or MMU notifier ends up wait for your dma_fence.

You don't even need to implement the shrinker for this to go boom 
extremely easy.

So everything involved with signaling the fence can allocate memory only 
with GFP_ATOMIC and only if you absolutely have to.

Christian.


>
> ~~ Lina

