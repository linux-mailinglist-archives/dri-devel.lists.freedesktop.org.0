Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B061B3B1279
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 05:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721F46E84D;
	Wed, 23 Jun 2021 03:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0E56E0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 03:49:05 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id h1so453779plt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 20:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yfvte9hUyFiYd2kHj7QDXnx/sjIUlGw0CWZs9V2GBVg=;
 b=dW67Dovp+hE3G/daqpHOocO9ySLua0BW/6bKax3Uf/E54F4pFqZ0SctPDx4465Shk8
 75MyNdgAdIdPz5uaoIOhyMPFIMX1/TSLVbIsJuIuJY9bPoq4n98w8dEJFUEpX0z2ay2l
 ls4adNqzQNnYWAHXgE3SF5x58TmUK8uHnhqN4CiEqUcOYXTEWBpo6wQoa2WfFTnIeRTb
 /pecruYEb4RSRHwZ4dfG8AiYzdpWmPCe+1dwHjAlbIyYZyFe1jWlpeReaeMKRei+PHTX
 KLle+PUGyZAQ5BBWs9AKO+Xe2k9HGT0kiRwEgIqgOjt2rlL21JlBgS5xOnk8wOnkm9Gb
 n7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yfvte9hUyFiYd2kHj7QDXnx/sjIUlGw0CWZs9V2GBVg=;
 b=NXHI+mCfFJ7INra9XXYYaVz2RkVuLzvujaJyOdbwInnuRqH8GNDRRl8iPBSTANOSU0
 k5MhxLErDTasOjsCdsvhw+8g1wJD+6dd4a7H/7Bl7LfvbQZbmQ0fp9gjv/5zIpHIAR/j
 xBXONoBkBLDsBk+xWq5Cbk/yDHfVzCOCqWBh8udZrg4WoJ+/u8z/8Lov9Faa8bn+vpS6
 6WBkqXV3JlXgHacU2wAIb2O7c4ZXNC4dKdiuAI0pBMZc3w1JzgQ6EtfiRkLfeSYxH7As
 GRmcagndQlEb+d1YwM7zfhRM9YVZ0T9gRW+dymzUoHhkpT3ivQKctXCazDINjz6QQ6ra
 9M3A==
X-Gm-Message-State: AOAM533ezafYalUjHdFY12xcN8jZEwN9cRvqAOvBIHbP1KjnRIL26APd
 MlNurkgaC5Lpf9GGMNJVCxc=
X-Google-Smtp-Source: ABdhPJwVU6CpyZ4WfXIDA0T+Y3zaemsNoM/s5kPzIK7FW0fs3+2iwdoyiEJw50HCJ8nDpGvPkbxBXw==
X-Received: by 2002:a17:90a:5d16:: with SMTP id
 s22mr7294045pji.48.1624420145213; 
 Tue, 22 Jun 2021 20:49:05 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 81sm13142274pgg.85.2021.06.22.20.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 20:49:04 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] drm: protect drm_master pointers in drm_lease.c
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 emil.l.velikov@gmail.com
References: <20210620110327.4964-1-desmondcheongzx@gmail.com>
 <20210620110327.4964-3-desmondcheongzx@gmail.com>
 <YNCmeYdY8giE8M9b@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <99ee7966-09da-3942-0afe-ee1f185620d6@gmail.com>
Date: Wed, 23 Jun 2021 11:48:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNCmeYdY8giE8M9b@phenom.ffwll.local>
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

