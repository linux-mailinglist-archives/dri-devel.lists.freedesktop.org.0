Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96BF3C9DBC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 13:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FF26E81F;
	Thu, 15 Jul 2021 11:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19C66E81F;
 Thu, 15 Jul 2021 11:27:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="210574210"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="210574210"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 04:27:49 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="494553513"
Received: from shyland-mobl2.ger.corp.intel.com (HELO [10.213.241.81])
 ([10.213.241.81])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 04:27:46 -0700
Subject: Re: [PATCH 3/4] drm/i915/userptr: Probe existence of backing struct
 pages upon creation
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <20210715101536.2606307-4-matthew.auld@intel.com>
 <997238fe-075b-380d-3ef2-b9f528193623@linux.intel.com>
 <YPAW9f/2oJV4UNnB@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2098303d-5b94-d9ff-7bd4-a7ba197a7431@linux.intel.com>
Date: Thu, 15 Jul 2021 12:27:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPAW9f/2oJV4UNnB@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/07/2021 12:07, Daniel Vetter wrote:
> On Thu, Jul 15, 2021 at 11:33:10AM +0100, Tvrtko Ursulin wrote:
>>
>> On 15/07/2021 11:15, Matthew Auld wrote:
>>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>>
>>> Jason Ekstrand requested a more efficient method than userptr+set-domain
>>> to determine if the userptr object was backed by a complete set of pages
>>> upon creation. To be more efficient than simply populating the userptr
>>> using get_user_pages() (as done by the call to set-domain or execbuf),
>>> we can walk the tree of vm_area_struct and check for gaps or vma not
>>> backed by struct page (VM_PFNMAP). The question is how to handle
>>> VM_MIXEDMAP which may be either struct page or pfn backed...
>>>
>>> With discrete are going to drop support for set_domain(), so offering a
>>> way to probe the pages, without having to resort to dummy batches has
>>> been requested.
>>>
>>> v2:
>>> - add new query param for the PROPBE flag, so userspace can easily
>>>     check if the kernel supports it(Jason).
>>> - use mmap_read_{lock, unlock}.
>>> - add some kernel-doc.
>>
>> 1)
>>
>> I think probing is too weak to be offered as part of the uapi. What probes
>> successfully at create time might not be there anymore at usage time. So if
>> the pointer is not trusted at one point, why should it be at a later stage?
>>
>> Only thing which works for me is populate (so get_pages) at create time. But
>> again with no guarantees they are still there at use time clearly
>> documented.
> 
> Populate is exactly as racy as probe. We don't support pinned userptr
> anymore.

Yes, wrote so myself - "..again with no guarantees they are still there 
at use time..".

Perhaps I don't understand what problem is probe supposed to solve. It 
doesn't deal 1:1 with set_domain removal since that one actually did 
get_pages so that would be populate. But fact remains regardless that if 
userspace is given a pointer it doesn't trust, _and_ wants the check it 
for this reason or that, then probe solves nothing. Unless there is 
actually at minimum some protocol to reply to whoever sent the pointer 
like "not that pointer please".

>> 2)
>>
>> I am also not a fan of getparam for individual ioctl flags since I don't
>> think it scales nicely. How about add a param which returns all supported
>> flags like I915_PARAM_USERPTR_SUPPORTED_FLAGS?
>>
>> Downside is it only works for 32-bit flag fields with getparam. Or it could
>> be a query to solve that as well.
> 
> I expect the actual userspace code will simply try with the probe flag
> first, and then without + set_domain. So strictly speaking we might not
> even have a need for the getparam.
> 
> Otoh, let's not overthink/engineer this, whatever works for userspace is
> ok imo. A new query that lists all flags is the kind of fake-generic stuff
> that will like mis-estimate where the future actually lands, e.g. how do
> you encode if we add extensions to userptr to this? Which is something we
> absolutely can, by extending the struct at the end, which doesn't even
> need a new flag.
> 
> Let's solve the immediate problem at hand, and not try to guess what more
> problems we might have in the future.

Yeah I am guessing if anyone is using some of the other userptr flags 
they don't have a getparam for that either. At least that would be 
consolidated with I915_PARAM_USERPTR_SUPPORTED_FLAGS. There is no 
requirement that getparam needs to keep supporting future extensions to 
the struct itself, equally as I915_PARAM_HAS_USERPTR_PROBE is directly 
tied to the same flags field, only a subset of it.

Regards,

Tvrtko

