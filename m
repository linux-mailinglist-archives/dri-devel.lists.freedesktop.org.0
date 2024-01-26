Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF0E83DF0C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 17:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD30910FC3C;
	Fri, 26 Jan 2024 16:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBF410FC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 16:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzzRfYK744XKzUNVxpYr19bI5nWRe3Br4fqGy8lRSENYZPePnWUnqhSyRxmNQTXZNn8LDDBv1600FWzIvTrOcvdRU5LAgv5c3Qat5xo+5f9ZzRKh+G4OOr6oLXsmeb9BaqRIOMqm5GxMWQa1UVb3i+d/1mFM1vR2DK2wEy6oLdSrO/PBbTGJziCZj1U5HnSECl590D8X/gNFl19XdkBA4dNjCQiWpBzA0MLDw7pJaFjj8agV9VuqrRESeE0G7QDGYzzX+Z0hODxI6q7i334oM1dze62vUSAxxz7HDdLiu+jMy85XXPjaRTouqLKVbvYiECqZzSwmkgI/rMS+Kxr+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6ec4zHamQpIBM7N1imFPiLzwpud80ldCLWAFuua6IU=;
 b=DSqZrYZHyNlm/ze6A0g7f34FvOBZM8bUIuwfUJ/YJifnDCC6fcpvzJ5X1t/VY0pXb0OZcXt3ZdL8/uTCuTpahgOBG0sTnqfbdSHARtn9Oam5MeUu/Nmleb/ZCdjJGVIASbROWku5poEzxzeCUNwsSjWHqBbQ9+5XiDHiYSu85eDSQLySejrL4LhXp2ZNsqqNVOtDEeEvPbsL6cQtd5hqUSDS6GBiWyZ/u8mHJj3pESP7IxZ3f0CTqoILtJ16p/N4G1DSgkf3ZDgC8GJHwIAkcuhZMLaUg2CKZ9rxVALtYHhLdx07+pYUrs/kgzwP4HVKCgJA8psTlrlSC/jcfQHXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6ec4zHamQpIBM7N1imFPiLzwpud80ldCLWAFuua6IU=;
 b=D1ofIu/gAxgXii+ovZXTqYVTEllZBT4isQqrr6J1sBqDidapJlzPjR7pF13pAXgEZ9LKBzHrDJztsmWtqjR9039RICePb+ngb4XN+H7M1UbExEinRPuyZqBhj38hTkPIGI4dzt193sIrB0f+ogbIjBNYRSE2BxBRuA5+EL6Q4sg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9432.namprd12.prod.outlook.com (2603:10b6:610:1c7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 16:42:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 16:42:56 +0000
Message-ID: <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
Date: Fri, 26 Jan 2024 17:42:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240119141402.44262-2-paul@crapouillou.net>
 <8035f515-591f-4c87-bf0a-23d5705d9b1c@gmail.com>
 <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
 <0b6b8738-9ea3-44fa-a624-9297bd55778f@amd.com>
 <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
 <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: ebcf1606-27f9-4cd7-e2f5-08dc1e8dd947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qfw7F1J0T0LIJO+Dp53/VpCipKZLXlHLXsNE14JOyz0MZIr/9eg4ANwHWXkQ/YJrO4YBnv8DDI4bMJXsGwewRZQ6y/8FjAtpvouaSe9SayKYxQPaZOYoUwl3umTXo0IjWI8s281WSV3bflpsm8DQAwb+938nnKb+D3JRALHvIaHhxMN6OJk/bEfqT/JIIxUzb9rtJqEtBXu5DLJeuJ5am6kZhjrcy+j6LNY2nEdlUrgE6pzNHFhmk9OW7u+gTPdKHNQ/OZ6k6q0DpRLdeDdsYr0AnIl1O+3T2uSRe6tgJmiYm2lAgt75Jpaek5b15Wa6NcvN+ObSaaW8BAFloe2xvsgy/4DOYkBgU0DvSgaBiijZyuZcISfu5RWQ7a9bICZ8s9KVGoyonxMe34ibMRNZ0eyWjN9L9N+g9XsJStb46TYW3y0NIXvQYddZZCoL14RWJU/siy4yxUTPEaozsneliSvU031+9K1SszmVF4NA1iT6GT7i5Lyh/YID0fyZZztCCLZh7bdc4fnip+4K+c0jj+1hFw00QQTqn48nMW+4gJ5NXEYPPyK1Y7v0k9lL258johDjKhy1/3MZvaiqSD1BRb7nvJqCy8N2BRPUyI6Gj1thJWSMyT1WR8j0mvWRbWfx3fMtftXGBZLU0DuQmVQXWHSCjd5+HcRVgghuo1wVjWg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(38100700002)(110136005)(316002)(66556008)(66946007)(66476007)(86362001)(31696002)(8936002)(6666004)(8676002)(6506007)(6486002)(478600001)(36756003)(2906002)(5660300002)(7416002)(31686004)(2616005)(66574015)(26005)(6512007)(921011)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2xPY0l3WTJRNUFObFVaN3lGUy81cmJudDZveitLM0FJUVFDNjMzWlRsSjVY?=
 =?utf-8?B?Q1lyR2J3eVY4VHpya0lFRUtlTTRheVVmbWpUWWREVmEvRUV0L1k0enZGcS9C?=
 =?utf-8?B?UGIrY3VSUTB2NmN5V0NXV1o0elF1ZGpFbkkvN1RLc1lwV3dzd3JBVEowZEdo?=
 =?utf-8?B?dEF2YU5XQlI0cU8vaC9yMHdSdXlEWkMvQTgvZGxEaVVoTGVFUmJqaWh4VVpH?=
 =?utf-8?B?bUxKV29BQk5UVDc4RThUM0NwKzRKR1cxSitpZ0RySHd4dEtOUWJFRzdsQ1kv?=
 =?utf-8?B?Ry9wSVRGMWRoODRXOWowUGRKYndDT2Z5Smlyc0l1VHdwNlhzSFZyYWtwSGEv?=
 =?utf-8?B?K2hXSDNhTkxPaWN4OG90NkErQkJ0dG1BYmIzTzQ4R1QrcnFiZDNMbmpXeHNH?=
 =?utf-8?B?U0MyWlFlT3FSaFBmRmNJT20wRkFRcmw1TG9lSEJLcThEczJIUGFWWWZKaWls?=
 =?utf-8?B?NjAzUnpTRU5HeDFHOGxrR2haYWFaSE1HQ2xKb1d1NTJWc3kzMm9yVzNWN2g3?=
 =?utf-8?B?NFFEYjEweDNaNEZ4akU1QkpXZW1NRUx5L01TSFMyY0RXNUVETFQ4ZUlSbVho?=
 =?utf-8?B?U3lKbmNXVUt3T3R2UXVNL1lTY3NZQ3FYeUZNYVNGaDM1b2R2WHR1TDgvTHpM?=
 =?utf-8?B?VDBzN3plT1VscFd0SHlKZUhsSmFnK0lwZXlTMmRlYWxLVEdKN2JQVWdsVHVZ?=
 =?utf-8?B?YW5aOXhNVDE2N0hXY3N2c1FnOHZtQzZ0UGtDcTY5SytNYWcvN0NteUhaQzlH?=
 =?utf-8?B?dWVIQjl4bTQveTBjZGVPMUxPelQ3TEg2TDBab1BhZE5oN1lTQkZ4c2RDbjdJ?=
 =?utf-8?B?VDk4aVFhY3FydlFaQU1jeGEwRll4Nm90anJraDBWdCtlT2lxTFk1dE1yYVZ4?=
 =?utf-8?B?cmVqclVyNmJWTWY1L1JXS2FiTDVwRHhwOHJIYkdES0w3Z2dQeUhEamQxQ2Yx?=
 =?utf-8?B?RlBNQUxOVXUyOHlGbjRhRkQ1SFRRRzd6OVYzNXp5WHdPM242eittSW9mTW45?=
 =?utf-8?B?QzRrZzZ5S1JkSkNEWHE4bFlMdHBiTlIzYmdpWHgzbi9uVzJuSnFudXg4aElC?=
 =?utf-8?B?OWpaYXh2cHhPTHczSnJtemliY3MrRm9ISWJockF2dy9tY0hWTFE4bGM3Wnp2?=
 =?utf-8?B?c2g5U0RlUnpCYmtKaG13THdRVjBPeXBLNmJvUmVNS0hqcm9vZXBNMXdPaFN6?=
 =?utf-8?B?VUF6OUFvelNtTDMwUFdObFhsenlVK0I5VFhDdzRrbmI3NFYrdDZWTWVSbnhT?=
 =?utf-8?B?bUZsVkJMSzM0NEEwNld4dUZoeGFPTXpYUFdWTXhYNWNxTlZOTkswTkpvR0FB?=
 =?utf-8?B?bloyZWEzdWh6a2IxRDlHeGxRSVVhTjlPV1hsMzh1U3llWVNiMFBXTHk4K1Fn?=
 =?utf-8?B?QUU2bUNJLzdQVGMwOVZKSzcvTXpzRXg4NVltbTZtUlJFTERaMjBZSHhyUkZI?=
 =?utf-8?B?ZHBzTkNVazdBbVRkU1BzcmRlcmtZZDBqRXEzTXA1SlJ3Q2JnVUtKdEY5VVE5?=
 =?utf-8?B?VVY3UkpFWTdoL2RhOXg3R29CWG1peG1UaFVNMitFVnhkTTRJc0ZmdTAzVE85?=
 =?utf-8?B?bjd3MVE0d2tlZWZtaUh0WnB3ckVPU2xZdkVCd0xhUllyK3V4YUFuME9TSkRE?=
 =?utf-8?B?cGU3dzVHTThJT0huUjIrY094cTArRm5vbWUrcUh6N3hVSjlEbTNnc2R2eEtn?=
 =?utf-8?B?aFhYYkdyLzk4emdlL1RiYXQzRlgzYXRLdUloY0tOcFdsT3ZpYXhpNmxySGZs?=
 =?utf-8?B?U3FLSS9Sby9iTThEMk5TUGlnNnJ5ak42SGJXRGNZVDIwOTRyUVBMTU40TzFZ?=
 =?utf-8?B?cm11Rk5La1FtYS9BbUhhb3AzNkhUQWtHclh3OGlneDFPdlB1cDNRQWVXMGdY?=
 =?utf-8?B?YlphY0ZhTC9VNFBrRGxwRGR6VDk2QVE5KzRpdUZ6V1N4bDdxdGNhRFFxbmt4?=
 =?utf-8?B?NlB0N2JaSjYyV0dDWHJjSmNDWW5xNkttNnlQV2RRb0hmcVpoMno5NFgwVjV5?=
 =?utf-8?B?WTQ4L29lNE5ZZmlmVXNQdktVRFNxeGRFaDIvQWZRSWJGcU4zME5pTFV5ZVUr?=
 =?utf-8?B?YUFWMVBqeHFBTElLRFNCQWJoM3lYUHl1d1VTbFIzUzhzVjdRLzk0RlNCVFlX?=
 =?utf-8?Q?sGOMj/uPFpkCtmveGbN8Ns8od?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcf1606-27f9-4cd7-e2f5-08dc1e8dd947
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 16:42:56.5549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYhCjE2YxPK6McDfnvisimMHqgk48z7jgBUfWmWEz4dqHgBR55mt3pfD5wnSatZa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9432
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

Am 25.01.24 um 19:01 schrieb Daniel Vetter:
> On Thu, Jan 25, 2024 at 04:00:16PM +0100, Christian König wrote:
>> Am 24.01.24 um 11:58 schrieb Paul Cercueil:
>>> [SNIP]
>>>>> The problem was then that dma_buf_unmap_attachment cannot be called
>>>>> before the dma_fence is signaled, and calling it after is already
>>>>> too
>>>>> late (because the fence would be signaled before the data is
>>>>> sync'd).
>>>>    Well what sync are you talking about? CPU sync? In DMA-buf that is
>>>> handled differently.
>>>>    For importers it's mandatory that they can be coherent with the
>>>> exporter. That usually means they can snoop the CPU cache if the
>>>> exporter can snoop the CPU cache.
>>> I seem to have such a system where one device can snoop the CPU cache
>>> and the other cannot. Therefore if I want to support it properly, I do
>>> need cache flush/sync. I don't actually try to access the data using
>>> the CPU (and when I do, I call the sync start/end ioctls).
>> Usually that isn't a problem as long as you don't access the data with the
>> CPU.
>>
>> [SNIP]
>>
>>>>> (and I *think* there is a way to force coherency in the
>>>>> Ultrascale's
>>>>> interconnect - we're investigating it)
>>>>    What you can do is that instead of using udmabuf or dma-heaps is
>>>> that the device which can't provide coherency act as exporters of the
>>>> buffers.
>>>>    The exporter is allowed to call sync_for_cpu/sync_for_device on it's
>>>> own buffers and also gets begin/end CPU access notfications. So you
>>>> can then handle coherency between the exporter and the CPU.
>>> But again that would only work if the importers would call
>>> begin_cpu_access() / end_cpu_access(), which they don't, because they
>>> don't actually access the data using the CPU.
>> Wow, that is a completely new use case then.
>>
>> Neither DMA-buf nor the DMA subsystem in Linux actually supports this as far
>> as I can see.
>>
>>> Unless you mean that the exporter can call sync_for_cpu/sync_for_device
>>> before/after every single DMA transfer so that the data appears
>>> coherent to the importers, without them having to call
>>> begin_cpu_access() / end_cpu_access().
>> Yeah, I mean the importers don't have to call begin_cpu_access() /
>> end_cpu_access() if they don't do CPU access :)
>>
>> What you can still do as exporter is to call sync_for_device() and
>> sync_for_cpu() before and after each operation on your non-coherent device.
>> Paired with the fence signaling that should still work fine then.
>>
>> But taking a step back, this use case is not something even the low level
>> DMA subsystem supports. That sync_for_cpu() does the right thing is
>> coincident and not proper engineering.
>>
>> What you need is a sync_device_to_device() which does the appropriate
>> actions depending on which devices are involved.
>>
>>> In which case - this would still demultiply the complexity; my USB-
>>> functionfs interface here (and IIO interface in the separate patchset)
>>> are not device-specific, so I'd rather keep them importers.
>>>>    If you really don't have coherency between devices then that would
>>>> be a really new use case and we would need much more agreement on how
>>>> to do this.
>>> [snip]
>>>
>>> Agreed. Desiging a good generic solution would be better.
>>>
>>> With that said...
>>>
>>> Let's keep it out of this USB-functionfs interface for now. The
>>> interface does work perfectly fine on platforms that don't have
>>> coherency problems. The coherency issue in itself really is a
>>> tangential issue.
>> Yeah, completely agree.
>>
>>> So I will send a v6 where I don't try to force the cache coherency -
>>> and instead assume that the attached devices are coherent between
>>> themselves.
>>>
>>> But it would be even better to have a way to detect non-coherency and
>>> return an error on attach.
>> Take a look into the DMA subsystem. I'm pretty sure we already have
>> something like this in there.
>>
>> If nothing else helps you could take a look if the coherent memory access
>> mask is non zero or something like that.
> Jumping in way late and apolgies to everyone since yes I indeed suggested
> this entire mess to Paul in some private thread.
>
> And worse, I think we need it, it's just that we got away without it thus
> far.
>
> So way back at the og dma-buf kick-off dma coherency was discussed, and a
> few things where noted:
> - the dma api only supports device<->cpu coherency
> - getting the full coherency model off the ground right away is probably
>    too hard, so we made the decision that where it matters, relevant
>    flushing needs to be done in dma_buf_map/unmap.
>
> If you look at the earliest patches for dma-buf we had pretty clear
> language that all dma-operations should be bracketed with map/unmap. Of
> course that didn't work out for drm at all, and we had to first get
> dma_resv_lock and dma_fence landed and then your dynamic exporter/importer
> support in just to get the buffer migration functionality working, which
> was only one of the things discussed that braketing everything with
> map/unmap was supposed to take care of.
>
> The other was coherency management. But looking through archives I think
> this was already agreed to be postponed for later in the original kick-off
> meeting and never further discussed on the mailing list.
>
> This worked for a fairly long time, because thus far dma-buf was used on
> fairly reaasonable architectures where all participating devices are
> coherent enough.
>
> We did have to add the cpu access flushing fairly quickly because there's
> a lot of SoC chips (including intel) where that was necessary, but even
> that was added later on, as an opt-in and without fixing every. See
> fc13020e086b ("dma-buf: add support for kernel cpu access").
>
> The ioctl to allow userspace to do flushing was added even later on, and
> there the entire yolo opt-in situation is even worse. c11e391da2a8
> ("dma-buf: Add ioctls to allow userspace to flush") was only in 2016, 5
> years after dma-buf landed.
>
> It looks like it's finally time to add the device side flushing functions
> we've talked about first over 12 years ago :-)
>
> The reason this pops up now is that unlike other dma-buf users on maybe
> somewhat more funky architectures, Paul's patches want to use dma_fence
> for synchronization of the dma operations. Which means you cannot call the
> full dma_buf_map/unmap dance because that takes dma_resv_lock, and
> absolute no-go in a dma_fence critical path.
>
> And yes in those 12 years the dma-api hasn't gained the device2device sync
> support we'd need, but neither has it gained the multiple devices <-> cpu
> sync support we'd strictly need for dma-buf. So yes this is all a terrible
> hodge-podge of hacks, but if we'd require theoretically perfect code we'd
> still have zero dma-buf support in upstream.
>
> This also includes how we landed these extensions, none of them in the
> past have landed with a "update all existing exporters/importers" rule. We
> talked about that every time, and rejected it every time for imo pretty
> good reasons - the perf impact tends to be way too harsh if you impose
> over-flushing on everyone, including the reasonable platforms. And we
> currently can't do less than overflushing with the current dma-api
> interfaces because we dont have the specific flush functions we'd need. So
> really this isn't doing a worse abuse of the dma-api than what we have.
> It's definitely a bit wasteful since the functions we use do in theory
> flush too much. But in practice on the these funky architectures they
> flush enough.
>
> There's also the very hard issue of actually trying to optimize flushes,
> because a dma operation might only access part of a buffer, and you might
> interleave read/write access by different devices in very innovative ways.
> So I'm firmly on the "make it work first, then fast" side of things.
>
> So dma-buf will continue to be a thing that's tested for specific combos,
> and then we'll patch them. It's a decade-plus tradition at this point.
>
> Which is all a very long winded way of saying that yes, I think we need
> this, and we needed this 12 years ago already if we'd have aimed for
> perfect.
>
> I have a bunch of detail comments on the patch itself, but I guess we
> first need to find consensus on whether it's a good idea in the first
> place.

Well I think we should have some solution, but I'm not sure if it should 
be part of DMA-buf.

Essentially a DMA-buf exports the buffers as he uses it and the importer 
(or the DMA-buf subsystem) is then the one who says ok I can use this or 
I can't use this or I need to call extra functions to use this or whatever.

It's not the job of the exporter to provide the coherency for the 
importer, cause otherwise we would have a lot of code in the exporter 
which can only be tested when you have the right importer around. And I 
strongly think that this is a no-go for having a reliable solution.

That's why I think the approach of having DMA-buf callbacks is most 
likely the wrong thing to do.

What should happen instead is that the DMA subsystem provides 
functionality which to devices which don't support coherency through 
it's connection to say I want to access this data, please make sure to 
flush the appropriate catches. But that's just a very very rough design 
idea.

This will become more with CXL at the horizon I think.

Regards,
Christian.

>
> Cheers, Sima

