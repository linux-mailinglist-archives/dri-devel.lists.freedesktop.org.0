Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E6898963
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 15:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E01910E2E8;
	Thu,  4 Apr 2024 13:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fym/7eFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2123.outbound.protection.outlook.com [40.107.94.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5209B10E095;
 Thu,  4 Apr 2024 13:59:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1srnyqeuOm/TxKoB7QKsGZB1NmWsrpPyxPN9+8B/jcSKLuwYQBW5xocZS926o3MPsZ4TsdYMjO9jRqL7jOotO5bcft2y3y/AstmK9GWMByHdxtVy5HpED8JGd67kejEmJnbscXvEco0gktotHUvo/Hfmg90hywNCPpXn0s0MIoPZDp0G6EIVBPv4fdjroaKBoBlZxbpLXbRNmjdIQgE5cl040OOQLO4z7DVqKn8H0yGVAqVmMArIqXfSS+AuVbOHV+l5LbA/kHJyJ4WGkGwWtn22S1hy0s8X97QaAh722lU872vgYMpcLwuKYO6uVPA7zEhFR1sYHUTPeYn+IJsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cMKLn9Zic/6gfJy+SyTK/aR23ecOHRHq9TDwuDu+oY=;
 b=RDFWjj4FpnJJFT9he+wn3AY7gdM+UFvO7PNi3krz1+ZntEYMw0PthZYLENExd8jkS/tj+7kzHlUOHl1+zPqt/zk+xfdpjZAn7Ue3VUOICBN6scu2y3y9Quu6VhLqlawB6VgauMevBKaz6huawDb+bVP8gBO7Yb2g226hg2L/aLafTTSb2p9gVqAmWUufkxB788AGBBLzmsNOMMM5p52n6eGIkcwHp/009Ffn6UcQcFsUHgRv5R8KejSUNEEs10m8kSrQDEAs3E3mnCsl+PBHKGK8oRRK5jTAxzt1XGMK0M0XUpkq4zoQS6NjhL8mijQQsbfCy/othlT1oLZHilKApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cMKLn9Zic/6gfJy+SyTK/aR23ecOHRHq9TDwuDu+oY=;
 b=fym/7eFWFFAPecB6KnXFZDnxpN0sjsO5js4DSimYTPFxjkFOvlvtKe6Ok/wvzdjCB2kGFmESAEdFm9dPw+Kg5Na86ihfl+1KDyG7uNyHTJtyhN9nYc7XB8+vdeBCSqCWJ6ml0Qz5TrCSRaBS+MowprVBnKEzFpvvhDe8n31HTNo=
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 13:59:07 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef%4]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 13:59:07 +0000
Message-ID: <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com>
Date: Thu, 4 Apr 2024 09:59:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
To: Pekka Paalanen <pekka.paalanen@collabora.com>, Leo Li <sunpeng.li@amd.com>
Cc: Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Chao Guo <chao.guo@nxp.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, Sean Paul <sean@poorly.run>,
 Simon Ser <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
 <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
 <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0282.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB9024:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8ZLA17a/LmDqZ+WJetkXAQi16QWRqcxEoP6mXpqW7naktvpR337yZVLYDiMLFMCwr4ZAUWGPouOxNR+cA0EuIA4MX0/eri/WdYvnKzliRedTnfCQte+7pbv4diD7wRi1j5s726RJSJHSU+PDg1ZyrLH9yYClYyCWNLfhytgs6z1r/sB+VWQzW+P7sDLM9SS24AZYLCg2OxSZmo8lDtLdl3OsoLhfuOHVn2/TMTWXUhwQxDM1hJp20CIxsptjiuH+iej8T+PR9kfoo/R2JN8imDyI99KVXDMnMcW7DtI3eOseOV/U5S2sKaj+I0PBZUFMfgcBclRnvwLmLgzI6S5dQtru0AJcK6zmXs9uWOGn568E8NBDXiOuVtyjqmQvhaqW3njW8YVF+DT0yctg04YiEzZ0lplt7wjdBzKNQRTn3yYbKxu696lDbc6WYYfx1uhjkNw1PMxgDCt26LTkZGIgX54CN7r0vvZYRvNM2wAjFGSFQZJ2vmJYfAx7tjEgJlPNxI+9gg8QlGX/L6p/2R2iaux/AhysmCdk1LpNDgZaddXNhVsoLYF+eO0EsD7yzNMG/5L6Kvs0y90180EGHbh27PHI1CGEqnIuBKPHD9VFUWmKlsioctVgveLnUbSZrvd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnBLcnlmNFQ2bE9qb3FCQmY0TlYwaS9OU09CR0FxWXVnemo2azRVS3VHTVBl?=
 =?utf-8?B?SFFGK1FROThIYmVxQjMrbmdGVm5IVkdTcDAvVFVxNUdTVSs1dmhZK3BYQ0pn?=
 =?utf-8?B?WHNHdlppZ2ZVWVU3WXVKd0xnQWoydTFJeWhaWmR4ZVZPVnl3VmNrQzZvOFdy?=
 =?utf-8?B?Um5LS25oSzNZRlFQN0RDZnh1cW9KK09tYmovT2YyQWJRWEhhQ2ljTGswbExX?=
 =?utf-8?B?U1FpK0Qza2UzSkwyRGpPV3RQUnJJR2RnUmlTNTk5VUZDNFFIT09ESmRPZlFU?=
 =?utf-8?B?d1F0QXNsdFNHN3l0TEkzWGdmUzRBdHhxUUFEcHJDamx6L0U3ZEE2b3VzRlRN?=
 =?utf-8?B?TnZSYmNpY0VHTzhsUi8yWlBDbzVZbGtvN0l3eUxHSllJc2FZK3dGVUtBRWJB?=
 =?utf-8?B?QXJOWW5Mb3NzcUhNa3dqWlJlUUYwblNmM2tVYW9najIra0dLR3ZtVVo4ZUJN?=
 =?utf-8?B?SzNKcTVjbU9QMk54NmxOS081SUpPSEN1WHR0WkU1UjJlRUtEb3k5ZWVxdXQ5?=
 =?utf-8?B?K21hMkhTL2xuUzBZYmxsUFFHMjVmemxuQ0U2RmRlQ2tRZEpSQ2hNamNtYWE5?=
 =?utf-8?B?MDVtbm8weEhDNTVDL1pJanJLdnFRR3lmd3drY2QwTnE4bEd6STY3dVZ2eWdo?=
 =?utf-8?B?dFFjTnhLZ1BjTVRiYk9Od0FPMVdHNXY0ejZPQ0pDTXU4cEJOWUYvN2VlSWty?=
 =?utf-8?B?Wk5xbmVuVXdiVXNab3JWdjVVTU0vNDY1c25zT2JFdStOanJreHB3cWI3ZTB5?=
 =?utf-8?B?YzVpVXBLL3NTVkNRZ0h2UHUxVHlRcjJydnJLN0pNRUR0TmVySnpkbHdrQlFW?=
 =?utf-8?B?OHVpMEx2b1JRbVh4MTFKdzV2bmZCQjYrT0FUQXhZL0ZPNU95TWhQRUwxMEtW?=
 =?utf-8?B?L0h3NTM4bVp5aXk4N0ljSzBCMEIwUkV2ZW5WL3RmUTFlM3RCbVpVbVZ4SytP?=
 =?utf-8?B?U3JFRXYwakRobkxtMGhHTHFTUWx5N1NwSG96ZFB2NXpPYzd6U1RBTzl3Qkl4?=
 =?utf-8?B?a3JVRENETlVBZE8zcVVsYy9GYUp0aUt5UE5WVTVpRnlRNG1HczRKZkRDaThU?=
 =?utf-8?B?c1lYYXJhWlJxaHVsWk9tU3ErU0JqeWw4a09iU3hiVWFpbjV1TEVXY25DOWJo?=
 =?utf-8?B?RWdrVlRrdXErNG82Szh5NHVUVzY3Yy9JYXZOdERUKzEvQWdCTE45VGh2OGVt?=
 =?utf-8?B?eitHMnhBUXRERGNnVVYrRCs2c1VqcXQyenQyek9zY29QTnhIVEhpUmJPb2Rh?=
 =?utf-8?B?d0pRNW9XakorbFRMWUQ0TGZhSENXc3pwUXd0aGdVSjI1a0NQL1NRaXExMERG?=
 =?utf-8?B?NlhHaktneXh4YW51U1ZBOHU5NkREV3J2WmJUZ2kyMi80RzdwWDFoUFZFT003?=
 =?utf-8?B?Rk9jcU14U0FTd2NrTHI1c3dBOWpvVDBWUE11NHc1OEZueUV4K2U3WktiTmJx?=
 =?utf-8?B?UHFMZVUyY1p6S0swbjFvVU5rYmFKNGZrMDdyZWdLODlUODhsOEprcGxmNGN0?=
 =?utf-8?B?NnF6YW5YTE9zd29lQXd6RHNTYlkrekhSempQY0pGK3U1Wm4yN2IyUENsR1Fs?=
 =?utf-8?B?c2ZPdTJWLzN2bVEzN29DemdCNExydENJdXpJMnZzTjErQnBpU1dJVDhUT3Ez?=
 =?utf-8?B?NFpOTnZ0TXJra3VHWjhpd3FvL1RMaEFCYmpYS3BTMm9ZalI0dkRjRXhTSm8r?=
 =?utf-8?B?UTQxNlJuNUlqcmpMOEV4amgybDlpYTI1M1hHaTI4QWc3ZUY1cG5uTGpMVlYy?=
 =?utf-8?B?VGZZb3VTbytjWmVwbzZKcXlCOWw0akdtd3llTkhRZHR4T2dKN0Z0Ui9XZjZq?=
 =?utf-8?B?NXl6UVE0RC9BNnlKQW1iNDh1ZFYwclJtVW9RUUYyMmdsU2txM2ZjQ2Y2c09R?=
 =?utf-8?B?OG05dmRLM1N1bEZQc3Q4amR6V3RWOFV5MWhWbWthSUFGUXhnZU1Ja05KZDBC?=
 =?utf-8?B?cHV0YXRrYk1ET2lZbkg0SmRLLzAvallwMU80UE5ydUQzVFN2UWlJblRCSzN3?=
 =?utf-8?B?clhpdGhlYWJMTko3L0Z1OHVmeEU0S2pPVi9GM0p5aEE5QnZMVkZ5Vmxlc3Bj?=
 =?utf-8?B?T3d3V24yWUFxckxkUjJxTHFmTDhqei9haGhhM0lYSTcwcnBGZWU0S25oTG4v?=
 =?utf-8?Q?6nTFjY8sjOPfMlrlzt5CRAMIX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4418ad6b-dd71-4a2f-4bc8-08dc54af6539
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 13:59:07.5860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFjInaH4wgRqA67Wol6P4WEE4K7x9dQ3eFJmBXIf74eoIw/TRfv0H3Ci/AnVE7ZRnmSvCFn1yPfiVwptDs2cdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024
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



