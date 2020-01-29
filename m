Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C81114CF3B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 18:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4DB6F5F3;
	Wed, 29 Jan 2020 17:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6346E408
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 17:07:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m16so160447wrx.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 09:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kZXLxhP26JqQjMxcWBpM4BT3E/16GxQl/5I2CsQ6SDE=;
 b=LO7FarI8ddOQD0UYjVsqMANDCmMEPMLUTWknyPq8IjapZrIZY/ic6lX9HPRacxkyMb
 OVJgOn56QITKmERHJ7Vt/qz9sftGW76swhq5wAx5SrjkH0WPwNRIufJVJneyi54NGYTN
 vmMg/RxpaFjilURSE1aKMvMTW0LmKV6WqipQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kZXLxhP26JqQjMxcWBpM4BT3E/16GxQl/5I2CsQ6SDE=;
 b=lkFItMY9BzK8MbqpsUm97UGrD01ec2QYW9d4i2wlFElt9LOicmH9lSz7Tn4rvr9ZF6
 Byhv/KsV+70lFKvt7U3btcbRgW/dBgDZar1XwDnqRf5foiVt13Ctnt5bVoOwuHLUMPfj
 /5utQ1NdogDQ5oJ119IfukjgrdVEWIlkLvmcqSh0xQASAoxvKVikP+qZ1WYOHnHYbYzy
 sDGEfGrJjtEjYpQbjaMdUZ18PoRnSMPs5WYkT3nDo2NJ94/SddeQyIJJPQGDBD53cwEP
 ZEkBjcq/6Ijn89/C/bzKFikaJgp/3PsAiOikuSruI4ZOicdiixYc6K/yOWfC7MpVqky2
 Jl5w==
X-Gm-Message-State: APjAAAWSl353qvothu0AaCY/2W59jorXj4nJAn5GZHWXkYrfe86mm4G0
 dKzO58mCt7E3dbIqmWVcVmxi/w==
X-Google-Smtp-Source: APXvYqxQvIbWEQZEa5ia4EzS/ChBFGaEfNjjaqXNYwG/N2NhJ43OU+xO7DpCmzvXJLI/Lu4E8MmTQw==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr38858887wrt.229.1580317644134; 
 Wed, 29 Jan 2020 09:07:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 16sm3047625wmi.0.2020.01.29.09.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 09:07:23 -0800 (PST)
Date: Wed, 29 Jan 2020 18:07:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 5/5] drm: Nerv drm_global_mutex BKL for good drivers
Message-ID: <20200129170721.GN43062@phenom.ffwll.local>
References: <20200129082410.1691996-1-daniel.vetter@ffwll.ch>
 <20200129082410.1691996-6-daniel.vetter@ffwll.ch>
 <20200129164733.GB22331@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129164733.GB22331@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 05:47:33PM +0100, Sam Ravnborg wrote:
> Hi Daniel.
> 
> In the nit-pick department today - sorry.
> 
> Subject: [PATCH 5/5] drm: Nerv drm_global_mutex BKL for good drivers
> I did not understand this subject... - what is "Nerv"?

It's a typo, supposed to be nerf:

https://www.urbandictionary.com/define.php?term=nerf

