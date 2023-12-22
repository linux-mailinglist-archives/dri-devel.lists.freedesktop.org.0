Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2181C3EC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 05:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399BB10E73E;
	Fri, 22 Dec 2023 04:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589D110E741
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 04:33:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-GjuJcvw7Pi2NugIX1ZVTMg-1; Thu, 21 Dec 2023 23:33:27 -0500
X-MC-Unique: GjuJcvw7Pi2NugIX1ZVTMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DB31185A780;
 Fri, 22 Dec 2023 04:33:27 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E8912026D66;
 Fri, 22 Dec 2023 04:33:26 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 10/11] nouveau: push event block/allowing out of the fence
 context
Date: Fri, 22 Dec 2023 14:31:59 +1000
Message-ID: <20231222043308.3090089-11-airlied@gmail.com>
In-Reply-To: <20231222043308.3090089-1-airlied@gmail.com>
References: <20231222043308.3090089-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

There is a deadlock between the irq and fctx locks,
the irq handling takes irq then fctx lock
the fence signalling takes fctx then irq lock

This splits the fence signalling path so the code that hits
the irq lock is done in a separate work queue.

This seems to fix crashes/hangs when using nouveau gsp with
i915 primary GPU.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 28 ++++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_fence.h |  5 ++++-
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouv=
eau/nouveau_fence.c
index ca762ea55413..5057d976fa57 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -62,7 +62,7 @@ nouveau_fence_signal(struct nouveau_fence *fence)
 =09if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
 =09=09struct nouveau_fence_chan *fctx =3D nouveau_fctx(fence);
=20
-=09=09if (!--fctx->notify_ref)
+=09=09if (atomic_dec_and_test(&fctx->notify_ref))
 =09=09=09drop =3D 1;
 =09}
=20
@@ -103,6 +103,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *f=
ctx, int error)
 void
 nouveau_fence_context_del(struct nouveau_fence_chan *fctx)
 {
+=09cancel_work_sync(&fctx->allow_block_work);
 =09nouveau_fence_context_kill(fctx, 0);
 =09nvif_event_dtor(&fctx->event);
 =09fctx->dead =3D 1;
@@ -167,6 +168,18 @@ nouveau_fence_wait_uevent_handler(struct nvif_event *e=
vent, void *repv, u32 repc
 =09return ret;
 }
=20
+static void
+nouveau_fence_work_allow_block(struct work_struct *work)
+{
+=09struct nouveau_fence_chan *fctx =3D container_of(work, struct nouveau_f=
ence_chan,
+=09=09=09=09=09=09       allow_block_work);
+
+=09if (atomic_read(&fctx->notify_ref) =3D=3D 0)
+=09=09nvif_event_block(&fctx->event);
+=09else
+=09=09nvif_event_allow(&fctx->event);
+}
+
 void
 nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fen=
ce_chan *fctx)
 {
@@ -178,6 +191,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan,=
 struct nouveau_fence_cha
 =09} args;
 =09int ret;
=20
+=09INIT_WORK(&fctx->allow_block_work, nouveau_fence_work_allow_block);
 =09INIT_LIST_HEAD(&fctx->flip);
 =09INIT_LIST_HEAD(&fctx->pending);
 =09spin_lock_init(&fctx->lock);
@@ -521,15 +535,19 @@ static bool nouveau_fence_enable_signaling(struct dma=
_fence *f)
 =09struct nouveau_fence *fence =3D from_fence(f);
 =09struct nouveau_fence_chan *fctx =3D nouveau_fctx(fence);
 =09bool ret;
+=09bool do_work;
=20
-=09if (!fctx->notify_ref++)
-=09=09nvif_event_allow(&fctx->event);
+=09if (atomic_inc_return(&fctx->notify_ref) =3D=3D 0)
+=09=09do_work =3D true;
=20
 =09ret =3D nouveau_fence_no_signaling(f);
 =09if (ret)
 =09=09set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
-=09else if (!--fctx->notify_ref)
-=09=09nvif_event_block(&fctx->event);
+=09else if (atomic_dec_and_test(&fctx->notify_ref))
+=09=09do_work =3D true;
+
+=09if (do_work)
+=09=09schedule_work(&fctx->allow_block_work);
=20
 =09return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouv=
eau/nouveau_fence.h
index 64d33ae7f356..28f5cf013b89 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -3,6 +3,7 @@
 #define __NOUVEAU_FENCE_H__
=20
 #include <linux/dma-fence.h>
+#include <linux/workqueue.h>
 #include <nvif/event.h>
=20
 struct nouveau_drm;
@@ -45,7 +46,9 @@ struct nouveau_fence_chan {
 =09char name[32];
=20
 =09struct nvif_event event;
-=09int notify_ref, dead, killed;
+=09struct work_struct allow_block_work;
+=09atomic_t notify_ref;
+=09int dead, killed;
 };
=20
 struct nouveau_fence_priv {
--=20
2.43.0

