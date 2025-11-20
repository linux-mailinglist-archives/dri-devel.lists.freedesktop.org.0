Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A5AC7339C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EE210E733;
	Thu, 20 Nov 2025 09:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="qGRNUEkN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92EA10E733
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 09:39:58 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so4083625e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1763631597; x=1764236397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U6D2T/swrfGwwYIubUbU67Re0aJ0OQCaQcEzYhgb7k8=;
 b=qGRNUEkNMv2FpLcoQvXcgdzJ/Qj506HtgwWlY/X0gzEFtLVjNfYIfxZHUefnMUxciN
 AeWQCOhe0ZfJSRdiS/eWgYE+foSJ1Ey4LuRcyYEamDgapvSrBSXaCHTXr9sp8iQmBDW7
 0ewLBTdCeABaoTmSsJwkXjWxTOMHtnm4hUO+dnn/yG9sFqcI3pi/GnnKFc5wWqSX3zwX
 KAutA1CDqElpaH4g3TnM+3J87g11na2ktzbEb+oKHxz0kCntGwVhmmS2qHn0hZjvMzFd
 z1gm23LXMaiqXWBWfP30/4woqhoVHvit8nVVv0OucYilJQqlHeyAT6jboQicphCAFIPQ
 82bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763631597; x=1764236397;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U6D2T/swrfGwwYIubUbU67Re0aJ0OQCaQcEzYhgb7k8=;
 b=GkR7I/UuqkBi6/y0MpBO+W43N62ayiKQbKfHF5zAtLNwnRzidZb9a03g1guzPVLTym
 GKUTCqqpj4JDvHu0wod6QPb4XQIe0i007ZaJeA57IVPnAmTR5ZvbC+QSqirv4tAPurPZ
 3w5FX9vxAV9p8DaWwtUU55vO27dSrVuiXOhpfGviWdXQzaRWAGapAIhlBIWmQS7av1P0
 Z8LAONIEQA4mHE+BxAcaVoClbCk9J6eequE7hV6BpbYyJ+e8HO/3KXqODf7wKi1iDCPx
 F8x4lQ/Ktx/ZlimaYv26hsmT9642/51E8ZiDFT0Zpb4HoWGNtC6CCA/IbNfqZUfVJHrx
 ZUHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA/slZVpzJXUO+KYLP5RkHkA567GbR0ZBixVYKXkZ86BWW0Smjf6gCGptLBGuM5WUzPRVQM/RzqHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIxosXaHJ85bUH0NhkQVfZzstyY6aXGAzRWxeMirNj1R2mMKZS
 zvVKc5T+wZl6CZtF+JD5g0oFU4uF/2LLkS3r7H38t1hyfnedUYVgmM8edqLYl7u9Nuw=
X-Gm-Gg: ASbGncujAVD//iTMbdRmqUWFljlEabLykPvUfUVhM27ywKY+ckFseaXYWtKCJMYrrjk
 GiO705D0vtpKlCRdPHcifcj6/mMMlc5IfBOQS5FyhDwkGMIyhKri8hbE5zCeWUOVq4GjQC8aYOC
 5qelTDmHCt70PFbl9k0agK1/GjlB2DpZEaHvFpvwxOb7gBGyk2AoRbLvT43AnTegS9ojgj1oiXU
 bcqvDdYHP4A4/1CLEdHYXu+NVpdTcSqDHr77aiqBwxINwXbk9IYwuL9ZXSqocun7NTVhGO3u9co
 mZzqbCMnzj9+CTmC15/pcbzWZsp/4KS5BKZ4gfjHX73NHxStFq4w58D2FE0dJas/H9ZfF68gc9k
 HwuEFCzg6kYwviAWSoFrqjCBwIEBChSecYqtBeoMR/sxPF2dURySN7iVS0KzPSkEf3Bi2zd6MrB
 iSC2zvaYBYox67lMpxE/PPN9K/0hlrJAloYhh1vq9OdN0=
X-Google-Smtp-Source: AGHT+IGOpmCt7r6aMgv0PofyN+s+ybvbGGWrGxrluj7E2hm4OOsNHntjgzS2fQRDmHRVqJS0JlWLYQ==
X-Received: by 2002:a05:600c:3550:b0:477:75eb:a643 with SMTP id
 5b1f17b1804b1-477b9ddd8c4mr18898435e9.4.1763631596107; 
 Thu, 20 Nov 2025 01:39:56 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b0ffd37bsm100308375e9.3.2025.11.20.01.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 01:39:55 -0800 (PST)
