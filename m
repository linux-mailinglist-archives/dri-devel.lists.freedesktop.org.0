Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19DB90A2EF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 05:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC6910E14A;
	Mon, 17 Jun 2024 03:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B795D10E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 03:53:08 +0000 (UTC)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-106-Gsn2vfykO3uasjTLNTXMvA-1; Sun,
 16 Jun 2024 23:53:04 -0400
X-MC-Unique: Gsn2vfykO3uasjTLNTXMvA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6836919560A7; Mon, 17 Jun 2024 03:53:03 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.95])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 37A6F1956087; Mon, 17 Jun 2024 03:53:00 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 Ubisectech Sirius <bugreport@ubisectech.com>
Subject: [PATCH] drm/lease: use kvcalloc instead of kcalloc to avoid warn
 triggering.
Date: Mon, 17 Jun 2024 13:52:58 +1000
Message-ID: <20240617035258.2774032-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

Attempt to use kvmalloc to avoid kmalloc warnings on larger allocations.

It might make sense to try and make a limit for the number of objects allow=
ed here.

------------[ cut here ]------------
WARNING: CPU: 1 PID: 18929 at mm/page_alloc.c:4545 __alloc_pages+0x402/0x21=
b0 mm/page_alloc.c:4545
Modules linked in:
CPU: 1 PID: 18929 Comm: syz-executor.3 Not tainted 6.8.0 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/=
2014
RIP: 0010:__alloc_pages+0x402/0x21b0 mm/page_alloc.c:4545
Code: ff 00 0f 84 15 fe ff ff 80 ce 01 e9 0d fe ff ff 83 fe 0a 0f 86 0e fd =
ff ff 80 3d c7 cf 6a 0d 00 75 0b c6 05 be cf 6a 0d 01 90 <0f> 0b 90 45 31 e=
4 e9 87 fe ff ff e8 5e 3e 9b ff 84 c0 0f 85 7a fe
RSP: 0018:ffffc90001cc7808 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 1ffff92000398f14
RDX: 0000000000000001 RSI: 000000000000000b RDI: 0000000000040dc0
RBP: ffffc90001cc7ab8 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 00000000007a1200
R13: 000000000000000b R14: 0000000000040dc0 R15: 000000000000000b
FS:  00007f1717ba5640(0000) GS:ffff88807ec00000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000203d0000 CR3: 000000001f5c0000 CR4: 0000000000750ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 <TASK>
 __alloc_pages_node include/linux/gfp.h:238 [inline]
 alloc_pages_node include/linux/gfp.h:261 [inline]
 __kmalloc_large_node+0x88/0x1a0 mm/slub.c:3926
 __do_kmalloc_node mm/slub.c:3969 [inline]
 __kmalloc+0x370/0x480 mm/slub.c:3994
 kmalloc_array include/linux/slab.h:627 [inline]
 kcalloc include/linux/slab.h:658 [inline]
 fill_object_idr drivers/gpu/drm/drm_lease.c:389 [inline]
 drm_mode_create_lease_ioctl+0x4ca/0x1f70 drivers/gpu/drm/drm_lease.c:522
 drm_ioctl_kernel+0x1eb/0x3f0 drivers/gpu/drm/drm_ioctl.c:744
 drm_ioctl+0x582/0xb70 drivers/gpu/drm/drm_ioctl.c:841
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __x64_sys_ioctl+0x1a1/0x210 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd5/0x270 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x6f/0x77
RIP: 0033:0x7f1716e8eeed
Code: c3 e8 97 2b 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1717ba5028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f1716fe3f80 RCX: 00007f1716e8eeed
RDX: 00000000200003c0 RSI: 00000000c01864c6 RDI: 0000000000000003
RBP: 00007f1716f13014 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007f1716fe3f80 R15: 00007f1717b85000
 </TASK>

Reported-by: Ubisectech Sirius <bugreport@ubisectech.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/drm_lease.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 94375c6a5425..338716640725 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -386,8 +386,8 @@ static int fill_object_idr(struct drm_device *dev,
 =09int ret;
 =09bool universal_planes =3D READ_ONCE(lessor_priv->universal_planes);
=20
-=09objects =3D kcalloc(object_count, sizeof(struct drm_mode_object *),
-=09=09=09  GFP_KERNEL);
+=09objects =3D kvcalloc(object_count, sizeof(struct drm_mode_object *),
+=09=09=09   GFP_KERNEL);
 =09if (!objects)
 =09=09return -ENOMEM;
=20
@@ -463,7 +463,7 @@ static int fill_object_idr(struct drm_device *dev,
 =09=09if (objects[o])
 =09=09=09drm_mode_object_put(objects[o]);
 =09}
-=09kfree(objects);
+=09kvfree(objects);
 =09return ret;
 }
=20
--=20
2.45.0

