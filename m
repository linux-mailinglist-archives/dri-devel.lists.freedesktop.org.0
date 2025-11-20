Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0CC732CF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B8910E724;
	Thu, 20 Nov 2025 09:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Q+RjuTYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3600310E724
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 09:31:57 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42b47f662a0so798117f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 01:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1763631116; x=1764235916; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fqAzN+uhziH1nFW2iIiQXSt/9jzfbA+V2CT1GLLLYig=;
 b=Q+RjuTYZgP74ZrRQnuVOVYVMwCpTi+NK7ktfKP97iVf9jFE/1/Te/QSsjk7wVanUzo
 qFJAN1dBUIjLb70yIFlPfpi7HSdfoFsmCSRLACQ2H2380vBYJRqANBOLLuwHDnHOW9bX
 ntwGjWHmxYdxBpjC0qzDGujgUtfu2KcG1MliAlpb0Iv9ewbkZwkWj4n7fIPE8/ZXS6tx
 qR9VlAapDSYqmpKHxY2tqL1FlUaiBXH7easR1WbrKsf/Coj26tjZamZepjJnx5O3SxQZ
 paWTX0FxnImJR+V2jdLXb31mpUMfrUHU+46TvrgghZu+3Jhp2uy56eIoNAVa3Z0ZokF9
 TTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763631116; x=1764235916;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fqAzN+uhziH1nFW2iIiQXSt/9jzfbA+V2CT1GLLLYig=;
 b=CXNTziRYClVxREK5UT9UBrv+otA/7Js49cyT0BtDIL201FJdhyLrlzyLgjbT6xARTj
 1zYPIpF5j5EEPd6FMPzwKlnSCzjp/N/s8dXBy2LCknrlgXDQR37ax8jyg6sqKC6/XLCc
 una6thOGCZRbV8APJVqEOVxPp7AzXIfdpuXMB79DZvT4dU9gcYP0XCWe7wJRpdn3glh8
 DnZsZyakPbx2fuXgxnF1UKw8QMVIK4Yg8oU0swIo8Ch1HF8Ko6xOpv4ekHV4WpU9Wo1j
 0CKkkbkaEPkdHpunkQutJfDFFZBDm6EFgnz98Q+nOFl5hjJJ5cm+i9wSryW6DrZwnGpE
 e2oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdAUgRcE25fh2opeIx/Up2bwOGXMmg+EY6p9m9qMbjLImgl6ohZNe+Bq5z0YdbaQstG8uMBr9POP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm0w4d9+7a9xDBS7srneoXzG4QTPAZlMGLvshhp82IDsg+lGZu
 vPbm2RrXbdFIZxu8YTQfDDDJTcb81Id2sHeOk1Od2YKgMuBltIrJH++4ZglIX6aYNoc=
X-Gm-Gg: ASbGncuLC30rs0g+Hit0cbB37plu0vv0JHrXfC6Ah9YQ5DY4l0666vP7wAvFndy5krO
 qM/BtB95UJKY79KSHXfo0CqopWeC2XSikhO/7Jx0VSMiJCxZPj/5JvaN4hFssxQ76VhTPxyfpO6
 fNolPUrF23C5AIrD0ZTNfFtuZAGTnEZBezrd2vFK7qlymX1aQ/56LKSR/G+F9jiiMKjUsozdJbB
 IGYJOz3/KuhQw6ODv153Xd1DA4/yLB7YL60TSQFkzO2U/3v+W1/bgbYlWFkq3WU9vtpMzBQWgWf
 DrJq1/bC31w7/mWlOFu7eTMPR8d6lC/vcAV16DXvYrs6o3OPQb4Y6ndTXlekHsLUIQNjJOazDRz
 w0IoEY6r6In7tRsyvKJAOY0cmhYD1O/VLI9v2FcrFD6WKpR2EjcE2f9Cna/nk8OV4lgU9N9roiB
 sQU9ZJdMVOuSCIqiKLXIMAvfvpsEZ7p5bH
X-Google-Smtp-Source: AGHT+IFofUXdITOIuOkWXI5exYrEDPWRBJLEZCKD9E2oxWKfdypUIfwK6ij9knD1h1VBV36aBdBTXQ==
X-Received: by 2002:adf:eb0c:0:b0:42b:3aa8:ff9f with SMTP id
 ffacd0b85a97d-42cba7c4d7fmr1465005f8f.28.1763631114510; 
 Thu, 20 Nov 2025 01:31:54 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e460sm4293066f8f.7.2025.11.20.01.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 01:31:53 -0800 (PST)
