Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B8C3F1789
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 12:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FE66E8A9;
	Thu, 19 Aug 2021 10:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842AA6E5C3;
 Thu, 19 Aug 2021 10:53:04 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 7so5109298pfl.10;
 Thu, 19 Aug 2021 03:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=klQKJuKtroBB/TzjblUgbB4PEvAXZGfL+U8FouBr76U=;
 b=OoLs9ULd5fTyE/pzGHJQq63LFllhPcEhUtJJlPs9sFFbzsWPzz39/re3OEMYRVDqGF
 246Iz9ggskzzkGrLs8BKnxotnFGWdrBVTQkvGo1DvhYB7j3BJnATXBNIVO4T/4t4yPcV
 40Qq8yR+3Mwt5Rp+m1xxVX+aI2E4jqxC8seZAbgVmB0dFCZUAd3AdEdOTL+zQqGvlf95
 QrtPe8XExxo/xZ4fbVMzGEXgcdtcgv49l5zqs+usS6vjUS+1Too4KA91QC35KWKZYC6+
 UxtE5Nv7DukwplY2BWazDA8o2KeDt9M5IzQV41394Q8JXbbeUJJ247cw27wS5ysahUlf
 sD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=klQKJuKtroBB/TzjblUgbB4PEvAXZGfL+U8FouBr76U=;
 b=ibM/4wE6xbPtMpKK0ZCf3vYL9pprmOJRwvQzmhzzS2PKWTrPp1dvze3jyVlY4Bvr73
 qEhWSQEgRgIl5NemS9O09vLQ22AugSo0/v/FDxgyeMe9tV93CI2lkrOq0uARpNH1xWiL
 l5idkof9aVTsomDZLnxztAPJQHHzbLiUCI2wUUxuq07oAOcR1Syj5QLwGWXU40Ck9ikz
 KicAd/aS/6TalcwNxTEISL25TrWGJbYNZJfIPaX6AqzT1B7I9lc38rix2HSNGDL9Uu+G
 OYKrkMUDbQkdQ6jFIKXKSInmCJtvXKRpOgx3r/mrVMTft4iLGxAA75difbsPHBE+afud
 CbZQ==
X-Gm-Message-State: AOAM532wqjAiATOk0cGNg2OlwkRyzdGF4QcLlVijsPFT5Ysiwcf7nLvr
 33XrPVNiG1+dvqiZ7fcwXI4=
X-Google-Smtp-Source: ABdhPJw8JerPM5elBpZi6KrJWQUBEvPDY27NKWeahsRXP0nM46ikD9qsIkMIvF0f7z7FJs8rhxvVmw==
X-Received: by 2002:a63:111d:: with SMTP id g29mr13570542pgl.222.1629370383873; 
 Thu, 19 Aug 2021 03:53:03 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n12sm3751491pgr.2.2021.08.19.03.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 03:53:03 -0700 (PDT)
Subject: Re: [PATCH v3 7/9] drm: update global mutex lock in the ioctl handler
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-8-desmondcheongzx@gmail.com>
 <YRzo4PJ/XRS3O199@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <874c94a4-1c33-c83a-ac3a-04b761013d40@gmail.com>
Date: Thu, 19 Aug 2021 18:52:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRzo4PJ/XRS3O199@phenom.ffwll.local>
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

