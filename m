Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B358A5DBF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 00:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15F910EA73;
	Mon, 15 Apr 2024 22:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B/5GOacn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1769710EA73;
 Mon, 15 Apr 2024 22:33:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ+T2jegHsdyoXQEyFw1EVsQDJbPIGD4wUy0diwEBF4W44+I0CkdZzUwoHbP+8yzElR8OO6anoD2IxyqfPLLga02wgdl7GEMiyvZrwgrw2WPnMp6hz5CcT7xlXBqKeI0bULamgwvO/2uexqkFRuqEuiKBSQRi3xLgzPUxgwjn8szsemOIFPjip1+FwzNx/ug1MUedWiQSxv3PV2UWKJp00JYekx0QAD5jTSObFH4Es20Q5Fat7/GL2CDs3AgsbSf/Ool3Wo4EbeqPHoLcLJvQ/zT2Tmxb5A3jfnNxSSL822jBULXXJvn/io1ilmsNa21pbh7DdllE2Z01dWG1YTe+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDUxEgBin3U11XJCq2LQ/P0zEa9HfdYtT6vP0YyF75U=;
 b=bXO5URHqg5+2Oe2XvE4Yt8HtTnIYYX/DOwoSyzfe/EDfHKqyAV/xWFoVBy6ytNH3MIHnv3Mhxm7cQNYzNiSCjYW+E7fngKxairvo18j/vgTr24lzvolNldfmCNXGbWz7BTSh0IJ8IY9U0Yk1evN6pulO4kc6FfO6K+9IEANLDHW9BTjycnwWMonqORyAUd8fuSrevV1JX7FLaP+B/LGVlsruOLjdqYu4B6eFPJbalQVWTIQ4FAEttyVL4i5pUvsJ99k6q9juDslLYl3XqJ2lLnAA46Pym0RiR6eJQi3WjzEiBvD/j458vw9RPiZ3kPXwQgg2L9/qg6rbOrkIfEuzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDUxEgBin3U11XJCq2LQ/P0zEa9HfdYtT6vP0YyF75U=;
 b=B/5GOacnzRMQit1/DxiHuihznohWi0bZtxNX9BwfnGl8MWnFizlVMSRVDwjUsC2ZnpT9+ng6Yz2Ag1lPKXsCJD6PEoBLRoT7ALmZUWiB/m1yyl1QIMsmqg3n3cohgcb+BLYB4NYARpT0PO4vcMaC7vMToBonZ+aap2BP6FJ9+dQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 CH3PR12MB8993.namprd12.prod.outlook.com (2603:10b6:610:17b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 22:33:42 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::43dd:8fc3:fa6f:e54]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::43dd:8fc3:fa6f:e54%6]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 22:33:42 +0000
