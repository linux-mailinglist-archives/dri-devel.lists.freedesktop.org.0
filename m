Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A583AFF3A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 10:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146446E428;
	Tue, 22 Jun 2021 08:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887316E428;
 Tue, 22 Jun 2021 08:26:55 +0000 (UTC)
IronPort-SDR: q6O9IGOHCqvnLmmzkWYtBzkqnTn70pJhnQNuo2ROA9WDsjC7z1lkDi32d2R9C7HutavBV0yHP/
 nlmM3OhX/XNQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="270856164"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="270856164"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 01:26:53 -0700
IronPort-SDR: wUnXFM1LGLFqB8SRY3cPKYA3n4m8lfbcuPcvDbqryqHx7+s+J5ZbibasUdcmPG6SwGxwZ7TeNV
 JvKjJkhN383g==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="555710767"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 01:26:51 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lvbm7-0006fF-Uv; Tue, 22 Jun 2021 11:28:51 +0300
Date: Tue, 22 Jun 2021 11:28:51 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] Revert "drm: add a locked version of
 drm_is_current_master"
Message-ID: <YNGfQ5GD+4qTyG1S@platvala-desk.ger.corp.intel.com>
References: <20210622075409.2673805-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622075409.2673805-1-daniel.vetter@ffwll.ch>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 09:54:09AM +0200, Daniel Vetter wrote:
> This reverts commit 1815d9c86e3090477fbde066ff314a7e9721ee0f.
> 
> Unfortunately this inverts the locking hierarchy, so back to the
> drawing board. Full lockdep splat below:
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 5.13.0-rc7-CI-CI_DRM_10254+ #1 Not tainted
> ------------------------------------------------------
> kms_frontbuffer/1087 is trying to acquire lock:
> ffff88810dcd01a8 (&dev->master_mutex){+.+.}-{3:3}, at: drm_is_current_master+0x1b/0x40
> but task is already holding lock:
> ffff88810dcd0488 (&dev->mode_config.mutex){+.+.}-{3:3}, at: drm_mode_getconnector+0x1c6/0x4a0
> which lock already depends on the new lock.
> the existing dependency chain (in reverse order) is:
> -> #2 (&dev->mode_config.mutex){+.+.}-{3:3}:
>        __mutex_lock+0xab/0x970
>        drm_client_modeset_probe+0x22e/0xca0
>        __drm_fb_helper_initial_config_and_unlock+0x42/0x540
>        intel_fbdev_initial_config+0xf/0x20 [i915]
>        async_run_entry_fn+0x28/0x130
>        process_one_work+0x26d/0x5c0
>        worker_thread+0x37/0x380
>        kthread+0x144/0x170
>        ret_from_fork+0x1f/0x30
> -> #1 (&client->modeset_mutex){+.+.}-{3:3}:
>        __mutex_lock+0xab/0x970
>        drm_client_modeset_commit_locked+0x1c/0x180
>        drm_client_modeset_commit+0x1c/0x40
>        __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xb0
>        drm_fb_helper_set_par+0x34/0x40
>        intel_fbdev_set_par+0x11/0x40 [i915]
>        fbcon_init+0x270/0x4f0
>        visual_init+0xc6/0x130
>        do_bind_con_driver+0x1e5/0x2d0
>        do_take_over_console+0x10e/0x180
>        do_fbcon_takeover+0x53/0xb0
>        register_framebuffer+0x22d/0x310
>        __drm_fb_helper_initial_config_and_unlock+0x36c/0x540
>        intel_fbdev_initial_config+0xf/0x20 [i915]
>        async_run_entry_fn+0x28/0x130
>        process_one_work+0x26d/0x5c0
>        worker_thread+0x37/0x380
>        kthread+0x144/0x170
>        ret_from_fork+0x1f/0x30
> -> #0 (&dev->master_mutex){+.+.}-{3:3}:
>        __lock_acquire+0x151e/0x2590
>        lock_acquire+0xd1/0x3d0
>        __mutex_lock+0xab/0x970
>        drm_is_current_master+0x1b/0x40
>        drm_mode_getconnector+0x37e/0x4a0
>        drm_ioctl_kernel+0xa8/0xf0
>        drm_ioctl+0x1e8/0x390
>        __x64_sys_ioctl+0x6a/0xa0
>        do_syscall_64+0x39/0xb0
>        entry_SYSCALL_64_after_hwframe+0x44/0xae
> other info that might help us debug this:
> Chain exists of: &dev->master_mutex --> &client->modeset_mutex --> &dev->mode_config.mutex
>  Possible unsafe locking scenario:
>        CPU0                    CPU1
>        ----                    ----
>   lock(&dev->mode_config.mutex);
>                                lock(&client->modeset_mutex);
>                                lock(&dev->mode_config.mutex);
>   lock(&dev->master_mutex);
> *** DEADLOCK ***
> 1 lock held by kms_frontbuffer/1087:
>  #0: ffff88810dcd0488 (&dev->mode_config.mutex){+.+.}-{3:3}, at: drm_mode_getconnector+0x1c6/0x4a0
> stack backtrace:
> CPU: 7 PID: 1087 Comm: kms_frontbuffer Not tainted 5.13.0-rc7-CI-CI_DRM_10254+ #1
> Hardware name: Intel Corporation Ice Lake Client Platform/IceLake U DDR4 SODIMM PD RVP TLC, BIOS ICLSFWR1.R00.3234.A01.1906141750 06/14/2019
> Call Trace:
>  dump_stack+0x7f/0xad
>  check_noncircular+0x12e/0x150
>  __lock_acquire+0x151e/0x2590
>  lock_acquire+0xd1/0x3d0
>  __mutex_lock+0xab/0x970
>  drm_is_current_master+0x1b/0x40
>  drm_mode_getconnector+0x37e/0x4a0
>  drm_ioctl_kernel+0xa8/0xf0
>  drm_ioctl+0x1e8/0x390
>  __x64_sys_ioctl+0x6a/0xa0
>  do_syscall_64+0x39/0xb0
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> daniel@phenom:~/linux/drm-misc-fixes$ dim fixes 1815d9c86e3090477fbde066ff314a7e9721ee0f
> Fixes: 1815d9c86e30 ("drm: add a locked version of drm_is_current_master")
> Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>