> -Daniel
> 
>> Regards,
>>
>> Tvrtko
>>
>>> Testcase: igt/gem_userptr_blits/probe
>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Ramalingam C <ramalingam.c@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 40 ++++++++++++++++++++-
>>>    drivers/gpu/drm/i915/i915_getparam.c        |  3 ++
>>>    include/uapi/drm/i915_drm.h                 | 18 ++++++++++
>>>    3 files changed, 60 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>> index 56edfeff8c02..fd6880328596 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>>> @@ -422,6 +422,33 @@ static const struct drm_i915_gem_object_ops i915_gem_userptr_ops = {
>>>    #endif
>>> +static int
>>> +probe_range(struct mm_struct *mm, unsigned long addr, unsigned long len)
>>> +{
>>> +	const unsigned long end = addr + len;
>>> +	struct vm_area_struct *vma;
>>> +	int ret = -EFAULT;
>>> +
>>> +	mmap_read_lock(mm);
>>> +	for (vma = find_vma(mm, addr); vma; vma = vma->vm_next) {
>>> +		if (vma->vm_start > addr)
>>> +			break;
>>> +
>>> +		if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
>>> +			break;
>>> +
>>> +		if (vma->vm_end >= end) {
>>> +			ret = 0;
>>> +			break;
>>> +		}
>>> +
>>> +		addr = vma->vm_end;
>>> +	}
>>> +	mmap_read_unlock(mm);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>    /*
>>>     * Creates a new mm object that wraps some normal memory from the process
>>>     * context - user memory.
>>> @@ -477,7 +504,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>>>    	}
>>>    	if (args->flags & ~(I915_USERPTR_READ_ONLY |
>>> -			    I915_USERPTR_UNSYNCHRONIZED))
>>> +			    I915_USERPTR_UNSYNCHRONIZED |
>>> +			    I915_USERPTR_PROBE))
>>>    		return -EINVAL;
>>>    	if (i915_gem_object_size_2big(args->user_size))
>>> @@ -504,6 +532,16 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>>>    			return -ENODEV;
>>>    	}
>>> +	if (args->flags & I915_USERPTR_PROBE) {
>>> +		/*
>>> +		 * Check that the range pointed to represents real struct
>>> +		 * pages and not iomappings (at this moment in time!)
>>> +		 */
>>> +		ret = probe_range(current->mm, args->user_ptr, args->user_size);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>>    #ifdef CONFIG_MMU_NOTIFIER
>>>    	obj = i915_gem_object_alloc();
>>>    	if (obj == NULL)
>>> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
>>> index 24e18219eb50..d6d2e1a10d14 100644
>>> --- a/drivers/gpu/drm/i915/i915_getparam.c
>>> +++ b/drivers/gpu/drm/i915/i915_getparam.c
>>> @@ -163,6 +163,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>>>    	case I915_PARAM_PERF_REVISION:
>>>    		value = i915_perf_ioctl_version();
>>>    		break;
>>> +	case I915_PARAM_HAS_USERPTR_PROBE:
>>> +		value = true;
>>> +		break;
>>>    	default:
>>>    		DRM_DEBUG("Unknown parameter %d\n", param->param);
>>>    		return -EINVAL;
>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>> index e20eeeca7a1c..2e4112bf4d38 100644
>>> --- a/include/uapi/drm/i915_drm.h
>>> +++ b/include/uapi/drm/i915_drm.h
>>> @@ -674,6 +674,9 @@ typedef struct drm_i915_irq_wait {
>>>     */
>>>    #define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
>>> +/* Query if the kernel supports the I915_USERPTR_PROBE flag. */
>>> +#define I915_PARAM_HAS_USERPTR_PROBE 56
>>> +
>>>    /* Must be kept compact -- no holes and well documented */
>>>    typedef struct drm_i915_getparam {
>>> @@ -2178,12 +2181,27 @@ struct drm_i915_gem_userptr {
>>>    	 * through the GTT. If the HW can't support readonly access, an error is
>>>    	 * returned.
>>>    	 *
>>> +	 * I915_USERPTR_PROBE:
>>> +	 *
>>> +	 * Probe the provided @user_ptr range and validate that the @user_ptr is
>>> +	 * indeed pointing to normal memory and that the range is also valid.
>>> +	 * For example if some garbage address is given to the kernel, then this
>>> +	 * should complain.
>>> +	 *
>>> +	 * Returns -EFAULT if the probe failed.
>>> +	 *
>>> +	 * Note that this doesn't populate the backing pages.
>>> +	 *
>>> +	 * The kernel supports this feature if I915_PARAM_HAS_USERPTR_PROBE
>>> +	 * returns a non-zero value.
>>> +	 *
>>>    	 * I915_USERPTR_UNSYNCHRONIZED:
>>>    	 *
>>>    	 * NOT USED. Setting this flag will result in an error.
>>>    	 */
>>>    	__u32 flags;
>>>    #define I915_USERPTR_READ_ONLY 0x1
>>> +#define I915_USERPTR_PROBE 0x2
>>>    #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
>>>    	/**
>>>    	 * @handle: Returned handle for the object.
>>>
> 
