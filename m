Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1566854E077
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E252311A4DA;
	Thu, 16 Jun 2022 12:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C9B11A4C3;
 Thu, 16 Jun 2022 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655380924; x=1686916924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n04pVspeYr1Z4PmeXjJUniNQCilqRGE2M2WlvMC4CqY=;
 b=P9e9HrxQpEu4mc9kUoEoByAS8nEnzNppMPBmAUTSc0woWqUG+3jRIvVv
 k4D5kwiyYPUmQvA3YoYfPyyyRsE27+QKFpkTkuGvK/ECLvIUdVazzUeze
 PeMenqTabPVHeoSa9cuBjSY19uq2UPKKDxi5K1+Etx/GOTTBJ3+cIkePg
 e5yxQed7w56k0eRGL6Xi6PqWG3d3ri9CDRKgVuoXeNC4lVdHM0tL03h3q
 mDobXCAN3RwRSblFnnd/wPnqpn0w48uiNfnbCgA+Th6ilO3ilp5DV7r50
 JAvWJM0HP/r4Ina0ggW0O64/d5y2bW64aeAI6wc3EcAN7PgnVdkUDmL3s w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343189623"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="343189623"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="713330941"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:42 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm/i915/rpm: Enable D3Cold VRAM SR Support
Date: Thu, 16 Jun 2022 17:31:04 +0530
Message-Id: <20220616120106.24353-8-anshuman.gupta@intel.com>
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
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, jon.ewins@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Intel Client DGFX card supports D3Cold with two option.
D3Cold-off zero watt, D3Cold-VRAM Self Refresh.

i915 requires to evict the lmem objects to smem in order to
support D3Cold-Off, which increases i915 the suspend/resume
latency. Enabling VRAM Self Refresh feature optimize the
latency with additional power cost which required to retain
the lmem.

Adding intel_runtime_idle (runtime_idle callback) to enable
VRAM_SR, it will be used for policy to choose
between D3Cold-off vs D3Cold-VRAM_SR.

Since we have introduced i915 runtime_idle callback.
It need to be warranted that Runtime PM Core invokes runtime_idle
callback when runtime usages count becomes zero. That requires
to use pm_runtime_put instead of pm_runtime_put_autosuspend.

TODO: GuC interface state save/restore.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c      | 26 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_runtime_pm.c |  3 +--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index aa1fb15b1f11..fcff5f3fe05e 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1557,6 +1557,31 @@ static int i915_pm_restore(struct device *kdev)
 	return i915_pm_resume(kdev);
 }
 
+static int intel_runtime_idle(struct device *kdev)
+{
+	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
+	int ret = 1;
+
+	if (!HAS_LMEM_SR(dev_priv)) {
+		/*TODO: Prepare for D3Cold-Off */
+		goto out;
+	}
+
+	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
+
+	ret = intel_pm_vram_sr(dev_priv, true);
+	if (!ret)
+		drm_dbg(&dev_priv->drm, "VRAM Self Refresh enabled\n");
+
+	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
+
+out:
+	pm_runtime_mark_last_busy(kdev);
+	pm_runtime_autosuspend(kdev);
+
+	return ret;
+}
+
 static int intel_runtime_suspend(struct device *kdev)
 {
 	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
@@ -1742,6 +1767,7 @@ const struct dev_pm_ops i915_pm_ops = {
 	.restore = i915_pm_restore,
 
 	/* S0ix (via runtime suspend) event handlers */
+	.runtime_idle = intel_runtime_idle,
 	.runtime_suspend = intel_runtime_suspend,
 	.runtime_resume = intel_runtime_resume,
 };
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 6ed5786bcd29..4dade7e8a795 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -492,8 +492,7 @@ static void __intel_runtime_pm_put(struct intel_runtime_pm *rpm,
 
 	intel_runtime_pm_release(rpm, wakelock);
 
-	pm_runtime_mark_last_busy(kdev);
-	pm_runtime_put_autosuspend(kdev);
+	pm_runtime_put(kdev);
 }
 
 /**
-- 
2.26.2

