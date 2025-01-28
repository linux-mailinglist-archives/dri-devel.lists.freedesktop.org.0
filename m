Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43582A20E5F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B389910E06A;
	Tue, 28 Jan 2025 16:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMP28rof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE13E10E6C0;
 Tue, 28 Jan 2025 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738081178; x=1769617178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RrZYsnhVtZvJnqaZ+K9b85vjJ864CR/u6n1y6fJs/UM=;
 b=kMP28rof+5co0mg4+HfuOPQRNKXKngStFsZOQmnTKF0AUVWTzpbOKAyb
 3NSNUKPisBwfJnY+9soQ9OgmZOMwXscnvLpWf1NRRHH65DO2iKeQ9MFuY
 SEIxuuK3WpravaoYTuETa0Rs2ALr0RB/3n89A5ABSA1oOcU5ZS+xtFbiH
 QhjpeSiZVUFSfaB65Vi4wVMhhuKuRrtMvaRToWNBnfL6+kjPbmHlHZ26j
 zxfRREuy8VC1/RLSq1un8HURYRmwtylIUK3u/b+tFjh826h5IkbkPhSxH
 47nwxwPpUfWaxmOQWovV8AQLhJnFs2fBHbqQacWTeIOEzemaNLOpim+Vg A==;
X-CSE-ConnectionGUID: HTkfBfBRRzO6saV+iFdPTw==
X-CSE-MsgGUID: 7G7r6mawSvuqR9rzrxnG0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38456448"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38456448"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:19:37 -0800
X-CSE-ConnectionGUID: KWgGovjsQfiLTnLRIYkZ5w==
X-CSE-MsgGUID: 7ZyubuLpQXuJRP4oZ97/pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="108880158"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 28 Jan 2025 08:19:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Jan 2025 18:19:31 +0200
Date: Tue, 28 Jan 2025 18:19:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Brian Geffon <bgeffon@google.com>
Cc: intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com,
 jani.saarinen@intel.com, tomasz.mistat@intel.com,
 vidya.srinivas@intel.com, jani.nikula@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 stable@vger.kernel.org, Tomasz Figa <tfiga@google.com>
Subject: Re: [PATCH v3] drm/i915: Fix page cleanup on DMA remap failure
Message-ID: <Z5kDk69SkeHgwnj2@intel.com>
References: <20250127204332.336665-1-bgeffon@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127204332.336665-1-bgeffon@google.com>
X-Patchwork-Hint: comment
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

On Mon, Jan 27, 2025 at 03:43:32PM -0500, Brian Geffon wrote:
> When converting to folios the cleanup path of shmem_get_pages() was
> missed. When a DMA remap fails and the max segment size is greater than
> PAGE_SIZE it will attempt to retry the remap with a PAGE_SIZEd segment
> size. The cleanup code isn't properly using the folio apis and as a
> result isn't handling compound pages correctly.
> 
> v2 -> v3:
> (Ville) Just use shmem_sg_free_table() as-is in the failure path of
> shmem_get_pages(). shmem_sg_free_table() will clear mapping unevictable
> but it will be reset when it retries in shmem_sg_alloc_table().
> 
> v1 -> v2:
> (Ville) Fixed locations where we were not clearing mapping unevictable.
> 
> Cc: stable@vger.kernel.org
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13487
> Link: https://lore.kernel.org/lkml/20250116135636.410164-1-bgeffon@google.com/
> Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch")
> Signed-off-by: Brian Geffon <bgeffon@google.com>
> Suggested-by: Tomasz Figa <tfiga@google.com>

Thanks. Pushed to drm-intel-gt-next.

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index fe69f2c8527d..ae3343c81a64 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -209,8 +209,6 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>  	struct address_space *mapping = obj->base.filp->f_mapping;
>  	unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
>  	struct sg_table *st;
> -	struct sgt_iter sgt_iter;
> -	struct page *page;
>  	int ret;
>  
>  	/*
> @@ -239,9 +237,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>  		 * for PAGE_SIZE chunks instead may be helpful.
>  		 */
>  		if (max_segment > PAGE_SIZE) {
> -			for_each_sgt_page(page, sgt_iter, st)
> -				put_page(page);
> -			sg_free_table(st);
> +			shmem_sg_free_table(st, mapping, false, false);
>  			kfree(st);
>  
>  			max_segment = PAGE_SIZE;
> -- 
> 2.48.1.262.g85cc9f2d1e-goog

-- 
Ville Syrjälä
Intel
