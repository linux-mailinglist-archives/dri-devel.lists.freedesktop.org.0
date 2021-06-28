Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9143B59DE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E91689D8D;
	Mon, 28 Jun 2021 07:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441B489D8D;
 Mon, 28 Jun 2021 07:41:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="188284711"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="188284711"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 00:41:40 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="454423265"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 00:41:39 -0700
Subject: Re: [PATCH v2 2/2] drm/i915/gem: only allow WB for smem only
 placements
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210625122751.590289-1-matthew.auld@intel.com>
 <20210625122751.590289-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <b6ee3701-2662-315c-3c2a-c4d92623fbbc@linux.intel.com>
Date: Mon, 28 Jun 2021 09:41:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625122751.590289-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/25/21 2:27 PM, Matthew Auld wrote:
> We only support single mode and this should be immutable. For smem only
> placements on DGFX this should be WB. On DG1 everything is snooped,
> always, and so should be coherent.
>
> I915_GEM_DOMAIN_GTT looks like it's for the aperture which is now gone
> for DGFX, so hopefully can also be safely rejected.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c |  7 +++++++
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c   | 10 ++++++++++
>   2 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index d0c91697bb22..e3459a524e64 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -577,6 +577,13 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
>   		goto out_unpin;
>   	}
>   
> +	if (IS_DGFX(to_i915(obj->base.dev)) && obj->mm.n_placements == 1 &&
> +	    i915_gem_object_placements_contain_type(obj, INTEL_MEMORY_SYSTEM) &&
> +	    read_domains != I915_GEM_DOMAIN_CPU) {
> +		err = -EINVAL;
> +		goto out_unpin;
> +	}
> +
>   	if (read_domains & I915_GEM_DOMAIN_WC)
>   		err = i915_gem_object_set_to_wc_domain(obj, write_domain);
>   	else if (read_domains & I915_GEM_DOMAIN_GTT)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index f3586b36dd53..afc9f3dc38b9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -673,6 +673,7 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
>   		     enum i915_mmap_type mmap_type,
>   		     u64 *offset, struct drm_file *file)
>   {
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>   	struct i915_mmap_offset *mmo;
>   
>   	if (i915_gem_object_never_mmap(obj))
> @@ -697,6 +698,15 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
>   	    i915_gem_object_placements_contain_type(obj, INTEL_MEMORY_LOCAL))
>   		return -ENODEV;
>   
> +	/*
> +	 * For smem only placements on DGFX we need to default to WB. On DG1
> +	 * everything is snooped always, so should always be coherent.
> +	 */
> +	 if (IS_DGFX(i915) &&
> +	     mmap_type != I915_MMAP_TYPE_WB && obj->mm.n_placements == 1 &&
> +	     i915_gem_object_placements_contain_type(obj, INTEL_MEMORY_SYSTEM))
> +		return -ENODEV;
> +

Same thing here as in the previous patch.

Also do we need to modify i915_coherent_map_type() to also include 
HAS_SNOOP()?

While we're at it, that "always_coherent" argument to 
i915_coherent_map_type() appears scary to me and probably needs some 
documentation. It seems used for page-tables. Is it because we know 
those are always snooped?

/Thomas


>   	mmo = mmap_offset_attach(obj, mmap_type, file);
>   	if (IS_ERR(mmo))
>   		return PTR_ERR(mmo);
