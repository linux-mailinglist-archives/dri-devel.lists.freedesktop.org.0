Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293488DE00
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 13:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1E610FB25;
	Wed, 27 Mar 2024 12:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HJyLjCBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A7C10FB21
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 12:12:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE010614CD;
 Wed, 27 Mar 2024 12:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B15C433F1;
 Wed, 27 Mar 2024 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541568;
 bh=lQFseWQMaSBFFU/cXsnT1oOzritD5K929rARq/LMuMM=;
 h=From:To:Cc:Subject:Date:From;
 b=HJyLjCBxfx9+/gI6KKeXKIVTJM8YG4+5rstwwcOTFnGeMUkxefU9A6Sohmynre5na
 RjkVBaVrktCqt5zk6mBLbTeDCudri+gOvy3hcg0NOc2UdMsFZuD+ejkOJWPnqlEXhq
 rdE7+cxRskJ9eMWXqYuHOaaE42qasgPW+foowK3unuJy39UbzcdCEuHY3yBx8PPSxC
 iFKN4oQlGTI819v6oitU7WML5rpqqIyoTPmnQaRM8RBihp2eE0nfcrlklSj0fP24ZC
 k3o14ruOHe3qK6InqXCbx3XNbcJtybrGCw6jidS0Hz483CPUhYbY6RBhKc+cVQyzaJ
 /+/Lu01DoFu/Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	zack.rusin@broadcom.com
Cc: Stefan Hoffmeister <stefan.hoffmeister@econos.de>,
 Martin Krastev <martin.krastev@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Ian Forbes <ian.forbes@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/vmwgfx: Unmap the surface before resetting it on a
 plane state" failed to apply to 6.1-stable tree
Date: Wed, 27 Mar 2024 08:12:45 -0400
Message-ID: <20240327121246.2829773-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 27571c64f1855881753e6f33c3186573afbab7ba Mon Sep 17 00:00:00 2001
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Sun, 24 Dec 2023 00:25:40 -0500
Subject: [PATCH] drm/vmwgfx: Unmap the surface before resetting it on a plane
 state

Switch to a new plane state requires unreferencing of all held surfaces.
In the work required for mob cursors the mapped surfaces started being
cached but the variable indicating whether the surface is currently
mapped was not being reset. This leads to crashes as the duplicated
state, incorrectly, indicates the that surface is mapped even when
no surface is present. That's because after unreferencing the surface
it's perfectly possible for the plane to be backed by a bo instead of a
surface.

Reset the surface mapped flag when unreferencing the plane state surface
to fix null derefs in cleanup. Fixes crashes in KDE KWin 6.0 on Wayland:

Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 4 PID: 2533 Comm: kwin_wayland Not tainted 6.7.0-rc3-vmwgfx #2
Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
RIP: 0010:vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]
Code: 00 00 00 75 3a 48 83 c4 10 5b 5d c3 cc cc cc cc 48 8b b3 a8 00 00 00 48 c7 c7 99 90 43 c0 e8 93 c5 db ca 48 8b 83 a8 00 00 00 <48> 8b 78 28 e8 e3 f>
RSP: 0018:ffffb6b98216fa80 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff969d84cdcb00 RCX: 0000000000000027
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff969e75f21600
RBP: ffff969d4143dc50 R08: 0000000000000000 R09: ffffb6b98216f920
R10: 0000000000000003 R11: ffff969e7feb3b10 R12: 0000000000000000
R13: 0000000000000000 R14: 000000000000027b R15: ffff969d49c9fc00
FS:  00007f1e8f1b4180(0000) GS:ffff969e75f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000028 CR3: 0000000104006004 CR4: 00000000003706f0
Call Trace:
 <TASK>
 ? __die+0x23/0x70
 ? page_fault_oops+0x171/0x4e0
 ? exc_page_fault+0x7f/0x180
 ? asm_exc_page_fault+0x26/0x30
 ? vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]
 drm_atomic_helper_cleanup_planes+0x9b/0xc0
 commit_tail+0xd1/0x130
 drm_atomic_helper_commit+0x11a/0x140
 drm_atomic_commit+0x97/0xd0
 ? __pfx___drm_printfn_info+0x10/0x10
 drm_atomic_helper_update_plane+0xf5/0x160
 drm_mode_cursor_universal+0x10e/0x270
 drm_mode_cursor_common+0x102/0x230
 ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10
 drm_ioctl_kernel+0xb2/0x110
 drm_ioctl+0x26d/0x4b0
 ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10
 ? __pfx_drm_ioctl+0x10/0x10
 vmw_generic_ioctl+0xa4/0x110 [vmwgfx]
 __x64_sys_ioctl+0x94/0xd0
 do_syscall_64+0x61/0xe0
 ? __x64_sys_ioctl+0xaf/0xd0
 ? syscall_exit_to_user_mode+0x2b/0x40
 ? do_syscall_64+0x70/0xe0
 ? __x64_sys_ioctl+0xaf/0xd0
 ? syscall_exit_to_user_mode+0x2b/0x40
 ? do_syscall_64+0x70/0xe0
 ? exc_page_fault+0x7f/0x180
 entry_SYSCALL_64_after_hwframe+0x6e/0x76
