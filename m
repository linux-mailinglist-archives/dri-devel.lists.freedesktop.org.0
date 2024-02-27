Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABAC869F2A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 19:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8222710E3E8;
	Tue, 27 Feb 2024 18:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4/2NlhRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E30210E3D8;
 Tue, 27 Feb 2024 18:33:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRDw0hIt9D57YxZC1ygdXvMlFrS4oiUXarVfVz6tFfKtS0HtX3FMpwr1IqpICMjtZGWtUsBLzhfG7pOQy3dW6MiH4c5waru34VPZer/A4dXgoYQcPO6y+mqnBPUXYzJPQz/mwlSkO1uTCQMj9uKE5ytdHBvywysPqGJajrtRf83ohytznC8mDWNdkFiRI0/jv7wJzXRd39CGZNtQ/3mpdyFhV42hLcDChSncfE4BMtPrTftfx/UB7GtkoIxapgIRGOg8QilEuTbEVegZipUgTW5ZdEUNGBPjBT1zuo4sHRaQfTkBgXOED2UNi0KtDHS0332JiVF/9CFV6mZWBfmrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTafJyqYABwni96NENvs6BmdGcvAKY3wkpe1CehqlHo=;
 b=nKg/ybmN6glx6NaNSUuqojRoNG+kBmFrbzbEGoktzvengqcRNpnTKR4ZgjjdW725YDbDYqKIMknIUvosnv8oyx4dSivqmNceDahYJwsLIb2HZ3KnDpCaEtk5ZiA98kNnnWuLXjb1Dkv8tUeTrDoHAeJrPj8+hhB3SLB89ZWziOvvlsTYVTC30A1wF7/94Lv/Y6zHr1Yg7qlZQ9FwnbeUL/9Cb37KvWs/ZUSYSCjr2m8HczQL8twS4p1fnVxEiFYSrnWbw9aewW9gDOnt0+jYH9oQbbSmMpwyP0DBdv9KTYsQzTZ43OjPH90dGkYAwiwFVKSW96+L2W6a2Ttcl15pTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTafJyqYABwni96NENvs6BmdGcvAKY3wkpe1CehqlHo=;
 b=4/2NlhRr63Ega71FLqSd3ed7F0uGLLBA+/BLFLprqpycBULGT1cXXQ9q180yRg1e2qwNN/yH64vdQxeRb491F2M//imTH500FN/HZXW08wuek/t1vksnSOAfqJm0FRXUQGqSd064Xog+wCRRAJ+w/bd+OugbrzO4ExaXVILXkz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Tue, 27 Feb
 2024 18:33:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Tue, 27 Feb 2024
 18:33:31 +0000
Message-ID: <e3eb2794-b90e-4300-96b4-61f6b45b5518@amd.com>
Date: Tue, 27 Feb 2024 19:33:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] drm: Fix reservation locking for pin/unpin and
 console
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sumit.semwal@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, marijn.suijten@somainline.org,
 suijingfeng@loongson.cn, kherbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240227113853.8464-1-tzimmermann@suse.de>
 <d854f70b-1d62-4da7-bfbd-2184456d1d25@collabora.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d854f70b-1d62-4da7-bfbd-2184456d1d25@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0010.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4266:EE_
