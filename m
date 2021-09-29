Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 299A541C3D9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 13:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895BB6EA29;
	Wed, 29 Sep 2021 11:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737596EA29;
 Wed, 29 Sep 2021 11:54:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="224992634"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="224992634"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 04:54:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="708346093"
Received: from jmaugusx-mobl1.gar.corp.intel.com (HELO [10.249.254.159])
 ([10.249.254.159])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 04:54:35 -0700
Message-ID: <6372b5a3ab5b8d5b640af59c9290cbe6da21a0f9.camel@linux.intel.com>
Subject: Re: [PATCH v5 12/13] drm/i915/ttm: use cached system pages when
 evicting lmem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 29 Sep 2021 13:54:33 +0200
In-Reply-To: <20210927114114.152310-12-matthew.auld@intel.com>
References: <20210927114114.152310-1-matthew.auld@intel.com>
 <20210927114114.152310-12-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-09-27 at 12:41 +0100, Matthew Auld wrote:
> This should let us do an accelerated copy directly to the shmem pages
> when temporarily moving lmem-only objects, where the i915-gem
> shrinker
> can later kick in to swap out the pages, if needed.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 194e5f1deda8..46d57541c0b2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -134,11 +134,11 @@ static enum ttm_caching
>  i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
>  {
>         /*
> -        * Objects only allowed in system get cached cpu-mappings.
> -        * Other objects get WC mapping for now. Even if in system.
> +        * Objects only allowed in system get cached cpu-mappings, or
> when
> +        * evicting lmem-only buffers to system for swapping. Other
> objects get
> +        * WC mapping for now. Even if in system.
>          */
> -       if (obj->mm.region->type == INTEL_MEMORY_SYSTEM &&
> -           obj->mm.n_placements <= 1)
> +       if (obj->mm.n_placements <= 1)
>                 return ttm_cached;
>  
>         return ttm_write_combined;

We should be aware that with TTM, even evicted bos can be mapped by
user-space while evicted, and this will appear to user-space like the
WC-mapped object suddenly became WB-mapped. But it appears like mesa
doesn't care about this as long as the mappings are fully coherent.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>