Message-ID: <8f0a48da-3efc-4742-9539-d852fb92ebfd@amd.com>
Date: Mon, 15 Apr 2024 18:33:39 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 Marius Vlad <marius.vlad@collabora.com>,
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
 <7d04e345-b319-4e2f-a1d3-378cc1881144@amd.com>
 <20240412180741.360d8c2b.pekka.paalanen@collabora.com>
 <CADnq5_MD4EBm4kGuK3fa0azKsMimEnTM3tm-Hy8CN-NNtom3Kw@mail.gmail.com>
 <75f2b674-4ad5-4d36-9708-0eea9a9bba6a@amd.com>
 <20240415111953.04b65a53.pekka.paalanen@collabora.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240415111953.04b65a53.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0162.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::35) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|CH3PR12MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: b16bd415-1216-4edf-d915-08dc5d9c1a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZ9A2C0a6Q6EKh1oLF3uBOnfD5NuW4PfU75Y9aPGQ9t0ihWG9eODg6wGkRDh8Vy417ISqFR8ExvY/jpx5fAfnqDYxhfU/0fr6YIyxJysGkLgwegsycHPRyFXF1MMwzVQ/f3wiuGC1NhrO7qtOn/AreNsycOHHncuYLysUYvIVR74karlQ6H2oalOODmagUjD0UAIaIsReQucC1YK40d2RnPYueErnxjC/9/jjQbFr0MdtP6oUPLECeKH8cKrbRxua08itM3oxeYdq3BrVoslJIZMlMTGiIa7oufqRtnb6/MmV4zCoq6wb7fQI7N5nv5kz2ge3NOaJelJac5vig1rPyHR2pUX3KvOLWFqnupYTqO3YTmCRrE5az/TJgL3MQ/l2V7MludvgeegUPRennOGFbLc0yugK6BTUPH7QgcPEg0s6k1WEB9F80lojeYT9m2ZyzFfFFSML0/Hd7eQmyAi/EvHtRSeBpTenYzOY2QaO/Qd5jrWTcLLP2A/3DnoE8oeZ2/Bxg7KckQqlfjJUyzXsUDaSD1f0pKjbS0NDKjKuVFNSQ86QQuobqslQsl54zMG5CGk0siM7D5tw7F60pn45hkptdzVecIWtlf5InObEjU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFYvc2Vvc0RYRG9LK2RIN1JlNWFaMjMwcTFRL1kyM2FSOG40Q2ZwSWR0dm9S?=
 =?utf-8?B?dTRXN0tYd0d0RU1aS0szbHkrY1BnZHVIWkY4VlVua09GdTV0WkV5d3pDRWxu?=
 =?utf-8?B?aU1BQ1V3UW1YQnF3VytBUGdkNjRYYTFxYTU3NmkxbVhYdFM2TGNMOXFWUVg1?=
 =?utf-8?B?WTNkVGd5SEZSUUlJa3RDMGlWSXBhbzYzL0xhUVJ6NUxNVU5lR015ZEdoK2xW?=
 =?utf-8?B?S1daeGR3Qm9ZcENzaythaHQ5R3F3NUc5WXZCbmJrcnRlZ0lIUEQya2JPS0FU?=
 =?utf-8?B?OWRablZVVGgxNEJ6Tmg0YmdmMFlUdnhxOU5GZ1JWbURZeldpeW9MV2pTMFJD?=
 =?utf-8?B?dVJIeTA2bmhlTXNDK1hhL2FnN3lNeUxHdmlLeXdJRHBIbmNtWDhpT3pJQ3FD?=
 =?utf-8?B?akwwNDN0azNTSzVwMHMvaXZCY3V5Z1NzUkhRNlZKMFB0cXVLVFQ1OEZuU0VM?=
 =?utf-8?B?SmJsdi8xSGRVU2duZGJWT1B1TFNkYXRVeUJIZ1pGNFhBZVVHWlNqR2RISWp2?=
 =?utf-8?B?bzhvM0ZKMS95OHFmbzhyNmZwMEdEeDAvbll0RkowOTlIZHlpVTI1RXRRWjNq?=
 =?utf-8?B?OTZOTXFxakQyY1MvQ0k4V1MrUzljV05jQVdZSnhBaWw1eWhxQjBVa2hpQ1pV?=
 =?utf-8?B?SEZXWkU1STVETnJrZjhEN1FIL0dEc05LcW5KMWJjMnJBMmh3RGsvbHAxYVly?=
 =?utf-8?B?RkgyVTBQNGQ0ZlV5Q0t3cWlSL1lkNURjVHFjRnA0TmdURkFXbUhZTGE4ME9z?=
 =?utf-8?B?QVV6dFlINTB5VzBrOTVhVTh6NU1sVmRGTEU4MVVVdHlScFhNSkxubUtmWTdH?=
 =?utf-8?B?Y1FqNDhITEZhM01mRmlNSVZiZ3Q4MlRFVHZycjBBNzRGTWFJTjhGWDZnd2hn?=
 =?utf-8?B?aFIxRnFTL2tTTTJTalQ4NXEzaDBWZ0UyOFFoTFRSOUxRR2YwVjg4VnExMFZZ?=
 =?utf-8?B?b0hPcnpuODlzS1Z3dWhDTVYwRGJqZjh5N1BSakphcVFnRzEvUUhBd0FOMHdv?=
 =?utf-8?B?TE1wT1RBbUpXUGJ2a3dDTW9qUHFmbVUwMkxOcFhIc2t0YUVqRWtYTG1vazlt?=
 =?utf-8?B?UjFRbnRLQzc1N25kL3ZhcFhZMG5LRWUvWDZPOEhkQmtUbmRGSHlnOGV3NlVP?=
 =?utf-8?B?OGhJb0RYWjNsb2VMMXNEaytWQU1iQ3MwdjNjTWRJdDlYZVRvaHA4WHJUTU13?=
 =?utf-8?B?UGZOVEVZRWZISWZpcktnV0FhSkRmNGpqYVdLc051NHBHbVZ2a2xqU0g4ZDJU?=
 =?utf-8?B?TTZKdGxmU1RkWmdmUjhSMGpORWl3MHNMeFd6djBXcFhpbEczUjRwemEwaTJY?=
 =?utf-8?B?YkN1NzJDbG1xc3FHVER4SXVFRUJlRXIzRUwrSlFtRXNFZ2dqTmRGOEpCS1Bw?=
 =?utf-8?B?SkorMDNMa245ZU11OGN0dzlxdnRVZmRwNzN1TEd5YUl4S1BRb3Jsb0U3OFZG?=
 =?utf-8?B?bGhwUWVsSHhNNW1VKzFldER0YUFPVFkxODBNT1N1OVc0eDEzWGhTVzZYRFdT?=
 =?utf-8?B?azZPdzBpTlBjckF1N2lHQmlKN0pOSXJ3V3pyNVBWRkpRS1FsT0liME9tTEtm?=
 =?utf-8?B?aXdDQzdvREl5OWhxdzdnRUNsQ25hZnljNGo5UE0rUmxBQ2Y0QktwNzE2aW9m?=
 =?utf-8?B?NnNWaXBnQmFGaUVSeDFRMmpjZlcyYk1tRlB4dGR2a2JNVjNqUnNqbzhYbDJY?=
 =?utf-8?B?elk2eS9SNXlxd1UzSEVQTW5uTWFHZWZtazNMcGVUZ1d1VEVBTkIwWFZ2MWQ2?=
 =?utf-8?B?U0ppTW1NU25Lb1ZQV0puUkNWK3RpK1ViWTV2VDkyYnNNeDBqMEgxUHlRa3R1?=
 =?utf-8?B?cXRzNnExMjFYN0hTVG45VS9JNUJpM3lEcWQzS08yWHJhYjA0THdldXFJS0Vl?=
 =?utf-8?B?N2M4OWtEWFJpUk5iVDl2dW1lblZrektTak0xQlE1aTN5OGF5cmdDVkxMcmN4?=
 =?utf-8?B?eVBmQ1g2ZytMNmpzamxzOUlaODB3VS9LRysyWWkwQjhqcEtQNWpqR2FYekc2?=
 =?utf-8?B?TW9yVmk4a2Q0ZEpCaGVtQ1NSaWc5T1NyUHJMVnZ2WUNkaUdvSFVMS01zWVNn?=
 =?utf-8?B?eFY3SDNxbUhnREM1MW9HNW1mVEhtNTJUNjl3bVRUYmo3YWlLeWxkczNFOGVG?=
 =?utf-8?Q?xXfQoNymS0nsCJPj8EADJo8FC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16bd415-1216-4edf-d915-08dc5d9c1a56
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 22:33:41.9990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AHSgoO1YA8V9IxVFRsUpE6DF/81pCsPfnYyK06qh7sA7RpjKAJPHhPmMLZ0wTpg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8993
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




