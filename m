Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B065B0682
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 16:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A3810E787;
	Wed,  7 Sep 2022 14:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECC810E786;
 Wed,  7 Sep 2022 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662560866; x=1694096866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C/0BgspO69Npume0XV7bCqu22fKI4mO/3lo+qpqVNUc=;
 b=FUb4Kiz0Fa+56or0Ym9SRWq4vy7dcGCWvFSm+jHdiGmO2ZH0l2tBvdYo
 rbMuYAfKkgvWLu3NR5tDDYh3K+alNNrtA+0uyI7lPc3RjjE3hxfm+jB2L
 lQB7OJPhqm/8YQK5WPv6SS785PQQw+1oxw1EnrBEOh61/avlFCdOtCfMd
 WaBV+Vvk6OwpNpN/vmGWk1s0aqCho6QzpYHbwLoGIi/CDVGUcjpl2DZ1M
 FZfv8jyEX28ptJ18/rk+kRuJkP2R/tI9K7Qa8uQwXYGSTj1Kprl3w0ui3
 2k5WSGW1o+8nq6Qy/A7UXJPQRqtXyq2zLy0Nk5009vjpkkwO4fcIxt9ZG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276625451"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="276625451"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 07:27:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; d="scan'208";a="565534311"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 07:27:44 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp_mst: Avoid deleting payloads for connectors staying
 enabled
Date: Wed,  7 Sep 2022 17:25:42 +0300
Message-Id: <20220907142542.1681994-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
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

When an MST connector stays enabled during a commit the connector's MST
state needs to be added to the atomic state, but the corresponding MST
payload allocation shouldn't be set for deletion; fix such modesets by
ensuring the above even if the connector was already enabled before the
modeset.

The issue led to the following:
[  761.992923] i915 0000:00:02.0: drm_WARN_ON(payload->delete)
[  761.992949] WARNING: CPU: 6 PID: 1401 at drivers/gpu/drm/display/drm_dp_mst_topology.c:4221 drm_dp_atomic_find_time_slots+0x236/0x280 [drm_display_helper]
[  761.992955] Modules linked in: snd_hda_intel i915 drm_buddy drm_display_helper drm_kms_helper ttm drm snd_hda_codec_hdmi snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core snd_pcm prime_numbers i2c_algo_bit syscopyarea sysfillrect sysimgblt fb_sys_fops x86_pkg_temp_thermal cdc_ether coretemp crct10dif_pclmul usbnet crc32_pclmul mii ghash_clmulni_intel e1000e mei_me ptp i2c_i801 pps_core mei i2c_smbus intel_lpss_pci fuse [last unloaded: drm]
[  761.992986] CPU: 6 PID: 1401 Comm: testdisplay Tainted: G     U             6.0.0-rc4-imre+ #565
[  761.992989] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.3135.A00.2203251419 03/25/2022
[  761.992990] RIP: 0010:drm_dp_atomic_find_time_slots+0x236/0x280 [drm_display_helper]
[  761.992994] Code: 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 03 28 4e e1 48 c7 c1 8b 26 2c a0 4c 89 e2 48 c7 c7 a8 26 2c a0 48 89 c6 e8 31 d5 88 e1 <0f> 0b 49 8b 85 d0 00 00 00 4c 89 fa 48 c7 c6 a0 41 2c a0 48 8b 78
[  761.992995] RSP: 0018:ffffc9000177ba60 EFLAGS: 00010286
[  761.992998] RAX: 0000000000000000 RBX: ffff88810d2f1540 RCX: 0000000000000000
[  761.992999] RDX: 0000000000000001 RSI: ffffffff82368a25 RDI: 00000000ffffffff
[  761.993000] RBP: ffff888142299d80 R08: ffff8884adbfdfe8 R09: 00000000ffefffff
[  761.993001] R10: ffff8884a6bfe000 R11: ffff8884ac443c30 R12: ffff888102972f90
[  761.993002] R13: ffff8881163e2cf0 R14: 00000000000003ac R15: ffff88810c501000
[  761.993003] FS:  00007f81e4c459c0(0000) GS:ffff888496500000(0000) knlGS:0000000000000000
[  761.993004] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  761.993005] CR2: 0000555dac962a98 CR3: 0000000123a34006 CR4: 0000000000770ee0
[  761.993006] PKRU: 55555554
[  761.993007] Call Trace:
[  761.993009]  <TASK>
[  761.993012]  intel_dp_mst_compute_config+0x19a/0x350 [i915]
[  761.993090]  intel_atomic_check+0xf37/0x3180 [i915]
[  761.993168]  drm_atomic_check_only+0x5d3/0xa60 [drm]
[  761.993182]  drm_atomic_commit+0x56/0xc0 [drm]
[  761.993192]  ? drm_plane_get_damage_clips.cold+0x1c/0x1c [drm]
[  761.993204]  drm_atomic_helper_set_config+0x78/0xc0 [drm_kms_helper]
[  761.993214]  drm_mode_setcrtc+0x1ed/0x750 [drm]
[  761.993232]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[  761.993241]  drm_ioctl_kernel+0xb5/0x150 [drm]
[  761.993252]  drm_ioctl+0x203/0x3d0 [drm]
[  761.993261]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[  761.993276]  __x64_sys_ioctl+0x8a/0xb0
[  761.993281]  do_syscall_64+0x38/0x90
[  761.993285]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  761.993287] RIP: 0033:0x7f81e551aaff
[  761.993288] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
[  761.993290] RSP: 002b:00007fff4304af10 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  761.993292] RAX: ffffffffffffffda RBX: 00007fff4304afa0 RCX: 00007f81e551aaff
[  761.993293] RDX: 00007fff4304afa0 RSI: 00000000c06864a2 RDI: 0000000000000004
[  761.993294] RBP: 00000000c06864a2 R08: 0000000000000000 R09: 0000555dac8a9c68
[  761.993294] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000008c4
[  761.993295] R13: 0000000000000004 R14: 0000555dac8a9c68 R15: 00007fff4304b098
[  761.993301]  </TASK>

Fixes: 083351e96386 ("drm/display/dp_mst: Fix modeset tracking in drm_dp_atomic_release_vcpi_slots()")
Testcase: igt@testdisplay
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 1de438151cc39..4442cc5602d45 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4322,6 +4322,9 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 		return -EINVAL;
 	}
 
+	if (new_conn_state->crtc)
+		return 0;
+
 	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, payload->time_slots);
 	if (!payload->delete) {
 		drm_dp_mst_put_port_malloc(port);
-- 
2.37.1

