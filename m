Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5A04192EE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 13:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C90889F5F;
	Mon, 27 Sep 2021 11:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE5089F5F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 11:15:43 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y26so36367725lfa.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 04:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nytx1psXZos7fBXo8fRQHhhbEyY0dk/iAI31MQ3csus=;
 b=Z9h0PlHch69FSTFWWNcpbbTRC0dgselKw/JFTX5HCxaKJXbiUQoAywZ6ZXkQzL4+Cr
 geNs42d02rr2YyB8OjJoZ4v95RKUC1tAjxAGYUjdOp/aN/DEbdYx+NULup422f+jAwDH
 DatoxifbBGRYmP94QmGbeeihsOEVHBuztRM4wILc+bFtzU5R9d0j+rrCHVXMW3DnruhX
 TIsWdycS0klFR8WdtPRPge70tztJ43pac9eJ4mX2YGnzUsrF9bElLA/lj6WdTaStIITu
 fBs/iVax1VRtNYxG9R3XmTzRUkpFb+1smgMTdJhmHhxf6VNlUdoJx7NzY9rSIQjg6140
 oYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nytx1psXZos7fBXo8fRQHhhbEyY0dk/iAI31MQ3csus=;
 b=uY32ckIiv2ryNoVrRJt+1wDBLv/JaronrAhAp0g7wjqFKFjR95ObBVwJq+H4dW8pm2
 YBxCV0CPv3FQQ6exk8H+16MjGUXJEjGvRsLLbksqswp3PSe2j/qp2FSkDLnSDiqb9UMg
 Uy8e+zN89YF5yHzdEth9Xac6iuFCXqvX66NrU4yHw3Sf19eiT3Rhoxrqor8qy5qz41Q3
 vw5cQtKE1GWDb+KNZaF4VU+z9KOnwV+oUyGGaoVx9dPoPAGYjgOL58VZsG2AZsnupd0h
 2vXxzRqxfwiuM3BpaaDO7TMsCvDn9xy5pk5fe/LKgPNn2dsTTUDIJxJVBJU/TmreUgs1
 626Q==
X-Gm-Message-State: AOAM533mJ8K/F046VNn6mff/TpLgAKgMgYSSeDjHIlsqZahnXGeBHHH5
 w553OgyDrPvPLRiXr7rBk5P/qLVGE8Y5Dn4ko880ZQ==
X-Google-Smtp-Source: ABdhPJwkO8gw29C3Y+XIXNRBqClcZSCUznojzq/ggYStlUfvA9NXoSUgz6ICD6SVKCc0l4mDOMuDojJbJ7fEeRJjOLk=
X-Received: by 2002:a2e:9707:: with SMTP id r7mr27147422lji.121.1632741341747; 
 Mon, 27 Sep 2021 04:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <YU8oVDFoeD5YYeDT@kroah.com>
In-Reply-To: <YU8oVDFoeD5YYeDT@kroah.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 27 Sep 2021 16:45:29 +0530
Message-ID: <CAO_48GG-ygn6ox0JUM89qEO9BG662pBU5KKjx2R+T2ftCs75_Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000af706205ccf8378f"
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

--000000000000af706205ccf8378f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Greg,

Thanks for the patch!

On Sat, 25 Sept 2021 at 19:17, Greg Kroah-Hartman <
gregkh@linuxfoundation.org> wrote:

> In order to better track where in the kernel the dma-buf code is used,
> put the symbols in the namespace DMA_BUF and modify all users of the
> symbols to properly import the namespace to not break the build at the
> same time.
>
> Now the output of modinfo shows the use of these symbols, making it
> easier to watch for users over time:
>
> $ modinfo drivers/misc/fastrpc.ko | grep import
> import_ns:      DMA_BUF
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>

With the addition of the 2 misses found by Arnd, please feel free to add my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

> ---
>
> The topic of dma-buf came up in the Maintainer's summit yesterday, and
> one comment was to put the symbols in their own module namespace, to
> make it easier to notice and track who was using them.  This patch does
> so, and finds some "interesting" users of the api already in the tree.
>
> Only test-built on x86 allmodconfig, don't know what other arches will
> pick up, will let 0-day run on it for a bit...
>
> Comments?


