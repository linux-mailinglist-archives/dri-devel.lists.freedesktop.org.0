Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0AA879022
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFB3112558;
	Tue, 12 Mar 2024 08:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="T2jQ1Y6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6748112558
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O9yrTQX/37G+0LKpL88iM6bF4e3a66jOAruUPqSLmcY=; b=T2jQ1Y6N11ELVGJkPTjway9y7/
 I3q0WdbPQfTygnqpVPKgz0FParEKUhval9JExmbFEpcKMqrURvx3vVDKQ+P70gn+K0oDL94AbZWbw
 AEmMUDqc5DXk5XbZjL2md2HHfCKDz4/SpeFxkca5Tdg402uCvYXtL3D7VoU5M7ho1Ov/9F/cJOkV6
 Drc9QkooaXXEp35Ww81vXsEkGD6tcZSju1FuaLlCAPE8EKj6itdGxHe88S4VWPh1q2YhyCnLtB4A6
 HdLo1tCWK+g/OgqPXIPIO30EZ8PnFbkrgBidqd8IjKvMeo10dd/kW3jI55YtuS6Hg3WLr3u0PypFd
 LAls2/WA==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rjxvM-009E1g-0Q; Tue, 12 Mar 2024 09:55:52 +0100
Message-ID: <a394e7de-8358-4ade-a1d8-d5de005bb472@igalia.com>
Date: Tue, 12 Mar 2024 08:55:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/v3d: Introduce gemfs
Content-Language: en-GB
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-4-mcanal@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240311100959.205545-4-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


Hi,

On 11/03/2024 10:06, Maíra Canal wrote:
> Create a separate "tmpfs" kernel mount for V3D. This will allow us to
> move away from the shmemfs `shm_mnt` and gives the flexibility to do
> things like set our own mount options. Here, the interest is to use
> "huge=", which should allow us to enable the use of THP for our
> shmem-backed objects.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/Makefile    |  3 ++-
>   drivers/gpu/drm/v3d/v3d_drv.h   |  9 +++++++
>   drivers/gpu/drm/v3d/v3d_gem.c   |  3 +++
>   drivers/gpu/drm/v3d/v3d_gemfs.c | 46 +++++++++++++++++++++++++++++++++
>   4 files changed, 60 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
> 
> diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
> index b7d673f1153b..fcf710926057 100644
> --- a/drivers/gpu/drm/v3d/Makefile
> +++ b/drivers/gpu/drm/v3d/Makefile
> @@ -13,7 +13,8 @@ v3d-y := \
>   	v3d_trace_points.o \
>   	v3d_sched.o \
>   	v3d_sysfs.o \
> -	v3d_submit.o
> +	v3d_submit.o \
> +	v3d_gemfs.o
> 
>   v3d-$(CONFIG_DEBUG_FS) += v3d_debugfs.o
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 1950c723dde1..d2ce8222771a 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -119,6 +119,11 @@ struct v3d_dev {
>   	struct drm_mm mm;
>   	spinlock_t mm_lock;
> 
> +	/*
> +	 * tmpfs instance used for shmem backed objects
> +	 */
> +	struct vfsmount *gemfs;
> +
>   	struct work_struct overflow_mem_work;
> 
>   	struct v3d_bin_job *bin_job;
> @@ -519,6 +524,10 @@ void v3d_reset(struct v3d_dev *v3d);
>   void v3d_invalidate_caches(struct v3d_dev *v3d);
>   void v3d_clean_caches(struct v3d_dev *v3d);
> 
> +/* v3d_gemfs.c */
> +void v3d_gemfs_init(struct v3d_dev *v3d);
> +void v3d_gemfs_fini(struct v3d_dev *v3d);
> +
>   /* v3d_submit.c */
>   void v3d_job_cleanup(struct v3d_job *job);
>   void v3d_job_put(struct v3d_job *job);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 66f4b78a6b2e..faefbe497e8d 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -287,6 +287,8 @@ v3d_gem_init(struct drm_device *dev)
>   	v3d_init_hw_state(v3d);
>   	v3d_mmu_set_page_table(v3d);
> 
> +	v3d_gemfs_init(v3d);
> +
>   	ret = v3d_sched_init(v3d);
>   	if (ret) {
>   		drm_mm_takedown(&v3d->mm);
> @@ -304,6 +306,7 @@ v3d_gem_destroy(struct drm_device *dev)
>   	struct v3d_dev *v3d = to_v3d_dev(dev);
> 
>   	v3d_sched_fini(v3d);
> +	v3d_gemfs_fini(v3d);
> 
>   	/* Waiting for jobs to finish would need to be done before
>   	 * unregistering V3D.
> diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
> new file mode 100644
> index 000000000000..8518b7da6f73
> --- /dev/null
> +++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright (C) 2024 Raspberry Pi */
> +
> +#include <linux/fs.h>
> +#include <linux/mount.h>
> +
> +#include "v3d_drv.h"
> +
> +void v3d_gemfs_init(struct v3d_dev *v3d)
> +{
> +	char huge_opt[] = "huge=always";

Using 'always' and not 'within_size' is deliberate? It can waste memory 
but indeed could be best for performance. I am just asking and perhaps I 
missed some prior discussion on this.

Regards,

Tvrtko

> +	struct file_system_type *type;
> +	struct vfsmount *gemfs;
> +
> +	/*
> +	 * By creating our own shmemfs mountpoint, we can pass in
> +	 * mount flags that better match our usecase. However, we
> +	 * only do so on platforms which benefit from it.
> +	 */
> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +		goto err;
> +
> +	type = get_fs_type("tmpfs");
> +	if (!type)
> +		goto err;
> +
> +	gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name, huge_opt);
> +	if (IS_ERR(gemfs))
> +		goto err;
> +
> +	v3d->gemfs = gemfs;
> +	drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> +
> +	return;
> +
> +err:
> +	v3d->gemfs = NULL;
> +	drm_notice(&v3d->drm,
> +		   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
> +}
> +
> +void v3d_gemfs_fini(struct v3d_dev *v3d)
> +{
> +	if (v3d->gemfs)
> +		kern_unmount(v3d->gemfs);
> +}
> --
> 2.43.0
> 
> 
