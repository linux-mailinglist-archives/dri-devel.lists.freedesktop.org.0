Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AB7A25921
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 13:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5295310E4A9;
	Mon,  3 Feb 2025 12:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1eyW+70";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A8310E4A2;
 Mon,  3 Feb 2025 12:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738585068; x=1770121068;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X+a2j3NEjktDX4PEe6BGw5N9d3k0DRBuEpZ6PnUMGdw=;
 b=c1eyW+70RpDwHEqrzXCMXgIG/bP2c3Y2XIDxIUIubcN7ljuZ6YvQakGC
 Ek301y725WibTehMaQQG8bUVTS3Sp0g/jDmUOd9tgryIIgrvwXcZmyHCV
 +U+I4VCYC8gcdq3vSsBcuonbnip+0VGEFnErpYo+K+qctH4NKfzMAm4wL
 z5lGYlcGJAyXR3Kt6zvbcXnmOJ3oIAFINn68pp2K54Pzb7C/YgZY9m7Hz
 SJCMwgVIgA/7Er0Pxl2qacZk+Jf7U46PeZbNzJq2K2EYa5Nj4hwV43Wtj
 sNd7Amom5MSaCyhtG5BXomnJXf0Zoo+5SdfZtLAXXu7KhOkzpCr8O+Pk3 w==;
X-CSE-ConnectionGUID: cflm+cvbTF+I8ay2dTkbIA==
X-CSE-MsgGUID: rHDdvB1HSzmg/SmnDE/MNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56502920"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="56502920"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 04:17:47 -0800
X-CSE-ConnectionGUID: c869K6U/RNyLmyj8qBxR4w==
X-CSE-MsgGUID: VHBYPrGYTf61rZiMDGlmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="115279016"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.228])
 ([10.245.245.228])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 04:17:43 -0800
Message-ID: <bb0d15b3-9e68-478d-9eb0-86814e60eb6f@intel.com>
Date: Mon, 3 Feb 2025 12:17:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/gpuvm: Add support for single-page-filled mappings
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Danilo Krummrich <dakr@kernel.org>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Steven Price <steven.price@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, akash.goel@arm.com
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
 <Z5-_O8vkCO0LXcl7@pollux.localdomain> <20250203102153.145229e0@collabora.com>
 <Z6CnSZz_Dm3YpZbx@e110455-lin.cambridge.arm.com>
 <20250203131252.71a180ea@collabora.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250203131252.71a180ea@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 03/02/2025 12:12, Boris Brezillon wrote:
> On Mon, 3 Feb 2025 11:23:53 +0000
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
>> On Mon, Feb 03, 2025 at 10:21:53AM +0100, Boris Brezillon wrote:
>>> +Akash with whom we've been discussing adding a 'REPEAT' mode to
>>> drm_gpuvm/panthor.
>>>
>>> On Sun, 2 Feb 2025 19:53:47 +0100
>>> Danilo Krummrich <dakr@kernel.org> wrote:
>>>    
>>>> Hi Lina,
>>>>
>>>> On Sun, Feb 02, 2025 at 10:34:49PM +0900, Asahi Lina wrote:
>>>>> Some hardware requires dummy page mappings to efficiently implement
>>>>> Vulkan sparse features. These mappings consist of the same physical
>>>>> memory page, repeated for a large range of address space (e.g. 16GiB).
>>>>>
>>>>> Add support for this to drm_gpuvm. Currently, drm_gpuvm expects BO
>>>>> ranges to correspond 1:1 to virtual memory ranges that are mapped, and
>>>>> does math on the BO offset accordingly. To make single page mappings
>>>>> work, we need a way to turn off that math, keeping the BO offset always
>>>>> constant and pointing to the same page (typically BO offset 0).
>>>>>
>>>>> To make this work, we need to handle all the corner cases when these
>>>>> mappings intersect with regular mappings. The rules are simply to never
>>>>> mix or merge a "regular" mapping with a single page mapping.
>>>>>
>>>>> drm_gpuvm has support for a flags field in drm_gpuva objects. This is
>>>>> normally managed by drivers directly. We can introduce a
>>>>> DRM_GPUVA_SINGLE_PAGE flag to handle this. However, to make it work,
>>>>> sm_map and friends need to know ahead of time whether the new mapping is
>>>>> a single page mapping or not. Therefore, we need to add an argument to
>>>>> these functions so drivers can provide the flags to be filled into
>>>>> drm_gpuva.flags.
>>>>>
>>>>> These changes should not affect any existing drivers that use drm_gpuvm
>>>>> other than the API change:
>>>>>
>>>>> - imagination: Does not use flags at all
>>>>> - nouveau: Only uses drm_gpuva_invalidate(), which is only called on
>>>>>    existing drm_gpuva objects (after the map steps)
>>>>> - panthor: Does not use flags at all
>>>>> - xe: Does not use drm_gpuva_init_from_op() or
>>>>>    drm_gpuva_remap()/drm_gpuva_map() (which call it). This means that the
>>>>> flags field of the gpuva object is managed by the driver only, so these
>>>>> changes cannot clobber it.
>>>>>
>>>>> Note that the way this is implemented, drm_gpuvm does not need to know
>>>>> the GPU page size. It only has to never do math on the BO offset to meet
>>>>> the requirements.
>>>>>
>>>>> I suspect that after this change there could be some cleanup possible in
>>>>> the xe driver (which right now passes flags around in various
>>>>> driver-specific ways from the map step through to drm_gpuva objects),
>>>>> but I'll leave that to the Xe folks.
>>>>>
>>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>>> ---
>>>>> Asahi Lina (4):
>>>>>        drm/gpuvm: Add a flags argument to drm_gpuvm_sm_map[_*]
>>>>>        drm/gpuvm: Plumb through flags into drm_gpuva_op_map
>>>>>        drm/gpuvm: Add DRM_GPUVA_SINGLE_PAGE flag and logic
>>>>>        drm/gpuvm: Plumb through flags into drm_gpuva_init
>>>>
>>>> Without looking into any details yet:
>>>>
>>>> This is a bit of tricky one, since we're not even close to having a user for
>>>> this new feature upstream yet, are we?
>>>
>>> Actually, we would be interesting in having this feature hooked up in
>>> panthor. One use case we have is Vulkan sparse bindings, of course. But
>>> we also have cases where we need to map a dummy page repeatedly on the
>>> FW side. The approach we've been considering is slightly different:
>>> pass a DRM_GPUVA_REPEAT_FLAG along with GEM range, so we can repeat a
>>> range of the GEM (see the below diff, which is completely untested by
>>> the way), but I think we'd be fine with this SINGLE_PAGE flag.
>>
>> Unless I've misunderstood the intent completely, it looks like Xe also wants
>> something similar although they call it CPU_ADDR_MIRROR for some reason:
>>
>> https://lore.kernel.org/r/20250129195212.745731-9-matthew.brost@intel.com
> 
> At first glance, it doesn't seem related. The Xe stuff looks more like
> an alloc-on-fault mechanism. SINGLE_PAGE is about mapping a dummy page
> repeatedly over a virtual address range so that sparse Vulkan images
> never get a fault when an unbound image region is accessed.

Yeah, the CPU_ADDR_MIRROR is for upcoming svm stuff and not related. I 
believe in xe the sparse/repeat stuff in this series is rather done 
using a special HW feature called "NULL page", which is just a bit you 
can set in the pte (can also use huge pages) that creates a special 
mapping that doesn't actually point to any real memory underneath, but 
when doing a read it will always return zeroes and any writes to it will 
be dropped by the HW.


