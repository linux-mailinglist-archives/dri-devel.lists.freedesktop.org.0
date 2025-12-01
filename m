Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B18C9779E
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 14:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19D010E3D2;
	Mon,  1 Dec 2025 13:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WTgX9IBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25B710E3D6;
 Mon,  1 Dec 2025 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Okio4Q2gggxGvztR15RAxmdaAgL/sYeq5MjRRToGKm0=; b=WTgX9IBz4XydOkRVxbTUgsLWuo
 WJS8BTvTcbVWXjtTgqlivp+7PvEwO89wSBM4uX6PpcEuAVWIvG2/tuw5A/kmp47GbXmAVZDYmuESA
 bE50bNymi0j7YlDvwd7SK0CGPApiDlK/A89ek0SAyRKswRMDDkDnyU3z7c1mK3MMV1HsUJUU2e8Oi
 AqmOcokk9zj4mslOVZfSRX1Ai0rsZ5x+OPTCdp5c0d5nA+Tu0fYVR+sWwUbJaIz3Zb1pVTripkvjZ
 Oz9pL0r2VStuMy7ePxLoUSWbcW8fh1WQLuUHJ5E3NvzimkLN72ryJth3blmDETKZzBF1MZEIT9hI0
 hTX/So3Q==;
Received: from [189.7.87.198] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vQ3bt-007O25-5H; Mon, 01 Dec 2025 14:06:33 +0100
Message-ID: <1c48c302-decb-40e2-8ca3-c4e423ccf31b@igalia.com>
Date: Mon, 1 Dec 2025 10:06:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/10] drm/gem: Add huge tmpfs mountpoint helpers
To: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
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
References: <20251128185252.3092-1-loic.molinari@collabora.com>
 <20251128185252.3092-5-loic.molinari@collabora.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <20251128185252.3092-5-loic.molinari@collabora.com>
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

Hi Loïc,

On 28/11/25 15:52, Loïc Molinari wrote:
> Add the drm_gem_huge_mnt_create() and drm_gem_get_huge_mnt() helpers
> to avoid code duplication in the i915, V3D, Panfrost and Panthor
> drivers. The former creates and mounts a dedicated huge tmpfs
> mountpoint, for the lifetime of a DRM device, used at GEM object
> initialization. The latter retrieves the dedicated huge tmpfs
> mountpoint used by a DRM device.
> 
> The next commits will port drivers to these helpers.
> 
> v3:
> - store huge tmpfs mountpoint in drm_device
> 
> v4:
> - return 0 in builds with CONFIG_TRANSPARENT_HUGEPAGE=n
> - return 0 when huge_mnt already exists
> - use new vfs_parse_fs_string() helper
> 
> v5:
> - remove warning on !dev->huge_mnt and reset to NULL on free
> - inline drm_gem_huge_mnt_create() to remove func from text and avoid
>    calls in builds with CONFIG_TRANSPARENT_HUGEPAGE=n
> - compile out drm_device's huge_mnt field in builds with
>    CONFIG_TRANSPARENT_HUGEPAGE=n
> - add drm_gem_has_huge_mnt() helper
> 
> v6:
> - move huge_mnt doc into ifdef'd section
> - either inline or export drm_gem_huge_mnt_create()
> 
> v7:
> - include <drm/drm_device.h> in drm_gem.h
> 
> v9:
> - replace drm_gem_has_huge_mnt() by drm_gem_get_huge_mnt()
> 
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Some suggestions below (feel free to ignore):

> ---
>   drivers/gpu/drm/drm_gem.c | 57 +++++++++++++++++++++++++++++++++++++++
>   include/drm/drm_device.h  | 15 +++++++++++
>   include/drm/drm_gem.h     | 33 +++++++++++++++++++++++
>   3 files changed, 105 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 41d344c270a7..94e5e04865ba 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -29,6 +29,9 @@
>   #include <linux/export.h>
>   #include <linux/file.h>
>   #include <linux/fs.h>
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#include <linux/fs_context.h>
> +#endif
>   #include <linux/iosys-map.h>
>   #include <linux/mem_encrypt.h>
>   #include <linux/mm.h>
> @@ -82,6 +85,60 @@
>    * up at a later date, and as our interface with shmfs for memory allocation.
>    */
>   
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +static void drm_gem_huge_mnt_free(struct drm_device *dev, void *data)
> +{
> +	kern_unmount(dev->huge_mnt);
> +}
> +
> +/**
> + * drm_gem_huge_mnt_create - Create, mount and use a huge tmpfs mountpoint
> + * @dev: DRM device a huge tmpfs mountpoint should be used with

Suggestion: "DRM device that will use the huge tmpfs mountpoint"

> + * @value: huge tmpfs mount option value
> + *
> + * This function creates and mounts a dedicated huge tmpfs mountpoint for the
> + * lifetime of the DRM device @dev which is used at GEM object initialization
> + * with drm_gem_object_init().
> + *
> + * The most common option value @value is "within_size" which only allocates

Suggestion: "The most common option for @value is..."

> + * huge pages if the page will be fully within the GEM object size. "always",
> + * "advise" and "never" are supported too but the latter would just create a
> + * mountpoint similar to the default one (`shm_mnt`). See shmemfs and
> + * Transparent Hugepage for more information.
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */

[...]

> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 5af49c5c3778..7dc560ad14fc 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -3,6 +3,9 @@
>   
>   #include <linux/list.h>
>   #include <linux/kref.h>
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#include <linux/mount.h>
> +#endif
>   #include <linux/mutex.h>
>   #include <linux/idr.h>
>   #include <linux/sched.h>
> @@ -168,6 +171,18 @@ struct drm_device {
>   	 */
>   	struct drm_master *master;
>   
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	/**
> +	 * @huge_mnt:
> +	 *
> +	 * Huge tmpfs mountpoint used at GEM object initialization
> +	 * drm_gem_object_init(). Drivers can call drm_gem_huge_mnt_create() to

Suggestion: "Drivers can call drm_gem_huge_mnt_create() to mount and use
it."

> +	 * create a huge tmfps mountpoint. The default tmpfs mountpoint
> +	 * (`shm_mnt`) is used if NULL.
> +	 */
> +	struct vfsmount *huge_mnt;
> +#endif
> +
>   	/**
>   	 * @driver_features: per-device driver features
>   	 *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 7c8bd67d087c..4e9ab5d294ac 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -40,6 +40,9 @@
>   #include <linux/list.h>
>   #include <linux/mutex.h>
>   
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#include <drm/drm_device.h>
> +#endif
>   #include <drm/drm_vma_manager.h>
>   
>   struct iosys_map;
> @@ -492,6 +495,36 @@ struct drm_gem_object {
>   		DRM_GEM_FOPS,\
>   	}
>   
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +int drm_gem_huge_mnt_create(struct drm_device *dev, const char *value);
> +#else
> +static inline int drm_gem_huge_mnt_create(struct drm_device *dev,
> +					  const char *value)
> +{
> +	return 0;
> +}
> +#endif
> +
> +/**
> + * drm_gem_get_huge_mnt - Get the huge tmpfs mountpoint used by a DRM device
> + * @dev: DRM device
> +
> + * This function gets the huge tmpfs mountpoint used by DRM device @dev. A huge
> + * tmpfs mountpoint is used after a successful call to drm_gem_huge_mnt_create()

Suggestion: "A huge tmpfs is used instead of `shm_mnt` after a
successful call to drm_gem_huge_mnt_create() when
CONFIG_TRANSPARENT_HUGEPAGE is enabled"

Best Regards,
- Maíra
