Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75E3F84DF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF726E5A5;
	Thu, 26 Aug 2021 09:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A6C6E5A5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 09:55:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso5248865wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=qy0kCeaWJ/iVBGXNdtf+HIZzfuLE8Aw9Sas3eoKAYNQ=;
 b=HD1r+jOVuCPSdgCPen3iZ0bwdi2fmd1QSBVWuu7PpffXpus4uiosfvCT95ICVHLZlx
 aKdabwSPluCIDIxq7BVdWJ3W+LvG2k8fpd+tQvu8YqEdTb+5h1JNlmvNtlUO99k+Pz+0
 6KhrMsIJtwQebHBkAW42mW6ayqRJ1Si1SqcLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=qy0kCeaWJ/iVBGXNdtf+HIZzfuLE8Aw9Sas3eoKAYNQ=;
 b=oa7naB9xRTye7Ej2f7oeiXob7vhb8JxwV0sVfhfuXl0Qzt56KGVJr2apKA+ONknwCa
 /BXUY+Bhi74/x1jIbauznRxCI6qW4xo/ft4a9j+8Y3FtNSaXmCS4fS9Air9Q+PXUFr8R
 BU2YwwCJGgoaeHmftHgT5zNwKtWNWSNk35nNUkzJp8rmwOY96DAVO6ymhEI4iWtCJYda
 4sY7IBibhK4OM0NiqaUftNhrIMz63FshgfAkmiD4LORmZ7FtghSDUCewKVDuwtLUvote
 gO+sp9Fmz4/DQ/KzKsIFEMDYs0eueItF5CFbYeixIg/BdqGvWgMwE7q/JsFM8jvyd+sC
 DtPQ==
X-Gm-Message-State: AOAM533xg6euEEiH8jP2xFEzGanopWTW5H6rGw4r/Y+KMJD2lZGjZZOv
 wXiPGCMz5Op3gDdlJQeSi0Nf1A==
X-Google-Smtp-Source: ABdhPJz0pg6sAf9ioH0PxsqwtwukFpMskaL6Ihxtx/wS7W3ep1ddxVt7uF7PxqVlewIB72/s3kZGeA==
X-Received: by 2002:a05:600c:1c11:: with SMTP id
 j17mr13241597wms.138.1629971720052; 
 Thu, 26 Aug 2021 02:55:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g11sm2554304wrx.30.2021.08.26.02.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:55:19 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:55:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chris@chris-wilson.co.uk,
 ville.syrjala@linux.intel.com, matthew.auld@intel.com,
 dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 karthik.b.s@intel.com, jose.souza@intel.com,
 manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v8 2/7] drm: convert drm_device.master_mutex into a rwsem
Message-ID: <YSdlBf1Q4TYufFtB@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com,
 tvrtko.ursulin@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-3-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826020122.1488002-3-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Thu, Aug 26, 2021 at 10:01:17AM +0800, Desmond Cheong Zhi Xi wrote:
> drm_device.master_mutex currently protects the following:
> - drm_device.master
> - drm_file.master
> - drm_file.was_master
> - drm_file.is_master
> - drm_master.unique
> - drm_master.unique_len
> - drm_master.magic_map
> 
> There is a clear separation between functions that read or change
> these attributes. Hence, convert master_mutex into a rwsem to enable
> concurrent readers.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_auth.c    | 35 ++++++++++++++++++-----------------
>  drivers/gpu/drm/drm_debugfs.c |  4 ++--
>  drivers/gpu/drm/drm_drv.c     |  3 +--
>  drivers/gpu/drm/drm_ioctl.c   | 10 +++++-----
>  include/drm/drm_auth.h        |  6 +++---
>  include/drm/drm_device.h      | 10 ++++++----
>  include/drm/drm_file.h        | 12 ++++++------
>  7 files changed, 41 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 60a6b21474b1..73ade0513ccb 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -64,7 +64,7 @@
>  static bool drm_is_current_master_locked(struct drm_file *fpriv)
>  {
>  	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
> -			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
> +			    lockdep_is_held(&fpriv->minor->dev->master_rwsem));
>  
>  	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
>  }
> @@ -96,7 +96,7 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>  	struct drm_auth *auth = data;
>  	int ret = 0;
>  
> -	mutex_lock(&dev->master_mutex);
> +	down_write(&dev->master_rwsem);
>  	if (!file_priv->magic) {
>  		ret = idr_alloc(&file_priv->master->magic_map, file_priv,
>  				1, 0, GFP_KERNEL);
> @@ -104,7 +104,7 @@ int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>  			file_priv->magic = ret;
>  	}
>  	auth->magic = file_priv->magic;
> -	mutex_unlock(&dev->master_mutex);
> +	up_write(&dev->master_rwsem);
>  
>  	DRM_DEBUG("%u\n", auth->magic);
>  
> @@ -119,13 +119,13 @@ int drm_authmagic(struct drm_device *dev, void *data,
>  
>  	DRM_DEBUG("%u\n", auth->magic);
>  
> -	mutex_lock(&dev->master_mutex);
> +	down_write(&dev->master_rwsem);
>  	file = idr_find(&file_priv->master->magic_map, auth->magic);
>  	if (file) {
>  		file->authenticated = 1;
>  		idr_replace(&file_priv->master->magic_map, NULL, auth->magic);
>  	}
> -	mutex_unlock(&dev->master_mutex);
> +	up_write(&dev->master_rwsem);
>  
>  	return file ? 0 : -EINVAL;
>  }
> @@ -167,7 +167,7 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
>  	struct drm_master *old_master;
>  	struct drm_master *new_master;
>  
> -	lockdep_assert_held_once(&dev->master_mutex);
> +	lockdep_assert_held_once(&dev->master_rwsem);
>  
>  	WARN_ON(fpriv->is_master);
>  	old_master = fpriv->master;
> @@ -249,7 +249,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  {
>  	int ret;
>  
> -	mutex_lock(&dev->master_mutex);
> +	down_write(&dev->master_rwsem);
>  
>  	ret = drm_master_check_perm(dev, file_priv);
>  	if (ret)
> @@ -281,7 +281,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  
>  	drm_set_master(dev, file_priv, false);
>  out_unlock:
> -	mutex_unlock(&dev->master_mutex);
> +	up_write(&dev->master_rwsem);
>  	return ret;
>  }
>  
> @@ -298,7 +298,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  {
>  	int ret;
>  
> -	mutex_lock(&dev->master_mutex);
> +	down_write(&dev->master_rwsem);
>  
>  	ret = drm_master_check_perm(dev, file_priv);
>  	if (ret)
> @@ -321,8 +321,9 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  	drm_drop_master(dev, file_priv);
> +
>  out_unlock:
> -	mutex_unlock(&dev->master_mutex);
> +	up_write(&dev->master_rwsem);
>  	return ret;
>  }
>  
> @@ -334,7 +335,7 @@ int drm_master_open(struct drm_file *file_priv)
>  	/* if there is no current master make this fd it, but do not create
>  	 * any master object for render clients
>  	 */
> -	mutex_lock(&dev->master_mutex);
> +	down_write(&dev->master_rwsem);
>  	if (!dev->master) {
>  		ret = drm_new_set_master(dev, file_priv);
>  	} else {
> @@ -342,7 +343,7 @@ int drm_master_open(struct drm_file *file_priv)
>  		file_priv->master = drm_master_get(dev->master);
>  		spin_unlock(&file_priv->master_lookup_lock);
>  	}
> -	mutex_unlock(&dev->master_mutex);
> +	up_write(&dev->master_rwsem);
>  
>  	return ret;
>  }
> @@ -352,7 +353,7 @@ void drm_master_release(struct drm_file *file_priv)
>  	struct drm_device *dev = file_priv->minor->dev;
>  	struct drm_master *master;
>  
> -	mutex_lock(&dev->master_mutex);
> +	down_write(&dev->master_rwsem);
>  	master = file_priv->master;
>  	if (file_priv->magic)
>  		idr_remove(&file_priv->master->magic_map, file_priv->magic);
> @@ -375,7 +376,7 @@ void drm_master_release(struct drm_file *file_priv)
>  	/* drop the master reference held by the file priv */
>  	if (file_priv->master)
>  		drm_master_put(&file_priv->master);
> -	mutex_unlock(&dev->master_mutex);
> +	up_write(&dev->master_rwsem);
>  }
>  
>  /**
> @@ -450,9 +451,9 @@ EXPORT_SYMBOL(drm_master_put);
>  /* Used by drm_client and drm_fb_helper */
>  bool drm_master_internal_acquire(struct drm_device *dev)
>  {
> -	mutex_lock(&dev->master_mutex);
> +	down_read(&dev->master_rwsem);
>  	if (dev->master) {
> -		mutex_unlock(&dev->master_mutex);
> +		up_read(&dev->master_rwsem);
>  		return false;
>  	}
>  
> @@ -463,6 +464,6 @@ EXPORT_SYMBOL(drm_master_internal_acquire);
>  /* Used by drm_client and drm_fb_helper */
>  void drm_master_internal_release(struct drm_device *dev)
>  {
> -	mutex_unlock(&dev->master_mutex);
> +	up_read(&dev->master_rwsem);
>  }
>  EXPORT_SYMBOL(drm_master_internal_release);
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index b0a826489488..b34c9c263188 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -55,7 +55,7 @@ static int drm_name_info(struct seq_file *m, void *data)
>  	struct drm_device *dev = minor->dev;
>  	struct drm_master *master;
>  
> -	mutex_lock(&dev->master_mutex);
> +	down_read(&dev->master_rwsem);
>  	master = dev->master;
>  	seq_printf(m, "%s", dev->driver->name);
>  	if (dev->dev)
> @@ -65,7 +65,7 @@ static int drm_name_info(struct seq_file *m, void *data)
>  	if (dev->unique)
>  		seq_printf(m, " unique=%s", dev->unique);
>  	seq_printf(m, "\n");
> -	mutex_unlock(&dev->master_mutex);
> +	up_read(&dev->master_rwsem);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7a5097467ba5..4556bf42954c 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -570,7 +570,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  	/* Prevent use-after-free in drm_managed_release when debugging is
>  	 * enabled. Slightly awkward, but can't really be helped. */
>  	dev->dev = NULL;
> -	mutex_destroy(&dev->master_mutex);
>  	mutex_destroy(&dev->clientlist_mutex);
>  	mutex_destroy(&dev->filelist_mutex);
>  	mutex_destroy(&dev->struct_mutex);
> @@ -611,7 +610,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	mutex_init(&dev->struct_mutex);
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
> -	mutex_init(&dev->master_mutex);
> +	init_rwsem(&dev->master_rwsem);
>  
>  	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 26f3a9ede8fe..d25713b09b80 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -119,16 +119,16 @@ int drm_getunique(struct drm_device *dev, void *data,
>  	struct drm_unique *u = data;
>  	struct drm_master *master;
>  
> -	mutex_lock(&dev->master_mutex);
> +	down_read(&dev->master_rwsem);
>  	master = file_priv->master;
>  	if (u->unique_len >= master->unique_len) {
>  		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
> -			mutex_unlock(&dev->master_mutex);
> +			up_read(&dev->master_rwsem);
>  			return -EFAULT;
>  		}
>  	}
>  	u->unique_len = master->unique_len;
> -	mutex_unlock(&dev->master_mutex);
> +	up_read(&dev->master_rwsem);
>  
>  	return 0;
>  }
> @@ -385,7 +385,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
>  	struct drm_set_version *sv = data;
>  	int if_version, retcode = 0;
>  
> -	mutex_lock(&dev->master_mutex);
> +	down_write(&dev->master_rwsem);
>  	if (sv->drm_di_major != -1) {
>  		if (sv->drm_di_major != DRM_IF_MAJOR ||
>  		    sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MINOR) {
> @@ -420,7 +420,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
>  	sv->drm_di_minor = DRM_IF_MINOR;
>  	sv->drm_dd_major = dev->driver->major;
>  	sv->drm_dd_minor = dev->driver->minor;
> -	mutex_unlock(&dev->master_mutex);
> +	up_write(&dev->master_rwsem);
>  
>  	return retcode;
>  }
> diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
> index ba248ca8866f..f0a89e5fcaad 100644
> --- a/include/drm/drm_auth.h
> +++ b/include/drm/drm_auth.h
> @@ -67,17 +67,17 @@ struct drm_master {
>  	struct drm_device *dev;
>  	/**
>  	 * @unique: Unique identifier: e.g. busid. Protected by
> -	 * &drm_device.master_mutex.
> +	 * &drm_device.master_rwsem.
>  	 */
>  	char *unique;
>  	/**
>  	 * @unique_len: Length of unique field. Protected by
> -	 * &drm_device.master_mutex.
> +	 * &drm_device.master_rwsem.
>  	 */
>  	int unique_len;
>  	/**
>  	 * @magic_map: Map of used authentication tokens. Protected by
> -	 * &drm_device.master_mutex.
> +	 * &drm_device.master_rwsem.
>  	 */
>  	struct idr magic_map;
>  	void *driver_priv;
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 604b1d1b2d72..142fb2f6e74d 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -107,7 +107,7 @@ struct drm_device {
>  	 * @master:
>  	 *
>  	 * Currently active master for this device.
> -	 * Protected by &master_mutex
> +	 * Protected by &master_rwsem
>  	 */
>  	struct drm_master *master;
>  
> @@ -146,11 +146,13 @@ struct drm_device {
>  	struct mutex struct_mutex;
>  
>  	/**
> -	 * @master_mutex:
> +	 * @master_rwsem:
>  	 *
> -	 * Lock for &drm_minor.master and &drm_file.is_master
> +	 * Lock for &drm_device.master, &drm_file.was_master,
> +	 * &drm_file.is_master, &drm_file.master, &drm_master.unique,
> +	 * &drm_master.unique_len, and &drm_master.magic_map.
>  	 */
> -	struct mutex master_mutex;
> +	struct rw_semaphore master_rwsem;
>  
>  	/**
>  	 * @open_count:
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index a3acb7ac3550..d12bb2ba7814 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -205,7 +205,7 @@ struct drm_file {
>  	 * @was_master:
>  	 *
>  	 * This client has or had, master capability. Protected by struct
> -	 * &drm_device.master_mutex.
> +	 * &drm_device.master_rwsem.
>  	 *
>  	 * This is used to ensure that CAP_SYS_ADMIN is not enforced, if the
>  	 * client is or was master in the past.
> @@ -216,7 +216,7 @@ struct drm_file {
>  	 * @is_master:
>  	 *
>  	 * This client is the creator of @master. Protected by struct
> -	 * &drm_device.master_mutex.
> +	 * &drm_device.master_rwsem.
>  	 *
>  	 * See also the :ref:`section on primary nodes and authentication
>  	 * <drm_primary_node>`.
> @@ -227,19 +227,19 @@ struct drm_file {
>  	 * @master:
>  	 *
>  	 * Master this node is currently associated with. Protected by struct
> -	 * &drm_device.master_mutex, and serialized by @master_lookup_lock.
> +	 * &drm_device.master_rwsem, and serialized by @master_lookup_lock.
>  	 *
>  	 * Only relevant if drm_is_primary_client() returns true. Note that
>  	 * this only matches &drm_device.master if the master is the currently
>  	 * active one.
>  	 *
> -	 * To update @master, both &drm_device.master_mutex and
> +	 * To update @master, both &drm_device.master_rwsem and
>  	 * @master_lookup_lock need to be held, therefore holding either of
>  	 * them is safe and enough for the read side.
>  	 *
>  	 * When dereferencing this pointer, either hold struct
> -	 * &drm_device.master_mutex for the duration of the pointer's use, or
> -	 * use drm_file_get_master() if struct &drm_device.master_mutex is not
> +	 * &drm_device.master_rwsem for the duration of the pointer's use, or
> +	 * use drm_file_get_master() if struct &drm_device.master_rwsem is not
>  	 * currently held and there is no other need to hold it. This prevents
>  	 * @master from being freed during use.
>  	 *
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
