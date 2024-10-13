Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A410099B99E
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 15:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D324010E1EF;
	Sun, 13 Oct 2024 13:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="JnzUaWzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD8C10E1EF
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1728826482; x=1729085682;
 bh=JfNvxtydMufGoZRFeRXZnPwQUfag36ZtOsPKcC46aR0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=JnzUaWztNUaFO1dcCb6yt87dxNpYe+NAGlx9+HFLzKoCQn5pPF4ifZCuby/eR0juF
 mHM/h2zyXUzow+qo/sWIAxqL/d2jRhd2+UAtp30VDl/Qtine3mb4MNUUhgqfDk35lK
 KB0hTKmmO2CGEEFyNu0YM+Ze7zWNlhnhKWBALprT1tx4PalL9N7qNybwPKjpibtTsL
 0sTcc2e7aDH/O7AYpsa6s4xziTf4Dqhg9wZNpH72cO7cyZnk3KiU/e7dFEn2VWdjkn
 VVwdV8810in44zSWMP0ZCJ30VkyKnLQuf1b1IwxGWL2n0Q5IWvi58FVT0DmiHxlUX+
 qP4ubuq9ecnyQ==
Date: Sun, 13 Oct 2024 13:34:39 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Austin Shafer <ashafer@nvidia.com>
Subject: [RFC PATCH] drm/prime: introduce DRM_PRIME_FD_TO_HANDLE_NO_MOVE
Message-ID: <20241013133431.1356874-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: a07960fbb79667843ff9d317d4f9359a1e3b9866
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a flag to opt-out of the automagic buffer migration to
system memory when importing a DMA-BUF.

In multi-GPU scenarii, a Wayland client might allocate on any
device. The Wayland compositor receiving the DMA-BUF has no clue
where the buffer has been allocated from. The compositor will
typically try to import the buffer into its "primary" device,
although it would be capable of importing into any DRM device.

This causes issues in case buffer imports implicitly result in
the buffer being moved to system memory. For instance, on a
system with an Intel iGPU and an AMD dGPU, a client rendering
with the dGPU and whose window is displayed on a screen
connected to the dGPU would ideally not need any roundtrip
to the iGPU. However, any attempt at figuring out where the
DMA-BUF could be accessed from will move the buffer into system
memory, degrading performance for the rest of the lifetime of the
buffer.

Describing on which device the buffer has been allocated on is
not enough: on some setups the buffer may have been allocated on
one device but may still be directly accessible without any move
on another device. For instance, on a split render/display system,
a buffer allocated on the display device can be directly rendered
to from the render device.

With this new flag, a compositor can try to import on all DRM
devices without any side effects. If it finds a device which can
access the buffer without a move, it can use that device to render
the buffer. If it doesn't, it can fallback to the previous
behavior: try to import without the flag to the "primary" device,
knowing this could result in a move to system memory.

This is a very incomplete implementation: it just checks whether
the buffer was allocated from the main device it's imported to,
and if not, passes a flag to dma_buf_attach() checked by i915
only. All other drivers need to be wired up, and the DMA-BUF API
changes are just the first thing I could think of and unlikely
to be the best design.

