Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE1A7E649C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F04D10E1D2;
	Thu,  9 Nov 2023 07:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0425510E1D2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699515964; x=1699775164;
 bh=5Zu+rJM6vpvAL3OU4SNDRIbGTyDwun7MitFOBvgk/4U=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ProRa7tv67jhP3GGbttUcLvMkygXbKok5lpPjZia1gA/wTwBIds864DELmDQG2zhJ
 3CNR3jVTTuO/XRUqAFq0qGwzEYkZd2HHTFzHOgEkJ0qOI0qX9Sr8ZJsOSTKgU0mVmB
 5oAoOwERH+1qfKwpFGJLaGHKbmghUpK5orGKfDw1L+P2+ZiwYFkoXpV3UxEuC68mOS
 rqLCnzJnDg615j1EcvGxVhaGETvDrc3KUK9sFs3gpzjMjhYJORxm9DGVzEMT78JjYK
 qQan6XbXvQGbNAibk8lCq+ECtz+ykPmSgDKYX+nx9zRL8vhdfjpaHhFDY40cuWinSS
 3TPyNnB9hmj2A==
Date: Thu, 09 Nov 2023 07:45:58 +0000
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <20231109074545.148149-2-contact@emersion.fr>
In-Reply-To: <20231109074545.148149-1-contact@emersion.fr>
References: <20231109074545.148149-1-contact@emersion.fr>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

User-space sometimes needs to allocate scanout-capable memory for
GPU rendering purposes. On a vc4/v3d split render/display SoC, this
is achieved via DRM dumb buffers: the v3d user-space driver opens
the primary vc4 node, allocates a DRM dumb buffer there, exports it
as a DMA-BUF, imports it into the v3d render node, and renders to it.

However, DRM dumb buffers are only meant for CPU rendering, they are
not intended to be used for GPU rendering. Primary nodes should only
be used for mode-setting purposes, other programs should not attempt
to open it. Moreover, opening the primary node is already broken on
some setups: systemd grants permission to open primary nodes to
physically logged in users, but this breaks when the user is not
physically logged in (e.g. headless setup) and when the distribution
is using a different init (e.g. Alpine Linux uses openrc).

We need an alternate way for v3d to allocate scanout-capable memory.
Leverage DMA heaps for this purpose: expose a CMA heap to user-space.
Preliminary testing has been done with wlroots [1].

This is still an RFC. Open questions:

- Does this approach make sense to y'all in general?
- What would be a good name for the heap? "vc4" is maybe a bit naive and
  not precise enough. Something with "cma"? Do we need to plan a naming
  scheme to accomodate for multiple vc4 devices?
- Right now root privileges are necessary to open the heap. Should we
  allow everybody to open the heap by default (after all, user-space can
  already allocate arbitrary amounts of GPU memory)? Should we leave it
  up to user-space to solve this issue (via logind/seatd or a Wayland
  protocol or something else)?

TODO:

- Need to add !vc5 support.
- Need to the extend DMA heaps API to allow vc4 to unregister the heap
  on unload.

[1]: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/4414

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Iago Toral Quiroga <itoral@igalia.com>
Cc: Ma=C3=ADra Canal <mcanal@igalia.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vc4/Makefile       |  2 ++
 drivers/gpu/drm/vc4/vc4_dma_heap.c | 51 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_drv.c      |  6 ++++
 drivers/gpu/drm/vc4/vc4_drv.h      |  5 +++
 4 files changed, 64 insertions(+)
 create mode 100644 drivers/gpu/drm/vc4/vc4_dma_heap.c

diff --git a/drivers/gpu/drm/vc4/Makefile b/drivers/gpu/drm/vc4/Makefile
index c41f89a15a55..e4048870cec7 100644
--- a/drivers/gpu/drm/vc4/Makefile
+++ b/drivers/gpu/drm/vc4/Makefile
@@ -34,4 +34,6 @@ vc4-$(CONFIG_DRM_VC4_KUNIT_TEST) +=3D \
=20
 vc4-$(CONFIG_DEBUG_FS) +=3D vc4_debugfs.o
=20
+vc4-$(CONFIG_DMABUF_HEAPS) +=3D vc4_dma_heap.o
+
 obj-$(CONFIG_DRM_VC4)  +=3D vc4.o
diff --git a/drivers/gpu/drm/vc4/vc4_dma_heap.c b/drivers/gpu/drm/vc4/vc4_d=
ma_heap.c
new file mode 100644
index 000000000000..010d0a88f3fa
--- /dev/null
+++ b/drivers/gpu/drm/vc4/vc4_dma_heap.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Copyright =C2=A9 2023 Simon Ser
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+
+#include "vc4_drv.h"
+
+static struct dma_buf *vc4_dma_heap_allocate(struct dma_heap *heap,
+=09=09=09=09=09     unsigned long size,
+=09=09=09=09=09     unsigned long fd_flags,
+=09=09=09=09=09     unsigned long heap_flags)
+{
+=09struct vc4_dev *vc4 =3D dma_heap_get_drvdata(heap);
+=09//DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+=09struct drm_gem_dma_object *dma_obj;
+=09struct dma_buf *dmabuf;
+
+=09if (WARN_ON_ONCE(!vc4->is_vc5))
+=09=09return ERR_PTR(-ENODEV);
+
+=09dma_obj =3D drm_gem_dma_create(&vc4->base, size);
+=09if (IS_ERR(dma_obj))
+=09=09return ERR_CAST(dma_obj);
+
+=09dmabuf =3D drm_gem_prime_export(&dma_obj->base, fd_flags);
+=09drm_gem_object_put(&dma_obj->base);
+=09return dmabuf;
+}
+
+static const struct dma_heap_ops vc4_dma_heap_ops =3D {
+=09.allocate =3D vc4_dma_heap_allocate,
+};
+
+int vc4_dma_heap_create(struct vc4_dev *vc4)
+{
+=09struct dma_heap_export_info exp_info;
+=09struct dma_heap *heap;
+
+=09exp_info.name =3D "vc4"; /* TODO: allow multiple? */
+=09exp_info.ops =3D &vc4_dma_heap_ops;
+=09exp_info.priv =3D vc4; /* TODO: unregister when unloading */
+
+=09heap =3D dma_heap_add(&exp_info);
+=09if (IS_ERR(heap))
+=09=09return PTR_ERR(heap);
+
+=09return 0;
+}
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c133e96b8aca..c7297dd7d9d5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -391,6 +391,12 @@ static int vc4_drm_bind(struct device *dev)
=20
 =09drm_fbdev_dma_setup(drm, 16);
=20
+#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
+=09ret =3D vc4_dma_heap_create(vc4);
+=09if (ret)
+=09=09goto err;
+#endif
+
 =09return 0;
=20
 err:
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index ab61e96e7e14..d5c5dd18815c 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -1078,4 +1078,9 @@ int vc4_perfmon_destroy_ioctl(struct drm_device *dev,=
 void *data,
 int vc4_perfmon_get_values_ioctl(struct drm_device *dev, void *data,
 =09=09=09=09 struct drm_file *file_priv);
=20
+/* vc4_dma_heap.c */
+#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
+int vc4_dma_heap_create(struct vc4_dev *vc4);
+#endif
+
 #endif /* _VC4_DRV_H_ */
--=20
2.42.0


