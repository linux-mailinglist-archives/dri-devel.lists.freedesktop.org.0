Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE243BE052
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 02:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A44B6E7DC;
	Wed,  7 Jul 2021 00:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A966E7DC;
 Wed,  7 Jul 2021 00:36:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209260455"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="209260455"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 17:36:50 -0700
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="427759526"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 17:36:47 -0700
Date: Wed, 7 Jul 2021 06:08:26 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 3/5] drm/i915/uapi: reject caching ioctls for discrete
Message-ID: <20210707003826.GB26377@intel.com>
References: <20210705135310.1502437-1-matthew.auld@intel.com>
 <20210705135310.1502437-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210705135310.1502437-3-matthew.auld@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-05 at 14:53:08 +0100, Matthew Auld wrote:
> It's a noop on DG1, and in the future when need to support other devices
> which let us control the coherency, then it should be an immutable
> creation time property for the BO. This will likely be controlled
> through a new gem_create_ext extension.
> 
> v2: add some kernel doc for the discrete changes, and document the
>     implicit rules
LGTM

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c |  6 +++++
>  include/uapi/drm/i915_drm.h                | 29 +++++++++++++++++++++-
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index 7d1400b13429..43004bef55cb 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -268,6 +268,9 @@ int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
>  	struct drm_i915_gem_object *obj;
>  	int err = 0;
>  
> +	if (IS_DGFX(to_i915(dev)))
> +		return -ENODEV;
> +
>  	rcu_read_lock();
>  	obj = i915_gem_object_lookup_rcu(file, args->handle);
>  	if (!obj) {
> @@ -303,6 +306,9 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
>  	enum i915_cache_level level;
>  	int ret = 0;
>  
> +	if (IS_DGFX(i915))
> +		return -ENODEV;
> +
>  	switch (args->caching) {
>  	case I915_CACHING_NONE:
>  		level = I915_CACHE_NONE;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index d13c6c5fad04..a4faceeb8c32 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1372,7 +1372,34 @@ struct drm_i915_gem_busy {
>   * require unbinding the object from the GTT first, if its current caching value
>   * doesn't match.
>   *
> - *
> + * Note that this all changes on discrete platforms, starting from DG1, the
> + * set/get caching is no longer supported, and is now rejected.  Instead the CPU
> + * caching attributes(WB vs WC) will become an immutable creation time property
> + * for the object, along with the GTT caching level. For now we don't expose any
> + * new uAPI for this, instead on DG1 this is all implicit, although this largely
> + * shouldn't matter since DG1 is coherent by default(without any way of
> + * controlling it).
> + *
> + * Implicit caching rules, starting from DG1:
> + *
> + *     - If any of the object placements (see &drm_i915_gem_create_ext_memory_regions)
> + *       contain I915_MEMORY_CLASS_DEVICE then the object will be allocated and
> + *       mapped as write-combined only.
> + *
> + *     - Everything else is always allocated and mapped as write-back, with the
> + *       guarantee that everything is also coherent with the GPU.
> + *
> + * Note that this is likely to change in the future again, where we might need
> + * more flexibility on future devices, so making this all explicit as part of a
> + * new &drm_i915_gem_create_ext extension is probable.
> + *
> + * Side note: Part of the reason for this is that changing the at-allocation-time CPU
> + * caching attributes for the pages might be required(and is expensive) if we
> + * need to then CPU map the pages later with different caching attributes. This
> + * inconsistent caching behaviour, while supported on x86, is not universally
> + * supported on other architectures. So for simplicity we opt for setting
> + * everything at creation time, whilst also making it immutable, on discrete
> + * platforms.
>   */
>  struct drm_i915_gem_caching {
>  	/**
> -- 
> 2.26.3
> 
