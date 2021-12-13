Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B315A472CC4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 14:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C5E10E7B1;
	Mon, 13 Dec 2021 13:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFD810E721;
 Mon, 13 Dec 2021 13:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639400598; x=1670936598;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+hkuBro1FIArmqCU4DnYmYNozBM1ig92k/dHzqugSr8=;
 b=jsS/11Lc+tlKoDF1hLnGwklKACOKve/n3NLQmX5gC9a1sgka8zTL3l8w
 6ye2nG8ZrRb45LgXEYOaIFVIOcSnoG8CoFp9fYhBX4CVQDRrfnzafa3de
 KeO0qy4TGtLQue96AakNDgxQS6RgvqRIhVh7wBjHIJZIuSK8SsY1CUOBK
 G4S9KuyPquN03CLTXwx93dbb1TVMN+LdovkNjLVLs29ox6n1HjQzjg0xg
 O83/2OCA3N5dZnaWyk8XIxxCzoj/C2QJNAUosVYqfot+NDH4Hn5a1Op3n
 MKvdW93/XgbOIhQs6Fb6EN+N8tvNIWCJomJCMYWDGRNFGAVlRRWUwgUp1 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="324995993"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="324995993"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 05:02:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="463371551"
Received: from ttbuckle-mobl.ger.corp.intel.com (HELO [10.252.5.128])
 ([10.252.5.128])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 05:02:46 -0800
Message-ID: <e7cad6ca-d106-c529-6f22-93a7847cd7c0@intel.com>
Date: Mon, 13 Dec 2021 13:02:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/i915/ttm: fix large buffer population trucation
Content-Language: en-GB
To: Robert Beckett <bob.beckett@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>
References: <20211210195005.2582884-1-bob.beckett@collabora.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211210195005.2582884-1-bob.beckett@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/12/2021 19:50, Robert Beckett wrote:
> ttm->num_pages is uint32_t which was causing very large buffers to
> only populate a truncated size.
> 
> This fixes gem_create@create-clear igt test on large memory systems.
> 
> Fixes: 7ae034590cea ("drm/i915/ttm: add tt shmem backend")
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>

Nice catch,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 218a9b3037c7..923cc7ad8d70 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -166,7 +166,7 @@ static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
>   	struct intel_memory_region *mr = i915->mm.regions[INTEL_MEMORY_SYSTEM];
>   	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
>   	const unsigned int max_segment = i915_sg_segment_size();
> -	const size_t size = ttm->num_pages << PAGE_SHIFT;
> +	const size_t size = (size_t)ttm->num_pages << PAGE_SHIFT;
>   	struct file *filp = i915_tt->filp;
>   	struct sgt_iter sgt_iter;
>   	struct sg_table *st;
> 
