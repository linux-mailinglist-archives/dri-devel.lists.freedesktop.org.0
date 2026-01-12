Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4183BD12499
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AB410E397;
	Mon, 12 Jan 2026 11:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 072C510E397
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:27:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACE9E497;
 Mon, 12 Jan 2026 03:27:01 -0800 (PST)
Received: from [10.57.11.182] (unknown [10.57.11.182])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 126BF3F694;
 Mon, 12 Jan 2026 03:27:03 -0800 (PST)
Message-ID: <b83acc7f-309e-4fdb-8dff-23fdd9ccb870@arm.com>
Date: Mon, 12 Jan 2026 11:27:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/9] drm/panthor: Move panthor_gems_debugfs_init() to
 panthor_gem.c
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260109130801.1239558-4-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 09/01/2026 13:07, Boris Brezillon wrote:
> There's no reason for panthor_drv to know about panthor_gem.c internals,
> so let's move the GEM debugfs init logic to panthor_gem.c.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 26 +-----------------------
>  drivers/gpu/drm/panthor/panthor_gem.c | 29 +++++++++++++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_gem.h |  3 +--
>  3 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 165dddfde6ca..52c27a60c84a 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1635,34 +1635,10 @@ static const struct file_operations panthor_drm_driver_fops = {
>  };
>  
>  #ifdef CONFIG_DEBUG_FS
> -static int panthor_gems_show(struct seq_file *m, void *data)
> -{
> -	struct drm_info_node *node = m->private;
> -	struct drm_device *dev = node->minor->dev;
> -	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
> -
> -	panthor_gem_debugfs_print_bos(ptdev, m);
> -
> -	return 0;
> -}
> -
> -static struct drm_info_list panthor_debugfs_list[] = {
> -	{"gems", panthor_gems_show, 0, NULL},
> -};
> -
> -static int panthor_gems_debugfs_init(struct drm_minor *minor)
> -{
> -	drm_debugfs_create_files(panthor_debugfs_list,
> -				 ARRAY_SIZE(panthor_debugfs_list),
> -				 minor->debugfs_root, minor);
> -
> -	return 0;
> -}
> -
>  static void panthor_debugfs_init(struct drm_minor *minor)
>  {
>  	panthor_mmu_debugfs_init(minor);
> -	panthor_gems_debugfs_init(minor);
> +	panthor_gem_debugfs_init(minor);
>  }
>  #endif
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index b61908fd508a..13e9dd3764fa 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -9,6 +9,8 @@
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_print.h>
>  #include <drm/panthor_drm.h>
>  
> @@ -683,8 +685,8 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
>  		totals->reclaimable += resident_size;
>  }
>  
> -void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
> -				   struct seq_file *m)
> +static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
> +					  struct seq_file *m)
>  {
>  	struct gem_size_totals totals = {0};
>  	struct panthor_gem_object *bo;
> @@ -704,4 +706,27 @@ void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
>  	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
>  		   totals.size, totals.resident, totals.reclaimable);
>  }
> +
> +static int panthor_gem_show_bos(struct seq_file *m, void *data)
> +{
> +	struct drm_info_node *node = m->private;
> +	struct drm_device *dev = node->minor->dev;
> +	struct panthor_device *ptdev =
> +		container_of(dev, struct panthor_device, base);
> +
> +	panthor_gem_debugfs_print_bos(ptdev, m);
> +
> +	return 0;
> +}
> +
> +static struct drm_info_list panthor_gem_debugfs_list[] = {
> +	{ "gems", panthor_gem_show_bos, 0, NULL },
> +};
> +
> +void panthor_gem_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_create_files(panthor_gem_debugfs_list,
> +				 ARRAY_SIZE(panthor_gem_debugfs_list),
> +				 minor->debugfs_root, minor);
> +}
>  #endif
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 22519c570b5a..94b2d17cf032 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -203,8 +203,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
>  
>  #ifdef CONFIG_DEBUG_FS
> -void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
> -				   struct seq_file *m);
> +void panthor_gem_debugfs_init(struct drm_minor *minor);
>  #endif
>  
>  #endif /* __PANTHOR_GEM_H__ */

