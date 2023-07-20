Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D4E75AB23
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 11:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E04F10E0B1;
	Thu, 20 Jul 2023 09:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F8210E0B1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 09:43:43 +0000 (UTC)
Date: Thu, 20 Jul 2023 09:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689846221; x=1690105421;
 bh=mjMKQzMuZf+7nxG2xE76DIlN/N1pXO8FtMKc7C4XDPY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=GhDHtiRCb19cR9RaObIzC3CUN5ca/lH/TV7HPFG3x0NaODiqJvUCazOif6aqW6zCm
 eNR8YElT9mUIcKn8qfkciBnAPoeDSew0ZyA1tnWtZqinMjoioaijeOpY+8Vtbw0eSf
 XWCZdYLiJ+/4Q9DZ0Qlcj8PsAErbBxkJJpybHTwS7cW4wP/Di+9tHULIGXWrnemUK0
 v8jEOdDOVDB3ZoeWUema2iWx9lHflL52Qz4fXp+YOIZDawJVzl8Y3mTnMmMHQDofo9
 a3qHhhqaEKK/Lujfojse5H6mMQlK/pbO68+mHxFsImahGSRYsd6WThaotB+VFAGaYp
 RdT68yj0D6nbA==
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/syncobj: add DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Message-ID: <vVFDBgHpdcB0vOwnl02QPOFmAZPEbIV56E_wQ8B012K2GZ-fAGyG0JMbSrMu3-IcKYVf0JpJyrf71e6KFHfeMoSPJlYRACxlxy91eW9c6Fc=@emersion.fr>
In-Reply-To: <d01ca12e-f914-12c4-de1b-8918a6dd0df0@nvidia.com>
References: <d01ca12e-f914-12c4-de1b-8918a6dd0df0@nvidia.com>
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
Cc: James Jones <jajones@nvidia.com>, Austin Shafer <ashafer@nvidia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, July 19th, 2023 at 19:05, Erik Kurzinger <ekurzinger@nvidia.c=
om> wrote:

> These new ioctls perform a task similar to
> DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD/FD_TO_HANDLE with the
> IMPORT/EXPORT_SYNC_FILE flag set, except that they allow specifying the
> timeline point to import or export the fence to or from on a timeline
> syncobj.
>=20
> This eliminates the need to use a temporary binary syncobj along with
> DRM_IOCTL_SYNCOBJ_TRANSFER to achieve such a thing, which is the
> technique userspace has had to employ up to this point. While that does
> work, it is rather awkward from the programmer's perspective.  Since DRM
> syncobjs have been proposed as the basis for display server explicit
> synchronization protocols, e.g. [1] and [2], providing a more
> streamlined interface now seems worthwhile.

This looks like a good idea to me! The patch looks good as well, apart
from one tricky issue, see below...

> [1] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requ=
ests/90
> [2] https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/967
>=20
> Accompanying userspace patches...
> IGT: https://gitlab.freedesktop.org/ekurzinger/igt-gpu-tools/-/commit/241=
e7f379aeaa9b22a32277e77ad4011c8717a57
> libdrm: https://gitlab.freedesktop.org/ekurzinger/drm/-/commit/b3961a592f=
c6f8b05f7e3a12413fb58eca2dbfa2

(Unfortunately this isn't enough when it comes to user-space patches: the
kernel rules require a "real" user of the new IOCTL, not just a libdr IOCTL
wrapper. I will post a patch to make use of this from wlroots if that helps=
.)

> Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
> ---
>  drivers/gpu/drm/drm_internal.h |  4 +++
>  drivers/gpu/drm/drm_ioctl.c    |  4 +++
>  drivers/gpu/drm/drm_syncobj.c  | 60 ++++++++++++++++++++++++++++++----
>  include/uapi/drm/drm.h         |  9 +++++
>  4 files changed, 71 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index d7e023bbb0d5..64a28ed26a16 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -253,6 +253,10 @@ int drm_syncobj_timeline_signal_ioctl(struct drm_dev=
ice *dev, void *data,
>  =09=09=09=09      struct drm_file *file_private);
>  int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  =09=09=09    struct drm_file *file_private);
> +int drm_syncobj_import_sync_file_ioctl(struct drm_device *dev, void *dat=
a,
> +=09=09=09=09       struct drm_file *file_private);
> +int drm_syncobj_export_sync_file_ioctl(struct drm_device *dev, void *dat=
a,
> +=09=09=09=09       struct drm_file *file_private);
>=20
>  /* drm_framebuffer.c */
>  void drm_framebuffer_print_info(struct drm_printer *p, unsigned int inde=
nt,
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 7c9d66ee917d..0344e8e447bc 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -710,6 +710,10 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D =
{
>  =09=09      DRM_RENDER_ALLOW),
>  =09DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY, drm_syncobj_query_ioctl,
>  =09=09      DRM_RENDER_ALLOW),
> +=09DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE, drm_syncobj_import_=
sync_file_ioctl,
> +=09=09      DRM_RENDER_ALLOW),
> +=09DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE, drm_syncobj_export_=
sync_file_ioctl,
> +=09=09      DRM_RENDER_ALLOW),
>  =09DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE, drm_crtc_get_sequence_ioct=
l, 0),
>  =09DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE, drm_crtc_queue_sequence_=
ioctl, 0),
>  =09DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioct=
l, DRM_MASTER),
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 0c2be8360525..bf0c1eae353a 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -181,6 +181,13 @@
>   * Note that if you want to transfer a struct &dma_fence_chain from a gi=
ven
>   * point on a timeline syncobj from/into a binary syncobj, you can use t=
he
>   * point 0 to mean take/replace the fence in the syncobj.
> + *
> + * &DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE and &DRM_IOCTL_SYNCOBJ_EXPORT_SYN=
C_FILE
> + * let the client import or export the struct &dma_fence_chain of a sync=
obj
> + * at a particular timeline point from or to a sync file.
> + * These behave similarly to &DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC=
_FILE
> + * and &DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE described above,=
 except
> + * that they accommodate timeline syncobjs in addition to binary syncobj=
s.
>   */
>=20
>  #include <linux/anon_inodes.h>
> @@ -682,10 +689,11 @@ static int drm_syncobj_fd_to_handle(struct drm_file=
 *file_private,
>  }
>=20
>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_priv=
ate,
> -=09=09=09=09=09      int fd, int handle)
> +=09=09=09=09=09      int fd, u64 point, int handle)

Nit: can we specify the point after the handle, for consistency with
drm_syncobj_export_sync_file()? It's pretty easy to mix up these two argume=
nts.

