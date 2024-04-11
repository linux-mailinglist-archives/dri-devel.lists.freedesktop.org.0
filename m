Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C7D8A0B8C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 10:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1C710E94D;
	Thu, 11 Apr 2024 08:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="EN8Nmyen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2045.outbound.protection.outlook.com [40.107.215.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2D710E94D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 08:43:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPZAC99mUn1DYKpNRgj8pz4U5VF9hOgXwLsJa4dCdrjPJRnJEaPOJ93CIrUYDp4gnon/6AYEL0u5obec8In47G8ZD+MAOxq2/q3yOEBtN+UyCOlKVYoV2/qWKVTZ/9KLDbAqkoocHZdMpQO+6O5dLs5VBexFIDrxGMFNLFYfDP7H7I2zP4l5IKSJCsXd0ejqBe4kUxsBHTLCuzQYgBDUXdReTwt4gvThty5GUtCbl1L7m5sGF1KV8yDJvDXHnuk7r2Wbr2oiPsaEwSk1fKoqHwzVGqM2GkJhyG2S5QvaPZ0/bKE9h5Q0YREIuLRNK2Dq7RlA0oYN6nGMVzaDI7l0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdICYd8AHPB/nqHMaPuFEH7y6fHOJe7YCrfuid59zlA=;
 b=G5mdKMdoXxM7pgwfETk+/zJkWhZrYRb7JnWfqTwY7n1pHJUdYoDY60JhYnaNLp1U0uiffmo/dWj3bWVBkIce2sVFum+udhrUg+yRv2FRjpQ5bdIRwuUsQJ4XLiwze88Uch0qT2BiePMWZ1RQZ7+FxscBDBtgwVjdKgNQDWQiedcnBxXDrzMGVNxL3ixuMWEgz+GZSvuHFpoq+cBAizYqp2y91++izI6esiuFGjaXgGNUentVA/lPu347+cQCmTl0kaDVzMpFbQupBrpJAo7qiTDlOLIMVXtHzuOoA7JyfVSZ83HIGBETVBVxx9Xkqtxh90IIROPkczgyf42g7kOPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdICYd8AHPB/nqHMaPuFEH7y6fHOJe7YCrfuid59zlA=;
 b=EN8Nmyen2/aDpKTQv27JamiB+YYUDuvsNepnZS2sgZqhoJHc2R3TR7Hnzp/rYj6W2NjeU8Dqlc8kmLEkzRgoSfCryryb769goeY2H+lFgyKebs9x7rdau1PhZpXC/BRBwEbtXGzn7cxPjzejZ+2rCbQeUagEW2IrV/qwciQrycEOMmSr6ChafQgFgr/lBMTlXVja2VlFBnUems0gcOpoahiA4j7N1FvdEsr0DeagRXXuj6ZIpnobaJ0NGlUkFntg00KkVkrZJBh4Wk0+N5CMWxD4YEBrnf9c2GhTh31+rUycEWjWEOYrhPTa3O+zoz6Ef5Y/ZYLiuJhFt5mkXTW2CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB6703.apcprd06.prod.outlook.com (2603:1096:990:36::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.55; Thu, 11 Apr 2024 08:43:51 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1%3]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 08:43:51 +0000
