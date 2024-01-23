Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59668387F0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 08:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3576310E14D;
	Tue, 23 Jan 2024 07:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3435A10E41B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 07:25:47 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-ZbVuWzwbMlWUt0MHVum_PQ-1; Tue, 23 Jan 2024 02:25:41 -0500
X-MC-Unique: ZbVuWzwbMlWUt0MHVum_PQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6049510135ED;
 Tue, 23 Jan 2024 07:25:41 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58402C0FDCA;
 Tue, 23 Jan 2024 07:25:40 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau: rip out fence irq allow/block sequences.
Date: Tue, 23 Jan 2024 17:25:38 +1000
Message-ID: <20240123072538.1290035-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

fences are signalled on nvidia hw using non-stall interrupts.

non-stall interrupts are not latched from my reading.

When nouveau emits a fence, it requests a NON_STALL signalling,
but it only calls the interface to allow the non-stall irq to happen
after it has already emitted the fence. A recent change
eacabb546271 ("nouveau: push event block/allowing out of the fence context"=
)
made this worse by pushing out the fence allow/block to a workqueue.

However I can't see how this could ever work great, since when
enable signalling is called, the semaphore has already been emitted
to the ring, and the hw could already have tried to set the bits,
but it's been masked off. Changing the allowed mask later won't make
the interrupt get called again.

For now rip all of this out.

This fixes a bunch of stalls seen running VK CTS sync tests.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 77 +++++--------------------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  2 -
 2 files changed, 16 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouv=
eau/nouveau_fence.c
index 5057d976fa57..d6d50cdccf75 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -50,24 +50,14 @@ nouveau_fctx(struct nouveau_fence *fence)
 =09return container_of(fence->base.lock, struct nouveau_fence_chan, lock);
 }
=20
-static int
+static void
 nouveau_fence_signal(struct nouveau_fence *fence)
 {
-=09int drop =3D 0;
-
 =09dma_fence_signal_locked(&fence->base);
 =09list_del(&fence->head);
 =09rcu_assign_pointer(fence->channel, NULL);
=20
-=09if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
-=09=09struct nouveau_fence_chan *fctx =3D nouveau_fctx(fence);
-
-=09=09if (atomic_dec_and_test(&fctx->notify_ref))
-=09=09=09drop =3D 1;
-=09}
-
 =09dma_fence_put(&fence->base);
-=09return drop;
 }
=20
 static struct nouveau_fence *
@@ -93,8 +83,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fct=
x, int error)
 =09=09if (error)
 =09=09=09dma_fence_set_error(&fence->base, error);
=20
-=09=09if (nouveau_fence_signal(fence))
-=09=09=09nvif_event_block(&fctx->event);
+=09=09nouveau_fence_signal(fence);
 =09}
 =09fctx->killed =3D 1;
 =09spin_unlock_irqrestore(&fctx->lock, flags);
@@ -103,8 +92,8 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fc=
tx, int error)
 void
 nouveau_fence_context_del(struct nouveau_fence_chan *fctx)
 {
-=09cancel_work_sync(&fctx->allow_block_work);
 =09nouveau_fence_context_kill(fctx, 0);
+=09nvif_event_block(&fctx->event);
 =09nvif_event_dtor(&fctx->event);
 =09fctx->dead =3D 1;
=20
@@ -127,11 +116,10 @@ nouveau_fence_context_free(struct nouveau_fence_chan =
*fctx)
 =09kref_put(&fctx->fence_ref, nouveau_fence_context_put);
 }
=20
-static int
+static void
 nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_ch=
an *fctx)
 {
 =09struct nouveau_fence *fence;
-=09int drop =3D 0;
 =09u32 seq =3D fctx->read(chan);
=20
 =09while (!list_empty(&fctx->pending)) {
@@ -140,10 +128,8 @@ nouveau_fence_update(struct nouveau_channel *chan, str=
uct nouveau_fence_chan *fc
 =09=09if ((int)(seq - fence->base.seqno) < 0)
 =09=09=09break;
=20
-=09=09drop |=3D nouveau_fence_signal(fence);
+=09=09nouveau_fence_signal(fence);
 =09}
-
-=09return drop;
 }
=20
 static int
@@ -160,26 +146,13 @@ nouveau_fence_wait_uevent_handler(struct nvif_event *=
event, void *repv, u32 repc
=20
 =09=09fence =3D list_entry(fctx->pending.next, typeof(*fence), head);
 =09=09chan =3D rcu_dereference_protected(fence->channel, lockdep_is_held(&=
fctx->lock));
-=09=09if (nouveau_fence_update(chan, fctx))
-=09=09=09ret =3D NVIF_EVENT_DROP;
+=09=09nouveau_fence_update(chan, fctx);
 =09}
 =09spin_unlock_irqrestore(&fctx->lock, flags);
=20
 =09return ret;
 }
