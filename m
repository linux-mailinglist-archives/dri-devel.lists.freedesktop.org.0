Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC62C6DD06
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFCC10E5C4;
	Wed, 19 Nov 2025 09:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDW5Ka2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BEB10E038;
 Wed, 19 Nov 2025 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763545622; x=1795081622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D7gnoA6XN1BAzrK8g+v2VbFkaVSefz2D5SB00zEFA1o=;
 b=GDW5Ka2yIfvomF96pEz6WKoupdw/+LHEI7iZSbrHQWJyVLZ5vLdrJb/m
 oYf7Cb1c+KrMnpKmKdBYqMDdCtebzprfOERBcUC1MLIGPA43/5zrsyB+I
 hSofR8nvtN+D62UwNINebQqo9cPKqRroq5HhhhHy6U00iowiCPRaupH2m
 B+vUrnphMAwM9S1tKjPICDCeE0nEG4+3zj0f5Hm9Tk4WKGCTXg8sq24re
 dXu6t7fZGj3qyW8N9aDblc9XbYddXqbRgCj7dt8jVdysB9Vz1Mn/zPVEU
 DBGLypTOojHANz/8nXyAtSYGTBriSZrx3ruxzr0qGuIocGe21Q56ziW/D g==;
X-CSE-ConnectionGUID: FNtlYi7fT4Cghikk3V57WA==
X-CSE-MsgGUID: RE3TbRFsTRah6gcBsE/S/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="77039209"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="77039209"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:47:01 -0800
X-CSE-ConnectionGUID: KmyDeXwSRmm+onoQJ5DniA==
X-CSE-MsgGUID: aTM+7yp9T9qd9AahYnOH2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="221918175"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2025 01:46:59 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, imre.deak@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2] drm/display/dp_mst: Add protection against 0 vcpi
Date: Wed, 19 Nov 2025 15:16:50 +0530
Message-Id: <20251119094650.799135-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113043918.716367-1-suraj.kandpal@intel.com>
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
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

When releasing a timeslot there is a slight chance we may end up
with the wrong payload mask due to overflow if the delayed_destroy_work
ends up coming into play after a DP 2.1 monitor gets disconnected
which causes vcpi to become 0 then we try to make the payload =
~BIT(vcpi - 1) which is a negative shift. VCPI id should never
really be 0 hence skip changing the payload mask if VCPI is 0.

Otherwise it leads to
<7> [515.287237] xe 0000:03:00.0: [drm:drm_dp_mst_get_port_malloc
[drm_display_helper]] port ffff888126ce9000 (3)
<4> [515.287267] -----------[ cut here ]-----------
<3> [515.287268] UBSAN: shift-out-of-bounds in
../drivers/gpu/drm/display/drm_dp_mst_topology.c:4575:36
<3> [515.287271] shift exponent -1 is negative
<4> [515.287275] CPU: 7 UID: 0 PID: 3108 Comm: kworker/u64:33 Tainted: G
S U 6.17.0-rc6-lgci-xe-xe-3795-3e79699fa1b216e92+ #1 PREEMPT(voluntary)
<4> [515.287279] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
<4> [515.287279] Hardware name: ASUS System Product Name/PRIME Z790-P
WIFI, BIOS 1645 03/15/2024
<4> [515.287281] Workqueue: drm_dp_mst_wq drm_dp_delayed_destroy_work
[drm_display_helper]
<4> [515.287303] Call Trace:
<4> [515.287304] <TASK>
<4> [515.287306] dump_stack_lvl+0xc1/0xf0
<4> [515.287313] dump_stack+0x10/0x20
<4> [515.287316] __ubsan_handle_shift_out_of_bounds+0x133/0x2e0
<4> [515.287324] ? drm_atomic_get_private_obj_state+0x186/0x1d0
<4> [515.287333] drm_dp_atomic_release_time_slots.cold+0x17/0x3d
[drm_display_helper]
<4> [515.287355] mst_connector_atomic_check+0x159/0x180 [xe]
<4> [515.287546] drm_atomic_helper_check_modeset+0x4d9/0xfa0
<4> [515.287550] ? __ww_mutex_lock.constprop.0+0x6f/0x1a60
<4> [515.287562] intel_atomic_check+0x119/0x2b80 [xe]
<4> [515.287740] ? find_held_lock+0x31/0x90
<4> [515.287747] ? lock_release+0xce/0x2a0
<4> [515.287754] drm_atomic_check_only+0x6a2/0xb40
<4> [515.287758] ? drm_atomic_add_affected_connectors+0x12b/0x140
<4> [515.287765] drm_atomic_commit+0x6e/0xf0
<4> [515.287766] ? _pfx__drm_printfn_info+0x10/0x10
<4> [515.287774] drm_client_modeset_commit_atomic+0x25c/0x2b0
<4> [515.287794] drm_client_modeset_commit_locked+0x60/0x1b0
<4> [515.287795] ? mutex_lock_nested+0x1b/0x30
<4> [515.287801] drm_client_modeset_commit+0x26/0x50
<4> [515.287804] __drm_fb_helper_restore_fbdev_mode_unlocked+0xdc/0x110
<4> [515.287810] drm_fb_helper_hotplug_event+0x120/0x140
<4> [515.287814] drm_fbdev_client_hotplug+0x28/0xd0
<4> [515.287819] drm_client_hotplug+0x6c/0xf0
<4> [515.287824] drm_client_dev_hotplug+0x9e/0xd0
<4> [515.287829] drm_kms_helper_hotplug_event+0x1a/0x30
<4> [515.287834] drm_dp_delayed_destroy_work+0x3df/0x410
[drm_display_helper]
<4> [515.287861] process_one_work+0x22b/0x6f0
<4> [515.287874] worker_thread+0x1e8/0x3d0
<4> [515.287879] ? __pfx_worker_thread+0x10/0x10
<4> [515.287882] kthread+0x11c/0x250
<4> [515.287886] ? __pfx_kthread+0x10/0x10
<4> [515.287890] ret_from_fork+0x2d7/0x310
<4> [515.287894] ? __pfx_kthread+0x10/0x10
<4> [515.287897] ret_from_fork_asm+0x1a/0x30

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6303
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
-Add the call trace and closes tag [Jani]
-Change payload mask only is vcpi > 0 [Imre]

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 64e5c176d5cc..be749dcad3b5 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4572,7 +4572,8 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 	if (!payload->delete) {
 		payload->pbn = 0;
 		payload->delete = true;
-		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
+		if (payload->vcpi > 0)
+			topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
 	}
 
 	return 0;
-- 
2.34.1

