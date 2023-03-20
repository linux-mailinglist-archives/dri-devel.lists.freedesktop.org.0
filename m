Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A65476C145C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080BA10E1BF;
	Mon, 20 Mar 2023 14:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897BA10E002;
 Mon, 20 Mar 2023 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679321312; x=1710857312;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XW7+ruv9w7lb2rFrQN8zsge4pr2Xi61xw33/fynuXu4=;
 b=HzrL+PTHUnu4cLSaqajtxvbKpHlpdPGHVdnVX6chSKP2iSCKn3sYhLQb
 iteXja+2h7pcSbt2YBNqv7xf2Cz+QR4dcPRcJvF/VOOoF2dLt2/y62wuT
 /x9fV9x0EMfkwJMxPTwCnS86qpUCLXDWBL0GzVTMp5Dcphs/QWwSSexDI
 ti8vdq/B8rBhZvY/EbAlZTd2Am7dn2nR+QnuKTzT0/DIAIZ95sPpfSrDh
 aPb3vEF+oVtROJaTY62dU+JJ6ntR4vAtM595mM2hcbeMODKZTR8Ldfp7g
 F9Y9TOYcrxJU9tbj/uPrG4AouG3si7fR4LwnKR1ZvEPmGuxr/YRaiD5ot Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="366387335"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="366387335"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 07:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770207249"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="770207249"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.6.65])
 ([10.213.6.65])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 07:02:59 -0700
