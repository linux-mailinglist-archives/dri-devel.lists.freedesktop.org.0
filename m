Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4127C43B093
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 12:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6918915A;
	Tue, 26 Oct 2021 10:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0877989061;
 Tue, 26 Oct 2021 10:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qe7ZFfOx29m0rg3d9iWIY5yZ0G5Y80Vg/9iy1jxdglhBYfvIj2BHEgiju7bf/MVaWOcVIsIXNaJ1R4hFupBQG8dKTYDCHSvoFwVWiuxPsPVb9OHMnQ/NEH4+CGpzdebvelSOFqpdd7vDXVqlk7if90HajvMpG/Df8LSJ0f7aMOK5DFwLlnCw8IMEjdwWfbaoBlKiZuHzG0C2XShnzsVqy/2nz7Bpu5CDWSkY/J0jndyG2HNAF11lgJVdareWwTR5Ck1oKTozmCl7u4krcSNxjcmiGVDYrniZDSLT8qD4UGQQuwul6ZR6cq33alOYXtB9GYYTCc2dPCWSKznkfB33XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myUQU1eNrgU9mUyJj9bz5U5DkncXNQ535mMK4ADuw6Y=;
 b=f3ffRVm9R3lTSmLTnarT7uw7jq15JYhbMLDYyVK3EMTu3p0pOwF4xDPA5juzf4My3RNuVnmRaQULlKrkTaJ5liUXQWo9BImsWgFAXuuCJF6rlnzekHhSB1nK6X1HXZkDNnFGS46dpkxZ8lFYslzOxyYm1HQYJGMfYd4ZTMbP5G/Qqr9W2D8xkAZy/O2gJu/PrGuwQ43z/ulLHQfRd1D0GOiD+z7g+w3ELnKRthmh9xiXQ3uUS0wRXeSV8HRq9RKJBwV4vM/CwaLbbARIHY6H6I1vYwWefUs1nz7TuOOchzICm6gIrm31tDeMjE1pmb9ApUr3mJ0bSiYLP4FU2QocDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myUQU1eNrgU9mUyJj9bz5U5DkncXNQ535mMK4ADuw6Y=;
 b=KeyjdrlvgLc+3UD50SFzqUILGQ8of53g4zIGxrV3bun/iLQpksPblr5BRS4RQ19B9iEvBcqcn9k+5cHIKr9HiBl57ErZ/oE9LMJDNFCFKxrvxO1lZEaVsKJMn8WnizgHgLlu6riMISzyUL0IIr/ItVZSDjCtE3wfBIGkpNVcdKQ=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4570.namprd12.prod.outlook.com
 (2603:10b6:303:5f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 10:55:02 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4628.020; Tue, 26 Oct
 2021 10:55:02 +0000
Subject: Re: Lockdep spalt on killing a processes
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, chris@chris-wilson.co.uk,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
 <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
 <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
 <2639d027-b6c8-ee09-5e9a-564308949c53@amd.com>
 <cbeac930-84c3-7a62-0b3d-4cef3074139d@gmail.com>
 <da1ed5da-59ad-d12a-906c-c84b7462d8c4@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bb70e916-e71b-9968-78d9-d7de8fef9e91@amd.com>
Date: Tue, 26 Oct 2021 12:54:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <da1ed5da-59ad-d12a-906c-c84b7462d8c4@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:206:1::30) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:4969:85a5:71fe:e4fa]
 (2a02:908:1252:fb60:4969:85a5:71fe:e4fa) by
 AM5PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:206:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 10:55:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 606c7e69-338f-43b9-42fc-08d9986f0fa9
