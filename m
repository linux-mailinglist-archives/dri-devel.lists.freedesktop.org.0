Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C8C75AC61
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362DE10E5A8;
	Thu, 20 Jul 2023 10:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0683610E00F;
 Thu, 20 Jul 2023 10:51:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3EAD2F4;
 Thu, 20 Jul 2023 03:52:16 -0700 (PDT)
Received: from [10.1.36.21] (e122027.cambridge.arm.com [10.1.36.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C0ED3F6C4;
 Thu, 20 Jul 2023 03:51:29 -0700 (PDT)
Message-ID: <010b58cd-1225-02f7-33f0-c678e5cd349d@arm.com>
Date: Thu, 20 Jul 2023 11:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v8 02/12] drm: debugfs: provide
 infrastructure to dump a DRM GPU VA space
Content-Language: en-GB
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com, Liam.Howlett@oracle.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-3-dakr@redhat.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230720001443.2380-3-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/07/2023 01:14, Danilo Krummrich wrote:
> This commit adds a function to dump a DRM GPU VA space and a macro for
> drivers to register the struct drm_info_list 'gpuvas' entry.
> 
> Most likely, most drivers might maintain one DRM GPU VA space per struct
> drm_file, but there might also be drivers not having a fixed relation
> between DRM GPU VA spaces and a DRM core infrastructure, hence we need the
> indirection via the driver iterating it's maintained DRM GPU VA spaces.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 40 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_debugfs.h     | 25 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 4855230ba2c6..c90dbcffa0dc 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -39,6 +39,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_managed.h>
> +#include <drm/drm_gpuva_mgr.h>
>  
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
> @@ -175,6 +176,45 @@ static const struct file_operations drm_debugfs_fops = {
>  	.release = single_release,
>  };
>  
> +/**
> + * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
> + * @m: pointer to the &seq_file to write
> + * @mgr: the &drm_gpuva_manager representing the GPU VA space
> + *
> + * Dumps the GPU VA mappings of a given DRM GPU VA manager.
> + *
> + * For each DRM GPU VA space drivers should call this function from their
> + * &drm_info_list's show callback.
> + *
> + * Returns: 0 on success, -ENODEV if the &mgr is not initialized
> + */
> +int drm_debugfs_gpuva_info(struct seq_file *m,
> +			   struct drm_gpuva_manager *mgr)
> +{
> +	struct drm_gpuva *va, *kva = &mgr->kernel_alloc_node;
> +
> +	if (!mgr->name)
> +		return -ENODEV;
> +
> +	seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
> +		   mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_range);
> +	seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
> +		   kva->va.addr, kva->va.addr + kva->va.range);
> +	seq_puts(m, "\n");
> +	seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
> +	seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
> +	drm_gpuva_for_each_va(va, mgr) {
> +		if (unlikely(va == kva))
> +			continue;
> +
> +		seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
> +			   va->va.addr, va->va.range, va->va.addr + va->va.range,
> +			   (u64)va->gem.obj, va->gem.offset);

Casting a pointer to u64 generates a warning on 32 bit systems:

drivers/gpu/drm/drm_debugfs.c:212:7: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  212 |       (u64)va->gem.obj, va->gem.offset);
      |       ^

Adding an extra cast to uintptr_t shuts the compiler up (alternatively a 
proper pointer type like %px could be used in the format string, but 
that does make the table layout harder).

The patch below fixes the warning for me.

Steve

----8<----
From bea59724d68fec0b3a56f82a42d0e4e59c514565 Mon Sep 17 00:00:00 2001
From: Steven Price <steven.price@arm.com>
Date: Thu, 20 Jul 2023 11:45:11 +0100
Subject: [PATCH] drm: debugfs: Silence warning from cast

Casting a pointer to an integer of a different size generates a warning
from the compiler. First cast the pointer to a pointer-sized type to
keep the compiler happy.

Fixes: 4f66feeab173 ("drm: debugfs: provide infrastructure to dump a DRM GPU VA space")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/drm_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index c90dbcffa0dc..a3a488205009 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -209,7 +209,7 @@ int drm_debugfs_gpuva_info(struct seq_file *m,
 
 		seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
 			   va->va.addr, va->va.range, va->va.addr + va->va.range,
-			   (u64)va->gem.obj, va->gem.offset);
+			   (u64)(uintptr_t)va->gem.obj, va->gem.offset);
 	}
 
 	return 0;
-- 
2.39.2