Cheers, Daniel
> 
> 	Sam
> 
> On Wed, Jan 29, 2020 at 09:24:10AM +0100, Daniel Vetter wrote:
> > This catches the majority of drivers (unfortunately not if we take
> > users into account, because all the big drivers have at least a
> > lastclose hook).
> > 
> > With the prep patches out of the way all drm state is fully protected
> > and either prevents or can deal with the races from dropping the BKL
> > around open/close. The only thing left to audit are the various driver
> > hooks - by keeping the BKL around if any of them are set we have a
> > very simple cop-out!
> > 
> > Note that one of the biggest prep pieces to get here was making
> > dev->open_count atomic, which was done in
> > 
> > commit 7e13ad896484a0165a68197a2e64091ea28c9602
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Fri Jan 24 13:01:07 2020 +0000
> > 
> >     drm: Avoid drm_global_mutex for simple inc/dec of dev->open_count
> > 
> > Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c      |  6 +++--
> >  drivers/gpu/drm/drm_file.c     | 46 ++++++++++++++++++++++++++++++----
> >  drivers/gpu/drm/drm_internal.h |  1 +
> >  3 files changed, 46 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 05bdf0b9d2b3..9fcd6ab3c154 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -946,7 +946,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
> >  	struct drm_driver *driver = dev->driver;
> >  	int ret;
> >  
> > -	mutex_lock(&drm_global_mutex);
> > +	if (drm_dev_needs_global_mutex(dev))
> > +		mutex_lock(&drm_global_mutex);
> >  
> >  	if (dev->driver->load) {
> >  		if (!drm_core_check_feature(dev, DRIVER_LEGACY))
> > @@ -992,7 +993,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
> >  	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
> >  	drm_minor_unregister(dev, DRM_MINOR_RENDER);
> >  out_unlock:
> > -	mutex_unlock(&drm_global_mutex);
> > +	if (drm_dev_needs_global_mutex(dev))
> > +		mutex_unlock(&drm_global_mutex);
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_dev_register);
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index d36cb74ebe0c..efd6fe0b6b4f 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -51,6 +51,37 @@
> >  /* from BKL pushdown */
> >  DEFINE_MUTEX(drm_global_mutex);
> >  
> > +bool drm_dev_needs_global_mutex(struct drm_device *dev)
> > +{
> > +	/*
> > +	 * Legacy drivers rely on all kinds of BKL locking semantics, don't
> > +	 * bother. They also still need BKL locking for their ioctls, so better
> > +	 * safe than sorry.
> > +	 */
> > +	if (drm_core_check_feature(dev, DRIVER_LEGACY))
> > +		return true;
> > +
> > +	/*
> > +	 * The deprecated ->load callback must be called after the driver is
> > +	 * already registered. This means such drivers rely on the BKL to make
> > +	 * sure an open can't proceed until the driver is actually fully set up.
> > +	 * Similar hilarity holds for the unload callback.
> > +	 */
> > +	if (dev->driver->load || dev->driver->unload)
> > +		return true;
> > +
> > +	/*
> > +	 * Drivers with the lastclose callback assume that it's synchronized
> > +	 * against concurrent opens, which again needs the BKL. The proper fix
> > +	 * is to use the drm_client infrastructure with proper locking for each
> > +	 * client.
> > +	 */
> > +	if (dev->driver->lastclose)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  /**
> >   * DOC: file operations
> >   *
> > @@ -378,9 +409,10 @@ int drm_open(struct inode *inode, struct file *filp)
> >  	if (IS_ERR(minor))
> >  		return PTR_ERR(minor);
> >  
> > -	mutex_unlock(&drm_global_mutex);
> > -
> >  	dev = minor->dev;
> > +	if (drm_dev_needs_global_mutex(dev))
> > +		mutex_unlock(&drm_global_mutex);
> > +
> >  	if (!atomic_fetch_inc(&dev->open_count))
> >  		need_setup = 1;
> >  
> > @@ -398,13 +430,15 @@ int drm_open(struct inode *inode, struct file *filp)
> >  		}
> >  	}
> >  
> > -	mutex_unlock(&drm_global_mutex);
> > +	if (drm_dev_needs_global_mutex(dev))
> > +		mutex_unlock(&drm_global_mutex);
> >  
> >  	return 0;
> >  
> >  err_undo:
> >  	atomic_dec(&dev->open_count);
> > -	mutex_unlock(&drm_global_mutex);
> > +	if (drm_dev_needs_global_mutex(dev))
> > +		mutex_unlock(&drm_global_mutex);
> >  	drm_minor_release(minor);
> >  	return retcode;
> >  }
> > @@ -444,6 +478,7 @@ int drm_release(struct inode *inode, struct file *filp)
> >  	struct drm_minor *minor = file_priv->minor;
> >  	struct drm_device *dev = minor->dev;
> >  
> > +	if (drm_dev_needs_global_mutex(dev))
> >  	mutex_lock(&drm_global_mutex);
> >  
> >  	DRM_DEBUG("open_count = %d\n", atomic_read(&dev->open_count));
> > @@ -453,7 +488,8 @@ int drm_release(struct inode *inode, struct file *filp)
> >  	if (atomic_dec_and_test(&dev->open_count))
> >  		drm_lastclose(dev);
> >  
> > -	mutex_unlock(&drm_global_mutex);
> > +	if (drm_dev_needs_global_mutex(dev))
> > +		mutex_unlock(&drm_global_mutex);
> >  
> >  	drm_minor_release(minor);
> >  
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index 6937bf923f05..aeec2e68d772 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -41,6 +41,7 @@ struct drm_printer;
> >  
> >  /* drm_file.c */
> >  extern struct mutex drm_global_mutex;
> > +bool drm_dev_needs_global_mutex(struct drm_device *dev);
> >  struct drm_file *drm_file_alloc(struct drm_minor *minor);
> >  void drm_file_free(struct drm_file *file);
> >  void drm_lastclose(struct drm_device *dev);
> > -- 
> > 2.24.1
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
