Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EC73FC24B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 08:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A4F89893;
	Tue, 31 Aug 2021 06:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4060E89893;
 Tue, 31 Aug 2021 06:02:52 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id r2so15614052pgl.10;
 Mon, 30 Aug 2021 23:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JgE6pOzjUWMtrhnLNBuBWU9KFrWMuVhYBJLyJBwIXmQ=;
 b=HRhhgw+expLjjGuYuunMp1TVMv+esvzS4hfLsztE54T9bpNa0RWhvbt4yoTuBKl88k
 mK+wOklmsSSps2HzzVc1ptlS+TeX9xIRU64D08lPIanGRQtWn1QxSbfT2dtKPIjtvCmX
 4MsX/E1n9sceYDMviTXn64KWmLgU6xE6Tm9VLkib5BV8XWSYaLYm418NhlQREkpvV7A2
 pyoEA9nC2GIXzKFSn721+dMcMib8Awrg1pOfkpLZPuQ453XcYkaqrlMeq7cDQAXH3x0G
 d2HnqNKTgBytni+gwb3DRPL0MJRylMdec1ZOx+zO+fBguPWJgaO/SO/fnGpLjeu2miJ9
 GvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JgE6pOzjUWMtrhnLNBuBWU9KFrWMuVhYBJLyJBwIXmQ=;
 b=aRfzUTZcH/xDFeAjdNrk6hHFNqr+Dq9KGac7EQGdQuVJo3hq3+cODkJNK8BsskcAhm
 ES1LGQ7/tM73jjTVTNX22vH+BVpCDwjM6Ih2qpNw8Dd3AjZqEFCM9w6MaSwBcjhT0aW1
 drDxtFdtDR+fztblMXvdYUnEKDpaYFKF4MGD4wRGPe5s7qGssCgiX5uhB/Hy0D0W3zLK
 6lJAld8T5ddKpT0vHqeOxe4caXhJPk4W4FBRNF/dc4A8cQBy2n72K1NOG6r2tIYZOcW1
 zIoQyYxVwN0j4OBfm7El7vnb6r4IERef2AT8h9imqMe40wVU2w+zGbQcS3+wh4dQm6Zn
 GHCg==
X-Gm-Message-State: AOAM531B0k3W5Rx6BOCrDwgY8eDB+slwuJWYkVVGOLo98rdnq0hhDPVj
 ICqswTI0sHlvEnNhi0GNUNg=
X-Google-Smtp-Source: ABdhPJwjYlf2MdJdhTj7onVnYhm76wFgOfHA2E9gEqSwrWNox8TuBxmCXzIjJpuinRUk5kdifyszpA==
X-Received: by 2002:a63:f70a:: with SMTP id x10mr25396531pgh.393.1630389771673; 
 Mon, 30 Aug 2021 23:02:51 -0700 (PDT)
Received: from [10.146.0.237] ([210.160.217.69])
 by smtp.gmail.com with ESMTPSA id d17sm16178322pfn.110.2021.08.30.23.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 23:02:51 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v8 7/7] drm: remove drm_file.master_lookup_lock
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
 matthew.auld@intel.com, dan.carpenter@oracle.com, tvrtko.ursulin@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com, karthik.b.s@intel.com,
 jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
 aditya.swarup@intel.com, andrescj@chromium.org,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-8-desmondcheongzx@gmail.com>
 <YSeVWivR6p9spRQn@phenom.ffwll.local>
