Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0160A731B52
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 16:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045E210E507;
	Thu, 15 Jun 2023 14:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ED110E506
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686839300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2AppGI609JbEPwHraZbtSwMpZ0sEabRHse5zg46RZUI=;
 b=bdgByvtAXYimL0XOIK9sT1BT90A/R6yHL32HBXTYdvqy1uzb4ra2tGDCm3IUcJYGXrsuxi
 6qNqKdUTbSRBMxD3WtZuofybfRpPgbx6jExMk7tvvALGKTyBCjTCRWyMeCUk4q1oodFm4P
 WpMP2IoSrHTMDm2657hhZEVxkugKJXg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-Xcua_1DgN3ene8KJNq6ffQ-1; Thu, 15 Jun 2023 10:28:10 -0400
X-MC-Unique: Xcua_1DgN3ene8KJNq6ffQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-982ab5d1151so58037366b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 07:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686839285; x=1689431285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2AppGI609JbEPwHraZbtSwMpZ0sEabRHse5zg46RZUI=;
 b=JpV7Ey4RUHWn/Nts959MAtZnT9pMdQTT3dbPfruk+4QrM1YhEkelq2X57miz6A2DBb
 yBdRVmmSlckbFyRTfpa/NdQw/qjc2j+cC5N/BhSsQRuWTX527IfqGhdcVlzdE2Przpqu
 dI1H7lf/6jgWnO27/wcB0N9VnNTDaHE8261FASdZUkr18USGua97lZylMqMN0oCSmE8O
 +A06jxd41lhEiLH40hdjZnlFLR2sDE56c3AjlFEEwwtI/lvEYUdRN+vP2ijy/ndwQ2Ln
 JzZRkyCb/vrK043TSfWFj1jAgxOEBcYYBoUH2P2UmF8orhuiktbBaaOkJsYepaeEYa5x
 ai5A==
X-Gm-Message-State: AC+VfDw58vkdODx14ImeBHffIW01ierZRTcU+h/jAwl512/Ex7voQzjP
 TonfCmSYqKqU2QDTEC+XI503Rb4rfSNXdfoFevFGSsqplrTtvmI7YAoxg9Zm0jAuYr8Pap+oUAD
 oKhWgc3qNooNPINGkUoyrV144NQFq
X-Received: by 2002:a17:907:3e1a:b0:982:69cd:7362 with SMTP id
 hp26-20020a1709073e1a00b0098269cd7362mr5099953ejc.38.1686839283934; 
 Thu, 15 Jun 2023 07:28:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ627TVnUTdIhGpVoGmLjI6eKeJ48dYdPBzEFnoCIsBwuV6DZCVt8MqyUKBpVvMufMsolotTiQ==
X-Received: by 2002:a17:907:3e1a:b0:982:69cd:7362 with SMTP id
 hp26-20020a1709073e1a00b0098269cd7362mr5099899ejc.38.1686839282738; 
 Thu, 15 Jun 2023 07:28:02 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a170906489a00b0097d7924b4edsm7875737ejq.168.2023.06.15.07.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 07:28:02 -0700 (PDT)
Date: Thu, 15 Jun 2023 16:27:58 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [PATCH drm-next v4 03/14] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <ZIsf7jAWNrStIZt7@pollux>
References: <20230606223130.6132-1-dakr@redhat.com>
 <20230606223130.6132-4-dakr@redhat.com>
 <20230614002935.rwbbys7bbxuaoxod@revolver>
MIME-Version: 1.0
In-Reply-To: <20230614002935.rwbbys7bbxuaoxod@revolver>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, boris.brezillon@collabora.com,
 bskeggs@redhat.com, tzimmermann@suse.de, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 08:29:35PM -0400, Liam R. Howlett wrote:
