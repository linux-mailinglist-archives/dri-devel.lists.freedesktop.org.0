Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30974430EA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 15:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CCD6FD44;
	Tue,  2 Nov 2021 14:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C356FD1C;
 Tue,  2 Nov 2021 14:55:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="212034103"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="212034103"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 07:55:57 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="500585200"
Received: from sohamdas-mobl.gar.corp.intel.com (HELO localhost)
 ([10.249.32.13])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 07:55:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH 02/29] drm/i915/gvt: integrate into the main Makefile
In-Reply-To: <20211102070601.155501-3-hch@lst.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-3-hch@lst.de>
Date: Tue, 02 Nov 2021 16:55:51 +0200
Message-ID: <87cznid2tk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 02 Nov 2021, Christoph Hellwig <hch@lst.de> wrote:
> Remove the separately included Makefile and just use the relative
> reference from the main i915 Makefile as for source files in other
> subdirectories.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/Makefile     | 29 ++++++++++++++++++++++++-----
>  drivers/gpu/drm/i915/gvt/Makefile |  9 ---------
>  drivers/gpu/drm/i915/gvt/trace.h  |  2 +-
>  3 files changed, 25 insertions(+), 15 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gvt/Makefile
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 335ba9f43d8f7..63523032eea26 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -295,11 +295,30 @@ i915-$(CONFIG_DRM_I915_SELFTEST) += \
>  
>  # virtual gpu code
>  i915-y += i915_vgpu.o
> -
> -ifeq ($(CONFIG_DRM_I915_GVT),y)
> -i915-y += intel_gvt.o
> -include $(src)/gvt/Makefile
> -endif
> +i915-$(CONFIG_DRM_I915_GVT) += \
> +	intel_gvt.o \
> +	gvt/gvt.o \
> +	gvt/aperture_gm.o \
> +	gvt/handlers.o \
> +	gvt/vgpu.o \
> +	gvt/trace_points.o \
> +	gvt/firmware.o \
> +	gvt/interrupt.o \
> +	gvt/gtt.o \
> +	gvt/cfg_space.o \
> +	gvt/opregion.o \
> +	gvt/mmio.o \
> +	gvt/display.o \
> +	gvt/edid.o \
> +	gvt/execlist.o \
> +	gvt/scheduler.o \
> +	gvt/sched_policy.o \
> +	gvt/mmio_context.o \
> +	gvt/cmd_parser.o \
> +	gvt/debugfs.o \
> +	gvt/fb_decoder.o \
> +	gvt/dmabuf.o \
> +	gvt/page_track.o
>  
>  obj-$(CONFIG_DRM_I915) += i915.o
>  obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
> diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
> deleted file mode 100644
> index ea8324abc784a..0000000000000
> --- a/drivers/gpu/drm/i915/gvt/Makefile
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -GVT_DIR := gvt
> -GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
> -	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
> -	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
> -	fb_decoder.o dmabuf.o page_track.o
> -
> -ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
> -i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
> diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
> index 6d787750d279f..348f57f8301db 100644
> --- a/drivers/gpu/drm/i915/gvt/trace.h
> +++ b/drivers/gpu/drm/i915/gvt/trace.h
> @@ -379,5 +379,5 @@ TRACE_EVENT(render_mmio,
>  #undef TRACE_INCLUDE_PATH
>  #define TRACE_INCLUDE_PATH .
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_FILE trace
> +#define TRACE_INCLUDE_FILE gvt/trace
>  #include <trace/define_trace.h>

-- 
Jani Nikula, Intel Open Source Graphics Center
