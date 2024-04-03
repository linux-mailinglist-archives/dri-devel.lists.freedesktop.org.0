Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414F897ACD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 23:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC74E112F2E;
	Wed,  3 Apr 2024 21:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eyp9Yq06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2093.outbound.protection.outlook.com [40.107.92.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D39112F2E;
 Wed,  3 Apr 2024 21:32:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFMxvl+0qGcOusb2oE28E/tqnlQ57+F988TZi2dNwu4vjx+YaK7zpRjf1UVxLh0gfQ/17fWPQ/KxQv7QsYWe0+hVBt8mFyqjyfd0zTkbapEBihLRNDnExvjwY2+fzmpp+x68VpSprH31888S0hmHT/isRI9vV4eH7WuzSS5r6mhXw7iyuSVU3HcMr2chR02pFAhfow5Ve883gMD91it08ZTAYMGS8ki5zOFQWa6anAoykvyzTpms+jxxF0frYJPi90gwcvy8ngiTON13TUxuXdDJvpU329N4hiZNEtfeTFzpHTEM2BapReAA5IaDebz9ZjvU84TxLPbj2RJ4ia3RDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vlu9Zt5tey/A91cO2/LonOCiL4C8QXgre43blEctDdA=;
 b=JyYrxdjBS5whdcwQbFsPl6CuNhME7ZwxonbJaeQ7/ggTKLAvZXP8TmuSnc04n8QGtzlIU8GcPw8m8UZex4MPe6B6m5ohIVP3NeyIOKbLiCn5zCNuEa/MYbGTb7jrmKirw2Bv4JSgt96z6xBHL3WKaDdYIltusBv+iTMGeMYtiuG6DHCyeDbbbKqZDVOi94nTOSuW0U0kMoCbICF8GqZi1Ibmp0ehrSxkJGe7H0LbP4EUt/knxB8AAveTV4GpzOXBQiiP1zxIdc8HRz6TkychrnEXZ9uEq7quwcKUPz6+QWyZyt4COn+DwgYm5hXXREP98S8wOXfV+FCHHk3cfJ44OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vlu9Zt5tey/A91cO2/LonOCiL4C8QXgre43blEctDdA=;
 b=eyp9Yq06rCUuANR4KEh6cg2xS7pGsdB/vG45lSw6HN//AYhnSgXm92dSSYDuxwrDmwINnuqSBTtqhQdKKpE/RVDv05b4WD2e5eZ6WiuVdStM/qxr4qXDle5iQnFKf57c1hU9ym52TNbbJxc3WYOGhuX4f3DdCbsW+utaX16sGQc=
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Wed, 3 Apr 2024 21:32:49 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::f86e:7f84:27b2:f80]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::f86e:7f84:27b2:f80%7]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 21:32:49 +0000
Message-ID: <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
Date: Wed, 3 Apr 2024 17:32:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>,
 Robert Mader <robert.mader@posteo.de>, Sean Paul <sean@poorly.run>,
 Simon Ser <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240328163311.34b58b39.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0219.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::16) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|DM4PR12MB8570:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bH4O7r9H5H1CPXUuZaJoLAdQ4UvFEQqLXEPGp22v/1V/XbaBRzzN16Xuj++/7JPLuBX7cPAHcAV9a7phb4gJDGnI6vKiicDovzpwdf6scDdoYzvQUYLXTdzbbwQYrGZHVUB0ekVeID4m8comJUV4QoZHuiLtVYhdHcs9mh/UMmhjWGZGTMVmVQS13cr+mOZ8hOwz4vzfSKbN6xkiLBQY+mSiiW+jeuB4G0kk6POj1XZ9Molj8WD09vpWN1gj+SncAAcRmXyqTGYLsX3DyyBs5+R0KL2i6JGY06xgBelSe9B6s7Sdrv0XUdM5tX8v+m0fuP20k8NXOLVt94cLvKFhUSJIlTM3B7zd8CtEBx0meVSDBd6o5sb6NgK8cuu1HuHdDJFSvlg1hQA7aOHO9K8JQ1hFjVcEvKr6ayTzdZ4KjYTY0yylpNStcsPYl7ISxc99jYyJqqMgoPQ5ZBW5zRIUKyslhZKbWFkN9r7so9nmOd/qO1K3OMTh5S5C4fBbevWJXKA+6lR2sNk8PkFc12DOpNSUlR2/l60QG1+Dc3aX2ETsWD5GDRpyg+M2jkuOBFavOIeNnJxQ7GUycaMevwPlc6vHqUzdJ4PO6l96znqGsvjz14KyyTlUYInjR+Lrj4iD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkRzb2h0ZUtja2tDd2NpTHpVMm51czhEaTQvVHhNUWJQRHRLOUMzZ1U3b2ti?=
 =?utf-8?B?Z2dWTEplSHlQNDBCeVpvRmJVcVNWcGphQkY3OGh0SzI0d3pZU3Q5Uk5WZFRh?=
 =?utf-8?B?WHI2Mmd6eUh3Y3NqZHNLS2xNUU8xVTkzTmZCbVQzWTBqY21nWjdkR2l5cnNH?=
 =?utf-8?B?SEp1bXFJZmp1akxHb09xU3p4ZDJNeFRaQ1NVR3owbG5XZk5xcnU1bzhINEtY?=
 =?utf-8?B?dTk5N002dFR5Q1Ftdnd4WnR2YTh4WkQySUxIc0hhRCtUWmNTUE52eUQvTk9k?=
 =?utf-8?B?N0t2VWVZUDQ3RG5JbzB6Njgvd2VYb3llUFhSdVl4NWdvU1ZaaG5KZUlhSXZL?=
 =?utf-8?B?RnV2alZTZHlHYmJjYWJqdkx2aysxVTBaRGgrU0NwN0tiVVE5b3pRNUU3WElQ?=
 =?utf-8?B?MmJFRFkySS9Tb2V1aTFYYkZFLzROMUZUTWZGdCsxemRzVW5XNml2VzMwZFlZ?=
 =?utf-8?B?clBvdFkzcXpTY2RWNDJvT3dxb3lyZFQ5WElxdXhEdWpXVzZzSWVlZmdOMWhN?=
 =?utf-8?B?U0xjSzJTdGdaOTJpRWJXdmFLOEc3cGE1RnU3SWtiRlIyYUVTUjM2RzVJcjY3?=
 =?utf-8?B?YWRrTWFqTmEwdjkxbDN3WXhtcVVCbm1KRE1xRGE4dDI0MUYzdmZXWVpEbkRQ?=
 =?utf-8?B?RjBEMHU4ZmwrNFR2TUEzN0FZVDY4Ujd0UTlJT2txMy9XUDNMaXpseE9EMnRo?=
 =?utf-8?B?OUpFZzNuOGM1OUtZbEVDSzB2WFJxM3cyQXFnUENmNEs0dXVoTkR1QnNHM3kz?=
 =?utf-8?B?NGZiNVQ5M242VTZWZFY1SGZCcWNTZmI0QUVZVVJYMlhvYjJyN0J5K0JTejFF?=
 =?utf-8?B?eWtNd0lmYWlNMEVIUFdQb0NrazFETWdidTJmM1EyR2pkbWpLanFtTGZybDNY?=
 =?utf-8?B?S1QrTmZtR3g3M1kzV0ROMThnOGp1VnhKaUF3d3VQQTR4WWwxK2tDaWw5L3Zl?=
 =?utf-8?B?MnVPS2c3RmNFWmZsVklFQlE3YjJZaXY0cmQ3MUswQkJHWUpCam9mUlJiWDBN?=
 =?utf-8?B?Y3RsRGNFR2pKZ21KbzkrbWpoVjhMSlhTQ2Q3UFdTV3U5MFdkbmZSTFNiYVRn?=
 =?utf-8?B?QldaSitwbUVJWEF5RkVHOUNDd0RqaWY3K25ncUZVRFhOc2pGSGRpcWNnNENI?=
 =?utf-8?B?Q0lzSW5wbmpkU2VRdVc1M0tRbnh6TnN1NUVPc2NmMGlPM2VmYmpWVnRwbWRH?=
 =?utf-8?B?SUVMYnNKblRVcVBxK2VHTEtjdE1yM09ud3ZaekdxWTZOTUhPVkRQd0l5WDlw?=
 =?utf-8?B?dHNNL1dYT0F0ZVZsc2U4L0FmTllxWFo3WmI2RFdmSjhkL3A0UjFFbnJSOUdl?=
 =?utf-8?B?amFzZHR0QjVPVjZzUE9JVVphYVZ3KzNzenhBbzV2alY1SXdzWnZuWHZEbXRN?=
 =?utf-8?B?K3p2blhQVHFrcUx2S2UzUFZPOGhXQmhIK1BJd3Uxc1pSWUpCV1lGc1ZZWlps?=
 =?utf-8?B?VHo4aDllWVFRMTZ5RisrVXVDMElGUGFQZ2x5OTZSNndqQVh0dlFPSzhZUGJx?=
 =?utf-8?B?c3BEamM4d3FzVHduSUFIZWtsOXByd0dOQ1h3ekt6UzZaOC9tdnAzT3hPdGVI?=
 =?utf-8?B?NGk4b3hNZThDVjZTZGh3b0pNcStEZm5GbDlDejBmV2lHRmhjRG10VlBhYndw?=
 =?utf-8?B?aXZaMTU5RnJHMDMrSGs5SXNzRldrRzNoMnJHSEtJYTBzUHZBa2NYbDFocjJO?=
 =?utf-8?B?Z1loakpTeUV4Q21MWHdJK1RzVlJDMVJVQUliMUNBWWxoaGFTN1VaaE94cEh2?=
 =?utf-8?B?dGlFYzV0QmNHeEc4TXRyQkR1ZzN0OXNucms2L1lPZFoxQkppOXVLRWpJVnRs?=
 =?utf-8?B?SVNnY2F4Qi9kUHkvN0pkMkpoQUdOdGl2Y1pRWk5tcmlRNUp4KzhTMVpDeUYx?=
 =?utf-8?B?bzVEczVtSW1PWDEvTG1hZ3RINStQTDlNYytDQW9pVEdLYk40eEw0d0dmbGk1?=
 =?utf-8?B?U0ZQckdLODNHUlU3NC9FUkxDZlUzV20ycHpWL1JkS2E1cWQ1QVNLN08vU3JN?=
 =?utf-8?B?MkhRd2VNRmVBQkNMK3Y2Q3dPZFFuLzh2blJtRXQ4aldmZDBucUhuTkJyYllF?=
 =?utf-8?B?TjZ2M1djZmZjYlRqcXNnQ2RsZ2c1SGYweXNIN2Z2bGdwbjFmYkNaaHBkNnhu?=
 =?utf-8?Q?qu8yakPx0xrfMO0zOsXgsDCC+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec634c8-ae86-4ae7-3585-08dc54259c10
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 21:32:49.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzLbPz/Nok7VTBip9w9Gl6BVTv5Ymxzd6/vkyCcktTwgdS/41teA7C9xhYgmoeuk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570
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