On 2024-04-15 04:19, Pekka Paalanen wrote:
> On Fri, 12 Apr 2024 16:14:28 -0400
> Leo Li <sunpeng.li@amd.com> wrote:
> 
>> On 2024-04-12 11:31, Alex Deucher wrote:
>>> On Fri, Apr 12, 2024 at 11:08 AM Pekka Paalanen
>>> <pekka.paalanen@collabora.com> wrote:
>>>>
>>>> On Fri, 12 Apr 2024 10:28:52 -0400
>>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>>   
>>>>> On 2024-04-12 04:03, Pekka Paalanen wrote:
>>>>>> On Thu, 11 Apr 2024 16:33:57 -0400
>>>>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>>>>   
>>>>
>>>> ...
>>>>   
>>>>>>> That begs the question of what can be nailed down and what can left to
>>>>>>> independent implementation. I guess things like which plane should be enabled
>>>>>>> first (PRIMARY), and how zpos should be interpreted (overlay, underlay, mixed)
>>>>>>> can be defined. How to handle atomic test failures could be as well.
>>>>>>
>>>>>> What room is there for the interpretation of zpos values?
>>>>>>
>>>>>> I thought they are unambiguous already: only the relative numerical
>>>>>> order matters, and that uniquely defines the KMS plane ordering.
>>>>>
>>>>> The zpos value of the PRIMARY plane relative to OVERLAYS, for example, as a way
>>>>> for vendors to communicate overlay, underlay, or mixed-arrangement support. I
>>>>> don't think allowing OVERLAYs to be placed under the PRIMARY is currently
>>>>> documented as a way to support underlay.
>>>>
>>>> I always thought it's obvious that the zpos numbers dictate the plane
>>>> order without any other rules. After all, we have the universal planes
>>>> concept, where the plane type is only informational to aid heuristics
>>>> rather than defining anything.
>>>>
>>>> Only if the zpos property does not exist, the plane types would come
>>>> into play.
>>>>
>>>> Of course, if there actually exists userspace that fails if zpos allows
>>>> an overlay type plane to be placed below primary, or fails if primary
>>>> zpos is not zero, then DRM needs a new client cap.
>>
>> Right, it wasn't immediately clear to me that the API allowed placement of
>> things beneath the PRIMARY. But reading the docs for drm_plane_create_zpos*,
>> there's nothing that forbids it.
>>
>>>>   
>>>>> libliftoff for example, assumes that the PRIMARY has the lowest zpos. So
>>>>> underlay arrangements will use an OVERLAY for the scanout plane, and the PRIMARY
>>>>> for the underlay view.
>>>>
>>>> That's totally ok. It works, right? Plane type does not matter if the
>>>> KMS driver accepts the configuration.
>>>>
>>>> What is a "scanout plane"? Aren't all KMS planes by definition scanout
>>>> planes?
>>
>> Pardon my terminology, I thought the scanout plane was where weston rendered
>> non-offloadable surfaces to. I guess it's more correct to call it the "render
>> plane". On weston, it seems to be always assigned to the PRIMARY.
>>
> 
> The assignment restriction is just technical design debt. It is
> limiting. There is no other good reason for it, than when lighting
> up a CRTC for the first time, Weston should do it with the renderer FB
> only, on the plane that is most likely to succeed i.e. PRIMARY. After
> the CRTC is lit, there should be no built-in limitations in what can go
> where.
> 
> The reason for this is that if a CRTC can be activated, it must always
> be able to show the renderer FB without incurring a modeset. This is
> important for ensuring that the fallback compositing (renderer) is
> always possible. So we start with that configuration, and everything
> else is optional bonus.

