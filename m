Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683B34A813F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7D110E9F8;
	Thu,  3 Feb 2022 09:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F0C10E9F8;
 Thu,  3 Feb 2022 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643879706; x=1675415706;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=USduWklxZs7IRiW0gmkJ/DmHB0rsBVVMRvWK008NdMo=;
 b=UDIDUpBvNa93fd5kTPC5lEkJ4EEibJ/39YcMWJvI5hvUqRi6ypXBjNkd
 +hwK5+3R9C+KmXNyhEGr/dJYsBj/PCi4HLUEjsR51Ik6dBgg8ETXGure6
 xl9M+MqpEmOp2rydzwQ+zxl9DVLlwUlYFcKGF1FCEYYCYMsC4udYL/d6k
 0bJ6XFdvL/lZow7pGLkux7aHE/UThlcGvLi59G1pWwr6ejYKu8xHkOqQV
 9Q61IBc9YkhVLL/KxBlEcc2tfbMV9KSTek2ZPmJPszTA2i02RzP335TzY
 hJ7mazDwENUGybaUlTRFbsARBVfHuBBIQHYlaqu1tZ1zWoF8eywUYNP2m g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="311410360"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="311410360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:15:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="523832099"
Received: from ekabir-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.144.43])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:15:05 -0800
Date: Thu, 3 Feb 2022 01:15:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3] dma-buf-map: Rename to iosys-map
Message-ID: <20220203091504.arlmfmwdaluts3ml@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220203085614.3896538-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220203085614.3896538-1-lucas.demarchi@intel.com>
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
Cc: linux-doc@vger.kernel.org, airlied@linux.ie, daniel.vetter@ffwll.ch,
 Jonathan Corbet <corbet@lwn.net>, srinivas.kandagatla@linaro.org,
 tzimmermann@suse.de, gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 12:56:14AM -0800, Lucas De Marchi wrote:
