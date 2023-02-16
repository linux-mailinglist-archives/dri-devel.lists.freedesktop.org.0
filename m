Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E0E699A6F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 17:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C993010EE10;
	Thu, 16 Feb 2023 16:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533DB10EE10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676566016; x=1708102016;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3rJahgBmrhAtRP7rmoJE0NWPy3PNPhKPHBUYZ+XDXW0=;
 b=SRpqqIZOocAUrJd3qXo4TvYqnpa9ZBpQh++e94CaVOuBpH77dxS4dse/
 0iiADqfkXIrQGhLnjiC1Te/rPVR8qY/ilIuWYKBizGJ2my28jXacTyPJ2
 5Y+NwtXs7wUh/RQJsEG8Xoj2wVZViCV61rDe64cCr/IiIAJgqafQYkyq0
 qCvlMflPgmKGe7Bqn0ToPATCJY69ayQC/1+j0QNFJwwPg1ur7atGBSM6e
 V3Gu7MKX7zdShl2NwrNZrARxMLZ8SwzPeO6Jc2609LPcIesKmPAGQWIws
 GjnW8wJ9o671JwuNjKpwYjRf+5/itfneXmicngHQx0FelNxnxcx3yOZ9D Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333958110"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="333958110"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:38:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="702617897"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="702617897"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:37:59 -0800
Date: Thu, 16 Feb 2023 17:37:57 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <20230216163757.GK2849548@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, maxime@cerno.tech, daniel.vetter@ffwll.ch,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 12:33:08PM +0100, Daniel Vetter wrote:
> On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
> > The mutex was completely pointless in the first place since any
> > parallel adding of files to this list would result in random
> > behavior since the list is filled and consumed multiple times.
> > 
> > Completely drop that approach and just create the files directly.
> > 
> > This also re-adds the debugfs files to the render node directory and
> > removes drm_debugfs_late_register().
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > ---
> >  drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
> >  drivers/gpu/drm/drm_drv.c         |  3 ---
> >  drivers/gpu/drm/drm_internal.h    |  5 -----
> >  drivers/gpu/drm/drm_mode_config.c |  2 --
> >  include/drm/drm_device.h          | 15 ---------------
> >  5 files changed, 7 insertions(+), 50 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> > index 558e3a7271a5..a40288e67264 100644
> > --- a/drivers/gpu/drm/drm_debugfs.c
> > +++ b/drivers/gpu/drm/drm_debugfs.c
> > @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
> >  void drm_debugfs_minor_register(struct drm_minor *minor)
> >  {
> >  	struct drm_device *dev = minor->dev;
> > -	struct drm_debugfs_entry *entry, *tmp;
> >  
> >  	if (dev->driver->debugfs_init)
> >  		dev->driver->debugfs_init(minor);
> > -
> > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> > -		debugfs_create_file(entry->file.name, 0444,
> > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> > -		list_del(&entry->list);
> > -	}
> > -}
> > -
> > -void drm_debugfs_late_register(struct drm_device *dev)
> > -{
> > -	struct drm_minor *minor = dev->primary;
> > -	struct drm_debugfs_entry *entry, *tmp;
> > -
> > -	if (!minor)
> > -		return;
> > -
> > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> > -		debugfs_create_file(entry->file.name, 0444,
> > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> > -		list_del(&entry->list);
> > -	}
> >  }
> >  
> >  int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
> > @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> >  	entry->file.data = data;
> >  	entry->dev = dev;
> >  
> > -	mutex_lock(&dev->debugfs_mutex);
> > -	list_add(&entry->list, &dev->debugfs_list);
> > -	mutex_unlock(&dev->debugfs_mutex);
> > +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
> > +			    &drm_debugfs_entry_fops);
> > +
> > +	/* TODO: This should probably only be a symlink */
> > +	if (dev->render)
> > +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
> > +				    entry, &drm_debugfs_entry_fops);
> 
> Nope. You are fundamentally missing the point of all this, which is:
> 
> - drivers create debugfs files whenever they want to, as long as it's
>   _before_ drm_dev_register is called.
> 
> - drm_dev_register will set them all up.
> 
> This is necessary because otherwise you have the potential for some nice
> oops and stuff when userspace tries to access these files before the
> driver is ready.

