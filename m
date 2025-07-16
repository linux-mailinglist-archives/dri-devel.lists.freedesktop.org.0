Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2F7B07A80
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 17:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C59A10E7D1;
	Wed, 16 Jul 2025 15:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6D2910E295;
 Wed, 16 Jul 2025 15:59:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43885113E;
 Wed, 16 Jul 2025 08:58:59 -0700 (PDT)
Received: from [10.57.86.212] (unknown [10.57.86.212])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C053F694;
 Wed, 16 Jul 2025 08:59:02 -0700 (PDT)
Message-ID: <04f35ef6-d6d6-4a30-89fe-6e578c3f03be@arm.com>
Date: Wed, 16 Jul 2025 16:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] drm/panthor: Add support for repeated mappings
To: Caterina Shablia <caterina.shablia@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-8-caterina.shablia@collabora.com>
 <414aabbe-763b-4786-a85c-a2670475ece5@arm.com> <2244038.Hq7AAxBmiT@xps>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <2244038.Hq7AAxBmiT@xps>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/07/2025 16:17, Caterina Shablia wrote:
> El viernes, 11 de julio de 2025 16:03:26 (hora de verano de Europa central), 
> Steven Price escribió:
>> On 07/07/2025 18:04, Caterina Shablia wrote:
>>> From: Boris Brezillon <boris.brezillon@collabora.com>
>>>
>>> This allows us to optimize mapping of a relatively small
>>> portion of a BO over and over in a large VA range, which
>>> is useful to support Vulkan sparse bindings in an efficient
>>> way.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Co-developed-by: Caterina Shablia <caterina.shablia@collabora.com>
>>> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
>>
>> This looks like the right sort of shape. From an uAPI perspective I'm
>> not sure whether u32 is the right type for bo_repeat_range. While I
>> can't immediately see a use for having a large repeat range it seems a
>> little silly to close it off when we're going to have padding afterwards
>> anyway. Obviously the kernel would reject large values because the
>> internal APIs are only u32. But it would enable this to be fixed if we
>> ever discover a usecase without a uAPI change.
>>
>>> ---
>>>
>>>  drivers/gpu/drm/panthor/panthor_drv.c |  3 +-
>>>  drivers/gpu/drm/panthor/panthor_mmu.c | 78 ++++++++++++++++++++++++---
>>>  include/uapi/drm/panthor_drm.h        | 23 ++++++++
>>>  3 files changed, 95 insertions(+), 9 deletions(-)
>>>

[...]

>>> +static int
>>> +panthor_vm_repeated_map_pages(struct panthor_vm *vm, u64 iova, int prot,
>>> +			      struct sg_table *sgt, u64 offset, u64 
> size,
>>> +			      u64 count)
>>> +{
>>> +	/* FIXME: we really need to optimize this at the io_pgtable level. 
> */
>>
>> Do you have plans for optimizing this? 
> I personally don't have any plans, no, but maybe Boris does. I'll forward this 
> question to him once he's back from his vacation.
>> How bad is the performance
>> without optimizing?
> It's better than the alternative of poking vm_bind with a morbillion 
> drm_panthor_vm_bind_ops. More seriously, I don't really have any workloads 
> beside VK CTS to measure, for now. There's some stuff we should try to do in 
> panvk first, like using a 2M dummy_page and doing some gymnastics when mapping 
> it so we get huge mappings, which will hopefully lessen the pressure on this 
> loop.

Ok, sounds like some more investigation is needed. I'm a little wary of
a new feature which has a FIXME like this as it sounds like the design
hasn't been tested yet. I'm happy with the current code if it's indeed
"good enough", but if it's still too slow to be actually usable then I
think we need to fix it before merging rather than have a new feature
which isn't actually fast enough to use.

>>
>>> +	for (u64 i = 0; i < count; i++) {
>>> +		int ret;
>>> +
>>> +		ret = panthor_vm_map_pages(vm, iova + (size * i), prot,
>>> +					   sgt, offset, size);
>>> +		if (ret) {
>>> +			panthor_vm_unmap_pages(vm, iova, size * (i - 
> 1));
>>> +			return ret;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>

[...]

>>>
>>> +	/**
>>> +	 * @bo_repeat_range: The size of the range to be repeated.
>>> +	 *
>>> +	 * Must be zero if DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT is not set in
>>> +	 * flags.
>>> +	 *
>>> +	 * Size must be a multiple of bo_repeat_range.
>>> +	 */
>>> +	__u32 bo_repeat_range;
>>> +
>>> +	/** @pad: Padding field. MBZ. */
>>> +	__u32 pad;
>>
>> If we're going to have the padding then the kernel needs to check that
>> this padding is zero, so that it can be available for future use.
> I decided to go with your suggestion to change bo_repeat_range to be an __u64, 
> but rejecting vm_binds with values above 2^32-1 for now.

Yeah I think that's cleanest. Please do include a comment in the uapi
file about the 2^32-1 limit though.

Thanks,
Steve

