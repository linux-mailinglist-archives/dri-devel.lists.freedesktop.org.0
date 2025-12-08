Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B5ACAC64D
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EB588F78;
	Mon,  8 Dec 2025 07:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="H0Ahm7p9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C48088F78
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 07:46:11 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b73545723ebso669918866b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Dec 2025 23:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765179970; x=1765784770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6t+VWOxtn3MQgwBizgRTSl58j0LKcuP4UNwNLtEnoYI=;
 b=H0Ahm7p9xYJwxFyfjmc4OcLE5hi94+M2ZcBgoCY7hCL4xIA17bxdEZbKLI4WgX/Eks
 eeN8eif1LE0pUeLHWv+zedUihRFOpkmYTo6Vs+wgbl4Haop+FGw4f9mjzCstnBKeEvib
 AHXwCWtJUJrbqN6XMN3zCMYHInaluGMMbJpuWrc1U8uZhB4MxJVQsdCzFlXnGqspe+Eh
 yb1tysuyDqnUlaaRBJRBVB5PPqMSOGb+L22lRtXuDG2VVfFWBsqSwbqb63YHE+r2sONi
 UCk50jOyI4GnzYzgNRw/PqA94fBP+WKfsOa1Cm4x9R4pSDwHJMkLpB1zBmmffprDXPLL
 ACrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765179970; x=1765784770;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6t+VWOxtn3MQgwBizgRTSl58j0LKcuP4UNwNLtEnoYI=;
 b=uvi4uy9EAMvXSmBB45HMWamU0mNhAkuAXR156f2LiWrlh6+kixhR422ajtN4tB1H3h
 nqy79/bpoL4At03sRdiFvY2HmpIiB985lDdWoFWZ+pC6SZVU+QFjMB4PuJgtl6stT5mu
 zVsflsuKblr+wOe3GgKIGOEdODk4+4x6FTJHo9YJsquPAFCbXNNZM536oVR1udIUgLAW
 oCUSC6J9RwW61ji/yBslXyIGcN1UWo8HaqTgKEj/oLw3UE14V0rT9KG5rgHC9uEcgJcK
 z42cbzGgsyQBcnV89z6py0VCEG4K5v6RFKOsGVQhtWZ8HzKrX5NUJsQdqmtKxxn62dYd
 1GNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVENWa0kJwPI0jNisnWIZL42mw/A95tB70TDSdsH7jjEQ832NecivkHrxBCZt9g5s05eioo4S9synE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzmNa+v1WM63pbp5+0rwtGhX2tH/3Vj/AtZqXep1gF3nh6zLch
 3VepnNoJG7dHpzxoPhJRkm4DOrK840TUhoOABMgiPgKfP/glEC7/TqkJTbyGE+EpR78=
X-Gm-Gg: ASbGncuRh7rQJNRbkPUPsAvBnVP7N/2uSCt3iBs3vzlt3mmkhwbyq+HF1B1LwjP0sg6
 5MzXtA/FDZrlI4jSReIzd4g4dn/crkX40Oda/U+UPHjzxPF47xlLGa8eZpfNBITcOryDzJ0Ghi1
 KJiS+I3rp/yHf5rZsPvwPraD+hTec/wEq4BhQbEe5tP1GCG1gNpFMa41eCVQxCA6b0svprDZ1og
 NZkZtVrIlPJo8WrWURjWOqtX0eUspQHiA0CngeFfVMIi4MmfaFKlk1Dr3SsvXRihfFZkBDIHrdf
 L97pqZTxMisqIPgj5kT5vC2kJsLtd/gplwrajoKGpc2eITtvTpT2slG2/RE7uo6jOBX5U63SU4h
 c1rTBHHF3WxMMtJ0bL1/voQ7e7VNZExmCb9wwe7Rw+Y6veo6KXMaWIV+tNniuRda9jxsBLjMDvf
 Dv4p3BzVGT4ZgMeozO1GBu7XEYS5SZ
X-Google-Smtp-Source: AGHT+IHJ4Jb9mt5MKXd+S2rnsvKPPGTJNy1tP6i6j68y8r9StJDpAB9I5hQ0c2GB6BopRUFwFApS7Q==
X-Received: by 2002:a17:907:8e96:b0:b79:fc29:ebd2 with SMTP id
 a640c23a62f3a-b7a242bebe8mr694963666b.3.1765179969573; 
 Sun, 07 Dec 2025 23:46:09 -0800 (PST)