Message-ID: <75cf65a0-8967-4e39-8bfe-aa284f8242b3@ursulin.net>
Date: Thu, 20 Nov 2025 09:39:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/11] drm/v3d: Use huge tmpfs mountpoint helpers
To: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251114170303.2800-1-loic.molinari@collabora.com>
 <20251114170303.2800-7-loic.molinari@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251114170303.2800-7-loic.molinari@collabora.com>
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


On 14/11/2025 17:02, Loïc Molinari wrote:
> Make use of the new drm_gem_huge_mnt_create() and
> drm_gem_get_huge_mnt() helpers to avoid code duplication. Now that
> it's just a few lines long, the single function in v3d_gemfs.c is
> moved into v3d_gem.c.
> 
> v3:
> - use huge tmpfs mountpoint in drm_device
> - move v3d_gemfs.c into v3d_gem.c
> 
> v4:
> - clean up mountpoint creation error handling
> 
> v5:
> - fix CONFIG_TRANSPARENT_HUGEPAGE check
> - use drm_gem_has_huge_mnt() helper
> 
> v8:
> - don't access huge_mnt field with CONFIG_TRANSPARENT_HUGEPAGE=n
> 
> v9:
> - replace drm_gem_has_huge_mnt() by drm_gem_get_huge_mnt()
> 
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
> ---
>   drivers/gpu/drm/v3d/Makefile    |  3 +-
>   drivers/gpu/drm/v3d/v3d_bo.c    |  9 +++--
>   drivers/gpu/drm/v3d/v3d_drv.c   |  2 +-
>   drivers/gpu/drm/v3d/v3d_drv.h   | 11 +-----
>   drivers/gpu/drm/v3d/v3d_gem.c   | 27 ++++++++++++--
>   drivers/gpu/drm/v3d/v3d_gemfs.c | 62 ---------------------------------
>   6 files changed, 34 insertions(+), 80 deletions(-)
>   delete mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
> 
> diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
> index fcf710926057..b7d673f1153b 100644
> --- a/drivers/gpu/drm/v3d/Makefile
> +++ b/drivers/gpu/drm/v3d/Makefile
> @@ -13,8 +13,7 @@ v3d-y := \
>   	v3d_trace_points.o \
>   	v3d_sched.o \
>   	v3d_sysfs.o \
> -	v3d_submit.o \
> -	v3d_gemfs.o
> +	v3d_submit.o
>   
>   v3d-$(CONFIG_DEBUG_FS) += v3d_debugfs.o
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index d9547f5117b9..211578abf9b6 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -114,7 +114,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	if (IS_ERR(sgt))
>   		return PTR_ERR(sgt);
>   
> -	if (!v3d->gemfs)
> +	if (!drm_gem_get_huge_mnt(obj->dev))
>   		align = SZ_4K;
>   	else if (obj->size >= SZ_1M)
>   		align = SZ_1M;
> @@ -150,12 +150,15 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
>   			     size_t unaligned_size)
>   {
>   	struct drm_gem_shmem_object *shmem_obj;
> -	struct v3d_dev *v3d = to_v3d_dev(dev);
>   	struct v3d_bo *bo;
>   	int ret;
>   
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   	shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> -						  v3d->gemfs);
> +						  dev->huge_mnt);
> +#else
> +	shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
> +#endif

Don't you want to use the same pattern not requiring #ifdef as you did 
in i915?

The rest looks good to me on a glance. Only functional change appears to 
be that you are adding a new error message, scrolling down..

