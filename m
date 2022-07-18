Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 276805783E5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 15:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372BF2A304;
	Mon, 18 Jul 2022 13:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E371018BC95;
 Mon, 18 Jul 2022 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658151562; x=1689687562;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S7SbUtL4cXYV52pGPG02yhwUZTGsc8NrJiIgLWn4W7c=;
 b=BJWyFDRip95JHzoYbGH+0DJ5V+5dZPT5+ghBR6VSZhIV2Sqr93d4UiF8
 vyOup5u3xyJl1hq094RnKf1auqXDBZbp9bsr+Jswxg/ViL59RW0re12G5
 tIu2Kbh50MTIydoAUHI5BUsLFZMBjCPHTuQuWomNIHqUcwaiM9K5ET51k
 8O6rRKsTzUHEUvQHis3mhsen8c3evSq3G1zntgO5ygCg2jWaq8ZgpHVaK
 GVDVmARwIuA5VxpOif4yGpmfcqlLP1FzzDj+YD2vAIRsyGoKd0PyWLw+K
 Uml8CVijb5kJ2+pCaOq4GWWM8iuL+jl2jynAxA7Yg+SV1M08qTz86zX8E Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="350181895"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="350181895"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 06:39:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="686737192"
Received: from smyint-mobl1.amr.corp.intel.com (HELO [10.212.107.15])
 ([10.212.107.15])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 06:39:19 -0700
Message-ID: <72a40626-ee71-fffe-3816-933fbec92c4d@linux.intel.com>
Date: Mon, 18 Jul 2022 14:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 04/21] drm/i915/gt: Only invalidate TLBs exposed to
 user manipulation
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1657800199.git.mchehab@kernel.org>
 <c0ab69f803cfe439f9218d0c0a930eae563dee83.1657800199.git.mchehab@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c0ab69f803cfe439f9218d0c0a930eae563dee83.1657800199.git.mchehab@kernel.org>
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
 Fei Yang <fei.yang@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/07/2022 13:06, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Don't flush TLBs when the buffer is only used in the GGTT under full
> control of the kernel, as there's no risk of concurrent access
> and stale access from prefetch.
> 
> We only need to invalidate the TLB if they are accessible by the user.
> That helps to reduce the performance regression introduced by TLB
> invalidate logic.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")

Do we really need or want stable and fixes on this one?

What do we think the performance improvement is, given there's very 
little in GGTT, which is not mapped via PPGTT as well?

I think it is safe, but part of me would ideally not even want to think 
about whether it is safe, if the performance improvement is 
non-existent. Which I can't imagine how there would be?

Regards,

Tvrtko

> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/
> 
>   drivers/gpu/drm/i915/i915_vma.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index ef3b04c7e153..646f419b2035 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -538,7 +538,8 @@ int i915_vma_bind(struct i915_vma *vma,
>   				   bind_flags);
>   	}
>   
> -	set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
> +	if (bind_flags & I915_VMA_LOCAL_BIND)
> +		set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
>   
>   	atomic_or(bind_flags, &vma->flags);
>   	return 0;
