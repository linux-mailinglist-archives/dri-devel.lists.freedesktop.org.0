Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A96543D49A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE9E6E911;
	Wed, 27 Oct 2021 21:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26A36E90B;
 Wed, 27 Oct 2021 21:21:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="229020867"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="229020867"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:13 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="665154173"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:10 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 CQ Tang <cq.tang@intel.com>, Ramalingam C <ramalingam.c@intel.com>
Subject: [PATCH v3 08/17] drm/i915/xehpsdv: Add has_flat_ccs to device info
Date: Thu, 28 Oct 2021 02:53:30 +0530
Message-Id: <20211027212339.29259-9-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027212339.29259-1-ramalingam.c@intel.com>
References: <20211027212339.29259-1-ramalingam.c@intel.com>
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

From: CQ Tang <cq.tang@intel.com>

Gen12+ devices support 3D surface (buffer) compression and various
compression formats. This is accomplished by an additional compression
control state (CCS) stored for each surface.

Gen 12 devices(TGL family and DG1) stores compression states in a separate
region of memory. It is managed by user-space and has an associated set of
user-space managed page tables used by hardware for address translation.

In Gen12.5 devices(XEHPSDV, DG2, etc), there is a new feature introduced
i.e Flat CCS. It replaced AUX page tables with a flat indexed region of
device memory for storing compression states.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 2 ++
 drivers/gpu/drm/i915/i915_pci.c          | 1 +
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b72643cc66d6..d554236e3acd 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1720,6 +1720,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
 #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
 
+#define HAS_FLAT_CCS(dev_priv)   (INTEL_INFO(dev_priv)->has_flat_ccs)
+
 #define HAS_GT_UC(dev_priv)	(INTEL_INFO(dev_priv)->has_gt_uc)
 
 #define HAS_POOLED_EU(dev_priv)	(INTEL_INFO(dev_priv)->has_pooled_eu)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 8ef484a23652..68367b505dc4 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -991,6 +991,7 @@ static const struct intel_device_info adl_p_info = {
 	XE_HP_PAGE_SIZES, \
 	.dma_mask_size = 46, \
 	.has_64bit_reloc = 1, \
+	.has_flat_ccs = 1, \
 	.has_global_mocs = 1, \
 	.has_gt_uc = 1, \
 	.has_llc = 1, \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index dd453b96af19..87ee1d86d2ac 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -126,6 +126,7 @@ enum intel_ppgtt_type {
 	func(has_64k_pages); \
 	func(gpu_reset_clobbers_display); \
 	func(has_reset_engine); \
+	func(has_flat_ccs); \
 	func(has_global_mocs); \
 	func(has_gt_uc); \
 	func(has_l3_dpf); \
-- 
2.20.1

