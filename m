Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4374AD7B5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 12:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A11510E594;
	Tue,  8 Feb 2022 11:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A636B10E3A6;
 Tue,  8 Feb 2022 11:42:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 138E5B81A82;
 Tue,  8 Feb 2022 11:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E433CC004E1;
 Tue,  8 Feb 2022 11:42:34 +0000 (UTC)
Message-ID: <aa1312fc-197b-c1ab-6a18-369d49c1e8f8@xs4all.nl>
Date: Tue, 8 Feb 2022 12:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4] dma-buf-map: Rename to iosys-map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220204170541.829227-1-lucas.demarchi@intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220204170541.829227-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Jonathan Corbet <corbet@lwn.net>, airlied@linux.ie, daniel.vetter@ffwll.ch,
 linux-doc@vger.kernel.org, christian.koenig@amd.com,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/4/22 18:05, Lucas De Marchi wrote:
> Rename struct dma_buf_map to struct iosys_map and corresponding APIs.
> Over time dma-buf-map grew up to more functionality than the one used by
> dma-buf: in fact it's just a shim layer to abstract system memory, that
> can be accessed via regular load and store, from IO memory that needs to
> be acessed via arch helpers.
> 
> The idea is to extend this API so it can fulfill other needs, internal
> to a single driver. Example: in the i915 driver it's desired to share
> the implementation for integrated graphics, which uses mostly system
> memory, with discrete graphics, which may need to access IO memory.
> 
> The conversion was mostly done with the following semantic patch:
> 
> 	@r1@
> 	@@
> 	- struct dma_buf_map
> 	+ struct iosys_map
> 
> 	@r2@
> 	@@
> 	(
> 	- DMA_BUF_MAP_INIT_VADDR
> 	+ IOSYS_MAP_INIT_VADDR
> 	|
> 	- dma_buf_map_set_vaddr
> 	+ iosys_map_set_vaddr
> 	|
> 	- dma_buf_map_set_vaddr_iomem
> 	+ iosys_map_set_vaddr_iomem
> 	|
> 	- dma_buf_map_is_equal
> 	+ iosys_map_is_equal
> 	|
> 	- dma_buf_map_is_null
> 	+ iosys_map_is_null
> 	|
> 	- dma_buf_map_is_set
> 	+ iosys_map_is_set
> 	|
> 	- dma_buf_map_clear
> 	+ iosys_map_clear
> 	|
> 	- dma_buf_map_memcpy_to
> 	+ iosys_map_memcpy_to
> 	|
> 	- dma_buf_map_incr
> 	+ iosys_map_incr
> 	)
> 
> 	@@
> 	@@
> 	- #include <linux/dma-buf-map.h>
> 	+ #include <linux/iosys-map.h>
> 
> Then some files had their includes adjusted and some comments were
> update to remove mentions to dma-buf-map.
> 
> Since this is not specific to dma-buf anymore, move the documentation to
> the "Bus-Independent Device Accesses" section.
> 
> v2:
>   - Squash patches
> 
> v3:
>   - Fix wrong removal of dma-buf.h from MAINTAINERS
>   - Move documentation from dma-buf.rst to device-io.rst
> 
> v4:
>   - Change documentation tile and level
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Christian König <christian.koenig@amd.com>
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  Documentation/driver-api/device-io.rst        |   9 +
>  Documentation/driver-api/dma-buf.rst          |   9 -
>  Documentation/gpu/todo.rst                    |  20 +-
>  MAINTAINERS                                   |   9 +-
>  drivers/dma-buf/dma-buf.c                     |  22 +-
>  drivers/dma-buf/heaps/cma_heap.c              |  10 +-
>  drivers/dma-buf/heaps/system_heap.c           |  10 +-
>  drivers/gpu/drm/ast/ast_drv.h                 |   2 +-
>  drivers/gpu/drm/ast/ast_mode.c                |   8 +-
>  drivers/gpu/drm/drm_cache.c                   |  18 +-
>  drivers/gpu/drm/drm_client.c                  |   9 +-
>  drivers/gpu/drm/drm_fb_helper.c               |  12 +-
>  drivers/gpu/drm/drm_gem.c                     |  12 +-
>  drivers/gpu/drm/drm_gem_cma_helper.c          |   9 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  16 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  15 +-
>  drivers/gpu/drm/drm_gem_ttm_helper.c          |   4 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c         |  25 +-
>  drivers/gpu/drm/drm_internal.h                |   6 +-
>  drivers/gpu/drm/drm_mipi_dbi.c                |   8 +-
>  drivers/gpu/drm/drm_prime.c                   |   4 +-
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   2 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   8 +-
>  drivers/gpu/drm/gud/gud_pipe.c                |   4 +-
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   5 +-
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   8 +-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |   6 +-
>  drivers/gpu/drm/lima/lima_gem.c               |   3 +-
>  drivers/gpu/drm/lima/lima_sched.c             |   4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   7 +-
>  drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   5 +-
>  drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
>  drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
>  drivers/gpu/drm/msm/msm_gem_prime.c           |   6 +-
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  13 +-
>  drivers/gpu/drm/qxl/qxl_display.c             |   8 +-
>  drivers/gpu/drm/qxl/qxl_draw.c                |   6 +-
>  drivers/gpu/drm/qxl/qxl_drv.h                 |  10 +-
>  drivers/gpu/drm/qxl/qxl_object.c              |   8 +-
>  drivers/gpu/drm/qxl/qxl_object.h              |   4 +-
>  drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>  drivers/gpu/drm/radeon/radeon_gem.c           |   1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   9 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   5 +-
>  drivers/gpu/drm/tegra/gem.c                   |  10 +-
>  drivers/gpu/drm/tiny/cirrus.c                 |   8 +-
>  drivers/gpu/drm/tiny/gm12u320.c               |   7 +-
>  drivers/gpu/drm/ttm/ttm_bo_util.c             |  16 +-
>  drivers/gpu/drm/ttm/ttm_resource.c            |  42 +--
>  drivers/gpu/drm/ttm/ttm_tt.c                  |   8 +-
>  drivers/gpu/drm/udl/udl_modeset.c             |   3 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |   4 +-
>  drivers/gpu/drm/vkms/vkms_composer.c          |   4 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c         |   2 +-
>  drivers/gpu/drm/xen/xen_drm_front_gem.c       |   7 +-
>  drivers/gpu/drm/xen/xen_drm_front_gem.h       |   6 +-

For these three:

>  .../common/videobuf2/videobuf2-dma-contig.c   |   8 +-
>  .../media/common/videobuf2/videobuf2-dma-sg.c |   9 +-
>  .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
