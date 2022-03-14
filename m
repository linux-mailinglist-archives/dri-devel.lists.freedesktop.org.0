Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC24D8078
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 12:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A2989FDE;
	Mon, 14 Mar 2022 11:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7643A89D5C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 11:14:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLfmlhjJD8s4tSyG2J46IhHHUswE1kWW+lMDRkmmVPB2l+wepZCVmnaxUulzbE5ufrnPjiAybnR6zbr5QEXpEqAqhg5B9ksC+N3EzgxS/zlPaKa/DPkjcZ2plH+smRZYo5y0EDZMz1c/YuSTysb8bg1gp5wsdGrY21ENFPOete2C+PiG8s1vWin28JWSwGqB86J77IXXxbdKXQGPA8zATM0pKIZHG2B+rDQQzn5TtmiDxM93PuQ9szU9INaRA9zxkkmlRi4jLU35J758NwdqjyHU29jAB9qAQyQmSPdenMkrgSvxFnPTMp75lHiS5JR29klPkIlwF0XuMjLLdBKqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyisnD3/NFMHeukJfJs/O1DRDCRxdttabHWfKXRY/Ew=;
 b=KOWOh5SCgtkTG1wnwR8LA5rotp7VKqh0rbRTFcrNeDJMSCtWNavRN6aGpbJMh5T0248Z/g8MN3BGudbHXa4NnsDyJF8FszKum4pJkuCWO7OdMSt9ScCU7eVOhl8WF1o06rJqkGWbUaI/MDCPpnpNMsR0kBbTNwjNICKve9A6KyjcfH5PeJOlaUJTJr8zcCIaUQTUY2EnxugnbweB2p5YG7J9rjN0koH+4QFVy+T05Awg/1WNnleBPji9nx+uEw1S2n9KT6vdsHp1XgHYSrD1g40ZwF5VsZpx27t6U7pSwp1/81JbdpYHDk/OzZ/Pr9aeGm0+3ltZC20SfvsscVQplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyisnD3/NFMHeukJfJs/O1DRDCRxdttabHWfKXRY/Ew=;
 b=payE3B6Y0W1VT9r4ekoyovt6UMVoZdKtZJT761yHSmkQ4aFiCmUpw7RCMwwQ8B9Mt/ogVQF2F+pZZ5A4Wwlo+o/hlas7CBCxzlGLuJgdnImiZZ0DPGBvRy2qDgsuHDnU+vmujloKscFyp+CSo0c7Tce6XqmXDgUPgfkV1nMR7MI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3418.namprd12.prod.outlook.com (2603:10b6:5:116::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 11:14:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 11:14:13 +0000
Message-ID: <59498280-a717-109d-68c4-bbf19a94a7ae@amd.com>
Date: Mon, 14 Mar 2022 12:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Content-Language: en-US
To: sumit.semwal@linaro.org, gustavo@padovan.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Alex Deucher <Alexander.Deucher@amd.com>
References: <20220311110244.1245-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220311110244.1245-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e0164a1-ae53-462e-c591-08da05abc4da
X-MS-TrafficTypeDiagnostic: DM6PR12MB3418:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3418D34187D867DD6025F6ED830F9@DM6PR12MB3418.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +OMJvOVb29O9dQb4ULtwKnguw2T4RzIwpxKCra6eOLJfwD3QzdkP3R2syzKomdZ5Ohf7GVPackx2V1gjCmE9mOPhLFgMTJAqDTJ8l46qNind9fwHmraVvrPTMNmKmqs+QdjgAPfeMw/lAVjXDnxwzFOlMQw5Z94Tho26TeZueGeewgt4yDzz6xMkR3cc8TZv5VsAHCkuiJPx+A1Pzkuf73HnCK3oK1uVfMYWD5bKWtBjMWpvL9UiDtLcYC3evpw1RJghN0kq98nKP8xKvdGY5dWrcH6Y5HYGJGbDkHccofhKEUuf5jxKQhovRl/Jv1Mo5LPVIUBnYJTu5iJLNuTPGfXY/05w6FqA7WFLVqbBFECLMdijlpcYDI9pvlPJFH7va1ioXvnAFbpEm9yBOyIzH3bEyMF8JRtkSK2bGzZ9K9miaLCLdz+XO2Ly5qwG6J6mR7LX3Dw+94RGJekmozLI5TpIjTWSFtDxAOabrOr9j04j1aRiQZOirt4KhjRIk2fUrIHD/hhNr8kou73rMOqJSfak21iMqPtB1mROdORLdDgWdRpRhlU5w9Dwr8QDTcHIgknS805P1xFBBrMge0Q/NeiuUg3tqOEDIw6nAkYx24BG2L89tFo/FZSIlYhHgtqpUKxF7z6poHgjd2D5ajUdicHh/2Dz/LZrgdDi1lqyftGihO4ORXbwzINU6IK7Gic1tXSgyxPBX39LGJXOhOLB13u3XB9QNItGxzbeWxpLemr+tv4L5WnAbPOdyzvF/Ot1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(66574015)(2616005)(6512007)(86362001)(6666004)(6506007)(2906002)(6486002)(38100700002)(31696002)(508600001)(31686004)(6862004)(8676002)(66556008)(66946007)(66476007)(5660300002)(30864003)(36756003)(8936002)(6636002)(83380400001)(37006003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHJHMjJyalBKMzlBdC93NW1ReVhHQmZscHJSczZUQWswVEh6enQ0ODc4Tzk2?=
 =?utf-8?B?UHhYOE1KL2F2L3RYZkc4U2YyUGtVb0VlbU1RcUZjYnJTeGRLT0hMek91c0Y4?=
 =?utf-8?B?Mk9zT3JpU0FrWXVDdmhIRUdKazdLb0UxWVRmcWVKNzJvUklHdzk5VTlnU01T?=
 =?utf-8?B?Z3Exb0pXSVY3MzJVc2Q4SFRWOGUyUkxDQXh0ekNFZXRTdFRlaWg0bDRTRFRu?=
 =?utf-8?B?b3BBbzJFRis1SXp3R3JLNjlXcGZSUWNpbi90RWVpS3NUZThSYTN0NW1CTyt3?=
 =?utf-8?B?LzVTZEdQbTNscE4zQWZHUUh5V1Qxa29GN2k0QnVvdDF3TTlnTE1oVkJpYmo1?=
 =?utf-8?B?UVBRbDduS2FYSUhLNGxTZG5rRS93Z0RpRmNkMC9JYTZ5VHU3YmNnV2orZ0NC?=
 =?utf-8?B?Z1o2c0UrTUJ1a3dkSzd3SlZrTlNEUDM0VVdyOEkvWXl6ZjA0NXg0V0s0VFRC?=
 =?utf-8?B?Sy9HTGFlZGRuM21IRWp0UWwzN21zRjBVdjJsUTBXR0J2bDk1SVRxMXhCYUkx?=
 =?utf-8?B?Y3V0RWNGRkduc0hGZWdmcFF3UUtUcGl4K0QwT2xsdTZteDB4VHFFdzN4NHhG?=
 =?utf-8?B?bmF1amNLRWRlVkk1d3l6ZHRSdm5jbHJ2VUpBaGlDZk1sRnpUOTV5ZE1CODVK?=
 =?utf-8?B?ME5ycUpWVlpISmhNekhCOGNKNGhyMWxFZi9xbXRLRTNENXR0bnBVWWNRVGVT?=
 =?utf-8?B?Q3NoU1AreU9ORHBVL2ZIcVptUmZHRng0RUt2d2FzckxvazUxT3VhWUZrRGl4?=
 =?utf-8?B?d2JaVkhBL0JkclRKeVV2aVlGdkVmUTVuM0UrSjQzbjdhTlJPR1NOUDh4NklJ?=
 =?utf-8?B?MjhFMVBHU1E0SE44ZEQwcFBtN00zUFMzemJ2VkdiV0ZlcUNac01BdXNqazls?=
 =?utf-8?B?K0JDY1dNeFRRRmNjRkJmUFk2N0FFSXU5dkpEQkd5b2djQlpsRXJ5dnNPUnE0?=
 =?utf-8?B?MkhiVThDcEU0WEVWRHdodFFUaWwvZlFmTmxmK0tVTStQNTJ5OWJsMm5ObVZS?=
 =?utf-8?B?dFN3VXMyZ01oYWdBMEhTTS9XTzR0bXdxSXpubk5PM0tTOEsxR0IreElEMWFr?=
 =?utf-8?B?ZTFIZmVReURBL1c0NW5kcmV0TjVSNmlXTTBabGlCcHJQclhMVXBzTFFocE1Q?=
 =?utf-8?B?MEJBU0RIb3FtQUx4WmQ1dDhKRW5LUVpaRGZTbjR1eUF4aWJaWFp1Vm1qYVE4?=
 =?utf-8?B?MiszV1cwSnJ4M0MvRGhCYU04dDR6VHJXbXVlbDdRTVpTQzZKK1FsN1NtVUFw?=
 =?utf-8?B?SFRaRUdKN0NRRXlkdnlhTjlNQ1diOFVXZVRkNVNLYUZmNE9qbkVVbUlYS3ox?=
 =?utf-8?B?S3AzR1lPVkk4N1RBa0t6YzhFeExJdE1mVkI1L0k3L2VRRlBhekozNmNwVk83?=
 =?utf-8?B?YUNiWU91eHdPaHErYW93bXMxTjRpR1pPN0lZMTNOVE1KcnN6aVFUMWxqUU1x?=
 =?utf-8?B?VDB0UHFlSEpjaXkwSXdGeFhudUR4M1ZrVy9FaHIwRFp1Z1d1dlhHdm1oTzdz?=
 =?utf-8?B?SnhhTnlyWTZyOCtiV0ozT2VTMFgxUVp3YkU0d1IwRmZxcTF0aVB2KzJVVkNn?=
 =?utf-8?B?ejBadHNTRmVmQytpcVR2Z08wL21mZVJqMHBqbERWQUtjODg0MDVJVnlqbWFx?=
 =?utf-8?B?ZEpDRmZNbXVEOXc1WXVSSDJSRGZndnBDbFRwSEhUOXB5WkNmSkdZOHNqZ1Y5?=
 =?utf-8?B?VXRHUEJpK2RhUlVoNkR2WUt6WjI5NHZiaVUwRzI2RXBlQnMzNUxLeE5iWEZq?=
 =?utf-8?B?K2ZPZVh1bHdjc2JEd24zSFh6YkVlSjF2ZlRGWENibGhYeEg4bklFcUxJZ01x?=
 =?utf-8?B?WVZKWGRCOTU0ZW8rNDlINjhkc0F1bkJHNlB3enlJWWp2OGcvSFlGUjliNXdP?=
 =?utf-8?B?WWpTbWhvTnVBbFF2RTZiMUdyNUtIOUZjSlNBZm0vT21ONXlNMEJCSFcwOGVI?=
 =?utf-8?Q?5pTrKguU4aicwf5O5cOTQtkje83H4OOZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0164a1-ae53-462e-c591-08da05abc4da
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 11:14:12.9220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bR42ETIvOypGp+ooK4u8C8SPMd6/icQvjuyFqiHkSUZe6R4p/RRi1AuPAxHsjNcY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3418
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

Just a gentle ping.

This series is an important fix for drm-misc-next-fixes.

Regards,
Christian.

Am 11.03.22 um 12:02 schrieb Christian König:
> Add a general purpose helper to deep dive into dma_fence_chain/dma_fence_array
> structures and iterate over all the fences in them.
>
> This is useful when we need to flatten out all fences in those structures.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   Documentation/driver-api/dma-buf.rst  |   6 +
>   drivers/dma-buf/Makefile              |   1 +
>   drivers/dma-buf/selftests.h           |   1 +
>   drivers/dma-buf/st-dma-fence-unwrap.c | 279 ++++++++++++++++++++++++++
>   include/linux/dma-fence-unwrap.h      |  99 +++++++++
>   5 files changed, 386 insertions(+)
>   create mode 100644 drivers/dma-buf/st-dma-fence-unwrap.c
>   create mode 100644 include/linux/dma-fence-unwrap.h
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 2cd7db82d9fe..7209500f08c8 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -194,6 +194,12 @@ DMA Fence Chain
>   .. kernel-doc:: include/linux/dma-fence-chain.h
>      :internal:
>   
> +DMA Fence unwrap
> +~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: include/linux/dma-fence-unwrap.h
> +   :internal:
> +
>   DMA Fence uABI/Sync File
>   ~~~~~~~~~~~~~~~~~~~~~~~~
>   
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 511805dbeb75..4c9eb53ba3f8 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -12,6 +12,7 @@ dmabuf_selftests-y := \
>   	selftest.o \
>   	st-dma-fence.o \
>   	st-dma-fence-chain.o \
> +	st-dma-fence-unwrap.o \
>   	st-dma-resv.o
>   
>   obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
> diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
> index 97d73aaa31da..851965867d9c 100644
> --- a/drivers/dma-buf/selftests.h
> +++ b/drivers/dma-buf/selftests.h
> @@ -12,4 +12,5 @@
>   selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
>   selftest(dma_fence, dma_fence)
>   selftest(dma_fence_chain, dma_fence_chain)
> +selftest(dma_fence_unwrap, dma_fence_unwrap)
>   selftest(dma_resv, dma_resv)
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> new file mode 100644
> index 000000000000..d821faaebe93
> --- /dev/null
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: MIT
> +
> +/*
> + * Copyright (C) 2022 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/dma-fence-unwrap.h>
> +#if 0
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/mm.h>
> +#include <linux/sched/signal.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/random.h>
> +#endif
> +
> +#include "selftest.h"
> +
> +#define CHAIN_SZ (4 << 10)
> +
> +static struct kmem_cache *slab_fences;
> +
> +static inline struct mock_fence {
> +	struct dma_fence base;
> +	spinlock_t lock;
> +} *to_mock_fence(struct dma_fence *f) {
> +	return container_of(f, struct mock_fence, base);
> +}
> +
> +static const char *mock_name(struct dma_fence *f)
> +{
> +	return "mock";
> +}
> +
> +static void mock_fence_release(struct dma_fence *f)
> +{
> +	kmem_cache_free(slab_fences, to_mock_fence(f));
> +}
> +
> +static const struct dma_fence_ops mock_ops = {
> +	.get_driver_name = mock_name,
> +	.get_timeline_name = mock_name,
> +	.release = mock_fence_release,
> +};
> +
> +static struct dma_fence *mock_fence(void)
> +{
> +	struct mock_fence *f;
> +
> +	f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
> +	if (!f)
> +		return NULL;
> +
> +	spin_lock_init(&f->lock);
> +	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
> +
> +	return &f->base;
> +}
> +
> +static struct dma_fence *mock_array(unsigned int num_fences, ...)
> +{
> +	struct dma_fence_array *array;
> +	struct dma_fence **fences;
> +	va_list valist;
> +	int i;
> +
> +	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
> +	if (!fences)
> +		return NULL;
> +
> +	va_start(valist, num_fences);
> +	for (i = 0; i < num_fences; ++i)
> +		fences[i] = va_arg(valist, typeof(*fences));
> +	va_end(valist);
> +
> +	array = dma_fence_array_create(num_fences, fences,
> +				       dma_fence_context_alloc(1),
> +				       1, false);
> +	if (!array)
> +		goto cleanup;
> +	return &array->base;
> +
> +cleanup:
> +	for (i = 0; i < num_fences; ++i)
> +		dma_fence_put(fences[i]);
> +	kfree(fences);
> +	return NULL;
> +}
> +
> +static struct dma_fence *mock_chain(struct dma_fence *prev,
> +				    struct dma_fence *fence)
> +{
> +	struct dma_fence_chain *f;
> +
> +	f = dma_fence_chain_alloc();
> +	if (!f) {
> +		dma_fence_put(prev);
> +		dma_fence_put(fence);
> +		return NULL;
> +	}
> +
> +	dma_fence_chain_init(f, prev, fence, 1);
> +	return &f->base;
> +}
> +
> +static int sanitycheck(void *arg)
> +{
> +	struct dma_fence *f, *chain, *array;
> +	int err = 0;
> +
> +	f = mock_fence();
> +	if (!f)
> +		return -ENOMEM;
> +
> +	array = mock_array(1, f);
> +	if (!array)
> +		return -ENOMEM;
> +
> +	chain = mock_chain(NULL, array);
> +	if (!chain)
> +		return -ENOMEM;
> +
> +	dma_fence_signal(f);
> +	dma_fence_put(chain);
> +	return err;
> +}
> +
> +static int unwrap_array(void *arg)
> +{
> +	struct dma_fence *fence, *f1, *f2, *array;
> +	struct dma_fence_unwrap iter;
> +	int err = 0;
> +
> +	f1 = mock_fence();
> +	if (!f1)
> +		return -ENOMEM;
> +
> +	f2 = mock_fence();
> +	if (!f2) {
> +		dma_fence_put(f1);
> +		return -ENOMEM;
> +	}
> +
> +	array = mock_array(2, f1, f2);
> +	if (!array)
> +		return -ENOMEM;
> +
> +	dma_fence_unwrap_for_each(fence, &iter, array) {
> +		if (fence == f1) {
> +			f1 = NULL;
> +		} else if (fence == f2) {
> +			f2 = NULL;
> +		} else {
> +			pr_err("Unexpected fence!\n");
> +			err = -EINVAL;
> +		}
> +	}
> +
> +	if (f1 || f2) {
> +		pr_err("Not all fences seen!\n");
> +		err = -EINVAL;
> +	}
> +
> +	dma_fence_signal(f1);
> +	dma_fence_signal(f2);
> +	dma_fence_put(array);
> +	return 0;
> +}
> +
> +static int unwrap_chain(void *arg)
> +{
> +	struct dma_fence *fence, *f1, *f2, *chain;
> +	struct dma_fence_unwrap iter;
> +	int err = 0;
> +
> +	f1 = mock_fence();
> +	if (!f1)
> +		return -ENOMEM;
> +
> +	f2 = mock_fence();
> +	if (!f2) {
> +		dma_fence_put(f1);
> +		return -ENOMEM;
> +	}
> +
> +	chain = mock_chain(f1, f2);
> +	if (!chain)
> +		return -ENOMEM;
> +
> +	dma_fence_unwrap_for_each(fence, &iter, chain) {
> +		if (fence == f1) {
> +			f1 = NULL;
> +		} else if (fence == f2) {
> +			f2 = NULL;
> +		} else {
> +			pr_err("Unexpected fence!\n");
> +			err = -EINVAL;
> +		}
> +	}
> +
> +	if (f1 || f2) {
> +		pr_err("Not all fences seen!\n");
> +		err = -EINVAL;
> +	}
> +
> +	dma_fence_signal(f1);
> +	dma_fence_signal(f2);
> +	dma_fence_put(chain);
> +	return 0;
> +}
> +
> +static int unwrap_chain_array(void *arg)
> +{
> +	struct dma_fence *fence, *f1, *f2, *array, *chain;
> +	struct dma_fence_unwrap iter;
> +	int err = 0;
> +
> +	f1 = mock_fence();
> +	if (!f1)
> +		return -ENOMEM;
> +
> +	f2 = mock_fence();
> +	if (!f2) {
> +		dma_fence_put(f1);
> +		return -ENOMEM;
> +	}
> +
> +	array = mock_array(2, f1, f2);
> +	if (!array)
> +		return -ENOMEM;
> +
> +	chain = mock_chain(NULL, array);
> +	if (!chain)
> +		return -ENOMEM;
> +
> +	dma_fence_unwrap_for_each(fence, &iter, chain) {
> +		if (fence == f1) {
> +			f1 = NULL;
> +		} else if (fence == f2) {
> +			f2 = NULL;
> +		} else {
> +			pr_err("Unexpected fence!\n");
> +			err = -EINVAL;
> +		}
> +	}
> +
> +	if (f1 || f2) {
> +		pr_err("Not all fences seen!\n");
> +		err = -EINVAL;
> +	}
> +
> +	dma_fence_signal(f1);
> +	dma_fence_signal(f2);
> +	dma_fence_put(chain);
> +	return 0;
> +}
> +
> +int dma_fence_unwrap(void)
> +{
> +	static const struct subtest tests[] = {
> +		SUBTEST(sanitycheck),
> +		SUBTEST(unwrap_array),
> +		SUBTEST(unwrap_chain),
> +		SUBTEST(unwrap_chain_array),
> +	};
> +	int ret;
> +
> +	slab_fences = KMEM_CACHE(mock_fence,
> +				 SLAB_TYPESAFE_BY_RCU |
> +				 SLAB_HWCACHE_ALIGN);
> +	if (!slab_fences)
> +		return -ENOMEM;
> +
> +	ret = subtests(tests, NULL);
> +
> +	kmem_cache_destroy(slab_fences);
> +	return ret;
> +}
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> new file mode 100644
> index 000000000000..54963df00c98
> --- /dev/null
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -0,0 +1,99 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * fence-chain: chain fences together in a timeline
> + *
> + * Copyright (C) 2022 Advanced Micro Devices, Inc.
> + * Authors:
> + *	Christian König <christian.koenig@amd.com>
> + */
> +
> +#ifndef __LINUX_DMA_FENCE_UNWRAP_H
> +#define __LINUX_DMA_FENCE_UNWRAP_H
> +
> +#include <linux/dma-fence-chain.h>
> +#include <linux/dma-fence-array.h>
> +
> +/**
> + * struct dma_fence_unwrap - cursor into the container structure
> + */
> +struct dma_fence_unwrap {
> +	/**
> +	 * @chain: potential dma_fence_chain, but can be other fence as well
> +	 */
> +	struct dma_fence *chain;
> +	/**
> +	 * @array: potential dma_fence_array, but can be other fence as well
> +	 */
> +	struct dma_fence *array;
> +	/**
> +	 * @index: last returned index if @array is really a dma_fence_array
> +	 */
> +	unsigned int index;
> +};
> +
> +/**
> + * dma_fence_unwrap_array - helper to unwrap dma_fence_arrays
> + * @cursor: cursor to initialize
> + *
> + * Helper function to unwrap dma_fence_array containers, don't touch directly.
> + * Use dma_fence_unwrap_first/next instead.
> + */
> +static inline struct dma_fence *
> +dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
> +{
> +	cursor->array = dma_fence_chain_contained(cursor->chain);
> +	cursor->index = 0;
> +	return dma_fence_array_first(cursor->array);
> +}
> +
> +/**
> + * dma_fence_unwrap_first - return the first fence from fence containers
> + * @head: the entrypoint into the containers
> + * @cursor: current position inside the containers
> + *
> + * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
> + * first fence.
> + */
> +static inline struct dma_fence *
> +dma_fence_unwrap_first(struct dma_fence *head, struct dma_fence_unwrap *cursor)
> +{
> +	cursor->chain = dma_fence_get(head);
> +	return dma_fence_unwrap_array(cursor);
> +}
> +
> +/**
> + * dma_fence_unwrap_next - return the next fence from a fence containers
> + * @cursor: current position inside the containers
> + *
> + * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
> + * the next fence from them.
> + */
> +static inline struct dma_fence *
> +dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
> +{
> +	struct dma_fence *tmp;
> +
> +	++cursor->index;
> +	tmp = dma_fence_array_next(cursor->array, cursor->index);
> +	if (tmp)
> +		return tmp;
> +
> +	cursor->chain = dma_fence_chain_walk(cursor->chain);
> +	return dma_fence_unwrap_array(cursor);
> +}
> +
> +/**
> + * dma_fence_unwrap_for_each - iterate over all fences in containers
> + * @fence: current fence
> + * @cursor: current position inside the containers
> + * @head: starting point for the iterator
> + *
> + * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
> + * potential fences in them. If @head is just a normal fence only that one is
> + * returned.
> + */
> +#define dma_fence_unwrap_for_each(fence, cursor, head)			\
> +	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
> +	     fence = dma_fence_unwrap_next(cursor))
> +
> +#endif

