Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C926445301
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 13:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038466F3F0;
	Thu,  4 Nov 2021 12:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796866F3D6;
 Thu,  4 Nov 2021 12:30:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="292528687"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="292528687"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 05:30:25 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="667884307"
Received: from agilev-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.157])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 05:30:22 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211102070601.155501-3-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-3-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH 02/29] drm/i915/gvt: integrate into the main Makefile
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163602902009.4807.3745093259631583283@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 04 Nov 2021 14:30:20 +0200
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

Quoting Christoph Hellwig (2021-11-02 09:05:34)
> Remove the separately included Makefile and just use the relative
> reference from the main i915 Makefile as for source files in other
> subdirectories.

The thinking behind the split is to avoid any merge conflicts as the
gvt/ subdirectory is handled through separate pull request flow and
are note part of drm-tip.

The other subdirectories are part of drm-intel-next/drm-intel-gt-next
and are part of drm-tip.

So I would rather still see the Makefile live in gvt/ directory.

Regards, Joonas

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/Makefile     | 29 ++++++++++++++++++++++++-----
>  drivers/gpu/drm/i915/gvt/Makefile |  9 ---------
>  drivers/gpu/drm/i915/gvt/trace.h  |  2 +-
>  3 files changed, 25 insertions(+), 15 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gvt/Makefile
>=20
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 335ba9f43d8f7..63523032eea26 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -295,11 +295,30 @@ i915-$(CONFIG_DRM_I915_SELFTEST) +=3D \
> =20
>  # virtual gpu code
>  i915-y +=3D i915_vgpu.o
> -
> -ifeq ($(CONFIG_DRM_I915_GVT),y)
> -i915-y +=3D intel_gvt.o
> -include $(src)/gvt/Makefile
> -endif
> +i915-$(CONFIG_DRM_I915_GVT) +=3D \
> +       intel_gvt.o \
> +       gvt/gvt.o \
> +       gvt/aperture_gm.o \
> +       gvt/handlers.o \
> +       gvt/vgpu.o \
> +       gvt/trace_points.o \
> +       gvt/firmware.o \
> +       gvt/interrupt.o \
> +       gvt/gtt.o \
> +       gvt/cfg_space.o \
> +       gvt/opregion.o \
> +       gvt/mmio.o \
> +       gvt/display.o \
> +       gvt/edid.o \
> +       gvt/execlist.o \
> +       gvt/scheduler.o \
> +       gvt/sched_policy.o \
> +       gvt/mmio_context.o \
> +       gvt/cmd_parser.o \
> +       gvt/debugfs.o \
> +       gvt/fb_decoder.o \
> +       gvt/dmabuf.o \
> +       gvt/page_track.o
> =20
>  obj-$(CONFIG_DRM_I915) +=3D i915.o
>  obj-$(CONFIG_DRM_I915_GVT_KVMGT) +=3D gvt/kvmgt.o
> diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt=
/Makefile
> deleted file mode 100644
> index ea8324abc784a..0000000000000
> --- a/drivers/gpu/drm/i915/gvt/Makefile
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -GVT_DIR :=3D gvt
> -GVT_SOURCE :=3D gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o fir=
mware.o \
> -       interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
> -       execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o=
 debugfs.o \
> -       fb_decoder.o dmabuf.o page_track.o
> -
> -ccflags-y                              +=3D -I $(srctree)/$(src) -I $(sr=
ctree)/$(src)/$(GVT_DIR)/
> -i915-y                                 +=3D $(addprefix $(GVT_DIR)/, $(G=
VT_SOURCE))
> diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/=
trace.h
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
> --=20
> 2.30.2
>=20
