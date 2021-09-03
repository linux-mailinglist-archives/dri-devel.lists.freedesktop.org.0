Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86040001B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 15:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E190F6E88B;
	Fri,  3 Sep 2021 13:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D216E88B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 13:00:44 +0000 (UTC)
Date: Fri, 03 Sep 2021 13:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1630674042;
 bh=BWPMoTnh7M5PpR4+vrgrHK6TgA13b4UUA63m/U0s0aM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=kjX9ZRxjF9l/gRfK/Z81S3o5vxjb6uZt61h1eAKsEFZh5UXGV4PoYseoZ2vShvXe+
 eCv8D/Yb0onkdBRrSDTayfIQy0lw0bNhYD4kohKR6q0/AgjeLJV61umzFtRELU07Ig
 kusGfytr6Uo7YUzsJxrCkDDCV9HF42D3vVhvNFWGqP6nidDMlhzVun+IEtNnmBvw8s
 H8SY0xrohaDpYhNiJxDVRkKlm2CXUlvHtAquoKUCDRnKUpgC4+aKPMYaG6eS7XazSg
 yfqJOyoPhx7VXWfiCVogvOpNWTWRvFzOHjE2EOBLC78Q9TDSxekEUHGgveu27jlt4V
 XOO08Jum7ffbQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Stone <daniels@collabora.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Emil Velikov <emil.l.velikov@gmail.com>, Keith Packard <keithp@keithp.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH v2 2/2] drm/lease: allow empty leases
Message-ID: <20210903130000.1590-2-contact@emersion.fr>
In-Reply-To: <20210903130000.1590-1-contact@emersion.fr>
References: <20210903130000.1590-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This can be used to create a separate DRM file description, thus
creating a new GEM handle namespace.

My use-case is wlroots. The library splits responsibilities between
separate components: the GBM allocator creates buffers, the GLES2
renderer uses EGL to import them and render to them, the DRM
backend imports the buffers and displays them. wlroots has a
modular architecture, and any of these components can be swapped
and replaced with something else. For instance, the pipeline can
be set up so that the DRM dumb buffer allocator is used instead of
GBM and the Pixman renderer is used instead of GLES2. Library users
can also replace any of these components with their own custom one.

DMA-BUFs are used to pass buffer references across components. We
could use GEM handles instead, but this would result in pain if
multiple GPUs are in use: wlroots copies buffers across GPUs as
needed. Importing a GEM handle created on one GPU into a completely
different GPU will blow up (fail at best, mix unrelated buffers
otherwise).

Everything is fine if all components use Mesa. However, this isn't
always desirable. For instance when running with DRM dumb buffers
and the Pixman software renderer it's unfortunate to depend on GBM
in the DRM backend just to turn DMA-BUFs into FB IDs. GBM loads
Mesa drivers to perform an action which has nothing driver-specific.
Additionally, drivers will fail the import if the 3D engine can't
use the imported buffer, for instance amdgpu will refuse to import
DRM dumb buffers [1]. We might also want to be running with a Vulkan
renderer and a Vulkan allocator in the future, and GBM wouldn't be
welcome in this setup.

To address this, GBM can be side-stepped in the DRM backend, and
can be replaced with drmPrimeFDToHandle calls. However because of
GEM handle reference counting issues, care must be taken to avoid
double-closing the same GEM handle. In particular, it's not
possible to share a DRM FD with GBM or EGL and perform some
drmPrimeFDToHandle calls manually.

So wlroots needs to re-open the DRM FD to create a new GEM handle
namespace. However there's no guarantee that the file-system
permissions will be set up so that the primary FD can be opened
by the compsoitor. On modern systems seatd or logind is a privileged
process responsible for doing this, and other processes aren't
expected to do it. For historical reasons systemd still allows
physically logged in users to open primary DRM nodes, but this
doesn't work on non-systemd setups and it's desirable to lock
them down at some point.

Some might suggest to open the render node instead of re-opening
the primary node. However some systems don't have a render node
at all (e.g. no GPU, or a split render/display SoC).

Solutions to this issue have been discussed in [2]. One solution
would be to open the magic /proc/self/fd/<fd> file, but it's a
Linux-specific hack (wlroots supports BSDs too). Another solution
is to add support for re-opening a DRM primary node to seatd/logind,
but they don't support it now and really haven't been designed for
this (logind would need to grow a completely new API, because it
assumes unique dev_t IDs). Also this seems like pushing down a
kernel limitation to user-space a bit too hard.

