Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB68A7BF0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 07:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4025B113175;
	Wed, 17 Apr 2024 05:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B21113174
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 05:40:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-ydoKEAtIPTS-JvCA_0Di7g-1; Wed,
 17 Apr 2024 01:40:39 -0400
X-MC-Unique: ydoKEAtIPTS-JvCA_0Di7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3047828EC114;
 Wed, 17 Apr 2024 05:40:39 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27D102166B31;
 Wed, 17 Apr 2024 05:40:37 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau: rip out busy fence waits
Date: Wed, 17 Apr 2024 15:40:32 +1000
Message-ID: <20240417054032.3145721-1-airlied@gmail.com>
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

I'm pretty sure this optimisation is actually not a great idea,
and is racy with other things waiting for fences.

Just nuke it, there should be no need to do fence waits in a
busy CPU loop.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c | 30 +------------------------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c   |  2 +-
 6 files changed, 6 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau=
/nouveau_bo.c
index 8a30f5a0525b..a4e8f625fce6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -902,7 +902,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int =
evict,
 =09 * Without this the operation can timeout and we'll fallback to a
 =09 * software copy, which might take several minutes to finish.
 =09 */
-=09nouveau_fence_wait(fence, false, false);
+=09nouveau_fence_wait(fence, false);
 =09ret =3D ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false,
 =09=09=09=09=09new_reg);
 =09nouveau_fence_unref(&fence);
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouve=
au/nouveau_chan.c
index 7c97b2886807..66fca95c10c7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -72,7 +72,7 @@ nouveau_channel_idle(struct nouveau_channel *chan)
=20
 =09=09ret =3D nouveau_fence_new(&fence, chan);
 =09=09if (!ret) {
-=09=09=09ret =3D nouveau_fence_wait(fence, false, false);
+=09=09=09ret =3D nouveau_fence_wait(fence, false);
 =09=09=09nouveau_fence_unref(&fence);
 =09=09}
=20
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouve=
au/nouveau_dmem.c
index 12feecf71e75..033a09cd3c8f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -128,7 +128,7 @@ static void nouveau_dmem_page_free(struct page *page)
 static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 {
 =09if (fence) {
-=09=09nouveau_fence_wait(*fence, true, false);
+=09=09nouveau_fence_wait(*fence, false);
 =09=09nouveau_fence_unref(fence);
 =09} else {
 =09=09/*
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouv=
eau/nouveau_fence.c
index c3ea3cd933cd..8de941379324 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -312,39 +312,11 @@ nouveau_fence_wait_legacy(struct dma_fence *f, bool i=
ntr, long wait)
 =09return timeout - t;
 }
=20
-static int
-nouveau_fence_wait_busy(struct nouveau_fence *fence, bool intr)
-{
-=09int ret =3D 0;
-
-=09while (!nouveau_fence_done(fence)) {
-=09=09if (time_after_eq(jiffies, fence->timeout)) {
-=09=09=09ret =3D -EBUSY;
-=09=09=09break;
-=09=09}
-
-=09=09__set_current_state(intr ?
-=09=09=09=09    TASK_INTERRUPTIBLE :
-=09=09=09=09    TASK_UNINTERRUPTIBLE);
-
-=09=09if (intr && signal_pending(current)) {
-=09=09=09ret =3D -ERESTARTSYS;
-=09=09=09break;
-=09=09}
-=09}
-
-=09__set_current_state(TASK_RUNNING);
-=09return ret;
-}
-
 int
-nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
+nouveau_fence_wait(struct nouveau_fence *fence, bool intr)
 {
 =09long ret;
=20
-=09if (!lazy)
-=09=09return nouveau_fence_wait_busy(fence, intr);
-
 =09ret =3D dma_fence_wait_timeout(&fence->base, intr, 15 * HZ);
 =09if (ret < 0)
 =09=09return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouv=
eau/nouveau_fence.h
index bc13110bdfa4..88213014b675 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -23,7 +23,7 @@ void nouveau_fence_unref(struct nouveau_fence **);
=20
 int  nouveau_fence_emit(struct nouveau_fence *);
 bool nouveau_fence_done(struct nouveau_fence *);
-int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
+int  nouveau_fence_wait(struct nouveau_fence *, bool intr);
 int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, boo=
l exclusive, bool intr);
=20
 struct nouveau_fence_chan {
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouvea=
u/nouveau_gem.c
index 49c2bcbef129..f715e381da69 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -928,7 +928,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void =
*data,
 =09}
=20
 =09if (sync) {
-=09=09if (!(ret =3D nouveau_fence_wait(fence, false, false))) {
+=09=09if (!(ret =3D nouveau_fence_wait(fence, false))) {
 =09=09=09if ((ret =3D dma_fence_get_status(&fence->base)) =3D=3D 1)
 =09=09=09=09ret =3D 0;
 =09=09}
--=20
2.43.2

