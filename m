Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6405C8A2042
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 22:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A86110EF0A;
	Thu, 11 Apr 2024 20:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xYElF3J5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F5B10EF0A;
 Thu, 11 Apr 2024 20:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moVyW9hkdkAFV8DCvnA8BqnyFHrQBE6+okndec8RJUziYnkLVqu25ltKjlo6AblD2xwE7tajaBiBGCOYyF/ppMX4uohE3P4NghinZKJwOPHfP6WQgqTS983Tc8dBd7vL3YjuZJtwHCO1Z1Ontv716/yTodxezXIBsY1WUm94/bZsmrI6eeOpgB6dq/d8i525umCntVxjsyRGWWFYx4KBsVBpyjR6A6akjQeSjSlW5KyZLhUGNDCEo5ZYqNgiz3eBXOtKt39QMpG3SnyZ9D064E6Awp2O9WJvJbpp8j3mafT7+DizvCzmbKFQ1nfmt+9QNq6fGUGOLhDpKDgFjoBRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUdGPEyCVhD7/LAClnVhhvwccKpsTjzEPWe4E2Qq6pI=;
 b=Ct9ru8/DgpwH8fs8T33ve1dBt5OYBi2KlO+8vfPNu3H7F8hxHZWlDlAuhogkpwpHrnlun0h6ZLaLST1e8sYooat6qNs9bfNGzJeFludLL57YRHTdXVzWXbVhX7J9HSIEUCWE2CBjd+6WVq39T97p+Lwbbn8NUko6h3WcEzIFxiY0QtUqPfBzQ944um5WKF8+vUBqeBmzh28U1+Kz/W2sLTn4VRR3YluUg8erBBbYMpfQsqk0PrVlhJefJKJgy6/WmQvng1YR3rOkiQNe+1+JKcRD0NYMrxGJJ9Y55qODuRwcPaHfWw6d7qraXZR/OBQpWrIGMUFxy6yhGlF1XwGZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUdGPEyCVhD7/LAClnVhhvwccKpsTjzEPWe4E2Qq6pI=;
 b=xYElF3J59MML0yyVkLghjwuw5z/PYkHhIdyNCFK28BM4wsoVyetLhvoBhl3xkGl3fVDg8Xvlsszy1Y279DCx2L14RJKyy3P4qbgPIZB10MFf8GWX0t4qCrlPHL51z0DJZhSCtoLxkIw7cIPfnqyg38pw3yBdqk4q6hrGoncY8ag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.55; Thu, 11 Apr 2024 20:33:59 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::f86e:7f84:27b2:f80]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::f86e:7f84:27b2:f80%7]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 20:33:59 +0000
