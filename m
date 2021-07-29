Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53353DA485
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 15:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A496E45C;
	Thu, 29 Jul 2021 13:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541DA6E45C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 13:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gW4WA+k5h7eOi1FobNf1ZQeVb+6R+tMu2zKlvgaLBBKJp7IGxy1hJiDCZZrPA5+7o4R3X1ZJJPzzYD7NUtiKM9k7qy5SmZpgCcKbGjh6CXf14aohnpskVD3Rti+PuaQOlfxW0Ydfyrl9vRm9AOLTsz5qfQaiP0KVifVzdhEJXBBIVdSVcPPK+fvzkxHyueoxaF1Tiq3PNfFc9VC6fT4FmQGu9F/1AAGJ/cCsy1ZfDbsHj7VW3sO3ZVUsHfCEEB/9gWcechc4ORkEDvbB8pZ8ani5Z0qaR0SdR/KtLI1dNkCtHZ3ZWLmZ/k7Mz++7nCnmiEv0kLNKomV7SEoqR4uQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4TSQ92L1IfHJd7i0pwqK3tl4vp3QLrxqw/hXojsOlU=;
 b=SoO6PglChZjjPLe8lst/O0gTIEc7zTeGqqGuOMJ2MzFvWdN+kWZAE3ZHYp54FIanZxjog8AIhVxoU8tMxD17ki0xYmLka5ed4wwSt9gWvRSNepoezCnwDI3HLG2ovif4vAr63bDbX/GB+/xaRi3LbhYzTeKERg4dIS0Bf0+zaljEiw9sl3wrtQnx8+7vnDPjr9N7adj+TlvKes8nGzvwV/Z9dCuSbk6I2NPjOLCj8L8z9+UpP/s6CrauKtksM3CKJEaM/Pvma7nafbBYQ0PWgqRKSXiKM1Hloj25u508vhoifM54JPaBjA16yVZ57hHkHFfSkmBGso6mVvjV1hj5Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4TSQ92L1IfHJd7i0pwqK3tl4vp3QLrxqw/hXojsOlU=;
 b=b7ptvNTGIE+4l7QHgTN7nkQcU7OziKaBhEEFPm1+YdSIY4L7RTIry6J6UWf/9d1tVNoSE4mTwBUkoi82kOUHwnzIOUZikbFNSty+zIlX3d3ZRv/RatS7gH1WWsiCSC74FDLnFpBInboBA5FWXUxqp2jkTIU6SGsIlAVrHcNIdok=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB4741.namprd12.prod.outlook.com (2603:10b6:a03:a2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Thu, 29 Jul
 2021 13:41:18 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e%7]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 13:41:18 +0000
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
 <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
 <20210729112358.237651ff@eldfell>
 <3675d530-c9fc-7ec9-e157-b6abeeec7c2a@amd.com>
 <20210729121542.27d9b1cc@eldfell>
 <15cf73a8-eda4-3559-561a-a05a14f445d0@gmail.com>
 <20210729140024.6a635be4@eldfell>
 <c090d320-7f2c-3858-d978-7a6f6e8001c0@amd.com>
 <20210729154917.5e664b24@eldfell>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <11692377-acae-696a-bbeb-9921a6f5d905@amd.com>
Date: Thu, 29 Jul 2021 15:41:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210729154917.5e664b24@eldfell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0045.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::25) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e62:c902:d5a3:6f28]
 (2a02:908:1252:fb60:3e62:c902:d5a3:6f28) by
 AM0PR10CA0045.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Thu, 29 Jul 2021 13:41:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 451cb912-7fdb-472a-394a-08d952968ab1
