Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF563A5CF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 11:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF5310E2C9;
	Mon, 28 Nov 2022 10:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD4610E2C6;
 Mon, 28 Nov 2022 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669630412; x=1701166412;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SvPoIBVWdWQ2eE/7MsLOzn6hNBRaoyhHOgTUk7Rq1Bw=;
 b=VdKLpesR3wCfXFfVq2B3h8RAFpY9dMiUvhmkbqxXaMj2vMr3sLp+2SeB
 GI6gi23MGSvnLKJo9T3g7Gdsf4uNRNcTkvGNJZvngx6d/vG78ExY8sqaG
 IstSsneMNEuqxDShWP5LRf5gzFSOQatOv4YVd8g7IvBRXoPMAoVI0RIYu
 V3ql+N3RnqHazoaHLHq9Qy3gAt/2qbxqGvW1rmJBsdaWDbcfeqFYdW1jZ
 wd97fUuQNQkW34CIkq/OcouGpioddUtM1Z1IT6x925oBNdFnvtWc+HNZT
 JvafQN+KP00jRnulqZlatBSttr/TjLjcPup+9EWuTR5qP6fm6JbZgt/Mn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="312432615"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="312432615"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 02:13:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="675996293"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="675996293"
Received: from meduffy-mobl.ger.corp.intel.com (HELO [10.213.211.186])
 ([10.213.211.186])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 02:13:24 -0800
Message-ID: <9810f4b0-6a28-3a3d-026b-08cce4622516@linux.intel.com>
Date: Mon, 28 Nov 2022 10:13:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v3 5/5] drm/i915: Limit the display memory
 alignment to 32 bit instead of 64
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20221125223029.323339-1-andi.shyti@linux.intel.com>
 <20221125223029.323339-6-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221125223029.323339-6-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/11/2022 22:30, Andi Shyti wrote:
> Chris commit "drm/i915: Introduce guard pages to i915_vma" was
> "cunningly" changing display_alignment to u32 from u64. The
> reason is that the display GGTT is and will be limited o 4GB.
> 
> Put it in a separate patch and use "max(...)" instead of
> "max_t(64, ...)" when asigning the value. We can safely use max
> as we know beforehand that the comparison is between two u32
> variables.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_fb_pin.c | 2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c  | 2 +-
>   drivers/gpu/drm/i915/i915_vma_types.h       | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
> index 6900acbb1381c..1aca7552a85d0 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
> @@ -91,7 +91,7 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
>   		goto err;
>   	}
>   
> -	vma->display_alignment = max_t(u64, vma->display_alignment, alignment);
> +	vma->display_alignment = max(vma->display_alignment, alignment);
>   
>   	i915_gem_object_flush_if_display(obj);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index 882b91519f92b..9969e687ad857 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -457,7 +457,7 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
>   	if (IS_ERR(vma))
>   		return vma;
>   
> -	vma->display_alignment = max_t(u64, vma->display_alignment, alignment);
> +	vma->display_alignment = max(vma->display_alignment, alignment);
>   	i915_vma_mark_scanout(vma);
>   
>   	i915_gem_object_flush_if_display_locked(obj);
> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
> index 46f5ce19d4a0a..77fda2244d161 100644
> --- a/drivers/gpu/drm/i915/i915_vma_types.h
> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> @@ -197,7 +197,6 @@ struct i915_vma {
>   	struct i915_fence_reg *fence;
>   
>   	u64 size;
> -	u64 display_alignment;
>   	struct i915_page_sizes page_sizes;
>   
>   	/* mmap-offset associated with fencing for this vma */
> @@ -206,6 +205,7 @@ struct i915_vma {
>   	u32 guard; /* padding allocated around vma->pages within the node */
>   	u32 fence_size;
>   	u32 fence_alignment;
> +	u32 display_alignment;
>   
>   	/**
>   	 * Count of the number of times this vma has been opened by different

I would have put this patch first in the series, because patch 2 now 
does not need to do max -> max_t on the respective line, but okay.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
