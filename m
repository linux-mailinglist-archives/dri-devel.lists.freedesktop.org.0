Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AD440C6C3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 15:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BF089993;
	Wed, 15 Sep 2021 13:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B8B89993;
 Wed, 15 Sep 2021 13:53:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="307874980"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="307874980"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 06:53:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="529489262"
Received: from vmastnak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.214.245])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 06:53:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v9 04/17] drm/i915/pxp: allocate a vcs context
 for pxp usage
In-Reply-To: <20210910153627.1060858-5-daniele.ceraolospurio@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210910153627.1060858-1-daniele.ceraolospurio@intel.com>
 <20210910153627.1060858-5-daniele.ceraolospurio@intel.com>
Date: Wed, 15 Sep 2021 16:53:35 +0300
Message-ID: <874kamx7vk.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Sep 2021, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> new file mode 100644
> index 000000000000..e87550fb9821
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2020, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_PXP_H__
> +#define __INTEL_PXP_H__
> +
> +#include "gt/intel_gt_types.h"

I've been trying to promote the idea that we don't include headers from
headers, unless really necessary. It helps with build times by reducing
rebuilds due to changes, but more importantly, it helps with coming up
with abstractions that don't need to look at the guts of other
components.

The above include line pulls in 67 other includes. And it has to look at
the same files a *lot* more times to know not to include them again.

Maybe we need to start being more aggressive about hiding the
abstractions behind the interfaces and headers. Static inlines are
nothing but micro-optimizations that leak abstractions. Do we need
these?

> +#include "intel_pxp_types.h"
> +
> +static inline struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
> +{
> +	return container_of(pxp, struct intel_gt, pxp);
> +}

I think it's questionable to claim the parameter is const, when you can
do:

	const struct intel_pxp *const_pxp = something;
	struct intel_pxp *pxp = &pxp_to_gt(const_pxp)->pxp;

BR,
Jani.

> +
> +static inline bool intel_pxp_is_enabled(const struct intel_pxp *pxp)
> +{
> +	return pxp->ce;
> +}
> +
> +#ifdef CONFIG_DRM_I915_PXP
> +void intel_pxp_init(struct intel_pxp *pxp);
> +void intel_pxp_fini(struct intel_pxp *pxp);
> +#else
> +static inline void intel_pxp_init(struct intel_pxp *pxp)
> +{
> +}
> +
> +static inline void intel_pxp_fini(struct intel_pxp *pxp)
> +{
> +}
> +#endif
> +
> +#endif /* __INTEL_PXP_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> new file mode 100644
> index 000000000000..bd12c520e60a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2020, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_PXP_TYPES_H__
> +#define __INTEL_PXP_TYPES_H__
> +
> +struct intel_context;
> +
> +struct intel_pxp {
> +	struct intel_context *ce;
> +};
> +
> +#endif /* __INTEL_PXP_TYPES_H__ */

-- 
Jani Nikula, Intel Open Source Graphics Center
