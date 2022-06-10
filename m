Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EC546A05
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 18:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1987C10EA8E;
	Fri, 10 Jun 2022 16:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F40710EA8E;
 Fri, 10 Jun 2022 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654876846; x=1686412846;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e7zT0w0bvK73SEhsR8Yd3/o70Ga7bdeEjnnNaQxQbvQ=;
 b=XIWa4EGfGzaSGWBfZhMRY5FPCISTNaoo4D+LQHKM+5IpzJvqWSkyQk0V
 L5TWNfIhNC0EJj+7fxRFcNnJ38WISlFJh10zbope1+IlCQoEVvw7+Lytc
 O7H9/dsyM86P0BEUv7nrLObUd5wlYB/4LK3wVZxjDgyDQlj7VmDpfHkYk
 +I2ejIwE5WF7p7HP1H0T0TG9t67meOUbp57BN9in6t2DBXignt8UiGOvp
 uGjeGN/1hTI4Po9GkzO8VhTsqcW5feo1/9w7tvc8d9eIP1FBDdNnGRkTL
 eHsq2Auhror+Rz9H61ep3I1zApJAZTDJhDEYnIz+s4tEncpb60Lb5Tyfw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="363995942"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="363995942"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 09:00:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="638192641"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 09:00:43 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7] drm/i915/display: disable HPD workers before display
 driver unregister
Date: Fri, 10 Jun 2022 18:00:24 +0200
Message-Id: <20220610160024.903701-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handling HPD during driver removal is pointless, and can cause different
use-after-free/concurrency issues:
1. Setup of deferred fbdev after fbdev unregistration.
2. Access to DP-AUX after DP-AUX removal.

Below stacktraces of both cases observed on CI:

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

[283.405824] cpu_latency_qos_update_request called for unknown object
[283.405866] WARNING: CPU: 2 PID: 240 at kernel/power/qos.c:296 cpu_latency_qos_update_request+0x2d/0x100
[283.405912] CPU: 2 PID: 240 Comm: kworker/u64:9 Not tainted 5.18.0-rc6-Patchwork_103738v3-g1672d1c43e43+ #1
[283.405915] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.2397.A01.2109300731 09/30/2021
[283.405916] Workqueue: i915-dp i915_digport_work_func [i915]
[283.406020] RIP: 0010:cpu_latency_qos_update_request+0x2d/0x100
...
[283.406040] Call Trace:
[283.406041]  <TASK>
[283.406044]  intel_dp_aux_xfer+0x60e/0x8e0 [i915]
[283.406131]  ? finish_swait+0x80/0x80
[283.406139]  intel_dp_aux_transfer+0xc5/0x2b0 [i915]
[283.406218]  drm_dp_dpcd_access+0x79/0x130 [drm_display_helper]
[283.406227]  drm_dp_dpcd_read+0xe2/0xf0 [drm_display_helper]
[283.406233]  intel_dp_hpd_pulse+0x134/0x570 [i915]
[283.406308]  ? __down_killable+0x70/0x140
[283.406313]  i915_digport_work_func+0xba/0x150 [i915]

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Hi All,

I am not sure about changes in shutdown path, any comments welcome.
I suspect suspend path have also some common bits, but I am little
bit afraid of touching it.

Changes:
v1 - v6:
    - chasing the bug appearing only on public CI.
v7:
    - shutdown path adjusted (suggested by Jani)

Regards
Andrzej
---
 drivers/gpu/drm/i915/display/intel_display.c | 11 ++++-------
 drivers/gpu/drm/i915/i915_driver.c           |  5 ++---
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 186b37925d23f2..f9952ee8289fb2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10490,13 +10490,6 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
 	 */
 	intel_hpd_poll_fini(i915);
 
-	/*
-	 * MST topology needs to be suspended so we don't have any calls to
-	 * fbdev after it's finalized. MST will be destroyed later as part of
-	 * drm_mode_config_cleanup()
-	 */
-	intel_dp_mst_suspend(i915);
-
 	/* poll work can call into fbdev, hence clean that up afterwards */
 	intel_fbdev_fini(i915);
 
@@ -10588,6 +10581,10 @@ void intel_display_driver_unregister(struct drm_i915_private *i915)
 	if (!HAS_DISPLAY(i915))
 		return;
 
+	intel_dp_mst_suspend(i915);
+	intel_hpd_cancel_work(i915);
+	drm_kms_helper_poll_disable(&i915->drm);
+
 	intel_fbdev_unregister(i915);
 	intel_audio_deinit(i915);
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d26dcca7e654aa..82cdccf072e2bc 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1070,15 +1070,14 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
 	i915_gem_suspend(i915);
 
 	if (HAS_DISPLAY(i915)) {
+		intel_dp_mst_suspend(i915);
+		intel_hpd_cancel_work(i915);
 		drm_kms_helper_poll_disable(&i915->drm);
 
 		drm_atomic_helper_shutdown(&i915->drm);
 	}
 
-	intel_dp_mst_suspend(i915);
-
 	intel_runtime_pm_disable_interrupts(i915);
-	intel_hpd_cancel_work(i915);
 
 	intel_suspend_encoders(i915);
 	intel_shutdown_encoders(i915);
-- 
2.25.1

