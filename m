Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1B3944FC
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 17:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122026EB14;
	Fri, 28 May 2021 15:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343956E845;
 Fri, 28 May 2021 15:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWhnIh6uERZGoPk9hO3Kn4f2cP8aUinDVoGP2kvYTD/6NbgtFwKBuoUSVk5D+3mfadXAPyRVmHkYWnFzxxCLu9MOkrbjjpdMnWgJk4rH1jfLdSVKg8excOZTODJLKsR0LIzwVtC86QtbOSC8NdcGrHM7yji0dNxCk3sfIch6fNAOLZGSUA3mqCkQj1tYcrFQk1yyx1ksiAHCMBY5OG+zDavSC9CP3XaVf7u07SnRux7TyoGMZEUAChhTRcbQLpZm6c0N2De9nLU63t2GsDJdf3hGbV2SJ5HI2cZTYtXaylUepC4SmXNfz+qpZvztehg7v7tl/LWRulUf93VvmT369A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47dyM5VEecNXJh1Op98FiEoid2IO8psjmHntdNcyklY=;
 b=FrMu0L0kD7LYVFx1PH0akM0ihR1v9T8uMx3/uLB/w05weyoBGRAanK81+pPAJe1p1YVZKwUbK3rZfj7aoT+rPBRLHaEuM718dK+wtm5+RrgrVVOWtewCETgqymzEP7NiJOQHMUZeuIM/CZvgeCmtjP94NZJuihT7gSHtGVwLRqAkHy281gdJBRfJXp3Sn5XHqx6/8k7mxyupzqw1SH0noBBDeHH+WDIUqYDXzHm0WGN/XutNOAdFB2uk33NrBil6QKGduIhI5tw3qrQSBS1Gw05eRcG2s1Qm1Ld9SSiOJ1kVDcxvf6SojIEMGKyjpErs2Ld+jkm+FxsYc0owvTaajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47dyM5VEecNXJh1Op98FiEoid2IO8psjmHntdNcyklY=;
 b=pDZX5kWOCx0oHkt9QIfInxlQ1xDtW2fPJZLaMDmQYU2zk01rhHueDf6BGK/e0I6jN0RPOYAklny1OmI6LfNWOuh5RWn341zn/ZFVP3bOlc31IAQWuMsF9b8EbO9rT+7FMxydVG+zgCbdy3AUu0jFumn/HL/DOdXouPaqyNPEZQA=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 15:25:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 15:25:22 +0000
Subject: Re: [PATCH v5 07/15] drm: Add a prefetching memcpy_from_wc
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210527144710.1975553-1-thomas.hellstrom@linux.intel.com>
 <20210527144710.1975553-8-thomas.hellstrom@linux.intel.com>
 <7f2daaf6-8df1-5886-758e-ea09d27602ba@amd.com>
 <1ad40aa9-7ca7-ed5a-8a34-a93c68e1ada7@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <24ab6edc-a5d3-8eb9-e2ba-2661d4a3d7fb@amd.com>