>
>
>  drivers/dma-buf/dma-buf.c                     | 34 +++++++++----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  3 ++
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  3 ++
>  drivers/gpu/drm/drm_prime.c                   |  3 ++
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  3 ++
>  drivers/gpu/drm/exynos/exynos_drm_gem.c       |  3 ++
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  3 ++
>  drivers/gpu/drm/tegra/gem.c                   |  3 ++
>  drivers/gpu/drm/vmwgfx/ttm_object.c           |  3 ++
>  drivers/infiniband/core/umem_dmabuf.c         |  3 ++
>  .../media/common/videobuf2/videobuf2-core.c   |  1 +
>  .../common/videobuf2/videobuf2-dma-contig.c   |  1 +
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  1 +
>  .../common/videobuf2/videobuf2-vmalloc.c      |  1 +
>  drivers/misc/fastrpc.c                        |  1 +
>  .../staging/media/tegra-vde/dmabuf-cache.c    |  3 ++
>  drivers/tee/tee_shm.c                         |  3 ++
>  drivers/virtio/virtio_dma_buf.c               |  1 +
>  drivers/xen/gntdev-dmabuf.c                   |  3 ++
>  samples/vfio-mdev/mbochs.c                    |  1 +
>  20 files changed, 60 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 63d32261b63f..6c2b5ea828a6 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -610,7 +610,7 @@ struct dma_buf *dma_buf_export(const struct
> dma_buf_export_info *exp_info)
>         module_put(exp_info->owner);
>         return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_export);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_export, DMA_BUF);
>
>  /**
>   * dma_buf_fd - returns a file descriptor for the given struct dma_buf
> @@ -634,7 +634,7 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
>
>         return fd;
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_fd);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_fd, DMA_BUF);
>
>  /**
>   * dma_buf_get - returns the struct dma_buf related to an fd
> @@ -660,7 +660,7 @@ struct dma_buf *dma_buf_get(int fd)
>
>         return file->private_data;
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_get);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_get, DMA_BUF);
>
>  /**
>   * dma_buf_put - decreases refcount of the buffer
> @@ -679,7 +679,7 @@ void dma_buf_put(struct dma_buf *dmabuf)
>
>         fput(dmabuf->file);
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_put);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_put, DMA_BUF);
>
>  static void mangle_sg_table(struct sg_table *sg_table)
>  {
> @@ -810,7 +810,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct
> device *dev,
>         dma_buf_detach(dmabuf, attach);
>         return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_dynamic_attach);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, DMA_BUF);
>
>  /**
>   * dma_buf_attach - Wrapper for dma_buf_dynamic_attach
> @@ -825,7 +825,7 @@ struct dma_buf_attachment *dma_buf_attach(struct
> dma_buf *dmabuf,
>  {
>         return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_attach);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_attach, DMA_BUF);
>
>  static void __unmap_dma_buf(struct dma_buf_attachment *attach,
>                             struct sg_table *sg_table,
> @@ -871,7 +871,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct
> dma_buf_attachment *attach)
>
>         kfree(attach);
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_detach);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_detach, DMA_BUF);
>
>  /**
>   * dma_buf_pin - Lock down the DMA-buf
> @@ -901,7 +901,7 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
>
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_pin);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_pin, DMA_BUF);
>
>  /**
>   * dma_buf_unpin - Unpin a DMA-buf
> @@ -922,7 +922,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
>         if (dmabuf->ops->unpin)
>                 dmabuf->ops->unpin(attach);
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_unpin);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
>
>  /**
>   * dma_buf_map_attachment - Returns the scatterlist table of the
> attachment;
> @@ -1012,7 +1012,7 @@ struct sg_table *dma_buf_map_attachment(struct
> dma_buf_attachment *attach,
>  #endif /* CONFIG_DMA_API_DEBUG */
>         return sg_table;
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
>
>  /**
>   * dma_buf_unmap_attachment - unmaps and decreases usecount of the
> buffer;might
> @@ -1048,7 +1048,7 @@ void dma_buf_unmap_attachment(struct
> dma_buf_attachment *attach,
>             !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>                 dma_buf_unpin(attach);
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
>
>  /**
>   * dma_buf_move_notify - notify attachments that DMA-buf is moving
> @@ -1068,7 +1068,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)
>                 if (attach->importer_ops)
>                         attach->importer_ops->move_notify(attach);
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_move_notify);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
>
>  /**
>   * DOC: cpu access
> @@ -1212,7 +1212,7 @@ int dma_buf_begin_cpu_access(struct dma_buf *dmabuf=
,
>
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_begin_cpu_access);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, DMA_BUF);
>
>  /**
>   * dma_buf_end_cpu_access - Must be called after accessing a dma_buf fro=
m
> the
> @@ -1240,7 +1240,7 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
>
>
>  /**
> @@ -1282,7 +1282,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct
> vm_area_struct *vma,
>
>         return dmabuf->ops->mmap(dmabuf, vma);
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_mmap);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>
>  /**
>   * dma_buf_vmap - Create virtual mapping for the buffer object into kern=
el
> @@ -1336,7 +1336,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct
> dma_buf_map *map)
>         mutex_unlock(&dmabuf->lock);
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_vmap);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
>
>  /**
>   * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
> @@ -1360,7 +1360,7 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct
> dma_buf_map *map)
>         }
>         mutex_unlock(&dmabuf->lock);
>  }
> -EXPORT_SYMBOL_GPL(dma_buf_vunmap);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
>
>  #ifdef CONFIG_DEBUG_FS
>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 38dade421d46..38e144504649 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -41,6 +41,7 @@
>  #include <linux/swiotlb.h>
>  #include <linux/dma-buf.h>
>  #include <linux/sizes.h>
> +#include <linux/module.h>
>
>  #include <drm/ttm/ttm_bo_api.h>
>  #include <drm/ttm/ttm_bo_driver.h>
> @@ -59,6 +60,8 @@
>  #include "amdgpu_res_cursor.h"
>  #include "bif/bif_4_1_d.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  #define AMDGPU_TTM_VRAM_MAX_DW_READ    (size_t)128
>
>  static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 3c75d79dbb65..746fd8c73845 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/slab.h>
> +#include <linux/module.h>
>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_fb_helper.h>
> @@ -17,6 +18,8 @@
>
>  #include "drm_internal.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  #define AFBC_HEADER_SIZE               16
>  #define AFBC_TH_LAYOUT_ALIGNMENT       8
>  #define AFBC_HDR_ALIGN                 64
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index deb23dbec8b5..d8ba95744410 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -29,6 +29,7 @@
>  #include <linux/export.h>
>  #include <linux/dma-buf.h>
>  #include <linux/rbtree.h>
> +#include <linux/module.h>
>
>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
> @@ -39,6 +40,8 @@
>
>  #include "drm_internal.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  /**
>   * DOC: overview and lifetime rules
>   *
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 6d8bed9c739d..6788ea8490d1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -5,10 +5,13 @@
>
>  #include <drm/drm_prime.h>
>  #include <linux/dma-buf.h>
> +#include <linux/module.h>
>
>  #include "etnaviv_drv.h"
>  #include "etnaviv_gem.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  static struct lock_class_key etnaviv_prime_lock_class;
>
>  struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object
> *obj)
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 4396224227d1..0a0c042a3155 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -9,6 +9,7 @@
>  #include <linux/dma-buf.h>
>  #include <linux/pfn_t.h>
>  #include <linux/shmem_fs.h>
> +#include <linux/module.h>
>
>  #include <drm/drm_prime.h>
>  #include <drm/drm_vma_manager.h>
> @@ -17,6 +18,8 @@
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_gem.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool
> kvmap)
>  {
>         struct drm_device *dev =3D exynos_gem->base.dev;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index afa34111de02..abb854281347 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -7,11 +7,14 @@
>  #include <linux/dma-buf.h>
>  #include <linux/highmem.h>
>  #include <linux/dma-resv.h>
> +#include <linux/module.h>
>
>  #include "i915_drv.h"
>  #include "i915_gem_object.h"
>  #include "i915_scatterlist.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  I915_SELFTEST_DECLARE(static bool force_different_devices;)
>
>  static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 6ec598f5d5b3..d38fd7e12b57 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -12,6 +12,7 @@
>
>  #include <linux/dma-buf.h>
>  #include <linux/iommu.h>
> +#include <linux/module.h>
>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_prime.h>
> @@ -20,6 +21,8 @@
>  #include "drm.h"
>  #include "gem.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  static void tegra_bo_put(struct host1x_bo *bo)
>  {
>         struct tegra_bo *obj =3D host1x_to_tegra_bo(bo);
> diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c
> b/drivers/gpu/drm/vmwgfx/ttm_object.c
> index 04789b2bb2a2..899945f54dc7 100644
> --- a/drivers/gpu/drm/vmwgfx/ttm_object.c
> +++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
> @@ -48,8 +48,11 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>  #include <linux/atomic.h>
> +#include <linux/module.h>
>  #include "ttm_object.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  /**
>   * struct ttm_object_file
>   *
> diff --git a/drivers/infiniband/core/umem_dmabuf.c
> b/drivers/infiniband/core/umem_dmabuf.c
> index e824baf4640d..2d14929543af 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -6,9 +6,12 @@
>  #include <linux/dma-buf.h>
>  #include <linux/dma-resv.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/module.h>
>
>  #include "uverbs.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>  {
>         struct sg_table *sgt;
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c
> b/drivers/media/common/videobuf2/videobuf2-core.c
> index 508ac295eb06..773c68dcd158 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2978,3 +2978,4 @@ EXPORT_SYMBOL_GPL(vb2_thread_stop);
>  MODULE_DESCRIPTION("Media buffer core framework");
>  MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>, Marek Szyprowski");
>  MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index a7f61ba85440..9a1a9baca2e4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -755,3 +755,4 @@ EXPORT_SYMBOL_GPL(vb2_dma_contig_set_max_seg_size);
>  MODULE_DESCRIPTION("DMA-contig memory handling routines for videobuf2");
>  MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>");
>  MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index c5b06a509566..db90ebb8950f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -666,3 +666,4 @@ EXPORT_SYMBOL_GPL(vb2_dma_sg_memops);
>  MODULE_DESCRIPTION("dma scatter/gather memory handling routines for
> videobuf2");
>  MODULE_AUTHOR("Andrzej Pietrasiewicz");
>  MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 83f95258ec8c..fa983897d0e9 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -444,3 +444,4 @@ EXPORT_SYMBOL_GPL(vb2_vmalloc_memops);
>  MODULE_DESCRIPTION("vmalloc memory handling routines for videobuf2");
>  MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>");
>  MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index beda610e6b30..fa5c067f1c1e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1763,3 +1763,4 @@ static void fastrpc_exit(void)
>  module_exit(fastrpc_exit);
>
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/staging/media/tegra-vde/dmabuf-cache.c
> b/drivers/staging/media/tegra-vde/dmabuf-cache.c
> index a93b317885bf..a98d03419b8f 100644
> --- a/drivers/staging/media/tegra-vde/dmabuf-cache.c
> +++ b/drivers/staging/media/tegra-vde/dmabuf-cache.c
> @@ -12,9 +12,12 @@
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> +#include <linux/module.h>
>
>  #include "vde.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  struct tegra_vde_cache_entry {
>         enum dma_data_direction dma_dir;
>         struct dma_buf_attachment *a;
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 8a9384a64f3e..8a8deb95e918 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -10,8 +10,11 @@
>  #include <linux/slab.h>
>  #include <linux/tee_drv.h>
>  #include <linux/uio.h>
> +#include <linux/module.h>
>  #include "tee_private.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  static void release_registered_pages(struct tee_shm *shm)
>  {
>         if (shm->pages) {
> diff --git a/drivers/virtio/virtio_dma_buf.c
> b/drivers/virtio/virtio_dma_buf.c
> index 5127a2f0c986..2521a75009c3 100644
> --- a/drivers/virtio/virtio_dma_buf.c
> +++ b/drivers/virtio/virtio_dma_buf.c
> @@ -86,3 +86,4 @@ int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
>  EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
>
>  MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(DMA_BUF);
> diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
> index 4c13cbc99896..12e380db7f55 100644
> --- a/drivers/xen/gntdev-dmabuf.c
> +++ b/drivers/xen/gntdev-dmabuf.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/uaccess.h>
> +#include <linux/module.h>
>
>  #include <xen/xen.h>
>  #include <xen/grant_table.h>
> @@ -21,6 +22,8 @@
>  #include "gntdev-common.h"
>  #include "gntdev-dmabuf.h"
>
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  #ifndef GRANT_INVALID_REF
>  /*
>   * Note on usage of grant reference 0 as invalid grant reference:
> diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> index c313ab4d1f4e..a83be6cd162f 100644
> --- a/samples/vfio-mdev/mbochs.c
> +++ b/samples/vfio-mdev/mbochs.c
> @@ -1493,5 +1493,6 @@ static void __exit mbochs_dev_exit(void)
>         mbochs_class =3D NULL;
>  }
>
> +MODULE_IMPORT_NS(DMA_BUF);
>  module_init(mbochs_dev_init)
>  module_exit(mbochs_dev_exit)
> --
> 2.33.0
>
>
Best,
Sumit.

--000000000000af706205ccf8378f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Greg,<div><br></div><div>Thanks for=
 the patch!</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sat, 25 Sept 2021 at 19:17, Greg Kroah-Hartman &lt;<a h=
ref=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In orde=
r to better track where in the kernel the dma-buf code is used,<br>
put the symbols in the namespace DMA_BUF and modify all users of the<br>
symbols to properly import the namespace to not break the build at the<br>
same time.<br>
<br>
Now the output of modinfo shows the use of these symbols, making it<br>
easier to watch for users over time:<br>
<br>
$ modinfo drivers/misc/fastrpc.ko | grep import<br>
import_ns:=C2=A0 =C2=A0 =C2=A0 DMA_BUF<br>
<br>
Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org" target=3D"_=
blank">sumit.semwal@linaro.org</a>&gt;<br>
Cc: &quot;Christian K=C3=B6nig&quot; &lt;<a href=3D"mailto:christian.koenig=
@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
Cc: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com" target=3D=
"_blank">alexander.deucher@amd.com</a>&gt;<br>
Cc: &quot;Pan, Xinhui&quot; &lt;<a href=3D"mailto:Xinhui.Pan@amd.com" targe=
t=3D"_blank">Xinhui.Pan@amd.com</a>&gt;<br>
Cc: David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" target=3D"_blank">=
airlied@linux.ie</a>&gt;<br>
Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_blank">=
daniel@ffwll.ch</a>&gt;<br>
Cc: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@linux.intel.c=
om" target=3D"_blank">maarten.lankhorst@linux.intel.com</a>&gt;<br>
Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" target=3D"_blan=
k">mripard@kernel.org</a>&gt;<br>
Cc: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" target=3D"=
_blank">tzimmermann@suse.de</a>&gt;<br>
Cc: Mauro Carvalho Chehab &lt;<a href=3D"mailto:mchehab@kernel.org" target=
=3D"_blank">mchehab@kernel.org</a>&gt;<br>
Cc: Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de" target=3D"_blank">ar=
nd@arndb.de</a>&gt;<br>
Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dr=
i-devel@lists.freedesktop.org</a><br>
Signed-off-by: Greg Kroah-Hartman &lt;<a href=3D"mailto:gregkh@linuxfoundat=
ion.org" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt;<br></blockquo=
te><div><br></div><div>With the addition of the 2 misses found by Arnd, ple=
ase feel free to add my</div><div>Acked-by: Sumit Semwal &lt;<a href=3D"mai=
lto:sumit.semwal@linaro.org">sumit.semwal@linaro.org</a>&gt;=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
The topic of dma-buf came up in the Maintainer&#39;s summit yesterday, and<=
br>
one comment was to put the symbols in their own module namespace, to<br>
make it easier to notice and track who was using them.=C2=A0 This patch doe=
s<br>
so, and finds some &quot;interesting&quot; users of the api already in the =
tree.<br>
<br>
Only test-built on x86 allmodconfig, don&#39;t know what other arches will<=
br>
pick up, will let 0-day run on it for a bit...<br>
<br>
Comments?=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
<br>
<br>
=C2=A0drivers/dma-buf/dma-buf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 34 +++++++++----------<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 ++<br>
=C2=A0drivers/gpu/drm/drm_gem_framebuffer_helper.c=C2=A0 |=C2=A0 3 ++<br>
=C2=A0drivers/gpu/drm/drm_prime.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++<br>
=C2=A0drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c=C2=A0 =C2=A0|=C2=A0 3 ++<=
br>
=C2=A0drivers/gpu/drm/exynos/exynos_drm_gem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 ++<br>
=C2=A0drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c=C2=A0 =C2=A0 |=C2=A0 3 ++<=
br>
=C2=A0drivers/gpu/drm/tegra/gem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++<br>
=C2=A0drivers/gpu/drm/vmwgfx/ttm_object.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 ++<br>
=C2=A0drivers/infiniband/core/umem_dmabuf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 ++<br>
=C2=A0.../media/common/videobuf2/videobuf2-core.c=C2=A0 =C2=A0|=C2=A0 1 +<b=
r>
=C2=A0.../common/videobuf2/videobuf2-dma-contig.c=C2=A0 =C2=A0|=C2=A0 1 +<b=
r>
=C2=A0.../media/common/videobuf2/videobuf2-dma-sg.c |=C2=A0 1 +<br>
=C2=A0.../common/videobuf2/videobuf2-vmalloc.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0drivers/misc/fastrpc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../staging/media/tegra-vde/dmabuf-cache.c=C2=A0 =C2=A0 |=C2=A0 3 ++<=
br>
=C2=A0drivers/tee/tee_shm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++<br>
=C2=A0drivers/virtio/virtio_dma_buf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0drivers/xen/gntdev-dmabuf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++<br>
=C2=A0samples/vfio-mdev/mbochs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A020 files changed, 60 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c<br>
index 63d32261b63f..6c2b5ea828a6 100644<br>
--- a/drivers/dma-buf/dma-buf.c<br>
+++ b/drivers/dma-buf/dma-buf.c<br>
@@ -610,7 +610,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_exp=
ort_info *exp_info)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 module_put(exp_info-&gt;owner);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(ret);<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_export);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_export, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_fd - returns a file descriptor for the given struct dma_bu=
f<br>
@@ -634,7 +634,7 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fd;<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_fd);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_fd, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_get - returns the struct dma_buf related to an fd<br>
@@ -660,7 +660,7 @@ struct dma_buf *dma_buf_get(int fd)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return file-&gt;private_data;<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_get);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_get, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_put - decreases refcount of the buffer<br>
@@ -679,7 +679,7 @@ void dma_buf_put(struct dma_buf *dmabuf)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fput(dmabuf-&gt;file);<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_put);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_put, DMA_BUF);<br>
<br>
=C2=A0static void mangle_sg_table(struct sg_table *sg_table)<br>
=C2=A0{<br>
@@ -810,7 +810,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct d=
evice *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_buf_detach(dmabuf, attach);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(ret);<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_dynamic_attach);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_attach - Wrapper for dma_buf_dynamic_attach<br>
@@ -825,7 +825,7 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_bu=
f *dmabuf,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return dma_buf_dynamic_attach(dmabuf, dev, NULL=
, NULL);<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_attach);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_attach, DMA_BUF);<br>
<br>
=C2=A0static void __unmap_dma_buf(struct dma_buf_attachment *attach,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct sg_table *sg_table,<br>
@@ -871,7 +871,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_=
buf_attachment *attach)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(attach);<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_detach);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_detach, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_pin - Lock down the DMA-buf<br>
@@ -901,7 +901,7 @@ int dma_buf_pin(struct dma_buf_attachment *attach)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_pin);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_pin, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_unpin - Unpin a DMA-buf<br>
@@ -922,7 +922,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dmabuf-&gt;ops-&gt;unpin)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf-&gt;ops-&gt;=
unpin(attach);<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_unpin);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_map_attachment - Returns the scatterlist table of the atta=
chment;<br>
@@ -1012,7 +1012,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_bu=
f_attachment *attach,<br>
=C2=A0#endif /* CONFIG_DMA_API_DEBUG */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sg_table;<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_map_attachment);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_unmap_attachment - unmaps and decreases usecount of the bu=
ffer;might<br>
@@ -1048,7 +1048,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachme=
nt *attach,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !IS_ENABLED(CONFIG_DMABUF_MOVE_NO=
TIFY))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_buf_unpin(attac=
h);<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_move_notify - notify attachments that DMA-buf is moving<br=
>
@@ -1068,7 +1068,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attach-&gt;impo=
rter_ops)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 attach-&gt;importer_ops-&gt;move_notify(attach);<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_move_notify);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * DOC: cpu access<br>
@@ -1212,7 +1212,7 @@ int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_begin_cpu_access);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_end_cpu_access - Must be called after accessing a dma_buf =
from the<br>
@@ -1240,7 +1240,7 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_end_cpu_access);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);<br>
<br>
<br>
=C2=A0/**<br>
@@ -1282,7 +1282,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_ar=
ea_struct *vma,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return dmabuf-&gt;ops-&gt;mmap(dmabuf, vma);<br=
>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_mmap);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_vmap - Create virtual mapping for the buffer object into k=
ernel<br>
@@ -1336,7 +1336,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct dma_b=
uf_map *map)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;dmabuf-&gt;lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_vmap);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);<br>
<br>
=C2=A0/**<br>
=C2=A0 * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.<br>
@@ -1360,7 +1360,7 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct dm=
a_buf_map *map)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;dmabuf-&gt;lock);<br>
=C2=A0}<br>
-EXPORT_SYMBOL_GPL(dma_buf_vunmap);<br>
+EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);<br>
<br>
=C2=A0#ifdef CONFIG_DEBUG_FS<br>
=C2=A0static int dma_buf_debug_show(struct seq_file *s, void *unused)<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c<br>
index 38dade421d46..38e144504649 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
@@ -41,6 +41,7 @@<br>
=C2=A0#include &lt;linux/swiotlb.h&gt;<br>
=C2=A0#include &lt;linux/dma-buf.h&gt;<br>
=C2=A0#include &lt;linux/sizes.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
<br>
=C2=A0#include &lt;drm/ttm/ttm_bo_api.h&gt;<br>
=C2=A0#include &lt;drm/ttm/ttm_bo_driver.h&gt;<br>
@@ -59,6 +60,8 @@<br>
=C2=A0#include &quot;amdgpu_res_cursor.h&quot;<br>
=C2=A0#include &quot;bif/bif_4_1_d.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0#define AMDGPU_TTM_VRAM_MAX_DW_READ=C2=A0 =C2=A0 (size_t)128<br>
<br>
=C2=A0static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,<br>
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm=
/drm_gem_framebuffer_helper.c<br>
index 3c75d79dbb65..746fd8c73845 100644<br>
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c<br>
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c<br>
@@ -6,6 +6,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &lt;linux/slab.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
<br>
=C2=A0#include &lt;drm/drm_damage_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_fb_helper.h&gt;<br>
@@ -17,6 +18,8 @@<br>
<br>
=C2=A0#include &quot;drm_internal.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0#define AFBC_HEADER_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A016<br>
=C2=A0#define AFBC_TH_LAYOUT_ALIGNMENT=C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
=C2=A0#define AFBC_HDR_ALIGN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A064<br>
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c<br>
index deb23dbec8b5..d8ba95744410 100644<br>
--- a/drivers/gpu/drm/drm_prime.c<br>
+++ b/drivers/gpu/drm/drm_prime.c<br>
@@ -29,6 +29,7 @@<br>
=C2=A0#include &lt;linux/export.h&gt;<br>
=C2=A0#include &lt;linux/dma-buf.h&gt;<br>
=C2=A0#include &lt;linux/rbtree.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
<br>
=C2=A0#include &lt;drm/drm.h&gt;<br>
=C2=A0#include &lt;drm/drm_drv.h&gt;<br>
@@ -39,6 +40,8 @@<br>
<br>
=C2=A0#include &quot;drm_internal.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0/**<br>
=C2=A0 * DOC: overview and lifetime rules<br>
=C2=A0 *<br>
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/=
etnaviv/etnaviv_gem_prime.c<br>
index 6d8bed9c739d..6788ea8490d1 100644<br>
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c<br>
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c<br>
@@ -5,10 +5,13 @@<br>
<br>
=C2=A0#include &lt;drm/drm_prime.h&gt;<br>
=C2=A0#include &lt;linux/dma-buf.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
<br>
=C2=A0#include &quot;etnaviv_drv.h&quot;<br>
=C2=A0#include &quot;etnaviv_gem.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0static struct lock_class_key etnaviv_prime_lock_class;<br>
<br>
=C2=A0struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object=
 *obj)<br>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exyn=
os/exynos_drm_gem.c<br>
index 4396224227d1..0a0c042a3155 100644<br>
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c<br>
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c<br>
@@ -9,6 +9,7 @@<br>
=C2=A0#include &lt;linux/dma-buf.h&gt;<br>
=C2=A0#include &lt;linux/pfn_t.h&gt;<br>
=C2=A0#include &lt;linux/shmem_fs.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
<br>
=C2=A0#include &lt;drm/drm_prime.h&gt;<br>
=C2=A0#include &lt;drm/drm_vma_manager.h&gt;<br>
@@ -17,6 +18,8 @@<br>
=C2=A0#include &quot;exynos_drm_drv.h&quot;<br>
=C2=A0#include &quot;exynos_drm_gem.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bo=
ol kvmap)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_device *dev =3D exynos_gem-&gt;<a hr=
ef=3D"http://base.dev" rel=3D"noreferrer" target=3D"_blank">base.dev</a>;<b=
r>
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i=
915/gem/i915_gem_dmabuf.c<br>
index afa34111de02..abb854281347 100644<br>
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c<br>
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c<br>
@@ -7,11 +7,14 @@<br>
=C2=A0#include &lt;linux/dma-buf.h&gt;<br>
=C2=A0#include &lt;linux/highmem.h&gt;<br>
=C2=A0#include &lt;linux/dma-resv.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
<br>
=C2=A0#include &quot;i915_drv.h&quot;<br>
=C2=A0#include &quot;i915_gem_object.h&quot;<br>
=C2=A0#include &quot;i915_scatterlist.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0I915_SELFTEST_DECLARE(static bool force_different_devices;)<br>
<br>
=C2=A0static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf=
)<br>
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c<br>
index 6ec598f5d5b3..d38fd7e12b57 100644<br>
--- a/drivers/gpu/drm/tegra/gem.c<br>
+++ b/drivers/gpu/drm/tegra/gem.c<br>
@@ -12,6 +12,7 @@<br>
<br>
=C2=A0#include &lt;linux/dma-buf.h&gt;<br>
=C2=A0#include &lt;linux/iommu.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
<br>
=C2=A0#include &lt;drm/drm_drv.h&gt;<br>
=C2=A0#include &lt;drm/drm_prime.h&gt;<br>
@@ -20,6 +21,8 @@<br>
=C2=A0#include &quot;drm.h&quot;<br>
=C2=A0#include &quot;gem.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0static void tegra_bo_put(struct host1x_bo *bo)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct tegra_bo *obj =3D host1x_to_tegra_bo(bo)=
;<br>
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/t=
tm_object.c<br>
index 04789b2bb2a2..899945f54dc7 100644<br>
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c<br>
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c<br>
@@ -48,8 +48,11 @@<br>
=C2=A0#include &lt;linux/spinlock.h&gt;<br>
=C2=A0#include &lt;linux/slab.h&gt;<br>
=C2=A0#include &lt;linux/atomic.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
=C2=A0#include &quot;ttm_object.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0/**<br>
=C2=A0 * struct ttm_object_file<br>
=C2=A0 *<br>
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/cor=
e/umem_dmabuf.c<br>
index e824baf4640d..2d14929543af 100644<br>
--- a/drivers/infiniband/core/umem_dmabuf.c<br>
+++ b/drivers/infiniband/core/umem_dmabuf.c<br>
@@ -6,9 +6,12 @@<br>
=C2=A0#include &lt;linux/dma-buf.h&gt;<br>
=C2=A0#include &lt;linux/dma-resv.h&gt;<br>
=C2=A0#include &lt;linux/dma-mapping.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
<br>
=C2=A0#include &quot;uverbs.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sg_table *sgt;<br>
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/medi=
a/common/videobuf2/videobuf2-core.c<br>
index 508ac295eb06..773c68dcd158 100644<br>
--- a/drivers/media/common/videobuf2/videobuf2-core.c<br>
+++ b/drivers/media/common/videobuf2/videobuf2-core.c<br>
@@ -2978,3 +2978,4 @@ EXPORT_SYMBOL_GPL(vb2_thread_stop);<br>
=C2=A0MODULE_DESCRIPTION(&quot;Media buffer core framework&quot;);<br>
=C2=A0MODULE_AUTHOR(&quot;Pawel Osciak &lt;<a href=3D"mailto:pawel@osciak.c=
om" target=3D"_blank">pawel@osciak.com</a>&gt;, Marek Szyprowski&quot;);<br=
>
=C2=A0MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/driver=
s/media/common/videobuf2/videobuf2-dma-contig.c<br>
index a7f61ba85440..9a1a9baca2e4 100644<br>
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c<br>
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c<br>
@@ -755,3 +755,4 @@ EXPORT_SYMBOL_GPL(vb2_dma_contig_set_max_seg_size);<br>
=C2=A0MODULE_DESCRIPTION(&quot;DMA-contig memory handling routines for vide=
obuf2&quot;);<br>
=C2=A0MODULE_AUTHOR(&quot;Pawel Osciak &lt;<a href=3D"mailto:pawel@osciak.c=
om" target=3D"_blank">pawel@osciak.com</a>&gt;&quot;);<br>
=C2=A0MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/me=
dia/common/videobuf2/videobuf2-dma-sg.c<br>
index c5b06a509566..db90ebb8950f 100644<br>
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c<br>
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c<br>
@@ -666,3 +666,4 @@ EXPORT_SYMBOL_GPL(vb2_dma_sg_memops);<br>
=C2=A0MODULE_DESCRIPTION(&quot;dma scatter/gather memory handling routines =
for videobuf2&quot;);<br>
=C2=A0MODULE_AUTHOR(&quot;Andrzej Pietrasiewicz&quot;);<br>
=C2=A0MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/m=
edia/common/videobuf2/videobuf2-vmalloc.c<br>
index 83f95258ec8c..fa983897d0e9 100644<br>
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c<br>
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c<br>
@@ -444,3 +444,4 @@ EXPORT_SYMBOL_GPL(vb2_vmalloc_memops);<br>
=C2=A0MODULE_DESCRIPTION(&quot;vmalloc memory handling routines for videobu=
f2&quot;);<br>
=C2=A0MODULE_AUTHOR(&quot;Pawel Osciak &lt;<a href=3D"mailto:pawel@osciak.c=
om" target=3D"_blank">pawel@osciak.com</a>&gt;&quot;);<br>
=C2=A0MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c<br>
index beda610e6b30..fa5c067f1c1e 100644<br>
--- a/drivers/misc/fastrpc.c<br>
+++ b/drivers/misc/fastrpc.c<br>
@@ -1763,3 +1763,4 @@ static void fastrpc_exit(void)<br>
=C2=A0module_exit(fastrpc_exit);<br>
<br>
=C2=A0MODULE_LICENSE(&quot;GPL v2&quot;);<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
diff --git a/drivers/staging/media/tegra-vde/dmabuf-cache.c b/drivers/stagi=
ng/media/tegra-vde/dmabuf-cache.c<br>
index a93b317885bf..a98d03419b8f 100644<br>
--- a/drivers/staging/media/tegra-vde/dmabuf-cache.c<br>
+++ b/drivers/staging/media/tegra-vde/dmabuf-cache.c<br>
@@ -12,9 +12,12 @@<br>
=C2=A0#include &lt;linux/sched.h&gt;<br>
=C2=A0#include &lt;linux/slab.h&gt;<br>
=C2=A0#include &lt;linux/workqueue.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
<br>
=C2=A0#include &quot;vde.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0struct tegra_vde_cache_entry {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum dma_data_direction dma_dir;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dma_buf_attachment *a;<br>
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c<br>
index 8a9384a64f3e..8a8deb95e918 100644<br>
--- a/drivers/tee/tee_shm.c<br>
+++ b/drivers/tee/tee_shm.c<br>
@@ -10,8 +10,11 @@<br>
=C2=A0#include &lt;linux/slab.h&gt;<br>
=C2=A0#include &lt;linux/tee_drv.h&gt;<br>
=C2=A0#include &lt;linux/uio.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
=C2=A0#include &quot;tee_private.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0static void release_registered_pages(struct tee_shm *shm)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (shm-&gt;pages) {<br>
diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_bu=
f.c<br>
index 5127a2f0c986..2521a75009c3 100644<br>
--- a/drivers/virtio/virtio_dma_buf.c<br>
+++ b/drivers/virtio/virtio_dma_buf.c<br>
@@ -86,3 +86,4 @@ int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,<br>
=C2=A0EXPORT_SYMBOL(virtio_dma_buf_get_uuid);<br>
<br>
=C2=A0MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c<br>
index 4c13cbc99896..12e380db7f55 100644<br>
--- a/drivers/xen/gntdev-dmabuf.c<br>
+++ b/drivers/xen/gntdev-dmabuf.c<br>
@@ -14,6 +14,7 @@<br>
=C2=A0#include &lt;linux/slab.h&gt;<br>
=C2=A0#include &lt;linux/types.h&gt;<br>
=C2=A0#include &lt;linux/uaccess.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
<br>
=C2=A0#include &lt;xen/xen.h&gt;<br>
=C2=A0#include &lt;xen/grant_table.h&gt;<br>
@@ -21,6 +22,8 @@<br>
=C2=A0#include &quot;gntdev-common.h&quot;<br>
=C2=A0#include &quot;gntdev-dmabuf.h&quot;<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
+<br>
=C2=A0#ifndef GRANT_INVALID_REF<br>
=C2=A0/*<br>
=C2=A0 * Note on usage of grant reference 0 as invalid grant reference:<br>
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c<br>
index c313ab4d1f4e..a83be6cd162f 100644<br>
--- a/samples/vfio-mdev/mbochs.c<br>
+++ b/samples/vfio-mdev/mbochs.c<br>
@@ -1493,5 +1493,6 @@ static void __exit mbochs_dev_exit(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mbochs_class =3D NULL;<br>
=C2=A0}<br>
<br>
+MODULE_IMPORT_NS(DMA_BUF);<br>
=C2=A0module_init(mbochs_dev_init)<br>
=C2=A0module_exit(mbochs_dev_exit)<br>
-- <br>
2.33.0<br>
<br>
</blockquote></div><br clear=3D"all"><div>Best,</div><div>Sumit.</div></div=
>

--000000000000af706205ccf8378f--
