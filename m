Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE166BC51
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7670510E3C1;
	Mon, 16 Jan 2023 10:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7F610E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673866688; x=1705402688;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=f+nTMFeiCzau7Hf2aoO/4NFQXt9E0fPaVxeeKQ2iPEI=;
 b=nyQcqhSLW0zdM4Hj9qEpzu5+mfCjqT1dDBdSNBhsYBeYeEo+3GXvRUzJ
 TVTR6jMAb7hFOHoU/YyWrXRc/JUeR61xQwb/WlffGHAo2fa2ONHm8UDTT
 v9gFteC8o77VmOGOEZHhUMQou/2w7+1oPdhENSHZ4TdHVgOexpRsw3ixo
 p/TIS4zbh5a6TcJFpHTjdVR1YHUAE6S77a3xQJMoyMWT+dopOV6jaGfE5
 6J6RGGYMenmNXR2TbIcHP9msxC1N9orbptwT33lzh53tOZ99KDaMgb2ZW
 3BWF/Wj/tebaLPy4W+7vEDTgc+yYFjeutMLgwEzYdPkRC8xrIInGGOipA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="325701927"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="325701927"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 02:58:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="766842824"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="766842824"
Received: from amakarev-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.13.137])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 02:58:02 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau
 <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>, Noralf
 =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, Emma Anholt
 <emma@anholt.net>, Melissa Wen
 <mwen@igalia.com>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH 2/6] drm/debugfs: Make drm_device use the struct
 drm_debugfs_list
In-Reply-To: <20230116102815.95063-3-mcanal@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230116102815.95063-1-mcanal@igalia.com>
 <20230116102815.95063-3-mcanal@igalia.com>
Date: Mon, 16 Jan 2023 12:58:00 +0200
Message-ID: <87tu0qeog7.fsf@intel.com>
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
Cc: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Jan 2023, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
> The struct drm_debugfs_list encapsulates all the debugfs-related
> objects, so that they can be initialized and destroyed with two helpers.
> Therefore, make the struct drm_device use the struct drm_debugfs_list
> instead of instantiating the debugfs list and mutex separated.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 10 +++++-----
>  drivers/gpu/drm/drm_drv.c     |  7 ++++---
>  include/drm/drm_debugfs.h     |  3 +++
>  include/drm/drm_device.h      | 10 ++--------
>  4 files changed, 14 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 2f104a9e4276..176b0f8614e5 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -256,7 +256,7 @@ int drm_debugfs_init(struct drm_minor *minor, int min=
or_id,
>  	if (dev->driver->debugfs_init)
>  		dev->driver->debugfs_init(minor);
>=20=20
> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> +	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list.list, list) {
>  		debugfs_create_file(entry->file.name, 0444,
>  				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>  		list_del(&entry->list);
> @@ -273,7 +273,7 @@ void drm_debugfs_late_register(struct drm_device *dev)
>  	if (!minor)
>  		return;
>=20=20
> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> +	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list.list, list) {
>  		debugfs_create_file(entry->file.name, 0444,
>  				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>  		list_del(&entry->list);
> @@ -350,9 +350,9 @@ void drm_debugfs_add_file(struct drm_device *dev, con=
st char *name,
>  	entry->file.data =3D data;
>  	entry->dev =3D dev;
>=20=20
> -	mutex_lock(&dev->debugfs_mutex);
> -	list_add(&entry->list, &dev->debugfs_list);
> -	mutex_unlock(&dev->debugfs_mutex);
> +	mutex_lock(&dev->debugfs_list.mutex);
> +	list_add(&entry->list, &dev->debugfs_list.list);
> +	mutex_unlock(&dev->debugfs_list.mutex);
>  }
>  EXPORT_SYMBOL(drm_debugfs_add_file);
>=20=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 11748dd513c3..89c63ead8653 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -38,6 +38,7 @@
>  #include <drm/drm_cache.h>
>  #include <drm/drm_client.h>
>  #include <drm/drm_color_mgmt.h>
> +#include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_managed.h>
> @@ -575,7 +576,7 @@ static void drm_dev_init_release(struct drm_device *d=
ev, void *res)
>  	mutex_destroy(&dev->clientlist_mutex);
>  	mutex_destroy(&dev->filelist_mutex);
>  	mutex_destroy(&dev->struct_mutex);
> -	mutex_destroy(&dev->debugfs_mutex);
> +	drm_debugfs_list_destroy(&dev->debugfs_list);
>  	drm_legacy_destroy_members(dev);
>  }
>=20=20
> @@ -609,14 +610,14 @@ static int drm_dev_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&dev->filelist_internal);
>  	INIT_LIST_HEAD(&dev->clientlist);
>  	INIT_LIST_HEAD(&dev->vblank_event_list);
> -	INIT_LIST_HEAD(&dev->debugfs_list);
>=20=20
>  	spin_lock_init(&dev->event_lock);
>  	mutex_init(&dev->struct_mutex);
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> -	mutex_init(&dev->debugfs_mutex);
> +
> +	drm_debugfs_list_init(&dev->debugfs_list);
>=20=20
>  	ret =3D drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>  	if (ret)
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index 8658e97a88cf..b4e22e7d4016 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -36,6 +36,9 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  #include <linux/seq_file.h>
> +
> +struct drm_device;
> +

Seems unrelated to this commit.

>  /**
>   * struct drm_info_list - debugfs info list entry
>   *
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 282a171164ee..6ce10f9c7bae 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -6,6 +6,7 @@
>  #include <linux/mutex.h>
>  #include <linux/idr.h>
>=20=20
> +#include <drm/drm_debugfs.h>
>  #include <drm/drm_legacy.h>
>  #include <drm/drm_mode_config.h>
>=20=20
> @@ -308,20 +309,13 @@ struct drm_device {
>  	 */
>  	struct drm_fb_helper *fb_helper;
>=20=20
> -	/**
> -	 * @debugfs_mutex:
> -	 *
> -	 * Protects &debugfs_list access.
> -	 */
> -	struct mutex debugfs_mutex;
> -
>  	/**
>  	 * @debugfs_list:
>  	 *
>  	 * List of debugfs files to be created by the DRM device. The files
>  	 * must be added during drm_dev_register().
>  	 */
> -	struct list_head debugfs_list;
> +	struct drm_debugfs_list debugfs_list;

I was kind of thinking this would be a pointer, and struct
drm_debugfs_list would be an opaque type, with the definition inside
drm_debugfs.c. Nobody else needs to know the guts of it.

Plus it helps fight the header dependency complexity by letting the type
be a forward declaration here.

I also think "list" in the name exposes an implementation detail for no
good reason, when you have a chance to hide it. The users don't need to
know it's a list. Also, if we end up adding more things to it later, do
we want to rename everything then, or add things to a structure whose
name no longer describes what it contains?

Daniel, your thoughts?


BR,
Jani.



>=20=20
>  	/* Everything below here is for legacy driver, never use! */
>  	/* private: */

--=20
Jani Nikula, Intel Open Source Graphics Center
