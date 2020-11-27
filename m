Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048AE2C6573
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7036ED42;
	Fri, 27 Nov 2020 12:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C886ED65;
 Fri, 27 Nov 2020 12:11:59 +0000 (UTC)
IronPort-SDR: hfBAFWZ1Um4h/AziP+MPD4XZFmW4vaNF57a/K4Yri2nmmWBl1vNCxvFj2qkP022b6XZTakjgUS
 tKmlQJE3jptA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092972"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092972"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:59 -0800
IronPort-SDR: rEpU1jGEQuwVf21rU3Xb6XTremC/vvnh8jWYm3VfZV8eS7sa66zUO3iCP4oVBxc36YSD005rxd
 VbBRowbE/w+A==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029945"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:57 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 140/162] drm/i915: window_blt_copy is used for swapin and
 swapout
Date: Fri, 27 Nov 2020 12:06:56 +0000
Message-Id: <20201127120718.454037-141-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ramalingam C <ramalingam.c@intel.com>

window_blt_copy feature is used for swapin and swapout based on the i915
module parameter called enable_eviction.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 14 ++++++++++----
 drivers/gpu/drm/i915/i915_drv.c            |  4 ++--
 drivers/gpu/drm/i915/i915_params.c         |  6 ++++--
 drivers/gpu/drm/i915/i915_params.h         |  2 +-
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index 4fab9f6b4bee..f9ff0aa31752 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -16,7 +16,7 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct drm_i915_gem_object *dst, *src;
 	unsigned long start, diff, msec;
-	int err;
+	int err = -EINVAL;
 
 	GEM_BUG_ON(obj->swapto);
 	GEM_BUG_ON(i915_gem_object_has_pages(obj));
@@ -54,7 +54,10 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
 	__i915_gem_object_pin_pages(src);
 
 	/* copying the pages */
-	err = i915_gem_object_memcpy(dst, src);
+	if (i915->params.enable_eviction >= 2)
+		err = i915_window_blt_copy(dst, src);
+	if (err && i915->params.enable_eviction != 2)
+		err = i915_gem_object_memcpy(dst, src);
 
 	__i915_gem_object_unpin_pages(src);
 	__i915_gem_object_unset_pages(src);
@@ -83,7 +86,7 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct drm_i915_gem_object *dst, *src;
 	unsigned long start, diff, msec;
-	int err;
+	int err = -EINVAL;
 
 	GEM_BUG_ON(!obj->swapto);
 	GEM_BUG_ON(i915_gem_object_has_pages(obj));
@@ -117,7 +120,10 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
 	__i915_gem_object_pin_pages(dst);
 
 	/* copying the pages */
-	err = i915_gem_object_memcpy(dst, src);
+	if (i915->params.enable_eviction >= 2)
+		err = i915_window_blt_copy(dst, src);
+	if (err && i915->params.enable_eviction != 2)
+		err = i915_gem_object_memcpy(dst, src);
 
 	__i915_gem_object_unpin_pages(dst);
 	__i915_gem_object_unset_pages(dst);
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 683643b211fa..78b528e89486 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -891,7 +891,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915_driver_register(i915);
 
-	if (HAS_LMEM(i915)) {
+	if (HAS_LMEM(i915) && i915->params.enable_eviction >= 2) {
 		ret = i915_setup_blt_windows(i915);
 		if (ret)
 			goto out_cleanup_drv_register;
@@ -939,7 +939,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 void i915_driver_remove(struct drm_i915_private *i915)
 {
-	if (HAS_LMEM(i915))
+	if (HAS_LMEM(i915) && i915->params.enable_eviction >= 2)
 		i915_teardown_blt_windows(i915);
 
 	disable_rpm_wakeref_asserts(&i915->runtime_pm);
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 264de32f3d6a..9fa58ed76614 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -197,8 +197,10 @@ i915_param_named_unsafe(fake_lmem_start, ulong, 0400,
 	"Fake LMEM start offset (default: 0)");
 #endif
 
-i915_param_named_unsafe(enable_eviction, bool, 0600,
-	"Enable memcpy based eviction which does not rely on DMA resv refactoring)");
+i915_param_named_unsafe(enable_eviction, uint, 0600,
+	"Enable eviction which does not rely on DMA resv refactoring "
+	"0=disabled, 1=memcpy based only, 2=blt based only, "
+	"3=blt based but fallsback to memcpy based [default])");
 
 i915_param_named_unsafe(lmem_size, uint, 0400,
 	"Change lmem size for each region. (default: 0, all memory)");
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index be6979e7feda..c835e592ee5f 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -72,8 +72,8 @@ struct drm_printer;
 	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
 	param(unsigned long, fake_lmem_start, 0, 0400) \
 	param(unsigned int, lmem_size, 0, 0400) \
+	param(unsigned int, enable_eviction, 3, 0600) \
 	/* leave bools at the end to not create holes */ \
-	param(bool, enable_eviction, true, 0600) \
 	param(bool, enable_hangcheck, true, 0600) \
 	param(bool, load_detect_test, false, 0600) \
 	param(bool, force_reset_modeset_test, false, 0600) \
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
