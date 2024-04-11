Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB07B8A0B08
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 10:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE2010F48A;
	Thu, 11 Apr 2024 08:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="YLVJghjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2041.outbound.protection.outlook.com [40.107.215.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035E510F48A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 08:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFLY4IMkRyIU1B7Xsb1Bh4T6ReeLXtf7HEY0u+K823k/l+ALlKsFii3ytVskQwFh9oYU2R6fGMITkp4SmbEtAxo6gpTxQwxLV/kx79jfrRSW+twR5G5QyzWzrbcr8y5qbM2EpkKuaYeEx2fI/Rasw+i3vnLgIs4ltYSRo/6etSgQH9EgwewaXRI7WrULkN4tbaMl95cRyl5X7bn/MBI1SEVK2hJIZkmhguauAdQUMNkvWWGQMYOas3qCUFkuhcCOHd0OFv7IIlesJJAVCjJ2txTIKuIM8Gz3LiJJUS1PVogyYzzEcC+AJYydb8VYz8GeypahvMy8Y8o5a4tccfA6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hPcPS95zttMrz0qxfz2tjAHVxiJ4U3XtIdvYHu9DLI=;
 b=CiznLYhQOv9NUV/3TszJGSk/5UcZE/3W5gw6Z3L7w9HMmk/Y8/RRpYU8o0+H6phob+fauS0fffAoYQn6luBTFLVt4ZmOBHHBzmeaXd6psrYNspNlAHZ8/i9DT38qmBFjpMwRW1EijU9TAndJ9wO9ldZLB+gQN2JOvEDsW6IgLpD3qAof3YPU/IGJa4YsAb+J1FDFcLJCjZ8zFxQGuTWNLRIMXll7/IHCjodr1oHWGNuio73TTDywVgQtUysY6BBN5Mkw9PDwi3lb9wpE6mvzfSuL3aa9IGghRno0bU03F4y6ROknfGvYpTssi5ITNrwZzRk0r9TqSzpZf8qZMxm51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hPcPS95zttMrz0qxfz2tjAHVxiJ4U3XtIdvYHu9DLI=;
 b=YLVJghjWvj8T9izYxqqwWpe37h781/1xGrIykOtxaiJgVWUevcdPCbPMgAfWaqYbi4Hvldy9ZBvEQawYCogTGEdvm67hg5tkrDCTpDZhgJD4msyO2zsWLeV4rOQ/Q8PdnJ7S6d3CkNWSGxqaAW3ZX+SrVrmM+lwTW82C3wN9u688s/TwcrWSZSiX//WUy83okfnijLfYR/tbql1u/UKRACEzuko/Zki39vFhh2ZKzIGG+ncA5WyAp75kFNf3Y3zn3BDuedO/FM4Wf/8gBQcQQ4T5Z1yeP77//DbNX+vTzy/MZAGnBhjdKoz4CuvvNg/XvEdUsnSBdfFY0szPYQrG9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB5790.apcprd06.prod.outlook.com (2603:1096:101:b9::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.54; Thu, 11 Apr 2024 08:21:40 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1%3]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 08:21:39 +0000
