Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316ED3B7632
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 18:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649726E8C4;
	Tue, 29 Jun 2021 16:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D446A6E8C3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 16:07:06 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j1so26441426wrn.9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 09:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=8Qqg2kHKap9tEq2fr8LzwiEtJhjPZLmt3+WFM7MygfM=;
 b=ZUXDHQDO1+8U0LdnMNBVwDh/9+SJg5oqfBdysdYL2jsWUpcML4Cs2icAeZxcynEiVK
 isP3D4mZYKSnMK2NLx5Y6JIgRJJJpZrXI7ZVzPizayJl/az40JXoYhZXpM97vDf/Y+2M
 5EAhnM3cjtztaZTP3e1GS6hHvDPFF9Dyo3upw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=8Qqg2kHKap9tEq2fr8LzwiEtJhjPZLmt3+WFM7MygfM=;
 b=NVWAZOC5cxw6Wa2Yl2I58Y42ADFOanpRShyV+ejwdPxJVEV+7fBZczvWJHwX12MaXl
 1T4AXTBFZnuA9gJYszXtEmxfVQoD7VJJ+k08WarSX2GkgCqGSgXwZ5Ic190tDYc5xnBj
 5YZNd+kgvjeb7sH8+dVdxiR6O3xtXc8VoKnTFgg07h9Mj3UPtKYuSoOClsDg6gkG31BP
 HfHMm81VLX5rulwEIBr7GwmbIm1ggMDY4UcirMgq9Ivo2BLuUO5PZXx6WF6l/e4LdbgU
 Vyb7dfg7YXq124QHh7AZMQniDnVNDBK98bV+OV9dEqWTl8s9nICxpzaRTrHDx1Tnwg6w
 hHWg==
X-Gm-Message-State: AOAM533pj9/0ah5OcN0SOOF3c8y6vhn6VK1cLnePB5rZPErJeDR76Aea
 JjQFm3vhbsL9AUFrT5+iMS+ApA==
X-Google-Smtp-Source: ABdhPJy1jqAR0YE1o9PaSsvkYs5Fll1ev502/8tirW6C4kdO3/xxnsEo067Zc8h+ebgtHs/2cyRIMw==
X-Received: by 2002:a05:6000:10:: with SMTP id
 h16mr809726wrx.367.1624982825474; 
 Tue, 29 Jun 2021 09:07:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p9sm2086612wmm.17.2021.06.29.09.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 09:07:04 -0700 (PDT)
Date: Tue, 29 Jun 2021 18:07:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v5 3/3] drm: protect drm_master pointers in drm_lease.c
Message-ID: <YNtFJhUw0U2s1TW0@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 emil.l.velikov@gmail.com
References: <20210629033706.20537-1-desmondcheongzx@gmail.com>
 <20210629033706.20537-4-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629033706.20537-4-desmondcheongzx@gmail.com>
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
Cc: tzimmermann@suse.de, Daniel Vetter <daniel.vetter@ffwll.ch>,
 airlied@linux.ie, gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 29, 2021 at 11:37:06AM +0800, Desmond Cheong Zhi Xi wrote:
> Currently, direct copies of drm_file->master pointers should be
> protected by drm_device.master_mutex when being dereferenced. This is
> because drm_file->master is not invariant for the lifetime of
> drm_file. If drm_file is not the creator of master, then
> drm_file->is_master is false, and a call to drm_setmaster_ioctl will
> invoke drm_new_set_master, which then allocates a new master for
> drm_file and puts the old master.
> 
> Thus, without holding drm_device.master_mutex, the old value of
> drm_file->master could be freed while it is being used by another
> concurrent process.
> 
> In drm_lease.c, there are multiple instances where drm_file->master is
> accessed and dereferenced while drm_device.master_mutex is not
> held. This makes drm_lease.c vulnerable to use-after-free bugs.
> 
> We address this issue in 3 ways:
> 
> 1. Clarify in the kerneldoc that drm_file->master is protected by
> drm_device.master_mutex.
> 
> 2. Add a new drm_file_get_master() function that calls drm_master_get
> on drm_file->master while holding on to drm_device.master_mutex. Since
> drm_master_get increments the reference count of master, this
> prevents master from being freed until we unreference it with
> drm_master_put.
> 
> 3. In each case where drm_file->master is directly accessed and
> eventually dereferenced in drm_lease.c, we wrap the access in a call
> to the new drm_file_get_master function, then unreference the master
> pointer once we are done using it.
> 
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Series looks very nice, let's see what intel-gfx-ci says. You should get a
mail, but results are also here:

https://patchwork.freedesktop.org/series/91969/#rev2

One tiny comment below.

