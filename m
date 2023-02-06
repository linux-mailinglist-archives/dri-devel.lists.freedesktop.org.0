Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B574468B8C9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555F010E335;
	Mon,  6 Feb 2023 09:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 15BB810E33F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 09:37:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C819A113E;
 Mon,  6 Feb 2023 01:38:37 -0800 (PST)
Received: from [10.57.90.229] (unknown [10.57.90.229])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AB773F71E;
 Mon,  6 Feb 2023 01:37:53 -0800 (PST)
Message-ID: <73a36e4d-f4d0-ef62-5811-47aacb8f4475@arm.com>
Date: Mon, 6 Feb 2023 09:37:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
Content-Language: en-GB
To: Alyssa Rosenzweig <alyssa@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230201084832.1708866-1-boris.brezillon@collabora.com>
 <bf9a7562-796b-d39e-ef4b-deb8217484b4@arm.com>
 <20230203182956.4e7f8730@collabora.com> <Y91LO6PdQep9FFY6@maud>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <Y91LO6PdQep9FFY6@maud>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2023 17:58, Alyssa Rosenzweig wrote:
>>>> +struct drm_pancsf_gpu_info {
>>>> +#define DRM_PANCSF_ARCH_MAJOR(x)		((x) >> 28)
>>>> +#define DRM_PANCSF_ARCH_MINOR(x)		(((x) >> 24) & 0xf)
>>>> +#define DRM_PANCSF_ARCH_REV(x)			(((x) >> 20) & 0xf)
>>>> +#define DRM_PANCSF_PRODUCT_MAJOR(x)		(((x) >> 16) & 0xf)
>>>> +#define DRM_PANCSF_VERSION_MAJOR(x)		(((x) >> 12) & 0xf)
>>>> +#define DRM_PANCSF_VERSION_MINOR(x)		(((x) >> 4) & 0xff)
>>>> +#define DRM_PANCSF_VERSION_STATUS(x)		((x) & 0xf)
>>>> +	__u32 gpu_id;
>>>> +	__u32 gpu_rev;
>>>> +#define DRM_PANCSF_CSHW_MAJOR(x)		(((x) >> 26) & 0x3f)
>>>> +#define DRM_PANCSF_CSHW_MINOR(x)		(((x) >> 20) & 0x3f)
>>>> +#define DRM_PANCSF_CSHW_REV(x)			(((x) >> 16) & 0xf)
>>>> +#define DRM_PANCSF_MCU_MAJOR(x)			(((x) >> 10) & 0x3f)
>>>> +#define DRM_PANCSF_MCU_MINOR(x)			(((x) >> 4) & 0x3f)
>>>> +#define DRM_PANCSF_MCU_REV(x)			((x) & 0xf)
>>>> +	__u32 csf_id;
>>>> +	__u32 l2_features;
>>>> +	__u32 tiler_features;
>>>> +	__u32 mem_features;
>>>> +	__u32 mmu_features;
>>>> +	__u32 thread_features;
>>>> +	__u32 max_threads;
>>>> +	__u32 thread_max_workgroup_size;
>>>> +	__u32 thread_max_barrier_size;
>>>> +	__u32 coherency_features;
>>>> +	__u32 texture_features[4];
>>>> +	__u32 as_present;
>>>> +	__u32 core_group_count;
>>>> +	__u64 shader_present;
>>>> +	__u64 l2_present;
>>>> +	__u64 tiler_present;
>>>> +};
>>>> +
>>>> +struct drm_pancsf_csif_info {
>>>> +	__u32 csg_slot_count;
>>>> +	__u32 cs_slot_count;
>>>> +	__u32 cs_reg_count;
>>>> +	__u32 scoreboard_slot_count;
>>>> +	__u32 unpreserved_cs_reg_count;
>>>> +};
>>>> +
>>>> +struct drm_pancsf_dev_query {
>>>> +	/** @type: the query type (see enum drm_pancsf_dev_query_type). */
>>>> +	__u32 type;
>>>> +
>>>> +	/**
>>>> +	 * @size: size of the type being queried.
>>>> +	 *
>>>> +	 * If pointer is NULL, size is updated by the driver to provide the
>>>> +	 * output structure size. If pointer is not NULL, the the driver will
>>>> +	 * only copy min(size, actual_structure_size) bytes to the pointer,
>>>> +	 * and update the size accordingly. This allows us to extend query
>>>> +	 * types without breaking userspace.
>>>> +	 */
>>>> +	__u32 size;
>>>> +
>>>> +	/**
>>>> +	 * @pointer: user pointer to a query type struct.
>>>> +	 *
>>>> +	 * Pointer can be NULL, in which case, nothing is copied, but the
>>>> +	 * actual structure size is returned. If not NULL, it must point to
>>>> +	 * a location that's large enough to hold size bytes.
>>>> +	 */
>>>> +	__u64 pointer;
>>>> +};  
>>>
>>> Genuine question: is there something wrong with the panfrost 'get_param'
>>> ioctl where individual features are queried one-by-one, rather than
>>> passing a big structure back to user space.
>>
>> Well, I've just seen the Xe driver exposing things this way, and I thought
>> it was a good idea, but I don't have a strong opinion here, and if others
>> think it's preferable to stick to GET_PARAM, I'm fine with that too.
> 
> I vastly prefer the info struct, GET_PARAM isn't a great interface when
> there are large numbers of properties to query... Actually I just
> suggested to Lina that she adopt this approach for Asahi instead of the
> current GET_PARAM ioctl we have (downstream for now).