X-MS-TrafficTypeDiagnostic: MW3PR12MB4570:
X-Microsoft-Antispam-PRVS: <MW3PR12MB45709B4B10EDD19B286F494583849@MW3PR12MB4570.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QgLPmhK1Om2Edbc1SNo2Ef67mKZOe3pRT4sB7wUE+KZ1b5zWgsubPyZYBTLiSUHUNeDWDBJjioUChw/yYAyIow4Oq7fqMKRigJted3+XeTBBP4QX+2jih1QlEf1lwi4QKdwG69zQtMts+p4VQFwIzMaSKzmqWnkd0DAOxD1ze8IkNGVUUfXvltg6030Em7m0fB7Axj9kzoBcZr5ONcT+uqW9KzNDwqad8hXr3X7C71E53ltmM/roeKTQftUP6uwcPcytKBRznW9oVrwvK/+sQ+cxUoPaNe63C/NqQM0K3tVdSP5UXAMuRLwESz9iYcskkmgjHhiV7pB2tjOCSu/R4GcmDkmwHXGuiDEoFzFJMmbZbO1jnzHmyX1rLnF75vJiMeY/06t1fTe3uLhdSEOnINLXQAHy9rVguM3vVZB2OGcRnONtdgYaAhCShzkJYu1Ok3dFunGf8WmdRSg5MNYihwSm5QaK5X84mD2CXEGYoeWu2APva732i83pTEYeKYZJXE5EdU2nvUQAPRvgXw4ztDSiju9UiO445c6q0X+gOO1Z0NDos4np5FlC2iyuWk6/YXlk28LqgxjlBcjEXadTOIWtcm9isMgUtLikktROTxOa+E67g9dJonKqvuO5plA/1hwtTiJCoZqnKvs3y0TXGx2M5iA6bZ9AGHfbolusDgvFl9f2J96J9R+I86tM9xKodz91jLzmBH3b5U1UXc3nYleXY2hD1x+X//XSIryiOpq4CCSRJPrYn0TgLR/xH+orCeRZfFJfsNVtjLUmNwhsKKzPrUVm7DnU2ZDNI9PgsV/XQ5nMZx/uCT/IafZzaJnhPSpBLTxv2L9ZdXazkpWSJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(83380400001)(316002)(8676002)(6486002)(30864003)(508600001)(5660300002)(2906002)(66556008)(186003)(8936002)(4001150100001)(66574015)(86362001)(38100700002)(110136005)(53546011)(36756003)(45080400002)(6666004)(966005)(31686004)(31696002)(2616005)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3JhVitmdStiSzVHZHhOK0dHWWRHNEhVZVpaNlphdVdTd2N5Qld6OEpIc2tV?=
 =?utf-8?B?R1M1VzFVdnlVZWNHaTBmdFg5R2w3b2QrYjVDQWFDL1Evc0NKbUFGUjdGRnBS?=
 =?utf-8?B?SG56c2ZFbFFhTHJGNnlxSGRxNS9ST3pzaHBFdDFrTmpUQUQ4UDMvVExlUjNw?=
 =?utf-8?B?VS9XUnZ5TFJuSmgySGo2SFBXWDNxSjY2bmZabkFtaFBpRlFvR3JyYi8vZk9D?=
 =?utf-8?B?Sm0ySDZNc010eTNqcjcwbTkza05PSWRxb1RyM0VNL04va1ByMXJlNHRnMzNN?=
 =?utf-8?B?dUE3QTZiK2I0RWZQZFcvYit2MUNsaFRFOVVPRitGbGh1bUc5UDZBbmhoMUJB?=
 =?utf-8?B?KzUxQ2FUOVdCWE0xMllRdlpDWUhueitpZ0tHeE92OTZuZ2M4blJpQ1VUR1Nw?=
 =?utf-8?B?blp2V1NpMEdjYktMRE5ycTlhVTJGYWhicTFKSktlWXh5Y2Rqa2hIU3dyTzZv?=
 =?utf-8?B?TFRnU3d4MzlZQUxiREwvMWx3eS91dFZ2bTV4RVpuaFFFV01yOFR4QXVNSlc2?=
 =?utf-8?B?VnJUOVJhSC9sUkl3TjAwZnZyT3VlTWJST05IdVh2U1RZNVE5azBPUHp4aTMr?=
 =?utf-8?B?T3FGNWo5cXVrd2J2QVlaak9BZTloUUZMK1NEb1VkUndWUmpHWUo1NUdybnlr?=
 =?utf-8?B?dFpITHo2SlZxbVlzVUVPdG5mcEMxbzY1T0RTa0g1c1FUQXE4SWRqOHNycVFp?=
 =?utf-8?B?cm0zdjBKV3pEaFdqNkhCTTZ6Mm9Yay8wK0VGYmdzWHI4aGxIcUFCVzN6TCtw?=
 =?utf-8?B?UlB0ZUlJb050dnhwYUw3cFU3VmdjMVBhcndJNk5XSnB6VmtOanl4VHR3Q2JP?=
 =?utf-8?B?V1NLT1k0TW12dmJNdm5ENVZUY05paTVoUWNocGI0d2hsQmNoS01XUGhDYXdX?=
 =?utf-8?B?YmdmZkEvR2YxZEhubG95ZTgrWWxSMXozRDFZM1Y3WHptL3RrUGJ0aEpjbEpv?=
 =?utf-8?B?bTQ3L3VmRUk0WGJJYkFOditYWHRzazRpVkJqeWFUNWR2WW9tTWtZMDJidnha?=
 =?utf-8?B?MWZhVW4xdm42aFFhMlAzc3FPWERjUDZBKzdsN05taThsdjNpSFRsaDZYTGhy?=
 =?utf-8?B?N2pyWWZ5UkdMMnVPdWRJUDArU21wWjl3bjhaNG1ZR2h0RWU1RWpjbU1JZE1E?=
 =?utf-8?B?VmlLOXQ3TjRPdnkrQVBUNUlHUUlSaDdKdVBRYk0xWjFEUHBZSzNGSHNFLzJE?=
 =?utf-8?B?L0tjQzdKbkZuS0RmTHNrMkdaVkh6MVBxUnRxcEtkNjFKZExyOXRGU1NZcHlT?=
 =?utf-8?B?YjZVWFRFTHFKd0Y5c1FjL21vQXRNL1ZBeEpzWGRyeWNFR0F3U2Z4bmFOczhR?=
 =?utf-8?B?T1QwMTlya1R4cHJ6T1cvNnhONWJlM1RkSFRRVzhCTWJHTXJ0R05RcFVtS2pR?=
 =?utf-8?B?M0JvMWFaczhiMHZpK2YybVJiSEFTRGsvaTI4cEhvQlQwaTBUaWd4ajdoOEFo?=
 =?utf-8?B?akFCWUMrWGV6Z1RIUjdVVWlTeWFIaE5MRndQNVdmc3hPWTM0a3VHMTk1VjYr?=
 =?utf-8?B?SmJqRU9KbERTSmdXNzBqQ2Y4OU9PNDl1SUpwNTFDSFFSQWdOWXhTUWttQ080?=
 =?utf-8?B?RnByWWdyVmt5V3huaUZkSEZ0eVlybDlZb1FJR2tJb2I3U1IvN0E0ZHYrOCtV?=
 =?utf-8?B?czlBVURPSUZiK3poV2N3MUtrOUQ5emxFVkpTVmd5czdFNEFnd251NldKYmhL?=
 =?utf-8?B?MWM3TXVmRGdtalArWm5UTStDd1hmSUJ0T1pRenY0VFF6WXB4alBLbG9IcDJa?=
 =?utf-8?B?RVhOSGFCNmhGRGgzWnNrc2Z2b2xGYnJPaUhCUU03OTVSQ0V2RS9FMGtsQmxS?=
 =?utf-8?B?eHEvcWgwa3h4OTFISzNaTGU5Rm1TZGc3VlFwdnBpMk8xeGppdTE3eWQ1WnZn?=
 =?utf-8?B?K1hnd1JQa1dscUFJZGZlbGo1ZlpXNzEwVmQxSkJPNy94M3FoTDM1c1d5NWR6?=
 =?utf-8?B?V1ZWcFRtRjFnQVFmK1JNRk9qVkdTTExMaXoyRERHaDlBYkU3TERkL2xtZnQy?=
 =?utf-8?B?WTMvRnFtWmpkZ2NES3RPVGd4bEFvMDhkaWsyVDB5REY5RjJHTis4NVF1bk5y?=
 =?utf-8?B?RkRITlFQTVRUOVNRK3U5V1B1d21udTMzV3NYcUNGa1gyRTNRWmx4bmR2a0pW?=
 =?utf-8?B?YXRZWTYzWlRlaGhqN0I2Q1BqNUNLT0huYkFuWis4WkpYUWQrL2NUNkpEL0Y1?=
 =?utf-8?Q?8IZ/TDrDhRx3nwOCzjKnwkc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606c7e69-338f-43b9-42fc-08d9986f0fa9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 10:55:02.4777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr3E3VzWDJVlcmuBpRGqzKI+Rgy0tN1ZODL44ZZaBGKIe9gke7iq7J26UuPRKt3L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570
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