X-MS-Office365-Filtering-Correlation-Id: fea19e46-3403-4cd8-b38a-08dc37c2994d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fYW+uKGWD9gVOrIQCcxDQvisYOqvBKCAMbi24tljOu5AuqVaTQ+CQFEKbQjZ6nb64A0fKmGo6+sX2EqzNXPAS4OEL7kPv5eJnBM2/FNPBzJHO0KeoBPU7sBh/CzmpsnFYhLnMVVkXcXBa+4wRdy5GuXyZXmpsfXlpokRHk2glA/ndYerkELxAT5VF1Ke71g1VMPvsf12k518EXTvf0G3rk6gDhY9yjnFWhnW4fufJ+fxWnEddAtMPCLcNF6VwqS44lr9BO4zqGBliQw3PUMECYqmUBFCjRInYIMwxqa1SFYqtm7ywo39DjZCBlR8Az3RVATOt2cj3Te+XE7zxF6dm6OoF82SjOipuMjNv+6PJ198SkLzB4k3xRBFQFmnc5YLQl5WgvoNfCHpku+nu9kdIuMB1Zc51daHIm+Q0BAMv5qPKzcYWsove6xmb8xsnuuknnf1+IKkvmk3bboQqvkJxzJGCXFPuoKTA1Fi20UEAAeKRkwnkOLaa0mIySSM4z8mLyI7axuBA8d9Tnrjv/EEnc8poJ2Nbjx88aJGGl3vKbxNZsOMYyiAMqGVpmjVzKstZ/4meACSaH/1HHDj98cv9jeWINzjNIjvp39EvjXqXmpC/W7xGA3armrWMIZv+U22PjM5gLJvW612eh4g04mSUvXHlqALSzwOyqgSVVHytdpF3pyKPvOtv3+L9P8FmkkhfGobC020Nl/+g9DIBSB8wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnFYSVJkUTRUNTJpRTIyUTZhQlVnbjJDd0lMY0p1QkVyV0NuYS83MmNWNVBt?=
 =?utf-8?B?SE90MzFMY3RuWnVJMktYeEdXbUpyZVp6T0RJTHovbmJxVzJlbkx1bDRxdDdZ?=
 =?utf-8?B?UHJ5eVlhakFML0xBVW9UY0hxNVVHcXJyZS9OV2ZoMmJkVzYwYUpTclRtVkFX?=
 =?utf-8?B?SHVVQXVVQUY0cGloaGh6Qk9WaWJtWkQ0UkhtLzFvdVV3ekdnNURpZGRRbFJh?=
 =?utf-8?B?YlI0SjdsM0FYMzFQRWloMFBvWGxJL2xKUWNLUnhOTWdva2xWRzEzSEtwRk1I?=
 =?utf-8?B?dHpGVzdNazAyKzZpcENod1NGU1hMVVVsOXhkeks5eS9sTCtQNGhpTXZ2V1ZG?=
 =?utf-8?B?RExtSWlOd0cycWlldGR3WFloVk11ZCtHVnA1YTAwZUk3VTVOZkxuRDUvdmdh?=
 =?utf-8?B?ZkxydEd2Q3JoQmZGaHlvSDZ1Uk9ISDR4R2lreElmQlpGaGJqMmUwZXlJM0Ry?=
 =?utf-8?B?UjcxN3Q2aFBWeE5McjBmcjdVVGwwQzloVGhEZUU2cVVyOWFTMmVHdk5ZcE44?=
 =?utf-8?B?NUpHWnkxaFBKTVZhY0VNQkV4TjhMb2ZsZG4vQ1FqYjhVdC9oS3BBYXRHaUtF?=
 =?utf-8?B?bWMwNnhQWDg5T0pHSC9QMXl0S29jbHBwSEdZZHBvOFEzZWxsSWhpMC9jK25h?=
 =?utf-8?B?VHdmNlZyMlNleXc2Ynhzc3pSQTlxU3lYYldhbXFnUVpuTDFOT1VjeGpaOGFo?=
 =?utf-8?B?bDhlMFJsWVNaZ2dub0t6UEZNNmJOQWIwQUlvcktEcXQ5Nm1SemJ6VzRyUFVH?=
 =?utf-8?B?MEdCeGI0RUp0Y2FPdExhT3BaeWZvRG9uOTYxYUhVK0VORDc2QXpjc0ZPMmpI?=
 =?utf-8?B?Z2doTnE2V3EvOCt3cUVCbmJNQlAxaFBzbm16YmRMcHM1dmdIc1gxQTJ5cnhU?=
 =?utf-8?B?R29ielkyTDFQRWttNEVMUVVHQUVVT0EvdmRiV05GY1BERUM1YW9VZ3lqQXBQ?=
 =?utf-8?B?U3JDWEMyaXRwRE5aNDFKWVBaM0xhZ0kwZFFuTEVJWEIyUHB3UFhsZGdtV0sw?=
 =?utf-8?B?WkNNWXZpbmVSMkVHeG9mYlU4bVpVTXNNYjJDUTNMSDVjTG1DWXBpdFVTWnBr?=
 =?utf-8?B?bXovRzA1R05QMFk0M0VxZTMzek55cWlZTDlnSWphd250OUNQR2pDbCtJVDQx?=
 =?utf-8?B?WUdhY1E2aDFBWmIxbnhOaFc5ZWFJT0I0VFBLTjg0TFJkc0xjT2p4NWRNTTZX?=
 =?utf-8?B?WXpDTjlLR2N5ZXRybnVRbkJaYVVlNWU5ajJpQzdRcXBmMFZtZ05sRkQzdFJn?=
 =?utf-8?B?UW8yT0lGeWFZbU81dUNSWHlOMTZBUlBLQTZNY1VVMUJpZkdlK3RzT0J0OERi?=
 =?utf-8?B?d2RwelplbGF6K0h6V1Y4N0JLYkRTT1lmRTgvcUhZSHIyMjhsekw0VzdIUU9w?=
 =?utf-8?B?VGpVSGNvWTZZci9pTndBcEpaNVQ4Y1B2NGJPWXp6bnBOMXFBbXlpekZsU0pX?=
 =?utf-8?B?aXlDR0V2Mk1lQmxsQk5SV0NTdWRGbHJWcU9ySmEwb1VkUDd1V0lyUEp6VElZ?=
 =?utf-8?B?YTRDYXp6TE9wcGhKNGFxb3hLeWFGallVeE1LZWxVMmpSbXV0QlBqaVVGM1RY?=
 =?utf-8?B?bENGZng1MENYc0JhcjRZTENMYWxOWm8vV0hHd3ZwME9TV1BuQXJobHUxeS9m?=
 =?utf-8?B?NFFwSE1pbmY4cUFUTkFmMTV0blFud3FoOWxGa0RuUWxHQldBQUN6NHBmOXBp?=
 =?utf-8?B?RGlTaU5GMEl3alNtNHRqWmFMZTJ4SmdRVEZ2R1c5WHlnVjg4TjJnY0hNRWF0?=
 =?utf-8?B?RnhiTmJhRWdCWHFEUWExMndna3J6MGlzOG9VZUNFNFRRREhBU0ZmM3RzNHNN?=
 =?utf-8?B?T3cwVkFBeTl5QjFsenRZUGZueExUY09ORXRCUHJOeFNzMnN3eXlPbmgyNW9n?=
 =?utf-8?B?MlRkWElKN1dSRlo3dlFENU1JMGJEOTEzemUxQzM1Y2ZJM0lIc2Qvenc0bHBn?=
 =?utf-8?B?cU5DaVlHeG9rT0pzTHJZaENJcU41cUxncEgrMjZQNHEvbFZjVm1zV2d5MHZN?=
 =?utf-8?B?aHhDcHc5ZGFyaVpRR0krUjkyRzZEUmZvSkhJODhRNm1PMXptUkhpVGIrZFQr?=
 =?utf-8?B?K29sR0dCUkx2amQwS0s0eDRXUVdpOEdERGdQaU15L20xdk53OTFxb3FBdDFh?=
 =?utf-8?Q?tdquSlAUT8Fisa51OEvEuLQo1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea19e46-3403-4cd8-b38a-08dc37c2994d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 18:33:31.7823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oo4dA+57OPmRT8J/Ay3phvzPGSoT++f21wqO6INvPQQmJTzp8Gmrqwt81Zk0jvyy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266
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

