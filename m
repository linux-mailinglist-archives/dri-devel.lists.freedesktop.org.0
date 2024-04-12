Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75348A30AD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 16:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9390E10F667;
	Fri, 12 Apr 2024 14:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1JSc82XH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF3810F672;
 Fri, 12 Apr 2024 14:28:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Za7ftrbQxiPcaRG9aAQHVZ5EFaHFsDJ6MuEq9Oz/2THvLj1OVoely6FliJD4tswL8XgCyW71YEzcu7BSleibbjVdYhATtAVLLXs8i2guMZ3NkBo8LriTiCaOYRwT/5i5ocBXfnDumI3C+qxUYUoEqbgZmR/jkhzTPgego39p3EFosLguUk9+icTWbBWte6Nf81wvcedaszOxvdxr9ZCnEML83x6tZxvrEFxdxh9jSMCa72HIh+qMg+MD0bWxTU/cAgdcSDl7v9NkSOBxeSJv4zObvKJ4jCYO1OeUgRFs+uo5PiLAsczu+09upytaxDJFTsXLmB4cO7PDuYn8rYBacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oitiYJchZ5b/6jy2Z5FDzQ1y7eEzR/faH+cxxHtYtNw=;
 b=jn0RKbh5ToOM2DG4AKjBbCzQzYKCjzO1Tqbs6qaiRdgF8vK3tAkh9tRAFFFP0PtdzL9XYbe++CQoF7Q7f2+qpvszuwf1WoIxp3tM78CU2Y8ESinRQhQo7Iarz6iAvv61Gl8rbZffcKao7yChHYRF/6aOtGgdR7EJJzF+5QpPx0ffgTVJ6hvZ+TxG2R+XgCsxM+de1lGppxW9SOo3eZdE0ploOFYQCsboIM5ERfU3nSzn6vDL1Nri2BWqLjvEXxTzsqTxu/2Du9JWfJK1+BzZ5g+djojsgGeshkkb9dwhv8gKWrJXy+SOqa5lr7+f+rC4BSDNeunnNtPnPYbAOV0PiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oitiYJchZ5b/6jy2Z5FDzQ1y7eEzR/faH+cxxHtYtNw=;
 b=1JSc82XHHgN2C1TqWlARiwdXKzHbKkKgUD8JdTMK+Onb29MCwMkSRLrsErkvlZX/st7RPXZ8DRtZj+sDC8JbnH/gb56sfD9ic9zUkxWgGMIa+Ewgg1zUt/1gFWIiTkbpQIk78L33cyrDEmab0FeyNIH1UqEu+5X2r/zIx4gy5YY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 MW4PR12MB7466.namprd12.prod.outlook.com (2603:10b6:303:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.56; Fri, 12 Apr
 2024 14:28:54 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::f86e:7f84:27b2:f80]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::f86e:7f84:27b2:f80%7]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 14:28:54 +0000
