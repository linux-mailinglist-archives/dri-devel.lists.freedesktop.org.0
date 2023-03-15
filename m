Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B678C6BAF61
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 12:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C157D10E9B9;
	Wed, 15 Mar 2023 11:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E88810E9B9;
 Wed, 15 Mar 2023 11:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678880213; x=1710416213;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nkqyMxRNva0z2Cgsg9OnRa7fNjNuRp3O0LPdct6RpOI=;
 b=KmPcsThAGfMF8/Zs0sA4k99l5uz2C+ampD70s1nPjyhtIek0h0xin9yR
 Qa3Y6CPDG1M5nkGkryrUfFwPfAZNuRD5eBPxJTAHqy1J072gLkkVrKCZ1
 z7KZoZ9lzDQahCmugfZ8kBahzJRwlOE5lWcd8o1c+iQmqUgg61Tuu+VRa
 lYDfTbx8jXeUimERL3OSMYlT4k0TXcFRSfP4d34eV5dH1lW30+Zg4lXlJ
 I0pNu4LEywNyOps5bIeD7B3PlvGmwa7Ib6evo2zQIdX6K8XewfvSgxIG1
 KtEP6XFHcUxvvvj5Su6KOM74K3mo9oac5k6OMjHStIdjiMWJMfv1YYZ4Y A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="336365692"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="336365692"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 04:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672706059"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="672706059"
Received: from mriahix-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.221.151])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 04:36:50 -0700
Date: Wed, 15 Mar 2023 12:36:22 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Clarify seemingly unaccounted obj refcount
 inc
Message-ID: <ZBGttkQsXkxu/nlt@ashyti-mobl2.lan>
References: <20230315105446.5858-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315105446.5858-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Wed, Mar 15, 2023 at 11:54:46AM +0100, Nirmoy Das wrote:
> Add a comment why there is a obj refcount inc before installing
> the vm_ops for the mmap call. Also remove the invalid older comment
> as drm API(drm_gem_prime_mmap()) will hold an obj reference before
> calling this driver mmap callback so we can't have 0-refcnted
> object here.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

fine with me!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index d3c1dee16af2..0bc8c3818443 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -952,9 +952,10 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  						  vma_pages(vma));
>  	if (node && drm_vma_node_is_allowed(node, priv)) {
>  		/*
> -		 * Skip 0-refcnted objects as it is in the process of being
> -		 * destroyed and will be invalid when the vma manager lock
> -		 * is released.
> +		 * When we install vm_ops for mmap we are too late for
> +		 * the vm_ops->open() which increases the ref_count of
> +		 * this obj and then it gets decreased by the vm_ops->close().
> +		 * To balance this increase the obj ref_count here.
>  		 */
>  		if (!node->driver_private) {
>  			mmo = container_of(node, struct i915_mmap_offset, vma_node);
> -- 
> 2.39.0