Am 26.10.21 um 04:33 schrieb Andrey Grodzovsky:
> On 2021-10-25 3:56 p.m., Christian König wrote:
>
>> In general I'm all there to get this fixed, but there is one major 
>> problem: Drivers don't expect the lock to be dropped.
>
>
> I am probably missing something but in my approach we only modify the 
> code for those clients that call dma_fence_signal,
> not dma_fence_signal_locked. In those cases the drivers are agnostic 
> to lock behavior (or should be at least) since the lock
> is acquired within the dma fence code. Note that if you are worried 
> about calling the callback without lock then same exact
> concern is relevant to using the irq_work directly in the fence code 
> since the irq_work will execute at a later time without locked
> fence->lock (which is the point of using irq_work).

Yeah, I've seen that it just doesn't make much sense to me.

>>
>> What we could do is to change all drivers so they call always call 
>> the dma_fence_signal functions and drop the _locked variants. This 
>> way we could move calling the callback out of the spinlock.
>>
>> But that requires audit of all drivers, so quite a lot of work to do.
>
>
> As i said earlier - if we only modify dma_fence_signal and don't touch 
> dma_fence_signal_locked then our only concern should the users of 
> dma_fence_signal.

Yes, but what do you do with the drivers who call the _locked variant?

> Let me please know if I am still missing some point of yours.

