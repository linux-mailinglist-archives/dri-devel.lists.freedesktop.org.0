Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3C051DA31
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 16:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6CC10EFD5;
	Fri,  6 May 2022 14:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC6510EFD5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 14:11:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ6YXhi8HeFoHS0Hquo2xRqrHXRKHWqVS3gCC4oi+eOZf3vD103HPheGE8vqejnyz3W7X415Euj4PXRUFfma1xc6prHHDEPXvggXzLroJVqg7I0vh/hjyoz1c2MFTyvGlAex9VFkzRFxu8vV5t7GRKZ5wlaFR1Lj1LO4XUNqw856mAISPpa8bFpQUewVFYsgxrEJGgT3Hk2xEUT6oERadDKH73BnICqrwFWwjzlKlma330zl2BOFkuA7QxNL7xtwGSSl3SCAk7WdZmj7chUSn0QkvZL9g5nsbHdPHkZoErPQkI0JvWM9rBiOKh7Y5PBwyeaAscJZREzqM6dFRWvPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wavymbw/CpU8mjw1nfB32XZpJqitOdfN/TV4KZysbPo=;
 b=iYM6vT1ly80wyx0j6wlmkxiCBULUkKRRvDcwttX129o0JFx6Mikx3V0Hy15R/1RZEkzyUlTtHVKXgVvn/jGRRyVODiFKnvGXCsFvf+FDBjIauaktZB62090QmOoCYhfm8zGu3obj357+2Y/+4a2omYvtu5rMAIyiu1uiogULbKxtpi+9/GLGDUaCbXSYses2/PgFjbvQGikPmNWfT0geF9i7Gd/bCjcyvjI/K4lO8ul3Cmr3bBao+mfnN7R95mU1zLkYW9+Lrchws3IZwLonP4NNinPwWR/ODK14Q6ne0oT2op4KAU2I0/83uHvwN+twqcUSjGIn6Mc1N8+6cAf5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wavymbw/CpU8mjw1nfB32XZpJqitOdfN/TV4KZysbPo=;
 b=tvaNEhyS0T4EaoxrSTXozoAJyKQEUBePS79wVc6Tflm00kNbam1gWd7VODJJGgCZwQF+NKb03r2ZqD9ycveLT9+lBzzbdJvmVjHClSWh3xymnLK2o607sUSbP7/tZkfMUk4rXXvFjHfh+cPHKZ6waPLcjBHTUqkC0prnJ/kXNIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB2518.namprd12.prod.outlook.com (2603:10b6:4:b0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 14:11:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5206.025; Fri, 6 May 2022
 14:11:34 +0000
Message-ID: <bd90027c-5158-0d53-9b05-97a9e62309b3@amd.com>
Date: Fri, 6 May 2022 16:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest v2
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20220506141009.18047-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220506141009.18047-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0052.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::29) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef35e6df-f071-4fd4-b7f7-08da2f6a53af
X-MS-TrafficTypeDiagnostic: DM5PR12MB2518:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2518BDBD9F001E3CFC5B95AD83C59@DM5PR12MB2518.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9WVm/kLNpHq3z2zVI2+OlzUODu6M9p0B9WPQZ8yNltPa9ylbw0tg+9cOZOZxpjebZpFCm40QJKOO8QuXT9Gjox6fyTxGHLUkAKVe3y9+zlob5XTkyw3AsGfmYJt4B+4kGY42j0D9fqkrxsf3Vr1CkSIQ6t/1DYMwC5h/BTsmseSZT0fzZJBNpKtRs2I/JTATDrpm9G98ZL7n20w1HYPc8L5Q5FeXo5fX2m1U1EK2bwTf/ZU/BfapgNWqe+0WJ4YXzLDr0MfQGfr//bbTiLj8ZsWGplydPLj3/rPFvxOTAqx30QRigp25JJ7G1qf6HJYJsevYMDJHnHisJXzWhIZw1Be/KiC6+5cLjNfM2zxNemdrPzRyQaG4aT5GyPRc7OqMg0WiBLx8zOOkVwt7CdIuU1sOjVPuaKb8vzGgRg8gk4/vaa+taL3gD6/cyXMzanUf8rqbdP0E0MFaHQX4YH3F/37JRMMuMWLAkQzjIpjHxVdCF00//MRz/XnYchmTl88A815ocWB/D+XEfAwWkduXnBnOLKkx/V/1kR4Oa3UPzYil+Kw6jsfc0DwEL2SPqLExd7Fc9oIVp8ThDRJLzCiPL7wPWonsChQ/9mOBMLKltp3UsT7c/z9V3QqilHMY8/V8WxrCbdSjxPOUr0uc++Li+hnm69FPY6LWhi638/DvVUQ0+gFdFTGy1NcGVvc/c+sJ3Pk26Q7YepdTMXcSyj+Fkhz2RuFaMCf6MqFsGBZdpLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6512007)(31686004)(6506007)(2616005)(83380400001)(5660300002)(8936002)(186003)(66574015)(2906002)(86362001)(66476007)(31696002)(66556008)(66946007)(8676002)(36756003)(6486002)(38100700002)(508600001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWUzaDcvMmFOZlZRL001RDN6K1MybVZLbnJ6MzdtYUdUNTVQT0VCVjlKT05K?=
 =?utf-8?B?V2IyWDBhR1NFQkc4SGRHOHFwM2FCSDNLVkx6aEpkOEcvL2NBcSt2ZDBJTUVq?=
 =?utf-8?B?UkhHR3RwbVAzTFNsOWFQWHIzSUlHdVVtbWdCMFR4dGFVcGt1bGlxUjhYUkVK?=
 =?utf-8?B?cXliY29OalVld1lscVNXWVpJRERicVZuYXVmeG40QjZxNXNWR2RRbG1xNkNr?=
 =?utf-8?B?OW13a2hxVVFPRW9LYlV6R0VYWmpsNlEyRTFQWXJxajJMZ2tSb1JmMm9iTU5s?=
 =?utf-8?B?aGxvc2NKK05CVDdRU0FIeVdLUDQ4ZVh2bEdqUzVkd2tIcnUxR2prZkJENFdF?=
 =?utf-8?B?cDhzak1WVFJuVE1EZWhLUldBaVpwYm5EcEd0MjJPL3ptUzZqNy9aYTZ3Vjg2?=
 =?utf-8?B?Mm04S0toQTZ2UU9Rb0FVVVBvTEVXZzllc0xaa2lWeUFmOHZzZ2xrTU90SUZh?=
 =?utf-8?B?SVZYMGpoOGdyRkxtVkpVdlBDMUcvTlF1c3NSTURsZW42YWNIK0cyQTdYN2h5?=
 =?utf-8?B?eXJ5RExjdXhxMWpEeGxMUlVabFRySi9PeFk1R0draE9laGpmZm92MTkrUXkz?=
 =?utf-8?B?bWlDajRVM3NvanpTMTBnTlpNakJaei84ckxHYmwybFd6QWZlSEFxQVZ2Y2Jy?=
 =?utf-8?B?SGNZL2FXMndIUWRkQUsrY2ZuWXhXSWpYakRNTGY0eGdabzc4aEI0SzBmM2p3?=
 =?utf-8?B?NTR2ZkFZYlpwcUVab0NvSU1VWFZHcHE4QXU4cDVwdTJpN3lWOFFQV3gwKzFB?=
 =?utf-8?B?K09yUGFqY1VYbmxtaWRTL1ZZLzZ4WTROdFUwbEtxc2pNdjdjZVg2OWd6ZVhu?=
 =?utf-8?B?Z1Y4cFFUR2UxVVEvaEU4ZEhkRE0yUUZiSW1EOWVVYVBWY0NiazZxa3laeHdk?=
 =?utf-8?B?VTE1Vk1PM1VidmtycTgydzJDWFdKNzQyVGhGTG0vUE9ydEoxZ25odEVDcEts?=
 =?utf-8?B?dzBJaFQzUnJ2VlRXSFp6M2N4MHhJM3RHSnJyOWRWQThXUzRCQzJTSFplTG5r?=
 =?utf-8?B?NldoMmk0YzgzTkJIRWZFWnJjUHE2TE1JNjgzZm9VU1FJMktJRkJTRFl5R3lh?=
 =?utf-8?B?aS9HRjF1TTFOeFNKYmVYVU9wd3d3Qmw5d2FwUFVndUN4Y2R0eCsvOVgzRFQ3?=
 =?utf-8?B?bVpIYWZpcXBRNHlEUGFlTzNwQkNXcUcxRWRHS0VGc05GOEt4b3NYMk05bTFP?=
 =?utf-8?B?cGZIbStSQXJETnhLVGs4QmFMWUZ1UGkybVVyLzNsZVlmUmVaY055cUZPL2Ez?=
 =?utf-8?B?eUhPVTBCMU41VUpqckNHczJsTVJwRUJUL3l1RGkxdDZ2bmJNVlJWRUk5UnVy?=
 =?utf-8?B?eE1QelpzMDUrcWhXRGRzazFLR3MxSmxGVkNvbnhiQnhtUThKTHE3NmpQQVVS?=
 =?utf-8?B?TEdoWnVmaE9HYTlCcXEzZ3FJeHZ1d0ZGcWVER3VJTENSNUc0MlNTblBvVTZS?=
 =?utf-8?B?MEUvTXlzeXBEUzFUd3FjNGxrRUhZU0ZGb2FxKzZFdTluanFVUisxeUhiTmFJ?=
 =?utf-8?B?RjJoQWlwMUFHeUczdXRJRzVnOWZ2RFU0Syt5ZUNBUTZBZWYyT2lad3BTK1ZV?=
 =?utf-8?B?UUxLb0N3VzdndERWVzgxL3J0ZEVDK0R1MUdNWWRuTjV3bTQwWlRlamlQUHZr?=
 =?utf-8?B?TjFGdHJsSFZBa3JUQ0NkU2QvaFU3QzVLRmdwMGdmSDdobEFxMFBFZEg1T0lr?=
 =?utf-8?B?cVRuVjFROTNHNWtkVno2NTRHbUMwdkZZSjIvdG4wNi9kajg1eWpTZmNqMCtB?=
 =?utf-8?B?djVYaEVaY3FpcEo3VmNJYVV1YU9vUXQwd05DaUpnem5rSTdDZXRvVFU5WnB6?=
 =?utf-8?B?WVJZTEVaZjZsZWg0K1VTM28zYkFxcU5xbmUwRnZDRDlERDdNOVJldDN5QUlF?=
 =?utf-8?B?eVpDWW1DNDNmQVcrU0EyeGF2aWlFQ1VPb1hwUXlISTYwMno1cFpxQldmTXgv?=
 =?utf-8?B?RVBKaEY0aWlTeitTYWV1RzgzZThUVnI5K1Nhb3JsWlZ4VUw5WW42SEpwNjdU?=
 =?utf-8?B?ZEdPaEhoaUxHNWMwa1VCazBmQ2xicm9xUTV2T1VnOXpzUWZWUTdvVVM3ZnYx?=
 =?utf-8?B?UkRycXRnY09IN21sWmpwQ1lZTkhWeWwvTXNYYU1PWmtHUnVXbXZEcXAvWVNC?=
 =?utf-8?B?aElCczFzaW1xSkFaM2tTTDNiUi96NWhHcHhDYUlCVitVc2RBaXg0ZXRwWVhZ?=
 =?utf-8?B?RmRsK05YaWZZWUNXdTV5UzVXUG1xY2QxeDlxSzhDM0ZxRTJiaFRtV0FDempv?=
 =?utf-8?B?RUNXWEVhajU3MmFGdHV2bjRtMTVqVU1BaG1ybXoxcENtYU12a3dFN3FSVGdh?=
 =?utf-8?B?aGlHUEVJY3YzRWgwS3lWa09NczhBTnZQTk5hak1KUTFiR0k5eVRBYm1EUXRl?=
 =?utf-8?Q?Hpl7pG7B6n1H3Cctj0pu1670GDL0agCDEsjRsg2olDdKq?=
