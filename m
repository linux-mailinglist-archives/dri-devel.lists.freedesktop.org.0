Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCB4B226F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C1E10EA60;
	Fri, 11 Feb 2022 09:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5642510EA5C;
 Fri, 11 Feb 2022 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644572952; x=1676108952;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GTDacuq3zJ2Qve0A9ItszJVWoaS0BpYtwT4UndHjGbg=;
 b=csK36fFIlm05HFgZZJE27Pl5tScUmVgOA3Cy+J3dWSt8msbaRMY3h6FU
 Rrahun/7eFeqaPrM7xxnlYG7V8LfvHLqqWrQFeu4fUjTXZ/uAzGYgAR/x
 LPaxwLHSMBfWyQnz8D1k3DUIPuIcSNQuZsOIOAeiyn+bz40iwu7O10nxu
 +1zLD8iTRKH+NMntjiReYygjP6s48ITqVgpmq59W2vagZw0XAXnssZyx3
 7n2oFPeACgx60NBhDNK5gMXLfFiQ1G2r2URX/qndO9Xw1ZpujS4n+RGey
 pCuuelB72C0ZKF5bVjhdrMYDaqow4z7mdRcm6luhzR5PfesTxngyK1jPQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="336124028"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="336124028"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:49:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="774199092"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:49:10 -0800
Message-ID: <e4f128ad-1738-cee7-6790-fbdbb6d5698d@linux.intel.com>
Date: Fri, 11 Feb 2022 10:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 12/15] drm/i915/create: apply ALLOC_GPU_ONLY by default
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220210121313.701004-1-matthew.auld@intel.com>
 <20220210121313.701004-13-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220210121313.701004-13-matthew.auld@intel.com>
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
> Starting from DG2+, when dealing with LMEM, we assume that by default
> all userspace allocations should be placed in the non-mappable portion
> of LMEM.  Note that dumb buffers are not included here, since these are
> not "GPU accelerated" and likely need CPU access.
>
> In a later patch userspace will be able to provide a hint if CPU access
> to the buffer is needed.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 9402d4bf4ffc..cc9ddb943f96 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -424,6 +424,15 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   		ext_data.n_placements = 1;
>   	}
>   
> +	/*
> +	 * TODO: add a userspace hint to force CPU_ACCESS for the object, which
> +	 * can override this.
> +	 */
> +	if (!IS_DG1(i915) && (ext_data.n_placements > 1 ||
> +			      ext_data.placements[0]->type !=
> +			      INTEL_MEMORY_SYSTEM))
> +		ext_data.flags |= I915_BO_ALLOC_GPU_ONLY;
> +

WRT previous review comment here, it would be easier to follow if the bo 
was marked as a GPU only buffer regardless. Then for example capture and 
other functions where it actually matters can choose to take action 
based on, for example, whether the BAR is restricted or not?

/Thomas



>   	obj = __i915_gem_object_create_user_ext(i915, args->size,
>   						ext_data.placements,
>   						ext_data.n_placements,
