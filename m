Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963883CB91A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633D36E9A9;
	Fri, 16 Jul 2021 14:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C73D6E9A7;
 Fri, 16 Jul 2021 14:52:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="190420236"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="190420236"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 07:52:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="656417769"
Received: from kjmurthy-mobl.ger.corp.intel.com (HELO [10.213.193.231])
 ([10.213.193.231])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 07:52:48 -0700
Subject: Re: [PATCH 4/4] drm/i915/uapi: reject set_domain for discrete
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <20210715101536.2606307-5-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <70159117-ca97-667a-3e9b-82125bf309df@linux.intel.com>
Date: Fri, 16 Jul 2021 15:52:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715101536.2606307-5-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/07/2021 11:15, Matthew Auld wrote:
> The CPU domain should be static for discrete, and on DG1 we don't need
> any flushing since everything is already coherent, so really all this
> does is an object wait, for which we have an ioctl. Longer term the
> desired caching should be an immutable creation time property for the
> BO, which can be set with something like gem_create_ext.
> 
> One other user is iris + userptr, which uses the set_domain to probe all
> the pages to check if the GUP succeeds, however we now have a PROBE
> flag for this purpose.
> 
> v2: add some more kernel doc, also add the implicit rules with caching
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
> Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c |  3 +++
>   include/uapi/drm/i915_drm.h                | 19 +++++++++++++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index 43004bef55cb..b684a62bf3b0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -490,6 +490,9 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
>   	u32 write_domain = args->write_domain;
>   	int err;
>   
> +	if (IS_DGFX(to_i915(dev)))
> +		return -ENODEV;
> +
>   	/* Only handle setting domains to types used by the CPU. */
>   	if ((write_domain | read_domains) & I915_GEM_GPU_DOMAINS)
>   		return -EINVAL;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 2e4112bf4d38..04ce310e7ee6 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -901,6 +901,25 @@ struct drm_i915_gem_mmap_offset {
>    *	- I915_GEM_DOMAIN_GTT: Mappable aperture domain
>    *
>    * All other domains are rejected.
> + *
> + * Note that for discrete, starting from DG1, this is no longer supported, and
> + * is instead rejected. On such platforms the CPU domain is effectively static,
> + * where we also only support a single &drm_i915_gem_mmap_offset cache mode,
> + * which can't be set explicitly and instead depends on the object placements,
> + * as per the below.
> + *
> + * Implicit caching rules, starting from DG1:
> + *
> + *	- If any of the object placements (see &drm_i915_gem_create_ext_memory_regions)
> + *	  contain I915_MEMORY_CLASS_DEVICE then the object will be allocated and
> + *	  mapped as write-combined only.

A note about write-combine buffer? I guess saying it is userspace 
responsibility to do it and how.

> + *
> + *	- Everything else is always allocated and mapped as write-back, with the
> + *	  guarantee that everything is also coherent with the GPU.

Haven't been following this so just a question on this one - it is not 
considered interesting to offer non-coherent modes, or even write 
combine, with system memory buffers, for a specific reason?

Regards,

Tvrtko

> + *
> + * Note that this is likely to change in the future again, where we might need
> + * more flexibility on future devices, so making this all explicit as part of a
> + * new &drm_i915_gem_create_ext extension is probable.
>    */
>   struct drm_i915_gem_set_domain {
>   	/** @handle: Handle for the object. */
> 
