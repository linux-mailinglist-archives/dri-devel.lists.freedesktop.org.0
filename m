Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA50DB2F02F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9133410E2D9;
	Thu, 21 Aug 2025 07:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WZyDfRWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB1310E2D9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755762928;
 bh=HJAMs7DrQ8eVP6HgWB2Z2iOopdRHkgXm32xkR1vCSNc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WZyDfRWyNuWk7C0mRxMgBuKAJ1RFKj6o4D4N2PCyDolsU1e9+64bIoYkjBX8XEeUl
 ay10sNzzhKVFzT5cfND6dE5/vE2z6k5rjtNYs86KlsmiWEhBQ3FwAjZhMv89kQJVY1
 aevqJBiNWBtAX+8Rt8U3JgQf25+yfslprB0p5jeYlgUUXV8Qu7/udA09hVckudw8vp
 wwjC5czKTQBGWR/gQsBQk1Nq1+79+/y3o1UxGX/azX6So4wJvmkaR/NSkaZ8LS3S1R
 lkuzy+/iqjNUCmXeSp5PDbJBxOspu6pxH1h2oOxSC64U9eJBfP+8n9EyADIuzfNRPE
 +lKVRa6dSydwA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D973517E0458;
 Thu, 21 Aug 2025 09:55:27 +0200 (CEST)
Date: Thu, 21 Aug 2025 09:55:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 9/9] drm/panthor: add DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE
Message-ID: <20250821095523.6d142bfe@fedora>
In-Reply-To: <20250720000146.1405060-10-olvaffe@gmail.com>
References: <20250720000146.1405060-1-olvaffe@gmail.com>
 <20250720000146.1405060-10-olvaffe@gmail.com>
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

On Sat, 19 Jul 2025 17:01:46 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> When the flag is set, bo data is captured for devcoredump.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/panthor/panthor_coredump.c | 36 ++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c      |  3 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c      |  7 +++--
>  include/uapi/drm/panthor_drm.h             |  7 +++++
>  4 files changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_coredump.c b/drivers/gpu/drm/panthor/panthor_coredump.c
> index 5502452a5baa..db5695b38c2d 100644
> --- a/drivers/gpu/drm/panthor/panthor_coredump.c
> +++ b/drivers/gpu/drm/panthor/panthor_coredump.c
> @@ -5,6 +5,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_managed.h>
>  #include <generated/utsrelease.h>
> +#include <linux/ascii85.h>
>  #include <linux/devcoredump.h>
>  #include <linux/err.h>
>  #include <linux/pm_runtime.h>
> @@ -99,6 +100,26 @@ static const char *reason_str(enum panthor_coredump_reason reason)
>  	}
>  }
>  
> +static void print_bo(struct drm_printer *p, struct panthor_gem_object *bo,
> +		     u64 offset, u64 size)
> +{
> +	struct iosys_map map;
> +	const u32 *vals;
> +	u64 count;
> +	char buf[ASCII85_BUFSZ];
> +
> +	if (drm_gem_vmap(&bo->base.base, &map))
> +		return;
> +
> +	/* offset and size are aligned to panthor_vm_page_size, which is SZ_4K */
> +	vals = map.vaddr + offset;
> +	count = size / sizeof(u32);
> +	for (u64 i = 0; i < count; i++)
> +		drm_puts(p, ascii85_encode(vals[i], buf));
> +
> +	drm_gem_vunmap(&bo->base.base, &map);
> +}
> +
>  static void print_vma(struct drm_printer *p,
>  		      const struct panthor_coredump_vma_state *vma, u32 vma_id,
>  		      size_t *max_dyn_size)
> @@ -129,6 +150,21 @@ static void print_vma(struct drm_printer *p,
>  			}
>  		}
>  	}
> +
> +	if (vma->flags & DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE) {
> +		drm_puts(p, "    data: |\n");
> +		drm_puts(p, "      ");
> +
> +		/* bo data is dynamic */
> +		if (max_dyn_size) {
> +			*max_dyn_size +=
> +				vma->size / sizeof(u32) * (ASCII85_BUFSZ - 1);
> +		} else {
> +			print_bo(p, bo, vma->bo_offset, vma->size);
> +		}

Back when Daniel was working on it, I suggested dumping VAs and BOs
content separately, so we can shrink the dumps when sparse is involved.
Otherwise you'll have these huge VA range filled with repeated dummy
pages. It's then up to the coredump analysis tool to reconstruct the
mapping between VAs and BOs.

> +
> +		drm_puts(p, "\n");
> +	}
>  }
>  
>  static void print_as(struct drm_printer *p,
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 1116f2d2826e..6c4de1e73cd1 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1608,6 +1608,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
>   * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
>   * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
> + * - 1.6 - adds DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE flag
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1621,7 +1622,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 5,
> +	.minor = 6,
>  
>  	.gem_create_object = panthor_gem_create_object,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 7862c99984b6..72b1b2799b65 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2045,10 +2045,11 @@ static void panthor_vma_init(struct panthor_vma *vma, u32 flags)
>  	vma->flags = flags;
>  }
>  
> -#define PANTHOR_VM_MAP_FLAGS \
> +#define PANTHOR_VM_MAP_FLAGS                   \
>  	(DRM_PANTHOR_VM_BIND_OP_MAP_READONLY | \
> -	 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC | \
> -	 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED)
> +	 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |   \
> +	 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED | \
> +	 DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE)
>  
>  static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
>  {
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index e1f43deb7eca..c4c5e38365e9 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -496,6 +496,13 @@ enum drm_panthor_vm_bind_op_flags {
>  	 */
>  	DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED = 1 << 2,
>  
> +	/**
> +	 * @DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE: Dump the VMA for devcoredump.
> +	 *
> +	 * Only valid with DRM_PANTHOR_VM_BIND_OP_TYPE_MAP.
> +	 */
> +	DRM_PANTHOR_VM_BIND_OP_MAP_DUMPABLE = 1 << 3,

It feels weird to have this verbose-dump option exposed as a VM
bind flag. Is there anything in the Vulkan GPU crash extension that
allows flagging individual memory objects are dumpable? I understand
that dumping all the VM data means generating potentially huge dumps,
and that you sometimes could trim that out because all you care about
in your debug session is CS/shader binaries, but other times it proves
useful to have regular buffers dumped too. If the coredump is
partial, it means you'll have to go and ask for users to try and
reproduce the issue with a dump_all flags set.

Given devcoredump is a device interface (meaning we can't really filter
coredumps per context), I'd be tempted to make this 'dont-dump-BOs'
option an opt-out debugfs knob, so that, by default, everything is
dumped.

> +
>  	/**
>  	 * @DRM_PANTHOR_VM_BIND_OP_TYPE_MASK: Mask used to determine the type of operation.
>  	 */

