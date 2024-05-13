Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC158C3B8F
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 08:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8451F10E36E;
	Mon, 13 May 2024 06:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E4A10E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 06:43:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-294-cZ3FIbBDNZquWXQme0Idgw-1; Mon,
 13 May 2024 02:43:53 -0400
X-MC-Unique: cZ3FIbBDNZquWXQme0Idgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC85529AA2C3;
 Mon, 13 May 2024 06:43:53 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39A55200B4DB;
 Mon, 13 May 2024 06:43:51 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org,
	dakr@redhat.com
Subject: [PATCH] nouveau/firmware: using dma non-coherent interfaces for fw
 loading.
Date: Mon, 13 May 2024 16:43:50 +1000
Message-ID: <20240513064350.1050994-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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

From: Dave Airlie <airlied@redhat.com>

Currently, enabling SG_DEBUG in the kernel will cause nouveau to hit a
BUG() on startup, when the iommu is enabled:

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
FS:  00007feeb5aae980(0000) GS:ffff98f5c4dc0000(0000) knlGS:000000000000000=
0
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

Fix this by using the non-coherent allocator instead, I think there
might be a better answer to this, but it involve ripping up some of
APIs using sg lists.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 11 ++++++-----
 drivers/gpu/drm/nouveau/nvkm/falcon/fw.c     |  6 ++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm=
/nouveau/nvkm/core/firmware.c
index adc60b25f8e6..c9bee980777c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -205,7 +205,8 @@ nvkm_firmware_dtor(struct nvkm_firmware *fw)
 =09=09break;
 =09case NVKM_FIRMWARE_IMG_DMA:
 =09=09nvkm_memory_unref(&memory);
-=09=09dma_free_coherent(fw->device->dev, sg_dma_len(&fw->mem.sgl), fw->img=
, fw->phys);
+=09=09dma_free_noncoherent(fw->device->dev, sg_dma_len(&fw->mem.sgl),
+=09=09=09=09     fw->img, fw->phys, DMA_TO_DEVICE);
 =09=09break;
 =09case NVKM_FIRMWARE_IMG_SGT:
 =09=09nvkm_memory_unref(&memory);
@@ -235,14 +236,14 @@ nvkm_firmware_ctor(const struct nvkm_firmware_func *f=
unc, const char *name,
 =09=09fw->img =3D kmemdup(src, fw->len, GFP_KERNEL);
 =09=09break;
 =09case NVKM_FIRMWARE_IMG_DMA: {
-=09=09dma_addr_t addr;
-
 =09=09len =3D ALIGN(fw->len, PAGE_SIZE);
=20
-=09=09fw->img =3D dma_alloc_coherent(fw->device->dev, len, &addr, GFP_KERN=
EL);
+=09=09fw->img =3D dma_alloc_noncoherent(fw->device->dev,
+=09=09=09=09=09=09len, &fw->phys,
+=09=09=09=09=09=09DMA_TO_DEVICE,
+=09=09=09=09=09=09GFP_KERNEL);
 =09=09if (fw->img) {
 =09=09=09memcpy(fw->img, src, fw->len);
-=09=09=09fw->phys =3D addr;
 =09=09}
=20
 =09=09sg_init_one(&fw->mem.sgl, fw->img, len);
diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c b/drivers/gpu/drm/nou=
veau/nvkm/falcon/fw.c
index 80a480b12174..a1c8545f1249 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
@@ -89,6 +89,12 @@ nvkm_falcon_fw_boot(struct nvkm_falcon_fw *fw, struct nv=
km_subdev *user,
 =09=09nvkm_falcon_fw_dtor_sigs(fw);
 =09}
=20
+=09/* after last write to the img, sync dma mappings */
+=09dma_sync_single_for_device(fw->fw.device->dev,
+=09=09=09=09   fw->fw.phys,
+=09=09=09=09   sg_dma_len(&fw->fw.mem.sgl),
+=09=09=09=09   DMA_TO_DEVICE);
+
 =09FLCNFW_DBG(fw, "resetting");
 =09fw->func->reset(fw);
=20
--=20
2.43.2

