Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC1D4E6F1D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 08:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC3A10E1BB;
	Fri, 25 Mar 2022 07:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3851410E1BB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 07:42:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVBCID+l7tPaqmK6qVRAkflzy2FbEkY+QMMBE2c0nwoO6f2W37wUscTg704+MBNsQxyBiEWob1daixC9i51hY0+uZegQJnDtcO3rlD2esrnAbcID++or+pU69pqr+UcWGnLMbBmP9kCX576N/48Ltb/Egwe7Qp4SvmXO52t6yWpT6Gl0SyaY2qt9yf2YhdQ0M6DYusDu1qYxvRgH/I1LpiMY7IUAyz7EXYKWk8gaMchnu2ZTa048D10CtbYVFAOI40kqnv9UPLnHcMiuxzL0ueXPq2SSbWez9K7zTZLzqc+9/8Ns2MauRDyhGTNz0ZdmSHVtphB/L9ge2+v88t73dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hONXqNeaGQxREzDQyDt3PmwDYOHnnKNz+XmIoBfCPM=;
 b=OLsRjk0C4FixTXG+aY9D4m9VkkKtwj6KhVBmCnAEcCzvMaTqhrhzTpFs0fIx8NkY1XQJ3gZxre8YBdjm9QMHtgiEFyr7yq7lESgtsl8YVvhdWCpEPI1nLx17/yK8QsRg5QXQyBJ7FqnAhOFBYNRqnR1MoD5epGHuLr0oI76FmQE8pOYo73ViYYiy+8/3PGYsPsHBgUb8BWXth/P/HuYTMLmV7Ssst6uLNZjasXZNM+SaB/xAkYQjyXwsZN9uFvrqe+sdNXoaLIf7VWCaHEbJuQy5ccoyGx82RtE2BscwY82PF4xy8HIOwb5dWWzBSpUlQqyvQxWYRLNGq9/cGLUHkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hONXqNeaGQxREzDQyDt3PmwDYOHnnKNz+XmIoBfCPM=;
 b=BM5Tm8Rb+20bW7JLUyEoY+vL7XAQSapUnxMawkCbq4J+pRTabLI3TkMvlJeQWqMONLRFbav1Lla+5gM1Zv+gQDCNe6A/JHOpbpVo5/9W0mQToWFW+WnhYmJaXohUYrT9hZIL5xVfnoge1YmOyAZblMR7frgHsV0iLX01aCvlRHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5272.namprd12.prod.outlook.com (2603:10b6:208:319::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 07:42:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.017; Fri, 25 Mar 2022
 07:42:52 +0000
Message-ID: <d1f1e2e8-e1ad-e3b1-63f7-302e1fa9348b@amd.com>
Date: Fri, 25 Mar 2022 08:42:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alex Deucher <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <59498280-a717-109d-68c4-bbf19a94a7ae@amd.com>
 <abed02db-2483-cb66-cbd1-c72c64dab521@amd.com>
In-Reply-To: <abed02db-2483-cb66-cbd1-c72c64dab521@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72cb7e42-95e9-4ed8-bebf-08da0e331190
X-MS-TrafficTypeDiagnostic: BL1PR12MB5272:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB52722AE7AFC374A7B0241B54831A9@BL1PR12MB5272.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NV4NbIhDJBQ1hZIsE7IrnIOiverPjBAZm+KG6cmnoTNm2dYCLiIcz9rQwe4FWXGvOLopxIgrfzn0zxRUfoCBzblQPMUgfNXsck54ItiXqecm8AA8r6XRmQA4Uqr14lA52tT5yOOARwDPUQWOTcBk0IDNm0IO993hOAdutJQj4cMUFCw4ZEp1uBdTnGzerOkNKQgHQx66sXmfLWqGzCTPKdeUF0XzEqjPGPS5H0nb+nuURoZdglkkYdxfU57rIkmAe+lW07AX9mo8kyHJxigbce0Vdf3GZzCSiYXTmMU+CeaTNUiURVprBY4UqvAPfmoq2UsS0TAX6yrL9d+R2HSy0WWPOnkKxYvgb3atx5Az1qc/6KfyKCVz9+c/nnmHmEgnWKJIsFpsXxGTKTQUCStVEm1gRRUdr97NAPtieERSbXXg28wnrIp1reUbDcGKun6EINkYz/BhQo3NUi3DhFqThdgsuHU61mZej2xAjYGL89pZso+BYztGhOYKjG/LQ9VKjCIgm5F1r8EJ6xxb4DZfTT9Nt3Lm7L4dIPJh45pqCkxClspuYnBuvF+EnIiIQWW04qXQbrD0qxDPTuU+nmByULHFEUDXuuxSZinfIRMDmRHY4c/GpxWiY+dgAxiOcDfz5CCgKDytMph19gHJhQUqXvToGTbziJP5YEGIq5EP3yPkSvKPrSzV9z9uL32R6C7lnTaNHorjMfs6KbeYImni2fheUXy1/LF1DOjKomXD/1M5h4gWLmHQ/sp5EawKAX/m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(26005)(6666004)(6512007)(38100700002)(31686004)(5660300002)(8676002)(36756003)(2616005)(30864003)(8936002)(66946007)(6486002)(186003)(66556008)(66476007)(110136005)(316002)(2906002)(66574015)(508600001)(31696002)(86362001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RExaYmVVanp6WU9YV3NRQUhFOWZoV2JDR3BTWTNSdStjbFdYOVhlaEtRVGhh?=
 =?utf-8?B?Vkg3QjJPKzB2QkdJck5sZnl6b0ovNkNYN1RJRDhPRHhmWTdnZHM2dDB4TUZO?=
 =?utf-8?B?UzNnUVNkUURxVllicExueTRxUnpuQkZjeU1CbEpQZE5yMXl5U1JFQWt1VVdG?=
 =?utf-8?B?TUxwT1dPUk9CUlI3NjdndFlTaitUN1dPSjgxaEZwZmRvTUpJMjRlUW91d0lr?=
 =?utf-8?B?S1VlSDF6eWg4SlJ6eURBSW9QS2NkTC9KSjZPblAwdGhGaHhaOEd3NUhUR3Nn?=
 =?utf-8?B?Nlg4Y3BZVUh1cDRxTGYyNUZaUXRhamRBWHBxdXdyM3gvS0xiOVJiYk5UWTVV?=
 =?utf-8?B?dytuNmk3a2wvSzFLckRKZk1sSlJQZGNZTnVVYjIvZFg3VGZEa2lQbEI4VkNZ?=
 =?utf-8?B?c3hzUzhtcXo3KzU1WlF3RTBEaUl4cTJ4Y3F6UXpZU0tQYXFlaS9FKzZSRDl3?=
 =?utf-8?B?bTJSUzhJMWJTS3BzUTVRYzdra2JSL09wa1pCMHJsdWVDNUh2bUxpWlZGV29r?=
 =?utf-8?B?bTdRTWlmQnA4alRTL3FFZXM1M09qVDMrZWwvQlVGNmNyMStHSDhiV0YzcHJ2?=
 =?utf-8?B?VWU0S3FvZkd0VG5peEE0ZDczWUFzY2VrUWF1ZnJJRnI3Q3pGbTdyaTlNRlky?=
 =?utf-8?B?V3NVQXJ6YXZjSzN3SEt5TWUxVEQ4SS9TZzZKaHpkWkE4VTdKbHBNZXJ2eVhq?=
 =?utf-8?B?cEp2TnNuS0FWL0hQOHdXMWt2VUJGblhncUVwckFvNGdOU2djajhpSTUvaUZS?=
 =?utf-8?B?cGtDTXN4NERQTlJPaHQrNFQreUVYemlhM1dTOE9iWGVEcVMrMnVHb1pGeUtS?=
 =?utf-8?B?bGVhUzgwZzZpbUV0Y0dIKzV0bFFUSHNOMXowWTNHdm0yWXBvbWdKaDdYdDBo?=
 =?utf-8?B?R3FHemtOSjRoUy9rOGFkRmRnK0ZzM2RFdnN0cHpjbUU5WlBCR0xlVkVxWTdW?=
 =?utf-8?B?U0F3Titia08rL2srb0t0MjlacUo4d0NVQ2hlRmdtTTMxdDE3Vm55ajBwWDZh?=
 =?utf-8?B?RlhVZlN4YTVzZmd1TGoxVHRuVzF2L0Q1SGdkd0hhQW1QNTh3QTIwRkpSV1px?=
 =?utf-8?B?bnhUQmxnQTFCMWRLODJRNWhhZU5GL0RuVS81MWVKYWhBRHVBT1NjdkFHY2Nh?=
 =?utf-8?B?YmdmQUZWVm9UMEFtZlFtVWpBVW5sUnVra3M3THZDdUxiQ0xBd1hYTE1oV1Z1?=
 =?utf-8?B?dVZjYzlTaHN1ZWxtNld0a1RNUDFDbE5DSTBISUsvNjJwN2tSUjdjUU5LMGFS?=
 =?utf-8?B?U3prY2hJNzgxT2dtalVlVVJSMlM1RmxNS04veUdMSDVPWXpWdlBON2VYUzBY?=
 =?utf-8?B?NDZOaUE2RHl3T0VqMWZlb3I5ak5ZMHB6MDdidmVhWkl3bEV5a2lFTVNPdU0y?=
 =?utf-8?B?NldvakVSeTFPMXhWei9yb1FBK2t1Rnd5MTdVQ2FLMXdHMnFod21OMWVIeXpZ?=
 =?utf-8?B?MXFYQStoUE5aOWE3TzNFamRXc0xGOGphMktMeTA2Mnd3Q241UjBnamJrMU5V?=
 =?utf-8?B?Qm1TcUUvdDVwdS9YbDlBb0hvMU0wSmt4Mk9nVFRKSjFrZ3NSVmxWN0JvK3Bz?=
 =?utf-8?B?cDRSenl2UE9SYzdwaUluQjF2L2dVb2ErUEFOUyt4NmtqN05wY1lDajlQYWZw?=
 =?utf-8?B?akxaMjZqRnpHdmVYWmpScHBOZDFrTDNmWEJORm1ZK2lsdTZZcXdsY3orRHZn?=
 =?utf-8?B?L2Jqc2V2SW9YZVBEY1k4eStOejRNcHFWRk5sWjJ6Z3FmeXdmdjFSc0pDQjZq?=
 =?utf-8?B?c25rYlpRUERhV01JNmlkckU0UFhBVUNwc3BHL05OSGdpb1d1MGhJdjNwQVhM?=
 =?utf-8?B?NEptendXcWJsU3RHYXpZWWZzdmxrR2Zua241SElqby9vRFJKR01GR3NjS2xs?=
 =?utf-8?B?Z0oxc29ZeWh1Q21qMyt4aVJGbWhaMWxSTDZXaWdzdnhaZldLbkJITGhFdHVT?=
 =?utf-8?B?NjN0U3dPdmMydWVDUXJBbUNNd0dYSEVGU2RYaG9USng1bU1pWGM0OUJ6WVZ6?=
 =?utf-8?B?Um9WS0haelZydzFHSWNna0UrK052NU15L1RpMWpYd1hMb2Z6Qmc2TVovWW9W?=
 =?utf-8?B?UUgwWnJ5MFY4eU4wd3JFUXBidlAzYWNsSE5TWngyUEU0eVdpRFRZcG50VDg3?=
 =?utf-8?B?Sm15QkV3bXVtUnUxcG5WTXVJYVE5R2lMN2pQcUtHQ0pvRVZpK2NMT3I4VDNk?=
 =?utf-8?B?eEdCaUh6bVNJVEpiZ1BLKzZxN2MvMGF2ak8xd2xwSThoaytSQnlHdVVLa250?=
 =?utf-8?B?OGZkM2RBMENqYXFjVm1COStnNno2TTUrQjBERTVZb3FlNVY1Nk85c2cxUEV5?=
 =?utf-8?B?TFhXcW5ZMEk0bkdXd0p0b2phRngvcHRjMkdXTEFST0pLK2pBS2t1QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72cb7e42-95e9-4ed8-bebf-08da0e331190
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 07:42:52.8728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Omz0+KsY1JOdder+3KnlCkENuDRHn90LAACmjk4hldymQTLwkKc+mWx1EN+4ini
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5272
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once more a ping on this here.

It's fixing a warning with sync_files and is already tested.

Regards,
Christian.

Am 21.03.22 um 11:31 schrieb Christian König:
> [Adding Daniel]
>
> Just once more a ping for this.
>
> It's an important bug fix and the end user already reported that it 
> works.
>
> Regards,
> Christian.
>
> Am 14.03.22 um 12:14 schrieb Christian König:
>> Just a gentle ping.
>>
>> This series is an important fix for drm-misc-next-fixes.
>>
>> Regards,
>> Christian.
>>
>> Am 11.03.22 um 12:02 schrieb Christian König:
>>> Add a general purpose helper to deep dive into 
>>> dma_fence_chain/dma_fence_array
>>> structures and iterate over all the fences in them.
>>>
>>> This is useful when we need to flatten out all fences in those 
>>> structures.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   Documentation/driver-api/dma-buf.rst  |   6 +
>>>   drivers/dma-buf/Makefile              |   1 +
>>>   drivers/dma-buf/selftests.h           |   1 +
>>>   drivers/dma-buf/st-dma-fence-unwrap.c | 279 
>>> ++++++++++++++++++++++++++
>>>   include/linux/dma-fence-unwrap.h      |  99 +++++++++
>>>   5 files changed, 386 insertions(+)
>>>   create mode 100644 drivers/dma-buf/st-dma-fence-unwrap.c
>>>   create mode 100644 include/linux/dma-fence-unwrap.h
>>>
>>> diff --git a/Documentation/driver-api/dma-buf.rst 
>>> b/Documentation/driver-api/dma-buf.rst
>>> index 2cd7db82d9fe..7209500f08c8 100644
>>> --- a/Documentation/driver-api/dma-buf.rst
>>> +++ b/Documentation/driver-api/dma-buf.rst
>>> @@ -194,6 +194,12 @@ DMA Fence Chain
>>>   .. kernel-doc:: include/linux/dma-fence-chain.h
>>>      :internal:
>>>   +DMA Fence unwrap
>>> +~~~~~~~~~~~~~~~~
>>> +
>>> +.. kernel-doc:: include/linux/dma-fence-unwrap.h
>>> +   :internal:
>>> +
>>>   DMA Fence uABI/Sync File
>>>   ~~~~~~~~~~~~~~~~~~~~~~~~
>>>   diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
>>> index 511805dbeb75..4c9eb53ba3f8 100644
>>> --- a/drivers/dma-buf/Makefile
>>> +++ b/drivers/dma-buf/Makefile
>>> @@ -12,6 +12,7 @@ dmabuf_selftests-y := \
>>>       selftest.o \
>>>       st-dma-fence.o \
>>>       st-dma-fence-chain.o \
>>> +    st-dma-fence-unwrap.o \
>>>       st-dma-resv.o
>>>     obj-$(CONFIG_DMABUF_SELFTESTS)    += dmabuf_selftests.o
>>> diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
>>> index 97d73aaa31da..851965867d9c 100644
>>> --- a/drivers/dma-buf/selftests.h
>>> +++ b/drivers/dma-buf/selftests.h
>>> @@ -12,4 +12,5 @@
>>>   selftest(sanitycheck, __sanitycheck__) /* keep first (igt 
>>> selfcheck) */
>>>   selftest(dma_fence, dma_fence)
>>>   selftest(dma_fence_chain, dma_fence_chain)
>>> +selftest(dma_fence_unwrap, dma_fence_unwrap)
>>>   selftest(dma_resv, dma_resv)
>>> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c 
>>> b/drivers/dma-buf/st-dma-fence-unwrap.c
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
>>> +
>>> +static inline struct mock_fence {
>>> +    struct dma_fence base;
>>> +    spinlock_t lock;
>>> +} *to_mock_fence(struct dma_fence *f) {
>>> +    return container_of(f, struct mock_fence, base);
>>> +}
>>> +
>>> +static const char *mock_name(struct dma_fence *f)
>>> +{
>>> +    return "mock";
>>> +}
>>> +
>>> +static void mock_fence_release(struct dma_fence *f)
>>> +{
>>> +    kmem_cache_free(slab_fences, to_mock_fence(f));
>>> +}
>>> +
>>> +static const struct dma_fence_ops mock_ops = {
>>> +    .get_driver_name = mock_name,
>>> +    .get_timeline_name = mock_name,
>>> +    .release = mock_fence_release,
>>> +};
>>> +
>>> +static struct dma_fence *mock_fence(void)
>>> +{
>>> +    struct mock_fence *f;
>>> +
>>> +    f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
>>> +    if (!f)
>>> +        return NULL;
>>> +
>>> +    spin_lock_init(&f->lock);
>>> +    dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
>>> +
>>> +    return &f->base;
>>> +}
>>> +
>>> +static struct dma_fence *mock_array(unsigned int num_fences, ...)
>>> +{
>>> +    struct dma_fence_array *array;
>>> +    struct dma_fence **fences;
>>> +    va_list valist;
>>> +    int i;
>>> +
>>> +    fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
>>> +    if (!fences)
>>> +        return NULL;
>>> +
>>> +    va_start(valist, num_fences);
>>> +    for (i = 0; i < num_fences; ++i)
>>> +        fences[i] = va_arg(valist, typeof(*fences));
>>> +    va_end(valist);
>>> +
>>> +    array = dma_fence_array_create(num_fences, fences,
>>> +                       dma_fence_context_alloc(1),
>>> +                       1, false);
>>> +    if (!array)
>>> +        goto cleanup;
>>> +    return &array->base;
>>> +
>>> +cleanup:
>>> +    for (i = 0; i < num_fences; ++i)
>>> +        dma_fence_put(fences[i]);
>>> +    kfree(fences);
>>> +    return NULL;
>>> +}
>>> +
>>> +static struct dma_fence *mock_chain(struct dma_fence *prev,
>>> +                    struct dma_fence *fence)
>>> +{
>>> +    struct dma_fence_chain *f;
>>> +
>>> +    f = dma_fence_chain_alloc();
>>> +    if (!f) {
>>> +        dma_fence_put(prev);
>>> +        dma_fence_put(fence);
>>> +        return NULL;
>>> +    }
>>> +
>>> +    dma_fence_chain_init(f, prev, fence, 1);
>>> +    return &f->base;
>>> +}
>>> +
>>> +static int sanitycheck(void *arg)
>>> +{
>>> +    struct dma_fence *f, *chain, *array;
>>> +    int err = 0;
>>> +
>>> +    f = mock_fence();
>>> +    if (!f)
>>> +        return -ENOMEM;
>>> +
>>> +    array = mock_array(1, f);
>>> +    if (!array)
>>> +        return -ENOMEM;
>>> +
>>> +    chain = mock_chain(NULL, array);
>>> +    if (!chain)
>>> +        return -ENOMEM;
>>> +
>>> +    dma_fence_signal(f);
>>> +    dma_fence_put(chain);
>>> +    return err;
>>> +}
>>> +
>>> +static int unwrap_array(void *arg)
>>> +{
>>> +    struct dma_fence *fence, *f1, *f2, *array;
>>> +    struct dma_fence_unwrap iter;
>>> +    int err = 0;
>>> +
>>> +    f1 = mock_fence();
>>> +    if (!f1)
>>> +        return -ENOMEM;
>>> +
>>> +    f2 = mock_fence();
>>> +    if (!f2) {
>>> +        dma_fence_put(f1);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    array = mock_array(2, f1, f2);
>>> +    if (!array)
>>> +        return -ENOMEM;
>>> +
>>> +    dma_fence_unwrap_for_each(fence, &iter, array) {
>>> +        if (fence == f1) {
>>> +            f1 = NULL;
>>> +        } else if (fence == f2) {
>>> +            f2 = NULL;
>>> +        } else {
>>> +            pr_err("Unexpected fence!\n");
>>> +            err = -EINVAL;
>>> +        }
>>> +    }
>>> +
>>> +    if (f1 || f2) {
>>> +        pr_err("Not all fences seen!\n");
>>> +        err = -EINVAL;
>>> +    }
>>> +
>>> +    dma_fence_signal(f1);
>>> +    dma_fence_signal(f2);
>>> +    dma_fence_put(array);
>>> +    return 0;
>>> +}
>>> +
>>> +static int unwrap_chain(void *arg)
>>> +{
>>> +    struct dma_fence *fence, *f1, *f2, *chain;
>>> +    struct dma_fence_unwrap iter;
>>> +    int err = 0;
>>> +
>>> +    f1 = mock_fence();
>>> +    if (!f1)
>>> +        return -ENOMEM;
>>> +
>>> +    f2 = mock_fence();
>>> +    if (!f2) {
>>> +        dma_fence_put(f1);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    chain = mock_chain(f1, f2);
>>> +    if (!chain)
>>> +        return -ENOMEM;
>>> +
>>> +    dma_fence_unwrap_for_each(fence, &iter, chain) {
>>> +        if (fence == f1) {
>>> +            f1 = NULL;
>>> +        } else if (fence == f2) {
>>> +            f2 = NULL;
>>> +        } else {
>>> +            pr_err("Unexpected fence!\n");
>>> +            err = -EINVAL;
>>> +        }
>>> +    }
>>> +
>>> +    if (f1 || f2) {
>>> +        pr_err("Not all fences seen!\n");
>>> +        err = -EINVAL;
>>> +    }
>>> +
>>> +    dma_fence_signal(f1);
>>> +    dma_fence_signal(f2);
>>> +    dma_fence_put(chain);
>>> +    return 0;
>>> +}
>>> +
>>> +static int unwrap_chain_array(void *arg)
>>> +{
>>> +    struct dma_fence *fence, *f1, *f2, *array, *chain;
>>> +    struct dma_fence_unwrap iter;
>>> +    int err = 0;
>>> +
>>> +    f1 = mock_fence();
>>> +    if (!f1)
>>> +        return -ENOMEM;
>>> +
>>> +    f2 = mock_fence();
>>> +    if (!f2) {
>>> +        dma_fence_put(f1);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    array = mock_array(2, f1, f2);
>>> +    if (!array)
>>> +        return -ENOMEM;
>>> +
>>> +    chain = mock_chain(NULL, array);
>>> +    if (!chain)
>>> +        return -ENOMEM;
>>> +
>>> +    dma_fence_unwrap_for_each(fence, &iter, chain) {
>>> +        if (fence == f1) {
>>> +            f1 = NULL;
>>> +        } else if (fence == f2) {
>>> +            f2 = NULL;
>>> +        } else {
>>> +            pr_err("Unexpected fence!\n");
>>> +            err = -EINVAL;
>>> +        }
>>> +    }
>>> +
>>> +    if (f1 || f2) {
>>> +        pr_err("Not all fences seen!\n");
>>> +        err = -EINVAL;
>>> +    }
>>> +
>>> +    dma_fence_signal(f1);
>>> +    dma_fence_signal(f2);
>>> +    dma_fence_put(chain);
>>> +    return 0;
>>> +}
>>> +
>>> +int dma_fence_unwrap(void)
>>> +{
>>> +    static const struct subtest tests[] = {
>>> +        SUBTEST(sanitycheck),
>>> +        SUBTEST(unwrap_array),
>>> +        SUBTEST(unwrap_chain),
>>> +        SUBTEST(unwrap_chain_array),
>>> +    };
>>> +    int ret;
>>> +
>>> +    slab_fences = KMEM_CACHE(mock_fence,
>>> +                 SLAB_TYPESAFE_BY_RCU |
>>> +                 SLAB_HWCACHE_ALIGN);
>>> +    if (!slab_fences)
>>> +        return -ENOMEM;
>>> +
>>> +    ret = subtests(tests, NULL);
>>> +
>>> +    kmem_cache_destroy(slab_fences);
>>> +    return ret;
>>> +}
>>> diff --git a/include/linux/dma-fence-unwrap.h 
>>> b/include/linux/dma-fence-unwrap.h
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
>>> + *    Christian König <christian.koenig@amd.com>
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
>>> + */
>>> +struct dma_fence_unwrap {
>>> +    /**
>>> +     * @chain: potential dma_fence_chain, but can be other fence as 
>>> well
>>> +     */
>>> +    struct dma_fence *chain;
>>> +    /**
>>> +     * @array: potential dma_fence_array, but can be other fence as 
>>> well
>>> +     */
>>> +    struct dma_fence *array;
>>> +    /**
>>> +     * @index: last returned index if @array is really a 
>>> dma_fence_array
>>> +     */
>>> +    unsigned int index;
>>> +};
>>> +
>>> +/**
>>> + * dma_fence_unwrap_array - helper to unwrap dma_fence_arrays
>>> + * @cursor: cursor to initialize
>>> + *
>>> + * Helper function to unwrap dma_fence_array containers, don't 
>>> touch directly.
>>> + * Use dma_fence_unwrap_first/next instead.
>>> + */
>>> +static inline struct dma_fence *
>>> +dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
>>> +{
>>> +    cursor->array = dma_fence_chain_contained(cursor->chain);
>>> +    cursor->index = 0;
>>> +    return dma_fence_array_first(cursor->array);
>>> +}
>>> +
>>> +/**
>>> + * dma_fence_unwrap_first - return the first fence from fence 
>>> containers
>>> + * @head: the entrypoint into the containers
>>> + * @cursor: current position inside the containers
>>> + *
>>> + * Unwraps potential dma_fence_chain/dma_fence_array containers and 
>>> return the
>>> + * first fence.
>>> + */
>>> +static inline struct dma_fence *
>>> +dma_fence_unwrap_first(struct dma_fence *head, struct 
>>> dma_fence_unwrap *cursor)
>>> +{
>>> +    cursor->chain = dma_fence_get(head);
>>> +    return dma_fence_unwrap_array(cursor);
>>> +}
>>> +
>>> +/**
>>> + * dma_fence_unwrap_next - return the next fence from a fence 
>>> containers
>>> + * @cursor: current position inside the containers
>>> + *
>>> + * Continue unwrapping the dma_fence_chain/dma_fence_array 
>>> containers and return
>>> + * the next fence from them.
>>> + */
>>> +static inline struct dma_fence *
>>> +dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>>> +{
>>> +    struct dma_fence *tmp;
>>> +
>>> +    ++cursor->index;
>>> +    tmp = dma_fence_array_next(cursor->array, cursor->index);
>>> +    if (tmp)
>>> +        return tmp;
>>> +
>>> +    cursor->chain = dma_fence_chain_walk(cursor->chain);
>>> +    return dma_fence_unwrap_array(cursor);
>>> +}
>>> +
>>> +/**
>>> + * dma_fence_unwrap_for_each - iterate over all fences in containers
>>> + * @fence: current fence
>>> + * @cursor: current position inside the containers
>>> + * @head: starting point for the iterator
>>> + *
>>> + * Unwrap dma_fence_chain and dma_fence_array containers and deep 
>>> dive into all
>>> + * potential fences in them. If @head is just a normal fence only 
>>> that one is
>>> + * returned.
>>> + */
>>> +#define dma_fence_unwrap_for_each(fence, cursor, head)            \
>>> +    for (fence = dma_fence_unwrap_first(head, cursor); fence;    \
>>> +         fence = dma_fence_unwrap_next(cursor))
>>> +
>>> +#endif
>>
>