Received: from [192.168.1.83] ([86.33.28.86]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f449c375sm1058619166b.24.2025.12.07.23.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Dec 2025 23:46:09 -0800 (PST)
Message-ID: <b7670bb1-ff5c-4eb9-92c3-6ee28a90f2d7@ursulin.net>
Date: Mon, 8 Dec 2025 08:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 05/10] drm/i915: Use huge tmpfs mountpoint helpers
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
References: <20251205182231.194072-1-loic.molinari@collabora.com>
 <20251205182231.194072-6-loic.molinari@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251205182231.194072-6-loic.molinari@collabora.com>
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


On 05/12/2025 19:22, Loïc Molinari wrote:
> Make use of the new drm_gem_huge_mnt_create() and
> drm_gem_get_huge_mnt() helpers to avoid code duplication. Now that
> it's just a few lines long, the single function in i915_gemfs.c is
> moved into i915_gem_shmem.c.
>
> v3:
> - use huge tmpfs mountpoint in drm_device
> - move i915_gemfs.c into i915_gem_shmem.c
>
> v4:
> - clean up mountpoint creation error handling
>
> v5:
> - use drm_gem_has_huge_mnt() helper
>
> v7:
> - include <drm/drm_print.h> in i915_gem_shmem.c
>
> v8:
> - keep logging notice message with CONFIG_TRANSPARENT_HUGEPAGE=n
> - don't access huge_mnt field with CONFIG_TRANSPARENT_HUGEPAGE=n
>
> v9:
> - replace drm_gem_has_huge_mnt() by drm_gem_get_huge_mnt()
> - remove useless ternary op test in selftests/huge_pages.c
>
> v12:
> - fix layering violation in selftests (Tvrtko)
> - fix incorrect filename in commit message
>
> v13:
> - add Tvrtko A-b
>
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
> Acked-by: Tvrtko Ursulin <tursulin@ursulin.net>

