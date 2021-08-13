Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D633EB97D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9884F6E873;
	Fri, 13 Aug 2021 15:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547276E872
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 15:49:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so727907wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ztLJ/Z+w/7lJ5b/Gbdd/xzcgAKq8QbJW4xzGVnxKtmU=;
 b=VLZcmBZFpeecdhW43NS93mX0TUmD4RRZFXTte21P4ljJ+Z7SqAEHsmih2/viWCa1GP
 XVqRC/eooDWii6hMe82zSBMDH6wlIfLabTRJlHlFKI61nAn+zF70v7+G5m/naoRvhdK+
 5gFnIMW2IYCWa7XmwgHY22kW4jd9UYnpwT7M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ztLJ/Z+w/7lJ5b/Gbdd/xzcgAKq8QbJW4xzGVnxKtmU=;
 b=foa8JgwPx7u0hF/nCIPRgqwGoQXR2udMbOEUPKJBYAy2SacbcOxjToM3Shg5nBvQUI
 E142SvKZfxChArmFmRSUQ1EYEUOjerIBReI73Vr/uVTc4YVQ0Niols4HwVtb6oaIYhZs
 cqXQXWkpdTN6xbrNdV4fvGmcZNM2dIA5bz2z50/I9uB7WKpVQhjyxSGldWW5Zihe1R6q
 V9NIsLG0aGem59cZfSX/stpVbpGoOEFCfszjXu2L/YuBAzx1V82noZBVoMTom+/oZ4nD
 2wzcpNm1xP+15Guvg+1D1cPzN1NRiDXaUMnCtMP2IKWyNDs5rkkJiooarGqfKdX/BXzk
 F8tQ==
X-Gm-Message-State: AOAM533ghfGC02V+mRe1fZRYEc5h+/tVVefRYgveW7Td+EcLZsMWIM/+
 SFLUswwQHE215nYo7WttEg5fyw==
X-Google-Smtp-Source: ABdhPJxgv00YCCMnsEDstzGiimNG6Hq0UjsyzTqm4ij09dB+S3kQni5KbAi2iQDrwWKxyWK0S6/YUA==
X-Received: by 2002:a1c:27c2:: with SMTP id n185mr3213014wmn.20.1628869757778; 
 Fri, 13 Aug 2021 08:49:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l38sm1699851wmp.15.2021.08.13.08.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:49:16 -0700 (PDT)
Date: Fri, 13 Aug 2021 17:49:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: avoid races with modesetting rights
Message-ID: <YRaUetPzT5EKaZkf@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210813085450.32494-1-desmondcheongzx@gmail.com>
 <20210813085450.32494-2-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813085450.32494-2-desmondcheongzx@gmail.com>
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

On Fri, Aug 13, 2021 at 04:54:49PM +0800, Desmond Cheong Zhi Xi wrote:
> In drm_client_modeset.c and drm_fb_helper.c,
> drm_master_internal_{acquire,release} are used to avoid races with DRM
> userspace. These functions hold onto drm_device.master_mutex while
> committing, and bail if there's already a master.
> 
> However, ioctls can still race between themselves. A
> time-of-check-to-time-of-use error can occur if an ioctl that changes
> the modeset has its rights revoked after it validates its permissions,
> but before it completes.
> 
> There are three ioctls that can affect modesetting permissions:
> 
> - DROP_MASTER ioctl removes rights for a master and its leases
> 
> - REVOKE_LEASE ioctl revokes rights for a specific lease
> 
> - SET_MASTER ioctl sets the device master if the master role hasn't
> been acquired yet
> 
> All these races can be avoided by introducing an SRCU that acts as a
> barrier for ioctls that can change modesetting permissions. Processes
> that perform modesetting should hold a read lock on the new
> drm_device.master_barrier_srcu, and ioctls that change these
> permissions should call synchronize_srcu before returning.
> 
> This ensures that any process that might have seen old permissions are
> flushed out before DROP_MASTER/REVOKE_LEASE/SET_MASTER ioctls return
> to userspace.
> 
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

This looks pretty solid, but I think there's one gap where we can still
race. Scenario.

Process A has a drm fd with master rights and two threads:
- thread 1 does a long-running display operation (like a modeset or
  whatever)
- thread 2 does a drop-master