But should not this the driver responsibility, call drm_debugfs_add_file()
whenever you are ready to handle operations on added file ?

Regards
Stanislaw

> Note that with sysfs all this infrastructure already exists, which is why
> you can create sysfs files whenever you feel like, and things wont go
> boom.
> 
> So yeah we need the list.
> 
> This also means that we really should not create the debugfs directories
> _before_ drm_dev_register is called. That's just fundamentally not how
> device interface setup should work:
> 
> 1. you allocate stucts and stuff
> 2. you fully init everything
> 3. you register interfaces so they become userspace visible
> -Daniel
> 
> >  }
> >  EXPORT_SYMBOL(drm_debugfs_add_file);
> >  
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 2cbe028e548c..e7b88b65866c 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
> >  	mutex_destroy(&dev->clientlist_mutex);
> >  	mutex_destroy(&dev->filelist_mutex);
> >  	mutex_destroy(&dev->struct_mutex);
> > -	mutex_destroy(&dev->debugfs_mutex);
> >  	drm_legacy_destroy_members(dev);
> >  }
> >  
> > @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
> >  	INIT_LIST_HEAD(&dev->filelist_internal);
> >  	INIT_LIST_HEAD(&dev->clientlist);
> >  	INIT_LIST_HEAD(&dev->vblank_event_list);
> > -	INIT_LIST_HEAD(&dev->debugfs_list);
> >  
> >  	spin_lock_init(&dev->event_lock);
> >  	mutex_init(&dev->struct_mutex);
> >  	mutex_init(&dev->filelist_mutex);
> >  	mutex_init(&dev->clientlist_mutex);
> >  	mutex_init(&dev->master_mutex);
> > -	mutex_init(&dev->debugfs_mutex);
> >  
> >  	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
> >  	if (ret)
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index 5ff7bf88f162..e215d00ba65c 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -188,7 +188,6 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> >  void drm_debugfs_dev_register(struct drm_device *dev);
> >  void drm_debugfs_minor_register(struct drm_minor *minor);
> >  void drm_debugfs_cleanup(struct drm_minor *minor);
> > -void drm_debugfs_late_register(struct drm_device *dev);
> >  void drm_debugfs_connector_add(struct drm_connector *connector);
> >  void drm_debugfs_connector_remove(struct drm_connector *connector);
> >  void drm_debugfs_crtc_add(struct drm_crtc *crtc);
> > @@ -205,10 +204,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
> >  {
> >  }
> >  
> > -static inline void drm_debugfs_late_register(struct drm_device *dev)
> > -{
> > -}
> > -
> >  static inline void drm_debugfs_connector_add(struct drm_connector *connector)
> >  {
> >  }
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > index 87eb591fe9b5..8525ef851540 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
> >  	if (ret)
> >  		goto err_connector;
> >  
> > -	drm_debugfs_late_register(dev);
> > -
> >  	return 0;
> >  
> >  err_connector:
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index 7cf4afae2e79..900ad7478dd8 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -311,21 +311,6 @@ struct drm_device {
> >  	 */
> >  	struct drm_fb_helper *fb_helper;
> >  
> > -	/**
> > -	 * @debugfs_mutex:
> > -	 *
> > -	 * Protects &debugfs_list access.
> > -	 */
> > -	struct mutex debugfs_mutex;
> > -
> > -	/**
> > -	 * @debugfs_list:
> > -	 *
> > -	 * List of debugfs files to be created by the DRM device. The files
> > -	 * must be added during drm_dev_register().
> > -	 */
> > -	struct list_head debugfs_list;
> > -
> >  	/* Everything below here is for legacy driver, never use! */
> >  	/* private: */
> >  #if IS_ENABLED(CONFIG_DRM_LEGACY)
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
