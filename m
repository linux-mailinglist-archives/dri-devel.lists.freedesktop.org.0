Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070D74DE031
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C537C10E1F6;
	Fri, 18 Mar 2022 17:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A32C10E1F6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:43:57 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id A1CDD289343;
 Fri, 18 Mar 2022 17:43:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1647625436; bh=k49dft/RIM15L37VzMx4R3RaizhKfy3rr5/8GnkwFT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ypj2pEVR2X8g68mnTWAXGniEKYItAdi6ksmRjTpALxw58EQ9XA6rVqXdoAs6PK3Oj
 S3/PgFoonJ7INncl00bkfijtEISeE55umf3trj8XZk9IB9zfYG6cc0jK0gfU4ykptZ
 Knvo7hCFNw4mC8xBZxzHarosMAUChdst8syokwwgAzxFYy0V4vTQ0gOaeYV/wRBuLb
 eXxrvfThIW7aihZrsmVjFsisKAl8uGSKhEAOgnzhEgk/DJ3gAOSuytKzH2xUEq1yr7
 WtSfhJIe1MkpZc4lovcIGUkkn0fONE42Z8S7rvJ/eMQkZAA9Wi7lUJkdQM3lL/7+Sz
 pV65Johsb+uFA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/ttm: Fix a kernel oops due to an invalid read
Date: Fri, 18 Mar 2022 13:43:32 -0400
Message-Id: <20220318174332.440068-6-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318174332.440068-1-zack@kde.org>
References: <20220318174332.440068-1-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, krastevm@vmware.com,
 mombasawalam@vmware.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

The res is initialized here only if there's no errors so passing it to
ttm_resource_fini in the error paths results in a kernel oops. In the
error paths, instead of the unitialized res, we have to use to use
node->base on which ttm_resource_init was called.

Sample affected backtrace:
Unable to handle kernel NULL pointer dereference at virtual address 00000000000000d8
 Mem abort info:
   ESR = 0x96000004
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x04: level 0 translation fault
 Data abort info:
   ISV = 0, ISS = 0x00000004
   CM = 0, WnR = 0
 user pgtable: 4k pages, 48-bit VAs, pgdp=0000000106ac0000
 [00000000000000d8] pgd=0000000000000000, p4d=0000000000000000
 Internal error: Oops: 96000004 [#1] SMP
 Modules linked in: bnep vsock_loopback vmw_vsock_virtio_transport_common
 vsock snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_hda_codec
 snd_hwdep >
 CPU: 0 PID: 1197 Comm: gnome-shell Tainted: G    U  5.17.0-rc2-vmwgfx #2
 Hardware name: VMware, Inc. VBSA/VBSA, BIOS VEFI 12/31/2020
 pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : ttm_resource_fini+0x5c/0xac [ttm]
 lr : ttm_range_man_alloc+0x128/0x1e0 [ttm]
 sp : ffff80000d783510
 x29: ffff80000d783510 x28: 0000000000000000 x27: ffff000086514400
 x26: 0000000000000300 x25: ffff0000809f9e78 x24: 0000000000000000
 x23: ffff80000d783680 x22: ffff000086514400 x21: 00000000ffffffe4
 x20: ffff80000d7836a0 x19: ffff0000809f9e00 x18: 0000000000000000
 x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
 x14: 0000000000000000 x13: 0000000000000800 x12: ffff0000f2600a00
 x11: 000000000000fc96 x10: 0000000000000000 x9 : ffff800001295c18
 x8 : 0000000000000000 x7 : 0000000000000300 x6 : 0000000000000000
 x5 : 0000000000000000 x4 : ffff0000f1034e20 x3 : ffff0000f1034600
 x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000600000
 Call trace:
  ttm_resource_fini+0x5c/0xac [ttm]
  ttm_range_man_alloc+0x128/0x1e0 [ttm]
  ttm_resource_alloc+0x58/0x90 [ttm]
  ttm_bo_mem_space+0xc8/0x3e4 [ttm]
  ttm_bo_validate+0xb4/0x134 [ttm]
  vmw_bo_pin_in_start_of_vram+0xbc/0x200 [vmwgfx]
  vmw_framebuffer_pin+0xc0/0x154 [vmwgfx]
  vmw_ldu_primary_plane_atomic_update+0x8c/0x6e0 [vmwgfx]
  drm_atomic_helper_commit_planes+0x11c/0x2e0
  drm_atomic_helper_commit_tail+0x60/0xb0
  commit_tail+0x1b0/0x210
  drm_atomic_helper_commit+0x168/0x400
  drm_atomic_commit+0x64/0x74
  drm_atomic_helper_set_config+0xdc/0x11c
  drm_mode_setcrtc+0x1c4/0x780
  drm_ioctl_kernel+0xd0/0x1a0
  drm_ioctl+0x2c4/0x690
  vmw_generic_ioctl+0xe0/0x174 [vmwgfx]
  vmw_unlocked_ioctl+0x24/0x30 [vmwgfx]
  __arm64_sys_ioctl+0xb4/0x100
  invoke_syscall+0x78/0x100
  el0_svc_common.constprop.0+0x54/0x184
  do_el0_svc+0x34/0x9c
  el0_svc+0x48/0x1b0
  el0t_64_sync_handler+0xa4/0x130
  el0t_64_sync+0x1a4/0x1a8
 Code: 35000260 f9401a81 52800002 f9403a60 (f9406c23)
 ---[ end trace 0000000000000000 ]---

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: de3688e469b0 ("drm/ttm: add ttm_resource_fini v2")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 8cd4f3fb9f79..d91666721dc6 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -89,7 +89,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 	spin_unlock(&rman->lock);
 
 	if (unlikely(ret)) {
-		ttm_resource_fini(man, *res);
+		ttm_resource_fini(man, &node->base);
 		kfree(node);
 		return ret;
 	}
-- 
2.32.0