Then we start a new process B, which acquires master in drm_open (there is
no other one left). This is like setmaster ioctl, but your
DRM_MASTER_FLUSH bit doesn't work there.

The other thing is that for modeset stuff (which this all is) srcu is
probably massive overkill, and a simple rwsem should be good enough too.
Maybe even better, since the rwsem guarantees that no new reader can start
once you try to acquire the write side.

Finally, and this is a bit a bikeshed: I don't like much how
DRM_MASTER_FLUSH leaks the need of these very few places into the very
core drm_ioctl function. One idea I had was to use task_work in a special
function, roughly

void master_flush()
{
	down_write(master_rwsem);
	up_write(master_rwms);
}
void drm_master_flush()
{
	init_task_work(fpriv->master_flush_work, master_flush)
	task_work_add(fpriv->master_flush_work);
	/* if task_work_add fails we're exiting, at which point the lack
	 * of master flush doesn't matter);
}

And maybe put a comment above the function explaining why and how this
works.

We could even do a drm_master_unlock_and_flush helper, since that's really
what everyone wants, and it would make it very clear which master state
changes need this flush. Instead of setting a flag bit in an ioctl table
very far away ...

Thoughts?
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c           | 17 ++++++++++++++---
>  drivers/gpu/drm/drm_client_modeset.c | 10 ++++++----
>  drivers/gpu/drm/drm_drv.c            |  2 ++
>  drivers/gpu/drm/drm_fb_helper.c      | 20 ++++++++++++--------
>  drivers/gpu/drm/drm_internal.h       |  5 +++--
>  drivers/gpu/drm/drm_ioctl.c          | 25 +++++++++++++++++++++----
>  include/drm/drm_device.h             | 11 +++++++++++
>  include/drm/drm_ioctl.h              |  7 +++++++
>  8 files changed, 76 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 60a6b21474b1..004506608e76 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -29,6 +29,7 @@
>   */
>  
>  #include <linux/slab.h>
> +#include <linux/srcu.h>
>  
>  #include <drm/drm_auth.h>
>  #include <drm/drm_drv.h>
> @@ -448,21 +449,31 @@ void drm_master_put(struct drm_master **master)
>  EXPORT_SYMBOL(drm_master_put);
>  
>  /* Used by drm_client and drm_fb_helper */
> -bool drm_master_internal_acquire(struct drm_device *dev)
> +bool drm_master_internal_acquire(struct drm_device *dev, int *idx)
>  {
> +	*idx = srcu_read_lock(&dev->master_barrier_srcu);
> +
>  	mutex_lock(&dev->master_mutex);
>  	if (dev->master) {
>  		mutex_unlock(&dev->master_mutex);
> +		srcu_read_unlock(&dev->master_barrier_srcu, *idx);
>  		return false;
>  	}
> +	mutex_unlock(&dev->master_mutex);
>  
>  	return true;
>  }
>  EXPORT_SYMBOL(drm_master_internal_acquire);
>  
>  /* Used by drm_client and drm_fb_helper */
> -void drm_master_internal_release(struct drm_device *dev)
> +void drm_master_internal_release(struct drm_device *dev, int idx)
>  {
> -	mutex_unlock(&dev->master_mutex);
> +	srcu_read_unlock(&dev->master_barrier_srcu, idx);
>  }
>  EXPORT_SYMBOL(drm_master_internal_release);
> +
> +/* Used by drm_ioctl */
> +void drm_master_flush(struct drm_device *dev)
> +{
> +	synchronize_srcu(&dev->master_barrier_srcu);
> +}
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index ced09c7c06f9..9885f36f71b7 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -1165,13 +1165,14 @@ int drm_client_modeset_commit(struct drm_client_dev *client)
>  {
>  	struct drm_device *dev = client->dev;
>  	int ret;
> +	int idx;
>  
> -	if (!drm_master_internal_acquire(dev))
> +	if (!drm_master_internal_acquire(dev, &idx))
>  		return -EBUSY;
>  
>  	ret = drm_client_modeset_commit_locked(client);
>  
> -	drm_master_internal_release(dev);
> +	drm_master_internal_release(dev, idx);
>  
>  	return ret;
>  }
> @@ -1215,8 +1216,9 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>  {
>  	struct drm_device *dev = client->dev;
>  	int ret = 0;
> +	int idx;
>  
> -	if (!drm_master_internal_acquire(dev))
> +	if (!drm_master_internal_acquire(dev, &idx))
>  		return -EBUSY;
>  
>  	mutex_lock(&client->modeset_mutex);
> @@ -1226,7 +1228,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>  		drm_client_modeset_dpms_legacy(client, mode);
>  	mutex_unlock(&client->modeset_mutex);
>  
> -	drm_master_internal_release(dev);
> +	drm_master_internal_release(dev, idx);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7a5097467ba5..c313f0674db3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -574,6 +574,7 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  	mutex_destroy(&dev->clientlist_mutex);
>  	mutex_destroy(&dev->filelist_mutex);
>  	mutex_destroy(&dev->struct_mutex);
> +	cleanup_srcu_struct(&dev->master_barrier_srcu);
>  	drm_legacy_destroy_members(dev);
>  }
>  
> @@ -612,6 +613,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> +	init_srcu_struct(&dev->master_barrier_srcu);
>  
>  	ret = drmm_add_action(dev, drm_dev_init_release, NULL);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 3ab078321045..0d594bc15f18 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1116,13 +1116,14 @@ int drm_fb_helper_setcmap(struct fb_cmap *cmap, struct fb_info *info)
>  	struct drm_fb_helper *fb_helper = info->par;
>  	struct drm_device *dev = fb_helper->dev;
>  	int ret;
> +	int idx;
>  
>  	if (oops_in_progress)
>  		return -EBUSY;
>  
>  	mutex_lock(&fb_helper->lock);
>  
> -	if (!drm_master_internal_acquire(dev)) {
> +	if (!drm_master_internal_acquire(dev, &idx)) {
>  		ret = -EBUSY;
>  		goto unlock;
>  	}
> @@ -1136,7 +1137,7 @@ int drm_fb_helper_setcmap(struct fb_cmap *cmap, struct fb_info *info)
>  		ret = setcmap_legacy(cmap, info);
>  	mutex_unlock(&fb_helper->client.modeset_mutex);
>  
> -	drm_master_internal_release(dev);
> +	drm_master_internal_release(dev, idx);
>  unlock:
>  	mutex_unlock(&fb_helper->lock);
>  
> @@ -1160,9 +1161,10 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
>  	struct drm_device *dev = fb_helper->dev;
>  	struct drm_crtc *crtc;
>  	int ret = 0;
> +	int idx;
>  
>  	mutex_lock(&fb_helper->lock);
> -	if (!drm_master_internal_acquire(dev)) {
> +	if (!drm_master_internal_acquire(dev, &idx)) {
>  		ret = -EBUSY;
>  		goto unlock;
>  	}
> @@ -1204,7 +1206,7 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
>  		ret = -ENOTTY;
>  	}
>  
> -	drm_master_internal_release(dev);
> +	drm_master_internal_release(dev, idx);
>  unlock:
>  	mutex_unlock(&fb_helper->lock);
>  	return ret;
> @@ -1474,12 +1476,13 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
>  	struct drm_fb_helper *fb_helper = info->par;
>  	struct drm_device *dev = fb_helper->dev;
>  	int ret;
> +	int idx;
>  
>  	if (oops_in_progress)
>  		return -EBUSY;
>  
>  	mutex_lock(&fb_helper->lock);
> -	if (!drm_master_internal_acquire(dev)) {
> +	if (!drm_master_internal_acquire(dev, &idx)) {
>  		ret = -EBUSY;
>  		goto unlock;
>  	}
> @@ -1489,7 +1492,7 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
>  	else
>  		ret = pan_display_legacy(var, info);
>  
> -	drm_master_internal_release(dev);
> +	drm_master_internal_release(dev, idx);
>  unlock:
>  	mutex_unlock(&fb_helper->lock);
>  
> @@ -1948,6 +1951,7 @@ EXPORT_SYMBOL(drm_fb_helper_initial_config);
>  int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>  {
>  	int err = 0;
> +	int idx;
>  
>  	if (!drm_fbdev_emulation || !fb_helper)
>  		return 0;
> @@ -1959,13 +1963,13 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
>  		return err;
>  	}
>  
> -	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev)) {
> +	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper->dev, &idx)) {
>  		fb_helper->delayed_hotplug = true;
>  		mutex_unlock(&fb_helper->lock);
>  		return err;
>  	}
>  
> -	drm_master_internal_release(fb_helper->dev);
> +	drm_master_internal_release(fb_helper->dev, idx);
>  
>  	drm_dbg_kms(fb_helper->dev, "\n");
>  
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 17f3548c8ed2..578fd2769913 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -142,8 +142,9 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  			 struct drm_file *file_priv);
>  int drm_master_open(struct drm_file *file_priv);
>  void drm_master_release(struct drm_file *file_priv);
> -bool drm_master_internal_acquire(struct drm_device *dev);
> -void drm_master_internal_release(struct drm_device *dev);
> +bool drm_master_internal_acquire(struct drm_device *dev, int *idx);
> +void drm_master_internal_release(struct drm_device *dev, int idx);
> +void drm_master_flush(struct drm_device *dev);
>  
>  /* drm_sysfs.c */
>  extern struct class *drm_class;
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index be4a52dc4d6f..eb4ec3fab7d1 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -600,8 +600,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_legacy_setsareactx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_legacy_getsareactx, DRM_AUTH),
>  
> -	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, 0),
> -	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, 0),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl,
> +		      DRM_MASTER_FLUSH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl,
> +		      DRM_MASTER_FLUSH),
>  
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_legacy_addctx, DRM_AUTH|DRM_ROOT_ONLY),
>  	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_legacy_rmctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> @@ -722,7 +724,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
> -	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl,
> +		      DRM_MASTER | DRM_MASTER_FLUSH),
>  };
>  
>  #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
> @@ -781,13 +784,17 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>  	struct drm_file *file_priv = file->private_data;
>  	struct drm_device *dev = file_priv->minor->dev;
>  	int retcode;
> +	int idx;
>  
>  	if (drm_dev_is_unplugged(dev))
>  		return -ENODEV;
>  
> +	if (unlikely(flags & DRM_MASTER))
> +		idx = srcu_read_lock(&dev->master_barrier_srcu);
> +
>  	retcode = drm_ioctl_permit(flags, file_priv);
>  	if (unlikely(retcode))
> -		return retcode;
> +		goto release_master;
>  
>  	/* Enforce sane locking for modern driver ioctls. */
>  	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
> @@ -798,6 +805,16 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>  		retcode = func(dev, kdata, file_priv);
>  		mutex_unlock(&drm_global_mutex);
>  	}
> +
> +release_master:
> +	if (unlikely(flags & DRM_MASTER))
> +		srcu_read_unlock(&dev->master_barrier_srcu, idx);
> +	/* After flushing, processes are guaranteed to see the new master/lease
> +	 * permissions, and any process which might have seen the old
> +	 * permissions is guaranteed to have finished.
> +	 */
> +	if (unlikely(flags & DRM_MASTER_FLUSH))
> +		drm_master_flush(dev);
>  	return retcode;
>  }
>  EXPORT_SYMBOL(drm_ioctl_kernel);
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 604b1d1b2d72..0ac5fdb375f8 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -111,6 +111,17 @@ struct drm_device {
>  	 */
>  	struct drm_master *master;
>  
> +	/**
> +	 * @master_barrier_srcu:
> +	 *
> +	 * Used to synchronize modesetting rights between multiple users. Users
> +	 * that can change the modeset or display state must hold an
> +	 * srcu_read_lock() on @master_barrier_srcu, and ioctls that can change
> +	 * modesetting rights should call synchronize_srcu() before returning
> +	 * to userspace.
> +	 */
> +	struct srcu_struct master_barrier_srcu;
> +
>  	/**
>  	 * @driver_features: per-device driver features
>  	 *
> diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
> index afb27cb6a7bd..13a68cdcea36 100644
> --- a/include/drm/drm_ioctl.h
> +++ b/include/drm/drm_ioctl.h
> @@ -130,6 +130,13 @@ enum drm_ioctl_flags {
>  	 * not set DRM_AUTH because they do not require authentication.
>  	 */
>  	DRM_RENDER_ALLOW	= BIT(5),
> +	/**
> +	 * @DRM_MASTER_FLUSH:
> +	 *
> +	 * This must be set for any ioctl which can change the modesetting
> +	 * permissions for DRM users.
> +	 */
> +	DRM_MASTER_FLUSH	= BIT(6),
>  };
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
