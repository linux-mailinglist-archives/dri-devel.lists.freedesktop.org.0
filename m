Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDA941ACF9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 12:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1306E889;
	Tue, 28 Sep 2021 10:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E0B6E0FE;
 Tue, 28 Sep 2021 10:30:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="285682285"
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="285682285"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 03:30:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="553936688"
Received: from ainunnax-mobl4.gar.corp.intel.com (HELO [10.214.171.82])
 ([10.214.171.82])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 03:30:47 -0700
Subject: Re: [PATCH] drm/i915/ttm: Rework object initialization slightly
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210927151017.287414-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <a3cdd992-6208-b0c9-72b1-191fd47c40a8@intel.com>
Date: Tue, 28 Sep 2021 11:30:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210927151017.287414-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/09/2021 16:10, Thomas Hellström wrote:
> We may end up in i915_ttm_bo_destroy() in an error path before the
> object is fully initialized. In that case it's not correct to call
> __i915_gem_free_object(), because that function
> a) Assumes the gem object refcount is 0, which it isn't.
> b) frees the placements which are owned by the caller until the
> init_object() region ops returns successfully. Fix this by providing
> a lightweight cleanup function i915_gem_object_fini() which is also
> called by __i915_gem_free_object().
> 
> While doing this, also make sure we call dma_resv_fini() as part of
> ordinary object destruction and not from the RCU callback that frees
> the object. This will help track down bugs where the object is incorrectly
> locked from an RCU lookup.
> 
> Finally, make sure the object isn't put on the region list until it's
> either locked or fully initialized in order to block list processing of
> partially initialized objects.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 18 ++++++++++--
>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  3 ++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 32 +++++++++++++---------
>   3 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 6fb9afb65034..244e555f9bba 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -89,6 +89,20 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
>   	mutex_init(&obj->mm.get_dma_page.lock);
>   }
>   
> +/**
> + * i915_gem_object_fini - Clean up a GEM object initialization
> + * @obj: The gem object cleanup
> + *
> + * This function cleans up gem object fields that are set up by
> + * drm_gem_private_object_init() and i915_gem_object_init().
> + */
> +void i915_gem_object_fini(struct drm_i915_gem_object *obj)
> +{
> +	mutex_destroy(&obj->mm.get_page.lock);
> +	mutex_destroy(&obj->mm.get_dma_page.lock);
> +	dma_resv_fini(&obj->base._resv);
> +}
> +
>   /**
>    * Mark up the object's coherency levels for a given cache_level
>    * @obj: #drm_i915_gem_object
> @@ -174,7 +188,6 @@ void __i915_gem_free_object_rcu(struct rcu_head *head)
>   		container_of(head, typeof(*obj), rcu);
>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>   
> -	dma_resv_fini(&obj->base._resv);
>   	i915_gem_object_free(obj);
>   
>   	GEM_BUG_ON(!atomic_read(&i915->mm.free_count));
> @@ -223,7 +236,6 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
>   						       obj_link))) {
>   			GEM_BUG_ON(vma->obj != obj);
>   			spin_unlock(&obj->vma.lock);
> -
>   			__i915_vma_put(vma);

Unrelated change?

Not seeing any DG1 machines in CI currently, so assuming this was tested 
locally,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


