Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670846E92EC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 13:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F7710E0CF;
	Thu, 20 Apr 2023 11:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D748B10E0B6;
 Thu, 20 Apr 2023 11:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681990597; x=1713526597;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V7ExlAeTeLqWIONBoVe8PfpcWyQyaMSN3OTkqjOzDiU=;
 b=mfSk722qVLqfXMXalgQNFQbvMOBH6Iz/kCoG3eblV6GRyeYhRpAshVXJ
 U1FWOcH4bUFBtJwimTj+YxU9JWlVdwPjfQ+jiop8rcOHO0Mb2Zg7a3gP+
 JCTe3lpUGAjLoHsG3oqwZ++X3JoH4v3vtiuzWzOoAqsSeXLSnuS7kOv4l
 ezwK0VQMSo3kNUmbGezGmb9z14pOu3TXlab8EAMoPkn3g/dOFjJa4Dbj9
 mAe3dYnqniYdSX/tBMJpcBI0UafkbjXUDlPwEAmcPxz6MpknvNBr49BqJ
 9jqEKerqCzYAyk3Ck/o1XnJisRK3FV8lK6saCSHuh35GCJrOmDHTitkEC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348470987"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="348470987"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="724391579"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="724391579"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.56.189])
 ([10.252.56.189])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:36:35 -0700
Message-ID: <7c3b1fff-45b6-ba5f-271b-56b65d78f6f8@linux.intel.com>
Date: Thu, 20 Apr 2023 13:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 4/8] drm/i915/mtl: workaround coherency issue
 for Media
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230419230058.2659455-1-fei.yang@intel.com>
 <20230419230058.2659455-5-fei.yang@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230419230058.2659455-5-fei.yang@intel.com>
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
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a important fix and can be pushed without depending on this series.

I will send this out to mailing list separately for CI.


Regards,

Nirmoy

On 4/20/2023 1:00 AM, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> This patch implements Wa_22016122933.
>
> In MTL, memory writes initiated by Media tile update the whole
> cache line even for partial writes. This creates a coherency
> problem for cacheable memory if both CPU and GPU are writing data
> to different locations within a single cache line. CTB communication
> is impacted by this issue because the head and tail pointers are
> adjacent words within a cache line (see struct guc_ct_buffer_desc),
> where one is written by GuC and the other by the host.
> This patch circumvents the issue by making CPU/GPU shared memory
> uncacheable (WC on CPU side, and PAT index 2 for GPU). Also for
> CTB which is being updated by both CPU and GuC, mfence instruction
> is added to make sure the CPU writes are visible to GPU right away
> (flush the write combining buffer).
>
> While fixing the CTB issue, we noticed some random GSC firmware
> loading failure because the share buffers are cacheable (WB) on CPU
> side but uncached on GPU side. To fix these issues we need to map
> such shared buffers as WC on CPU side. Since such allocations are
> not all done through GuC allocator, to avoid too many code changes,
> the i915_coherent_map_type() is now hard coded to return WC for MTL.
>
> BSpec: 45101
>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c |  5 ++++-
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 13 +++++++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  7 +++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 ++++++
>   4 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index ecd86130b74f..89fc8ea6bcfc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -469,7 +469,10 @@ enum i915_map_type i915_coherent_map_type(struct drm_i915_private *i915,
>   					  struct drm_i915_gem_object *obj,
>   					  bool always_coherent)
>   {
> -	if (i915_gem_object_is_lmem(obj))
> +	/*
> +	 * Wa_22016122933: always return I915_MAP_WC for MTL
> +	 */
> +	if (i915_gem_object_is_lmem(obj) || IS_METEORLAKE(i915))
>   		return I915_MAP_WC;
>   	if (HAS_LLC(i915) || always_coherent)
>   		return I915_MAP_WB;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index 1d9fdfb11268..236673c02f9a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -110,6 +110,13 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>   	if (obj->base.size < gsc->fw.size)
>   		return -ENOSPC;
>   
> +	/*
> +	 * Wa_22016122933: For MTL the shared memory needs to be mapped
> +	 * as WC on CPU side and UC (PAT index 2) on GPU side
> +	 */
> +	if (IS_METEORLAKE(i915))
> +		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> +
>   	dst = i915_gem_object_pin_map_unlocked(obj,
>   					       i915_coherent_map_type(i915, obj, true));
>   	if (IS_ERR(dst))
> @@ -125,6 +132,12 @@ static int gsc_fw_load_prepare(struct intel_gsc_uc *gsc)
>   	memset(dst, 0, obj->base.size);
>   	memcpy(dst, src, gsc->fw.size);
>   
> +	/*
> +	 * Wa_22016122933: Making sure the data in dst is
> +	 * visible to GSC right away
> +	 */
> +	intel_guc_write_barrier(&gt->uc.guc);
> +
>   	i915_gem_object_unpin_map(gsc->fw.obj);
>   	i915_gem_object_unpin_map(obj);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index e89f16ecf1ae..c9f20385f6a0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -744,6 +744,13 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
>   	if (IS_ERR(obj))
>   		return ERR_CAST(obj);
>   
> +	/*
> +	 * Wa_22016122933: For MTL the shared memory needs to be mapped
> +	 * as WC on CPU side and UC (PAT index 2) on GPU side
> +	 */
> +	if (IS_METEORLAKE(gt->i915))
> +		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
> +
>   	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
>   	if (IS_ERR(vma))
>   		goto err;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 1803a633ed64..99a0a89091e7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -902,6 +902,12 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>   	/* now update descriptor */
>   	WRITE_ONCE(desc->head, head);
>   
> +	/*
> +	 * Wa_22016122933: Making sure the head update is
> +	 * visible to GuC right away
> +	 */
> +	intel_guc_write_barrier(ct_to_guc(ct));
> +
>   	return available - len;
>   
>   corrupted:
