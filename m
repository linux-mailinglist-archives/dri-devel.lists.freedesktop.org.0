Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4256D93C5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 12:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985CB10EB52;
	Thu,  6 Apr 2023 10:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A157C10EB52;
 Thu,  6 Apr 2023 10:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+oYaiJdB86G0oSBq37ou9siAYiv4f1U912gyPAO0f8FPAzB8xsnKQDOPqRMUU/Na5HjkZncrWhjAa5OQpB+ZpGorvY8zu0yTlYAiNFpB4JUwXMjEwTYE//Wqryf83ikr2ecAcLubfE5lNtdf7IUi6hz3zVi9QYTkNF8+eqAjI6BE/l9+BjKNM/9VX58MsBYZ0jxbp4XUJvrmRlhY6bkHED8fL9ESEvFwyCAadDS6tOAliHtI4bri+GjATQE0jwA34A3GIypYsyXTP5C5HH70FcHjlG7LcCuzfSXwgXoC3+LXJRKwYOqoFoHIqLgKBazNe6LZoc7dJVS1Oponw8W+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eDS+Zkwz9IrfBG66fIV0PLhRzQXqBi/Kc7/DQ37FII=;
 b=nFv5pev8P57nfb1kZscy90nLfnVZCV8MbhkHE97CKBhTgoejjSdgQUsCmrkEa1NIaiGib0P+oGAUALe9P2DOMk/EtEe5VJVKX7fvCAXKCLb+YPJ7qsQ50+xPXHW8Brx2Wb4KcPpxDH3cspLrvPfIEHs+b/m10SpgYYnAXy2s1mXXVhTB9F08VWuOqmJlG6UJfpgvc4oMqHSoJFY5nJVOfaMkFejnPjylcLCSjOglkTm9BziTb+HTMHACtTUN+AGiM5fo67yuhLv9/xf9dI6aJwwt6h52wbiQfdKzlyDi0FxRR1ysloLeCV+9rq+jlo/qHseeknLkz7Ir6Rq5K49kxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eDS+Zkwz9IrfBG66fIV0PLhRzQXqBi/Kc7/DQ37FII=;
 b=qgIhZVMyZeh4+zGbqK9YgxduaR4DSA88krZIDLBTIo2fsTeeW9zZygEkRpYnZeKcc4/n8XpOIlls0pXkeOK5cQMf0om/mSxfnlSgV20Nh7oSi42O/G5J9TdRasis0p8qkDfRpCyfI6FISH+rJNnCEO/BA+cXFOziRzMaW+9zmWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 10:14:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 10:14:42 +0000
Message-ID: <cf04d0a6-3485-a1aa-8514-a0ecb4266f03@amd.com>
Date: Thu, 6 Apr 2023 12:14:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
 <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
 <d740a81a-8919-b6c8-a8c1-f5d8f9c5549c@amd.com>
 <ZC0yq9XZ2t9cV0Nz@phenom.ffwll.local>
 <a2236a9d-e21a-269c-aad3-184c402065b7@amd.com>
 <ZC06Rl6TGe7itZvW@phenom.ffwll.local>
 <ec128743-699b-3722-0ab2-ff96552fdddd@amd.com>
 <CAKMK7uFEGoaOmewGmP4H_ouqZiMKAiaKwEohGCZq5T-UJYMf_w@mail.gmail.com>
 <ZC4pinCurycVe4bi@DUT025-TGLU.fm.intel.com>
 <ZC5oo8ljg5DWHjhk@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZC5oo8ljg5DWHjhk@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 8351aa5c-75c3-4998-ff43-08db3687bcd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XT23af7BSf2AzQecCYqEO5OVlWTy99XySFoFaYY0CURDuw8C2n9prItiHyxpNumyWriGUtVP49co6gKIVmgiRFp8bEVesq/Du2r6yDnuwdEUi+mVb56u4NK+uFI8Dnho2hk3xrP5Nx0JWyfyhjzCzY5LMo1GhrMv6ig1dKFIWJJhnnTtQhz2EjnE1tAIbVFTD9CHJYuAp+X+fI8BAxvgXQpcxdSmd90aTkcVoLRYi3SSY1skMFtaaNNNF3GemdrzUVP/e8qcE/nFSl1SZgRg3N8MrQloHqUGOro2N7ALSff0QZ79yJ4l4Zwj9A562qTgtmNkcYUSnbHdWvEXbdrXsIys8vFBDdQg0O0tc9B8HfWovUydt5RZvaTkU//3QcNWV5X98WTPxXhgSyTDrfkRDUEfdxwqvYhAQcUOnfghca7wF3UDYvt0a408Ci3wgBcXXynccCEg389NQ16B2GRS11WqtimVTKAYKEjUZFz2CJFIRRGSrq9C9R03FDCpnC807RgIhOfAaqcE73JDkaRr4YwspLWJqCbFArhV5f4MEGLKPO2wE56vUX15J4Jyjuu/4Ii/7YyXSLXuKZ6JzClCQdvUl0RG/na1cbidG0tA3/YbP1e4/NS5xlWLQhlSz/GTr1OdaGmI7HFaXi65a9SVIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(6486002)(66556008)(2616005)(83380400001)(966005)(6506007)(6512007)(186003)(38100700002)(8936002)(66574015)(7416002)(5660300002)(2906002)(26005)(6666004)(478600001)(36756003)(66476007)(41300700001)(66946007)(8676002)(110136005)(4326008)(86362001)(31696002)(316002)(31686004)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlphN3pRbFlTSGRoOGV6djh1dy82bi9QU1c5TkJSZWd6U2xFSjBDd3oxcTY4?=
 =?utf-8?B?aFlMRUg5dDhSa0R6TGc3VDNsOWttYnJWQUZBbnpURkJlUW0ra1N6V3pLSGsy?=
 =?utf-8?B?bndoZ2ZKY3ZzZmNKZGhnazJWa3dubm84Mzg2aUZVdHA4VHlnNHdNdHl0VjlI?=
 =?utf-8?B?NjZQc0dlMjh2K2JFSkpnMy9wdGJDRDZPSlRmd0Q0UjFSTWp2OUYzNEp2aEI2?=
 =?utf-8?B?aEhaV3IvMk93SFI1YTdOdi9rUHpEa0tpU3lpRDdiZjV3dmk2YU1tQ1djQ3hD?=
 =?utf-8?B?cS9BaFN5THRxNjJlVzFPKzhoTkg2RXF5M2llRE9QVm93N0hwQXBmaXlXVHJP?=
 =?utf-8?B?cGw4K0V5bDA0QjVKOGc3OExEZy9tS1V2R1ViQTVvc29kR0ZBOE96MUorZDJK?=
 =?utf-8?B?cy9EWmhFMWJTRU93bzFKN1k5TGJialdWT1k4TWtmbFZsYTFFUnBQdGxvS3NN?=
 =?utf-8?B?d3NsbVdncG91V2NVK0Nqb3NSSHZSS3o5aFQvUDVqT2tpczdpckhQN1UxelFo?=
 =?utf-8?B?aVV1ZUFQSEVqMTJLbXFHOFkwOXNMclAwVWQxUGFicWU3bjgra0tHU1dMVVdS?=
 =?utf-8?B?VEdnSUVnMXBhWURUREpleTdLdDRNYjFIK0RKTkRYUGFUdGlQZUx3NWpVcHJn?=
 =?utf-8?B?OTJwdkg0cjZnVVZ4NjJBa1MxQmVlKy9XV0xkUUhUeXBGN0E3YjhXZ2JEMnNp?=
 =?utf-8?B?YmNEQlBqd1lKWVIyYTRBS1djOWhEWTF4VUlKcUp6UDdJMHdaSDkvU3RhMlF6?=
 =?utf-8?B?QkN3M1YzcVhqRFZPV0FuUnhkbFRuMU5RWmlEcitMa0pPRVp1R1JYcmlRTVJZ?=
 =?utf-8?B?N3JXZ1VMMHJoNlhzZXJPZ1Uzb1pDSWtBOGh2QXVseEtpcHRJOE5YRzdZSkxo?=
 =?utf-8?B?VEJLOEdyeGZkalEwWmdmV05JcGNVSFdMc1JaZVR6allZNU9sVlVqWi9NdFdM?=
 =?utf-8?B?QjQySHV4VlFhSjcyYUowOU9tNWFFd1Z5QnZQV0Jud3gzOWVtTlNaUm1JcGZ1?=
 =?utf-8?B?U2tVbGQvM3FNVGtRSTlMbWxMR2JOWEZZUDVtdnlTMzVLMnJvUVVGOGVBYWVZ?=
 =?utf-8?B?bXM1aG92bzhJTWlYVVQyL2RuTnIzVXhJcS9FNmw5Qnc5eHBmUU9tdEJLL1p6?=
 =?utf-8?B?YVU4UzI5VEpvWE9Pdk9rdDJadWlrcXRHd1ROQmRtaU84eDFrTGRGZzZwU1ls?=
 =?utf-8?B?bDhnS3VIWGZXelJFaklmbkMrZ0hiWjZkbkdsV0pOb3A0emlHUk1zd0prTVoy?=
 =?utf-8?B?clRacVhUOThQRkpncmpTVW1rU1RCQ2JBTitCUzJ1N3lZZXJhenBqaG9ManRT?=
 =?utf-8?B?UGkvWUJHblRQdkxHNmRLdGV6cTVyQVV5UWJHdGFZd2EzM1VmVkVOK3pTcEQv?=
 =?utf-8?B?dGE4enFZTWJrbzdxa2dlbUJDWDUvaEpkeHJySmc2LzZvT0I5RGwwZCtvSGVs?=
 =?utf-8?B?NFFIbTFRZlpDQzArVXdPZTlaaUtLM0dKM1pGcGRxRk96Q0FLN0hzdTcwbUFC?=
 =?utf-8?B?bGZZMVZVbldoRWhtVHNoVWFxVEE5c2p5VjFNRWxvN1FtS2lsQ2hIcS9iLzh5?=
 =?utf-8?B?VXdLRjBQUlNVVXFOUDFjWG5NcjZVK0dnV0hxYTZPS1NTV3pnNlFpNjVHVEtr?=
 =?utf-8?B?L0NyNnVaeThvQ2QzdW54dTN1VE1Veld0MUh6RUFORnVxaWtEZHVacE1ZQmdq?=
 =?utf-8?B?cVNRMHhla0x5bFJ2UGVwOUgwUkFibjNKd24xTkxsS1B1OWZ5eWpnbkN5dm03?=
 =?utf-8?B?ZkFCODJObXFLZ2RyU21KYU5OaGQ0RFFCSGpHcEtKZXRYZ0J4SVhFSU40cmFU?=
 =?utf-8?B?dU43WlNlTWU3L3FLYTh4T2g0TVhNZmgxWUVraitYcnFUNGwyNGU1UjVGVXlW?=
 =?utf-8?B?aWJ2cUJMY0NzeC9SamhsOHZ1R3VWSElNV1pnblFqQXlLSzZQVU5VVld4WWhB?=
 =?utf-8?B?ZUlJNDMzWDVtMloyNU56UUw5d1ZMTkJPaXhlK0R1ald0Ky85Y3dNa0QyNEVX?=
 =?utf-8?B?RjlDbFdQODEzcVhaUDZuOHByV2lwK04yMi9hVVZpU2c3cUVMRnJnclBJVDVT?=
 =?utf-8?B?a0xCSXk0RkdrTjY3b0xjWVBZYmcxMUFKV2xpbFFOdTVVcTdYS01KVnRPbitQ?=
 =?utf-8?Q?xmRUJEmfQsTaLb6ZyL4IeC7AL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8351aa5c-75c3-4998-ff43-08db3687bcd8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 10:14:42.2770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1rm00eWlgTlGN4Fqd8r4rNqirDkFe1OBCITeomsqUiFlDLczYiz7FiA53Wer0+r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, dri-devel@lists.freedesktop.org,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.04.23 um 08:37 schrieb Daniel Vetter:
