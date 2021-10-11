Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90968429449
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 18:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A58A6E8F0;
	Mon, 11 Oct 2021 16:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13A46E8F0;
 Mon, 11 Oct 2021 16:10:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="214056829"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="214056829"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 09:09:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="441478029"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 09:09:52 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 CQ Tang <cq.tang@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 14/14] Doc/gpu/rfc/i915: i915 DG2 uAPI
Date: Mon, 11 Oct 2021 21:41:55 +0530
Message-Id: <20211011161155.6397-15-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011161155.6397-1-ramalingam.c@intel.com>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
MIME-Version: 1.0
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

Details of the new features getting added as part of DG2 enabling and their
implicit impact on the uAPI.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Daniel Vetter <daniel.vetter@ffwll.ch>
cc: Matthew Auld <matthew.auld@intel.com>
---
 Documentation/gpu/rfc/i915_dg2.rst | 47 ++++++++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst    |  3 ++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_dg2.rst

diff --git a/Documentation/gpu/rfc/i915_dg2.rst b/Documentation/gpu/rfc/i915_dg2.rst
new file mode 100644
index 000000000000..a83ca26cd758
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_dg2.rst
@@ -0,0 +1,47 @@
+====================
+I915 DG2 RFC Section
+====================
+
+Upstream plan
+=============
+Plan to upstream the DG2 enabling is:
+
+* Merge basic HW enabling for DG2(Still without pciid)
+* Merge the 64k support for lmem
+* Merge the flat CCS enabling patches
+* Add the pciid for DG2 and enable the DG2 in CI
+
+
+64K page support for lmem
+=========================
+On DG2 hw, local-memory supports minimum GTT page size of 64k only. 4k is not supported anymore.
+
+DG2 hw dont support the 64k(lmem) and 4k(smem) pages in the same ppgtt Page table. Refer the
+struct drm_i915_gem_create_ext for the implication of handling the 64k page size.
+
+.. kernel-doc:: include/uapi/drm/i915_drm.h
+        :functions: drm_i915_gem_create_ext
+
+
+flat CCS support for lmem
+=========================
+Gen 12+ devices support 3D surfaces compression and compression formats. This is
+accomplished by an additional compression control state (CCS) stored for each surface.
+
+Gen 12 devices(TGL and DG1) stores compression state in a separate region of memory.
+It is managed by userspace and has an associated set of userspace managed page tables
+used by hardware for address translation.
+
+In Gen 12.5 devices(XEXPSDV and DG2) Flat CCS is introduced to replace the userspace
+managed AUX pagetable with the flat indexed region of device memory for storing the
+compression state
+
+GOP Driver steals a chunk of memory for the CCS surface corresponding to the entire
+range of local memory. The memory required for the CCS of the entire local memory is
+1/256 of the main local memory. The Gop driver will also program a secure register
+(XEHPSDV_FLAT_CCS_BASE_ADDR 0x4910) with this address value.
+
+So the Total local memory available for driver allocation is Total lmem size - CCS data size
+
+Flat CCS data needs to be cleared when a lmem object is allocated. And CCS data can
+be copied in and out of CCS region through XY_CTRL_SURF_COPY_BLT.
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 91e93a705230..afb320ed4028 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -20,6 +20,9 @@ host such documentation:
 
     i915_gem_lmem.rst
 
+.. toctree::
+    i915_dg2.rst
+
 .. toctree::
 
     i915_scheduler.rst
-- 
2.20.1

