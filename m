Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215E94ADC30
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3781910E2CB;
	Tue,  8 Feb 2022 15:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E87F10E261;
 Tue,  8 Feb 2022 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644333307; x=1675869307;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vva12Cv/vVjOHL2Orkmr3Xei9YBMVXoD6aTawTWdu5U=;
 b=awv47y42SdOyMwzJ1Nu1nrjxAOWzSF4ZfYQJRuuJux3DGBZ65vT9mywD
 OV0DRl86677nTQzd3tGgrV3KBcgwoygz4hv3B0uYwpEILH57el3dfBPPI
 ZFQcM31BZ5PR+vwCFCMwxcco66pH2o1u8zBMnCV7HeatGuf4+DLJBgx4P
 QSKIJKG5bClXeAEgDgNv7DWd3UNsHu3iWAxqCYvXcDj3wxTTrLMb1pDTw
 AU0C/mI39dY+v1+A/WWBSt8AUbiZPvNltZOBUdMzHd7KyiXZMrS26lIr5
 Wkm0AacgZcVQ9Vx7R7+zYa6YUS40rsi3BL6slgspb+fHdRItC39KArky9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248914145"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="248914145"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:15:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="540636634"
Received: from ijbeckin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.19.63])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:15:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, hch@lst.de, jgg@nvidia.com
Subject: Re: [PATCH v6 1/3] i915/gvt: Introduce the mmio table to support
 VFIO new mdev API
In-Reply-To: <20220208111151.13115-1-zhi.a.wang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220208111151.13115-1-zhi.a.wang@intel.com>
Date: Tue, 08 Feb 2022 17:15:00 +0200
Message-ID: <871r0dqtjf.fsf@intel.com>
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Feb 2022, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> From: Zhi Wang <zhi.wang.linux@gmail.com>
>
> To support the new mdev interfaces and the re-factor patches from
> Christoph, which moves the GVT-g code into a dedicated module, the GVT-g
> initialization path has to be separated into two phases:
>
> a) Early initialization.
>
> The early initialization of GVT requires to be done when loading i915.
> Mostly it's because the initial clean HW state needs to be saved before
> i915 touches the HW.
>
> b) Late initalization.
>
> This phases of initalization will setup the rest components of GVT-g,
> which can be done later when the dedicated module is being loaded.

What's the baseline for this series?

>
> v6:
>
> - Move the mmio_table.c into i915. (Christoph)
> - Keep init_device_info and related structures in GVT-g. (Christoph)
> - Refine the callbacks of the iterator. (Christoph)
> - Move the flags of MMIO register defination to GVT-g. (Chrsitoph)
> - Move the mmio block handling to GVT-g.
>
> v5:
>
> - Re-design the mmio table framework. (Christoph)
>
> v4:
>
> - Fix the errors of patch checking scripts.
>
> v3:
>
> - Fix the errors when CONFIG_DRM_I915_WERROR is turned on. (Jani)
>
> v2:
>
> - Implement a mmio table instead of generating it by marco in i915. (Jani)
>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Signed-off-by: Zhi Wang <zhi.wang.linux@gmail.com>
> ---
>  drivers/gpu/drm/i915/Makefile               |    2 +-
>  drivers/gpu/drm/i915/gvt/cmd_parser.c       |    2 +-
>  drivers/gpu/drm/i915/gvt/gvt.h              |    3 +-
>  drivers/gpu/drm/i915/gvt/handlers.c         | 1062 ++-------------
>  drivers/gpu/drm/i915/gvt/mmio.h             |   17 -
>  drivers/gpu/drm/i915/gvt/reg.h              |    9 +-
>  drivers/gpu/drm/i915/intel_gvt.c            |   20 +-
>  drivers/gpu/drm/i915/intel_gvt.h            |   37 +
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 1308 +++++++++++++++++++
>  9 files changed, 1501 insertions(+), 959 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c
>

> diff --git a/drivers/gpu/drm/i915/intel_gvt.h b/drivers/gpu/drm/i915/intel_gvt.h
> index d7d3fb6186fd..6d3031f3ac25 100644
> --- a/drivers/gpu/drm/i915/intel_gvt.h
> +++ b/drivers/gpu/drm/i915/intel_gvt.h
> @@ -26,7 +26,32 @@
>  
>  struct drm_i915_private;
>  
> +#include <linux/kernel.h>

Please use minimal includes. Looks like linux/types.h is enough. Please
also put the includes before the forward declarations.

> +
>  #ifdef CONFIG_DRM_I915_GVT
> +
> +#define D_BDW   (1 << 0)
> +#define D_SKL	(1 << 1)
> +#define D_KBL	(1 << 2)
> +#define D_BXT	(1 << 3)
> +#define D_CFL	(1 << 4)
> +
> +#define D_GEN9PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
> +#define D_GEN8PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
> +
> +#define D_SKL_PLUS	(D_SKL | D_KBL | D_BXT | D_CFL)
> +#define D_BDW_PLUS	(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)
> +
> +#define D_PRE_SKL	(D_BDW)
> +#define D_ALL		(D_BDW | D_SKL | D_KBL | D_BXT | D_CFL)

If these really need to be in a header in i915/, I think they need to be
longer with some namespacing or something. I do wish these could be
hidden though.

> +
> +struct intel_gvt_mmio_table_iter {
> +	struct drm_i915_private *i915;
> +	void *data;
> +	int (*handle_mmio_cb)(struct intel_gvt_mmio_table_iter *iter,
> +			      u32 offset, u32 device, u32 size);
> +};

We're heavily transitioning towards having a corresponding .h for each
.c instead of catch all headers. It's still a work in progress, but I'd
prefer having the declarations for stuff in intel_gvt_mmio_table.c
placed in intel_gvt_mmio_table.h, and named accordingly. Like I
suggested in my previous mails.

> +
>  int intel_gvt_init(struct drm_i915_private *dev_priv);
>  void intel_gvt_driver_remove(struct drm_i915_private *dev_priv);
>  int intel_gvt_init_device(struct drm_i915_private *dev_priv);
> @@ -34,6 +59,8 @@ void intel_gvt_clean_device(struct drm_i915_private *dev_priv);
>  int intel_gvt_init_host(void);
>  void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv);
>  void intel_gvt_resume(struct drm_i915_private *dev_priv);
> +unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915);
> +int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter);
>  #else
>  static inline int intel_gvt_init(struct drm_i915_private *dev_priv)
>  {
> @@ -51,6 +78,16 @@ static inline void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
>  static inline void intel_gvt_resume(struct drm_i915_private *dev_priv)
>  {
>  }
> +
> +unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915)
> +{
> +	return 0;
> +}
> +
> +int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
> +{
> +	return 0;
> +}

Stubs need to be static inlines.

>  #endif
>  
>  #endif /* _INTEL_GVT_H_ */
> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> new file mode 100644
> index 000000000000..b9de72e939d3
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> @@ -0,0 +1,1308 @@
> +/*
> + * Copyright(c) 2021 Intel Corporation. All rights reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> + * SOFTWARE.

Please use SPDX headers for new files.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