On 2024-04-04 06:24, Pekka Paalanen wrote:
> On Wed, 3 Apr 2024 17:32:46 -0400
> Leo Li <sunpeng.li@amd.com> wrote:
> 
>> On 2024-03-28 10:33, Pekka Paalanen wrote:
>>> On Fri, 15 Mar 2024 13:09:56 -0400
>>> <sunpeng.li@amd.com> wrote:
>>>   
>>>> From: Leo Li <sunpeng.li@amd.com>
>>>>
>>>> These patches aim to make the amdgpgu KMS driver play nicer with compositors
>>>> when building multi-plane scanout configurations. They do so by:
>>>>
>>>> 1. Making cursor behavior more sensible.
>>>> 2. Allowing placement of DRM OVERLAY planes underneath the PRIMARY plane for
>>>>     'underlay' configurations (perhaps more of a RFC, see below).
>>>>
>>>> Please see the commit messages for details.
>>>>
>>>>
>>>> For #2, the simplest way to accomplish this was to increase the value of the
>>>> immutable zpos property for the PRIMARY plane. This allowed OVERLAY planes with
>>>> a mutable zpos range of (0-254) to be positioned underneath the PRIMARY for an
>>>> underlay scanout configuration.
>>>>
>>>> Technically speaking, DCN hardware does not have a concept of primary or overlay
>>>> planes - there are simply 4 general purpose hardware pipes that can be maped in
>>>> any configuration. So the immutable zpos restriction on the PRIMARY plane is
>>>> kind of arbitrary; it can have a mutable range of (0-254) just like the
>>>> OVERLAYs. The distinction between PRIMARY and OVERLAY planes is also somewhat
>>>> arbitrary. We can interpret PRIMARY as the first plane that should be enabled on
>>>> a CRTC, but beyond that, it doesn't mean much for amdgpu.
>>>>
>>>> Therefore, I'm curious about how compositors devs understand KMS planes and
>>>> their zpos properties, and how we would like to use them. It isn't clear to me
>>>> how compositors wish to interpret and use the DRM zpos property, or
>>>> differentiate between OVERLAY and PRIMARY planes, when it comes to setting up
>>>> multi-plane scanout.  
>>>
>>> You already quoted me on the Weston link, so I don't think I have
>>> anything to add. Sounds fine to me, and we don't have a standard plane
>>> arrangement algorithm that the kernel could optimize zpos ranges
>>> against, yet.
>>>   
>>>> Ultimately, what I'd like to answer is "What can we do on the KMS driver and DRM
>>>> plane API side, that can make building multi-plane scanout configurations easier
>>>> for compositors?" I'm hoping we can converge on something, whether that be
>>>> updating the existing documentation to better define the usage, or update the
>>>> API to provide support for something that is lacking.  
>>>
>>> I think there probably should be a standardised plane arrangement
>>> algorithm in userspace, because the search space suffers from
>>> permutational explosion. Either there needs to be very few planes (max
>>> 4 or 5 at-all-possible per CRTC, including shareable ones) for an
>>> exhaustive search to be feasible, or all planes should be more or less
>>> equal in capabilities and userspace employs some simplified or
>>> heuristic search.
>>>
>>> If the search algorithm is fixed, then drivers could optimize zpos
>>> ranges to have the algorithm find a solution faster.
>>>
>>> My worry is that userspace already has heuristic search algorithms that
>>> may start failing if drivers later change their zpos ranges to be more
>>> optimal for another algorithm.
>>>
>>> OTOH, as long as exhaustive search is feasible, then it does not matter
>>> how DRM drivers set up the zpos ranges.
>>>
>>> In any case, the zpos ranges should try to allow all possible plane
>>> arrangements while minimizing the number of arrangements that won't
>>> work. The absolute values of zpos are pretty much irrelevant, so I
>>> think setting one plane to have an immutable zpos is a good idea, even
>>> if it's not necessary by the driver. That is one less moving part, and
>>> only the relative ordering between the planes matters.
>>>
>>>
>>> Thanks,
>>> pq  
>>
>> Right, thanks for your thoughts! I agree that there should be a common plane
>> arrangement algorithm. I think libliftoff is the most obvious candidate here. It
>> only handles overlay arrangements currently, but mixed-mode arrangements is
>> something I've been trying to look at.
>>
>> Taking the driver's reported zpos into account could narrow down the search
>> space for mixed arrangements. We could tell whether underlay, or overlay, or
>> both, is supported by looking at the allowed zpos ranges.
>>
>> I also wonder if it'll make underlay assignments easier. libliftoff has an
>> assumption that the PRIMARY plane has the lowest zpos (which now I realize, is
>> not always true). Therefore, the underlay buffer has to be placed on the
>> PRIMARY, with the render buffer on a higher OVERLAY. Swapping buffers between
>> planes when testing mixed-arrangements is kind of awkward, and simply setting
>> the OVERLAY's zpos to be lower or higher than the PRIMARY's sounds simpler.
>>
>> Currently only gamescope makes use of libliftoff, but I'm curious if patches
>> hooking it up to Weston would be welcomed? If there are other ways to have a
>> common arrangement algorithm, I'd be happy to hear that as well.
> 
> A natural thing would be to document such an algorithm with the KMS
> UAPI.
> 
> I don't know libliftoff well enough to say how welcome it would be in
> Weston. I have no fundamental or policy reason to keep an independent
> implementation in Weston though, so it's plausible at least.
> 
> It would need investigation, and perhaps also extending Weston test
> suite a lot more towards VKMS to verify plane assignments. Currently
> all plane assignment testing is manual on real hardware.
> 

