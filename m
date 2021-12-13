Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2492B472C67
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 13:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4628910E752;
	Mon, 13 Dec 2021 12:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B4110E7E3;
 Mon, 13 Dec 2021 12:40:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="324992284"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="324992284"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 04:40:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="481495980"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 13 Dec 2021 04:40:00 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Dec 2021 14:39:59 +0200
Date: Mon, 13 Dec 2021 14:39:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: ira.weiny@intel.com
Subject: Re: [PATCH 1/7] drm/i915: Replace kmap() with kmap_local_page()
Message-ID: <Ybc/HwaG2vgbdkQr@intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20211210232404.4098157-2-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211210232404.4098157-2-ira.weiny@intel.com>
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 03:23:58PM -0800, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> kmap() is being deprecated and these usages are all local to the thread
> so there is no reason kmap_local_page() can't be used.
> 
> Replace kmap() calls with kmap_local_page().
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c          | 4 ++--
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c       | 4 ++--
>  drivers/gpu/drm/i915/gt/shmem_utils.c              | 4 ++--
>  drivers/gpu/drm/i915/i915_gem.c                    | 8 ++++----
>  drivers/gpu/drm/i915/i915_gpu_error.c              | 4 ++--
>  6 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index d77da59fae04..fa8b820e14aa 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -597,9 +597,9 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
>  		if (err < 0)
>  			goto fail;
>  
> -		vaddr = kmap(page);
> +		vaddr = kmap_local_page(page);
>  		memcpy(vaddr, data, len);
> -		kunmap(page);
> +		kunmap_local(vaddr);
>  
>  		err = pagecache_write_end(file, file->f_mapping,
>  					  offset, len, len,
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 6d30cdfa80f3..e59e1725e29d 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -144,7 +144,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
>  	intel_gt_flush_ggtt_writes(&to_i915(obj->base.dev)->gt);
>  
>  	p = i915_gem_object_get_page(obj, offset >> PAGE_SHIFT);
> -	cpu = kmap(p) + offset_in_page(offset);
> +	cpu = kmap_local_page(p) + offset_in_page(offset);

Does kunmap_local() do some magic to make it work even when you
don't pass in the same value you got from kmap_local_page()?

>  	drm_clflush_virt_range(cpu, sizeof(*cpu));
>  	if (*cpu != (u32)page) {
>  		pr_err("Partial view for %lu [%u] (offset=%llu, size=%u [%llu, row size %u], fence=%d, tiling=%d, stride=%d) misalignment, expected write to page (%llu + %u [0x%llx]) of 0x%x, found 0x%x\n",
> @@ -162,7 +162,7 @@ static int check_partial_mapping(struct drm_i915_gem_object *obj,
>  	}
>  	*cpu = 0;
>  	drm_clflush_virt_range(cpu, sizeof(*cpu));
> -	kunmap(p);
> +	kunmap_local(cpu);
>  
>  out:
>  	__i915_vma_put(vma);

-- 
Ville Syrjälä
Intel
