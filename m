Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D0A89CF76
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 02:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C533F112012;
	Tue,  9 Apr 2024 00:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C228B10F9CD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 00:34:27 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-297-l4A8sei7OSGg7CdFT0AVMg-1; Mon,
 08 Apr 2024 20:34:24 -0400
X-MC-Unique: l4A8sei7OSGg7CdFT0AVMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 674BE1C02142;
 Tue,  9 Apr 2024 00:34:24 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62F724094DC0;
 Tue,  9 Apr 2024 00:34:23 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau: fix instmem race condition around ptr stores
Date: Tue,  9 Apr 2024 10:34:01 +1000
Message-ID: <20240409003401.2224446-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

Running a lot of VK CTS in parallel against nouveau, once every
few hours you might see something like this crash.

BUG: kernel NULL pointer dereference, address: 0000000000000008
PGD 8000000114e6e067 P4D 8000000114e6e067 PUD 109046067 PMD 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 7 PID: 53891 Comm: deqp-vk Not tainted 6.8.0-rc6+ #27
Hardware name: Gigabyte Technology Co., Ltd. Z390 I AORUS PRO WIFI/Z390 I A=
ORUS PRO WIFI-CF, BIOS F8 11/05/2021
RIP: 0010:gp100_vmm_pgt_mem+0xe3/0x180 [nouveau]
Code: c7 48 01 c8 49 89 45 58 85 d2 0f 84 95 00 00 00 41 0f b7 46 12 49 8b =
7e 08 89 da 42 8d 2c f8 48 8b 47 08 41 83 c7 01 48 89 ee <48> 8b 40 08 ff d=
0 0f 1f 00 49 8b 7e 08 48 89 d9 48 8d 75 04 48 c1
RSP: 0000:ffffac20c5857838 EFLAGS: 00010202
RAX: 0000000000000000 RBX: 00000000004d8001 RCX: 0000000000000001
RDX: 00000000004d8001 RSI: 00000000000006d8 RDI: ffffa07afe332180
RBP: 00000000000006d8 R08: ffffac20c5857ad0 R09: 0000000000ffff10
R10: 0000000000000001 R11: ffffa07af27e2de0 R12: 000000000000001c
R13: ffffac20c5857ad0 R14: ffffa07a96fe9040 R15: 000000000000001c
FS:  00007fe395eed7c0(0000) GS:ffffa07e2c980000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000008 CR3: 000000011febe001 CR4: 00000000003706f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:

...

 ? gp100_vmm_pgt_mem+0xe3/0x180 [nouveau]
 ? gp100_vmm_pgt_mem+0x37/0x180 [nouveau]
 nvkm_vmm_iter+0x351/0xa20 [nouveau]
 ? __pfx_nvkm_vmm_ref_ptes+0x10/0x10 [nouveau]
 ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
 ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
 ? __lock_acquire+0x3ed/0x2170
 ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
 nvkm_vmm_ptes_get_map+0xc2/0x100 [nouveau]
 ? __pfx_nvkm_vmm_ref_ptes+0x10/0x10 [nouveau]
 ? __pfx_gp100_vmm_pgt_mem+0x10/0x10 [nouveau]
 nvkm_vmm_map_locked+0x224/0x3a0 [nouveau]

Adding any sort of useful debug usually makes it go away, so I hand
wrote the function in a line, and debugged the asm.

Every so often pt->memory->ptrs is NULL. This ptrs ptr is set in
the nv50_instobj_acquire called from nvkm_kmap.

If Thread A and Thread B both get to nv50_instobj_acquire around
the same time, and Thread A hits the refcount_set line, and in
lockstep thread B succeeds at refcount_inc_not_zero, there is a
chance the ptrs value won't have been stored since refcount_set
is unordered. Force a memory barrier here, I picked smp_mb, since
we want it on all CPUs and it's write followed by a read.

Cc: linux-stable
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index a7f3fc342d87..cbacc7b11f8c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -250,6 +250,9 @@ nv50_instobj_acquire(struct nvkm_memory *memory)
 =09=09=09iobj->base.memory.ptrs =3D &nv50_instobj_fast;
 =09=09else
 =09=09=09iobj->base.memory.ptrs =3D &nv50_instobj_slow;
+=09=09/* barrier to ensure ptrs is written before another thread
+=09=09   does refcount_inc_not_zero successfully. */
+=09=09smp_mb();
 =09=09refcount_set(&iobj->maps, 1);
 =09}
=20
--=20
2.43.2