Genuinely curious - What exactly is limiting with keeping the renderer FB on
PRIMARY? IOW, what is the additional benefit of placing the renderer FB on
something other than PRIMARY?

> 
>>
>> For libliftoff, using OVERLAYs as the render plane and PRIMARY as the underlay
>> plane would work. But I think keeping the render plane on PRIMARY (a la weston)
>> makes underlay arrangements easier to allocate, and would be nice to incorporate
>> into a shared algorithm.
> 
> If zpos exists, I don't think such limitation is a good idea. It will
> just limit the possible configurations for no reason.
> 
> With zpos, the KMS plane type should be irrelevant for their
> z-ordering. Underlay vs. overlay completely loses its meaning at the
> KMS level.

Right, the plane types loose their meanings. But at least with the way
libliftoff builds the plane arrangement, where we first allocate the renderer fb
matters.

libliftoff incrementally builds the atomic state by adding a single plane to the
atomic state, then testing it. It essentially does a depth-first-search of all
possible arrangements, pruning the search on atomic test fail. The state that
offloads the most number of FBs will be the arrangement used.

Of course, it's unlikely that the entire DFS tree will traversed in time for a
frame. So the key is to search the most probable and high-benefit branches
first, while minimizing the # of atomic tests needed, before a hard-coded
deadline is hit.

