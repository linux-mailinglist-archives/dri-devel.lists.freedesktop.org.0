Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292FE79F506
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 00:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF59110E119;
	Wed, 13 Sep 2023 22:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFA810E119;
 Wed, 13 Sep 2023 22:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694644321; x=1726180321;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vgDiEjXTUgd+lmcLrs/MFU/iBuVGupz2roP6NYIvgaw=;
 b=Usx+PIxh0uXtaJJsRNQGbC8UqpDzjSfXhYGa1K4ih1gftwm1XKZdA5o2
 VMbTlQSLphHd0wdAlM3aEQ1pcZDMECQ7tqjhj2nw12gyHTS1f3I8etiTT
 YxyGeli7UrrseCOcDtXhOlXC7/Pt6MyVD2DbOBH4dro70HPUEaQRC7JWe
 PHe6lFsq4jfFgy0Hz4M32B68PDEFQwZQrQkzexkBfY8+71PTtgzfolQzE
 bZD/ScyUNxLnCXUNmKbvNfQnVwCb67n/KFbQTzilKVdgH7KATeazlefI7
 KATudDXiZIHtxtqjiJfcap+Y/KRlQ3ybKyISFGlYv6VvgsEPO/X3fBvd+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442828850"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="442828850"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="991138897"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="991138897"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:31:57 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/dp_mst: Fix NULL dereference during payload addition
Date: Thu, 14 Sep 2023 01:32:15 +0300
Message-Id: <20230913223218.540365-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the NULL dereference leading to the following stack trace:

[  129.687181] i915 0000:00:02.0: [drm:drm_dp_add_payload_part1 [drm_display_helper]] VCPI 1 for port 000000005be4423e not in topology, not creating a payload to remote
[  129.687257] BUG: kernel NULL pointer dereference, address: 0000000000000560
[  129.694276] #PF: supervisor read access in kernel mode
[  129.699459] #PF: error_code(0x0000) - not-present page
[  129.704612] PGD 0 P4D 0
[  129.707178] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  129.711556] CPU: 2 PID: 1623 Comm: Xorg Tainted: G     U             6.6.0-rc1-imre+ #985
[  129.719744] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
[  129.732509] RIP: 0010:drm_dp_mst_topology_put_port+0x19/0x170 [drm_display_helper]
[  129.740111] Code: 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 41 54 53 48 89 fb 48 83 ec 08 <48> 8b 87 60 05 00 00 44 8b 0f 48 8b 70 58 41 83 e9 01 48 85 f6 74
[  129.758842] RSP: 0018:ffffc90001daf900 EFLAGS: 00010286
[  129.764104] RAX: 0000000000000001 RBX: 0000000000000000 RCX: 0000000000000000
[  129.771246] RDX: 0000000000000000 RSI: ffffffff9e73d613 RDI: 0000000000000000
[  129.778394] RBP: ffffc90001daf930 R08: 0000000000000000 R09: 0000000000000020
[  129.785533] R10: 0000000000ffff10 R11: 000000000000000f R12: ffff888116c65e40
[  129.792680] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  129.799822] FS:  00007f39f74b1a80(0000) GS:ffff88840f680000(0000) knlGS:0000000000000000
[  129.807913] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  129.813670] CR2: 0000000000000560 CR3: 0000000138b88000 CR4: 0000000000750ee0
[  129.820815] PKRU: 55555554
[  129.823551] Call Trace:
[  129.826022]  <TASK>
[  129.828154]  ? show_regs+0x65/0x70
[  129.831599]  ? __die+0x24/0x70
[  129.834683]  ? page_fault_oops+0x160/0x480
[  129.838824]  ? dev_printk_emit+0x83/0xb0
[  129.842797]  ? do_user_addr_fault+0x2e2/0x680
[  129.847175]  ? exc_page_fault+0x78/0x180
[  129.851143]  ? asm_exc_page_fault+0x27/0x30
[  129.855353]  ? drm_dp_mst_topology_put_port+0x19/0x170 [drm_display_helper]
[  129.862354]  drm_dp_add_payload_part1+0x85/0x100 [drm_display_helper]
[  129.868832]  intel_mst_pre_enable_dp+0x1ef/0x240 [i915]
[  129.874170]  intel_encoders_pre_enable+0x83/0xa0 [i915]
[  129.879524]  hsw_crtc_enable+0xbe/0x750 [i915]
[  129.884095]  intel_enable_crtc+0x68/0xa0 [i915]
[  129.888752]  skl_commit_modeset_enables+0x2c4/0x5d0 [i915]
[  129.894365]  intel_atomic_commit_tail+0x765/0x1070 [i915]
[  129.899885]  intel_atomic_commit+0x3ba/0x400 [i915]
[  129.904892]  drm_atomic_commit+0x96/0xd0 [drm]
[  129.909405]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
[  129.914698]  drm_atomic_helper_set_config+0x7e/0xc0 [drm_kms_helper]
[  129.921102]  drm_mode_setcrtc+0x5af/0x8d0 [drm]
[  129.925695]  ? __pfx_drm_mode_setcrtc+0x10/0x10 [drm]
[  129.930810]  drm_ioctl_kernel+0xc4/0x170 [drm]
[  129.935317]  drm_ioctl+0x2a4/0x520 [drm]
[  129.939305]  ? __pfx_drm_mode_setcrtc+0x10/0x10 [drm]
[  129.944415]  ? __fget_light+0xa5/0x110
[  129.948212]  __x64_sys_ioctl+0x98/0xd0
[  129.951985]  do_syscall_64+0x37/0x90
[  129.955581]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8

Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index e04f87ff755ac..5f90860d49c34 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3341,7 +3341,8 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 		(!allocate || ret < 0) ? DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL :
 								DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;
 
-	drm_dp_mst_topology_put_port(port);
+	if (port)
+		drm_dp_mst_topology_put_port(port);
 
 	return ret;
 }
-- 
2.37.2

