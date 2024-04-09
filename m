Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782C289D761
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FE410E699;
	Tue,  9 Apr 2024 10:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="jTCeL9KW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2097.outbound.protection.outlook.com [40.107.215.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE75E10E828
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 07:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xullh10Zva2jD0YY/derK6gSwYBFf0jK/zRJRECtNkMxPoWGDPpGT2FgybIQiGg+AXXci0dRFVxCA4Pc2KSdrDCvOxaGbyvaoFgMeRUdEf+FEnxVmWlykbj+F5jge2/E/dAip38cS0ieRT8uvKaf8180dqloSE5T3hce9uZ9QSaSz8dcvIDJJL9JCx6oJZYRrBzBfRq948a+n/KFBC+4Y92ZoZQBRobCnPrcXESBmRyzRKk1g4NH3Io7rIUkuxgJgQQMlw3brhhI3e8DMG60h9pFCoUxky8MJV1Gu9Z01G48jA0zrDYEctkVv1hzw1wg9YqjEsomCI/BUl4a7u8+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pB/4+zaZFgcr/yH5WFbcvfSTz7QiVNqcENnUiVVQdQ=;
 b=UZUHURbhgWSw6Jf2RDBjCGpEfC2Y6ZU+JFhNzdQf9I8MCMrMcmJrTRBmSFk0DM5os8aIyg8NFDmCXxxwwDoHD08FL7c/+ltWAa165o65R0yNZ1BXD7zvFoH0l5iCHQnzvf828PiB2v9ck+h/NQOXawzeWIn9KQqHpXUtQfeBxYslKTEGiUFLbR+T4hf/vu5kS5NytlYtsE7gNeP17fFipeEnl96SPXV/6WdjWfwKl28IeaeSR1cjDGso4Tog6azdFHT/t/taXWYfmlEByvOu1bfViE7xNvOP0cx50sFt+1wZycWFJVH7TjNFGOeE6OS0uB214l3WeI9JrkFWxMoTwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pB/4+zaZFgcr/yH5WFbcvfSTz7QiVNqcENnUiVVQdQ=;
 b=jTCeL9KWGhPraDrhUrNAeXPmXGZpiEfIkz3X4TIv1TepaaD+fPNUBHxsFRUht4IGQnp+Tx8NnG3PZ4x2c9tFFYEoLigs2XcOkOEXKu0mFqEPqULMdKIlbDB4O39c6GR0e1FlDDE3OTq3KOOPS7I5NmKVp0r2FTcVIqhQkBTUXCAsVrqEfyz5bS43IR3R2V77e/3K5mU8PhLBmyz1/25cWDLLrBGO3DHUt2/3O8AL5ZxhCTu5ZehnT/g6Kp4dSeP2uTv10YwLdFUTX4nl8oRRqzbR4Kj+clgb3DlQvGQakavu2q/Gw9H9INsyFmZDb+c2XlPEz+Y6dHfpIb73D5/tvw==
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB6564.apcprd06.prod.outlook.com (2603:1096:101:16c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 07:32:34 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::a60c:298:c201:e4a1%3]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 07:32:34 +0000
Message-ID: <5c7ac24c-79fa-45fc-a4fd-5b8fc77a741b@vivo.com>
Date: Tue, 9 Apr 2024 15:32:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add DMA_BUF_IOCTL_SYNC_PARTIAL support
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rong Qianfeng <rongqianfeng@vivo.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 sumit.semwal@linaro.org
Cc: pekka.paalanen@collabora.com, daniel.vetter@ffwll.ch,
 jason@jlekstrand.net, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20211113062222.3743909-1-jay.xu@rock-chips.com>
 <1da5cdf0-ccb8-3740-cf96-794c4d5b2eb4@amd.com>
 <3175d41a-fc44-4741-91ac-005c8f21abb8@vivo.com>
 <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <9e6f1f52-db49-43bb-a0c2-b0ad12c28aa1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEYPR06MB6564:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9B9aUgMtylU1x8nnPKjLeIMIFC9V3kN+7PqNKzeOaqFmLW9ARSmNmXmkAsRYngQRFqif+eP7U/v+KyZnvCVYxBfspWiRLghySbI+szp2BqgTev3gLP8BsoB4bMkS/rh/JTVp6g8NHtK2Vqr4I8BJAw225PFmu4AqoxdOb9R5XG1jd//8c6k40lLrvBGllB87kEdrhm3clRayvuoRtC7oElGYeY4me0toDf8/DzpRQpCtPrtwLF7m0fMaFgd/fTPvw6rIep++v9ycDthitPjomEpEGK/SfY5e4FySO1yWXk8FwUBz8fEw4UQdd/E6U3G9Kd7RNEOtxW05nJhqPcWURk9vtJ+pCA9/lUe2PYs9iyEfk3dbB4QJgEUNlo6YY6iw/qhF6CxEPPyyTgRADkbrFmzU7J6UEiLrqtPZ9vAJNQXFOnWfY+wAxSa3nPjMFFedW1RrOtvrTGU0PpUmOlZUGNo3Zs51CSDirZcqzhIKwWxCTEMfSy17NZwo5mjp8KLnKLKCgW7SXemmSLLX2EjH3pBZROG2dX2UfDOcD4OACu9ilJz0l2QWMbTCxC9PTH4PZFRm7R70magKCq3m+bCQSORBau5BGMDvD4/j0BtyPM9PFUcm1YPMX/8DSbrMdEqAYY5E2N+m7SxSfefbtsuEpmX/wPweXQsEZ8GafwgYcOwmH1OQlqPiVit81zX11gKHk1NmHx+4wSn7732MyCl56naYbKdYxYwtYLpRRfiHwUQ08JQWsu5tpEAnyIXf+BHx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(38350700005)(81742002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXpMZGFEM2w0aTdjYjViZmlzVzFzL0I4US94M1hzS3Y3L2puSmpzMFIyck9I?=
 =?utf-8?B?VmJ4Ny95Q0xJekRHS1h3UzZsTkhIaWpYMTViY1dxcGhBS2tMN1F6Vyt5eXpq?=
 =?utf-8?B?RllmL01LTXE5ekxTWlZGY2NHcU9sS3ZIRDFwOG1TZ1JBNmpxd2lqajY1UWRU?=
 =?utf-8?B?VHJYSFZmclN4NGViN3ZxZm5udnVKc25sVmEwY2xtWnBHbUYrL3ZZdTBLVGZv?=
 =?utf-8?B?QUY5TWZMamZuTHZDVHdDSE9oanE5Nm04cW9yN0hWQUN4bGdpRnF4cnQ4bEM3?=
 =?utf-8?B?WWt3MUlyeEdLeWJnRFpzMFBRSmFLN0RXNnN1MkhxejBxQk04YVByTDFraTRF?=
 =?utf-8?B?Z0ptOHFBVGw4M2ZyKzlyM3puRGM3OTZJRnNZbVkxK1oyb1g2RWJFUGhrUnZU?=
 =?utf-8?B?czZqMUlHc0g5bnl1VGdXeU9oSlVYd0h0Q2xIS2pueENPdjlkeUxvMStrVW5a?=
 =?utf-8?B?UDJ6SU9OSGNGOUhSVmFnZXU1WGcrSTdoYlRmMDVxcGpwU0tyWmJwK0tMenRZ?=
 =?utf-8?B?MC9PYzVVeUwwTUhjY0o2TThlcUJDV0NOTjVTaUgyL0JZMStDNGZCRVVyNE95?=
 =?utf-8?B?Uy95YllacjFEaTlpUHFXNVZUbVJ6eGlKNmZUQlZmKzU3Z3lta3FCY2FkUjBm?=
 =?utf-8?B?RHV2M29leXY4dEVvM1J5WXR5ZTZCdnduWnRJNW9DS1RHcFVsUWhJMVVRZTkz?=
 =?utf-8?B?KzRpTHVBeFB6VGpXVm44OHhQcXQxRWtCTGhiZWE2ZDJkeGpXNFZhVng1VEdi?=
 =?utf-8?B?VVlrU2huVDBXOTZzZGRSSVJPUWptZVROdU5lM2t5S2hCcjFOT0hzNmFWeXRr?=
 =?utf-8?B?ZjE2blZvMFMvaEZsdzB4SUtJb0dHVlJCV2R0Q1g5RUZQVTBpWVZQMFg4dWpD?=
 =?utf-8?B?NnROczcwNGZqdFlhQjFqenRRL3RYVzBQWGJYblJINGpGTU5TVlZrNHpKNHM0?=
 =?utf-8?B?RGRMSENNRmp6OG9qT1F1Y0VXZFpwbndYNk5GakFoU0hnaG9vblpPVHN2eWh3?=
 =?utf-8?B?L3BLdEdVeUVpcVhzV3JxTTd5RXhta0RiSkg1N0szamRKK1BMc1lsamNPYmkw?=
 =?utf-8?B?ODUyN0pTakVwSkFnWUZLbkZPN0JvV3N4d05NQklDY2hBYXl4dGlzS1NZNHRB?=
 =?utf-8?B?MlA2UjlxRjV6LzQ4cXVkWUZRSm1aUmRQM05PQXJFZkJGQ1JvcTVYM1Zsczcy?=
 =?utf-8?B?NlhTYXBubWY3dU5OTjlZV0NzejNKeXJtZXUzNWEyck93MmxrczVKMmNaK1Uz?=
 =?utf-8?B?cThubFFUSHh5NzZ6U25yM3lqdE1GeUcxR1VROWlmMGdzMzVFS0V1Vk1UWVFn?=
 =?utf-8?B?YVZaK2R0YWwyZmtBSFIyOThtcmZwRWZpNWt3Rlc0THJxa0paOHpXVDAvaXFV?=
 =?utf-8?B?SmMzQjRrdUI4US9YbDE1TGY1VnE0M1NMeENiREdrNjZvc0wwbnFNaXVBMThI?=
 =?utf-8?B?WVMxYVhZMG1TeWVvVmNEMFlTcUNjTzlXZmFpRHUyNldwZTdxdFl4b3BYZTFl?=
 =?utf-8?B?Y2tweW9XUTk4eGJSWHV0L3lGemErVkhQSWQ0QXU5N0I5bUpvYzU4WG9OZnM5?=
 =?utf-8?B?RXhiTXEybDU3VjlqL0xTWXE5SUV4cVRBWlJLTFBFZFJmMHJ1Y1hmUDQ5MXF0?=
 =?utf-8?B?aTYwTEc5MG9Pcjg4akFORjY3ZXl2M3k2RGhyVmdJSWYwVnpaZDV0dCtVcGdr?=
 =?utf-8?B?dS8zMVJzaUM0Wkd1L1ZYdzk0aEg0amVidHZJRUpieHVjNlMvVEVGd1FqbHpT?=
 =?utf-8?B?L09WQUdXUUlWVG1qaGwya0hKZmhUNHU4T1FxWllrenFMM05NSS9YNnFVYU9D?=
 =?utf-8?B?eXZvQjlqOTB0RHVHQzF2MURTSU1LSjcvSTBDNVExVWdTcVV5UndUN2ZiU2tx?=
 =?utf-8?B?d0VzRHM1WlZ6ZGZEUGRMVWNNb3R4bmJiUlBLREU5czF6Rk8zUTc0cXp1OS9M?=
 =?utf-8?B?VjQwbHpjUlRia3MzUHgxRDZzb3JnL1BWeEh4K0FOcHlzczVCYzdON3dpMlZx?=
 =?utf-8?B?WUIzZnhmenJtdkZSQTB2RWxvNWVLWC9WZ1I5UFRyb1lFcHJraTJQWHZ1aU9q?=
 =?utf-8?B?TmJXS2RLbUVqa1cxdGJLN0c3bHVWaFJadmRrbEFOWnRWa0hNNEpDdVNDN0k3?=
 =?utf-8?Q?PCMRcrvQ7AULorsMfuWsoWTzV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdde8fc7-a667-4a37-fcbf-08dc58673929
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 07:32:34.4558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AiXdDMq2Ip/SwPt5KE9T0wFYk/DFqL30aL6JKOrraoQjBACTjeVylYigNfO+0EWv1eutw/mZCQ3Vv9zwL8S8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6564
X-Mailman-Approved-At: Tue, 09 Apr 2024 10:57:50 +0000
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