On 2024-03-28 10:33, Pekka Paalanen wrote:
> On Fri, 15 Mar 2024 13:09:56 -0400
> <sunpeng.li@amd.com> wrote:
> 
>> From: Leo Li <sunpeng.li@amd.com>
>>
>> These patches aim to make the amdgpgu KMS driver play nicer with compositors
>> when building multi-plane scanout configurations. They do so by:
>>
>> 1. Making cursor behavior more sensible.
>> 2. Allowing placement of DRM OVERLAY planes underneath the PRIMARY plane for
>>     'underlay' configurations (perhaps more of a RFC, see below).
>>
>> Please see the commit messages for details.
>>
>>
>> For #2, the simplest way to accomplish this was to increase the value of the
>> immutable zpos property for the PRIMARY plane. This allowed OVERLAY planes with
>> a mutable zpos range of (0-254) to be positioned underneath the PRIMARY for an
>> underlay scanout configuration.
>>
>> Technically speaking, DCN hardware does not have a concept of primary or overlay
>> planes - there are simply 4 general purpose hardware pipes that can be maped in
>> any configuration. So the immutable zpos restriction on the PRIMARY plane is
>> kind of arbitrary; it can have a mutable range of (0-254) just like the
>> OVERLAYs. The distinction between PRIMARY and OVERLAY planes is also somewhat
>> arbitrary. We can interpret PRIMARY as the first plane that should be enabled on
>> a CRTC, but beyond that, it doesn't mean much for amdgpu.
>>
>> Therefore, I'm curious about how compositors devs understand KMS planes and
>> their zpos properties, and how we would like to use them. It isn't clear to me
>> how compositors wish to interpret and use the DRM zpos property, or
>> differentiate between OVERLAY and PRIMARY planes, when it comes to setting up
>> multi-plane scanout.
> 
> You already quoted me on the Weston link, so I don't think I have
> anything to add. Sounds fine to me, and we don't have a standard plane
> arrangement algorithm that the kernel could optimize zpos ranges
> against, yet.
> 
>> Ultimately, what I'd like to answer is "What can we do on the KMS driver and DRM
>> plane API side, that can make building multi-plane scanout configurations easier
>> for compositors?" I'm hoping we can converge on something, whether that be
>> updating the existing documentation to better define the usage, or update the
>> API to provide support for something that is lacking.
> 
> I think there probably should be a standardised plane arrangement
> algorithm in userspace, because the search space suffers from
> permutational explosion. Either there needs to be very few planes (max
> 4 or 5 at-all-possible per CRTC, including shareable ones) for an
> exhaustive search to be feasible, or all planes should be more or less
> equal in capabilities and userspace employs some simplified or
> heuristic search.
> 
> If the search algorithm is fixed, then drivers could optimize zpos
> ranges to have the algorithm find a solution faster.
> 
> My worry is that userspace already has heuristic search algorithms that
> may start failing if drivers later change their zpos ranges to be more
> optimal for another algorithm.
> 
> OTOH, as long as exhaustive search is feasible, then it does not matter
> how DRM drivers set up the zpos ranges.
> 
> In any case, the zpos ranges should try to allow all possible plane
> arrangements while minimizing the number of arrangements that won't
> work. The absolute values of zpos are pretty much irrelevant, so I
> think setting one plane to have an immutable zpos is a good idea, even
> if it's not necessary by the driver. That is one less moving part, and
> only the relative ordering between the planes matters.
> 
> 
> Thanks,
> pq

