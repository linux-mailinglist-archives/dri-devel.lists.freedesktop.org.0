Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFA169ACEC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B5D10EFD5;
	Fri, 17 Feb 2023 13:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2D610EFEC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dQGSqJNfvjw1TcjewHtrd025tzeuBg4RcAC7yA56II=;
 b=XSzQZtfGYjgh9Q8By9dQ0Yn2AYoxE04XB6l4iUET+uahJZ4IX0etUHJa6omCOeqIk8qitr
 YhjG9tAMPJlpdpJbQUt6yG15oexDTehljgOiuoxvjoV5k+elTIfmjPO3Y67574etYhjZvY
 fzQS6XIiIz+d0zpUIrZiFytY0D5k/kI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-0Hzp3MdwO-ie_NMTIVBM5g-1; Fri, 17 Feb 2023 08:44:52 -0500
X-MC-Unique: 0Hzp3MdwO-ie_NMTIVBM5g-1
Received: by mail-ed1-f71.google.com with SMTP id
 w11-20020a056402268b00b004accf30f6d3so1842226edd.14
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dQGSqJNfvjw1TcjewHtrd025tzeuBg4RcAC7yA56II=;
 b=FdbxN2qn3TXCJThZNE5sl7CbeVJ+2oi1g9IylGsC/O6WtseDU0TtkODht6bUZVPQl2
 CZB4b+W5VdznQWUfUodmjQ21tVHvqhXW7QREwffbXBBHRimMLfqJ0HW2akySOYyAT20g
 3YFO/Fsf1FiF8DwArrt27GMsorom9rjDx395KAw7EUBFsYVvjqag6YGOqlv+qeN5WGTA
 mx0FGkgVBpuS8ZpZWbBlpP9FZhjNMk5HYNVYnyiOP8CP3bK0pFMh3y/TQuqCQW9gwpKZ
 jiU+Lsvyh5e/jDEAg4mPMJkK4QAg16xQSLSsO2y61G2IA4dAdaAjPyMtoAwNBYGb18wO
 Kd6g==
X-Gm-Message-State: AO0yUKVY3X4jCSmo0RhM3IKGmytaid69bK2xFXRZFavzjQL0YM40YmwI
 C0YcfE7XDNneOjHDUeKTNFhe/4G1FbeLF/6FD9vkay2JFsniXkjeBScfAutRzfcP1vci/t///H1
 LcJCltDFCOXkpZgGqvAJzYJ2HXGqN
X-Received: by 2002:a17:906:7fc8:b0:88d:5043:2299 with SMTP id
 r8-20020a1709067fc800b0088d50432299mr1149593ejs.51.1676641490145; 
 Fri, 17 Feb 2023 05:44:50 -0800 (PST)
X-Google-Smtp-Source: AK7set++eVCkVSaBsVy3HluNIwtpO+iefhrnRic5Dxqpkeqd1LTe3YIcKh6NFSrT26vDj4/e0gZbFg==
X-Received: by 2002:a17:906:7fc8:b0:88d:5043:2299 with SMTP id
 r8-20020a1709067fc800b0088d50432299mr1149541ejs.51.1676641489204; 
 Fri, 17 Feb 2023 05:44:49 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a17090643d700b008838b040454sm2158069ejn.95.2023.02.17.05.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:44:48 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Date: Fri, 17 Feb 2023 14:44:11 +0100
Message-Id: <20230217134422.14116-6-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add infrastructure to keep track of GPU virtual address (VA) mappings
with a decicated VA space manager implementation.

New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
start implementing, allow userspace applications to request multiple and
arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
intended to serve the following purposes in this context.

1) Provide infrastructure to track GPU VA allocations and mappings,
   making use of the maple_tree.

2) Generically connect GPU VA mappings to their backing buffers, in
   particular DRM GEM objects.

3) Provide a common implementation to perform more complex mapping
   operations on the GPU VA space. In particular splitting and merging
   of GPU VA mappings, e.g. for intersecting mapping requests or partial
   unmap requests.

Suggested-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/drm-mm.rst    |   31 +
 drivers/gpu/drm/Makefile        |    1 +
 drivers/gpu/drm/drm_gem.c       |    3 +
 drivers/gpu/drm/drm_gpuva_mgr.c | 1704 +++++++++++++++++++++++++++++++
 include/drm/drm_drv.h           |    6 +
 include/drm/drm_gem.h           |   75 ++
 include/drm/drm_gpuva_mgr.h     |  714 +++++++++++++
 7 files changed, 2534 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 include/drm/drm_gpuva_mgr.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index a52e6f4117d6..c9f120cfe730 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
 .. kernel-doc:: drivers/gpu/drm/drm_mm.c
    :export:
 
+DRM GPU VA Manager
+==================
+
+Overview
+--------
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+   :doc: Overview
+
+Split and Merge
+---------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+   :doc: Split and Merge
+
+Locking
+-------
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+   :doc: Locking
+
+
+DRM GPU VA Manager Function References
+--------------------------------------
+
+.. kernel-doc:: include/drm/drm_gpuva_mgr.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+   :export:
+
 DRM Buddy Allocator
 ===================
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index d40defbb0347..4d098efffb98 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -45,6 +45,7 @@ drm-y := \
 	drm_vblank.o \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
+	drm_gpuva_mgr.o \
 	drm_writeback.o
 drm-$(CONFIG_DRM_LEGACY) += \
 	drm_agpsupport.o \
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 59a0bb5ebd85..65115fe88627 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -164,6 +164,9 @@ void drm_gem_private_object_init(struct drm_device *dev,
 	if (!obj->resv)
 		obj->resv = &obj->_resv;
 
+	if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
+		drm_gem_gpuva_init(obj);
+
 	drm_vma_node_reset(&obj->vma_node);
 	INIT_LIST_HEAD(&obj->lru_node);
 }
diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
new file mode 100644
index 000000000000..19f583704562
--- /dev/null
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -0,0 +1,1704 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Red Hat.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors:
+ *     Danilo Krummrich <dakr@redhat.com>
+ *
+ */
+
+#include <drm/drm_gem.h>
+#include <drm/drm_gpuva_mgr.h>
+
+/**
+ * DOC: Overview
+ *
+ * The DRM GPU VA Manager, represented by struct drm_gpuva_manager keeps track
+ * of a GPU's virtual address (VA) space and manages the corresponding virtual
+ * mappings represented by &drm_gpuva objects. It also keeps track of the
+ * mapping's backing &drm_gem_object buffers.
+ *
+ * &drm_gem_object buffers maintain a list (and a corresponding list lock) of
+ * &drm_gpuva objects representing all existent GPU VA mappings using this
+ * &drm_gem_object as backing buffer.
+ *
+ * If the &DRM_GPUVA_MANAGER_REGIONS feature is enabled, a GPU VA mapping can
+ * only be created within a previously allocated &drm_gpuva_region, which
+ * represents a reserved portion of the GPU VA space. GPU VA mappings are not
+ * allowed to span over a &drm_gpuva_region's boundary.
+ *
+ * GPU VA regions can also be flagged as sparse, which allows drivers to create
+ * sparse mappings for a whole GPU VA region in order to support Vulkan
+ * 'Sparse Resources'.
+ *
+ * The GPU VA manager internally uses &maple_tree structures to manage the
+ * &drm_gpuva mappings and the &drm_gpuva_regions within a GPU's virtual address
+ * space.
+ *
+ * Besides the GPU VA space regions (&drm_gpuva_region) allocated by a driver
+ * the &drm_gpuva_manager contains a special region representing the portion of
+ * VA space reserved by the kernel. This node is initialized together with the
+ * GPU VA manager instance and removed when the GPU VA manager is destroyed.
+ *
+ * In a typical application drivers would embed struct drm_gpuva_manager,
+ * struct drm_gpuva_region and struct drm_gpuva within their own driver
+ * specific structures, there won't be any memory allocations of it's own nor
+ * memory allocations of &drm_gpuva or &drm_gpuva_region entries.
+ */
+
+/**
+ * DOC: Split and Merge
+ *
+ * The DRM GPU VA manager also provides an algorithm implementing splitting and
+ * merging of existent GPU VA mappings with the ones that are requested to be
+ * mapped or unmapped. This feature is required by the Vulkan API to implement
+ * Vulkan 'Sparse Memory Bindings' - drivers UAPIs often refer to this as
+ * VM BIND.
+ *
+ * Drivers can call drm_gpuva_sm_map() to receive a sequence of callbacks
+ * containing map, unmap and remap operations for a given newly requested
+ * mapping. The sequence of callbacks represents the set of operations to
+ * execute in order to integrate the new mapping cleanly into the current state
+ * of the GPU VA space.
+ *
+ * Depending on how the new GPU VA mapping intersects with the existent mappings
+ * of the GPU VA space the &drm_gpuva_fn_ops callbacks contain an arbitrary
+ * amount of unmap operations, a maximum of two remap operations and a single
+ * map operation. The caller might receive no callback at all if no operation is
+ * required, e.g. if the requested mapping already exists in the exact same way.
+ *
+ * The single map operation, if existent, represents the original map operation
+ * requested by the caller. Please note that this operation might be altered
+ * comparing it with the original map operation, e.g. because it was merged with
+ * an already  existent mapping. Hence, drivers must execute this map operation
+ * instead of the original one passed to drm_gpuva_sm_map().
+ *
+ * &drm_gpuva_op_unmap contains a 'keep' field, which indicates whether the
+ * &drm_gpuva to unmap is physically contiguous with the original mapping
+ * request. Optionally, if 'keep' is set, drivers may keep the actual page table
+ * entries for this &drm_gpuva, adding the missing page table entries only and
+ * update the &drm_gpuva_manager's view of things accordingly.
+ *
+ * Drivers may do the same optimization, namely delta page table updates, also
+ * for remap operations. This is possible since &drm_gpuva_op_remap consists of
+ * one unmap operation and one or two map operations, such that drivers can
+ * derive the page table update delta accordingly.
+ *
+ * Note that there can't be more than two existent mappings to split up, one at
+ * the beginning and one at the end of the new mapping, hence there is a
+ * maximum of two remap operations.
+ *
+ * Generally, the DRM GPU VA manager never merges mappings across the
+ * boundaries of &drm_gpuva_regions. This is the case since merging between
+ * GPU VA regions would result into unmap and map operations to be issued for
+ * both regions involved although the original mapping request was referred to
+ * one specific GPU VA region only. Since the other GPU VA region, the one not
+ * explicitly requested to be altered, might be in use by the GPU, we are not
+ * allowed to issue any map/unmap operations for this region.
+ *
+ * To update the &drm_gpuva_manager's view of the GPU VA space
+ * drm_gpuva_insert() and drm_gpuva_remove() should be used.
+ *
+ * Analogous to drm_gpuva_sm_map() drm_gpuva_sm_unmap() uses &drm_gpuva_fn_ops
+ * to call back into the driver in order to unmap a range of GPU VA space. The
+ * logic behind this function is way simpler though: For all existent mappings
+ * enclosed by the given range unmap operations are created. For mappings which
+ * are only partically located within the given range, remap operations are
+ * created such that those mappings are split up and re-mapped partically.
+ *
+ * The following diagram depicts the basic relationships of existent GPU VA
+ * mappings, a newly requested mapping and the resulting mappings as implemented
+ * by drm_gpuva_sm_map() - it doesn't cover any arbitrary combinations of these.
+ *
+ * 1) Requested mapping is identical, hence noop.
+ *
+ *    ::
+ *
+ *	     0     a     1
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	     0     a     1
+ *	req: |-----------| (bo_offset=n)
+ *
+ *	     0     a     1
+ *	new: |-----------| (bo_offset=n)
+ *
+ *
+ * 2) Requested mapping is identical, except for the BO offset, hence replace
+ *    the mapping.
+ *
+ *    ::
+ *
+ *	     0     a     1
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	     0     a     1
+ *	req: |-----------| (bo_offset=m)
+ *
+ *	     0     a     1
+ *	new: |-----------| (bo_offset=m)
+ *
+ *
+ * 3) Requested mapping is identical, except for the backing BO, hence replace
+ *    the mapping.
+ *
+ *    ::
+ *
+ *	     0     a     1
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	     0     b     1
+ *	req: |-----------| (bo_offset=n)
+ *
+ *	     0     b     1
+ *	new: |-----------| (bo_offset=n)
+ *
+ *
+ * 4) Existent mapping is a left aligned subset of the requested one, hence
+ *    replace the existent one.
+ *
+ *    ::
+ *
+ *	     0  a  1
+ *	old: |-----|       (bo_offset=n)
+ *
+ *	     0     a     2
+ *	req: |-----------| (bo_offset=n)
+ *
+ *	     0     a     2
+ *	new: |-----------| (bo_offset=n)
+ *
+ *    .. note::
+ *       We expect to see the same result for a request with a different BO
+ *       and/or non-contiguous BO offset.
+ *
+ *
+ * 5) Requested mapping's range is a left aligned subset of the existent one,
+ *    but backed by a different BO. Hence, map the requested mapping and split
+ *    the existent one adjusting it's BO offset.
+ *
+ *    ::
+ *
+ *	     0     a     2
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	     0  b  1
+ *	req: |-----|       (bo_offset=n)
+ *
+ *	     0  b  1  a' 2
+ *	new: |-----|-----| (b.bo_offset=n, a.bo_offset=n+1)
+ *
+ *    .. note::
+ *       We expect to see the same result for a request with a different BO
+ *       and/or non-contiguous BO offset.
+ *
+ *
+ * 6) Existent mapping is a superset of the requested mapping, hence noop.
+ *
+ *    ::
+ *
+ *	     0     a     2
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	     0  a  1
+ *	req: |-----|       (bo_offset=n)
+ *
+ *	     0     a     2
+ *	new: |-----------| (bo_offset=n)
+ *
+ *
+ * 7) Requested mapping's range is a right aligned subset of the existent one,
+ *    but backed by a different BO. Hence, map the requested mapping and split
+ *    the existent one, without adjusting the BO offset.
+ *
+ *    ::
+ *
+ *	     0     a     2
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	           1  b  2
+ *	req:       |-----| (bo_offset=m)
+ *
+ *	     0  a  1  b  2
+ *	new: |-----|-----| (a.bo_offset=n,b.bo_offset=m)
+ *
+ *
+ * 8) Existent mapping is a superset of the requested mapping, hence noop.
+ *
+ *    ::
+ *
+ *	      0     a     2
+ *	old: |-----------| (bo_offset=n)
+ *
+ *	           1  a  2
+ *	req:       |-----| (bo_offset=n+1)
+ *
+ *	     0     a     2
+ *	new: |-----------| (bo_offset=n)
+ *
+ *
+ * 9) Existent mapping is overlapped at the end by the requested mapping backed
+ *    by a different BO. Hence, map the requested mapping and split up the
+ *    existent one, without adjusting the BO offset.
+ *
+ *    ::
+ *
+ *	     0     a     2
+ *	old: |-----------|       (bo_offset=n)
+ *
+ *	           1     b     3
+ *	req:       |-----------| (bo_offset=m)
+ *
+ *	     0  a  1     b     3
+ *	new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
+ *
+ *
+ * 10) Existent mapping is overlapped by the requested mapping, both having the
+ *     same backing BO with a contiguous offset. Hence, merge both mappings.
+ *
+ *     ::
+ *
+ *	      0     a     2
+ *	 old: |-----------|       (bo_offset=n)
+ *
+ *	            1     a     3
+ *	 req:       |-----------| (bo_offset=n+1)
+ *
+ *	      0        a        3
+ *	 new: |-----------------| (bo_offset=n)
+ *
+ *
+ * 11) Requested mapping's range is a centered subset of the existent one
+ *     having a different backing BO. Hence, map the requested mapping and split
+ *     up the existent one in two mappings, adjusting the BO offset of the right
+ *     one accordingly.
+ *
+ *     ::
+ *
+ *	      0        a        3
+ *	 old: |-----------------| (bo_offset=n)
+ *
+ *	            1  b  2
+ *	 req:       |-----|       (bo_offset=m)
+ *
+ *	      0  a  1  b  2  a' 3
+ *	 new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
+ *
+ *
+ * 12) Requested mapping is a contiguous subset of the existent one, hence noop.
+ *
+ *     ::
+ *
+ *	      0        a        3
+ *	 old: |-----------------| (bo_offset=n)
+ *
+ *	            1  a  2
+ *	 req:       |-----|       (bo_offset=n+1)
+ *
+ *	      0        a        3
+ *	 old: |-----------------| (bo_offset=n)
+ *
+ *
+ * 13) Existent mapping is a right aligned subset of the requested one, hence
+ *     replace the existent one.
+ *
+ *     ::
+ *
+ *	            1  a  2
+ *	 old:       |-----| (bo_offset=n+1)
+ *
+ *	      0     a     2
+ *	 req: |-----------| (bo_offset=n)
+ *
+ *	      0     a     2
+ *	 new: |-----------| (bo_offset=n)
+ *
+ *     .. note::
+ *        We expect to see the same result for a request with a different bo
+ *        and/or non-contiguous bo_offset.
+ *
+ *
+ * 14) Existent mapping is a centered subset of the requested one, hence
+ *     replace the existent one.
+ *
+ *     ::
+ *
+ *	            1  a  2
+ *	 old:       |-----| (bo_offset=n+1)
+ *
+ *	      0        a       3
+ *	 req: |----------------| (bo_offset=n)
+ *
+ *	      0        a       3
+ *	 new: |----------------| (bo_offset=n)
+ *
+ *     .. note::
+ *        We expect to see the same result for a request with a different bo
+ *        and/or non-contiguous bo_offset.
+ *
+ *
+ * 15) Existent mappings is overlapped at the beginning by the requested mapping
+ *     backed by a different BO. Hence, map the requested mapping and split up
+ *     the existent one, adjusting it's BO offset accordingly.
+ *
+ *     ::
+ *
+ *	            1     a     3
+ *	 old:       |-----------| (bo_offset=n)
+ *
+ *	      0     b     2
+ *	 req: |-----------|       (bo_offset=m)
+ *
+ *	      0     b     2  a' 3
+ *	 new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
+ *
+ *
+ * 16) Requested mapping fills the gap between two existent mappings all having
+ *     the same backing BO, such that all three have a contiguous BO offset.
+ *     Hence, merge all mappings.
+ *
+ *     ::
+ *
+ *	      0     a     1
+ *	 old: |-----------|                        (bo_offset=n)
+ *
+ *	                             2     a     3
+ *	 old':                       |-----------| (bo_offset=n+2)
+ *
+ *	                 1     a     2
+ *	 req:            |-----------|             (bo_offset=n+1)
+ *
+ *	                       a
+ *	 new: |----------------------------------| (bo_offset=n)
+ */
+
+/**
+ * DOC: Locking
+ *
+ * Generally, the GPU VA manager does not take care of locking itself, it is
+ * the drivers responsibility to take care about locking. Drivers might want to
+ * protect the following operations: inserting, removing and iterating
+ * &drm_gpuva and &drm_gpuva_region objects as well as generating all kinds of
+ * operations, such as split / merge or prefetch.
+ *
+ * The GPU VA manager also does not take care of the locking of the backing
+ * &drm_gem_object buffers GPU VA lists by itself; drivers are responsible to
+ * enforce mutual exclusion.
+ */
+
+
+static int __drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
+				     struct drm_gpuva_region *reg);
+static void __drm_gpuva_region_remove(struct drm_gpuva_region *reg);
+
+/**
+ * drm_gpuva_manager_init - initialize a &drm_gpuva_manager
+ * @mgr: pointer to the &drm_gpuva_manager to initialize
+ * @name: the name of the GPU VA space
+ * @start_offset: the start offset of the GPU VA space
+ * @range: the size of the GPU VA space
+ * @reserve_offset: the start of the kernel reserved GPU VA area
+ * @reserve_range: the size of the kernel reserved GPU VA area
+ * @ops: &drm_gpuva_fn_ops called on &drm_gpuva_sm_map / &drm_gpuva_sm_unmap
+ * @flags: the feature flags of the &drm_gpuva_manager
+ *
+ * The &drm_gpuva_manager must be initialized with this function before use.
+ *
+ * Note that @mgr must be cleared to 0 before calling this function. The given
+ * &name is expected to be managed by the surrounding driver structures.
+ */
+void
+drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
+		       const char *name,
+		       u64 start_offset, u64 range,
+		       u64 reserve_offset, u64 reserve_range,
+		       struct drm_gpuva_fn_ops *ops,
+		       enum drm_gpuva_mgr_flags flags)
+{
+	mt_init_flags(&mgr->region_mt, MT_FLAGS_LOCK_NONE);
+	mt_init_flags(&mgr->va_mt, MT_FLAGS_LOCK_NONE);
+
+	mgr->mm_start = start_offset;
+	mgr->mm_range = range;
+
+	mgr->name = name ? name : "unknown";
+	mgr->ops = ops;
+	mgr->flags = flags;
+
+	memset(&mgr->kernel_alloc_region, 0, sizeof(struct drm_gpuva_region));
+	mgr->kernel_alloc_region.va.addr = reserve_offset;
+	mgr->kernel_alloc_region.va.range = reserve_range;
+
+	__drm_gpuva_region_insert(mgr, &mgr->kernel_alloc_region);
+}
+EXPORT_SYMBOL(drm_gpuva_manager_init);
+
+/**
+ * drm_gpuva_manager_destroy - cleanup a &drm_gpuva_manager
+ * @mgr: pointer to the &drm_gpuva_manager to clean up
+ *
+ * Note that it is a bug to call this function on a manager that still
+ * holds GPU VA mappings.
+ */
+void
+drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr)
+{
+	mgr->name = NULL;
+	__drm_gpuva_region_remove(&mgr->kernel_alloc_region);
+
+	WARN(!mtree_empty(&mgr->va_mt),
+	     "GPUVA tree is not empty, potentially leaking memory.");
+	__mt_destroy(&mgr->va_mt);
+
+	WARN(!mtree_empty(&mgr->region_mt),
+	     "GPUVA region tree is not empty, potentially leaking memory.");
+	__mt_destroy(&mgr->region_mt);
+}
+EXPORT_SYMBOL(drm_gpuva_manager_destroy);
+
+static inline bool
+drm_gpuva_in_mm_range(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
+{
+	u64 end = addr + range;
+	u64 mm_start = mgr->mm_start;
+	u64 mm_end = mm_start + mgr->mm_range;
+
+	return addr < mm_end && mm_start < end;
+}
+
+static inline bool
+drm_gpuva_in_kernel_region(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
+{
+	u64 end = addr + range;
+	u64 kstart = mgr->kernel_alloc_region.va.addr;
+	u64 kend = kstart + mgr->kernel_alloc_region.va.range;
+
+	return addr < kend && kstart < end;
+}
+
+static struct drm_gpuva_region *
+drm_gpuva_in_region(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
+{
+	DRM_GPUVA_REGION_ITER(it, mgr);
+
+	/* Find the VA region the requested range is strictly enclosed by. */
+	drm_gpuva_iter_for_each_range(it, addr, addr + range) {
+		struct drm_gpuva_region *reg = it.reg;
+
+		if (reg->va.addr <= addr &&
+		    reg->va.addr + reg->va.range >= addr + range &&
+		    reg != &mgr->kernel_alloc_region)
+			return reg;
+	}
+
+	return NULL;
+}
+
+static bool
+drm_gpuva_in_any_region(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
+{
+	return !!drm_gpuva_in_region(mgr, addr, range);
+}
+
+/**
+ * drm_gpuva_remove_iter - removes the iterators current element
+ * @it: the &drm_gpuva_iterator
+ *
+ * This removes the element the iterator currently points to.
+ */
+void
+drm_gpuva_iter_remove(struct drm_gpuva_iterator *it)
+{
+	mas_erase(&it->mas);
+}
+EXPORT_SYMBOL(drm_gpuva_iter_remove);
+
+/**
+ * drm_gpuva_insert - insert a &drm_gpuva
+ * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
+ * @va: the &drm_gpuva to insert
+ * @addr: the start address of the GPU VA
+ * @range: the range of the GPU VA
+ *
+ * Insert a &drm_gpuva with a given address and range into a
+ * &drm_gpuva_manager.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuva_insert(struct drm_gpuva_manager *mgr,
+		 struct drm_gpuva *va)
+{
+	u64 addr = va->va.addr;
+	u64 range = va->va.range;
+	MA_STATE(mas, &mgr->va_mt, addr, addr + range - 1);
+	struct drm_gpuva_region *reg = NULL;
+	int ret;
+
+	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
+		return -EINVAL;
+
+	if (unlikely(drm_gpuva_in_kernel_region(mgr, addr, range)))
+		return -EINVAL;
+
+	if (mgr->flags & DRM_GPUVA_MANAGER_REGIONS) {
+		reg = drm_gpuva_in_region(mgr, addr, range);
+		if (unlikely(!reg))
+			return -EINVAL;
+	}
+
+	if (unlikely(drm_gpuva_find_first(mgr, addr, range)))
+		return -EEXIST;
+
+	ret = mas_store_gfp(&mas, va, GFP_KERNEL);
+	if (unlikely(ret))
+		return ret;
+
+	va->mgr = mgr;
+	va->region = reg;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_gpuva_insert);
+
+/**
+ * drm_gpuva_remove - remove a &drm_gpuva
+ * @va: the &drm_gpuva to remove
+ *
+ * This removes the given &va from the underlaying tree.
+ */
+void
+drm_gpuva_remove(struct drm_gpuva *va)
+{
+	MA_STATE(mas, &va->mgr->va_mt, va->va.addr, 0);
+
+	mas_erase(&mas);
+}
+EXPORT_SYMBOL(drm_gpuva_remove);
+
+/**
+ * drm_gpuva_link - link a &drm_gpuva
+ * @va: the &drm_gpuva to link
+ *
+ * This adds the given &va to the GPU VA list of the &drm_gem_object it is
+ * associated with.
+ *
+ * This function expects the caller to protect the GEM's GPUVA list against
+ * concurrent access.
+ */
+void
+drm_gpuva_link(struct drm_gpuva *va)
+{
+	if (likely(va->gem.obj))
+		list_add_tail(&va->head, &va->gem.obj->gpuva.list);
+}
+EXPORT_SYMBOL(drm_gpuva_link);
+
+/**
+ * drm_gpuva_unlink - unlink a &drm_gpuva
+ * @va: the &drm_gpuva to unlink
+ *
+ * This removes the given &va from the GPU VA list of the &drm_gem_object it is
+ * associated with.
+ *
+ * This function expects the caller to protect the GEM's GPUVA list against
+ * concurrent access.
+ */
+void
+drm_gpuva_unlink(struct drm_gpuva *va)
+{
+	if (likely(va->gem.obj))
+		list_del_init(&va->head);
+}
+EXPORT_SYMBOL(drm_gpuva_unlink);
+
+/**
+ * drm_gpuva_find_first - find the first &drm_gpuva in the given range
+ * @mgr: the &drm_gpuva_manager to search in
+ * @addr: the &drm_gpuvas address
+ * @range: the &drm_gpuvas range
+ *
+ * Returns: the first &drm_gpuva within the given range
+ */
+struct drm_gpuva *
+drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
+		     u64 addr, u64 range)
+{
+	MA_STATE(mas, &mgr->va_mt, addr, 0);
+
+	return mas_find(&mas, addr + range - 1);
+}
+EXPORT_SYMBOL(drm_gpuva_find_first);
+
+/**
+ * drm_gpuva_find - find a &drm_gpuva
+ * @mgr: the &drm_gpuva_manager to search in
+ * @addr: the &drm_gpuvas address
+ * @range: the &drm_gpuvas range
+ *
+ * Returns: the &drm_gpuva at a given &addr and with a given &range
+ */
+struct drm_gpuva *
+drm_gpuva_find(struct drm_gpuva_manager *mgr,
+	       u64 addr, u64 range)
+{
+	struct drm_gpuva *va;
+
+	va = drm_gpuva_find_first(mgr, addr, range);
+	if (!va)
+		goto out;
+
+	if (va->va.range != range)
+		goto out;
+
+	return va;
+
+out:
+	return NULL;
+}
+EXPORT_SYMBOL(drm_gpuva_find);
+
+/**
+ * drm_gpuva_find_prev - find the &drm_gpuva before the given address
+ * @mgr: the &drm_gpuva_manager to search in
+ * @start: the given GPU VA's start address
+ *
+ * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
+ *
+ * Note that if there is any free space between the GPU VA mappings no mapping
+ * is returned.
+ *
+ * Returns: a pointer to the found &drm_gpuva or NULL if none was found
+ */
+struct drm_gpuva *
+drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)
+{
+	MA_STATE(mas, &mgr->va_mt, start, 0);
+
+	if (start <= mgr->mm_start ||
+	    start > (mgr->mm_start + mgr->mm_range))
+		return NULL;
+
+	return mas_prev(&mas, start - 1);
+}
+EXPORT_SYMBOL(drm_gpuva_find_prev);
+
+/**
+ * drm_gpuva_find_next - find the &drm_gpuva after the given address
+ * @mgr: the &drm_gpuva_manager to search in
+ * @end: the given GPU VA's end address
+ *
+ * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
+ *
+ * Note that if there is any free space between the GPU VA mappings no mapping
+ * is returned.
+ *
+ * Returns: a pointer to the found &drm_gpuva or NULL if none was found
+ */
+struct drm_gpuva *
+drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)
+{
+	MA_STATE(mas, &mgr->va_mt, end - 1, 0);
+
+	if (end < mgr->mm_start ||
+	    end >= (mgr->mm_start + mgr->mm_range))
+		return NULL;
+
+	return mas_next(&mas, end);
+}
+EXPORT_SYMBOL(drm_gpuva_find_next);
+
+static int
+__drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
+			  struct drm_gpuva_region *reg)
+{
+	u64 addr = reg->va.addr;
+	u64 range = reg->va.range;
+	MA_STATE(mas, &mgr->region_mt, addr, addr + range - 1);
+	int ret;
+
+	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
+		return -EINVAL;
+
+	ret = mas_store_gfp(&mas, reg, GFP_KERNEL);
+	if (unlikely(ret))
+		return ret;
+
+	reg->mgr = mgr;
+
+	return 0;
+}
+
+/**
+ * drm_gpuva_region_insert - insert a &drm_gpuva_region
+ * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
+ * @reg: the &drm_gpuva_region to insert
+ * @addr: the start address of the GPU VA
+ * @range: the range of the GPU VA
+ *
+ * Insert a &drm_gpuva_region with a given address and range into a
+ * &drm_gpuva_manager.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int
+drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
+			struct drm_gpuva_region *reg)
+{
+	if (unlikely(!(mgr->flags & DRM_GPUVA_MANAGER_REGIONS)))
+		return -EINVAL;
+
+	return __drm_gpuva_region_insert(mgr, reg);
+}
+EXPORT_SYMBOL(drm_gpuva_region_insert);
+
+static void
+__drm_gpuva_region_remove(struct drm_gpuva_region *reg)
+{
+	struct drm_gpuva_manager *mgr = reg->mgr;
+	MA_STATE(mas, &mgr->region_mt, reg->va.addr, 0);
+
+	mas_erase(&mas);
+}
+
+/**
+ * drm_gpuva_region_remove - remove a &drm_gpuva_region
+ * @reg: the &drm_gpuva to remove
+ *
+ * This removes the given &reg from the underlaying tree.
+ */
+void
+drm_gpuva_region_remove(struct drm_gpuva_region *reg)
+{
+	struct drm_gpuva_manager *mgr = reg->mgr;
+
+	if (unlikely(!(mgr->flags & DRM_GPUVA_MANAGER_REGIONS)))
+		return;
+
+	if (unlikely(reg == &mgr->kernel_alloc_region)) {
+		WARN(1, "Can't destroy kernel reserved region.\n");
+		return;
+	}
+
+	if (unlikely(!drm_gpuva_region_empty(reg)))
+		WARN(1, "GPU VA region should be empty on destroy.\n");
+
+	__drm_gpuva_region_remove(reg);
+}
+EXPORT_SYMBOL(drm_gpuva_region_remove);
+
+/**
+ * drm_gpuva_region_empty - indicate whether a &drm_gpuva_region is empty
+ * @reg: the &drm_gpuva to destroy
+ *
+ * Returns: true if the &drm_gpuva_region is empty, false otherwise
+ */
+bool
+drm_gpuva_region_empty(struct drm_gpuva_region *reg)
+{
+	DRM_GPUVA_ITER(it, reg->mgr);
+
+	drm_gpuva_iter_for_each_range(it, reg->va.addr,
+				      reg->va.addr +
+				      reg->va.range)
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL(drm_gpuva_region_empty);
+
+/**
+ * drm_gpuva_region_find_first - find the first &drm_gpuva_region in the given
+ * range
+ * @mgr: the &drm_gpuva_manager to search in
+ * @addr: the &drm_gpuva_regions address
+ * @range: the &drm_gpuva_regions range
+ *
+ * Returns: the first &drm_gpuva_region within the given range
+ */
+struct drm_gpuva_region *
+drm_gpuva_region_find_first(struct drm_gpuva_manager *mgr,
+			    u64 addr, u64 range)
+{
+	MA_STATE(mas, &mgr->region_mt, addr, 0);
+
+	return mas_find(&mas, addr + range - 1);
+}
+EXPORT_SYMBOL(drm_gpuva_region_find_first);
+
+/**
+ * drm_gpuva_region_find - find a &drm_gpuva_region
+ * @mgr: the &drm_gpuva_manager to search in
+ * @addr: the &drm_gpuva_regions address
+ * @range: the &drm_gpuva_regions range
+ *
+ * Returns: the &drm_gpuva_region at a given &addr and with a given &range
+ */
+struct drm_gpuva_region *
+drm_gpuva_region_find(struct drm_gpuva_manager *mgr,
+		      u64 addr, u64 range)
+{
+	struct drm_gpuva_region *reg;
+
+	reg = drm_gpuva_region_find_first(mgr, addr, range);
+	if (!reg)
+		goto out;
+
+	if (reg->va.range != range)
+		goto out;
+
+	return reg;
+
+out:
+	return NULL;
+}
+EXPORT_SYMBOL(drm_gpuva_region_find);
+
+static int
+op_map_cb(int (*step)(struct drm_gpuva_op *, void *),
+	  void *priv,
+	  u64 addr, u64 range,
+	  struct drm_gem_object *obj, u64 offset)
+{
+	struct drm_gpuva_op op = {};
+
+	op.op = DRM_GPUVA_OP_MAP;
+	op.map.va.addr = addr;
+	op.map.va.range = range;
+	op.map.gem.obj = obj;
+	op.map.gem.offset = offset;
+
+	return step(&op, priv);
+}
+
+static int
+op_remap_cb(int (*step)(struct drm_gpuva_op *, void *),
+	    void *priv,
+	    struct drm_gpuva_op_map *prev,
+	    struct drm_gpuva_op_map *next,
+	    struct drm_gpuva_op_unmap *unmap)
+{
+	struct drm_gpuva_op op = {};
+	struct drm_gpuva_op_remap *r;
+
+	op.op = DRM_GPUVA_OP_REMAP;
+	r = &op.remap;
+	r->prev = prev;
+	r->next = next;
+	r->unmap = unmap;
+
+	return step(&op, priv);
+}
+
+static int
+op_unmap_cb(int (*step)(struct drm_gpuva_op *, void *),
+	    void *priv,
+	    struct drm_gpuva *va, bool merge)
+{
+	struct drm_gpuva_op op = {};
+
+	op.op = DRM_GPUVA_OP_UNMAP;
+	op.unmap.va = va;
+	op.unmap.keep = merge;
+
+	return step(&op, priv);
+}
+
+static inline bool
+gpuva_should_merge(struct drm_gpuva *va)
+{
+	/* Never merge mappings with NULL GEMs. */
+	return !!va->gem.obj;
+}
+
+static int
+__drm_gpuva_sm_map(struct drm_gpuva_manager *mgr,
+		   struct drm_gpuva_fn_ops *ops, void *priv,
+		   u64 req_addr, u64 req_range,
+		   struct drm_gem_object *req_obj, u64 req_offset)
+{
+	DRM_GPUVA_ITER(it, mgr);
+	int (*step)(struct drm_gpuva_op *, void *);
+	struct drm_gpuva *va, *prev = NULL;
+	u64 req_end = req_addr + req_range;
+	bool skip_pmerge = false, skip_nmerge = false;
+	int ret;
+
+	step = ops->sm_map_step;
+
+	if (unlikely(!drm_gpuva_in_mm_range(mgr, req_addr, req_range)))
+		return -EINVAL;
+
+	if (unlikely(drm_gpuva_in_kernel_region(mgr, req_addr, req_range)))
+		return -EINVAL;
+
+	if ((mgr->flags & DRM_GPUVA_MANAGER_REGIONS) &&
+	    !drm_gpuva_in_any_region(mgr, req_addr, req_range))
+		return -EINVAL;
+
+	drm_gpuva_iter_for_each_range(it, req_addr, req_end) {
+		struct drm_gpuva *va = it.va;
+		struct drm_gem_object *obj = va->gem.obj;
+		u64 offset = va->gem.offset;
+		u64 addr = va->va.addr;
+		u64 range = va->va.range;
+		u64 end = addr + range;
+		bool merge = gpuva_should_merge(va);
+
+		/* Generally, we want to skip merging with potential mappings
+		 * left and right of the requested one when we found a
+		 * collision, since merging happens in this loop already.
+		 *
+		 * However, there is one exception when the requested mapping
+		 * spans into a free VM area. If this is the case we might
+		 * still hit the boundary of another mapping before and/or
+		 * after the free VM area.
+		 */
+		skip_pmerge = true;
+		skip_nmerge = true;
+
+		if (addr == req_addr) {
+			merge &= obj == req_obj &&
+				 offset == req_offset;
+
+			if (end == req_end) {
+				if (merge)
+					goto done;
+
+				ret = op_unmap_cb(step, priv, va, false);
+				if (ret)
+					return ret;
+				break;
+			}
+
+			if (end < req_end) {
+				skip_nmerge = false;
+				ret = op_unmap_cb(step, priv, va, merge);
+				if (ret)
+					return ret;
+				goto next;
+			}
+
+			if (end > req_end) {
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = range - req_range,
+					.gem.obj = obj,
+					.gem.offset = offset + req_range,
+				};
+				struct drm_gpuva_op_unmap u = { .va = va };
+
+				if (merge)
+					goto done;
+
+				ret = op_remap_cb(step, priv, NULL, &n, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+		} else if (addr < req_addr) {
+			u64 ls_range = req_addr - addr;
+			struct drm_gpuva_op_map p = {
+				.va.addr = addr,
+				.va.range = ls_range,
+				.gem.obj = obj,
+				.gem.offset = offset,
+			};
+			struct drm_gpuva_op_unmap u = { .va = va };
+
+			merge &= obj == req_obj &&
+				 offset + ls_range == req_offset;
+
+			if (end == req_end) {
+				if (merge)
+					goto done;
+
+				ret = op_remap_cb(step, priv, &p, NULL, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+
+			if (end < req_end) {
+				u64 new_addr = addr;
+				u64 new_range = req_range + ls_range;
+				u64 new_offset = offset;
+
+				/* We validated that the requested mapping is
+				 * within a single VA region already.
+				 * Since it overlaps the current mapping (which
+				 * can't cross a VA region boundary) we can be
+				 * sure that we're still within the boundaries
+				 * of the same VA region after merging.
+				 */
+				if (merge) {
+					req_offset = new_offset;
+					req_addr = new_addr;
+					req_range = new_range;
+					ret = op_unmap_cb(step, priv, va, true);
+					if (ret)
+						return ret;
+					goto next;
+				}
+
+				ret = op_remap_cb(step, priv, &p, NULL, &u);
+				if (ret)
+					return ret;
+				goto next;
+			}
+
+			if (end > req_end) {
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = end - req_end,
+					.gem.obj = obj,
+					.gem.offset = offset + ls_range +
+						      req_range,
+				};
+
+				if (merge)
+					goto done;
+
+				ret = op_remap_cb(step, priv, &p, &n, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+		} else if (addr > req_addr) {
+			merge &= obj == req_obj &&
+				 offset == req_offset +
+					   (addr - req_addr);
+
+			if (!prev)
+				skip_pmerge = false;
+
+			if (end == req_end) {
+				ret = op_unmap_cb(step, priv, va, merge);
+				if (ret)
+					return ret;
+				break;
+			}
+
+			if (end < req_end) {
+				skip_nmerge = false;
+				ret = op_unmap_cb(step, priv, va, merge);
+				if (ret)
+					return ret;
+				goto next;
+			}
+
+			if (end > req_end) {
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = end - req_end,
+					.gem.obj = obj,
+					.gem.offset = offset + req_end - addr,
+				};
+				struct drm_gpuva_op_unmap u = { .va = va };
+				u64 new_end = end;
+				u64 new_range = new_end - req_addr;
+
+				/* We validated that the requested mapping is
+				 * within a single VA region already.
+				 * Since it overlaps the current mapping (which
+				 * can't cross a VA region boundary) we can be
+				 * sure that we're still within the boundaries
+				 * of the same VA region after merging.
+				 */
+				if (merge) {
+					req_end = new_end;
+					req_range = new_range;
+					ret = op_unmap_cb(step, priv, va, true);
+					if (ret)
+						return ret;
+					break;
+				}
+
+				ret = op_remap_cb(step, priv, NULL, &n, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+		}
+next:
+		prev = va;
+	}
+
+	va = skip_pmerge ? NULL : drm_gpuva_find_prev(mgr, req_addr);
+	if (va) {
+		struct drm_gem_object *obj = va->gem.obj;
+		u64 offset = va->gem.offset;
+		u64 addr = va->va.addr;
+		u64 range = va->va.range;
+		u64 new_offset = offset;
+		u64 new_addr = addr;
+		u64 new_range = req_range + range;
+		bool merge = gpuva_should_merge(va) &&
+			     obj == req_obj &&
+			     offset + range == req_offset;
+
+		if (mgr->flags & DRM_GPUVA_MANAGER_REGIONS)
+			merge &= drm_gpuva_in_any_region(mgr, new_addr,
+							 new_range);
+
+		if (merge) {
+			ret = op_unmap_cb(step, priv, va, true);
+			if (ret)
+				return ret;
+
+			req_offset = new_offset;
+			req_addr = new_addr;
+			req_range = new_range;
+		}
+	}
+
+	va = skip_nmerge ? NULL : drm_gpuva_find_next(mgr, req_end);
+	if (va) {
+		struct drm_gem_object *obj = va->gem.obj;
+		u64 offset = va->gem.offset;
+		u64 addr = va->va.addr;
+		u64 range = va->va.range;
+		u64 end = addr + range;
+		u64 new_range = req_range + range;
+		u64 new_end = end;
+		bool merge = gpuva_should_merge(va) &&
+			     obj == req_obj &&
+			     offset == req_offset + req_range;
+
+		if (mgr->flags & DRM_GPUVA_MANAGER_REGIONS)
+			merge &= drm_gpuva_in_any_region(mgr, req_addr,
+							 new_range);
+
+		if (merge) {
+			ret = op_unmap_cb(step, priv, va, true);
+			if (ret)
+				return ret;
+
+			req_range = new_range;
+			req_end = new_end;
+		}
+	}
+
+	ret = op_map_cb(step, priv,
+			req_addr, req_range,
+			req_obj, req_offset);
+	if (ret)
+		return ret;
+
+done:
+	return 0;
+}
+
+static int
+__drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr,
+		     struct drm_gpuva_fn_ops *ops, void *priv,
+		     u64 req_addr, u64 req_range)
+{
+	DRM_GPUVA_ITER(it, mgr);
+	int (*step)(struct drm_gpuva_op *, void *);
+	u64 req_end = req_addr + req_range;
+	int ret;
+
+	step = ops->sm_unmap_step;
+
+	drm_gpuva_iter_for_each_range(it, req_addr, req_end) {
+		struct drm_gpuva *va = it.va;
+		struct drm_gpuva_op_map prev = {}, next = {};
+		bool prev_split = false, next_split = false;
+		struct drm_gem_object *obj = va->gem.obj;
+		u64 offset = va->gem.offset;
+		u64 addr = va->va.addr;
+		u64 range = va->va.range;
+		u64 end = addr + range;
+
+		if (addr < req_addr) {
+			prev.va.addr = addr;
+			prev.va.range = req_addr - addr;
+			prev.gem.obj = obj;
+			prev.gem.offset = offset;
+
+			prev_split = true;
+		}
+
+		if (end > req_end) {
+			next.va.addr = req_end;
+			next.va.range = end - req_end;
+			next.gem.obj = obj;
+			next.gem.offset = offset + (req_end - addr);
+
+			next_split = true;
+		}
+
+		if (prev_split || next_split) {
+			struct drm_gpuva_op_unmap unmap = { .va = va };
+
+			ret = op_remap_cb(step, priv, &prev, &next, &unmap);
+			if (ret)
+				return ret;
+		} else {
+			ret = op_unmap_cb(step, priv, va, false);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * drm_gpuva_sm_map - creates the &drm_gpuva_op split/merge steps
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @req_addr: the start address of the new mapping
+ * @req_range: the range of the new mapping
+ * @req_obj: the &drm_gem_object to map
+ * @req_offset: the offset within the &drm_gem_object
+ * @priv: pointer to a driver private data structure
+ *
+ * This function iterates the given range of the GPU VA space. It utilizes the
+ * &drm_gpuva_fn_ops to call back into the driver providing the split and merge
+ * steps.
+ *
+ * Drivers may use these callbacks to update the GPU VA space right away within
+ * the callback. In case the driver decides to copy and store the operations for
+ * later processing neither this function nor &drm_gpuva_sm_unmap is allowed to
+ * be called before the &drm_gpuva_manager's view of the GPU VA space was
+ * updated with the previous set of operations. To update the
+ * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
+ * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
+ * used.
+ *
+ * A sequence of callbacks can contain map, unmap and remap operations, but
+ * the sequence of callbacks might also be empty if no operation is required,
+ * e.g. if the requested mapping already exists in the exact same way.
+ *
+ * There can be an arbitrary amount of unmap operations, a maximum of two remap
+ * operations and a single map operation. The latter one, if existent,
+ * represents the original map operation requested by the caller. Please note
+ * that the map operation might has been modified, e.g. if it was merged with
+ * an existent mapping.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
+		 u64 req_addr, u64 req_range,
+		 struct drm_gem_object *req_obj, u64 req_offset)
+{
+	if (!mgr->ops || !mgr->ops->sm_map_step)
+		return -EINVAL;
+
+	return __drm_gpuva_sm_map(mgr, mgr->ops, priv,
+				  req_addr, req_range,
+				  req_obj, req_offset);
+}
+EXPORT_SYMBOL(drm_gpuva_sm_map);
+
+/**
+ * drm_gpuva_sm_unmap - creates the &drm_gpuva_ops to split on unmap
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ * @ops: the &drm_gpuva_fn_ops callbacks to provide the split/merge steps
+ * @priv: pointer to a driver private data structure
+ *
+ * This function iterates the given range of the GPU VA space. It utilizes the
+ * &drm_gpuva_fn_ops to call back into the driver providing the operations to
+ * unmap and, if required, split existent mappings.
+ *
+ * Drivers may use these callbacks to update the GPU VA space right away within
+ * the callback. In case the driver decides to copy and store the operations for
+ * later processing neither this function nor &drm_gpuva_sm_map is allowed to be
+ * called before the &drm_gpuva_manager's view of the GPU VA space was updated
+ * with the previous set of operations. To update the &drm_gpuva_manager's view
+ * of the GPU VA space drm_gpuva_insert(), drm_gpuva_destroy_locked() and/or
+ * drm_gpuva_destroy_unlocked() should be used.
+ *
+ * A sequence of callbacks can contain unmap and remap operations, depending on
+ * whether there are actual overlapping mappings to split.
+ *
+ * There can be an arbitrary amount of unmap operations and a maximum of two
+ * remap operations.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
+		   u64 req_addr, u64 req_range)
+{
+	if (!mgr->ops || !mgr->ops->sm_unmap_step)
+		return -EINVAL;
+
+	return __drm_gpuva_sm_unmap(mgr, mgr->ops, priv,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL(drm_gpuva_sm_unmap);
+
+static struct drm_gpuva_op *
+gpuva_op_alloc(struct drm_gpuva_manager *mgr)
+{
+	struct drm_gpuva_fn_ops *fn = mgr->ops;
+	struct drm_gpuva_op *op;
+
+	if (fn && fn->op_alloc)
+		op = fn->op_alloc();
+	else
+		op = kzalloc(sizeof(*op), GFP_KERNEL);
+
+	if (unlikely(!op))
+		return NULL;
+
+	return op;
+}
+
+static void
+gpuva_op_free(struct drm_gpuva_manager *mgr,
+	      struct drm_gpuva_op *op)
+{
+	struct drm_gpuva_fn_ops *fn = mgr->ops;
+
+	if (fn && fn->op_free)
+		fn->op_free(op);
+	else
+		kfree(op);
+}
+
+int drm_gpuva_sm_step(struct drm_gpuva_op *__op, void *priv)
+{
+	struct {
+		struct drm_gpuva_manager *mgr;
+		struct drm_gpuva_ops *ops;
+	} *args = priv;
+	struct drm_gpuva_manager *mgr = args->mgr;
+	struct drm_gpuva_ops *ops = args->ops;
+	struct drm_gpuva_op *op;
+
+	op = gpuva_op_alloc(mgr);
+	if (unlikely(!op))
+		goto err;
+
+	memcpy(op, __op, sizeof(*op));
+
+	if (op->op == DRM_GPUVA_OP_REMAP) {
+		struct drm_gpuva_op_remap *__r = &__op->remap;
+		struct drm_gpuva_op_remap *r = &op->remap;
+
+		r->unmap = kmemdup(__r->unmap, sizeof(*r->unmap),
+				   GFP_KERNEL);
+		if (unlikely(!r->unmap))
+			goto err_free_op;
+
+		if (__r->prev) {
+			r->prev = kmemdup(__r->prev, sizeof(*r->prev),
+					  GFP_KERNEL);
+			if (unlikely(!r->prev))
+				goto err_free_unmap;
+		}
+
+		if (__r->next) {
+			r->next = kmemdup(__r->next, sizeof(*r->next),
+					  GFP_KERNEL);
+			if (unlikely(!r->next))
+				goto err_free_prev;
+		}
+	}
+
+	list_add_tail(&op->entry, &ops->list);
+
+	return 0;
+
+err_free_unmap:
+	kfree(op->remap.unmap);
+err_free_prev:
+	kfree(op->remap.prev);
+err_free_op:
+	gpuva_op_free(mgr, op);
+err:
+	return -ENOMEM;
+}
+
+static struct drm_gpuva_fn_ops gpuva_list_ops = {
+	.sm_map_step = drm_gpuva_sm_step,
+	.sm_unmap_step = drm_gpuva_sm_step,
+};
+
+/**
+ * drm_gpuva_sm_map_ops_create - creates the &drm_gpuva_ops to split and merge
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @req_addr: the start address of the new mapping
+ * @req_range: the range of the new mapping
+ * @req_obj: the &drm_gem_object to map
+ * @req_offset: the offset within the &drm_gem_object
+ *
+ * This function creates a list of operations to perform splitting and merging
+ * of existent mapping(s) with the newly requested one.
+ *
+ * The list can be iterated with &drm_gpuva_for_each_op and must be processed
+ * in the given order. It can contain map, unmap and remap operations, but it
+ * also can be empty if no operation is required, e.g. if the requested mapping
+ * already exists is the exact same way.
+ *
+ * There can be an arbitrary amount of unmap operations, a maximum of two remap
+ * operations and a single map operation. The latter one, if existent,
+ * represents the original map operation requested by the caller. Please note
+ * that the map operation might has been modified, e.g. if it was merged with an
+ * existent mapping.
+ *
+ * Note that before calling this function again with another mapping request it
+ * is necessary to update the &drm_gpuva_manager's view of the GPU VA space. The
+ * previously obtained operations must be either processed or abandoned. To
+ * update the &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
+ * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
+ * used.
+ *
+ * After the caller finished processing the returned &drm_gpuva_ops, they must
+ * be freed with &drm_gpuva_ops_free.
+ *
+ * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
+ */
+struct drm_gpuva_ops *
+drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
+			    u64 req_addr, u64 req_range,
+			    struct drm_gem_object *req_obj, u64 req_offset)
+{
+	struct drm_gpuva_ops *ops;
+	struct {
+		struct drm_gpuva_manager *mgr;
+		struct drm_gpuva_ops *ops;
+	} args;
+	int ret;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (unlikely(!ops))
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	args.mgr = mgr;
+	args.ops = ops;
+
+	ret = __drm_gpuva_sm_map(mgr, &gpuva_list_ops, &args,
+				 req_addr, req_range,
+				 req_obj, req_offset);
+	if (ret) {
+		kfree(ops);
+		return ERR_PTR(ret);
+	}
+
+	return ops;
+}
+EXPORT_SYMBOL(drm_gpuva_sm_map_ops_create);
+
+/**
+ * drm_gpuva_sm_unmap_ops_create - creates the &drm_gpuva_ops to split on unmap
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function creates a list of operations to perform unmapping and, if
+ * required, splitting of the mappings overlapping the unmap range.
+ *
+ * The list can be iterated with &drm_gpuva_for_each_op and must be processed
+ * in the given order. It can contain unmap and remap operations, depending on
+ * whether there are actual overlapping mappings to split.
+ *
+ * There can be an arbitrary amount of unmap operations and a maximum of two
+ * remap operations.
+ *
+ * Note that before calling this function again with another range to unmap it
+ * is necessary to update the &drm_gpuva_manager's view of the GPU VA space. The
+ * previously obtained operations must be processed or abandoned. To update the
+ * &drm_gpuva_manager's view of the GPU VA space drm_gpuva_insert(),
+ * drm_gpuva_destroy_locked() and/or drm_gpuva_destroy_unlocked() should be
+ * used.
+ *
+ * After the caller finished processing the returned &drm_gpuva_ops, they must
+ * be freed with &drm_gpuva_ops_free.
+ *
+ * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
+ */
+struct drm_gpuva_ops *
+drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
+			      u64 req_addr, u64 req_range)
+{
+	struct drm_gpuva_ops *ops;
+	struct {
+		struct drm_gpuva_manager *mgr;
+		struct drm_gpuva_ops *ops;
+	} args;
+	int ret;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (unlikely(!ops))
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	args.mgr = mgr;
+	args.ops = ops;
+
+	ret = __drm_gpuva_sm_unmap(mgr, &gpuva_list_ops, &args,
+				   req_addr, req_range);
+	if (ret) {
+		kfree(ops);
+		return ERR_PTR(ret);
+	}
+
+	return ops;
+}
+EXPORT_SYMBOL(drm_gpuva_sm_unmap_ops_create);
+
+/**
+ * drm_gpuva_prefetch_ops_create - creates the &drm_gpuva_ops to prefetch
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @req_addr: the start address of the range to prefetch
+ * @req_range: the range of the mappings to prefetch
+ *
+ * This function creates a list of operations to perform prefetching.
+ *
+ * The list can be iterated with &drm_gpuva_for_each_op and must be processed
+ * in the given order. It can contain prefetch operations.
+ *
+ * There can be an arbitrary amount of prefetch operations.
+ *
+ * After the caller finished processing the returned &drm_gpuva_ops, they must
+ * be freed with &drm_gpuva_ops_free.
+ *
+ * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
+ */
+struct drm_gpuva_ops *
+drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
+			      u64 addr, u64 range)
+{
+	DRM_GPUVA_ITER(it, mgr);
+	struct drm_gpuva_ops *ops;
+	struct drm_gpuva_op *op;
+	int ret;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (!ops)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	drm_gpuva_iter_for_each_range(it, addr, addr + range) {
+		op = gpuva_op_alloc(mgr);
+		if (!op) {
+			ret = -ENOMEM;
+			goto err_free_ops;
+		}
+
+		op->op = DRM_GPUVA_OP_PREFETCH;
+		op->prefetch.va = it.va;
+		list_add_tail(&op->entry, &ops->list);
+	}
+
+	return ops;
+
+err_free_ops:
+	drm_gpuva_ops_free(mgr, ops);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(drm_gpuva_prefetch_ops_create);
+
+/**
+ * drm_gpuva_gem_unmap_ops_create - creates the &drm_gpuva_ops to unmap a GEM
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ * @obj: the &drm_gem_object to unmap
+ *
+ * This function creates a list of operations to perform unmapping for every
+ * GPUVA attached to a GEM.
+ *
+ * The list can be iterated with &drm_gpuva_for_each_op and consists out of an
+ * arbitrary amount of unmap operations.
+ *
+ * After the caller finished processing the returned &drm_gpuva_ops, they must
+ * be freed with &drm_gpuva_ops_free.
+ *
+ * It is the callers responsibility to protect the GEMs GPUVA list against
+ * concurrent access.
+ *
+ * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
+ */
+struct drm_gpuva_ops *
+drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
+			       struct drm_gem_object *obj)
+{
+	struct drm_gpuva_ops *ops;
+	struct drm_gpuva_op *op;
+	struct drm_gpuva *va;
+	int ret;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (!ops)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	drm_gem_for_each_gpuva(va, obj) {
+		op = gpuva_op_alloc(mgr);
+		if (!op) {
+			ret = -ENOMEM;
+			goto err_free_ops;
+		}
+
+		op->op = DRM_GPUVA_OP_UNMAP;
+		op->unmap.va = va;
+		list_add_tail(&op->entry, &ops->list);
+	}
+
+	return ops;
+
+err_free_ops:
+	drm_gpuva_ops_free(mgr, ops);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(drm_gpuva_gem_unmap_ops_create);
+
+
+/**
+ * drm_gpuva_ops_free - free the given &drm_gpuva_ops
+ * @mgr: the &drm_gpuva_manager the ops were created for
+ * @ops: the &drm_gpuva_ops to free
+ *
+ * Frees the given &drm_gpuva_ops structure including all the ops associated
+ * with it.
+ */
+void
+drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
+		   struct drm_gpuva_ops *ops)
+{
+	struct drm_gpuva_op *op, *next;
+
+	drm_gpuva_for_each_op_safe(op, next, ops) {
+		list_del(&op->entry);
+
+		if (op->op == DRM_GPUVA_OP_REMAP) {
+			kfree(op->remap.prev);
+			kfree(op->remap.next);
+			kfree(op->remap.unmap);
+		}
+
+		gpuva_op_free(mgr, op);
+	}
+
+	kfree(ops);
+}
+EXPORT_SYMBOL(drm_gpuva_ops_free);
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 1d76d0686b03..4fe4a1552948 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -104,6 +104,12 @@ enum drm_driver_feature {
 	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
 	 */
 	DRIVER_COMPUTE_ACCEL            = BIT(7),
+	/**
+	 * @DRIVER_GEM_GPUVA:
+	 *
+	 * Driver supports user defined GPU VA bindings for GEM objects.
+	 */
+	DRIVER_GEM_GPUVA		= BIT(8),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 772a4adf5287..4a3679034966 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -36,6 +36,8 @@
 
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
 
 #include <drm/drm_vma_manager.h>
 
@@ -337,6 +339,17 @@ struct drm_gem_object {
 	 */
 	struct dma_resv _resv;
 
+	/**
+	 * @gpuva:
+	 *
+	 * Provides the list and list mutex of GPU VAs attached to this
+	 * GEM object.
+	 */
+	struct {
+		struct list_head list;
+		struct mutex mutex;
+	} gpuva;
+
 	/**
 	 * @funcs:
 	 *
@@ -479,4 +492,66 @@ void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
 unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
 			       bool (*shrink)(struct drm_gem_object *obj));
 
+/**
+ * drm_gem_gpuva_init - initialize the gpuva list of a GEM object
+ * @obj: the &drm_gem_object
+ *
+ * This initializes the &drm_gem_object's &drm_gpuva list and the mutex
+ * protecting it.
+ *
+ * Calling this function is only necessary for drivers intending to support the
+ * &drm_driver_feature DRIVER_GEM_GPUVA.
+ */
+static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
+{
+	INIT_LIST_HEAD(&obj->gpuva.list);
+	mutex_init(&obj->gpuva.mutex);
+}
+
+/**
+ * drm_gem_gpuva_lock - lock the GEM's gpuva list mutex
+ * @obj: the &drm_gem_object
+ *
+ * This unlocks the mutex protecting the &drm_gem_object's &drm_gpuva list.
+ */
+static inline void drm_gem_gpuva_lock(struct drm_gem_object *obj)
+{
+	mutex_lock(&obj->gpuva.mutex);
+}
+
+/**
+ * drm_gem_gpuva_unlock - unlock the GEM's gpuva list mutex
+ * @obj: the &drm_gem_object
+ *
+ * This unlocks the mutex protecting the &drm_gem_object's &drm_gpuva list.
+ */
+static inline void drm_gem_gpuva_unlock(struct drm_gem_object *obj)
+{
+	mutex_unlock(&obj->gpuva.mutex);
+}
+
+/**
+ * drm_gem_for_each_gpuva - iternator to walk over a list of gpuvas
+ * @entry: &drm_gpuva structure to assign to in each iteration step
+ * @obj: the &drm_gem_object the &drm_gpuvas to walk are associated with
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the
+ * &drm_gpuva_manager.
+ */
+#define drm_gem_for_each_gpuva(entry, obj) \
+	list_for_each_entry(entry, &obj->gpuva.list, head)
+
+/**
+ * drm_gem_for_each_gpuva_safe - iternator to safely walk over a list of gpuvas
+ * @entry: &drm_gpuva structure to assign to in each iteration step
+ * @next: &next &drm_gpuva to store the next step
+ * @obj: the &drm_gem_object the &drm_gpuvas to walk are associated with
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the
+ * &drm_gem_object. It is implemented with list_for_each_entry_safe(), hence
+ * it is save against removal of elements.
+ */
+#define drm_gem_for_each_gpuva_safe(entry, next, obj) \
+	list_for_each_entry_safe(entry, next, &obj->gpuva.list, head)
+
 #endif /* __DRM_GEM_H__ */
diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
new file mode 100644
index 000000000000..d245d01e37a9
--- /dev/null
+++ b/include/drm/drm_gpuva_mgr.h
@@ -0,0 +1,714 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DRM_GPUVA_MGR_H__
+#define __DRM_GPUVA_MGR_H__
+
+/*
+ * Copyright (c) 2022 Red Hat.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <linux/maple_tree.h>
+#include <linux/mm.h>
+#include <linux/rbtree.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+struct drm_gpuva_manager;
+struct drm_gpuva_fn_ops;
+
+/**
+ * struct drm_gpuva_region - structure to track a portion of GPU VA space
+ *
+ * This structure represents a portion of a GPUs VA space and is associated
+ * with a &drm_gpuva_manager.
+ *
+ * GPU VA mappings, represented by &drm_gpuva objects, are restricted to be
+ * placed within a &drm_gpuva_region.
+ */
+struct drm_gpuva_region {
+	/**
+	 * @mgr: the &drm_gpuva_manager this object is associated with
+	 */
+	struct drm_gpuva_manager *mgr;
+
+	/**
+	 * @va: structure containing the address and range of the &drm_gpuva_region
+	 */
+	struct {
+		/**
+		 * @addr: the start address
+		 */
+		u64 addr;
+
+		/*
+		 * @range: the range
+		 */
+		u64 range;
+	} va;
+
+	/**
+	 * @sparse: indicates whether this region is sparse
+	 */
+	bool sparse;
+};
+
+int drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
+			    struct drm_gpuva_region *reg);
+void drm_gpuva_region_remove(struct drm_gpuva_region *reg);
+
+bool
+drm_gpuva_region_empty(struct drm_gpuva_region *reg);
+
+struct drm_gpuva_region *
+drm_gpuva_region_find(struct drm_gpuva_manager *mgr,
+		      u64 addr, u64 range);
+struct drm_gpuva_region *
+drm_gpuva_region_find_first(struct drm_gpuva_manager *mgr,
+			    u64 addr, u64 range);
+
+/**
+ * enum drm_gpuva_flags - flags for struct drm_gpuva
+ */
+enum drm_gpuva_flags {
+	/**
+	 * @DRM_GPUVA_EVICTED:
+	 *
+	 * Flag indicating that the &drm_gpuva's backing GEM is evicted.
+	 */
+	DRM_GPUVA_EVICTED = (1 << 0),
+
+	/**
+	 * @DRM_GPUVA_USERBITS: user defined bits
+	 */
+	DRM_GPUVA_USERBITS = (1 << 1),
+};
+
+/**
+ * struct drm_gpuva - structure to track a GPU VA mapping
+ *
+ * This structure represents a GPU VA mapping and is associated with a
+ * &drm_gpuva_manager.
+ *
+ * Typically, this structure is embedded in bigger driver structures.
+ */
+struct drm_gpuva {
+	/**
+	 * @mgr: the &drm_gpuva_manager this object is associated with
+	 */
+	struct drm_gpuva_manager *mgr;
+
+	/**
+	 * @region: the &drm_gpuva_region the &drm_gpuva is mapped in
+	 */
+	struct drm_gpuva_region *region;
+
+	/**
+	 * @head: the &list_head to attach this object to a &drm_gem_object
+	 */
+	struct list_head head;
+
+	/**
+	 * @flags: the &drm_gpuva_flags for this mapping
+	 */
+	enum drm_gpuva_flags flags;
+
+	/**
+	 * @va: structure containing the address and range of the &drm_gpuva
+	 */
+	struct {
+		/**
+		 * @addr: the start address
+		 */
+		u64 addr;
+
+		/*
+		 * @range: the range
+		 */
+		u64 range;
+	} va;
+
+	/**
+	 * @gem: structure containing the &drm_gem_object and it's offset
+	 */
+	struct {
+		/**
+		 * @offset: the offset within the &drm_gem_object
+		 */
+		u64 offset;
+
+		/**
+		 * @obj: the mapped &drm_gem_object
+		 */
+		struct drm_gem_object *obj;
+	} gem;
+};
+
+void drm_gpuva_link(struct drm_gpuva *va);
+void drm_gpuva_unlink(struct drm_gpuva *va);
+
+int drm_gpuva_insert(struct drm_gpuva_manager *mgr,
+		     struct drm_gpuva *va);
+void drm_gpuva_remove(struct drm_gpuva *va);
+
+struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
+				 u64 addr, u64 range);
+struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
+				       u64 addr, u64 range);
+struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start);
+struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end);
+
+/**
+ * drm_gpuva_evict - sets whether the backing GEM of this &drm_gpuva is evicted
+ * @va: the &drm_gpuva to set the evict flag for
+ * @evict: indicates whether the &drm_gpuva is evicted
+ */
+static inline void drm_gpuva_evict(struct drm_gpuva *va, bool evict)
+{
+	if (evict)
+		va->flags |= DRM_GPUVA_EVICTED;
+	else
+		va->flags &= ~DRM_GPUVA_EVICTED;
+}
+
+/**
+ * drm_gpuva_evicted - indicates whether the backing BO of this &drm_gpuva
+ * is evicted
+ * @va: the &drm_gpuva to check
+ */
+static inline bool drm_gpuva_evicted(struct drm_gpuva *va)
+{
+	return va->flags & DRM_GPUVA_EVICTED;
+}
+
+/**
+ * enum drm_gpuva_mgr_flags - the feature flags for the &drm_gpuva_manager
+ */
+enum drm_gpuva_mgr_flags {
+	/**
+	 * @DRM_GPUVA_MANAGER_REGIONS:
+	 *
+	 * Enable the &drm_gpuva_manager to separately track &drm_gpuva_regions.
+	 *
+	 * &drm_gpuva_regions represent a reserved portion of VA space drivers
+	 * can create mappings in. If regions are enabled, &drm_gpuvas can be
+	 * created within an existing &drm_gpuva_region only and merge
+	 * operations never indicate merging over region boundaries.
+	 */
+	DRM_GPUVA_MANAGER_REGIONS = (1 << 0),
+};
+
+/**
+ * struct drm_gpuva_manager - DRM GPU VA Manager
+ *
+ * The DRM GPU VA Manager keeps track of a GPU's virtual address space by using
+ * &maple_tree structures. Typically, this structure is embedded in bigger
+ * driver structures.
+ *
+ * Drivers can pass addresses and ranges in an arbitrary unit, e.g. bytes or
+ * pages.
+ *
+ * There should be one manager instance per GPU virtual address space.
+ */
+struct drm_gpuva_manager {
+	/**
+	 * @name: the name of the DRM GPU VA space
+	 */
+	const char *name;
+
+	/**
+	 * @mm_start: start of the VA space
+	 */
+	u64 mm_start;
+
+	/**
+	 * @mm_range: length of the VA space
+	 */
+	u64 mm_range;
+
+	/**
+	 * @region_mt: the &maple_tree to track GPU VA regions
+	 */
+	struct maple_tree region_mt;
+
+	/**
+	 * @va_mt: the &maple_tree to track GPU VA mappings
+	 */
+	struct maple_tree va_mt;
+
+	/**
+	 * @kernel_alloc_region:
+	 *
+	 * &drm_gpuva_region representing the address space cutout reserved for
+	 * the kernel
+	 */
+	struct drm_gpuva_region kernel_alloc_region;
+
+	/**
+	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
+	 */
+	struct drm_gpuva_fn_ops *ops;
+
+	/**
+	 * @flags: the feature flags of the &drm_gpuva_manager
+	 */
+	enum drm_gpuva_mgr_flags flags;
+};
+
+void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
+			    const char *name,
+			    u64 start_offset, u64 range,
+			    u64 reserve_offset, u64 reserve_range,
+			    struct drm_gpuva_fn_ops *ops,
+			    enum drm_gpuva_mgr_flags flags);
+void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
+
+/**
+ * struct drm_gpuva_iterator - iterator for walking the internal (maple) tree
+ */
+struct drm_gpuva_iterator {
+	/**
+	 * @mas: the maple tree iterator (maple advanced state)
+	 */
+	struct ma_state mas;
+
+	/**
+	 * @mgr: the &drm_gpuva_manager to iterate
+	 */
+	struct drm_gpuva_manager *mgr;
+
+	union {
+		/**
+		 * @va: the current &drm_gpuva entry
+		 */
+		struct drm_gpuva *va;
+
+		/**
+		 * @reg: the current &drm_gpuva_region entry
+		 */
+		struct drm_gpuva_region *reg;
+
+		/**
+		 * @entry: the current entry
+		 */
+		void *entry;
+	};
+};
+
+void drm_gpuva_iter_remove(struct drm_gpuva_iterator *it);
+
+/**
+ * DRM_GPUVA_ITER - create an iterator structure to iterate the &drm_gpuva tree
+ * @name: the name of the &drm_gpuva_iterator to create
+ * @mgr: the &drm_gpuva_manager to iterate
+ */
+#define DRM_GPUVA_ITER(name, mgr__)				\
+	struct drm_gpuva_iterator name = {			\
+		.mas = __MA_STATE(&(mgr__)->va_mt, 0, 0),	\
+		.mgr = mgr__,					\
+		.va = NULL,					\
+	}
+
+/**
+ * DRM_GPUVA_REGION_ITER - create an iterator structure to iterate the
+ * &drm_gpuva_region tree
+ * @name: the name of the &drm_gpuva_iterator to create
+ * @mgr: the &drm_gpuva_manager to iterate
+ */
+#define DRM_GPUVA_REGION_ITER(name, mgr__)			\
+	struct drm_gpuva_iterator name = {			\
+		.mas = __MA_STATE(&(mgr__)->region_mt, 0, 0),	\
+		.mgr = mgr__,					\
+		.reg = NULL,					\
+	}
+
+/**
+ * drm_gpuva_iter_for_each_range - iternator to walk over a range of entries
+ * @it__: &drm_gpuva_iterator structure to assign to in each iteration step
+ * @start__: starting offset, the first entry will overlap this
+ * @end__: ending offset, the last entry will start before this (but may overlap)
+ *
+ * This function can be used to iterate both &drm_gpuva objects and
+ * &drm_gpuva_region objects.
+ *
+ * It is safe against the removal of elements using &drm_gpuva_iter_remove,
+ * however it is not safe against the removal of elements using
+ * &drm_gpuva_remove and &drm_gpuva_region_remove.
+ */
+#define drm_gpuva_iter_for_each_range(it__, start__, end__) \
+	for ((it__).mas.index = start__, (it__).entry = mas_find(&(it__).mas, end__ - 1); \
+	     (it__).entry; (it__).entry = mas_find(&(it__).mas, end__ - 1))
+
+/**
+ * drm_gpuva_iter_for_each - iternator to walk over all existing entries
+ * @it__: &drm_gpuva_iterator structure to assign to in each iteration step
+ *
+ * This function can be used to iterate both &drm_gpuva objects and
+ * &drm_gpuva_region objects.
+ *
+ * It is safe against the removal of elements using &drm_gpuva_iter_remove,
+ * however it is not safe against the removal of elements using
+ * &drm_gpuva_remove and &drm_gpuva_region_remove.
+ */
+#define drm_gpuva_iter_for_each(it__) \
+	drm_gpuva_iter_for_each_range(it__, (it__).mgr->mm_start, \
+				      (it__).mgr->mm_start + (it__).mgr->mm_range)
+
+/**
+ * enum drm_gpuva_op_type - GPU VA operation type
+ *
+ * Operations to alter the GPU VA mappings tracked by the &drm_gpuva_manager.
+ */
+enum drm_gpuva_op_type {
+	/**
+	 * @DRM_GPUVA_OP_MAP: the map op type
+	 */
+	DRM_GPUVA_OP_MAP,
+
+	/**
+	 * @DRM_GPUVA_OP_REMAP: the remap op type
+	 */
+	DRM_GPUVA_OP_REMAP,
+
+	/**
+	 * @DRM_GPUVA_OP_UNMAP: the unmap op type
+	 */
+	DRM_GPUVA_OP_UNMAP,
+
+	/**
+	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
+	 */
+	DRM_GPUVA_OP_PREFETCH,
+};
+
+/**
+ * struct drm_gpuva_op_map - GPU VA map operation
+ *
+ * This structure represents a single map operation generated by the
+ * DRM GPU VA manager.
+ */
+struct drm_gpuva_op_map {
+	/**
+	 * @va: structure containing address and range of a map
+	 * operation
+	 */
+	struct {
+		/**
+		 * @addr: the base address of the new mapping
+		 */
+		u64 addr;
+
+		/**
+		 * @range: the range of the new mapping
+		 */
+		u64 range;
+	} va;
+
+	/**
+	 * @gem: structure containing the &drm_gem_object and it's offset
+	 */
+	struct {
+		/**
+		 * @offset: the offset within the &drm_gem_object
+		 */
+		u64 offset;
+
+		/**
+		 * @obj: the &drm_gem_object to map
+		 */
+		struct drm_gem_object *obj;
+	} gem;
+};
+
+/**
+ * struct drm_gpuva_op_unmap - GPU VA unmap operation
+ *
+ * This structure represents a single unmap operation generated by the
+ * DRM GPU VA manager.
+ */
+struct drm_gpuva_op_unmap {
+	/**
+	 * @va: the &drm_gpuva to unmap
+	 */
+	struct drm_gpuva *va;
+
+	/**
+	 * @keep:
+	 *
+	 * Indicates whether this &drm_gpuva is physically contiguous with the
+	 * original mapping request.
+	 *
+	 * Optionally, if &keep is set, drivers may keep the actual page table
+	 * mappings for this &drm_gpuva, adding the missing page table entries
+	 * only and update the &drm_gpuva_manager accordingly.
+	 */
+	bool keep;
+};
+
+/**
+ * struct drm_gpuva_op_remap - GPU VA remap operation
+ *
+ * This represents a single remap operation generated by the DRM GPU VA manager.
+ *
+ * A remap operation is generated when an existing GPU VA mmapping is split up
+ * by inserting a new GPU VA mapping or by partially unmapping existent
+ * mapping(s), hence it consists of a maximum of two map and one unmap
+ * operation.
+ *
+ * The @unmap operation takes care of removing the original existing mapping.
+ * @prev is used to remap the preceding part, @next the subsequent part.
+ *
+ * If either a new mapping's start address is aligned with the start address
+ * of the old mapping or the new mapping's end address is aligned with the
+ * end address of the old mapping, either @prev or @next is NULL.
+ *
+ * Note, the reason for a dedicated remap operation, rather than arbitrary
+ * unmap and map operations, is to give drivers the chance of extracting driver
+ * specific data for creating the new mappings from the unmap operations's
+ * &drm_gpuva structure which typically is embedded in larger driver specific
+ * structures.
+ */
+struct drm_gpuva_op_remap {
+	/**
+	 * @prev: the preceding part of a split mapping
+	 */
+	struct drm_gpuva_op_map *prev;
+
+	/**
+	 * @next: the subsequent part of a split mapping
+	 */
+	struct drm_gpuva_op_map *next;
+
+	/**
+	 * @unmap: the unmap operation for the original existing mapping
+	 */
+	struct drm_gpuva_op_unmap *unmap;
+};
+
+/**
+ * struct drm_gpuva_op_prefetch - GPU VA prefetch operation
+ *
+ * This structure represents a single prefetch operation generated by the
+ * DRM GPU VA manager.
+ */
+struct drm_gpuva_op_prefetch {
+	/**
+	 * @va: the &drm_gpuva to prefetch
+	 */
+	struct drm_gpuva *va;
+};
+
+/**
+ * struct drm_gpuva_op - GPU VA operation
+ *
+ * This structure represents a single generic operation.
+ *
+ * The particular type of the operation is defined by @op.
+ */
+struct drm_gpuva_op {
+	/**
+	 * @entry:
+	 *
+	 * The &list_head used to distribute instances of this struct within
+	 * &drm_gpuva_ops.
+	 */
+	struct list_head entry;
+
+	/**
+	 * @op: the type of the operation
+	 */
+	enum drm_gpuva_op_type op;
+
+	union {
+		/**
+		 * @map: the map operation
+		 */
+		struct drm_gpuva_op_map map;
+
+		/**
+		 * @remap: the remap operation
+		 */
+		struct drm_gpuva_op_remap remap;
+
+		/**
+		 * @unmap: the unmap operation
+		 */
+		struct drm_gpuva_op_unmap unmap;
+
+		/**
+		 * @prefetch: the prefetch operation
+		 */
+		struct drm_gpuva_op_prefetch prefetch;
+	};
+};
+
+/**
+ * struct drm_gpuva_ops - wraps a list of &drm_gpuva_op
+ */
+struct drm_gpuva_ops {
+	/**
+	 * @list: the &list_head
+	 */
+	struct list_head list;
+};
+
+/**
+ * drm_gpuva_for_each_op - iterator to walk over &drm_gpuva_ops
+ * @op: &drm_gpuva_op to assign in each iteration step
+ * @ops: &drm_gpuva_ops to walk
+ *
+ * This iterator walks over all ops within a given list of operations.
+ */
+#define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
+
+/**
+ * drm_gpuva_for_each_op_safe - iterator to safely walk over &drm_gpuva_ops
+ * @op: &drm_gpuva_op to assign in each iteration step
+ * @next: &next &drm_gpuva_op to store the next step
+ * @ops: &drm_gpuva_ops to walk
+ *
+ * This iterator walks over all ops within a given list of operations. It is
+ * implemented with list_for_each_safe(), so save against removal of elements.
+ */
+#define drm_gpuva_for_each_op_safe(op, next, ops) \
+	list_for_each_entry_safe(op, next, &(ops)->list, entry)
+
+/**
+ * drm_gpuva_for_each_op_from_reverse - iterate backwards from the given point
+ * @op: &drm_gpuva_op to assign in each iteration step
+ * @ops: &drm_gpuva_ops to walk
+ *
+ * This iterator walks over all ops within a given list of operations beginning
+ * from the given operation in reverse order.
+ */
+#define drm_gpuva_for_each_op_from_reverse(op, ops) \
+	list_for_each_entry_from_reverse(op, &(ops)->list, entry)
+
+/**
+ * drm_gpuva_first_op - returns the first &drm_gpuva_op from &drm_gpuva_ops
+ * @ops: the &drm_gpuva_ops to get the fist &drm_gpuva_op from
+ */
+#define drm_gpuva_first_op(ops) \
+	list_first_entry(&(ops)->list, struct drm_gpuva_op, entry)
+
+/**
+ * drm_gpuva_last_op - returns the last &drm_gpuva_op from &drm_gpuva_ops
+ * @ops: the &drm_gpuva_ops to get the last &drm_gpuva_op from
+ */
+#define drm_gpuva_last_op(ops) \
+	list_last_entry(&(ops)->list, struct drm_gpuva_op, entry)
+
+/**
+ * drm_gpuva_prev_op - previous &drm_gpuva_op in the list
+ * @op: the current &drm_gpuva_op
+ */
+#define drm_gpuva_prev_op(op) list_prev_entry(op, entry)
+
+/**
+ * drm_gpuva_next_op - next &drm_gpuva_op in the list
+ * @op: the current &drm_gpuva_op
+ */
+#define drm_gpuva_next_op(op) list_next_entry(op, entry)
+
+struct drm_gpuva_ops *
+drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
+			    u64 addr, u64 range,
+			    struct drm_gem_object *obj, u64 offset);
+struct drm_gpuva_ops *
+drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
+			      u64 addr, u64 range);
+
+struct drm_gpuva_ops *
+drm_gpuva_prefetch_ops_create(struct drm_gpuva_manager *mgr,
+				 u64 addr, u64 range);
+
+struct drm_gpuva_ops *
+drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
+			       struct drm_gem_object *obj);
+
+void drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
+			struct drm_gpuva_ops *ops);
+
+/**
+ * struct drm_gpuva_fn_ops - callbacks for split/merge steps
+ *
+ * This structure defines the callbacks used by &drm_gpuva_sm_map and
+ * &drm_gpuva_sm_unmap to provide the split/merge steps for map and unmap
+ * operations to drivers.
+ */
+struct drm_gpuva_fn_ops {
+	/**
+	 * @op_alloc: called when the &drm_gpuva_manager allocates
+	 * a struct drm_gpuva_op
+	 *
+	 * Some drivers may want to embed struct drm_gpuva_op into driver
+	 * specific structures. By implementing this callback drivers can
+	 * allocate memory accordingly.
+	 *
+	 * This callback is optional.
+	 */
+	struct drm_gpuva_op *(*op_alloc)(void);
+
+	/**
+	 * @op_free: called when the &drm_gpuva_manager frees a
+	 * struct drm_gpuva_op
+	 *
+	 * Some drivers may want to embed struct drm_gpuva_op into driver
+	 * specific structures. By implementing this callback drivers can
+	 * free the previously allocated memory accordingly.
+	 *
+	 * This callback is optional.
+	 */
+	void (*op_free)(struct drm_gpuva_op *op);
+
+	/**
+	 * @sm_map_step: called from &drm_gpuva_sm_map providing the split and
+	 * merge steps
+	 *
+	 * This callback provides a single split / merge step or, if no split
+	 * and merge is indicated, the original map operation.
+	 *
+	 * The &priv pointer is equal to the one drivers pass to
+	 * &drm_gpuva_sm_map.
+	 */
+	int (*sm_map_step)(struct drm_gpuva_op *op, void *priv);
+
+	/**
+	 * @sm_unmap_step: called from &drm_gpuva_sm_map providing the split and
+	 * merge steps
+	 *
+	 * This callback provides a single split step or, if no split is
+	 * indicated, the plain unmap operations of the corresponding unmap
+	 * range originally passed to &drm_gpuva_sm_unmap.
+	 *
+	 * The &priv pointer is equal to the one drivers pass to
+	 * &drm_gpuva_sm_unmap.
+	 */
+	int (*sm_unmap_step)(struct drm_gpuva_op *op, void *priv);
+};
+
+int drm_gpuva_sm_map(struct drm_gpuva_manager *mgr, void *priv,
+		     u64 addr, u64 range,
+		     struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuva_sm_unmap(struct drm_gpuva_manager *mgr, void *priv,
+		       u64 addr, u64 range);
+
+#endif /* __DRM_GPUVA_MGR_H__ */
-- 
2.39.1