>   	if (IS_ERR(shmem_obj))
>   		return ERR_CAST(shmem_obj);
>   	bo = to_v3d_bo(&shmem_obj->base);
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index e8a46c8bad8a..8faa9382846f 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -107,7 +107,7 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
>   		args->value = v3d->perfmon_info.max_counters;
>   		return 0;
>   	case DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES:
> -		args->value = !!v3d->gemfs;
> +		args->value = !!drm_gem_get_huge_mnt(dev);
>   		return 0;
>   	case DRM_V3D_PARAM_GLOBAL_RESET_COUNTER:
>   		mutex_lock(&v3d->reset_lock);
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 1884686985b8..99a39329bb85 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -158,11 +158,6 @@ struct v3d_dev {
>   	struct drm_mm mm;
>   	spinlock_t mm_lock;
>   
> -	/*
> -	 * tmpfs instance used for shmem backed objects
> -	 */
> -	struct vfsmount *gemfs;
> -
>   	struct work_struct overflow_mem_work;
>   
>   	struct v3d_queue_state queue[V3D_MAX_QUEUES];
> @@ -569,6 +564,7 @@ extern const struct dma_fence_ops v3d_fence_ops;
>   struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q);
>   
>   /* v3d_gem.c */
> +extern bool super_pages;
>   int v3d_gem_init(struct drm_device *dev);
>   void v3d_gem_destroy(struct drm_device *dev);
>   void v3d_reset_sms(struct v3d_dev *v3d);
> @@ -576,11 +572,6 @@ void v3d_reset(struct v3d_dev *v3d);
>   void v3d_invalidate_caches(struct v3d_dev *v3d);
>   void v3d_clean_caches(struct v3d_dev *v3d);
>   
> -/* v3d_gemfs.c */
> -extern bool super_pages;
> -void v3d_gemfs_init(struct v3d_dev *v3d);
> -void v3d_gemfs_fini(struct v3d_dev *v3d);
> -
>   /* v3d_submit.c */
>   void v3d_job_cleanup(struct v3d_job *job);
>   void v3d_job_put(struct v3d_job *job);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 5a180dc6c452..62532a89dd14 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -259,6 +259,30 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
>   	v3d_invalidate_slices(v3d, 0);
>   }
>   
> +static void
> +v3d_huge_mnt_init(struct v3d_dev *v3d)
> +{
> +	int err = 0;
> +
> +	/*
> +	 * By using a huge shmemfs mountpoint when the user wants to
> +	 * enable Super Pages, we can pass in mount flags that better
> +	 * match our usecase.
> +	 */
> +
> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && super_pages)
> +		err = drm_gem_huge_mnt_create(&v3d->drm, "within_size");
> +
> +	if (drm_gem_get_huge_mnt(&v3d->drm))
> +		drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> +	else if (err)
> +		drm_warn(&v3d->drm, "Can't use Transparent Hugepages (%d)\n",
> +			 err);

.. here, but that looks acceptable to me.

Regards,

Tvrtko

> +	else
> +		drm_notice(&v3d->drm,
> +			   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
> +}
> +
>   int
>   v3d_gem_init(struct drm_device *dev)
>   {
> @@ -310,7 +334,7 @@ v3d_gem_init(struct drm_device *dev)
>   	v3d_init_hw_state(v3d);
>   	v3d_mmu_set_page_table(v3d);
>   
> -	v3d_gemfs_init(v3d);
> +	v3d_huge_mnt_init(v3d);
>   
>   	ret = v3d_sched_init(v3d);
>   	if (ret) {
> @@ -330,7 +354,6 @@ v3d_gem_destroy(struct drm_device *dev)
>   	enum v3d_queue q;
>   
>   	v3d_sched_fini(v3d);
> -	v3d_gemfs_fini(v3d);
>   
>   	/* Waiting for jobs to finish would need to be done before
>   	 * unregistering V3D.
> diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
> deleted file mode 100644
> index bf351fc0d488..000000000000
> --- a/drivers/gpu/drm/v3d/v3d_gemfs.c
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (C) 2024 Raspberry Pi */
> -
> -#include <linux/fs.h>
> -#include <linux/mount.h>
> -#include <linux/fs_context.h>
> -
> -#include <drm/drm_print.h>
> -
> -#include "v3d_drv.h"
> -
> -void v3d_gemfs_init(struct v3d_dev *v3d)
> -{
> -	struct file_system_type *type;
> -	struct fs_context *fc;
> -	struct vfsmount *gemfs;
> -	int ret;
> -
> -	/*
> -	 * By creating our own shmemfs mountpoint, we can pass in
> -	 * mount flags that better match our usecase. However, we
> -	 * only do so on platforms which benefit from it.
> -	 */
> -	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> -		goto err;
> -
> -	/* The user doesn't want to enable Super Pages */
> -	if (!super_pages)
> -		goto err;
> -
> -	type = get_fs_type("tmpfs");
> -	if (!type)
> -		goto err;
> -
> -	fc = fs_context_for_mount(type, SB_KERNMOUNT);
> -	if (IS_ERR(fc))
> -		goto err;
> -	ret = vfs_parse_fs_string(fc, "source", "tmpfs");
> -	if (!ret)
> -		ret = vfs_parse_fs_string(fc, "huge", "within_size");
> -	if (!ret)
> -		gemfs = fc_mount_longterm(fc);
> -	put_fs_context(fc);
> -	if (ret)
> -		goto err;
> -
> -	v3d->gemfs = gemfs;
> -	drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> -
> -	return;
> -
> -err:
> -	v3d->gemfs = NULL;
> -	drm_notice(&v3d->drm,
> -		   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
> -}
> -
> -void v3d_gemfs_fini(struct v3d_dev *v3d)
> -{
> -	if (v3d->gemfs)
> -		kern_unmount(v3d->gemfs);
> -}