Message-ID: <da21fe55-2ffb-4c8e-9863-2f27aa18cf5c@vivo.com>
Date: Thu, 11 Apr 2024 16:21:37 +0800
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
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <CABdmKX1OZ9yT3YQA9e7JzKND9wfiL-hnf87Q6v9pwtnAeLHrdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEYPR06MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f537aa-b87f-4435-924d-08dc5a006980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ybecs4ZzUde41V0oN5ffbAyMWIO80R55gIjIYH9v8xWkJjjFnlalT+is9pyQRK685WrVDM5iteI4HKjOZuluIozu1ejDhSx5I6emLClGvGo09y38JawQMZZGWCGb3whfGA5FjGI2fgrebGRDqspD1YivSFzAKsro5cEYAJlG4flkjrMcs6A+muHuTsZDriETac58d5dnYSddO7JT0q8CY93dS3H5yfF3eoXVqPMUxzJvCNwIhj8BdUWkzFXB3mmRZQ1zpmlMD7JqSPnb15hATtlITGwV9NlL6AndpGlhecu64dwY6cB/OBfVoOsi17cSu77xsmo7Dsdh4Il6ediGQ17Xgv5hKGNvGtXri1QK6+NoFLQUlBocXe/G0OPvSBzTYRl+4Rc3yEqnnxdMSo+Qhwv3NtqGl9NHoSdSzWyBFGGLU7wKh9s4hBH+uRCqYU0hTSnCbjjjspicMCcv1L696P2fAX0ytDgAQW+Y5OKhV5OicNfq1/FSnfofifPiVqOgyMHPjptV+eLHXBoCZHzt6L1u/TXTgMYQ4KCYumwQ/5sHp04BbVq9JultB95P9xUF4kS9x3px5FsOsSdYOLskRLiATq7NVudfZxpSv0EjYBy7EMIiyI2kkZdjofsglMd3iAVcRCts/HItn9cuA8YJTak0nLVOOMNTQyKuYg1nCOisDtzxfbmuIKfUdXzYXgq4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(376005)(52116005)(1800799015)(38350700005)(81742002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2dRdWpCbktTSXdDb1pFUFlsa1dybnZZeThCQk1ZeEdaNlgvYVBGb3B0WDRp?=
 =?utf-8?B?anR1QmtHQTBYNVhWUndMRTFnaUVrNWlCZWNKVWpHNmNMa0hDODhHeVEwUUdQ?=
 =?utf-8?B?L05nNFNaVDVOMTRLNUExZ21ndlR0OGdxajlRY3BWcE1SeERPTmtUSjR2aFpx?=
 =?utf-8?B?S1VoVFZlRUx2aVhvNTBYU3lhVWkvRUN2RW45WG1oNVhvdDlTOGozejQxajRJ?=
 =?utf-8?B?RzFoeXFLSEpJeGdlekFoVjNnaWhoQVJrVHUvSWY5dkJzd3JaZ0JtTmVvWS9P?=
 =?utf-8?B?RjMzUmxJa2toVjFGTVAvNk5vMDQrU2NQaUIveUMrV0FqSzhrbE5YT1hQY1JM?=
 =?utf-8?B?aUduRGtTNUdDSTVCNldEdFd1bUEwb1hleXozR3VLQ3FtakpDdVFSemxHbktv?=
 =?utf-8?B?QmRjUDY4d05FcHlrdGliWVl1a1F3R0g3Zk9EOFZBTnprb0UxSTRLWGpydG9O?=
 =?utf-8?B?SHhldERXTEZ2K1lxVE1VRDM5TGl6Rml6cjVxKzllTG4veGd0enV2eExLMUdM?=
 =?utf-8?B?TUxTa1JNMitBSEZ1L0h1NTNHQzMxZTRKVjZpb0xMU1hFOTQ4WExxT1I3NDZK?=
 =?utf-8?B?TkRZSFgvU2t4Tml3ajFUd0tGWFdtdytiU2NEcjh3c0E5Kytqc2xEakEyaGpr?=
 =?utf-8?B?NnlSYzd6dFViY3RoWHJ1QURMRWNCcUZTSksvckUycGNCVnhyaGZ2N1ZEZ3BT?=
 =?utf-8?B?eDNickJvMDkycFdTNmZOLzRYR05rc0FvMjhMMDdsaHRwdFk1d1RTU2o3dzgy?=
 =?utf-8?B?NW9RZWltYkNldFFlQlQzTEhjSXZDYWhPZE5VODFLMWo0TTI0M2dGaWt4L3pw?=
 =?utf-8?B?a1F5eFlWQU1obWl2NDJTMUFvQzQxRHNZK2NCUUtUcEFySkVucy9zamRHT0ZY?=
 =?utf-8?B?SXRUd24ycmhpRmVPSHAyVk1XSXgwWGcvbWQwV3RXMElCVmdOR2k4SEFWR0ly?=
 =?utf-8?B?Q3dWQ3NzdDIrR1crQ1hkQXQ1VCtZb3ZlVWZ3N3ZPTkMwVUVBeEdpQUJieGxs?=
 =?utf-8?B?MDhtcGhBdFlITVdqU1FaY25uYVJMeUVBM2J0ajBiNWJKV3A1bS9OSlU3aFh1?=
 =?utf-8?B?WURnMTFCR21ObUJIVXZwWFR3Wis3QTNUMjE2SlAzeTZzODJDczVpWjYrV2pW?=
 =?utf-8?B?Ni9iMFl0Ymk5akVMM1ArZTcraDlkNS9zbUhpcUMwUWM2L2ZiQXFkRHFuMzdQ?=
 =?utf-8?B?TExrZk5yTFFaVitEdjZucE5BczJFVDBHQmtFTDA5L25ibWF1RXQzdFFITEU0?=
 =?utf-8?B?OUpLcnBBN2tieW1LdGpsN0I5NHdWZStyS1p6bzFyU2Y1Sm4vZ2oxdWFwUmNU?=
 =?utf-8?B?RnAzUHlHdEhSaWkrUmhDQWdETlJjcUUrVE1RMXJWOWhoSkI4ekExVWljMkds?=
 =?utf-8?B?KzExb2tjQnBteURKYjdycGZRSEp3c0ExczcwYUwrVzJydUFkS0laeis3c1hw?=
 =?utf-8?B?d0RKV0RjUDl1RXgyMTZUNFZTMmpmNVZHNWpmbEl4SEdJb3p0Q0Q3QmM5ZlFG?=
 =?utf-8?B?dmlRTzcvWFlJL1BWa05BOEVCVGdTNXhsMUZkamQ2YkhVV05EWFBkNXVqQXl2?=
 =?utf-8?B?NWpUQ3JOei9DVTF6SGpYSFc4TS9pWmFaVTIxQzh1UjBYOTBFWHd0OHVHWFc0?=
 =?utf-8?B?ZXRQYmkya1ViTWp3VDdubVdOYWpRY1ZuUUdmcm9EMFZXVDQ3WW9keTB0R005?=
 =?utf-8?B?SmJpK1FFL3hpRy9SQ2RXTDF3RTE2Ulo3aTB6OVR0cjJRUHgyNHJGV080WUw5?=
 =?utf-8?B?c0ttN01oTTFyK1Y5T0xpR3VwVUkzZFNjWXptWnJ5YjJtTG90YU9KNkhUcWlM?=
 =?utf-8?B?OUx1Mi9WQ1hNYU1hT1JHenhZTDNUbDl0bUlMVnlhRGdZVVBiZFBDd1ZaR0hs?=
 =?utf-8?B?RHdOOUFQQkRxTllJUCtwZjhzRkJiY3dUZXZMYXpXZ0dHNmliOTZaRXVENkhL?=
 =?utf-8?B?WUtqOHN0R0I0b3pZV3ZWeU9JZUxJMjdKWFplekg4cGZHSzRiUlhuSEhMUEEr?=
 =?utf-8?B?MTNwN0RlYUE2bWcrMUxrb2NlT1lhR21LTVBOZFgyVlljT3E4WUJzSncwVlBE?=
 =?utf-8?B?aW83aUtVUkVIWm1abEJ1VkM5Z1lqaktHQUtsRXppbGJwYWF3dzFNTmc0a1h6?=
 =?utf-8?Q?HrcqIDZmktTlGj17cR2wZECy0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f537aa-b87f-4435-924d-08dc5a006980
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 08:21:39.7731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8uH721oj1dwx/gr2g/2HvfkiIP/Y2M7M9H2hZd31+r991GUgRO6sqM0uJeuce+zvZ5OjkHctwCoh98iiCofIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5790
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


在 2024/4/10 0:37, T.J. Mercier 写道:
> [You don't often get email from tjmercier@google.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
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
> page pool connected to a shrinker. That allows you to skip page
> allocation without fully pinning the memory like you get when
> allocating a dma-buf that's way larger than necessary. If it's for a
> camera maybe you need physically contiguous memory, but it's also
> possible to set that up.
>
> https://android.googlesource.com/kernel/common/+/refs/heads/android14-6.1/drivers/dma-buf/heaps/system_heap.c#377
>
Thank you for the reminder.

The page pool of the system heap can meet the needs of most scenarios, 
but the camera shooting scenario is quite special.

Why the camera shooting scenario needs to have a dma-buf memory pool in 
the user-level？

(1) The memory demand is extremely high and time requirements are 
stringent.

(2) The memory in the page pool(system heap) is easily reclaimed or used 
by other apps.

(3) High concurrent allocation and release (with deferred-free) lead to 
high memory usage peaks.


Additionally, after the camera exits, the shared memory pool can be 
released, with minimal impact.

Thanks

Rong Qianfeng
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
