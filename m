Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E18AA4A814A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A1710EB3F;
	Thu,  3 Feb 2022 09:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AB610EB39;
 Thu,  3 Feb 2022 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643879863; x=1675415863;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lsYlmSVUMylP8/TLgCKpQ9TMMOY0bqxw5RmXDdpAJtI=;
 b=JAtkcmvapWpZc8soreATloor9RQO6aOg4zUlGAJv3jxk06AhhFw04fbE
 pdLyK3kf8WU6cPlkv6Brj+GgfLEWpMrIg+2dbl884qBbTrK3lt0Wh6l2a
 2rCztyBAoReu0PjBfCaSynRh91sEkp3UqHZZgIigfByp/kVBNI5xyQGvG
 dc86D0PvscpKhZ29OG4Z+bWdYxnqoIqfe1xZpv/gJtquycvYIuzzQP0KD
 8+3BPA9q2ipYO3AWnCbTlVtDQvVLd8JmIXlAkO2ZauSInuXx76LTGaIao
 3Jie/6ID9NcdKR7o0e8GI2FAs8xb/iVN3DncGiXiyHMOw2PowCymGd0MP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="245700145"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="245700145"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:17:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="620440579"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO [10.249.254.246])
 ([10.249.254.246])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:17:42 -0800
Message-ID: <ed116a09-65f9-f093-4800-e0f4e4718ef7@linux.intel.com>
Date: Thu, 3 Feb 2022 10:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 16/20] drm/i915/create: apply ALLOC_TOPDOWN by default
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-17-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220126152155.3070602-17-matthew.auld@intel.com>
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


On 1/26/22 16:21, Matthew Auld wrote:
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
> index 9402d4bf4ffc..e7456443f163 100644
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
> +		ext_data.flags |= I915_BO_ALLOC_TOPDOWN;

Perhaps we should include DG1 here as well, so that the same paths are 
taken regardless whether this is only a test on DG1?




> +
>   	obj = __i915_gem_object_create_user_ext(i915, args->size,
>   						ext_data.placements,
>   						ext_data.n_placements,
