Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3420E6D738C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 06:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504C110E302;
	Wed,  5 Apr 2023 04:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E60B10E302
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 04:56:18 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 537F1328C81;
 Wed,  5 Apr 2023 05:56:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1680670576; bh=6K8UFVcw+Y6VP0vTNaYdqh4figzVOJ9ELtgvZcWezoI=;
 h=From:To:Cc:Subject:Date:From;
 b=JGGCEjmHm3EBJpVpfZG/ExPBR+h9HEgoBenRhOM90aXIpy884EfDIyN79oa8vvCjF
 Mm2alXlZCfbui8M8DsbxY4ijOMJwQhRMwCAgiCJXTXQtGH31ygslyJJMQxLora9U4L
 37DNhSIo3LdzlU+eRl51ah4pEFRvDcnkqdnqVhMu8Tpg4V1YstWeGZFKXRPoBx4qzq
 9BcMYd+C53oPN5bpy+hQo5RO/HMNgbE/bshdu0dddJNgnT7fzhm/8UQf+FIw44i8zv
 cCJAXrYqaI8E59Sl4nkCcVk11EZYuiEvAMNGZWNOa05fKhpmwmhaSXW6e3GdYepYFZ
 l7HxSjpnlIbGQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/atomic-helper: Do not assume vblank is always present
Date: Wed,  5 Apr 2023 00:56:11 -0400
Message-Id: <20230405045611.28093-1-zack@kde.org>
X-Mailer: git-send-email 2.39.2
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 banackm@vmware.com, krastevm@vmware.com, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Many drivers (in particular all of the virtualized drivers) do not
implement vblank handling. Assuming vblank is always present
leads to crashes.

Fix the crashes by making sure the device supports vblank before using
it.

Fixes crashes on boot, as in:
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 0 PID: 377 Comm: systemd-modules Not tainted 6.3.0-rc4-vmwgfx #1
Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
RIP: 0010:drm_crtc_next_vblank_start+0x2c/0x80 [drm]
Code: 1e fa 0f 1f 44 00 00 8b 87 90 00 00 00 48 8b 17 55 48 8d 0c c0 48 89 e5 41 54 53 48 8d 1c 48 48 c1 e3 04 48 03 9a 40 01 00 00 <8b> 53 74 85 d2 74 3f 8b 4>
RSP: 0018:ffffb825004073c8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff9b18cf8d0000 RSI: ffffb825004073e8 RDI: ffff9b18d0f40000
RBP: ffffb825004073d8 R08: ffff9b18cf8d0000 R09: 0000000000000000
R10: ffff9b18c57ef6e8 R11: ffff9b18c2d59e00 R12: 0000000000000000
R13: ffff9b18cfa99280 R14: 0000000000000000 R15: ffff9b18cf8d0000
FS:  00007f2b82538900(0000) GS:ffff9b19f7c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000074 CR3: 00000001060a6003 CR4: 00000000003706f0
Call Trace:
 <TASK>
 drm_atomic_helper_wait_for_fences+0x87/0x1e0 [drm_kms_helper]
 drm_atomic_helper_commit+0xa1/0x160 [drm_kms_helper]
 drm_atomic_commit+0x9a/0xd0 [drm]
 ? __pfx___drm_printfn_info+0x10/0x10 [drm]
 drm_client_modeset_commit_atomic+0x1e9/0x230 [drm]
 drm_client_modeset_commit_locked+0x5f/0x160 [drm]
 ? mutex_lock+0x17/0x50
 drm_client_modeset_commit+0x2b/0x50 [drm]
 __drm_fb_helper_restore_fbdev_mode_unlocked+0xca/0x100 [drm_kms_helper]
 drm_fb_helper_set_par+0x40/0x80 [drm_kms_helper]
 fbcon_init+0x2c5/0x690
 visual_init+0xee/0x190
 do_bind_con_driver.isra.0+0x1ce/0x4b0
 do_take_over_console+0x136/0x220
 ? vprintk_default+0x21/0x30
 do_fbcon_takeover+0x78/0x130
 do_fb_registered+0x139/0x270
 fbcon_fb_registered+0x3b/0x90
 ? fb_add_videomode+0x81/0xf0
 register_framebuffer+0x22f/0x330
 __drm_fb_helper_initial_config_and_unlock+0x349/0x520 [drm_kms_helper]
 ? kmalloc_large+0x25/0xc0
 drm_fb_helper_initial_config+0x3f/0x50 [drm_kms_helper]
 drm_fbdev_generic_client_hotplug+0x73/0xc0 [drm_kms_helper]
 drm_fbdev_generic_setup+0x99/0x170 [drm_kms_helper]

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")
Cc: Rob Clark <robdclark@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_vblank.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 299fa2a19a90..6438aeb1c65f 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -997,12 +997,16 @@ int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
 {
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
-	struct drm_display_mode *mode = &vblank->hwmode;
+	struct drm_display_mode *mode;
 	u64 vblank_start;
 
+	if (!drm_dev_has_vblank(crtc->dev))
+		return -EINVAL;
+
 	if (!vblank->framedur_ns || !vblank->linedur_ns)
 		return -EINVAL;
 
+	mode = &vblank->hwmode;
 	if (!drm_crtc_get_last_vbltimestamp(crtc, vblanktime, false))
 		return -EINVAL;
 
-- 
2.39.2