On 18/8/21 7:02 pm, Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 03:38:22PM +0800, Desmond Cheong Zhi Xi wrote:
>> In a future patch, a read lock on drm_device.master_rwsem is
>> held in the ioctl handler before the check for ioctl
>> permissions. However, this produces the following lockdep splat:
>>
>> ======================================================
>> WARNING: possible circular locking dependency detected
>> 5.14.0-rc6-CI-Patchwork_20831+ #1 Tainted: G     U
>> ------------------------------------------------------
>> kms_lease/1752 is trying to acquire lock:
>> ffffffff827bad88 (drm_global_mutex){+.+.}-{3:3}, at: drm_open+0x64/0x280
>>
>> but task is already holding lock:
>> ffff88812e350108 (&dev->master_rwsem){++++}-{3:3}, at:
>> drm_ioctl_kernel+0xfb/0x1a0
>>
>> which lock already depends on the new lock.
>>
>> the existing dependency chain (in reverse order) is:
>>
>> -> #2 (&dev->master_rwsem){++++}-{3:3}:
>>         lock_acquire+0xd3/0x310
>>         down_read+0x3b/0x140
>>         drm_master_internal_acquire+0x1d/0x60
>>         drm_client_modeset_commit+0x10/0x40
>>         __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xb0
>>         drm_fb_helper_set_par+0x34/0x40
>>         intel_fbdev_set_par+0x11/0x40 [i915]
>>         fbcon_init+0x270/0x4f0
>>         visual_init+0xc6/0x130
>>         do_bind_con_driver+0x1de/0x2c0
>>         do_take_over_console+0x10e/0x180
>>         do_fbcon_takeover+0x53/0xb0
>>         register_framebuffer+0x22d/0x310
>>         __drm_fb_helper_initial_config_and_unlock+0x36c/0x540
>>         intel_fbdev_initial_config+0xf/0x20 [i915]
>>         async_run_entry_fn+0x28/0x130
>>         process_one_work+0x26d/0x5c0
>>         worker_thread+0x37/0x390
>>         kthread+0x13b/0x170
>>         ret_from_fork+0x1f/0x30
>>
>> -> #1 (&helper->lock){+.+.}-{3:3}:
>>         lock_acquire+0xd3/0x310
>>         __mutex_lock+0xa8/0x930
>>         __drm_fb_helper_restore_fbdev_mode_unlocked+0x44/0xb0
>>         intel_fbdev_restore_mode+0x2b/0x50 [i915]
>>         drm_lastclose+0x27/0x50
>>         drm_release_noglobal+0x42/0x60
>>         __fput+0x9e/0x250
>>         task_work_run+0x6b/0xb0
>>         exit_to_user_mode_prepare+0x1c5/0x1d0
>>         syscall_exit_to_user_mode+0x19/0x50
>>         do_syscall_64+0x46/0xb0
>>         entry_SYSCALL_64_after_hwframe+0x44/0xae
>>
>> -> #0 (drm_global_mutex){+.+.}-{3:3}:
>>         validate_chain+0xb39/0x1e70
>>         __lock_acquire+0x5a1/0xb70
>>         lock_acquire+0xd3/0x310
>>         __mutex_lock+0xa8/0x930
>>         drm_open+0x64/0x280
>>         drm_stub_open+0x9f/0x100
>>         chrdev_open+0x9f/0x1d0
>>         do_dentry_open+0x14a/0x3a0
>>         dentry_open+0x53/0x70
>>         drm_mode_create_lease_ioctl+0x3cb/0x970
>>         drm_ioctl_kernel+0xc9/0x1a0
>>         drm_ioctl+0x201/0x3d0
>>         __x64_sys_ioctl+0x6a/0xa0
>>         do_syscall_64+0x37/0xb0
>>         entry_SYSCALL_64_after_hwframe+0x44/0xae
>>
>> other info that might help us debug this:
>> Chain exists of:
>>    drm_global_mutex --> &helper->lock --> &dev->master_rwsem
>>   Possible unsafe locking scenario:
>>         CPU0                    CPU1
>>         ----                    ----
>>    lock(&dev->master_rwsem);
>>                                 lock(&helper->lock);
>>                                 lock(&dev->master_rwsem);
>>    lock(drm_global_mutex);
>>
>>   *** DEADLOCK ***
>>
>> The lock hierarchy inversion happens because we grab the
>> drm_global_mutex while already holding on to master_rwsem. To avoid
>> this, we do some prep work to grab the drm_global_mutex before
>> checking for ioctl permissions.
>>
>> At the same time, we update the check for the global mutex to use the
>> drm_dev_needs_global_mutex helper function.
> 
> This is intentional, essentially we force all non-legacy drivers to have
> unlocked ioctl (otherwise everyone forgets to set that flag).
> 
> For non-legacy drivers the global lock only ensures ordering between
> drm_open and lastclose (I think at least), and between
> drm_dev_register/unregister and the backwards ->load/unload callbacks
> (which are called in the wrong place, but we cannot fix that for legacy
> drivers).
> 
> ->load/unload should be completely unused (maybe radeon still uses it),
> and ->lastclose is also on the decline.
> 

Ah ok got it, I'll change the check back to
drm_core_check_feature(dev, DRIVER_LEGACY) then.

> Maybe we should update the comment of drm_global_mutex to explain what it
> protects and why.
> 

The comments in drm_dev_needs_global_mutex make sense I think, I just
didn't read the code closely enough.

> I'm also confused how this patch connects to the splat, since for i915 we

Right, my bad, this is a separate instance of circular locking. I was
too hasty when I saw that for legacy drivers we might grab master_rwsem
then drm_global_mutex in the ioctl handler.

> shouldn't be taking the drm_global_lock here at all. The problem seems to
> be the drm_open_helper when we create a new lease, which is an entirely
> different can of worms.
> 
> I'm honestly not sure how to best do that, but we should be able to create
> a file and then call drm_open_helper directly, or well a version of that
> which never takes the drm_global_mutex. Because that is not needed for
> nested drm_file opening:
> - legacy drivers never go down this path because leases are only supported
>    with modesetting, and modesetting is only supported for non-legacy
>    drivers
> - the races against dev->open_count due to last_close or ->load callbacks
>    don't matter, because for the entire ioctl we already have an open
>    drm_file and that wont disappear.
> 
> So this should work, but I'm not entirely sure how to make it work.
> -Daniel
> 

