Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DACCA7586
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7DB10EAC3;
	Fri,  5 Dec 2025 11:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="q9KYxBDz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBFE10E108
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 11:18:43 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so18348665e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 03:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1764933522; x=1765538322; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oRa0aI+MLlxCctgkmk7qeii5icGh5uMqffO/FVoB8G8=;
 b=q9KYxBDzgu2g36Ec0kQ1//sKzslEOnqh6oRR4Rp3fYsSb0972y4/ttzhX1OLXnsnFs
 RG+1lndha8+iOcgIv2I54ddAfMLLop7vnNo8oJRMMQjY2nh4Mys6hBCYCCl0dTyK6jiE
 3cOIY/VG9MikYGdsheGPhc8hYbye6xaVR/XMjQs/77XH6fpRHJjDwy1CoVbEBr7VW0Kk
 lOj5YQreH2owr2V8jBmhtVXEgLPPJj3QSE+auheUNi+fI85KcAK28V7tFP736dgyvQUK
 1W4QxdB50ZJ3tbVSxZw9/n3Z+Wb5gjLVF/S4bdhAJQnpvBE3APtt6FwINCUr0MFWweA5
 Spyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764933522; x=1765538322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oRa0aI+MLlxCctgkmk7qeii5icGh5uMqffO/FVoB8G8=;
 b=JrnTinvxnHiMRNLjuuLMGs0pIWikBZK27Xuj5+roeQzW3Cha6fzOr5x7hCQuBDvVV7
 OENNYVbfuzMhtVv2Vz13iowsSo69nLQJQBQr7n/RVC0aRewycQIVQLRTtgcdpK/PSBiA
 bbqzyzX8x7GOK9p2S1PitXI1Nx51b75Tm16BS4Qy489ECSNpbu7G2twpJI4n8WUriE8u
 z6SydzK5Jl3hUaXiBeDCa/dGcYZ/k51ZLAlJl7jiWT2SFWZwxIBotiiA3G6fN8VTjNJe
 F03vGMJ0edk4+cKrWoig2lA493h2Coq93H/0Uynd3orl+8m2TrIGaV2rt5F8H9kM62GI
 yWEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXx5TaijOm+yKdFI6zZ4p2DfsE5UbrLsVojMrzPC64WO2gLX2LkzWf52MJ2sDNMxFGFk7FsTiMWhE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9v0p0sNOTZuj/3+ABpNBov7KOjlIkDqeBrpUvd8wIirwYMd1n
 +I6ZwCTwefhhXdVC1zi5ZGMXWUV0I07dZEipeDEhzhaO7fmL5kbXEA6jefhq5zbLum0=
X-Gm-Gg: ASbGncsUl4iCmuQ6L6D+dmPGjkHiaN0pcGq8/QKT/HqFrWuEh11GK93oFnxInyg2JGI
 r4LNVU1Zod9qOnhoFezMEPCwSQfie7lP7o40YiuIPVfTXJ0HVJeKwRuJSTDMn8Jxa34ZHQPaqnE
 dK9mU2uLIXVPqc1AzOqG3hzJGgJ4aq9nBHnrhZLHBgC19SDCVQXeM5W7WErHXIOaJgEwPW+sKUF
 YngpDOBWJicasNF+pDlbPKqg5rQPUFu3HFRwS/HUEprxsJj/iv4aoYeuPyzdpv6RGkJMi/paPW2
 MJWzqbu1hTUPLxW6tCai3mqlKwXnEqCAVhAnfFAs9Hn4m4TsJheuG+7R0QPhrnxs+L/OoCCebqF
 MJCneucjTl6YwXP8cdbpU7G7YY/pa94kaGt8H+v/AbDCrnRMyIsYXbDX5YeXbiplZI3pPeooh6x
 yfZ1L1Fs9RBQXLMazfEDU9PdoB2qjzhCPI
X-Google-Smtp-Source: AGHT+IFOWnMguvYE5DbQkTSb1Ne++ALXCEzXlubqgJCDZmtKhVzb/Zqc2ZZzK46kFVz4wM7OJw/MRA==
X-Received: by 2002:a05:600c:4592:b0:46e:53cb:9e7f with SMTP id
 5b1f17b1804b1-4792f38615amr59145845e9.18.1764933521427; 
 Fri, 05 Dec 2025 03:18:41 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792b12411fsm69885495e9.3.2025.12.05.03.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 03:18:40 -0800 (PST)
Message-ID: <f08c170b-714f-46d0-87fc-3218c42ce93a@ursulin.net>
Date: Fri, 5 Dec 2025 11:18:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 05/10] drm/i915: Use huge tmpfs mountpoint helpers
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
References: <20251205091216.150968-1-loic.molinari@collabora.com>
 <20251205091216.150968-6-loic.molinari@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251205091216.150968-6-loic.molinari@collabora.com>
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


On 05/12/2025 09:12, Loïc Molinari wrote:
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

Thanks, looks good to me.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

What are your plans for landing the series? Presumably you'd like to do 
it in one go via drm-misc-next rather than in stages and different trees?

Regards,

Tvrtko

> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
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

