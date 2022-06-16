Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504B854E07A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6B911A4CA;
	Thu, 16 Jun 2022 12:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C89011A4CE;
 Thu, 16 Jun 2022 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655380928; x=1686916928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QFsJ+wHIUOBRzEH4ba1IHtPxx98YAbDnWDTPXCBr0gU=;
 b=LPRy4PQB0dmLM5yGCM5KIFpPD0vE4VGlRp/BJhq5/SwY+Pxa/Yx7jt7C
 b3dxLiFrPHkMZOt1KSqaTZTqT5FIaL8JQ3ReiA1On+PiXc2RyST7hqg5B
 XOg0gd1IXp1Ozdq1PJAPybCEzjfY6bg7qTDvIZp+qNy8y0BNLp4Xhj7Zc
 MGHcDMsKOOiB+K+ngN/Bh0SlJ8rJDcy+cGse6qHQTMVOMggetUakdt8CO
 ZpNJJHVIPkYmk4ph51Kj2G7j7vZs3TKce4oZ0+182eXY28zM7RND7Gzp+
 3NnOJ3QAp8xX8xIdek8S3QpDM7cxYXGG8NIcV3+qCBZlmfxBNEkk1FjJB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343189649"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="343189649"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="713330969"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:49 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 9/9] drm/i915/rpm: d3cold Policy
Date: Thu, 16 Jun 2022 17:31:06 +0530
Message-Id: <20220616120106.24353-10-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220616120106.24353-1-anshuman.gupta@intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
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
Cc: tilak.tangudu@intel.com, tvrtko.ursulin@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>, jon.ewins@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add d3cold_sr_lmem_threshold modparam to choose between
d3cold-off zero watt and d3cold-VRAM Self Refresh.
i915 requires to evict the lmem objects to smem in order to
support d3cold-Off.

If gfx root port is not capable of sending PME from d3cold
then i915 don't need to program d3cold-off/d3cold-vram_sr
sequence.

FIXME: Eviction of lmem objects in case of D3Cold off is wip.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 27 ++++++++++++++++++++++++---
 drivers/gpu/drm/i915/i915_params.c |  4 ++++
 drivers/gpu/drm/i915/i915_params.h |  3 ++-
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index fcff5f3fe05e..aef4b17efdbe 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1560,15 +1560,36 @@ static int i915_pm_restore(struct device *kdev)
 static int intel_runtime_idle(struct device *kdev)
 {
 	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+	u64 lmem_total = to_gt(dev_priv)->lmem->total;
+	u64 lmem_avail = to_gt(dev_priv)->lmem->avail;
+	u64 lmem_used = lmem_total - lmem_avail;
+	struct pci_dev *root_pdev;
 	int ret = 1;
 
-	if (!HAS_LMEM_SR(dev_priv)) {
-		/*TODO: Prepare for D3Cold-Off */
+	root_pdev = pcie_find_root_port(pdev);
+	if (!root_pdev)
+		goto out;
+
+	if (!pci_pme_capable(root_pdev, PCI_D3cold))
 		goto out;
-	}
 
 	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
+	if (lmem_used < dev_priv->params.d3cold_sr_lmem_threshold  * 1024 * 1024) {
+		drm_dbg(&dev_priv->drm, "Prepare for D3Cold off\n");
+		pci_d3cold_enable(root_pdev);
+		/* FIXME: Eviction of lmem objects and guc reset is wip */
+		intel_pm_vram_sr(dev_priv, false);
+		enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
+		goto out;
+	} else if (!HAS_LMEM_SR(dev_priv)) {
+		/* Disable D3Cold to reduce the eviction latency */
+		pci_d3cold_disable(root_pdev);
+		enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
+		goto out;
+	}
+
 	ret = intel_pm_vram_sr(dev_priv, true);
 	if (!ret)
 		drm_dbg(&dev_priv->drm, "VRAM Self Refresh enabled\n");
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 701fbc98afa0..6c6b3c372d4d 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -197,6 +197,10 @@ i915_param_named(enable_gvt, bool, 0400,
 	"Enable support for Intel GVT-g graphics virtualization host support(default:false)");
 #endif
 
+i915_param_named_unsafe(d3cold_sr_lmem_threshold, int, 0400,
+	"Enable Vidoe RAM Self refresh when size of lmem is greater to this threshold. "
+	"It helps to optimize the suspend/resume latecy. (default: 300mb)");
+
 #if CONFIG_DRM_I915_REQUEST_TIMEOUT
 i915_param_named_unsafe(request_timeout_ms, uint, 0600,
 			"Default request/fence/batch buffer expiration timeout.");
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index b5e7ea45d191..28f20ebaf41f 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -83,7 +83,8 @@ struct drm_printer;
 	param(bool, verbose_state_checks, true, 0) \
 	param(bool, nuclear_pageflip, false, 0400) \
 	param(bool, enable_dp_mst, true, 0600) \
-	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
+	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0) \
+	param(int, d3cold_sr_lmem_threshold, 300, 0600) \
 
 #define MEMBER(T, member, ...) T member;
 struct i915_params {
-- 
2.26.2

