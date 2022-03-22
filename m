Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC84E50DE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC0C10E692;
	Wed, 23 Mar 2022 11:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Wed, 23 Mar 2022 01:40:54 UTC
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD8910E047;
 Wed, 23 Mar 2022 01:40:53 +0000 (UTC)
X-UUID: edfba7ec2bb1416d9d9fa247c6c4101b-20220322
X-Spam-Fingerprint: 0
X-GW-Reason: 11101
X-Policy-Incident: 5pS25Lu25Lq66LaF6L+HNeS6uumcgOimgeWuoeaguA==
X-Content-Feature: ica/max.line-size 80 audit/email.address 1 meta/cnt.alert 1
X-UUID: edfba7ec2bb1416d9d9fa247c6c4101b-20220322
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 1333734699; Tue, 22 Mar 2022 17:35:25 +0800
X-ns-mid: postfix-62399888-574557455
Received: from localhost.localdomain (unknown [172.20.12.219])
 by cs2c.com.cn (NSMail) with ESMTPA id C3621383C640;
 Tue, 22 Mar 2022 09:36:07 +0000 (UTC)
From: Cong Liu <liucong2@kylinos.cn>
To: airlied@redhat.com, kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 christian.koenig@amd.com, ray.huang@amd.com,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/2] drm/qxl: replace ioremap by ioremap_cache on arm64
Date: Tue, 22 Mar 2022 17:34:43 +0800
Message-Id: <20220322093444.1236582-1-liucong2@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Mar 2022 11:01:42 +0000
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
Cc: Cong Liu <liucong2@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

qxl use ioremap to map ram_header and rom, in the arm64 implementation,
the device is mapped as DEVICE_nGnRE, it can not support unaligned
access.

  6.620515] pc : setup_hw_slot+0x24/0x60 [qxl]
[    6.620961] lr : setup_slot+0x34/0xf0 [qxl]
[    6.621376] sp : ffff800012b73760
[    6.621701] x29: ffff800012b73760 x28: 0000000000000001 x27: 0000000010000000
[    6.622400] x26: 0000000000000001 x25: 0000000004000000 x24: ffffcf376848c000
[    6.623099] x23: ffff0000c4087400 x22: ffffcf3718e17140 x21: 0000000000000000
[    6.623823] x20: ffff0000c4086000 x19: ffff0000c40870b0 x18: 0000000000000014
[    6.624519] x17: 000000004d3605ab x16: 00000000bb3b6129 x15: 000000006e771809
[    6.625214] x14: 0000000000000001 x13: 007473696c5f7974 x12: 696e696666615f65
[    6.625909] x11: 00000000d543656a x10: 0000000000000000 x9 : ffffcf3718e085a4
[    6.626616] x8 : 00000000006c7871 x7 : 000000000000000a x6 : 0000000000000017
[    6.627343] x5 : 0000000000001400 x4 : ffff800011f63400 x3 : 0000000014000000
[    6.628047] x2 : 0000000000000000 x1 : ffff0000c40870b0 x0 : ffff0000c4086000
[    6.628751] Call trace:
[    6.628994]  setup_hw_slot+0x24/0x60 [qxl]
[    6.629404]  setup_slot+0x34/0xf0 [qxl]
[    6.629790]  qxl_device_init+0x6f0/0x7f0 [qxl]
[    6.630235]  qxl_pci_probe+0xdc/0x1d0 [qxl]
[    6.630654]  local_pci_probe+0x48/0xb8
[    6.631027]  pci_device_probe+0x194/0x208
[    6.631464]  really_probe+0xd0/0x458
[    6.631818]  __driver_probe_device+0x124/0x1c0
[    6.632256]  driver_probe_device+0x48/0x130
[    6.632669]  __driver_attach+0xc4/0x1a8
[    6.633049]  bus_for_each_dev+0x78/0xd0
[    6.633437]  driver_attach+0x2c/0x38
[    6.633789]  bus_add_driver+0x154/0x248
[    6.634168]  driver_register+0x6c/0x128
[    6.635205]  __pci_register_driver+0x4c/0x58
[    6.635628]  qxl_init+0x48/0x1000 [qxl]
[    6.636013]  do_one_initcall+0x50/0x240
[    6.636390]  do_init_module+0x60/0x238
[    6.636768]  load_module+0x2458/0x2900
[    6.637136]  __do_sys_finit_module+0xbc/0x128
[    6.637561]  __arm64_sys_finit_module+0x28/0x38
[    6.638004]  invoke_syscall+0x74/0xf0
[    6.638366]  el0_svc_common.constprop.0+0x58/0x1a8
[    6.638836]  do_el0_svc+0x2c/0x90
[    6.639216]  el0_svc+0x40/0x190
[    6.639526]  el0t_64_sync_handler+0xb0/0xb8
[    6.639934]  el0t_64_sync+0x1a4/0x1a8
[    6.640294] Code: 910003fd f9484804 f9400c23 8b050084 (f809c083)
[    6.640889] ---[ end trace 95615d89b7c87f95 ]---

Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 4dc5ad13f12c..0e61ac04d8ad 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -165,7 +165,11 @@ int qxl_device_init(struct qxl_device *qdev,
 		 (int)qdev->surfaceram_size / 1024,
 		 (sb == 4) ? "64bit" : "32bit");
 
+#ifdef CONFIG_ARM64
+	qdev->rom = ioremap_cache(qdev->rom_base, qdev->rom_size);
+#else
 	qdev->rom = ioremap(qdev->rom_base, qdev->rom_size);
+#endif
 	if (!qdev->rom) {
 		pr_err("Unable to ioremap ROM\n");
 		r = -ENOMEM;
@@ -183,9 +187,15 @@ int qxl_device_init(struct qxl_device *qdev,
 		goto rom_unmap;
 	}
 
+#ifdef CONFIG_ARM64
+	qdev->ram_header = ioremap_cache(qdev->vram_base +
+				   qdev->rom->ram_header_offset,
+				   sizeof(*qdev->ram_header));
+#else
 	qdev->ram_header = ioremap(qdev->vram_base +
 				   qdev->rom->ram_header_offset,
 				   sizeof(*qdev->ram_header));
+#endif
 	if (!qdev->ram_header) {
 		DRM_ERROR("Unable to ioremap RAM header\n");
 		r = -ENOMEM;
-- 
2.25.1