>Rename struct dma_buf_map to struct iosys_map and corresponding APIs.
>Over time dma-buf-map grew up to more functionality than the one used by
>dma-buf: in fact it's just a shim layer to abstract system memory, that
>can be accessed via regular load and store, from IO memory that needs to
>be acessed via arch helpers.
>
>The idea is to extend this API so it can fulfill other needs, internal
>to a single driver. Example: in the i915 driver it's desired to share
>the implementation for integrated graphics, which uses mostly system
>memory, with discrete graphics, which may need to access IO memory.
>
>The conversion was mostly done with the following semantic patch:
>
>	@r1@
>	@@
>	- struct dma_buf_map
>	+ struct iosys_map
>
>	@r2@
>	@@
>	(
>	- DMA_BUF_MAP_INIT_VADDR
>	+ IOSYS_MAP_INIT_VADDR
>	|
>	- dma_buf_map_set_vaddr
>	+ iosys_map_set_vaddr
>	|
>	- dma_buf_map_set_vaddr_iomem
>	+ iosys_map_set_vaddr_iomem
>	|
>	- dma_buf_map_is_equal
>	+ iosys_map_is_equal
>	|
>	- dma_buf_map_is_null
>	+ iosys_map_is_null
>	|
>	- dma_buf_map_is_set
>	+ iosys_map_is_set
>	|
>	- dma_buf_map_clear
>	+ iosys_map_clear
>	|
>	- dma_buf_map_memcpy_to
>	+ iosys_map_memcpy_to
>	|
>	- dma_buf_map_incr
>	+ iosys_map_incr
>	)
>
>	@@
>	@@
>	- #include <linux/dma-buf-map.h>
>	+ #include <linux/iosys-map.h>
>
>Then some files had their includes adjusted and some comments were update to
>remove mentions to dma-buf-map.
>
>Since this is not specific to dma-buf anymore, move the documentation to
>the "Bus-Independent Device Accesses" section.
>
>v2:
>  - Squash patches
>
>v3:
>  - Fix wrong removal of dma-buf.h from MAINTAINERS
>  - Move documentation from dma-buf.rst to device-io.rst
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Acked-by: Christian König <christian.koenig@amd.com>
>Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>---
> Documentation/driver-api/device-io.rst        |   9 +
> Documentation/driver-api/dma-buf.rst          |   9 -
> Documentation/gpu/todo.rst                    |  20 +-
> MAINTAINERS                                   |   9 +-
> drivers/dma-buf/dma-buf.c                     |  22 +-
> drivers/dma-buf/heaps/cma_heap.c              |  10 +-
> drivers/dma-buf/heaps/system_heap.c           |  10 +-
> drivers/gpu/drm/ast/ast_drv.h                 |   2 +-
> drivers/gpu/drm/ast/ast_mode.c                |   8 +-
> drivers/gpu/drm/drm_cache.c                   |  18 +-
> drivers/gpu/drm/drm_client.c                  |   9 +-
> drivers/gpu/drm/drm_fb_helper.c               |  12 +-
> drivers/gpu/drm/drm_gem.c                     |  12 +-
> drivers/gpu/drm/drm_gem_cma_helper.c          |   9 +-
> drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  16 +-
> drivers/gpu/drm/drm_gem_shmem_helper.c        |  15 +-
> drivers/gpu/drm/drm_gem_ttm_helper.c          |   4 +-
> drivers/gpu/drm/drm_gem_vram_helper.c         |  25 +-
> drivers/gpu/drm/drm_internal.h                |   6 +-
> drivers/gpu/drm/drm_mipi_dbi.c                |   8 +-
> drivers/gpu/drm/drm_prime.c                   |   4 +-
> drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   2 +-
> drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   8 +-
> drivers/gpu/drm/gud/gud_pipe.c                |   4 +-
> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   5 +-
> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   8 +-
> .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
> .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |   6 +-
> drivers/gpu/drm/lima/lima_gem.c               |   3 +-
> drivers/gpu/drm/lima/lima_sched.c             |   4 +-
> drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   7 +-
> drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   5 +-
> drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
> drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
> drivers/gpu/drm/msm/msm_gem_prime.c           |   6 +-
> drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  13 +-
> drivers/gpu/drm/qxl/qxl_display.c             |   8 +-
> drivers/gpu/drm/qxl/qxl_draw.c                |   6 +-
> drivers/gpu/drm/qxl/qxl_drv.h                 |  10 +-
> drivers/gpu/drm/qxl/qxl_object.c              |   8 +-
> drivers/gpu/drm/qxl/qxl_object.h              |   4 +-
> drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
> drivers/gpu/drm/radeon/radeon_gem.c           |   1 +
> drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   9 +-
> drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   5 +-
> drivers/gpu/drm/tegra/gem.c                   |  10 +-
> drivers/gpu/drm/tiny/cirrus.c                 |   8 +-
> drivers/gpu/drm/tiny/gm12u320.c               |   7 +-
> drivers/gpu/drm/ttm/ttm_bo_util.c             |  16 +-
> drivers/gpu/drm/ttm/ttm_resource.c            |  26 +-
> drivers/gpu/drm/ttm/ttm_tt.c                  |   6 +-
> drivers/gpu/drm/udl/udl_modeset.c             |   3 +-
> drivers/gpu/drm/vboxvideo/vbox_mode.c         |   4 +-
> drivers/gpu/drm/vkms/vkms_composer.c          |   4 +-
> drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
> drivers/gpu/drm/vkms/vkms_plane.c             |   2 +-
> drivers/gpu/drm/vkms/vkms_writeback.c         |   2 +-
> drivers/gpu/drm/xen/xen_drm_front_gem.c       |   7 +-
> drivers/gpu/drm/xen/xen_drm_front_gem.h       |   6 +-
> .../common/videobuf2/videobuf2-dma-contig.c   |   8 +-
> .../media/common/videobuf2/videobuf2-dma-sg.c |   9 +-
> .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
> drivers/misc/fastrpc.c                        |   4 +-
> include/drm/drm_cache.h                       |   6 +-
> include/drm/drm_client.h                      |   7 +-
> include/drm/drm_gem.h                         |   6 +-
> include/drm/drm_gem_atomic_helper.h           |   6 +-
> include/drm/drm_gem_cma_helper.h              |   6 +-
> include/drm/drm_gem_framebuffer_helper.h      |   8 +-
> include/drm/drm_gem_shmem_helper.h            |  12 +-
> include/drm/drm_gem_ttm_helper.h              |   6 +-
> include/drm/drm_gem_vram_helper.h             |   9 +-
> include/drm/drm_prime.h                       |   6 +-
> include/drm/ttm/ttm_bo_api.h                  |  10 +-
> include/drm/ttm/ttm_kmap_iter.h               |  10 +-
> include/drm/ttm/ttm_resource.h                |   6 +-
> include/linux/dma-buf-map.h                   | 266 ------------------
> include/linux/dma-buf.h                       |  12 +-
> include/linux/iosys-map.h                     | 257 +++++++++++++++++
> 79 files changed, 590 insertions(+), 559 deletions(-)
> delete mode 100644 include/linux/dma-buf-map.h
> create mode 100644 include/linux/iosys-map.h
>
>diff --git a/Documentation/driver-api/device-io.rst b/Documentation/driver-api/device-io.rst
>index e9f04b1815d1..f9dede8639c7 100644
>--- a/Documentation/driver-api/device-io.rst
>+++ b/Documentation/driver-api/device-io.rst
>@@ -502,6 +502,15 @@ pcim_iomap()
> Not using these wrappers may make drivers unusable on certain platforms with
> stricter rules for mapping I/O memory.
>
>+System/IO memory abstraction
>+----------------------------

Looking at it again, this would render slightly better at the same level
as others, with "====="

Lucas De Marchi

>+
>+.. kernel-doc:: include/linux/iosys-map.h
>+   :doc: overview
>+
>+.. kernel-doc:: include/linux/iosys-map.h
>+   :internal:
>+
> Public Functions Provided
> =========================
>
>diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
>index 2cd7db82d9fe..55006678394a 100644
>--- a/Documentation/driver-api/dma-buf.rst
>+++ b/Documentation/driver-api/dma-buf.rst
>@@ -128,15 +128,6 @@ Kernel Functions and Structures Reference
> .. kernel-doc:: include/linux/dma-buf.h
>    :internal:
>
>-Buffer Mapping Helpers
>-~~~~~~~~~~~~~~~~~~~~~~
>-
>-.. kernel-doc:: include/linux/dma-buf-map.h
>-   :doc: overview
>-
>-.. kernel-doc:: include/linux/dma-buf-map.h
>-   :internal:
>-
> Reservation Objects
> -------------------
