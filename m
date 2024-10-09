Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F03995C69
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 02:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B488B10E1A4;
	Wed,  9 Oct 2024 00:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OthLjeYw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CDB10E1A4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 00:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mj55nMgJ4C9CnxIrpURc2OTZxKP08I4C6TKy2y+ulUk=; b=OthLjeYwQzUEiWVGXOp+vqCr9k
 Z4fBTWPuZPf6bLNj86zXmBTN8fb0h4Eq8Fyo13ODgTeNM1GtwqjzoZG+ZY5UCqPV0Ova9jEb7SnPj
 N9sngkGKAxEfHN8QfQHCB40SrsM1L8XmtffMWNfFGLlNpmbj2dRbD0kUrOE7EWb4u5WhadjTtmKzF
 d+gEhkcJqIj5EqwD5yCzvipbIKnHCtBdRXZVYQcYgLajYIbT5maly74rUm2HcVGy86uWkxXdBLxg1
 d602+NcmmneZERle4pqwADqwOERINtUt5DzM2xWxPj6+/fdHL5IFXhPB6SzgrLPPjsGvnVQdRd74d
 RWyQBOiQ==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1syKnl-006lYD-85; Wed, 09 Oct 2024 02:43:41 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] drm/vc4: Set `fbdev_probe` in `struct vc5_drm_driver`
Date: Tue,  8 Oct 2024 21:40:14 -0300
Message-ID: <20241009004332.1901833-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, when booting the RPi 4B, we get a NULL pointer dereference:

[    7.642883] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
[    7.642926] Mem abort info:
[    7.642938]   ESR = 0x0000000096000044
[    7.642951]   EC = 0x25: DABT (current EL), IL = 32 bits
[    7.642968]   SET = 0, FnV = 0
[    7.642981]   EA = 0, S1PTW = 0
[    7.642993]   FSC = 0x04: level 0 translation fault
[    7.643007] Data abort info:
[    7.643017]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
[    7.643032]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[    7.643046]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    7.643063] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107487000
[    7.643081] [0000000000000038] pgd=0000000000000000, p4d=0000000000000000
[    7.643113] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
[    7.643131] Modules linked in: snd_bcm2835(C)  [...] vc4 v3d [...]
drm_shmem_helper drm_dma_helper drm_kms_helper drm [...] ipv6
[    7.643377] CPU: 1 UID: 0 PID: 48 Comm: kworker/u16:2 Tainted: G         C         6.12.0-rc1-00310-g2c34a5464007 #185
[    7.643407] Tainted: [C]=CRAP
[    7.643419] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
[    7.643438] Workqueue: events_unbound deferred_probe_work_func
[    7.643477] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    7.643499] pc : __drm_fb_helper_initial_config_and_unlock+0x40c/0x588 [drm_kms_helper]
[    7.643616] lr : __drm_fb_helper_initial_config_and_unlock+0x374/0x588 [drm_kms_helper]
[    7.643710] sp : ffff8000806c3900
[    7.643724] x29: ffff8000806c3950 x28: ffff431b01a3ec14 x27: 0000000000000010
[    7.643758] x26: ffff431b0369f000 x25: 0000000036314752 x24: ffff431b003b6200
[    7.643790] x23: ffff431b0369f000 x22: 00000000000002d0 x21: ffff431b003b6030
[    7.643821] x20: ffff431b003b6030 x19: ffff431b003b6000 x18: ffff431b002e6e48
[    7.643852] x17: 0000000000000001 x16: ffffb19c2f10614c x15: 0000000000000000
[    7.643882] x14: 0000000000000000 x13: ffff431b003b62f0 x12: 0000000000000500
[    7.643913] x11: 0000000000000000 x10: 0000000000000000 x9 : 005d6e6f6362665b
[    7.643945] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 000000000000003f
[    7.643975] x5 : ffffb19bcb45c59c x4 : 0000000000001e00 x3 : ffffb19bcb420c20
[    7.644005] x2 : 0000000000000000 x1 : 0000000000000001 x0 : ffff431b003b6000
[    7.644036] Call trace:
[    7.644049]  __drm_fb_helper_initial_config_and_unlock+0x40c/0x588 [drm_kms_helper]
[    7.644149]  drm_fb_helper_initial_config+0x34/0x4c [drm_kms_helper]
[    7.644240]  drm_fbdev_client_hotplug+0x74/0xc8 [drm_kms_helper]
[    7.644331]  drm_client_register+0x58/0xa0 [drm]
[    7.644571]  drm_fbdev_client_setup+0xc4/0x17c [drm_kms_helper]
[    7.644664]  drm_client_setup_with_fourcc+0x28/0x60 [drm_kms_helper]
[    7.644755]  vc4_drm_bind+0x218/0x264 [vc4]
[    7.644855]  try_to_bring_up_aggregate_device+0x168/0x1b4
[    7.644884]  __component_add+0xb8/0x158
[    7.644905]  component_add+0x14/0x20
[    7.644925]  vc4_hvs_dev_probe+0x1c/0x28 [vc4]
[    7.645019]  platform_probe+0xa8/0xd0
[    7.645045]  really_probe+0x128/0x2c8
[    7.645065]  __driver_probe_device+0xa0/0x128
[    7.645086]  driver_probe_device+0x3c/0x1f8
[    7.645106]  __device_attach_driver+0x118/0x140
[    7.645127]  bus_for_each_drv+0xf4/0x14c
[    7.645145]  __device_attach+0xfc/0x194
[    7.645164]  device_initial_probe+0x14/0x20
[    7.645184]  bus_probe_device+0x94/0x100
[    7.645202]  deferred_probe_work_func+0x88/0xc4
[    7.645223]  process_scheduled_works+0x194/0x2c4
[    7.645246]  worker_thread+0x290/0x39c
[    7.645265]  kthread+0xfc/0x184
[    7.645289]  ret_from_fork+0x10/0x20
[    7.645317] Code: f2ac6c49 aa1303e0 f2cdcde9 f2e00ba9 (f9001d09)
[    7.645338] ---[ end trace 0000000000000000 ]---

This happens because commit 45903624e9fc ("drm/vc4: Run DRM default client
setup") only added DRM_FBDEV_DMA_DRIVER_OPS to `struct vc4_drm_driver`
and didn't add it to `struct vc5_drm_driver`. The `struct vc4_drm_driver`
is used in RPi 0-3, as VC4 is also a render node in those RPis. But RPi 4
and 5 use V3D as the render node and VC4 as modeset node and therefore,
use `struct vc5_drm_driver`.

This commit adds DRM_FBDEV_DMA_DRIVER_OPS to `struct vc5_drm_driver`,
ensuring that `fbdev_probe` exists for all VC4 generations.

Fixes: 45903624e9fc ("drm/vc4: Run DRM default client setup")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 13a1ecddbca3..a238f76a6073 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -238,6 +238,7 @@ const struct drm_driver vc5_drm_driver = {
 #endif
 
 	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vc5_dumb_create),
+	DRM_FBDEV_DMA_DRIVER_OPS,
 
 	.fops = &vc4_drm_fops,
 
-- 
2.46.2