Another solution is to allow creating empty DRM leases. The lessee
FD would have its own GEM handle namespace, so wouldn't conflict
wth GBM/EGL. It would have the master bit set, but would be able
to manage zero resources. wlroots doesn't intend to share this FD
with any other process.

All in all IMHO that seems like a pretty reasonable solution to the
issue at hand.

Note, I've discussed with Jonas =C3=85dahl and Mutter plans to adopt a
similar design in the future.

Example usage in wlroots is available at [3]. IGT test available
at [4].

[1]: https://github.com/swaywm/wlroots/issues/2916
[2]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/110
[3]: https://github.com/swaywm/wlroots/pull/3158
[4]: https://patchwork.freedesktop.org/series/94323/

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Cc: Michel D=C3=A4nzer <michel@daenzer.net>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Keith Packard <keithp@keithp.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/drm_lease.c | 39 +++++++++++++++++--------------------
 include/uapi/drm/drm_mode.h |  3 ++-
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index dee4f24a1808..d72c2fac0ff1 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -489,12 +489,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev=
,
 =09if (!drm_core_check_feature(dev, DRIVER_MODESET))
 =09=09return -EOPNOTSUPP;
=20
-=09/* need some objects */
-=09if (cl->object_count =3D=3D 0) {
-=09=09DRM_DEBUG_LEASE("no objects in lease\n");
-=09=09return -EINVAL;
-=09}
-
 =09if (cl->flags && (cl->flags & ~(O_CLOEXEC | O_NONBLOCK))) {
 =09=09DRM_DEBUG_LEASE("invalid flags\n");
 =09=09return -EINVAL;
@@ -510,23 +504,26 @@ int drm_mode_create_lease_ioctl(struct drm_device *de=
v,
=20
 =09object_count =3D cl->object_count;
=20
-=09object_ids =3D memdup_user(u64_to_user_ptr(cl->object_ids),
-=09=09=09array_size(object_count, sizeof(__u32)));
-=09if (IS_ERR(object_ids)) {
-=09=09ret =3D PTR_ERR(object_ids);
-=09=09goto out_lessor;
-=09}
-
+=09/* Handle leased objects, if any */
 =09idr_init(&leases);
+=09if (object_count !=3D 0) {
+=09=09object_ids =3D memdup_user(u64_to_user_ptr(cl->object_ids),
+=09=09=09=09=09 array_size(object_count, sizeof(__u32)));
+=09=09if (IS_ERR(object_ids)) {
+=09=09=09ret =3D PTR_ERR(object_ids);
+=09=09=09idr_destroy(&leases);
+=09=09=09goto out_lessor;
+=09=09}
=20
-=09/* fill and validate the object idr */
-=09ret =3D fill_object_idr(dev, lessor_priv, &leases,
-=09=09=09      object_count, object_ids);
-=09kfree(object_ids);
-=09if (ret) {
-=09=09DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
-=09=09idr_destroy(&leases);
-=09=09goto out_lessor;
+=09=09/* fill and validate the object idr */
+=09=09ret =3D fill_object_idr(dev, lessor_priv, &leases,
+=09=09=09=09      object_count, object_ids);
+=09=09kfree(object_ids);
+=09=09if (ret) {
+=09=09=09DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
+=09=09=09idr_destroy(&leases);
+=09=09=09goto out_lessor;
+=09=09}
 =09}
=20
 =09/* Allocate a file descriptor for the lease */
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index e4a2570a6058..e1e351682872 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1112,7 +1112,8 @@ struct drm_mode_destroy_blob {
  * Lease mode resources, creating another drm_master.
  *
  * The @object_ids array must reference at least one CRTC, one connector a=
nd
- * one plane if &DRM_CLIENT_CAP_UNIVERSAL_PLANES is enabled.
+ * one plane if &DRM_CLIENT_CAP_UNIVERSAL_PLANES is enabled. Alternatively=
,
+ * the lease can be completely empty.
  */
 struct drm_mode_create_lease {
 =09/** @object_ids: Pointer to array of object ids (__u32) */
--=20
2.33.0


