Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816FE4B262E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303D410EBC7;
	Fri, 11 Feb 2022 12:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C4E10EBC8;
 Fri, 11 Feb 2022 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644583708; x=1676119708;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sMA4IiMHwtCnREkIb2+4e0f5nHX+sUyVsa1zstNiu+c=;
 b=isKOYbPx6BI5br1ZWE4x1UEKNyc7UIIgclUz/sno+UVn90PFHQXj7zR/
 du9oRYqesdyQrRbqtH3Sd6959X93t1z3BM3AmQTeA+ZkAJb9nrJuLnwfV
 KGy+WYprvY2a8xCmbldcYE4r8tquNernAZvRfxKGNkWF0rmqUbIiiyHjQ
 9Tw8HWmjfeYF3wdszOsAxK+KV/jom4Jp/YMdjkRruld1+Vo+W2SmPfsPG
 +iYXgwTQOT4C/p1qstxhKEfX2UgjgHpevsPKfkXBfKPRtMVEWEaTh5VZH
 q0rKmOk1c2Qfpf8k5Hqir23SvuBwX+rhQc6SneMxwvDvKKrPF5XkPIJzi Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="336147484"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="336147484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 04:48:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="774244225"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 04:48:26 -0800
Message-ID: <fa560873-281b-d060-8d72-46a93f45a525@linux.intel.com>
Date: Fri, 11 Feb 2022 13:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 12/15] drm/i915/create: apply ALLOC_GPU_ONLY by default
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220211113437.874691-1-matthew.auld@intel.com>
 <20220211113437.874691-13-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220211113437.874691-13-matthew.auld@intel.com>
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
Cc: Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/11/22 12:34, Matthew Auld wrote:
> Starting from DG2+, when dealing with LMEM, we assume that by default
> all userspace allocations should be placed in the non-mappable portion
> of LMEM.  Note that dumb buffers are not included here, since these are
> not "GPU accelerated" and likely need CPU access. We choose to just
> always set GPU_ONLY, and let the backend figure out if that should be
> ignored on discrete devices.
>
> In a later patch userspace will be able to provide a hint if CPU access
> to the buffer is needed.
>
> v2(Thomas)
>   - Apply GPU_ONLY on all discrete devices, but only if the BO can be
>     placed in LMEM. Down in the depths this should be turned into a noop,
>     where required, and as an annotation it still make some sense. If we
>     apply it regardless of the placements then we end up needing to check
>     the placements during exec capture. Also it's slightly inconsistent
>     since the NEEDS_CPU_ACCESS can only be applied on objects that can be
>     placed in LMEM. The other annoyance would be gem_create_ext vs plain
>     gem_create, if we were to always apply GPU_ONLY.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 9402d4bf4ffc..ecb8c2feec46 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -424,6 +424,14 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   		ext_data.n_placements = 1;
>   	}
>   
> +	/*
> +	 * TODO: add a userspace hint to force CPU_ACCESS for the object, which
> +	 * can override this.
> +	 */
> +	if (ext_data.n_placements > 1 ||
> +	    ext_data.placements[0]->type != INTEL_MEMORY_SYSTEM)
> +		ext_data.flags |= I915_BO_ALLOC_GPU_ONLY;
> +
>   	obj = __i915_gem_object_create_user_ext(i915, args->size,
>   						ext_data.placements,
>   						ext_data.n_placements,