Date: Fri, 28 May 2021 17:25:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1ad40aa9-7ca7-ed5a-8a34-a93c68e1ada7@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a878:922a:f147:ebc]
X-ClientProxiedBy: AM0PR10CA0121.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::38) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a878:922a:f147:ebc]
 (2a02:908:1252:fb60:a878:922a:f147:ebc) by
 AM0PR10CA0121.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 15:25:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e44b8e7-2996-4d3f-2357-08d921eccf53
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4916304026BCB18773B3C6DC83229@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: banvo+tAzIoSvfUHaJPvy7GjL/tBluBErQ7HYISbE4wdBosJeMIdeo3HzuH+IiBPOKZGrTq8cRlbJ6f7Y9xxxa7tDfWNeQzNTFbHd+bGyRK2KUrUhkfcXLB2E06Qmaap3FJ89BzVKGRn5xcW7YCf+icDHTFUMjXRdNiTbnvHn+4Oxf+sUI6CKnKSTYd6oH1vfwHhwlZquxCItKE+NpjurgoMmSuWd+Csa4ZGoB+yzm3eijrGJ/CXXaG+faYAPyzt3H3VgSdrLzwVa6r0qv10UNe7kb7jSzwCOLZI5FKYv1GmbskmKAf4a4Jb6SMVj3VnkUuQA82TgjYLiXT1dUfafmUgnCx4qAC9xCgpsNgrRs52TjYlCXsj1yzqTEVH9GKqidA19k0f2Y2LthvXJKklHOw7+eG/EReRS0p9aYFgBRozqaA9SNomGyRaMfM4klmIVu2Kea6QyjSJlSi3xZsYLckC/6/MLUpIIsepX0JM3W8fd6PXBxYcOiepDQT3qUSUEOB/dOZ9azms3SfpL/KqR6mbqHHsp8i1S66Kuyh7pEpSHg+fnyUNGK+n6ExebWMRSRBVypNf74fe1RpFPBkRXfCzW3vrAWevsVhk0bJYoJ+KbwENG5HWUjsyQx5QUM8hu1HNzd810oCiYbYYSYGpRT3/9Eb3EpvA8Sw0ElPnqcls2uMUlbRxFIgVG2vr0u4G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(366004)(376002)(346002)(2616005)(8676002)(38100700002)(53546011)(478600001)(16526019)(83380400001)(31696002)(5660300002)(186003)(8936002)(6486002)(36756003)(86362001)(4326008)(66946007)(66556008)(66476007)(6666004)(31686004)(66574015)(2906002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dUFldWpYRkhYdG0wQ043cWh1QXJxcEZHYXhRQ0NVYlZEZ2I2RmFuMk4yclNB?=
 =?utf-8?B?QkVPNU1UOFRtdDdpNWh5YUg5bFFiSW5ta0tvRDdFd0FzNkNEcFdWT3k5S2Z1?=
 =?utf-8?B?MWo0WDF4cmZCVUhCdkgwemdsczUzdExMMTMraEcvbWxqaUhFSTErNTB1NU95?=
 =?utf-8?B?MHNIL1ZJUjFQVFI2dDJCd2kvUHg3cUtPOWhOZENHd0xBamNwUkNFdEtnMnF2?=
 =?utf-8?B?YjhDdmxZNi9Pdy93UUw0VTV5dWhBaW1uUFZUanBVVXpLeDF6ejZjc0RaUHJR?=
 =?utf-8?B?T1l2NWdHTVRHbldkbzNwaHI1VU1JK05MdTVQRUlKUWc4VWM4VFpxUmpoZUl6?=
 =?utf-8?B?cDFjV1g2TFh5MUhPWWdVK3hnSEtPczhGL2M4cGRxK2RmdmMrY1loR1BZUUlw?=
 =?utf-8?B?Zld3WGJTRlp1QVFZbEtDS2tZRlpVVW9TRUdBYzNNa1dQV256dVB4TkdJZlE5?=
 =?utf-8?B?N041dGYrWU9FYlJ4aHNQb20vQTJOcE9MY05oTUZmaDY5aU9GRTNhQ1BYNVhl?=
 =?utf-8?B?RVdYQ2VNZmxEQitrbjczQlZQOC9yTWpaYnFTWDNyd0M1UFBoK21OSUtjaEVQ?=
 =?utf-8?B?d3RPYkR1WWZJMWYvWjArUm1HaFZsb0N1S3lOODRsSWVxMCtQbzUxU1hMZFRE?=
 =?utf-8?B?YWE0TENybUJHcm5XT205TEs2UEV5bXYyWVBMclJzcTlNbmc4UnZBQVMxYlFo?=
 =?utf-8?B?bVQ4dDZlN2xjdjBEMVFmOU5ETVZvZmZkU00zdjJZWTg4SC9Mb08zZ2NKenZZ?=
 =?utf-8?B?UzMzcDBVNzZPTTdzV2dBeGZrTGl4RTBoSWM2UXFrNHZURFZxUVFJanVSZ2g3?=
 =?utf-8?B?UCttOVNNRnIyVkhFMzV1dkJEaksybDQ2ZmhYT09BTTNXNDJ4RkpQOGJLUlNq?=
 =?utf-8?B?V21SNjJJc2o0QVBybVFVZTQ4Y3BoU0VHZ2k5cXBxWktEdkRFM3VnZm83VVNk?=
 =?utf-8?B?VkpabDBmTmt4b0JhN3hxb21ySC9ubE4zeFBKcnZoQzlQQzFZMVhnM2NpL042?=
 =?utf-8?B?bmFNTllLZm5QQUFJTWttRzVvSXl2K2FsdkVqcEFHMmhLYnBKQllhS05OSGpq?=
 =?utf-8?B?UzE3S2lKL040eWthT1l4RGtXWDhweFlpRDArd3Zqamo1MlFuOHJkUHp5QW8w?=
 =?utf-8?B?VXlsVHcrYjFybUNxVkt0cUlCclVYdW5rSzJKSzcvalNxZXNPbjl1cElRSEYx?=
 =?utf-8?B?Q1V3VTZYMHIrNDhHME9qaVJZa1hCQW9UcUIvR1Fwdjkremk5YmhZUXBpTW5i?=
 =?utf-8?B?amd1N1lMU2FxRjFueml6SmExV0xqS2JNSmVsbW5PREhGZjlhVzdNcFE2a2FX?=
 =?utf-8?B?ZjV2Z3dDWG42NXpPblQwcVAzMnVLRkJmbHJJaDVpWmJhcTlzQm1qelZwdi9m?=
 =?utf-8?B?eHBDZWY0S0tYYnFDdXh3M1pVcjRMd28vTFVQeFp6NGJ6UHBNcHlFVXMzRjYx?=
 =?utf-8?B?UzEvTG80ajRNaWw4enhsbGFRSTY0NW1JVXFZTEliYVZCQktXS1E3SEgwOTRZ?=
 =?utf-8?B?Um11ZlVmWkR6VVJ2NTF2d3NMdVkrYWdROHZtS1dnNkJOdTUzSE5WeEtyK1VE?=
 =?utf-8?B?SGtXTW9FRGlERlhwVzhMRm1rVjFnaFpxa09CR08xNHNtR0Z5emN1VFF2cXZ6?=
 =?utf-8?B?elJrYzZUTnZ2QUJSQUFpK0tTR3FTeTlub0lhWmFod2lJcXNvZUdxM1dwclVU?=
 =?utf-8?B?dDlUY2JsWVVwVG14OU9nVmh3ZHAzMzlZM3JlUXhESTdmWHRsZ0oySDM3SmtV?=
 =?utf-8?B?bUZOek82ZWw4eGlWbk5QczVrQXV0dDJRcHBObk8vZjU1Y1FQN3g3cExVZ01h?=
 =?utf-8?B?K0kyOFNDbENHS1owSVg1aW1nRHdYaUpTT0d4N3YrcWtiTHRPTTZzb2Y2elJX?=
 =?utf-8?Q?y2Q4MSJUb5Ujp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e44b8e7-2996-4d3f-2357-08d921eccf53
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 15:25:22.4926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wKtBreXz8/1LXGgdH6kI6xfCv1z7+jNh8H/ECZhQCi1nJ0vvFGFfCI1oXc6cMso
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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

Am 28.05.21 um 17:10 schrieb Thomas Hellström:
>
> On 5/28/21 4:19 PM, Christian König wrote:
>> Am 27.05.21 um 16:47 schrieb Thomas Hellström:
>>> Reading out of write-combining mapped memory is typically very slow
>>> since the CPU doesn't prefetch. However some archs have special
>>> instructions to do this.
>>>
>>> So add a best-effort memcpy_from_wc taking dma-buf-map pointer
>>> arguments that attempts to use a fast prefetching memcpy and
>>> otherwise falls back to ordinary memcopies, taking the iomem tagging
>>> into account.
>>>
>>> The code is largely copied from i915_memcpy_from_wc.
>>>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   Documentation/gpu/drm-mm.rst |   2 +-
>>>   drivers/gpu/drm/drm_cache.c  | 138 
>>> +++++++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/drm_drv.c    |   2 +
>>>   include/drm/drm_cache.h      |   7 ++
>>>   4 files changed, 148 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/gpu/drm-mm.rst 
>>> b/Documentation/gpu/drm-mm.rst
>>> index 21be6deadc12..c66058c5bce7 100644
>>> --- a/Documentation/gpu/drm-mm.rst
>>> +++ b/Documentation/gpu/drm-mm.rst
>>> @@ -469,7 +469,7 @@ DRM MM Range Allocator Function References
>>>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>>>      :export:
>>>   -DRM Cache Handling
>>> +DRM Cache Handling and Fast WC memcpy()
>>>   ==================
>>>     .. kernel-doc:: drivers/gpu/drm/drm_cache.c
>>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>>> index 79a50ef1250f..08614f7fdd8d 100644
>>> --- a/drivers/gpu/drm/drm_cache.c
>>> +++ b/drivers/gpu/drm/drm_cache.c
>>> @@ -28,6 +28,7 @@
>>>    * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
>>>    */
>>>   +#include <linux/dma-buf-map.h>
>>>   #include <linux/export.h>
>>>   #include <linux/highmem.h>
>>>   #include <linux/mem_encrypt.h>
>>> @@ -35,6 +36,9 @@
>>>     #include <drm/drm_cache.h>
>>>   +/* A small bounce buffer that fits on the stack. */
>>> +#define MEMCPY_BOUNCE_SIZE 128
>>> +
>>>   #if defined(CONFIG_X86)
>>>   #include <asm/smp.h>
>>>   @@ -209,3 +213,137 @@ bool drm_need_swiotlb(int dma_bits)
>>>       return max_iomem > ((u64)1 << dma_bits);
>>>   }
>>>   EXPORT_SYMBOL(drm_need_swiotlb);
>>> +
>>> +#ifdef CONFIG_X86
>>> +
>>> +static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
>>> +
>>> +static void __memcpy_ntdqa(void *dst, const void *src, unsigned 
>>> long len)
>>> +{
>>> +    kernel_fpu_begin();
>>> +
>>> +    while (len >= 4) {
>>> +        asm("movntdqa    (%0), %%xmm0\n"
>>> +            "movntdqa 16(%0), %%xmm1\n"
>>> +            "movntdqa 32(%0), %%xmm2\n"
>>> +            "movntdqa 48(%0), %%xmm3\n"
>>> +            "movaps %%xmm0,   (%1)\n"
>>> +            "movaps %%xmm1, 16(%1)\n"
>>> +            "movaps %%xmm2, 32(%1)\n"
>>> +            "movaps %%xmm3, 48(%1)\n"
>>> +            :: "r" (src), "r" (dst) : "memory");
>>> +        src += 64;
>>> +        dst += 64;
>>> +        len -= 4;
>>> +    }
>>> +    while (len--) {
>>> +        asm("movntdqa (%0), %%xmm0\n"
>>> +            "movaps %%xmm0, (%1)\n"
>>> +            :: "r" (src), "r" (dst) : "memory");
>>> +        src += 16;
>>> +        dst += 16;
>>> +    }
>>> +
>>> +    kernel_fpu_end();
>>> +}
>>> +
>>> +/*
>>> + * __drm_memcpy_from_wc copies @len bytes from @src to @dst using
>>> + * non-temporal instructions where available. Note that all arguments
>>> + * (@src, @dst) must be aligned to 16 bytes and @len must be a 
>>> multiple
>>> + * of 16.
>>> + */
>>> +static void __drm_memcpy_from_wc(void *dst, const void *src, 
>>> unsigned long len)
>>> +{
>>> +    if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 
>>> 15))
>>> +        memcpy(dst, src, len);
>>> +    else if (likely(len))
>>> +        __memcpy_ntdqa(dst, src, len >> 4);
>>> +}
>>> +#endif
>>> +
>>> +static void memcpy_fallback(struct dma_buf_map *dst,
>>> +                const struct dma_buf_map *src,
>>> +                unsigned long len)
>>> +{
>>> +    if (!dst->is_iomem && !src->is_iomem) {
>>> +        memcpy(dst->vaddr, src->vaddr, len);
>>> +    } else if (!src->is_iomem) {
>>> +        dma_buf_map_memcpy_to(dst, src->vaddr, len);
>>> +    } else if (!dst->is_iomem) {
>>> +        memcpy_fromio(dst->vaddr, src->vaddr_iomem, len);
>>> +    } else {
>>> +        /*
>>> +         * Bounce size is not performance tuned, but using a
>>> +         * bounce buffer like this is significantly faster than
>>> +         * resorting to ioreadxx() + iowritexx().
>>> +         */
>>> +        char bounce[MEMCPY_BOUNCE_SIZE];
>>> +        void __iomem *_src = src->vaddr_iomem;
>>> +        void __iomem *_dst = dst->vaddr_iomem;
>>> +
>>> +        while (len >= MEMCPY_BOUNCE_SIZE) {
>>> +            memcpy_fromio(bounce, _src, MEMCPY_BOUNCE_SIZE);
>>> +            memcpy_toio(_dst, bounce, MEMCPY_BOUNCE_SIZE);
>>> +            _src += MEMCPY_BOUNCE_SIZE;
>>> +            _dst += MEMCPY_BOUNCE_SIZE;
>>> +            len -= MEMCPY_BOUNCE_SIZE;
>>> +        }
>>> +        if (len) {
>>> +            memcpy_fromio(bounce, _src, MEMCPY_BOUNCE_SIZE);
>>> +            memcpy_toio(_dst, bounce, MEMCPY_BOUNCE_SIZE);
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +/**
>>> + * drm_memcpy_from_wc - Perform the fastest available memcpy from a 
>>> source
>>> + * that may be WC.
>>> + * @dst: The destination pointer
>>> + * @src: The source pointer
>>> + * @len: The size of the area o transfer in bytes
>>> + *
>>> + * Tries an arch optimized memcpy for prefetching reading out of a 
>>> WC region,
>>> + * and if no such beast is available, falls back to a normal memcpy.
>>> + */
>>> +void drm_memcpy_from_wc(struct dma_buf_map *dst,
>>> +            const struct dma_buf_map *src,
>>> +            unsigned long len)
>>> +{
>>> +    if (WARN_ON(in_interrupt()))
>>> +        return;
>>
>> I would either make it a BUG_ON() or at least use the fallback memcpy.
>>
>> Just returning without doing anything isn't really nice.
>
> Hmm, Yes, Daniel suggested this on IRC. I would have gone for the 
> fallback which he didn't like, and I think crashing the kernel with a 
> BUG_ON in an interrupt which from experience might result in a 
> completely silent hang without a trace of what went wrong unless 
> possibly with a serial console is not really acceptable either.... 
> Perhaps we can go for a WARN_ON + fallback, which still forces the 
> caller to come up with something else...

Yeah, good argument. BUG_ON in an interrupt handler is nasty as well. 
WARN_ON+fallback sounds like the right thing to do.

Christian.

>
> /Thomas
>
>>
>> Christian.
>>
>>> +
>>> +    if (IS_ENABLED(CONFIG_X86) && 
>>> static_branch_likely(&has_movntdqa)) {
>>> +        __drm_memcpy_from_wc(dst->is_iomem ?
>>> +                     (void __force *)dst->vaddr_iomem :
>>> +                     dst->vaddr,
>>> +                     src->is_iomem ?
>>> +                     (void const __force *)src->vaddr_iomem :
>>> +                     src->vaddr,
>>> +                     len);
>>> +        return;
>>> +    }
>>> +
>>> +    memcpy_fallback(dst, src, len);
>>> +}
>>> +EXPORT_SYMBOL(drm_memcpy_from_wc);
>>> +
>>> +#ifdef CONFIG_X86
>>> +/**
>>> + * drm_memcpy_init_early - One time initialization of the WC memcpy 
>>> code
>>> + */
>>> +void drm_memcpy_init_early(void)
>>> +{
>>> +    /*
>>> +     * Some hypervisors (e.g. KVM) don't support VEX-prefix 
>>> instructions
>>> +     * emulation. So don't enable movntdqa in hypervisor guest.
>>> +     */
>>> +    if (static_cpu_has(X86_FEATURE_XMM4_1) &&
>>> +        !boot_cpu_has(X86_FEATURE_HYPERVISOR))
>>> +        static_branch_enable(&has_movntdqa);
>>> +}
>>> +#else
>>> +void drm_memcpy_init_early(void)
>>> +{
>>> +}
>>> +#endif
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 3d8d68a98b95..8804ec7d3215 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -35,6 +35,7 @@
>>>   #include <linux/slab.h>
>>>   #include <linux/srcu.h>
>>>   +#include <drm/drm_cache.h>
>>>   #include <drm/drm_client.h>
>>>   #include <drm/drm_color_mgmt.h>
>>>   #include <drm/drm_drv.h>
>>> @@ -1041,6 +1042,7 @@ static int __init drm_core_init(void)
>>>         drm_connector_ida_init();
>>>       idr_init(&drm_minors_idr);
>>> +    drm_memcpy_init_early();
>>>         ret = drm_sysfs_init();
>>>       if (ret < 0) {
>>> diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
>>> index e9ad4863d915..cc9de1632dd3 100644
>>> --- a/include/drm/drm_cache.h
>>> +++ b/include/drm/drm_cache.h
>>> @@ -35,6 +35,8 @@
>>>     #include <linux/scatterlist.h>
>>>   +struct dma_buf_map;
>>> +
>>>   void drm_clflush_pages(struct page *pages[], unsigned long 
>>> num_pages);
>>>   void drm_clflush_sg(struct sg_table *st);
>>>   void drm_clflush_virt_range(void *addr, unsigned long length);
>>> @@ -70,4 +72,9 @@ static inline bool drm_arch_can_wc_memory(void)
>>>   #endif
>>>   }
>>>   +void drm_memcpy_init_early(void);
>>> +
>>> +void drm_memcpy_from_wc(struct dma_buf_map *dst,
>>> +            const struct dma_buf_map *src,
>>> +            unsigned long len);
>>>   #endif
>>

