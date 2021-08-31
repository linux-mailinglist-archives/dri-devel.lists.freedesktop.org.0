Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F23FC70A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 14:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E129289A7A;
	Tue, 31 Aug 2021 12:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AD089A7A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 12:28:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id m2so11109477wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 05:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6MPFXzK83t9FgGtVMImyk0Ejkh7szMb7S/WlAcYLALg=;
 b=FK95izfC9AFF5hYJUt5pv25p/NfuDa2uCmbR098bx8IdgxWcUNJDWE5GGYM4ICqFW4
 gS3KDdxWzPnDkfCnvrq21gFjMuPm5Wt26VUd2yhGxUQlK0g4quWVRFvihYO4LbxW8DOZ
 7h9jVtQ2egNvxO58/qJmt9bO+UxjKfD4EAiEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=6MPFXzK83t9FgGtVMImyk0Ejkh7szMb7S/WlAcYLALg=;
 b=sD8e8e+PBNqpboE55n+ttUBp8lXBSHZagGxjDvPFAhPTjQp9QeGHg5dcroaMjIm6uE
 a1Wq30jIYbPcZXqjuk3yPyMgd8viL1zTdsFPmfsHmCMtyHkLZJkwRSmQEAqnSMaByWkH
 v+/0zEUNs6w68M+PPy1KJFW4ZSLTfJeDubJ8CQinU+WMlcAgEFVvJFOPNKvoMOb8PNSh
 PN7P9tDarhKumJiyVhfGpaH0c/Ar+V9BpenxbyrolBJ3W49XVOa0GgPNDk0qYTKsGap/
 qTOD1RLBejPfa6olvrmdWcXn9d6K2mbbiUKp7psAqS2iLH1lc20Sz+eSAqZ/tBd9KPQH
 tJCA==
X-Gm-Message-State: AOAM533RtIfovWB9u5SC6pzeLpsETPAOrABH4WXNDgAi7C7qDbM5rSQJ
 hbkPQJW6sKJB63+psc5PzVs3vA==
X-Google-Smtp-Source: ABdhPJzu279Mgbuj3kGrOHxkqtmMEM7lBNz+N0cH4alHeHk08xfFeKVtvnjbcF1It7I4/ht8fu49dA==
X-Received: by 2002:a05:600c:1d0d:: with SMTP id
 l13mr4030997wms.100.1630412930860; 
 Tue, 31 Aug 2021 05:28:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y11sm22017864wru.0.2021.08.31.05.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 05:28:50 -0700 (PDT)
Date: Tue, 31 Aug 2021 14:28:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com,
 tvrtko.ursulin@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v8 7/7] drm: remove drm_file.master_lookup_lock
Message-ID: <YS4gf+dN2cbsyj78@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com,
 tvrtko.ursulin@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-8-desmondcheongzx@gmail.com>
 <YSeVWivR6p9spRQn@phenom.ffwll.local>
 <deadae07-ff1c-538c-9f59-a72ff8367c75@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deadae07-ff1c-538c-9f59-a72ff8367c75@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Aug 31, 2021 at 02:02:39PM +0800, Desmond Cheong Zhi Xi wrote:
