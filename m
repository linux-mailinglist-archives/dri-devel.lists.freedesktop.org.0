Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA88B6109
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 20:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE6C10EEFE;
	Mon, 29 Apr 2024 18:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Kwunyy+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C8B10E9F6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 18:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714415018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTG0DWcIKhOPZB10b2MCjJIKwbv6KWLnkqIzMUFMrUA=;
 b=Kwunyy+DB4ZRIPPq1mEbiqDpHWCVResrUWEmQxYDZkvr9K5zLWBwSRp6Xw94NQ3Dce0hP3
 TkgjcIE25oowyJAquOj/7wxH21zQSxFtoxWfmP1DujhNB9auPLXMp2PsCVBLsxqxyi0IwY
 XiAmT43lx7dCpjMKzYTf5OoqKKFLfSo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-dg13UQiVOfWHyy_-JCIpBg-1; Mon, 29 Apr 2024 14:23:31 -0400
X-MC-Unique: dg13UQiVOfWHyy_-JCIpBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDE508EE067;
 Mon, 29 Apr 2024 18:23:30 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.9.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C913E1121312;
 Mon, 29 Apr 2024 18:23:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Justin Stitt <justinstitt@google.com>,
 Dave Airlie <airlied@redhat.com>, Kees Cook <keescook@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/nouveau/firmware: Fix SG_DEBUG error with
 nvkm_firmware_ctor()
Date: Mon, 29 Apr 2024 14:23:08 -0400
Message-ID: <20240429182318.189668-1-lyude@redhat.com>
In-Reply-To: <20240426154138.64643-1-lyude@redhat.com>
References: <20240426154138.64643-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

Currently, enabling SG_DEBUG in the kernel will cause nouveau to hit a
BUG() on startup:

  kernel BUG at include/linux/scatterlist.h:187!
  invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
  CPU: 7 PID: 930 Comm: (udev-worker) Not tainted 6.9.0-rc3Lyude-Test+ #30
  Hardware name: MSI MS-7A39/A320M GAMING PRO (MS-7A39), BIOS 1.I0 01/22/2019
  RIP: 0010:sg_init_one+0x85/0xa0
  Code: 69 88 32 01 83 e1 03 f6 c3 03 75 20 a8 01 75 1e 48 09 cb 41 89 54
  24 08 49 89 1c 24 41 89 6c 24 0c 5b 5d 41 5c e9 7b b9 88 00 <0f> 0b 0f 0b
  0f 0b 48 8b 05 5e 46 9a 01 eb b2 66 66 2e 0f 1f 84 00
  RSP: 0018:ffffa776017bf6a0 EFLAGS: 00010246
  RAX: 0000000000000000 RBX: ffffa77600d87000 RCX: 000000000000002b
  RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffffa77680d87000
  RBP: 000000000000e000 R08: 0000000000000000 R09: 0000000000000000
  R10: ffff98f4c46aa508 R11: 0000000000000000 R12: ffff98f4c46aa508
  R13: ffff98f4c46aa008 R14: ffffa77600d4a000 R15: ffffa77600d4a018
  FS:  00007feeb5aae980(0000) GS:ffff98f5c4dc0000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 00007f22cb9a4520 CR3: 00000001043ba000 CR4: 00000000003506f0
  Call Trace:
   <TASK>
   ? die+0x36/0x90
   ? do_trap+0xdd/0x100
   ? sg_init_one+0x85/0xa0
   ? do_error_trap+0x65/0x80
   ? sg_init_one+0x85/0xa0
   ? exc_invalid_op+0x50/0x70
   ? sg_init_one+0x85/0xa0
   ? asm_exc_invalid_op+0x1a/0x20
   ? sg_init_one+0x85/0xa0
   nvkm_firmware_ctor+0x14a/0x250 [nouveau]
   nvkm_falcon_fw_ctor+0x42/0x70 [nouveau]
   ga102_gsp_booter_ctor+0xb4/0x1a0 [nouveau]
   r535_gsp_oneinit+0xb3/0x15f0 [nouveau]
   ? srso_return_thunk+0x5/0x5f
   ? srso_return_thunk+0x5/0x5f
   ? nvkm_udevice_new+0x95/0x140 [nouveau]
   ? srso_return_thunk+0x5/0x5f
   ? srso_return_thunk+0x5/0x5f
   ? ktime_get+0x47/0xb0
   ? srso_return_thunk+0x5/0x5f
   nvkm_subdev_oneinit_+0x4f/0x120 [nouveau]
   nvkm_subdev_init_+0x39/0x140 [nouveau]
   ? srso_return_thunk+0x5/0x5f
   nvkm_subdev_init+0x44/0x90 [nouveau]
   nvkm_device_init+0x166/0x2e0 [nouveau]
   nvkm_udevice_init+0x47/0x70 [nouveau]
   nvkm_object_init+0x41/0x1c0 [nouveau]
   nvkm_ioctl_new+0x16a/0x290 [nouveau]
   ? __pfx_nvkm_client_child_new+0x10/0x10 [nouveau]
   ? __pfx_nvkm_udevice_new+0x10/0x10 [nouveau]
   nvkm_ioctl+0x126/0x290 [nouveau]
   nvif_object_ctor+0x112/0x190 [nouveau]
   nvif_device_ctor+0x23/0x60 [nouveau]
   nouveau_cli_init+0x164/0x640 [nouveau]
   nouveau_drm_device_init+0x97/0x9e0 [nouveau]
   ? srso_return_thunk+0x5/0x5f
   ? pci_update_current_state+0x72/0xb0
   ? srso_return_thunk+0x5/0x5f
   nouveau_drm_probe+0x12c/0x280 [nouveau]
   ? srso_return_thunk+0x5/0x5f
   local_pci_probe+0x45/0xa0
   pci_device_probe+0xc7/0x270
   really_probe+0xe6/0x3a0
   __driver_probe_device+0x87/0x160
   driver_probe_device+0x1f/0xc0
   __driver_attach+0xec/0x1f0
   ? __pfx___driver_attach+0x10/0x10
   bus_for_each_dev+0x88/0xd0
   bus_add_driver+0x116/0x220
   driver_register+0x59/0x100
   ? __pfx_nouveau_drm_init+0x10/0x10 [nouveau]
   do_one_initcall+0x5b/0x320
   do_init_module+0x60/0x250
   init_module_from_file+0x86/0xc0
   idempotent_init_module+0x120/0x2b0
   __x64_sys_finit_module+0x5e/0xb0
   do_syscall_64+0x83/0x160
   ? srso_return_thunk+0x5/0x5f
   entry_SYSCALL_64_after_hwframe+0x71/0x79
  RIP: 0033:0x7feeb5cc20cd
  Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89
  f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0
  ff ff 73 01 c3 48 8b 0d 1b cd 0c 00 f7 d8 64 89 01 48
  RSP: 002b:00007ffcf220b2c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
  RAX: ffffffffffffffda RBX: 000055fdd2916aa0 RCX: 00007feeb5cc20cd
  RDX: 0000000000000000 RSI: 000055fdd29161e0 RDI: 0000000000000035
  RBP: 00007ffcf220b380 R08: 00007feeb5d8fb20 R09: 00007ffcf220b310
  R10: 000055fdd2909dc0 R11: 0000000000000246 R12: 000055fdd29161e0
  R13: 0000000000020000 R14: 000055fdd29203e0 R15: 000055fdd2909d80
   </TASK>

