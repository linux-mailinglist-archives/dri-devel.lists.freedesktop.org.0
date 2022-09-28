Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 093485EDF10
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 16:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE5A10E930;
	Wed, 28 Sep 2022 14:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A3210E930;
 Wed, 28 Sep 2022 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664376271; x=1695912271;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dBhAazOzkvx5S2BwiHtccNSzkq/oofjDIg75Irxb51A=;
 b=f7OSmG/i1EupWfZJVCi/09bWXjbxvJbvTO7nH1K/+acGSta7nhNYKzHh
 +ouNkOGI+wIvGb/jE5SUROJkccA/pvWla9uz+wL70h2zZK1gqw9f8XZxR
 flmtUQIjK8WPorOX70O1jj/oeLopC6mHtq7HoF4Mfb8dqu+QbGCkD7Jmk
 SFw5IPaonVChqrwbmNROzlyUYNhhxyuN8PhHZc8Ky+sHpOfhppL9+/hlB
 7Uhw/Oz195iUK3ch3Im09zRSBcElv0/NgVYlWW5Z5yz/jRxo+4xK7/IBV
 C94DW1PSU3AYaknb9CvuyTzUFo3NUYKRXWVxsvsh11JYFIsC/NeNJPhO7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="300337130"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="300337130"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 07:44:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="652703728"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="652703728"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.182.107])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 07:44:10 -0700
Date: Wed, 28 Sep 2022 16:44:08 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 04/16] drm/i915/vm_bind: Add support to create persistent
 vma
Message-ID: <YzRduJwDy9+7dUNL@ashyti-mobl2.lan>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-5-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928061918.6340-5-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