Message-ID: <32f166c8-7810-4cef-befb-44e34f9b5372@vivo.com>
Date: Thu, 11 Apr 2024 16:43:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Rong Qianfeng <rongqianfeng@vivo.com>, Jianqun Xu
 <jay.xu@rock-chips.com>, sumit.semwal@linaro.org,
 pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch, jason@jlekstrand.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
 <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
 <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
 <CABdmKX1OZ9yT3YQA9e7JzKND9wfiL-hnf87Q6v9pwtnAeLHrdA@mail.gmail.com>
 <0df41277-ded5-4a42-9df5-864d2b6646f5@amd.com>
 <CABdmKX03Of7OE_9PfAy5DWcCwwvQvJGXDjzAE8c4WRrz_0Z_eg@mail.gmail.com>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <CABdmKX03Of7OE_9PfAy5DWcCwwvQvJGXDjzAE8c4WRrz_0Z_eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:405:2::22) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d083b1-c31a-4df6-045e-08dc5a038340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JliPPk+JxF9RK3lSif6gsh2/Gkn26W9T8AMHohRj2FTd+V6Z7BuL9/6UzGdVgYSILrr76gU9fwY6Lj9aAmnmkGIpyjCkUcWs7bgeNEIS1fZHzCyM0FciDp0XFBFMQIaCMWLenzgXducC6OOPjcSwcQC9uGmyfiXn0iU81ZZENRbwKvDKs7LU1F/YtNW651DNNgt3/t846OwXI30w3pDoidr5n6GTJ4U1oUCko4QqY/r+jYgFIXDWTphnwkoNigHF9KBU9v4NEUBigtLVy0vqCjxIn+BKJoeCeCpf7Fdy7aHDbLF+nb1+IKOfHN6+fVhc2LScI+DCIiom9SXLEtbLVYHpjUg9JWwFKGiBOZTEkCkF8qpFIkuEjPTYIoFljyY3RGH35xUZmE2+MRWAq64VNoxBidoGBCi7sBsdKmaARepaKDaYgjzbrMpUPh0twAW+PH3VGfjl7RJE9ukb/Xk9gEGpImUTNOyhH/oaAKzAvgmqK6yphR4H+jEelN1S+N3CFQtJs8xhoQ7f+Z3mBqBqd4peWF5BS50USEmQrorF8l8EdwgpC0IYffVR8x+zryvsEirotTBZVRH5vy0gDIfe1sX/lD0DG/ZtvXyaq7/VYjVf+eI7O2PDCp3xI4un9vrQxGRGoIlWsZr/2STBCtRQ5gXKdx6vHE6nJl8bdB70U7CuR3R8l9cLNIeSawgqZyDr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(376005)(366007)(7416005)(38350700005)(81742002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXNyV3E5R05HdURORXVZUHhoK1pZQXNEblZzMzI0d0JUVVVQUnNmREIzNzlS?=
 =?utf-8?B?Qi9jNUM3ck84dHg2OXQyWXBzZFFjcWFCRjNJdHQrVnRGVnJnSlNsNENoNi9m?=
 =?utf-8?B?ZVg3NytCVERwTDZ1dlh0ZElkVkdESmticVpsLzczQ1BhVHRkSkV0aGJUeWR3?=
 =?utf-8?B?ZFo4OXMvczcxdmo3a283VlRzdStZczZra1lIVmI0YnRBSkJmL1B3ZmpKN0Ir?=
 =?utf-8?B?N3hYUHNpV3UwQWxRa1V6Tldpb0p2RnpaZFJuUDNVZ0RFNjgwRW5BS3VXd2cy?=
 =?utf-8?B?WFpTOGtvc1FoS3YraGg2aFc2ekh6cThrV2llbXp5QWhzYXhvNmxPYTVIMlhG?=
 =?utf-8?B?WkxWOVlUZ3pmdkFCWFA3dVBYczJKM242c1dVSU13OFZxM3QxMFBQbm43SklD?=
 =?utf-8?B?NmdaOC9aMWNERjZOY0RqeGZvTDJTUjlBVGJmR3lPYzhyM1pSNkZlb1lwSDN1?=
 =?utf-8?B?bkQ3WUEvN29XV0hGSWxEQ3hTWmVqanJyNkVuTFowUG1sUGdDcFhHdFpyU0VF?=
 =?utf-8?B?aFRhTEhQVC9SY1RpN210RXB6cG5aa0Y4YVJxamEyUnlNcW93THRIbzJjbjR4?=
 =?utf-8?B?MHBLSEtuRk9wZ0ZoTTFRb2FqTXV3cVR4aU44cGNpek9NWlFUbFY1U3IybnM2?=
 =?utf-8?B?WmRpcFIrNDFOSkl6cUVFenNPZkc5NVFhb2wvMjBQSUZoUGQrYkxMQW5TRmtz?=
 =?utf-8?B?QVhySkt2SythdFhmL1p1N09RU3lpTnV1QzFraHgxWTBWMnlWY2hJekg2S0Zy?=
 =?utf-8?B?eDZrY3VIN2FEUXZJUnd0dEhwRW1WbkExTTB1ZkFIbUxEYkhuQTRhRFdGQ0F3?=
 =?utf-8?B?ZExsZDQvWjY0U1dsWGY5ME5ZYTk0QkJkU2VnbEtsa2RkaVhXQ09sNEhCNmhE?=
 =?utf-8?B?dkE5SzRNWmlqcVBFTUhoUWxaN1QrcjhMWC92REdidWpqazVodEk0ejhQWGxm?=
 =?utf-8?B?aC9SRll0Z2M2ODdYRWIybVZYRFN0d0JoN1B3OEUyMmc5ZUMxeHdvZjFwV0I0?=
 =?utf-8?B?anFkTUZBOUZxQVE1Q29UQ2pkNm02dm53MWJNeS9iMU1vRC9PWXhwMk50RXpG?=
 =?utf-8?B?WklTaGpLSVVDdnMyeEd1MCtrUjBHektybURnVTUybEF2Z2dWQVQ1bU1zUWZ5?=
 =?utf-8?B?YWhWdW5kYlVLSVlwRStrVGRqbXJnWjJIQVBsWmgxMm44cTFUblpBeHNnelNO?=
 =?utf-8?B?STJ4UDlBc013ZTJzUWJlVEozSDdrdE81Y0drYklaYzFIcWZyUTJ2RDBha1NJ?=
 =?utf-8?B?UmRKeDd0Zkk5RVptQUhyMTY5N2F6bEwvMTdQc05GRGNZOHA3U3g4bkJSUnpU?=
 =?utf-8?B?bmlVMnpQR21pQXpSYk42U0VPQmUybzFTalJXMDYrUFJXQlVXUDVrU0hDUHFV?=
 =?utf-8?B?RjA2MnZTUFNoMFNFaS9KVWJ2YlFqbkpFM0o0VG1Yc21ZYm0yZDBzTUlEYkV4?=
 =?utf-8?B?bEFNR0dhcnd0L2o2WFJjNTlFSUM4YWVXSW5kcTFkVVp2Tll0UkhWTjUvOGVD?=
 =?utf-8?B?VjNMU1U3Yjd3MGRyckNsK1hvLytvNVppYzJ0bFZlUkMwODJzaE40cTZtZU1S?=
 =?utf-8?B?a2VrdnZaS0ZiUFUvblRndnpTdEtmcTcwZkprNVlYcmEvSXVjS0lmRWdGa21s?=
 =?utf-8?B?Nm00RDhXb0hscE5yMEw4NUViWGlVeWE1ZEowY3pLYXJrVjk2SHRuRlhLWity?=
 =?utf-8?B?eGJucUYxYi9US0ZEV2xTRXdkS0VYWWg1S1V1TE9ERWswbGtJVWEzVlo4UG1O?=
 =?utf-8?B?aThZcmNrZ0kvMnNvY1B1eWQxS3VUK0VDNEpqenFCdG9IdzE1NC9oNzNOVHZl?=
 =?utf-8?B?dW9Zenl0MFFnRVpWaVMwdThJb241VlNYdlhDcEhWcitDVTF1c3lPbTRYOGZU?=
 =?utf-8?B?dDRPQ09KZU8yQURBSnhNejJETnUvQjJEUlBRTkxxMGwwbXlGdWRsOFBYR09r?=
 =?utf-8?B?a2pxNmVJWkpTdmRDZHNnMTd0MWppbEJvOXVnYVM4dERPK3pmbEpZT21BS204?=
 =?utf-8?B?UTB3eWlRTlRGYTREeHBrMmlxK3JDT3ZFV1FTSS82NTlKRXc0ZDNneEdyQ2FL?=
 =?utf-8?B?VWJ0aHlFZVBVZjF0MnN4eTlkL2VqRFEvWElkQU1FSzUwWGVNSVNUeUdTNENq?=
 =?utf-8?Q?u7Y7f6oMlIo9tXOtvT0ELVPm9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d083b1-c31a-4df6-045e-08dc5a038340
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 08:43:51.5678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrk6kkKR4Dd6+Ibr+AUoezzmZq6cQOnLsaO6fcmzm/N6LPJJZfI6BRqQ9IsSVluUlPqu0OTH2Rji31wLMehorQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6703
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


在 2024/4/10 23:07, T.J. Mercier 写道:
> [You don't often get email from tjmercier@google.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Wed, Apr 10, 2024 at 7:22 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 09.04.24 um 18:37 schrieb T.J. Mercier:
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
>>> page pool connected to a shrinker.
>> Well, it should be obvious but I'm going to repeat it here: Submitting
>> kernel patches for our of tree code is a rather *extreme* no-go.
>>
> Sorry I think my comment led to some confusion. I wasn't suggesting
> you should take the patch; it's clearly incomplete. I was pointing out
> another option to Rong. It appears Rong is creating a single oversized
> dma-buf, and subdividing it in userspace to avoid multiple allocations
> for multiple buffers. That would lead to a need for a partial sync of
> the buffer from userspace. Instead of that, using a heap with a page
> pool gets you kind of the same thing with a lot less headache in
> userspace, and no need for partial sync. So I wanted to share that
> option, and that can go in just Android if necessary without this
> patch.

Hi T.J.

If there is a chance to use this patch on Android, I can explain to you 
in detail

why the user layer needs the dma-buf memory pool.

Thanks

Rong Qianfeng

>
>> That in kernel code *must* have an in kernel user is a number one rule.
>>
>> When somebody violates this rule he pretty much disqualifying himself as
>> reliable source of patches since maintainers then have to assume that
>> this person tries to submit code which doesn't have a justification to
>> be upstream.
>>
>> So while this actually looks useful from the technical side as long as
>> nobody does an implementation based on an upstream driver I absolutely
>> have to reject it from the organizational side.
>>
>> Regards,
>> Christian.
>>
>>>    That allows you to skip page
>>> allocation without fully pinning the memory like you get when
>>> allocating a dma-buf that's way larger than necessary. If it's for a
>>> camera maybe you need physically contiguous memory, but it's also
>>> possible to set that up.
>>>
>>> https://android.googlesource.com/kernel/common/+/refs/heads/android14-6.1/drivers/dma-buf/heaps/system_heap.c#377
>>>
>>>
>>>> To be honest, I didn't understand your concern "...how drivers should be
>>>> able to fulfill this semantics." Can you please help explain it in more
>>>> detail?
>>>>
>>>> Thanks,
>>>>
>>>> Rong Qianfeng.
>>>>
>>>>>> Thanks
>>>>>> Rong Qianfeng.
