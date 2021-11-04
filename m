Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A3445361
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 13:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645986F462;
	Thu,  4 Nov 2021 12:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831296F462;
 Thu,  4 Nov 2021 12:54:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="231944825"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="231944825"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 05:54:37 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="489935011"
Received: from agilev-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.157])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 05:54:33 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211102070601.155501-7-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-7-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH 06/29] drm/i915/gvt: move the gvt code into kvmgt.ko
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163603047089.4807.10176282951802208428@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 04 Nov 2021 14:54:30 +0200
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
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, matthew.auld@intel.com, Jason Gunthorpe <jgg@nvidia.com>, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Thomas, Maarten and Matt

(Also, Zhi and Zhenyu, please see down)

Quoting Christoph Hellwig (2021-11-02 09:05:38)
> Instead of having an option to build the gvt code into the main i915
> module, just move it into the kvmgt.ko module.  This only requires
> a new struct with three entries that the KVMGT modules needs to register
> with the main i915 module, and a proper list of GVT-enabled devices
> instead of global device pointer.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>

<SNIP>

> +/*
> + * Exported here so that the exports only get created when GVT support is
> + * actually enabled.
> + */
> +EXPORT_SYMBOL_NS_GPL(i915_gem_object_alloc, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_gem_object_create_shmem, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_gem_object_init, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_gem_object_ggtt_pin_ww, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_gem_object_pin_map, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_gem_object_set_to_cpu_domain, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(__i915_gem_object_flush_map, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(__i915_gem_object_set_pages, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_gem_gtt_insert, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_gem_prime_export, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_init, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_backoff, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_fini, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_ppgtt_create, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_request_add, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_request_create, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_request_wait, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_reserve_fence, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_unreserve_fence, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_vm_release, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(i915_vma_move_to_active, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_context_create, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_put, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(shmem_pin_map, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(shmem_unpin_map, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(__px_dma, I915_GVT);

This is where the module conversion got stuck last time.

Conditionally exporting is kind of a partial remedy. Previously the
intention for the rewrite was to define a clear interface between the
two modules which would be well defined enough that we could avoid frequent
clashes and hopefully get GVT into drm-tip, too.

The absolute minimum requirement is not to have any of the double
underscore symbols in this list. As that convention is specifically used
to mark functions which are expected to have reduced error checking
because of the exact point they are being called from. With that done
we should be where we can enable the exports by default and modprobe
would be all that is required.

I think Zhenyu and Zhi took an AR back in time to see how small they
could shrink this list. Would we have some followup patches available
to shrink this interface?

Also, the golden MMIO state capture remains something that leaks the
hypervisor state into the guests. For example the fact which bug W/A
are applied in hypervisor, and I would rather have that code path
isolated before enabling by default.

Regards, Joonas
