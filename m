Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44C3FBE62
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 23:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B6689E50;
	Mon, 30 Aug 2021 21:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A2E89E50;
 Mon, 30 Aug 2021 21:36:10 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so714444pjb.1; 
 Mon, 30 Aug 2021 14:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DMMYAGt2GH0X98sAMhF1FSTdctWjP57ulHoYd0K0xrI=;
 b=oC31nqZkJV1IGAALOzqECLMTZaE7nI1abl+g2EWtBNYjs7Ia5gpCO1fjrn0jZEEKc0
 MjjaWPXOuhqeQ9PK0aYvJJY0xAxCbETmGyJk+G0LsMZV0FzMUtrMi50Gkwa9kbJaIVL0
 JQcSqg4cZLol31nA4BLL3b7difdp/moQztt1iiyKzOOBuaWmsliGWCnBr97EBxA/uc6a
 2p82dMZOo7iLTVaqhVxPFm3EcmvmnK72hf7ntlFpzUeRrOFORZO7oyB8mq5h17iS9qFP
 fElI7XuPALxMX7imt+/auxKd5qauhX8PkHWYQNks29As9a0K6d9chc/ics/QBuqWEDbP
 2Vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DMMYAGt2GH0X98sAMhF1FSTdctWjP57ulHoYd0K0xrI=;
 b=MQPtGE86lKaEPVLBkQaC3JsokR3k7Yo5xdbglaeAaaJl8FMROSVBPxzSrOc/GCLjCH
 6PFfFzbS+69/Y4b+XQ4SCeAKinuyqkuNwtVZvT3mFoKBphbTkA3XPf+sLrUOaUCMgPKh
 gfJicnVj8iGhy7AEfgVsja3f2xvBSthyrYXgmilGflst581V6ePoSpB4kAzCHPhwt+R3
 J/QUyhe5nDJ23gmeIfPbVXi6+PFt78ExsTa97BDDxnA7xgsmcYeljkydgEhhaoRhYNbg
 EnSXsfD6N91QmJU0kVlDYjp5FA4Trm/sqgU5ag6m3bwihZIoj9JSSIqIVpJomJyoVD/o
 DKeg==
X-Gm-Message-State: AOAM5308uWADfke4X8JyHuDCSaKFIn50xBFyrli9bV8kAivxJ/1bHPlE
 koDIxW4cGbDDrO4aA3tDYX4=
X-Google-Smtp-Source: ABdhPJz8FL6dF8XDeUBqOqLr1kDGNXgoxA9KJIgP1cHX3mHETqAJbW4/zbQuZGooY5guCAfh3Wblwg==
X-Received: by 2002:a17:90a:312:: with SMTP id
 18mr1286240pje.178.1630359370225; 
 Mon, 30 Aug 2021 14:36:10 -0700 (PDT)
Received: from [10.80.16.166] ([103.137.210.137])
 by smtp.gmail.com with ESMTPSA id u3sm14653138pfg.58.2021.08.30.14.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:36:09 -0700 (PDT)
Subject: Re: [PATCH v8 4/7] drm: avoid races with modesetting rights
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
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-5-desmondcheongzx@gmail.com>
 <YSeQHvagpTjlifpX@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <d8ba4b21-a04f-1bd9-f986-ffc894bd50fd@gmail.com>
Date: Tue, 31 Aug 2021 05:36:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSeQHvagpTjlifpX@phenom.ffwll.local>
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

