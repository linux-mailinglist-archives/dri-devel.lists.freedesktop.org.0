Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A726635DD5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 13:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7F510E545;
	Wed, 23 Nov 2022 12:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E9D10E545
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 12:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669208158; x=1700744158;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=IHUv8DwDv+3IbXEH4bq6KKYm3pZDsTQwBDnO7RWp69c=;
 b=LVa6hqc/Glv/dqrC5MfehnuH3MbD16qXvbkLM/FdlcXYHOVT/yzuDScj
 d/hMke1G1a2d1EtiV7hSBJs0oYi5Bq5qjHPYGWJpo/u5vqOQJJgKFkcDP
 7obssBWpinexSR7vaqs/p1znaPUehJQE/sK6w1LuVqg6gXQsqYQdc4sRv
 2bwFg2bqQAo5Ywp2a0F1hDKcSeoUn1xCKu4P7vKIitUt3jWAJuuz474B7
 snMzrtL3bPvvbLJ9vwyozRZm85XzfTPkNEthnzUiFcc5Aoojt9baz0Pyr
 cztchlEMY6i7Yg1aZsnDUJmlbmG6Aczy3bX0LSoHpcHeF4uOdpXXgQOMv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="315211468"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="315211468"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 04:55:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="710579364"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="710579364"
Received: from jgronski-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.16.163])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 04:55:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/6] drm/debugfs: create device-centered debugfs functions
In-Reply-To: <99fe053c-6ad7-37fe-625c-cfc4634a938f@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221122190314.185015-1-mcanal@igalia.com>
 <20221122190314.185015-2-mcanal@igalia.com> <87mt8ivsk8.fsf@intel.com>
 <f95f2a71-5daf-332d-9971-55f1fca67ff6@igalia.com>
 <87h6ypx4ny.fsf@intel.com>
 <99fe053c-6ad7-37fe-625c-cfc4634a938f@igalia.com>
Date: Wed, 23 Nov 2022 14:55:50 +0200
Message-ID: <87bkoxx221.fsf@intel.com>
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
Cc: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Wambui Karuga <wambui@karuga.org>,
 Melissa Wen <mwen@igalia.com>, Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Nov 2022, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
> On 11/23/22 08:59, Jani Nikula wrote:
>> On Wed, 23 Nov 2022, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>>> Hi Jani,
>>>
>>> On 11/23/22 08:06, Jani Nikula wrote:
>>>> On Tue, 22 Nov 2022, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>>>>> Introduce the ability to track requests for the addition of DRM debug=
fs
>>>>> files at any time and have them added all at once during
>>>>> drm_dev_register().
>>>>>
>>>>> Drivers can add DRM debugfs files to a device-managed list and, during
>>>>> drm_dev_register(), all added files will be created at once.
>>>>>
>>>>> Now, the drivers can use the functions drm_debugfs_add_file() and
>>>>> drm_debugfs_add_files() to create DRM debugfs files instead of using =
the
>>>>> drm_debugfs_create_files() function.
>>>>>
>>>>> Co-developed-by: Wambui Karuga <wambui.karugax@gmail.com>
>>>>> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>>>>> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>>>>> ---
>>>>>  drivers/gpu/drm/drm_debugfs.c | 76 +++++++++++++++++++++++++++++++++=
++
>>>>>  drivers/gpu/drm/drm_drv.c     |  3 ++
>>>>>  include/drm/drm_debugfs.h     | 45 +++++++++++++++++++++
>>>>>  include/drm/drm_device.h      | 15 +++++++
>>>>>  4 files changed, 139 insertions(+)
>>>>>>> +/**
>>>>> + * drm_debugfs_add_file - Add a given file to the DRM device debugfs=
 file list
>>>>> + * @dev: drm device for the ioctl
>>>>> + * @name: debugfs file name
>>>>> + * @show: show callback
>>>>> + * @data: driver-private data, should not be device-specific
>>>>> + *
>>>>> + * Add a given file entry to the DRM device debugfs file list to be =
created on
>>>>> + * drm_debugfs_init.
>>>>> + */
>>>>> +int drm_debugfs_add_file(struct drm_device *dev, const char *name,
>>>>> +			 int (*show)(struct seq_file*, void*), void *data)
>>>>> +{
>>>>> +	struct drm_debugfs_entry *entry =3D drmm_kzalloc(dev, sizeof(*entry=
), GFP_KERNEL);
>>>>> +
>>>>> +	if (!entry)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	entry->file.name =3D name;
>>>>> +	entry->file.show =3D show;
>>>>> +	entry->file.data =3D data;
>>>>> +	entry->dev =3D dev;
>>>>> +
>>>>> +	mutex_lock(&dev->debugfs_mutex);
>>>>> +	list_add(&entry->list, &dev->debugfs_list);
>>>>> +	mutex_unlock(&dev->debugfs_mutex);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_debugfs_add_file);
>>>>> +
>>>>> +/**
>>>>> + * drm_debugfs_add_files - Add an array of files to the DRM device d=
ebugfs file list
>>>>> + * @dev: drm device for the ioctl
>>>>> + * @files: The array of files to create
>>>>> + * @count: The number of files given
>>>>> + *
>>>>> + * Add a given set of debugfs files represented by an array of
>>>>> + * &struct drm_debugfs_info in the DRM device debugfs file list.
>>>>> + */
>>>>> +int drm_debugfs_add_files(struct drm_device *dev, const struct drm_d=
ebugfs_info *files, int count)
>>>>> +{
>>>>> +	int i, ret =3D 0, err;
>>>>> +
>>>>> +	for (i =3D 0; i < count; i++) {
>>>>> +		err =3D drm_debugfs_add_file(dev, files[i].name, files[i].show, fi=
les[i].data);
>>>>> +		if (err)
>>>>> +			ret =3D err;
>>>>> +	}
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_debugfs_add_files);
>>>>
>>>> Do we want to add return values and error handling to debugfs related
>>>> functions at all?
>>>
>>> Drivers such as vc4 can use the return values from debugfs-related
>>> functions for error handling. Although the return values are not
>>> explicitly necessary, some drivers can benefit from them for error hand=
ling.
>>=20
>> Arguably they should cease to do error handling on debugfs failures
>> too. No driver should stop probe if debugfs fails, and that's been the
>> direction for years.
>
> Is it not even reasonable to return errors only to create drm_WARN_ON
> when the creation of debugfs files fails? Currently, vc4 doesn't stop to
> probe if debugfs fails, but only creates some warnings to let the user
> knows that it failed.

