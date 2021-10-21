Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E69436431
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 16:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32486ECA9;
	Thu, 21 Oct 2021 14:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567766ECA1;
 Thu, 21 Oct 2021 14:24:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="216212334"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="216212334"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:24:42 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="495170696"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 07:24:38 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, lucas.demarchi@intel.com,
 <rodrigo.vivi@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>
Subject: [PATCH v2 17/17] Doc/gpu/rfc/i915: i915 DG2 uAPI
Date: Thu, 21 Oct 2021 19:56:27 +0530
Message-Id: <20211021142627.31058-18-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021142627.31058-1-ramalingam.c@intel.com>
References: <20211021142627.31058-1-ramalingam.c@intel.com>
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

v2: improvised the Flat-CCS documentation [Danvet & CQ]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Daniel Vetter <daniel.vetter@ffwll.ch>
cc: Matthew Auld <matthew.auld@intel.com>
cc: Simon Ser <contact@emersion.fr>
cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 Documentation/gpu/rfc/i915_dg2.rst | 32 ++++++++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst    |  3 +++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_dg2.rst

diff --git a/Documentation/gpu/rfc/i915_dg2.rst b/Documentation/gpu/rfc/i915_dg2.rst
new file mode 100644
index 000000000000..9d28b1812bc7
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_dg2.rst
@@ -0,0 +1,32 @@
+====================
+I915 DG2 RFC Section
+====================
+
+Upstream plan
+=============
+Plan to upstream the DG2 enabling is:
+
+* Merge basic HW enabling for DG2 (Still without pciid)
+* Merge the 64k support for lmem
+* Merge the flat CCS enabling patches
+* Add the pciid for DG2 and enable the DG2 in CI
+
+
+64K page support for lmem
+=========================
+On DG2 hw, local-memory supports minimum GTT page size of 64k only. 4k is not
+supported anymore.
+
+DG2 hw doesn't support the 64k (lmem) and 4k (smem) pages in the same ppgtt
+Page table. Refer the struct drm_i915_gem_create_ext for the implication of
+handling the 64k page size.
+
+.. kernel-doc:: include/uapi/drm/i915_drm.h
+        :functions: drm_i915_gem_create_ext
+
+
+Flat CCS support for lmem
+=========================
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_migrate.c
+        :doc: Flat-CCS - Memory compression for Local memory
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

