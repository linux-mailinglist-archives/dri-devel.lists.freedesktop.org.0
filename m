Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47827AE3599
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 08:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC83610E186;
	Mon, 23 Jun 2025 06:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Oi1fKtdQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535C610E186
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 06:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750659689;
 bh=S+lNeumD5H26uvwBaO1T9jxSaUHSIdHOJ7k2YDYX5ko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Oi1fKtdQPGMEkUueIz6ysRvX8eHqYDjvTnWVx7KWdb0ZvZZFn8J20VTXlIwQD7HzW
 aMo0dCM1vDxoijZBKkLgJh/Qg6IyhZN15f7BfVsTO+PuRSGQ0jurF9PPWL8eU/Boom
 mWXGEAB8bjagDEbd5mTPCHFxrAj6gRRCDISSFQtUVaNNeiGRgIWCbHvj+XbVmuLAp2
 9qOAHRptO6K3RRKTYHbvH5ba+H925sWAuLzg7r8VhVKZQAy6MHpk4xA+9Z9xlRbF9c
 1lxVoINs9CgNkBbjX3QGAHH+wgSg6o6cuSF9o27e1t5axiPqxOUwGr8eTa4SIp15V6
 ZMlnoY6tuCe/A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:16f1:973:959b:9b0c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 96F0417E0EC0;
 Mon, 23 Jun 2025 08:21:28 +0200 (CEST)
Date: Mon, 23 Jun 2025 08:21:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] panthor: save panthor_file in panthor_group
Message-ID: <20250623082122.62f69579@fedora>
In-Reply-To: <20250620235053.164614-3-olvaffe@gmail.com>
References: <20250620235053.164614-1-olvaffe@gmail.com>
 <20250620235053.164614-3-olvaffe@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 20 Jun 2025 16:50:51 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> We would like to access panthor_file from panthor_group on gpu errors.
> Because panthour_group can outlive drm_file, add refcount to
> panthor_file to ensure its lifetime.

I'm not a huge fan of refcounting panthor_file because people tend to
put resource they expect to be released when the last handle goes away,
and if we don't refcount these sub-resources they might live longer
than they are meant to. Also not a huge fan of the circular referencing
that exists between file and groups after this change.

How about we move the process info to a sub-object that's refcounted
and let both panthor_file and panthor_group take a ref on this object
instead?

> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 16 ++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c    | 15 ++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_mmu.c    |  1 +
>  drivers/gpu/drm/panthor/panthor_sched.c  |  6 ++++++
>  4 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 4fc7cf2aeed57..75ae6fd3a5128 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -256,8 +256,24 @@ struct panthor_file {
>  
>  	/** @stats: cycle and timestamp measures for job execution. */
>  	struct panthor_gpu_usage stats;
> +
> +	/** @refcount: ref count of this file */
> +	struct kref refcount;
>  };
>  
> +static inline struct panthor_file *panthor_file_get(struct panthor_file *pfile)
> +{
> +	kref_get(&pfile->refcount);
> +	return pfile;
> +}
> +
> +void panthor_file_release(struct kref *kref);
> +
> +static inline void panthor_file_put(struct panthor_file *pfile)
> +{
> +	kref_put(&pfile->refcount, panthor_file_release);
> +}
> +
>  int panthor_device_init(struct panthor_device *ptdev);
>  void panthor_device_unplug(struct panthor_device *ptdev);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 775a66c394544..aea9609684b77 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1393,6 +1393,16 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
>  	return 0;
>  }
>  
> +void panthor_file_release(struct kref *kref)
> +{
> +	struct panthor_file *pfile =
> +		container_of(kref, struct panthor_file, refcount);
> +
> +	WARN_ON(pfile->vms || pfile->groups);
> +
> +	kfree(pfile);
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1426,6 +1436,8 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  	if (ret)
>  		goto err_destroy_vm_pool;
>  
> +	kref_init(&pfile->refcount);
> +
>  	file->driver_priv = pfile;
>  	return 0;
>  
> @@ -1442,10 +1454,11 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
>  {
>  	struct panthor_file *pfile = file->driver_priv;
>  
> +	/* destroy vm and group handles now to avoid circular references */
>  	panthor_group_pool_destroy(pfile);
>  	panthor_vm_pool_destroy(pfile);
>  
> -	kfree(pfile);
> +	panthor_file_put(pfile);
>  }
>  
>  static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index b39ea6acc6a96..ccbcfe11420ac 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1604,6 +1604,7 @@ void panthor_vm_pool_destroy(struct panthor_file *pfile)
>  
>  	xa_destroy(&pfile->vms->xa);
>  	kfree(pfile->vms);
> +	pfile->vms = NULL;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index a2248f692a030..485072904cd7d 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -535,6 +535,9 @@ struct panthor_group {
>  	/** @ptdev: Device. */
>  	struct panthor_device *ptdev;
>  
> +	/** @pfile: File this group is created from. */
> +	struct panthor_file *pfile;
> +
>  	/** @vm: VM bound to the group. */
>  	struct panthor_vm *vm;
>  
> @@ -919,6 +922,7 @@ static void group_release_work(struct work_struct *work)
>  	panthor_kernel_bo_destroy(group->syncobjs);
>  
>  	panthor_vm_put(group->vm);
> +	panthor_file_put(group->pfile);
>  	kfree(group);
>  }
>  
> @@ -3467,6 +3471,8 @@ int panthor_group_create(struct panthor_file *pfile,
>  	INIT_WORK(&group->tiler_oom_work, group_tiler_oom_work);
>  	INIT_WORK(&group->release_work, group_release_work);
>  
> +	group->pfile = panthor_file_get(pfile);
> +
>  	group->vm = panthor_vm_pool_get_vm(pfile->vms, group_args->vm_id);
>  	if (!group->vm) {
>  		ret = -EINVAL;