The goal of this RFC is to gather feedback: would the general
idea of the new uAPI addition make sense to you? If so, do you
see a better way to plumb it in the DMA-BUF framework?

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Austin Shafer <ashafer@nvidia.com>
---
 drivers/dma-buf/dma-buf.c                     | 11 ++++++--
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
 drivers/gpu/drm/drm_prime.c                   | 25 ++++++++++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  9 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  7 ++++++
 drivers/gpu/drm/xe/xe_dma_buf.c               |  2 +-
 drivers/infiniband/core/umem_dmabuf.c         |  3 ++-
 include/drm/drm_prime.h                       |  9 ++++---
 include/linux/dma-buf.h                       |  6 ++++-
 include/uapi/drm/drm.h                        |  3 ++-
 11 files changed, 62 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index fbbb750bc5b1..98ff03067fe7 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -902,7 +902,7 @@ static struct sg_table * __map_dma_buf(struct dma_buf_a=
ttachment *attach,
 struct dma_buf_attachment *
 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 =09=09       const struct dma_buf_attach_ops *importer_ops,
-=09=09       void *importer_priv)
+=09=09       void *importer_priv, int flags)
 {
 =09struct dma_buf_attachment *attach;
 =09int ret;
@@ -925,6 +925,13 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct =
device *dev,
 =09attach->importer_priv =3D importer_priv;
=20
 =09if (dmabuf->ops->attach) {
+=09=09if (DMA_BUF_ATTACH_NO_MOVE &&
+=09=09    (!dmabuf->ops->attach_needs_move ||
+=09=09      dmabuf->ops->attach_needs_move(dmabuf, attach))) {
+=09=09=09ret =3D -EINVAL;
+=09=09=09goto err_attach;
+=09=09}
+
 =09=09ret =3D dmabuf->ops->attach(dmabuf, attach);
 =09=09if (ret)
 =09=09=09goto err_attach;
@@ -989,7 +996,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, DMA_BUF);
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 =09=09=09=09=09  struct device *dev)
 {
-=09return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
+=09return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL, 0);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_attach, DMA_BUF);
=20
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index ce5ca304dba9..4059c9e114e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2452,7 +2452,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf_fd(struct amdgp=
u_device *adev, int fd,
 =09int ret;
=20
 =09ret =3D drm_gem_prime_fd_to_handle(&adev->ddev, adev->kfd.client.file, =
fd,
-=09=09=09=09=09 &handle);
+=09=09=09=09=09 &handle, 0);
 =09if (ret)
 =09=09return ret;
 =09obj =3D drm_gem_object_lookup(adev->kfd.client.file, handle);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_dma_buf.c
index 8e81a83d37d8..ccda002b98f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -430,7 +430,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct d=
rm_device *dev,
 =09=09return obj;
=20
 =09attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
-=09=09=09=09=09&amdgpu_dma_buf_attach_ops, obj);
+=09=09=09=09=09&amdgpu_dma_buf_attach_ops, obj, 0);
 =09if (IS_ERR(attach)) {
 =09=09drm_gem_object_put(obj);
 =09=09return ERR_CAST(attach);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 0e3f8adf162f..7207273c04fa 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -294,7 +294,7 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
  */
 int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 =09=09=09       struct drm_file *file_priv, int prime_fd,
-=09=09=09       uint32_t *handle)
+=09=09=09       uint32_t *handle, uint32_t flags)
 {
 =09struct dma_buf *dma_buf;
 =09struct drm_gem_object *obj;
@@ -314,9 +314,10 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 =09/* never seen this one, need to import */
 =09mutex_lock(&dev->object_name_lock);
 =09if (dev->driver->gem_prime_import)
+=09=09/* TODO: pass flags around */
 =09=09obj =3D dev->driver->gem_prime_import(dev, dma_buf);
 =09else
-=09=09obj =3D drm_gem_prime_import(dev, dma_buf);
+=09=09obj =3D drm_gem_prime_import(dev, dma_buf, flags);
 =09if (IS_ERR(obj)) {
 =09=09ret =3D PTR_ERR(obj);
 =09=09goto out_unlock;
@@ -368,11 +369,13 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *d=
ev, void *data,
 =09struct drm_prime_handle *args =3D data;
=20
 =09if (dev->driver->prime_fd_to_handle) {
+=09=09/* TODO: pass around flags */
 =09=09return dev->driver->prime_fd_to_handle(dev, file_priv, args->fd,
 =09=09=09=09=09=09       &args->handle);
 =09}
=20
-=09return drm_gem_prime_fd_to_handle(dev, file_priv, args->fd, &args->hand=
le);
+=09return drm_gem_prime_fd_to_handle(dev, file_priv, args->fd,
+=09=09=09=09=09  &args->handle, args->flags);
 }
=20
 static struct dma_buf *export_and_register_object(struct drm_device *dev,
@@ -636,6 +639,13 @@ void drm_gem_map_detach(struct dma_buf *dma_buf,
 }
 EXPORT_SYMBOL(drm_gem_map_detach);
=20
+static int drm_gem_attach_needs_move(struct dma_buf *dma_buf,
+=09=09=09=09     struct dma_buf_attachment *attach)
+{
+=09/* TODO: is this correct for all drm_gem_prime_dmabuf_ops users? */
+=09return 0;
+}
+
 /**
  * drm_gem_map_dma_buf - map_dma_buf implementation for GEM
  * @attach: attachment whose scatterlist is to be returned
@@ -813,6 +823,7 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_op=
s =3D  {
 =09.cache_sgt_mapping =3D true,
 =09.attach =3D drm_gem_map_attach,
 =09.detach =3D drm_gem_map_detach,
+=09.attach_needs_move =3D drm_gem_attach_needs_move,
 =09.map_dma_buf =3D drm_gem_map_dma_buf,
 =09.unmap_dma_buf =3D drm_gem_unmap_dma_buf,
 =09.release =3D drm_gem_dmabuf_release,
@@ -933,7 +944,8 @@ EXPORT_SYMBOL(drm_gem_prime_export);
  */
 struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 =09=09=09=09=09    struct dma_buf *dma_buf,
-=09=09=09=09=09    struct device *attach_dev)
+=09=09=09=09=09    struct device *attach_dev,
+=09=09=09=09=09    uint32_t flags)
 {
 =09struct dma_buf_attachment *attach;
 =09struct sg_table *sgt;
@@ -1002,9 +1014,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
  * &drm_gem_object_funcs.free hook when using this function.
  */
 struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
-=09=09=09=09=09    struct dma_buf *dma_buf)
+=09=09=09=09=09    struct dma_buf *dma_buf,
+=09=09=09=09=09    uint32_t flags)
 {
-=09return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
+=09return drm_gem_prime_import_dev(dev, dma_buf, dev->dev, flags);
 }
 EXPORT_SYMBOL(drm_gem_prime_import);
