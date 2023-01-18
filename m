Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D28671757
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716CD10E36E;
	Wed, 18 Jan 2023 09:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6303210E1F5;
 Wed, 18 Jan 2023 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674033584; x=1705569584;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GXXe6EOcGFzjmbEvmRCIMXpmZpk6eHxTlz+1D0TcJfU=;
 b=dyS6yYh7r8G+S0ce2Vennt+dl1hNYM1B6YLBkHzl7649AF1n1YXgielV
 fCWysBcLa4alETtuhO6KmepmUoOyb+zO5USNNdE8WJVOjIT9izC5YU4cO
 6PoRvlFmaKL1jG7k3q2HG8Ryhf8dLQ7RtUVtKRoCZHo9QibHuizseM0kZ
 sHwU4H6oYnI3teYfhwMzjcjxsrwAtdVWVBsBHQEHYUa2YoBFIDCkpDMGL
 7PZ3bb15KVF6tc7M++JWNj8ADNEdZepx+Yf7XKbGv47tsAMQsc0+3DS0D
 RRYdD0Up0yD3KDkyRa2L/5UVfKp7UmoO9ot9vcUvmTEVFI8VvBXC+ISJn g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312819543"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="312819543"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:19:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="723010635"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="723010635"
Received: from llvincen-mobl.ger.corp.intel.com (HELO [10.213.215.37])
 ([10.213.215.37])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:19:42 -0800
Message-ID: <8e517b87-b626-b488-0daa-88897c9ed90a@linux.intel.com>
Date: Wed, 18 Jan 2023 09:19:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm/i915: Fix a memory leak with reused mmap_offset
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230117175236.22317-1-nirmoy.das@intel.com>
 <20230117175236.22317-2-nirmoy.das@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230117175236.22317-2-nirmoy.das@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hi,

Thanks for working on this, it looks good to me and it aligns with how i915 uses the facility.

Copying Mirsad who reported the issue in case he is still happy to give it a quick test. Mirsad, I don't know if you are subscribed to one of the two mailing lists where series was posted. In case not, you can grab both patches from https://patchwork.freedesktop.org/series/112952/.

Nirmoy - we also have an IGT written by Chuansheng - https://patchwork.freedesktop.org/patch/515720/?series=101035&rev=4. A more generic one could be placed in gem_mmap_offset test but this one works too in my testing and is IMO better than nothing.

Finally, let me add some tags below:

On 17/01/2023 17:52, Nirmoy Das wrote:
> drm_vma_node_allow() and drm_vma_node_revoke() should be called in
> balanced pairs. We call drm_vma_node_allow() once per-file everytime a
> user calls mmap_offset, but only call drm_vma_node_revoke once per-file
> on each mmap_offset. As the mmap_offset is reused by the client, the
> per-file vm_count may remain non-zero and the rbtree leaked.
> 
> Call drm_vma_node_allow_once() instead to prevent that memory leak.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>

Fixes: 786555987207 ("drm/i915/gem: Store mmap_offsets in an rbtree rather than a plain list")
Reported-by: Chuansheng Liu <chuansheng.liu@intel.com>
Reported-by: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc: <stable@vger.kernel.org> # v5.7+
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 4f69bff63068..2aac6bf78740 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -697,7 +697,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>   	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
>   out:
>   	if (file)
> -		drm_vma_node_allow(&mmo->vma_node, file);
> +		drm_vma_node_allow_once(&mmo->vma_node, file);
>   	return mmo;
>   
>   err:
