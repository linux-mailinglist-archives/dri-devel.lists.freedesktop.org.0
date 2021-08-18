Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61923F022E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 13:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA758972D;
	Wed, 18 Aug 2021 11:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8968972D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 11:03:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso1508454wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=2sjTfuPxGbsqLbV8NLCOrMJD+qvx/G/qupD2ZV7R++Y=;
 b=D4gif8pNfkd0c3JiVPFheGhFrjTjleQ4BRUjS7UzQctM4aGHAgTWfvFORX9CQsvxxu
 piI5RMnIwDPSuhng5bpW8CBhxxyWK3fEkHYPWEqRQwTK020UukKCib0XmgR1IljJjJmP
 BcgV1QychM+PmwyuEdnXyn19LVkXZGzyPIeco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=2sjTfuPxGbsqLbV8NLCOrMJD+qvx/G/qupD2ZV7R++Y=;
 b=LO9AjzApGEHU2QzBDrnW212DeNFUaP5UiKUQ1FAMp8rm9QJhRqZs8NWL+YTl94vJnS
 V6SWq42V6yllCctnebjNbD1E4bKBwVQPg2dvcCQR7wHpsDX962/jakYG1rZM5i6mEZsb
 xGbNukqPBdbK/Vxj20rWA88eOmMFqE5qfhhD0u4Smyaj3ErgVEVP0HEtZQN6RgaEbsbf
 tr2OFXZux3KMLFXYR7q5vp0qMLSpYvCFVKG4BjVgK2oqh76VSP3pyEqyWvIu8K/hb6OM
 hsSAPYSM5oni60zqbNraS8BnhSJnga0NHeznnnuhvCJEH5N1T/TDwkerrpIeiSIdxQ68
 AVhQ==
X-Gm-Message-State: AOAM533UJHx7gd+wgMHjx0rilZ0sh0k6TuBuFF2s6sTfMHjzCLYr6y37
 SEb3mpLXr+gt7GNsWAXUkdWo3w==
X-Google-Smtp-Source: ABdhPJxCUFJJBYxikJCdrpc++2bZ2hE1XRCHoLl2LTWOHVG2OKNw0xOmqQIhIhGEEeMQeuvhn9jyQg==
X-Received: by 2002:a1c:a401:: with SMTP id n1mr7943318wme.74.1629284578938;
 Wed, 18 Aug 2021 04:02:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w11sm5569380wrr.48.2021.08.18.04.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 04:02:58 -0700 (PDT)
Date: Wed, 18 Aug 2021 13:02:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
 oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
 walter-zh.wu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3 7/9] drm: update global mutex lock in the ioctl handler
Message-ID: <YRzo4PJ/XRS3O199@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, axboe@kernel.dk, oleg@redhat.com,
 tglx@linutronix.de, dvyukov@google.com, walter-zh.wu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-8-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-8-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Wed, Aug 18, 2021 at 03:38:22PM +0800, Desmond Cheong Zhi Xi wrote:
> In a future patch, a read lock on drm_device.master_rwsem is
> held in the ioctl handler before the check for ioctl
> permissions. However, this produces the following lockdep splat:
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 5.14.0-rc6-CI-Patchwork_20831+ #1 Tainted: G     U
> ------------------------------------------------------
> kms_lease/1752 is trying to acquire lock:
> ffffffff827bad88 (drm_global_mutex){+.+.}-{3:3}, at: drm_open+0x64/0x280
> 
> but task is already holding lock:
> ffff88812e350108 (&dev->master_rwsem){++++}-{3:3}, at:
> drm_ioctl_kernel+0xfb/0x1a0
> 
> which lock already depends on the new lock.
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #2 (&dev->master_rwsem){++++}-{3:3}:
>        lock_acquire+0xd3/0x310
>        down_read+0x3b/0x140
>        drm_master_internal_acquire+0x1d/0x60
>        drm_client_modeset_commit+0x10/0x40
>        __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xb0
>        drm_fb_helper_set_par+0x34/0x40
>        intel_fbdev_set_par+0x11/0x40 [i915]
>        fbcon_init+0x270/0x4f0
>        visual_init+0xc6/0x130
>        do_bind_con_driver+0x1de/0x2c0
>        do_take_over_console+0x10e/0x180
>        do_fbcon_takeover+0x53/0xb0
>        register_framebuffer+0x22d/0x310
>        __drm_fb_helper_initial_config_and_unlock+0x36c/0x540
>        intel_fbdev_initial_config+0xf/0x20 [i915]
>        async_run_entry_fn+0x28/0x130
>        process_one_work+0x26d/0x5c0
>        worker_thread+0x37/0x390
>        kthread+0x13b/0x170
>        ret_from_fork+0x1f/0x30
> 
> -> #1 (&helper->lock){+.+.}-{3:3}:
>        lock_acquire+0xd3/0x310
>        __mutex_lock+0xa8/0x930
>        __drm_fb_helper_restore_fbdev_mode_unlocked+0x44/0xb0
>        intel_fbdev_restore_mode+0x2b/0x50 [i915]
>        drm_lastclose+0x27/0x50
>        drm_release_noglobal+0x42/0x60
>        __fput+0x9e/0x250
>        task_work_run+0x6b/0xb0
>        exit_to_user_mode_prepare+0x1c5/0x1d0
>        syscall_exit_to_user_mode+0x19/0x50
>        do_syscall_64+0x46/0xb0
>        entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> -> #0 (drm_global_mutex){+.+.}-{3:3}:
>        validate_chain+0xb39/0x1e70
>        __lock_acquire+0x5a1/0xb70
>        lock_acquire+0xd3/0x310
>        __mutex_lock+0xa8/0x930
>        drm_open+0x64/0x280
>        drm_stub_open+0x9f/0x100
>        chrdev_open+0x9f/0x1d0
>        do_dentry_open+0x14a/0x3a0
>        dentry_open+0x53/0x70
>        drm_mode_create_lease_ioctl+0x3cb/0x970
>        drm_ioctl_kernel+0xc9/0x1a0
>        drm_ioctl+0x201/0x3d0
>        __x64_sys_ioctl+0x6a/0xa0
>        do_syscall_64+0x37/0xb0
>        entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> other info that might help us debug this:
> Chain exists of:
>   drm_global_mutex --> &helper->lock --> &dev->master_rwsem
>  Possible unsafe locking scenario:
>        CPU0                    CPU1
>        ----                    ----
>   lock(&dev->master_rwsem);
>                                lock(&helper->lock);
>                                lock(&dev->master_rwsem);
>   lock(drm_global_mutex);
> 
>  *** DEADLOCK ***
> 
> The lock hierarchy inversion happens because we grab the
> drm_global_mutex while already holding on to master_rwsem. To avoid
> this, we do some prep work to grab the drm_global_mutex before
> checking for ioctl permissions.
> 
> At the same time, we update the check for the global mutex to use the
> drm_dev_needs_global_mutex helper function.

This is intentional, essentially we force all non-legacy drivers to have
unlocked ioctl (otherwise everyone forgets to set that flag).

For non-legacy drivers the global lock only ensures ordering between
drm_open and lastclose (I think at least), and between
drm_dev_register/unregister and the backwards ->load/unload callbacks
(which are called in the wrong place, but we cannot fix that for legacy
drivers).

->load/unload should be completely unused (maybe radeon still uses it),
and ->lastclose is also on the decline.

Maybe we should update the comment of drm_global_mutex to explain what it
protects and why.

I'm also confused how this patch connects to the splat, since for i915 we
shouldn't be taking the drm_global_lock here at all. The problem seems to
be the drm_open_helper when we create a new lease, which is an entirely
different can of worms.

I'm honestly not sure how to best do that, but we should be able to create
a file and then call drm_open_helper directly, or well a version of that
which never takes the drm_global_mutex. Because that is not needed for
nested drm_file opening:
- legacy drivers never go down this path because leases are only supported
  with modesetting, and modesetting is only supported for non-legacy
  drivers
- the races against dev->open_count due to last_close or ->load callbacks
  don't matter, because for the entire ioctl we already have an open
  drm_file and that wont disappear.

So this should work, but I'm not entirely sure how to make it work.
-Daniel

> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  drivers/gpu/drm/drm_ioctl.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 880fc565d599..2cb57378a787 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -779,19 +779,19 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>  	if (drm_dev_is_unplugged(dev))
>  		return -ENODEV;
>  
> +	/* Enforce sane locking for modern driver ioctls. */
> +	if (unlikely(drm_dev_needs_global_mutex(dev)) && !(flags & DRM_UNLOCKED))
> +		mutex_lock(&drm_global_mutex);
> +
>  	retcode = drm_ioctl_permit(flags, file_priv);
>  	if (unlikely(retcode))
> -		return retcode;
> +		goto out;
>  
> -	/* Enforce sane locking for modern driver ioctls. */
> -	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
> -	    (flags & DRM_UNLOCKED))
> -		retcode = func(dev, kdata, file_priv);
> -	else {
> -		mutex_lock(&drm_global_mutex);
> -		retcode = func(dev, kdata, file_priv);
> +	retcode = func(dev, kdata, file_priv);
> +
> +out:
> +	if (unlikely(drm_dev_needs_global_mutex(dev)) && !(flags & DRM_UNLOCKED))
>  		mutex_unlock(&drm_global_mutex);
> -	}
>  	return retcode;
>  }
>  EXPORT_SYMBOL(drm_ioctl_kernel);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