> On Thu, Apr 06, 2023 at 02:08:10AM +0000, Matthew Brost wrote:
>> On Wed, Apr 05, 2023 at 12:12:27PM +0200, Daniel Vetter wrote:
>>> On Wed, 5 Apr 2023 at 11:57, Christian König <christian.koenig@amd.com> wrote:
>>>> Am 05.04.23 um 11:07 schrieb Daniel Vetter:
>>>>> [SNIP]
>>>>>> I would approach it from the complete other side. This component here is a
>>>>>> tool to decide what job should run next.
>>>>>>
>>>>>> How that is then signaled and run should not be part of the scheduler, but
>>>>>> another more higher level component.
>>>>>>
>>>>>> This way you also don't have a problem with not using DMA-fences as
>>>>>> dependencies as well as constrains for running more jobs.
>>>>> I think we're talking about two things here and mixing them up.
>>>>>
>>>>> For the dependencies I agree with you, and imo that higher level tool
>>>>> should probably just be an on-demand submit thread in userspace for the
>>>>> rare case where the kernel would need to sort out a dependency otherwise
>>>>> (due to running out of ringspace in the per-ctx ringbuffer).
>>>>>
>>>>> The other thing is the message passing stuff, and this is what I was
>>>>> talking about above. This has nothing to do with handling dependencies,
>>>>> but with talking to the gpu fw. Here the intel design issue is that the fw
>>>>> only provides a single queue, and it's in-order. Which means it
>>>>> fundamentally has the stalling issue you describe as a point against a
>>>>> message passing design. And fundamentally we need to be able to talk to
>>>>> the fw in the scheduler ->run_job callback.
>>>>>
>>>>> The proposal here for the message passing part is that since it has the
>>>>> stalling issue already anyway, and the scheduler needs to be involved
>>>>> anyway, it makes sense to integrated this (as an optional thing, only for
>>>>> drivers which have this kind of fw interface) into the scheduler.
>>>>> Otherwise you just end up with two layers for no reason and more ping-pong
>>>>> delay because the ->run_job needs to kick off the subordinate driver layer
>>>>> first. Note that for this case the optional message passing support in the
>>>>> drm/scheduler actually makes things better, because it allows you to cut
>>>>> out one layer.
>>>>>
>>>>> Of course if a driver with better fw interface uses this message passing
>>>>> support, then that's bad. Hence the big warning in the kerneldoc.
>>>> Well what I wanted to say is that if you design the dependency handling
>>>> / scheduler properly you don't need the message passing through it.
>>>>
>>>> For example if the GPU scheduler component uses a work item to do it's
>>>> handling instead of a kthread you could also let the driver specify the
>>>> work queue where this work item is executed on.
>>>>
>>>> When you design it like this the driver specifies the thread context of
>>>> execution for it's job. In other words it can specify a single threaded
>>>> firmware work queue as well.
>>>>
>>>> When you then have other messages which needs to be passed to the
>>>> firmware you can also use the same single threaded workqueue for this.
>>>>
>>>> Drivers which have a different firmware interface would just use one of
>>>> the system work queues instead.
>>>>
>>>> This approach basically decouples the GPU scheduler component from the
>>>> message passing functionality.
>>> Hm I guess we've been talking past each another big time, because
>>> that's really what I thought was under discussions? Essentially the
>>> current rfc, but implementing with some polish.
>>>
>> I think Daniel pretty much nailed it here (thanks), to recap:
>>
>> 1. I want the messages in the same worker so run_job / free_job /
>> process_msg execution is mutual exclusive and also so during reset paths
>> if the worker is stopped all the entry points can't be entered.
>>
>> If this is a NAK, then another worker is fine I guess. A lock between
>> run_job / free_job + process_msg should solve the exclusion issue and the
>> reset paths can also stop this new worker too. That being said I'd
>> rather leave this as is but will not fight this point.
>>
>> 2. process_msg is just used to communicate with the firmware using the
>> same queue as submission. Waiting for space in this queue is the only
>> place this function can block (same as submission), well actually we
>> have the concept a preempt time slice but that sleeps for 10 ms by
>> default. Also preempt is only used in LR entities so I don't think it is
>> relavent in this case either.
>>
>> 3. Agree this is in the dma-fence signaling path (if process_msg is in
>> the submission worker) so we can't block indefinitely or an unreasonable
>> period of time (i.e. we must obey dma-fence rules).
> Just to hammer this in: Not just process_msg is in the dma_fence signaling
> path, but the entire fw queue where everything is being funneled through,
> including whatever the fw is doing to process these.
>
> Yes this is terrible and blew up a few times already :-/
>
> But also, probably something that the docs really need to hammer in, to
> make sure people don't look at this and thinkg "hey this seems to be the
> recommended way to do this on linux". We don't want hw people to build
> more of these designs, they're an absolute pain to deal with with Linux'
> dma_fence signalling and gpu job scheduling rules.
>
> It's just that if you're stuck with such fw, then integrating the flow
> into drm/sched instead of having an extra layer of workers seems the
> better of two pretty bad solutions.

Yeah and if you have such fw limitations, make sure that you use 
something which is understood by lockdep to feed into it.

In other words, either locks or work item/queue and not some message 
passing functionality through the scheduler.

As far as I can see the approach with the work item/queue should fit 
your needs here.

Christian.

> -Daniel
>
>   
>> 4. Agree the documentation for thw usage of the messaging interface
>> needs to be clear.
>>
>> 5. Agree that my code could alway use polishing.
>>
>> Lets close on #1 then can I get on general Ack on this part of the RFC
>> and apply the polish in the full review process?
>>
>> Matt
>>
>>> iow I agree with you (I think at least).
>>> -Daniel
>>> -- 
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch

