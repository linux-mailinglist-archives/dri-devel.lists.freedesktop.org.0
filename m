Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E04BBEE3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE3A10E65E;
	Fri, 18 Feb 2022 18:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC1310E635;
 Fri, 18 Feb 2022 18:01:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id EAA391F46EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645207292;
 bh=Iuy2G7MDQdbOsm1aB6YG2bA7J9et0uNrkLFCEN2/ly4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ui7GDo3jnjj/go+nyIX7ex/aIZpTzGXTKOTrk5XoB2ONccqYlioyOqUHJWgoXdNJk
 MO3O54j3YRs3ym8OYDPMwh0AzvSB55jjHjlcsKrvstMX4g1gYdMmFgYZZmnMbdq/ZQ
 vfgNXE69Dubmc7U06wA2MYbCRX48Ucm5kpHcOHTAxYsxZErXoPze8OjrsrsTvGRvWo
 7WFBtcHIgxhPUTYu22xWXj8NqjmBRZtl7QuOHbVCEUzTsZBSyeVikE9a5xZcF3FOps
 MplHknfHjuMZQI+MJhwDGmcEgag6KyW99mjyZ7y4sSRG0SthHtQRpJwjiToa4Ocs1w
 N55/BQ9SWJLnQ==
Message-ID: <78df4b73-9b2d-670b-a6b0-a45b476f1f0a@collabora.com>
Date: Fri, 18 Feb 2022 18:06:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 5/5] drm/i915/uapi: document behaviour for DG2 64K
 support
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>
References: <20220208203419.1094362-1-bob.beckett@collabora.com>
 <20220208203419.1094362-6-bob.beckett@collabora.com>
 <87ee40ojpc.fsf@jljusten-skl> <20220218134735.GB3646@intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <20220218134735.GB3646@intel.com>
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
Cc: Tony Ye <tony.ye@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 mesa-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18/02/2022 13:47, Ramalingam C wrote:
> On 2022-02-17 at 20:57:35 -0800, Jordan Justen wrote:
>> Robert Beckett <bob.beckett@collabora.com> writes:
>>
>>> From: Matthew Auld <matthew.auld@intel.com>
>>>
>>> On discrete platforms like DG2, we need to support a minimum page size
>>> of 64K when dealing with device local-memory. This is quite tricky for
>>> various reasons, so try to document the new implicit uapi for this.
>>>
>>> v3: fix typos and less emphasis
>>> v2: Fixed suggestions on formatting [Daniel]
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
>>> Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> cc: Simon Ser <contact@emersion.fr>
>>> cc: Pekka Paalanen <ppaalanen@gmail.com>
>>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>>> Cc: Kenneth Graunke <kenneth@whitecape.org>
>>> Cc: mesa-dev@lists.freedesktop.org
>>> Cc: Tony Ye <tony.ye@intel.com>
>>> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
>>> ---
>>>   include/uapi/drm/i915_drm.h | 44 ++++++++++++++++++++++++++++++++-----
>>>   1 file changed, 39 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>> index 5e678917da70..77e5e74c32c1 100644
>>> --- a/include/uapi/drm/i915_drm.h
>>> +++ b/include/uapi/drm/i915_drm.h
>>> @@ -1118,10 +1118,16 @@ struct drm_i915_gem_exec_object2 {
>>>   	/**
>>>   	 * When the EXEC_OBJECT_PINNED flag is specified this is populated by
>>>   	 * the user with the GTT offset at which this object will be pinned.
>>> +	 *
>>>   	 * When the I915_EXEC_NO_RELOC flag is specified this must contain the
>>>   	 * presumed_offset of the object.
>>> +	 *
>>>   	 * During execbuffer2 the kernel populates it with the value of the
>>>   	 * current GTT offset of the object, for future presumed_offset writes.
>>> +	 *
>>> +	 * See struct drm_i915_gem_create_ext for the rules when dealing with
>>> +	 * alignment restrictions with I915_MEMORY_CLASS_DEVICE, on devices with
>>> +	 * minimum page sizes, like DG2.
>>>   	 */
>>>   	__u64 offset;
>>>   
>>> @@ -3145,11 +3151,39 @@ struct drm_i915_gem_create_ext {
>>>   	 *
>>>   	 * The (page-aligned) allocated size for the object will be returned.
>>>   	 *
>>> -	 * Note that for some devices we have might have further minimum
>>> -	 * page-size restrictions(larger than 4K), like for device local-memory.
>>> -	 * However in general the final size here should always reflect any
>>> -	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
>>> -	 * extension to place the object in device local-memory.
>>> +	 *
>>> +	 * DG2 64K min page size implications:
>>> +	 *
>>> +	 * On discrete platforms, starting from DG2, we have to contend with GTT
>>> +	 * page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
>>> +	 * objects.  Specifically the hardware only supports 64K or larger GTT
>>> +	 * page sizes for such memory. The kernel will already ensure that all
>>> +	 * I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
>>> +	 * sizes underneath.
>>> +	 *
>>> +	 * Note that the returned size here will always reflect any required
>>> +	 * rounding up done by the kernel, i.e 4K will now become 64K on devices
>>> +	 * such as DG2.
>>> +	 *
>>> +	 * Special DG2 GTT address alignment requirement:
>>> +	 *
>>> +	 * The GTT alignment will also need to be at least 2M for such objects.
>>> +	 *
>>> +	 * Note that due to how the hardware implements 64K GTT page support, we
>>> +	 * have some further complications:
>>> +	 *
>>> +	 *   1) The entire PDE (which covers a 2MB virtual address range), must
>>> +	 *   contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
>>> +	 *   PDE is forbidden by the hardware.
>>> +	 *
>>> +	 *   2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
>>> +	 *   objects.
>>> +	 *
>>> +	 * To keep things simple for userland, we mandate that any GTT mappings
>>> +	 * must be aligned to and rounded up to 2MB.
>>
>> Could I get a clarification about this "rounded up" part.
>>
>> Currently Mesa is aligning the start of each and every buffer VMA to be
>> 2MiB aligned. But, we are *not* taking any steps to "round up" the size
>> of buffers to 2MiB alignment.
>>
>> Bob's Mesa MR from a while ago,
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14599
>>
>> was trying to add this "round up" size for buffers. We didn't accept
>> this MR because we thought if we have ensured that no other buffer will
>> use the same 2MiB VMA range, then it should not be required.
>>
>> If what we are doing is ok, then maybe this "round up" language should
>> be dropped? Or, perhaps the "round up" mentioned here isn't implying we
>> must align the size of buffers that we create, and I'm misinterpreting
>> this.
> Jordan,
> 
> as per my understanding this size rounding up to 2MB is for the VMA mapping,
> not for the buffer size.
correct, only the vma is rounded up

> 
> Even if we drop this rounding up of vma size to 2MB but align the VMA
> start to 2MB address then also this should be fine. Becasue the remaining of the
> last PDE(2MB) will never be used for any other GTT mapping as the
> starting addr wont align to 2MB.
The kernel has to handle 4K pages also, which could in theory attempt to 
be placed in any remaining space within a 2MB region, which is not 
supported. For this reason, the kernel rounds up the vma to next 2MB to 
ensure no 4K pages can treat the remaining space as a candidate for 
placement.

For mesa, this is not required as they only ever use 2MB alignment for 
all buffers, hence the denial of the mesa mr.

Internally, the kernel will still round up the vma reservations to 
prevent any kernel 4K buffers being situated in remaining space.

If desired, we can make the wording clearer, maybe something like:

"To keep things simple for userland, we mandate that any GTT mappings
must be aligned to 2MB. The kernel will internally pad them out to the 
next 2MB boundary"


> 
> Bob, Is the above understanding is right? if so could we drop the
> requirement of mapping the vma size to 2MB?
> 
> Ram
>>
>> -Jordan
>>
>>> As this only wastes virtual
>>> +	 * address space and avoids userland having to copy any needlessly
>>> +	 * complicated PDE sharing scheme (coloring) and only affects DG2, this
>>> +	 * is deemed to be a good compromise.
>>>   	 */
>>>   	__u64 size;
>>>   	/**
>>> -- 
>>> 2.25.1