=20
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i=
915/gem/i915_gem_dmabuf.c
index 1df74f7aa3dc..d88a307016a6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -201,9 +201,18 @@ static void i915_gem_dmabuf_detach(struct dma_buf *dma=
buf,
 =09i915_gem_object_unpin_pages(obj);
 }
=20
+static int i915_gem_dmabuf_attach_needs_move(struct dma_buf *dmabuf,
+=09=09=09=09=09     struct dma_buf_attachment *attach)
+{
+=09struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dmabuf);
+
+=09return i915_gem_object_get_region_id(obj) !=3D INTEL_REGION_SMEM;
+}
+
 static const struct dma_buf_ops i915_dmabuf_ops =3D  {
 =09.attach =3D i915_gem_dmabuf_attach,
 =09.detach =3D i915_gem_dmabuf_detach,
+=09.attach_needs_move =3D i915_gem_dmabuf_attach_needs_move,
 =09.map_dma_buf =3D i915_gem_map_dma_buf,
 =09.unmap_dma_buf =3D drm_gem_unmap_dma_buf,
 =09.release =3D drm_gem_dmabuf_release,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i=
915/gem/i915_gem_object.h
index 3dc61cbd2e11..f61637ada47a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -312,6 +312,13 @@ i915_gem_object_is_framebuffer(const struct drm_i915_g=
em_object *obj)
 =09return READ_ONCE(obj->frontbuffer) || obj->is_dpt;
 }
