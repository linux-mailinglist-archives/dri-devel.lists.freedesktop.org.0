Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DBF54DBBD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5A888E26;
	Thu, 16 Jun 2022 07:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D4710EC9C;
 Thu, 16 Jun 2022 07:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655364810; x=1686900810;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5fosfAjzAZBHADth+UjPo9ukq2bY8/4uhcqIhxkcAbw=;
 b=fNyOhskVz4qlsHMfWtg4hhAyot8he3Qg/5d6zFprAj6sWrN+ML1D72FM
 O5JxrUKGd0xIMq198kD5qJEKQbo14AzrUyckI95OnEB0swMQFicgiSjuz
 WUTEN6K7OO4a9/kY+5Tf333YuAqYNGy0sYe4uuwepfUp4TGYiR6HtTEQF
 moHHXiH8HBO+uxUEsDCVLGWr3GHZtHWWI0gEZ9/D/7HoXJ7sws5IbIAZm
 Vm8V8jdD4RIyCBirPJQLrT4KDFjp9goP76qjoVp/LuNMcXWGWT4zc8nA4
 vOXd7B2MMU3wUakeiwqY7cqIphdoqVgwbjK2bL4ShYX5qJhri5nCYmbIb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="279904336"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="279904336"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 00:33:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="912048023"
Received: from mstokes1-mobl.ger.corp.intel.com (HELO [10.213.198.82])
 ([10.213.198.82])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 00:33:25 -0700
Message-ID: <7c29c710-64ee-6e87-afb4-6d6b51e26315@linux.intel.com>
Date: Thu, 16 Jun 2022 08:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/6] drm/i915/gt: Only invalidate TLBs exposed to user
 manipulation
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1655306128.git.mchehab@kernel.org>
 <387b9a8d3e719ad2db4fce56c0bfc0f909fd6df6.1655306128.git.mchehab@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <387b9a8d3e719ad2db4fce56c0bfc0f909fd6df6.1655306128.git.mchehab@kernel.org>
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
 mauro.chehab@linux.intel.com, Fei Yang <fei.yang@intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/06/2022 16:27, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Don't flush TLBs when the buffer is only used in the GGTT under full
> control of the kernel, as there's no risk of of concurrent access
> and stale access from prefetch.
> 
> We only need to invalidate the TLB if they are accessible by the user.
> 
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")

Same question as against the other patch - fix or optimisation?

Regards,

Tvrtko

> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@vger.kernel.org
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1655306128.git.mchehab@kernel.org/
> 
>   drivers/gpu/drm/i915/i915_vma.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 0bffb70b3c5f..7989986161e8 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -537,7 +537,8 @@ int i915_vma_bind(struct i915_vma *vma,
>   				   bind_flags);
>   	}
>   
> -	set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
> +	if (bind_flags & I915_VMA_LOCAL_BIND)
> +		set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
>   
>   	atomic_or(bind_flags, &vma->flags);
>   	return 0;
