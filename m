Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C14E70DB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 11:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC09710E721;
	Fri, 25 Mar 2022 10:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BBC10E721
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayv1Ev9QPkWhxgSfB6i3I9Dq3i0BH3hCHQOZ5ItooylMK3i8zCWROJ5uheq8QUKQyTIn2FUrno2oB7qfJZz+U23NtPAaPETmlXCcvIF2UT2a/rJtGmKQgaaQ3nvCdC3bTpvAIGc5CI8OmzR5Q+WNQlryoCELdgzUQa96Qut/vYw6zkJlCE564b9uBjKtM1/Y7Cg7Ar0bWCJFJQMgZQN8Rxknvcrh8kdmd6nf5eevv/Mkf70cNS9X21Kq8cSc9SNlYYTgxGZmA7sgWsvl/T1osgEs2GH9sP1QbRZDFW2j4TwFGeZ9nP4w+uST6bA82x3EKB9dibiE1rk9S0SB2BgXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nn06+A++6KnROxvFu5T7WIjyKw6If9WvVFVQrDDfVI0=;
 b=HW54FodCna4zzX7cvMG7RJjyoTwfP8YxzVA7y9IAqm0IouZ+EDxuumcqarSfqmeahsL5VpbsS6Pn618eg+hKU001ktzAZ0ICqldzoFrb0t+2FwTlUef5XEiqVOEu8nyar0E74KspWQOnxMcr98u6xuRbwi1atVpFeffEoowBna0+Vy9naFeoAmLn8OMl6s/eGPghnjjBIAY3+ou4OOtsF8FB7a9N1Q+1ahiXx0IJ05kVCD1gSpoL5EKgz6kF/LaIIHSBWGcZKCKXfq2uz7a7odf1eGcFAQovMRchVsx6Tl6u8qjqBRvursNlthQ78+IcP3/R63xrRvzltebBVQgneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn06+A++6KnROxvFu5T7WIjyKw6If9WvVFVQrDDfVI0=;
 b=RRlgIYXxbnTDkC3ydizGEVcyzWJhTkyFQfCb2KycOfc7XeFF2xWCbOOmaF4kxzVNfY4Z4BHg2SnblDgfRsuwvkkBaJApOqjadKhl6abWmxvrPx1uEdhWnslxu3Dmjf7DmSe5mWQSFd4AOQ3raxPaAJQYKRGp+mnimlYsJQq8JQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB2680.namprd12.prod.outlook.com (2603:10b6:a03:63::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Fri, 25 Mar
 2022 10:10:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.017; Fri, 25 Mar 2022
 10:10:21 +0000
Message-ID: <83c2935d-e5e9-7c4d-f350-9372cce26c8d@amd.com>
Date: Fri, 25 Mar 2022 11:10:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <Yj2TiqwRMTNEEB3D@phenom.ffwll.local> <Yj2UXwOh7/bAm8+J@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yj2UXwOh7/bAm8+J@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::29) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26598dcf-6f12-4f47-d95f-08da0e47abef
X-MS-TrafficTypeDiagnostic: BYAPR12MB2680:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB26805D0B132BA0464FAA2B10831A9@BYAPR12MB2680.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4e5mWEiLTpQwd9PZQ1s8HqWbRU7Yqz4nEIOWFdWGQfXf3Pl4eChuB6IYkfSYCxZ/4esVl7wVyNn617gp9e0aoeehFuGSgvJ+nIzKVnfnmlCfqJu0/6LTnD23eCPq80HwFPCFslZoaXD5t16EwWXMss8ObXQTeg0GEBKkoW6Gtpb1HkwmBI20Qw4ojlBWv7Ro9HWzI+dFufocfvfsSkLzHzLwE8OzCDM4co7zve8XuwnFTdropWLcn4raE1B+Il2DcNSdWd+Pn+8Cl9OSj1pBSoro/05JBfzSpU1IOPKZdarLNXT+jCbOQE6kXdE2XPmZHqX2cbsgT3h2Bl9AKUPXF2wsVVof83IhOQYeBzlUR/SE8xlf3Isp+rrPDOwppA3BsS8VQoARhI+6ws1cazmMu0uh3bYZAYmpbzPJRPB0jKIHhyg7Ib3kPKsBmYkMnoX3uoiY9SvTzejKRWeSw3MG1rwl0fxeXOUV25skUdu0fEDrA08lxrbFJ+VKBLam9WqVODgeCdWwOPYMZbrjUYFbatIjwByMTonuXoES2t7/8V5x9kCYETs20Rio9DAAvbvLI83i/mgxnZTaoAWslQJ3/A+x7pvPK4BtMeuEFpA2p1WrYZ9mQ5h+J5tKhr/l43jZzDS/5BvV5moykW5w3wnMQnkiJu8PA2/xd0Yoe3g4SCvQJ0aeByCpWp4x8ViY5zzWIdtCF8NT7t7JhcMWA+y4YYf361KJEJOkar5cIFUBRCOOb1wgBhXx71QMAKip1BnEvc4cTjZ9PZO2zAYWUaElWVCEcdMdWSo7wvhidVCoZiVB6IVYKBC412QfYjGeMrZeLI11+tflIWykksN8A98MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(45080400002)(2616005)(66574015)(508600001)(31696002)(86362001)(83380400001)(26005)(316002)(186003)(6506007)(8936002)(5660300002)(36756003)(4326008)(6512007)(110136005)(30864003)(31686004)(8676002)(66556008)(66946007)(6666004)(66476007)(38100700002)(6486002)(966005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTE4alZhWk5OUVBYcmljbXYrM1BrTkNVOEdYN3Mrd2dsb1I4K3JjclFiS2g1?=
 =?utf-8?B?K0VXODJQUFNZcUFjTnZvS2hCU0xyekh1YU9YbU9KZzhOL3RnbkNnTjRhK0NO?=
 =?utf-8?B?NithaEhOQnBtRVU3TlZaMEptWXZDcE9QTjJXTVlGeEdrL1lpMVh3K1kvMm5m?=
 =?utf-8?B?M0V2THBZQ1Z4b1NQWDVFWlRKcGtkZTF2QlRjM25MQm1id0JQL2FPNktWOUxi?=
 =?utf-8?B?dlVYUytZcm1JMG1HejV2azVBaG9RU2s1bUh4TDQ2a084VmVRSmdwOFQwZzlz?=
 =?utf-8?B?dTdSUVQ5anVCakk3QWtKcVlySGZ2L1dZN0MyazNvZGFuQ3R0UVFPTEp3b1ZB?=
 =?utf-8?B?RE9YQUFObGFrRWNEaWxlY3h6eVBoTGh1RE5taDFudEEyUHk3UzE3NUJMNnlo?=
 =?utf-8?B?MzVzc2Rldm8rSS9NVmdzVUwycHh4UklYem0xV050a2NpRXYwWWN6S2JaazUx?=
 =?utf-8?B?Rm03dmpWcyt6NGhJNUlZMWhSajlCWVMwM3Z0NDIxdDB2WTBnaUp1aFdTamdH?=
 =?utf-8?B?VGNVTjN1NldPVG9qVzNMeFVySXZMZis5TVl3bkVERTNzZ1pYNVBCbGVXaXRT?=
 =?utf-8?B?Rm9CaE9DNzBoRVFjZ1ZVaklCUFZEUGJkcWpVUGhIK2ZmNnJCbDhMVTEzaTJl?=
 =?utf-8?B?WWRuWTBsNnZsWE1aaVdjVG1zTEp4Qmo3dDNndnhSSHBkbjc0N3Q2cjBVS1U2?=
 =?utf-8?B?U1Q4dHJxUjBLNVJhK0tZRlUyNHkwQ0ZQNkExWktiajBjRkZpUHczem83ZENJ?=
 =?utf-8?B?TWp5aXFMSkhmRDVpZURzZENFSUFmVk5HL1h0VHoxeWR1cnY4bjIwL3A5TGl1?=
 =?utf-8?B?S0ZCSG5TU1o0cGhCTngrSVd5dDQvdkpyL25XSmNpSVpvTmV3RWtGbFVubmht?=
 =?utf-8?B?OWJ2RTA3L2NnSzhGL0dtS3B2QzZCZWp2ZXE2MDdERXBERWRodUtibGhlaGRP?=
 =?utf-8?B?Y2lUMit5ZGkvTzZKKzQ1ZmdmaElIMjVHS3VQTm56VFQ0REpEVk9yeG9Pb1dZ?=
 =?utf-8?B?VFk0MEVKSGlrS0xUV2Npa0dhVURwa0hySEJoSE0ydnlPYlJvbjZ4YldrclBM?=
 =?utf-8?B?MGtSOU1mTUovQVQyRnpMNFRUcmFJWUs2cVJPcUNWVFVhQ1lrdnlWRVFId0gv?=
 =?utf-8?B?bEw3WmhrUS9CK0JDdkZpWFQ4UHVaS21mRGIyT0QxcTdzTmJURVVQVUNEcFla?=
 =?utf-8?B?TGx3c1dxdm8xc2JZZjV3UXdBQ2xqSXVqT0VwbTRST2NMbExMT21WKzJzL1lt?=
 =?utf-8?B?bHl6TDB1M01RSnlaUVRBUlpYbCtGNjVyV3ZnbVVoT0I1UERrQ0xmOStLQS9s?=
 =?utf-8?B?RmhWUE1DY1NqMSs2bU80S2FuQmtGZDFaRWVIQVUvRHZCWnB6Vkt5MFlSK0Qw?=
 =?utf-8?B?UktVWW1wMkgzeEkzTjE2V1FJT2t6azdxWlB6blB3amx2b2FMc1NBbDF4RzFY?=
 =?utf-8?B?di9nY0RTeDN5dXFmbTFLSkJ1bWhwZElaR1g5akYvZURDbVF5bVNBejEyMEhY?=
 =?utf-8?B?enUwWWxUU2dLVUUxMnNZWDBTQnlIZVkzdzB2ZHdYdFhodEYrY0lBbTB6QlFD?=
 =?utf-8?B?WDJxU0RQbXlCaHIxZWFGR1I1czZWdXZqTnpscU1jSDdkOXQ5Zms4ZFpVRFhk?=
 =?utf-8?B?QnZnRWdoM1VTN2E0OHZMdjVrZUNmRXowVmxSaWcrOHhDNlRCRGcwTnlXbEVm?=
 =?utf-8?B?YWhkdFFrcURzTG9uSkNUN2pqUGtxQzBHSk8wSFVuclM4VGwwUjBRY3ovZjFy?=
 =?utf-8?B?K2FnYm1TQndXQUxscmVibkdNdkpVVzUySERiQ2tpMVlibGxzdmJFOXgyR2k4?=
 =?utf-8?B?U2I5TTVpYVdqZjhuZGJ5STM3am9VWGdqSUZMdi9reFZaalBtL25zYzgvY2Rp?=
 =?utf-8?B?YUtpWEJuSjVkakw3QW1EczJoZVFYeWIrQUpDSkJneEtDUEJLUVkzdytjMkpa?=
 =?utf-8?Q?lW4YxRfVl8uFODhqqNZxSRtIS5MJZl04?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26598dcf-6f12-4f47-d95f-08da0e47abef
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 10:10:21.8154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpnguJ8m5zfbh0LjPhVzJPlUau5WGEO7ej8M6i2JS/8syqSixsuG1B/X730Wq/cK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2680
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
Cc: linaro-mm-sig@lists.linaro.org, gustavo@padovan.org,
 sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.03.22 um 11:07 schrieb Daniel Vetter:
> On Fri, Mar 25, 2022 at 11:03:54AM +0100, Daniel Vetter wrote:
>> On Fri, Mar 11, 2022 at 12:02:43PM +0100, Christian König wrote:
>>> Add a general purpose helper to deep dive into dma_fence_chain/dma_fence_array
>>> structures and iterate over all the fences in them.
>>>
>>> This is useful when we need to flatten out all fences in those structures.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   Documentation/driver-api/dma-buf.rst  |   6 +
>>>   drivers/dma-buf/Makefile              |   1 +
>>>   drivers/dma-buf/selftests.h           |   1 +
>>>   drivers/dma-buf/st-dma-fence-unwrap.c | 279 ++++++++++++++++++++++++++
>>>   include/linux/dma-fence-unwrap.h      |  99 +++++++++
>>>   5 files changed, 386 insertions(+)
>>>   create mode 100644 drivers/dma-buf/st-dma-fence-unwrap.c
>>>   create mode 100644 include/linux/dma-fence-unwrap.h
>>>
>>> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
>>> index 2cd7db82d9fe..7209500f08c8 100644
>>> --- a/Documentation/driver-api/dma-buf.rst
>>> +++ b/Documentation/driver-api/dma-buf.rst
>>> @@ -194,6 +194,12 @@ DMA Fence Chain
>>>   .. kernel-doc:: include/linux/dma-fence-chain.h
>>>      :internal:
>>>   
>>> +DMA Fence unwrap
>>> +~~~~~~~~~~~~~~~~
>>> +
>>> +.. kernel-doc:: include/linux/dma-fence-unwrap.h
>>> +   :internal:
> Ok I forgot one bikeshed: I'd just include this in dma-fence-chain.h and
> maybe go with the dma_fence_chain_unwrap_ prefix for everything. That
> makes it even more clearer that the two are meant to go together. Plus ofc
> the link from struct dma_fence_chain to this iterator in the docs too.
>
> Or I'm just not understanding why you made this a separate thing?

Well it should be used to unwrap dma_fence_array containers as well and 
I don't really want to add a dependency between dma_fence_chain and 
dma_fence_array.

I've spend quite some work to keep the two containers separated and also 
describe the separate use cases for each.

I can of course add some kerneldoc to let the chain and array 
documentation point to this one here.

Thanks,
Christian.

> -Daniel
>
>>> +
>>>   DMA Fence uABI/Sync File
>>>   ~~~~~~~~~~~~~~~~~~~~~~~~
>>>   
>>> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
>>> index 511805dbeb75..4c9eb53ba3f8 100644
>>> --- a/drivers/dma-buf/Makefile
>>> +++ b/drivers/dma-buf/Makefile
>>> @@ -12,6 +12,7 @@ dmabuf_selftests-y := \
>>>   	selftest.o \
>>>   	st-dma-fence.o \
>>>   	st-dma-fence-chain.o \
>>> +	st-dma-fence-unwrap.o \
>>>   	st-dma-resv.o
>>>   
>>>   obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
>>> diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
>>> index 97d73aaa31da..851965867d9c 100644
>>> --- a/drivers/dma-buf/selftests.h
>>> +++ b/drivers/dma-buf/selftests.h
>>> @@ -12,4 +12,5 @@
>>>   selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
>>>   selftest(dma_fence, dma_fence)
>>>   selftest(dma_fence_chain, dma_fence_chain)
>>> +selftest(dma_fence_unwrap, dma_fence_unwrap)
>>>   selftest(dma_resv, dma_resv)
>>> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
>>> new file mode 100644
>>> index 000000000000..d821faaebe93
>>> --- /dev/null
>>> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
>>> @@ -0,0 +1,279 @@
>>> +// SPDX-License-Identifier: MIT
>>> +
>>> +/*
>>> + * Copyright (C) 2022 Advanced Micro Devices, Inc.
>>> + */
>>> +
>>> +#include <linux/dma-fence-unwrap.h>
>>> +#if 0
>>> +#include <linux/kernel.h>
>>> +#include <linux/kthread.h>
>>> +#include <linux/mm.h>
>>> +#include <linux/sched/signal.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/spinlock.h>
>>> +#include <linux/random.h>
>>> +#endif
>>> +
>>> +#include "selftest.h"
>>> +
>>> +#define CHAIN_SZ (4 << 10)
>>> +
>>> +static struct kmem_cache *slab_fences;
>> Your own slab feels a bit like overkill. kmalloc/kfree not good enough?
>>
>>> +
>>> +static inline struct mock_fence {
>>> +	struct dma_fence base;
>>> +	spinlock_t lock;
>>> +} *to_mock_fence(struct dma_fence *f) {
>>> +	return container_of(f, struct mock_fence, base);
>>> +}
>>> +
>>> +static const char *mock_name(struct dma_fence *f)
>>> +{
>>> +	return "mock";
>>> +}
>>> +
>>> +static void mock_fence_release(struct dma_fence *f)
>>> +{
>>> +	kmem_cache_free(slab_fences, to_mock_fence(f));
>>> +}
>>> +
>>> +static const struct dma_fence_ops mock_ops = {
>>> +	.get_driver_name = mock_name,
>>> +	.get_timeline_name = mock_name,
>>> +	.release = mock_fence_release,
>>> +};
>>> +
>>> +static struct dma_fence *mock_fence(void)
>>> +{
>>> +	struct mock_fence *f;
>>> +
>>> +	f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
>>> +	if (!f)
>>> +		return NULL;
>>> +
>>> +	spin_lock_init(&f->lock);
>>> +	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
>>> +
>>> +	return &f->base;
>>> +}
>>> +
>>> +static struct dma_fence *mock_array(unsigned int num_fences, ...)
>>> +{
>>> +	struct dma_fence_array *array;
>>> +	struct dma_fence **fences;
>>> +	va_list valist;
>>> +	int i;
>>> +
>>> +	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
>>> +	if (!fences)
>>> +		return NULL;
>>> +
>>> +	va_start(valist, num_fences);
>>> +	for (i = 0; i < num_fences; ++i)
>>> +		fences[i] = va_arg(valist, typeof(*fences));
>>> +	va_end(valist);
>>> +
>>> +	array = dma_fence_array_create(num_fences, fences,
>>> +				       dma_fence_context_alloc(1),
>>> +				       1, false);
>>> +	if (!array)
>>> +		goto cleanup;
>>> +	return &array->base;
>>> +
>>> +cleanup:
>>> +	for (i = 0; i < num_fences; ++i)
>>> +		dma_fence_put(fences[i]);
>>> +	kfree(fences);
>>> +	return NULL;
>>> +}
>>> +
>>> +static struct dma_fence *mock_chain(struct dma_fence *prev,
>>> +				    struct dma_fence *fence)
>>> +{
>>> +	struct dma_fence_chain *f;
>>> +
>>> +	f = dma_fence_chain_alloc();
>>> +	if (!f) {
>>> +		dma_fence_put(prev);
>>> +		dma_fence_put(fence);
>>> +		return NULL;
>>> +	}
>>> +
>>> +	dma_fence_chain_init(f, prev, fence, 1);
>>> +	return &f->base;
>>> +}
>>> +
>>> +static int sanitycheck(void *arg)
>>> +{
>>> +	struct dma_fence *f, *chain, *array;
>>> +	int err = 0;
>>> +
>>> +	f = mock_fence();
>>> +	if (!f)
>>> +		return -ENOMEM;
>>> +
>>> +	array = mock_array(1, f);
>>> +	if (!array)
>>> +		return -ENOMEM;
>>> +
>>> +	chain = mock_chain(NULL, array);
>>> +	if (!chain)
>>> +		return -ENOMEM;
>>> +
>>> +	dma_fence_signal(f);
>>> +	dma_fence_put(chain);
>>> +	return err;
>>> +}
>>> +
>>> +static int unwrap_array(void *arg)
>>> +{
>>> +	struct dma_fence *fence, *f1, *f2, *array;
>>> +	struct dma_fence_unwrap iter;
>>> +	int err = 0;
>>> +
>>> +	f1 = mock_fence();
>>> +	if (!f1)
>>> +		return -ENOMEM;
>>> +
>>> +	f2 = mock_fence();
>>> +	if (!f2) {
>>> +		dma_fence_put(f1);
>>> +		return -ENOMEM;
>>> +	}
>>> +
>>> +	array = mock_array(2, f1, f2);
>>> +	if (!array)
>>> +		return -ENOMEM;
>>> +
>>> +	dma_fence_unwrap_for_each(fence, &iter, array) {
>>> +		if (fence == f1) {
>>> +			f1 = NULL;
>>> +		} else if (fence == f2) {
>>> +			f2 = NULL;
>>> +		} else {
>>> +			pr_err("Unexpected fence!\n");
>>> +			err = -EINVAL;
>>> +		}
>>> +	}
>>> +
>>> +	if (f1 || f2) {
>>> +		pr_err("Not all fences seen!\n");
>>> +		err = -EINVAL;
>>> +	}
>>> +
>>> +	dma_fence_signal(f1);
>>> +	dma_fence_signal(f2);
>>> +	dma_fence_put(array);
>>> +	return 0;
>>> +}
>>> +
>>> +static int unwrap_chain(void *arg)
>>> +{
>>> +	struct dma_fence *fence, *f1, *f2, *chain;
>>> +	struct dma_fence_unwrap iter;
>>> +	int err = 0;
>>> +
>>> +	f1 = mock_fence();
>>> +	if (!f1)
>>> +		return -ENOMEM;
>>> +
>>> +	f2 = mock_fence();
>>> +	if (!f2) {
>>> +		dma_fence_put(f1);
>>> +		return -ENOMEM;
>>> +	}
>>> +
>>> +	chain = mock_chain(f1, f2);
>>> +	if (!chain)
>>> +		return -ENOMEM;
>>> +
>>> +	dma_fence_unwrap_for_each(fence, &iter, chain) {
>>> +		if (fence == f1) {
>>> +			f1 = NULL;
>>> +		} else if (fence == f2) {
>>> +			f2 = NULL;
>>> +		} else {
>>> +			pr_err("Unexpected fence!\n");
>>> +			err = -EINVAL;
>>> +		}
>>> +	}
>>> +
>>> +	if (f1 || f2) {
>>> +		pr_err("Not all fences seen!\n");
>>> +		err = -EINVAL;
>>> +	}
>>> +
>>> +	dma_fence_signal(f1);
>>> +	dma_fence_signal(f2);
>>> +	dma_fence_put(chain);
>>> +	return 0;
>>> +}
>>> +
>>> +static int unwrap_chain_array(void *arg)
>>> +{
>>> +	struct dma_fence *fence, *f1, *f2, *array, *chain;
>>> +	struct dma_fence_unwrap iter;
>>> +	int err = 0;
>>> +
>>> +	f1 = mock_fence();
>>> +	if (!f1)
>>> +		return -ENOMEM;
>>> +
>>> +	f2 = mock_fence();
>>> +	if (!f2) {
>>> +		dma_fence_put(f1);
>>> +		return -ENOMEM;
>>> +	}
>>> +
>>> +	array = mock_array(2, f1, f2);
>>> +	if (!array)
>>> +		return -ENOMEM;
>>> +
>>> +	chain = mock_chain(NULL, array);
>>> +	if (!chain)
>>> +		return -ENOMEM;
>>> +
>>> +	dma_fence_unwrap_for_each(fence, &iter, chain) {
>>> +		if (fence == f1) {
>>> +			f1 = NULL;
>>> +		} else if (fence == f2) {
>>> +			f2 = NULL;
>>> +		} else {
>>> +			pr_err("Unexpected fence!\n");
>>> +			err = -EINVAL;
>>> +		}
>>> +	}
>>> +
>>> +	if (f1 || f2) {
>>> +		pr_err("Not all fences seen!\n");
>>> +		err = -EINVAL;
>>> +	}
>>> +
>>> +	dma_fence_signal(f1);
>>> +	dma_fence_signal(f2);
>>> +	dma_fence_put(chain);
>>> +	return 0;
>>> +}
>>> +
>>> +int dma_fence_unwrap(void)
>>> +{
>>> +	static const struct subtest tests[] = {
>>> +		SUBTEST(sanitycheck),
>>> +		SUBTEST(unwrap_array),
>>> +		SUBTEST(unwrap_chain),
>>> +		SUBTEST(unwrap_chain_array),
>>> +	};
>>> +	int ret;
>>> +
>>> +	slab_fences = KMEM_CACHE(mock_fence,
>>> +				 SLAB_TYPESAFE_BY_RCU |
>>> +				 SLAB_HWCACHE_ALIGN);
>>> +	if (!slab_fences)
>>> +		return -ENOMEM;
>>> +
>>> +	ret = subtests(tests, NULL);
>>> +
>>> +	kmem_cache_destroy(slab_fences);
>>> +	return ret;
>>> +}
>>> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
>>> new file mode 100644
>>> index 000000000000..54963df00c98
>>> --- /dev/null
>>> +++ b/include/linux/dma-fence-unwrap.h
>>> @@ -0,0 +1,99 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * fence-chain: chain fences together in a timeline
>>> + *
>>> + * Copyright (C) 2022 Advanced Micro Devices, Inc.
>>> + * Authors:
>>> + *	Christian König <christian.koenig@amd.com>
>>> + */
>>> +
>>> +#ifndef __LINUX_DMA_FENCE_UNWRAP_H
>>> +#define __LINUX_DMA_FENCE_UNWRAP_H
>>> +
>>> +#include <linux/dma-fence-chain.h>
>>> +#include <linux/dma-fence-array.h>
>>> +
>>> +/**
>>> + * struct dma_fence_unwrap - cursor into the container structure
>> I think adding "This should be used together with
>> dma_fence_unwrap_for_each() iterator macro." would be nice here. I just
>> like links :-)
>>
>>> + */
>>> +struct dma_fence_unwrap {
>>> +	/**
>>> +	 * @chain: potential dma_fence_chain, but can be other fence as well
>>> +	 */
>>> +	struct dma_fence *chain;
>>> +	/**
>>> +	 * @array: potential dma_fence_array, but can be other fence as well
>>> +	 */
>>> +	struct dma_fence *array;
>>> +	/**
>>> +	 * @index: last returned index if @array is really a dma_fence_array
>>> +	 */
>>> +	unsigned int index;
>>> +};
>>> +
>>> +/**
>>> + * dma_fence_unwrap_array - helper to unwrap dma_fence_arrays
>>> + * @cursor: cursor to initialize
>>> + *
>>> + * Helper function to unwrap dma_fence_array containers, don't touch directly.
>>> + * Use dma_fence_unwrap_first/next instead.
>>> + */
>>> +static inline struct dma_fence *
>>> +dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
>> Since this is a helper that no one should call I'd give it a __ prefix and
>> drop the kerneldoc. Documenting stuff that people shouldn't use is
>> confusing :-)
>>
>>> +{
>>> +	cursor->array = dma_fence_chain_contained(cursor->chain);
>>> +	cursor->index = 0;
>>> +	return dma_fence_array_first(cursor->array);
>>> +}
>>> +
>>> +/**
>>> + * dma_fence_unwrap_first - return the first fence from fence containers
>>> + * @head: the entrypoint into the containers
>>> + * @cursor: current position inside the containers
>>> + *
>>> + * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
>>> + * first fence.
>>> + */
>>> +static inline struct dma_fence *
>>> +dma_fence_unwrap_first(struct dma_fence *head, struct dma_fence_unwrap *cursor)
>>> +{
>>> +	cursor->chain = dma_fence_get(head);
>>> +	return dma_fence_unwrap_array(cursor);
>>> +}
>>> +
>>> +/**
>>> + * dma_fence_unwrap_next - return the next fence from a fence containers
>>> + * @cursor: current position inside the containers
>>> + *
>>> + * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
>>> + * the next fence from them.
>>> + */
>>> +static inline struct dma_fence *
>>> +dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>>> +{
>>> +	struct dma_fence *tmp;
>>> +
>>> +	++cursor->index;
>>> +	tmp = dma_fence_array_next(cursor->array, cursor->index);
>>> +	if (tmp)
>>> +		return tmp;
>>> +
>>> +	cursor->chain = dma_fence_chain_walk(cursor->chain);
>>> +	return dma_fence_unwrap_array(cursor);
>>> +}
>>> +
>>> +/**
>>> + * dma_fence_unwrap_for_each - iterate over all fences in containers
>>> + * @fence: current fence
>>> + * @cursor: current position inside the containers
>>> + * @head: starting point for the iterator
>>> + *
>>> + * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
>>> + * potential fences in them. If @head is just a normal fence only that one is
>>> + * returned.
>>> + */
>>> +#define dma_fence_unwrap_for_each(fence, cursor, head)			\
>>> +	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
>>> +	     fence = dma_fence_unwrap_next(cursor))
>>> +
>>> +#endif
>> I think it'd be really good to add a small paragraph to struct
>> dma_fence_chain that this macro and iterator should be used for walking
>> over all fences in a chain, including any fence arrays or anything like
>> that.
>>
>> With the bikesheds addressed:
>>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>>> -- 
>>> 2.25.1
>>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Caa747083900b451d359308da0e4745e3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637837996532802687%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Jts5%2BObWJHeUG4oy2biwj5Bf3PKkMrYU%2F0EihvQRNuY%3D&amp;reserved=0