Message-ID: <7d04e345-b319-4e2f-a1d3-378cc1881144@amd.com>
Date: Fri, 12 Apr 2024 10:28:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Marius Vlad <marius.vlad@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org,
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
 <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com> <Zg63qvnHgutUARrh@xpredator>
 <46968a40-e0e5-4af9-b859-8a41d5992863@amd.com>
 <20240412110325.4afa29ca.pekka.paalanen@collabora.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240412110325.4afa29ca.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0419.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::6) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|MW4PR12MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d957c9-094f-483e-82b1-08dc5afce17a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d5Nqkhzxza97290hgnVxsHlJaYlwnW/mOvtY5u7utH3UFoRB2bIoufd90P58CRUHE1XZFgiPqb732LtGCPcvzahbEWBK65+Qm/a300l1pjlGtUUco65YHmCSf2LDzFkD14B9kcIA3ZyoyevYBEW8pgxNsYFpntttAwpQ4kqc9u3v/TF/Q0cUpaPBYcDtiy9pGRhZsslaoCBxLyCQidtO64hnl0MTFyUCsSbCpW6kIvLQ3pJpO/Pk/S7XkV74Y/ULCCTClN/Ogt7eILTzXQhP87tSKLLeJpkjz9NWk9N1/7oBZfIk6YWA8LnVgkFIxa7BE/i4tAw0NUs5Z7b+eexj3Mj3JOBWWWN7N+6cPE7yXtSLW8ccyvyfSUCYYGfcyfGU5MEUNlBst8G3QuSi8wJ5ij8TGNcGEgN2a+ajYJKJcbc7o7CHmVfE4ePDSF23P9Fq7WAY21/wbMZspD313+3XKasxAcuavbQzwmtnZWJXBiOYRDwdr4+X5Ouw6k4r06Z4JspSmysvPvinnuOLOXjVMvI+ly4n/3sMq3EgoljWWl8YVA6gKoPEyyOQjvSGNg9LyYOhGitNt39Ocy2FOqfRfZyavt0HNSi6XnTtaRxmMjVSByJ5btHKlJ9lDuA8xo7d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnFZLy8ya2NMazhHM1Jid3YrSTcwdjhyL0lld0VHNWdqdHlTZDFUTVk4R0Zt?=
 =?utf-8?B?bmY5YnBKVWdlWG9BeUVXTVo0NEJoeHQzazZlejVYZis5QUV0bU13Z0RvLzQ4?=
 =?utf-8?B?RmhTSXNRaVczYUFGaFFIRDFkZWtLaFZTRmJCUUpxVXl3ekJXTFpISUMvMU9a?=
 =?utf-8?B?M2hsV0IzOTJGNU16MHRoeHV6QzhSb3UrK29EejArV2grLzRqUTZNVUdtZEl3?=
 =?utf-8?B?WVlVY05VenFsWFk2NVNuMmlQekRkbm9tQk9wNGkyNDFtRXlnekNJa3J4bFhl?=
 =?utf-8?B?ejk5Z1ROZW1vY2pYeVJ4czBJTHBrb2Zya2doeEs4Mnhub00vWDVjbFdaT25k?=
 =?utf-8?B?eGszVkxxeTNpaG1OMmk1VXlIdDRIRFVyYVVmUStyaGxzQkhSQVpacVFmUlFn?=
 =?utf-8?B?OXVHbkRUYlNpVlNzN1pwbDR6QTJQQk5iMTF6MXBFeTZqcFo2RTY0YjRvY3J4?=
 =?utf-8?B?dHpuZ1N1MzJFSENadFZTVyt2WU5hSnIvOTdQN0YrSkdFQW5oSVRvL0VpODlP?=
 =?utf-8?B?RlIxTnVnUk1OU3QzS2tENVU1eHhTcmJlMmE4QmI3T010d1RPTmZ4Zll4bURa?=
 =?utf-8?B?Mkt3dDZYcENLMkI0RWI1S0VzcmM0OUdsY2piSnZ0VTY2UG9DbklvMFMrUndy?=
 =?utf-8?B?ME9jUEpQNStFelRhalYxWjhmL09ic3RSeVVjbnZsRlR1SUJMQnpIUHBTdW9X?=
 =?utf-8?B?QlUzdHNhTy9jWkNqMEp2UlJieFI3bllzT0o1RTNuUkg1UjJxdGNhbmplajBR?=
 =?utf-8?B?TnZuZ0lYSjlJMDNyMVBKRFJaUXhYa0luamVtcFZmclhTTWJ5TWc1UUJ0ZVMx?=
 =?utf-8?B?THcyNFJna09mZVJwT1ZrT05Sd3RTL2dMbk5vWmJvaTVQVk5MdE5lbTl1dVNF?=
 =?utf-8?B?aHJyUmVSdFdkRk5TcFZPMjY0RzRudkl3MW1aVkszenJ2VW4wcU53anlEb1Fh?=
 =?utf-8?B?cEdXR1daODZ1ckNsNC81T29qRVlad0w1eW1heUV3RW8yS2VQVGgvZXBpYWhp?=
 =?utf-8?B?TktxbytyUEVpM0p5TE45K04zK0t6YkJBR0o0TW00aGU4M2YveWRJWHV6ZGtS?=
 =?utf-8?B?QWxFbnA5cXlHK21tYTBZak1SOHJXT29CanYzQ1g1c0Q2bURJa0FaWWxvWTB6?=
 =?utf-8?B?ZUUwalhmaFlNYmNxSkpEQ2NFbWNPOStJVjNaczgrMmcyYkdQbXc1TEdpTmNW?=
 =?utf-8?B?bVhSaEhFY014bTZSaG9wd3VNNzliVVJERlErNEFZT0lCSVM1TkczYWwyaTFD?=
 =?utf-8?B?cXdJemlmczJLQTI0cE1MYTBWVnNUZFhoc3dpWDZLQUN2QnpZRWdKeXlxbXdm?=
 =?utf-8?B?TVAram9udEFEbVpXQklQMWRMbTRtblVUc2I1NEFRM1BCaW00eDRoSnNGYmg4?=
 =?utf-8?B?ZHhUTDZXZ28waUQ2ZUVqZW9qWVFhK3lPU0Z5SUJLUEkreFg5S3lZQ3Jad3dS?=
 =?utf-8?B?elExYjFhbXZLL3JwWHEyakhVcy9adzlERHE3Rmp6VW9ERmZZUm1rMlIxcXJD?=
 =?utf-8?B?OXVKQTFWTnAxcWtrd0hadDRpRmNqNGpqNjFJWnhTdS9Oc1VDVnN4ZDFjZ1Nv?=
 =?utf-8?B?UER2L3d0NVBXcFBUTjJpeGdJMk9BQ1JMWUJaUVNQQlliWUc5SEpMT3ljQTVD?=
 =?utf-8?B?VEdycmVVNGFKZ3dXdWVTU3VBUy94Vmh3RlZBbEM1c2JLQlRUL0M5WC9uVHBh?=
 =?utf-8?B?NzNXN2Z1TTh6eVFEUFVKcXI3dlFtdVJ0T0pkOUxnUThXeDFJYnZyMTdRRGtp?=
 =?utf-8?B?dGg5djdYRG4wR2VWVVdQRGVFQUEwNGNsZ2tCZjc2RGRrVHJyUjN0WjFyS0pP?=
 =?utf-8?B?ZzQxanplYnI2M2h0ZmdmWlNYZmZjM2JzRU9jQ1ZseHNQUmJleTZWQ0lWdTlR?=
 =?utf-8?B?SG5HenlmV1hFb1BpTks3cVVBbVNqcW13dUVDcC8vQnQxRjB4MkV2VzFxbldD?=
 =?utf-8?B?b1puZzI5c1k1M0pGdzB1dlhXanlrMUJRNlltS01Bd0VSV256VzlIN3V3MVo0?=
 =?utf-8?B?V05jUlpOR1lONnhuSmhoVlJOMFh3eGlpRXNNWnVrUkJxbE1KY1lSRzdSY2xy?=
 =?utf-8?B?WVBLSnNKVkwrZ0xmWnpJekJWWG8rZnUxU3RhRkFLejl0RlY5UXNKZk0yVmdV?=
 =?utf-8?Q?jcfrMn8TVRYLseHhzEWp/h9MN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d957c9-094f-483e-82b1-08dc5afce17a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 14:28:54.2494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzvJTgdNs08QiT69ptqYHaIteRN1z918On865O2UqHFC/8k5z2m+Xnewcua/2hu0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7466
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



