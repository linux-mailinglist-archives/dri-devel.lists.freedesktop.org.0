Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853ED458BB8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 10:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4B389FCA;
	Mon, 22 Nov 2021 09:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53AF6E092;
 Mon, 22 Nov 2021 09:43:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="221977718"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="221977718"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 01:43:20 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="508465571"
Received: from aalazizi-mobl1.amr.corp.intel.com (HELO [10.213.249.159])
 ([10.213.249.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 01:43:18 -0800
Message-ID: <4d5deeb3-1eb9-f374-6729-1fe03d5e774e@linux.intel.com>
Date: Mon, 22 Nov 2021 09:43:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/gtt: stop caching the scratch
 page
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20211028092638.3142258-1-matthew.auld@intel.com>
 <20211028092638.3142258-2-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211028092638.3142258-2-matthew.auld@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/10/2021 10:26, Matthew Auld wrote:
> Normal users shouldn't be hitting this, likely this would indicate a
> userspace bug. So don't bother caching, which should be safe now that we
> manually flush the page.

Could this have a performance impact if "things" overfetch often enough 
in normal operation?

Regards,

Tvrtko

> Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 8af2f709571c..9966e9dc5218 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -651,7 +651,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
>   
>   	vm->scratch[0]->encode =
>   		gen8_pte_encode(px_dma(vm->scratch[0]),
> -				I915_CACHE_LLC, pte_flags);
> +				I915_CACHE_NONE, pte_flags);
>   
>   	for (i = 1; i <= vm->top; i++) {
>   		struct drm_i915_gem_object *obj;
> @@ -667,7 +667,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
>   		}
>   
>   		fill_px(obj, vm->scratch[i - 1]->encode);
> -		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_LLC);
> +		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_NONE);
>   
>   		vm->scratch[i] = obj;
>   	}
> 
