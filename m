Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F18A2874
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 09:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2E010F4B2;
	Fri, 12 Apr 2024 07:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Nu1InJQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2061.outbound.protection.outlook.com [40.107.255.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071AC10F4B2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 07:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5aJTftaQAf0EHXzRWqvVvNGielvL6/VxC3h435wIfi8ly5QLEFLS2iCqlyDc1zVkGI9skKmvcnT0dI4dEi/qAxX/YMR7c9GuQ3HEbKPlmA2tFr72ANQ86ORrH0PpTuusgzkXD/TsOkm20/RXb2JofLvXkMEimUTS6VIrM/AqIY90qgHo5tbZu871vYg/nvvJTNN6bTFo3o/EGfZBv57XKpmU8RsrQ/gSlmxujaETOW2xoKSE4Ll9zC6ia9aceNsgPgJ6NZdikIF63hipWNkBrilX9apTs79vvVncfsQQYUghQeg74kd89I7jcxfsCujuHRRjMvk9V6QtARqSN1AVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98hAcsWlgnWXoieoYTjxrfzHS8zziuzSS6p0iwck0OA=;
 b=bH73xrv3svIkeGcRnJhukgL7F1kgDWdoFKD5ubktasQMPVR60pmhGJ3y+ci165Kr18cVoP4OXLUJ/g3mbdQk/jRcOmcnZZYAx0jkNXI/wNiYiSSM9zArikpvMG/iQvGDpZt69jkm1mph5Vk4mM0dFmkXcpAggeE+X7d07FHR8RNB7k2o7hDpCw1qi5yLQE0b1NK7vF7xwKrM4ziNDPb6SaQFpEH+3LxXlfawYqkoh6rmzrwR1a9leo4NBfFuj8K0YTWik4tYStHM/5NbTauIYE9e5s0zt0Po1P4gHysIe8h60xZkSrbRHbq+2qWXZKNP8MwGRhr92Png/fBfPFj5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98hAcsWlgnWXoieoYTjxrfzHS8zziuzSS6p0iwck0OA=;
 b=Nu1InJQUiytPuKgOqWOk+VJUPK3Z0u3vzIH4qLNCYYdD+bOahHghbpHrNPVD2Z9HQkcuFZsxQGmlFInEkHV6Igpw4+eYlfK55hEJFb++ADIlQmOPrG8qmiY9q4MgVcrPb3sNfVvLzoytVG8WljNb86Wnz8NRnGeRwS2139XUtZY40AOG2NUM4ymk8iJEXh5EMHosE94kygwfwQoQd4ccihets5VgFFGf2TElrDofqut3Xe8E1HPhY9SYpoiNjyNJdU3QntL8ILQPX2xi7FK54Yz2MUE+wh5PkbW2s1IUAIS47Vt29x85iOB8X3Sl5NkiYBRfZZq7Zl2TQr8+TxZKrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TY0PR06MB6840.apcprd06.prod.outlook.com (2603:1096:405:17::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Fri, 12 Apr 2024 07:46:42 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1%3]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 07:46:42 +0000
Message-ID: <c9280752-93e0-4779-9cc4-8a68465ba526@vivo.com>
Date: Fri, 12 Apr 2024 15:46:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rong Qianfeng <rongqianfeng@vivo.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 sumit.semwal@linaro.org, pekka.paalanen@collabora.com,
 daniel.vetter@ffwll.ch, jason@jlekstrand.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
 <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
 <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
 <CABdmKX1OZ9yT3YQA9e7JzKND9wfiL-hnf87Q6v9pwtnAeLHrdA@mail.gmail.com>
 <da21fe55-2ffb-4c8e-9863-2f27aa18cf5c@vivo.com>
 <CABdmKX0AJjdVBPR=3c7oRyDRQx86GCGheVwkheXi7fOkJaRY8A@mail.gmail.com>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <CABdmKX0AJjdVBPR=3c7oRyDRQx86GCGheVwkheXi7fOkJaRY8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::11) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TY0PR06MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb632e2-95db-4684-4d15-08dc5ac4b1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CXd4KtyUcgSJZ/Dhxv/9JVpSH/2fKL+D7H0Gwsvt9d1wntyrS+8Fx/xNZrvzBZmXPHY2UtvJ7sZBGl+pIdXb0KGpuGMiu2OrhVDShq7E1qsVnKuDxnAhiOc8YeWg7Lj+MpBFrCYhst9ruLvGf+dUXe41dwQK2a8srcfzjaEKtI7brDnEvv5qp4bb1qCRgrBDyX9blNc/BnDvTb5g67fQWf7ftrNVreLPc3D4Up7hBh269BEPk9UkAFw9l6KRp9Lx5rXuJAwqh2mcT/ac6PjS6Csf9t/9Pln+13JzVuG0LElFxBYKJ8ZNP7AMSB/oHkF8EhtaL3ocx426G9FNhfdWU7ljQoVRsLi+e/6zH/+7RTx1cMUHlbSZlh3MfX1RcgVZv2PWl5b1MciZaXcitMFGu9Smj7gFwKTB7nANawf1fKv6zooBIa6PuQIrIzXTDPRpLAG3/KikQHCm1MwZgFPmgVFS8LHA83umKRcQKR3Mi4pjt6GD4xzLoM4nipxIFdrAxoQ7QXL928viWseMROurszdUCu6RAG1Fqnw0wZbubumPxlladn3RsTl0yw2pcotM10F9AYlyi9p9x+DZZEDtDmJa5YpNgCDfC8z0rHeh5PdYlkXDxDmU+Mve5DmPqY5vinCc/eSRwlFcsboFfS17SYQuhye33zblefUZkho2MCpA8vQJemqNqpX/jqj0ifVb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(376005)(7416005)(366007)(38350700005)(81742002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1lqZk4wQWNZdGFhcjQ1aWc0c3NvampHcDhRK0d2TllKWHdxWW5UWnE3QXY1?=
 =?utf-8?B?dDZSaml0ZXJqWmJjcVZjbnpPMmpJT1lwQURwclhFR3JqTXdWNnd6VU5aalpr?=
 =?utf-8?B?TmMzdU9HOXExcWdIU0VXdnhsVlVWU0N5VkZ1YWJpYkw4dEs4OENBMkcrRW9K?=
 =?utf-8?B?bzFqYk00d2x0UHEzRk9Wd2RvZHY5Wkg2a2g5Rm5rNHRuNFA0K0pib0xnQUtp?=
 =?utf-8?B?M3M1cnZPMGFpKzhTQi9ROGNWNExvbUhtOUtlYjMxWjl0WnA2TWRsSG5TUmpk?=
 =?utf-8?B?c2NOSDFzQnlaYVlyVjRRNC9hYnZKR1krYmlJTUlkL05jVXc1Vzk2TlNOS3dn?=
 =?utf-8?B?cStPZWowOEppWlNRdERUNUg2aC91Z28wdmtJSjFEU21lWHpNL1JCMG1JTUtt?=
 =?utf-8?B?VUVLRlVXRjJiRWFTNDhpNGNzbUh4TzJ4SnUzMlYxMzRoSmdhdmJrS0xDMUdP?=
 =?utf-8?B?MlRibGRZeFZHN1lleTJLYStsdmxpdGNxdjk3Ulh1WDZCdWZHSkw3SUFmcUI0?=
 =?utf-8?B?Y1hOazVRWGNycEw5dm9JbnAyejVzWDAxM09JUE04MmYyZWEzU2Jid2J5MVdk?=
 =?utf-8?B?eVFVUGdoREpkbi96MEdTallwRVVmYis5Y0RDTy9UNzdteDI0RVBFeU11ZDJG?=
 =?utf-8?B?QW9HYlUwTDZ3d3l3eHhPRG5KeUIyZzNkdG5FRWJERW9aN0RYNHNqVE54RTVR?=
 =?utf-8?B?ZHBKazZ3ZVNCMFkyZ3dGL0tXcVhILzFxMDl0S3lYcC9hNGlMNldIYnpnU21U?=
 =?utf-8?B?SEdFaStIWGE0eEJEcGdtNlpFR2FIQjRmYnFSalNZUUF1UlR4Q0xUYncwQ2Fw?=
 =?utf-8?B?VUg1cXlXRVUwL2YvRmJ2YmlvWEozQms4L0VhZitzZWhFZkswbkdvZ0lTYW5m?=
 =?utf-8?B?Ri9UMHM2OEJZeVZPSmYvM3MvalJzbmNZSXV0UGV0RWFiS1dWZkoyZ3ZLWllE?=
 =?utf-8?B?Vk85VENtcHE1SHNDY2ZJWFFadXlrVzJ6VVpKV0taVSs1V0t0aUdvNEdLUHVo?=
 =?utf-8?B?VUpnTVF3Z1JheEV4L0phU2NBMGIwaEIxdTl4dmFmNTlrcjgrNFcwd0Z5elNr?=
 =?utf-8?B?TnVVQ0RFZ2l5MEF5MEFzblQrU0pWeEdDWHdEc2dMcHlJUFpLRkRKQjByUkl6?=
 =?utf-8?B?WEIxU1lZWW5XYTNNMkllRnhzRk9Vc05wbVVSYlJDVXozaFIrTmF0d0RJNkVu?=
 =?utf-8?B?T2ExcXNQeWo5UEtBWUlCdEZtS09vWXFrakhyUWVQZ1EwaHdFQnFsMTdVenNh?=
 =?utf-8?B?eUxzS1pBMk02dU16UHhNSk1ISnNwTnBaUnFvRUZzQVVTbEIwUzN5c0pHTEJ1?=
 =?utf-8?B?SmV2WUlRUEdXS0phdXptL3A1Q1dvVXBMdm1pWHp0TlpOSHgwUCtVMU1KRm1Z?=
 =?utf-8?B?bUozRE5ENlR3UnRna09DQ01kNzh5UmFRN1BCVnIyVGQ5QzhQY3VzeXJQaWdm?=
 =?utf-8?B?QnZhek52bTU1VStIYk1ZdWMva1cvUGtQNjFNVmNLSXhRNXBSMDYrc2JteStQ?=
 =?utf-8?B?aWNaM3ZZU2o4VUFHMnkvNjlYZFRJc2xWKzNJODJ3T2luWURzN1ZRQVdqdWlF?=
 =?utf-8?B?azJkTDBuSmRCMEkvRXJNV09BaWtvUWcyeUtQTnpqNnExMHhVejhRZmRVQjVQ?=
 =?utf-8?B?NjVQR3J3MThWa2hObFkwZjR3S0lSUGNWd2lha1IycGw5dk0wYllFc3JxU25O?=
 =?utf-8?B?TW9xL3BFY3N6clBIcE4yTnA5RXRXV2RlbnVKNVJMblR2MHlaNUNvSkh6Nm9k?=
 =?utf-8?B?MVhDdXB0RzhOK1drZTJMaFpGTGpMSE4yU0t5b0M4Mmh1Wk9JaEJnZy85Z3RQ?=
 =?utf-8?B?NDV2R0MzMDI5S21BVWRuaDk1WUQ4c1B2WEtRLzlnS04xRTdBbVhqVkh5VVpI?=
 =?utf-8?B?Qitic1Y0NFRRY0tBQVl1dllNdE1Ha0ZrV1pKeGhrZk52UEpZYm96UStPTEJR?=
 =?utf-8?B?RkRBaDBwbkxHQmhIbUlqd0NnQ0wydTBNb1JWUGVPWVdOMzFxbUZyRUE5c3No?=
 =?utf-8?B?dGFUdi9DL1hyZEhuaEwxZ1NPdHlZYnM4S09YT0t1OURnUTJ6MzBBZE5VdU8z?=
 =?utf-8?B?SnRCQzU3TENIUHNaaUVqOTc5blBEYlk1OWROcHQwQmsvOHlGZEtRcVhONk55?=
 =?utf-8?Q?h2WhDB6RH+OBL8oHIH3iKWlv3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb632e2-95db-4684-4d15-08dc5ac4b1c0
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 07:46:42.4439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0H7HW3jE0/6ANlv/z9CaTiVzsnA0TjKCpddxVV2EAFLhRat1DZNnHxZo9DvPBKQoQGqdpsJKEFxMOiTzSwrvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6840
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


在 2024/4/12 0:52, T.J. Mercier 写道:
> On Thu, Apr 11, 2024 at 1:21 AM Rong Qianfeng <11065417@vivo.com> wrote:
>>
>> 在 2024/4/10 0:37, T.J. Mercier 写道:
>>> [You don't often get email from tjmercier@google.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> On Tue, Apr 9, 2024 at 12:34 AM Rong Qianfeng <11065417@vivo.com> wrote:
>>>> 在 2024/4/8 15:58, Christian König 写道:
>>>>> Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
>>>>>> [SNIP]
>>>>>>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
>>>>>>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
>>>>>>>> offset and len.
>>>>>>> You have not given an use case for this so it is a bit hard to
>>>>>>> review. And from the existing use cases I don't see why this should
>>>>>>> be necessary.
>>>>>>>
>>>>>>> Even worse from the existing backend implementation I don't even see
>>>>>>> how drivers should be able to fulfill this semantics.
>>>>>>>
>>>>>>> Please explain further,
>>>>>>> Christian.
>>>>>> Here is a practical case:
>>>>>> The user space can allocate a large chunk of dma-buf for
>>>>>> self-management, used as a shared memory pool.
>>>>>> Small dma-buf can be allocated from this shared memory pool and
>>>>>> released back to it after use, thus improving the speed of dma-buf
>>>>>> allocation and release.
>>>>>> Additionally, custom functionalities such as memory statistics and
>>>>>> boundary checking can be implemented in the user space.
>>>>>> Of course, the above-mentioned functionalities require the
>>>>>> implementation of a partial cache sync interface.
>>>>> Well that is obvious, but where is the code doing that?
>>>>>
>>>>> You can't send out code without an actual user of it. That will
>>>>> obviously be rejected.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>> In fact, we have already used the user-level dma-buf memory pool in the
>>>> camera shooting scenario on the phone.
>>>>
>>>>    From the test results, The execution time of the photo shooting
>>>> algorithm has been reduced from 3.8s to 3s.
>>>>
>>> For phones, the (out of tree) Android version of the system heap has a
>>> page pool connected to a shrinker. That allows you to skip page
>>> allocation without fully pinning the memory like you get when
>>> allocating a dma-buf that's way larger than necessary. If it's for a
>>> camera maybe you need physically contiguous memory, but it's also
>>> possible to set that up.
>>>
>>> https://android.googlesource.com/kernel/common/+/refs/heads/android14-6.1/drivers/dma-buf/heaps/system_heap.c#377
>>>
>> Thank you for the reminder.
>>
>> The page pool of the system heap can meet the needs of most scenarios,
>> but the camera shooting scenario is quite special.
>>
>> Why the camera shooting scenario needs to have a dma-buf memory pool in
>> the user-level？
>>
>> (1) The memory demand is extremely high and time requirements are
>> stringent.
> Preallocating for this makes sense to me, whether it is individual
> buffers or one large one.
>
>> (2) The memory in the page pool(system heap) is easily reclaimed or used
>> by other apps.
> Yeah, by design I guess. I have seen an implementation where the page
> pool is proactively refilled after it has been empty for some time
> which would help in scenarios where the pool is often reclaimed and
> low/empty. You could add that in a vendor heap.
Yeah, a similar feature has already been implemented by vendor.
>
>> (3) High concurrent allocation and release (with deferred-free) lead to
>> high memory usage peaks.
> Hopefully this is not every frame? I saw enough complaints about the
> deferred free of pool pages that it hasn't been carried forward since
> Android 13, so this should be less of a problem on recent kernels.
>
>> Additionally, after the camera exits, the shared memory pool can be
>> released, with minimal impact.
> Why do you care about the difference here? In one case it's when the
> buffer refcount goes to 0 and memory is freed immediately, and in the
> other it's the next time reclaim runs the shrinker.
I'm sorry, my description wasn't clear enough. What I meant to explain 
is that
the user-level dma-buf memory pool does not use reserved memory
(physically contiguous memory), and the memoryoccupation time is not too
long, resulting in a minimal impact on the system.
>
>
> I don't want to add UAPI for DMA_BUF_IOCTL_SYNC_PARTIAL to Android
> without it being in the upstream kernel. I don't think we can get that
> without an in-kernel user of dma_buf_begin_cpu_access_partial first,
> even though your use case wouldn't rely on that in-kernel usage. :\ So
> if you want to add this to phones for your camera app, then I think
> your best option is to add a vendor driver which implements this IOCTL
> and calls the dma_buf_begin_cpu_access_partial functions which are
> already exported.
Ok, thank you very much for your suggestion. I will definitely take it 
into consideration.
>
> Best,
> T.J.