We hit this when trying to initialize firmware of type
NVKM_FIRMWARE_IMG_DMA because we allocate our memory with
dma_alloc_coherent, and DMA allocations can't be turned back into memory
pages - which a scatterlist needs in order to map them.

So, fix this by allocating the memory with vmalloc instead().

V2:
* Fixup explanation as the prior one was bogus

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index adc60b25f8e6c..141b0a513bf52 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -205,7 +205,9 @@ nvkm_firmware_dtor(struct nvkm_firmware *fw)
 		break;
 	case NVKM_FIRMWARE_IMG_DMA:
 		nvkm_memory_unref(&memory);
-		dma_free_coherent(fw->device->dev, sg_dma_len(&fw->mem.sgl), fw->img, fw->phys);
+		dma_unmap_single(fw->device->dev, fw->phys, sg_dma_len(&fw->mem.sgl),
+				 DMA_TO_DEVICE);
+		kfree(fw->img);
 		break;
 	case NVKM_FIRMWARE_IMG_SGT:
 		nvkm_memory_unref(&memory);
@@ -235,14 +237,17 @@ nvkm_firmware_ctor(const struct nvkm_firmware_func *func, const char *name,
 		fw->img = kmemdup(src, fw->len, GFP_KERNEL);
 		break;
 	case NVKM_FIRMWARE_IMG_DMA: {
-		dma_addr_t addr;
-
 		len = ALIGN(fw->len, PAGE_SIZE);
 
-		fw->img = dma_alloc_coherent(fw->device->dev, len, &addr, GFP_KERNEL);
-		if (fw->img) {
-			memcpy(fw->img, src, fw->len);
-			fw->phys = addr;
+		fw->img = kmalloc(len, GFP_KERNEL);
+		if (!fw->img)
+			return -ENOMEM;
+
+		memcpy(fw->img, src, fw->len);
+		fw->phys = dma_map_single(fw->device->dev, fw->img, len, DMA_TO_DEVICE);
+		if (dma_mapping_error(fw->device->dev, fw->phys)) {
+			kfree(fw->img);
+			return -EFAULT;
 		}
 
 		sg_init_one(&fw->mem.sgl, fw->img, len);
-- 
2.44.0

