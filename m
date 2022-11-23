Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA9D635AFC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 12:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB2510E21A;
	Wed, 23 Nov 2022 11:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B7810E21A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669201583; x=1700737583;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=8uGP6q8XTA8Elpda7XPz9LiKFmveLCjAneE8VyaWC0Y=;
 b=UceLF3AW0QTmanQweP+8+2kEa8dhHsDB5MAX72l+78o8n52kCBvqW2Kq
 HysdNheEt9AWY69oozvtyfcVyIfuD0Iwscf/FNSq13yilQOQJtf5JyYOl
 4gyucqTs+ZGfpVWCzIcPAGtrT+qMFNf9wu5MDzhHECpFEXRUnwcXADmrE
 Uq3b9bZUElE1Tm9COAOVvlk3EFqI3uqypyg0EeiPA0lVH/oMuyHniuBUK
 +J3USdu09Kvwwt2+4K9M4xftznf55LEVQWCXMFT4wTD/4b6qST1besfM3
 uqhSqoR1QasTB/zBx2y2LR1rlRMWq4vbaTqXJB8baJWx7lbXRhVIGhnUe A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="301599517"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="301599517"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 03:06:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="672840991"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="672840991"
Received: from jgronski-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.16.163])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 03:06:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/6] drm/debugfs: create device-centered debugfs functions
In-Reply-To: <20221122190314.185015-2-mcanal@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221122190314.185015-1-mcanal@igalia.com>
 <20221122190314.185015-2-mcanal@igalia.com>
Date: Wed, 23 Nov 2022 13:06:15 +0200
Message-ID: <87mt8ivsk8.fsf@intel.com>
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
Cc: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wambui Karuga <wambui@karuga.org>,
 Melissa Wen <mwen@igalia.com>, Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Nov 2022, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
