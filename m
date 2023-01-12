Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEAC666E00
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83C510E5B7;
	Thu, 12 Jan 2023 09:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D46D10E5B7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673515554; x=1705051554;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fi+GCPb5sASTv/7GZOUz/2OBhwJYd99Q9+xdvoJ9l/Y=;
 b=ipBPnTiGArx0XyeffQVWIgDzt8I8rSGSI7J+uEAGz4AmKsowbkic1cDR
 LUUzt9cgTV5NGchD4CR4AkbIUhFSRhoH98dVpwL23QKT/PJGjYY+COFqo
 9YBGZLc8y5SlgAETGA1877XCYLwSqHtr6s72YnwbP7nk8+y6E7lTPDM/F
 nvrx4LpGQ64rQujcrnpShd29D8enZjIuhk/e6TQeKqGjcEfHOcujYJD/Y
 YLaJM8GXerJ7ISFXutyBZKraAC3XSse3KCb2TSWetBYpAJUVs/xQyek6t
 QP0uBWSlUV8AEW0yMHfgKLX/qMAkbsnFG2JdynC110Za9yRAwbEe3JEGn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="323716248"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="323716248"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 01:25:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="800143415"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="800143415"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.27.83])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 01:25:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/13] drm/debugfs: Create helper to add debugfs files
 to device's list
In-Reply-To: <Y7/O3wqumKf8269i@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230111173748.752659-1-mcanal@igalia.com>
 <20230111173748.752659-2-mcanal@igalia.com> <87k01sgmqn.fsf@intel.com>
 <Y7/O3wqumKf8269i@phenom.ffwll.local>
Date: Thu, 12 Jan 2023 11:25:47 +0200
Message-ID: <87358ggl44.fsf@intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 Alain Volmat <alain.volmat@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Jan 2023, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Jan 12, 2023 at 10:50:40AM +0200, Jani Nikula wrote:
>> On Wed, 11 Jan 2023, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>> > Create a helper to encapsulate the code that adds a new debugfs file to
>> > a linked list related to a object. Moreover, the helper also provides
>> > more flexibily on the type of the object, allowing to use the helper f=
or
>> > other types of drm_debugfs_entry.
>> >
>> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>> > ---
>> >  drivers/gpu/drm/drm_debugfs.c | 20 ++++++++++++--------
>> >  1 file changed, 12 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debug=
fs.c
>> > index 4f643a490dc3..255d2068ac16 100644
>> > --- a/drivers/gpu/drm/drm_debugfs.c
>> > +++ b/drivers/gpu/drm/drm_debugfs.c
>> > @@ -316,6 +316,17 @@ void drm_debugfs_cleanup(struct drm_minor *minor)
>> >  	minor->debugfs_root =3D NULL;
>> >  }
>> >=20=20
>> > +#define drm_debugfs_add_file_to_list(component) do {			\
>> > +		entry->file.name =3D name;				\
>> > +		entry->file.show =3D show;				\
>> > +		entry->file.data =3D data;				\
>> > +		entry->component =3D (component);				\
>> > +									\
>> > +		mutex_lock(&(component)->debugfs_mutex);		\
>> > +		list_add(&entry->list, &(component)->debugfs_list);	\
>> > +		mutex_unlock(&(component)->debugfs_mutex);		\
>> > +	} while (0)
>>=20
>> In general, please don't add macros that implicitly depend on certain
>> local variable names. In this case, "entry".
>>=20
>> But I'm also not convinced about the usefulness of adding this kind of
>> "generics". Sure, it'll save you a few lines here and there, but I think
>> overall it's just confusing more than it's useful.
>
> So the non-generics way I guess would be to
> - pass the right pointer to the functions as an explicit parameter (struct
>   drm_device|crtc|connector *, )
> - make drm_debugfs_entry and implementation detail
> - switch the pointer in there to void *, have glue show functions for each
>   case which do nothing else than cast from void * to the right type
>   (both for the parameter and the function pointer)
> - have a single function which takes that void *entry list and a pointer
>   to the debugfs director to add them all for code sharing
>
> I think this should work for ->show, but for ->fops it becomes a rather
> big mess I fear. Maybe for ->fops (and also for ->show for now) we leave
> the explicit parameter out and just rely on seq_file->private or whatever
> it was.

Similar ideas in https://lore.kernel.org/r/878ri8glee.fsf@intel.com

I think for the more general ->fops case, the question really becomes
does drm need *all* the functionality of ->fops, or can we get away with
providing just show/write functions pointers, and wrapping it all inside
drm_debugfs.c? The question *now* is avoiding to paint ourselves in the
corner and requiring a ton of *extra* work to make that happen.


BR,
Jani.




>
> Or just copypaste, it's not that much code really :-)
> -Daniel
>
>>=20
>>=20
>> BR,
>> Jani.
>>=20
>> > +
>> >  /**
>> >   * drm_debugfs_add_file - Add a given file to the DRM device debugfs =
file list
>> >   * @dev: drm device for the ioctl
>> > @@ -334,14 +345,7 @@ void drm_debugfs_add_file(struct drm_device *dev,=
 const char *name,
>> >  	if (!entry)
>> >  		return;
>> >=20=20
>> > -	entry->file.name =3D name;
>> > -	entry->file.show =3D show;
>> > -	entry->file.data =3D data;
>> > -	entry->dev =3D dev;
>> > -
>> > -	mutex_lock(&dev->debugfs_mutex);
>> > -	list_add(&entry->list, &dev->debugfs_list);
>> > -	mutex_unlock(&dev->debugfs_mutex);
>> > +	drm_debugfs_add_file_to_list(dev);
>> >  }
>> >  EXPORT_SYMBOL(drm_debugfs_add_file);
>>=20
>> --=20
>> Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
