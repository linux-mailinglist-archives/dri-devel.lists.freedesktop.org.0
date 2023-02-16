Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5212C699ACF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 18:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BC810E332;
	Thu, 16 Feb 2023 17:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC39510E332
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676567474; x=1708103474;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=6WUg9G735EYLDsx9aocm3Om30YtyllZ6Gi8XdFFckHY=;
 b=M7gd8eWgZwB3vJcheV5Tk+zChe5KWUy9JMyBqjuIMuFUoOrn9tWrngy5
 U4jWRSrKL5XbtV/GzBQV2aXqYuRHZ1x0r3TiY/shR5lLvvTr1Wrvxb4Ju
 wIbrSIHW8jHNOpPQ9gHSQjpeBHzIVfDiqRXjwe3cYRTMpgGsgS11carM/
 +chpa2KIE+VR/f1cD5+Gg0hdq8ZwVrP23zctsY0lDGkb7aR4QcNpCuVoE
 epk4EYzYv4+6/QJwc2agB1HcIhFBtR87PsJeW5tlHiptWJopONt+qQa4/
 jXofC+43MdOiPJ/lyGUqMfzdjM2R1ZGhvAxJxQMly01JwIDp6uY5eBUUh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="315478689"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="315478689"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 09:06:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="647765447"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="647765447"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.155])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 09:06:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
In-Reply-To: <20230216163757.GK2849548@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <20230216163757.GK2849548@linux.intel.com>
Date: Thu, 16 Feb 2023 19:06:46 +0200
Message-ID: <87lekxzgih.fsf@intel.com>
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
Cc: Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, maxime@cerno.tech, daniel.vetter@ffwll.ch,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> =
wrote:
> On Thu, Feb 16, 2023 at 12:33:08PM +0100, Daniel Vetter wrote:
>> On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian K=C3=B6nig wrote:
>> > The mutex was completely pointless in the first place since any
>> > parallel adding of files to this list would result in random
>> > behavior since the list is filled and consumed multiple times.
>> >=20
>> > Completely drop that approach and just create the files directly.
>> >=20
>> > This also re-adds the debugfs files to the render node directory and
>> > removes drm_debugfs_late_register().
>> >=20
>> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>> > ---
>> >  drivers/gpu/drm/drm_debugfs.c     | 32 +++++++------------------------
>> >  drivers/gpu/drm/drm_drv.c         |  3 ---
>> >  drivers/gpu/drm/drm_internal.h    |  5 -----
>> >  drivers/gpu/drm/drm_mode_config.c |  2 --
>> >  include/drm/drm_device.h          | 15 ---------------
>> >  5 files changed, 7 insertions(+), 50 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debug=
fs.c
>> > index 558e3a7271a5..a40288e67264 100644
>> > --- a/drivers/gpu/drm/drm_debugfs.c
>> > +++ b/drivers/gpu/drm/drm_debugfs.c
>> > @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device *=
dev)
>> >  void drm_debugfs_minor_register(struct drm_minor *minor)
>> >  {
>> >  	struct drm_device *dev =3D minor->dev;
>> > -	struct drm_debugfs_entry *entry, *tmp;
>> >=20=20
>> >  	if (dev->driver->debugfs_init)
>> >  		dev->driver->debugfs_init(minor);
>> > -
>> > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>> > -		debugfs_create_file(entry->file.name, 0444,
>> > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>> > -		list_del(&entry->list);
>> > -	}
>> > -}
>> > -
>> > -void drm_debugfs_late_register(struct drm_device *dev)
>> > -{
>> > -	struct drm_minor *minor =3D dev->primary;
>> > -	struct drm_debugfs_entry *entry, *tmp;
>> > -
>> > -	if (!minor)
>> > -		return;
>> > -
>> > -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>> > -		debugfs_create_file(entry->file.name, 0444,
>> > -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>> > -		list_del(&entry->list);
>> > -	}
>> >  }
>> >=20=20
>> >  int drm_debugfs_remove_files(const struct drm_info_list *files, int c=
ount,
>> > @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev,=
 const char *name,
>> >  	entry->file.data =3D data;
>> >  	entry->dev =3D dev;
>> >=20=20
>> > -	mutex_lock(&dev->debugfs_mutex);
>> > -	list_add(&entry->list, &dev->debugfs_list);
>> > -	mutex_unlock(&dev->debugfs_mutex);
>> > +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
>> > +			    &drm_debugfs_entry_fops);
>> > +
>> > +	/* TODO: This should probably only be a symlink */
>> > +	if (dev->render)
>> > +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
>> > +				    entry, &drm_debugfs_entry_fops);
>>=20
>> Nope. You are fundamentally missing the point of all this, which is:
>>=20
>> - drivers create debugfs files whenever they want to, as long as it's
>>   _before_ drm_dev_register is called.
>>=20
>> - drm_dev_register will set them all up.
>>=20
>> This is necessary because otherwise you have the potential for some nice
>> oops and stuff when userspace tries to access these files before the
>> driver is ready.
>
> But should not this the driver responsibility, call drm_debugfs_add_file()
> whenever you are ready to handle operations on added file ?