在 2024/4/8 15:58, Christian König 写道:
> Am 07.04.24 um 09:50 schrieb Rong Qianfeng:
>> [SNIP]
>>> Am 13.11.21 um 07:22 schrieb Jianqun Xu:
>>>> Add DMA_BUF_IOCTL_SYNC_PARTIAL support for user to sync dma-buf with
>>>> offset and len.
>>>
>>> You have not given an use case for this so it is a bit hard to 
>>> review. And from the existing use cases I don't see why this should 
>>> be necessary.
>>>
>>> Even worse from the existing backend implementation I don't even see 
>>> how drivers should be able to fulfill this semantics.
>>>
>>> Please explain further,
>>> Christian.
>> Here is a practical case:
>> The user space can allocate a large chunk of dma-buf for 
>> self-management, used as a shared memory pool.
>> Small dma-buf can be allocated from this shared memory pool and 
>> released back to it after use, thus improving the speed of dma-buf 
>> allocation and release.
>> Additionally, custom functionalities such as memory statistics and 
>> boundary checking can be implemented in the user space.
>> Of course, the above-mentioned functionalities require the 
>> implementation of a partial cache sync interface.
>
> Well that is obvious, but where is the code doing that?
>
> You can't send out code without an actual user of it. That will 
> obviously be rejected.
>
> Regards,
> Christian.

In fact, we have already used the user-level dma-buf memory pool in the 
camera shooting scenario on the phone.

 From the test results, The execution time of the photo shooting 
algorithm has been reduced from 3.8s to 3s.

To be honest, I didn't understand your concern "...how drivers should be 
able to fulfill this semantics." Can you please help explain it in more 
detail?

Thanks,

Rong Qianfeng.

>
>>
>> Thanks
>> Rong Qianfeng.
>