On Tue, Sep 27, 2022 at 11:19:06PM -0700, Niranjana Vishwanathapura wrote:
> Add i915_vma_instance_persistent() to create persistent vmas.
> Persistent vmas will use i915_gtt_view to support partial binding.
> 
> vma_lookup is tied to segment of the object instead of section
> of VA space. Hence, it do not support aliasing. ie., multiple
> mappings (at different VA) point to the same gtt_view of object.
> Skip vma_lookup for persistent vmas to support aliasing.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_vma.c       | 39 ++++++++++++++++++++++++---
>  drivers/gpu/drm/i915/i915_vma.h       | 16 +++++++++--
>  drivers/gpu/drm/i915/i915_vma_types.h |  7 +++++
>  3 files changed, 57 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index f17c09ead7d7..5839e1f55f00 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -109,7 +109,8 @@ static void __i915_vma_retire(struct i915_active *ref)
>  static struct i915_vma *
>  vma_create(struct drm_i915_gem_object *obj,
>  	   struct i915_address_space *vm,
> -	   const struct i915_gtt_view *view)
> +	   const struct i915_gtt_view *view,
> +	   bool skip_lookup_cache)
>  {
>  	struct i915_vma *pos = ERR_PTR(-E2BIG);
>  	struct i915_vma *vma;
> @@ -196,6 +197,9 @@ vma_create(struct drm_i915_gem_object *obj,
>  		__set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(vma));
>  	}
>  
> +	if (skip_lookup_cache)
> +		goto skip_rb_insert;
> +
>  	rb = NULL;
>  	p = &obj->vma.tree.rb_node;
>  	while (*p) {
> @@ -220,6 +224,7 @@ vma_create(struct drm_i915_gem_object *obj,
>  	rb_link_node(&vma->obj_node, rb, p);
>  	rb_insert_color(&vma->obj_node, &obj->vma.tree);
>  
> +skip_rb_insert:
>  	if (i915_vma_is_ggtt(vma))
>  		/*
>  		 * We put the GGTT vma at the start of the vma-list, followed
> @@ -299,7 +304,34 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
>  
>  	/* vma_create() will resolve the race if another creates the vma */
>  	if (unlikely(!vma))
> -		vma = vma_create(obj, vm, view);
> +		vma = vma_create(obj, vm, view, false);
> +
> +	GEM_BUG_ON(!IS_ERR(vma) && i915_vma_compare(vma, vm, view));
> +	return vma;
> +}
> +
> +/**
> + * i915_vma_create_persistent - create a persistent VMA
> + * @obj: parent &struct drm_i915_gem_object to be mapped
> + * @vm: address space in which the mapping is located
> + * @view: additional mapping requirements
> + *
> + * Creates a persistent vma.
> + *
> + * Returns the vma, or an error pointer.
> + */
> +struct i915_vma *
> +i915_vma_create_persistent(struct drm_i915_gem_object *obj,
> +			   struct i915_address_space *vm,
> +			   const struct i915_gtt_view *view)
> +{
> +	struct i915_vma *vma;
> +
> +	GEM_BUG_ON(!kref_read(&vm->ref));
> +
> +	vma = vma_create(obj, vm, view, true);
> +	if (!IS_ERR(vma))
> +		i915_vma_set_persistent(vma);
>  
>  	GEM_BUG_ON(!IS_ERR(vma) && i915_vma_compare(vma, vm, view));
>  	return vma;
> @@ -1666,7 +1698,8 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
>  
>  	spin_lock(&obj->vma.lock);
>  	list_del(&vma->obj_link);
> -	if (!RB_EMPTY_NODE(&vma->obj_node))
> +	if (!i915_vma_is_persistent(vma) &&
> +	    !RB_EMPTY_NODE(&vma->obj_node))
>  		rb_erase(&vma->obj_node, &obj->vma.tree);
>  
>  	spin_unlock(&obj->vma.lock);
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index aecd9c64486b..51e712de380a 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -44,6 +44,10 @@ struct i915_vma *
>  i915_vma_instance(struct drm_i915_gem_object *obj,
>  		  struct i915_address_space *vm,
>  		  const struct i915_gtt_view *view);
> +struct i915_vma *
> +i915_vma_create_persistent(struct drm_i915_gem_object *obj,
> +			   struct i915_address_space *vm,
> +			   const struct i915_gtt_view *view);
>  
>  void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
>  #define I915_VMA_RELEASE_MAP BIT(0)
> @@ -138,6 +142,16 @@ static inline u32 i915_ggtt_pin_bias(struct i915_vma *vma)
>  	return i915_vm_to_ggtt(vma->vm)->pin_bias;
>  }
>  
> +static inline bool i915_vma_is_persistent(const struct i915_vma *vma)
> +{
> +	return test_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
> +}
> +
> +static inline void i915_vma_set_persistent(struct i915_vma *vma)
> +{
> +	set_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
> +}
> +
>  static inline struct i915_vma *i915_vma_get(struct i915_vma *vma)
>  {
>  	i915_gem_object_get(vma->obj);
> @@ -164,8 +178,6 @@ i915_vma_compare(struct i915_vma *vma,
>  {
>  	ptrdiff_t cmp;
>  
> -	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
> -
>  	cmp = ptrdiff(vma->vm, vm);
>  	if (cmp)
>  		return cmp;
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> index ec0f6c9f57d0..2200f1f103ba 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -264,6 +264,13 @@ struct i915_vma {
>  #define I915_VMA_SCANOUT_BIT	17
>  #define I915_VMA_SCANOUT	((int)BIT(I915_VMA_SCANOUT_BIT))
>  
> +/**
> + * I915_VMA_PERSISTENT_BIT:
> + * The vma is persistent (created with VM_BIND call).
> + */
> +#define I915_VMA_PERSISTENT_BIT	19
> +#define I915_VMA_PERSISTENT	((int)BIT(I915_VMA_PERSISTENT_BIT))
> +

are we using I915_VMA_PERSISTENT anywhere?

Andi

>  	struct i915_active active;
>  
>  #define I915_VMA_PAGES_BIAS 24
> -- 
> 2.21.0.rc0.32.g243a4c7e27