> * Danilo Krummrich <dakr@redhat.com> [230606 18:32]:
> > Add infrastructure to keep track of GPU virtual address (VA) mappings
> > with a decicated VA space manager implementation.
> > 
> > New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> > start implementing, allow userspace applications to request multiple and
> > arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> > intended to serve the following purposes in this context.
> > 
> > 1) Provide infrastructure to track GPU VA allocations and mappings,
> >    making use of the maple_tree.
> > 
> > 2) Generically connect GPU VA mappings to their backing buffers, in
> >    particular DRM GEM objects.
> > 
> > 3) Provide a common implementation to perform more complex mapping
> >    operations on the GPU VA space. In particular splitting and merging
> >    of GPU VA mappings, e.g. for intersecting mapping requests or partial
> >    unmap requests.
> > 
> > Suggested-by: Dave Airlie <airlied@redhat.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  Documentation/gpu/drm-mm.rst    |   31 +
> >  drivers/gpu/drm/Makefile        |    1 +
> >  drivers/gpu/drm/drm_gem.c       |    3 +
> >  drivers/gpu/drm/drm_gpuva_mgr.c | 1687 +++++++++++++++++++++++++++++++
> >  include/drm/drm_drv.h           |    6 +
> >  include/drm/drm_gem.h           |   75 ++
> >  include/drm/drm_gpuva_mgr.h     |  681 +++++++++++++
> >  7 files changed, 2484 insertions(+)
> >  create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
> >  create mode 100644 include/drm/drm_gpuva_mgr.h
> > 
> > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> > index a52e6f4117d6..c9f120cfe730 100644
> > --- a/Documentation/gpu/drm-mm.rst
> > +++ b/Documentation/gpu/drm-mm.rst
> > @@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
> >  .. kernel-doc:: drivers/gpu/drm/drm_mm.c
> >     :export:
> >  
> > +DRM GPU VA Manager
> > +==================
> > +
> > +Overview
> > +--------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> > +   :doc: Overview
> > +
> > +Split and Merge
> > +---------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> > +   :doc: Split and Merge
> > +
> > +Locking
> > +-------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> > +   :doc: Locking
> > +
> > +
> > +DRM GPU VA Manager Function References
> > +--------------------------------------
> > +
> > +.. kernel-doc:: include/drm/drm_gpuva_mgr.h
> > +   :internal:
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
> > +   :export:
> > +
> >  DRM Buddy Allocator
> >  ===================
> >  
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index 9c6446eb3c83..8eeed446a078 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -45,6 +45,7 @@ drm-y := \
> >  	drm_vblank.o \
> >  	drm_vblank_work.o \
> >  	drm_vma_manager.o \
> > +	drm_gpuva_mgr.o \
> >  	drm_writeback.o
> >  drm-$(CONFIG_DRM_LEGACY) += \
> >  	drm_agpsupport.o \
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 1a5a2cd0d4ec..cd878ebddbd0 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -164,6 +164,9 @@ void drm_gem_private_object_init(struct drm_device *dev,
> >  	if (!obj->resv)
> >  		obj->resv = &obj->_resv;
> >  
> > +	if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
> > +		drm_gem_gpuva_init(obj);
> > +
> >  	drm_vma_node_reset(&obj->vma_node);
> >  	INIT_LIST_HEAD(&obj->lru_node);
> >  }
> > diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> > new file mode 100644
> > index 000000000000..dd8dd7fef14b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> > @@ -0,0 +1,1687 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2022 Red Hat.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + *
> > + * Authors:
> > + *     Danilo Krummrich <dakr@redhat.com>
> > + *
> > + */
> > +
> > +#include <drm/drm_gem.h>
> > +#include <drm/drm_gpuva_mgr.h>
> > +
> > +/**
> > + * DOC: Overview
> > + *
> > + * The DRM GPU VA Manager, represented by struct drm_gpuva_manager keeps track
> > + * of a GPU's virtual address (VA) space and manages the corresponding virtual
> > + * mappings represented by &drm_gpuva objects. It also keeps track of the
> > + * mapping's backing &drm_gem_object buffers.
> > + *
> > + * &drm_gem_object buffers maintain a list (and a corresponding list lock) of
> > + * &drm_gpuva objects representing all existent GPU VA mappings using this
> > + * &drm_gem_object as backing buffer.
> > + *
> > + * GPU VAs can be flagged as sparse, such that drivers may use GPU VAs to also
> > + * keep track of sparse PTEs in order to support Vulkan 'Sparse Resources'.
> > + *
> > + * The GPU VA manager internally uses a &maple_tree to manage the
> > + * &drm_gpuva mappings within a GPU's virtual address space.
> > + *
> > + * The &drm_gpuva_manager contains a special &drm_gpuva representing the
> > + * portion of VA space reserved by the kernel. This node is initialized together
> > + * with the GPU VA manager instance and removed when the GPU VA manager is
> > + * destroyed.
> > + *
> > + * In a typical application drivers would embed struct drm_gpuva_manager and
> > + * struct drm_gpuva within their own driver specific structures, there won't be
> > + * any memory allocations of it's own nor memory allocations of &drm_gpuva
> > + * entries.
> > + *
> > + * However, the &drm_gpuva_manager needs to allocate nodes for it's internal
> > + * tree structures when &drm_gpuva entries are inserted. In order to support
> > + * inserting &drm_gpuva entries from dma-fence signalling critical sections the
> > + * &drm_gpuva_manager provides struct drm_gpuva_prealloc. Drivers may create
> > + * pre-allocated nodes which drm_gpuva_prealloc_create() and subsequently insert
> > + * a new &drm_gpuva entry with drm_gpuva_insert_prealloc().
> > + */
> > +
> > +/**
> > + * DOC: Split and Merge
> > + *
> > + * The DRM GPU VA manager also provides an algorithm implementing splitting and
> > + * merging of existent GPU VA mappings with the ones that are requested to be
> > + * mapped or unmapped. This feature is required by the Vulkan API to implement
> > + * Vulkan 'Sparse Memory Bindings' - drivers UAPIs often refer to this as
> > + * VM BIND.
> > + *
> > + * Drivers can call drm_gpuva_sm_map() to receive a sequence of callbacks
> > + * containing map, unmap and remap operations for a given newly requested
> > + * mapping. The sequence of callbacks represents the set of operations to
> > + * execute in order to integrate the new mapping cleanly into the current state
> > + * of the GPU VA space.
> > + *
> > + * Depending on how the new GPU VA mapping intersects with the existent mappings
> > + * of the GPU VA space the &drm_gpuva_fn_ops callbacks contain an arbitrary
> > + * amount of unmap operations, a maximum of two remap operations and a single
> > + * map operation. The caller might receive no callback at all if no operation is
> > + * required, e.g. if the requested mapping already exists in the exact same way.
> > + *
> > + * The single map operation represents the original map operation requested by
> > + * the caller.
> > + *
> > + * &drm_gpuva_op_unmap contains a 'keep' field, which indicates whether the
> > + * &drm_gpuva to unmap is physically contiguous with the original mapping
> > + * request. Optionally, if 'keep' is set, drivers may keep the actual page table
> > + * entries for this &drm_gpuva, adding the missing page table entries only and
> > + * update the &drm_gpuva_manager's view of things accordingly.
> > + *
> > + * Drivers may do the same optimization, namely delta page table updates, also
> > + * for remap operations. This is possible since &drm_gpuva_op_remap consists of
> > + * one unmap operation and one or two map operations, such that drivers can
> > + * derive the page table update delta accordingly.
> > + *
> > + * Note that there can't be more than two existent mappings to split up, one at
> > + * the beginning and one at the end of the new mapping, hence there is a
> > + * maximum of two remap operations.
> > + *
> > + * Analogous to drm_gpuva_sm_map() drm_gpuva_sm_unmap() uses &drm_gpuva_fn_ops
> > + * to call back into the driver in order to unmap a range of GPU VA space. The
> > + * logic behind this function is way simpler though: For all existent mappings
> > + * enclosed by the given range unmap operations are created. For mappings which
> > + * are only partically located within the given range, remap operations are
> > + * created such that those mappings are split up and re-mapped partically.
> > + *
> > + * To update the &drm_gpuva_manager's view of the GPU VA space
> > + * drm_gpuva_insert(), drm_gpuva_insert_prealloc(), and drm_gpuva_remove() may
> > + * be used. Please note that these functions are not safe to be called from a
> > + * &drm_gpuva_fn_ops callback originating from drm_gpuva_sm_map() or
> > + * drm_gpuva_sm_unmap(). The drm_gpuva_map(), drm_gpuva_remap() and
> > + * drm_gpuva_unmap() helpers should be used instead.
> > + *
> > + * The following diagram depicts the basic relationships of existent GPU VA
> > + * mappings, a newly requested mapping and the resulting mappings as implemented
> > + * by drm_gpuva_sm_map() - it doesn't cover any arbitrary combinations of these.
> > + *
> > + * 1) Requested mapping is identical. Replace it, but indicate the backing PTEs
> > + *    could be kept.
> > + *
> > + *    ::
> > + *
> > + *	     0     a     1
> > + *	old: |-----------| (bo_offset=n)
> > + *
> > + *	     0     a     1
> > + *	req: |-----------| (bo_offset=n)
> > + *
> > + *	     0     a     1
> > + *	new: |-----------| (bo_offset=n)
> > + *
> > + *
> > + * 2) Requested mapping is identical, except for the BO offset, hence replace
> > + *    the mapping.
> > + *
> > + *    ::
> > + *
> > + *	     0     a     1
> > + *	old: |-----------| (bo_offset=n)
> > + *
> > + *	     0     a     1
> > + *	req: |-----------| (bo_offset=m)
> > + *
> > + *	     0     a     1
> > + *	new: |-----------| (bo_offset=m)
> > + *
> > + *
> > + * 3) Requested mapping is identical, except for the backing BO, hence replace
> > + *    the mapping.
> > + *
> > + *    ::
> > + *
> > + *	     0     a     1
> > + *	old: |-----------| (bo_offset=n)
> > + *
> > + *	     0     b     1
> > + *	req: |-----------| (bo_offset=n)
> > + *
> > + *	     0     b     1
> > + *	new: |-----------| (bo_offset=n)
> > + *
> > + *
> > + * 4) Existent mapping is a left aligned subset of the requested one, hence
> > + *    replace the existent one.
> > + *
> > + *    ::
> > + *
> > + *	     0  a  1
> > + *	old: |-----|       (bo_offset=n)
> > + *
> > + *	     0     a     2
> > + *	req: |-----------| (bo_offset=n)
> > + *
> > + *	     0     a     2
> > + *	new: |-----------| (bo_offset=n)
> > + *
> > + *    .. note::
> > + *       We expect to see the same result for a request with a different BO
> > + *       and/or non-contiguous BO offset.
> > + *
> > + *
> > + * 5) Requested mapping's range is a left aligned subset of the existent one,
> > + *    but backed by a different BO. Hence, map the requested mapping and split
> > + *    the existent one adjusting it's BO offset.
> > + *
> > + *    ::
> > + *
> > + *	     0     a     2
> > + *	old: |-----------| (bo_offset=n)
> > + *
> > + *	     0  b  1
> > + *	req: |-----|       (bo_offset=n)
> > + *
> > + *	     0  b  1  a' 2
> > + *	new: |-----|-----| (b.bo_offset=n, a.bo_offset=n+1)
> > + *
> > + *    .. note::
> > + *       We expect to see the same result for a request with a different BO
> > + *       and/or non-contiguous BO offset.
> > + *
> > + *
> > + * 6) Existent mapping is a superset of the requested mapping. Split it up, but
> > + *    indicate that the backing PTEs could be kept.
> > + *
> > + *    ::
> > + *
> > + *	     0     a     2
> > + *	old: |-----------| (bo_offset=n)
> > + *
> > + *	     0  a  1
> > + *	req: |-----|       (bo_offset=n)
> > + *
> > + *	     0  a  1  a' 2
> > + *	new: |-----|-----| (a.bo_offset=n, a'.bo_offset=n+1)
> > + *
> > + *
> > + * 7) Requested mapping's range is a right aligned subset of the existent one,
> > + *    but backed by a different BO. Hence, map the requested mapping and split
> > + *    the existent one, without adjusting the BO offset.
> > + *
> > + *    ::
> > + *
> > + *	     0     a     2
> > + *	old: |-----------| (bo_offset=n)
> > + *
> > + *	           1  b  2
> > + *	req:       |-----| (bo_offset=m)
> > + *
> > + *	     0  a  1  b  2
> > + *	new: |-----|-----| (a.bo_offset=n,b.bo_offset=m)
> > + *
> > + *
> > + * 8) Existent mapping is a superset of the requested mapping. Split it up, but
> > + *    indicate that the backing PTEs could be kept.
> > + *
> > + *    ::
> > + *
> > + *	      0     a     2
> > + *	old: |-----------| (bo_offset=n)
> > + *
> > + *	           1  a  2
> > + *	req:       |-----| (bo_offset=n+1)
> > + *
> > + *	     0  a' 1  a  2
> > + *	new: |-----|-----| (a'.bo_offset=n, a.bo_offset=n+1)
> > + *
> > + *
> > + * 9) Existent mapping is overlapped at the end by the requested mapping backed
> > + *    by a different BO. Hence, map the requested mapping and split up the
> > + *    existent one, without adjusting the BO offset.
> > + *
> > + *    ::
> > + *
> > + *	     0     a     2
> > + *	old: |-----------|       (bo_offset=n)
> > + *
> > + *	           1     b     3
> > + *	req:       |-----------| (bo_offset=m)
> > + *
> > + *	     0  a  1     b     3
> > + *	new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
> > + *
> > + *
> > + * 10) Existent mapping is overlapped by the requested mapping, both having the
> > + *     same backing BO with a contiguous offset. Indicate the backing PTEs of
> > + *     the old mapping could be kept.
> > + *
> > + *     ::
> > + *
> > + *	      0     a     2
> > + *	 old: |-----------|       (bo_offset=n)
> > + *
> > + *	            1     a     3
> > + *	 req:       |-----------| (bo_offset=n+1)
> > + *
> > + *	      0  a' 1     a     3
> > + *	 new: |-----|-----------| (a'.bo_offset=n, a.bo_offset=n+1)
> > + *
> > + *
> > + * 11) Requested mapping's range is a centered subset of the existent one
> > + *     having a different backing BO. Hence, map the requested mapping and split
> > + *     up the existent one in two mappings, adjusting the BO offset of the right
> > + *     one accordingly.
> > + *
> > + *     ::
> > + *
> > + *	      0        a        3
> > + *	 old: |-----------------| (bo_offset=n)
> > + *
> > + *	            1  b  2
> > + *	 req:       |-----|       (bo_offset=m)
> > + *
> > + *	      0  a  1  b  2  a' 3
> > + *	 new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
> > + *
> > + *
> > + * 12) Requested mapping is a contiguous subset of the existent one. Split it
> > + *     up, but indicate that the backing PTEs could be kept.
> > + *
> > + *     ::
> > + *
> > + *	      0        a        3
> > + *	 old: |-----------------| (bo_offset=n)
> > + *
> > + *	            1  a  2
> > + *	 req:       |-----|       (bo_offset=n+1)
> > + *
> > + *	      0  a' 1  a  2 a'' 3
> > + *	 old: |-----|-----|-----| (a'.bo_offset=n, a.bo_offset=n+1, a''.bo_offset=n+2)
> > + *
> > + *
> > + * 13) Existent mapping is a right aligned subset of the requested one, hence
> > + *     replace the existent one.
> > + *
> > + *     ::
> > + *
> > + *	            1  a  2
> > + *	 old:       |-----| (bo_offset=n+1)
> > + *
> > + *	      0     a     2
> > + *	 req: |-----------| (bo_offset=n)
> > + *
> > + *	      0     a     2
> > + *	 new: |-----------| (bo_offset=n)
> > + *
> > + *     .. note::
> > + *        We expect to see the same result for a request with a different bo
> > + *        and/or non-contiguous bo_offset.
> > + *
> > + *
> > + * 14) Existent mapping is a centered subset of the requested one, hence
> > + *     replace the existent one.
> > + *
> > + *     ::
> > + *
> > + *	            1  a  2
> > + *	 old:       |-----| (bo_offset=n+1)
> > + *
> > + *	      0        a       3
> > + *	 req: |----------------| (bo_offset=n)
> > + *
> > + *	      0        a       3
> > + *	 new: |----------------| (bo_offset=n)
> > + *
> > + *     .. note::
> > + *        We expect to see the same result for a request with a different bo
> > + *        and/or non-contiguous bo_offset.
> > + *
> > + *
> > + * 15) Existent mappings is overlapped at the beginning by the requested mapping
> > + *     backed by a different BO. Hence, map the requested mapping and split up
> > + *     the existent one, adjusting it's BO offset accordingly.
> > + *
> > + *     ::
> > + *
> > + *	            1     a     3
> > + *	 old:       |-----------| (bo_offset=n)
> > + *
> > + *	      0     b     2
> > + *	 req: |-----------|       (bo_offset=m)
> > + *
> > + *	      0     b     2  a' 3
> > + *	 new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> > + */
> > +
> > +/**
> > + * DOC: Locking
> > + *
> > + * Generally, the GPU VA manager does not take care of locking itself, it is
> > + * the drivers responsibility to take care about locking. Drivers might want to
> > + * protect the following operations: inserting, removing and iterating
> > + * &drm_gpuva objects as well as generating all kinds of operations, such as
> > + * split / merge or prefetch.
> > + *
> > + * The GPU VA manager also does not take care of the locking of the backing
> > + * &drm_gem_object buffers GPU VA lists by itself; drivers are responsible to
> > + * enforce mutual exclusion.
> > + */
> > +
> > + /*
> > +  * Maple Tree Locking
> > +  *
> > +  * The maple tree's advanced API requires the user of the API to protect
> > +  * certain tree operations with a lock (either the external or internal tree
> > +  * lock) for tree internal reasons.
> > +  *
> > +  * The actual rules (when to aquire/release the lock) are enforced by lockdep
> > +  * through the maple tree implementation.
> > +  *
> > +  * For this reason the DRM GPUVA manager takes the maple tree's internal
> > +  * spinlock according to the lockdep enforced rules.
> > +  *
> > +  * Please note, that this lock is *only* meant to fulfill the maple trees
> > +  * requirements and does not intentionally protect the DRM GPUVA manager
> > +  * against concurrent access.
> > +  *
> > +  * The following mail thread provides more details on why the maple tree
> > +  * has this requirement.
> > +  *
> > +  * https://lore.kernel.org/lkml/20230217134422.14116-5-dakr@redhat.com/
> > +  */
> > +
> > +static int __drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> > +			      struct drm_gpuva *va);
> > +static void __drm_gpuva_remove(struct drm_gpuva *va);
> > +
> > +/**
> > + * drm_gpuva_manager_init - initialize a &drm_gpuva_manager
> > + * @mgr: pointer to the &drm_gpuva_manager to initialize
> > + * @name: the name of the GPU VA space
> > + * @start_offset: the start offset of the GPU VA space
> > + * @range: the size of the GPU VA space
> > + * @reserve_offset: the start of the kernel reserved GPU VA area
> > + * @reserve_range: the size of the kernel reserved GPU VA area
> > + * @ops: &drm_gpuva_fn_ops called on &drm_gpuva_sm_map / &drm_gpuva_sm_unmap
> > + *
> > + * The &drm_gpuva_manager must be initialized with this function before use.
> > + *
> > + * Note that @mgr must be cleared to 0 before calling this function. The given
> > + * &name is expected to be managed by the surrounding driver structures.
> > + */
> > +void
> > +drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
> > +		       const char *name,
> > +		       u64 start_offset, u64 range,
> > +		       u64 reserve_offset, u64 reserve_range,
> > +		       const struct drm_gpuva_fn_ops *ops)
> > +{
> > +	mt_init(&mgr->mtree);
> > +
> > +	mgr->mm_start = start_offset;
> > +	mgr->mm_range = range;
> > +
> > +	mgr->name = name ? name : "unknown";
> > +	mgr->ops = ops;
> > +
> > +	memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
> > +
> > +	if (reserve_range) {
> > +		mgr->kernel_alloc_node.va.addr = reserve_offset;
> > +		mgr->kernel_alloc_node.va.range = reserve_range;
> > +
> > +		__drm_gpuva_insert(mgr, &mgr->kernel_alloc_node);
> > +	}
> > +
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_manager_init);
> > +
> > +/**
> > + * drm_gpuva_manager_destroy - cleanup a &drm_gpuva_manager
> > + * @mgr: pointer to the &drm_gpuva_manager to clean up
> > + *
> > + * Note that it is a bug to call this function on a manager that still
> > + * holds GPU VA mappings.
> > + */
> > +void
> > +drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr)
> > +{
> > +	mgr->name = NULL;
> > +
> > +	if (mgr->kernel_alloc_node.va.range)
> > +		__drm_gpuva_remove(&mgr->kernel_alloc_node);
> > +
> > +	mtree_lock(&mgr->mtree);
> > +	WARN(!mtree_empty(&mgr->mtree),
> > +	     "GPUVA tree is not empty, potentially leaking memory.");
> > +	__mt_destroy(&mgr->mtree);
> > +	mtree_unlock(&mgr->mtree);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_manager_destroy);
> > +
> > +static inline bool
> > +drm_gpuva_in_mm_range(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
> > +{
> > +	u64 end = addr + range;
> > +	u64 mm_start = mgr->mm_start;
> > +	u64 mm_end = mm_start + mgr->mm_range;
> > +
> > +	return addr < mm_end && mm_start < end;
> > +}
> > +
> > +static inline bool
> > +drm_gpuva_in_kernel_node(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
> > +{
> > +	u64 end = addr + range;
> > +	u64 kstart = mgr->kernel_alloc_node.va.addr;
> > +	u64 krange = mgr->kernel_alloc_node.va.range;
> > +	u64 kend = kstart + krange;
> > +
> > +	return krange && addr < kend && kstart < end;
> > +}
> > +
> > +static inline bool
> > +drm_gpuva_range_valid(struct drm_gpuva_manager *mgr,
> > +		      u64 addr, u64 range)
> > +{
> > +	return drm_gpuva_in_mm_range(mgr, addr, range) &&
> > +	       !drm_gpuva_in_kernel_node(mgr, addr, range);
> > +}
> > +
> > +/**
> > + * drm_gpuva_iter_remove - removes the iterators current element
> > + * @it: the &drm_gpuva_iterator
> > + *
> > + * This removes the element the iterator currently points to.
> > + */
> > +void
> > +drm_gpuva_iter_remove(struct drm_gpuva_iterator *it)
> > +{
> > +	mas_lock(&it->mas);
> > +	mas_erase(&it->mas);
> > +	mas_unlock(&it->mas);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_iter_remove);
> > +
> > +/**
> > + * drm_gpuva_prealloc_create - creates a preallocated node to store a
> > + * &drm_gpuva entry.
> > + *
> > + * Returns: the &drm_gpuva_prealloc object on success, NULL on failure
> > + */
> > +struct drm_gpuva_prealloc *
> > +drm_gpuva_prealloc_create(struct drm_gpuva_manager *mgr)
> > +{
> > +	struct drm_gpuva_prealloc *pa;
> > +
> > +	pa = kzalloc(sizeof(*pa), GFP_KERNEL);
> > +	if (!pa)
> > +		return NULL;
> > +
> > +	mas_init(&pa->mas, &mgr->mtree, 0);
> 
> I've broken this interface on you too, with the mas_preallocate()
> change - See below.
> 
> > +	if (mas_preallocate(&pa->mas, GFP_KERNEL)) {
> > +		kfree(pa);
> > +		return NULL;
> > +	}
> > +
> > +	return pa;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_prealloc_create);
> > +
> > +/**
> > + * drm_gpuva_prealloc_destroy - destroyes a preallocated node and frees the
> > + * &drm_gpuva_prealloc
> 
> I tend to think of it as destroying a maple state by freeing the
> preallocated nodes, but I guess the state isn't destroyed.
> 

While writing 'preallocated node' I think I did not think of the maple tree
implementation behind it. I intended to tell the user of the API that the 'node'
(meaning an arbitrary place to store a GPUVA entry) internally is destroyed with
this function.

> > + *
> > + * @pa: the &drm_gpuva_prealloc to destroy
> > + */
> > +void
> > +drm_gpuva_prealloc_destroy(struct drm_gpuva_prealloc *pa)
> > +{
> > +	mas_destroy(&pa->mas);
> > +	kfree(pa);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_prealloc_destroy);
> > +
> > +static int
> > +drm_gpuva_insert_state(struct drm_gpuva_manager *mgr,
> > +		       struct ma_state *mas,
> > +		       struct drm_gpuva *va)
> 
> Couldn't these arguments could be on one line?
> 

Yep, gonna change that.

> > +{
> > +	u64 addr = va->va.addr;
> > +	u64 range = va->va.range;
> > +	u64 last = addr + range - 1;
> > +
> > +	mas_set(mas, addr);
> > +
> > +	mas_lock(mas);
> > +	if (unlikely(mas_walk(mas))) {
> > +		mas_unlock(mas);
> > +		return -EEXIST;
> > +	}
> > +
> > +	if (unlikely(mas->last < last)) {
> > +		mas_unlock(mas);
> > +		return -EEXIST;
> > +	}
> > +
> > +	mas->index = addr;
> > +	mas->last = last;
> > +
> > +	mas_store_prealloc(mas, va);
> > +	mas_unlock(mas);
> > +
> > +	va->mgr = mgr;
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +__drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> > +		   struct drm_gpuva *va)
> > +{
> > +	MA_STATE(mas, &mgr->mtree, 0, 0);
> > +	int ret;
> > +
> > +	ret = mas_preallocate(&mas, GFP_KERNEL);
> 
> mas_preallocate() is in the process of being updated to reduce the
> allocations, so this will eventually fail to compile [1].
> 
> mas_preallocate(&mas, va, GFP_KERNEL) will work in the future.

This is perfectly fine for __drm_gpuva_insert(). In fact, I could also just
use mas_store_gfp() right away in this function. The reason for this
mas_preallocate() is just to produce a common code path for __drm_gpuva_insert()
and drm_gpuva_insert_prealloc() with drm_gpuva_insert_state(). I already
considered to abstain from that and just implement __drm_gpuva_insert() with
mas_store_gfp() noticing the overhead of mas_preallocate() in this case.

However, considering your explanation below, I tend to think that this change
could be a showstopper for another use case. Please see the comment on
drm_gpuva_insert_prealloc().

> 
> The calculated allocations depend on the area being written and if there
> is a value or NULL being written.
> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	return drm_gpuva_insert_state(mgr, &mas, va);
> 
> This has the added effect that the mas_preallocate() examines the tree
> by walking it, so you need to hold the lock during that work.  It is
> also possible, since you are not holding the lock here, that you could
> have a writer come in and change what you preallocated to store and may
> cause the write to not have enough memory.  IIRC you have another
> locking strategy that negates this, but you will still need to hold the
> lock and have the maple state pointing at the correct range now (or,
> well, soon) to keep lockdep happy.
> 
> Change this:
> 	MA_STATE(mas, &mgr->mtree, 0, 0);
> 
> to something like this (but hopefully less ugly..)
> 	MA_STATE(mas, &mgr->mtree, va->va.addr, va->va.addr + va->va.range - 1);
> 
> ...maybe use mas_init() instead.
> 
> This strictly does not need to preallocate since you don't have complex
> locking in this case, but I suspect you are preallocating for external
> driver use as documented in this patch?  This can still work if the
> preallocation call sets up the maple state and the driver doesn't mess
> things up on you.  You could check that by verifying mas.index and
> mas.last are what you expect, but I think you'll want to move your
> mas_walk() checks to before preallocating.
> 
> [1] https://lore.kernel.org/all/20230612203953.2093911-1-Liam.Howlett@oracle.com/
> 
> > +}
> > +
> > +/**
> > + * drm_gpuva_insert - insert a &drm_gpuva
> > + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> > + * @va: the &drm_gpuva to insert
> > + *
> > + * Insert a &drm_gpuva with a given address and range into a
> > + * &drm_gpuva_manager.
> > + *
> > + * It is not allowed to use this function while iterating this GPU VA space,
> > + * e.g via drm_gpuva_iter_for_each().
> > + *
> > + * Returns: 0 on success, negative error code on failure.
> > + */
> > +int
> > +drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> > +		 struct drm_gpuva *va)
> > +{
> > +	u64 addr = va->va.addr;
> > +	u64 range = va->va.range;
> > +
> > +	if (unlikely(!drm_gpuva_range_valid(mgr, addr, range)))
> > +		return -EINVAL;
> > +
> > +	return __drm_gpuva_insert(mgr, va);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_insert);
> > +
> > +/**
> > + * drm_gpuva_insert_prealloc - insert a &drm_gpuva with a preallocated node
> > + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> > + * @va: the &drm_gpuva to insert
> > + * @pa: the &drm_gpuva_prealloc node
> > + *
> > + * Insert a &drm_gpuva with a given address and range into a
> > + * &drm_gpuva_manager.
> > + *
> > + * It is not allowed to use this function while iterating this GPU VA space,
> > + * e.g via drm_gpuva_iter_for_each().
> > + *
> > + * Returns: 0 on success, negative error code on failure.
> > + */
> > +int
> > +drm_gpuva_insert_prealloc(struct drm_gpuva_manager *mgr,
> > +			  struct drm_gpuva_prealloc *pa,
> > +			  struct drm_gpuva *va)
> > +{
> > +	struct ma_state *mas = &pa->mas;
> > +	u64 addr = va->va.addr;
> > +	u64 range = va->va.range;
> > +
> > +	if (unlikely(!drm_gpuva_range_valid(mgr, addr, range)))
> > +		return -EINVAL;
> > +
> > +	mas->tree = &mgr->mtree;
> 
> Are you trying to take the allocated nodes for a write to a different
> tree?  You may not have enough nodes..
> 

They're not going to a different tree. I guess your're confused why I set
mas->tree (again). And so am I - I think it is just a leftover. The tree is
already set in drm_gpuva_prealloc_create() through mas_init().

However, if I understand your changes to mas_preallocate() you explained above
correctly, your point "you may not have enough nodes" might still hold. Let me
explain:

When talking about locking I mentioned earlier that there are two cases.
In the first case users of the GPUVA manager need to hold a mutex (anyway) while
applying changes to the GPUVA space and hence the maple tree, not just to
protect the tree, but also to make sure that multiple changes to the GPUVA space
appear atomically.
In the second case, any accesses to GPUVA space are serialized and hence
technically don't require any locking at all.

In the latter, serialized, case we basically have two stages.
In the first one jobs to create / remove mappings are submitted to the driver,
which pre-allocates the required resources and puts the job into a job queue.
In a second stage the actual updates to the GPUVA space are performed
asynchronously running within a dma_fence signalling critical path and hence
no memory allocations are permitted. One single job entering the serialized path
can usually contain an arbitrary amount of map / unmap / remap operations and
hence an arbitrary amount of GPUVAs to add or remove from the maple tree.

Therefore at the time of pre-allocation we can't predict the state of the maple
tree at the time the pre-allocated nodes are actually used to insert an entry,
nor can we ensure that the maple tree doesn't change until the pre-allocated
nodes were actually used to insert an entry.

If I understand it correctly, until now mas_preallocate() allocates the
worst-case amount of nodes, which seems to be exactly what we need for this use
case. While with your change you walk the tree calculate how many nodes you need
at this time and hence require to not have the tree changed until the nodes were
used to store the indicated entry.

Would it be possible to just have both paths, your new mas_preallocate() and
something like mas_preallocate_worst_case() (hopefully with a better name)?

> > +	return drm_gpuva_insert_state(mgr, mas, va);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_insert_prealloc);
> > +
> > +static void
> > +__drm_gpuva_remove(struct drm_gpuva *va)
> > +{
> > +	MA_STATE(mas, &va->mgr->mtree, va->va.addr, 0);
> > +
> > +	mas_lock(&mas);
> > +	mas_erase(&mas);
> > +	mas_unlock(&mas);
> 
> This should be the same as: mtree_erase(&va->mgr->mtree, va->va.addr);
> 

Yeah, I think there are a few cases where I could do something similar as well.
I think in a follow up patch I already covered those, seems like I missed
them here.

> > +}
> > +
> > +/**
> > + * drm_gpuva_remove - remove a &drm_gpuva
> > + * @va: the &drm_gpuva to remove
> > + *
> > + * This removes the given &va from the underlaying tree.
> > + *
> > + * It is not allowed to use this function while iterating this GPU VA space,
> > + * e.g via drm_gpuva_iter_for_each(). Please use drm_gpuva_iter_remove()
> > + * instead.
> > + */
> > +void
> > +drm_gpuva_remove(struct drm_gpuva *va)
> > +{
> > +	struct drm_gpuva_manager *mgr = va->mgr;
> > +
> > +	if (unlikely(va == &mgr->kernel_alloc_node)) {
> > +		WARN(1, "Can't destroy kernel reserved node.\n");
> > +		return;
> > +	}
> > +
> > +	__drm_gpuva_remove(va);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_remove);
> > +
> > +/**
> > + * drm_gpuva_link - link a &drm_gpuva
> > + * @va: the &drm_gpuva to link
> > + *
> > + * This adds the given &va to the GPU VA list of the &drm_gem_object it is
> > + * associated with.
> > + *
> > + * This function expects the caller to protect the GEM's GPUVA list against
> > + * concurrent access.
> > + */
> > +void
> > +drm_gpuva_link(struct drm_gpuva *va)
> > +{
> > +	if (likely(va->gem.obj))
> > +		list_add_tail(&va->gem.entry, &va->gem.obj->gpuva.list);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_link);
> > +
> > +/**
> > + * drm_gpuva_unlink - unlink a &drm_gpuva
> > + * @va: the &drm_gpuva to unlink
> > + *
> > + * This removes the given &va from the GPU VA list of the &drm_gem_object it is
> > + * associated with.
> > + *
> > + * This function expects the caller to protect the GEM's GPUVA list against
> > + * concurrent access.
> > + */
> > +void
> > +drm_gpuva_unlink(struct drm_gpuva *va)
> > +{
> > +	if (likely(va->gem.obj))
> > +		list_del_init(&va->gem.entry);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_unlink);
> > +
> > +/**
> > + * drm_gpuva_find_first - find the first &drm_gpuva in the given range
> > + * @mgr: the &drm_gpuva_manager to search in
> > + * @addr: the &drm_gpuvas address
> > + * @range: the &drm_gpuvas range
> > + *
> > + * Returns: the first &drm_gpuva within the given range
> > + */
> > +struct drm_gpuva *
> > +drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
> > +		     u64 addr, u64 range)
> > +{
> > +	MA_STATE(mas, &mgr->mtree, addr, 0);
> > +	struct drm_gpuva *va;
> > +
> 
> Again, this can be an rcu_read_lock()
> 

Same as below.

> > +	mas_lock(&mas);
> > +	va = mas_find(&mas, addr + range - 1);
> > +	mas_unlock(&mas);
> > +
> > +	return va;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_find_first);
> > +
> > +/**
> > + * drm_gpuva_find - find a &drm_gpuva
> > + * @mgr: the &drm_gpuva_manager to search in
> > + * @addr: the &drm_gpuvas address
> > + * @range: the &drm_gpuvas range
> > + *
> > + * Returns: the &drm_gpuva at a given &addr and with a given &range
> > + */
> > +struct drm_gpuva *
> > +drm_gpuva_find(struct drm_gpuva_manager *mgr,
> > +	       u64 addr, u64 range)
> > +{
> > +	struct drm_gpuva *va;
> > +
> > +	va = drm_gpuva_find_first(mgr, addr, range);
> > +	if (!va)
> > +		goto out;
> > +
> > +	if (va->va.addr != addr ||
> > +	    va->va.range != range)
> > +		goto out;
> > +
> > +	return va;
> > +
> > +out:
> > +	return NULL;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_find);
> > +
> > +/**
> > + * drm_gpuva_find_prev - find the &drm_gpuva before the given address
> > + * @mgr: the &drm_gpuva_manager to search in
> > + * @start: the given GPU VA's start address
> > + *
> > + * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
> > + *
> > + * Note that if there is any free space between the GPU VA mappings no mapping
> > + * is returned.
> > + *
> > + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> > + */
> > +struct drm_gpuva *
> > +drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
> > +{
> > +	MA_STATE(mas, &mgr->mtree, start - 1, 0);
> > +	struct drm_gpuva *va;
> > +
> > +	if (start <= mgr->mm_start ||
> > +	    start > (mgr->mm_start + mgr->mm_range))
> > +		return NULL;
> > +
> 
> And here as well.  Maybe mtree_load() would be easier?
> 
> > +	mas_lock(&mas);
> > +	va = mas_walk(&mas);
> > +	mas_unlock(&mas);
> > +
> > +	return va;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_find_prev);
> > +
> > +/**
> > + * drm_gpuva_find_next - find the &drm_gpuva after the given address
> > + * @mgr: the &drm_gpuva_manager to search in
> > + * @end: the given GPU VA's end address
> > + *
> > + * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
> > + *
> > + * Note that if there is any free space between the GPU VA mappings no mapping
> > + * is returned.
> > + *
> > + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> > + */
> > +struct drm_gpuva *
> > +drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
> > +{
> > +	MA_STATE(mas, &mgr->mtree, end, 0);
> > +	struct drm_gpuva *va;
> > +
> > +	if (end < mgr->mm_start ||
> > +	    end >= (mgr->mm_start + mgr->mm_range))
> > +		return NULL;
> > +
> 
> Here too, you can use the mtree_load() function.
> 
> A note though that when I store my VMAs in the mm code, the VMAs are
> [start, end) and the tree is [start, end], so I always take one away.
> Not sure if your VMAs are the same way.
> 
> > +	mas_lock(&mas);
> > +	va = mas_walk(&mas);
> > +	mas_unlock(&mas);
> > +
> > +	return va;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_find_next);
> > +
> > +/**
> > + * drm_gpuva_interval_empty - indicate whether a given interval of the VA space
> > + * is empty
> > + * @mgr: the &drm_gpuva_manager to check the range for
> > + * @addr: the start address of the range
> > + * @range: the range of the interval
> > + *
> > + * Returns: true if the interval is empty, false otherwise
> > + */
> > +bool
> > +drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
> > +{
> > +	DRM_GPUVA_ITER(it, mgr, addr);
> > +	struct drm_gpuva *va;
> > +
> > +	drm_gpuva_iter_for_each_range(va, it, addr + range)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_interval_empty);
> > +
> > +/**
> > + * drm_gpuva_map - helper to insert a &drm_gpuva from &drm_gpuva_fn_ops
> > + * callbacks
> > + *
> > + * @mgr: the &drm_gpuva_manager
> > + * @pa: the &drm_gpuva_prealloc
> > + * @va: the &drm_gpuva to inser
> > + */
> > +int
> > +drm_gpuva_map(struct drm_gpuva_manager *mgr,
> > +	      struct drm_gpuva_prealloc *pa,
> > +	      struct drm_gpuva *va)
> > +{
> > +	return drm_gpuva_insert_prealloc(mgr, pa, va);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_map);
> > +
> > +/**
> > + * drm_gpuva_remap - helper to insert a &drm_gpuva from &drm_gpuva_fn_ops
> > + * callbacks
> > + *
> > + * @state: the current &drm_gpuva_state
> > + * @prev: the &drm_gpuva to remap when keeping the start of a mapping,
> > + * may be NULL
> > + * @next: the &drm_gpuva to remap when keeping the end of a mapping,
> > + * may be NULL
> > + */
> > +int
> > +drm_gpuva_remap(drm_gpuva_state_t state,
> > +		struct drm_gpuva *prev,
> > +		struct drm_gpuva *next)
> > +{
> > +	struct ma_state *mas = &state->mas;
> > +	u64 max = mas->last;
> > +
> > +	if (unlikely(!prev && !next))
> > +		return -EINVAL;
> > +
> > +	if (prev) {
> > +		u64 addr = prev->va.addr;
> > +		u64 last = addr + prev->va.range - 1;
> > +
> > +		if (unlikely(addr != mas->index))
> > +			return -EINVAL;
> > +
> > +		if (unlikely(last >= mas->last))
> > +			return -EINVAL;
> > +	}
> > +
> > +	if (next) {
> > +		u64 addr = next->va.addr;
> > +		u64 last = addr + next->va.range - 1;
> > +
> > +		if (unlikely(last != mas->last))
> > +			return -EINVAL;
> > +
> > +		if (unlikely(addr <= mas->index))
> > +			return -EINVAL;
> > +	}
> > +
> > +	if (prev && next) {
> > +		u64 p_last = prev->va.addr + prev->va.range - 1;
> > +		u64 n_addr = next->va.addr;
> > +
> > +		if (unlikely(p_last > n_addr))
> > +			return -EINVAL;
> > +
> > +		if (unlikely(n_addr - p_last <= 1))
> > +			return -EINVAL;
> > +	}
> > +
> > +	mas_lock(mas);
> > +	if (prev) {
> > +		mas_store(mas, prev);
> > +		mas_next(mas, max);
> 
> This will advance to the next entry, is that what you want to do?  I
> think you want mas_next_range(), which is in a recent patch set [2].  I
> believe, what you have here is a large range which is NULL and you are
> either inserting something at the start, at the end, or both?

drm_gpuva_remap() is called from a callback while walking the tree in
__drm_gpuva_sm_map() or __drm_gpuva_sm_unmap() with
drm_gpuva_iter_for_each_range() to insert a new mapping or unmap a given range.

It is called whenever the new mapping to insert or the given range to unmap
intersects with the entry at the iterators current position. For example:

     0        a        3
old: |-----------------| (bo_offset=n)

           1  b  2
req:       |-----|       (bo_offset=m)

     0  a' 1  b  2 a'' 3
new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)

In this example the current iterators entry would be a. prev would be a' and
next would be a''. When this function returns I expect to have a hole where b
should go. b would be inserted in the last iteration of
drm_gpuva_iter_for_each_range() in __drm_gpuva_sm_map from another callback,
which is drm_gpuva_map(). drm_gpuva_map() gets a struct drm_gpuva_prealloc
passed by the caller such that it got the pre-allocated nodes for inserting the
entry into the hole we left in this function.

Taking this example the maple tree should look like this right before the call
to mas_next():

0  a' 1     a     3
|-----|-----------|

So, what I expect from mas_next() is that it brings me to offset '1'.
Afterwards, we enter the 'if (next)' path and create the hole with
'mas->last = next->va.addr - 1' and 'mas_store(mas, NULL)'. Again calling
mas_next() to jump to offset '2' inserting a''.

Hopefully, now you can tell me whether I want mas_next() or mas_next_range()
here. :-)