>  {
>  =09struct dma_fence *fence =3D sync_file_get_fence(fd);
>  =09struct drm_syncobj *syncobj;
> +=09int ret =3D 0;
>=20
>  =09if (!fence)
>  =09=09return -EINVAL;
> @@ -696,14 +704,23 @@ static int drm_syncobj_import_sync_file_fence(struc=
t drm_file *file_private,
>  =09=09return -ENOENT;
>  =09}
>=20
> -=09drm_syncobj_replace_fence(syncobj, fence);
> +=09if (point =3D=3D 0) {
> +=09=09drm_syncobj_replace_fence(syncobj, fence);
> +=09} else {
> +=09=09struct dma_fence_chain *chain =3D dma_fence_chain_alloc();
> +=09=09if (chain) {
> +=09=09=09drm_syncobj_add_point(syncobj, chain, fence, point);
> +=09=09} else {
> +=09=09=09ret =3D -ENOMEM;
> +=09=09}
> +=09}
>  =09dma_fence_put(fence);
>  =09drm_syncobj_put(syncobj);
> -=09return 0;
> +=09return ret;
>  }
>=20
>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> -=09=09=09=09=09int handle, int *p_fd)
> +=09=09=09=09=09int handle, u64 point, int *p_fd)
>  {
>  =09int ret;
>  =09struct dma_fence *fence;
> @@ -713,7 +730,7 @@ static int drm_syncobj_export_sync_file(struct drm_fi=
le *file_private,
>  =09if (fd < 0)
>  =09=09return fd;
>=20
> -=09ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
> +=09ret =3D drm_syncobj_find_fence(file_private, handle, point, 0, &fence=
);
>  =09if (ret)
>  =09=09goto err_put_fd;
>=20
> @@ -823,7 +840,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev=
, void *data,
>=20
>  =09if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>  =09=09return drm_syncobj_export_sync_file(file_private, args->handle,
> -=09=09=09=09=09=09    &args->fd);
> +=09=09=09=09=09=09    0 /* binary */, &args->fd);
>=20
>  =09return drm_syncobj_handle_to_fd(file_private, args->handle,
>  =09=09=09=09=09&args->fd);
> @@ -848,6 +865,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev=
, void *data,
>  =09if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE)
>  =09=09return drm_syncobj_import_sync_file_fence(file_private,
>  =09=09=09=09=09=09=09  args->fd,
> +=09=09=09=09=09=09=09  0 /* binary */,
>  =09=09=09=09=09=09=09  args->handle);
>=20
>  =09return drm_syncobj_fd_to_handle(file_private, args->fd,
> @@ -1515,3 +1533,33 @@ int drm_syncobj_query_ioctl(struct drm_device *dev=
, void *data,
>=20
>  =09return ret;
>  }
> +
> +int drm_syncobj_import_sync_file_ioctl(struct drm_device *dev, void *dat=
a,
> +=09=09=09=09       struct drm_file *file_private)
> +{
> +=09struct drm_syncobj_sync_file *args =3D data;
> +
> +=09if (!drm_core_check_feature(dev, args->point =3D=3D 0 ?
> +=09=09=09=09    DRIVER_SYNCOBJ :
> +=09=09=09=09    DRIVER_SYNCOBJ_TIMELINE))
> +=09=09return -EOPNOTSUPP;
> +
> +=09return drm_syncobj_import_sync_file_fence(file_private,
> +=09=09=09=09=09=09  args->fd,
> +=09=09=09=09=09=09  args->point,
> +=09=09=09=09=09=09  args->handle);
> +}
> +
> +int drm_syncobj_export_sync_file_ioctl(struct drm_device *dev, void *dat=
a,
> +=09=09=09=09       struct drm_file *file_private)
> +{
> +=09struct drm_syncobj_sync_file *args =3D data;
> +
> +=09if (!drm_core_check_feature(dev, args->point =3D=3D 0 ?
> +=09=09=09=09    DRIVER_SYNCOBJ :
> +=09=09=09=09    DRIVER_SYNCOBJ_TIMELINE))
> +=09=09return -EOPNOTSUPP;
> +
> +=09return drm_syncobj_export_sync_file(file_private, args->handle,
> +=09=09=09=09=09    args->point, &args->fd);
> +}
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index a87bbbbca2d4..e1f045011c22 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -884,6 +884,12 @@ struct drm_syncobj_transfer {
>  =09__u32 pad;
>  };
>=20
> +struct drm_syncobj_sync_file {
> +=09__u32 handle;
> +=09__u32 fd;
> +=09__u64 point;
> +};
> +
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time =
point to become available */
> @@ -1139,6 +1145,9 @@ extern "C" {
>  #define DRM_IOCTL_SYNCOBJ_TRANSFER=09DRM_IOWR(0xCC, struct drm_syncobj_t=
ransfer)
>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL=09DRM_IOWR(0xCD, struct drm_sy=
ncobj_timeline_array)
>=20
> +#define DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE=09DRM_IOWR(0xCE, struct drm_s=
yncobj_sync_file)
> +#define DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE=09DRM_IOWR(0xCF, struct drm_s=
yncobj_sync_file)

So, there is a footgun here, one that I hit myself with before: 0xCE is alr=
eady
used by DRM_IOCTL_MODE_GETFB2. And there is no check whatsoever about
conflicting IOCTL numbers. The only reason I noticed is that I got some pre=
tty
weird behavior when trying to detect for the IOCTL availability in IGT, and
someone from AMD noticed some GETFB2 IGT test breakage when trying my patch=
es.

>  /**
>   * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
>   *
> --
> 2.41.0
