Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A7D88F572
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 03:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E990D1122D1;
	Thu, 28 Mar 2024 02:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C35E1122CF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:44:06 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-311-pkKsdljEOhO2MzRCG2Gzlg-1; Wed,
 27 Mar 2024 22:44:02 -0400
X-MC-Unique: pkKsdljEOhO2MzRCG2Gzlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 811A83CBD4E0;
 Thu, 28 Mar 2024 02:44:02 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AC8A1C060D0;
 Thu, 28 Mar 2024 02:43:59 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH] nouveau/uvmm: fix addr/range calcs for remap operations
Date: Thu, 28 Mar 2024 12:43:16 +1000
Message-ID: <20240328024317.2041851-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

dEQP-VK.sparse_resources.image_rebind.2d_array.r64i.128_128_8
was causing a remap operation like the below.

op_remap: prev: 0000003fffed0000 00000000000f0000 00000000a5abd18a 00000000=
00000000
op_remap: next:
op_remap: unmap: 0000003fffed0000 0000000000100000 0
op_map: map: 0000003ffffc0000 0000000000010000 000000005b1ba33c 00000000000=
e0000

This was resulting in an unmap operation from 0x3fffed0000+0xf0000, 0x10000=
0
which was corrupting the pagetables and oopsing the kernel.

Fixes the prev + unmap range calcs to use start/end and map back to addr/ra=
nge.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Cc: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouve=
au/nouveau_uvmm.c
index 9675ef25b16d..87bce1a9d073 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -813,15 +813,15 @@ op_remap(struct drm_gpuva_op_remap *r,
 =09struct drm_gpuva_op_unmap *u =3D r->unmap;
 =09struct nouveau_uvma *uvma =3D uvma_from_va(u->va);
 =09u64 addr =3D uvma->va.va.addr;
-=09u64 range =3D uvma->va.va.range;
+=09u64 end =3D uvma->va.va.addr + uvma->va.va.range;
=20
 =09if (r->prev)
 =09=09addr =3D r->prev->va.addr + r->prev->va.range;
=20
 =09if (r->next)
-=09=09range =3D r->next->va.addr - addr;
+=09=09end =3D r->next->va.addr;
=20
-=09op_unmap_range(u, addr, range);
+=09op_unmap_range(u, addr, end - addr);
 }
=20
 static int
--=20
2.43.2

