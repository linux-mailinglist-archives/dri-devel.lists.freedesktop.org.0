Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A6886DA51
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 04:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE6910EA60;
	Fri,  1 Mar 2024 03:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D020F10EA5C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 03:42:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-kjVIjD48P62QTvyD91GiUg-1; Thu,
 29 Feb 2024 22:42:42 -0500
X-MC-Unique: kjVIjD48P62QTvyD91GiUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94AC71C0512C;
 Fri,  1 Mar 2024 03:42:42 +0000 (UTC)
Received: from dreadlord.lan (unknown [10.64.136.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2D6492BC6;
 Fri,  1 Mar 2024 03:42:41 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH 2/2] nouveau/umem: rename nvkm client lock to umem_lock
Date: Fri,  1 Mar 2024 13:42:38 +1000
Message-ID: <20240301034238.3041715-2-airlied@gmail.com>
In-Reply-To: <20240301034238.3041715-1-airlied@gmail.com>
References: <20240301034238.3041715-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

This lock is just protecting the umem list so name it as such.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h |  2 +-
 drivers/gpu/drm/nouveau/nvkm/core/client.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c     | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h b/drivers/g=
pu/drm/nouveau/include/nvkm/core/client.h
index 932c9fd0b2d8..6ca50e864e86 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
@@ -17,7 +17,7 @@ struct nvkm_client {
 =09int (*event)(u64 token, void *argv, u32 argc);
=20
 =09struct list_head umem;
-=09spinlock_t lock;
+=09spinlock_t umem_lock;
 };
=20
 int  nvkm_client_new(const char *name, u64 device, const char *cfg, const =
char *dbg,
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/n=
ouveau/nvkm/core/client.c
index c55662937ab2..2885795f71d4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -183,6 +183,6 @@ nvkm_client_new(const char *name, u64 device, const cha=
r *cfg, const char *dbg,
 =09spin_lock_init(&client->obj_lock);
 =09client->event =3D event;
 =09INIT_LIST_HEAD(&client->umem);
-=09spin_lock_init(&client->lock);
+=09spin_lock_init(&client->umem_lock);
 =09return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/mmu/umem.c
index e530bb8b3b17..a16cc20b835f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
@@ -42,14 +42,14 @@ nvkm_umem_search(struct nvkm_client *client, u64 handle=
)
 =09object =3D nvkm_object_search(client, handle, &nvkm_umem);
 =09if (IS_ERR(object)) {
 =09=09if (client !=3D master) {
-=09=09=09spin_lock(&master->lock);
+=09=09=09spin_lock(&master->umem_lock);
 =09=09=09list_for_each_entry(umem, &master->umem, head) {
 =09=09=09=09if (umem->object.object =3D=3D handle) {
 =09=09=09=09=09memory =3D nvkm_memory_ref(umem->memory);
 =09=09=09=09=09break;
 =09=09=09=09}
 =09=09=09}
-=09=09=09spin_unlock(&master->lock);
+=09=09=09spin_unlock(&master->umem_lock);
 =09=09}
 =09} else {
 =09=09umem =3D nvkm_umem(object);
@@ -124,9 +124,9 @@ static void *
 nvkm_umem_dtor(struct nvkm_object *object)
 {
 =09struct nvkm_umem *umem =3D nvkm_umem(object);
-=09spin_lock(&umem->object.client->lock);
+=09spin_lock(&umem->object.client->umem_lock);
 =09list_del_init(&umem->head);
-=09spin_unlock(&umem->object.client->lock);
+=09spin_unlock(&umem->object.client->umem_lock);
 =09nvkm_memory_unref(&umem->memory);
 =09return umem;
 }
@@ -179,9 +179,9 @@ nvkm_umem_new(const struct nvkm_oclass *oclass, void *a=
rgv, u32 argc,
 =09if (ret)
 =09=09return ret;
=20
-=09spin_lock(&umem->object.client->lock);
+=09spin_lock(&umem->object.client->umem_lock);
 =09list_add(&umem->head, &umem->object.client->umem);
-=09spin_unlock(&umem->object.client->lock);
+=09spin_unlock(&umem->object.client->umem_lock);
=20
 =09args->v0.page =3D nvkm_memory_page(umem->memory);
 =09args->v0.addr =3D nvkm_memory_addr(umem->memory);
--=20
2.43.2

