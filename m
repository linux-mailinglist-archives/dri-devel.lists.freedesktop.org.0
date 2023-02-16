Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27640699D3B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 20:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1485010E361;
	Thu, 16 Feb 2023 19:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9061B10E11A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 19:56:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v30so1738104wrv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Sxx3VjdqY8H5jX15QYn9RsoI4rSM99QGp0ocvd+gon4=;
 b=h4WE0tiTuOaDkQ0XXSOfbLMAspeIqwFpyavz+oHiNrtGxFa6obWhL5nUPF4YCkkrkz
 DzsjYG5Zhbyz1u5c1YFm8nBlujVwhCWJaQPYUIPCsLOc+5WJUuqejsymUKxzoU7ph3LE
 ofXGOzTvReSTjzC0PvOp8U1MMaisQleADOnbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sxx3VjdqY8H5jX15QYn9RsoI4rSM99QGp0ocvd+gon4=;
 b=WUo+rtAU5p3oxSURW0NKJhjszpJCPV8ckjsPQGxRBuJ24CiFyIzYwO9vNNYMEBvqQt
 e+DZ1vdY1hFz1IIJe0iLAlcIhrC8zMkXaA4+se4yRZ8yq0elp3vZZ9WU4NWb0Q6NIQSe
 huV3tm0+jE7wyjZ/3AuJVGsjv5eQ7WIi8JP4iosFWTq56FcpvhFf2OQkTcREpzJ+5XO4
 ZSCzgaEwuCI9WUNTBK9tusmbN2tGDxzrP10EOukqZmnX0jwzlwb30vx3RrZiC2d9L0Vn
 h0X+4XA4v39k0DNYkEqfMlZkpHWm2eecD93sy90XpyIa78nRXNjcHldqFLdX9NGDKm6/
 Pxew==
X-Gm-Message-State: AO0yUKUl4gXnGFDN6ojV8DK6A2JwGWo7BVKCha+mmb6qw9Tlp9xMxcON
 zntJMNVxWYNt/EIqpm7RdIrh2Q==
X-Google-Smtp-Source: AK7set+w4G2qiArK73KLBZEAwBu6xf/MfU1avDXYgljF/79Pyyd9FbjLNvCf9i3gmmEZajNi90oVoQ==
X-Received: by 2002:adf:fb83:0:b0:2c5:7ba6:4efa with SMTP id
 a3-20020adffb83000000b002c57ba64efamr2818963wrr.4.1676577385923; 
 Thu, 16 Feb 2023 11:56:25 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 f18-20020adff592000000b002c592535838sm1787480wro.2.2023.02.16.11.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 11:56:25 -0800 (PST)
Date: Thu, 16 Feb 2023 20:56:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Message-ID: <Y+6KYR4J8OFeeVLh@phenom.ffwll.local>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <20230216163757.GK2849548@linux.intel.com>
 <87lekxzgih.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lekxzgih.fsf@intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: mairacanal@riseup.net,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, maxime@cerno.tech,
 daniel.vetter@ffwll.ch, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 07:06:46PM +0200, Jani Nikula wrote:
> On Thu, 16 Feb 2023, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> wrote:
> > On Thu, Feb 16, 2023 at 12:33:08PM +0100, Daniel Vetter wrote:
> >> On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian König wrote:
> >> > The mutex was completely pointless in the first place since any
> >> > parallel adding of files to this list would result in random
> >> > behavior since the list is filled and consumed multiple times.
> >> > 
> >> > Completely drop that approach and just create the files directly.
> >> > 
> >> > This also re-adds the debugfs files to the render node directory and
> >> > removes drm_debugfs_late_register().
> >> > 
> >> > Signed-off-by: Christian König <christian.koenig@amd.com>
> >> > ---
> >> >  drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
> >> >  drivers/gpu/drm/drm_drv.c         |  3 ---
> >> >  drivers/gpu/drm/drm_internal.h    |  5 -----
> >> >  drivers/gpu/drm/drm_mode_config.c |  2 --
> >> >  include/drm/drm_device.h          | 15 ---------------
> >> >  5 files changed, 7 insertions(+), 50 deletions(-)
> >> > 
> >> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> >> > index 558e3a7271a5..a40288e67264 100644
> >> > --- a/drivers/gpu/drm/drm_debugfs.c
> >> > +++ b/drivers/gpu/drm/drm_debugfs.c
> >> > @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *dev)
> >> >  void drm_debugfs_minor_register(struct drm_minor *minor)
> >> >  {
> >> >  	struct drm_device *dev = minor->dev;
> >> > -	struct drm_debugfs_entry *entry, *tmp;
> >> >  
> >> >  	if (dev->driver->debugfs_init)
> >> >  		dev->driver->debugfs_init(minor);
> >> > -
> >> > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> >> > -		debugfs_create_file(entry->file.name, 0444,
> >> > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> >> > -		list_del(&entry->list);
> >> > -	}
> >> > -}
> >> > -
> >> > -void drm_debugfs_late_register(struct drm_device *dev)
> >> > -{
> >> > -	struct drm_minor *minor = dev->primary;
> >> > -	struct drm_debugfs_entry *entry, *tmp;
> >> > -
> >> > -	if (!minor)
> >> > -		return;
> >> > -
> >> > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> >> > -		debugfs_create_file(entry->file.name, 0444,
> >> > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
> >> > -		list_del(&entry->list);
> >> > -	}
> >> >  }
> >> >  
> >> >  int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
> >> > @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
> >> >  	entry->file.data = data;
> >> >  	entry->dev = dev;
> >> >  
> >> > -	mutex_lock(&dev->debugfs_mutex);
> >> > -	list_add(&entry->list, &dev->debugfs_list);
> >> > -	mutex_unlock(&dev->debugfs_mutex);
> >> > +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
> >> > +			    &drm_debugfs_entry_fops);
> >> > +
> >> > +	/* TODO: This should probably only be a symlink */
> >> > +	if (dev->render)
> >> > +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
> >> > +				    entry, &drm_debugfs_entry_fops);
> >> 
> >> Nope. You are fundamentally missing the point of all this, which is:
> >> 
> >> - drivers create debugfs files whenever they want to, as long as it's
> >>   _before_ drm_dev_register is called.
> >> 
> >> - drm_dev_register will set them all up.
> >> 
> >> This is necessary because otherwise you have the potential for some nice
> >> oops and stuff when userspace tries to access these files before the
> >> driver is ready.
> >
> > But should not this the driver responsibility, call drm_debugfs_add_file()
> > whenever you are ready to handle operations on added file ?
> 
> In theory, yes, but in practice it's pretty hard for a non-trivial
> driver to maintain that all the conditions are met.
> 
> In i915 we call debugfs register all over the place only after we've
> called drm_dev_register(), because it's the only sane way. But it means
> we need the init and register separated everywhere, instead of init
> adding files to a list to be registered later.

Yup, it just forces a ton of boilerplate on drivers for no gain.

Like devm_* and drmm_* are also not needed in the strict sense, and they
are all optional. But you're a fool for not using them when you can.

Same thing with these debugfs helpers here, you can outright bypass them,
and then end up doing what amdgpu/i915 currently do: A massive and
somewhat fragile parallel function call hierarchy.

Which is just not very nice thing to be forced into.
-Daniel