> Introduce the ability to track requests for the addition of DRM debugfs
> files at any time and have them added all at once during
> drm_dev_register().
>
> Drivers can add DRM debugfs files to a device-managed list and, during
> drm_dev_register(), all added files will be created at once.
>
> Now, the drivers can use the functions drm_debugfs_add_file() and
> drm_debugfs_add_files() to create DRM debugfs files instead of using the
> drm_debugfs_create_files() function.
>
> Co-developed-by: Wambui Karuga <wambui.karugax@gmail.com>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 76 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_drv.c     |  3 ++
>  include/drm/drm_debugfs.h     | 45 +++++++++++++++++++++
>  include/drm/drm_device.h      | 15 +++++++
>  4 files changed, 139 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index ee445f4605ba..ca27c2b05051 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -38,6 +38,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_managed.h>
>=20=20
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> @@ -151,6 +152,21 @@ static int drm_debugfs_open(struct inode *inode, str=
uct file *file)
>  	return single_open(file, node->info_ent->show, node);
>  }
>=20=20
> +static int drm_debugfs_entry_open(struct inode *inode, struct file *file)
> +{
> +	struct drm_debugfs_entry *entry =3D inode->i_private;
> +	struct drm_debugfs_info *node =3D &entry->file;
> +
> +	return single_open(file, node->show, entry);
> +}
> +
> +static const struct file_operations drm_debugfs_entry_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.open =3D drm_debugfs_entry_open,
> +	.read =3D seq_read,
> +	.llseek =3D seq_lseek,
> +	.release =3D single_release,
> +};
>=20=20
>  static const struct file_operations drm_debugfs_fops =3D {
>  	.owner =3D THIS_MODULE,
> @@ -207,6 +223,7 @@ int drm_debugfs_init(struct drm_minor *minor, int min=
or_id,
>  		     struct dentry *root)
>  {
>  	struct drm_device *dev =3D minor->dev;
> +	struct drm_debugfs_entry *entry;
>  	char name[64];
>=20=20
>  	INIT_LIST_HEAD(&minor->debugfs_list);
> @@ -230,6 +247,11 @@ int drm_debugfs_init(struct drm_minor *minor, int mi=
nor_id,
>  	if (dev->driver->debugfs_init)
>  		dev->driver->debugfs_init(minor);
>=20=20
> +	list_for_each_entry(entry, &dev->debugfs_list, list) {
> +		debugfs_create_file(entry->file.name, S_IFREG | S_IRUGO,
> +				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> +	}
> +
>  	return 0;
>  }
>=20=20
> @@ -281,6 +303,60 @@ void drm_debugfs_cleanup(struct drm_minor *minor)
>  	minor->debugfs_root =3D NULL;
>  }
>=20=20
> +/**
> + * drm_debugfs_add_file - Add a given file to the DRM device debugfs fil=
e list
> + * @dev: drm device for the ioctl
> + * @name: debugfs file name
> + * @show: show callback
> + * @data: driver-private data, should not be device-specific
> + *
> + * Add a given file entry to the DRM device debugfs file list to be crea=
ted on
> + * drm_debugfs_init.
> + */
> +int drm_debugfs_add_file(struct drm_device *dev, const char *name,
> +			 int (*show)(struct seq_file*, void*), void *data)
> +{
> +	struct drm_debugfs_entry *entry =3D drmm_kzalloc(dev, sizeof(*entry), G=
FP_KERNEL);
> +
> +	if (!entry)
> +		return -ENOMEM;
> +
> +	entry->file.name =3D name;
> +	entry->file.show =3D show;
> +	entry->file.data =3D data;
> +	entry->dev =3D dev;
> +
> +	mutex_lock(&dev->debugfs_mutex);
> +	list_add(&entry->list, &dev->debugfs_list);
> +	mutex_unlock(&dev->debugfs_mutex);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_debugfs_add_file);
> +
> +/**
> + * drm_debugfs_add_files - Add an array of files to the DRM device debug=
fs file list
> + * @dev: drm device for the ioctl
> + * @files: The array of files to create
> + * @count: The number of files given
> + *
> + * Add a given set of debugfs files represented by an array of
> + * &struct drm_debugfs_info in the DRM device debugfs file list.
> + */
> +int drm_debugfs_add_files(struct drm_device *dev, const struct drm_debug=
fs_info *files, int count)
> +{
> +	int i, ret =3D 0, err;
> +
> +	for (i =3D 0; i < count; i++) {
> +		err =3D drm_debugfs_add_file(dev, files[i].name, files[i].show, files[=
i].data);
> +		if (err)
> +			ret =3D err;
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_debugfs_add_files);

Do we want to add return values and error handling to debugfs related
functions at all?

BR,
Jani.


> +
>  static int connector_show(struct seq_file *m, void *data)
>  {
>  	struct drm_connector *connector =3D m->private;
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8214a0b1ab7f..803942008fcb 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -575,6 +575,7 @@ static void drm_dev_init_release(struct drm_device *d=
ev, void *res)
>  	mutex_destroy(&dev->clientlist_mutex);
>  	mutex_destroy(&dev->filelist_mutex);
>  	mutex_destroy(&dev->struct_mutex);
> +	mutex_destroy(&dev->debugfs_mutex);
>  	drm_legacy_destroy_members(dev);
>  }
>=20=20
> @@ -608,12 +609,14 @@ static int drm_dev_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&dev->filelist_internal);
>  	INIT_LIST_HEAD(&dev->clientlist);
>  	INIT_LIST_HEAD(&dev->vblank_event_list);
> +	INIT_LIST_HEAD(&dev->debugfs_list);
>=20=20
>  	spin_lock_init(&dev->event_lock);
>  	mutex_init(&dev->struct_mutex);
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> +	mutex_init(&dev->debugfs_mutex);
>=20=20
>  	ret =3D drmm_add_action(dev, drm_dev_init_release, NULL);
>  	if (ret)
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index 2188dc83957f..c5684d6c5055 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -79,12 +79,43 @@ struct drm_info_node {
>  	struct dentry *dent;
>  };
>=20=20
> +/**
> + * struct drm_debugfs_info - debugfs info list entry
> + *
> + * This structure represents a debugfs file to be created by the drm
> + * core.
> + */
> +struct drm_debugfs_info {
> +	const char *name;
> +	int (*show)(struct seq_file*, void*);
> +	u32 driver_features;
> +	void *data;
> +};
> +
> +/**
> + * struct drm_debugfs_entry - Per-device debugfs node structure
> + *
> + * This structure represents a debugfs file, as an instantiation of a &s=
truct
> + * drm_debugfs_info on a &struct drm_device.
> + */
> +struct drm_debugfs_entry {
> +	struct drm_device *dev;
> +	struct drm_debugfs_info file;
> +	struct list_head list;
> +};
> +
>  #if defined(CONFIG_DEBUG_FS)
>  void drm_debugfs_create_files(const struct drm_info_list *files,
>  			      int count, struct dentry *root,
>  			      struct drm_minor *minor);
>  int drm_debugfs_remove_files(const struct drm_info_list *files,
>  			     int count, struct drm_minor *minor);
> +
> +int drm_debugfs_add_file(struct drm_device *dev, const char *name,
> +			 int (*show)(struct seq_file*, void*), void *data);
> +
> +int drm_debugfs_add_files(struct drm_device *dev,
> +			  const struct drm_debugfs_info *files, int count);
>  #else
>  static inline void drm_debugfs_create_files(const struct drm_info_list *=
files,
>  					    int count, struct dentry *root,
> @@ -96,6 +127,20 @@ static inline int drm_debugfs_remove_files(const stru=
ct drm_info_list *files,
>  {
>  	return 0;
>  }
> +
> +static inline int drm_debugfs_add_file(struct drm_device *dev, const cha=
r *name,
> +				       int (*show)(struct seq_file*, void*),
> +				       void *data)
> +{
> +	return 0;
> +}
> +
> +static inline int drm_debugfs_add_files(struct drm_device *dev,
> +					const struct drm_debugfs_info *files,
> +					int count)
> +{
> +	return 0;
> +}
>  #endif
>=20=20
>  #endif /* _DRM_DEBUGFS_H_ */
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 9923c7a6885e..fa6af1d57929 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -295,6 +295,21 @@ struct drm_device {
>  	 */
>  	struct drm_fb_helper *fb_helper;
>=20=20
> +	/**
> +	 * @debugfs_mutex:
> +	 *
> +	 * Protects &debugfs_list access.
> +	 */
> +	struct mutex debugfs_mutex;
> +
> +	/**
> +	 * @debugfs_list:
> +	 *
> +	 * List of debugfs files to be created by the DRM device. The files
> +	 * must be added during drm_dev_register().
> +	 */
> +	struct list_head debugfs_list;
> +
>  	/* Everything below here is for legacy driver, never use! */
>  	/* private: */
>  #if IS_ENABLED(CONFIG_DRM_LEGACY)

--=20
Jani Nikula, Intel Open Source Graphics Center
