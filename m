Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8542C4A801D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1F710EE9E;
	Thu,  3 Feb 2022 08:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A66910EE9A;
 Thu,  3 Feb 2022 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643875325; x=1675411325;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zlS2TEGsW5taBuI4QoTlR8LND7MDmrsS1RZ8VYgZwJs=;
 b=FW0w1I6f0TjCTBoBnj+KtYJ1SxhYguwB/752WTRbO8k3MFHPmhSovtWs
 5JuMJU8nqUqCVkIObjbAuTSYFQgq7X48WYKfiVqQhVcahscfY9QfxkkeG
 Uyx6WuODGPcKX4rZbN13/sjvtMq0LB9atwyUNy7OXujIRQZIax9CSJ90N
 FKUjePVQKKwcnT3KqPYeSimNPX7sdqw+Two/GEKtoZmG32JVntDpGVXDf
 QBHcTkyqSjIIR61EsW+JSjhJ05QVigxcVD8xM8LpIrTC+bjamVcvkU5cm
 aQqrX8hPi/ahgL1utMVMVBDNW07mpwUthjgmwV1oeNzrQbVEx4ydp28LX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="231660461"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="231660461"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 00:02:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="620421542"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO [10.249.254.246])
 ([10.249.254.246])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 00:02:01 -0800
Message-ID: <552ac420-eaed-97fb-e68b-5cf0ce3fe8f7@linux.intel.com>
Date: Thu, 3 Feb 2022 09:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/i915: opportunistically apply ALLOC_CONTIGIOUS
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220202173154.3758970-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220202173154.3758970-1-matthew.auld@intel.com>
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


On 2/2/22 18:31, Matthew Auld wrote:
> It looks like this code was accidentally dropped at some point(in a
> slightly different form), so add it back. The gist is that if we know
> the allocation will be one single chunk, then we can just annotate the
> BO with I915_BO_ALLOC_CONTIGUOUS, even if the user doesn't bother. In
> the future this might prove to be potentially useful.
Perhaps be more clear that this allows us to avoid using vmap in 
upcoming patches.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_region.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> index a4350227e9ae..dd414a2bcb06 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -57,6 +57,9 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
>   
>   	size = round_up(size, default_page_size);
>   
> +	if (default_page_size == size)
> +		flags |= I915_BO_ALLOC_CONTIGUOUS;
> +
>   	GEM_BUG_ON(!size);
>   	GEM_BUG_ON(!IS_ALIGNED(size, I915_GTT_MIN_ALIGNMENT));
>   

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