> ---
>  drivers/gpu/drm/drm_auth.c  | 25 ++++++++++++
>  drivers/gpu/drm/drm_lease.c | 77 +++++++++++++++++++++++++++----------
>  include/drm/drm_auth.h      |  1 +
>  include/drm/drm_file.h      | 15 ++++++--
>  4 files changed, 95 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index ab1863c5a5a0..c36a0b72be26 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -384,6 +384,31 @@ struct drm_master *drm_master_get(struct drm_master *master)
>  }
>  EXPORT_SYMBOL(drm_master_get);
>  
> +/**
> + * drm_file_get_master - reference &drm_file.master of @file_priv
> + * @file_priv: DRM file private
> + *
> + * Increments the reference count of @file_priv's &drm_file.master and returns
> + * the &drm_file.master. If @file_priv has no &drm_file.master, returns NULL.
> + *
> + * Master pointers returned from this function should be unreferenced using
> + * drm_master_put().
> + */
> +struct drm_master *drm_file_get_master(struct drm_file *file_priv)
> +{
> +	struct drm_master *master = NULL;
> +
> +	mutex_lock(&file_priv->minor->dev->master_mutex);
> +	if (!file_priv->master)
> +		goto unlock;
> +	master = drm_master_get(file_priv->master);
> +
> +unlock:
> +	mutex_unlock(&file_priv->minor->dev->master_mutex);
> +	return master;
> +}
> +EXPORT_SYMBOL(drm_file_get_master);
> +
>  static void drm_master_destroy(struct kref *kref)
>  {
>  	struct drm_master *master = container_of(kref, struct drm_master, refcount);
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index 00fb433bcef1..cdcc87fa9685 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -106,10 +106,19 @@ static bool _drm_has_leased(struct drm_master *master, int id)
>   */
>  bool _drm_lease_held(struct drm_file *file_priv, int id)
>  {
> -	if (!file_priv || !file_priv->master)
> +	bool ret;
> +	struct drm_master *master;
> +
> +	if (!file_priv)
>  		return true;
>  
> -	return _drm_lease_held_master(file_priv->master, id);
> +	master = drm_file_get_master(file_priv);
> +	if (master == NULL)
> +		return true;
> +	ret = _drm_lease_held_master(master, id);
> +	drm_master_put(&master);
> +
> +	return ret;
>  }
>  
>  /**
> @@ -128,13 +137,20 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
>  	struct drm_master *master;
>  	bool ret;
>  
> -	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
> +	if (!file_priv)
>  		return true;
>  
> -	master = file_priv->master;
> +	master = drm_file_get_master(file_priv);
> +	if (master == NULL)
> +		return true;
> +	if (!master->lessor) {
> +		drm_master_put(&master);
> +		return true;
> +	}
>  	mutex_lock(&master->dev->mode_config.idr_mutex);
>  	ret = _drm_lease_held_master(master, id);
>  	mutex_unlock(&master->dev->mode_config.idr_mutex);
> +	drm_master_put(&master);
>  	return ret;
>  }
>  
> @@ -154,10 +170,16 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>  	int count_in, count_out;
>  	uint32_t crtcs_out = 0;
>  
> -	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
> +	if (!file_priv)
>  		return crtcs_in;
>  
> -	master = file_priv->master;
> +	master = drm_file_get_master(file_priv);
> +	if (master == NULL)
> +		return crtcs_in;
> +	if (!master->lessor) {
> +		drm_master_put(&master);
> +		return crtcs_in;
> +	}
>  	dev = master->dev;
>  
>  	count_in = count_out = 0;
> @@ -176,6 +198,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>  		count_in++;
>  	}
>  	mutex_unlock(&master->dev->mode_config.idr_mutex);
> +	drm_master_put(&master);
>  	return crtcs_out;
>  }
>  
> @@ -489,7 +512,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  	size_t object_count;
>  	int ret = 0;
>  	struct idr leases;
> -	struct drm_master *lessor = lessor_priv->master;
> +	struct drm_master *lessor;
>  	struct drm_master *lessee = NULL;
>  	struct file *lessee_file = NULL;
>  	struct file *lessor_file = lessor_priv->filp;
> @@ -501,12 +524,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	/* Do not allow sub-leases */
> -	if (lessor->lessor) {
> -		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
> -		return -EINVAL;
> -	}
> -
>  	/* need some objects */
>  	if (cl->object_count == 0) {
>  		DRM_DEBUG_LEASE("no objects in lease\n");
> @@ -518,12 +535,22 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> +	lessor = drm_file_get_master(lessor_priv);
> +	/* Do not allow sub-leases */
> +	if (lessor->lessor) {
> +		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
> +		ret = -EINVAL;
> +		goto out_lessor;
> +	}
> +
>  	object_count = cl->object_count;
>  
>  	object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
>  			array_size(object_count, sizeof(__u32)));
> -	if (IS_ERR(object_ids))
> -		return PTR_ERR(object_ids);
> +	if (IS_ERR(object_ids)) {
> +		ret = PTR_ERR(object_ids);
> +		goto out_lessor;
> +	}
>  
>  	idr_init(&leases);
>  
> @@ -534,14 +561,15 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  	if (ret) {
>  		DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
>  		idr_destroy(&leases);
> -		return ret;
> +		goto out_lessor;
>  	}
>  
>  	/* Allocate a file descriptor for the lease */
>  	fd = get_unused_fd_flags(cl->flags & (O_CLOEXEC | O_NONBLOCK));
>  	if (fd < 0) {
>  		idr_destroy(&leases);
> -		return fd;
> +		ret = fd;
> +		goto out_lessor;
>  	}
>  
>  	DRM_DEBUG_LEASE("Creating lease\n");
> @@ -577,6 +605,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  	/* Hook up the fd */
>  	fd_install(fd, lessee_file);
>  
> +	drm_master_put(&lessor);
>  	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
>  	return 0;
>  
> @@ -586,6 +615,8 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  out_leases:
>  	put_unused_fd(fd);
>  
> +out_lessor:
> +	drm_master_put(&lessor);
>  	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
>  	return ret;
>  }
> @@ -608,7 +639,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>  	struct drm_mode_list_lessees *arg = data;
>  	__u32 __user *lessee_ids = (__u32 __user *) (uintptr_t) (arg->lessees_ptr);
>  	__u32 count_lessees = arg->count_lessees;
> -	struct drm_master *lessor = lessor_priv->master, *lessee;
> +	struct drm_master *lessor, *lessee;
>  	int count;
>  	int ret = 0;
>  
> @@ -619,6 +650,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> +	lessor = drm_file_get_master(lessor_priv);
>  	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
>  
>  	mutex_lock(&dev->mode_config.idr_mutex);
> @@ -642,6 +674,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>  		arg->count_lessees = count;
>  
>  	mutex_unlock(&dev->mode_config.idr_mutex);
> +	drm_master_put(&lessor);
>  
>  	return ret;
>  }
> @@ -661,7 +694,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>  	struct drm_mode_get_lease *arg = data;
>  	__u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
>  	__u32 count_objects = arg->count_objects;
> -	struct drm_master *lessee = lessee_priv->master;
> +	struct drm_master *lessee;
>  	struct idr *object_idr;
>  	int count;
>  	void *entry;
> @@ -675,6 +708,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> +	lessee = drm_file_get_master(lessee_priv);
>  	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
>  
>  	mutex_lock(&dev->mode_config.idr_mutex);
> @@ -702,6 +736,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>  		arg->count_objects = count;
>  
>  	mutex_unlock(&dev->mode_config.idr_mutex);
> +	drm_master_put(&lessee);
>  
>  	return ret;
>  }
> @@ -720,7 +755,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>  				void *data, struct drm_file *lessor_priv)
>  {
>  	struct drm_mode_revoke_lease *arg = data;
> -	struct drm_master *lessor = lessor_priv->master;
> +	struct drm_master *lessor;
>  	struct drm_master *lessee;
>  	int ret = 0;
>  
> @@ -730,6 +765,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> +	lessor = drm_file_get_master(lessor_priv);
>  	mutex_lock(&dev->mode_config.idr_mutex);
>  
>  	lessee = _drm_find_lessee(lessor, arg->lessee_id);
> @@ -750,6 +786,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>  
>  fail:
>  	mutex_unlock(&dev->mode_config.idr_mutex);
> +	drm_master_put(&lessor);
>  
>  	return ret;
>  }
> diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
> index 6bf8b2b78991..f99d3417f304 100644
> --- a/include/drm/drm_auth.h
> +++ b/include/drm/drm_auth.h
> @@ -107,6 +107,7 @@ struct drm_master {
>  };
>  
>  struct drm_master *drm_master_get(struct drm_master *master);
> +struct drm_master *drm_file_get_master(struct drm_file *file_priv);
>  void drm_master_put(struct drm_master **master);
>  bool drm_is_current_master(struct drm_file *fpriv);
>  
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index b81b3bfb08c8..e9931fca4ab7 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -226,9 +226,18 @@ struct drm_file {
>  	/**
>  	 * @master:
>  	 *
> -	 * Master this node is currently associated with. Only relevant if
> -	 * drm_is_primary_client() returns true. Note that this only
> -	 * matches &drm_device.master if the master is the currently active one.
> +	 * Master this node is currently associated with. Protected by struct
> +	 * &drm_device.master_mutex.
> +	 *
> +	 * Only relevant if drm_is_primary_client() returns true. Note that
> +	 * this only matches &drm_device.master if the master is the currently
> +	 * active one.
> +	 *
> +	 * When obtaining a copy of this pointer, it is recommended to either

I found this a bit confusing, since I generally don't think of
dereferencing the pointer as "taking a copy". That's more for the entire
datastructure when you have a memcpy() call, or kmemdup() or something
like that. Also "it is recommended" is a bit weak if you get a
use-after-free if you dont :-)

So instead "When dererencing this pointer either hold ... or use
drm_file_get_master() ...."

Cheers, Daniel

> +	 * hold struct &drm_device.master_mutex for the duration of the
> +	 * pointer's use, or to use drm_file_get_master() if struct
> +	 * &drm_device.master_mutex is not currently held and there is no other
> +	 * need to hold it. This prevents @master from being freed during use.
>  	 *
>  	 * See also @authentication and @is_master and the :ref:`section on
>  	 * primary nodes and authentication <drm_primary_node>`.
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
