Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EEF4E245E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 11:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011C410E19A;
	Mon, 21 Mar 2022 10:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8899E10E19A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 10:31:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/rgzehvLEAz8poR/8FmWxrWoPZMBFoLTdaTVw5VCOHqskmouR9JU8s7+6UwKSPeBm2Nvc4oFV0tgalGcZyoqfj/mwnIa5wsZqkGO1ACU8vN8pTCHz6rQtDNVCPqt3wHLy2OSiFzpBB3FdjAC9++oxzM4o29ALtK/IPq7mRbYghEMMANI5ivkxtPFiav4K5E4icBYXYROCb3PrBmkokEmpzk0Bsjduk0zxH5yNB/aLnbmxwf7lQHTwdzPrk279iMNOgt+AkCo8LOVo2gEJZuQYnaoztumFJ/Hz09FTawGv4eIyhYAIVdQkVyPkiQ4HKFsFNNjlO0jqBAWYPzQmMS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JB26rj3gYVq7nMBAN76BAOMzuO8mFRUVBoLCcfYorCM=;
 b=TtNm4yIf8XvPc0wFW2udbXI74r8XY34GvsW1zhVDY/0tdTjXMgLZAlnbKUOH+YHhtff6fONhxsggOcmmnvjh6sZp4F771VbMittfi55U1I6ILmQA24f8PSbe+iejzmfNXetGfY9Wj+v3CLwFxUDXWV5LkNT4Bmj08BSaCQD9pJ7jsv9JuNAetTKOKcBtxkO0MMJsp/qkiy1qV8FBr73wc/EFkAjT2rRKVjSR2ZEtXZG4LecDYCTyJduabiskqJZz+L8JWyCHFZvM59QN4b8e6GVxWWE96oVnf92f9G1dBU6MW9G40o/c8DrQgFPo5esuqsj1YybUdMgVvmDLl8UiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JB26rj3gYVq7nMBAN76BAOMzuO8mFRUVBoLCcfYorCM=;
 b=CAjYOJTQ/3NWEoP7UjZBhCtfgCa3/MaER32CoOPunFei7WNbvz4BqlVLEmOmCDYBC0msk2kp+z3u5yPvpV2V6K1vZYdI4Bsfm7u2Q/erYJ/uaZG+HUVtmL5h2o3zm/2lMMmN1CYhN07zuRTa6l/5D1jXeqmHw9Mk8Wvc2EFBaYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5384.namprd12.prod.outlook.com (2603:10b6:408:105::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 10:31:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 10:31:46 +0000
Message-ID: <abed02db-2483-cb66-cbd1-c72c64dab521@amd.com>
Date: Mon, 21 Mar 2022 11:31:41 +0100
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
In-Reply-To: <59498280-a717-109d-68c4-bbf19a94a7ae@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0044.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0967da02-5393-4465-0f60-08da0b25fff3
X-MS-TrafficTypeDiagnostic: BN9PR12MB5384:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5384500B2BA8358054EB9BCF83169@BN9PR12MB5384.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UMf26SYrsSnFE/KKotWnFRI6eggNNPiq3QoygWOjVYIwRQ2tn7Dr60Jxf8bg9IZ2O34zaxB9pskgBdHOSgkIrduDLTIpUpqtOU0w/y/bLbRkHwMLMZ9UcqSc/wwWoKbjyMEJJhl7pjX/MdzzGipnG3MAxZlMl6VCBVuw4sw+o9fXMoZRzGpBBJace+7vgmHf9JHW7IixdO0c9QMKVKoahJzDF/nZdjSHg9Z12UJWgh2xgXe0L9/S+W7+SSITNe1EeoE3n60yla9/U6PtEVTDqpuiLV3R+eXIO8Wv7ej1TBSnRTjsZCoL3kG7SuxhA93ghdJL9CTqht69QrANFI+gpr3gHbmOmNCCpN4ihuy2JRS6re1Ryg91mYqS1JTdkrprqKpWwC8JaUbSzUNxbQoaZJdFVnxuPDtYnc/zc2kIsO2YEHHYuR8gchz2R5sagt2fGqvSxysHdwDA7S0z8oDXdHbMQ+EmibYsjyQw2zdp8i1sqnvromdj3p0UGdQ3tZKMrJKMfCBoUcG6YmcDZIbPcxe5PVp2pAuT69dsT5mYQ5Bo8lD3t0GKTtF2VuUlmyifD67mmUIuBQ/sNM6ES1RM24dTTLgFjS7wQybg+Gb2LSGTJYTmpNYJaWJGCqEkbAhrsYkQ+wonr0I8i2vv5VU40znZevNuNvVPWz3+/Dgw8V6xbOEVMNR59l+9xIpBIZdI90Bvmfb7H11yoTIfPMQAguvqIYhiKWYrohAFmE9P0V1cOLAVKqZ//F0h7/1oqenW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(83380400001)(2616005)(186003)(66574015)(31696002)(86362001)(2906002)(66946007)(6512007)(66556008)(316002)(66476007)(8676002)(6506007)(6666004)(110136005)(31686004)(38100700002)(36756003)(6486002)(8936002)(508600001)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTBFZjZjV3hNdDhzTDBUQUJYcVFhWTFnRGNVelY0VU1yZGhnM3k5Q2pWaHpT?=
 =?utf-8?B?eFk3SW9ZZGhNdjRNNTBIOVBPVWNyVEtGTUFya0xsNHJob1k1WHE3cFV5STN5?=
 =?utf-8?B?T21nU1MzTCtKNHp3bnB4VGF2M1lUeDZGNHVCdUNTdFJjZkdkTlYxSlFUcXZP?=
 =?utf-8?B?SDFkQ1FmRGh0bDNiQi9DaldtZ0ZmYmttdEJXU1dvZ1BEQ1lBdXIybmc1ZFVm?=
 =?utf-8?B?OG8ySUdCMmdQVmxFdFczajh5b1d0azN2clgyeStwMGd6TGJoNzNsekNXcjdi?=
 =?utf-8?B?QXE4Mno2SzRaMEJMUGFzVjNwbEwvalB1WmlkYkNKajFBaUVucHlYR3Q0RXRj?=
 =?utf-8?B?UXR3Vk5nUmxVdG5sWXVhY1ZvWGlLcUVXZ1NyTyt5elFxUTFabUZnSCtkZVBX?=
 =?utf-8?B?WVZKYW92bU50TC9GeDJ0a1JKc2tHV3pXemZhdnNoUy9MQUVKUmtta3JrVVNU?=
 =?utf-8?B?bEROYTRqUE1TSSs0VFAyYVU3WTk2WVQyQ2dhbnhYNEJ2UlEvZkY0Y0EycW1s?=
 =?utf-8?B?TjQ4ZC8zb2dPZVZmdWRZa3RpUUJlNTNFYm02UUZIR2tUSGwwUmxzZzg1eUVL?=
 =?utf-8?B?M29sN09IQmVYSjN4SWM3eWJtYVVPS3ZtOU9GMkZZTDBJS0RUYnYvNmh4ZUhl?=
 =?utf-8?B?VzltKzdoM0ZWVXN6WHBKazJ0KytPUzRTbmNMME0vVWg3ZVQ2YWx0bFJ3R3B3?=
 =?utf-8?B?QTIvMTd0Z0hnblkyeGxuZ0lkblAyNTk3Mkg3eFJRcWFDQy9KYTIwVUhrYzhD?=
 =?utf-8?B?MDdnRnJneENRRjlnVlREUHVoZDMyU3pBRS81WVJrWUJFV0hsbnEyQmxIM21a?=
 =?utf-8?B?OU1YRmViZkk5cG9NckhVV0Z6a01Cek9qZUNRd0VXb2VtRk9lRzdmejgvNk05?=
 =?utf-8?B?MTZXaVU2emxzVWtqZE1hLytrR0YzQjRDM1d6c2xjUVVuNHVJTnMvbmZlM2l4?=
 =?utf-8?B?YlJsYWkyL1d2U0M3NXNxV2lEbVFjMnBpK2FVUnJHbzV0aklRWjB3dWE1YmpJ?=
 =?utf-8?B?M05pTCtWM1JJd1I2c1ZEZFk4WHAyNGhiYk9EOW8zenZMMUpGUFNLWks3TUc2?=
 =?utf-8?B?ZHRCSGJVemoyYmJxUks4M0ZnNjkvTEtFSTJHY2R0UmZPQ25yS1cyclIvZGcr?=
 =?utf-8?B?SHpzV25TcGEzQVBoR1VaMG5TK0U0enZOaFJTM01Jc1Roc3lpYUlzRXZMN2Q3?=
 =?utf-8?B?ekl4QmE0ZCsrS3VxSEsxN0JDNG51TWdvTXJRZzB2SnFHTitlNXNVLzlRbkJk?=
 =?utf-8?B?R3dNOXpIZ1dqa05RcG9XVEIvakxObVp5YjlINW5qNDJ3K3o2Z25wMTlpZTZW?=
 =?utf-8?B?MW5uRjlmYnVVcWs0d0x1blZBMVV6REhHR2UzdmtIaXFlMmlCaTFJU3pJY1lu?=
 =?utf-8?B?cm5mc0VteWhqeTVNeENzMUExdFVkRzJrSGNudENmallYK1ZFUnFKcWxPM2U2?=
 =?utf-8?B?djQ5K1B6QUM0dUxZVURwUFZ1NDYyV0l5ckNnc2RkTmk4RS9kWjFMZzVFZ2FI?=
 =?utf-8?B?K0FaWlZMRWZoSzhxKzlXanl6Rk5XY3hUTjFGbHhTUXE4MGlMb0ViL2p1T1JS?=
 =?utf-8?B?MnNzdnA3NFZYMDVodU9zQWdGeWFPWjc0M0hlTGhsd1pxZ2tqU2RGNVY0RjN1?=
 =?utf-8?B?R2dqdHh0SVdMNUtXNkcremRGZ3N3THBqNjk5T1JQcjZUNjdGQ0pvMW14b1R0?=
 =?utf-8?B?QnpDaXNUeDM3MFpMbTRVcnMxVVpLeml0N3pvMEs1OWNkNTIrU3JBQ2FrNCtV?=
 =?utf-8?B?N0VIQkRiTm5kUDZTMXVqUTc1cWlIOFNoUG1SMlFjODR3N2h4bDc2MDRmSGI0?=
 =?utf-8?B?eHRQWVZvcHorUzhtQ1czYS85dmg4dWNGaWM2Y2w4YlF2WldTeDJlRlE4UTFU?=
 =?utf-8?B?Y0xic2dXWkV6aFdKWXFPbUdWYi96UXpIeHV2MUhQRTc0QWJELzBicFQyS0N3?=
 =?utf-8?B?b3QvVlNLaDc2Q21pemVTTm05RWlGZy9kMXZtSnNtYm0wS2VNUlQ4QWUxNFoy?=
 =?utf-8?B?a3E0RFNZWWxCeURrR25pKy9XaUtzU2ZPdFBnSlJ4MDdFSlg4c3JWc2FiMXV1?=
 =?utf-8?Q?h8A9ri?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0967da02-5393-4465-0f60-08da0b25fff3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 10:31:46.3879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQQS87WFR2UqgLCcijZiAQjGFkrYxjaikb1riOpRXV4BbtRweyKwHl6HngxPV+Zx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5384
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

[Adding Daniel]

Just once more a ping for this.

It's an important bug fix and the end user already reported that it works.

Regards,
Christian.

Am 14.03.22 um 12:14 schrieb Christian König:
> Just a gentle ping.
>
> This series is an important fix for drm-misc-next-fixes.
>
> Regards,
> Christian.
>
> Am 11.03.22 um 12:02 schrieb Christian König:
>> Add a general purpose helper to deep dive into 
>> dma_fence_chain/dma_fence_array
>> structures and iterate over all the fences in them.
>>
>> This is useful when we need to flatten out all fences in those 
>> structures.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   Documentation/driver-api/dma-buf.rst  |   6 +
>>   drivers/dma-buf/Makefile              |   1 +
>>   drivers/dma-buf/selftests.h           |   1 +
>>   drivers/dma-buf/st-dma-fence-unwrap.c | 279 ++++++++++++++++++++++++++
>>   include/linux/dma-fence-unwrap.h      |  99 +++++++++
>>   5 files changed, 386 insertions(+)
>>   create mode 100644 drivers/dma-buf/st-dma-fence-unwrap.c
>>   create mode 100644 include/linux/dma-fence-unwrap.h
>>
>> diff --git a/Documentation/driver-api/dma-buf.rst 
>> b/Documentation/driver-api/dma-buf.rst
>> index 2cd7db82d9fe..7209500f08c8 100644
>> --- a/Documentation/driver-api/dma-buf.rst
>> +++ b/Documentation/driver-api/dma-buf.rst
>> @@ -194,6 +194,12 @@ DMA Fence Chain
>>   .. kernel-doc:: include/linux/dma-fence-chain.h
>>      :internal:
>>   +DMA Fence unwrap
>> +~~~~~~~~~~~~~~~~
>> +
>> +.. kernel-doc:: include/linux/dma-fence-unwrap.h
>> +   :internal:
>> +
>>   DMA Fence uABI/Sync File
>>   ~~~~~~~~~~~~~~~~~~~~~~~~
>>   diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
>> index 511805dbeb75..4c9eb53ba3f8 100644
>> --- a/drivers/dma-buf/Makefile
>> +++ b/drivers/dma-buf/Makefile
>> @@ -12,6 +12,7 @@ dmabuf_selftests-y := \
>>       selftest.o \
>>       st-dma-fence.o \
>>       st-dma-fence-chain.o \
>> +    st-dma-fence-unwrap.o \
>>       st-dma-resv.o
>>     obj-$(CONFIG_DMABUF_SELFTESTS)    += dmabuf_selftests.o
>> diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
>> index 97d73aaa31da..851965867d9c 100644
>> --- a/drivers/dma-buf/selftests.h
>> +++ b/drivers/dma-buf/selftests.h
>> @@ -12,4 +12,5 @@
>>   selftest(sanitycheck, __sanitycheck__) /* keep first (igt 
>> selfcheck) */
>>   selftest(dma_fence, dma_fence)
>>   selftest(dma_fence_chain, dma_fence_chain)
>> +selftest(dma_fence_unwrap, dma_fence_unwrap)
>>   selftest(dma_resv, dma_resv)
>> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c 
>> b/drivers/dma-buf/st-dma-fence-unwrap.c
>> new file mode 100644
>> index 000000000000..d821faaebe93
>> --- /dev/null
>> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
>> @@ -0,0 +1,279 @@
>> +// SPDX-License-Identifier: MIT
>> +
>> +/*
>> + * Copyright (C) 2022 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/dma-fence-unwrap.h>
>> +#if 0
>> +#include <linux/kernel.h>
>> +#include <linux/kthread.h>
>> +#include <linux/mm.h>
>> +#include <linux/sched/signal.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/random.h>
>> +#endif
>> +
>> +#include "selftest.h"
>> +
>> +#define CHAIN_SZ (4 << 10)
>> +
>> +static struct kmem_cache *slab_fences;
>> +
>> +static inline struct mock_fence {
>> +    struct dma_fence base;
>> +    spinlock_t lock;
>> +} *to_mock_fence(struct dma_fence *f) {
>> +    return container_of(f, struct mock_fence, base);
>> +}
>> +
>> +static const char *mock_name(struct dma_fence *f)
>> +{
>> +    return "mock";
>> +}
>> +
>> +static void mock_fence_release(struct dma_fence *f)
>> +{
>> +    kmem_cache_free(slab_fences, to_mock_fence(f));
>> +}
>> +
>> +static const struct dma_fence_ops mock_ops = {
>> +    .get_driver_name = mock_name,
>> +    .get_timeline_name = mock_name,
>> +    .release = mock_fence_release,
>> +};
>> +
>> +static struct dma_fence *mock_fence(void)
>> +{
>> +    struct mock_fence *f;
>> +
>> +    f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
>> +    if (!f)
>> +        return NULL;
>> +
>> +    spin_lock_init(&f->lock);
>> +    dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
>> +
>> +    return &f->base;
>> +}
>> +
>> +static struct dma_fence *mock_array(unsigned int num_fences, ...)
>> +{
>> +    struct dma_fence_array *array;
>> +    struct dma_fence **fences;
>> +    va_list valist;
>> +    int i;
>> +
>> +    fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
>> +    if (!fences)
>> +        return NULL;
>> +
>> +    va_start(valist, num_fences);
>> +    for (i = 0; i < num_fences; ++i)
>> +        fences[i] = va_arg(valist, typeof(*fences));
>> +    va_end(valist);
>> +
>> +    array = dma_fence_array_create(num_fences, fences,
>> +                       dma_fence_context_alloc(1),
>> +                       1, false);
>> +    if (!array)
>> +        goto cleanup;
>> +    return &array->base;
>> +
>> +cleanup:
>> +    for (i = 0; i < num_fences; ++i)
>> +        dma_fence_put(fences[i]);
>> +    kfree(fences);
>> +    return NULL;
>> +}
>> +
>> +static struct dma_fence *mock_chain(struct dma_fence *prev,
>> +                    struct dma_fence *fence)
>> +{
>> +    struct dma_fence_chain *f;
>> +
>> +    f = dma_fence_chain_alloc();
>> +    if (!f) {
>> +        dma_fence_put(prev);
>> +        dma_fence_put(fence);
>> +        return NULL;
>> +    }
>> +
>> +    dma_fence_chain_init(f, prev, fence, 1);
>> +    return &f->base;
>> +}
>> +
>> +static int sanitycheck(void *arg)
>> +{
>> +    struct dma_fence *f, *chain, *array;
>> +    int err = 0;
>> +
>> +    f = mock_fence();
>> +    if (!f)
>> +        return -ENOMEM;
>> +
>> +    array = mock_array(1, f);
>> +    if (!array)
>> +        return -ENOMEM;
>> +
>> +    chain = mock_chain(NULL, array);
>> +    if (!chain)
>> +        return -ENOMEM;
>> +
>> +    dma_fence_signal(f);
>> +    dma_fence_put(chain);
>> +    return err;
>> +}
>> +
>> +static int unwrap_array(void *arg)
>> +{
>> +    struct dma_fence *fence, *f1, *f2, *array;
>> +    struct dma_fence_unwrap iter;
>> +    int err = 0;
>> +
>> +    f1 = mock_fence();
>> +    if (!f1)
>> +        return -ENOMEM;
>> +
>> +    f2 = mock_fence();
>> +    if (!f2) {
>> +        dma_fence_put(f1);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    array = mock_array(2, f1, f2);
>> +    if (!array)
>> +        return -ENOMEM;
>> +
>> +    dma_fence_unwrap_for_each(fence, &iter, array) {
>> +        if (fence == f1) {
>> +            f1 = NULL;
>> +        } else if (fence == f2) {
>> +            f2 = NULL;
>> +        } else {
>> +            pr_err("Unexpected fence!\n");
>> +            err = -EINVAL;
>> +        }
>> +    }
>> +
>> +    if (f1 || f2) {
>> +        pr_err("Not all fences seen!\n");
>> +        err = -EINVAL;
>> +    }
>> +
>> +    dma_fence_signal(f1);
>> +    dma_fence_signal(f2);
>> +    dma_fence_put(array);
>> +    return 0;
>> +}
>> +
>> +static int unwrap_chain(void *arg)
>> +{
>> +    struct dma_fence *fence, *f1, *f2, *chain;
>> +    struct dma_fence_unwrap iter;
>> +    int err = 0;
>> +
>> +    f1 = mock_fence();
>> +    if (!f1)
>> +        return -ENOMEM;
>> +
>> +    f2 = mock_fence();
>> +    if (!f2) {
>> +        dma_fence_put(f1);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    chain = mock_chain(f1, f2);
>> +    if (!chain)
>> +        return -ENOMEM;
>> +
>> +    dma_fence_unwrap_for_each(fence, &iter, chain) {
>> +        if (fence == f1) {
>> +            f1 = NULL;
>> +        } else if (fence == f2) {
>> +            f2 = NULL;
>> +        } else {
>> +            pr_err("Unexpected fence!\n");
>> +            err = -EINVAL;
>> +        }
>> +    }
>> +
>> +    if (f1 || f2) {
>> +        pr_err("Not all fences seen!\n");
>> +        err = -EINVAL;
>> +    }
>> +
>> +    dma_fence_signal(f1);
>> +    dma_fence_signal(f2);
>> +    dma_fence_put(chain);
>> +    return 0;
>> +}
>> +
>> +static int unwrap_chain_array(void *arg)
>> +{
>> +    struct dma_fence *fence, *f1, *f2, *array, *chain;
>> +    struct dma_fence_unwrap iter;
>> +    int err = 0;
>> +
>> +    f1 = mock_fence();
>> +    if (!f1)
>> +        return -ENOMEM;
>> +
>> +    f2 = mock_fence();
>> +    if (!f2) {
>> +        dma_fence_put(f1);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    array = mock_array(2, f1, f2);
>> +    if (!array)
>> +        return -ENOMEM;
>> +
>> +    chain = mock_chain(NULL, array);
>> +    if (!chain)
>> +        return -ENOMEM;
>> +
>> +    dma_fence_unwrap_for_each(fence, &iter, chain) {
>> +        if (fence == f1) {
>> +            f1 = NULL;
>> +        } else if (fence == f2) {
>> +            f2 = NULL;
>> +        } else {
>> +            pr_err("Unexpected fence!\n");
>> +            err = -EINVAL;
>> +        }
>> +    }
>> +
>> +    if (f1 || f2) {
>> +        pr_err("Not all fences seen!\n");
>> +        err = -EINVAL;
>> +    }
>> +
>> +    dma_fence_signal(f1);
>> +    dma_fence_signal(f2);
>> +    dma_fence_put(chain);
>> +    return 0;
>> +}
>> +
>> +int dma_fence_unwrap(void)
>> +{
>> +    static const struct subtest tests[] = {
>> +        SUBTEST(sanitycheck),
>> +        SUBTEST(unwrap_array),
>> +        SUBTEST(unwrap_chain),
>> +        SUBTEST(unwrap_chain_array),
>> +    };
>> +    int ret;
>> +
>> +    slab_fences = KMEM_CACHE(mock_fence,
>> +                 SLAB_TYPESAFE_BY_RCU |
>> +                 SLAB_HWCACHE_ALIGN);
>> +    if (!slab_fences)
>> +        return -ENOMEM;
>> +
>> +    ret = subtests(tests, NULL);
>> +
>> +    kmem_cache_destroy(slab_fences);
>> +    return ret;
>> +}
>> diff --git a/include/linux/dma-fence-unwrap.h 
>> b/include/linux/dma-fence-unwrap.h
>> new file mode 100644
>> index 000000000000..54963df00c98
>> --- /dev/null
>> +++ b/include/linux/dma-fence-unwrap.h
>> @@ -0,0 +1,99 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * fence-chain: chain fences together in a timeline
>> + *
>> + * Copyright (C) 2022 Advanced Micro Devices, Inc.
>> + * Authors:
>> + *    Christian König <christian.koenig@amd.com>
>> + */
>> +
>> +#ifndef __LINUX_DMA_FENCE_UNWRAP_H
>> +#define __LINUX_DMA_FENCE_UNWRAP_H
>> +
>> +#include <linux/dma-fence-chain.h>
>> +#include <linux/dma-fence-array.h>
>> +
>> +/**
>> + * struct dma_fence_unwrap - cursor into the container structure
>> + */
>> +struct dma_fence_unwrap {
>> +    /**
>> +     * @chain: potential dma_fence_chain, but can be other fence as 
>> well
>> +     */
>> +    struct dma_fence *chain;
>> +    /**
>> +     * @array: potential dma_fence_array, but can be other fence as 
>> well
>> +     */
>> +    struct dma_fence *array;
>> +    /**
>> +     * @index: last returned index if @array is really a 
>> dma_fence_array
>> +     */
>> +    unsigned int index;
>> +};
>> +
>> +/**
>> + * dma_fence_unwrap_array - helper to unwrap dma_fence_arrays
>> + * @cursor: cursor to initialize
>> + *
>> + * Helper function to unwrap dma_fence_array containers, don't touch 
>> directly.
>> + * Use dma_fence_unwrap_first/next instead.
>> + */
>> +static inline struct dma_fence *
>> +dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
>> +{
>> +    cursor->array = dma_fence_chain_contained(cursor->chain);
>> +    cursor->index = 0;
>> +    return dma_fence_array_first(cursor->array);
>> +}
>> +
>> +/**
>> + * dma_fence_unwrap_first - return the first fence from fence 
>> containers
>> + * @head: the entrypoint into the containers
>> + * @cursor: current position inside the containers
>> + *
>> + * Unwraps potential dma_fence_chain/dma_fence_array containers and 
>> return the
>> + * first fence.
>> + */
>> +static inline struct dma_fence *
>> +dma_fence_unwrap_first(struct dma_fence *head, struct 
>> dma_fence_unwrap *cursor)
>> +{
>> +    cursor->chain = dma_fence_get(head);
>> +    return dma_fence_unwrap_array(cursor);
>> +}
>> +
>> +/**
>> + * dma_fence_unwrap_next - return the next fence from a fence 
>> containers
>> + * @cursor: current position inside the containers
>> + *
>> + * Continue unwrapping the dma_fence_chain/dma_fence_array 
>> containers and return
>> + * the next fence from them.
>> + */
>> +static inline struct dma_fence *
>> +dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>> +{
>> +    struct dma_fence *tmp;
>> +
>> +    ++cursor->index;
>> +    tmp = dma_fence_array_next(cursor->array, cursor->index);
>> +    if (tmp)
>> +        return tmp;
>> +
>> +    cursor->chain = dma_fence_chain_walk(cursor->chain);
>> +    return dma_fence_unwrap_array(cursor);
>> +}
>> +
>> +/**
>> + * dma_fence_unwrap_for_each - iterate over all fences in containers
>> + * @fence: current fence
>> + * @cursor: current position inside the containers
>> + * @head: starting point for the iterator
>> + *
>> + * Unwrap dma_fence_chain and dma_fence_array containers and deep 
>> dive into all
>> + * potential fences in them. If @head is just a normal fence only 
>> that one is
>> + * returned.
>> + */
>> +#define dma_fence_unwrap_for_each(fence, cursor, head)            \
>> +    for (fence = dma_fence_unwrap_first(head, cursor); fence;    \
>> +         fence = dma_fence_unwrap_next(cursor))
>> +
>> +#endif
>

