Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03AEA2C127
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 12:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D960110E08E;
	Fri,  7 Feb 2025 11:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Su1fOBP3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC5410E08E;
 Fri,  7 Feb 2025 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738926174; x=1770462174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ENAbJglwPtDhtDx4sNdFeUf2Z9r1yDUmaR1yOF86pgM=;
 b=Su1fOBP3F6s2BSvhVKDxzUWAkGCMM7FLmZ+I3l0mM8tI/aug5P2ViHNa
 nFhXIYZ4B90Xg/YGW0imiTqoPl6lXm+I7mHBOj2kzIpZVJraVD/QeRzan
 CTAQsL1t+Bzc5hjraWYP7qHWoV/MTnmr/Pv26av062NBKFsfkCVw2oMAd
 61c7029Ke8x1hZHlhjLcqKGVB6wsOGPXuQS3r5Hrnrlux/ootz27fAvds
 fEbVOZAH2g5Ag0lm868BLPPaRBCKF3KuhoEYF151LTQC0slkycV9tRVb7
 8F1Z049O15mLkhBMZvKf44gP00B0PCC+kDd/2wWvPenZGLIIHjk3ySRq9 g==;
X-CSE-ConnectionGUID: wVIGj9dmQGet1hehJqKeCA==
X-CSE-MsgGUID: LzXhTtaYS92esHuuBnZ3fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27171043"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="27171043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:02:54 -0800
X-CSE-ConnectionGUID: Qr/W36oXSyagrZRF/uopAg==
X-CSE-MsgGUID: o5fEKG/UTgqZr7FYL0UY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111928610"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.140])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:02:47 -0800
Date: Fri, 7 Feb 2025 12:02:43 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Josef Bacik <josef@toxicpanda.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Brian Geffon <bgeffon@google.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/i915: Fix NULL vs IS_ERR() check in
 __shmem_writeback()
Message-ID: <Z6XoU6GopCT-CxNK@ashyti-mobl2.lan>
References: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
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

Hi Dan,

On Thu, Feb 06, 2025 at 11:17:02AM +0300, Dan Carpenter wrote:
> The filemap_lock_folio() function doesn't return NULL, it returns error
> pointers.
> 
> Fixes: 25dd342f0cc8 ("drm/i915/gem: convert __shmem_writeback() to folios")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index a784fb44e59c..fb263b421958 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -319,7 +319,7 @@ void __shmem_writeback(size_t size, struct address_space *mapping)
>  		struct folio *folio;
>  
>  		folio = filemap_lock_folio(mapping, i);
> -		if (!folio)
> +		if (IS_ERR(folio))

I don't see this patch yet in -next yet (and of course not in
drm-tip), which branch is it based on?

Thanks,
Andi

>  			continue;
>  
>  		if (!folio_mapped(folio) && folio_clear_dirty_for_io(folio)) {
> -- 
> 2.47.2
