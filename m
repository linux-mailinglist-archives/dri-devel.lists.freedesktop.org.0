Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D7C14A0B2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 10:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07DA6EA98;
	Mon, 27 Jan 2020 09:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A60F6E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 09:27:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p9so6012048wmc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 01:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KCvaWt6A09uUnPUQY2eagh89VwK5vSNfLo8WDux5qqc=;
 b=WwdF6iGb12VWL9H2rv3WhvoAybPOkH6xbAZ8MK3OfQpogUNFZX5SeCF/TrMyBt2/Ec
 TxVL5itiLi8TiCpSWLhOKhhHU4U2OcQpCXzPCzbRwUl3VJCIkzvcYpmGputgePCnU/G+
 Amc4Qeuo1lMd/V36WBDcXNU6tLF6+pgm0prr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KCvaWt6A09uUnPUQY2eagh89VwK5vSNfLo8WDux5qqc=;
 b=KFcQEkNKbehsCES90SWxjlknuMxQ/sJ/jXx3CIa6lkPE0fo+loqljWk/XgGZqP2IN1
 q44Fb0JVE4+7A2l8Jy0W+qtmPwJOpc6kEx5aabnUBMyFIZsczzvRzrOk16cd+4qff58q
 LdpllDajOsG44uYslxvPSxt4O+zBFk07lCakGF3YCgICu9B2Gi3r2Z1G/sTwz8F9UoJy
 Z1WWuHNDBpTlcLobRUwz7HqQZR1M9mXbp9S6gAN/3hWBGzbdY/2feshapEsH/oR63sTZ
 wAznzOyZyCzPLcnEsU50uxOHHLpNbbO5WNgCjhc9XsRHcH8xj59WPVhHXdADgRoD6b4j
 j5VA==
X-Gm-Message-State: APjAAAVxFobwkW2ntTn0QkS9uaPjT/ZldwTmnJFrxp9DC4q1e7uyDWeo
 F7Z5BfH+5f3jaccluVVq+7uRS/S+kytlgw==
X-Google-Smtp-Source: APXvYqzmE5plAzUSHViv+K14DCCqJsLeuyQs10UkiYHt0/ttnXu7nc7lblaIuJnASVl4w1w/eJKVXw==
X-Received: by 2002:a1c:e246:: with SMTP id z67mr13302674wmg.52.1580117255117; 
 Mon, 27 Jan 2020 01:27:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p26sm16895622wmc.24.2020.01.27.01.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 01:27:34 -0800 (PST)
Date: Mon, 27 Jan 2020 10:27:32 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 1/2] drm: Release filp before global lock
Message-ID: <20200127092732.GY43062@phenom.ffwll.local>
References: <20200124125627.125042-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124125627.125042-1-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 24, 2020 at 12:56:26PM +0000, Chris Wilson wrote:
> The file is not part of the global drm resource and can be released
> prior to take the global mutex to drop the open_count (and potentially
> close) the drm device. As the global mutex is indeed global, not only
> within the device but across devices, a slow file release mechanism can
> bottleneck the entire system.
> =

> However, inside drm_close_helper() there are a number of dev->driver
> callbacks that take the drm_device as the first parameter... Worryingly
> some of those callbacks may be (implicitly) depending on the global
> mutex.
> =

> v2: Drop the debug message for the open-count, it's included with the
> drm_file_free() debug message -- and for good measure make that up as
> reading outside of the mutex.
> =

> v3: Separate the calling of the filp cleanup outside of
> drm_global_mutex into a new drm_release_noglobal() hook, so that we can
> phase the transition. drm/savage relies on the global mutex, and there
> may be more, so be cautious.
> =

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Thomas Hellstr=F6m (VMware) <thomas_os@shipmail.org>
> Acked-by: Thomas Hellstr=F6m (VMware) <thomas_os@shipmail.org>
> ---
>  drivers/gpu/drm/drm_file.c      | 36 ++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_drv.c |  2 +-
>  include/drm/drm_file.h          |  1 +
>  3 files changed, 37 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 92d16724f949..e25306c49cc6 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -220,7 +220,7 @@ void drm_file_free(struct drm_file *file)
>  	DRM_DEBUG("pid =3D %d, device =3D 0x%lx, open_count =3D %d\n",
>  		  task_pid_nr(current),
>  		  (long)old_encode_dev(file->minor->kdev->devt),
> -		  dev->open_count);
> +		  READ_ONCE(dev->open_count));
>  =

>  	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
>  	    dev->driver->preclose)
> @@ -455,6 +455,40 @@ int drm_release(struct inode *inode, struct file *fi=
lp)
>  }
>  EXPORT_SYMBOL(drm_release);
>  =

> +/**
> + * drm_release_noglobal - release method for DRM file
> + * @inode: device inode
> + * @filp: file pointer.
> + *
> + * This function may be used by drivers as their &file_operations.release
> + * method. It frees any resources associated with the open file prior to=
 taking
> + * the drm_global_mutex, which then calls the &drm_driver.postclose driv=
er
> + * callback. If this is the last open file for the DRM device also proce=
eds to
> + * call the &drm_driver.lastclose driver callback.
> + *
> + * RETURNS:
> + *
> + * Always succeeds and returns 0.
> + */
> +int drm_release_noglobal(struct inode *inode, struct file *filp)
> +{
> +	struct drm_file *file_priv =3D filp->private_data;
> +	struct drm_minor *minor =3D file_priv->minor;
> +	struct drm_device *dev =3D minor->dev;
> +
> +	drm_close_helper(filp);
> +
> +	mutex_lock(&drm_global_mutex);
> +	if (!--dev->open_count)
> +		drm_lastclose(dev);
> +	mutex_unlock(&drm_global_mutex);

btw my rough idea for lastclose is that we're just going to make it racy,
and then use the master lock and drm_client infrastructure to handle
fights between fbcon and a restarted compositor. That's already how that's
handled everywhere else. We might need to cut over drivers to the generic
fbcon stuff (or at least steal parts of the drm_client stuff I think), but
not sure.
-Daniel

> +
> +	drm_minor_release(minor);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_release_noglobal);
> +
>  /**
>   * drm_read - read method for DRM file
>   * @filp: file pointer
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_=
drv.c
> index e9b42e962032..5a5846d892f4 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -2673,7 +2673,7 @@ const struct dev_pm_ops i915_pm_ops =3D {
>  static const struct file_operations i915_driver_fops =3D {
>  	.owner =3D THIS_MODULE,
>  	.open =3D drm_open,
> -	.release =3D drm_release,
> +	.release =3D drm_release_noglobal,
>  	.unlocked_ioctl =3D drm_ioctl,
>  	.mmap =3D i915_gem_mmap,
>  	.poll =3D drm_poll,
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 8b099b347817..19df8028a6c4 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -374,6 +374,7 @@ int drm_open(struct inode *inode, struct file *filp);
>  ssize_t drm_read(struct file *filp, char __user *buffer,
>  		 size_t count, loff_t *offset);
>  int drm_release(struct inode *inode, struct file *filp);
> +int drm_release_noglobal(struct inode *inode, struct file *filp);
>  __poll_t drm_poll(struct file *filp, struct poll_table_struct *wait);
>  int drm_event_reserve_init_locked(struct drm_device *dev,
>  				  struct drm_file *file_priv,
> -- =

> 2.25.0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