Am 27.02.24 um 19:14 schrieb Dmitry Osipenko:
> Hello,
>
> Thank you for the patches!
>
> On 2/27/24 13:14, Thomas Zimmermann wrote:
>> Dma-buf locking semantics require the caller of pin and unpin to hold
>> the buffer's reservation lock. Fix DRM to adhere to the specs. This
>> enables to fix the locking in DRM's console emulation. Similar changes
>> for vmap and mmap have been posted at [1][2]
>>
>> Most DRM drivers and memory managers acquire the buffer object's
>> reservation lock within their GEM pin and unpin callbacks. This
>> violates dma-buf locking semantics. We get away with it because PRIME
>> does not provide pin/unpin, but attach/detach, for which the locking
>> semantics is correct.
>>
>> Patches 1 to 8 rework DRM GEM code in various implementations to
>> acquire the reservation lock when entering the pin and unpin callbacks.
>> This prepares them for the next patch. Drivers that are not affected
>> by these patches either don't acquire the reservation lock (amdgpu)
>> or don't need preparation (loongson).
>>
>> Patch 9 moves reservation locking from the GEM pin/unpin callbacks
>> into drm_gem_pin() and drm_gem_unpin(). As PRIME uses these functions
>> internally it still gets the reservation lock.
>>
>> With the updated GEM callbacks, the rest of the patchset fixes the
>> fbdev emulation's buffer locking. Fbdev emulation needs to keep its
>> GEM buffer object inplace while updating its content. This required
>> a implicit pinning and apparently amdgpu didn't do this at all.
>>
>> Patch 10 introduces drm_client_buffer_vmap_local() and _vunmap_local().
>> The former function map a GEM buffer into the kernel's address space
>> with regular vmap operations, but keeps holding the reservation lock.
>> The _vunmap_local() helper undoes the vmap and releases the lock. The
>> updated GEM callbacks make this possible. Between the two calls, the
>> fbdev emulation can update the buffer content without have the buffer
>> moved or evicted. Update fbdev-generic to use vmap_local helpers,
>> which fix amdgpu. The idea of adding a "local vmap" has previously been
>> attempted at [3] in a different form.
>>
>> Patch 11 adds implicit pinning to the DRM client's regular vmap
>> helper so that long-term vmap'ed buffers won't be evicted. This only
>> affects fbdev-dma, but GEM DMA helpers don't require pinning. So
>> there are no practical changes.
>>
>> Patches 12 and 13 remove implicit pinning from the vmap and vunmap
>> operations in gem-vram and qxl. These pin operations are not supposed
>> to be part of vmap code, but were required to keep the buffers in place
>> for fbdev emulation. With the conversion o ffbdev-generic to to
>> vmap_local helpers, that code can finally be removed.
> Isn't it a common behaviour for all DRM drivers to implicitly pin BO
> while it's vmapped? I was sure it should be common /o\

No, at least amdgpu and radon doesn't pin kmapped BOs and I don't think 
nouveau does either.

> Why would you want to kmap BO that isn't pinned?

The usual use case is to call the ttm kmap function when you need CPU 
access.

When the buffer hasn't moved we can use the cached CPU mapping, if the 
buffer has moved since the last time or this is the first time that is 
called we setup a new mapping.

> Shouldn't TTM's vmap() be changed to do the pinning?

Absolutely not, no. That would break tons of use cases.

Regards,
Christian.

>
> I missed that TTM doesn't pin BO on vmap() and now surprised to see it.
> It should be a rather serious problem requiring backporting of the
> fixes, but I don't see the fixes tags on the patches (?)
>