Message-ID: <46968a40-e0e5-4af9-b859-8a41d5992863@amd.com>
Date: Thu, 11 Apr 2024 16:33:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
To: Marius Vlad <marius.vlad@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>,
 Robert Mader <robert.mader@posteo.de>, Sean Paul <sean@poorly.run>,
 Simon Ser <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240328163311.34b58b39.pekka.paalanen@collabora.com>
 <1ca9c55b-2358-4357-a337-c0bf5e3e2118@amd.com>
 <20240404132411.5bb5cb53.pekka.paalanen@collabora.com>
 <b1613277-567d-47db-af84-74dfad2e9cf2@amd.com> <Zg63qvnHgutUARrh@xpredator>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <Zg63qvnHgutUARrh@xpredator>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::14) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2febc2-dc6d-4126-96ed-08dc5a66b7ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ajTPhw5HI9ZBfRWS9QUX9NNjmZqkUQCwJfzORmOUPDqb4VkF57EzLoCs1CwKUxEIKLftvXZ6g7mSKLMQKhWKGO/2hRhWzcjGeHwUN+OBqdlOlsur/A1/84BOTvbhMYUhl/jRdOiPZQRGXG6dafP/msxdFfhIxz0H21PSOhuR2ssuds4jC498oS3iIj0IvKOeMZpolVq8xeLNXAhwY4+1zB4wH7x8PVfbcUG3GfDKoY64u6BAyDgdb0S4V1mm56Wm9rhYNmAalSgK5fKyfHBvyKYBPo058XPneVvRIMSwOnuNW/+ZyAzbVIC7tdG4MH70YdNb6vwCzoY+0nw+eZi+Zf1yykC56J2kg36uXIg8dnWJPXUe2k8QqaUnsDd6Z6VDXYrkfv37DhA7vpGZJW/DN18GPj9qgkVr7c54mK40UFxSE5M2hOe3Uej0t+sxf24U3f5suDU/ahTz44wBTrvbvQpzBmOAwF7QsinvsdXz98ENMX2KD4cEe9ILGdc3XmxXxFWzVc0IBefzSmtDqi/4kfiotRtaXW0iDWAy96SO3ft3SCn20jCfyBGyu2AQT+scsB+V/udTZBIItqkQEhsPVzzFvZkIw+buKEgOJVWMXsL7uTSVpJpyOZgbDvQRQLk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmp2aDM5ZUFqRm04SDFkMXU0cVJiT0F5TWxEZEFEcldCQnlRNlMrVFAxd0Y2?=
 =?utf-8?B?a0kvandCNWE4SU9VdHRIN0hRQTNsWndxd3NWK1JWK0NXUFBaWjBHUHFhZ3NQ?=
 =?utf-8?B?UmhFSnBjMzArcFpmeXg4YlVCL0hleVFhTHJESnlrSU5Ua3BMbjlXVDM1cEFi?=
 =?utf-8?B?ekxvdkQ3aFFkUDF6WFdycnNOcHB3dmhsMVJMMHQrSlRqbFUwNlRXbFVsYnkw?=
 =?utf-8?B?U2ZQZEVLR09QTkJTeGtkOERNeUF6bmN2MHFLem5kN0tudStZTGViQmN4eXdM?=
 =?utf-8?B?NTM3b2pKb2Q3MDFDMmMwWnJDeVY4LzlYTmlQR21TLzhCUTZRZXljQmJUTVZy?=
 =?utf-8?B?M1lQUHExVWZXdkpETTVPb1pFK1ZuVVRvZDdUdnNWUTE2ZTYyQmVpc20vYmdm?=
 =?utf-8?B?NUFtS25LZURKRTQ2a1huVkFDTlJ5emdxZmZjRytSV0hDZXFZZzZaRUxEVEFF?=
 =?utf-8?B?NHZ0VFZtNlcxSlV0NWdheU8wdTBzRUFhYldscWFRV1VpUW05aDdzNEpSNU5a?=
 =?utf-8?B?K3hJOFdOL2hEamVzS2c4ZWFpY24yMU9vK1hvQndjVnJTUDNjTnRKZmhJSFFo?=
 =?utf-8?B?ZzY0b3J3aHVQL3JXR0Vhb0NFLzZ1cVl6aUJqbzhzRkJLbUJYYkF6dVR0TGhk?=
 =?utf-8?B?Q2ZTZ1k1Wks0Rnh3UHBEWEpYNnc0dWR6bUJ2YkZFb2dRMkZGcEhOR3o0RmQw?=
 =?utf-8?B?a0lCUjJMQ2VKd3hoTXZSMk9qTCtQS0phUUpnUTRWQlN4dStwNElvcTlieThn?=
 =?utf-8?B?MEI2eDlidkY2VXBxbi9IUGMyVTV2SSs5RHQ5TUd1d0lJdzJRVDZ0S1Nrd3M2?=
 =?utf-8?B?aHByTEZycFllUjh1T2U3eUlVWE5WdnA5ZnlJQk4yNm8xVkxGTWZieVhJZzJT?=
 =?utf-8?B?YUNoWTdNbjl3b0N2NlRadlo3dFExeVFHaE5ZUW5zeDNPMjR4c3hPeGJYMXM0?=
 =?utf-8?B?VExKS0VEOEF2MHUxbUhsWTJsSUFZRzg5NjJFQ2JCYVhxdWZNR2JFQ2xEQ1hG?=
 =?utf-8?B?NnY5T3Q5Ymc0a3IvTFpGaHBucGo0RVZtVGQzUDVwa0RhZ0xjWThrUVE2V2xC?=
 =?utf-8?B?TDBwNmtxN25BZnZhM1lCTjg5NnVzZmtmWWZJRlpEWTBCa2g4dFBSTFlEZG9t?=
 =?utf-8?B?ZTI1MTBrQkRWbmR3enpxdFluVCtwWFhjUzhINzk3UUR1TEdURkxaN2loRzJL?=
 =?utf-8?B?L3pnclVXUmJ0SlJMaVNDdzd6c1VwczFGNFdvZVZKUzNrRktUeS9lK2FqUDBr?=
 =?utf-8?B?T3hGUlh4QU5KdldPSDNtdi8rekUvZEZ3aEl5WjdFSHN1enp1dzZhUExkS21M?=
 =?utf-8?B?T2JWcTR6OFdYVXRlUmlkK3pkRTNZeXh0S0RWZDdsc1poTmY2SkdRY2dBU0VY?=
 =?utf-8?B?TmNUOHJwZ2h2YkxzT2JHcXkwKzVJd1ZySUNFNk10SEJibjlHOThpZFJtUnI0?=
 =?utf-8?B?NlF6bGQzQW9xbmY2NiswL1kxZWlYOStETWFkUHlCZTBjcm1YbHovRGpCWlRF?=
 =?utf-8?B?UDduOVg3VUptRjJkejZzcW9lSlRxUVE4cWxDZHpNRGZXZHRLOEMwTE9US1Fh?=
 =?utf-8?B?NENad2hxbWlUNWlJM01pWW1JSnRJdFNvL1FOb3VUcWxaU3pOVGl6MnNMRnVk?=
 =?utf-8?B?bERpbUpKbk03WklpbzZlcStMWGZGVkVlQlFJVnQ2Y25RTmFEQ1c1YVVWaHJI?=
 =?utf-8?B?V2lUYmEvSzlpcG9UOWwvaWtRUTA0bm5kS3RhL1pZRUVIdWJUbG9sMFl0WUdF?=
 =?utf-8?B?ZzRDbkhIZzN2YkdEWWhoeHBGeVNFVE41bHNKNGtMTlluZWh5RFhHSHR5Mkxy?=
 =?utf-8?B?MHpXWjc3c1JSampXQzhWdXJPenRpeVdycG5oaXRLQUJRSmNZaTArNXEvZTJ5?=
 =?utf-8?B?c2NxUG5MT0JpYzloVmQ5anNmbkVBTFkzc25oaFhKQW56RmNBdmVkNmtzb283?=
 =?utf-8?B?MVhqelF3TUM3UXpjWktGWmduRnY0YTVrbURyd0N6WExXL1ltMGJwOWRyOFNB?=
 =?utf-8?B?bEtvcjF6TC9RNkNZRkozVVdiOWlTZTErdC9ZeG5DaDNFenI0S3VqaUxseVgr?=
 =?utf-8?B?d2VHZlozUEVBWXl2WFRlc1EyZ0JnZmVEczlHZ3B3aGdhUkpVbUFpcnZMbWY2?=
 =?utf-8?Q?vUdBOPXK7v6+Z19OmhpTH3FMu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2febc2-dc6d-4126-96ed-08dc5a66b7ad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 20:33:59.6024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1kts54tvr64PmZvrT12ShopYZTo1XgjoMI1UBsPHYlq6ySUFcZB0kPwrrLMAAxK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898
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