Following this algorithm, the PRIMARY needs to be enabled first, followed by all
the secondary planes. After a plane is enabled, it's not preferred to change
it's assigned FB, since that can cause the state to be rejected (in actuality,
not just the FB, but also any color and transformation stuffs associated with
the surface). It is preferable to build on the state by enabling another
fb->plane. This is where changing a plane's zpos to be above/below the PRIMARY
is advantageous, rather than changing the FBs assigned, to accommodate
overlay/underlay arrangements.

I imagine that any algorithm which incrementally builds up the plane arrangement
will have a similar preference. Of course, it's entirely possible that such an
algorithm isn't the best, I admittedly have not thought much about other
possibilities, yet...

Thanks,
Leo

> 
>> In an underlay arrangement, pushing down an OVERLAY's zpos below the PRIMARY's
>> zpos is simpler than swapping their surfaces. If such an arrangement fails
>> atomic_test, we won't have to worry about swapping the surfaces back. Of course,
>> it's not that we can't keep track of that in the algorithm, but I think it does
>> make things easier.
> 
> There is no "swapping" or "swapping back". The tentative configuration
> is created as a new object that contains the complete CRTC+connector
> state, and if it doesn't work, it's simply destroyed. In Weston at
> least, I don't know of libliftoff.
> 
> One surface could also be assigned to multiple KMS planes for different
> CRTCs, so there should be no 1:1 association in the first place.
> 
>> It may help with reducing the amount of atomic tests. Assuming that the same DRM
>> plane provides the same format/color management/transformation support
>> regardless of it's zpos,
> 
> I would definitely expect so.
> 
>> we should be able to reasonably expect that changing
>> it's z-ordering will not cause atomic_test failures (or at least, expect less
>> causes for failure). In other words, swapping the render plane from the PRIMARY
>> to an OVERLAY might have more causes for an atomic_test fail, versus changing
>> their z-ordering. The driver might have to do more things under-the-hood to
>> provide this consistent behavior, but I think that's the right place for it.
>> After all, drivers should know more about their hardware's behavior.
> 
> Indeed.
> 
>> The assumption that the PRIMARY has the lowest zpos isn't always true. I
>> was made aware that the imx8mq platform places all of their OVERLAYS beneath the
>> PRIMARY. Granted, the KMS code for enabling OVERLAYS is not upstream yet, but it
>> is available from this thread:
>> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1258#note_2319898
>> . I guess this is more of a bad assumption that should be fixed in libliftoff.
> 
> Weston needs fixing too, at least in case a renderer FB is used on the
> CRTC. Weston has two problems: renderer FB is always on PRIMARY plane,
> and renderer FB is always completely opaque.
> 
> 
> Thanks,
> pq
> 
>>>>
>>>> IOW, if the KMS client understands zpos and can do a proper KMS
>>>> configuration search, and all planes have zpos property, then there is
>>>> no need to look at the plane type at all. That is the goal of the
>>>> universal planes feature.
>>>
>>> The optimal configuration with DCN hardware is using underlays.  E.g.,
>>> the desktop plane would be at the top and would have holes cut out of
>>> it for videos or windows that want their own plane.  If you do it the
>>> other way around, there are lots of limitations.
>>>
>>> Alex
>>
>> Right, patch 1/2 tries to work around one of these limitations (cursor-on-yuv).
>> Others have mentioned we can do the same for scaling.
>>
>> Thanks,
>> Leo
