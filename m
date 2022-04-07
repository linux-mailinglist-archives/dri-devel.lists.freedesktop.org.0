Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7B94F826B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE1D10EA64;
	Thu,  7 Apr 2022 15:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D5910EA64;
 Thu,  7 Apr 2022 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649343896; x=1680879896;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Y3VPFPEBEueMVx8dW2rbCqqe+xkFwaxTb9dysb5/jW4=;
 b=DpI/LUW8BL5y/ys2/QEtXr8rAM+NN2VHQLsARenoI+mIRO9WHsjeULVi
 1qEc5D3ETENfmRAHBbnFfefw4xl6jg76hvzfMA7pJNE664mSowVyRxYQo
 yIPOL8w8MOPmBF5L+1WffVImoH+WtZm99EyMyGkl5xmPp6fua16/CVvmH
 nTI3IlyUO7FrfvenEg6Qt0RBT0lJVnEyJKkWbt/Qw6ZfayStCPkaDH0f0
 0F1N6g41DpwmAOiXwfD3ba5NnkeVI9/2Tcijn5Cxp6QxTDr2vmj7O3IEF
 t/yHDTM75Q1YSamVSufqJGn5vb7Z9HwkH3vv+YiIT8iGk9nURCtYny8Qc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261525809"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="261525809"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:03:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="571089386"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:03:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
In-Reply-To: <20220407071945.72148-2-zhi.a.wang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
 <20220407071945.72148-2-zhi.a.wang@intel.com>
Date: Thu, 07 Apr 2022 18:03:38 +0300
Message-ID: <874k35541h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Apr 2022, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> diff --git a/drivers/gpu/drm/i915/intel_gvt.h b/drivers/gpu/drm/i915/inte=
l_gvt.h
> index d7d3fb6186fd..7665d7cf0bdd 100644
> --- a/drivers/gpu/drm/i915/intel_gvt.h
> +++ b/drivers/gpu/drm/i915/intel_gvt.h
> @@ -26,7 +26,17 @@
>=20=20
>  struct drm_i915_private;
>=20=20
> +#include <linux/kernel.h>

You only need <linux/types.h>. Please add it before the forward
declaration above.

> +
>  #ifdef CONFIG_DRM_I915_GVT
> +
> +struct intel_gvt_mmio_table_iter {
> +	struct drm_i915_private *i915;
> +	void *data;
> +	int (*handle_mmio_cb)(struct intel_gvt_mmio_table_iter *iter,
> +			      u32 offset, u32 size);
> +};
> +
>  int intel_gvt_init(struct drm_i915_private *dev_priv);
>  void intel_gvt_driver_remove(struct drm_i915_private *dev_priv);
>  int intel_gvt_init_device(struct drm_i915_private *dev_priv);
> @@ -34,6 +44,7 @@ void intel_gvt_clean_device(struct drm_i915_private *de=
v_priv);
>  int intel_gvt_init_host(void);
>  void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv);
>  void intel_gvt_resume(struct drm_i915_private *dev_priv);
> +int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter);
>  #else
>  static inline int intel_gvt_init(struct drm_i915_private *dev_priv)
>  {
> @@ -51,6 +62,16 @@ static inline void intel_gvt_sanitize_options(struct d=
rm_i915_private *dev_priv)
>  static inline void intel_gvt_resume(struct drm_i915_private *dev_priv)
>  {
>  }
> +
> +unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915)
> +{
> +	return 0;
> +}

The CONFIG_DRM_I915_GVT=3Dy counterpart for this is in mmio.h. Should be
both in the same header.

> +
> +int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
> +{
> +	return 0;
> +}
>  #endif
>=20=20
>  #endif /* _INTEL_GVT_H_ */
> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/dr=
m/i915/intel_gvt_mmio_table.c
> new file mode 100644
> index 000000000000..d29491a6d209
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> @@ -0,0 +1,1290 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2020 Intel Corporation
> + */
> +
> +#include "i915_drv.h"
> +#include "i915_reg.h"
> +#include "display/vlv_dsi_pll_regs.h"
> +#include "gt/intel_gt_regs.h"
> +#include "intel_mchbar_regs.h"
> +#include "i915_pvinfo.h"
> +#include "intel_gvt.h"
> +#include "gvt/gvt.h"

Generally we have the include lists sorted.

Other than the nitpicks above, the series is

Acked-by: Jani Nikula <jani.nikula@intel.com>


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
