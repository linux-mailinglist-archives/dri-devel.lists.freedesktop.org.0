Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D6573A08
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 17:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC71199428;
	Wed, 13 Jul 2022 15:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3C099469;
 Wed, 13 Jul 2022 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657725858; x=1689261858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1QhT6jQXOf5LANxgn9whzxYWaxnwk7I0tnGhga3K4lI=;
 b=dwBViIaDevxFOuaO0Qtp5di21/DPG4chXxsq6+h9EdTXL1AI10lFojMF
 3VBX3rjOfWEbtALrNt0Nbi0bQxP+PaTLW5BStLUwdWWqtJ/b48Hs2UUt/
 CxiMCBybD9TC1YfS5+3WYRYdZArdby409BWdC+yipm3lL1sTeLtE/UWQu
 RyIRSbkrXiwaiS8HdT+dOokIvGn8rBAIC24ulavgalL3fEmLD9NWMDnRw
 Pn18RGPtCU6vVztRr99iNw85YuPpq1X2YM3ccZCCGAKkuF83/kaFJOJnj
 DMbeKL0aOcQwH44kPZcaVFZtJMG5/020yA/pY/5l1EVM9iXyZkO7leUc8 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="310880956"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="310880956"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 08:20:32 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="922669067"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 08:20:30 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v3 1/3] drm/i915/hpd: postpone HPD cancel work after last user
 suspension
Date: Wed, 13 Jul 2022 17:20:17 +0200
Message-Id: <20220713152019.343432-2-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713152019.343432-1-andrzej.hajda@intel.com>
References: <20220713152019.343432-1-andrzej.hajda@intel.com>
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

i915->hotplug.dig_port_work can be queued from intel_hpd_irq_handler
called by IRQ handler or by intel_hpd_trigger_irq called from dp_mst.
Since dp_mst is suspended after irq handler uninstall, a cleaner approach
is to cancel hpd work after intel_dp_mst_suspend, otherwise we risk
use-after-free.

It should fix following WARNINGS:
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

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4586
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5558
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 drivers/gpu/drm/i915/i915_irq.c              | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 903226e2a6260d..ec8e59b3adaea7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -9007,6 +9007,9 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
 	 */
 	intel_dp_mst_suspend(i915);
 
+	/* MST is the last user of HPD work */
+	intel_hpd_cancel_work(i915);
+
 	/* poll work can call into fbdev, hence clean that up afterwards */
 	intel_fbdev_fini(i915);
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 73cebc6aa65072..db14787aef95dd 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -4597,7 +4597,6 @@ void intel_irq_uninstall(struct drm_i915_private *dev_priv)
 
 	free_irq(irq, dev_priv);
 
-	intel_hpd_cancel_work(dev_priv);
 	dev_priv->runtime_pm.irqs_enabled = false;
 }
 
-- 
2.25.1