On 2024-04-04 10:22, Marius Vlad wrote:
> On Thu, Apr 04, 2024 at 09:59:03AM -0400, Harry Wentland wrote:
>>
> Hi all,
>>
>> On 2024-04-04 06:24, Pekka Paalanen wrote:
>>> On Wed, 3 Apr 2024 17:32:46 -0400
>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>
>>>> On 2024-03-28 10:33, Pekka Paalanen wrote:
>>>>> On Fri, 15 Mar 2024 13:09:56 -0400
>>>>> <sunpeng.li@amd.com> wrote:
>>>>>    
>>>>>> From: Leo Li <sunpeng.li@amd.com>
>>>>>>
>>>>>> These patches aim to make the amdgpgu KMS driver play nicer with compositors
>>>>>> when building multi-plane scanout configurations. They do so by:
>>>>>>
>>>>>> 1. Making cursor behavior more sensible.
>>>>>> 2. Allowing placement of DRM OVERLAY planes underneath the PRIMARY plane for
>>>>>>      'underlay' configurations (perhaps more of a RFC, see below).
>>>>>>
>>>>>> Please see the commit messages for details.
>>>>>>
>>>>>>
>>>>>> For #2, the simplest way to accomplish this was to increase the value of the
>>>>>> immutable zpos property for the PRIMARY plane. This allowed OVERLAY planes with
>>>>>> a mutable zpos range of (0-254) to be positioned underneath the PRIMARY for an
>>>>>> underlay scanout configuration.
>>>>>>
>>>>>> Technically speaking, DCN hardware does not have a concept of primary or overlay
>>>>>> planes - there are simply 4 general purpose hardware pipes that can be maped in
>>>>>> any configuration. So the immutable zpos restriction on the PRIMARY plane is
>>>>>> kind of arbitrary; it can have a mutable range of (0-254) just like the
>>>>>> OVERLAYs. The distinction between PRIMARY and OVERLAY planes is also somewhat
>>>>>> arbitrary. We can interpret PRIMARY as the first plane that should be enabled on
>>>>>> a CRTC, but beyond that, it doesn't mean much for amdgpu.
>>>>>>
>>>>>> Therefore, I'm curious about how compositors devs understand KMS planes and
>>>>>> their zpos properties, and how we would like to use them. It isn't clear to me
>>>>>> how compositors wish to interpret and use the DRM zpos property, or
>>>>>> differentiate between OVERLAY and PRIMARY planes, when it comes to setting up
>>>>>> multi-plane scanout.
>>>>>
>>>>> You already quoted me on the Weston link, so I don't think I have
>>>>> anything to add. Sounds fine to me, and we don't have a standard plane
>>>>> arrangement algorithm that the kernel could optimize zpos ranges
>>>>> against, yet.
>>>>>    
>>>>>> Ultimately, what I'd like to answer is "What can we do on the KMS driver and DRM
>>>>>> plane API side, that can make building multi-plane scanout configurations easier
>>>>>> for compositors?" I'm hoping we can converge on something, whether that be
>>>>>> updating the existing documentation to better define the usage, or update the
>>>>>> API to provide support for something that is lacking.
>>>>>
>>>>> I think there probably should be a standardised plane arrangement
>>>>> algorithm in userspace, because the search space suffers from
>>>>> permutational explosion. Either there needs to be very few planes (max
>>>>> 4 or 5 at-all-possible per CRTC, including shareable ones) for an
>>>>> exhaustive search to be feasible, or all planes should be more or less
>>>>> equal in capabilities and userspace employs some simplified or
>>>>> heuristic search.
>>>>>
>>>>> If the search algorithm is fixed, then drivers could optimize zpos
>>>>> ranges to have the algorithm find a solution faster.
>>>>>
>>>>> My worry is that userspace already has heuristic search algorithms that
>>>>> may start failing if drivers later change their zpos ranges to be more
>>>>> optimal for another algorithm.
>>>>>
>>>>> OTOH, as long as exhaustive search is feasible, then it does not matter
>>>>> how DRM drivers set up the zpos ranges.
>>>>>
>>>>> In any case, the zpos ranges should try to allow all possible plane
>>>>> arrangements while minimizing the number of arrangements that won't
>>>>> work. The absolute values of zpos are pretty much irrelevant, so I
>>>>> think setting one plane to have an immutable zpos is a good idea, even
>>>>> if it's not necessary by the driver. That is one less moving part, and
>>>>> only the relative ordering between the planes matters.
>>>>>
>>>>>
>>>>> Thanks,
>>>>> pq
>>>>
>>>> Right, thanks for your thoughts! I agree that there should be a common plane
>>>> arrangement algorithm. I think libliftoff is the most obvious candidate here. It
>>>> only handles overlay arrangements currently, but mixed-mode arrangements is
>>>> something I've been trying to look at.
>>>>
>>>> Taking the driver's reported zpos into account could narrow down the search
>>>> space for mixed arrangements. We could tell whether underlay, or overlay, or
>>>> both, is supported by looking at the allowed zpos ranges.
>>>>
>>>> I also wonder if it'll make underlay assignments easier. libliftoff has an
>>>> assumption that the PRIMARY plane has the lowest zpos (which now I realize, is
>>>> not always true). Therefore, the underlay buffer has to be placed on the
>>>> PRIMARY, with the render buffer on a higher OVERLAY. Swapping buffers between
>>>> planes when testing mixed-arrangements is kind of awkward, and simply setting
>>>> the OVERLAY's zpos to be lower or higher than the PRIMARY's sounds simpler.
>>>>
>>>> Currently only gamescope makes use of libliftoff, but I'm curious if patches
>>>> hooking it up to Weston would be welcomed? If there are other ways to have a
>>>> common arrangement algorithm, I'd be happy to hear that as well.
>>>
>>> A natural thing would be to document such an algorithm with the KMS
>>> UAPI.
>>>
>>> I don't know libliftoff well enough to say how welcome it would be in
>>> Weston. I have no fundamental or policy reason to keep an independent
>>> implementation in Weston though, so it's plausible at least.

