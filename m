Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10D6BAC92B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140D710E565;
	Tue, 30 Sep 2025 10:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lcUUCjon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE1310E2A6;
 Tue, 30 Sep 2025 10:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759229849;
 bh=6bPRcsgjW5miijm89Vj9ztPqCVHtA9OfZProSwKLM+E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lcUUCjonC+V4D2GtM4PuXn8rRIxReNC+RXOaJZ7hhwdzpU5mJal943IHtXfksU6wu
 1D4iYmyYsIQxCHCBDNgn2L/cw/FXXWt6qkiOP9BOrFZOE5VtEVtOs3UMLbTPqlRi7m
 sKXNlWf3l89UmYA7IFySASPm0/qugfjqrl/9Fy28nPJgbr6M6qH4YrQBz4x7zBUoER
 1Im9nrbMPTENN7AdmsIDsaHOzwTV3uVEXlQrAUK8WQc5UWwjVWbhHlBwe+whDMd3ua
 rnCpyrhWzx7KD6aATwtJa8IFUPOVSk/k5fYDLMd24rXPk8ymgdwszEHPAfqdwn10ho
 td+aeBNfzDZRQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 48A0917E0097;
 Tue, 30 Sep 2025 12:57:28 +0200 (CEST)
Date: Tue, 30 Sep 2025 12:57:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org, kernel@collabora.com
Subject: Re: [PATCH 3/8] drm/shmem-helper: Add huge tmpfs mount point helpers
Message-ID: <20250930125725.258e74a5@fedora>
In-Reply-To: <20250929200316.18417-4-loic.molinari@collabora.com>
References: <20250929200316.18417-1-loic.molinari@collabora.com>
 <20250929200316.18417-4-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Mon, 29 Sep 2025 22:03:11 +0200
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Add the drm_gem_shmem_helper_huge_mnt_create() and
> drm_gem_shmem_helper_huge_mnt_free() helpers to avoid code duplication
> in the i915 and v3d drivers (and soon panfrost/panthor).
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 56 ++++++++++++++++++++++++++
>  include/drm/drm_gem_shmem_helper.h     | 14 +++++++
>  2 files changed, 70 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 22c4b09e10a3..808721b8be3e 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -5,7 +5,9 @@
> =20
>  #include <linux/dma-buf.h>
>  #include <linux/export.h>
> +#include <linux/fs_context.h>
>  #include <linux/module.h>
> +#include <linux/mount.h>
>  #include <linux/mutex.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/slab.h>
> @@ -36,6 +38,60 @@ MODULE_IMPORT_NS("DMA_BUF");
>   * drm_gem_shmem_vmap()). These helpers perform the necessary type conve=
rsion.
>   */
> =20
> +static int drm_gem_shmem_add_fc_param(struct fs_context *fc, const char =
*key,
> +				      const char *value)
> +{
> +	return vfs_parse_fs_string(fc, key, value, strlen(value));
> +}
> +
> +/**
> + * drm_gem_shmem_huge_mnt_create - Create a huge tmpfs mountpoint
> + * @value: huge tmpfs mount option value
> + *
> + * This function creates and mounts an internal huge tmpfs mountpoint fo=
r use
> + * with the drm_gem_shmem_create_with_mnt() function.
> + *
> + * The most common option value is "within_size" which only allocates hu=
ge pages
> + * if the page will be fully within the GEM object size. "always", "advi=
se" and
> + * "never" are supported too but the latter would just create a mountpoi=
nt
> + * similar to default "shm_mnt" one. See shmemfs and Transparent Hugepag=
e for
> + * more information.
> + *
> + * Returns:
> + * A struct vfsmount * on success or an ERR_PTR()-encoded negative error=
 code on
> + * failure.
> + */
> +struct vfsmount *drm_gem_shmem_huge_mnt_create(const char *value)

Given drm_gem_object_init_with_mnt() lives in drm_gem.c and doesn't
have the _shmem_ prefix, I'd be tempted to move this helper to
drm_gem.c and rename it drm_gem_huge_mnt_create(). Actually, as I said
in the panthor patch, I believe this could also be passed a drm_device
and have the resulting vfsmount stored in drm_device::huge_mnt. This
way we could get rid of drm_gem_shmem_create_with_mnt() altogether.

> +{
> +	struct file_system_type *type;
> +	struct fs_context *fc;
> +	struct vfsmount *mnt;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	type =3D get_fs_type("tmpfs");
> +	if (!type)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	fc =3D fs_context_for_mount(type, SB_KERNMOUNT);
> +	if (IS_ERR(fc))
> +		return ERR_CAST(fc);
> +	ret =3D drm_gem_shmem_add_fc_param(fc, "source", "tmpfs");
> +	if (ret)
> +		return ERR_PTR(-ENOPARAM);
> +	ret =3D drm_gem_shmem_add_fc_param(fc, "huge", value);
> +	if (ret)
> +		return ERR_PTR(-ENOPARAM);
> +
> +	mnt =3D fc_mount_longterm(fc);
> +	put_fs_context(fc);
> +
> +	return mnt;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_huge_mnt_create);
> +
>  static const struct drm_gem_object_funcs drm_gem_shmem_funcs =3D {
>  	.free =3D drm_gem_shmem_object_free,
>  	.print_info =3D drm_gem_shmem_object_print_info,
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shm=
em_helper.h
> index 589f7bfe7506..5e153fb63f38 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -107,6 +107,20 @@ struct drm_gem_shmem_object {
>  #define to_drm_gem_shmem_obj(obj) \
>  	container_of(obj, struct drm_gem_shmem_object, base)
> =20
> +struct vfsmount *drm_gem_shmem_huge_mnt_create(const char *value);
> +
> +/**
> + * drm_gem_shmem_huge_mnt_free - Release a huge tmpfs mountpoint.
> + * @mnt: struct vfsmount * to release
> + *
> + * This function unmounts and releases an internal huge tmpfs mountpoint=
. If
> + * @mnt is NULL, no operation is performed.
> + */
> +static inline void drm_gem_shmem_huge_mnt_free(struct vfsmount *mnt)
> +{
> +	kern_unmount(mnt);
> +}
> +
>  int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_obje=
ct *shmem, size_t size);
>  struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev=
, size_t size);
>  struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_de=
vice *dev,

