Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AEF5FC55B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 14:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F29110E491;
	Wed, 12 Oct 2022 12:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57D010E491;
 Wed, 12 Oct 2022 12:33:03 +0000 (UTC)
Date: Wed, 12 Oct 2022 12:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1665577980; x=1665837180;
 bh=ebYazRzFDVy6dYHGoK8KELV868Ny7t08kBUgl0fwuu0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=bpxz5Pgg8aFMq4CrY6VHz2HnRsvTai1z6Ul14Jqx5PkySnv81su2oKw6OKvla1/Hd
 yJNkyzkZIkZ3FaS15YRGUBeqwjgLLR4WEL4rGIALzHxLnX30mM20HabzwWQ8MS1F/3
 wBqudRiJA287ECRPvACP4sa/GSNddTfJT0sDueOg6B51Ss4mWs17WykeETZKSUcxTx
 tUMVsoPgEB1+594F+trbj8k4wVPdxMl5+kP84v2eScCxHlbI1k+icVRJ16BYmZ25GK
 iqH85/pfsU5GJ1dd5CULnRjhbQXAOFud6P8EDaviWQQt29lBrWrJgX9wxF9YTEUQxS
 27nzE2pNtNtVA==
To: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm/syncobj: add IOCTL to register an eventfd
Message-ID: <20221012123241.337774-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, James Jones <jajones@nvidia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a new DRM_IOCTL_SYNCOBJ_EVENTFD IOCTL which signals an
eventfd from a syncobj.

This is useful for Wayland compositors to handle wait-before-submit.
Wayland clients can send a timeline point to the compositor
before the point has materialized yet, then compositors can wait
for the point to materialize via this new IOCTL.

The existing DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT IOCTL is not suitable
because it blocks. Compositors want to integrate the wait with
their poll(2)-based event loop.

v2:
- Wait for fence when flags is zero
- Improve documentation (Pekka)
- Rename IOCTL (Christian)
- Fix typo in drm_syncobj_add_eventfd() (Christian)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: James Jones <jajones@nvidia.com>
---

Toy user-space available at:
https://paste.sr.ht/~emersion/674bd4fc614570f262b5bb2213be5c77d68944ac

 drivers/gpu/drm/drm_internal.h |   2 +
 drivers/gpu/drm/drm_ioctl.c    |   2 +
 drivers/gpu/drm/drm_syncobj.c  | 143 +++++++++++++++++++++++++++++++--
 include/drm/drm_syncobj.h      |   6 +-
 include/uapi/drm/drm.h         |  22 +++++
 5 files changed, 168 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.=
h
index 1fbbc19f1ac0..ca320e155b69 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -242,6 +242,8 @@ int drm_syncobj_wait_ioctl(struct drm_device *dev, void=
 *data,
 =09=09=09   struct drm_file *file_private);
 int drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 =09=09=09=09    struct drm_file *file_private);
+int drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
+=09=09=09      struct drm_file *file_private);
 int drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
 =09=09=09    struct drm_file *file_private);
 int drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ca2a6e6101dc..95ec9a02f8a7 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -702,6 +702,8 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
 =09=09      DRM_RENDER_ALLOW),
 =09DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT, drm_syncobj_timeline_wai=
t_ioctl,
 =09=09      DRM_RENDER_ALLOW),
+=09DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_EVENTFD, drm_syncobj_eventfd_ioctl,
+=09=09      DRM_RENDER_ALLOW),
 =09DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_RESET, drm_syncobj_reset_ioctl,
 =09=09      DRM_RENDER_ALLOW),
 =09DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_SIGNAL, drm_syncobj_signal_ioctl,
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..659577ad8c07 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -185,6 +185,7 @@
=20
 #include <linux/anon_inodes.h>
 #include <linux/dma-fence-unwrap.h>
+#include <linux/eventfd.h>
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/sched/signal.h>
@@ -212,6 +213,20 @@ struct syncobj_wait_entry {
 static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
 =09=09=09=09      struct syncobj_wait_entry *wait);