RIP: 0033:0x7f1e93f279ed
Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff f>
RSP: 002b:00007ffca0faf600 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000055db876ed2c0 RCX: 00007f1e93f279ed
RDX: 00007ffca0faf6c0 RSI: 00000000c02464bb RDI: 0000000000000015
RBP: 00007ffca0faf650 R08: 000055db87184010 R09: 0000000000000007
R10: 000055db886471a0 R11: 0000000000000246 R12: 00007ffca0faf6c0
R13: 00000000c02464bb R14: 0000000000000015 R15: 00007ffca0faf790
 </TASK>
Modules linked in: snd_seq_dummy snd_hrtimer nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_ine>
CR2: 0000000000000028
---[ end trace 0000000000000000 ]---
RIP: 0010:vmw_du_cursor_plane_cleanup_fb+0x124/0x140 [vmwgfx]
Code: 00 00 00 75 3a 48 83 c4 10 5b 5d c3 cc cc cc cc 48 8b b3 a8 00 00 00 48 c7 c7 99 90 43 c0 e8 93 c5 db ca 48 8b 83 a8 00 00 00 <48> 8b 78 28 e8 e3 f>
RSP: 0018:ffffb6b98216fa80 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff969d84cdcb00 RCX: 0000000000000027
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff969e75f21600
RBP: ffff969d4143dc50 R08: 0000000000000000 R09: ffffb6b98216f920
R10: 0000000000000003 R11: ffff969e7feb3b10 R12: 0000000000000000
R13: 0000000000000000 R14: 000000000000027b R15: ffff969d49c9fc00
FS:  00007f1e8f1b4180(0000) GS:ffff969e75f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000028 CR3: 0000000104006004 CR4: 00000000003706f0

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 485d98d472d5 ("drm/vmwgfx: Add support for CursorMob and CursorBypass 4")
Reported-by: Stefan Hoffmeister <stefan.hoffmeister@econos.de>
Closes: https://gitlab.freedesktop.org/drm/misc/-/issues/34
Cc: Martin Krastev <martin.krastev@broadcom.com>
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: Ian Forbes <ian.forbes@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.19+
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231224052540.605040-1-zack.rusin@broadcom.com
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 5fd0ccaa0b41b..8589a1c3cc36b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -694,6 +694,10 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
 	int ret = 0;
 
 	if (vps->surf) {
+		if (vps->surf_mapped) {
+			vmw_bo_unmap(vps->surf->res.guest_memory_bo);
+			vps->surf_mapped = false;
+		}
 		vmw_surface_unreference(&vps->surf);
 		vps->surf = NULL;
 	}
-- 
2.43.0