Right, thanks for your thoughts! I agree that there should be a common plane
arrangement algorithm. I think libliftoff is the most obvious candidate here. It
only handles overlay arrangements currently, but mixed-mode arrangements is
something I've been trying to look at.

Taking the driver's reported zpos into account could narrow down the search
space for mixed arrangements. We could tell whether underlay, or overlay, or
both, is supported by looking at the allowed zpos ranges.

I also wonder if it'll make underlay assignments easier. libliftoff has an
assumption that the PRIMARY plane has the lowest zpos (which now I realize, is
not always true). Therefore, the underlay buffer has to be placed on the
PRIMARY, with the render buffer on a higher OVERLAY. Swapping buffers between
planes when testing mixed-arrangements is kind of awkward, and simply setting
the OVERLAY's zpos to be lower or higher than the PRIMARY's sounds simpler.

Currently only gamescope makes use of libliftoff, but I'm curious if patches
hooking it up to Weston would be welcomed? If there are other ways to have a
common arrangement algorithm, I'd be happy to hear that as well.

Note that libliftoff's algorithm is more complex than weston, since it searches
harder, and suffers from that permutational explosion. But it solves that by
trying high benefit arrangements first (offloading surfaces that update
frequently), and bailing out once the search reaches a hard-coded deadline.
Since it's currently overlay-only, the goal could be to "simply" have no
regressions.

Thanks,
Leo

> 
>> Some links to provide context and details:
>> * What is underlay?: https://gitlab.freedesktop.org/emersion/libliftoff/-/issues/76
>> * Discussion on how to implement underlay on Weston: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1258#note_2325164
>>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Chao Guo <chao.guo@nxp.com>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Vikas Korjani <Vikas.Korjani@amd.com>
>> Cc: Robert Mader <robert.mader@posteo.de>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>
>> Leo Li (2):
>>    drm/amd/display: Introduce overlay cursor mode
>>    drm/amd/display: Move PRIMARY plane zpos higher
>>
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 405 ++++++++++++++++--
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
>>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  28 +-
>>   4 files changed, 391 insertions(+), 50 deletions(-)
>>
> 
