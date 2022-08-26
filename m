Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397395A293D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DE010E933;
	Fri, 26 Aug 2022 14:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB26D10E927;
 Fri, 26 Aug 2022 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661523590; x=1693059590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c+pXcbsPx/rMzdeWU+Wdyx39q2fdykDrG2BhCL1DuEc=;
 b=STkbRpvXHaTMiOGD9XMWc1s5ZzMyyJgVcSqzDqP3+giRok9DCStux6H9
 DslMZV2d/QKecqAOJxzXAFN7bZsR1OSUt+vzJlA+JofHjnQjgI0f5uydO
 ILsyOM5cG7yYIzcQp/E2MznmB1ncQGg1rSqk7Z3blebcgZoDCkxG3U/UB
 JiOYh0go1q/nP5p6J4uZWTRikOw9pDyhpQgRBZCAGA+GmYzArYAsWKeZW
 wL9blf9p/SdZgi8PocBdGeJRxR7KdGI0mMmFcunTgbBRizZvUHe/lWNcV
 6huXQpu9QLckZqAY/E3kSlbJeHcjMPRkVHIg5oYnlA8jtbq4qEFe7wBfP g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="281485729"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="281485729"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 07:19:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="587313659"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 07:19:47 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Imre Deak <imre.deak@intel.com>
Subject: [PATCH v7 1/3] drm/i915/hpd: suspend MST at the end of
 intel_modeset_driver_remove
Date: Fri, 26 Aug 2022 16:19:27 +0200
Message-Id: <20220826141929.189681-2-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826141929.189681-1-andrzej.hajda@intel.com>
References: <20220826141929.189681-1-andrzej.hajda@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a0f84cbe974fc3..524c4580ae6bc9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -9000,6 +9000,13 @@ void intel_modeset_driver_remove(struct drm_i915_private *i915)
 
 	flush_work(&i915->atomic_helper.free_work);
 	drm_WARN_ON(&i915->drm, !llist_empty(&i915->atomic_helper.free_list));
+
+	/*
+	 * MST topology needs to be suspended so we don't have any calls to
+	 * fbdev after it's finalized. MST will be destroyed later as part of
+	 * drm_mode_config_cleanup()
+	 */
+	intel_dp_mst_suspend(i915);
 }
 
 /* part #2: call after irq uninstall */
@@ -9014,13 +9021,6 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
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
 
-- 
2.25.1

