Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA1186751
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 10:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDA36E388;
	Mon, 16 Mar 2020 09:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629916E388
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 09:02:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n8so16678873wmc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 02:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=T5gNcd3RbLDOue0jCQ/ONE4RBhrPDIw+y8Se0yMLarE=;
 b=RCmeoDuSeEVKBf3Abl/1gFpG6iodupV1Udpm4nIpUw8kJ62YnmeY4xWWtWSEOyBeSO
 XWAKb0dbHgum8iCpm7ejpmCQtCDIQQvdL5AsgbmLa0UEJgrx7aSJ5wavdBWTStoN6lVQ
 8dplLpEyTmPVOe8lcS97Ki8cUblH6CATm7hs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=T5gNcd3RbLDOue0jCQ/ONE4RBhrPDIw+y8Se0yMLarE=;
 b=aMgRXwFbDoRN9Ds4R8Kfa2L56Z1myfFtJFl/6bTY77V5revgkxsApBtvV5OIODNGR5
 LXVIPZbGggtpI3srwQKbyoZGLki+yp/PAaecBZdHeSt1Qv3Rx8KTlHevVDIio4r0oWiR
 tN7azHbMsUb1OVEpEHvJUTK/oIj8hk3YuXa8OOWIHoVug1nJtrLx3DNeY96pGZtbglKr
 wtDuWYrxF1lLVFpxHVb7uj7gifX4bCo2vawXEOYgDqWadfsRCebpoinKkNMG7kqCopSS
 Z89ml88Dx4Tc8OFzN06Gn8Y/0FRMQ/G9YLJPLHFIzOyde3hsaDBdkPifkw+aUoMNm6ao
 Fd1Q==
X-Gm-Message-State: ANhLgQ3YPbMu8EHtW4EDolVqb4YUHGvqKirCdY9+7UADRsucMmkIo3j1
 No8HL7JGomZHNcy0YABh4icf8Q==
X-Google-Smtp-Source: ADFU+vsdmI1ZYcFDZuBZN7AxVvvGYTeBeJzieg1Y70hgXrPWjLFCyBBgD3Hdak+T487ZLah7sfjkeg==
X-Received: by 2002:a1c:3d6:: with SMTP id 205mr28431052wmd.155.1584349364977; 
 Mon, 16 Mar 2020 02:02:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w4sm41065423wrl.12.2020.03.16.02.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 02:02:44 -0700 (PDT)
Date: Mon, 16 Mar 2020 10:02:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 21/51] drm: Use drmm_ for drm_dev_init cleanup
Message-ID: <20200316090242.GG2363188@phenom.ffwll.local>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-22-daniel.vetter@ffwll.ch>
 <51a1d5a5-566f-89f0-2edf-5dd557c5f81a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51a1d5a5-566f-89f0-2edf-5dd557c5f81a@suse.de>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 10:39:13AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 02.03.20 um 23:26 schrieb Daniel Vetter:
> > Well for the simple stuff at least, vblank, gem and minor cleanup I
> > want to further split up as a demonstration.
> > =

> > v2: We need to clear drm_device->dev otherwise the debug drm printing
> > after our cleanup hook (e.g. in drm_manged_release) will chase
> > released memory and result in a use-after-free. Not really pretty, but
> > oh well.
> > =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c | 48 ++++++++++++++++++++-------------------
> >  1 file changed, 25 insertions(+), 23 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index ef79c03e311c..23e5b0e7e041 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -580,6 +580,23 @@ static void drm_fs_inode_free(struct inode *inode)
> >   *    used.
> >   */
> >  =