In theory, yes, but in practice it's pretty hard for a non-trivial
driver to maintain that all the conditions are met.

In i915 we call debugfs register all over the place only after we've
called drm_dev_register(), because it's the only sane way. But it means
we need the init and register separated everywhere, instead of init
adding files to a list to be registered later.

BR,
Jani.



>
> Regards
> Stanislaw
>
>> Note that with sysfs all this infrastructure already exists, which is why
>> you can create sysfs files whenever you feel like, and things wont go
>> boom.
>>=20
>> So yeah we need the list.
>>=20
>> This also means that we really should not create the debugfs directories
>> _before_ drm_dev_register is called. That's just fundamentally not how
>> device interface setup should work:
>>=20
>> 1. you allocate stucts and stuff
>> 2. you fully init everything
>> 3. you register interfaces so they become userspace visible
>> -Daniel
>>=20
>> >  }
>> >  EXPORT_SYMBOL(drm_debugfs_add_file);
>> >=20=20
>> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> > index 2cbe028e548c..e7b88b65866c 100644
>> > --- a/drivers/gpu/drm/drm_drv.c
>> > +++ b/drivers/gpu/drm/drm_drv.c
>> > @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device=
 *dev, void *res)
>> >  	mutex_destroy(&dev->clientlist_mutex);
>> >  	mutex_destroy(&dev->filelist_mutex);
>> >  	mutex_destroy(&dev->struct_mutex);
>> > -	mutex_destroy(&dev->debugfs_mutex);
>> >  	drm_legacy_destroy_members(dev);
>> >  }
>> >=20=20
>> > @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
>> >  	INIT_LIST_HEAD(&dev->filelist_internal);
>> >  	INIT_LIST_HEAD(&dev->clientlist);
>> >  	INIT_LIST_HEAD(&dev->vblank_event_list);
>> > -	INIT_LIST_HEAD(&dev->debugfs_list);
>> >=20=20
>> >  	spin_lock_init(&dev->event_lock);
>> >  	mutex_init(&dev->struct_mutex);
>> >  	mutex_init(&dev->filelist_mutex);
>> >  	mutex_init(&dev->clientlist_mutex);
>> >  	mutex_init(&dev->master_mutex);
>> > -	mutex_init(&dev->debugfs_mutex);
>> >=20=20
>> >  	ret =3D drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>> >  	if (ret)
>> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_inte=
rnal.h
>> > index 5ff7bf88f162..e215d00ba65c 100644
>> > --- a/drivers/gpu/drm/drm_internal.h
>> > +++ b/drivers/gpu/drm/drm_internal.h
>> > @@ -188,7 +188,6 @@ int drm_debugfs_init(struct drm_minor *minor, int =
minor_id,
>> >  void drm_debugfs_dev_register(struct drm_device *dev);
>> >  void drm_debugfs_minor_register(struct drm_minor *minor);
>> >  void drm_debugfs_cleanup(struct drm_minor *minor);
>> > -void drm_debugfs_late_register(struct drm_device *dev);
>> >  void drm_debugfs_connector_add(struct drm_connector *connector);
>> >  void drm_debugfs_connector_remove(struct drm_connector *connector);
>> >  void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>> > @@ -205,10 +204,6 @@ static inline void drm_debugfs_cleanup(struct drm=
_minor *minor)
>> >  {
>> >  }
>> >=20=20
>> > -static inline void drm_debugfs_late_register(struct drm_device *dev)
>> > -{
>> > -}
>> > -
>> >  static inline void drm_debugfs_connector_add(struct drm_connector *co=
nnector)
>> >  {
>> >  }
>> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_m=
ode_config.c
>> > index 87eb591fe9b5..8525ef851540 100644
>> > --- a/drivers/gpu/drm/drm_mode_config.c
>> > +++ b/drivers/gpu/drm/drm_mode_config.c
>> > @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
>> >  	if (ret)
>> >  		goto err_connector;
>> >=20=20
>> > -	drm_debugfs_late_register(dev);
>> > -
>> >  	return 0;
>> >=20=20
>> >  err_connector:
>> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> > index 7cf4afae2e79..900ad7478dd8 100644
>> > --- a/include/drm/drm_device.h
>> > +++ b/include/drm/drm_device.h
>> > @@ -311,21 +311,6 @@ struct drm_device {
>> >  	 */
>> >  	struct drm_fb_helper *fb_helper;
>> >=20=20
>> > -	/**
>> > -	 * @debugfs_mutex:
>> > -	 *
>> > -	 * Protects &debugfs_list access.
>> > -	 */
>> > -	struct mutex debugfs_mutex;
>> > -
>> > -	/**
>> > -	 * @debugfs_list:
>> > -	 *
>> > -	 * List of debugfs files to be created by the DRM device. The files
>> > -	 * must be added during drm_dev_register().
>> > -	 */
>> > -	struct list_head debugfs_list;
>> > -
>> >  	/* Everything below here is for legacy driver, never use! */
>> >  	/* private: */
>> >  #if IS_ENABLED(CONFIG_DRM_LEGACY)
>> > --=20
>> > 2.34.1
>> >=20
>>=20
>> --=20
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

--=20
Jani Nikula, Intel Open Source Graphics Center