> 
> [2] https://lore.kernel.org/lkml/20230518145544.1722059-29-Liam.Howlett@oracle.com/
> 
> > +		if (!next)
> > +			mas_store(mas, NULL);
> > +	}
> > +
> > +	if (next) {
> > +		mas->last = next->va.addr - 1;
> > +		mas_store(mas, NULL);
> > +		mas_next(mas, max);
> > +		mas_store(mas, next);
> > +	}
> > +	mas_unlock(mas);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_remap);
> > +
> > +/**
> > + * drm_gpuva_unmap - helper to remove a &drm_gpuva from &drm_gpuva_fn_ops
> > + * callbacks
> > + *
> > + * @state: the current &drm_gpuva_state
> > + *
> > + * The entry associated with the current state is removed.
> > + */
> > +void
> > +drm_gpuva_unmap(drm_gpuva_state_t state)
> > +{
> > +	drm_gpuva_iter_remove(state);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_unmap);
> > +
> > +static int
> > +op_map_cb(const struct drm_gpuva_fn_ops *fn, void *priv,
> > +	  u64 addr, u64 range,
> > +	  struct drm_gem_object *obj, u64 offset)
> > +{
> > +	struct drm_gpuva_op op = {};
> > +
> > +	op.op = DRM_GPUVA_OP_MAP;
> > +	op.map.va.addr = addr;
> > +	op.map.va.range = range;
> > +	op.map.gem.obj = obj;
> > +	op.map.gem.offset = offset;
> > +
> > +	return fn->sm_step_map(&op, priv);
> > +}
> > +
> > +static int
> > +op_remap_cb(const struct drm_gpuva_fn_ops *fn,
> > +	    drm_gpuva_state_t state, void *priv,
> > +	    struct drm_gpuva_op_map *prev,
> > +	    struct drm_gpuva_op_map *next,
> > +	    struct drm_gpuva_op_unmap *unmap)
> > +{
> > +	struct drm_gpuva_op op = {};
> > +	struct drm_gpuva_op_remap *r;
> > +
> > +	op.op = DRM_GPUVA_OP_REMAP;
> > +	r = &op.remap;
> > +	r->prev = prev;
> > +	r->next = next;
> > +	r->unmap = unmap;
> > +
> > +	return fn->sm_step_remap(&op, state, priv);
> > +}
> > +
> > +static int
> > +op_unmap_cb(const struct drm_gpuva_fn_ops *fn,
> > +	    drm_gpuva_state_t state, void *priv,
> > +	    struct drm_gpuva *va, bool merge)
> > +{
> > +	struct drm_gpuva_op op = {};
> > +
> > +	op.op = DRM_GPUVA_OP_UNMAP;
> > +	op.unmap.va = va;
> > +	op.unmap.keep = merge;
> > +
> > +	return fn->sm_step_unmap(&op, state, priv);
> > +}
> > +
> > +static int
> > +__drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
> > +		   const struct drm_gpuva_fn_ops *ops, void *priv,
> > +		   u64 req_addr, u64 req_range,
> > +		   struct drm_gem_object *req_obj, u64 req_offset)
> > +{
> > +	DRM_GPUVA_ITER(it, mgr, req_addr);
> > +	struct drm_gpuva *va, *prev = NULL;
> > +	u64 req_end = req_addr + req_range;
> > +	int ret;
> > +
> > +	if (unlikely(!drm_gpuva_in_mm_range(mgr, req_addr, req_range)))
> > +		return -EINVAL;
> > +
> > +	if (unlikely(drm_gpuva_in_kernel_node(mgr, req_addr, req_range)))
> > +		return -EINVAL;
> > +
> > +	drm_gpuva_iter_for_each_range(va, it, req_end) {
> > +		struct drm_gem_object *obj = va->gem.obj;
> > +		u64 offset = va->gem.offset;
> > +		u64 addr = va->va.addr;
> > +		u64 range = va->va.range;
> > +		u64 end = addr + range;
> > +		bool merge = !!va->gem.obj;
> > +
> > +		if (addr == req_addr) {
> > +			merge &= obj == req_obj &&
> > +				 offset == req_offset;
> > +
> > +			if (end == req_end) {
> > +				ret = op_unmap_cb(ops, &it, priv, va, merge);
> > +				if (ret)
> > +					return ret;
> > +				break;
> > +			}
> > +
> > +			if (end < req_end) {
> > +				ret = op_unmap_cb(ops, &it, priv, va, merge);
> > +				if (ret)
> > +					return ret;
> > +				goto next;
> > +			}
> > +
> > +			if (end > req_end) {
> > +				struct drm_gpuva_op_map n = {
> > +					.va.addr = req_end,
> > +					.va.range = range - req_range,
> > +					.gem.obj = obj,
> > +					.gem.offset = offset + req_range,
> > +				};
> > +				struct drm_gpuva_op_unmap u = {
> > +					.va = va,
> > +					.keep = merge,
> > +				};
> > +
> > +				ret = op_remap_cb(ops, &it, priv, NULL, &n, &u);
> > +				if (ret)
> > +					return ret;
> > +				break;
> > +			}
> > +		} else if (addr < req_addr) {
> > +			u64 ls_range = req_addr - addr;
> > +			struct drm_gpuva_op_map p = {
> > +				.va.addr = addr,
> > +				.va.range = ls_range,
> > +				.gem.obj = obj,
> > +				.gem.offset = offset,
> > +			};
> > +			struct drm_gpuva_op_unmap u = { .va = va };
> > +
> > +			merge &= obj == req_obj &&
> > +				 offset + ls_range == req_offset;
> > +			u.keep = merge;
> > +
> > +			if (end == req_end) {
> > +				ret = op_remap_cb(ops, &it, priv, &p, NULL, &u);
> > +				if (ret)
> > +					return ret;
> > +				break;
> > +			}
> > +
> > +			if (end < req_end) {
> > +				ret = op_remap_cb(ops, &it, priv, &p, NULL, &u);
> > +				if (ret)
> > +					return ret;
> > +				goto next;
> > +			}
> > +
> > +			if (end > req_end) {
> > +				struct drm_gpuva_op_map n = {
> > +					.va.addr = req_end,
> > +					.va.range = end - req_end,
> > +					.gem.obj = obj,
> > +					.gem.offset = offset + ls_range +
> > +						      req_range,
> > +				};
> > +
> > +				ret = op_remap_cb(ops, &it, priv, &p, &n, &u);
> > +				if (ret)
> > +					return ret;
> > +				break;
> > +			}
> > +		} else if (addr > req_addr) {
> > +			merge &= obj == req_obj &&
> > +				 offset == req_offset +
> > +					   (addr - req_addr);
> > +
> > +			if (end == req_end) {
> > +				ret = op_unmap_cb(ops, &it, priv, va, merge);
> > +				if (ret)
> > +					return ret;
> > +				break;
> > +			}
> > +
> > +			if (end < req_end) {
> > +				ret = op_unmap_cb(ops, &it, priv, va, merge);
> > +				if (ret)
> > +					return ret;
> > +				goto next;
> > +			}
> > +
> > +			if (end > req_end) {
> > +				struct drm_gpuva_op_map n = {
> > +					.va.addr = req_end,
> > +					.va.range = end - req_end,
> > +					.gem.obj = obj,
> > +					.gem.offset = offset + req_end - addr,
> > +				};
> > +				struct drm_gpuva_op_unmap u = {
> > +					.va = va,
> > +					.keep = merge,
> > +				};
> > +
> > +				ret = op_remap_cb(ops, &it, priv, NULL, &n, &u);
> > +				if (ret)
> > +					return ret;
> > +				break;
> > +			}
> > +		}
> > +next:
> > +		prev = va;
> > +	}
> > +
> > +	return op_map_cb(ops, priv,
> > +			 req_addr, req_range,
> > +			 req_obj, req_offset);
> > +}
> > +
> > +static int
> > +__drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr,
> > +		     const struct drm_gpuva_fn_ops *ops, void *priv,
> > +		     u64 req_addr, u64 req_range)
> > +{
> > +	DRM_GPUVA_ITER(it, mgr, req_addr);
> > +	struct drm_gpuva *va;
> > +	u64 req_end = req_addr + req_range;
> > +	int ret;
> > +
> > +	if (unlikely(drm_gpuva_in_kernel_node(mgr, req_addr, req_range)))
> > +		return -EINVAL;
> > +
> > +	drm_gpuva_iter_for_each_range(va, it, req_end) {
> > +		struct drm_gpuva_op_map prev = {}, next = {};
> > +		bool prev_split = false, next_split = false;
> > +		struct drm_gem_object *obj = va->gem.obj;
> > +		u64 offset = va->gem.offset;
> > +		u64 addr = va->va.addr;
> > +		u64 range = va->va.range;
> > +		u64 end = addr + range;
> > +
> > +		if (addr < req_addr) {
> > +			prev.va.addr = addr;
> > +			prev.va.range = req_addr - addr;
> > +			prev.gem.obj = obj;
> > +			prev.gem.offset = offset;
> > +
> > +			prev_split = true;
> > +		}
> > +
> > +		if (end > req_end) {
> > +			next.va.addr = req_end;
> > +			next.va.range = end - req_end;
> > +			next.gem.obj = obj;
> > +			next.gem.offset = offset + (req_end - addr);
> > +
> > +			next_split = true;
> > +		}
> > +
> > +		if (prev_split || next_split) {
> > +			struct drm_gpuva_op_unmap unmap = { .va = va };
> > +
> > +			ret = op_remap_cb(ops, &it, priv,
> > +					  prev_split ? &prev : NULL,
> > +					  next_split ? &next : NULL,
> > +					  &unmap);
> > +			if (ret)
> > +				return ret;
> > +		} else {
> > +			ret = op_unmap_cb(ops, &it, priv, va, false);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_gpuva_sm_map - creates the &drm_gpuva_op split/merge steps
> > + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * @req_addr: the start address of the new mapping
> > + * @req_range: the range of the new mapping
> > + * @req_obj: the &drm_gem_object to map
> > + * @req_offset: the offset within the &drm_gem_object
> > + * @priv: pointer to a driver private data structure
> > + *
> > + * This function iterates the given range of the GPU VA space. It utilizes the
> > + * &drm_gpuva_fn_ops to call back into the driver providing the split and merge
> > + * steps.
> > + *
> > + * Drivers may use these callbacks to update the GPU VA space right away within
> > + * the callback. In case the driver decides to copy and store the operations for
> > + * later processing neither this function nor &drm_gpuva_sm_unmap is allowed to
> > + * be called before the &drm_gpuva_manager's view of the GPU VA space was
> > + * updated with the previous set of operations. To update the
> > + * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
> > + * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
> > + * used.
> > + *
> > + * A sequence of callbacks can contain map, unmap and remap operations, but
> > + * the sequence of callbacks might also be empty if no operation is required,
> > + * e.g. if the requested mapping already exists in the exact same way.
> > + *
> > + * There can be an arbitrary amount of unmap operations, a maximum of two remap
> > + * operations and a single map operation. The latter one represents the original
> > + * map operation requested by the caller.
> > + *
> > + * Returns: 0 on success or a negative error code
> > + */
> > +int
> > +drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
> > +		 u64 req_addr, u64 req_range,
> > +		 struct drm_gem_object *req_obj, u64 req_offset)
> > +{
> > +	const struct drm_gpuva_fn_ops *ops = mgr->ops;
> > +
> > +	if (unlikely(!(ops && ops->sm_step_map &&
> > +		       ops->sm_step_remap &&
> > +		       ops->sm_step_unmap)))
> > +		return -EINVAL;
> > +
> > +	return __drm_gpuva_sm_map(mgr, ops, priv,
> > +				  req_addr, req_range,
> > +				  req_obj, req_offset);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_sm_map);
> > +
> > +/**
> > + * drm_gpuva_sm_unmap - creates the &drm_gpuva_ops to split on unmap
> > + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * @priv: pointer to a driver private data structure
> > + * @req_addr: the start address of the range to unmap
> > + * @req_range: the range of the mappings to unmap
> > + *
> > + * This function iterates the given range of the GPU VA space. It utilizes the
> > + * &drm_gpuva_fn_ops to call back into the driver providing the operations to
> > + * unmap and, if required, split existent mappings.
> > + *
> > + * Drivers may use these callbacks to update the GPU VA space right away within
> > + * the callback. In case the driver decides to copy and store the operations for
> > + * later processing neither this function nor &drm_gpuva_sm_map is allowed to be
> > + * called before the &drm_gpuva_manager's view of the GPU VA space was updated
> > + * with the previous set of operations. To update the &drm_gpuva_manager's view
> > + * of the GPU VA space drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
> > + * drm_gpuva_destroy_unlocked() should be used.
> > + *
> > + * A sequence of callbacks can contain unmap and remap operations, depending on
> > + * whether there are actual overlapping mappings to split.
> > + *
> > + * There can be an arbitrary amount of unmap operations and a maximum of two
> > + * remap operations.
> > + *
> > + * Returns: 0 on success or a negative error code
> > + */
> > +int
> > +drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
> > +		   u64 req_addr, u64 req_range)
> > +{
> > +	const struct drm_gpuva_fn_ops *ops = mgr->ops;
> > +
> > +	if (unlikely(!(ops && ops->sm_step_remap &&
> > +		       ops->sm_step_unmap)))
> > +		return -EINVAL;
> > +
> > +	return __drm_gpuva_sm_unmap(mgr, ops, priv,
> > +				    req_addr, req_range);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_sm_unmap);
> > +
> > +static struct drm_gpuva_op *
> > +gpuva_op_alloc(struct drm_gpuva_manager *mgr)
> > +{
> > +	const struct drm_gpuva_fn_ops *fn = mgr->ops;
> > +	struct drm_gpuva_op *op;
> > +
> > +	if (fn && fn->op_alloc)
> > +		op = fn->op_alloc();
> > +	else
> > +		op = kzalloc(sizeof(*op), GFP_KERNEL);
> > +
> > +	if (unlikely(!op))
> > +		return NULL;
> > +
> > +	return op;
> > +}
> > +
> > +static void
> > +gpuva_op_free(struct drm_gpuva_manager *mgr,
> > +	      struct drm_gpuva_op *op)
> > +{
> > +	const struct drm_gpuva_fn_ops *fn = mgr->ops;
> > +
> > +	if (fn && fn->op_free)
> > +		fn->op_free(op);
> > +	else
> > +		kfree(op);
> > +}
> > +
> > +static int
> > +drm_gpuva_sm_step(struct drm_gpuva_op *__op,
> > +		  drm_gpuva_state_t state,
> > +		  void *priv)
> > +{
> > +	struct {
> > +		struct drm_gpuva_manager *mgr;
> > +		struct drm_gpuva_ops *ops;
> > +	} *args = priv;
> > +	struct drm_gpuva_manager *mgr = args->mgr;
> > +	struct drm_gpuva_ops *ops = args->ops;
> > +	struct drm_gpuva_op *op;
> > +
> > +	op = gpuva_op_alloc(mgr);
> > +	if (unlikely(!op))
> > +		goto err;
> > +
> > +	memcpy(op, __op, sizeof(*op));
> > +
> > +	if (op->op == DRM_GPUVA_OP_REMAP) {
> > +		struct drm_gpuva_op_remap *__r = &__op->remap;
> > +		struct drm_gpuva_op_remap *r = &op->remap;
> > +
> > +		r->unmap = kmemdup(__r->unmap, sizeof(*r->unmap),
> > +				   GFP_KERNEL);
> > +		if (unlikely(!r->unmap))
> > +			goto err_free_op;
> > +
> > +		if (__r->prev) {
> > +			r->prev = kmemdup(__r->prev, sizeof(*r->prev),
> > +					  GFP_KERNEL);
> > +			if (unlikely(!r->prev))
> > +				goto err_free_unmap;
> > +		}
> > +
> > +		if (__r->next) {
> > +			r->next = kmemdup(__r->next, sizeof(*r->next),
> > +					  GFP_KERNEL);
> > +			if (unlikely(!r->next))
> > +				goto err_free_prev;
> > +		}
> > +	}
> > +
> > +	list_add_tail(&op->entry, &ops->list);
> > +
> > +	return 0;
> > +
> > +err_free_unmap:
> > +	kfree(op->remap.unmap);
> > +err_free_prev:
> > +	kfree(op->remap.prev);
> > +err_free_op:
> > +	gpuva_op_free(mgr, op);
> > +err:
> > +	return -ENOMEM;
> > +}
> > +
> > +static int
> > +drm_gpuva_sm_step_map(struct drm_gpuva_op *__op, void *priv)
> > +{
> > +	return drm_gpuva_sm_step(__op, NULL, priv);
> > +}
> > +
> > +static const struct drm_gpuva_fn_ops gpuva_list_ops = {
> > +	.sm_step_map = drm_gpuva_sm_step_map,
> > +	.sm_step_remap = drm_gpuva_sm_step,
> > +	.sm_step_unmap = drm_gpuva_sm_step,
> > +};
> > +
> > +/**
> > + * drm_gpuva_sm_map_ops_create - creates the &drm_gpuva_ops to split and merge
> > + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * @req_addr: the start address of the new mapping
> > + * @req_range: the range of the new mapping
> > + * @req_obj: the &drm_gem_object to map
> > + * @req_offset: the offset within the &drm_gem_object
> > + *
> > + * This function creates a list of operations to perform splitting and merging
> > + * of existent mapping(s) with the newly requested one.
> > + *
> > + * The list can be iterated with &drm_gpuva_for_each_op and must be processed
> > + * in the given order. It can contain map, unmap and remap operations, but it
> > + * also can be empty if no operation is required, e.g. if the requested mapping
> > + * already exists is the exact same way.
> > + *
> > + * There can be an arbitrary amount of unmap operations, a maximum of two remap
> > + * operations and a single map operation. The latter one represents the original
> > + * map operation requested by the caller.
> > + *
> > + * Note that before calling this function again with another mapping request it
> > + * is necessary to update the &drm_gpuva_manager's view of the GPU VA space. The
> > + * previously obtained operations must be either processed or abandoned. To
> > + * update the &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
> > + * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
> > + * used.
> > + *
> > + * After the caller finished processing the returned &drm_gpuva_ops, they must
> > + * be freed with &drm_gpuva_ops_free.
> > + *
> > + * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
> > + */
> > +struct drm_gpuva_ops *
> > +drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
> > +			    u64 req_addr, u64 req_range,
> > +			    struct drm_gem_object *req_obj, u64 req_offset)
> > +{
> > +	struct drm_gpuva_ops *ops;
> > +	struct {
> > +		struct drm_gpuva_manager *mgr;
> > +		struct drm_gpuva_ops *ops;
> > +	} args;
> > +	int ret;
> > +
> > +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
> > +	if (unlikely(!ops))
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	INIT_LIST_HEAD(&ops->list);
> > +
> > +	args.mgr = mgr;
> > +	args.ops = ops;
> > +
> > +	ret = __drm_gpuva_sm_map(mgr, &gpuva_list_ops, &args,
> > +				 req_addr, req_range,
> > +				 req_obj, req_offset);
> > +	if (ret)
> > +		goto err_free_ops;
> > +
> > +	return ops;
> > +
> > +err_free_ops:
> > +	drm_gpuva_ops_free(mgr, ops);
> > +	return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_sm_map_ops_create);
> > +
> > +/**
> > + * drm_gpuva_sm_unmap_ops_create - creates the &drm_gpuva_ops to split on unmap
> > + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * @req_addr: the start address of the range to unmap
> > + * @req_range: the range of the mappings to unmap
> > + *
> > + * This function creates a list of operations to perform unmapping and, if
> > + * required, splitting of the mappings overlapping the unmap range.
> > + *
> > + * The list can be iterated with &drm_gpuva_for_each_op and must be processed
> > + * in the given order. It can contain unmap and remap operations, depending on
> > + * whether there are actual overlapping mappings to split.
> > + *
> > + * There can be an arbitrary amount of unmap operations and a maximum of two
> > + * remap operations.
> > + *
> > + * Note that before calling this function again with another range to unmap it
> > + * is necessary to update the &drm_gpuva_manager's view of the GPU VA space. The
> > + * previously obtained operations must be processed or abandoned. To update the
> > + * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
> > + * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
> > + * used.
> > + *
> > + * After the caller finished processing the returned &drm_gpuva_ops, they must
> > + * be freed with &drm_gpuva_ops_free.
> > + *
> > + * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
> > + */
> > +struct drm_gpuva_ops *
> > +drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
> > +			      u64 req_addr, u64 req_range)
> > +{
> > +	struct drm_gpuva_ops *ops;
> > +	struct {
> > +		struct drm_gpuva_manager *mgr;
> > +		struct drm_gpuva_ops *ops;
> > +	} args;
> > +	int ret;
> > +
> > +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
> > +	if (unlikely(!ops))
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	INIT_LIST_HEAD(&ops->list);
> > +
> > +	args.mgr = mgr;
> > +	args.ops = ops;
> > +
> > +	ret = __drm_gpuva_sm_unmap(mgr, &gpuva_list_ops, &args,
> > +				   req_addr, req_range);
> > +	if (ret)
> > +		goto err_free_ops;
> > +
> > +	return ops;
> > +
> > +err_free_ops:
> > +	drm_gpuva_ops_free(mgr, ops);
> > +	return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_sm_unmap_ops_create);
> > +
> > +/**
> > + * drm_gpuva_prefetch_ops_create - creates the &drm_gpuva_ops to prefetch
> > + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * @addr: the start address of the range to prefetch
> > + * @range: the range of the mappings to prefetch
> > + *
> > + * This function creates a list of operations to perform prefetching.
> > + *
> > + * The list can be iterated with &drm_gpuva_for_each_op and must be processed
> > + * in the given order. It can contain prefetch operations.
> > + *
> > + * There can be an arbitrary amount of prefetch operations.
> > + *
> > + * After the caller finished processing the returned &drm_gpuva_ops, they must
> > + * be freed with &drm_gpuva_ops_free.
> > + *
> > + * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
> > + */
> > +struct drm_gpuva_ops *
> > +drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
> > +			      u64 addr, u64 range)
> > +{
> > +	DRM_GPUVA_ITER(it, mgr, addr);
> > +	struct drm_gpuva_ops *ops;
> > +	struct drm_gpuva_op *op;
> > +	struct drm_gpuva *va;
> > +	int ret;
> > +
> > +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
> > +	if (!ops)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	INIT_LIST_HEAD(&ops->list);
> > +
> > +	drm_gpuva_iter_for_each_range(va, it, addr + range) {
> > +		op = gpuva_op_alloc(mgr);
> > +		if (!op) {
> > +			ret = -ENOMEM;
> > +			goto err_free_ops;
> > +		}
> > +
> > +		op->op = DRM_GPUVA_OP_PREFETCH;
> > +		op->prefetch.va = va;
> > +		list_add_tail(&op->entry, &ops->list);
> > +	}
> > +
> > +	return ops;
> > +
> > +err_free_ops:
> > +	drm_gpuva_ops_free(mgr, ops);
> > +	return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_prefetch_ops_create);
> > +
> > +/**
> > + * drm_gpuva_gem_unmap_ops_create - creates the &drm_gpuva_ops to unmap a GEM
> > + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> > + * @obj: the &drm_gem_object to unmap
> > + *
> > + * This function creates a list of operations to perform unmapping for every
> > + * GPUVA attached to a GEM.
> > + *
> > + * The list can be iterated with &drm_gpuva_for_each_op and consists out of an
> > + * arbitrary amount of unmap operations.
> > + *
> > + * After the caller finished processing the returned &drm_gpuva_ops, they must
> > + * be freed with &drm_gpuva_ops_free.
> > + *
> > + * It is the callers responsibility to protect the GEMs GPUVA list against
> > + * concurrent access.
> > + *
> > + * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
> > + */
> > +struct drm_gpuva_ops *
> > +drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
> > +			       struct drm_gem_object *obj)
> > +{
> > +	struct drm_gpuva_ops *ops;
> > +	struct drm_gpuva_op *op;
> > +	struct drm_gpuva *va;
> > +	int ret;
> > +
> > +	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
> > +	if (!ops)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	INIT_LIST_HEAD(&ops->list);
> > +
> > +	drm_gem_for_each_gpuva(va, obj) {
> > +		op = gpuva_op_alloc(mgr);
> > +		if (!op) {
> > +			ret = -ENOMEM;
> > +			goto err_free_ops;
> > +		}
> > +
> > +		op->op = DRM_GPUVA_OP_UNMAP;
> > +		op->unmap.va = va;
> > +		list_add_tail(&op->entry, &ops->list);
> > +	}
> > +
> > +	return ops;
> > +
> > +err_free_ops:
> > +	drm_gpuva_ops_free(mgr, ops);
> > +	return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_gem_unmap_ops_create);
> > +
> > +
> > +/**
> > + * drm_gpuva_ops_free - free the given &drm_gpuva_ops
> > + * @mgr: the &drm_gpuva_manager the ops were created for
> > + * @ops: the &drm_gpuva_ops to free
> > + *
> > + * Frees the given &drm_gpuva_ops structure including all the ops associated
> > + * with it.
> > + */
> > +void
> > +drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
> > +		   struct drm_gpuva_ops *ops)
> > +{
> > +	struct drm_gpuva_op *op, *next;
> > +
> > +	drm_gpuva_for_each_op_safe(op, next, ops) {
> > +		list_del(&op->entry);
> > +
> > +		if (op->op == DRM_GPUVA_OP_REMAP) {
> > +			kfree(op->remap.prev);
> > +			kfree(op->remap.next);
> > +			kfree(op->remap.unmap);
> > +		}
> > +
> > +		gpuva_op_free(mgr, op);
> > +	}
> > +
> > +	kfree(ops);
> > +}
> > +EXPORT_SYMBOL(drm_gpuva_ops_free);
> > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > index b419c59c4bef..b6e22f66c3fd 100644
> > --- a/include/drm/drm_drv.h
> > +++ b/include/drm/drm_drv.h
> > @@ -104,6 +104,12 @@ enum drm_driver_feature {
> >  	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
> >  	 */
> >  	DRIVER_COMPUTE_ACCEL            = BIT(7),
> > +	/**
> > +	 * @DRIVER_GEM_GPUVA:
> > +	 *
> > +	 * Driver supports user defined GPU VA bindings for GEM objects.
> > +	 */
> > +	DRIVER_GEM_GPUVA		= BIT(8),
> >  
> >  	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
> >  
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index b8efd836edef..f2782f55b7e7 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -36,6 +36,8 @@
> >  
> >  #include <linux/kref.h>
> >  #include <linux/dma-resv.h>
> > +#include <linux/list.h>
> > +#include <linux/mutex.h>
> >  
> >  #include <drm/drm_vma_manager.h>
> >  
> > @@ -347,6 +349,17 @@ struct drm_gem_object {
> >  	 */
> >  	struct dma_resv _resv;
> >  
> > +	/**
> > +	 * @gpuva:
> > +	 *
> > +	 * Provides the list and list mutex of GPU VAs attached to this
> > +	 * GEM object.
> > +	 */
> > +	struct {
> > +		struct list_head list;
> > +		struct mutex mutex;
> > +	} gpuva;
> > +
> >  	/**
> >  	 * @funcs:
> >  	 *
> > @@ -494,4 +507,66 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
> >  
> >  int drm_gem_evict(struct drm_gem_object *obj);
> >  
> > +/**
> > + * drm_gem_gpuva_init - initialize the gpuva list of a GEM object
> > + * @obj: the &drm_gem_object
> > + *
> > + * This initializes the &drm_gem_object's &drm_gpuva list and the mutex
> > + * protecting it.
> > + *
> > + * Calling this function is only necessary for drivers intending to support the
> > + * &drm_driver_feature DRIVER_GEM_GPUVA.
> > + */
> > +static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
> > +{
> > +	INIT_LIST_HEAD(&obj->gpuva.list);
> > +	mutex_init(&obj->gpuva.mutex);
> > +}
> > +
> > +/**
> > + * drm_gem_gpuva_lock - lock the GEM's gpuva list mutex
> > + * @obj: the &drm_gem_object
> > + *
> > + * This unlocks the mutex protecting the &drm_gem_object's &drm_gpuva list.
> > + */
> > +static inline void drm_gem_gpuva_lock(struct drm_gem_object *obj)
> > +{
> > +	mutex_lock(&obj->gpuva.mutex);
> > +}
> > +
> > +/**
> > + * drm_gem_gpuva_unlock - unlock the GEM's gpuva list mutex
> > + * @obj: the &drm_gem_object
> > + *
> > + * This unlocks the mutex protecting the &drm_gem_object's &drm_gpuva list.
> > + */
> > +static inline void drm_gem_gpuva_unlock(struct drm_gem_object *obj)
> > +{
> > +	mutex_unlock(&obj->gpuva.mutex);
> > +}
> > +
> > +/**
> > + * drm_gem_for_each_gpuva - iternator to walk over a list of gpuvas
> > + * @entry: &drm_gpuva structure to assign to in each iteration step
> > + * @obj: the &drm_gem_object the &drm_gpuvas to walk are associated with
> > + *
> > + * This iterator walks over all &drm_gpuva structures associated with the
> > + * &drm_gpuva_manager.
> > + */
> > +#define drm_gem_for_each_gpuva(entry__, obj__) \
> > +	list_for_each_entry(entry__, &(obj__)->gpuva.list, gem.entry)
> > +
> > +/**
> > + * drm_gem_for_each_gpuva_safe - iternator to safely walk over a list of gpuvas
> > + * @entry: &drm_gpuva structure to assign to in each iteration step
> > + * @next: &next &drm_gpuva to store the next step
> > + * @obj: the &drm_gem_object the &drm_gpuvas to walk are associated with
> > + *
> > + * This iterator walks over all &drm_gpuva structures associated with the
> > + * &drm_gem_object. It is implemented with list_for_each_entry_safe(), hence
> > + * it is save against removal of elements.
> > + */
> > +#define drm_gem_for_each_gpuva_safe(entry__, next__, obj__) \
> > +	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, gem.entry)
> > +
> >  #endif /* __DRM_GEM_H__ */
> > diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
> > new file mode 100644
> > index 000000000000..b52ac2d00d12
> > --- /dev/null
> > +++ b/include/drm/drm_gpuva_mgr.h
> > @@ -0,0 +1,681 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef __DRM_GPUVA_MGR_H__
> > +#define __DRM_GPUVA_MGR_H__
> > +
> > +/*
> > + * Copyright (c) 2022 Red Hat.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#include <linux/maple_tree.h>
> > +#include <linux/mm.h>
> > +#include <linux/rbtree.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/types.h>
> > +
> > +struct drm_gpuva_manager;
> > +struct drm_gpuva_fn_ops;
> > +struct drm_gpuva_prealloc;
> > +
> > +/**
> > + * enum drm_gpuva_flags - flags for struct drm_gpuva
> > + */
> > +enum drm_gpuva_flags {
> > +	/**
> > +	 * @DRM_GPUVA_EVICTED:
> > +	 *
> > +	 * Flag indicating that the &drm_gpuva's backing GEM is evicted.
> > +	 */
> > +	DRM_GPUVA_EVICTED = (1 << 0),
> > +
> > +	/**
> > +	 * @DRM_GPUVA_SPARSE:
> > +	 *
> > +	 * Flag indicating that the &drm_gpuva is a sparse mapping.
> > +	 */
> > +	DRM_GPUVA_SPARSE = (1 << 1),
> > +
> > +	/**
> > +	 * @DRM_GPUVA_USERBITS: user defined bits
> > +	 */
> > +	DRM_GPUVA_USERBITS = (1 << 2),
> > +};
> > +
> > +/**
> > + * struct drm_gpuva - structure to track a GPU VA mapping
> > + *
> > + * This structure represents a GPU VA mapping and is associated with a
> > + * &drm_gpuva_manager.
> > + *
> > + * Typically, this structure is embedded in bigger driver structures.
> > + */
> > +struct drm_gpuva {
> > +	/**
> > +	 * @mgr: the &drm_gpuva_manager this object is associated with
> > +	 */
> > +	struct drm_gpuva_manager *mgr;
> > +
> > +	/**
> > +	 * @flags: the &drm_gpuva_flags for this mapping
> > +	 */
> > +	enum drm_gpuva_flags flags;
> > +
> > +	/**
> > +	 * @va: structure containing the address and range of the &drm_gpuva
> > +	 */
> > +	struct {
> > +		/**
> > +		 * @addr: the start address
> > +		 */
> > +		u64 addr;
> > +
> > +		/*
> > +		 * @range: the range
> > +		 */
> > +		u64 range;
> > +	} va;
> > +
> > +	/**
> > +	 * @gem: structure containing the &drm_gem_object and it's offset
> > +	 */
> > +	struct {
> > +		/**
> > +		 * @offset: the offset within the &drm_gem_object
> > +		 */
> > +		u64 offset;
> > +
> > +		/**
> > +		 * @obj: the mapped &drm_gem_object
> > +		 */
> > +		struct drm_gem_object *obj;
> > +
> > +		/**
> > +		 * @entry: the &list_head to attach this object to a &drm_gem_object
> > +		 */
> > +		struct list_head entry;
> > +	} gem;
> > +};
> > +
> > +void drm_gpuva_link(struct drm_gpuva *va);
> > +void drm_gpuva_unlink(struct drm_gpuva *va);
> > +
> > +int drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> > +		     struct drm_gpuva *va);
> > +int drm_gpuva_insert_prealloc(struct drm_gpuva_manager *mgr,
> > +			      struct drm_gpuva_prealloc *pa,
> > +			      struct drm_gpuva *va);
> > +void drm_gpuva_remove(struct drm_gpuva *va);
> > +
> > +struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
> > +				 u64 addr, u64 range);
> > +struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
> > +				       u64 addr, u64 range);
> > +struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start);
> > +struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end);
> > +
> > +bool drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range);
> > +
> > +/**
> > + * drm_gpuva_evict - sets whether the backing GEM of this &drm_gpuva is evicted
> > + * @va: the &drm_gpuva to set the evict flag for
> > + * @evict: indicates whether the &drm_gpuva is evicted
> > + */
> > +static inline void drm_gpuva_evict(struct drm_gpuva *va, bool evict)
> > +{
> > +	if (evict)
> > +		va->flags |= DRM_GPUVA_EVICTED;
> > +	else
> > +		va->flags &= ~DRM_GPUVA_EVICTED;
> > +}
> > +
> > +/**
> > + * drm_gpuva_evicted - indicates whether the backing BO of this &drm_gpuva
> > + * is evicted
> > + * @va: the &drm_gpuva to check
> > + */
> > +static inline bool drm_gpuva_evicted(struct drm_gpuva *va)
> > +{
> > +	return va->flags & DRM_GPUVA_EVICTED;
> > +}
> > +
> > +/**
> > + * struct drm_gpuva_manager - DRM GPU VA Manager
> > + *
> > + * The DRM GPU VA Manager keeps track of a GPU's virtual address space by using
> > + * &maple_tree structures. Typically, this structure is embedded in bigger
> > + * driver structures.
> > + *
> > + * Drivers can pass addresses and ranges in an arbitrary unit, e.g. bytes or
> > + * pages.
> > + *
> > + * There should be one manager instance per GPU virtual address space.
> > + */
> > +struct drm_gpuva_manager {
> > +	/**
> > +	 * @name: the name of the DRM GPU VA space
> > +	 */
> > +	const char *name;
> > +
> > +	/**
> > +	 * @mm_start: start of the VA space
> > +	 */
> > +	u64 mm_start;
> > +
> > +	/**
> > +	 * @mm_range: length of the VA space
> > +	 */
> > +	u64 mm_range;
> > +
> > +	/**
> > +	 * @mtree: the &maple_tree to track GPU VA mappings
> > +	 */
> > +	struct maple_tree mtree;
> > +
> > +	/**
> > +	 * @kernel_alloc_node:
> > +	 *
> > +	 * &drm_gpuva representing the address space cutout reserved for
> > +	 * the kernel
> > +	 */
> > +	struct drm_gpuva kernel_alloc_node;
> > +
> > +	/**
> > +	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
> > +	 */
> > +	const struct drm_gpuva_fn_ops *ops;
> > +};
> > +
> > +void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
> > +			    const char *name,
> > +			    u64 start_offset, u64 range,
> > +			    u64 reserve_offset, u64 reserve_range,
> > +			    const struct drm_gpuva_fn_ops *ops);
> > +void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
> > +
> > +/**
> > + * struct drm_gpuva_prealloc - holds a preallocated node for the
> > + * &drm_gpuva_manager to insert a single new entry
> > + */
> > +struct drm_gpuva_prealloc {
> > +	/**
> > +	 * @mas: the maple tree advanced state
> > +	 */
> > +	struct ma_state mas;
> > +};
> > +
> > +struct drm_gpuva_prealloc * drm_gpuva_prealloc_create(struct drm_gpuva_manager *mgr);
> > +void drm_gpuva_prealloc_destroy(struct drm_gpuva_prealloc *pa);
> > +
> > +/**
> > + * struct drm_gpuva_iterator - iterator for walking the internal (maple) tree
> > + */
> > +struct drm_gpuva_iterator {
> > +	/**
> > +	 * @mas: the maple tree advanced state
> > +	 */
> > +	struct ma_state mas;
> > +
> > +	/**
> > +	 * @mgr: the &drm_gpuva_manager to iterate
> > +	 */
> > +	struct drm_gpuva_manager *mgr;
> > +};
> > +typedef struct drm_gpuva_iterator * drm_gpuva_state_t;
> > +
> > +void drm_gpuva_iter_remove(struct drm_gpuva_iterator *it);
> > +int drm_gpuva_iter_va_replace(struct drm_gpuva_iterator *it,
> > +			      struct drm_gpuva *va);
> > +
> > +static inline struct drm_gpuva *
> > +drm_gpuva_iter_find(struct drm_gpuva_iterator *it, unsigned long max)
> > +{
> > +	struct drm_gpuva *va;
> > +
> > +	mas_lock(&it->mas);
> 
> This is the write lock, if you can have more than one reader then use
> rcu_read_lock() and friends.  You can also probably use mt_find() to
> handle the locking here?
> 

Calls to this function should either be protected by an external lock or be
serialized anyway. I only got those locks here to make lockdep happly. Hence,
I think there should not be much of a difference. However, I will change read
only sections to use rcu_read_lock(), even if it's just to be a better example.
:-)