X-MS-TrafficTypeDiagnostic: BYAPR12MB4741:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB4741FB1B40D384681D917EEC83EB9@BYAPR12MB4741.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wXWCB0+NyMmD9nHTxsltl0u1DqchNSqiKjmVx+838ohfowp7j7LBAY+Ymg2A3Lqp/Bft7FYioeO3DwR5WHbcHrLzP8FZI9LsGdTl+nd5s9MyV1Ei05OuMJAdzemWdeKV0IL1nwJjoI5FpFW0rlOGX/2HcIN65npsWaiq3c3tPjhGeULotnXvTeiBRHi5LhFqi8QXxLRfyW+CFAqSjciC3j2BX8sMo6mg0TfaDbhxGfq+S1X91j2ykfhPagbmXOmUhrBkb0uapZo7FLZV5HZxOtkiakYYyzwnrlPRfF0csmWYQHWNVwcp6Tfq/ZymUVz9vSt1BDZFgoadaNMBRaXFaUat+yunZzeMlJSkcQN7eeROJSz3VckyVjAJyRWmWTwftAxiZUK0UcbGg5U90FY5lZEM/rKd+ff3h2S7pf9ySISTH4AbZMQY/RsutoGV58jBby+Jlmo9gS2D5QNRfy4BSz9QFBgwf4cMO8Iz6pHdX6uY1vD9id2Rn2BSOBNdQAndWsxX21GynHjPDA/p8vBWhD2jt+0Dut3l45K/GEo/oC08j9FADnEBqzK3zcgKGMvXKJYEwU/dYZKhyvGY4Sp056Es/r5nxq7BY6K8swbKr61rsatWiSGznsDIwc0bJKwjCpIbjsO4i0SCix7oASZ619NZvhVl7Wthn8sk3zzXYyr5YjQQ+r7SfU+01i7m9lS072P/jXN4qXZA4L55Omcd0nzXrjsBCBth7txeSqpkJEIwXorRtTchsqarBlmS6dw6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(5660300002)(2906002)(316002)(6666004)(31696002)(7416002)(86362001)(8936002)(2616005)(4326008)(38100700002)(6916009)(31686004)(186003)(66476007)(66556008)(66574015)(66946007)(83380400001)(54906003)(508600001)(6486002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkdVdDh4Y090MTh4SGJXamJWTkE1RWxiYks3NWNNeUxTbXdnL3RYTEJrbU4z?=
 =?utf-8?B?TTNya0xXaXREVEd3YzlvZ3lTMmd4eDR3d3hQZjl4YnBIWXY3WnEveVg3REQy?=
 =?utf-8?B?YVY4Zm14WXN1TG5icUdiYmRaa0VHUmJqaEl6aEFRNUtOc1E0RWxXTkYzUmNM?=
 =?utf-8?B?cC9yMllXSFpMTXlFSXRUclhKMWZqVEh6SE05YTlwRFVhMlh1eTJFbnYxZTZO?=
 =?utf-8?B?WG41S3BTNS9GVGVXMlhVMzJjeE9GY2lHQTdyZzBjSnZkZXJtUjBNZmF5K1Zr?=
 =?utf-8?B?bVY3WkUwZ1N0K1dHMDVibW5WZDFiL3JWSWpYYUhJQTBzUzYyN3VVcTBRSjRJ?=
 =?utf-8?B?RjJhNEM0VnpPSjU0aWtsMEd6b0J6ZHVZM3o0b0NhdE1qdzlrQ281Y3ZTSkda?=
 =?utf-8?B?NzlnaU43TGVtZnZhQ2tFbVIxOFBCcmliVUxLSU92cEk3NUNSM3ppWGh1dGpN?=
 =?utf-8?B?ZGhyc1p6UjVtVTlMamppeE1QeVY2Z2V6R3lDTnViTHo2VktvakxScXB2eWJ1?=
 =?utf-8?B?NDU3TVR2WVF5OS9wRVhsWjFKVUZQWERrajNNRkxlTmovcldlT3hhNnRDMU1R?=
 =?utf-8?B?ZjRGeTNDdzZlN3hKMzBSRllMQWdEbC92dm9aMzJ6TjhWRDZTY0tvUnVRVDBS?=
 =?utf-8?B?RmFaaHJmSDJ6SUZuZm5ZMGhIczhydWUrbWxuSmJCdmlPNktTODROcXlUOHNm?=
 =?utf-8?B?UDJFVlRQNThobko1amkxU1NDN0ZDRFNETzVvUEE2RkNpaFQvUURHK2h2dFRq?=
 =?utf-8?B?dmVvbDIyajdHK3BCSVhxRVljc2ZxTjB5REYxL1NqN2xockQ3amdwVDhNK2RG?=
 =?utf-8?B?Rmswcm53QWJCT2JkTXRPNWZnUmxkVWFKYWxjZUUzUHVqNTFIZUVXcmxqRFp3?=
 =?utf-8?B?WXhORE9vUVQwY1BqakN4UjdBM05BMGlvcWhGSGtQMlQ5TFB3SHZIVHlDc1Vr?=
 =?utf-8?B?SnJWNmZqRGFkY0dNWjlRRWtUdnBaTkx6OWlKU3N4M0Z4SmZmSXZIeTVoaUhC?=
 =?utf-8?B?bDZsMThRcXZYelBFWmxVOEUvbkNCcDRlRldleU85VmI5cVRYQTRlM0taN0Fp?=
 =?utf-8?B?d1hQQzdWcEFiSWtNNUlUOUJFaVkyVlpnZk9Hd3RFeUlXdEtIaCs2Yms5MTN6?=
 =?utf-8?B?N25kc0VQUC9WWDVuWkhxLytBbGJ0eDc1WHp5TUY2T0h2RUd0dEx3ck1ucW9I?=
 =?utf-8?B?cUJFQmxXL2k2Q3oyUDl5RkY3dDBkaUwrUWkrbCtWVHE5dEJpajdiemlUUTVI?=
 =?utf-8?B?ZktmbEhlMG9kYSt2TFUxOFcwWm9jM2k0aTJJM1pBWEs3bVVxQjNHSXhuWEZk?=
 =?utf-8?B?cndVWFNGNTE4WDNJTXczZVhoVEpwbnRPcFpWSHBoUFhjWUFBRWpjWlQ3ZjlR?=
 =?utf-8?B?MC9GNll1MnhweGMwWFhuaXd5Y2t5bVp0TFVxMWFvRUM2YWNhdGptUGtiK24x?=
 =?utf-8?B?V01WWTdyMVhZbzl4Z3JhZjR6Zld4R1dVdGQySDlwYnVYaGt3WmVwUWpuT2lN?=
 =?utf-8?B?RU91Nkp1dTl1b0wrMHhETVZzNnpocmRMeTdKRVE1YzBycWpRTjY0MHNEbEZP?=
 =?utf-8?B?ZE1KRmtScjBQbnlzVkRQY1N3K3JlMmlIM0MwWGdBSWM4SVVGMUZhQ21RL3c1?=
 =?utf-8?B?ZlFDRHhyMm5sdHl0bTJORDJxNFhjRkRlbkpIdHZ6RTllQWo1NmdQUUVuOHM1?=
 =?utf-8?B?MFR2YmE4M2RnckZ2WVo2SGVzeTljYTZnQlNMVjJuSGphMk0xYTRHcnlxQ1dq?=
 =?utf-8?B?Q3hRYmdhcmp5bEsyTGVWdGhSMDRVbmlUVGwrMGcwNTFiU0kwc000cGN2N2h6?=
 =?utf-8?B?Z0IwMzhtY0h6Q01Xd0hiNm5IZzk5S0lHVzVyOGJ5THJ2QXJaY3FaOUsxY29H?=
 =?utf-8?Q?3THRnOxOmHDmi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451cb912-7fdb-472a-394a-08d952968ab1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 13:41:17.9285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poL+hSDONtP6lNp18RdxjQRpckMd5mZFCgLQu9jkbkbFA515ARB5V7s50Y7ImP7x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4741
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Jack Zhang <Jack.Zhang1@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.07.21 um 14:49 schrieb Pekka Paalanen:
> On Thu, 29 Jul 2021 13:43:20 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Am 29.07.21 um 13:00 schrieb Pekka Paalanen:
>>> On Thu, 29 Jul 2021 12:14:18 +0200
>>> Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>>>   
>>>> Am 29.07.21 um 11:15 schrieb Pekka Paalanen:
>>>>> If the app happens to be frozen (e.g. some weird bug in fence handling
>>>>> to make it never ready, or maybe it's just bugged itself and never
>>>>> drawing again), then the app is frozen, and all the rest of the desktop
>>>>> continues running normally without a glitch.
>>>> But that is in contradict to what you told me before.
>>>>
>>>> See when the window should move but fails to draw it's new content what
>>>> happens?
>>>>
>>>> Are the other windows which would be affected by the move not drawn as well?
>>> No, all the other windows will continue behaving normally just like
>>> they always did. It's just that one frozen window there that won't
>>> update; it won't resize, so there is no reason to move that other
>>> window either.
>>>
>>> Everything continues as if the frozen window never even sent anything
>>> to the compositor after its last good update.
>>>
>>> We have a principle in Wayland: the compositor cannot afford to wait
>>> for clients, the desktop as a whole must remain responsive. So there is
>>> always a backup plan even for cases where the compositor expects the
>>> client to change something. For resizes, in a floating-window manager
>>> it's easy: just let things continue as they are; in a tiling window
>>> manager they may have a timeout after which... whatever is appropriate.
>>>
>>> Another example: If a compositor decides to make a window maximized, it
>>> tells the client the new size and state it must have. Until the client
>>> acks that specific state change, the compositor will continue managing
>>> that window as if nothing changed. Given the asynchronous nature of
>>> Wayland, the client might even continue submitting updates
>>> non-maximized for a while, and that will go through as if the
>>> compositor didn't ask for maximized. But at some point the client acks
>>> the window state change, and from that point on if it doesn't behave
>>> like maximized state requires, it will get a protocol error and be
>>> disconnected.
>> Yeah and all of this totally makes sense.
>>
>> The problem is that not forwarding the state changes to the hardware
>> adds a CPU round trip which is rather bad for the driver design,
>> especially power management.
>>
>> E.g. when you submit the work only after everybody becomes available the
>> GPU becomes idle in between and might think it is a good idea to reduce
>> clocks etc...
> Everybody does not need to be available. The compositor can submit its
> work anyway, it just uses old state for some of the windows.
>
> But if everybody happens to be ready before the compositor repaints,
> then the GPU will be idle anyway, whether the compositor looked at the
> buffer readyness at all or not.

Ok good point.

> Given that Wayland clients are not expected (but can if they want) to
> draw again until the frame callback which ensures that their previous
> frame is definitely going to be used on screen, this idling of GPU
> might happen regularly with well-behaved clients I guess?

Maybe I wasn't clear what the problem is: That the GPU goes idle is 
expected, but it should it should just not go idle multiple times.

> The aim is that co-operative clients never draw a frame that will only
> get discarded.
>
>> How about doing this instead:
>>
>> 1. As soon as at least one window has new committed state you submit the
>> rendering.
>>           As far as I understand it that is already the case anyway.
> At least Weston does not work like that. Doing that means that the
> first client to send a new frame will lock all other client updates out
> of that update cycle.
>
> Hence, a compositor usually waits until some point before the target
> vblank before it starts the repaint, which locks the window state in
> place for the frame.

Uff, that means we have lost this game anyway.

See you get the best energy utilization if the hardware wakes up as few 
as possible and still get everything done.

So what happens in the case you describes is that the hardware comes out 
of sleep at least twice, once for the client and once for the server 
which is rather sub optimal.

> Any client update could contain window state changes that prevents the
> GPU from choosing the content buffer to use.
>
>> 2. Before starting rendering the hardware driver waits with a timeout
>> for all the window content to become ready.
>>           The timeout is picked in a way so that we at least reach a
>> reasonable fps. Making that depending on the maximum refresh rate of the
>> display device sounds reasonable to me.
>>
>> 3a. If all windows become ready on time we draw the frame as expected.
>> 3b. If a timeout occurs the compositor is noted of this and goes on a
>> fallback path rendering only the content known to be ready.
> Sounds like the fallback path, where the compositor's rendering is
> already late, would need to re-do all the rendering with an extremely
> tight schedule just before the KMS submission deadline. IOW, when
> you're not going to make it in time, you have to do even more work and
> ping-pong even more between CPU and GPU after being a bit late already.
> Is that really a good idea?

My idea is that both the fallback path and the normal rendering are 
submitted at the same time, just with a big if/then/else around it. E.g. 
the timeout happens on the GPU hardware and not on the CPU.

But I think that stuff is just to complicated to implement.

I want to describe once more what the ideal configuration would be:
1. When you render a frame one or more clients submit jobs to the hardware.
2. Those jobs then execute on the hardware asynchronously to the CPU.
3. At the same time the CPU prepares a composition job which takes all 
the window content from clients and renders a new frame.
4. This new frame gets submitted to the hardware driver as new content 
on the screen.
5. The hardware driver waits for all the rendering to be completed and 
flips the screen.


The idea is that you have only one block of activity on the hardware, 
e.g. something like this:
_------------_______flip_-------------_____flip.....


But what happens with Wayland currently is that you end up with:
_--------_______-__flip_------------___-__flip.....


Or even worse when you have multiple clients rendering at random times:
_---_---_---____-__flip_---_---_---___-__flip.....


I'm actually not that of a power management guy, but it is rather 
obvious that this is not optimal.

Regards,
Christian.


> It also means the compositor cannot submit the KMS atomic commit until
> the GPU is done or timed out the compositing job, which is another
> GPU-CPU ping-pong.
>
>> 4. Repeat.
>>
>> This way we should be able to handle all use cases gracefully, e.g. the
>> hanging client won't cause the server to block and when everything
>> becomes ready on time we just render as expected.
>
> Thanks,
> pq