Ok, good to know there is some preference here - like I said this was a
genuine question: I'm not trying to say this is wrong.

> It isn't a *big* deal but GET_PARAM doesn't really seem better on any
> axes.
> 
>>> I ask because we've had issues in the past with trying to 'deprecate'
>>> registers - if a new version of the hardware stops providing a
>>> (meaningful) value for a register then it's hard to fix up the
>>> structures.
> 
> I'm not sure this is a big deal. If the register no longer exists
> (meaningfully), zero it out in the info structure and trust userspace to
> interpret meaningfully based on the GPU. If registers are getting
> dropped between revisions, that's obviously not great. But this should
> only change at major architecture boundaries; I don't see the added
> value of doing the interpretation in kernel instead of userspace. I say
> this with my userspace hat on, of course ;-)

Just some background:

In the early days of the Midgard DDK driver there was a structure much
like the one proposed here in which the kernel dumped the various
feature registers and passed it as a large struct to user space. User
space then ended up using that struct directly in various bits of code
all over the place.

We then ended up with the problem that it was easy to add new properties
to that struct (including derived and hideously badly defined ones like
"gpu_available_memory_size") but basically impossible to remove anything
since the struct definition was shared between user and kernel. The
kernel couldn't drop anything because old user space might need it, and
user space picked up the definition from the kernel so these problematic
members were always there to tempt user space coders.

By packing the data into a structured blob it provided the ability to:

 * Provide a logical separation between user and kernel - each could
have their own structure and it was definitively not uABI.

 * The kernel could provide backwards compat values for properties we
wanted to kill and user space could simply ignore them. They wouldn't be
around to tempt future user space coders.

 * New properties could be added without breaking old user space, and
without forever bloating the structure if we wanted to back out the
change (at worst you just burn an ID value for the structured blob).

 * (In theory) it's possible for user space to identify that a property
isn't present (e.g. running on an old kernel) rather than trying to
populate every field with a dummy value. As far as I remember this never
actually happened... user space just made up values for what was missing ;)

>>> There is obviously overhead iterating over all the register that user
>>> space cares about. Another option (used by kbase) is to return some form
>>> of structured data so a missing property can be encoded.
>>
>> I'll have a look at how kbase does that. Thanks for the pointer.
> 
> I'd be fine with the kbase approach but I don't really see the added
> value over what Boris proposed in the RFC, tbh.

My main concern is making that structure uABI. Which is because 6 years
ago I had to clean up the mess that we had in the DDK ;)

Although I'll admit that most of the problems we had with the DDK was
user space developers wanting information that the GPU driver shouldn't
have been providing (maximum amount of memory available, clock speeds
etc) or derived properties that user space could have calculated itself
(e.g. decoded GPU ID). I guess this is also one of the problems with
developing a driver in parallel with the hardware - things get added to
try the idea out, and not always reverted if it turns out badly (or even
cleaned up if it's a good idea).

Panfrost/PanCSF thankfully have much cleaner sets of properties exposed.

Steve