> > +static void drm_dev_init_release(struct drm_device *dev, void *res)
> > +{
> > +	drm_legacy_ctxbitmap_cleanup(dev);
> > +	drm_legacy_remove_map_hash(dev);
> > +	drm_fs_inode_free(dev->anon_inode);
> > +
> > +	put_device(dev->dev);
> > +	/* Prevent use-after-free in drm_managed_release when debugging is
> > +	 * enabled. Slightly awkward, but can't really be helped. */
> > +	dev->dev =3D NULL;
> > +	mutex_destroy(&dev->master_mutex);
> > +	mutex_destroy(&dev->clientlist_mutex);
> > +	mutex_destroy(&dev->filelist_mutex);
> > +	mutex_destroy(&dev->struct_mutex);
> > +	drm_legacy_destroy_members(dev);
> > +}
> > +
> >  /**
> >   * drm_dev_init - Initialise new DRM device
> >   * @dev: DRM device
> > @@ -647,11 +664,15 @@ int drm_dev_init(struct drm_device *dev,
> >  	mutex_init(&dev->clientlist_mutex);
> >  	mutex_init(&dev->master_mutex);
> >  =

> > +	ret =3D drmm_add_action(dev, drm_dev_init_release, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> =

> Is this code supposed to stay for the long term? As devices are
> allocated dynamically, I can imagine that there will be a call that
> allocates the memory and, at the same time, sets drm_dev_init_release()
> as the release callback.

There's a chicken-egg situation here. The plan is to fix this with a
devm_drm_dev_alloc() macro, which we discussed quite a bit in earlier
versions. It's just that the patch series is already big as-is, hence this
is postponed to the next round.

> The question is also released to patch 3, where I proposed to rename
> __drm_add_action() to __drmm_kzalloc().
> =

> >  	dev->anon_inode =3D drm_fs_inode_new();
> >  	if (IS_ERR(dev->anon_inode)) {
> >  		ret =3D PTR_ERR(dev->anon_inode);
> >  		DRM_ERROR("Cannot allocate anonymous inode: %d\n", ret);
> > -		goto err_free;
> > +		goto err;
> >  	}
> >  =

> >  	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
> > @@ -688,19 +709,12 @@ int drm_dev_init(struct drm_device *dev,
> >  	if (drm_core_check_feature(dev, DRIVER_GEM))
> >  		drm_gem_destroy(dev);
> >  err_ctxbitmap:
> > -	drm_legacy_ctxbitmap_cleanup(dev);
> > -	drm_legacy_remove_map_hash(dev);
> >  err_minors:
> >  	drm_minor_free(dev, DRM_MINOR_PRIMARY);
> >  	drm_minor_free(dev, DRM_MINOR_RENDER);
> > -	drm_fs_inode_free(dev->anon_inode);
> > -err_free:
> > -	put_device(dev->dev);
> > -	mutex_destroy(&dev->master_mutex);
> > -	mutex_destroy(&dev->clientlist_mutex);
> > -	mutex_destroy(&dev->filelist_mutex);
> > -	mutex_destroy(&dev->struct_mutex);
> > -	drm_legacy_destroy_members(dev);
> > +err:
> > +	drm_managed_release(dev);
> > +
> =

> Here's more of a general observation than a comment on the actual patch:
> =

> One odd thing about the overall interface is that there's no way of
> updating the release callback afterwards. In an OOP language, such as
> C++, an error within the constructor would rollback the performed
> actions and return without calling the destructor. Destructors only run
> for fully constructed objects.
> =

> In our case, the equivalent is to run the init function and set
> drm_dev_init_release() as the final step. The init's rollback-code would
> have to stay, obviously.

See the various drivers later on in the series, the init rollback
completely disappears once we're done here. If this wouldn't Just Work for
both final destruction and init rollback there's really no point. There's
a few ugly corner-cases with getting this boot-strapped though.
-Daniel

> =

> Best regards
> Thomas
> =

> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_dev_init);
> > @@ -763,20 +777,8 @@ void drm_dev_fini(struct drm_device *dev)
> >  	if (drm_core_check_feature(dev, DRIVER_GEM))
> >  		drm_gem_destroy(dev);
> >  =

> > -	drm_legacy_ctxbitmap_cleanup(dev);
> > -	drm_legacy_remove_map_hash(dev);
> > -	drm_fs_inode_free(dev->anon_inode);
> > -
> >  	drm_minor_free(dev, DRM_MINOR_PRIMARY);
> >  	drm_minor_free(dev, DRM_MINOR_RENDER);
> > -
> > -	put_device(dev->dev);
> > -
> > -	mutex_destroy(&dev->master_mutex);
> > -	mutex_destroy(&dev->clientlist_mutex);
> > -	mutex_destroy(&dev->filelist_mutex);
> > -	mutex_destroy(&dev->struct_mutex);
> > -	drm_legacy_destroy_members(dev);
> >  }
> >  EXPORT_SYMBOL(drm_dev_fini);
> >  =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