Forgot to say - from my point of view it is okay to land this via 
drm-misc. I don't think there should be any conflicts in this area.

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/Makefile                 |  3 +-
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  9 +--
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     | 58 ++++++++++-----
>   drivers/gpu/drm/i915/gem/i915_gemfs.c         | 71 -------------------
>   drivers/gpu/drm/i915/gem/i915_gemfs.h         | 14 ----
>   .../gpu/drm/i915/gem/selftests/huge_pages.c   | 15 +---
>   drivers/gpu/drm/i915/i915_drv.h               |  5 --
>   7 files changed, 50 insertions(+), 125 deletions(-)
>   delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.c
>   delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 84ec79b64960..b5a8c0a6b747 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -169,8 +169,7 @@ gem-y += \
>   	gem/i915_gem_ttm_move.o \
>   	gem/i915_gem_ttm_pm.o \
>   	gem/i915_gem_userptr.o \
> -	gem/i915_gem_wait.o \
> -	gem/i915_gemfs.o
> +	gem/i915_gem_wait.o
>   i915-y += \
>   	$(gem-y) \
>   	i915_active.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 64600aa8227f..f94409e8ec4c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -348,12 +348,13 @@ struct drm_i915_gem_object {
>    */
>   #define I915_BO_ALLOC_GPU_ONLY	  BIT(6)
>   #define I915_BO_ALLOC_CCS_AUX	  BIT(7)
> +#define I915_BO_ALLOC_NOTHP	  BIT(8)
>   /*
>    * Object is allowed to retain its initial data and will not be cleared on first
>    * access if used along with I915_BO_ALLOC_USER. This is mainly to keep
>    * preallocated framebuffer data intact while transitioning it to i915drmfb.
>    */
> -#define I915_BO_PREALLOC	  BIT(8)
> +#define I915_BO_PREALLOC	  BIT(9)
>   #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
>   			     I915_BO_ALLOC_VOLATILE | \
>   			     I915_BO_ALLOC_CPU_CLEAR | \
> @@ -363,9 +364,9 @@ struct drm_i915_gem_object {
>   			     I915_BO_ALLOC_GPU_ONLY | \
>   			     I915_BO_ALLOC_CCS_AUX | \
>   			     I915_BO_PREALLOC)
> -#define I915_BO_READONLY          BIT(9)
> -#define I915_TILING_QUIRK_BIT     10 /* unknown swizzling; do not release! */
> -#define I915_BO_PROTECTED         BIT(11)
> +#define I915_BO_READONLY          BIT(10)
> +#define I915_TILING_QUIRK_BIT     11 /* unknown swizzling; do not release! */
> +#define I915_BO_PROTECTED         BIT(12)
>   	/**
>   	 * @mem_flags - Mutable placement-related flags
>   	 *
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 26dda55a07ff..6ad1d6f99363 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -9,14 +9,16 @@
>   #include <linux/uio.h>
>   
>   #include <drm/drm_cache.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_print.h>
>   
>   #include "gem/i915_gem_region.h"
>   #include "i915_drv.h"
>   #include "i915_gem_object.h"
>   #include "i915_gem_tiling.h"
> -#include "i915_gemfs.h"
>   #include "i915_scatterlist.h"
>   #include "i915_trace.h"
> +#include "i915_utils.h"
>   
>   /*
>    * Move folios to appropriate lru and release the batch, decrementing the
> @@ -494,9 +496,11 @@ const struct drm_i915_gem_object_ops i915_gem_shmem_ops = {
>   
>   static int __create_shmem(struct drm_i915_private *i915,
>   			  struct drm_gem_object *obj,
> -			  resource_size_t size)
> +			  resource_size_t size,
> +			  unsigned int flags)
>   {
> -	unsigned long flags = VM_NORESERVE;
> +	unsigned long shmem_flags = VM_NORESERVE;
> +	struct vfsmount *huge_mnt;
>   	struct file *filp;
>   
>   	drm_gem_private_object_init(&i915->drm, obj, size);
> @@ -515,11 +519,12 @@ static int __create_shmem(struct drm_i915_private *i915,
>   	if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
>   		return -E2BIG;
>   
> -	if (i915->mm.gemfs)
> -		filp = shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
> -						 flags);
> +	huge_mnt = drm_gem_get_huge_mnt(&i915->drm);
> +	if (!(flags & I915_BO_ALLOC_NOTHP) && huge_mnt)
> +		filp = shmem_file_setup_with_mnt(huge_mnt, "i915", size,
> +						 shmem_flags);
>   	else
> -		filp = shmem_file_setup("i915", size, flags);
> +		filp = shmem_file_setup("i915", size, shmem_flags);
>   	if (IS_ERR(filp))
>   		return PTR_ERR(filp);
>   
> @@ -548,7 +553,7 @@ static int shmem_object_init(struct intel_memory_region *mem,
>   	gfp_t mask;
>   	int ret;
>   
> -	ret = __create_shmem(i915, &obj->base, size);
> +	ret = __create_shmem(i915, &obj->base, size, flags);
>   	if (ret)
>   		return ret;
>   
> @@ -644,21 +649,40 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *i915,
>   
>   static int init_shmem(struct intel_memory_region *mem)
>   {
> -	i915_gemfs_init(mem->i915);
> -	intel_memory_region_set_name(mem, "system");
> +	struct drm_i915_private *i915 = mem->i915;
>   
> -	return 0; /* We have fallback to the kernel mnt if gemfs init failed. */
> -}
> +	/*
> +	 * By creating our own shmemfs mountpoint, we can pass in
> +	 * mount flags that better match our usecase.
> +	 *
> +	 * One example, although it is probably better with a per-file
> +	 * control, is selecting huge page allocations ("huge=within_size").
> +	 * However, we only do so on platforms which benefit from it, or to
> +	 * offset the overhead of iommu lookups, where with latter it is a net
> +	 * win even on platforms which would otherwise see some performance
> +	 * regressions such a slow reads issue on Broadwell and Skylake.
> +	 */
>   
> -static int release_shmem(struct intel_memory_region *mem)
> -{
> -	i915_gemfs_fini(mem->i915);
> -	return 0;
> +	if (GRAPHICS_VER(i915) < 11 && !i915_vtd_active(i915))
> +		goto no_thp;
> +
> +	drm_gem_huge_mnt_create(&i915->drm, "within_size");
> +	if (drm_gem_get_huge_mnt(&i915->drm))
> +		drm_info(&i915->drm, "Using Transparent Hugepages\n");
> +	else
> +		drm_notice(&i915->drm,
> +			   "Transparent Hugepage support is recommended for optimal performance%s\n",
> +			   GRAPHICS_VER(i915) >= 11 ? " on this platform!" :
> +						      " when IOMMU is enabled!");
> +
> + no_thp:
> +	intel_memory_region_set_name(mem, "system");
> +
> +	return 0; /* We have fallback to the kernel mnt if huge mnt failed. */
>   }
>   
>   static const struct intel_memory_region_ops shmem_region_ops = {
>   	.init = init_shmem,
> -	.release = release_shmem,
>   	.init_object = shmem_object_init,
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> deleted file mode 100644
> index 1f1290214031..000000000000
> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2017 Intel Corporation
> - */
> -
> -#include <linux/fs.h>
> -#include <linux/mount.h>
> -#include <linux/fs_context.h>
> -
> -#include <drm/drm_print.h>
> -
> -#include "i915_drv.h"
> -#include "i915_gemfs.h"
> -#include "i915_utils.h"
> -
> -void i915_gemfs_init(struct drm_i915_private *i915)
> -{
> -	struct file_system_type *type;
> -	struct fs_context *fc;
> -	struct vfsmount *gemfs;
> -	int ret;
> -
> -	/*
> -	 * By creating our own shmemfs mountpoint, we can pass in
> -	 * mount flags that better match our usecase.
> -	 *
> -	 * One example, although it is probably better with a per-file
> -	 * control, is selecting huge page allocations ("huge=within_size").
> -	 * However, we only do so on platforms which benefit from it, or to
> -	 * offset the overhead of iommu lookups, where with latter it is a net
> -	 * win even on platforms which would otherwise see some performance
> -	 * regressions such a slow reads issue on Broadwell and Skylake.
> -	 */
> -
> -	if (GRAPHICS_VER(i915) < 11 && !i915_vtd_active(i915))
> -		return;
> -
> -	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
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
> -	i915->mm.gemfs = gemfs;
> -	drm_info(&i915->drm, "Using Transparent Hugepages\n");
> -	return;
> -
> -err:
> -	drm_notice(&i915->drm,
> -		   "Transparent Hugepage support is recommended for optimal performance%s\n",
> -		   GRAPHICS_VER(i915) >= 11 ? " on this platform!" :
> -					      " when IOMMU is enabled!");
> -}
> -
> -void i915_gemfs_fini(struct drm_i915_private *i915)
> -{
> -	kern_unmount(i915->mm.gemfs);
> -}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.h b/drivers/gpu/drm/i915/gem/i915_gemfs.h
> deleted file mode 100644
> index 16d4333c9a4e..000000000000
> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2017 Intel Corporation
> - */
> -
> -#ifndef __I915_GEMFS_H__
> -#define __I915_GEMFS_H__
> -
> -struct drm_i915_private;
> -
> -void i915_gemfs_init(struct drm_i915_private *i915);
> -void i915_gemfs_fini(struct drm_i915_private *i915);
> -
> -#endif
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index bd08605a1611..02e9bf87f654 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1316,7 +1316,7 @@ typedef struct drm_i915_gem_object *
>   
>   static inline bool igt_can_allocate_thp(struct drm_i915_private *i915)
>   {
> -	return i915->mm.gemfs && has_transparent_hugepage();
> +	return !!drm_gem_get_huge_mnt(&i915->drm);
>   }
>   
>   static struct drm_i915_gem_object *
> @@ -1761,7 +1761,6 @@ static int igt_tmpfs_fallback(void *arg)
>   	struct drm_i915_private *i915 = arg;
>   	struct i915_address_space *vm;
>   	struct i915_gem_context *ctx;
> -	struct vfsmount *gemfs = i915->mm.gemfs;
>   	struct drm_i915_gem_object *obj;
>   	struct i915_vma *vma;
>   	struct file *file;
> @@ -1779,15 +1778,8 @@ static int igt_tmpfs_fallback(void *arg)
>   	}
>   	vm = i915_gem_context_get_eb_vm(ctx);
>   
> -	/*
> -	 * Make sure that we don't burst into a ball of flames upon falling back
> -	 * to tmpfs, which we rely on if on the off-chance we encounter a failure
> -	 * when setting up gemfs.
> -	 */
> -
> -	i915->mm.gemfs = NULL;
> -
> -	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
> +	obj = i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_SMEM],
> +					    PAGE_SIZE, 0, I915_BO_ALLOC_NOTHP);
>   	if (IS_ERR(obj)) {
>   		err = PTR_ERR(obj);
>   		goto out_restore;
> @@ -1819,7 +1811,6 @@ static int igt_tmpfs_fallback(void *arg)
>   out_put:
>   	i915_gem_object_put(obj);
>   out_restore:
> -	i915->mm.gemfs = gemfs;
>   
>   	i915_vm_put(vm);
>   out:
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 95f9ddf22ce4..93a5af3de334 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -141,11 +141,6 @@ struct i915_gem_mm {
>   	 */
>   	atomic_t free_count;
>   
> -	/**
> -	 * tmpfs instance used for shmem backed objects
> -	 */
> -	struct vfsmount *gemfs;
> -
>   	struct intel_memory_region *regions[INTEL_REGION_UNKNOWN];
>   
>   	struct notifier_block oom_notifier;