Message-ID: <c1b797a5-92d6-6590-9c47-6606ec409a12@intel.com>
Date: Mon, 20 Mar 2023 15:02:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v2: 1/3] drm/i915: Add a function to mmap
 framebuffer obj
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230320100903.23588-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230320100903.23588-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.03.2023 11:09, Nirmoy Das wrote:
> Implement i915_gem_fb_mmap() to enable fb_ops.fb_mmap()
> callback for i915's framebuffer objects.
> 
> v2: add a comment why i915_gem_object_get() needed(Andi).
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 127 +++++++++++++++--------
>   drivers/gpu/drm/i915/gem/i915_gem_mman.h |   2 +-
>   2 files changed, 83 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index d3c1dee16af2..341e952d3510 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -927,53 +927,15 @@ static struct file *mmap_singleton(struct drm_i915_private *i915)
>   	return file;
>   }
>   
> -/*
> - * This overcomes the limitation in drm_gem_mmap's assignment of a
> - * drm_gem_object as the vma->vm_private_data. Since we need to
> - * be able to resolve multiple mmap offsets which could be tied
> - * to a single gem object.
> - */
> -int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> +static int
> +i915_gem_object_mmap(struct drm_i915_gem_object *obj,
> +		     struct i915_mmap_offset *mmo,
> +		     struct vm_area_struct *vma)
>   {
> -	struct drm_vma_offset_node *node;
> -	struct drm_file *priv = filp->private_data;
> -	struct drm_device *dev = priv->minor->dev;
> -	struct drm_i915_gem_object *obj = NULL;
> -	struct i915_mmap_offset *mmo = NULL;
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	struct drm_device *dev = &i915->drm;
>   	struct file *anon;
>   
> -	if (drm_dev_is_unplugged(dev))
> -		return -ENODEV;
> -
> -	rcu_read_lock();
> -	drm_vma_offset_lock_lookup(dev->vma_offset_manager);
> -	node = drm_vma_offset_exact_lookup_locked(dev->vma_offset_manager,
> -						  vma->vm_pgoff,
> -						  vma_pages(vma));
> -	if (node && drm_vma_node_is_allowed(node, priv)) {
> -		/*
> -		 * Skip 0-refcnted objects as it is in the process of being
> -		 * destroyed and will be invalid when the vma manager lock
> -		 * is released.
> -		 */
> -		if (!node->driver_private) {
> -			mmo = container_of(node, struct i915_mmap_offset, vma_node);
> -			obj = i915_gem_object_get_rcu(mmo->obj);
> -
> -			GEM_BUG_ON(obj && obj->ops->mmap_ops);
> -		} else {
> -			obj = i915_gem_object_get_rcu
> -				(container_of(node, struct drm_i915_gem_object,
> -					      base.vma_node));
> -
> -			GEM_BUG_ON(obj && !obj->ops->mmap_ops);
> -		}
> -	}
> -	drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
> -	rcu_read_unlock();
> -	if (!obj)
> -		return node ? -EACCES : -EINVAL;
> -
>   	if (i915_gem_object_is_readonly(obj)) {
>   		if (vma->vm_flags & VM_WRITE) {
>   			i915_gem_object_put(obj);
> @@ -1005,7 +967,7 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>   	if (obj->ops->mmap_ops) {
>   		vma->vm_page_prot = pgprot_decrypted(vm_get_page_prot(vma->vm_flags));
>   		vma->vm_ops = obj->ops->mmap_ops;
> -		vma->vm_private_data = node->driver_private;
> +		vma->vm_private_data = obj->base.vma_node.driver_private;
>   		return 0;
>   	}
>   
> @@ -1043,6 +1005,81 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>   	return 0;
>   }
>   
> +/*
> + * This overcomes the limitation in drm_gem_mmap's assignment of a
> + * drm_gem_object as the vma->vm_private_data. Since we need to
> + * be able to resolve multiple mmap offsets which could be tied
> + * to a single gem object.
> + */
> +int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct drm_vma_offset_node *node;
> +	struct drm_file *priv = filp->private_data;
> +	struct drm_device *dev = priv->minor->dev;
> +	struct drm_i915_gem_object *obj = NULL;
> +	struct i915_mmap_offset *mmo = NULL;
> +
> +	if (drm_dev_is_unplugged(dev))
> +		return -ENODEV;
> +
> +	rcu_read_lock();
> +	drm_vma_offset_lock_lookup(dev->vma_offset_manager);
> +	node = drm_vma_offset_exact_lookup_locked(dev->vma_offset_manager,
> +						  vma->vm_pgoff,
> +						  vma_pages(vma));
> +	if (node && drm_vma_node_is_allowed(node, priv)) {
> +		/*
> +		 * Skip 0-refcnted objects as it is in the process of being
> +		 * destroyed and will be invalid when the vma manager lock
> +		 * is released.
> +		 */
> +		if (!node->driver_private) {
> +			mmo = container_of(node, struct i915_mmap_offset, vma_node);
> +			obj = i915_gem_object_get_rcu(mmo->obj);
> +
> +			GEM_BUG_ON(obj && obj->ops->mmap_ops);
> +		} else {
> +			obj = i915_gem_object_get_rcu
> +				(container_of(node, struct drm_i915_gem_object,
> +					      base.vma_node));
> +
> +			GEM_BUG_ON(obj && !obj->ops->mmap_ops);
> +		}
> +	}
> +	drm_vma_offset_unlock_lookup(dev->vma_offset_manager);
> +	rcu_read_unlock();
> +	if (!obj)
> +		return node ? -EACCES : -EINVAL;
> +
> +	return i915_gem_object_mmap(obj, mmo, vma);
> +}
> +
> +int i915_gem_fb_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma)
> +{
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	struct drm_device *dev = &i915->drm;
> +	struct i915_mmap_offset *mmo = NULL;
> +	enum i915_mmap_type mmap_type;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
> +
> +	if (drm_dev_is_unplugged(dev))
> +		return -ENODEV;
> +
> +	mmap_type = i915_ggtt_has_aperture(ggtt) ? I915_MMAP_TYPE_GTT : I915_MMAP_TYPE_WC;
> +	mmo = mmap_offset_attach(obj, mmap_type, NULL);
> +	if (!mmo)
> +		return -ENODEV;
> +
> +	/*
> +	 * When we install vm_ops for mmap we are too late for
> +	 * the vm_ops->open() which increases the ref_count of
> +	 * this obj and then it gets decreased by the vm_ops->close().
> +	 * To balance this increase the obj ref_count here.
> +	 */
> +	obj = i915_gem_object_get(mmo->obj);
> +	return i915_gem_object_mmap(obj, mmo, vma);
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftests/i915_gem_mman.c"
>   #endif
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
> index 1fa91b3033b3..196417fd0f5c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
> @@ -29,5 +29,5 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
>   
>   void i915_gem_object_runtime_pm_release_mmap_offset(struct drm_i915_gem_object *obj);
>   void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj);
> -
> +int i915_gem_fb_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma);
>   #endif

