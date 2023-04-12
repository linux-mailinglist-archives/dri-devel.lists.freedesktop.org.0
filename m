Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E236DF964
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 17:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591A110E85B;
	Wed, 12 Apr 2023 15:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC52310E85B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 15:11:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f45377dcc7so115518f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681312301; x=1683904301;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cBZEFe8jF6I2TTssrP11rLkZzcviCdJWtbOf6oJxoF0=;
 b=C5xg0lTB6e8Sw719rmiGMSbvoUZG0Tsutn2O7OibaRriD1Zntk7+Mtq9TDAHsBwDpb
 aBbLdhjNqDCyILvhFpTa9+fsVR7j81IiGTYBr1KsuPVyd35Eh4U5MUFhzIUeuh0HyOS9
 QDh26Vevqb8yf98as6XG+8+woSjq7R6GMNmg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681312301; x=1683904301;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cBZEFe8jF6I2TTssrP11rLkZzcviCdJWtbOf6oJxoF0=;
 b=DnAx0rZSLfjA63EojXEokXTy66XR+02+55xCTElXeu30xYinlWph+uAjiW67dMMtJh
 kAPKjcKE10RqMVJUSYeBxIsnYtA/wX3FNNr4tVkz+rij14o1zX98wcshjz+FEN+xq7zY
 XzkRM/Sl99oRJu6gSy+r4nQ0wxVZEqi9F5qgAATIjsE/y+KP26Y9bG10vM3kMw7TtSdT
 q3jnuUKvTjYk8P0OoIhAe75gur/xTliwikt1WRfOMh4D2iPddJ3LwH7/FtE1ksZLl2wa
 YM3wLtB/+h4YmG/yhSak3AMYTE2LhY1uI6M17wHhSEGpV7zlxDYlf+4bJdUxhQwLFAcS
 qBiA==
X-Gm-Message-State: AAQBX9di64MUfv1zlhzguL+dRKmoyp517yoQC6z4/IkLIFEAO6X3mnlB
 uUcjtlKq2Y84JrskXu0sCD9WSA==
X-Google-Smtp-Source: AKy350a3hpRW10OhVJB62S+xNDj6Q8wV2j4VKVf+eji2p9IP3uHCcSKjbYyDAuw/qbHa2BPzm0HFfQ==
X-Received: by 2002:adf:ffc3:0:b0:2e4:c9ac:c492 with SMTP id
 x3-20020adfffc3000000b002e4c9acc492mr1733057wrs.1.1681312300972; 
 Wed, 12 Apr 2023 08:11:40 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 x18-20020adfec12000000b002f2b8cb5d9csm5512244wrn.28.2023.04.12.08.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 08:11:40 -0700 (PDT)
Date: Wed, 12 Apr 2023 17:11:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/5] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex v2
Message-ID: <ZDbKKq6wlxhhrFyy@phenom.ffwll.local>
References: <20230412145206.2483-1-christian.koenig@amd.com>
 <20230412145206.2483-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230412145206.2483-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64
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
Cc: quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org, ogabbay@kernel.org,
 mcanal@igalia.com, mwen@igalia.com, stanislaw.gruszka@linux.intel.com,
 maxime@cerno.tech, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 04:52:04PM +0200, Christian König wrote:
> The mutex was completely pointless in the first place since any
> parallel adding of files to this list would result in random
> behavior since the list is filled and consumed multiple times.
> 
> Completely drop that approach and just create the files directly but
> return -ENODEV while opening the file when the minors are not
> registered yet.

This part seems to be missing?

The other issue is that partial driver load cleanup now goes boom I think,
you need to both remove them all in _unregister but also in final drm_dev
cleanup. Or I'm missing how this works. Maybe you could also use drmm_ for
that to make sure it's always done.

There shouldn't be a race as long as the "are we registered yet" check is
there, since in that case the driver never registered. So no problems
trying to access the files when they could try to access things which are
already cleaned up.

I think with those details ironed out this makes some sense to me,
assuming I understood it correctly.