=20
-static void
-nouveau_fence_work_allow_block(struct work_struct *work)
-{
-=09struct nouveau_fence_chan *fctx =3D container_of(work, struct nouveau_f=
ence_chan,
-=09=09=09=09=09=09       allow_block_work);
-
-=09if (atomic_read(&fctx->notify_ref) =3D=3D 0)
-=09=09nvif_event_block(&fctx->event);
-=09else
-=09=09nvif_event_allow(&fctx->event);
-}
-
 void
 nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fen=
ce_chan *fctx)
 {
@@ -191,7 +164,6 @@ nouveau_fence_context_new(struct nouveau_channel *chan,=
 struct nouveau_fence_cha
 =09} args;
 =09int ret;
=20
-=09INIT_WORK(&fctx->allow_block_work, nouveau_fence_work_allow_block);
 =09INIT_LIST_HEAD(&fctx->flip);
 =09INIT_LIST_HEAD(&fctx->pending);
 =09spin_lock_init(&fctx->lock);
@@ -216,6 +188,12 @@ nouveau_fence_context_new(struct nouveau_channel *chan=
, struct nouveau_fence_cha
 =09=09=09      &args.base, sizeof(args), &fctx->event);
=20
 =09WARN_ON(ret);
+
+=09/*
+=09 * Always allow non-stall irq events - previously this code tried to
+=09 * enable/disable them, but that just seems racy as nonstall irqs are u=
nlatched.
+=09 */
+=09nvif_event_allow(&fctx->event);
 }
=20
 int
@@ -247,8 +225,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 =09=09=09return -ENODEV;
 =09=09}
=20
-=09=09if (nouveau_fence_update(chan, fctx))
-=09=09=09nvif_event_block(&fctx->event);
+=09=09nouveau_fence_update(chan, fctx);
=20
 =09=09list_add_tail(&fence->head, &fctx->pending);
 =09=09spin_unlock_irq(&fctx->lock);
@@ -271,8 +248,8 @@ nouveau_fence_done(struct nouveau_fence *fence)
=20
 =09=09spin_lock_irqsave(&fctx->lock, flags);
 =09=09chan =3D rcu_dereference_protected(fence->channel, lockdep_is_held(&=
fctx->lock));
-=09=09if (chan && nouveau_fence_update(chan, fctx))
-=09=09=09nvif_event_block(&fctx->event);
+=09=09if (chan)
+=09=09=09nouveau_fence_update(chan, fctx);
 =09=09spin_unlock_irqrestore(&fctx->lock, flags);
 =09}
 =09return dma_fence_is_signaled(&fence->base);
@@ -530,32 +507,10 @@ static const struct dma_fence_ops nouveau_fence_ops_l=
egacy =3D {
 =09.release =3D nouveau_fence_release
 };
=20
-static bool nouveau_fence_enable_signaling(struct dma_fence *f)
-{
-=09struct nouveau_fence *fence =3D from_fence(f);
-=09struct nouveau_fence_chan *fctx =3D nouveau_fctx(fence);
-=09bool ret;
-=09bool do_work;
-
-=09if (atomic_inc_return(&fctx->notify_ref) =3D=3D 0)
-=09=09do_work =3D true;
-
-=09ret =3D nouveau_fence_no_signaling(f);
-=09if (ret)
-=09=09set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
-=09else if (atomic_dec_and_test(&fctx->notify_ref))
-=09=09do_work =3D true;
-
-=09if (do_work)
-=09=09schedule_work(&fctx->allow_block_work);
-
-=09return ret;
-}
-
 static const struct dma_fence_ops nouveau_fence_ops_uevent =3D {
 =09.get_driver_name =3D nouveau_fence_get_get_driver_name,
 =09.get_timeline_name =3D nouveau_fence_get_timeline_name,
-=09.enable_signaling =3D nouveau_fence_enable_signaling,
+=09.enable_signaling =3D nouveau_fence_no_signaling,
 =09.signaled =3D nouveau_fence_is_signaled,
 =09.release =3D nouveau_fence_release
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouv=
eau/nouveau_fence.h
index 28f5cf013b89..380bb0397ed2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -46,8 +46,6 @@ struct nouveau_fence_chan {
 =09char name[32];
=20
 =09struct nvif_event event;
-=09struct work_struct allow_block_work;
-=09atomic_t notify_ref;
 =09int dead, killed;
 };
=20
--=20
2.43.0

