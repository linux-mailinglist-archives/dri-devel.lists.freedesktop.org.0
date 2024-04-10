Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888EA89F9CC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 16:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3331133C4;
	Wed, 10 Apr 2024 14:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ft7AR8Na";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2097.outbound.protection.outlook.com [40.107.244.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31A910EC1F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 14:22:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/A39cTkRMay/8oLdSh+p5+w7tV7NcR+N18b1ZEOpspBZ2Fb7OpQ88YmVHRoGdjth7gLuKc/lEoO7HUrfyAbNONFHkeItgNdrwat7xVDHNx0jYGjLYxzGL9dzdv166AvM1x//dBZDJwzEU7/LrxFGjkAhV3OABIew/NAhwZatVBmpxOik9yX8XsiKQ5Y28lgTbqsHQXVcoawc6/uHrnXTf5IWniQr8BqtAUjWpVloP4JnctGYFRnybAbPe0PES/Roe38Et6whXxDo4xl4reX6UenNACwuqwpkscaXbuzr9Idqa137rXuBjt7LyIwE7r+Mlmsneo9rcruvD1ImEQLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK2luO03Ielw2QJsOORU4GatgvD/LP3DVTBkFsLY5t4=;
 b=T9oXnmiwLXAHBrnKPNZrn+DpRYvEcMJMRQve+kZUnXkpxJDPulAcpuyWPwGpz9+40pg7qhlvFiQ4D4V0y7D1qh2Zydnn9O9JGkAMn9McrhRUEZkORzL2rP7wr5wHem/b/ZSog9DFHebopF23WLl3G2yHQBdWb+eGptUM/BVCjT+TjXmcpLXDtzoBpRMAfa55KZg6UE2lSGIGg8/xoPYEJUbQx5ECYs0pzoxYWm6oHfLDHtwAn15MDxEbTrg8LUzD/kpMgFIayW8+cTuitzbrZrZ0PD1iz4Oyra3xqy5bEp0PNIaiBmm31+fh3hm5ZMGMv8s2QJjw341L6ERig85qaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bK2luO03Ielw2QJsOORU4GatgvD/LP3DVTBkFsLY5t4=;
 b=ft7AR8NaC9NpiJQjA3IT/5GuwLYTjeNtobEsVGwwgxgemozN/AOOKdH72Fh6B77NWDApKnwH9EPADdkxapavzhUhtZtUcKrDWSMpmwic/JTr/9VAuKND1fwcFaPyq+Hvvolw/RGBDeYOu/bTLGw96et7vi5U4kajIcRq2UF2jOA=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 14:22:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 14:22:18 +0000