> 
> v2: rebase on debugfs directory rework, limit access before minors are
>     registered.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c     | 27 ++-------------------------
>  drivers/gpu/drm/drm_drv.c         |  3 ---
>  drivers/gpu/drm/drm_internal.h    |  5 -----
>  drivers/gpu/drm/drm_mode_config.c |  2 --
>  include/drm/drm_device.h          | 15 ---------------
>  5 files changed, 2 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 59c3d76d28f4..427c5eb4eca0 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -245,7 +245,6 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>  			 struct dentry *root)
>  {
>  	struct drm_device *dev = minor->dev;
> -	struct drm_debugfs_entry *entry, *tmp;
>  	char name[64];
>  
>  	INIT_LIST_HEAD(&minor->debugfs_list);
> @@ -260,30 +259,9 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>  	if (dev->driver->debugfs_init && dev->render != minor)
>  		dev->driver->debugfs_init(minor);
>  
> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> -		debugfs_create_file(entry->file.name, 0444,
> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> -		list_del(&entry->list);
> -	}
> -
>  	return 0;
>  }
>  
> -void drm_debugfs_late_register(struct drm_device *dev)
> -{
> -	struct drm_minor *minor = dev->primary;
> -	struct drm_debugfs_entry *entry, *tmp;
> -
> -	if (!minor)
> -		return;
> -
> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> -		debugfs_create_file(entry->file.name, 0444,
> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> -		list_del(&entry->list);
> -	}
> -}
> -
>  int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>  			     struct drm_minor *minor)
>  {
> @@ -353,9 +331,8 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>  	entry->file.data = data;
>  	entry->dev = dev;
>  
> -	mutex_lock(&dev->debugfs_mutex);
> -	list_add(&entry->list, &dev->debugfs_list);
> -	mutex_unlock(&dev->debugfs_mutex);
> +	debugfs_create_file(name, 0444, dev->debugfs_root, entry,
> +			    &drm_debugfs_entry_fops);
>  }
>  EXPORT_SYMBOL(drm_debugfs_add_file);
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 05b831f9fe71..f928b4490ece 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  	mutex_destroy(&dev->clientlist_mutex);
>  	mutex_destroy(&dev->filelist_mutex);
>  	mutex_destroy(&dev->struct_mutex);
> -	mutex_destroy(&dev->debugfs_mutex);
>  	drm_legacy_destroy_members(dev);
>  }
>  
> @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&dev->filelist_internal);
>  	INIT_LIST_HEAD(&dev->clientlist);
>  	INIT_LIST_HEAD(&dev->vblank_event_list);
> -	INIT_LIST_HEAD(&dev->debugfs_list);
>  
>  	spin_lock_init(&dev->event_lock);
>  	mutex_init(&dev->struct_mutex);
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> -	mutex_init(&dev->debugfs_mutex);
>  
>  	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 5c6e1cadf09b..c5fadbd3fd7d 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -185,7 +185,6 @@ void drm_debugfs_dev_register(struct drm_device *dev);
>  int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>  			 struct dentry *root);
>  void drm_debugfs_cleanup(struct drm_minor *minor);
> -void drm_debugfs_late_register(struct drm_device *dev);
>  void drm_debugfs_connector_add(struct drm_connector *connector);
>  void drm_debugfs_connector_remove(struct drm_connector *connector);
>  void drm_debugfs_crtc_add(struct drm_crtc *crtc);
> @@ -206,10 +205,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
>  {
>  }
>  
> -static inline void drm_debugfs_late_register(struct drm_device *dev)
> -{
> -}
> -
>  static inline void drm_debugfs_connector_add(struct drm_connector *connector)
>  {
>  }
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 87eb591fe9b5..8525ef851540 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
>  	if (ret)
>  		goto err_connector;
>  
> -	drm_debugfs_late_register(dev);
> -
>  	return 0;
>  
>  err_connector:
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 3cf12b14232d..c490977ee250 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -318,21 +318,6 @@ struct drm_device {
>  	 */
>  	struct dentry *debugfs_root;
>  
> -	/**
> -	 * @debugfs_mutex:
> -	 *
> -	 * Protects &debugfs_list access.
> -	 */
> -	struct mutex debugfs_mutex;
> -
> -	/**
> -	 * @debugfs_list:
> -	 *
> -	 * List of debugfs files to be created by the DRM device. The files
> -	 * must be added during drm_dev_register().
> -	 */
> -	struct list_head debugfs_list;
> -
>  	/* Everything below here is for legacy driver, never use! */
>  	/* private: */
>  #if IS_ENABLED(CONFIG_DRM_LEGACY)
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
