Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195875C346
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 11:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB45410E643;
	Fri, 21 Jul 2023 09:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD8C10E641;
 Fri, 21 Jul 2023 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689932538; x=1721468538;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tLgPEKbGd/u9qGyj2ikmC1YzDAKb/Vg9Ks4lSvrugXQ=;
 b=M7UOjIuwfQadYN20tagi7Qayi06EjZ80tE0DUV3HeU/3a8rYAia1wgNi
 6dfg2brQa3gqj7EbyNQo5lQu0I1W9CEcMmPdM9s+35GFR68ByobYW8Q5B
 91qlmMAdikGmCBiqNn20BVACfBeSkbRRHOxnGf3Qip2FRXNzYs6luNwVo
 /PQ2iIID+jKiZxiPrvmYRqaz+88gYck7bpqBhpo5bWi/QcJL2i7xd0iJI
 ClH4SgexY9WnwLsp9nb00Ngn5kO9R3aWfke1VzQ0IIK136+rA/p32Pbkn
 exZA7UhYsKW6pib6MN3EMt372bxq6CgiR4kAgjEoS3sUKaVZzd9epOZe3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="369656238"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="369656238"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 02:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="868187023"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.21.56])
 ([10.213.21.56])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 02:41:25 -0700
Message-ID: <26ccff3c-b50a-e6e6-97d1-18bb40833108@intel.com>
Date: Fri, 21 Jul 2023 11:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v7 2/9] drm/i915: Add the has_aux_ccs device
 property
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230720210737.761400-1-andi.shyti@linux.intel.com>
 <20230720210737.761400-3-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230720210737.761400-3-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.07.2023 23:07, Andi Shyti wrote:
> We always assumed that a device might either have AUX or FLAT
> CCS, but this is an approximation that is not always true as it
> requires some further per device checks.
> 
> Add the "has_aux_ccs" flag in the intel_device_info structure in
> order to have a per device flag indicating of the AUX CCS.

As Matt mentioned in v6, aux_ccs is present also in older platforms.
This is about presence/necessity (?) of aux_ccs table invalidation.
Maybe has_aux_ccs_inv, dunno?

Moreover you define flag per device, but this is rather per engine, 
theoretically could be also:
MTL:
.aux_ccs_inv_mask = BIT(RCS0) | BIT(BCS0) | ...
Others:
.aux_ccs_inv_mask = BIT(RCS0) | ...

looks overkill,
maybe helper function would be simpler, up to you.

Regards
Andrzej

> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 4 ++--
>   drivers/gpu/drm/i915/i915_drv.h          | 1 +
>   drivers/gpu/drm/i915/i915_pci.c          | 5 ++++-
>   drivers/gpu/drm/i915/intel_device_info.h | 1 +
>   4 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 563efee055602..0d4d5e0407a2d 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -267,7 +267,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		else if (engine->class == COMPUTE_CLASS)
>   			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>   
> -		if (!HAS_FLAT_CCS(rq->engine->i915))
> +		if (HAS_AUX_CCS(rq->engine->i915))
>   			count = 8 + 4;
>   		else
>   			count = 8;
> @@ -307,7 +307,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   	if (mode & EMIT_INVALIDATE) {
>   		cmd += 2;
>   
> -		if (!HAS_FLAT_CCS(rq->engine->i915) &&
> +		if (HAS_AUX_CCS(rq->engine->i915) &&
>   		    (rq->engine->class == VIDEO_DECODE_CLASS ||
>   		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
>   			aux_inv = rq->engine->mask &
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 682ef2b5c7d59..e9cc048b5727a 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -848,6 +848,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>    * stored in lmem to support the 3D and media compression formats.
>    */
>   #define HAS_FLAT_CCS(i915)   (INTEL_INFO(i915)->has_flat_ccs)
> +#define HAS_AUX_CCS(i915)    (INTEL_INFO(i915)->has_aux_ccs)
>   
>   #define HAS_GT_UC(i915)	(INTEL_INFO(i915)->has_gt_uc)
>   
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index fcacdc21643cf..c9ff1d11a9fce 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -643,7 +643,8 @@ static const struct intel_device_info jsl_info = {
>   	TGL_CACHELEVEL, \
>   	.has_global_mocs = 1, \
>   	.has_pxp = 1, \
> -	.max_pat_index = 3
> +	.max_pat_index = 3, \
> +	.has_aux_ccs = 1
>   
>   static const struct intel_device_info tgl_info = {
>   	GEN12_FEATURES,
> @@ -775,6 +776,7 @@ static const struct intel_device_info dg2_info = {
>   
>   static const struct intel_device_info ats_m_info = {
>   	DG2_FEATURES,
> +	.has_aux_ccs = 1,
>   	.require_force_probe = 1,
>   	.tuning_thread_rr_after_dep = 1,
>   };
> @@ -827,6 +829,7 @@ static const struct intel_device_info mtl_info = {
>   	.__runtime.media.ip.ver = 13,
>   	PLATFORM(INTEL_METEORLAKE),
>   	.extra_gt_list = xelpmp_extra_gt,
> +	.has_aux_ccs = 1,
>   	.has_flat_ccs = 0,
>   	.has_gmd_id = 1,
>   	.has_guc_deprivilege = 1,
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index dbfe6443457b5..93485507506cc 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -151,6 +151,7 @@ enum intel_ppgtt_type {
>   	func(has_reset_engine); \
>   	func(has_3d_pipeline); \
>   	func(has_4tile); \
> +	func(has_aux_ccs); \
>   	func(has_flat_ccs); \
>   	func(has_global_mocs); \
>   	func(has_gmd_id); \