Is it the case that different compositors may want different plane arrangement
behaviors? Like selecting which surfaces to offload, for example? It occurred to
me that prescribing an allocation algorithm via something like libliftoff might
be too restrictive. In which case, documenting the parts that can be nailed down
would be better.

That begs the question of what can be nailed down and what can left to
independent implementation. I guess things like which plane should be enabled
first (PRIMARY), and how zpos should be interpreted (overlay, underlay, mixed)
can be defined. How to handle atomic test failures could be as well.

I can start working on a draft for this. If anything, as a spark for discussions
for the display hackfest.

>>>
>>> It would need investigation, and perhaps also extending Weston test
>>> suite a lot more towards VKMS to verify plane assignments. Currently
>>> all plane assignment testing is manual on real hardware.
>>>
>>
>> It looks like VKMS doesn't have explicit zpos yet, so someone would
>> probably need to add that.
>>
>> https://drmdb.emersion.fr/properties/4008636142/zpos
> Yes. If we look into adding that, maybe it should be done using with
> ConfigFS: https://patchwork.freedesktop.org/series/122618/
> 
> With that in and with zpos support, we could then run a batch of tests that
> can dynamically exercise on-the-fly all possible combinations.

Using vkms to come up with a bunch of different hw plane configurations is a
good idea. It may come in handy for testing other compositors too. Thanks for
the suggestions.