You have your "dim fixes" command line in the commit message.

This goes through Intel's CI shortly, if it agrees with this then

Testcase: igt/debugfs_test/read_all_entries
Acked-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  drivers/gpu/drm/drm_auth.c | 51 ++++++++++++++------------------------
>  1 file changed, 19 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 86d4b72e95cb..232abbba3686 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -61,35 +61,6 @@
>   * trusted clients.
>   */
>  
> -static bool drm_is_current_master_locked(struct drm_file *fpriv)
> -{
> -	lockdep_assert_held_once(&fpriv->master->dev->master_mutex);
> -
> -	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> -}
> -
> -/**
> - * drm_is_current_master - checks whether @priv is the current master
> - * @fpriv: DRM file private
> - *
> - * Checks whether @fpriv is current master on its device. This decides whether a
> - * client is allowed to run DRM_MASTER IOCTLs.
> - *
> - * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
> - * - the current master is assumed to own the non-shareable display hardware.
> - */
> -bool drm_is_current_master(struct drm_file *fpriv)
> -{
> -	bool ret;
> -
> -	mutex_lock(&fpriv->master->dev->master_mutex);
> -	ret = drm_is_current_master_locked(fpriv);
> -	mutex_unlock(&fpriv->master->dev->master_mutex);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_is_current_master);
> -
>  int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>  {
>  	struct drm_auth *auth = data;
> @@ -252,7 +223,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto out_unlock;
>  
> -	if (drm_is_current_master_locked(file_priv))
> +	if (drm_is_current_master(file_priv))
>  		goto out_unlock;
>  
>  	if (dev->master) {
> @@ -301,7 +272,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto out_unlock;
>  
> -	if (!drm_is_current_master_locked(file_priv)) {
> +	if (!drm_is_current_master(file_priv)) {
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}
> @@ -350,7 +321,7 @@ void drm_master_release(struct drm_file *file_priv)
>  	if (file_priv->magic)
>  		idr_remove(&file_priv->master->magic_map, file_priv->magic);
>  
> -	if (!drm_is_current_master_locked(file_priv))
> +	if (!drm_is_current_master(file_priv))
>  		goto out;
>  
>  	drm_legacy_lock_master_cleanup(dev, master);
> @@ -371,6 +342,22 @@ void drm_master_release(struct drm_file *file_priv)
>  	mutex_unlock(&dev->master_mutex);
>  }
>  
> +/**
> + * drm_is_current_master - checks whether @priv is the current master
> + * @fpriv: DRM file private
> + *
> + * Checks whether @fpriv is current master on its device. This decides whether a
> + * client is allowed to run DRM_MASTER IOCTLs.
> + *
> + * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
> + * - the current master is assumed to own the non-shareable display hardware.
> + */
> +bool drm_is_current_master(struct drm_file *fpriv)
> +{
> +	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> +}
> +EXPORT_SYMBOL(drm_is_current_master);
> +
>  /**
>   * drm_master_get - reference a master pointer
>   * @master: &struct drm_master
> -- 
> 2.32.0.rc2
> 
