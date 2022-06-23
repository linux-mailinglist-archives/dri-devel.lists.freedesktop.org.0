Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED341558006
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 18:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8B410E320;
	Thu, 23 Jun 2022 16:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD75610E224;
 Thu, 23 Jun 2022 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656002311; x=1687538311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c9KBs6CpmSIdkuc+pgXYl1KqIAv7TkF7GQ4fZJ7jdEo=;
 b=cibzk5RawMhKBvmv6faT+b/lh2d7iRiSbcMKGeIlR96Up6IxeGtNc/8W
 tEY0f9fQAXzPB/k1xGQrOueHhlvEKRHunt0+CJB6G4PvU6ysgWw/gdf9/
 XP73jj3kvV4l/TFroPrdfg0Kw0LAyBAhJ+nNuWskW2cjX85Fk/nP3lMGf
 Fb0C1qaHMFYGwpSVU+nUGVbcwX660qaZ9eAgitt6iZAcVxKByHbJbXtKv
 WA7tmZ/FRRDHUwGKPfGmNlkvAZxdJcMXjyAW25HWxnryc62dxpMJkc6b7
 v1K23nlRPIdbZuKXMxbdkjqiRq1/tQHr0/oWbiyMMbs6b/4cVENgkHd8D w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="279538937"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="279538937"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 09:38:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; d="scan'208";a="915266410"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 09:38:29 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 2/2] drm/i915/fbdev: suspend HPD before fbdev unregistration
Date: Thu, 23 Jun 2022 18:38:13 +0200
Message-Id: <20220623163813.1990801-3-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623163813.1990801-1-andrzej.hajda@intel.com>
References: <20220623163813.1990801-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HPD event after fbdev unregistration can cause registration of deferred
fbdev which will not be unregistered later, causing use-after-free.
To avoid it HPD handling should be suspended before fbdev unregistration.

It should fix following GPF:
[272.634530] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b: 0000 [#1] PREEMPT SMP NOPTI
[272.634536] CPU: 0 PID: 6030 Comm: i915_selftest Tainted: G     U            5.18.0-rc5-CI_DRM_11603-g12dccf4f5eef+ #1
[272.634541] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.2397.A01.2109300731 09/30/2021
[272.634545] RIP: 0010:fb_do_apertures_overlap.part.14+0x26/0x60
...
[272.634582] Call Trace:
[272.634583]  <TASK>
[272.634585]  do_remove_conflicting_framebuffers+0x59/0xa0
[272.634589]  remove_conflicting_framebuffers+0x2d/0xc0
[272.634592]  remove_conflicting_pci_framebuffers+0xc8/0x110
[272.634595]  drm_aperture_remove_conflicting_pci_framebuffers+0x52/0x70
[272.634604]  i915_driver_probe+0x63a/0xdd0 [i915]

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5329
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5510
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 44 +++++++++++-----------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 221336178991f0..113d6a8d65c872 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -566,6 +566,27 @@ static void intel_fbdev_sync(struct intel_fbdev *ifbdev)
 	ifbdev->cookie = 0;
 }
 
+/* Suspends/resumes fbdev processing of incoming HPD events. When resuming HPD
+ * processing, fbdev will perform a full connector reprobe if a hotplug event
+ * was received while HPD was suspended.
+ */
+static void intel_fbdev_hpd_set_suspend(struct drm_i915_private *i915, int state)
+{
+	struct intel_fbdev *ifbdev = i915->fbdev;
+	bool send_hpd = false;
+
+	mutex_lock(&ifbdev->hpd_lock);
+	ifbdev->hpd_suspended = state == FBINFO_STATE_SUSPENDED;
+	send_hpd = !ifbdev->hpd_suspended && ifbdev->hpd_waiting;
+	ifbdev->hpd_waiting = false;
+	mutex_unlock(&ifbdev->hpd_lock);
+
+	if (send_hpd) {
+		drm_dbg_kms(&i915->drm, "Handling delayed fbcon HPD event\n");
+		drm_fb_helper_hotplug_event(&ifbdev->helper);
+	}
+}
+
 void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
 {
 	struct intel_fbdev *ifbdev = dev_priv->fbdev;
@@ -573,6 +594,8 @@ void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
 	if (!ifbdev)
 		return;
 
+	intel_fbdev_hpd_set_suspend(dev_priv, FBINFO_STATE_SUSPENDED);
+
 	cancel_work_sync(&dev_priv->fbdev_suspend_work);
 	if (!current_is_async())
 		intel_fbdev_sync(ifbdev);
@@ -590,27 +613,6 @@ void intel_fbdev_fini(struct drm_i915_private *dev_priv)
 	intel_fbdev_destroy(ifbdev);
 }
 
-/* Suspends/resumes fbdev processing of incoming HPD events. When resuming HPD
- * processing, fbdev will perform a full connector reprobe if a hotplug event
- * was received while HPD was suspended.
- */
-static void intel_fbdev_hpd_set_suspend(struct drm_i915_private *i915, int state)
-{
-	struct intel_fbdev *ifbdev = i915->fbdev;
-	bool send_hpd = false;
-
-	mutex_lock(&ifbdev->hpd_lock);
-	ifbdev->hpd_suspended = state == FBINFO_STATE_SUSPENDED;
-	send_hpd = !ifbdev->hpd_suspended && ifbdev->hpd_waiting;
-	ifbdev->hpd_waiting = false;
-	mutex_unlock(&ifbdev->hpd_lock);
-
-	if (send_hpd) {
-		drm_dbg_kms(&i915->drm, "Handling delayed fbcon HPD event\n");
-		drm_fb_helper_hotplug_event(&ifbdev->helper);
-	}
-}
-
 void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
-- 
2.25.1

