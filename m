Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9BD8A6D79
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 16:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B546010F198;
	Tue, 16 Apr 2024 14:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TbKGtf81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494A010F0DD;
 Tue, 16 Apr 2024 14:10:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiWkFzIqn3hDVHbuBUfZwHgibslr+69KILVkbia96xB3fs9ZgsKGr3nphfkeNjkPOtCqSu361al6hrINfLNA2ePc6+eWiA23EZ/QfcQ/EM0hl41Jk7cYXbOuA1c2fhnCoCwpG7vk9mEN7azauxh8c6Bqo4ZFadOuqFepRqESmwip4mVM6jaF7pMKTSJxZkCFRiQ66qIgI559Wq1OWkCdQmz3KXvhDFekcZkhtkYkITSsNRa3hTKc/oXGoJqVXgwkUA5k0lmYlaZsmO+Xtp2MWmWxa0O1SHyNw6jeeGaGI1J14HBNk0Ft3zpFx+pwHMzZdKOCgyj0HK2qDXQeZpEqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M25Ao3ak6/yEP/WZ45prjRX3x4sCnnsEr8liIYlSB4E=;
 b=V8h36+Q8X3+nrdzA03kak6h2KnEX8a0kQHY9Ru0bad7TQmzxvV/j4R5fMdxen8RF7UKze5te3kYJwOxS2PfJBPrmSNwx6utZ8i0FiaXdXGeFIkX0yY29S02UPTgRnE1hG0BulROfh2+rlhV3s5GQSldLowzx6G/NK7qCAoVMLYiX9GXV9mXrftianiWgxC/VO+bEVLbe6XI3412y/5mRIxEHrTSw8LeXI/Fz9u/zZW7FehzWbL99c/oMWyUeS8Mg2gkAfBHJXcPJoLBnfcZxNRociwekiOQf78NTSseuG525A9ABTszbwCTpwc5kh7BxPZGWjsJMALfR1aSAaDEmRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M25Ao3ak6/yEP/WZ45prjRX3x4sCnnsEr8liIYlSB4E=;
 b=TbKGtf81AZyyKAujOKTins/p0KZ790z3F9KzR5U50fQUrQT3wDn2MXoXlzEPdq+1WjeyijtLBpf0EEL5Mmgf91KSMlm01jFjc/1+HAwpmcA+11Mp/1dvl3ooHLmraaSn7+Sabu0uN2aPPBvuxfJH6R3IIVmFoRj/cactyq2lr3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB6670.namprd12.prod.outlook.com (2603:10b6:806:26e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 14:10:31 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 14:10:29 +0000
Message-ID: <d927a4ca-f602-40c5-a0a7-e329d5e4e273@amd.com>
Date: Tue, 16 Apr 2024 10:10:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations
 more flexible
To: Pekka Paalanen <pekka.paalanen@collabora.com>, Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org,
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
 <8f0a48da-3efc-4742-9539-d852fb92ebfd@amd.com>
 <20240416110120.0a5d24fd.pekka.paalanen@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240416110120.0a5d24fd.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 8785f48c-3806-4a71-c444-08dc5e1ef8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rPZ4deoAM95spTwK7yk94F5NmG0X3+mJZY/IvbzuI3FmejKv810VSDd4ppTSTHZKMC+1Cfa+qLLyYhxlJokbV63F0tZ49ywBGxRecUQ1gQW+clQFb7HWjNiYTS1DF5lDMXfWvYZztkgxeqypT7klEmp0CklhvpY+hphqcpn3HRtSUXFcE3ReXxHxdE9GnvtomA54htgkN7V7WUnLXPxP8sBjP8OxOyN2bsBP9A1Q/siHIYgw8es2okHfNTUjMIOiG8H3tUgZis6F4F1GpfNCd1e3gxYUJPx31+vNCw9adwgShTcp3LnVexuFp0oZ9UmJ1DVdly1e6x51h/O8cZf6H3vJ1mT/fcDaEOIHCUblK7Y88a0Ow6u8hFk1hGqj5ys2ZD/j1hkEBxDno6mv7zETSVcdftAVtSb0elqXGL8GydgkS8hMb84KmxHzY+qwAUT9mWe0MhqY99GVidPhcUtAABlrvYD0Op96xJfAOcRZI4/MExUqr0yA4PBSfhpJ6BTFhPn8hYd9rPddKQACEUzxKu/ALMeZw0Q9GPm2CkURXRaLBN2bAX8nKy7CgyOdB6tKRVir3t/5fbyVrnprV2P6pTVlm1+e5dbd4NIpg8ixdo0lb7mTKcFBM2l5mCjAU/p6764Dr5onRAdl8bcEXoMA5/RuxFJevN695Vx8kq6u5I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(7416005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXRMRzQycDFUZnN5VG5Xb1ZnMCtvM1B2aUszdVQ2WExON2VzODk3OEVTM0xH?=
 =?utf-8?B?T1lYbjZwL0JKclB3Rk0yZHZlblFqZ29DK3FmWXh4WER4V1RNSmswWERqMGlx?=
 =?utf-8?B?VzBZZ3JDNXlGTXVSc2hHU0I5WTQ4TTdPQmRqTFJPQUpIaU8veHA0aHNwSklQ?=
 =?utf-8?B?ZjBucFcxN0lhdU5uRnFzNUVuY2M1V2Z3NnpXVmpoclNPUXFWSVZOeDFOSGpT?=
 =?utf-8?B?aTdxRW5GMnVPT1Flb3RxWTIrclVuOGlnRytod1lTQm9OM1g1WEJPV2g4aTFq?=
 =?utf-8?B?TGtQTDhBT1FrQzZ4ZVdDcjh4bkhQOW5nM2JHQ3RqNVRKcDQxMS84eFhqOUNh?=
 =?utf-8?B?SUgrVUpER1ZMUk5lSWtURTZXNkVvNENZT1h5Nmg0cHo3YlJjc0xvNE8xRU9O?=
 =?utf-8?B?MEgyUWU0WEo2RHNHUGRYVWYrZkpRUWFocGdhckZEQU5abHJjRXhOY1kxYWFZ?=
 =?utf-8?B?ZXpLNFg0aEg1SXB6VGU0UWFybWpDWCszT3E1c2FPYTRoMnJManl3M0p2ZytU?=
 =?utf-8?B?b0ZYb3dhWjFTcGg5UEIvd0JnTVpFUDA4d2RWWkFvdjlvYmE3UHp2ZXlaaHJ1?=
 =?utf-8?B?bnVSZFNUaWhXWGpKbUMzRUo0MmJxUVgwQjBwb2FYOUVSZlJuZldGbENxazBN?=
 =?utf-8?B?aG4vaHlVY01MWEc5dWRJUFRJUitUMlU5bTluVm5uSXFnK29qcU9sNVNRb2lI?=
 =?utf-8?B?Mjg1Y0ZWZHF6WkNTM1lkNHZuYWdGeDc1R0NIeVZCQnRRNmpUcmNjQ3lrbG5G?=
 =?utf-8?B?STMyVFVQMkxiWHZ3UUdDYXpGVWFsNUg5bk81Nkc4SjF0SjVnVWY0SDR4RVh2?=
 =?utf-8?B?UGpXa1c0RytJS3NKWW1IWWkyKzBPdmxsdTZmajlZa1pINWVCUWZwR21udkww?=
 =?utf-8?B?VlhPcEhTY2NWRTE5ejFQZ0RNWk1xRk5XNDhydVl3bmZwZklHdnYyRnhCUkJQ?=
 =?utf-8?B?ajY2cWxGVTRYSG9BdUtaREhIZm9CUXIyQVpjRkQ2bjJqYzJNZzNxcjh0K3Na?=
 =?utf-8?B?ZEdVQVpRZmd3OHJvNkZyVFVLWGltNC9HaUxvemhPaExKUjBTZnppS0NqOWJo?=
 =?utf-8?B?WUVKNi9ZSFROSHRCaEZOSHRQR0NWNVFoaUZWRnQ5VVFPS1FteGpYSUdBdXNW?=
 =?utf-8?B?Z3BRckgyMFFDay95dkJaYkZkU0NaTy96dGI3VTJBeiswWWhNMXBmSEU1UFlD?=
 =?utf-8?B?c2F4d2NpZjhROCtUc05OSnlwdTE0ZUNmUHBmS0NTSjkxMHpNZUVVUnlYeWNO?=
 =?utf-8?B?RlNHc1R3N3FSLzJ1ZnYrWTVYTzR5YXpYdTZGOUZVTlVBQm92NzQ3V1RpU1Ir?=
 =?utf-8?B?NW41bzJlcktyN1d5NThaZDFmSEV1Z3pZbVEydTRReXYya09KbjNTditPRFpt?=
 =?utf-8?B?L1FxR2NGN1NKZnV2MVZlNmdmWDlmNDdhRHJSS1lzVXRBc0dZNVVWMTZKcHJm?=
 =?utf-8?B?RWdvY2V5aXFNUVdSSUlCanRwUXB5RmJDVm1pRDRyL20rYUREeHF3c0Npb0NL?=
 =?utf-8?B?Z1VJdUNOVjZLSXV6QnRuWkZITHV1MS8rQVNDU1NnMGdZU0d0UEZTWTFDcUlu?=
 =?utf-8?B?MEo0VC9ablRnZVJLdjRCUzZab0ZUVGh6MnV5QmZ0Y0dVRS93bXZ0SGhyTjBv?=
 =?utf-8?B?YXAxRG1ibElhd3lLY1VpNVErYTQyUkQzcnRGcFdsWWFjdlczMVZRelE0anlj?=
 =?utf-8?B?WnBYTkxuTmZXQXZkOTA1OXZFMWNHcTAvVHlzTlRNTnlqbkpMK1pyNG82V1V2?=
 =?utf-8?B?cWtsYUhzNEJzc1ArYnNOQURvWjlidlR6YXBVV0o4WjY2aDEzZGNmVnRDR01O?=
 =?utf-8?B?eTJIejFvckM5ekpOdlBZbkhVWFRMYUV3OVJNcnp3YTVxOXhuM0hpa3NxQTVh?=
 =?utf-8?B?TFhBYnBYa1FpL0hJWGovdUlwVnArbFovYmZyUnJaMnhveVIwbGc4YTAzQXo5?=
 =?utf-8?B?WXovVEJJWlpiQzE3WEFZZld0b3Y2YXZia09WZWVSVEkvZndmQko4OSsvNTlV?=
 =?utf-8?B?WnJCUk8xT3VXM0J3dUVLYXRmajU1bU1LSXZYdWI2S1BqcWM5Rk5NcERnTEYz?=
 =?utf-8?B?L1hLVzNYRUVrRTBqV3RBWDBkcC9UZTJkeDAyYUpmajRyaCt6NnViTjdsRWNk?=
 =?utf-8?Q?5AZZ5qBVpVUiAxmvFdpBcQAek?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8785f48c-3806-4a71-c444-08dc5e1ef8db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 14:10:29.8422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReH/dccsDs5DBQrIZmgJgAaGIA+1XI7hXRv1+89VMfd6f9onpKs8efB5AcMkydD4BJdTmtdyPsHU8EIXcnsRDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6670
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



On 2024-04-16 04:01, Pekka Paalanen wrote:
> On Mon, 15 Apr 2024 18:33:39 -0400
> Leo Li <sunpeng.li@amd.com> wrote:
> 
>> On 2024-04-15 04:19, Pekka Paalanen wrote:
>>> On Fri, 12 Apr 2024 16:14:28 -0400
>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>   
>>>> On 2024-04-12 11:31, Alex Deucher wrote:  
>>>>> On Fri, Apr 12, 2024 at 11:08 AM Pekka Paalanen
>>>>> <pekka.paalanen@collabora.com> wrote:  
>>>>>>
>>>>>> On Fri, 12 Apr 2024 10:28:52 -0400
>>>>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>>>>     
>>>>>>> On 2024-04-12 04:03, Pekka Paalanen wrote:  
>>>>>>>> On Thu, 11 Apr 2024 16:33:57 -0400
>>>>>>>> Leo Li <sunpeng.li@amd.com> wrote:
>>>>>>>>     
>>>>>>
>>>>>> ...
>>>>>>     
>>>>>>>>> That begs the question of what can be nailed down and what can left to
>>>>>>>>> independent implementation. I guess things like which plane should be enabled
>>>>>>>>> first (PRIMARY), and how zpos should be interpreted (overlay, underlay, mixed)
>>>>>>>>> can be defined. How to handle atomic test failures could be as well.  
>>>>>>>>
>>>>>>>> What room is there for the interpretation of zpos values?
>>>>>>>>
>>>>>>>> I thought they are unambiguous already: only the relative numerical
>>>>>>>> order matters, and that uniquely defines the KMS plane ordering.  
>>>>>>>
>>>>>>> The zpos value of the PRIMARY plane relative to OVERLAYS, for example, as a way
>>>>>>> for vendors to communicate overlay, underlay, or mixed-arrangement support. I
>>>>>>> don't think allowing OVERLAYs to be placed under the PRIMARY is currently
>>>>>>> documented as a way to support underlay.  
>>>>>>
>>>>>> I always thought it's obvious that the zpos numbers dictate the plane
>>>>>> order without any other rules. After all, we have the universal planes
>>>>>> concept, where the plane type is only informational to aid heuristics
>>>>>> rather than defining anything.
>>>>>>
>>>>>> Only if the zpos property does not exist, the plane types would come
>>>>>> into play.
>>>>>>
>>>>>> Of course, if there actually exists userspace that fails if zpos allows
>>>>>> an overlay type plane to be placed below primary, or fails if primary
>>>>>> zpos is not zero, then DRM needs a new client cap.  
>>>>
>>>> Right, it wasn't immediately clear to me that the API allowed placement of
>>>> things beneath the PRIMARY. But reading the docs for drm_plane_create_zpos*,
>>>> there's nothing that forbids it.
>>>>  
>>>>>>     
>>>>>>> libliftoff for example, assumes that the PRIMARY has the lowest zpos. So
>>>>>>> underlay arrangements will use an OVERLAY for the scanout plane, and the PRIMARY
>>>>>>> for the underlay view.  
>>>>>>
>>>>>> That's totally ok. It works, right? Plane type does not matter if the
>>>>>> KMS driver accepts the configuration.
>>>>>>
>>>>>> What is a "scanout plane"? Aren't all KMS planes by definition scanout
>>>>>> planes?  
>>>>
>>>> Pardon my terminology, I thought the scanout plane was where weston rendered
>>>> non-offloadable surfaces to. I guess it's more correct to call it the "render
>>>> plane". On weston, it seems to be always assigned to the PRIMARY.
>>>>  
>>>
>>> The assignment restriction is just technical design debt. It is
>>> limiting. There is no other good reason for it, than when lighting
>>> up a CRTC for the first time, Weston should do it with the renderer FB
>>> only, on the plane that is most likely to succeed i.e. PRIMARY. After
>>> the CRTC is lit, there should be no built-in limitations in what can go
>>> where.
>>>
>>> The reason for this is that if a CRTC can be activated, it must always
>>> be able to show the renderer FB without incurring a modeset. This is
>>> important for ensuring that the fallback compositing (renderer) is
>>> always possible. So we start with that configuration, and everything
>>> else is optional bonus.  
>>
>> Genuinely curious - What exactly is limiting with keeping the renderer FB on
>> PRIMARY? IOW, what is the additional benefit of placing the renderer FB on
>> something other than PRIMARY?
> 
> The limitations come from a combination of hardware limitations.
> Perhaps zpos is not mutable, or maybe other planes cannot arbitrarily
> move between above and below the primary. This reduces the number of
> possible configurations, which might cause off-loading to fail.
> 
> I think older hardware has more of these arbitrary restrictions.
> 
>>>>
>>>> For libliftoff, using OVERLAYs as the render plane and PRIMARY as the underlay
>>>> plane would work. But I think keeping the render plane on PRIMARY (a la weston)
>>>> makes underlay arrangements easier to allocate, and would be nice to incorporate
>>>> into a shared algorithm.  
>>>
>>> If zpos exists, I don't think such limitation is a good idea. It will
>>> just limit the possible configurations for no reason.
>>>
>>> With zpos, the KMS plane type should be irrelevant for their
>>> z-ordering. Underlay vs. overlay completely loses its meaning at the
>>> KMS level.  
>>
>> Right, the plane types loose their meanings. But at least with the way
>> libliftoff builds the plane arrangement, where we first allocate the renderer fb
>> matters.
>>
>> libliftoff incrementally builds the atomic state by adding a single plane to the
>> atomic state, then testing it. It essentially does a depth-first-search of all
>> possible arrangements, pruning the search on atomic test fail. The state that
>> offloads the most number of FBs will be the arrangement used.
>>
>> Of course, it's unlikely that the entire DFS tree will traversed in time for a
>> frame. So the key is to search the most probable and high-benefit branches
>> first, while minimizing the # of atomic tests needed, before a hard-coded
>> deadline is hit.
>>
>> Following this algorithm, the PRIMARY needs to be enabled first, followed by all
>> the secondary planes. After a plane is enabled, it's not preferred to change
>> it's assigned FB, since that can cause the state to be rejected (in actuality,
>> not just the FB, but also any color and transformation stuffs associated with
>> the surface). It is preferable to build on the state by enabling another
>> fb->plane. This is where changing a plane's zpos to be above/below the PRIMARY
>> is advantageous, rather than changing the FBs assigned, to accommodate
>> overlay/underlay arrangements.
> 
> This all sounds reasonable, but why limit this to only the renderer FB
> on primary plane? The same idea should apply equally to any FB on any
> plane. Then one needs more heuristics on when to stop the search short,
> and when to reconsider each FB-plane assignment in case new candidates
> have appeared but the old ones have not disappeared.
> 
>> I imagine that any algorithm which incrementally builds up the plane arrangement
>> will have a similar preference. Of course, it's entirely possible that such an
>> algorithm isn't the best, I admittedly have not thought much about other
>> possibilities, yet...
> 
> It's a complicated problem, indeed. Maybe there needs to be a background
> task that is not limited by the page flip deadline and can do an
> exhaustive search over many refresh periods.
> 

That would be nice. Kick this off when there is a configuration change,
e.g., user starts video playback, opens a new video, etc.

One would need to avoid doing too much of that, though, as one could
envision scenarios where this happens frequently and could have its
own impact on power by keeping the CPU busy.

Harry

> 
> Thanks,
> pq