X-MS-Exchange-AntiSpam-MessageData-1: hnuqIS6akq/28w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef35e6df-f071-4fd4-b7f7-08da2f6a53af
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 14:11:34.6222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEMgpYdQq3gWP/vbufWj6J23+LTb8YBLVB4WpPAuxgFDDRGPrQ0RJWfxcpJzW+cn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2518
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

I had to send this out once more.

This time with the right mail addresses and a much simplified patch #3.

Christian.

Am 06.05.22 um 16:10 schrieb Christian König:
> The selftests, fix the error handling, remove unused functions and stop
> leaking memory in failed tests.
>
> v2: fix the memory leak correctly.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/st-dma-fence-unwrap.c | 48 +++++++++++----------------
>   1 file changed, 19 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 039f016b57be..e20c5a7dcfe4 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -4,27 +4,19 @@
>    * Copyright (C) 2022 Advanced Micro Devices, Inc.
>    */
>   
> +#include <linux/dma-fence.h>
> +#include <linux/dma-fence-array.h>
> +#include <linux/dma-fence-chain.h>
>   #include <linux/dma-fence-unwrap.h>
> -#if 0
> -#include <linux/kernel.h>
> -#include <linux/kthread.h>
> -#include <linux/mm.h>
> -#include <linux/sched/signal.h>
> -#include <linux/slab.h>
> -#include <linux/spinlock.h>
> -#include <linux/random.h>
> -#endif
>   
>   #include "selftest.h"
>   
>   #define CHAIN_SZ (4 << 10)
>   
> -static inline struct mock_fence {
> +struct mock_fence {
>   	struct dma_fence base;
>   	spinlock_t lock;
> -} *to_mock_fence(struct dma_fence *f) {
> -	return container_of(f, struct mock_fence, base);
> -}
> +};
>   
>   static const char *mock_name(struct dma_fence *f)
>   {
> @@ -45,7 +37,8 @@ static struct dma_fence *mock_fence(void)
>   		return NULL;
>   
>   	spin_lock_init(&f->lock);
> -	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
> +	dma_fence_init(&f->base, &mock_ops, &f->lock,
> +		       dma_fence_context_alloc(1), 1);
>   
>   	return &f->base;
>   }
> @@ -59,7 +52,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
>   
>   	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
>   	if (!fences)
> -		return NULL;
> +		goto error_put;
>   
>   	va_start(valist, num_fences);
>   	for (i = 0; i < num_fences; ++i)
> @@ -70,13 +63,17 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
>   				       dma_fence_context_alloc(1),
>   				       1, false);
>   	if (!array)
> -		goto cleanup;
> +		goto error_free;
>   	return &array->base;
>   
> -cleanup:
> -	for (i = 0; i < num_fences; ++i)
> -		dma_fence_put(fences[i]);
> +error_free:
>   	kfree(fences);
> +
> +error_put:
> +	va_start(valist, num_fences);
> +	for (i = 0; i < num_fences; ++i)
> +		dma_fence_put(va_arg(valist, typeof(*fences)));
> +	va_end(valist);
>   	return NULL;
>   }
>   
> @@ -113,7 +110,6 @@ static int sanitycheck(void *arg)
>   	if (!chain)
>   		return -ENOMEM;
>   
> -	dma_fence_signal(f);
>   	dma_fence_put(chain);
>   	return err;
>   }
> @@ -154,10 +150,8 @@ static int unwrap_array(void *arg)
>   		err = -EINVAL;
>   	}
>   
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
>   	dma_fence_put(array);
> -	return 0;
> +	return err;
>   }
>   
>   static int unwrap_chain(void *arg)
> @@ -196,10 +190,8 @@ static int unwrap_chain(void *arg)
>   		err = -EINVAL;
>   	}
>   
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
>   	dma_fence_put(chain);
> -	return 0;
> +	return err;
>   }
>   
>   static int unwrap_chain_array(void *arg)
> @@ -242,10 +234,8 @@ static int unwrap_chain_array(void *arg)
>   		err = -EINVAL;
>   	}
>   
> -	dma_fence_signal(f1);
> -	dma_fence_signal(f2);
>   	dma_fence_put(chain);
> -	return 0;
> +	return err;
>   }
>   
>   int dma_fence_unwrap(void)

