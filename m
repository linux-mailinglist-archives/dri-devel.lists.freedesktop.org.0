Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124ABBBD2C2
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 09:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E28E10E305;
	Mon,  6 Oct 2025 07:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bBocWT++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9878D10E305;
 Mon,  6 Oct 2025 07:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759734156;
 bh=SF0ALPBwvbte57Fc2haYtm+cDJgEczDMsnovSsSgABs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bBocWT++fjToLaQ8OVH+JO/4nQBd8eHbvW1kGRHUAVDG9oG5EGWcfwV98p2qjMKDr
 q/6OAQ0jnmZdZRPFiyHKZxI1yMCFAJEihccHs4oXTZGvgUsLU/kXIgSD2nHHIIc2fJ
 Mw/zfZQ0LHjTLbsHSjq9thCYYDtOpMAg/AS0ikKp5fwAvPysbJsaC3rvIfspaRet4T
 AfllxcnxIYnZ1s2ioHUdYEYSkv5Xs6nYPO46hbauyRkA3tlp9C1GWrRUBxjoSaNoyi
 Qpe225aUxmNXIPW2TbeUegux2qUu91WC27GWiiY+2wdNMEjNvv6iuCEuLmImjTbUtK
 sfnWfYNKXe++Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 19F0E17E090E;
 Mon,  6 Oct 2025 09:02:35 +0200 (CEST)
Date: Mon, 6 Oct 2025 09:02:30 +0200
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
 Christopher Healy <healych@amazon.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, kernel@collabora.com
Subject: Re: [PATCH v3 03/10] drm/gem: Add huge tmpfs mount point helper
Message-ID: <20251006090230.087021bd@fedora>
In-Reply-To: <20251004093054.21388-4-loic.molinari@collabora.com>
References: <20251004093054.21388-1-loic.molinari@collabora.com>
 <20251004093054.21388-4-loic.molinari@collabora.com>
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

On Sat,  4 Oct 2025 11:30:46 +0200
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Add the drm_gem_huge_mnt_create() helper to avoid code duplication in
> the i915, V3D, Panfrost and Panthor drivers. It creates and mounts a
> dedicated huge tmpfs mountpoint, for the lifetime of a drm device,
> used at GEM object initialization.
>=20
> The next commits will port drivers to this helper.
>=20
> v3:
> - store huge tmpfs mountpoint in drm_device
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 67 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_device.h  | 11 +++++++
>  include/drm/drm_gem.h     |  1 +
>  3 files changed, 79 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index f5a10ff363c9..b4e4947210ef 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -29,6 +29,7 @@
>  #include <linux/export.h>
>  #include <linux/file.h>
>  #include <linux/fs.h>
> +#include <linux/fs_context.h>
>  #include <linux/iosys-map.h>
>  #include <linux/mem_encrypt.h>
>  #include <linux/mm.h>
> @@ -82,6 +83,72 @@
>   * up at a later date, and as our interface with shmfs for memory alloca=
tion.
>   */
> =20
> +static int drm_gem_add_fc_param(struct fs_context *fc, const char *key,
> +				const char *value)
> +{
> +	return vfs_parse_fs_string(fc, key, value, strlen(value));
> +}
> +
> +static void drm_gem_huge_mnt_free(struct drm_device *dev, void *data)
> +{
> +	drm_WARN_ON(dev, dev->huge_mnt =3D=3D NULL);
> +
> +	kern_unmount(dev->huge_mnt);
> +	dev->huge_mnt =3D NULL;
> +}
> +
> +/**
> + * drm_gem_huge_mnt_create - Create, mount and use a huge tmpfs mountpoi=
nt
> + * @dev: drm_device a huge tmpfs mountpoint should be used with
> + * @value: huge tmpfs mount option value
> + *
> + * This function creates and mounts a dedicated huge tmpfs mountpoint fo=
r the
> + * lifetime of the drm device @dev which is used at GEM object initializ=
ation
> + * with drm_gem_object_init().
> + *
> + * The most common option value @value is "within_size" which only alloc=
ates
> + * huge pages if the page will be fully within the GEM object size. "alw=
ays",
> + * "advise" and "never" are supported too but the latter would just crea=
te a
> + * mountpoint similar to the default one (`shm_mnt`). See shmemfs and
> + * Transparent Hugepage for more information.
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure. Returns -EEXIST if =
called
> + * more than once for the lifetime of the drm device.
> + */
> +int drm_gem_huge_mnt_create(struct drm_device *dev, const char *value)
> +{
> +	struct file_system_type *type;
> +	struct fs_context *fc;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +		return -EOPNOTSUPP;
> +
> +	type =3D get_fs_type("tmpfs");
> +	if (unlikely(!type))
> +		return -EOPNOTSUPP;
> +
> +	if (unlikely(dev->huge_mnt))
> +		return -EEXIST;

Do we even care about reporting an error when the huge mount point
already exists? Can we just return 0 in that case, which simplifies the
call sites since they don't have to check for EEXIST anymore.

> +
> +	fc =3D fs_context_for_mount(type, SB_KERNMOUNT);
> +	if (IS_ERR(fc))
> +		return PTR_ERR(fc);
> +	ret =3D drm_gem_add_fc_param(fc, "source", "tmpfs");
> +	if (unlikely(ret))
> +		return -ENOPARAM;
> +	ret =3D drm_gem_add_fc_param(fc, "huge", value);
> +	if (unlikely(ret))
> +		return -ENOPARAM;
> +
> +	dev->huge_mnt =3D fc_mount_longterm(fc);
> +	put_fs_context(fc);
> +
> +	return drmm_add_action_or_reset(dev, drm_gem_huge_mnt_free, NULL);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_huge_mnt_create);
> +
>  static void
>  drm_gem_init_release(struct drm_device *dev, void *ptr)
>  {
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 59fd3f4d5995..895b0ced972e 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -3,6 +3,7 @@
> =20
>  #include <linux/list.h>
>  #include <linux/kref.h>
> +#include <linux/mount.h>
>  #include <linux/mutex.h>
>  #include <linux/idr.h>
>  #include <linux/sched.h>
> @@ -168,6 +169,16 @@ struct drm_device {
>  	 */
>  	struct drm_master *master;
> =20
> +	/**
> +	 * @huge_mnt:
> +	 *
> +	 * Huge tmpfs mountpoint used at GEM object initialization
> +	 * drm_gem_object_init(). Drivers can call drm_gem_huge_mnt_create() to
> +	 * create a huge tmfps mountpoint. The default tmpfs mountpoint
> +	 * (`shm_mnt`) is used if NULL.
> +	 */
> +	struct vfsmount *huge_mnt;
> +
>  	/**
>  	 * @driver_features: per-device driver features
>  	 *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 7c8bd67d087c..7285a62d9afc 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -492,6 +492,7 @@ struct drm_gem_object {
>  		DRM_GEM_FOPS,\
>  	}
> =20
> +int drm_gem_huge_mnt_create(struct drm_device *dev, const char *value);
>  void drm_gem_object_release(struct drm_gem_object *obj);
>  void drm_gem_object_free(struct kref *kref);
>  int drm_gem_object_init(struct drm_device *dev,

