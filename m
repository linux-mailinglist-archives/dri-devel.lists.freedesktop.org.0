Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984341A1EB9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 12:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8776EA16;
	Wed,  8 Apr 2020 10:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B0B6EA16
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 10:24:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1D60920027;
 Wed,  8 Apr 2020 12:24:28 +0200 (CEST)
Date: Wed, 8 Apr 2020 12:24:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vram-helpers: Merge code into a single file
Message-ID: <20200408102426.GE20795@ravnborg.org>
References: <20200331081238.24749-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331081238.24749-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=zBz-0SZ83vfO6NPXnGgA:9 a=37LNpR1G-j1i1rS5:21
 a=434DkKYYThrMyC3q:21 a=3pmAf5zrgIptfhJt:21 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: corbet@lwn.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.


On Tue, Mar 31, 2020 at 10:12:38AM +0200, Thomas Zimmermann wrote:
> Most of the documentation was in an otherwise empty file, which was
> probably just left from a previous clean-up effort. So move code and
> documentation into a single file.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Nice clean-up

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  Documentation/gpu/drm-mm.rst             |  9 ---
>  drivers/gpu/drm/Makefile                 |  3 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c    | 95 ++++++++++++++++++++++--
>  drivers/gpu/drm/drm_vram_helper_common.c | 94 -----------------------
>  4 files changed, 91 insertions(+), 110 deletions(-)
>  delete mode 100644 drivers/gpu/drm/drm_vram_helper_common.c
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index c77b326012606..1839762044be1 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -373,15 +373,6 @@ GEM CMA Helper Functions Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_gem_cma_helper.c
>     :export:
>  
> -VRAM Helper Function Reference
> -==============================
> -
> -.. kernel-doc:: drivers/gpu/drm/drm_vram_helper_common.c
> -   :doc: overview
> -
> -.. kernel-doc:: include/drm/drm_gem_vram_helper.h
> -   :internal:
> -
>  GEM VRAM Helper Functions Reference
>  -----------------------------------
>  
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 183c600483073..f34d08c834851 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -33,8 +33,7 @@ drm-$(CONFIG_PCI) += drm_pci.o
>  drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
>  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
>  
> -drm_vram_helper-y := drm_gem_vram_helper.o \
> -		     drm_vram_helper_common.o
> +drm_vram_helper-y := drm_gem_vram_helper.o
>  obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>  
>  drm_ttm_helper-y := drm_gem_ttm_helper.o
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index d4e4f80d3a6c1..d70e335f7ee3e 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  
> +#include <linux/module.h>
> +
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> @@ -19,13 +21,93 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>  /**
>   * DOC: overview
>   *
> - * This library provides a GEM buffer object that is backed by video RAM
> - * (VRAM). It can be used for framebuffer devices with dedicated memory.
> + * This library provides &struct drm_gem_vram_object (GEM VRAM), a GEM
> + * buffer object that is backed by video RAM (VRAM). It can be used for
> + * framebuffer devices with dedicated memory.
>   *
>   * The data structure &struct drm_vram_mm and its helpers implement a memory
> - * manager for simple framebuffer devices with dedicated video memory. Buffer
> - * objects are either placed in video RAM or evicted to system memory. The rsp.
> - * buffer object is provided by &struct drm_gem_vram_object.
> + * manager for simple framebuffer devices with dedicated video memory. GEM
> + * VRAM buffer objects are either placed in the video memory or remain evicted
> + * to system memory.
> + *
> + * With the GEM interface userspace applications create, manage and destroy
> + * graphics buffers, such as an on-screen framebuffer. GEM does not provide
> + * an implementation of these interfaces. It's up to the DRM driver to
> + * provide an implementation that suits the hardware. If the hardware device
> + * contains dedicated video memory, the DRM driver can use the VRAM helper
> + * library. Each active buffer object is stored in video RAM. Active
> + * buffer are used for drawing the current frame, typically something like
> + * the frame's scanout buffer or the cursor image. If there's no more space
> + * left in VRAM, inactive GEM objects can be moved to system memory.
> + *
> + * The easiest way to use the VRAM helper library is to call
> + * drm_vram_helper_alloc_mm(). The function allocates and initializes an
> + * instance of &struct drm_vram_mm in &struct drm_device.vram_mm . Use
> + * &DRM_GEM_VRAM_DRIVER to initialize &struct drm_driver and
> + * &DRM_VRAM_MM_FILE_OPERATIONS to initialize &struct file_operations;
> + * as illustrated below.
> + *
> + * .. code-block:: c
> + *
> + *	struct file_operations fops ={
> + *		.owner = THIS_MODULE,
> + *		DRM_VRAM_MM_FILE_OPERATION
> + *	};
> + *	struct drm_driver drv = {
> + *		.driver_feature = DRM_ ... ,
> + *		.fops = &fops,
> + *		DRM_GEM_VRAM_DRIVER
> + *	};
> + *
> + *	int init_drm_driver()
> + *	{
> + *		struct drm_device *dev;
> + *		uint64_t vram_base;
> + *		unsigned long vram_size;
> + *		int ret;
> + *
> + *		// setup device, vram base and size
> + *		// ...
> + *
> + *		ret = drm_vram_helper_alloc_mm(dev, vram_base, vram_size);
> + *		if (ret)
> + *			return ret;
> + *		return 0;
> + *	}
> + *
> + * This creates an instance of &struct drm_vram_mm, exports DRM userspace
> + * interfaces for GEM buffer management and initializes file operations to
> + * allow for accessing created GEM buffers. With this setup, the DRM driver
> + * manages an area of video RAM with VRAM MM and provides GEM VRAM objects
> + * to userspace.
> + *
> + * To clean up the VRAM memory management, call drm_vram_helper_release_mm()
> + * in the driver's clean-up code.
> + *
> + * .. code-block:: c
> + *
> + *	void fini_drm_driver()
> + *	{
> + *		struct drm_device *dev = ...;
> + *
> + *		drm_vram_helper_release_mm(dev);
> + *	}
> + *
> + * For drawing or scanout operations, buffer object have to be pinned in video
> + * RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_VRAM or
> + * &DRM_GEM_VRAM_PL_FLAG_SYSTEM to pin a buffer object in video RAM or system
> + * memory. Call drm_gem_vram_unpin() to release the pinned object afterwards.
> + *
> + * A buffer object that is pinned in video RAM has a fixed address within that
> + * memory region. Call drm_gem_vram_offset() to retrieve this value. Typically
> + * it's used to program the hardware's scanout engine for framebuffers, set
> + * the cursor overlay's image for a mouse cursor, or use it as input to the
> + * hardware's draing engine.
> + *
> + * To access a buffer object's memory from the DRM driver, call
> + * drm_gem_vram_kmap(). It (optionally) maps the buffer into kernel address
> + * space and returns the memory address. Use drm_gem_vram_kunmap() to
> + * release the mapping.
>   */
>  
>  /*
> @@ -1204,3 +1286,6 @@ drm_vram_helper_mode_valid(struct drm_device *dev,
>  	return drm_vram_helper_mode_valid_internal(dev, mode, max_bpp);
>  }
>  EXPORT_SYMBOL(drm_vram_helper_mode_valid);
> +
> +MODULE_DESCRIPTION("DRM VRAM memory-management helpers");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/drm_vram_helper_common.c b/drivers/gpu/drm/drm_vram_helper_common.c
> deleted file mode 100644
> index 2000d9b33fd52..0000000000000
> --- a/drivers/gpu/drm/drm_vram_helper_common.c
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -
> -#include <linux/module.h>
> -
> -/**
> - * DOC: overview
> - *
> - * This library provides &struct drm_gem_vram_object (GEM VRAM), a GEM
> - * buffer object that is backed by video RAM. It can be used for
> - * framebuffer devices with dedicated memory. The video RAM is managed
> - * by &struct drm_vram_mm (VRAM MM).
> - *
> - * With the GEM interface userspace applications create, manage and destroy
> - * graphics buffers, such as an on-screen framebuffer. GEM does not provide
> - * an implementation of these interfaces. It's up to the DRM driver to
> - * provide an implementation that suits the hardware. If the hardware device
> - * contains dedicated video memory, the DRM driver can use the VRAM helper
> - * library. Each active buffer object is stored in video RAM. Active
> - * buffer are used for drawing the current frame, typically something like
> - * the frame's scanout buffer or the cursor image. If there's no more space
> - * left in VRAM, inactive GEM objects can be moved to system memory.
> - *
> - * The easiest way to use the VRAM helper library is to call
> - * drm_vram_helper_alloc_mm(). The function allocates and initializes an
> - * instance of &struct drm_vram_mm in &struct drm_device.vram_mm . Use
> - * &DRM_GEM_VRAM_DRIVER to initialize &struct drm_driver and
> - * &DRM_VRAM_MM_FILE_OPERATIONS to initialize &struct file_operations;
> - * as illustrated below.
> - *
> - * .. code-block:: c
> - *
> - *	struct file_operations fops ={
> - *		.owner = THIS_MODULE,
> - *		DRM_VRAM_MM_FILE_OPERATION
> - *	};
> - *	struct drm_driver drv = {
> - *		.driver_feature = DRM_ ... ,
> - *		.fops = &fops,
> - *		DRM_GEM_VRAM_DRIVER
> - *	};
> - *
> - *	int init_drm_driver()
> - *	{
> - *		struct drm_device *dev;
> - *		uint64_t vram_base;
> - *		unsigned long vram_size;
> - *		int ret;
> - *
> - *		// setup device, vram base and size
> - *		// ...
> - *
> - *		ret = drm_vram_helper_alloc_mm(dev, vram_base, vram_size);
> - *		if (ret)
> - *			return ret;
> - *		return 0;
> - *	}
> - *
> - * This creates an instance of &struct drm_vram_mm, exports DRM userspace
> - * interfaces for GEM buffer management and initializes file operations to
> - * allow for accessing created GEM buffers. With this setup, the DRM driver
> - * manages an area of video RAM with VRAM MM and provides GEM VRAM objects
> - * to userspace.
> - *
> - * To clean up the VRAM memory management, call drm_vram_helper_release_mm()
> - * in the driver's clean-up code.
> - *
> - * .. code-block:: c
> - *
> - *	void fini_drm_driver()
> - *	{
> - *		struct drm_device *dev = ...;
> - *
> - *		drm_vram_helper_release_mm(dev);
> - *	}
> - *
> - * For drawing or scanout operations, buffer object have to be pinned in video
> - * RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_VRAM or
> - * &DRM_GEM_VRAM_PL_FLAG_SYSTEM to pin a buffer object in video RAM or system
> - * memory. Call drm_gem_vram_unpin() to release the pinned object afterwards.
> - *
> - * A buffer object that is pinned in video RAM has a fixed address within that
> - * memory region. Call drm_gem_vram_offset() to retrieve this value. Typically
> - * it's used to program the hardware's scanout engine for framebuffers, set
> - * the cursor overlay's image for a mouse cursor, or use it as input to the
> - * hardware's draing engine.
> - *
> - * To access a buffer object's memory from the DRM driver, call
> - * drm_gem_vram_kmap(). It (optionally) maps the buffer into kernel address
> - * space and returns the memory address. Use drm_gem_vram_kunmap() to
> - * release the mapping.
> - */
> -
> -MODULE_DESCRIPTION("DRM VRAM memory-management helpers");
> -MODULE_LICENSE("GPL");
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