Well, I mean we need to be able to handle this for all drivers.

Regards,
Christian.

>
> Andrey
>
>
>>
>> Regards,
>> Christian.
>>
>> Am 25.10.21 um 21:10 schrieb Andrey Grodzovsky:
>>> Adding back Daniel (somehow he got off the addresses list) and Chris 
>>> who worked a lot in this area.
>>>
>>> On 2021-10-21 2:34 a.m., Christian König wrote:
>>>>
>>>>
>>>> Am 20.10.21 um 21:32 schrieb Andrey Grodzovsky:
>>>>> On 2021-10-04 4:14 a.m., Christian König wrote:
>>>>>
>>>>>> The problem is a bit different.
>>>>>>
>>>>>> The callback is on the dependent fence, while we need to signal 
>>>>>> the scheduler fence.
>>>>>>
>>>>>> Daniel is right that this needs an irq_work struct to handle this 
>>>>>> properly.
>>>>>>
>>>>>> Christian.
>>>>>
>>>>>
>>>>> So we had some discussions with Christian regarding irq_work and 
>>>>> agreed I should look into doing it but stepping back for a sec -
>>>>>
>>>>> Why we insist on calling the dma_fence_cb  with fence->lock locked 
>>>>> ? Is it because of dma_fence_add_callback ?
>>>>> Because we first test for DMA_FENCE_FLAG_SIGNALED_BIT and only 
>>>>> after that lock the fence->lock ? If so, can't we
>>>>> move DMA_FENCE_FLAG_SIGNALED_BIT  check inside the locked section 
>>>>> ? Because if in theory
>>>>> we could call the cb with unlocked fence->lock (i.e. this kind of 
>>>>> iteration 
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.15-rc6%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fttm%2Fttm_resource.c%23L117&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cc8a4525f94c244bebbd208d997f19242%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637707886075917091%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=YBq%2BNkDuYKERc8XJDWTfeM%2FSknpuCBHQYgN8Uo5PFv0%3D&amp;reserved=0)
>>>>> we wouldn't have the lockdep splat. And in general, is it really
>>>>> the correct approach to call a third party code from a call back 
>>>>> with locked spinlock ? We don't know what the cb does inside
>>>>> and I don't see any explicit restrictions in documentation of 
>>>>> dma_fence_func_t what can and cannot be done there.
>>>>
>>>> Yeah, that's exactly what I meant with using the irq_work directly 
>>>> in the fence code.
>>>
>>>
>>> My idea is not to use irq work at all but instead to implement 
>>> unlocked dma_fence cb execution using iteration
>>> which drops the spinlock each time next cb is executed and acquiring 
>>> it again after (until cb_list is empy).
>>>
>>>
>>>>
>>>>
>>>> The problem is dma_fence_signal_locked() which is used by quite a 
>>>> number of drivers to signal the fence while holding the lock.
>>>
>>>
>>> For this I think we should not reuse dma_fence_signal_locked inside 
>>> dma_fence_signal and instead implement it using the
>>> unlocked iteration I mentioned above. I looked a bit in the code and 
>>> the history and I see that until some time ago
>>> (this commit by Chris 0fc89b6802ba1fcc561b0c906e0cefd384e3b2e5), 
>>> indeed dma_fence_signal was doing it's own, locked iteration
>>> and wasn't reusing dma_fence_signal_locked. This way whoever relies 
>>> on the dma_fence_signal_locked won't be impacted
>>> an who is not (like us in 
>>> drm_sched_fence_scheduled/drm_sched_fence_finished) should also not 
>>> be impacted by more narrow
>>> scope of the lock. I also looked at dma_fence_default_wait and how 
>>> it locks the fence->lock and check if fence is signaled
>>> before wait start and I don't see a problem there either.
>>>
>>> I attached quick draft of this proposal to clarify.
>>>
>>> Andrey
>>>
>>>
>>>>
>>>> Otherwise we could indeed simplify the fence handling a lot.
>>>>
>>>> Christian.
>>>>
>>>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>>
>>>>>> Am 01.10.21 um 17:10 schrieb Andrey Grodzovsky:
>>>>>>> From what I see here you supposed to have actual deadlock and 
>>>>>>> not only warning, sched_fence->finished is  first signaled from 
>>>>>>> within
>>>>>>> hw fence done callback (drm_sched_job_done_cb) but then again 
>>>>>>> from within it's own callback (drm_sched_entity_kill_jobs_cb) 
>>>>>>> and so
>>>>>>> looks like same fence  object is recursively signaled twice. 
>>>>>>> This leads to attempt to lock fence->lock second time while it's 
>>>>>>> already
>>>>>>> locked. I don't see a need to call drm_sched_fence_finished from 
>>>>>>> within drm_sched_entity_kill_jobs_cb as this callback already 
>>>>>>> registered
>>>>>>> on sched_fence->finished fence (entity->last_scheduled == 
>>>>>>> s_fence->finished) and hence the signaling already took place.
>>>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>> On 2021-10-01 6:50 a.m., Christian König wrote:
>>>>>>>> Hey, Andrey.
>>>>>>>>
>>>>>>>> while investigating some memory management problems I've got 
>>>>>>>> the logdep splat below.
>>>>>>>>
>>>>>>>> Looks like something is wrong with 
>>>>>>>> drm_sched_entity_kill_jobs_cb(), can you investigate?
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>> [11176.741052] ============================================
>>>>>>>> [11176.741056] WARNING: possible recursive locking detected
>>>>>>>> [11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
>>>>>>>> [11176.741066] --------------------------------------------
>>>>>>>> [11176.741070] swapper/12/0 is trying to acquire lock:
>>>>>>>> [11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, at: 
>>>>>>>> dma_fence_signal+0x28/0x80
>>>>>>>> [11176.741088]
>>>>>>>>                but task is already holding lock:
>>>>>>>> [11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
>>>>>>>> dma_fence_signal+0x28/0x80
>>>>>>>> [11176.741100]
>>>>>>>>                other info that might help us debug this:
>>>>>>>> [11176.741104]  Possible unsafe locking scenario:
>>>>>>>>
>>>>>>>> [11176.741108]        CPU0
>>>>>>>> [11176.741110]        ----
>>>>>>>> [11176.741113]   lock(&fence->lock);
>>>>>>>> [11176.741118]   lock(&fence->lock);
>>>>>>>> [11176.741122]
>>>>>>>>                 *** DEADLOCK ***
>>>>>>>>
>>>>>>>> [11176.741125]  May be due to missing lock nesting notation
>>>>>>>>
>>>>>>>> [11176.741128] 2 locks held by swapper/12/0:
>>>>>>>> [11176.741133]  #0: ffff9c339c30f768 
>>>>>>>> (&ring->fence_drv.lock){-.-.}-{3:3}, at: 
>>>>>>>> dma_fence_signal+0x28/0x80
>>>>>>>> [11176.741142]  #1: ffff9c337ed172a8 
>>>>>>>> (&fence->lock){-.-.}-{3:3}, at: dma_fence_signal+0x28/0x80
>>>>>>>> [11176.741151]
>>>>>>>>                stack backtrace:
>>>>>>>> [11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 
>>>>>>>> 5.15.0-rc1-00031-g9d546d600800 #171
>>>>>>>> [11176.741160] Hardware name: System manufacturer System 
>>>>>>>> Product Name/PRIME X399-A, BIOS 0808 10/12/2018
>>>>>>>> [11176.741165] Call Trace:
>>>>>>>> [11176.741169]  <IRQ>
>>>>>>>> [11176.741173]  dump_stack_lvl+0x5b/0x74
>>>>>>>> [11176.741181]  dump_stack+0x10/0x12
>>>>>>>> [11176.741186]  __lock_acquire.cold+0x208/0x2df
>>>>>>>> [11176.741197]  lock_acquire+0xc6/0x2d0
>>>>>>>> [11176.741204]  ? dma_fence_signal+0x28/0x80
>>>>>>>> [11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
>>>>>>>> [11176.741219]  ? dma_fence_signal+0x28/0x80
>>>>>>>> [11176.741225]  dma_fence_signal+0x28/0x80
>>>>>>>> [11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>>>>>> [11176.741240] drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
>>>>>>>> [11176.741248] dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>>>>>> [11176.741254]  dma_fence_signal+0x3b/0x80
>>>>>>>> [11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>>>>>> [11176.741268]  drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
>>>>>>>> [11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>>>>>>>> [11176.741284] dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>>>>>> [11176.741290]  dma_fence_signal+0x3b/0x80
>>>>>>>> [11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
>>>>>>>> [11176.741504]  sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
>>>>>>>> [11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
>>>>>>>> [11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
>>>>>>>> [11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
>>>>>>>> [11176.742393]  __handle_irq_event_percpu+0x4f/0x2c0
>>>>>>>> [11176.742402]  handle_irq_event_percpu+0x33/0x80
>>>>>>>> [11176.742408]  handle_irq_event+0x39/0x60
>>>>>>>> [11176.742414]  handle_edge_irq+0x93/0x1d0
>>>>>>>> [11176.742419]  __common_interrupt+0x50/0xe0
>>>>>>>> [11176.742426]  common_interrupt+0x80/0x90
>>>>>>>> [11176.742431]  </IRQ>
>>>>>>>> [11176.742436]  asm_common_interrupt+0x1e/0x40
>>>>>>>> [11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
>>>>>>>> [11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 
>>>>>>>> ff e8 37 5d 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff 
>>>>>>>> fb 66 0f 1f 44 00 00 <45> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 
>>>>>>>> 2b 75 c8 48 8d 14 40 48 8d
>>>>>>>> [11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
>>>>>>>> [11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 RCX: 
>>>>>>>> 0000000000000000
>>>>>>>> [11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
>>>>>>>> ffffffff9efeed78
>>>>>>>> [11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 R09: 
>>>>>>>> 0000000000000001
>>>>>>>> [11176.742473] R10: 0000000000000001 R11: 0000000000000001 R12: 
>>>>>>>> ffff9c3350b0e800
>>>>>>>> [11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 R15: 
>>>>>>>> 0000000000000002
>>>>>>>> [11176.742483]  ? cpuidle_enter_state+0xf8/0x470
>>>>>>>> [11176.742489]  ? cpuidle_enter_state+0xf8/0x470
>>>>>>>> [11176.742495]  cpuidle_enter+0x2e/0x40
>>>>>>>> [11176.742500]  call_cpuidle+0x23/0x40
>>>>>>>> [11176.742506]  do_idle+0x201/0x280
>>>>>>>> [11176.742512]  cpu_startup_entry+0x20/0x30
>>>>>>>> [11176.742517]  start_secondary+0x11f/0x160
>>>>>>>> [11176.742523] secondary_startup_64_no_verify+0xb0/0xbb
>>>>>>>>
>>>>>>
>>>>
>>

