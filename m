Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1CE7619F2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 15:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C07610E125;
	Tue, 25 Jul 2023 13:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3281910E125;
 Tue, 25 Jul 2023 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690291749; x=1721827749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bBemODgIWZjkKSkRRfpxFDV/EeYKSvecdQ/ycBdTgx0=;
 b=cbDEPIq2mKgWiMmA3twM/j6ZjRsoOUr+LD7s1mi8qiYEFVHfYnc3x2C+
 5fFu8gMTag3S4R5acEgAknon6WHCNAR0Q1SIA4S6D8d3AIHCW6oxGlLjo
 7VSU47lVKK1YcImfDqKpvU5Ilo6gcU2SI0tnypv+9ROiO4H1520xdh80e
 oxUMDKmvf+SB+8fZfwGCSM7bBnP9jiikcyWzz2dB+hl5tXpya00ODpz3y
 DS/iUdQxI3oU6qNrBGY6qL1aVkXVeaiz1Oz/GkuMyCd2yB1aAYjlR/f2Z
 ysQGsJslUhzSYwHn4e1vv6o+WIuUyxtcNmvThN+WmrHyqxGKIdzJGyT2l g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="433972141"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="433972141"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 06:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="972687787"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="972687787"
Received: from kshutemo-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.237])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 06:29:06 -0700
Date: Tue, 25 Jul 2023 15:29:03 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use the i915_vma_flush_writes helper
Message-ID: <ZL/OH6zweRRGr0U6@ashyti-mobl2.lan>
References: <20230721130741.1306563-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721130741.1306563-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -68,10 +68,8 @@ flush_write_domain(struct drm_i915_gem_object *obj, unsigned int flush_domains)
>  	switch (obj->write_domain) {
>  	case I915_GEM_DOMAIN_GTT:
>  		spin_lock(&obj->vma.lock);
> -		for_each_ggtt_vma(vma, obj) {
> -			if (i915_vma_unset_ggtt_write(vma))
> -				intel_gt_flush_ggtt_writes(vma->vm->gt);
> -		}
> +		for_each_ggtt_vma(vma, obj)
> +			i915_vma_flush_writes(vma);

yes, that's some duplicated code removed here! Thanks! I believe
I'm in time to add my:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

>  		spin_unlock(&obj->vma.lock);
>  
>  		i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
> -- 
> 2.39.2