- Leo


>>
>> Harry
>>
>>>> Note that libliftoff's algorithm is more complex than weston, since it searches
>>>> harder, and suffers from that permutational explosion. But it solves that by
>>>> trying high benefit arrangements first (offloading surfaces that update
>>>> frequently), and bailing out once the search reaches a hard-coded deadline.
>>>> Since it's currently overlay-only, the goal could be to "simply" have no
>>>> regressions.
>>>
>>> Ensuring no regressions would indeed need to be taken care of by
>>> extending the VKMS-based automated testing.
>>>
>>>
>>> Thanks,
>>> pq
>>>
>>>>>    
>>>>>> Some links to provide context and details:
>>>>>> * What is underlay?: https://gitlab.freedesktop.org/emersion/libliftoff/-/issues/76
>>>>>> * Discussion on how to implement underlay on Weston: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1258#note_2325164
>>>>>>
>>>>>> Cc: Joshua Ashton <joshua@froggi.es>
>>>>>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>>>>>> Cc: Chao Guo <chao.guo@nxp.com>
>>>>>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>>>>>> Cc: Vikas Korjani <Vikas.Korjani@amd.com>
>>>>>> Cc: Robert Mader <robert.mader@posteo.de>
>>>>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>>>> Cc: Sean Paul <sean@poorly.run>
>>>>>> Cc: Simon Ser <contact@emersion.fr>
>>>>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>>>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>>>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>>>>>
>>>>>> Leo Li (2):
>>>>>>     drm/amd/display: Introduce overlay cursor mode
>>>>>>     drm/amd/display: Move PRIMARY plane zpos higher
>>>>>>
>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 405 ++++++++++++++++--
>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
>>>>>>    .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
>>>>>>    .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  28 +-
>>>>>>    4 files changed, 391 insertions(+), 50 deletions(-)
>>>>>>   
>>>>>    
>>>
>>