> BR,
> Jani.
> 
> 
> 
> >
> > Regards
> > Stanislaw
> >
> >> Note that with sysfs all this infrastructure already exists, which is why
> >> you can create sysfs files whenever you feel like, and things wont go
> >> boom.
> >> 
> >> So yeah we need the list.
> >> 
> >> This also means that we really should not create the debugfs directories
> >> _before_ drm_dev_register is called. That's just fundamentally not how
> >> device interface setup should work:
> >> 
> >> 1. you allocate stucts and stuff
> >> 2. you fully init everything
> >> 3. you register interfaces so they become userspace visible
> >> -Daniel
> >> 
> >> >  }
> >> >  EXPORT_SYMBOL(drm_debugfs_add_file);
> >> >  
> >> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> >> > index 2cbe028e548c..e7b88b65866c 100644
> >> > --- a/drivers/gpu/drm/drm_drv.c
> >> > +++ b/drivers/gpu/drm/drm_drv.c
> >> > @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
> >> >  	mutex_destroy(&dev->clientlist_mutex);
> >> >  	mutex_destroy(&dev->filelist_mutex);
> >> >  	mutex_destroy(&dev->struct_mutex);
> >> > -	mutex_destroy(&dev->debugfs_mutex);
> >> >  	drm_legacy_destroy_members(dev);
> >> >  }
> >> >  
> >> > @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
> >> >  	INIT_LIST_HEAD(&dev->filelist_internal);
> >> >  	INIT_LIST_HEAD(&dev->clientlist);
> >> >  	INIT_LIST_HEAD(&dev->vblank_event_list);
> >> > -	INIT_LIST_HEAD(&dev->debugfs_list);
> >> >  
> >> >  	spin_lock_init(&dev->event_lock);
> >> >  	mutex_init(&dev->struct_mutex);
> >> >  	mutex_init(&dev->filelist_mutex);
> >> >  	mutex_init(&dev->clientlist_mutex);
> >> >  	mutex_init(&dev->master_mutex);
> >> > -	mutex_init(&dev->debugfs_mutex);
> >> >  
> >> >  	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
> >> >  	if (ret)
> >> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> >> > index 5ff7bf88f162..e215d00ba65c 100644
> >> > --- a/drivers/gpu/drm/drm_internal.h
> >> > +++ b/drivers/gpu/drm/drm_internal.h
> >> > @@ -188,7 +188,6 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
> >> >  void drm_debugfs_dev_register(struct drm_device *dev);
> >> >  void drm_debugfs_minor_register(struct drm_minor *minor);
> >> >  void drm_debugfs_cleanup(struct drm_minor *minor);
> >> > -void drm_debugfs_late_register(struct drm_device *dev);
> >> >  void drm_debugfs_connector_add(struct drm_connector *connector);
> >> >  void drm_debugfs_connector_remove(struct drm_connector *connector);
> >> >  void drm_debugfs_crtc_add(struct drm_crtc *crtc);
> >> > @@ -205,10 +204,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
> >> >  {
> >> >  }
> >> >  
> >> > -static inline void drm_debugfs_late_register(struct drm_device *dev)
> >> > -{
> >> > -}
> >> > -
> >> >  static inline void drm_debugfs_connector_add(struct drm_connector *connector)
> >> >  {
> >> >  }
> >> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> >> > index 87eb591fe9b5..8525ef851540 100644
> >> > --- a/drivers/gpu/drm/drm_mode_config.c
> >> > +++ b/drivers/gpu/drm/drm_mode_config.c
> >> > @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
> >> >  	if (ret)
> >> >  		goto err_connector;
> >> >  
> >> > -	drm_debugfs_late_register(dev);
> >> > -
> >> >  	return 0;
> >> >  
> >> >  err_connector:
> >> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> >> > index 7cf4afae2e79..900ad7478dd8 100644
> >> > --- a/include/drm/drm_device.h
> >> > +++ b/include/drm/drm_device.h
> >> > @@ -311,21 +311,6 @@ struct drm_device {
> >> >  	 */
> >> >  	struct drm_fb_helper *fb_helper;
> >> >  
> >> > -	/**
> >> > -	 * @debugfs_mutex:
> >> > -	 *
> >> > -	 * Protects &debugfs_list access.
> >> > -	 */
> >> > -	struct mutex debugfs_mutex;
> >> > -
> >> > -	/**
> >> > -	 * @debugfs_list:
> >> > -	 *
> >> > -	 * List of debugfs files to be created by the DRM device. The files
> >> > -	 * must be added during drm_dev_register().
> >> > -	 */
> >> > -	struct list_head debugfs_list;
> >> > -
> >> >  	/* Everything below here is for legacy driver, never use! */
> >> >  	/* private: */
> >> >  #if IS_ENABLED(CONFIG_DRM_LEGACY)
> >> > -- 
> >> > 2.34.1
> >> > 
> >> 
> >> -- 
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