On 21/6/21 10:47 pm, Daniel Vetter wrote:
> On Sun, Jun 20, 2021 at 07:03:27PM +0800, Desmond Cheong Zhi Xi wrote:
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 86d4b72e95cb..0c64a77c67a6 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -384,6 +384,28 @@ struct drm_master *drm_master_get(struct drm_master *master)
>>   }
>>   EXPORT_SYMBOL(drm_master_get);
>>   
>> +/**
>> + * drm_file_get_master - reference @file_priv->master
>> + * @file_priv: DRM file private
>> + *
>> + * Increments the reference count of @file_priv->master and returns
> 
> Does this format correctly? I'd go with "&drm_file.master of @file_priv".
> 

Got it. "file_priv->master" was bolded, but no link to drm_file.master 
was generated. I'll update this.

>> + * @file_priv->master.
>> + *
>> + * Master pointers returned from this function should be unreferenced using
>> + * drm_master_put().
>> + */
>> +struct drm_master *drm_file_get_master(struct drm_file *file_priv)
>> +{
>> +	struct drm_master *master;
>> +
>> +	mutex_lock(&file_priv->master->dev->master_mutex);
>> +	master = drm_master_get(file_priv->master);
>> +	mutex_unlock(&file_priv->master->dev->master_mutex);
>> +
>> +	return master;
>> +}
>> +EXPORT_SYMBOL(drm_file_get_master);
>> +
>>   static void drm_master_destroy(struct kref *kref)
>>   {
>>   	struct drm_master *master = container_of(kref, struct drm_master, refcount);
>> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
>> index da4f085fc09e..65eab82f8acc 100644
>> --- a/drivers/gpu/drm/drm_lease.c
>> +++ b/drivers/gpu/drm/drm_lease.c
>> @@ -107,10 +107,17 @@ static bool _drm_has_leased(struct drm_master *master, int id)
>>    */
>>   bool _drm_lease_held(struct drm_file *file_priv, int id)
>>   {
>> +	bool ret;
>> +	struct drm_master *master;
>> +
>>   	if (!file_priv || !file_priv->master)
> 
> So here we still have a ->master access outside of the locked code
> section. I think the best fix for that would be to move the NULL check
> into drm_file_get_master (where we grab the lock already anyway), and
> update the kerneldoc to state that it might return NULL.
> 
> Same with all the checks for ->master below.
> 

Moving the check into drm_file_get_master sounds good. Grabbing the lock 
before performing the NULL check poses a little chicken-and-egg problem 
though.

It's true that without the lock, even if file_priv->master passes the 
NULL check, it could be freed in the time between the check and grabbing 
the lock.

However, based on the original code, it seems there's the possibility 
that file_priv->master might be NULL. In this case, grabbing the lock 
results in a null ptr dereference because we get the mutex via 
&file_priv->master->dev->master_mutex.

By this reasoning, I think the safer method is still to perform the NULL 
check before grabbing the lock.

>>   		return true;
>>   
>> -	return _drm_lease_held_master(file_priv->master, id);
>> +	master = drm_file_get_master(file_priv);
>> +	ret = _drm_lease_held_master(master, id);
>> +	drm_master_put(&master);
>> +
>> +	return ret;
>>   }
>>   
>>   /**
>> @@ -132,10 +139,11 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
>>   	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
>>   		return true;
> 
> master->lessor dereferenced outside the lock or without holding a
> reference.
> 
>>   
>> -	master = file_priv->master;
>> +	master = drm_file_get_master(file_priv);
>>   	mutex_lock(&master->dev->mode_config.idr_mutex);
>>   	ret = _drm_lease_held_master(master, id);
>>   	mutex_unlock(&master->dev->mode_config.idr_mutex);
>> +	drm_master_put(&master);
>>   	return ret;
>>   }
>>   
>> @@ -158,7 +166,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>>   	if (!file_priv || !file_priv->master || !file_priv->master->lessor)
>>   		return crtcs_in;
> 
> Same here.
> 
>>   
>> -	master = file_priv->master;
>> +	master = drm_file_get_master(file_priv);
>>   	dev = master->dev;
>>   
>>   	count_in = count_out = 0;
>> @@ -177,6 +185,7 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>>   		count_in++;
>>   	}
>>   	mutex_unlock(&master->dev->mode_config.idr_mutex);
>> +	drm_master_put(&master);
>>   	return crtcs_out;
>>   }
>>   
>> @@ -490,7 +499,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   	size_t object_count;
>>   	int ret = 0;
>>   	struct idr leases;
>> -	struct drm_master *lessor = lessor_priv->master;
>> +	struct drm_master *lessor;
>>   	struct drm_master *lessee = NULL;
>>   	struct file *lessee_file = NULL;
>>   	struct file *lessor_file = lessor_priv->filp;
>> @@ -502,12 +511,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>   
>> -	/* Do not allow sub-leases */
>> -	if (lessor->lessor) {
>> -		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
>> -		return -EINVAL;
>> -	}
>> -
>>   	/* need some objects */
>>   	if (cl->object_count == 0) {
>>   		DRM_DEBUG_LEASE("no objects in lease\n");
>> @@ -519,12 +522,22 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   		return -EINVAL;
>>   	}
>>   
>> +	lessor = drm_file_get_master(lessor_priv);
>> +	/* Do not allow sub-leases */
>> +	if (lessor->lessor) {
> 
> Here we check after grabbing the reference, so looks correct.
> 
>> +		DRM_DEBUG_LEASE("recursive leasing not allowed\n");
>> +		ret = -EINVAL;
>> +		goto out_lessor;
>> +	}
>> +
>>   	object_count = cl->object_count;
>>   
>>   	object_ids = memdup_user(u64_to_user_ptr(cl->object_ids),
>>   			array_size(object_count, sizeof(__u32)));
>> -	if (IS_ERR(object_ids))
>> -		return PTR_ERR(object_ids);
>> +	if (IS_ERR(object_ids)) {
>> +		ret = PTR_ERR(object_ids);
>> +		goto out_lessor;
>> +	}
>>   
>>   	idr_init(&leases);
>>   
>> @@ -535,14 +548,15 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   	if (ret) {
>>   		DRM_DEBUG_LEASE("lease object lookup failed: %i\n", ret);
>>   		idr_destroy(&leases);
>> -		return ret;
>> +		goto out_lessor;
>>   	}
>>   
>>   	/* Allocate a file descriptor for the lease */
>>   	fd = get_unused_fd_flags(cl->flags & (O_CLOEXEC | O_NONBLOCK));
>>   	if (fd < 0) {
>>   		idr_destroy(&leases);
>> -		return fd;
>> +		ret = fd;
>> +		goto out_lessor;
>>   	}
>>   
>>   	DRM_DEBUG_LEASE("Creating lease\n");
>> @@ -578,6 +592,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   	/* Hook up the fd */
>>   	fd_install(fd, lessee_file);
>>   
>> +	drm_master_put(&lessor);
>>   	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
>>   	return 0;
>>   
>> @@ -587,6 +602,8 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>   out_leases:
>>   	put_unused_fd(fd);
>>   
>> +out_lessor:
>> +	drm_master_put(&lessor);
>>   	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
>>   	return ret;
>>   }
>> @@ -609,7 +626,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>>   	struct drm_mode_list_lessees *arg = data;
>>   	__u32 __user *lessee_ids = (__u32 __user *) (uintptr_t) (arg->lessees_ptr);
>>   	__u32 count_lessees = arg->count_lessees;
>> -	struct drm_master *lessor = lessor_priv->master, *lessee;
>> +	struct drm_master *lessor, *lessee;
>>   	int count;
>>   	int ret = 0;
>>   
>> @@ -620,6 +637,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>   
>> +	lessor = drm_file_get_master(lessor_priv);
>>   	DRM_DEBUG_LEASE("List lessees for %d\n", lessor->lessee_id);
>>   
>>   	mutex_lock(&dev->mode_config.idr_mutex);
>> @@ -643,6 +661,7 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>>   		arg->count_lessees = count;
>>   
>>   	mutex_unlock(&dev->mode_config.idr_mutex);
>> +	drm_master_put(&lessor);
>>   
>>   	return ret;
>>   }
>> @@ -662,7 +681,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>>   	struct drm_mode_get_lease *arg = data;
>>   	__u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
>>   	__u32 count_objects = arg->count_objects;
>> -	struct drm_master *lessee = lessee_priv->master;
>> +	struct drm_master *lessee;
>>   	struct idr *object_idr;
>>   	int count;
>>   	void *entry;
>> @@ -676,6 +695,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>   
>> +	lessee = drm_file_get_master(lessee_priv);
>>   	DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
>>   
>>   	mutex_lock(&dev->mode_config.idr_mutex);
>> @@ -703,6 +723,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>>   		arg->count_objects = count;
>>   
>>   	mutex_unlock(&dev->mode_config.idr_mutex);
>> +	drm_master_put(&lessee);
>>   
>>   	return ret;
>>   }
>> @@ -721,7 +742,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>>   				void *data, struct drm_file *lessor_priv)
>>   {
>>   	struct drm_mode_revoke_lease *arg = data;
>> -	struct drm_master *lessor = lessor_priv->master;
>> +	struct drm_master *lessor;
>>   	struct drm_master *lessee;
>>   	int ret = 0;
>>   
>> @@ -731,6 +752,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>   
>> +	lessor = drm_file_get_master(lessor_priv);
>>   	mutex_lock(&dev->mode_config.idr_mutex);
>>   
>>   	lessee = _drm_find_lessee(lessor, arg->lessee_id);
>> @@ -751,6 +773,7 @@ int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>>   
>>   fail:
>>   	mutex_unlock(&dev->mode_config.idr_mutex);
>> +	drm_master_put(&lessor);
>>   
>>   	return ret;
>>   }
>> diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
>> index 6bf8b2b78991..f99d3417f304 100644
>> --- a/include/drm/drm_auth.h
>> +++ b/include/drm/drm_auth.h
>> @@ -107,6 +107,7 @@ struct drm_master {
>>   };
>>   
>>   struct drm_master *drm_master_get(struct drm_master *master);
>> +struct drm_master *drm_file_get_master(struct drm_file *file_priv);
>>   void drm_master_put(struct drm_master **master);
>>   bool drm_is_current_master(struct drm_file *fpriv);
>>   
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index b81b3bfb08c8..e9931fca4ab7 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -226,9 +226,18 @@ struct drm_file {
>>   	/**
>>   	 * @master:
>>   	 *
>> -	 * Master this node is currently associated with. Only relevant if
>> -	 * drm_is_primary_client() returns true. Note that this only
>> -	 * matches &drm_device.master if the master is the currently active one.
>> +	 * Master this node is currently associated with. Protected by struct
>> +	 * &drm_device.master_mutex.
>> +	 *
>> +	 * Only relevant if drm_is_primary_client() returns true. Note that
>> +	 * this only matches &drm_device.master if the master is the currently
>> +	 * active one.
>> +	 *
>> +	 * When obtaining a copy of this pointer, it is recommended to either
>> +	 * hold struct &drm_device.master_mutex for the duration of the
>> +	 * pointer's use, or to use drm_file_get_master() if struct
>> +	 * &drm_device.master_mutex is not currently held and there is no other
>> +	 * need to hold it. This prevents @master from being freed during use.
>>   	 *
>>   	 * See also @authentication and @is_master and the :ref:`section on
>>   	 * primary nodes and authentication <drm_primary_node>`.
>> -- 
>> 2.25.1
>>
> 

Thanks for the feedback, Daniel. I'll send out an updated patch to 
address these issues.

Best wishes,
Desmond
