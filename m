Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6F79CE58
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 12:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D406B10E3DE;
	Tue, 12 Sep 2023 10:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D8910E3DC;
 Tue, 12 Sep 2023 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694514801; x=1726050801;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8t3tN4z2KMBNN5zbS0gpM5Z4a/MQjnGZId8LnAbZIZQ=;
 b=iPcbuqlN4wzMl8f6h7V/9hz35ScOnfTgEiRIEZ8NnEcENk3jpZV3UEDL
 6TuV50h+0RQPG0SZe/FNt58m7SGEpPyoGCv8mwNcZX9j/ZmO/ICVLrnhq
 kto8+zSOPXEHXxpW7dmEEZxhX9BNPV/FVhup02Pz3c0K1/d+IYmvhK6aA
 6aEe6RrmvvbNxBq5/LZ6eijjQoqDEDU8v9+RP/iIKTbWa1VjKI+EhIKQg
 P/fnUgBAnW2rqY+nMI1O6G7HxR4skQgjtzW2CAKwyWFBgKqgYFRuB+53x
 14pC6IGV6B3ti5E6WqS+zV2lfSPn8sXxkInyaYKJ2XzmQfDAvqbtcAUtc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381037028"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381037028"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 03:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="990458988"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="990458988"
Received: from dhermamx-mobl1.amr.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 03:33:17 -0700
Message-ID: <72461288-4248-9dd9-4417-aaa72b864805@linux.intel.com>
Date: Tue, 12 Sep 2023 12:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v3 5/7] drm/gpuvm: add an abstraction for a
 VM / BO combination
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-6-dakr@redhat.com>
 <0a8799c3-1d4c-8d87-ebca-013f6541fbc4@linux.intel.com>
 <06bbb49d-974f-e3bb-f844-1509313066cc@redhat.com>
 <05b06e5d-03aa-14f4-46b1-6057c4437043@linux.intel.com>
 <ZQA4PkxEKsuukwOW@pollux>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZQA4PkxEKsuukwOW@pollux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/12/23 12:06, Danilo Krummrich wrote:
> On Tue, Sep 12, 2023 at 09:42:44AM +0200, Thomas Hellström wrote:
>> Hi, Danilo
>>
>> On 9/11/23 19:49, Danilo Krummrich wrote:
>>> Hi Thomas,
>>>
>>> On 9/11/23 19:19, Thomas Hellström wrote:
>>>> Hi, Danilo
>>>>
>>>> On 9/9/23 17:31, Danilo Krummrich wrote:
>>>>> This patch adds an abstraction layer between the drm_gpuva mappings of
>>>>> a particular drm_gem_object and this GEM object itself. The abstraction
>>>>> represents a combination of a drm_gem_object and drm_gpuvm. The
>>>>> drm_gem_object holds a list of drm_gpuvm_bo structures (the structure
>>>>> representing this abstraction), while each drm_gpuvm_bo contains
>>>>> list of
>>>>> mappings of this GEM object.
>>>>>
>>>>> This has multiple advantages:
>>>>>
>>>>> 1) We can use the drm_gpuvm_bo structure to attach it to various lists
>>>>>      of the drm_gpuvm. This is useful for tracking external and evicted
>>>>>      objects per VM, which is introduced in subsequent patches.
>>>>>
>>>>> 2) Finding mappings of a certain drm_gem_object mapped in a certain
>>>>>      drm_gpuvm becomes much cheaper.
>>>>>
>>>>> 3) Drivers can derive and extend the structure to easily represent
>>>>>      driver specific states of a BO for a certain GPUVM.
>>>>>
>>>>> The idea of this abstraction was taken from amdgpu, hence the
>>>>> credit for
>>>>> this idea goes to the developers of amdgpu.
>>>>>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> Did you consider having the drivers embed the struct drm_gpuvm_bo in
>>>> their own bo definition? I figure that would mean using the gem bo's
>>>> refcounting and providing a helper to call from the driver's bo
>>>> release. Looks like that could potentially save a lot of code? Or is
>>>> there something that won't work with that approach?
>>> There are drm_gpuvm_ops::vm_bo_alloc and drm_gpuvm_ops::vm_bo_free
>>> callback for drivers to register for that purpose.
>>>
>>> - Danilo
>> Now after looking a bit deeper, I think actually the question could be
>> rephrased as, why don't we just use the
>> struct drm_gem_object::gpuva struct as the drm_gpuvm_bo in the spirit of
>> keeping things simple? Drivers would then just embed it in their bo subclass
>> and we'd avoid unnecessary fields in the struct drm_gem_object for drivers
>> that don't do VM_BIND yet.
> struct drm_gem_object::gpuva is just a container containing a list in order to
> (currently) attach drm_gpuva structs to it and with this patch attach
> drm_gpuvm_bo structs (combination of BO + VM) to it. Doing the above basically
> means "leave everything as it is, but move the list_head of drm_gpuvs per GEM to
> the driver specific BO structure". Having a common connection between GEM
> objects and drm_gpuva structs was one of the goals of the initial GPUVA manager
> patch series however.
>
>> Sure, this won't be per bo and per vm, but it'd really only make a slight
>> difference where we have multiple VMAs per bo, where per-vm per-bo state
>> either needs to be duplicated or attached to a single vma (as in the case of
>> the external bo list).
>
> Correct, one implication is that we don't get a per VM and BO abstraction, and
> hence are left with a list of all drm_gpuva structs having the same backing BO,
> regardless of the VM.
>
> For amdgpu this was always a concern. Now that we want to keep track of external
> and evicted objects it's going to be a concern for most drivers I guess. Because
> the only structure we could use for tracking external and evicted objects we are
> left with (without having a VM_BO abstraction) is struct drm_gpuva. But this
> structure isn't unique and we need to consider cases where userspace just
> allocates rather huge BOs and creates tons of mappings from it. Running the full
> list of drm_gpuva structs (with even the ones from other VMs included) for
> adding an external or evicted object isn't very efficient. Not to mention that
> the maintenance when the mapping we've (randomly) picked as an entry for the
> external/evicted object list is unmapped, but there are still mappings left in
> the VM with the same backing BO.
For the evicted object it's not much of an issue; we maintain a list of 
vmas needing rebinding for each VM rather than objects evicted, so there 
is no or very little additional overhead there. The extobj list is 
indeed a problem if many VMAs are bound to the same bo. Not that the 
code snippets are complicated, but the list traversals would be excessive.
>
> Now, a way to get rid of the VM_BO abstraction would be to use maple trees
> instead, since then we can store drm_gem_object structs directly for each VM.
> However, Xe had concerns about using maple trees and preferred lists, plus
> having maple trees wouldn't get rid of the concerns of amdgpu not having a VM_BO
> abstraction for cases with tons of VMs and tons of mappings per BO. Hence,
> having a VM_BO abstraction enabling us to track external/evicted objects with
> lists seems to satisfy everyone's needs.

Indeed this is a tradeoff between a simple implementation that is OK for 
situations with not many VMs nor VMAs per bo vs a more complex 
implementation that optimizes for the opposite case.

So if this latter is a case we need to optimize for at this point then I 
guess it's the way to go.
(I'm in the process of adapting the xe driver to this, so I just wanted 
to bring up areas where the implementations differ quite a lot and make 
sure options are discussed).

Thanks,

Thomas


>
> - Danilo
>
>> To me that looks like a substantial amount of less code / complexity?
>>
>> /Thomas
>>
>>
>>>> Thanks,
>>>>
>>>> Thomas
>>>>
>>>>