On 26/8/21 8:59 pm, Daniel Vetter wrote:
> On Thu, Aug 26, 2021 at 10:01:19AM +0800, Desmond Cheong Zhi Xi wrote:
>> In drm_client_modeset.c and drm_fb_helper.c,
>> drm_master_internal_{acquire,release} are used to avoid races with DRM
>> userspace. These functions hold onto drm_device.master_rwsem while
>> committing, and bail if there's already a master.
>>
>> However, there are other places where modesetting rights can race. A
>> time-of-check-to-time-of-use error can occur if an ioctl that changes
>> the modeset has its rights revoked after it validates its permissions,
>> but before it completes.
>>
>> There are four places where modesetting permissions can change:
>>
>> - DROP_MASTER ioctl removes rights for a master and its leases
>>
>> - REVOKE_LEASE ioctl revokes rights for a specific lease
>>
>> - SET_MASTER ioctl sets the device master if the master role hasn't
>> been acquired yet
>>
>> - drm_open which can create a new master for a device if one does not
>> currently exist
>>
>> These races can be avoided using drm_device.master_rwsem: users that
>> perform modesetting should hold a read lock on the new
>> drm_device.master_rwsem, and users that change these permissions
>> should hold a write lock.
>>
>> To avoid deadlocks with master_rwsem, for ioctls that need to check
>> for modesetting permissions, but also need to hold a write lock on
>> master_rwsem to protect some other attribute (or recurses to some
>> function that holds a write lock, like drm_mode_create_lease_ioctl
>> which eventually calls drm_master_open), we remove the DRM_MASTER flag
>> and push the master_rwsem lock and permissions check into the ioctl.
>>
>> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_auth.c  |  4 ++++
>>   drivers/gpu/drm/drm_ioctl.c | 20 +++++++++++++++-----
>>   drivers/gpu/drm/drm_lease.c | 35 ++++++++++++++++++++++++-----------
>>   include/drm/drm_device.h    |  5 +++++
>>   4 files changed, 48 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 73ade0513ccb..65065f7e1499 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -120,6 +120,10 @@ int drm_authmagic(struct drm_device *dev, void *data,
>>   	DRM_DEBUG("%u\n", auth->magic);
>>   
>>   	down_write(&dev->master_rwsem);
>> +	if (unlikely(!drm_is_current_master(file_priv))) {
>> +		up_write(&dev->master_rwsem);
>> +		return -EACCES;
>> +	}
>>   	file = idr_find(&file_priv->master->magic_map, auth->magic);
>>   	if (file) {
>>   		file->authenticated = 1;
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index 158629d88319..8bea39ffc5c0 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -386,6 +386,10 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
>>   	int if_version, retcode = 0;
>>   
>>   	down_write(&dev->master_rwsem);
>> +	if (unlikely(!drm_is_current_master(file_priv))) {
>> +		retcode = -EACCES;
>> +		goto unlock;
>> +	}
>>   	if (sv->drm_di_major != -1) {
>>   		if (sv->drm_di_major != DRM_IF_MAJOR ||
>>   		    sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MINOR) {
>> @@ -420,8 +424,9 @@ static int drm_setversion(struct drm_device *dev, void *data, struct drm_file *f
>>   	sv->drm_di_minor = DRM_IF_MINOR;
>>   	sv->drm_dd_major = dev->driver->major;
>>   	sv->drm_dd_minor = dev->driver->minor;
>> -	up_write(&dev->master_rwsem);
>>   
>> +unlock:
>> +	up_write(&dev->master_rwsem);
>>   	return retcode;
>>   }
>>   
>> @@ -574,12 +579,12 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>>   	DRM_IOCTL_DEF(DRM_IOCTL_GET_STATS, drm_getstats, 0),
>>   	DRM_IOCTL_DEF(DRM_IOCTL_GET_CAP, drm_getcap, DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF(DRM_IOCTL_SET_CLIENT_CAP, drm_setclientcap, 0),
>> -	DRM_IOCTL_DEF(DRM_IOCTL_SET_VERSION, drm_setversion, DRM_MASTER),
>> +	DRM_IOCTL_DEF(DRM_IOCTL_SET_VERSION, drm_setversion, 0),
> 
> Random bikeshed, if you're bored: In newer code we've given ioctl
> callbacks an _ioctl suffix, so they'r easier to spot. Could do that in a
> follow-up if you want.
> 

Makes sense, this was a small pain point when auditing the ioctl 
functions. I'll do this on a rainier day.

>>   
>>   	DRM_IOCTL_DEF(DRM_IOCTL_SET_UNIQUE, drm_invalid_op, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>>   	DRM_IOCTL_DEF(DRM_IOCTL_BLOCK, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>>   	DRM_IOCTL_DEF(DRM_IOCTL_UNBLOCK, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>> -	DRM_IOCTL_DEF(DRM_IOCTL_AUTH_MAGIC, drm_authmagic, DRM_MASTER),
>> +	DRM_IOCTL_DEF(DRM_IOCTL_AUTH_MAGIC, drm_authmagic, 0),
>>   
>>   	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_MAP, drm_legacy_addmap_ioctl, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>>   	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_MAP, drm_legacy_rmmap_ioctl, DRM_AUTH),
>> @@ -706,10 +711,10 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>>   		      DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE, drm_crtc_get_sequence_ioctl, 0),
>>   	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE, drm_crtc_queue_sequence_ioctl, 0),
>> -	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, DRM_MASTER),
>> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, 0),
>>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
>>   	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
>> -	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
>> +	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, 0),
>>   };
>>   
>>   #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE( drm_ioctls )
>> @@ -776,6 +781,9 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>>   	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
>>   		mutex_lock(&drm_global_mutex);
>>   
>> +	if (unlikely(flags & DRM_MASTER))
>> +		down_read(&dev->master_rwsem);
>> +
>>   	retcode = drm_ioctl_permit(flags, file_priv);
>>   	if (unlikely(retcode))
>>   		goto out;
>> @@ -783,6 +791,8 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>>   	retcode = func(dev, kdata, file_priv);
>>   
>>   out:
>> +	if (unlikely(flags & DRM_MASTER))
>> +		up_read(&dev->master_rwsem);
>>   	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) && !(flags & DRM_UNLOCKED))
>>   		mutex_unlock(&drm_global_mutex);
>>   	return retcode;
>> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
>> index dee4f24a1808..bed6f7636cbe 100644
>> --- a/drivers/gpu/drm/drm_lease.c
>> +++ b/drivers/gpu/drm/drm_lease.c
>> @@ -500,6 +500,18 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   		return -EINVAL;
>>   	}
>>   
>> +	/* Clone the lessor file to create a new file for us */
>> +	DRM_DEBUG_LEASE("Allocating lease file\n");
>> +	lessee_file = file_clone_open(lessor_file);
>> +	if (IS_ERR(lessee_file))
>> +		return PTR_ERR(lessee_file);
>> +
>> +	down_read(&dev->master_rwsem);
>> +	if (unlikely(!drm_is_current_master(lessor_priv))) {
>> +		ret = -EACCES;
>> +		goto out_file;
>> +	}
>> +
>>   	lessor = drm_file_get_master(lessor_priv);
>>   	/* Do not allow sub-leases */
>>   	if (lessor->lessor) {
>> @@ -547,14 +559,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   		goto out_leases;
>>   	}
>>   
>> -	/* Clone the lessor file to create a new file for us */
>> -	DRM_DEBUG_LEASE("Allocating lease file\n");
>> -	lessee_file = file_clone_open(lessor_file);
>> -	if (IS_ERR(lessee_file)) {
>> -		ret = PTR_ERR(lessee_file);
>> -		goto out_lessee;
>> -	}
>> -
>>   	lessee_priv = lessee_file->private_data;
>>   	/* Change the file to a master one */
>>   	drm_master_put(&lessee_priv->master);
>> @@ -571,17 +575,19 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   	fd_install(fd, lessee_file);
>>   
>>   	drm_master_put(&lessor);
> 
> Hm if we're unlucky this might be the last reference (against nasty
> userspace only), and that could then perhaps collide with us still holding
> the lock. It looks like we're fine, the only thing that drm_master_put
> might be locking is
> 
> 	mutex_lock(&dev->mode_config.idr_mutex);
> 
> through drm_lease_destroy(). We don't care about legacy drivers and hence
> the dev->struct_mutex (plus that lock is a complete mess anyway).
> 
> Maybe another patch to add a might_lock to drm_master_put, just to be
> safe?
> 