On 2024-04-12 04:03, Pekka Paalanen wrote:
> On Thu, 11 Apr 2024 16:33:57 -0400
> Leo Li <sunpeng.li@amd.com> wrote:
> 
>> On 2024-04-04 10:22, Marius Vlad wrote:
>>> On Thu, Apr 04, 2024 at 09:59:03AM -0400, Harry Wentland wrote:
>>>>   
>>> Hi all,
>>>>
>>>> On 2024-04-04 06:24, Pekka Paalanen wrote:
>>>>> On Wed, 3 Apr 2024 17:32:46 -0400
>>>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>>>   
>>>>>> On 2024-03-28 10:33, Pekka Paalanen wrote:
>>>>>>> On Fri, 15 Mar 2024 13:09:56 -0400
>>>>>>> <sunpeng.li@amd.com> wrote:
>>>>>>>       
>>>>>>>> From: Leo Li <sunpeng.li@amd.com>
>>>>>>>>
>>>>>>>> These patches aim to make the amdgpgu KMS driver play nicer with compositors
>>>>>>>> when building multi-plane scanout configurations. They do so by:
>>>>>>>>
>>>>>>>> 1. Making cursor behavior more sensible.
>>>>>>>> 2. Allowing placement of DRM OVERLAY planes underneath the PRIMARY plane for
>>>>>>>>       'underlay' configurations (perhaps more of a RFC, see below).
>>>>>>>>
>>>>>>>> Please see the commit messages for details.
>>>>>>>>
>>>>>>>>
>>>>>>>> For #2, the simplest way to accomplish this was to increase the value of the
>>>>>>>> immutable zpos property for the PRIMARY plane. This allowed OVERLAY planes with
>>>>>>>> a mutable zpos range of (0-254) to be positioned underneath the PRIMARY for an
>>>>>>>> underlay scanout configuration.
>>>>>>>>
>>>>>>>> Technically speaking, DCN hardware does not have a concept of primary or overlay
>>>>>>>> planes - there are simply 4 general purpose hardware pipes that can be maped in
>>>>>>>> any configuration. So the immutable zpos restriction on the PRIMARY plane is
>>>>>>>> kind of arbitrary; it can have a mutable range of (0-254) just like the
>>>>>>>> OVERLAYs. The distinction between PRIMARY and OVERLAY planes is also somewhat
>>>>>>>> arbitrary. We can interpret PRIMARY as the first plane that should be enabled on
>>>>>>>> a CRTC, but beyond that, it doesn't mean much for amdgpu.
>>>>>>>>
>>>>>>>> Therefore, I'm curious about how compositors devs understand KMS planes and
>>>>>>>> their zpos properties, and how we would like to use them. It isn't clear to me
>>>>>>>> how compositors wish to interpret and use the DRM zpos property, or
>>>>>>>> differentiate between OVERLAY and PRIMARY planes, when it comes to setting up
>>>>>>>> multi-plane scanout.
>>>>>>>
>>>>>>> You already quoted me on the Weston link, so I don't think I have
>>>>>>> anything to add. Sounds fine to me, and we don't have a standard plane
>>>>>>> arrangement algorithm that the kernel could optimize zpos ranges
>>>>>>> against, yet.
>>>>>>>       
>>>>>>>> Ultimately, what I'd like to answer is "What can we do on the KMS driver and DRM
>>>>>>>> plane API side, that can make building multi-plane scanout configurations easier
>>>>>>>> for compositors?" I'm hoping we can converge on something, whether that be
>>>>>>>> updating the existing documentation to better define the usage, or update the
>>>>>>>> API to provide support for something that is lacking.
>>>>>>>
>>>>>>> I think there probably should be a standardised plane arrangement
>>>>>>> algorithm in userspace, because the search space suffers from
>>>>>>> permutational explosion. Either there needs to be very few planes (max
>>>>>>> 4 or 5 at-all-possible per CRTC, including shareable ones) for an
>>>>>>> exhaustive search to be feasible, or all planes should be more or less
>>>>>>> equal in capabilities and userspace employs some simplified or
>>>>>>> heuristic search.
>>>>>>>
>>>>>>> If the search algorithm is fixed, then drivers could optimize zpos
>>>>>>> ranges to have the algorithm find a solution faster.
>>>>>>>
>>>>>>> My worry is that userspace already has heuristic search algorithms that
>>>>>>> may start failing if drivers later change their zpos ranges to be more
>>>>>>> optimal for another algorithm.
>>>>>>>
>>>>>>> OTOH, as long as exhaustive search is feasible, then it does not matter
>>>>>>> how DRM drivers set up the zpos ranges.
>>>>>>>
>>>>>>> In any case, the zpos ranges should try to allow all possible plane
>>>>>>> arrangements while minimizing the number of arrangements that won't
>>>>>>> work. The absolute values of zpos are pretty much irrelevant, so I
>>>>>>> think setting one plane to have an immutable zpos is a good idea, even
>>>>>>> if it's not necessary by the driver. That is one less moving part, and
>>>>>>> only the relative ordering between the planes matters.
>>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> pq
>>>>>>
>>>>>> Right, thanks for your thoughts! I agree that there should be a common plane
>>>>>> arrangement algorithm. I think libliftoff is the most obvious candidate here. It
>>>>>> only handles overlay arrangements currently, but mixed-mode arrangements is
>>>>>> something I've been trying to look at.
>>>>>>
>>>>>> Taking the driver's reported zpos into account could narrow down the search
>>>>>> space for mixed arrangements. We could tell whether underlay, or overlay, or
>>>>>> both, is supported by looking at the allowed zpos ranges.
>>>>>>
>>>>>> I also wonder if it'll make underlay assignments easier. libliftoff has an
>>>>>> assumption that the PRIMARY plane has the lowest zpos (which now I realize, is
>>>>>> not always true). Therefore, the underlay buffer has to be placed on the
>>>>>> PRIMARY, with the render buffer on a higher OVERLAY. Swapping buffers between
>>>>>> planes when testing mixed-arrangements is kind of awkward, and simply setting
>>>>>> the OVERLAY's zpos to be lower or higher than the PRIMARY's sounds simpler.
>>>>>>
>>>>>> Currently only gamescope makes use of libliftoff, but I'm curious if patches
>>>>>> hooking it up to Weston would be welcomed? If there are other ways to have a
>>>>>> common arrangement algorithm, I'd be happy to hear that as well.
>>>>>
>>>>> A natural thing would be to document such an algorithm with the KMS
>>>>> UAPI.
>>>>>
>>>>> I don't know libliftoff well enough to say how welcome it would be in
>>>>> Weston. I have no fundamental or policy reason to keep an independent
>>>>> implementation in Weston though, so it's plausible at least.
>>
>> Is it the case that different compositors may want different plane arrangement
>> behaviors? Like selecting which surfaces to offload, for example? It occurred to
>> me that prescribing an allocation algorithm via something like libliftoff might
>> be too restrictive. In which case, documenting the parts that can be nailed down
>> would be better.
> 
> I don't know. Probably there shouldn't be, eventually, because it's
> hard to imagine how DE or end user style/taste/preferences would affect
> things. Usually the global goal would be optimising power consumption.
> 
> There could be trade-offs though, when reduction in power consumption
> results in reduced image quality or increased latency. What to favour
> for which surfaces is definitely policy and preference. Such
> preferences could perhaps be designed into libliftoff API.
> 
>> That begs the question of what can be nailed down and what can left to
>> independent implementation. I guess things like which plane should be enabled
>> first (PRIMARY), and how zpos should be interpreted (overlay, underlay, mixed)
>> can be defined. How to handle atomic test failures could be as well.
> 
> What room is there for the interpretation of zpos values?
> 
> I thought they are unambiguous already: only the relative numerical
> order matters, and that uniquely defines the KMS plane ordering.

