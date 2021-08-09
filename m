Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC813E44E0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 13:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002BB899B7;
	Mon,  9 Aug 2021 11:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500C48997E;
 Mon,  9 Aug 2021 11:29:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="212812229"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="212812229"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 04:29:44 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="514915165"
Received: from scotter-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.9.32])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 04:29:42 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210721155355.173183-5-hch@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
 <20210721155355.173183-5-hch@lst.de>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH 04/21] drm/i915/gvt: move the gvt code into kvmgt.ko
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162850857939.5634.17747219922172884449@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 09 Aug 2021 14:29:39 +0300
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

Quoting Christoph Hellwig (2021-07-21 18:53:38)
> Instead of having an option to build the gvt code into the main i915
> module, just move it into the kvmgt.ko module.  This only requires
> a new struct with three entries that the main i915 module needs to
> request before enabling VGPU passthrough operations.
>=20
> This also conveniently streamlines the GVT initialization and avoids
> the need for the global device pointer.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Hi,

Thanks for putting the work into this. This conversion has been
requested for a long time. For clarity, should we call the module
i915_kvmgt?

How far would we be from dynamically modprobing/rmmoding the kvmgt
module in order to eliminate the enable_gvt parameter?

<SNIP>

> +
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
> +EXPORT_SYMBOL_NS_GPL(intel_context_unpin, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_put, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(shmem_pin_map, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(shmem_unpin_map, I915_GVT);
> +EXPORT_SYMBOL_NS_GPL(__px_dma, I915_GVT);

This list is also a concern. At the least the double underscore
functions should be eliminated from being exported.

Zhi and Zhenyu, can we have some further patches to clean that up?

Regards, Joonas