=20
+struct syncobj_eventfd_entry {
+=09struct list_head node;
+=09struct dma_fence *fence;
+=09struct dma_fence_cb fence_cb;
+=09struct drm_syncobj *syncobj;
+=09struct eventfd_ctx *ev_fd_ctx;
+=09u64 point;
+=09u32 flags;
+};
+
+static void
+syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
+=09=09=09   struct syncobj_eventfd_entry *entry);
+
 /**
  * drm_syncobj_find - lookup and reference a sync object.
  * @file_private: drm file private pointer
@@ -274,6 +289,27 @@ static void drm_syncobj_remove_wait(struct drm_syncobj=
 *syncobj,
 =09spin_unlock(&syncobj->lock);
 }
=20
+static void
+syncobj_eventfd_entry_free(struct syncobj_eventfd_entry *entry)
+{
+=09eventfd_ctx_put(entry->ev_fd_ctx);
+=09dma_fence_put(entry->fence);
+=09/* This happens either inside the syncobj lock, or after the node has
+=09 * already been removed from the list */
+=09list_del(&entry->node);
+=09kfree(entry);
+}
+
+static void
+drm_syncobj_add_eventfd(struct drm_syncobj *syncobj,
+=09=09=09struct syncobj_eventfd_entry *entry)
+{
+=09spin_lock(&syncobj->lock);
+=09list_add_tail(&entry->node, &syncobj->ev_fd_list);
+=09syncobj_eventfd_entry_func(syncobj, entry);
+=09spin_unlock(&syncobj->lock);
+}
+
 /**
  * drm_syncobj_add_point - add new timeline point to the syncobj
  * @syncobj: sync object to add timeline point do
@@ -288,7 +324,8 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
 =09=09=09   struct dma_fence *fence,
 =09=09=09   uint64_t point)
 {
-=09struct syncobj_wait_entry *cur, *tmp;
+=09struct syncobj_wait_entry *wait_cur, *wait_tmp;
+=09struct syncobj_eventfd_entry *ev_fd_cur, *ev_fd_tmp;
 =09struct dma_fence *prev;
=20
 =09dma_fence_get(fence);
@@ -302,8 +339,10 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj=
,
 =09dma_fence_chain_init(chain, prev, fence, point);
 =09rcu_assign_pointer(syncobj->fence, &chain->base);
=20
-=09list_for_each_entry_safe(cur, tmp, &syncobj->cb_list, node)
-=09=09syncobj_wait_syncobj_func(syncobj, cur);
+=09list_for_each_entry_safe(wait_cur, wait_tmp, &syncobj->cb_list, node)
+=09=09syncobj_wait_syncobj_func(syncobj, wait_cur);
+=09list_for_each_entry_safe(ev_fd_cur, ev_fd_tmp, &syncobj->ev_fd_list, no=
de)
+=09=09syncobj_eventfd_entry_func(syncobj, ev_fd_cur);
 =09spin_unlock(&syncobj->lock);
=20
 =09/* Walk the chain once to trigger garbage collection */
@@ -323,7 +362,8 @@ void drm_syncobj_replace_fence(struct drm_syncobj *sync=
obj,
 =09=09=09       struct dma_fence *fence)
 {
 =09struct dma_fence *old_fence;
-=09struct syncobj_wait_entry *cur, *tmp;
+=09struct syncobj_wait_entry *wait_cur, *wait_tmp;
+=09struct syncobj_eventfd_entry *ev_fd_cur, *ev_fd_tmp;
=20
 =09if (fence)
 =09=09dma_fence_get(fence);
@@ -335,8 +375,10 @@ void drm_syncobj_replace_fence(struct drm_syncobj *syn=
cobj,
 =09rcu_assign_pointer(syncobj->fence, fence);
=20
 =09if (fence !=3D old_fence) {
-=09=09list_for_each_entry_safe(cur, tmp, &syncobj->cb_list, node)
-=09=09=09syncobj_wait_syncobj_func(syncobj, cur);
+=09=09list_for_each_entry_safe(wait_cur, wait_tmp, &syncobj->cb_list, node=
)
+=09=09=09syncobj_wait_syncobj_func(syncobj, wait_cur);
+=09=09list_for_each_entry_safe(ev_fd_cur, ev_fd_tmp, &syncobj->ev_fd_list,=
 node)
+=09=09=09syncobj_eventfd_entry_func(syncobj, ev_fd_cur);
 =09}
=20
 =09spin_unlock(&syncobj->lock);
@@ -472,7 +514,13 @@ void drm_syncobj_free(struct kref *kref)
 =09struct drm_syncobj *syncobj =3D container_of(kref,
 =09=09=09=09=09=09   struct drm_syncobj,
 =09=09=09=09=09=09   refcount);
+=09struct syncobj_eventfd_entry *ev_fd_cur, *ev_fd_tmp;
+
 =09drm_syncobj_replace_fence(syncobj, NULL);
+
+=09list_for_each_entry_safe(ev_fd_cur, ev_fd_tmp, &syncobj->ev_fd_list, no=
de)
+=09=09syncobj_eventfd_entry_free(ev_fd_cur);
+
 =09kfree(syncobj);
 }
 EXPORT_SYMBOL(drm_syncobj_free);
@@ -501,6 +549,7 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj=
, uint32_t flags,
=20
 =09kref_init(&syncobj->refcount);
 =09INIT_LIST_HEAD(&syncobj->cb_list);
+=09INIT_LIST_HEAD(&syncobj->ev_fd_list);
 =09spin_lock_init(&syncobj->lock);
=20
 =09if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
@@ -1304,6 +1353,88 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *d=
ev, void *data,
 =09return ret;
 }
