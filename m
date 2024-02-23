Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C732D860E0C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 10:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7187410E00A;
	Fri, 23 Feb 2024 09:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yOO9OrJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8788D10E00A;
 Fri, 23 Feb 2024 09:34:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kx4CaQvqOi7o1jkBmklNi1K5+5MGlK1sSMLW5HAKmK9/MRGUO1CCfdYEcmaYbTQkLWG9+WX30kkPJ7uil/hcldsxHd2ve6MLGFSZJ6rS469Wl9oYL6ScHM3HM3qnjnuCv7/wj5bJQ+ik3hyOFaO3KFugZWVNDsAs9XRELssVIp4u+K6pqcESOvDy4D4LnU7vy6bB5CJiKBcztd3PrmAdDEDpwQETuKy1pw/RarqMHYFDlzrnJwJLJZoawG4KKW1COGyFDRnY7TubVYKihrriutv8fuD3AhSk+sEcey69MhVl93QwV2i56noR4mSJuh3L6gvjtO6qIY4lHSDKV44Jrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EZajYVAio6fqbpQ0RIoC0iG1aiGqiuIfppxw2C7S8U=;
 b=TdrR7KH4NNUryCYqC1YZW1J5bVlpxl+GQymryx9xigT6yJ5ninQ6WA6hbqemI1ERrGRgQnKqu3OG4SJ6Np7BTxqF69oIEdAj3QV+OKWWrB/vSqS63LLvZFn+8hA1bxfE/jxcX3kmhM6MGS3/EhCQLWF95jLrouKM8CI2efZeJkDWvaZ9mUyWLo/8OmjOnpc5TtNFL9sdas4AWYlVr7rT9WQeyWHLc8rwhc/goXsXi1xmNVwJIajE0N2e0tp77W9IkqqcvcfOYL3ya1v+EmzyDWYZaTkKibYaT92OpuUYtPNPF9Wohyws2e6oatq2WyYc5VXXn1zTwWryagbc6eq7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EZajYVAio6fqbpQ0RIoC0iG1aiGqiuIfppxw2C7S8U=;
 b=yOO9OrJiQ2igK0HoCs6CAO1oI6kFsDuNJOemkcj3OGcxrawB8eN/cVh2iWkMn2gaihEas7FrEifVU/Y8lR/QHmFxpPQbbt1aE30iSevp9S/Sy3o6GXmplaoOuZxB06VnwqW7xbUGDy8Qe9P13izxxRoSN7mpopQrEJqfUnViJNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8359.namprd12.prod.outlook.com (2603:10b6:208:3fc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Fri, 23 Feb
 2024 09:34:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 09:34:53 +0000
Message-ID: <84fa5bc1-6b4d-4d82-844a-8070d4bd78eb@amd.com>
Date: Fri, 23 Feb 2024 10:34:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: Refuse to create a KMS FB for non-P2P
 exported dma-bufs
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240222172821.16901-1-michel@daenzer.net>
 <3156ea34-0655-4b0f-9438-9113fb714373@amd.com>
 <2d7632f0-0783-4d82-9d81-dd6bd52d5db6@daenzer.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2d7632f0-0783-4d82-9d81-dd6bd52d5db6@daenzer.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a06d55-a59d-4e7c-364a-08dc3452b084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pY+3H+Fcr/0832VKAMoaljp2l+Hb/G6R79oavysi9kAcN+5ovynvVgY+k43BRRd2Gct+8zYKcJOLW6L54uFt/Um9k5QMf2+r7Eb0IhgIiIyba9vSe2hd/ja+Jb0ZyaBKgaH8nt7AvdBK7jjvW0+eACkaaK8At9lJLCOPUpn4jY1+jNHrkqAiVhfFfGW8RZTGU4D+cQChwvg2PUrjBOHLZV2GqqcPFgPwLLcZBnLbHWv+TCVMe8A/ohlvtjP37tirsGIfvmxgt8ir7gOTP+PrHjsKg5T8Eyl6X8h8PQsq1AV1PCMJrVnnS7kIaZQOBLk/U1o3L/jV7vuOcfGF11Halv+aJiDfkm2ETPUxKCTZje1xfNb2T3ikYsvFfpaHwGZWY1Wu6dHniTViEMfQPoiEbA0LqIhUa2lwWc3C+w0gAZJ2liepXNX6gQ74hRxFjcqxClaaHBNeqFX1W+sc2zA/ZSdqHSjqtFR4lcQRrwkE1Lojdp57RMcumzEeKbBGDmqfTfuyWe+hfVk1/gTBPKi3AQhyIDqwWPv25hYrVO48ZIQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGJBWDA4U25nQXJjL2ZIaGU4MkVFZ2NYUzBEOG9CWU5KRm9lRHRNNXZmRGlV?=
 =?utf-8?B?Y1hhR1RxSFBxbWZHVWZzbkx0dWpvODl1bkVVOXlvN0RtQk9lNUJtWG9JRGhR?=
 =?utf-8?B?TGJOejlzL3hzV0FUQ21uczZKWGZGSjl3VXQ3UGpZL05FMzlVMHFUeVpiVWpo?=
 =?utf-8?B?ZFhKVlhBKzBHNjJNU0VZM2MrQlAxMXdiaFFadEttRDNQVXdYMjRYNkNWUjRr?=
 =?utf-8?B?SUZ6aFQ3SUVIandsNEw4WjAvdkQwbW9OR2p1Qm9lSGNnZlJwRXJLZERJK0VM?=
 =?utf-8?B?Zk5Da3RCdEo2VW5Vdk5hUjBoMEc5VmQ1MUtKbHNrWmZQdldJUis4VStWdlhn?=
 =?utf-8?B?cDFXc1FHVDZUekdFckp0L2E4bjhhaVk5c200NzFqVW05V1ZBUHdiMkdBd3NB?=
 =?utf-8?B?SGk0TjNaWVAvOEc0Wm05bXhmMkhxYWxzQm1Bd2g5RURid2ZzcHF6M2pDM0lX?=
 =?utf-8?B?R29VZHNrWk9RVDkydE03YVlHbnpBRDJoTmZYMjJsSmNWVzhFYjJ0ekM5T291?=
 =?utf-8?B?bFFGSlVCOHF1TjhqSEo1MEYxcEtCRXkzUjArcS9ucTB3Qnl0L2xQV1BOTmZz?=
 =?utf-8?B?Mm5xdzF5djNZMzgrUjM3RE5vcTZrV2g2RDVFQ3ZBRzBNazBsYU1PMTRHMjNG?=
 =?utf-8?B?V1hFZGhBLzN6VjJNU0ZQSm5XMlZKQlhsK0M0NzYyK0RQRWJ4aFFEUFN6WDMv?=
 =?utf-8?B?Z3A0amNtOGtydk1rSUF6STlQZmFmcExGTFRIYXNxLzNCK25LOVZwUkgxUjI5?=
 =?utf-8?B?eUJjWTl3K1ZZQ0MwSFRkOEt0cDVSM0ZNeFIyQnFXd2dxL2IyeEh6ZlRyYzh6?=
 =?utf-8?B?dWRpV0RvRUU5NG9jTU9ZTGVnRW1nVkNrZUxjTTZLNU5BZHNWU3JtWHIrdGNO?=
 =?utf-8?B?OVBJREc5aDhKTzM2Wi9WL0pYWkJZNTdTOUZXbzc4SktjdklsdmZRdG5QWmxT?=
 =?utf-8?B?a0wrTGRWZElGRGlkYkNYeDlQK0ptb1c3bk5ZY2E4cjE0NzFmY1lzeTJ5U0JE?=
 =?utf-8?B?U2o1c0xtbUpUSW1pSjNWYndVZ1ppaWtDMnpXWnhWak5CUHBJazUrRVhiVnht?=
 =?utf-8?B?T2t2Q0x1Qk0yQnorditxNTBmbUJXZmVrQkYwM295NzZhQ3JMU2twdU9seStE?=
 =?utf-8?B?OWtDelRjZU1jcnlOY2prM0UrWnpYMG9YSVR4dmZJU3poVzJJNjlKaU5CRGdE?=
 =?utf-8?B?UkhlcW9tU2xpY2JTWVIxU2R5RG5QZnduT1RUZnRXOXVHVGJOcWEzcWh4b01Y?=
 =?utf-8?B?Ry91K2JnemxzSFBVZVNrL1JRQ0QxelpVZHVRUk1rOXYvSDlwVi9TbTVJMjFa?=
 =?utf-8?B?UzNsdkFFNCtrbzhqZ0hCZEVsRG9WVHUySENhNzFpWXNKY2JadVBlNWphWngw?=
 =?utf-8?B?UWhLYnR0UGxDd0FCREVFUVRabzJDbmdrVkNLM0d0dThMajlpakJHeUdpckQ3?=
 =?utf-8?B?dWJrbVc0SjlDcktwUFpxN09SNFlmdVRsVXkrWkJwdzVtOWRrNG14MXlGa2Nm?=
 =?utf-8?B?Mk1Ddi9vMEV0emJyOUVId3ZuanhldlRCSEp4THhROW5ORVpMaFNYZEZvYXUw?=
 =?utf-8?B?dHMwYjVmbUVQUVpnSWJVUTFQQmZSYmZ4WVNZZUExaktqdUhNeFBTVkhOQ2tm?=
 =?utf-8?B?VEFrTGxBR2VQS0xjY0YxSTNZbDhReFpyTjVjM3g2VGs5eWVqMnAwZUZLZFow?=
 =?utf-8?B?N1dMUno0bnI2ZEVXV21mTGJZOGFMM0ZUbkZTbk9MKzMwWXFnUUxEN09UelBy?=
 =?utf-8?B?dUNJRlc5QVNjVmNTMFdVQmNuQmJ2TWFpK2FZNEwyWnVNZHlVNzlzaERHTGN1?=
 =?utf-8?B?UzNnYW12c2MrWFh1bFBpRnQ5cGs1aDNLS28yRkV6UUVEWGhXbUhVbWVKa0Jm?=
 =?utf-8?B?MVRiWUU2V0pockJDKy9ESDdmQ2tBbldtTXd1N2VObHJKK0JiSlBqOGhPVEZu?=
 =?utf-8?B?NEswVXBVdURETnFsRVBrWXo3QS9tS3Q3d2psdUJDRE9RZmJ4allMaHN6Q1g2?=
 =?utf-8?B?aGVhODJjQitoUzVDMURNUHpkWXlLTHl4VmkzWis3UjV6NHNBeVlReXJRcWlp?=
 =?utf-8?B?SFdxUitzSWhmU0FCaVFjYjJuWlZkYUFXWmhibGpGUE0vcVU2S0Z1czMrTVA0?=
 =?utf-8?Q?wSduguF/ZBvKK5q2vfOzkzjRQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a06d55-a59d-4e7c-364a-08dc3452b084
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 09:34:53.5596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJkAeUHtkYkicXi0qc27THCvopZQu6T5gre+KV7rHpyhBLAmbWUoKGzIXjX4f2HW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8359
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

Am 23.02.24 um 09:11 schrieb Michel Dänzer:
> On 2024-02-23 08:06, Christian König wrote:
>> Am 22.02.24 um 18:28 schrieb Michel Dänzer:
>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>
>>> Pinning the BO storage to VRAM for scanout would make it inaccessible
>>> to non-P2P dma-buf importers.
>> Thinking more about it I don't think we can do this.
>>
>> Using the BO in a ping/pong fashion for scanout and DMA-buf is actually valid, you just can't do both at the same time.
>>
>> And if I'm not completely mistaken we actually have use cases for this at the moment,
> Those use cases don't have P2P & CONFIG_DMABUF_MOVE_NOTIFY?

Nope, we are basically talking about unit tests and examples for inter 
device operations.

Those render into a shared buffer and then display it to check if the 
content was rendered/transferred correctly.

I'm not sure if we still do those test cases, the last time I looked 
into it was before P2P was even supported, but I also can't rule it out.

> (As discussed on the GitLab issue, AFAICT P2P could be made to work even without CONFIG_DMABUF_MOVE_NOTIFY, by pinning to VRAM instead of GTT for dma-buf sharing)

Longer story but that is something intentionally not done.

>> only as fallback but it would still break existing userspace and that is a no-go.
> I'm obviously aware of this general rule. There are exceptions though, and this might be one.
>
>
>> So rejecting things during CS and atomic commit is the best thing we can do.
> It's problematic for a Wayland compositor:
>
> The CS ioctl failing is awkward. With GL, I'm pretty sure it means the compositor would have to destroy the context and create a new one. Not sure about Vulkan, but I suspect it's painful there as well.
>
> Similarly for the KMS atomic commit ioctl. The compositor can't know why exactly it failed, all it gets is an error code.

Yeah, but that is not because the kernel is doing anything wrong.

Sharing, rendering and then doing an atomic commit is a perfectly valid 
use case.

You just can't do scanout and sharing at the same time.

> And there's no other way for the compositor to detect when both things can actually work concurrently.

That I totally agree with. And IIRC we already have at least a query for 
the buffer placement. E.g. you can already check if the BO is in GTT or 
VRAM and shared.

What's missing is exposing if the device can scanout from GTT or not.

It's just that blocking a valid use case because a special combination 
doesn't work is not going to fly I think.

> Together, this means the compositor always has to assume the worst case, and do workarounds such as using the scanout GPU to copy from the scanout buffer to another buffer for access from another GPU. Even when direct access from the other GPU would actually work fine.

Yeah, I think we can avoid that. I'm just not sure how to do it in a 
driver agnostic way.

Regards,
Christian.
