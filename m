Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF586962B3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B212D10E89F;
	Tue, 14 Feb 2023 11:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800D110E899
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 11:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676375573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqSS5X4d78hIk2vne5OLZk+Yrgv94xCgWd93scQUWkg=;
 b=F2wBGTM3CJAiRKEYhQvjdHkYYeICO9Dk9Cbq1f26ua38G9jRTtB/qPDld2cv9z4uw/EDk8
 HsczH2qQMrsxBfrNrOQjjqNi7atEiiVWkOB3TmgalBfQsqabRLvls1PD5NAwFcNU7Ibpnn
 6k+I3YfNU985I1wmx63rho5izeVLxfc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-HJs6x6o5MEemOJyVoexcTA-1; Tue, 14 Feb 2023 06:52:51 -0500
X-MC-Unique: HJs6x6o5MEemOJyVoexcTA-1
Received: by mail-ej1-f69.google.com with SMTP id
 ud13-20020a170907c60d00b0088d773d11d6so9691908ejc.17
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 03:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqSS5X4d78hIk2vne5OLZk+Yrgv94xCgWd93scQUWkg=;
 b=FTXi+9lE4YHR8O/6p+1gcJ7mly7RV/UggjKAWJphYI7CzeVZ9e5OlN0knF/iHDCs3V
 5RVCaiTJ06wjZk4p1QMOv09Tiy4NJMoksNcRju2vUy4Pwy2tXxzYQ8WSl5p4X9aWPb13
 IVUUfwafvqCNkqT6962b7dYpvSj4V78CFnpib/x7IDhlzEsXFUSinjCCIYkrj1XbDoWP
 UvGT348gMe37corYD6rn1rmPpprufPoXsp9hjZcy1pAdeYMILijZyM63iZ5tWJQ7JCmb
 D/uBTbWLZOhyirWNTu6rCqSiX5lhvYRWJvqwuyBmKg8ALTX5832CwEh0IvXP99qK4TdG
 PhVw==
X-Gm-Message-State: AO0yUKU8WVtWUAOXuxMPgRx3A9KeUBlrHL5/FtZztwH04t/kC5/DvRGS
 VVQ3zjLcCVFOhoGhlpcr7UL4TX3cBlblu5nCdRbx2I++rntTDSMtUNA9dJuOJSNsAMg+UpyrgWI
 AkvUWNuztMT8C/uH/l+621uePyLXt
X-Received: by 2002:a17:906:e0d1:b0:88d:72c0:611 with SMTP id
 gl17-20020a170906e0d100b0088d72c00611mr2319897ejb.3.1676375568761; 
 Tue, 14 Feb 2023 03:52:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+4uprGunEnTpCZ9inVnaHGi913UQGoUr03ycj0Aud1KQ2xYu6UUA0kc0mW7gNk2WtW2e7kfQ==
X-Received: by 2002:a17:906:e0d1:b0:88d:72c0:611 with SMTP id
 gl17-20020a170906e0d100b0088d72c00611mr2319837ejb.3.1676375567713; 
 Tue, 14 Feb 2023 03:52:47 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 mv9-20020a170907838900b0087bd2ebe474sm8134290ejc.208.2023.02.14.03.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 03:52:47 -0800 (PST)
Message-ID: <6a65dcaf-cf43-1d9e-aadf-e71211729a8d@redhat.com>
Date: Tue, 14 Feb 2023 12:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next 03/14] drm: manager to keep track of GPUs VA
 mappings
To: Matthew Brost <matthew.brost@intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-4-dakr@redhat.com>
 <Y91GQIMwjsQ3QT/M@DUT025-TGLU.fm.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y91GQIMwjsQ3QT/M@DUT025-TGLU.fm.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: tzimmermann@suse.de, corbet@lwn.net, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bskeggs@redhat.com, jason@jlekstrand.net,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/3/23 18:37, Matthew Brost wrote:
> On Wed, Jan 18, 2023 at 07:12:45AM +0100, Danilo Krummrich wrote:
>> This adds the infrastructure for a manager implementation to keep track
>> of GPU virtual address (VA) mappings.
>>
>> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
>> start implementing, allow userspace applications to request multiple and
>> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
>> intended to serve the following purposes in this context.
>>
>> 1) Provide a dedicated range allocator to track GPU VA allocations and
>>     mappings, making use of the drm_mm range allocator.
>>
>> 2) Generically connect GPU VA mappings to their backing buffers, in
>>     particular DRM GEM objects.
>>
>> 3) Provide a common implementation to perform more complex mapping
>>     operations on the GPU VA space. In particular splitting and merging
>>     of GPU VA mappings, e.g. for intersecting mapping requests or partial
>>     unmap requests.
>>
> 
> Over the past week I've hacked together a PoC port of Xe to GPUVA [1], so
> far it seems really promising. 95% of the way to being feature
> equivalent of the current Xe VM bind implementation and have line of
> sight to getting sparse bindings implemented on top of GPUVA too. IMO
> this has basically everything we need for Xe with a few tweaks.
> 
> I am out until 2/14 but wanted to get my thoughts / suggestions out on
> the list before I leave.

Thanks for your work on that!

> 1. GPUVA post didn't support the way Xe does userptrs - a NULL GEM. I
> believe with [2], [3], and [4] GPUVA will support NULL GEMs. Also my
> thinking sparse binds will also have NULL GEMs, more on sparse bindings
> below.
> 
> 2. I agree with Christian that drm_mm probably isn't what we want to
> base the GPUVA implementation on, rather a RB tree or Maple tree has
> been discussed. The implementation should be fairly easy to tune once we
> have benchmarks running so not to concerned here as we can figure this
> out down the line.
> 
> 3. In Xe we want create xe_vm_op list which inherits from drm_gpuva_op
> I've done this with a hack [5], I believe when we rebase we can do this
> with a custom callback to allocate a large op size.
> 
> 4. I'd like add user bits to drm_gpuva_flags like I do in [6]. This is
> similar to DMA_FENCE_FLAG_USER_BITS.
> 
> 5. In Xe we have VM prefetch operation which is needed for our compute
> UMD with page faults. I'd like add prefetch type of operation like we do
> in [7].
> 
> 6. In Xe we have VM unbind all mappings for a GEM IOCTL, I'd like to add
> support to generate this operation list to GPUVA like we do in [8].
> 
> 7. I've thought about how Xe will implement sparse mappings (read 0,
> writes dropped). My current thinking is a sparse mapping will be
> represented as a drm_gpuva rather than region like in Nouveau. Making
> regions optional to me seems likes good idea rather than forcing the
> user of GPUVA code to create 1 large region for the manager as I
> currently do in the Xe PoC.
> 
> 8. Personally I'd like the caller to own the locking for GEM drm_gpuva
> list (drm_gpuva_link_*, drm_gpuva_unlink_* functions). In Xe we almost
> certainly will have the GEM dma-resv lock when we touch this list so an
> extra lock here is redundant. Also it kinda goofy that caller owns the
> for drm_gpuva insertion / removal but not the locking for this list.

You really mean having the dma-resv lock aquired or have a fence on the 
dma_resv obj?

In Nouveau I map/unmap gpuvas in the ttm_device_funcs' move() callback. 
I only validate() and add a dma_resv fence to GEMs of new mappings. For 
unmap / remap operations I just take the GEMs gpuva list lock and check 
whether the GEM is evicted currently. If it is evicted currently (and 
hence unmapped) and I'm on a remap operation I can just do the update on 
the GPUVA space, since latest on the next EXEC ioctl() the corresponding 
GEM is validated and hence re-mapped correctly. If it's an unmap 
operation I just need to remove the GPUVA, since the corresponding 
mapping is already unmapped when it's GEM is evicted. If it's not 
evicted I proceed as usual.

Anyway, drm_gpuva_insert() and drm_gpuva_remove() (was 
drm_gpuva_destroy() before) do *not* implicitly add the gpuva to the 
GEM's gpuva list anymore. Instead there is only drm_gpuva_link() and 
drm_gpuva_unlink(), not doing any lockdep checks, but clearly 
documenting that the caller is resposible to take care of mutual exclusion.

> 
> WRT to Christian thoughts on a common uAPI rules for VM binds, I kinda
> like that idea but I don't think that is necessary. All of pur uAPI
> should be close but also the GPUVA implementation should be flexible
> enough to fit all of our needs and I think for the most part it is.
> 
> Let me know what everything thinks about this. It would be great if when
> I'm back on 2/14 I can rebase the Xe port to GPUVA on another version of
> the GPUVA code and get sparse binding support implementation. Also I'd
> like to get GPUVA merged in the Xe repo ASAP as our VM bind code badly
> needed to be cleaned and this was the push we needed to make this
> happen.

All those are great improvements and some of I will pick up for Nouveau 
as well.

Except for switching from drm_mm to maple_tree I implemented all other 
suggestions. You can find them here: 
https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-fixes

I'm just about to start moving the GPUVA Manager to use maple_tree 
instead and plan to send a V2 by end of this week.

- Danilo