The zpos value of the PRIMARY plane relative to OVERLAYS, for example, as a way
for vendors to communicate overlay, underlay, or mixed-arrangement support. I
don't think allowing OVERLAYs to be placed under the PRIMARY is currently
documented as a way to support underlay.

libliftoff for example, assumes that the PRIMARY has the lowest zpos. So
underlay arrangements will use an OVERLAY for the scanout plane, and the PRIMARY
for the underlay view.

Thanks,
Leo

> 
> 
> Thanks,
> pq
> 
>> I can start working on a draft for this. If anything, as a spark for discussions
>> for the display hackfest.
>>
>>>>>
>>>>> It would need investigation, and perhaps also extending Weston test
>>>>> suite a lot more towards VKMS to verify plane assignments. Currently
>>>>> all plane assignment testing is manual on real hardware.
>>>>>   
>>>>
>>>> It looks like VKMS doesn't have explicit zpos yet, so someone would
>>>> probably need to add that.
>>>>
>>>> https://drmdb.emersion.fr/properties/4008636142/zpos
>>> Yes. If we look into adding that, maybe it should be done using with
>>> ConfigFS: https://patchwork.freedesktop.org/series/122618/
>>>
>>> With that in and with zpos support, we could then run a batch of tests that
>>> can dynamically exercise on-the-fly all possible combinations.
>>
>> Using vkms to come up with a bunch of different hw plane configurations is a
>> good idea. It may come in handy for testing other compositors too. Thanks for
>> the suggestions.
>>
>> - Leo
>>
>>
>>>>
>>>> Harry
>>>>   
>>>>>> Note that libliftoff's algorithm is more complex than weston, since it searches
>>>>>> harder, and suffers from that permutational explosion. But it solves that by
>>>>>> trying high benefit arrangements first (offloading surfaces that update
>>>>>> frequently), and bailing out once the search reaches a hard-coded deadline.
>>>>>> Since it's currently overlay-only, the goal could be to "simply" have no
>>>>>> regressions.
>>>>>
>>>>> Ensuring no regressions would indeed need to be taken care of by
>>>>> extending the VKMS-based automated testing.
>>>>>
>>>>>
>>>>> Thanks,
>>>>> pq
>>>>>   
>>>>>>>       
>>>>>>>> Some links to provide context and details:
>>>>>>>> * What is underlay?: https://gitlab.freedesktop.org/emersion/libliftoff/-/issues/76
>>>>>>>> * Discussion on how to implement underlay on Weston: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1258#note_2325164
>>>>>>>>
>>>>>>>> Cc: Joshua Ashton <joshua@froggi.es>
>>>>>>>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>>> Cc: Chao Guo <chao.guo@nxp.com>
>>>>>>>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>>>>>>>> Cc: Vikas Korjani <Vikas.Korjani@amd.com>
>>>>>>>> Cc: Robert Mader <robert.mader@posteo.de>
>>>>>>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>>>>>> Cc: Sean Paul <sean@poorly.run>
>>>>>>>> Cc: Simon Ser <contact@emersion.fr>
>>>>>>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>>>>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>>>>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>>>>>>>
>>>>>>>> Leo Li (2):
>>>>>>>>      drm/amd/display: Introduce overlay cursor mode
>>>>>>>>      drm/amd/display: Move PRIMARY plane zpos higher
>>>>>>>>
>>>>>>>>     .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 405 ++++++++++++++++--
>>>>>>>>     .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
>>>>>>>>     .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
>>>>>>>>     .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  28 +-
>>>>>>>>     4 files changed, 391 insertions(+), 50 deletions(-)
>>>>>>>>      
>>>>>>>       
>>>>>   
>>>>   
> 