One idea that comes to mind is to change the outcome of
drm_dev_needs_global_mutex while we're in the ioctl, but that requires
more locking which sounds like a bad idea.

Another idea, which is quite messy, but just for thoughts, uses the idea
of pushing the master_rwsem read lock down:

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 7f523e1c5650..5d05e744b728 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -712,7 +712,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
  		      DRM_RENDER_ALLOW),
  	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE, drm_crtc_get_sequence_ioctl, 0),
  	DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE, drm_crtc_queue_sequence_ioctl, 0),
-	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_mode_create_lease_ioctl, 0),
  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 983701198ffd..a25bc69522b4 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -500,6 +500,19 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
  		return -EINVAL;
  	}
  
+	/* Clone the lessor file to create a new file for us */
+	DRM_DEBUG_LEASE("Allocating lease file\n");
+	lessee_file = file_clone_open(lessor_file);
+	if (IS_ERR(lessee_file))
+		return PTR_ERR(lessee_file);
+
+	down_read(&dev->master_rwsem);
+
+	if (!drm_is_current_master(lessor_priv)) {
+		ret = -EACCES;
+		goto out_file;
+	}
+
  	lessor = drm_file_get_master(lessor_priv);
  	/* Do not allow sub-leases */
  	if (lessor->lessor) {
@@ -547,14 +560,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
  		goto out_leases;
  	}
  
-	/* Clone the lessor file to create a new file for us */
-	DRM_DEBUG_LEASE("Allocating lease file\n");
-	lessee_file = file_clone_open(lessor_file);
-	if (IS_ERR(lessee_file)) {
-		ret = PTR_ERR(lessee_file);
-		goto out_lessee;
-	}
-
  	lessee_priv = lessee_file->private_data;
  	/* Change the file to a master one */
  	drm_master_put(&lessee_priv->master);
@@ -571,17 +576,19 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
  	fd_install(fd, lessee_file);
  
  	drm_master_put(&lessor);
+	up_read(&dev->master_rwsem);
  	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl succeeded\n");
  	return 0;
  
-out_lessee:
-	drm_master_put(&lessee);
-
  out_leases:
  	put_unused_fd(fd);
  
  out_lessor:
  	drm_master_put(&lessor);
+
+out_file:
+	up_read(&dev->master_rwsem);
+	fput(lessee_file);
  	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
  	return ret;
  }


Something like this would also address the other deadlock we'd hit in
drm_mode_create_lease_ioctl():

   drm_ioctl_kernel():
     down_read(&master_rwsem);               <--- down_read()
     drm_mode_create_lease_ioctl():
       drm_lease_create():
         file_clone_open():
           ...
           drm_open():
             drm_open_helper():
               drm_master_open():
                 down_write(&master_rwsem);  <--- down_write()

Overall, I think the suggestion to push master_rwsem write locks down
into ioctls would solve the nesting problem for those ioctls.

Although I'm still a little concerned that, just like here, there might
be deeply embedded nested locking, so locking becomes prone to breaking.
It does smell a bit to me.

>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index 880fc565d599..2cb57378a787 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -779,19 +779,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>>   	if (drm_dev_is_unplugged(dev))
>>   		return -ENODEV;
>>   
>> +	/* Enforce sane locking for modern driver ioctls. */
>> +	if (unlikely(drm_dev_needs_global_mutex(dev)) && !(flags & DRM_UNLOCKED))
>> +		mutex_lock(&drm_global_mutex);
>> +
>>   	retcode = drm_ioctl_permit(flags, file_priv);
>>   	if (unlikely(retcode))
>> -		return retcode;
>> +		goto out;
>>   
>> -	/* Enforce sane locking for modern driver ioctls. */
>> -	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
>> -	    (flags & DRM_UNLOCKED))
>> -		retcode = func(dev, kdata, file_priv);
>> -	else {
>> -		mutex_lock(&drm_global_mutex);
>> -		retcode = func(dev, kdata, file_priv);
>> +	retcode = func(dev, kdata, file_priv);
>> +
>> +out:
>> +	if (unlikely(drm_dev_needs_global_mutex(dev)) && !(flags & DRM_UNLOCKED))
>>   		mutex_unlock(&drm_global_mutex);
>> -	}
>>   	return retcode;
>>   }
>>   EXPORT_SYMBOL(drm_ioctl_kernel);
>> -- 
>> 2.25.1
>>
> 