Message-ID: <fee6476e-3168-4f4f-ae2f-3ef65fe209b0@ursulin.net>
Date: Thu, 20 Nov 2025 09:31:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/11] drm/i915: Use huge tmpfs mountpoint helpers
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
 <20251114170303.2800-6-loic.molinari@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251114170303.2800-6-loic.molinari@collabora.com>
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
> it's just a few lines long, the single function in i915_gemfs.c is
> moved into v3d_gem_shmem.c.
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
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |  3 +-
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     | 48 +++++++++----
>   drivers/gpu/drm/i915/gem/i915_gemfs.c         | 71 -------------------
>   drivers/gpu/drm/i915/gem/i915_gemfs.h         | 14 ----
>   .../gpu/drm/i915/gem/selftests/huge_pages.c   | 16 +++--
>   drivers/gpu/drm/i915/i915_drv.h               |  5 --
>   6 files changed, 47 insertions(+), 110 deletions(-)
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
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 26dda55a07ff..15c2c6fde2ac 100644
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
> @@ -497,6 +499,7 @@ static int __create_shmem(struct drm_i915_private *i915,
>   			  resource_size_t size)
>   {
>   	unsigned long flags = VM_NORESERVE;
> +	struct vfsmount *huge_mnt;
>   	struct file *filp;
>   
>   	drm_gem_private_object_init(&i915->drm, obj, size);
> @@ -515,9 +518,9 @@ static int __create_shmem(struct drm_i915_private *i915,
>   	if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
>   		return -E2BIG;
>   
> -	if (i915->mm.gemfs)
> -		filp = shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
> -						 flags);
> +	huge_mnt = drm_gem_get_huge_mnt(&i915->drm);
> +	if (huge_mnt)
> +		filp = shmem_file_setup_with_mnt(huge_mnt, "i915", size, flags);
>   	else
>   		filp = shmem_file_setup("i915", size, flags);
>   	if (IS_ERR(filp))
> @@ -644,21 +647,40 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *i915,
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
> index bd08605a1611..28aef75630a2 100644
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
> @@ -1761,7 +1761,9 @@ static int igt_tmpfs_fallback(void *arg)
>   	struct drm_i915_private *i915 = arg;
>   	struct i915_address_space *vm;
>   	struct i915_gem_context *ctx;
> -	struct vfsmount *gemfs = i915->mm.gemfs;
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	struct vfsmount *huge_mnt = i915->drm.huge_mnt;
> +#endif
>   	struct drm_i915_gem_object *obj;
>   	struct i915_vma *vma;
>   	struct file *file;
> @@ -1782,10 +1784,12 @@ static int igt_tmpfs_fallback(void *arg)
>   	/*
>   	 * Make sure that we don't burst into a ball of flames upon falling back
>   	 * to tmpfs, which we rely on if on the off-chance we encounter a failure
> -	 * when setting up gemfs.
> +	 * when setting up a huge mountpoint.
>   	 */
>   
> -	i915->mm.gemfs = NULL;
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	i915->drm.huge_mnt = NULL;
> +#endif
>   
>   	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
>   	if (IS_ERR(obj)) {
> @@ -1819,7 +1823,9 @@ static int igt_tmpfs_fallback(void *arg)
>   out_put:
>   	i915_gem_object_put(obj);
>   out_restore:
> -	i915->mm.gemfs = gemfs;
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	i915->drm.huge_mnt = huge_mnt;
> +#endif

Apart from this layering violation in the selftest, this version looks 
good to me. I am just wondering if we could somehow improve this aspect. 
I was thinking a self-test builds only special version of 
i915_gem_object_create_shmem. Call chain is deep but there are flags 
passed on:

i915_gem_object_create_shmem
   i915_gem_object_create_region
     __i915_gem_object_create_region
       err = mem->ops->init_object(

So we could add a new helper like:

selftests_create_shmem
   i915_gem_object_create_region(...flags = 
I915_BO_ALLOC_SELFTESTS_NOTHP...)

And in __create_shmem we just make it:

...
huge_mnt = drm_gem_get_huge_mnt(&i915->drm) &&
if (IS_ENABLED(..SELFTESTS..) &&
     (flags & I915_BO_ALLOC_SELFTESTS_NOTHP))
	huge_mnt = NULL;
...

It would avoid the ifdef and needing to play games with the DRM internals.

How does that sound to you?

Regards,

Tvrtko

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
