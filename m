Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620643D482
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF52B6E027;
	Wed, 27 Oct 2021 21:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAF389EB7;
 Wed, 27 Oct 2021 21:20:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="229020830"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="229020830"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:20:53 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="665153995"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:20:50 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 01/17] drm/i915: Add has_64k_pages flag
Date: Thu, 28 Oct 2021 02:53:23 +0530
Message-Id: <20211027212339.29259-2-ramalingam.c@intel.com>
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

From: Stuart Summers <stuart.summers@intel.com>

Add a new platform flag, has_64k_pages, for platforms supporting
base page sizes of 64k.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 2 ++
 drivers/gpu/drm/i915/i915_pci.c          | 2 ++
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 19e6700a4315..b72643cc66d6 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1713,6 +1713,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_MSLICES(dev_priv) \
 	(INTEL_INFO(dev_priv)->has_mslices)
 
+#define HAS_64K_PAGES(dev_priv) (INTEL_INFO(dev_priv)->has_64k_pages)
+
 #define HAS_IPC(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_ipc)
 
 #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 169837de395d..8ef484a23652 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1015,6 +1015,7 @@ static const struct intel_device_info xehpsdv_info = {
 	DGFX_FEATURES,
 	PLATFORM(INTEL_XEHPSDV),
 	.display = { },
+	.has_64k_pages = 1,
 	.pipe_mask = 0,
 	.platform_engine_mask =
 		BIT(RCS0) | BIT(BCS0) |
@@ -1033,6 +1034,7 @@ static const struct intel_device_info dg2_info = {
 	.graphics_rel = 55,
 	.media_rel = 55,
 	PLATFORM(INTEL_DG2),
+	.has_64k_pages = 1,
 	.platform_engine_mask =
 		BIT(RCS0) | BIT(BCS0) |
 		BIT(VECS0) | BIT(VECS1) |
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 8e6f48d1eb7b..dd453b96af19 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -123,6 +123,7 @@ enum intel_ppgtt_type {
 	func(is_dgfx); \
 	/* Keep has_* in alphabetical order */ \
 	func(has_64bit_reloc); \
+	func(has_64k_pages); \
 	func(gpu_reset_clobbers_display); \
 	func(has_reset_engine); \
 	func(has_global_mocs); \
-- 
2.20.1

