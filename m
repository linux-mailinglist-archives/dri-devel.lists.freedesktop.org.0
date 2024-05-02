Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496348B9C35
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 16:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DA311204E;
	Thu,  2 May 2024 14:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0eEroOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37F410FFFA;
 Thu,  2 May 2024 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714659791; x=1746195791;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Wivr9zI2XqVFEe7Rd0LoFFSrlvJN+Yye+CnFKxT5ChU=;
 b=g0eEroOU3pOiB7M0QCE2jm19+yl3Gf/XlpauvKBfQncn/l85n8fJdFQU
 JQEJfuxQOQg8/IR9XS5Pf5JHXuLG/68bReEBZUcXKjI5gv75fT3DPN5l5
 Sl8cGndGmuAeefqTe+Sv1Cgd6PSzPD/QD7fBDSHBYI9WR+rv/hjotRGie
 HB1Au3NaLdLwLK/eZYciZSrJ36fVDi21E56RxmTkW3b5B3mrXWn7+p3/b
 M/MWDg3xYY+LhtO/7K9LkdKVeWthaWNEYAiiYJk4FD+L2WhP0MUVqVVdm
 KidzXBKhX5omrWntwUu07mBHe2HfCGjMxrSqfQO0S5rtOkTKTFaLyfJp9 A==;
X-CSE-ConnectionGUID: szAYXpuGR06AvTYRCC7xNQ==
X-CSE-MsgGUID: 1G5nlq5pQOKoaCNT/LrD1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21833942"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="21833942"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 07:23:10 -0700
X-CSE-ConnectionGUID: pDE+gOSBTUqUlV8N7OgF4w==
X-CSE-MsgGUID: qeQ1rN41Rsihqb8tl6QJcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27238798"
Received: from psurply-mobl1.ger.corp.intel.com (HELO [10.249.32.217])
 ([10.249.32.217])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 07:23:07 -0700
Message-ID: <ec27f4f8-77a0-45be-96a5-54985fb3ab25@linux.intel.com>
Date: Thu, 2 May 2024 16:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] TTM interface for managing VRAM oversubscription
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
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

Hey,