Sounds good.

I agree that we should be safe for now, since we're taking efforts to 
make master_rwsem an outer lock, especially after we take your later 
suggestion to remove the lock from drm_file_get_master and 
drm_is_current_master.

>> +	up_read(&dev->master_rwsem);
>>   	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
>>   	return 0;
>>   
>> -out_lessee:
>> -	drm_master_put(&lessee);
>> -
>>   out_leases:
>>   	put_unused_fd(fd);
>>   
>>   out_lessor:
>>   	drm_master_put(&lessor);
>> +
>> +out_file:
>> +	up_read(&dev->master_rwsem);
>> +	fput(lessee_file);
>>   	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
>>   	return ret;
>>   }
>> @@ -705,6 +711,11 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>   
>> +	down_write(&dev->master_rwsem);
>> +	if (unlikely(!drm_is_current_master(lessor_priv))) {
>> +		ret = -EACCES;
>> +		goto unlock;
>> +	}
>>   	lessor = drm_file_get_master(lessor_priv);
>>   	mutex_lock(&dev->mode_config.idr_mutex);
>>   
>> @@ -728,5 +739,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>>   	mutex_unlock(&dev->mode_config.idr_mutex);
>>   	drm_master_put(&lessor);
>>   
>> +unlock:
>> +	up_write(&dev->master_rwsem);
>>   	return ret;
>>   }
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 142fb2f6e74d..7d32bb69e6db 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -151,6 +151,11 @@ struct drm_device {
>>   	 * Lock for &drm_device.master, &drm_file.was_master,
>>   	 * &drm_file.is_master, &drm_file.master, &drm_master.unique,
>>   	 * &drm_master.unique_len, and &drm_master.magic_map.
>> +	 *
>> +	 * Additionally, synchronizes modesetting rights between multiple users.
> 
> Current modern drives only use this for modesetting rights, but this is
> about anything which is exclusively owned by the drm_master. So maybe
> reword to "synchronizes access rights to exclusive resources like
> modesetting access".
> 

Right, will do.

> With that clarified:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> The other suggestions are for follow-up patches, if you feel like.
> -Daniel
> 
>> +	 * Users that can change the modeset or display state must hold a read
>> +	 * lock on @master_rwsem, and users that change modesetting rights
>> +	 * should hold a write lock.
>>   	 */
>>   	struct rw_semaphore master_rwsem;
>>   
>> -- 
>> 2.25.1
>>
> 

