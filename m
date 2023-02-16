Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F088699ACA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 18:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F40710EE1C;
	Thu, 16 Feb 2023 17:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BF310E16A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676567411; x=1708103411;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=oInvNeZzUtyxUjROKfIoq2gE75xXziAjeTBvVzB0URM=;
 b=kO3AcFeYEzNR6WSRA88oHpyBhhLb41hpU6BKl1Fyo2MMyauBAx9FDWcZ
 HNAjGYIV4DUKnZXHn6i6cqxUdHMlLDc77wmQFOj4NobFoIHds09E/lm9d
 5WFG61KNS8Qlk4cum0j6RdZmNh/7FeBXUXGffOrm8/Nx5oPDvaVIBjofu
 UBRNDFHEFfMt81gHbSwFREhpeZlcgXd+QDgV4gZtDN3wQOFYS7ZKPkXHm
 xt6qks3gFqJflU3v3h6+WTnTQSlDz1jkBo6sVuHS9IcTXI1QxebD5FjMG
 U6WEqmr80IKZFIxcWRAcbZXVrrjd+H0Pr8iH9zcmc1h12S/3vtVD3jKWM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="330417388"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="330417388"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 09:08:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813028887"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="813028887"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.155])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 09:08:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
In-Reply-To: <694091b5-dca0-fff5-3dd5-548bfa8733fc@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <f555bda0-80b6-c0bc-566f-0ef49c96da0a@amd.com> <87sff5zhgs.fsf@intel.com>
 <694091b5-dca0-fff5-3dd5-548bfa8733fc@amd.com>
Date: Thu, 16 Feb 2023 19:08:49 +0200
Message-ID: <87ilg1zgf2.fsf@intel.com>
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
Cc: daniel.vetter@ffwll.ch, mcanal@igalia.com, dri-devel@lists.freedesktop.org,
 mwen@igalia.com, mairacanal@riseup.net, maxime@cerno.tech,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023, Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> Am 16.02.23 um 17:46 schrieb Jani Nikula:
>> On Thu, 16 Feb 2023, Christian K=C3=B6nig <christian.koenig@amd.com> wro=
te:
>>> Am 16.02.23 um 12:33 schrieb Daniel Vetter:
>>>> On Thu, Feb 09, 2023 at 09:18:38AM +0100, Christian K=C3=B6nig wrote:
>>>>> The mutex was completely pointless in the first place since any
>>>>> parallel adding of files to this list would result in random
>>>>> behavior since the list is filled and consumed multiple times.
>>>>>
>>>>> Completely drop that approach and just create the files directly.
>>>>>
>>>>> This also re-adds the debugfs files to the render node directory and
>>>>> removes drm_debugfs_late_register().
>>>>>
>>>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_debugfs.c     | 32 +++++++--------------------=
----
>>>>>    drivers/gpu/drm/drm_drv.c         |  3 ---
>>>>>    drivers/gpu/drm/drm_internal.h    |  5 -----
>>>>>    drivers/gpu/drm/drm_mode_config.c |  2 --
>>>>>    include/drm/drm_device.h          | 15 ---------------
>>>>>    5 files changed, 7 insertions(+), 50 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debu=
gfs.c
>>>>> index 558e3a7271a5..a40288e67264 100644
>>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>>> @@ -246,31 +246,9 @@ void drm_debugfs_dev_register(struct drm_device =
*dev)
>>>>>    void drm_debugfs_minor_register(struct drm_minor *minor)
>>>>>    {
>>>>>    	struct drm_device *dev =3D minor->dev;
>>>>> -	struct drm_debugfs_entry *entry, *tmp;
>>>>>=20=20=20=20
>>>>>    	if (dev->driver->debugfs_init)
>>>>>    		dev->driver->debugfs_init(minor);
>>>>> -
>>>>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>>>>> -		debugfs_create_file(entry->file.name, 0444,
>>>>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>>>>> -		list_del(&entry->list);
>>>>> -	}
>>>>> -}
>>>>> -
>>>>> -void drm_debugfs_late_register(struct drm_device *dev)
>>>>> -{
>>>>> -	struct drm_minor *minor =3D dev->primary;
>>>>> -	struct drm_debugfs_entry *entry, *tmp;
>>>>> -
>>>>> -	if (!minor)
>>>>> -		return;
>>>>> -
>>>>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>>>>> -		debugfs_create_file(entry->file.name, 0444,
>>>>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>>>>> -		list_del(&entry->list);
>>>>> -	}
>>>>>    }
>>>>>=20=20=20=20
>>>>>    int drm_debugfs_remove_files(const struct drm_info_list *files, in=
t count,
>>>>> @@ -343,9 +321,13 @@ void drm_debugfs_add_file(struct drm_device *dev=
, const char *name,
>>>>>    	entry->file.data =3D data;
>>>>>    	entry->dev =3D dev;
>>>>>=20=20=20=20
>>>>> -	mutex_lock(&dev->debugfs_mutex);
>>>>> -	list_add(&entry->list, &dev->debugfs_list);
>>>>> -	mutex_unlock(&dev->debugfs_mutex);
>>>>> +	debugfs_create_file(name, 0444, dev->primary->debugfs_root, entry,
>>>>> +			    &drm_debugfs_entry_fops);
>>>>> +
>>>>> +	/* TODO: This should probably only be a symlink */
>>>>> +	if (dev->render)
>>>>> +		debugfs_create_file(name, 0444, dev->render->debugfs_root,
>>>>> +				    entry, &drm_debugfs_entry_fops);
>>>> Nope. You are fundamentally missing the point of all this, which is:
>>>>
>>>> - drivers create debugfs files whenever they want to, as long as it's
>>>>     _before_ drm_dev_register is called.
>>>>
>>>> - drm_dev_register will set them all up.
>>>>
>>>> This is necessary because otherwise you have the potential for some ni=
ce
>>>> oops and stuff when userspace tries to access these files before the
>>>> driver is ready.
>>>>
>>>> Note that with sysfs all this infrastructure already exists, which is =
why
>>>> you can create sysfs files whenever you feel like, and things wont go
>>>> boom.
>>> Well Yeah I've considered that, I just don't think it's a good idea for
>>> debugfs.
>>>
>>> debugfs is meant to be a helper for debugging things and that especially
>>> includes the time between drm_dev_init() and drm_dev_register() because
>>> that's where we probe the hardware and try to get it working.
>>>
>>> Not having the debugfs files which allows for things like hardware
>>> register access and reading internal state during that is a really and I
>>> mean REALLY bad idea. This is essentially what we have those files for.
>> So you mean you want to have early debugfs so you can have some script
>> hammering the debugfs to get info out between init and register during
>> probe?
>
> Well not hammering. What we usually do in bringup is to set firmware=20
> timeout to infinity and the driver then sits and waits for the hw.
>
> The tool used to access registers then goes directly through the PCI bar=
=20
> at the moment, but that's essentially a bad idea for registers which you=
=20
> grab a lock for to access (like index/data).
>
>>
>> I just think registering debugfs before everything is ready is a recipe
>> for disaster. All of the debugfs needs to check all the conditions that
>> they need across all of the probe stages. It'll be difficult to get it
>> right. And you'll get cargo culted checks copy pasted all over the
>> place.
>
> Yeah, but it's debugfs. That is not supposed to work under all conditions.
>
> Just try to read amdgpu_regs on a not existing register index. This will=
=20
> just hang or reboot your box immediately on APUs.

I'm firmly in the camp that debugfs does not need to work under all
conditions, but that it must fail gracefully instead of crashing.


BR,
Jani.


>
> Regards,
> Christian.
>
>>
>>
>> BR,
>> Jani.
>>
>>
>>>> So yeah we need the list.
>>>>
>>>> This also means that we really should not create the debugfs directori=
es
>>>> _before_ drm_dev_register is called. That's just fundamentally not how
>>>> device interface setup should work:
>>>>
>>>> 1. you allocate stucts and stuff
>>>> 2. you fully init everything
>>>> 3. you register interfaces so they become userspace visible
>>> How about we create the debugfs directory early and only delay the files
>>> registered through this drm_debugfs interface until registration time?
>>>
>>> This way drivers can still decide if they want the files available
>>> immediately or only after registration.
>>>
>>> What drivers currently do is like radeon setting an accel_working flag
>>> and registering anyway even if halve the hardware doesn't work.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> -Daniel
>>>>
>>>>>    }
>>>>>    EXPORT_SYMBOL(drm_debugfs_add_file);
>>>>>=20=20=20=20
>>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>>> index 2cbe028e548c..e7b88b65866c 100644
>>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>>> @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_devic=
e *dev, void *res)
>>>>>    	mutex_destroy(&dev->clientlist_mutex);
>>>>>    	mutex_destroy(&dev->filelist_mutex);
>>>>>    	mutex_destroy(&dev->struct_mutex);
>>>>> -	mutex_destroy(&dev->debugfs_mutex);
>>>>>    	drm_legacy_destroy_members(dev);
>>>>>    }
>>>>>=20=20=20=20
>>>>> @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
>>>>>    	INIT_LIST_HEAD(&dev->filelist_internal);
>>>>>    	INIT_LIST_HEAD(&dev->clientlist);
>>>>>    	INIT_LIST_HEAD(&dev->vblank_event_list);
>>>>> -	INIT_LIST_HEAD(&dev->debugfs_list);
>>>>>=20=20=20=20
>>>>>    	spin_lock_init(&dev->event_lock);
>>>>>    	mutex_init(&dev->struct_mutex);
>>>>>    	mutex_init(&dev->filelist_mutex);
>>>>>    	mutex_init(&dev->clientlist_mutex);
>>>>>    	mutex_init(&dev->master_mutex);
>>>>> -	mutex_init(&dev->debugfs_mutex);
>>>>>=20=20=20=20
>>>>>    	ret =3D drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>>>>>    	if (ret)
>>>>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_int=
ernal.h
>>>>> index 5ff7bf88f162..e215d00ba65c 100644
>>>>> --- a/drivers/gpu/drm/drm_internal.h
>>>>> +++ b/drivers/gpu/drm/drm_internal.h
>>>>> @@ -188,7 +188,6 @@ int drm_debugfs_init(struct drm_minor *minor, int=
 minor_id,
>>>>>    void drm_debugfs_dev_register(struct drm_device *dev);
>>>>>    void drm_debugfs_minor_register(struct drm_minor *minor);
>>>>>    void drm_debugfs_cleanup(struct drm_minor *minor);
>>>>> -void drm_debugfs_late_register(struct drm_device *dev);
>>>>>    void drm_debugfs_connector_add(struct drm_connector *connector);
>>>>>    void drm_debugfs_connector_remove(struct drm_connector *connector);
>>>>>    void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>>>>> @@ -205,10 +204,6 @@ static inline void drm_debugfs_cleanup(struct dr=
m_minor *minor)
>>>>>    {
>>>>>    }
>>>>>=20=20=20=20
>>>>> -static inline void drm_debugfs_late_register(struct drm_device *dev)
>>>>> -{
>>>>> -}
>>>>> -
>>>>>    static inline void drm_debugfs_connector_add(struct drm_connector =
*connector)
>>>>>    {
>>>>>    }
>>>>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_=
mode_config.c
>>>>> index 87eb591fe9b5..8525ef851540 100644
>>>>> --- a/drivers/gpu/drm/drm_mode_config.c
>>>>> +++ b/drivers/gpu/drm/drm_mode_config.c
>>>>> @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
>>>>>    	if (ret)
>>>>>    		goto err_connector;
>>>>>=20=20=20=20
>>>>> -	drm_debugfs_late_register(dev);
>>>>> -
>>>>>    	return 0;
>>>>>=20=20=20=20
>>>>>    err_connector:
>>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>>>> index 7cf4afae2e79..900ad7478dd8 100644
>>>>> --- a/include/drm/drm_device.h
>>>>> +++ b/include/drm/drm_device.h
>>>>> @@ -311,21 +311,6 @@ struct drm_device {
>>>>>    	 */
>>>>>    	struct drm_fb_helper *fb_helper;
>>>>>=20=20=20=20
>>>>> -	/**
>>>>> -	 * @debugfs_mutex:
>>>>> -	 *
>>>>> -	 * Protects &debugfs_list access.
>>>>> -	 */
>>>>> -	struct mutex debugfs_mutex;
>>>>> -
>>>>> -	/**
>>>>> -	 * @debugfs_list:
>>>>> -	 *
>>>>> -	 * List of debugfs files to be created by the DRM device. The files
>>>>> -	 * must be added during drm_dev_register().
>>>>> -	 */
>>>>> -	struct list_head debugfs_list;
>>>>> -
>>>>>    	/* Everything below here is for legacy driver, never use! */
>>>>>    	/* private: */
>>>>>    #if IS_ENABLED(CONFIG_DRM_LEGACY)
>>>>> --=20
>>>>> 2.34.1
>>>>>
>

--=20
Jani Nikula, Intel Open Source Graphics Center
