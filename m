Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1EB3DA253
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 13:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00636E0C8;
	Thu, 29 Jul 2021 11:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2056.outbound.protection.outlook.com [40.107.96.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6948D6E0C8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 11:43:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve+KXbF+eb7+jRmd7OPgV1wu9bhDKUV85819yJuNo038xpmrQhoorP+thbKzNAAjtuJDXM4xXZ6Qp/k+gyJ1bH7VFJ8Ekx14rDS5rnqNlwZ3pa6ZIdtFBSXN5wuklxfbuxeoJqU6anbN/pKatWIsIqxcNtw1idBu2Va02oBo4E8n3Tvo5UsQd7WIkeM8At12ejIUT6ZoIMT9+fpXwYiLY+WuioF5C0rP/mcYENXP+F0PgHIXDzkp61m9MX1ZFJUJdcnNUioAl54/I1La3ELGnszAhbnc/gL9iLPiXDUkP4fd/JQvlJhnve2uFOUbET8Ar1WLZs6xG2slqq+ZPgRtKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTy1ue7/+zLHlGBBKXx4JzII4O1brzMtFKd1csS4Qfk=;
 b=AK08goascpXYHab3s00XHd470bH53IuDLL/ZIxSgZ1kDwLht3yMP1RYkU410r+Hfp9aMA4l58EucFgJhxI+h4v4KECZd225M8TC3lohXZPwt+skNUSOMBObzNhBESvMUDQ7RNwE6x9+seqKEvtkjjnQ01Bkkzbthyh2rtv3Thk9ZY6bs9VBZxxWxgPd4VOFJFugvz4ifNTER7yfC1UY9sOtLVeM8RAG0L0kxYqsrl97WVClqhMU+b2/19XY15NUnk3ieX3/D3A6gT54qSEot5y0FBl0Vsb0OpuNN3CmZ0yS3nFbBXAid037qZrUW3fs/A1h6Edw81fpLxgg+KvgeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTy1ue7/+zLHlGBBKXx4JzII4O1brzMtFKd1csS4Qfk=;
 b=JOCd9qUg4RyOMcjYo0o9HC48pLrSeBi+4hFngKsM00iAVJ7FUrU/FKR4hB3hSyvSjYVSkitnvD5PT//m+TOaPYC89RlW8HGaTwPY6k99SYh0IU65Nbt72K3Ai5uBzkaqxT4dfMOgfLJ0pnbUOZJ5Zv9A7sEgKtCtGmG1wQb32qQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Thu, 29 Jul
 2021 11:43:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.033; Thu, 29 Jul 2021
 11:43:26 +0000
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c090d320-7f2c-3858-d978-7a6f6e8001c0@amd.com>
Date: Thu, 29 Jul 2021 13:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210729140024.6a635be4@eldfell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e62:c902:d5a3:6f28]
 (2a02:908:1252:fb60:3e62:c902:d5a3:6f28) by
 FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.12 via Frontend Transport; Thu, 29 Jul 2021 11:43:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 450169df-1603-4e13-7a5f-08d9528613dc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB411116A32966CCCE8033EDFF83EB9@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vqSNCYc3/+J2cCq6iqYXbx6mgQpGDeSMUdMM8mxJri2suqISYoAxhqoV7sePb6myMRxyIdQ5Fdx5KXdSumaI19oYscS4F2LSS79BXnuwMWtsMsr2rI5faRa/M5EStbFdu7DUBguj8u8afh1FIdplPOOCeQZHVpp2lzfeyI7nCjoX4p13D9msGa4/M3lgvq3w9pGVfiaqPI3ezPvgwIUW2tKRnWRj60OMyvH1/cAma6irEG/d0B/Fyg4YtPlKiP6fK9SIH1ngQgpLt6ELAjtQ2gjO+RqNlZgau5Q9LXeJweAR+SWh9qLXP9XEK1jj3UedFHbrAeAYiXcWi3VpmTB9pfsOx8QbBjieykYfmODTQRjHMWFbTAk35cGbvQlfD+8oLAvdN6yT2jLT1OkvWd9Sx0uUlRo/d96nlJuIUFf8UWiLli3qgU+MEpRkpK/WnHwwesevG5xe6wG0r3GPazf5rMYemhGHUSg6jDvldL7qjhHDCU/QNxLzGBvKxSSzVCLgxPIVju8JsOuoPAD8jQZttnJPzzj+fggOuT29RkM8fV/zo4Uwc7/LdEtrBEqTQ0fULomnuAlsXwV+ZDPvvv9ZgY84ezVMPt8YOueic0tqppSnxuoIxj9HOYxYQuJJJrVa0SgXuwBoaZxHNkLuDAe8lVDkU/F/iMy5lt5VN55pMoUOPmFn4lNCKdXBZacw3VLQ4OEBHqwE8Ni8Mt+kp1QuLsyFGoGNH3OxBqSDp/54mrYj9lV6JuL633tkc+bAO/sW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(66574015)(54906003)(110136005)(66946007)(31696002)(66556008)(8936002)(8676002)(66476007)(5660300002)(2616005)(7416002)(31686004)(186003)(316002)(478600001)(2906002)(6486002)(86362001)(83380400001)(38100700002)(36756003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmVhdWF4Z2FjRE9oTkVleUFxR0MwUW5kWFIvdk15T1Y0TkVyOXQ0eXJKVE9t?=
 =?utf-8?B?eVRSa2RSd3BvNjZseFVZZllCVm4vYmR3WFJDU1dJTFVrNXNaaXZIYkVlZDhx?=
 =?utf-8?B?TFdkR2VUc2k0NVl6RGpWV1VVdmd0UE43dkE2bzBsNkhOTDBpdnRxamc3d3JK?=
 =?utf-8?B?ZFY4UWNxQ3NaUmFpdXpvb0djb3V1VUdncjI2T1BuMytxanBVL050OHVtRzhS?=
 =?utf-8?B?dGUvL1luZVRIUTlLaTZsc0hNU1ppVTNWT0IrVUFrUDBQUC8wS0Fhcm8xaHZQ?=
 =?utf-8?B?UVEwMWxCUUdHc2x6RjRHZ2o3L25JWHh0QndrUmNNSzdvdHVpb3VTWk9TVlQ4?=
 =?utf-8?B?OS9ScUdBQTZzeUZ0ZVhEWXJHTTM4MkR6bVZWcmZ6dUhpQ09VSWRoeEUxSmti?=
 =?utf-8?B?NldOazJERXZBZ0IwRHBVOHM2VnF2WTJZamJGM3lwaDI4OVpsMlFIQzIzKzA5?=
 =?utf-8?B?VElUNnBFUy9UWXArZ1BNR3ovcC9renhzdW13OExWckY2aGIzRi9ZRjd1OXZI?=
 =?utf-8?B?Z1NJY25QRmd5NlpmeFBRNjUycUJPOUVOcytOUFM5MzkwejJ6R292ZmFYcEdG?=
 =?utf-8?B?RDI4Tm9hWjR0aVFoeTRhYXhXVGNuYzVYaGp2Vm1xejVwelh1OXJ3K21Iemgz?=
 =?utf-8?B?bnhWY3VXTG9sTUQ1N0kyZ1pmOGVjZFptVUZEWEN6SUwwclBXQ1BjTjF3aHdH?=
 =?utf-8?B?WTRMd0p4OVMwK2liRTZVOFg3R1RmNmg3UjdLSk45anVkQWNIbHJqVHBvajBo?=
 =?utf-8?B?UkxMUDVTQUYyU1NteWRtSEhrMEloTDVsWlJhNzhwcEVmYzNrTzJSdmppZDV5?=
 =?utf-8?B?N3dyNGs3eHJKaGVpLzJVMmgxbnBlNm1CNDFxVmN2Z1I2alZ6alUzV1NCQUxx?=
 =?utf-8?B?d0FsSXkrUjdUUXRrZW1sU2IxcytiTUx0YlA0eTh2dG8vL3pMYWNqbW5qbnNk?=
 =?utf-8?B?czZZOFhmM3poUnZ5RkJBQ2hPMFRVeW9yRithbmVkZk54ZVVITHU0Ti9HK0cz?=
 =?utf-8?B?aFgyRlBOSXJFN0s0OS9Yc2tpZjdiaWxJSHgzNmlUanNIWk4reG91ak9vaWJt?=
 =?utf-8?B?MkVCZ2UwN0c2MGV0TGh3ZFphSzU3WmpRWDAyaGNZV2daMGMyVjRXNFlOSnE4?=
 =?utf-8?B?WURHK0RWbmpSUXVhWmY0c3RGS1VMZThQdFpHcDRDSUp2cXhOUGwyVW0wUHFK?=
 =?utf-8?B?cXpoMy9BeXpzN0U3QjRnWUZqdjUxMVNBaW1MZHFwNjBDS2pHRFZ5MDVyb0Rv?=
 =?utf-8?B?SG11RW5SbkRlMkczT0s1S09BZ2c5NkZOOTdJdXhJQkVQRzEwbXhOSXMwWkdx?=
 =?utf-8?B?azl1eERyUEVTbEpUUndUSks2djRBejBXUFhPYmNZNlo0cm1iSy9VR25JT0M0?=
 =?utf-8?B?Z0crWFRCc3NQUlNIZUNIUlBYWmV3U3VkZmxZN0MvLzFWTmFIUVdPeFNsVzE4?=
 =?utf-8?B?Mlh5aTl0NVh5ZklTQmpsR2ZkNDNaOTVtaHNrNWVjM3lMVTYvak5GVW50dzRN?=
 =?utf-8?B?WkducU9sbURKdTJTaHRJbkcyYW1xbGJUMFZaZngyTVM5UTFSMnhkY0ZGWS81?=
 =?utf-8?B?cXZxaW5yUG1LUm0wSVhzT1plZjErUnZNcVVYalhuZFlaRGtFTm9ldDF0OEJt?=
 =?utf-8?B?Q21mZDFKSVF5UnhHWk9lUkJ4NjZkWnRVcGREYVYwUUVTbTBFeVhmeGVYaG12?=
 =?utf-8?B?WTE1cUxXL1lIUlhTYXRrUGRiMlFmdVNSWi9GZ1BoejQ3Z09XY1VQLzR2bEh5?=
 =?utf-8?B?NVp2WHBzSXhEcnMrdmhPSTNJNWpkUGxtYnl6dHRDVjVZQW8rNlRiZGJsUFI1?=
 =?utf-8?B?NXI3OEtPQ2JHOFVyUHFMb3Z5N1M0alNqY3NTQ2dzZllIazF3azhBTEZLUFF5?=
 =?utf-8?Q?qdeoRDxgfn3Gf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 450169df-1603-4e13-7a5f-08d9528613dc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 11:43:26.4705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4q51p8KULmj5in1dfsH/QYFfU2lwuKyP0D2RK5eVeI39mLxwwF/EGjnmiEKZ+4R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
 Jack Zhang <Jack.Zhang1@amd.com>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.07.21 um 13:00 schrieb Pekka Paalanen:
> On Thu, 29 Jul 2021 12:14:18 +0200
> Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>
>> Am 29.07.21 um 11:15 schrieb Pekka Paalanen:
>>> If the app happens to be frozen (e.g. some weird bug in fence handling
>>> to make it never ready, or maybe it's just bugged itself and never
>>> drawing again), then the app is frozen, and all the rest of the desktop
>>> continues running normally without a glitch.
>> But that is in contradict to what you told me before.
>>
>> See when the window should move but fails to draw it's new content what
>> happens?
>>
>> Are the other windows which would be affected by the move not drawn as well?
> No, all the other windows will continue behaving normally just like
> they always did. It's just that one frozen window there that won't
> update; it won't resize, so there is no reason to move that other
> window either.
>
> Everything continues as if the frozen window never even sent anything
> to the compositor after its last good update.
>
> We have a principle in Wayland: the compositor cannot afford to wait
> for clients, the desktop as a whole must remain responsive. So there is
> always a backup plan even for cases where the compositor expects the
> client to change something. For resizes, in a floating-window manager
> it's easy: just let things continue as they are; in a tiling window
> manager they may have a timeout after which... whatever is appropriate.
>
> Another example: If a compositor decides to make a window maximized, it
> tells the client the new size and state it must have. Until the client
> acks that specific state change, the compositor will continue managing
> that window as if nothing changed. Given the asynchronous nature of
> Wayland, the client might even continue submitting updates
> non-maximized for a while, and that will go through as if the
> compositor didn't ask for maximized. But at some point the client acks
> the window state change, and from that point on if it doesn't behave
> like maximized state requires, it will get a protocol error and be
> disconnected.

Yeah and all of this totally makes sense.

The problem is that not forwarding the state changes to the hardware 
adds a CPU round trip which is rather bad for the driver design, 
especially power management.

E.g. when you submit the work only after everybody becomes available the 
GPU becomes idle in between and might think it is a good idea to reduce 
clocks etc...

How about doing this instead:

1. As soon as at least one window has new committed state you submit the 
rendering.
         As far as I understand it that is already the case anyway.

2. Before starting rendering the hardware driver waits with a timeout 
for all the window content to become ready.
         The timeout is picked in a way so that we at least reach a 
reasonable fps. Making that depending on the maximum refresh rate of the 
display device sounds reasonable to me.

3a. If all windows become ready on time we draw the frame as expected.
3b. If a timeout occurs the compositor is noted of this and goes on a 
fallback path rendering only the content known to be ready.

4. Repeat.

This way we should be able to handle all use cases gracefully, e.g. the 
hanging client won't cause the server to block and when everything 
becomes ready on time we just render as expected.

Regards,
Christian.

>
>
> Thanks,
> pq