It looks like VKMS doesn't have explicit zpos yet, so someone would
probably need to add that.

https://drmdb.emersion.fr/properties/4008636142/zpos

Harry

>> Note that libliftoff's algorithm is more complex than weston, since it searches
>> harder, and suffers from that permutational explosion. But it solves that by
>> trying high benefit arrangements first (offloading surfaces that update
>> frequently), and bailing out once the search reaches a hard-coded deadline.
>> Since it's currently overlay-only, the goal could be to "simply" have no
>> regressions.
> 
> Ensuring no regressions would indeed need to be taken care of by
> extending the VKMS-based automated testing.
> 
> 
> Thanks,
> pq
> 
>>>   
>>>> Some links to provide context and details:
>>>> * What is underlay?: https://gitlab.freedesktop.org/emersion/libliftoff/-/issues/76
>>>> * Discussion on how to implement underlay on Weston: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1258#note_2325164
>>>>
>>>> Cc: Joshua Ashton <joshua@froggi.es>
>>>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>>>> Cc: Chao Guo <chao.guo@nxp.com>
>>>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>>>> Cc: Vikas Korjani <Vikas.Korjani@amd.com>
>>>> Cc: Robert Mader <robert.mader@posteo.de>
>>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>> Cc: Sean Paul <sean@poorly.run>
>>>> Cc: Simon Ser <contact@emersion.fr>
>>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>>>
>>>> Leo Li (2):
>>>>    drm/amd/display: Introduce overlay cursor mode
>>>>    drm/amd/display: Move PRIMARY plane zpos higher
>>>>
>>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 405 ++++++++++++++++--
>>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
>>>>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
>>>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  28 +-
>>>>   4 files changed, 391 insertions(+), 50 deletions(-)
>>>>  
>>>   
> 