> On 26/8/21 9:21 pm, Daniel Vetter wrote:
> > On Thu, Aug 26, 2021 at 10:01:22AM +0800, Desmond Cheong Zhi Xi wrote:
> > > Previously, master_lookup_lock was introduced in
> > > commit 0b0860a3cf5e ("drm: serialize drm_file.master with a new
> > > spinlock") to serialize accesses to drm_file.master. This then allowed
> > > us to write drm_file_get_master in commit 56f0729a510f ("drm: protect
> > > drm_master pointers in drm_lease.c").
> > > 
> > > The rationale behind introducing a new spinlock at the time was that
> > > the other lock that could have been used (drm_device.master_mutex) was
> > > the outermost lock, so embedding calls to drm_file_get_master and
> > > drm_is_current_master in various functions easily caused us to invert
> > > the lock hierarchy.
> > > 
> > > Following the conversion of master_mutex into a rwsem, and its use to
> > > plug races with modesetting rights, we've untangled some lock
> > > hierarchies and removed the need for using drm_file_get_master and the
> > > unlocked version of drm_is_current_master in multiple places.
> > > 
> > > Hence, we can take this opportunity to clean up the locking design by
> > > replacing master_lookup_lock with drm_device.master_rwsem.
> > > 
> > > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > > ---
> > >   drivers/gpu/drm/drm_auth.c     | 19 +++++++------------
> > >   drivers/gpu/drm/drm_file.c     |  1 -
> > >   drivers/gpu/drm/drm_internal.h |  1 +
> > >   drivers/gpu/drm/drm_ioctl.c    |  4 ++--
> > >   drivers/gpu/drm/drm_lease.c    | 18 ++++++++----------
> > >   include/drm/drm_file.h         |  9 +--------
> > >   6 files changed, 19 insertions(+), 33 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > index f2b2f197052a..232416119407 100644
> > > --- a/drivers/gpu/drm/drm_auth.c
> > > +++ b/drivers/gpu/drm/drm_auth.c
> > > @@ -61,10 +61,9 @@
> > >    * trusted clients.
> > >    */
> > > -static bool drm_is_current_master_locked(struct drm_file *fpriv)
> > > +bool drm_is_current_master_locked(struct drm_file *fpriv)
> > >   {
> > > -	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
> > > -			    lockdep_is_held(&fpriv->minor->dev->master_rwsem));
> > > +	lockdep_assert_held_once(&fpriv->minor->dev->master_rwsem);
> > >   	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> > >   }
> > > @@ -83,9 +82,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
> > >   {
> > >   	bool ret;
> > > -	spin_lock(&fpriv->master_lookup_lock);
> > > +	down_read(&fpriv->minor->dev->master_rwsem);
> > 
> > Looking at the 3 patches and the need to have a locked version of pretty
> > much everything I'm wondering: Can't we just drop the spinlock completely,
> > and everywhere we've taking it thus far replace it with a
> > lockdep_assert_held_once?
> > 
> > The thing is, if there's any path left that doesn't hold the rwsem in at
> > least read mode we have a bug. And the right way to fix such a bug is to
> > grab the rwsem sufficiently high up in the callchain. That way I think we
> > should be able to avoid all these tedious changes to everything, including
> > touching i915 and vmwgfx drivers.
> > 
> > Or am I missing something big time?
> > -Daniel
> > 
> 
> Thanks for taking a look at all the patches and for the suggestions, Daniel.
> 
> Just my two cents. I think it makes sense to replace the lock with the
> lockdep assertion. This avoids the weirdness with the lock being taken both
> as an outer lock and sometimes as a deeply embedded inner lock.
> 
> But we'll probably have to fix some stuff because I don't think we always
> hold the rwsem in the places where the spinlock is grabbed (i.e. when
> drm_is_current_master or drm_file_get_master is called).

Yeah right I forgot about that again when coming up with this idea. All
the ioctl that read kms state need a read lock too. Maybe those ioctl
could just grab the master rwsem themselves? This should work now that
we've untangled the drm_global_mutex situation I think.

> I'll split the series as suggested so we can test things up to PATCH 4
> ("drm: avoid races with modesetting rights"). For the rest of the series to
> remove the spinlock, I'll take a closer look and probably send out a patch
> later this week.

Sounds great!
-Daniel


> 
> Best wishes,
> Desmond
> 
> > >   	ret = drm_is_current_master_locked(fpriv);
> > > -	spin_unlock(&fpriv->master_lookup_lock);
> > > +	up_read(&fpriv->minor->dev->master_rwsem);
> > >   	return ret;
> > >   }
> > > @@ -120,7 +119,7 @@ int drm_authmagic(struct drm_device *dev, void *data,
> > >   	DRM_DEBUG("%u\n", auth->magic);
> > >   	down_write(&dev->master_rwsem);
> > > -	if (unlikely(!drm_is_current_master(file_priv))) {
> > > +	if (unlikely(!drm_is_current_master_locked(file_priv))) {
> > >   		up_write(&dev->master_rwsem);
> > >   		return -EACCES;
> > >   	}
> > > @@ -178,9 +177,7 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
> > >   	new_master = drm_master_create(dev);
> > >   	if (!new_master)
> > >   		return -ENOMEM;
> > > -	spin_lock(&fpriv->master_lookup_lock);
> > >   	fpriv->master = new_master;
> > > -	spin_unlock(&fpriv->master_lookup_lock);
> > >   	fpriv->is_master = 1;
> > >   	fpriv->authenticated = 1;
> > > @@ -343,9 +340,7 @@ int drm_master_open(struct drm_file *file_priv)
> > >   	if (!dev->master) {
> > >   		ret = drm_new_set_master(dev, file_priv);
> > >   	} else {
> > > -		spin_lock(&file_priv->master_lookup_lock);
> > >   		file_priv->master = drm_master_get(dev->master);
> > > -		spin_unlock(&file_priv->master_lookup_lock);
> > >   	}
> > >   	up_write(&dev->master_rwsem);
> > > @@ -413,13 +408,13 @@ struct drm_master *drm_file_get_master(struct drm_file *file_priv)
> > >   	if (!file_priv)
> > >   		return NULL;
> > > -	spin_lock(&file_priv->master_lookup_lock);
> > > +	down_read(&file_priv->minor->dev->master_rwsem);
> > >   	if (!file_priv->master)
> > >   		goto unlock;
> > >   	master = drm_master_get(file_priv->master);
> > >   unlock:
> > > -	spin_unlock(&file_priv->master_lookup_lock);
> > > +	up_read(&file_priv->minor->dev->master_rwsem);
> > >   	return master;
> > >   }
> > >   EXPORT_SYMBOL(drm_file_get_master);
> > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > > index 90b62f360da1..8c846e0179d7 100644
> > > --- a/drivers/gpu/drm/drm_file.c
> > > +++ b/drivers/gpu/drm/drm_file.c
> > > @@ -176,7 +176,6 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
> > >   	init_waitqueue_head(&file->event_wait);
> > >   	file->event_space = 4096; /* set aside 4k for event buffer */
> > > -	spin_lock_init(&file->master_lookup_lock);
> > >   	mutex_init(&file->event_read_lock);
> > >   	if (drm_core_check_feature(dev, DRIVER_GEM))
> > > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > > index 17f3548c8ed2..5d421f749a17 100644
> > > --- a/drivers/gpu/drm/drm_internal.h
> > > +++ b/drivers/gpu/drm/drm_internal.h
> > > @@ -132,6 +132,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
> > >   				  struct drm_file *filp);
> > >   /* drm_auth.c */
> > > +bool drm_is_current_master_locked(struct drm_file *fpriv);
> > >   int drm_getmagic(struct drm_device *dev, void *data,
> > >   		 struct drm_file *file_priv);
> > >   int drm_authmagic(struct drm_device *dev, void *data,
> > > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > > index 8bea39ffc5c0..c728437466c3 100644
> > > --- a/drivers/gpu/drm/drm_ioctl.c
> > > +++ b/drivers/gpu/drm/drm_ioctl.c
> > > @@ -386,7 +386,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
> > >   	int if_version, retcode = 0;
> > >   	down_write(&dev->master_rwsem);
> > > -	if (unlikely(!drm_is_current_master(file_priv))) {
> > > +	if (unlikely(!drm_is_current_master_locked(file_priv))) {
> > >   		retcode = -EACCES;
> > >   		goto unlock;
> > >   	}
> > > @@ -540,7 +540,7 @@ static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
> > >   	/* MASTER is only for master or control clients */
> > >   	if (unlikely((flags & DRM_MASTER) &&
> > > -		     !drm_is_current_master(file_priv)))
> > > +		     !drm_is_current_master_locked(file_priv)))
> > >   		return -EACCES;
> > >   	/* Render clients must be explicitly allowed */
> > > diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> > > index 15bf3a3c76d1..0eecf320b1ab 100644
> > > --- a/drivers/gpu/drm/drm_lease.c
> > > +++ b/drivers/gpu/drm/drm_lease.c
> > > @@ -498,12 +498,12 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
> > >   		return PTR_ERR(lessee_file);
> > >   	down_read(&dev->master_rwsem);
> > > -	if (unlikely(!drm_is_current_master(lessor_priv))) {
> > > +	if (unlikely(!drm_is_current_master_locked(lessor_priv))) {
> > >   		ret = -EACCES;
> > >   		goto out_file;
> > >   	}
> > > -	lessor = drm_file_get_master(lessor_priv);
> > > +	lessor = lessor_priv->master;
> > >   	/* Do not allow sub-leases */
> > >   	if (lessor->lessor) {
> > >   		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
> > > @@ -565,7 +565,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
> > >   	/* Hook up the fd */
> > >   	fd_install(fd, lessee_file);
> > > -	drm_master_put(&lessor);
> > >   	up_read(&dev->master_rwsem);
> > >   	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
> > >   	return 0;
> > > @@ -600,7 +599,8 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
> > >   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> > >   		return -EOPNOTSUPP;
> > > -	lessor = drm_file_get_master(lessor_priv);
> > > +	lockdep_assert_held_once(&dev->master_rwsem);
> > > +	lessor = lessor_priv->master;
> > >   	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
> > >   	mutex_lock(&dev->mode_config.idr_mutex);
> > > @@ -624,7 +624,6 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
> > >   		arg->count_lessees = count;
> > >   	mutex_unlock(&dev->mode_config.idr_mutex);
> > > -	drm_master_put(&lessor);
> > >   	return ret;
> > >   }
> > > @@ -650,7 +649,8 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
> > >   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
> > >   		return -EOPNOTSUPP;
> > > -	lessee = drm_file_get_master(lessee_priv);
> > > +	lockdep_assert_held_once(&dev->master_rwsem);
> > > +	lessee = lessee_priv->master;
> > >   	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
> > >   	mutex_lock(&dev->mode_config.idr_mutex);
> > > @@ -678,7 +678,6 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
> > >   		arg->count_objects = count;
> > >   	mutex_unlock(&dev->mode_config.idr_mutex);
> > > -	drm_master_put(&lessee);
> > >   	return ret;
> > >   }
> > > @@ -703,11 +702,11 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
> > >   		return -EOPNOTSUPP;
> > >   	down_write(&dev->master_rwsem);
> > > -	if (unlikely(!drm_is_current_master(lessor_priv))) {
> > > +	if (unlikely(!drm_is_current_master_locked(lessor_priv))) {
> > >   		ret = -EACCES;
> > >   		goto unlock;
> > >   	}
> > > -	lessor = drm_file_get_master(lessor_priv);
> > > +	lessor = lessor_priv->master;
> > >   	mutex_lock(&dev->mode_config.idr_mutex);
> > >   	lessee = _drm_find_lessee(lessor, arg->lessee_id);
> > > @@ -728,7 +727,6 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
> > >   fail:
> > >   	mutex_unlock(&dev->mode_config.idr_mutex);
> > > -	drm_master_put(&lessor);
> > >   unlock:
> > >   	up_write(&dev->master_rwsem);
> > > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > > index d12bb2ba7814..e2d49fe3e32d 100644
> > > --- a/include/drm/drm_file.h
> > > +++ b/include/drm/drm_file.h
> > > @@ -227,16 +227,12 @@ struct drm_file {
> > >   	 * @master:
> > >   	 *
> > >   	 * Master this node is currently associated with. Protected by struct
> > > -	 * &drm_device.master_rwsem, and serialized by @master_lookup_lock.
> > > +	 * &drm_device.master_rwsem.
> > >   	 *
> > >   	 * Only relevant if drm_is_primary_client() returns true. Note that
> > >   	 * this only matches &drm_device.master if the master is the currently
> > >   	 * active one.
> > >   	 *
> > > -	 * To update @master, both &drm_device.master_rwsem and
> > > -	 * @master_lookup_lock need to be held, therefore holding either of
> > > -	 * them is safe and enough for the read side.
> > > -	 *
> > >   	 * When dereferencing this pointer, either hold struct
> > >   	 * &drm_device.master_rwsem for the duration of the pointer's use, or
> > >   	 * use drm_file_get_master() if struct &drm_device.master_rwsem is not
> > > @@ -248,9 +244,6 @@ struct drm_file {
> > >   	 */
> > >   	struct drm_master *master;
> > > -	/** @master_lock: Serializes @master. */
> > > -	spinlock_t master_lookup_lock;
> > > -
> > >   	/** @pid: Process that opened this file. */
> > >   	struct pid *pid;
> > > -- 
> > > 2.25.1
> > > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