=20
+static void syncobj_eventfd_entry_fence_func(struct dma_fence *fence,
+=09=09=09=09=09     struct dma_fence_cb *cb)
+{
+=09struct syncobj_eventfd_entry *entry =3D
+=09=09container_of(cb, struct syncobj_eventfd_entry, fence_cb);
+
+=09eventfd_signal(entry->ev_fd_ctx, 1);
+=09syncobj_eventfd_entry_free(entry);
+}
+
+static void
+syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
+=09=09=09   struct syncobj_eventfd_entry *entry)
+{
+=09int ret;
+=09struct dma_fence *fence;
+
+=09/* This happens inside the syncobj lock */
+=09fence =3D dma_fence_get(rcu_dereference_protected(syncobj->fence, 1));
+=09ret =3D dma_fence_chain_find_seqno(&fence, entry->point);
+=09if (ret !=3D 0 || !fence) {
+=09=09dma_fence_put(fence);
+=09=09return;
+=09}
+
+=09list_del_init(&entry->node);
+=09entry->fence =3D fence;
+
+=09if (entry->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) {
+=09=09eventfd_signal(entry->ev_fd_ctx, 1);
+=09=09syncobj_eventfd_entry_free(entry);
+=09} else {
+=09=09ret =3D dma_fence_add_callback(fence, &entry->fence_cb,
+=09=09=09=09=09     syncobj_eventfd_entry_fence_func);
+=09=09if (ret =3D=3D -ENOENT) {
+=09=09=09eventfd_signal(entry->ev_fd_ctx, 1);
+=09=09=09syncobj_eventfd_entry_free(entry);
+=09=09}
+=09}
+}
+
+int
+drm_syncobj_eventfd_ioctl(struct drm_device *dev, void *data,
+=09=09=09  struct drm_file *file_private)
+{
+=09struct drm_syncobj_eventfd *args =3D data;
+=09struct drm_syncobj *syncobj;
+=09struct eventfd_ctx *ev_fd_ctx;
+=09struct syncobj_eventfd_entry *entry;
+
+=09if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
+=09=09return -EOPNOTSUPP;
+
+=09if (args->flags & ~DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)
+=09=09return -EINVAL;
+
+=09if (args->pad)
+=09=09return -EINVAL;
+
+=09syncobj =3D drm_syncobj_find(file_private, args->handle);
+=09if (!syncobj)
+=09=09return -ENOENT;
+
+=09ev_fd_ctx =3D eventfd_ctx_fdget(args->fd);
+=09if (IS_ERR(ev_fd_ctx))
+=09=09return PTR_ERR(ev_fd_ctx);
+
+=09entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
+=09if (!entry) {
+=09=09eventfd_ctx_put(ev_fd_ctx);
+=09=09return -ENOMEM;
+=09}
+=09entry->syncobj =3D syncobj;
+=09entry->ev_fd_ctx =3D ev_fd_ctx;
+=09entry->point =3D args->point;
+=09entry->flags =3D args->flags;
+
+=09drm_syncobj_add_eventfd(syncobj, entry);
+=09drm_syncobj_put(syncobj);
+
+=09return 0;
+}
=20
 int
 drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 6cf7243a1dc5..b40052132e52 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -54,7 +54,11 @@ struct drm_syncobj {
 =09 */
 =09struct list_head cb_list;
 =09/**
-=09 * @lock: Protects &cb_list and write-locks &fence.
+=09 * @ev_fd_list: List of registered eventfd.
+=09 */
+=09struct list_head ev_fd_list;
+=09/**
+=09 * @lock: Protects &cb_list and &ev_fd_list, and write-locks &fence.
 =09 */
 =09spinlock_t lock;
 =09/**
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 642808520d92..5ac0a48b0169 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -909,6 +909,27 @@ struct drm_syncobj_timeline_wait {
 =09__u32 pad;
 };
=20
+/**
+ * struct drm_syncobj_eventfd
+ * @handle: syncobj handle.
+ * @flags: Zero to wait for the point to be signalled, or
+ *         &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE to wait for a fence to b=
e
+ *         available for the point.
+ * @point: syncobj timeline point (set to zero for binary syncobjs).
+ * @fd: Existing eventfd to sent events to.
+ * @pad: Must be zero.
+ *
+ * Register an eventfd to be signalled by a syncobj. The eventfd counter w=
ill
+ * be incremented by one.
+ */
+struct drm_syncobj_eventfd {
+=09__u32 handle;
+=09__u32 flags;
+=09__u64 point;
+=09__s32 fd;
+=09__u32 pad;
+};
+
=20
 struct drm_syncobj_array {
 =09__u64 handles;
@@ -1095,6 +1116,7 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_QUERY=09=09DRM_IOWR(0xCB, struct drm_syncobj_tim=
eline_array)
 #define DRM_IOCTL_SYNCOBJ_TRANSFER=09DRM_IOWR(0xCC, struct drm_syncobj_tra=
nsfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL=09DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
+#define DRM_IOCTL_SYNCOBJ_EVENTFD=09DRM_IOWR(0xCE, struct drm_syncobj_even=
tfd)
=20
 /**
  * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
--=20
2.38.0


