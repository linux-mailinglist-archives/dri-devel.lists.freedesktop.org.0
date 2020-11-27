Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497062C6576
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834946ED80;
	Fri, 27 Nov 2020 12:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4067A6ECF4;
 Fri, 27 Nov 2020 12:12:06 +0000 (UTC)
IronPort-SDR: b2HR2TT3dETgftFdnUVeGLqD/ePO8Rvn9u/K91UAR/0zSCogL2weDvhMIRHiPJ6pIweULicrSx
 ZEmIRIHinO1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883823"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883823"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:04 -0800
IronPort-SDR: 3E0/ouAVpgdEP2P8cIEV2oLHco8psfG2eHURqA1KEjozRrifOvthpILH9LEqsVe/mojaEr1Xfm
 k+tK0oPH6hcA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029975"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:02 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 143/162] drm/i915: suspend/resume eviction
Date: Fri, 27 Nov 2020 12:06:59 +0000
Message-Id: <20201127120718.454037-144-matthew.auld@intel.com>
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
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

As the initial phase of implementation, when the system in idle,
copying the user objects from LMEM to SMEM during suspend and
restoring back in resume. In present implementation using memcpy based
eviction during swapout/swapin of objects. To test the functionality,
suspend is initiated as part of igt application.

Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 +
 drivers/gpu/drm/i915/i915_drv.c               | 83 +++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index e9f42d3137b3..331d113f7d5b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -322,6 +322,9 @@ struct drm_i915_gem_object {
 	 */
 	bool do_swapping;
 	struct drm_i915_gem_object *swapto;
+
+	/** mark evicted object during suspend */
+	bool evicted;
 };
 
 static inline struct drm_i915_gem_object *
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 78b528e89486..e8c4931fc818 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1102,11 +1102,86 @@ static int i915_drm_prepare(struct drm_device *dev)
 	return 0;
 }
 
+static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend)
+{
+	struct drm_i915_private *i915 = to_i915(dev);
+	struct drm_i915_gem_object *obj;
+	struct intel_memory_region *mem;
+	int id, ret = 0;
+
+	/*
+	 * FIXME: Presently using memcpy,
+	 * will replace with blitter once
+	 * fix the issues.
+	 */
+	i915->params.enable_eviction = 1;
+
+	for_each_memory_region(mem, i915, id) {
+		struct list_head still_in_list;
+		INIT_LIST_HEAD(&still_in_list);
+		if (mem->type == INTEL_MEMORY_LOCAL && mem->total) {
+			mutex_lock(&mem->objects.lock);
+			while ((obj =  list_first_entry_or_null(&mem->objects.list,
+						typeof(*obj),
+						mm.region_link))) {
+
+				list_move_tail(&obj->mm.region_link, &still_in_list);
+
+				if (!i915_gem_object_has_pages(obj) && in_suspend)
+					continue;
+
+				/* Ignore previously evicted objects */
+				if (obj->swapto && in_suspend)
+					continue;
+
+				mutex_unlock(&mem->objects.lock);
+
+				if (in_suspend)
+					i915_gem_object_unbind(obj, 0);
+
+				if (in_suspend) {
+					obj->swapto = NULL;
+					obj->evicted = false;
+					obj->do_swapping = true;
+					ret = __i915_gem_object_put_pages(obj);
+					obj->do_swapping = false;
+					if (ret) {
+						/*
+						 * FIXME: internal ctx objects still pinned
+						 * returning as BUSY. Presently just evicting
+						 * the user objects, will fix it later
+						 */
+						obj->evicted = false;
+						ret = 0;
+					} else
+						obj->evicted = true;
+				} else {
+					if (obj->swapto && obj->evicted) {
+						ret = i915_gem_object_pin_pages(obj);
+						if (ret) {
+							i915_gem_object_put(obj);
+						} else {
+							i915_gem_object_unpin_pages(obj);
+							obj->evicted = false;
+						}
+					}
+				}
+				mutex_lock(&mem->objects.lock);
+			}
+			list_splice_tail(&still_in_list, &mem->objects.list);
+			mutex_unlock(&mem->objects.lock);
+		}
+	}
+	i915->params.enable_eviction = 3;
+	return ret;
+}
+
 static int i915_drm_suspend(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct pci_dev *pdev = dev_priv->drm.pdev;
 	pci_power_t opregion_target_state;
+	int ret = 0;
 
 	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
@@ -1138,6 +1213,10 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	intel_fbdev_set_suspend(dev, FBINFO_STATE_SUSPENDED, true);
 
+	ret = intel_dmem_evict_buffers(dev, true);
+	if (ret)
+		return ret;
+
 	dev_priv->suspend_count++;
 
 	intel_csr_ucode_suspend(dev_priv);
@@ -1263,6 +1342,10 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	drm_mode_config_reset(dev);
 
+	ret = intel_dmem_evict_buffers(dev, false);
+	if (ret)
+		DRM_ERROR("i915_resume:i915_gem_object_pin_pages failed with err=%d\n", ret);
+
 	i915_gem_resume(dev_priv);
 
 	intel_modeset_init_hw(dev_priv);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