> > +	va = mas_find(&it->mas, max);
> > +	mas_unlock(&it->mas);
> > +
> > +	return va;
> > +}
> > +
> > +/**
> > + * DRM_GPUVA_ITER - create an iterator structure to iterate the &drm_gpuva tree
> > + * @name: the name of the &drm_gpuva_iterator to create
> > + * @mgr__: the &drm_gpuva_manager to iterate
> > + * @start: starting offset, the first entry will overlap this
> > + */
> > +#define DRM_GPUVA_ITER(name, mgr__, start)				\
> > +	struct drm_gpuva_iterator name = {				\
> > +		.mas = MA_STATE_INIT(&(mgr__)->mtree, start, 0),	\
> > +		.mgr = mgr__,						\
> > +	}
> > +
> > +/**
> > + * drm_gpuva_iter_for_each_range - iternator to walk over a range of entries
> > + * @va__: the &drm_gpuva found for the current iteration
> > + * @it__: &drm_gpuva_iterator structure to assign to in each iteration step
> > + * @end__: ending offset, the last entry will start before this (but may overlap)
> > + *
> > + * This function can be used to iterate &drm_gpuva objects.
> > + *
> > + * It is safe against the removal of elements using &drm_gpuva_iter_remove,
> > + * however it is not safe against the removal of elements using
> > + * &drm_gpuva_remove.
> > + */
> > +#define drm_gpuva_iter_for_each_range(va__, it__, end__) \
> > +	while (((va__) = drm_gpuva_iter_find(&(it__), (end__) - 1)))
> > +
> > +/**
> > + * drm_gpuva_iter_for_each - iternator to walk over all existing entries
> > + * @va__: the &drm_gpuva found for the current iteration
> > + * @it__: &drm_gpuva_iterator structure to assign to in each iteration step
> > + *
> > + * This function can be used to iterate &drm_gpuva objects.
> > + *
> > + * In order to walk over all potentially existing entries, the
> > + * &drm_gpuva_iterator must be initialized to start at
> > + * &drm_gpuva_manager->mm_start or simply 0.
> > + *
> > + * It is safe against the removal of elements using &drm_gpuva_iter_remove,
> > + * however it is not safe against the removal of elements using
> > + * &drm_gpuva_remove.
> > + */
> > +#define drm_gpuva_iter_for_each(va__, it__) \
> > +	drm_gpuva_iter_for_each_range(va__, it__, (it__).mgr->mm_start + (it__).mgr->mm_range)
> > +
> > +/**
> > + * enum drm_gpuva_op_type - GPU VA operation type
> > + *
> > + * Operations to alter the GPU VA mappings tracked by the &drm_gpuva_manager.
> > + */
> > +enum drm_gpuva_op_type {
> > +	/**
> > +	 * @DRM_GPUVA_OP_MAP: the map op type
> > +	 */
> > +	DRM_GPUVA_OP_MAP,
> > +
> > +	/**
> > +	 * @DRM_GPUVA_OP_REMAP: the remap op type
> > +	 */
> > +	DRM_GPUVA_OP_REMAP,
> > +
> > +	/**
> > +	 * @DRM_GPUVA_OP_UNMAP: the unmap op type
> > +	 */
> > +	DRM_GPUVA_OP_UNMAP,
> > +
> > +	/**
> > +	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
> > +	 */
> > +	DRM_GPUVA_OP_PREFETCH,
> > +};
> > +
> > +/**
> > + * struct drm_gpuva_op_map - GPU VA map operation
> > + *
> > + * This structure represents a single map operation generated by the
> > + * DRM GPU VA manager.
> > + */
> > +struct drm_gpuva_op_map {
> > +	/**
> > +	 * @va: structure containing address and range of a map
> > +	 * operation
> > +	 */
> > +	struct {
> > +		/**
> > +		 * @addr: the base address of the new mapping
> > +		 */
> > +		u64 addr;
> > +
> > +		/**
> > +		 * @range: the range of the new mapping
> > +		 */
> > +		u64 range;
> > +	} va;
> > +
> > +	/**
> > +	 * @gem: structure containing the &drm_gem_object and it's offset
> > +	 */
> > +	struct {
> > +		/**
> > +		 * @offset: the offset within the &drm_gem_object
> > +		 */
> > +		u64 offset;
> > +
> > +		/**
> > +		 * @obj: the &drm_gem_object to map
> > +		 */
> > +		struct drm_gem_object *obj;
> > +	} gem;
> > +};
> > +
> > +/**
> > + * struct drm_gpuva_op_unmap - GPU VA unmap operation
> > + *
> > + * This structure represents a single unmap operation generated by the
> > + * DRM GPU VA manager.
> > + */
> > +struct drm_gpuva_op_unmap {
> > +	/**
> > +	 * @va: the &drm_gpuva to unmap
> > +	 */
> > +	struct drm_gpuva *va;
> > +
> > +	/**
> > +	 * @keep:
> > +	 *
> > +	 * Indicates whether this &drm_gpuva is physically contiguous with the
> > +	 * original mapping request.
> > +	 *
> > +	 * Optionally, if &keep is set, drivers may keep the actual page table
> > +	 * mappings for this &drm_gpuva, adding the missing page table entries
> > +	 * only and update the &drm_gpuva_manager accordingly.
> > +	 */
> > +	bool keep;
> > +};
> > +
> > +/**
> > + * struct drm_gpuva_op_remap - GPU VA remap operation
> > + *
> > + * This represents a single remap operation generated by the DRM GPU VA manager.
> > + *
> > + * A remap operation is generated when an existing GPU VA mmapping is split up
> > + * by inserting a new GPU VA mapping or by partially unmapping existent
> > + * mapping(s), hence it consists of a maximum of two map and one unmap
> > + * operation.
> > + *
> > + * The @unmap operation takes care of removing the original existing mapping.
> > + * @prev is used to remap the preceding part, @next the subsequent part.
> > + *
> > + * If either a new mapping's start address is aligned with the start address
> > + * of the old mapping or the new mapping's end address is aligned with the
> > + * end address of the old mapping, either @prev or @next is NULL.
> > + *
> > + * Note, the reason for a dedicated remap operation, rather than arbitrary
> > + * unmap and map operations, is to give drivers the chance of extracting driver
> > + * specific data for creating the new mappings from the unmap operations's
> > + * &drm_gpuva structure which typically is embedded in larger driver specific
> > + * structures.
> > + */
> > +struct drm_gpuva_op_remap {
> > +	/**
> > +	 * @prev: the preceding part of a split mapping
> > +	 */
> > +	struct drm_gpuva_op_map *prev;
> > +
> > +	/**
> > +	 * @next: the subsequent part of a split mapping
> > +	 */
> > +	struct drm_gpuva_op_map *next;
> > +
> > +	/**
> > +	 * @unmap: the unmap operation for the original existing mapping
> > +	 */
> > +	struct drm_gpuva_op_unmap *unmap;
> > +};
> > +
> > +/**
> > + * struct drm_gpuva_op_prefetch - GPU VA prefetch operation
> > + *
> > + * This structure represents a single prefetch operation generated by the
> > + * DRM GPU VA manager.
> > + */
> > +struct drm_gpuva_op_prefetch {
> > +	/**
> > +	 * @va: the &drm_gpuva to prefetch
> > +	 */
> > +	struct drm_gpuva *va;
> > +};
> > +
> > +/**
> > + * struct drm_gpuva_op - GPU VA operation
> > + *
> > + * This structure represents a single generic operation.
> > + *
> > + * The particular type of the operation is defined by @op.
> > + */
> > +struct drm_gpuva_op {
> > +	/**
> > +	 * @entry:
> > +	 *
> > +	 * The &list_head used to distribute instances of this struct within
> > +	 * &drm_gpuva_ops.
> > +	 */
> > +	struct list_head entry;
> > +
> > +	/**
> > +	 * @op: the type of the operation
> > +	 */
> > +	enum drm_gpuva_op_type op;
> > +
> > +	union {
> > +		/**
> > +		 * @map: the map operation
> > +		 */
> > +		struct drm_gpuva_op_map map;
> > +
> > +		/**
> > +		 * @remap: the remap operation
> > +		 */
> > +		struct drm_gpuva_op_remap remap;
> > +
> > +		/**
> > +		 * @unmap: the unmap operation
> > +		 */
> > +		struct drm_gpuva_op_unmap unmap;
> > +
> > +		/**
> > +		 * @prefetch: the prefetch operation
> > +		 */
> > +		struct drm_gpuva_op_prefetch prefetch;
> > +	};
> > +};
> > +
> > +/**
> > + * struct drm_gpuva_ops - wraps a list of &drm_gpuva_op
> > + */
> > +struct drm_gpuva_ops {
> > +	/**
> > +	 * @list: the &list_head
> > +	 */
> > +	struct list_head list;
> > +};
> > +
> > +/**
> > + * drm_gpuva_for_each_op - iterator to walk over &drm_gpuva_ops
> > + * @op: &drm_gpuva_op to assign in each iteration step
> > + * @ops: &drm_gpuva_ops to walk
> > + *
> > + * This iterator walks over all ops within a given list of operations.
> > + */
> > +#define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
> > +
> > +/**
> > + * drm_gpuva_for_each_op_safe - iterator to safely walk over &drm_gpuva_ops
> > + * @op: &drm_gpuva_op to assign in each iteration step
> > + * @next: &next &drm_gpuva_op to store the next step
> > + * @ops: &drm_gpuva_ops to walk
> > + *
> > + * This iterator walks over all ops within a given list of operations. It is
> > + * implemented with list_for_each_safe(), so save against removal of elements.
> > + */
> > +#define drm_gpuva_for_each_op_safe(op, next, ops) \
> > +	list_for_each_entry_safe(op, next, &(ops)->list, entry)
> > +
> > +/**
> > + * drm_gpuva_for_each_op_from_reverse - iterate backwards from the given point
> > + * @op: &drm_gpuva_op to assign in each iteration step
> > + * @ops: &drm_gpuva_ops to walk
> > + *
> > + * This iterator walks over all ops within a given list of operations beginning
> > + * from the given operation in reverse order.
> > + */
> > +#define drm_gpuva_for_each_op_from_reverse(op, ops) \
> > +	list_for_each_entry_from_reverse(op, &(ops)->list, entry)
> > +
> > +/**
> > + * drm_gpuva_first_op - returns the first &drm_gpuva_op from &drm_gpuva_ops
> > + * @ops: the &drm_gpuva_ops to get the fist &drm_gpuva_op from
> > + */
> > +#define drm_gpuva_first_op(ops) \
> > +	list_first_entry(&(ops)->list, struct drm_gpuva_op, entry)
> > +
> > +/**
> > + * drm_gpuva_last_op - returns the last &drm_gpuva_op from &drm_gpuva_ops
> > + * @ops: the &drm_gpuva_ops to get the last &drm_gpuva_op from
> > + */
> > +#define drm_gpuva_last_op(ops) \
> > +	list_last_entry(&(ops)->list, struct drm_gpuva_op, entry)
> > +
> > +/**
> > + * drm_gpuva_prev_op - previous &drm_gpuva_op in the list
> > + * @op: the current &drm_gpuva_op
> > + */
> > +#define drm_gpuva_prev_op(op) list_prev_entry(op, entry)
> > +
> > +/**
> > + * drm_gpuva_next_op - next &drm_gpuva_op in the list
> > + * @op: the current &drm_gpuva_op
> > + */
> > +#define drm_gpuva_next_op(op) list_next_entry(op, entry)
> > +
> > +struct drm_gpuva_ops *
> > +drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
> > +			    u64 addr, u64 range,
> > +			    struct drm_gem_object *obj, u64 offset);
> > +struct drm_gpuva_ops *
> > +drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
> > +			      u64 addr, u64 range);
> > +
> > +struct drm_gpuva_ops *
> > +drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
> > +				 u64 addr, u64 range);
> > +
> > +struct drm_gpuva_ops *
> > +drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
> > +			       struct drm_gem_object *obj);
> > +
> > +void drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
> > +			struct drm_gpuva_ops *ops);
> > +
> > +/**
> > + * struct drm_gpuva_fn_ops - callbacks for split/merge steps
> > + *
> > + * This structure defines the callbacks used by &drm_gpuva_sm_map and
> > + * &drm_gpuva_sm_unmap to provide the split/merge steps for map and unmap
> > + * operations to drivers.
> > + */
> > +struct drm_gpuva_fn_ops {
> > +	/**
> > +	 * @op_alloc: called when the &drm_gpuva_manager allocates
> > +	 * a struct drm_gpuva_op
> > +	 *
> > +	 * Some drivers may want to embed struct drm_gpuva_op into driver
> > +	 * specific structures. By implementing this callback drivers can
> > +	 * allocate memory accordingly.
> > +	 *
> > +	 * This callback is optional.
> > +	 */
> > +	struct drm_gpuva_op *(*op_alloc)(void);
> > +
> > +	/**
> > +	 * @op_free: called when the &drm_gpuva_manager frees a
> > +	 * struct drm_gpuva_op
> > +	 *
> > +	 * Some drivers may want to embed struct drm_gpuva_op into driver
> > +	 * specific structures. By implementing this callback drivers can
> > +	 * free the previously allocated memory accordingly.
> > +	 *
> > +	 * This callback is optional.
> > +	 */
> > +	void (*op_free)(struct drm_gpuva_op *op);
> > +
> > +	/**
> > +	 * @sm_step_map: called from &drm_gpuva_sm_map to finally insert the
> > +	 * mapping once all previous steps were completed
> > +	 *
> > +	 * The &priv pointer matches the one the driver passed to
> > +	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
> > +	 *
> > +	 * Can be NULL if &drm_gpuva_sm_map is used.
> > +	 */
> > +	int (*sm_step_map)(struct drm_gpuva_op *op, void *priv);
> > +
> > +	/**
> > +	 * @sm_step_remap: called from &drm_gpuva_sm_map and
> > +	 * &drm_gpuva_sm_unmap to split up an existent mapping
> > +	 *
> > +	 * This callback is called when existent mapping needs to be split up.
> > +	 * This is the case when either a newly requested mapping overlaps or
> > +	 * is enclosed by an existent mapping or a partial unmap of an existent
> > +	 * mapping is requested.
> > +	 *
> > +	 * Drivers must not modify the GPUVA space with accessors that do not
> > +	 * take a &drm_gpuva_state as argument from this callback.
> > +	 *
> > +	 * The &priv pointer matches the one the driver passed to
> > +	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
> > +	 *
> > +	 * Can be NULL if neither &drm_gpuva_sm_map nor &drm_gpuva_sm_unmap is
> > +	 * used.
> > +	 */
> > +	int (*sm_step_remap)(struct drm_gpuva_op *op,
> > +			     drm_gpuva_state_t state,
> > +			     void *priv);
> > +
> > +	/**
> > +	 * @sm_step_unmap: called from &drm_gpuva_sm_map and
> > +	 * &drm_gpuva_sm_unmap to unmap an existent mapping
> > +	 *
> > +	 * This callback is called when existent mapping needs to be unmapped.
> > +	 * This is the case when either a newly requested mapping encloses an
> > +	 * existent mapping or an unmap of an existent mapping is requested.
> > +	 *
> > +	 * Drivers must not modify the GPUVA space with accessors that do not
> > +	 * take a &drm_gpuva_state as argument from this callback.
> > +	 *
> > +	 * The &priv pointer matches the one the driver passed to
> > +	 * &drm_gpuva_sm_map or &drm_gpuva_sm_unmap, respectively.
> > +	 *
> > +	 * Can be NULL if neither &drm_gpuva_sm_map nor &drm_gpuva_sm_unmap is
> > +	 * used.
> > +	 */
> > +	int (*sm_step_unmap)(struct drm_gpuva_op *op,
> > +			     drm_gpuva_state_t state,
> > +			     void *priv);
> > +};
> > +
> > +int drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
> > +		     u64 addr, u64 range,
> > +		     struct drm_gem_object *obj, u64 offset);
> > +
> > +int drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
> > +		       u64 addr, u64 range);
> > +
> > +int drm_gpuva_map(struct drm_gpuva_manager *mgr,
> > +		  struct drm_gpuva_prealloc *pa,
> > +		  struct drm_gpuva *va);
> > +int drm_gpuva_remap(drm_gpuva_state_t state,
> > +		    struct drm_gpuva *prev,
> > +		    struct drm_gpuva *next);
> > +void drm_gpuva_unmap(drm_gpuva_state_t state);
> > +
> > +#endif /* __DRM_GPUVA_MGR_H__ */
> > -- 
> > 2.40.1
> > 
> 