=20
+static inline enum intel_region_id
+i915_gem_object_get_region_id(const struct drm_i915_gem_object *obj)
+{
+=09struct intel_memory_region *mr =3D READ_ONCE(obj->mm.region);
+=09return mr->id;
+}
+
 static inline unsigned int
 i915_gem_object_get_tiling(const struct drm_i915_gem_object *obj)
 {
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_bu=
f.c
index 68f309f5e981..73bdc804ce0e 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -296,7 +296,7 @@ struct drm_gem_object *xe_gem_prime_import(struct drm_d=
evice *dev,
 =09=09attach_ops =3D test->attach_ops;
 #endif
=20
-=09attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->t=
tm.base);
+=09attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev, attach_ops, &bo->t=
tm.base, 0);
 =09if (IS_ERR(attach)) {
 =09=09obj =3D ERR_CAST(attach);
 =09=09goto out_err;
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/cor=
e/umem_dmabuf.c
index 9fcd37761264..5ec4e90c80fd 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -159,7 +159,8 @@ ib_umem_dmabuf_get_with_dma_device(struct ib_device *de=
vice,
 =09=09=09=09=09dmabuf,
 =09=09=09=09=09dma_device,
 =09=09=09=09=09ops,
-=09=09=09=09=09umem_dmabuf);
+=09=09=09=09=09umem_dmabuf,
+=09=09=09=09=090);
 =09if (IS_ERR(umem_dmabuf->attach)) {
 =09=09ret =3D ERR_CAST(umem_dmabuf->attach);
 =09=09goto out_free_umem;
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index fa085c44d4ca..0dbf41564fdc 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -68,7 +68,8 @@ struct dma_buf *drm_gem_dmabuf_export(struct drm_device *=
dev,
 void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
=20
 int drm_gem_prime_fd_to_handle(struct drm_device *dev,
-=09=09=09       struct drm_file *file_priv, int prime_fd, uint32_t *handle=
);
+=09=09=09       struct drm_file *file_priv, int prime_fd,
+=09=09=09       uint32_t *handle, uint32_t flags);
 struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
 =09=09=09       struct drm_file *file_priv, uint32_t handle,
 =09=09=09       uint32_t flags);
@@ -102,9 +103,11 @@ unsigned long drm_prime_get_contiguous_size(struct sg_=
table *sgt);
 /* helper functions for importing */
 struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 =09=09=09=09=09=09struct dma_buf *dma_buf,
-=09=09=09=09=09=09struct device *attach_dev);
+=09=09=09=09=09=09struct device *attach_dev,
+=09=09=09=09=09=09uint32_t flags);
 struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
-=09=09=09=09=09    struct dma_buf *dma_buf);
+=09=09=09=09=09    struct dma_buf *dma_buf,
+=09=09=09=09=09    uint32_t flags);
=20
 void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg=
);
=20
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bd..0fc7e059c934 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -82,6 +82,8 @@ struct dma_buf_ops {
 =09 */
 =09void (*detach)(struct dma_buf *, struct dma_buf_attachment *);
=20
+=09int (*attach_needs_move)(struct dma_buf *, struct dma_buf_attachment *)=
;
+
 =09/**
 =09 * @pin:
 =09 *
@@ -597,12 +599,14 @@ dma_buf_attachment_is_dynamic(struct dma_buf_attachme=
nt *attach)
 =09return !!attach->importer_ops;
 }
=20
+#define DMA_BUF_ATTACH_NO_MOVE (1 << 0)
+
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 =09=09=09=09=09  struct device *dev);
 struct dma_buf_attachment *
 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 =09=09       const struct dma_buf_attach_ops *importer_ops,
-=09=09       void *importer_priv);
+=09=09       void *importer_priv, int flags);
 void dma_buf_detach(struct dma_buf *dmabuf,
 =09=09    struct dma_buf_attachment *attach);
 int dma_buf_pin(struct dma_buf_attachment *attach);
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 7fba37b94401..9eec1d1c5a14 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -883,10 +883,11 @@ struct drm_set_client_cap {
=20
 #define DRM_RDWR O_RDWR
 #define DRM_CLOEXEC O_CLOEXEC
+#define DRM_PRIME_FD_TO_HANDLE_NO_MOVE (1 << 0)
 struct drm_prime_handle {
 =09__u32 handle;
=20
-=09/** Flags.. only applicable for handle->fd */
+=09/** Flags */
 =09__u32 flags;
=20
 =09/** Returned dmabuf file descriptor */
--=20
2.47.0