Den 2024-04-24 kl. 18:56, skrev Friedrich Vock:
> Hi everyone,
> 
> recently I've been looking into remedies for apps (in particular, newer
> games) that experience significant performance loss when they start to
> hit VRAM limits, especially on older or lower-end cards that struggle
> to fit both desktop apps and all the game data into VRAM at once.
> 
> The root of the problem lies in the fact that from userspace's POV,
> buffer eviction is very opaque: Userspace applications/drivers cannot
> tell how oversubscribed VRAM is, nor do they have fine-grained control
> over which buffers get evicted.  At the same time, with GPU APIs becoming
> increasingly lower-level and GPU-driven, only the application itself
> can know which buffers are used within a particular submission, and
> how important each buffer is. For this, GPU APIs include interfaces
> to query oversubscription and specify memory priorities: In Vulkan,
> oversubscription can be queried through the VK_EXT_memory_budget
> extension. Different buffers can also be assigned priorities via the
> VK_EXT_pageable_device_local_memory extension. Modern games, especially
> D3D12 games via vkd3d-proton, rely on oversubscription being reported and
> priorities being respected in order to perform their memory management.
> 
> However, relaying this information to the kernel via the current KMD uAPIs
> is not possible. On AMDGPU for example, all work submissions include a
> "bo list" that contains any buffer object that is accessed during the
> course of the submission. If VRAM is oversubscribed and a buffer in the
> list was evicted to system memory, that buffer is moved back to VRAM
> (potentially evicting other unused buffers).
> 
> Since the usermode driver doesn't know what buffers are used by the
> application, its only choice is to submit a bo list that contains every
> buffer the application has allocated. In case of VRAM oversubscription,
> it is highly likely that some of the application's buffers were evicted,
> which almost guarantees that some buffers will get moved around. Since
> the bo list is only known at submit time, this also means the buffers
> will get moved right before submitting application work, which is the
> worst possible time to move buffers from a latency perspective. Another
> consequence of the large bo list is that nearly all memory from other
> applications will be evicted, too. When different applications (e.g. game
> and compositor) submit work one after the other, this causes a ping-pong
> effect where each app's submission evicts the other app's memory,
> resulting in a large amount of unnecessary moves.
> 
> This overly aggressive eviction behavior led to RADV adopting a change
> that effectively allows all VRAM applications to reside in system memory
> [1].  This worked around the ping-ponging/excessive buffer moving problem,
> but also meant that any memory evicted to system memory would forever
> stay there, regardless of how VRAM is used.
> 
> My proposal aims at providing a middle ground between these extremes.
> The goals I want to meet are:
> - Userspace is accurately informed about VRAM oversubscription/how much
>    VRAM has been evicted
> - Buffer eviction respects priorities set by userspace - Wasteful
>    ping-ponging is avoided to the extent possible
> 
> I have been testing out some prototypes, and came up with this rough
> sketch of an API:
> 
> - For each ttm_resource_manager, the amount of evicted memory is tracked
>    (similarly to how "usage" tracks the memory usage). When memory is
>    evicted via ttm_bo_evict, the size of the evicted memory is added, when
>    memory is un-evicted (see below), its size is subtracted. The amount of
>    evicted memory for e.g. VRAM can be queried by userspace via an ioctl.
> 
> - Each ttm_resource_manager maintains a list of evicted buffer objects.
> 
> - ttm_mem_unevict walks the list of evicted bos for a given
>    ttm_resource_manager and tries moving evicted resources back. When a
>    buffer is freed, this function is called to immediately restore some
>    evicted memory.
> 
> - Each ttm_buffer_object independently tracks the mem_type it wants
>    to reside in.
> 
> - ttm_bo_try_unevict is added as a helper function which attempts to
>    move the buffer to its preferred mem_type. If no space is available
>    there, it fails with -ENOSPC/-ENOMEM.
> 
> - Similar to how ttm_bo_evict works, each driver can implement
>    uneviction_valuable/unevict_flags callbacks to control buffer
>    un-eviction.
> 
> This is what patches 1-10 accomplish (together with an amdgpu
> implementation utilizing the new API).
> 
> Userspace priorities could then be implemented as follows:
> 
> - TTM already manages priorities for each buffer object. These priorities
>    can be updated by userspace via a GEM_OP ioctl to inform the kernel
>    which buffers should be evicted before others. If an ioctl increases
>    the priority of a buffer, ttm_bo_try_unevict is called on that buffer to
>    try and move it back (potentially evicting buffers with a lower
>    priority)
> 
> - Buffers should never be evicted by other buffers with equal/lower
>    priority, but if there is a buffer with lower priority occupying VRAM,
>    it should be evicted in favor of the higher-priority one. This prevents
>    ping-ponging between buffers that try evicting each other and is
>    trivially implementable with an early-exit in ttm_mem_evict_first.
> 
> This is covered in patches 11-15, with the new features exposed to
> userspace in patches 16-18.
> 
> I also have a RADV branch utilizing this API at [2], which I use for
> testing.
> 
> This implementation is stil very much WIP, although the D3D12 games I
> tested already seemed to benefit from it. Nevertheless, are still quite
> a few TODOs and unresolved questions/problems.
> 
> Some kernel drivers (e.g i915) already use TTM priorities for
> kernel-internal purposes. Of course, some of the highest priorities
> should stay reserved for these purposes (with userspace being able to
> use the lower priorities).
> 
> Another problem with priorities is the possibility of apps starving other
> apps by occupying all of VRAM with high-priority allocations. A possible
> solution could be include restricting the highest priority/priorities
> to important apps like compositors.
> 
> Tying into this problem, only apps that are actively cooperating
> to reduce memory pressure can benefit from the current memory priority
> implementation. Eventually the priority system could also be utilized
> to benefit all applications, for example with the desktop environment
> boosting the priority of the currently-focused app/its cgroup (to
> provide the best QoS to the apps the user is actively using). A full
> implementation of this is probably out-of-scope for this initial proposal,
> but it's probably a good idea to consider this as a possible future use
> of the priority API.
> 
> I'm primarily looking to integrate this into amdgpu to solve the
> issues I've seen there, but I'm also interested in feedback from
> other drivers. Is this something you'd be interested in? Do you
> have any objections/comments/questions about my proposed design?
> 
> Thanks,
> Friedrich
> 
For Xe, I've been loking at using cgroups. A small prototype is available at

https://cgit.freedesktop.org/~mlankhorst/linux/log/?h=dumpcg

To stimulate discussion, I've added amdgpu support as well.
This should make it possible to isolate the compositor allocations
from the target program.

This support is still incomplete and covers vram only, but I need help 
from userspace and consensus from other drivers on how to move forward.

I'm thinking of making 3 cgroup limits:
1. Physical memory, each time a buffer is allocated, it counts towards 
it, regardless where it resides.
2. Mappable memory, all buffers allocated in sysmem or vram count 
towards this limit.
3. VRAM, only buffers residing in VRAM count here.

This ensures that VRAM can always be evicted to sysmem, by having a 
mappable memory quota, and having a sysmem reservation.

The main trouble is that when evicting, you want to charge the original 
process the changes in allocation limits, but it should be solvable.

I've been looking for someone else needing the usecase in a different 
context, so let me know what you think of the idea.

This can be generalized towards all uses of the GPU, but the compositor 
vs game thrashing is a good example of why it is useful to have.

I should still have my cgroup testcase somewhere, this is only a rebase 
of my previous proposal, but I think it fits the usecase.

Cheers,
Maarten