First, the only failure mode currently is -ENOMEM, for which you should
never warn or debug log anyway.

Second, Greg's been telling folks for years to not care about the
results of debugfs creation calls [1]. Sure, this is slightly different
in that it's preparation for making those calls, but for practical
purposes the end result is the same, right?

If there were other failure modes than -ENOMEM, I guess you could debug
log them from within drm_debugfs_add_file(), but what does the driver do
with the return code? Most drivers don't care anyway, and IMO they
shouldn't care.

BR,
Jani.


[1] https://lore.kernel.org/r/YWAmZdRwnAt6wh9B@kroah.com


>
> Best Regards,
> - Ma=C3=ADra Canal
>
>>=20
>> BR,
>> Jani.
>>=20
>>>
>>> Best Regards,
>>> - Ma=C3=ADra Canal
>>>
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>
>>>>> +
>>>>>  static int connector_show(struct seq_file *m, void *data)
>>>>>  {
>>>>>  	struct drm_connector *connector =3D m->private;
>>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>>> index 8214a0b1ab7f..803942008fcb 100644
>>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>>> @@ -575,6 +575,7 @@ static void drm_dev_init_release(struct drm_devic=
e *dev, void *res)
>>>>>  	mutex_destroy(&dev->clientlist_mutex);
>>>>>  	mutex_destroy(&dev->filelist_mutex);
>>>>>  	mutex_destroy(&dev->struct_mutex);
>>>>> +	mutex_destroy(&dev->debugfs_mutex);
>>>>>  	drm_legacy_destroy_members(dev);
>>>>>  }
>>>>>=20=20
>>>>> @@ -608,12 +609,14 @@ static int drm_dev_init(struct drm_device *dev,
>>>>>  	INIT_LIST_HEAD(&dev->filelist_internal);
>>>>>  	INIT_LIST_HEAD(&dev->clientlist);
>>>>>  	INIT_LIST_HEAD(&dev->vblank_event_list);
>>>>> +	INIT_LIST_HEAD(&dev->debugfs_list);
>>>>>=20=20
>>>>>  	spin_lock_init(&dev->event_lock);
>>>>>  	mutex_init(&dev->struct_mutex);
>>>>>  	mutex_init(&dev->filelist_mutex);
>>>>>  	mutex_init(&dev->clientlist_mutex);
>>>>>  	mutex_init(&dev->master_mutex);
>>>>> +	mutex_init(&dev->debugfs_mutex);
>>>>>=20=20
>>>>>  	ret =3D drmm_add_action(dev, drm_dev_init_release, NULL);
>>>>>  	if (ret)
>>>>> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
>>>>> index 2188dc83957f..c5684d6c5055 100644
>>>>> --- a/include/drm/drm_debugfs.h
>>>>> +++ b/include/drm/drm_debugfs.h
>>>>> @@ -79,12 +79,43 @@ struct drm_info_node {
>>>>>  	struct dentry *dent;
>>>>>  };
>>>>>=20=20
>>>>> +/**
>>>>> + * struct drm_debugfs_info - debugfs info list entry
>>>>> + *
>>>>> + * This structure represents a debugfs file to be created by the drm
>>>>> + * core.
>>>>> + */
>>>>> +struct drm_debugfs_info {
>>>>> +	const char *name;
>>>>> +	int (*show)(struct seq_file*, void*);
>>>>> +	u32 driver_features;
>>>>> +	void *data;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_debugfs_entry - Per-device debugfs node structure
>>>>> + *
>>>>> + * This structure represents a debugfs file, as an instantiation of =
a &struct
>>>>> + * drm_debugfs_info on a &struct drm_device.
>>>>> + */
>>>>> +struct drm_debugfs_entry {
>>>>> +	struct drm_device *dev;
>>>>> +	struct drm_debugfs_info file;
>>>>> +	struct list_head list;
>>>>> +};
>>>>> +
>>>>>  #if defined(CONFIG_DEBUG_FS)
>>>>>  void drm_debugfs_create_files(const struct drm_info_list *files,
>>>>>  			      int count, struct dentry *root,
>>>>>  			      struct drm_minor *minor);
>>>>>  int drm_debugfs_remove_files(const struct drm_info_list *files,
>>>>>  			     int count, struct drm_minor *minor);
>>>>> +
>>>>> +int drm_debugfs_add_file(struct drm_device *dev, const char *name,
>>>>> +			 int (*show)(struct seq_file*, void*), void *data);
>>>>> +
>>>>> +int drm_debugfs_add_files(struct drm_device *dev,
>>>>> +			  const struct drm_debugfs_info *files, int count);
>>>>>  #else
>>>>>  static inline void drm_debugfs_create_files(const struct drm_info_li=
st *files,
>>>>>  					    int count, struct dentry *root,
>>>>> @@ -96,6 +127,20 @@ static inline int drm_debugfs_remove_files(const =
struct drm_info_list *files,
>>>>>  {
>>>>>  	return 0;
>>>>>  }
>>>>> +
>>>>> +static inline int drm_debugfs_add_file(struct drm_device *dev, const=
 char *name,
>>>>> +				       int (*show)(struct seq_file*, void*),
>>>>> +				       void *data)
>>>>> +{
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static inline int drm_debugfs_add_files(struct drm_device *dev,
>>>>> +					const struct drm_debugfs_info *files,
>>>>> +					int count)
>>>>> +{
>>>>> +	return 0;
>>>>> +}
>>>>>  #endif
>>>>>=20=20
>>>>>  #endif /* _DRM_DEBUGFS_H_ */
>>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>>>> index 9923c7a6885e..fa6af1d57929 100644
>>>>> --- a/include/drm/drm_device.h
>>>>> +++ b/include/drm/drm_device.h
>>>>> @@ -295,6 +295,21 @@ struct drm_device {
>>>>>  	 */
>>>>>  	struct drm_fb_helper *fb_helper;
>>>>>=20=20
>>>>> +	/**
>>>>> +	 * @debugfs_mutex:
>>>>> +	 *
>>>>> +	 * Protects &debugfs_list access.
>>>>> +	 */
>>>>> +	struct mutex debugfs_mutex;
>>>>> +
>>>>> +	/**
>>>>> +	 * @debugfs_list:
>>>>> +	 *
>>>>> +	 * List of debugfs files to be created by the DRM device. The files
>>>>> +	 * must be added during drm_dev_register().
>>>>> +	 */
>>>>> +	struct list_head debugfs_list;
>>>>> +
>>>>>  	/* Everything below here is for legacy driver, never use! */
>>>>>  	/* private: */
>>>>>  #if IS_ENABLED(CONFIG_DRM_LEGACY)
>>>>
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
