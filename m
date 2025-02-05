Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B4A28B32
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 14:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0103E10E161;
	Wed,  5 Feb 2025 13:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="D2z9uaGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A65510E161;
 Wed,  5 Feb 2025 13:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jVmUkPbt3zvCMkUUqNmKPtRcG1+s+WzT7PxusitKQqo=; b=D2z9uaGj20pleMWRSST0wxA3qq
 W9+0pKF+IEk6RIkYRdaqzXNKAd73jVHIdVqNWCeBjSBtQ768fM2v3ooxlYtV6ArtlMwn+XYv/TXyT
 5M5WhcidIGsly5yXjB18BZDjer+lpNGEd2ldllcnRG0ML8eas1qkuI29lpPyPFDxsMkVSvjVFDY4A
 ZQW3+yxI9K3mak9t+cbYA/SDUNC1qYBLSFCLl2JrxVVXI8WytRGdrbRq60uGlnpFO8l8BvW36Pyvp
 dOkJ2RBti36484nlqfh2ewMFx8saWEbW84VGC12iTB+EylqwvUpnGg5RKsHh7clk4BmtRvRiG9jrf
 VO9ssb1A==;
Received: from 179-125-64-239-dinamico.pombonet.net.br ([179.125.64.239]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tff7G-003yER-T3; Wed, 05 Feb 2025 14:07:00 +0100
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Wed, 05 Feb 2025 10:06:38 -0300
Subject: [PATCH] drm/amd/display: avoid NPD when ASIC does not support DMUB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-amdgpu-dmub-v1-1-88151fe565d8@igalia.com>
X-B4-Tracking: v=1; b=H4sIAF1io2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNT3cTclPSCUt2U3NIkXeO0ZCPTRIOkZDOLVCWgjoKi1LTMCrBp0bG
 1tQCctVNeXQAAAA==
X-Change-ID: 20250205-amdgpu-dmub-3fc25a0bc68e
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tom Chung <chiahsuan.chung@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, stable@vger.kernel.org, 
 Daniel Wheeler <daniel.wheeler@amd.com>
X-Mailer: b4 0.14.2
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

ctx->dmub_srv will de NULL if the ASIC does not support DMUB, which is
tested in dm_dmub_sw_init.

However, it will be dereferenced in dmub_hw_lock_mgr_cmd if
should_use_dmub_lock returns true.

This has been the case since dmub support has been added for PSR1.

Fix this by checking for dmub_srv in should_use_dmub_lock.

[   37.440832] BUG: kernel NULL pointer dereference, address: 0000000000000058
[   37.447808] #PF: supervisor read access in kernel mode
[   37.452959] #PF: error_code(0x0000) - not-present page
[   37.458112] PGD 0 P4D 0
[   37.460662] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[   37.465553] CPU: 2 UID: 1000 PID: 1745 Comm: DrmThread Not tainted 6.14.0-rc1-00003-gd62e938120f0 #23 99720e1cb1e0fc4773b8513150932a07de3c6e88
[   37.478324] Hardware name: Google Morphius/Morphius, BIOS Google_Morphius.13434.858.0 10/26/2023
[   37.487103] RIP: 0010:dmub_hw_lock_mgr_cmd+0x77/0xb0
[   37.492074] Code: 44 24 0e 00 00 00 00 48 c7 04 24 45 00 00 0c 40 88 74 24 0d 0f b6 02 88 44 24 0c 8b 01 89 44 24 08 85 f6 75 05 c6 44 24 0e 01 <48> 8b 7f 58 48 89 e6 ba 01 00 00 00 e8 08 3c 2a 00 65 48 8b 04 5
[   37.510822] RSP: 0018:ffff969442853300 EFLAGS: 00010202
[   37.516052] RAX: 0000000000000000 RBX: ffff92db03000000 RCX: ffff969442853358
[   37.523185] RDX: ffff969442853368 RSI: 0000000000000001 RDI: 0000000000000000
[   37.530322] RBP: 0000000000000001 R08: 00000000000004a7 R09: 00000000000004a5
[   37.537453] R10: 0000000000000476 R11: 0000000000000062 R12: ffff92db0ade8000
[   37.544589] R13: ffff92da01180ae0 R14: ffff92da011802a8 R15: ffff92db03000000
[   37.551725] FS:  0000784a9cdfc6c0(0000) GS:ffff92db2af00000(0000) knlGS:0000000000000000
[   37.559814] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   37.565562] CR2: 0000000000000058 CR3: 0000000112b1c000 CR4: 00000000003506f0
[   37.572697] Call Trace:
[   37.575152]  <TASK>
[   37.577258]  ? __die_body+0x66/0xb0
[   37.580756]  ? page_fault_oops+0x3e7/0x4a0
[   37.584861]  ? exc_page_fault+0x3e/0xe0
[   37.588706]  ? exc_page_fault+0x5c/0xe0
[   37.592550]  ? asm_exc_page_fault+0x22/0x30
[   37.596742]  ? dmub_hw_lock_mgr_cmd+0x77/0xb0
[   37.601107]  dcn10_cursor_lock+0x1e1/0x240
[   37.605211]  program_cursor_attributes+0x81/0x190
[   37.609923]  commit_planes_for_stream+0x998/0x1ef0
[   37.614722]  update_planes_and_stream_v2+0x41e/0x5c0
[   37.619703]  dc_update_planes_and_stream+0x78/0x140
[   37.624588]  amdgpu_dm_atomic_commit_tail+0x4362/0x49f0
[   37.629832]  ? srso_return_thunk+0x5/0x5f
[   37.633847]  ? mark_held_locks+0x6d/0xd0
[   37.637774]  ? _raw_spin_unlock_irq+0x24/0x50
[   37.642135]  ? srso_return_thunk+0x5/0x5f
[   37.646148]  ? lockdep_hardirqs_on+0x95/0x150
[   37.650510]  ? srso_return_thunk+0x5/0x5f
[   37.654522]  ? _raw_spin_unlock_irq+0x2f/0x50
[   37.658883]  ? srso_return_thunk+0x5/0x5f
[   37.662897]  ? wait_for_common+0x186/0x1c0
[   37.666998]  ? srso_return_thunk+0x5/0x5f
[   37.671009]  ? drm_crtc_next_vblank_start+0xc3/0x170
[   37.675983]  commit_tail+0xf5/0x1c0
[   37.679478]  drm_atomic_helper_commit+0x2a2/0x2b0
[   37.684186]  drm_atomic_commit+0xd6/0x100
[   37.688199]  ? __cfi___drm_printfn_info+0x10/0x10
[   37.692911]  drm_atomic_helper_update_plane+0xe5/0x130
[   37.698054]  drm_mode_cursor_common+0x501/0x670
[   37.702600]  ? __cfi_drm_mode_cursor_ioctl+0x10/0x10
[   37.707572]  drm_mode_cursor_ioctl+0x48/0x70
[   37.711851]  drm_ioctl_kernel+0xf2/0x150
[   37.715781]  drm_ioctl+0x363/0x590
[   37.719189]  ? __cfi_drm_mode_cursor_ioctl+0x10/0x10
[   37.724165]  amdgpu_drm_ioctl+0x41/0x80
[   37.728013]  __se_sys_ioctl+0x7f/0xd0
[   37.731685]  do_syscall_64+0x87/0x100
[   37.735355]  ? vma_end_read+0x12/0xe0
[   37.739024]  ? srso_return_thunk+0x5/0x5f
[   37.743041]  ? find_held_lock+0x47/0xf0
[   37.746884]  ? vma_end_read+0x12/0xe0
[   37.750552]  ? srso_return_thunk+0x5/0x5f
[   37.754565]  ? lock_release+0x1c4/0x2e0
[   37.758406]  ? vma_end_read+0x12/0xe0
[   37.762079]  ? exc_page_fault+0x84/0xe0
[   37.765921]  ? srso_return_thunk+0x5/0x5f
[   37.769938]  ? lockdep_hardirqs_on+0x95/0x150
[   37.774303]  ? srso_return_thunk+0x5/0x5f
[   37.778317]  ? exc_page_fault+0x84/0xe0
[   37.782163]  entry_SYSCALL_64_after_hwframe+0x55/0x5d
[   37.787218] RIP: 0033:0x784aa5ec3059
[   37.790803] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1d 48 8b 45 c8 64 48 2b 04 25 28 00 0
[   37.809553] RSP: 002b:0000784a9cdf90e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   37.817121] RAX: ffffffffffffffda RBX: 0000784a9cdf917c RCX: 0000784aa5ec3059
[   37.824256] RDX: 0000784a9cdf917c RSI: 00000000c01c64a3 RDI: 0000000000000020
[   37.831391] RBP: 0000784a9cdf9130 R08: 0000000000000100 R09: 0000000000ff0000
[   37.838525] R10: 0000000000000000 R11: 0000000000000246 R12: 0000025c01606ed0
[   37.845657] R13: 0000025c00030200 R14: 00000000c01c64a3 R15: 0000000000000020
[   37.852799]  </TASK>
[   37.854992] Modules linked in:
[   37.864546] gsmi: Log Shutdown Reason 0x03
[   37.868656] CR2: 0000000000000058
[   37.871979] ---[ end trace 0000000000000000 ]---
[   37.880976] RIP: 0010:dmub_hw_lock_mgr_cmd+0x77/0xb0
[   37.885954] Code: 44 24 0e 00 00 00 00 48 c7 04 24 45 00 00 0c 40 88 74 24 0d 0f b6 02 88 44 24 0c 8b 01 89 44 24 08 85 f6 75 05 c6 44 24 0e 01 <48> 8b 7f 58 48 89 e6 ba 01 00 00 00 e8 08 3c 2a 00 65 48 8b 04 5
[   37.904703] RSP: 0018:ffff969442853300 EFLAGS: 00010202
[   37.909933] RAX: 0000000000000000 RBX: ffff92db03000000 RCX: ffff969442853358
[   37.917068] RDX: ffff969442853368 RSI: 0000000000000001 RDI: 0000000000000000
[   37.924201] RBP: 0000000000000001 R08: 00000000000004a7 R09: 00000000000004a5
[   37.931336] R10: 0000000000000476 R11: 0000000000000062 R12: ffff92db0ade8000
[   37.938469] R13: ffff92da01180ae0 R14: ffff92da011802a8 R15: ffff92db03000000
[   37.945602] FS:  0000784a9cdfc6c0(0000) GS:ffff92db2af00000(0000) knlGS:0000000000000000
[   37.953689] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   37.959435] CR2: 0000000000000058 CR3: 0000000112b1c000 CR4: 00000000003506f0
[   37.966570] Kernel panic - not syncing: Fatal exception
[   37.971901] Kernel Offset: 0x30200000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[   37.982840] gsmi: Log Shutdown Reason 0x02

Fixes: b5c764d6ed55 ("drm/amd/display: Use HW lock mgr for PSR1")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: stable@vger.kernel.org
Cc: Sun peng Li <sunpeng.li@amd.com>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Cc: Daniel Wheeler <daniel.wheeler@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
index 5bb8b78bf250a0e56c3e99ce7c99ed7f70c8f0f6..eef817a4c580aca2ebc7fb1b77cfc0377d477bdc 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
@@ -63,6 +63,9 @@ void dmub_hw_lock_mgr_inbox0_cmd(struct dc_dmub_srv *dmub_srv,
 
 bool should_use_dmub_lock(struct dc_link *link)
 {
+	/* ASIC doesn't support DMUB */
+	if (!link->ctx->dmub_srv)
+		return false;
 	if (link->psr_settings.psr_version == DC_PSR_VERSION_SU_1 ||
 	    link->psr_settings.psr_version == DC_PSR_VERSION_1)
 		return true;

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250205-amdgpu-dmub-3fc25a0bc68e

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