> 
> Matt
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/314
> [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/314/diffs?commit_id=2ae21d7a3f52e5eb2c105ed8ae231471274bdc36
> [3] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/314/diffs?commit_id=49fca9f5d96201f5cbd1b19c7ff17eedfac65cdc
> [4] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/314/diffs?commit_id=61fa6b1e1f10e791ae82358fa971b04421d53024
> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/314/diffs?commit_id=87fc08dcf0840e794b38269fe4c6a95d088d79ec
> [6] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/314/diffs?commit_id=a4826c22f6788bc29906ffa263c1cd3c4661fa77
> [7] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/314/diffs?commit_id=f008bbb55b213868e52c7b9cda4c1bfb95af6aee
> [8] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/314/diffs?commit_id=41f4f71c05d04d2b17d988dd95369b5df2d7f681
> 
>> Idea-suggested-by: Dave Airlie <airlied@redhat.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   Documentation/gpu/drm-mm.rst    |   31 +
>>   drivers/gpu/drm/Makefile        |    1 +
>>   drivers/gpu/drm/drm_gem.c       |    3 +
>>   drivers/gpu/drm/drm_gpuva_mgr.c | 1323 +++++++++++++++++++++++++++++++
>>   include/drm/drm_drv.h           |    6 +
>>   include/drm/drm_gem.h           |   75 ++
>>   include/drm/drm_gpuva_mgr.h     |  527 ++++++++++++
>>   7 files changed, 1966 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>>   create mode 100644 include/drm/drm_gpuva_mgr.h
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index a52e6f4117d6..c9f120cfe730 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
>>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>>      :export:
>>   
>> +DRM GPU VA Manager
>> +==================
>> +
>> +Overview
>> +--------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
>> +   :doc: Overview
>> +
>> +Split and Merge
>> +---------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
>> +   :doc: Split and Merge
>> +
>> +Locking
>> +-------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
>> +   :doc: Locking
>> +
>> +
>> +DRM GPU VA Manager Function References
>> +--------------------------------------
>> +
>> +.. kernel-doc:: include/drm/drm_gpuva_mgr.h
>> +   :internal:
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
>> +   :export:
>> +
>>   DRM Buddy Allocator
>>   ===================
>>   
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 4fe190aee584..de2ffca3b6e4 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -45,6 +45,7 @@ drm-y := \
>>   	drm_vblank.o \
>>   	drm_vblank_work.o \
>>   	drm_vma_manager.o \
>> +	drm_gpuva_mgr.o \
>>   	drm_writeback.o
>>   drm-$(CONFIG_DRM_LEGACY) += \
>>   	drm_agpsupport.o \
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 59a0bb5ebd85..65115fe88627 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -164,6 +164,9 @@ void drm_gem_private_object_init(struct drm_device *dev,
>>   	if (!obj->resv)
>>   		obj->resv = &obj->_resv;
>>   
>> +	if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
>> +		drm_gem_gpuva_init(obj);
>> +
>>   	drm_vma_node_reset(&obj->vma_node);
>>   	INIT_LIST_HEAD(&obj->lru_node);
>>   }
>> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
>> new file mode 100644
>> index 000000000000..e665f642689d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
>> @@ -0,0 +1,1323 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022 Red Hat.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * Authors:
>> + *     Danilo Krummrich <dakr@redhat.com>
>> + *
>> + */
>> +
>> +#include <drm/drm_gem.h>
>> +#include <drm/drm_gpuva_mgr.h>
>> +
>> +/**
>> + * DOC: Overview
>> + *
>> + * The DRM GPU VA Manager, represented by struct drm_gpuva_manager keeps track
>> + * of a GPU's virtual address (VA) space and manages the corresponding virtual
>> + * mappings represented by &drm_gpuva objects. It also keeps track of the
>> + * mapping's backing &drm_gem_object buffers.
>> + *
>> + * &drm_gem_object buffers maintain a list (and a corresponding list lock) of
>> + * &drm_gpuva objects representing all existent GPU VA mappings using this
>> + * &drm_gem_object as backing buffer.
>> + *
>> + * A GPU VA mapping can only be created within a previously allocated
>> + * &drm_gpuva_region, which represents a reserved portion of the GPU VA space.
>> + * GPU VA mappings are not allowed to span over a &drm_gpuva_region's boundary.
>> + *
>> + * GPU VA regions can also be flagged as sparse, which allows drivers to create
>> + * sparse mappings for a whole GPU VA region in order to support Vulkan
>> + * 'Sparse Resources'.
>> + *
>> + * The GPU VA manager internally uses the &drm_mm range allocator to manage the
>> + * &drm_gpuva mappings and the &drm_gpuva_regions within a GPU's virtual address
>> + * space.
>> + *
>> + * Besides the GPU VA space regions (&drm_gpuva_region) allocated by a driver
>> + * the &drm_gpuva_manager contains a special region representing the portion of
>> + * VA space reserved by the kernel. This node is initialized together with the
>> + * GPU VA manager instance and removed when the GPU VA manager is destroyed.
>> + *
>> + * In a typical application drivers would embed struct drm_gpuva_manager,
>> + * struct drm_gpuva_region and struct drm_gpuva within their own driver
>> + * specific structures, there won't be any memory allocations of it's own nor
>> + * memory allocations of &drm_gpuva or &drm_gpuva_region entries.
>> + */
>> +
>> +/**
>> + * DOC: Split and Merge
>> + *
>> + * The DRM GPU VA manager also provides an algorithm implementing splitting and
>> + * merging of existent GPU VA mappings with the ones that are requested to be
>> + * mapped or unmapped. This feature is required by the Vulkan API to implement
>> + * Vulkan 'Sparse Memory Bindings' - drivers UAPIs often refer to this as
>> + * VM BIND.
>> + *
>> + * Drivers can call drm_gpuva_sm_map_ops_create() to obtain a list of map, unmap
>> + * and remap operations for a given newly requested mapping. This list
>> + * represents the set of operations to execute in order to integrate the new
>> + * mapping cleanly into the current state of the GPU VA space.
>> + *
>> + * Depending on how the new GPU VA mapping intersects with the existent mappings
>> + * of the GPU VA space the &drm_gpuva_ops contain an arbitrary amount of unmap
>> + * operations, a maximum of two remap operations and a single map operation.
>> + * The set of operations can also be empty if no operation is required, e.g. if
>> + * the requested mapping already exists in the exact same way.
>> + *
>> + * The single map operation, if existent, represents the original map operation
>> + * requested by the caller. Please note that this operation might be altered
>> + * comparing it with the original map operation, e.g. because it was merged with
>> + * an already  existent mapping. Hence, drivers must execute this map operation
>> + * instead of the original one they passed to drm_gpuva_sm_map_ops_create().
>> + *
>> + * &drm_gpuva_op_unmap contains a 'keep' field, which indicates whether the
>> + * &drm_gpuva to unmap is physically contiguous with the original mapping
>> + * request. Optionally, if 'keep' is set, drivers may keep the actual page table
>> + * entries for this &drm_gpuva, adding the missing page table entries only and
>> + * update the &drm_gpuva_manager's view of things accordingly.
>> + *
>> + * Drivers may do the same optimization, namely delta page table updates, also
>> + * for remap operations. This is possible since &drm_gpuva_op_remap consists of
>> + * one unmap operation and one or two map operations, such that drivers can
>> + * derive the page table update delta accordingly.
>> + *
>> + * Note that there can't be more than two existent mappings to split up, one at
>> + * the beginning and one at the end of the new mapping, hence there is a
>> + * maximum of two remap operations.
>> + *
>> + * Generally, the DRM GPU VA manager never merges mappings across the
>> + * boundaries of &drm_gpuva_regions. This is the case since merging between
>> + * GPU VA regions would result into unmap and map operations to be issued for
>> + * both regions involved although the original mapping request was referred to
>> + * one specific GPU VA region only. Since the other GPU VA region, the one not
>> + * explicitly requested to be altered, might be in use by the GPU, we are not
>> + * allowed to issue any map/unmap operations for this region.
>> + *
>> + * Note that before calling drm_gpuva_sm_map_ops_create() again with another
>> + * mapping request it is necessary to update the &drm_gpuva_manager's view of
>> + * the GPU VA space. The previously obtained operations must be either fully
>> + * processed or completely abandoned.
>> + *
>> + * To update the &drm_gpuva_manager's view of the GPU VA space
>> + * drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
>> + * drm_gpuva_destroy_unlocked() should be used.
>> + *
>> + * Analogue to drm_gpuva_sm_map_ops_create() drm_gpuva_sm_unmap_ops_create()
>> + * provides drivers a the list of operations to be executed in order to unmap
>> + * a range of GPU VA space. The logic behind this functions is way simpler
>> + * though: For all existent mappings enclosed by the given range unmap
>> + * operations are created. For mappings which are only partically located within
>> + * the given range, remap operations are created such that those mappings are
>> + * split up and re-mapped partically.
>> + *
>> + * The following paragraph depicts the basic constellations of existent GPU VA
>> + * mappings, a newly requested mapping and the resulting mappings as implemented
>> + * by drm_gpuva_sm_map_ops_create()  - it doesn't cover arbitrary combinations
>> + * of those constellations.
>> + *
>> + * ::
>> + *
>> + *	1) Existent mapping is kept.
>> + *	----------------------------
>> + *
>> + *	     0     a     1
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	     0     a     1
>> + *	req: |-----------| (bo_offset=n)
>> + *
>> + *	     0     a     1
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *
>> + *	2) Existent mapping is replaced.
>> + *	--------------------------------
>> + *
>> + *	     0     a     1
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	     0     a     1
>> + *	req: |-----------| (bo_offset=m)
>> + *
>> + *	     0     a     1
>> + *	new: |-----------| (bo_offset=m)
>> + *
>> + *
>> + *	3) Existent mapping is replaced.
>> + *	--------------------------------
>> + *
>> + *	     0     a     1
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	     0     b     1
>> + *	req: |-----------| (bo_offset=n)
>> + *
>> + *	     0     b     1
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *
>> + *	4) Existent mapping is replaced.
>> + *	--------------------------------
>> + *
>> + *	     0  a  1
>> + *	old: |-----|       (bo_offset=n)
>> + *
>> + *	     0     a     2
>> + *	req: |-----------| (bo_offset=n)
>> + *
>> + *	     0     a     2
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *	Note: We expect to see the same result for a request with a different bo
>> + *	      and/or bo_offset.
>> + *
>> + *
>> + *	5) Existent mapping is split.
>> + *	-----------------------------
>> + *
>> + *	     0     a     2
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	     0  b  1
>> + *	req: |-----|       (bo_offset=n)
>> + *
>> + *	     0  b  1  a' 2
>> + *	new: |-----|-----| (b.bo_offset=n, a.bo_offset=n+1)
>> + *
>> + *	Note: We expect to see the same result for a request with a different bo
>> + *	      and/or non-contiguous bo_offset.
>> + *
>> + *
>> + *	6) Existent mapping is kept.
>> + *	----------------------------
>> + *
>> + *	     0     a     2
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	     0  a  1
>> + *	req: |-----|       (bo_offset=n)
>> + *
>> + *	     0     a     2
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *
>> + *	7) Existent mapping is split.
>> + *	-----------------------------
>> + *
>> + *	     0     a     2
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	           1  b  2
>> + *	req:       |-----| (bo_offset=m)
>> + *
>> + *	     0  a  1  b  2
>> + *	new: |-----|-----| (a.bo_offset=n,b.bo_offset=m)
>> + *
>> + *
>> + *	8) Existent mapping is kept.
>> + *	----------------------------
>> + *
>> + *	      0     a     2
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	           1  a  2
>> + *	req:       |-----| (bo_offset=n+1)
>> + *
>> + *	     0     a     2
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *
>> + *	9) Existent mapping is split.
>> + *	-----------------------------
>> + *
>> + *	     0     a     2
>> + *	old: |-----------|       (bo_offset=n)
>> + *
>> + *	           1     b     3
>> + *	req:       |-----------| (bo_offset=m)
>> + *
>> + *	     0  a  1     b     3
>> + *	new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
>> + *
>> + *
>> + *	10) Existent mapping is merged.
>> + *	-------------------------------
>> + *
>> + *	     0     a     2
>> + *	old: |-----------|       (bo_offset=n)
>> + *
>> + *	           1     a     3
>> + *	req:       |-----------| (bo_offset=n+1)
>> + *
>> + *	     0        a        3
>> + *	new: |-----------------| (bo_offset=n)
>> + *
>> + *
>> + *	11) Existent mapping is split.
>> + *	------------------------------
>> + *
>> + *	     0        a        3
>> + *	old: |-----------------| (bo_offset=n)
>> + *
>> + *	           1  b  2
>> + *	req:       |-----|       (bo_offset=m)
>> + *
>> + *	     0  a  1  b  2  a' 3
>> + *	new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
>> + *
>> + *
>> + *	12) Existent mapping is kept.
>> + *	-----------------------------
>> + *
>> + *	     0        a        3
>> + *	old: |-----------------| (bo_offset=n)
>> + *
>> + *	           1  a  2
>> + *	req:       |-----|       (bo_offset=n+1)
>> + *
>> + *	     0        a        3
>> + *	old: |-----------------| (bo_offset=n)
>> + *
>> + *
>> + *	13) Existent mapping is replaced.
>> + *	---------------------------------
>> + *
>> + *	           1  a  2
>> + *	old:       |-----| (bo_offset=n)
>> + *
>> + *	     0     a     2
>> + *	req: |-----------| (bo_offset=n)
>> + *
>> + *	     0     a     2
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *	Note: We expect to see the same result for a request with a different bo
>> + *	      and/or non-contiguous bo_offset.
>> + *
>> + *
>> + *	14) Existent mapping is replaced.
>> + *	---------------------------------
>> + *
>> + *	           1  a  2
>> + *	old:       |-----| (bo_offset=n)
>> + *
>> + *	     0        a       3
>> + *	req: |----------------| (bo_offset=n)
>> + *
>> + *	     0        a       3
>> + *	new: |----------------| (bo_offset=n)
>> + *
>> + *	Note: We expect to see the same result for a request with a different bo
>> + *	      and/or non-contiguous bo_offset.
>> + *
>> + *
>> + *	15) Existent mapping is split.
>> + *	------------------------------
>> + *
>> + *	           1     a     3
>> + *	old:       |-----------| (bo_offset=n)
>> + *
>> + *	     0     b     2
>> + *	req: |-----------|       (bo_offset=m)
>> + *
>> + *	     0     b     2  a' 3
>> + *	new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
>> + *
>> + *
>> + *	16) Existent mappings are merged.
>> + *	---------------------------------
>> + *
>> + *	     0     a     1
>> + *	old: |-----------|                        (bo_offset=n)
>> + *
>> + *	                            2     a     3
>> + *	old':                       |-----------| (bo_offset=n+2)
>> + *
>> + *	                1     a     2
>> + *	req:            |-----------|             (bo_offset=n+1)
>> + *
>> + *	                      a
>> + *	new: |----------------------------------| (bo_offset=n)
>> + */
>> +
>> +/**
>> + * DOC: Locking
>> + *
>> + * Generally, the GPU VA manager does not take care of locking itself, it is
>> + * the drivers responsibility to take care about locking. Drivers might want to
>> + * protect the following operations: inserting, destroying and iterating
>> + * &drm_gpuva and &drm_gpuva_region objects as well as generating split and merge
>> + * operations.
>> + *
>> + * The GPU VA manager does take care of the locking of the backing
>> + * &drm_gem_object buffers GPU VA lists though, unless the provided functions
>> + * documentation claims otherwise.
>> + */
>> +
>> +/**
>> + * drm_gpuva_manager_init - initialize a &drm_gpuva_manager
>> + * @mgr: pointer to the &drm_gpuva_manager to initialize
>> + * @name: the name of the GPU VA space
>> + * @start_offset: the start offset of the GPU VA space
>> + * @range: the size of the GPU VA space
>> + * @reserve_offset: the start of the kernel reserved GPU VA area
>> + * @reserve_range: the size of the kernel reserved GPU VA area
>> + *
>> + * The &drm_gpuva_manager must be initialized with this function before use.
>> + *
>> + * Note that @mgr must be cleared to 0 before calling this function. The given
>> + * &name is expected to be managed by the surrounding driver structures.
>> + */
>> +void
>> +drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
>> +		       const char *name,
>> +		       u64 start_offset, u64 range,
>> +		       u64 reserve_offset, u64 reserve_range)
>> +{
>> +	drm_mm_init(&mgr->va_mm, start_offset, range);
>> +	drm_mm_init(&mgr->region_mm, start_offset, range);
>> +
>> +	mgr->mm_start = start_offset;
>> +	mgr->mm_range = range;
>> +
>> +	mgr->name = name ? name : "unknown";
>> +
>> +	memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_mm_node));
>> +	mgr->kernel_alloc_node.start = reserve_offset;
>> +	mgr->kernel_alloc_node.size = reserve_range;
>> +	drm_mm_reserve_node(&mgr->region_mm, &mgr->kernel_alloc_node);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_manager_init);
>> +
>> +/**
>> + * drm_gpuva_manager_destroy - cleanup a &drm_gpuva_manager
>> + * @mgr: pointer to the &drm_gpuva_manager to clean up
>> + *
>> + * Note that it is a bug to call this function on a manager that still
>> + * holds GPU VA mappings.
>> + */
>> +void
>> +drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr)
>> +{
>> +	mgr->name = NULL;
>> +	drm_mm_remove_node(&mgr->kernel_alloc_node);
>> +	drm_mm_takedown(&mgr->va_mm);
>> +	drm_mm_takedown(&mgr->region_mm);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_manager_destroy);
>> +
>> +static struct drm_gpuva_region *
>> +drm_gpuva_in_region(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
>> +{
>> +	struct drm_gpuva_region *reg;
>> +
>> +	/* Find the VA region the requested range is strictly enclosed by. */
>> +	drm_gpuva_for_each_region_in_range(reg, mgr, addr, addr + range) {
>> +		if (reg->node.start <= addr &&
>> +		    reg->node.start + reg->node.size >= addr + range &&
>> +		    &reg->node != &mgr->kernel_alloc_node)
>> +			return reg;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static bool
>> +drm_gpuva_in_any_region(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
>> +{
>> +	return !!drm_gpuva_in_region(mgr, addr, range);
>> +}
>> +
>> +/**
>> + * drm_gpuva_insert - insert a &drm_gpuva
>> + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
>> + * @va: the &drm_gpuva to insert
>> + * @addr: the start address of the GPU VA
>> + * @range: the range of the GPU VA
>> + *
>> + * Insert a &drm_gpuva with a given address and range into a
>> + * &drm_gpuva_manager.
>> + *
>> + * The function assumes the caller does not hold the &drm_gem_object's
>> + * GPU VA list mutex.
>> + *
>> + * Returns: 0 on success, negative error code on failure.
>> + */
>> +int
>> +drm_gpuva_insert(struct drm_gpuva_manager *mgr,
>> +		 struct drm_gpuva *va,
>> +		 u64 addr, u64 range)
>> +{
>> +	struct drm_gpuva_region *reg;
>> +	int ret;
>> +
>> +	if (!va->gem.obj)
>> +		return -EINVAL;
>> +
>> +	reg = drm_gpuva_in_region(mgr, addr, range);
>> +	if (!reg)
>> +		return -EINVAL;
>> +
>> +	ret = drm_mm_insert_node_in_range(&mgr->va_mm, &va->node,
>> +					  range, 0,
>> +					  0, addr,
>> +					  addr + range,
>> +					  DRM_MM_INSERT_LOW|DRM_MM_INSERT_ONCE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	va->mgr = mgr;
>> +	va->region = reg;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_insert);
>> +
>> +/**
>> + * drm_gpuva_link_locked - link a &drm_gpuva
>> + * @va: the &drm_gpuva to link
>> + *
>> + * This adds the given &va to the GPU VA list of the &drm_gem_object it is
>> + * associated with.
>> + *
>> + * The function assumes the caller already holds the &drm_gem_object's
>> + * GPU VA list mutex.
>> + */
>> +void
>> +drm_gpuva_link_locked(struct drm_gpuva *va)
>> +{
>> +	lockdep_assert_held(&va->gem.obj->gpuva.mutex);
>> +	list_add_tail(&va->head, &va->gem.obj->gpuva.list);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_link_locked);
>> +
>> +/**
>> + * drm_gpuva_link_unlocked - unlink a &drm_gpuva
>> + * @va: the &drm_gpuva to unlink
>> + *
>> + * This adds the given &va to the GPU VA list of the &drm_gem_object it is
>> + * associated with.
>> + *
>> + * The function assumes the caller does not hold the &drm_gem_object's
>> + * GPU VA list mutex.
>> + */
>> +void
>> +drm_gpuva_link_unlocked(struct drm_gpuva *va)
>> +{
>> +	drm_gem_gpuva_lock(va->gem.obj);
>> +	drm_gpuva_link_locked(va);
>> +	drm_gem_gpuva_unlock(va->gem.obj);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_link_unlocked);
>> +
>> +/**
>> + * drm_gpuva_unlink_locked - unlink a &drm_gpuva
>> + * @va: the &drm_gpuva to unlink
>> + *
>> + * This removes the given &va from the GPU VA list of the &drm_gem_object it is
>> + * associated with.
>> + *
>> + * The function assumes the caller already holds the &drm_gem_object's
>> + * GPU VA list mutex.
>> + */
>> +void
>> +drm_gpuva_unlink_locked(struct drm_gpuva *va)
>> +{
>> +	lockdep_assert_held(&va->gem.obj->gpuva.mutex);
>> +	list_del_init(&va->head);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_unlink_locked);
>> +
>> +/**
>> + * drm_gpuva_unlink_unlocked - unlink a &drm_gpuva
>> + * @va: the &drm_gpuva to unlink
>> + *
>> + * This removes the given &va from the GPU VA list of the &drm_gem_object it is
>> + * associated with.
>> + *
>> + * The function assumes the caller does not hold the &drm_gem_object's
>> + * GPU VA list mutex.
>> + */
>> +void
>> +drm_gpuva_unlink_unlocked(struct drm_gpuva *va)
>> +{
>> +	drm_gem_gpuva_lock(va->gem.obj);
>> +	drm_gpuva_unlink_locked(va);
>> +	drm_gem_gpuva_unlock(va->gem.obj);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_unlink_unlocked);
>> +
>> +/**
>> + * drm_gpuva_destroy_locked - destroy a &drm_gpuva
>> + * @va: the &drm_gpuva to destroy
>> + *
>> + * This removes the given &va from GPU VA list of the &drm_gem_object it is
>> + * associated with and removes it from the underlaying range allocator.
>> + *
>> + * The function assumes the caller already holds the &drm_gem_object's
>> + * GPU VA list mutex.
>> + */
>> +void
>> +drm_gpuva_destroy_locked(struct drm_gpuva *va)
>> +{
>> +	lockdep_assert_held(&va->gem.obj->gpuva.mutex);
>> +
>> +	list_del(&va->head);
>> +	drm_mm_remove_node(&va->node);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_destroy_locked);
>> +
>> +/**
>> + * drm_gpuva_destroy_unlocked - destroy a &drm_gpuva
>> + * @va: the &drm_gpuva to destroy
>> + *
>> + * This removes the given &va from GPU VA list of the &drm_gem_object it is
>> + * associated with and removes it from the underlaying range allocator.
>> + *
>> + * The function assumes the caller does not hold the &drm_gem_object's
>> + * GPU VA list mutex.
>> + */
>> +void
>> +drm_gpuva_destroy_unlocked(struct drm_gpuva *va)
>> +{
>> +	drm_gem_gpuva_lock(va->gem.obj);
>> +	list_del(&va->head);
>> +	drm_gem_gpuva_unlock(va->gem.obj);
>> +
>> +	drm_mm_remove_node(&va->node);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_destroy_unlocked);
>> +
>> +/**
>> + * drm_gpuva_find - find a &drm_gpuva
>> + * @mgr: the &drm_gpuva_manager to search in
>> + * @addr: the &drm_gpuvas address
>> + * @range: the &drm_gpuvas range
>> + *
>> + * Returns: the &drm_gpuva at a given &addr and with a given &range
>> + */
>> +struct drm_gpuva *
>> +drm_gpuva_find(struct drm_gpuva_manager *mgr,
>> +	       u64 addr, u64 range)
>> +{
>> +	struct drm_gpuva *va;
>> +
>> +	drm_gpuva_for_each_va_in_range(va, mgr, addr, range) {
>> +		if (va->node.start == addr &&
>> +		    va->node.size == range)
>> +			return va;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_find);
>> +
>> +/**
>> + * drm_gpuva_find_prev - find the &drm_gpuva before the given address
>> + * @mgr: the &drm_gpuva_manager to search in
>> + * @start: the given GPU VA's start address
>> + *
>> + * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
>> + *
>> + * Note that if there is any free space between the GPU VA mappings no mapping
>> + * is returned.
>> + *
>> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
>> + */
>> +struct drm_gpuva *
>> +drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
>> +{
>> +	struct drm_mm_node *node;
>> +
>> +	if (start <= mgr->mm_start ||
>> +	    start > (mgr->mm_start + mgr->mm_range))
>> +		return NULL;
>> +
>> +	node = __drm_mm_interval_first(&mgr->va_mm, start - 1, start);
>> +	if (node == &mgr->va_mm.head_node)
>> +		return NULL;
>> +
>> +	return (struct drm_gpuva *)node;
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_find_prev);
>> +
>> +/**
>> + * drm_gpuva_find_next - find the &drm_gpuva after the given address
>> + * @mgr: the &drm_gpuva_manager to search in
>> + * @end: the given GPU VA's end address
>> + *
>> + * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
>> + *
>> + * Note that if there is any free space between the GPU VA mappings no mapping
>> + * is returned.
>> + *
>> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
>> + */
>> +struct drm_gpuva *
>> +drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
>> +{
>> +	struct drm_mm_node *node;
>> +
>> +	if (end < mgr->mm_start ||
>> +	    end >= (mgr->mm_start + mgr->mm_range))
>> +		return NULL;
>> +
>> +	node = __drm_mm_interval_first(&mgr->va_mm, end, end + 1);
>> +	if (node == &mgr->va_mm.head_node)
>> +		return NULL;
>> +
>> +	return (struct drm_gpuva *)node;
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_find_next);
>> +
>> +/**
>> + * drm_gpuva_region_insert - insert a &drm_gpuva_region
>> + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
>> + * @reg: the &drm_gpuva_region to insert
>> + * @addr: the start address of the GPU VA
>> + * @range: the range of the GPU VA
>> + *
>> + * Insert a &drm_gpuva_region with a given address and range into a
>> + * &drm_gpuva_manager.
>> + *
>> + * Returns: 0 on success, negative error code on failure.
>> + */
>> +int
>> +drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
>> +			struct drm_gpuva_region *reg,
>> +			u64 addr, u64 range)
>> +{
>> +	int ret;
>> +
>> +	ret = drm_mm_insert_node_in_range(&mgr->region_mm, &reg->node,
>> +					  range, 0,
>> +					  0, addr,
>> +					  addr + range,
>> +					  DRM_MM_INSERT_LOW|
>> +					  DRM_MM_INSERT_ONCE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	reg->mgr = mgr;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_region_insert);
>> +
>> +/**
>> + * drm_gpuva_region_destroy - destroy a &drm_gpuva_region
>> + * @mgr: the &drm_gpuva_manager holding the region
>> + * @reg: the &drm_gpuva to destroy
>> + *
>> + * This removes the given &reg from the underlaying range allocator.
>> + */
>> +void
>> +drm_gpuva_region_destroy(struct drm_gpuva_manager *mgr,
>> +			 struct drm_gpuva_region *reg)
>> +{
>> +	struct drm_gpuva *va;
>> +
>> +	drm_gpuva_for_each_va_in_range(va, mgr,
>> +				       reg->node.start,
>> +				       reg->node.size) {
>> +		WARN(1, "GPU VA region must be empty on destroy.\n");
>> +		return;
>> +	}
>> +
>> +	if (&reg->node == &mgr->kernel_alloc_node) {
>> +		WARN(1, "Can't destroy kernel reserved region.\n");
>> +		return;
>> +	}
>> +
>> +	drm_mm_remove_node(&reg->node);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_region_destroy);
>> +
>> +/**
>> + * drm_gpuva_region_find - find a &drm_gpuva_region
>> + * @mgr: the &drm_gpuva_manager to search in
>> + * @addr: the &drm_gpuva_regions address
>> + * @range: the &drm_gpuva_regions range
>> + *
>> + * Returns: the &drm_gpuva_region at a given &addr and with a given &range
>> + */
>> +struct drm_gpuva_region *
>> +drm_gpuva_region_find(struct drm_gpuva_manager *mgr,
>> +		      u64 addr, u64 range)
>> +{
>> +	struct drm_gpuva_region *reg;
>> +
>> +	drm_gpuva_for_each_region_in_range(reg, mgr, addr, addr + range)
>> +		if (reg->node.start == addr &&
>> +		    reg->node.size == range)
>> +			return reg;
>> +
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_region_find);
>> +
>> +static int
>> +gpuva_op_map_new(struct drm_gpuva_op **pop,
>> +		 u64 addr, u64 range,
>> +		 struct drm_gem_object *obj, u64 offset)
>> +{
>> +	struct drm_gpuva_op *op;
>> +
>> +	op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
>> +	if (!op)
>> +		return -ENOMEM;
>> +
>> +	op->op = DRM_GPUVA_OP_MAP;
>> +	op->map.va.addr = addr;
>> +	op->map.va.range = range;
>> +	op->map.gem.obj = obj;
>> +	op->map.gem.offset = offset;
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +gpuva_op_remap_new(struct drm_gpuva_op **pop,
>> +		   struct drm_gpuva_op_map *prev,
>> +		   struct drm_gpuva_op_map *next,
>> +		   struct drm_gpuva_op_unmap *unmap)
>> +{
>> +	struct drm_gpuva_op *op;
>> +	struct drm_gpuva_op_remap *r;
>> +
>> +	op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
>> +	if (!op)
>> +		return -ENOMEM;
>> +
>> +	op->op = DRM_GPUVA_OP_REMAP;
>> +	r = &op->remap;
>> +
>> +	if (prev) {
>> +		r->prev = kmemdup(prev, sizeof(*prev), GFP_KERNEL);
>> +		if (!r->prev)
>> +			goto err_free_op;
>> +	}
>> +
>> +	if (next) {
>> +		r->next = kmemdup(next, sizeof(*next), GFP_KERNEL);
>> +		if (!r->next)
>> +			goto err_free_prev;
>> +	}
>> +
>> +	r->unmap = kmemdup(unmap, sizeof(*unmap), GFP_KERNEL);
>> +	if (!r->unmap)
>> +		goto err_free_next;
>> +
>> +	return 0;
>> +
>> +err_free_next:
>> +	if (next)
>> +		kfree(r->next);
>> +err_free_prev:
>> +	if (prev)
>> +		kfree(r->prev);
>> +err_free_op:
>> +	kfree(op);
>> +	*pop = NULL;
>> +
>> +	return -ENOMEM;
>> +}
>> +
>> +static int
>> +gpuva_op_unmap_new(struct drm_gpuva_op **pop,
>> +		   struct drm_gpuva *va, bool merge)
>> +{
>> +	struct drm_gpuva_op *op;
>> +
>> +	op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
>> +	if (!op)
>> +		return -ENOMEM;
>> +
>> +	op->op = DRM_GPUVA_OP_UNMAP;
>> +	op->unmap.va = va;
>> +	op->unmap.keep = merge;
>> +
>> +	return 0;
>> +}
>> +
>> +#define op_map_new_to_list(_ops, _addr, _range,		\
>> +			   _obj, _offset)		\
>> +do {							\
>> +	struct drm_gpuva_op *op;			\
>> +							\
>> +	ret = gpuva_op_map_new(&op, _addr, _range,	\
>> +			       _obj, _offset);		\
>> +	if (ret)					\
>> +		goto err_free_ops;			\
>> +							\
>> +	list_add_tail(&op->entry, _ops);		\
>> +} while (0)
>> +
>> +#define op_remap_new_to_list(_ops, _prev, _next,	\
>> +			     _unmap)			\
>> +do {							\
>> +	struct drm_gpuva_op *op;			\
>> +							\
>> +	ret = gpuva_op_remap_new(&op, _prev, _next,	\
>> +				 _unmap);		\
>> +	if (ret)					\
>> +		goto err_free_ops;			\
>> +							\
>> +	list_add_tail(&op->entry, _ops);		\
>> +} while (0)
>> +
>> +#define op_unmap_new_to_list(_ops, _gpuva, _merge)	\
>> +do {							\
>> +	struct drm_gpuva_op *op;			\
>> +							\
>> +	ret = gpuva_op_unmap_new(&op, _gpuva, _merge);	\
>> +	if (ret)					\
>> +		goto err_free_ops;			\
>> +							\
>> +	list_add_tail(&op->entry, _ops);		\
>> +} while (0)
>> +
>> +/**
>> + * drm_gpuva_sm_map_ops_create - creates the &drm_gpuva_ops to split and merge
>> + * @mgr: the &drm_gpuva_manager representing the GPU VA space
>> + * @req_addr: the start address of the new mapping
>> + * @req_range: the range of the new mapping
>> + * @req_obj: the &drm_gem_object to map
>> + * @req_offset: the offset within the &drm_gem_object
>> + *
>> + * This function creates a list of operations to perform splitting and merging
>> + * of existent mapping(s) with the newly requested one.
>> + *
>> + * The list can be iterated with &drm_gpuva_for_each_op and must be processed
>> + * in the given order. It can contain map, unmap and remap operations, but it
>> + * also can be empty if no operation is required, e.g. if the requested mapping
>> + * already exists is the exact same way.
>> + *
>> + * There can be an arbitrary amount of unmap operations, a maximum of two remap
>> + * operations and a single map operation. The latter one, if existent,
>> + * represents the original map operation requested by the caller. Please note
>> + * that the map operation might has been modified, e.g. if it was
>> + * merged with an existent mapping.
>> + *
>> + * Note that before calling this function again with another mapping request it
>> + * is necessary to update the &drm_gpuva_manager's view of the GPU VA space.
>> + * The previously obtained operations must be either processed or abandoned.
>> + * To update the &drm_gpuva_manager's view of the GPU VA space
>> + * drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
>> + * drm_gpuva_destroy_unlocked() should be used.
>> + *
>> + * After the caller finished processing the returned &drm_gpuva_ops, they must
>> + * be freed with &drm_gpuva_ops_free.
>> + *
>> + * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
>> + */
>> +struct drm_gpuva_ops *
>> +drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
>> +			    u64 req_addr, u64 req_range,
>> +			    struct drm_gem_object *req_obj, u64 req_offset)
>> +{
>> +	struct drm_gpuva_ops *ops;
>> +	struct drm_gpuva *va, *prev = NULL;
>> +	u64 req_end = req_addr + req_range;
>> +	bool skip_pmerge = false, skip_nmerge = false;
>> +	int ret;
>> +
>> +	if (!drm_gpuva_in_any_region(mgr, req_addr, req_range))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
>> +	if (!ops)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	INIT_LIST_HEAD(&ops->list);
>> +
>> +	drm_gpuva_for_each_va_in_range(va, mgr, req_addr, req_end) {
>> +		struct drm_gem_object *obj = va->gem.obj;
>> +		u64 offset = va->gem.offset;
>> +		u64 addr = va->node.start;
>> +		u64 range = va->node.size;
>> +		u64 end = addr + range;
>> +
>> +		/* Generally, we want to skip merging with potential mappings
>> +		 * left and right of the requested one when we found a
>> +		 * collision, since merging happens in this loop already.
>> +		 *
>> +		 * However, there is one exception when the requested mapping
>> +		 * spans into a free VM area. If this is the case we might
>> +		 * still hit the boundary of another mapping before and/or
>> +		 * after the free VM area.
>> +		 */
>> +		skip_pmerge = true;
>> +		skip_nmerge = true;
>> +
>> +		if (addr == req_addr) {
>> +			bool merge = obj == req_obj &&
>> +				     offset == req_offset;
>> +			if (end == req_end) {
>> +				if (merge)
>> +					goto done;
>> +
>> +				op_unmap_new_to_list(&ops->list, va, false);
>> +				break;
>> +			}
>> +
>> +			if (end < req_end) {
>> +				skip_nmerge = false;
>> +				op_unmap_new_to_list(&ops->list, va, merge);
>> +				goto next;
>> +			}
>> +
>> +			if (end > req_end) {
>> +				struct drm_gpuva_op_map n = {
>> +					.va.addr = req_end,
>> +					.va.range = range - req_range,
>> +					.gem.obj = obj,
>> +					.gem.offset = offset + req_range,
>> +				};
>> +				struct drm_gpuva_op_unmap u = { .va = va };
>> +
>> +				if (merge)
>> +					goto done;
>> +
>> +				op_remap_new_to_list(&ops->list, NULL, &n, &u);
>> +				break;
>> +			}
>> +		} else if (addr < req_addr) {
>> +			u64 ls_range = req_addr - addr;
>> +			struct drm_gpuva_op_map p = {
>> +				.va.addr = addr,
>> +				.va.range = ls_range,
>> +				.gem.obj = obj,
>> +				.gem.offset = offset,
>> +			};
>> +			struct drm_gpuva_op_unmap u = { .va = va };
>> +			bool merge = obj == req_obj &&
>> +				     offset + ls_range == req_offset;
>> +
>> +			if (end == req_end) {
>> +				if (merge)
>> +					goto done;
>> +
>> +				op_remap_new_to_list(&ops->list, &p, NULL, &u);
>> +				break;
>> +			}
>> +
>> +			if (end < req_end) {
>> +				u64 new_addr = addr;
>> +				u64 new_range = req_range + ls_range;
>> +				u64 new_offset = offset;
>> +
>> +				/* We validated that the requested mapping is
>> +				 * within a single VA region already.
>> +				 * Since it overlaps the current mapping (which
>> +				 * can't cross a VA region boundary) we can be
>> +				 * sure that we're still within the boundaries
>> +				 * of the same VA region after merging.
>> +				 */
>> +				if (merge) {
>> +					req_offset = new_offset;
>> +					req_addr = new_addr;
>> +					req_range = new_range;
>> +					op_unmap_new_to_list(&ops->list, va, true);
>> +					goto next;
>> +				}
>> +
>> +				op_remap_new_to_list(&ops->list, &p, NULL, &u);
>> +				goto next;
>> +			}
>> +
>> +			if (end > req_end) {
>> +				struct drm_gpuva_op_map n = {
>> +					.va.addr = req_end,
>> +					.va.range = end - req_end,
>> +					.gem.obj = obj,
>> +					.gem.offset = offset + ls_range +
>> +						      req_range,
>> +				};
>> +
>> +				if (merge)
>> +					goto done;
>> +
>> +				op_remap_new_to_list(&ops->list, &p, &n, &u);
>> +				break;
>> +			}
>> +		} else if (addr > req_addr) {
>> +			bool merge = obj == req_obj &&
>> +				     offset == req_offset +
>> +					       (addr - req_addr);
>> +			if (!prev)
>> +				skip_pmerge = false;
>> +
>> +			if (end == req_end) {
>> +				op_unmap_new_to_list(&ops->list, va, merge);
>> +				break;
>> +			}
>> +
>> +			if (end < req_end) {
>> +				skip_nmerge = false;
>> +				op_unmap_new_to_list(&ops->list, va, merge);
>> +				goto next;
>> +			}
>> +
>> +			if (end > req_end) {
>> +				struct drm_gpuva_op_map n = {
>> +					.va.addr = req_end,
>> +					.va.range = end - req_end,
>> +					.gem.obj = obj,
>> +					.gem.offset = offset + req_end - addr,
>> +				};
>> +				struct drm_gpuva_op_unmap u = { .va = va };
>> +				u64 new_end = end;
>> +				u64 new_range = new_end - req_addr;
>> +
>> +				/* We validated that the requested mapping is
>> +				 * within a single VA region already.
>> +				 * Since it overlaps the current mapping (which
>> +				 * can't cross a VA region boundary) we can be
>> +				 * sure that we're still within the boundaries
>> +				 * of the same VA region after merging.
>> +				 */
>> +				if (merge) {
>> +					req_end = new_end;
>> +					req_range = new_range;
>> +					op_unmap_new_to_list(&ops->list, va, true);
>> +					break;
>> +				}
>> +
>> +				op_remap_new_to_list(&ops->list, NULL, &n, &u);
>> +				break;
>> +			}
>> +		}
>> +next:
>> +		prev = va;
>> +	}
>> +
>> +	va = skip_pmerge ? NULL : drm_gpuva_find_prev(mgr, req_addr);
>> +	if (va) {
>> +		struct drm_gem_object *obj = va->gem.obj;
>> +		u64 offset = va->gem.offset;
>> +		u64 addr = va->node.start;
>> +		u64 range = va->node.size;
>> +		u64 new_offset = offset;
>> +		u64 new_addr = addr;
>> +		u64 new_range = req_range + range;
>> +		bool merge = obj == req_obj &&
>> +			     offset + range == req_offset;
>> +
>> +		/* Don't merge over VA region boundaries. */
>> +		merge &= drm_gpuva_in_any_region(mgr, new_addr, new_range);
>> +		if (merge) {
>> +			op_unmap_new_to_list(&ops->list, va, true);
>> +
>> +			req_offset = new_offset;
>> +			req_addr = new_addr;
>> +			req_range = new_range;
>> +		}
>> +	}
>> +
>> +	va = skip_nmerge ? NULL : drm_gpuva_find_next(mgr, req_end);
>> +	if (va) {
>> +		struct drm_gem_object *obj = va->gem.obj;
>> +		u64 offset = va->gem.offset;
>> +		u64 addr = va->node.start;
>> +		u64 range = va->node.size;
>> +		u64 end = addr + range;
>> +		u64 new_range = req_range + range;
>> +		u64 new_end = end;
>> +		bool merge = obj == req_obj &&
>> +			     offset == req_offset + req_range;
>> +
>> +		/* Don't merge over VA region boundaries. */
>> +		merge &= drm_gpuva_in_any_region(mgr, req_addr, new_range);
>> +		if (merge) {
>> +			op_unmap_new_to_list(&ops->list, va, true);
>> +
>> +			req_range = new_range;
>> +			req_end = new_end;
>> +		}
>> +	}
>> +
>> +	op_map_new_to_list(&ops->list,
>> +			   req_addr, req_range,
>> +			   req_obj, req_offset);
>> +
>> +done:
>> +	return ops;
>> +
>> +err_free_ops:
>> +	drm_gpuva_ops_free(ops);
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_sm_map_ops_create);
>> +
>> +#undef op_map_new_to_list
>> +#undef op_remap_new_to_list
>> +#undef op_unmap_new_to_list
>> +
>> +/**
>> + * drm_gpuva_sm_unmap_ops_create - creates the &drm_gpuva_ops to split on unmap
>> + * @mgr: the &drm_gpuva_manager representing the GPU VA space
>> + * @req_addr: the start address of the range to unmap
>> + * @req_range: the range of the mappings to unmap
>> + *
>> + * This function creates a list of operations to perform unmapping and, if
>> + * required, splitting of the mappings overlapping the unmap range.
>> + *
>> + * The list can be iterated with &drm_gpuva_for_each_op and must be processed
>> + * in the given order. It can contain unmap and remap operations, depending on
>> + * whether there are actual overlapping mappings to split.
>> + *
>> + * There can be an arbitrary amount of unmap operations and a maximum of two
>> + * remap operations.
>> + *
>> + * Note that before calling this function again with another range to unmap it
>> + * is necessary to update the &drm_gpuva_manager's view of the GPU VA space.
>> + * The previously obtained operations must be processed or abandoned.
>> + * To update the &drm_gpuva_manager's view of the GPU VA space
>> + * drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
>> + * drm_gpuva_destroy_unlocked() should be used.
>> + *
>> + * After the caller finished processing the returned &drm_gpuva_ops, they must
>> + * be freed with &drm_gpuva_ops_free.
>> + *
>> + * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
>> + */
>> +struct drm_gpuva_ops *
>> +drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
>> +			      u64 req_addr, u64 req_range)
>> +{
>> +	struct drm_gpuva_ops *ops;
>> +	struct drm_gpuva_op *op;
>> +	struct drm_gpuva_op_remap *r;
>> +	struct drm_gpuva *va;
>> +	u64 req_end = req_addr + req_range;
>> +	int ret;
>> +
>> +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
>> +	if (!ops)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	INIT_LIST_HEAD(&ops->list);
>> +
>> +	drm_gpuva_for_each_va_in_range(va, mgr, req_addr, req_end) {
>> +		struct drm_gem_object *obj = va->gem.obj;
>> +		u64 offset = va->gem.offset;
>> +		u64 addr = va->node.start;
>> +		u64 range = va->node.size;
>> +		u64 end = addr + range;
>> +
>> +		op = kzalloc(sizeof(*op), GFP_KERNEL);
>> +		if (!op) {
>> +			ret = -ENOMEM;
>> +			goto err_free_ops;
>> +		}
>> +
>> +		r = &op->remap;
>> +
>> +		if (addr < req_addr) {
>> +			r->prev = kzalloc(sizeof(*r->prev), GFP_KERNEL);
>> +			if (!r->prev) {
>> +				ret = -ENOMEM;
>> +				goto err_free_op;
>> +			}
>> +
>> +			r->prev->va.addr = addr;
>> +			r->prev->va.range = req_addr - addr;
>> +			r->prev->gem.obj = obj;
>> +			r->prev->gem.offset = offset;
>> +		}
>> +
>> +		if (end > req_end) {
>> +			r->next = kzalloc(sizeof(*r->next), GFP_KERNEL);
>> +			if (!r->next) {
>> +				ret = -ENOMEM;
>> +				goto err_free_prev;
>> +			}
>> +
>> +			r->next->va.addr = req_end;
>> +			r->next->va.range = end - req_end;
>> +			r->next->gem.obj = obj;
>> +			r->next->gem.offset = offset + (req_end - addr);
>> +		}
>> +
>> +		if (op->remap.prev || op->remap.next) {
>> +			op->op = DRM_GPUVA_OP_REMAP;
>> +			r->unmap = kzalloc(sizeof(*r->unmap), GFP_KERNEL);
>> +			if (!r->unmap) {
>> +				ret = -ENOMEM;
>> +				goto err_free_next;
>> +			}
>> +
>> +			r->unmap->va = va;
>> +		} else {
>> +			op->op = DRM_GPUVA_OP_UNMAP;
>> +			op->unmap.va = va;
>> +		}
>> +
>> +		list_add_tail(&op->entry, &ops->list);
>> +	}
>> +
>> +	return ops;
>> +
>> +err_free_next:
>> +	if (r->next)
>> +		kfree(r->next);
>> +err_free_prev:
>> +	if (r->prev)
>> +		kfree(r->prev);
>> +err_free_op:
>> +	kfree(op);
>> +err_free_ops:
>> +	drm_gpuva_ops_free(ops);
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_sm_unmap_ops_create);
>> +
>> +/**
>> + * drm_gpuva_ops_free - free the given &drm_gpuva_ops
>> + * @ops: the &drm_gpuva_ops to free
>> + *
>> + * Frees the given &drm_gpuva_ops structure including all the ops associated
>> + * with it.
>> + */
>> +void
>> +drm_gpuva_ops_free(struct drm_gpuva_ops *ops)
>> +{
>> +	struct drm_gpuva_op *op, *next;
>> +
>> +	drm_gpuva_for_each_op_safe(op, next, ops) {
>> +		list_del(&op->entry);
>> +		if (op->op == DRM_GPUVA_OP_REMAP) {
>> +			if (op->remap.prev)
>> +				kfree(op->remap.prev);
>> +
>> +			if (op->remap.next)
>> +				kfree(op->remap.next);
>> +
>> +			kfree(op->remap.unmap);
>> +		}
>> +		kfree(op);
>> +	}
>> +
>> +	kfree(ops);
>> +}
>> +EXPORT_SYMBOL(drm_gpuva_ops_free);
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index d7c521e8860f..6feacd93aca6 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -104,6 +104,12 @@ enum drm_driver_feature {
>>   	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
>>   	 */
>>   	DRIVER_COMPUTE_ACCEL            = BIT(7),
>> +	/**
>> +	 * @DRIVER_GEM_GPUVA:
>> +	 *
>> +	 * Driver supports user defined GPU VA bindings for GEM objects.
>> +	 */
>> +	DRIVER_GEM_GPUVA		= BIT(8),
>>   
>>   	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
>>   
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 772a4adf5287..4a3679034966 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -36,6 +36,8 @@
>>   
>>   #include <linux/kref.h>
>>   #include <linux/dma-resv.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>>   
>>   #include <drm/drm_vma_manager.h>
>>   
>> @@ -337,6 +339,17 @@ struct drm_gem_object {
>>   	 */
>>   	struct dma_resv _resv;
>>   
>> +	/**
>> +	 * @gpuva:
>> +	 *
>> +	 * Provides the list and list mutex of GPU VAs attached to this
>> +	 * GEM object.
>> +	 */
>> +	struct {
>> +		struct list_head list;
>> +		struct mutex mutex;
>> +	} gpuva;
>> +
>>   	/**
>>   	 * @funcs:
>>   	 *
>> @@ -479,4 +492,66 @@ void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
>>   unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
>>   			       bool (*shrink)(struct drm_gem_object *obj));
>>   
>> +/**
>> + * drm_gem_gpuva_init - initialize the gpuva list of a GEM object
>> + * @obj: the &drm_gem_object
>> + *
>> + * This initializes the &drm_gem_object's &drm_gpuva list and the mutex
>> + * protecting it.
>> + *
>> + * Calling this function is only necessary for drivers intending to support the
>> + * &drm_driver_feature DRIVER_GEM_GPUVA.
>> + */
>> +static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
>> +{
>> +	INIT_LIST_HEAD(&obj->gpuva.list);
>> +	mutex_init(&obj->gpuva.mutex);
>> +}
>> +
>> +/**
>> + * drm_gem_gpuva_lock - lock the GEM's gpuva list mutex
>> + * @obj: the &drm_gem_object
>> + *
>> + * This unlocks the mutex protecting the &drm_gem_object's &drm_gpuva list.
>> + */
>> +static inline void drm_gem_gpuva_lock(struct drm_gem_object *obj)
>> +{
>> +	mutex_lock(&obj->gpuva.mutex);
>> +}
>> +
>> +/**
>> + * drm_gem_gpuva_unlock - unlock the GEM's gpuva list mutex
>> + * @obj: the &drm_gem_object
>> + *
>> + * This unlocks the mutex protecting the &drm_gem_object's &drm_gpuva list.
>> + */
>> +static inline void drm_gem_gpuva_unlock(struct drm_gem_object *obj)
>> +{
>> +	mutex_unlock(&obj->gpuva.mutex);
>> +}
>> +
>> +/**
>> + * drm_gem_for_each_gpuva - iternator to walk over a list of gpuvas
>> + * @entry: &drm_gpuva structure to assign to in each iteration step
>> + * @obj: the &drm_gem_object the &drm_gpuvas to walk are associated with
>> + *
>> + * This iterator walks over all &drm_gpuva structures associated with the
>> + * &drm_gpuva_manager.
>> + */
>> +#define drm_gem_for_each_gpuva(entry, obj) \
>> +	list_for_each_entry(entry, &obj->gpuva.list, head)
>> +
>> +/**
>> + * drm_gem_for_each_gpuva_safe - iternator to safely walk over a list of gpuvas
>> + * @entry: &drm_gpuva structure to assign to in each iteration step
>> + * @next: &next &drm_gpuva to store the next step
>> + * @obj: the &drm_gem_object the &drm_gpuvas to walk are associated with
>> + *
>> + * This iterator walks over all &drm_gpuva structures associated with the
>> + * &drm_gem_object. It is implemented with list_for_each_entry_safe(), hence
>> + * it is save against removal of elements.
>> + */
>> +#define drm_gem_for_each_gpuva_safe(entry, next, obj) \
>> +	list_for_each_entry_safe(entry, next, &obj->gpuva.list, head)
>> +
>>   #endif /* __DRM_GEM_H__ */
>> diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
>> new file mode 100644
>> index 000000000000..adeb0c916e91
>> --- /dev/null
>> +++ b/include/drm/drm_gpuva_mgr.h
>> @@ -0,0 +1,527 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#ifndef __DRM_GPUVA_MGR_H__
>> +#define __DRM_GPUVA_MGR_H__
>> +
>> +/*
>> + * Copyright (c) 2022 Red Hat.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#include <drm/drm_mm.h>
>> +#include <linux/mm.h>
>> +#include <linux/rbtree.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/types.h>
>> +
>> +struct drm_gpuva_region;
>> +struct drm_gpuva;
>> +struct drm_gpuva_ops;
>> +
>> +/**
>> + * struct drm_gpuva_manager - DRM GPU VA Manager
>> + *
>> + * The DRM GPU VA Manager keeps track of a GPU's virtual address space by using
>> + * the &drm_mm range allocator. Typically, this structure is embedded in bigger
>> + * driver structures.
>> + *
>> + * Drivers can pass addresses and ranges in an arbitrary unit, e.g. bytes or
>> + * pages.
>> + *
>> + * There should be one manager instance per GPU virtual address space.
>> + */
>> +struct drm_gpuva_manager {
>> +	/**
>> +	 * @name: the name of the DRM GPU VA space
>> +	 */
>> +	const char *name;
>> +
>> +	/**
>> +	 * @mm_start: start of the VA space
>> +	 */
>> +	u64 mm_start;
>> +
>> +	/**
>> +	 * @mm_range: length of the VA space
>> +	 */
>> +	u64 mm_range;
>> +
>> +	/**
>> +	 * @region_mm: the &drm_mm range allocator to track GPU VA regions
>> +	 */
>> +	struct drm_mm region_mm;
>> +
>> +	/**
>> +	 * @va_mm: the &drm_mm range allocator to track GPU VA mappings
>> +	 */
>> +	struct drm_mm va_mm;
>> +
>> +	/**
>> +	 * @kernel_alloc_node:
>> +	 *
>> +	 * &drm_mm_node representing the address space cutout reserved for
>> +	 * the kernel
>> +	 */
>> +	struct drm_mm_node kernel_alloc_node;
>> +};
>> +
>> +void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
>> +			    const char *name,
>> +			    u64 start_offset, u64 range,
>> +			    u64 reserve_offset, u64 reserve_range);
>> +void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
>> +
>> +/**
>> + * struct drm_gpuva_region - structure to track a portion of GPU VA space
>> + *
>> + * This structure represents a portion of a GPUs VA space and is associated
>> + * with a &drm_gpuva_manager. Internally it is based on a &drm_mm_node.
>> + *
>> + * GPU VA mappings, represented by &drm_gpuva objects, are restricted to be
>> + * placed within a &drm_gpuva_region.
>> + */
>> +struct drm_gpuva_region {
>> +	/**
>> +	 * @node: the &drm_mm_node to track the GPU VA region
>> +	 */
>> +	struct drm_mm_node node;
>> +
>> +	/**
>> +	 * @mgr: the &drm_gpuva_manager this object is associated with
>> +	 */
>> +	struct drm_gpuva_manager *mgr;
>> +
>> +	/**
>> +	 * @sparse: indicates whether this region is sparse
>> +	 */
>> +	bool sparse;
>> +};
>> +
>> +struct drm_gpuva_region *
>> +drm_gpuva_region_find(struct drm_gpuva_manager *mgr,
>> +		      u64 addr, u64 range);
>> +int drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
>> +			    struct drm_gpuva_region *reg,
>> +			    u64 addr, u64 range);
>> +void drm_gpuva_region_destroy(struct drm_gpuva_manager *mgr,
>> +			      struct drm_gpuva_region *reg);
>> +
>> +int drm_gpuva_insert(struct drm_gpuva_manager *mgr,
>> +		     struct drm_gpuva *va,
>> +		     u64 addr, u64 range);
>> +/**
>> + * drm_gpuva_for_each_region_in_range - iternator to walk over a range of nodes
>> + * @node__: &drm_gpuva_region structure to assign to in each iteration step
>> + * @gpuva__: &drm_gpuva_manager structure to walk
>> + * @start__: starting offset, the first node will overlap this
>> + * @end__: ending offset, the last node will start before this (but may overlap)
>> + *
>> + * This iterator walks over all nodes in the range allocator that lie
>> + * between @start and @end. It is implemented similarly to list_for_each(),
>> + * but is using &drm_mm's internal interval tree to accelerate the search for
>> + * the starting node, and hence isn't safe against removal of elements. It
>> + * assumes that @end is within (or is the upper limit of) the &drm_gpuva_manager.
>> + * If [@start, @end] are beyond the range of the &drm_gpuva_manager, the
>> + * iterator may walk over the special _unallocated_ &drm_mm.head_node of the
>> + * backing &drm_mm, and may even continue indefinitely.
>> + */
>> +#define drm_gpuva_for_each_region_in_range(node__, gpuva__, start__, end__) \
>> +	for (node__ = (struct drm_gpuva_region *)__drm_mm_interval_first(&(gpuva__)->region_mm, \
>> +									 (start__), (end__)-1); \
>> +	     node__->node.start < (end__); \
>> +	     node__ = (struct drm_gpuva_region *)list_next_entry(&node__->node, node_list))
>> +
>> +/**
>> + * drm_gpuva_for_each_region - iternator to walk over a range of nodes
>> + * @entry: &drm_gpuva_region structure to assign to in each iteration step
>> + * @gpuva: &drm_gpuva_manager structure to walk
>> + *
>> + * This iterator walks over all &drm_gpuva_region structures associated with the
>> + * &drm_gpuva_manager.
>> + */
>> +#define drm_gpuva_for_each_region(entry, gpuva) \
>> +	list_for_each_entry(entry, drm_mm_nodes(&(gpuva)->region_mm), node.node_list)
>> +
>> +/**
>> + * drm_gpuva_for_each_region_safe - iternator to safely walk over a range of
>> + * nodes
>> + * @entry: &drm_gpuva_region structure to assign to in each iteration step
>> + * @next: &next &drm_gpuva_region to store the next step
>> + * @gpuva: &drm_gpuva_manager structure to walk
>> + *
>> + * This iterator walks over all &drm_gpuva_region structures associated with the
>> + * &drm_gpuva_manager. It is implemented with list_for_each_safe(), so save
>> + * against removal of elements.
>> + */
>> +#define drm_gpuva_for_each_region_safe(entry, next, gpuva) \
>> +	list_for_each_entry_safe(entry, next, drm_mm_nodes(&(gpuva)->region_mm), node.node_list)
>> +
>> +
>> +/**
>> + * enum drm_gpuva_flags - flags for struct drm_gpuva
>> + */
>> +enum drm_gpuva_flags {
>> +	/**
>> +	 * @DRM_GPUVA_SWAPPED: flag indicating that the &drm_gpuva is swapped
>> +	 */
>> +	DRM_GPUVA_SWAPPED = (1 << 0),
>> +};
>> +
>> +/**
>> + * struct drm_gpuva - structure to track a GPU VA mapping
>> + *
>> + * This structure represents a GPU VA mapping and is associated with a
>> + * &drm_gpuva_manager. Internally it is based on a &drm_mm_node.
>> + *
>> + * Typically, this structure is embedded in bigger driver structures.
>> + */
>> +struct drm_gpuva {
>> +	/**
>> +	 * @node: the &drm_mm_node to track the GPU VA mapping
>> +	 */
>> +	struct drm_mm_node node;
>> +
>> +	/**
>> +	 * @mgr: the &drm_gpuva_manager this object is associated with
>> +	 */
>> +	struct drm_gpuva_manager *mgr;
>> +
>> +	/**
>> +	 * @region: the &drm_gpuva_region the &drm_gpuva is mapped in
>> +	 */
>> +	struct drm_gpuva_region *region;
>> +
>> +	/**
>> +	 * @head: the &list_head to attach this object to a &drm_gem_object
>> +	 */
>> +	struct list_head head;
>> +
>> +	/**
>> +	 * @flags: the &drm_gpuva_flags for this mapping
>> +	 */
>> +	enum drm_gpuva_flags flags;
>> +
>> +	/**
>> +	 * @gem: structure containing the &drm_gem_object and it's offset
>> +	 */
>> +	struct {
>> +		/**
>> +		 * @offset: the offset within the &drm_gem_object
>> +		 */
>> +		u64 offset;
>> +
>> +		/**
>> +		 * @obj: the mapped &drm_gem_object
>> +		 */
>> +		struct drm_gem_object *obj;
>> +	} gem;
>> +};
>> +
>> +void drm_gpuva_link_locked(struct drm_gpuva *va);
>> +void drm_gpuva_link_unlocked(struct drm_gpuva *va);
>> +void drm_gpuva_unlink_locked(struct drm_gpuva *va);
>> +void drm_gpuva_unlink_unlocked(struct drm_gpuva *va);
>> +
>> +void drm_gpuva_destroy_locked(struct drm_gpuva *va);
>> +void drm_gpuva_destroy_unlocked(struct drm_gpuva *va);
>> +
>> +struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
>> +				 u64 addr, u64 range);
>> +struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start);
>> +struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end);
>> +
>> +/**
>> + * drm_gpuva_swap - sets whether the backing BO of this &drm_gpuva is swapped
>> + * @va: the &drm_gpuva to set the swap flag of
>> + * @swap: indicates whether the &drm_gpuva is swapped
>> + */
>> +static inline void drm_gpuva_swap(struct drm_gpuva *va, bool swap)
>> +{
>> +	if (swap)
>> +		va->flags |= DRM_GPUVA_SWAPPED;
>> +	else
>> +		va->flags &= ~DRM_GPUVA_SWAPPED;
>> +}
>> +
>> +/**
>> + * drm_gpuva_swapped - indicates whether the backing BO of this &drm_gpuva
>> + * is swapped
>> + * @va: the &drm_gpuva to check
>> + */
>> +static inline bool drm_gpuva_swapped(struct drm_gpuva *va)
>> +{
>> +	return va->flags & DRM_GPUVA_SWAPPED;
>> +}
>> +
>> +/**
>> + * drm_gpuva_for_each_va_in_range - iternator to walk over a range of nodes
>> + * @node__: &drm_gpuva structure to assign to in each iteration step
>> + * @gpuva__: &drm_gpuva_manager structure to walk
>> + * @start__: starting offset, the first node will overlap this
>> + * @end__: ending offset, the last node will start before this (but may overlap)
>> + *
>> + * This iterator walks over all nodes in the range allocator that lie
>> + * between @start and @end. It is implemented similarly to list_for_each(),
>> + * but is using &drm_mm's internal interval tree to accelerate the search for
>> + * the starting node, and hence isn't safe against removal of elements. It
>> + * assumes that @end is within (or is the upper limit of) the &drm_gpuva_manager.
>> + * If [@start, @end] are beyond the range of the &drm_gpuva_manager, the
>> + * iterator may walk over the special _unallocated_ &drm_mm.head_node of the
>> + * backing &drm_mm, and may even continue indefinitely.
>> + */
>> +#define drm_gpuva_for_each_va_in_range(node__, gpuva__, start__, end__) \
>> +	for (node__ = (struct drm_gpuva *)__drm_mm_interval_first(&(gpuva__)->va_mm, \
>> +								  (start__), (end__)-1); \
>> +	     node__->node.start < (end__); \
>> +	     node__ = (struct drm_gpuva *)list_next_entry(&node__->node, node_list))
>> +
>> +/**
>> + * drm_gpuva_for_each_va - iternator to walk over a range of nodes
>> + * @entry: &drm_gpuva structure to assign to in each iteration step
>> + * @gpuva: &drm_gpuva_manager structure to walk
>> + *
>> + * This iterator walks over all &drm_gpuva structures associated with the
>> + * &drm_gpuva_manager.
>> + */
>> +#define drm_gpuva_for_each_va(entry, gpuva) \
>> +	list_for_each_entry(entry, drm_mm_nodes(&(gpuva)->va_mm), node.node_list)
>> +
>> +/**
>> + * drm_gpuva_for_each_va_safe - iternator to safely walk over a range of
>> + * nodes
>> + * @entry: &drm_gpuva structure to assign to in each iteration step
>> + * @next: &next &drm_gpuva to store the next step
>> + * @gpuva: &drm_gpuva_manager structure to walk
>> + *
>> + * This iterator walks over all &drm_gpuva structures associated with the
>> + * &drm_gpuva_manager. It is implemented with list_for_each_safe(), so save
>> + * against removal of elements.
>> + */
>> +#define drm_gpuva_for_each_va_safe(entry, next, gpuva) \
>> +	list_for_each_entry_safe(entry, next, drm_mm_nodes(&(gpuva)->va_mm), node.node_list)
>> +
>> +/**
>> + * enum drm_gpuva_op_type - GPU VA operation type
>> + *
>> + * Operations to alter the GPU VA mappings tracked by the &drm_gpuva_manager
>> + * can be map, remap or unmap operations.
>> + */
>> +enum drm_gpuva_op_type {
>> +	/**
>> +	 * @DRM_GPUVA_OP_MAP: the map op type
>> +	 */
>> +	DRM_GPUVA_OP_MAP,
>> +
>> +	/**
>> +	 * @DRM_GPUVA_OP_REMAP: the remap op type
>> +	 */
>> +	DRM_GPUVA_OP_REMAP,
>> +
>> +	/**
>> +	 * @DRM_GPUVA_OP_UNMAP: the unmap op type
>> +	 */
>> +	DRM_GPUVA_OP_UNMAP,
>> +};
>> +
>> +/**
>> + * struct drm_gpuva_op_map - GPU VA map operation
>> + *
>> + * This structure represents a single map operation generated by the
>> + * DRM GPU VA manager.
>> + */
>> +struct drm_gpuva_op_map {
>> +	/**
>> +	 * @va: structure containing address and range of a map
>> +	 * operation
>> +	 */
>> +	struct {
>> +		/**
>> +		 * @addr: the base address of the new mapping
>> +		 */
>> +		u64 addr;
>> +
>> +		/**
>> +		 * @range: the range of the new mapping
>> +		 */
>> +		u64 range;
>> +	} va;
>> +
>> +	/**
>> +	 * @gem: structure containing the &drm_gem_object and it's offset
>> +	 */
>> +	struct {
>> +		/**
>> +		 * @offset: the offset within the &drm_gem_object
>> +		 */
>> +		u64 offset;
>> +
>> +		/**
>> +		 * @obj: the &drm_gem_object to map
>> +		 */
>> +		struct drm_gem_object *obj;
>> +	} gem;
>> +};
>> +
>> +/**
>> + * struct drm_gpuva_op_unmap - GPU VA unmap operation
>> + *
>> + * This structure represents a single unmap operation generated by the
>> + * DRM GPU VA manager.
>> + */
>> +struct drm_gpuva_op_unmap {
>> +	/**
>> +	 * @va: the &drm_gpuva to unmap
>> +	 */
>> +	struct drm_gpuva *va;
>> +
>> +	/**
>> +	 * @keep:
>> +	 *
>> +	 * Indicates whether this &drm_gpuva is physically contiguous with the
>> +	 * original mapping request.
>> +	 *
>> +	 * Optionally, if &keep is set, drivers may keep the actual page table
>> +	 * mappings for this &drm_gpuva, adding the missing page table entries
>> +	 * only and update the &drm_gpuva_manager accordingly.
>> +	 */
>> +	bool keep;
>> +};
>> +
>> +/**
>> + * struct drm_gpuva_op_remap - GPU VA remap operation
>> + *
>> + * This represents a single remap operation generated by the DRM GPU VA manager.
>> + *
>> + * A remap operation is generated when an existing GPU VA mmapping is split up
>> + * by inserting a new GPU VA mapping or by partially unmapping existent
>> + * mapping(s), hence it consists of a maximum of two map and one unmap
>> + * operation.
>> + *
>> + * The @unmap operation takes care of removing the original existing mapping.
>> + * @prev is used to remap the preceding part, @next the subsequent part.
>> + *
>> + * If either a new mapping's start address is aligned with the start address
>> + * of the old mapping or the new mapping's end address is aligned with the
>> + * end address of the old mapping, either @prev or @next is NULL.
>> + *
>> + * Note, the reason for a dedicated remap operation, rather than arbitrary
>> + * unmap and map operations, is to give drivers the chance of extracting driver
>> + * specific data for creating the new mappings from the unmap operations's
>> + * &drm_gpuva structure which typically is embedded in larger driver specific
>> + * structures.
>> + */
>> +struct drm_gpuva_op_remap {
>> +	/**
>> +	 * @prev: the preceding part of a split mapping
>> +	 */
>> +	struct drm_gpuva_op_map *prev;
>> +
>> +	/**
>> +	 * @next: the subsequent part of a split mapping
>> +	 */
>> +	struct drm_gpuva_op_map *next;
>> +
>> +	/**
>> +	 * @unmap: the unmap operation for the original existing mapping
>> +	 */
>> +	struct drm_gpuva_op_unmap *unmap;
>> +};
>> +
>> +/**
>> + * struct drm_gpuva_op - GPU VA operation
>> + *
>> + * This structure represents a single generic operation, which can be either
>> + * map, unmap or remap.
>> + *
>> + * The particular type of the operation is defined by @op.
>> + */
>> +struct drm_gpuva_op {
>> +	/**
>> +	 * @entry:
>> +	 *
>> +	 * The &list_head used to distribute instances of this struct within
>> +	 * &drm_gpuva_ops.
>> +	 */
>> +	struct list_head entry;
>> +
>> +	/**
>> +	 * @op: the type of the operation
>> +	 */
>> +	enum drm_gpuva_op_type op;
>> +
>> +	union {
>> +		/**
>> +		 * @map: the map operation
>> +		 */
>> +		struct drm_gpuva_op_map map;
>> +
>> +		/**
>> +		 * @unmap: the unmap operation
>> +		 */
>> +		struct drm_gpuva_op_unmap unmap;
>> +
>> +		/**
>> +		 * @remap: the remap operation
>> +		 */
>> +		struct drm_gpuva_op_remap remap;
>> +	};
>> +};
>> +
>> +/**
>> + * struct drm_gpuva_ops - wraps a list of &drm_gpuva_op
>> + */
>> +struct drm_gpuva_ops {
>> +	/**
>> +	 * @list: the &list_head
>> +	 */
>> +	struct list_head list;
>> +};
>> +
>> +/**
>> + * drm_gpuva_for_each_op - iterator to walk over all ops
>> + * @op: &drm_gpuva_op to assign in each iteration step
>> + * @ops: &drm_gpuva_ops to walk
>> + *
>> + * This iterator walks over all ops within a given list of operations.
>> + */
>> +#define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
>> +
>> +/**
>> + * drm_gpuva_for_each_op_safe - iterator to safely walk over all ops
>> + * @op: &drm_gpuva_op to assign in each iteration step
>> + * @next: &next &drm_gpuva_op to store the next step
>> + * @ops: &drm_gpuva_ops to walk
>> + *
>> + * This iterator walks over all ops within a given list of operations. It is
>> + * implemented with list_for_each_safe(), so save against removal of elements.
>> + */
>> +#define drm_gpuva_for_each_op_safe(op, next, ops) \
>> +	list_for_each_entry_safe(op, next, &(ops)->list, entry)
>> +
>> +struct drm_gpuva_ops *
>> +drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
>> +			    u64 addr, u64 range,
>> +			    struct drm_gem_object *obj, u64 offset);
>> +struct drm_gpuva_ops *
>> +drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
>> +			      u64 addr, u64 range);
>> +void drm_gpuva_ops_free(struct drm_gpuva_ops *ops);
>> +
>> +#endif /* __DRM_GPUVA_MGR_H__ */
>> -- 
>> 2.39.0
>>
> 

