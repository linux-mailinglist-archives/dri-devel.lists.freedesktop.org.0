Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD89434E4A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 16:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8968589EBD;
	Wed, 20 Oct 2021 14:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232AE89EA9;
 Wed, 20 Oct 2021 14:52:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="315001050"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="315001050"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 07:52:27 -0700
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="532708925"
Received: from mmazarel-mobl1.ger.corp.intel.com (HELO [10.249.254.139])
 ([10.249.254.139])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 07:52:26 -0700
Message-ID: <5552baee-5657-b765-7faf-cd4149b3ab3d@linux.intel.com>
Date: Wed, 20 Oct 2021 16:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 5/9] drm/i915/userptr: add paranoid flush-on-acquire
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211018174508.2137279-1-matthew.auld@intel.com>
 <20211018174508.2137279-5-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211018174508.2137279-5-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/18/21 19:45, Matthew Auld wrote:
> Even though userptr objects are always coherent with the GPU, with no
> way for userspace to change this with the set_caching ioctl, even on
> non-LLC platforms, there is still the 'Bypass LCC' mocs setting, which
> might permit reading the contents of main memory directly.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> index 887aca9e8dd2..3173c9f9a040 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -165,8 +165,11 @@ static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
>   		goto err;
>   	}
>   
> -	sg_page_sizes = i915_sg_dma_sizes(st->sgl);
> +	WARN_ON_ONCE(!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE));
> +	if (i915_gem_object_can_bypass_llc(obj))
> +		obj->cache_dirty = true;
>   
> +	sg_page_sizes = i915_sg_dma_sizes(st->sgl);
>   	__i915_gem_object_set_pages(obj, st, sg_page_sizes);
>   
>   	return 0;
