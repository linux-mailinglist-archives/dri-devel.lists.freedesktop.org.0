Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C91D4B2191
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574310EA49;
	Fri, 11 Feb 2022 09:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F66210EA48;
 Fri, 11 Feb 2022 09:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644571258; x=1676107258;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZAkznfHdS+KoInC+n1G2l6TrfDAgrGEZLAbTQtGhL2A=;
 b=S9eCyq1P1xDdoBcwFLJQxwLAr8toK7s3cVH1IQs1k9B7elHKvY269Ud7
 5u4WRstD9vlbU6zv7ShFWV0YVZfa3HEgwj0rxXUndUCiMphdyi5PsWLsa
 SKdSkrGx4X70sjvmLHWBrBVEeEAnPbCYDZgBLMB2AYYUWD8JxMuHwU4lc
 SoG1drD4sgQUKa5IV5ovTtmJ3uI122BxJXbYwC4DQqLmAj8zvYCXjUrHf
 H0P44DPeM+sx/5v6vn5R54OZocQ6bAVnYVl0S4CtTOaxwmDE139t1ZqKO
 KVoaRPQnVhPsBaLHv53O0uPSqv3x7d/RxFZTJgCxQEApE+kZVK84J8G6J w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="229663400"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="229663400"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:20:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="774190251"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:20:56 -0800
Message-ID: <8ce44205-d1b1-3ec5-6f42-348424274584@linux.intel.com>
Date: Fri, 11 Feb 2022 10:20:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 02/15] drm/i915/ttm: require mappable by default
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220210121313.701004-1-matthew.auld@intel.com>
 <20220210121313.701004-3-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220210121313.701004-3-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/10/22 13:13, Matthew Auld wrote:
> On devices with non-mappable LMEM ensure we always allocate the pages
> within the mappable portion. For now we assume that all LMEM buffers
> will require CPU access, which is also inline with pretty much all
> current kernel internal users. In the next patch we will introduce a new
> flag to override this behaviour.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 4 ++++
>   drivers/gpu/drm/i915/intel_region_ttm.c | 5 +++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index e9399f7b3e67..41e94d09e742 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -128,6 +128,10 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
>   
>   	if (flags & I915_BO_ALLOC_CONTIGUOUS)
>   		place->flags = TTM_PL_FLAG_CONTIGUOUS;
> +	if (mr->io_size && mr->io_size < mr->total) {
> +		place->fpfn = 0;
> +		place->lpfn = mr->io_size >> PAGE_SHIFT;
> +	}
>   }
>   
>   static void
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index f2b888c16958..4689192d5e8d 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -199,6 +199,11 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
>   	struct ttm_resource *res;
>   	int ret;
>   
> +	if (mem->io_size && mem->io_size < mem->total) {
> +		place.fpfn = 0;
> +		place.lpfn = mem->io_size >> PAGE_SHIFT;
> +	}
> +
>   	mock_bo.base.size = size;
>   	place.flags = flags;
>   

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


