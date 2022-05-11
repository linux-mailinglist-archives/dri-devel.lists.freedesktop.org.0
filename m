Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F210252307B
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 12:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555F410E051;
	Wed, 11 May 2022 10:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A075010E051;
 Wed, 11 May 2022 10:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652264041; x=1683800041;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QfzNbK8xK1toiVcloBzznf91Fo0KngmwDAbahjmvIeY=;
 b=S7+0NRF7goSYFhihBkcJaZv2eWFN5WryE4ZRVPPpkkfsLjnXMQ3duprq
 Nc+WK3WyMG1YDFL5QibTFRhA+//ETFfoYbjMs1r25AKU2Vv9iJMPHHrU3
 GsRF68UPsKmuGPKMyV4+0N+2gcc6odqwq3ixNeEyDQ0paYlwNCs1JSN2p
 F6c9FNzNmj0CONiW7BBp8r5uh0KtY5NwN2scU1ZmIQaKe5OhrNWwqf5B5
 Iw+PIbQM17ALHxUdKEcob94I9oF8YofVoxiEI1RoP4bLDdVPa44fWXz0t
 e28qEAyPDu6RnRXtmIZ4C25p7ZqUd4DLEXsHTq9PWYGSAuxDTnJv1ITwx g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="294893172"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="294893172"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 03:14:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="697510872"
Received: from mstribae-mobl1.ger.corp.intel.com (HELO [10.249.254.135])
 ([10.249.254.135])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 03:13:57 -0700
Message-ID: <3d08eb595c4a4eff02be5385c82d1e1d0e781c98.camel@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/i915: add gen6 ppgtt dummy creation function
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 11 May 2022 12:13:55 +0200
In-Reply-To: <20220503191316.1145124-2-bob.beckett@collabora.com>
References: <20220503191316.1145124-1-bob.beckett@collabora.com>
 <20220503191316.1145124-2-bob.beckett@collabora.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-3.fc34) 
MIME-Version: 1.0
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
Cc: Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 2022-05-03 at 19:13 +0000, Robert Beckett wrote:
> Internal gem objects will soon just be volatile system memory region
> objects.
> To enable this, create a separate dummy object creation function
> for gen6 ppgtt


It's not clear from the commit message why we need a special case for
this. Could you describe more in detail?

Thanks,
Thomas


> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> ---
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 43
> ++++++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> index 1bb766c79dcb..f3b660cfeb7f 100644
> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> @@ -372,6 +372,45 @@ static const struct drm_i915_gem_object_ops
> pd_dummy_obj_ops = {
>         .put_pages = pd_dummy_obj_put_pages,
>  };
>  
> +static struct drm_i915_gem_object *
> +i915_gem_object_create_dummy(struct drm_i915_private *i915,
> phys_addr_t size)
> +{
> +       static struct lock_class_key lock_class;
> +       struct drm_i915_gem_object *obj;
> +       unsigned int cache_level;
> +
> +       GEM_BUG_ON(!size);
> +       GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
> +
> +       if (overflows_type(size, obj->base.size))
> +               return ERR_PTR(-E2BIG);
> +
> +       obj = i915_gem_object_alloc();
> +       if (!obj)
> +               return ERR_PTR(-ENOMEM);
> +
> +       drm_gem_private_object_init(&i915->drm, &obj->base, size);
> +       i915_gem_object_init(obj, &pd_dummy_obj_ops, &lock_class, 0);
> +       obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
> +
> +       /*
> +        * Mark the object as volatile, such that the pages are
> marked as
> +        * dontneed whilst they are still pinned. As soon as they are
> unpinned
> +        * they are allowed to be reaped by the shrinker, and the
> caller is
> +        * expected to repopulate - the contents of this object are
> only valid
> +        * whilst active and pinned.
> +        */
> +       i915_gem_object_set_volatile(obj);
> +
> +       obj->read_domains = I915_GEM_DOMAIN_CPU;
> +       obj->write_domain = I915_GEM_DOMAIN_CPU;
> +
> +       cache_level = HAS_LLC(i915) ? I915_CACHE_LLC :
> I915_CACHE_NONE;
> +       i915_gem_object_set_cache_coherency(obj, cache_level);
> +
> +       return obj;
> +}
> +
>  static struct i915_page_directory *
>  gen6_alloc_top_pd(struct gen6_ppgtt *ppgtt)
>  {
> @@ -383,9 +422,7 @@ gen6_alloc_top_pd(struct gen6_ppgtt *ppgtt)
>         if (unlikely(!pd))
>                 return ERR_PTR(-ENOMEM);
>  
> -       pd->pt.base = __i915_gem_object_create_internal(ppgtt-
> >base.vm.gt->i915,
> -
>                                                        &pd_dummy_obj_o
> ps,
> -                                                       I915_PDES *
> SZ_4K);
> +       pd->pt.base = i915_gem_object_create_dummy(ppgtt->base.vm.gt-
> >i915, I915_PDES * SZ_4K);
>         if (IS_ERR(pd->pt.base)) {
>                 err = PTR_ERR(pd->pt.base);
>                 pd->pt.base = NULL;