Message-ID: <0df41277-ded5-4a42-9df5-864d2b6646f5@amd.com>
Date: Wed, 10 Apr 2024 16:22:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
To: "T.J. Mercier" <tjmercier@google.com>, Rong Qianfeng <11065417@vivo.com>
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX1OZ9yT3YQA9e7JzKND9wfiL-hnf87Q6v9pwtnAeLHrdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0239.eurprd08.prod.outlook.com
 (2603:10a6:802:15::48) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5721:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAXuz9Ue2n4VdHjHSbGXIZ/vzZ+1nvGL/X64R5AM9YvsqaC7qLb4moYn+texMzZJEs4RHXH1J63x1CftnPE+uPopw8Hf4VKx0twtv0cumaQR2+SQZDAAHCNjXbjFsR4VcPLGcTckAVhRIwo1kbu9cMkBvy46p7ArjtkR/ojVU20Vyxpj1XdZe9hzJIrVvMH2jz+ZwbgBhgqES8iOCHHC8kGaICcJtpOvPfJh3DzYHOjW5A8ylok+xcn2kjXuL5nkmSZlbEPe3Yb3V5JvJnL5KWgVmFvo2Vdg+bVkVbA7RPutVHXlfMfkzEiuE183NCCLql4VF1MIXJFr3+6mGlhgSwb7wbriPvzS82952Z/JQzYfR91FPFmyCdr5vyJyEFvPGWLl6/nQT84ZNd95iGjChALeZpxwzCy0q5nZxDa54qP3ysoFojNpLdqNEm7siT5NcBTgKqUrvm4cPCfin5pZHrmcp0sQoZJxQY75PamlbYk12s6YfG5hp+KGNSSFWJSU2U4wjzhWQTUmFDZdaNPYsabSAySyRkWzd51deif6u66aFM7UgDI1x0oddYvg4O37M9t3z52R+zuP5X9dvQ6TM2K8W3vNLNWqE/p47LlUv+o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1JCRnczTDVWSzRSeXhIN3FTYk1lTXhuWkpWUG9FK2Y5bEx4UFd2ekRJa0hU?=
 =?utf-8?B?R3BxN29GemtIMWdja0MvMlptcW9jY3NtWm5CM25PTHpHTk84RWRCOU9KMzd6?=
 =?utf-8?B?YXdMclR0b1NBR3lnWkJwN2tCdllpQ0d3K0l6bjM5cEQ5ME5WRlUxbjZVUDhp?=
 =?utf-8?B?cXJ0SlNTZTExc3lqV213MjlYK0ZRdjduc3B3MFFUZnErK29OTXB1c05vaG1R?=
 =?utf-8?B?eDFGNkloeUNFdUZqMU1yVVF1OWZrQmZYYXRCSHh3VUtwZDJiR0V4NC9KdTNP?=
 =?utf-8?B?S2hsTHZDWEZDbzRSMnZxaTZwZmxYSlVzd01uakQ3VlZYcTBVbnpUcU53WUJs?=
 =?utf-8?B?R284RkVyRzJzV2hxbnhFa09LaFBxRFlmTkw5UGFRQUZkK0MzYk1XeThMUkRV?=
 =?utf-8?B?RmRlQURiQUtMMTNnS09hWXM5Rm44TWZoV1FVem1iQlF3VCtiUUZzZVFaVzJw?=
 =?utf-8?B?emF4NElvYTM3RUFlVi81M3pRWGNKWkpCTXdpRndyd2RldTJUM3BUbXE4ZnM0?=
 =?utf-8?B?YUxRSW5SZ0d5UlFWS1RXMGwxQWxUZGl4OXcvN2JwdFhIc1lzejJkOE5kWkpJ?=
 =?utf-8?B?Vk5tNG53TVY0L21iYWtRSE9XakxDZjU1MUo0bzNqREdwVExIZlB2UEZScUhH?=
 =?utf-8?B?aU1aUk4vc1p5clo2UUwwUkFmQ0xtQ2FST2ZEVGtpcDI2VE9hNUJSSkRma1A4?=
 =?utf-8?B?aDM1NEJLRzM3RzZiNHJiK21LOG9odGE2aVNDL2RzQXRsajU1dTFHSUNXTkpK?=
 =?utf-8?B?SVNXM2ltd1B5Y0xjdktvVFo0YnRnWERHdkdNZlhRRHY1bkozSnlqbElXTE9z?=
 =?utf-8?B?T25Sd201b0oxelgwbmV1QnR4eGY1aGxIQkZJWXQrRzcxamx4MW4zN25BeXZ1?=
 =?utf-8?B?K1RmOTlic0tISEIzVHg4N0J1Zi9oTzlqYU15ZHJrUWdVNitrOGdMR0szZkZC?=
 =?utf-8?B?ZTZCNmRPdnNieFFqMXcrS1hmamxZMFgyblF4WnFqc0VNYUM2MEx0blk1SGor?=
 =?utf-8?B?OVJHaWFSMWtpMEJRVU5SSnJxUDlHLzFZMUptSFJ1SG45V3YxV1BoYXdvRkhS?=
 =?utf-8?B?ZU1wNUQyaDFQVFBCam1iK1BmMDhBdzcxazB2ajVCTWZFVGc2SHFlT0szMlNH?=
 =?utf-8?B?OXk4WUprbTRUUGxQZUZPQ0xuQWF0b2J6a0ZyaWRmckNDN3ppdnFDa2g0ZmYw?=
 =?utf-8?B?OHJlVXhpYXN1UlJUWlE2N2Nkc1k2dHBucVJvSVJYVUlpZVA0dXpoM05CeHVG?=
 =?utf-8?B?UDF2Y09Qc1lldG8zbnhWazd0Q284UXRIOW5QL1dscTdEaFFoRTZPOHQ5L1lx?=
 =?utf-8?B?MXM1Q3JCZGVwSlVtbWxOMkxaL01FS1QxajRISndXblJmYmozK0l0NkpCZXNk?=
 =?utf-8?B?WDVreWNnQzNSa2xKOTZoOHp6ZVB0Z2JzZ1A5TW9qRDByOVdMQmhPbzllWC9V?=
 =?utf-8?B?ZlNYT3E2d1d6MEh1VFBLR0owMXVBWTA3SVdvSGhRazhzMmpjeVJWZExFbVZl?=
 =?utf-8?B?Mkd2Q2J6aVUrSmhXK1VHaTRBeURSUWJOMnBHc0tNSm84dVcvdzdnZUhHUHls?=
 =?utf-8?B?NlFGUWtlOG9ZVU4zdDk1aVBGTEloLy9DaDBsM2pReXdyU2U4cC9sOWNjaTZi?=
 =?utf-8?B?WnJjbVJNWUFvRkpibFlNdlVJbEp2TmpXd25iWE1SRENpTm82UVhwN25XL3k2?=
 =?utf-8?B?M2pLbWpsNVVhZnUvSnNuV0NVT2oydkE2SE9BdllZdGFNMmxhQVN5N1haRnBF?=
 =?utf-8?B?K1hWSE5oS0FaWkdUOHB0d2YvQWROdW44dFdac0pjR2p2b1lZR2VjbHFhU2ZF?=
 =?utf-8?B?R2ppNzlDcEp0VUNEeEwzU04yMHFHZ3JVeVJJQS9sZGltYzQzbWlOQXhpYlNp?=
 =?utf-8?B?Tzh4TnlLOEtEWllUS3Z4aFJud2pMaUE1ekVjd1FMWkJsaWdIRkF5RFU4THpK?=
 =?utf-8?B?cGV0ODNHMmJIRDZVazN4NzF4ZGN5YkhFdll6dzl1SFVKYVRyYTUzMW10OUlN?=
 =?utf-8?B?SDh4L3ppeDdBSGV4NzYvN09RQ0xnKy9MeFgzaDc3WUtFRHV4M0s0WjN1OHg3?=
 =?utf-8?B?aFNQZ0tpK1NRWTVkQmMzY1RvV0o5QWt5TmFSZFdxQWJaMC9RemxYd1F6cG1s?=
 =?utf-8?Q?v17umNHXgyWVmR1ZeLPtGRGUg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0acf21fd-0ed0-4e31-a196-08dc5969a0e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:22:18.8185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2ZcmmtpC3S/0NksgbRKDopFUvc261CS1ni5e3G/T190y/UqE0sEOZuo3TzKDG3x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5721
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

