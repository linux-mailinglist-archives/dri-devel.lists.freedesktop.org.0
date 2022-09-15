Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4E45BA337
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 01:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA2B10EC1A;
	Thu, 15 Sep 2022 23:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F13410EC17;
 Thu, 15 Sep 2022 23:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663284421; x=1694820421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tFlfD40hLtY3YkEKxAQn2mbJw+x4pC16bMSk3bOwU8s=;
 b=ahmnJ1A/xXHpWkX4zPKL04FvkENmExnG4KDc9GZf2ZbrmywxgB+H+sa0
 m2xVQ5iqaQGMODucUJdKyLwNPqR3K7ryJUWgrNuK5T/dyJ87/QAchYO0+
 pL4uf65fYfQPCIoaCfqF/03rjuRYX9x/0V/cHTHS2020qU0cGxAnS1pdk
 9ODgdrdHQmaRIfkHZv6obQG2WswC8Da6QFFHi3WjHkMb6bxam/wboDi3u
 sVx7P48g6XT75Q1EQW8As3K9k0SPJWDS+G7wxBleTROItGguteJynEkBe
 Ljye9wMFPVOPKAr/VzdMO914wHDBKRQAf8m7kjyVoFOxfdplIzMtRO5Y6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299689111"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="299689111"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:27:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="685923308"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:26:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/i915: Handle all GTs on driver (un)load paths
Date: Thu, 15 Sep 2022 16:26:54 -0700
Message-Id: <20220915232654.3283095-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915232654.3283095-1-matthew.d.roper@intel.com>
References: <20220915232654.3283095-1-matthew.d.roper@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This, along with the changes already landed in commit 1c66a12ab431
("drm/i915: Handle each GT on init/release and suspend/resume") makes
engines from all GTs actually known to the driver.

To accomplish this we need to sprinkle a lot of for_each_gt calls around
but is otherwise pretty un-eventuful.

v2:
 - Consolidate adjacent GT loops in a couple places.  (Daniele)

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c |  3 ++-
 drivers/gpu/drm/i915/i915_gem.c    | 43 +++++++++++++++++++++---------
 2 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c459eb362c47..9d1fc2477f80 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1661,7 +1661,8 @@ static int intel_runtime_suspend(struct device *kdev)
 
 		intel_runtime_pm_enable_interrupts(dev_priv);
 
-		intel_gt_runtime_resume(to_gt(dev_priv));
+		for_each_gt(gt, dev_priv, i)
+			intel_gt_runtime_resume(gt);
 
 		enable_rpm_wakeref_asserts(rpm);
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index f18cc6270b2b..e936e67f3411 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1128,6 +1128,8 @@ void i915_gem_drain_workqueue(struct drm_i915_private *i915)
 
 int i915_gem_init(struct drm_i915_private *dev_priv)
 {
+	struct intel_gt *gt;
+	unsigned int i;
 	int ret;
 
 	/* We need to fallback to 4K pages if host doesn't support huge gtt. */
@@ -1158,9 +1160,11 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	 */
 	intel_init_clock_gating(dev_priv);
 
-	ret = intel_gt_init(to_gt(dev_priv));
-	if (ret)
-		goto err_unlock;
+	for_each_gt(gt, dev_priv, i) {
+		ret = intel_gt_init(gt);
+		if (ret)
+			goto err_unlock;
+	}
 
 	return 0;
 
@@ -1173,8 +1177,13 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 err_unlock:
 	i915_gem_drain_workqueue(dev_priv);
 
-	if (ret != -EIO)
-		intel_uc_cleanup_firmwares(&to_gt(dev_priv)->uc);
+	if (ret != -EIO) {
+		for_each_gt(gt, dev_priv, i) {
+			intel_gt_driver_remove(gt);
+			intel_gt_driver_release(gt);
+			intel_uc_cleanup_firmwares(&gt->uc);
+		}
+	}
 
 	if (ret == -EIO) {
 		/*
@@ -1182,10 +1191,12 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 		 * as wedged. But we only want to do this when the GPU is angry,
 		 * for all other failure, such as an allocation failure, bail.
 		 */
-		if (!intel_gt_is_wedged(to_gt(dev_priv))) {
-			i915_probe_error(dev_priv,
-					 "Failed to initialize GPU, declaring it wedged!\n");
-			intel_gt_set_wedged(to_gt(dev_priv));
+		for_each_gt(gt, dev_priv, i) {
+			if (!intel_gt_is_wedged(gt)) {
+				i915_probe_error(dev_priv,
+						"Failed to initialize GPU, declaring it wedged!\n");
+				intel_gt_set_wedged(gt);
+			}
 		}
 
 		/* Minimal basic recovery for KMS */
@@ -1213,10 +1224,14 @@ void i915_gem_driver_unregister(struct drm_i915_private *i915)
 
 void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
 {
+	struct intel_gt *gt;
+	unsigned int i;
+
 	intel_wakeref_auto_fini(&to_gt(dev_priv)->userfault_wakeref);
 
 	i915_gem_suspend_late(dev_priv);
-	intel_gt_driver_remove(to_gt(dev_priv));
+	for_each_gt(gt, dev_priv, i)
+		intel_gt_driver_remove(gt);
 	dev_priv->uabi_engines = RB_ROOT;
 
 	/* Flush any outstanding unpin_work. */
@@ -1227,9 +1242,13 @@ void i915_gem_driver_remove(struct drm_i915_private *dev_priv)
 
 void i915_gem_driver_release(struct drm_i915_private *dev_priv)
 {
-	intel_gt_driver_release(to_gt(dev_priv));
+	struct intel_gt *gt;
+	unsigned int i;
 
-	intel_uc_cleanup_firmwares(&to_gt(dev_priv)->uc);
+	for_each_gt(gt, dev_priv, i) {
+		intel_gt_driver_release(gt);
+		intel_uc_cleanup_firmwares(&gt->uc);
+	}
 
 	i915_gem_drain_freed_objects(dev_priv);
 
-- 
2.37.3

