Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C375394E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 13:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47EB10E87A;
	Fri, 14 Jul 2023 11:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8FE10E87A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 11:13:18 +0000 (UTC)
Date: Fri, 14 Jul 2023 11:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689333195; x=1689592395;
 bh=M20EVF6bjlBZ9YNdxKREAq313j+dpyAlP08tCrCbzFk=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=FFl7ovIbtGwEuX+KhCsp70Wt8m+QOn2c3kZPO04PlEOE2VtdyJynwptQC6mYctHvX
 mbwi0X3hm7hSSBXsHT+FQ/MWYO3Az7Xmq5rI9jY3GnwwH3tD+lyEMn3qGOoGZaMbUE
 /w4uVjOoeDeNl6NNdkGo2SLoeI/buoX486QXbwnw29O5oEyU1JJ4nLq0azQQaNMuRw
 KfSeF5vxUC9HzJhNXm5Jqz0dunj0rXiqvsLsVCrUwblDeZIW7H3uri7ARpWHm71+qG
 ZeRLKfU74HSHd+mHmzmBplauiaDomMGfrckMN+ldljHvI6aZ5DfW54qocnpo5zsvmI
 vf0wH3WVHyv7A==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v4] drm/syncobj: add IOCTL to register an eventfd
Message-ID: <20230714111257.11940-1-contact@emersion.fr>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jason Ekstrand <jason@jlekstrand.net>, James Jones <jajones@nvidia.com>,
 Austin Shafer <ashafer@nvidia.com>, Vitaly Prosyak <vprosyak@amd.com>,
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

Requirements for new uAPI:

- User-space patch: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_=
requests/4262
- IGT: https://lists.freedesktop.org/archives/igt-dev/2023-July/057893.html

v2:
- Wait for fence when flags is zero
- Improve documentation (Pekka)
- Rename IOCTL (Christian)
- Fix typo in drm_syncobj_add_eventfd() (Christian)

v3:
- Link user-space + IGT patches
- Add reference from overview docs

v4: fix IOCTL number conflict with GETFB2 (Vitaly Prosyak)

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: James Jones <jajones@nvidia.com>
Cc: Austin Shafer <ashafer@nvidia.com>
Cc: Vitaly Prosyak <vprosyak@amd.com>
---
 drivers/gpu/drm/drm_internal.h |   2 +
 drivers/gpu/drm/drm_ioctl.c    |   2 +
 drivers/gpu/drm/drm_syncobj.c  | 147 +++++++++++++++++++++++++++++++--
 include/drm/drm_syncobj.h      |   6 +-
 include/uapi/drm/drm.h         |  23 ++++++
 5 files changed, 173 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.=
h
index d7e023bbb0d5..ba12acd55139 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -245,6 +245,8 @@ int drm_syncobj_wait_ioctl(struct drm_device *dev, void=
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
index 8e9afe7af19c..f03ffbacfe9b 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -701,6 +701,8 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
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
index 0c2be8360525..0f1cb70413af 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -136,6 +136,10 @@
  * requirement is inherited from the wait-before-signal behavior required =
by
  * the Vulkan timeline semaphore API.
  *
+ * Alternatively, &DRM_IOCTL_SYNCOBJ_EVENTFD can be used to wait without
+ * blocking: an eventfd will be signaled when the syncobj is. This is usef=
ul to
+ * integrate the wait in an event loop.
+ *
  *
  * Import/export of syncobjs
  * -------------------------
@@ -185,6 +189,7 @@
=20
 #include <linux/anon_inodes.h>
 #include <linux/dma-fence-unwrap.h>
+#include <linux/eventfd.h>
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/sched/signal.h>
@@ -212,6 +217,20 @@ struct syncobj_wait_entry {
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
@@ -274,6 +293,27 @@ static void drm_syncobj_remove_wait(struct drm_syncobj=
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
@@ -288,7 +328,8 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj,
 =09=09=09   struct dma_fence *fence,
 =09=09=09   uint64_t point)
 {
-=09struct syncobj_wait_entry *cur, *tmp;
+=09struct syncobj_wait_entry *wait_cur, *wait_tmp;
+=09struct syncobj_eventfd_entry *ev_fd_cur, *ev_fd_tmp;
 =09struct dma_fence *prev;
=20
 =09dma_fence_get(fence);
@@ -302,8 +343,10 @@ void drm_syncobj_add_point(struct drm_syncobj *syncobj=
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
@@ -323,7 +366,8 @@ void drm_syncobj_replace_fence(struct drm_syncobj *sync=
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
@@ -335,8 +379,10 @@ void drm_syncobj_replace_fence(struct drm_syncobj *syn=
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
@@ -472,7 +518,13 @@ void drm_syncobj_free(struct kref *kref)
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
@@ -501,6 +553,7 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj=
, uint32_t flags,
=20
 =09kref_init(&syncobj->refcount);
 =09INIT_LIST_HEAD(&syncobj->cb_list);
+=09INIT_LIST_HEAD(&syncobj->ev_fd_list);
 =09spin_lock_init(&syncobj->lock);
=20
 =09if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
@@ -1304,6 +1357,88 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *d=
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
index a87bbbbca2d4..863e47200911 100644
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
@@ -1169,6 +1190,8 @@ extern "C" {
  */
 #define DRM_IOCTL_MODE_GETFB2=09=09DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
=20
+#define DRM_IOCTL_SYNCOBJ_EVENTFD=09DRM_IOWR(0xCF, struct drm_syncobj_even=
tfd)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
--=20
2.41.0