Am 09.04.24 um 18:37 schrieb T.J. Mercier:
> On Tue, Apr 9, 2024 at 12:34 AM Rong Qianfeng <11065417@vivo.com> wrote:
>>
>> 在 2024/4/8 15:58, Christian König 写道:
>>> Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
>>>> [SNIP]
>>>>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
>>>>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
>>>>>> offset and len.
>>>>> You have not given an use case for this so it is a bit hard to
>>>>> review. And from the existing use cases I don't see why this should
>>>>> be necessary.
>>>>>
>>>>> Even worse from the existing backend implementation I don't even see
>>>>> how drivers should be able to fulfill this semantics.
>>>>>
>>>>> Please explain further,
>>>>> Christian.
>>>> Here is a practical case:
>>>> The user space can allocate a large chunk of dma-buf for
>>>> self-management, used as a shared memory pool.
>>>> Small dma-buf can be allocated from this shared memory pool and
>>>> released back to it after use, thus improving the speed of dma-buf
>>>> allocation and release.
>>>> Additionally, custom functionalities such as memory statistics and
>>>> boundary checking can be implemented in the user space.
>>>> Of course, the above-mentioned functionalities require the
>>>> implementation of a partial cache sync interface.
>>> Well that is obvious, but where is the code doing that?
>>>
>>> You can't send out code without an actual user of it. That will
>>> obviously be rejected.
>>>
>>> Regards,
>>> Christian.
>> In fact, we have already used the user-level dma-buf memory pool in the
>> camera shooting scenario on the phone.
>>
>>   From the test results, The execution time of the photo shooting
>> algorithm has been reduced from 3.8s to 3s.
>>
> For phones, the (out of tree) Android version of the system heap has a
> page pool connected to a shrinker.

Well, it should be obvious but I'm going to repeat it here: Submitting 
kernel patches for our of tree code is a rather *extreme* no-go.

That in kernel code *must* have an in kernel user is a number one rule.

When somebody violates this rule he pretty much disqualifying himself as 
reliable source of patches since maintainers then have to assume that 
this person tries to submit code which doesn't have a justification to 
be upstream.

So while this actually looks useful from the technical side as long as 
nobody does an implementation based on an upstream driver I absolutely 
have to reject it from the organizational side.

Regards,
Christian.

>   That allows you to skip page
> allocation without fully pinning the memory like you get when
> allocating a dma-buf that's way larger than necessary. If it's for a
> camera maybe you need physically contiguous memory, but it's also
> possible to set that up.
>
> https://android.googlesource.com/kernel/common/+/refs/heads/android14-6.1/drivers/dma-buf/heaps/system_heap.c#377
>
>
>> To be honest, I didn't understand your concern "...how drivers should be
>> able to fulfill this semantics." Can you please help explain it in more
>> detail?
>>
>> Thanks,
>>
>> Rong Qianfeng.
>>
>>>> Thanks
>>>> Rong Qianfeng.