Message-ID: <deadae07-ff1c-538c-9f59-a72ff8367c75@gmail.com>
Date: Tue, 31 Aug 2021 14:02:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSeVWivR6p9spRQn@phenom.ffwll.local>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 26/8/21 9:21 pm, Daniel Vetter wrote:
> On Thu, Aug 26, 2021 at 10:01:22AM +0800, Desmond Cheong Zhi Xi wrote:
>> Previously, master_lookup_lock was introduced in
>> commit 0b0860a3cf5e ("drm: serialize drm_file.master with a new
>> spinlock") to serialize accesses to drm_file.master. This then allowed
>> us to write drm_file_get_master in commit 56f0729a510f ("drm: protect
>> drm_master pointers in drm_lease.c").
>>
>> The rationale behind introducing a new spinlock at the time was that
>> the other lock that could have been used (drm_device.master_mutex) was
>> the outermost lock, so embedding calls to drm_file_get_master and
>> drm_is_current_master in various functions easily caused us to invert
>> the lock hierarchy.
>>
>> Following the conversion of master_mutex into a rwsem, and its use to
>> plug races with modesetting rights, we've untangled some lock
>> hierarchies and removed the need for using drm_file_get_master and the
>> unlocked version of drm_is_current_master in multiple places.
>>
>> Hence, we can take this opportunity to clean up the locking design by
>> replacing master_lookup_lock with drm_device.master_rwsem.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_auth.c     | 19 +++++++------------
>>   drivers/gpu/drm/drm_file.c     |  1 -
>>   drivers/gpu/drm/drm_internal.h |  1 +
>>   drivers/gpu/drm/drm_ioctl.c    |  4 ++--
>>   drivers/gpu/drm/drm_lease.c    | 18 ++++++++----------
>>   include/drm/drm_file.h         |  9 +--------
>>   6 files changed, 19 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index f2b2f197052a..232416119407 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -61,10 +61,9 @@
>>    * trusted clients.
>>    */
>>   
>> -static bool drm_is_current_master_locked(struct drm_file *fpriv)
>> +bool drm_is_current_master_locked(struct drm_file *fpriv)
>>   {
>> -	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
>> -			    lockdep_is_held(&fpriv->minor->dev->master_rwsem));
>> +	lockdep_assert_held_once(&fpriv->minor->dev->master_rwsem);
>>   
>>   	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
>>   }
>> @@ -83,9 +82,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
>>   {
>>   	bool ret;
>>   
>> -	spin_lock(&fpriv->master_lookup_lock);
>> +	down_read(&fpriv->minor->dev->master_rwsem);
> 
> Looking at the 3 patches and the need to have a locked version of pretty
> much everything I'm wondering: Can't we just drop the spinlock completely,
> and everywhere we've taking it thus far replace it with a
> lockdep_assert_held_once?
> 
> The thing is, if there's any path left that doesn't hold the rwsem in at
> least read mode we have a bug. And the right way to fix such a bug is to
> grab the rwsem sufficiently high up in the callchain. That way I think we
> should be able to avoid all these tedious changes to everything, including
> touching i915 and vmwgfx drivers.
> 
> Or am I missing something big time?
> -Daniel
> 

Thanks for taking a look at all the patches and for the suggestions, Daniel.

Just my two cents. I think it makes sense to replace the lock with the 
lockdep assertion. This avoids the weirdness with the lock being taken 
both as an outer lock and sometimes as a deeply embedded inner lock.

But we'll probably have to fix some stuff because I don't think we 
always hold the rwsem in the places where the spinlock is grabbed (i.e. 
when drm_is_current_master or drm_file_get_master is called).

I'll split the series as suggested so we can test things up to PATCH 4 
("drm: avoid races with modesetting rights"). For the rest of the series 
to remove the spinlock, I'll take a closer look and probably send out a 
patch later this week.

Best wishes,
Desmond

>>   	ret = drm_is_current_master_locked(fpriv);
>> -	spin_unlock(&fpriv->master_lookup_lock);
>> +	up_read(&fpriv->minor->dev->master_rwsem);
>>   
>>   	return ret;
>>   }
>> @@ -120,7 +119,7 @@ int drm_authmagic(struct drm_device *dev, void *data,
>>   	DRM_DEBUG("%u\n", auth->magic);
>>   
>>   	down_write(&dev->master_rwsem);
>> -	if (unlikely(!drm_is_current_master(file_priv))) {
>> +	if (unlikely(!drm_is_current_master_locked(file_priv))) {
>>   		up_write(&dev->master_rwsem);
>>   		return -EACCES;
>>   	}
>> @@ -178,9 +177,7 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
>>   	new_master = drm_master_create(dev);
>>   	if (!new_master)
>>   		return -ENOMEM;
>> -	spin_lock(&fpriv->master_lookup_lock);
>>   	fpriv->master = new_master;
>> -	spin_unlock(&fpriv->master_lookup_lock);
>>   
>>   	fpriv->is_master = 1;
>>   	fpriv->authenticated = 1;
>> @@ -343,9 +340,7 @@ int drm_master_open(struct drm_file *file_priv)
>>   	if (!dev->master) {
>>   		ret = drm_new_set_master(dev, file_priv);
>>   	} else {
>> -		spin_lock(&file_priv->master_lookup_lock);
>>   		file_priv->master = drm_master_get(dev->master);
>> -		spin_unlock(&file_priv->master_lookup_lock);
>>   	}
>>   	up_write(&dev->master_rwsem);
>>   
>> @@ -413,13 +408,13 @@ struct drm_master *drm_file_get_master(struct drm_file *file_priv)
>>   	if (!file_priv)
>>   		return NULL;
>>   
>> -	spin_lock(&file_priv->master_lookup_lock);
>> +	down_read(&file_priv->minor->dev->master_rwsem);
>>   	if (!file_priv->master)
>>   		goto unlock;
>>   	master = drm_master_get(file_priv->master);
>>   
>>   unlock:
>> -	spin_unlock(&file_priv->master_lookup_lock);
>> +	up_read(&file_priv->minor->dev->master_rwsem);
>>   	return master;
>>   }
>>   EXPORT_SYMBOL(drm_file_get_master);
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 90b62f360da1..8c846e0179d7 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -176,7 +176,6 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>   	init_waitqueue_head(&file->event_wait);
>>   	file->event_space = 4096; /* set aside 4k for event buffer */
>>   
>> -	spin_lock_init(&file->master_lookup_lock);
>>   	mutex_init(&file->event_read_lock);
>>   
>>   	if (drm_core_check_feature(dev, DRIVER_GEM))
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index 17f3548c8ed2..5d421f749a17 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -132,6 +132,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>>   				  struct drm_file *filp);
>>   
>>   /* drm_auth.c */
>> +bool drm_is_current_master_locked(struct drm_file *fpriv);
>>   int drm_getmagic(struct drm_device *dev, void *data,
>>   		 struct drm_file *file_priv);
>>   int drm_authmagic(struct drm_device *dev, void *data,
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index 8bea39ffc5c0..c728437466c3 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -386,7 +386,7 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
>>   	int if_version, retcode = 0;
>>   
>>   	down_write(&dev->master_rwsem);
>> -	if (unlikely(!drm_is_current_master(file_priv))) {
>> +	if (unlikely(!drm_is_current_master_locked(file_priv))) {
>>   		retcode = -EACCES;
>>   		goto unlock;
>>   	}
>> @@ -540,7 +540,7 @@ static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
>>   
>>   	/* MASTER is only for master or control clients */
>>   	if (unlikely((flags & DRM_MASTER) &&
>> -		     !drm_is_current_master(file_priv)))
>> +		     !drm_is_current_master_locked(file_priv)))
>>   		return -EACCES;
>>   
>>   	/* Render clients must be explicitly allowed */
>> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
>> index 15bf3a3c76d1..0eecf320b1ab 100644
>> --- a/drivers/gpu/drm/drm_lease.c
>> +++ b/drivers/gpu/drm/drm_lease.c
>> @@ -498,12 +498,12 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   		return PTR_ERR(lessee_file);
>>   
>>   	down_read(&dev->master_rwsem);
>> -	if (unlikely(!drm_is_current_master(lessor_priv))) {
>> +	if (unlikely(!drm_is_current_master_locked(lessor_priv))) {
>>   		ret = -EACCES;
>>   		goto out_file;
>>   	}
>>   
>> -	lessor = drm_file_get_master(lessor_priv);
>> +	lessor = lessor_priv->master;
>>   	/* Do not allow sub-leases */
>>   	if (lessor->lessor) {
>>   		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
>> @@ -565,7 +565,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   	/* Hook up the fd */
>>   	fd_install(fd, lessee_file);
>>   
>> -	drm_master_put(&lessor);
>>   	up_read(&dev->master_rwsem);
>>   	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
>>   	return 0;
>> @@ -600,7 +599,8 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>   
>> -	lessor = drm_file_get_master(lessor_priv);
>> +	lockdep_assert_held_once(&dev->master_rwsem);
>> +	lessor = lessor_priv->master;
>>   	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
>>   
>>   	mutex_lock(&dev->mode_config.idr_mutex);
>> @@ -624,7 +624,6 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>>   		arg->count_lessees = count;
>>   
>>   	mutex_unlock(&dev->mode_config.idr_mutex);
>> -	drm_master_put(&lessor);
>>   
>>   	return ret;
>>   }
>> @@ -650,7 +649,8 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>   
>> -	lessee = drm_file_get_master(lessee_priv);
>> +	lockdep_assert_held_once(&dev->master_rwsem);
>> +	lessee = lessee_priv->master;
>>   	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
>>   
>>   	mutex_lock(&dev->mode_config.idr_mutex);
>> @@ -678,7 +678,6 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>>   		arg->count_objects = count;
>>   
>>   	mutex_unlock(&dev->mode_config.idr_mutex);
>> -	drm_master_put(&lessee);
>>   
>>   	return ret;
>>   }
>> @@ -703,11 +702,11 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>>   		return -EOPNOTSUPP;
>>   
>>   	down_write(&dev->master_rwsem);
>> -	if (unlikely(!drm_is_current_master(lessor_priv))) {
>> +	if (unlikely(!drm_is_current_master_locked(lessor_priv))) {
>>   		ret = -EACCES;
>>   		goto unlock;
>>   	}
>> -	lessor = drm_file_get_master(lessor_priv);
>> +	lessor = lessor_priv->master;
>>   	mutex_lock(&dev->mode_config.idr_mutex);
>>   
>>   	lessee = _drm_find_lessee(lessor, arg->lessee_id);
>> @@ -728,7 +727,6 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>>   
>>   fail:
>>   	mutex_unlock(&dev->mode_config.idr_mutex);
>> -	drm_master_put(&lessor);
>>   
>>   unlock:
>>   	up_write(&dev->master_rwsem);
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index d12bb2ba7814..e2d49fe3e32d 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -227,16 +227,12 @@ struct drm_file {
>>   	 * @master:
>>   	 *
>>   	 * Master this node is currently associated with. Protected by struct
>> -	 * &drm_device.master_rwsem, and serialized by @master_lookup_lock.
>> +	 * &drm_device.master_rwsem.
>>   	 *
>>   	 * Only relevant if drm_is_primary_client() returns true. Note that
>>   	 * this only matches &drm_device.master if the master is the currently
>>   	 * active one.
>>   	 *
>> -	 * To update @master, both &drm_device.master_rwsem and
>> -	 * @master_lookup_lock need to be held, therefore holding either of
>> -	 * them is safe and enough for the read side.
>> -	 *
>>   	 * When dereferencing this pointer, either hold struct
>>   	 * &drm_device.master_rwsem for the duration of the pointer's use, or
>>   	 * use drm_file_get_master() if struct &drm_device.master_rwsem is not
>> @@ -248,9 +244,6 @@ struct drm_file {
>>   	 */
>>   	struct drm_master *master;
>>   
>> -	/** @master_lock: Serializes @master. */
>> -	spinlock_t master_lookup_lock;
>> -
>>   	/** @pid: Process that opened this file. */
>>   	struct pid *pid;
>>   
>> -- 
>> 2.25.1
>>
> 

