Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54F512E94
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5922E10E501;
	Thu, 28 Apr 2022 08:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3F610E501;
 Thu, 28 Apr 2022 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651134907; x=1682670907;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uHmKD3K7rCAwAqIgv3hEoqDaV4dB31TUMFOE/qPtPdY=;
 b=X5y6F/G0UFTKxK5gU+EN7gFwJ2F79VRoAOEYqhDzwfojFHTb2v6W08wm
 ase59A9NpMjOu4SVDEdNbdMpKBw5CRYiP3oRG+zmzvgMRmkUcCuclR61a
 cYvzLKacg5zt5kC3pSOzMJaa1UZ5wpQCDIwEWsG0dpIAjTcg/mnwFebgJ
 YrvDPGS983+SdAYMcEGFBt9W1h60o+d4IUi4RHwY8IhGD7nCJRSAV3ZRu
 RPE3lPFCulm9t1SIK25VQnIj9auof/mmAUoxSlEnvHjGnYLhnrrv2StwW
 wgy1d1bkNsDtTUqb1Kr0UXpsxhUH/cOtXQLgArotXskKnT51Zd630L6It A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="266367855"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="266367855"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 01:34:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="514159174"
Received: from wdries-mobl1.ger.corp.intel.com (HELO [10.213.210.166])
 ([10.213.210.166])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 01:34:37 -0700
Message-ID: <45f25894-c211-5c5d-672b-400b0b3dcb51@linux.intel.com>
Date: Thu, 28 Apr 2022 09:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] drm/i915/xehp: Add register for compute engine's
 MMIO-based TLB invalidation
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220428041926.1483683-1-matthew.d.roper@intel.com>
 <20220428041926.1483683-3-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220428041926.1483683-3-matthew.d.roper@intel.com>
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
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/04/2022 05:19, Matt Roper wrote:
> Compute engines have a separate register that the driver should use to
> perform MMIO-based TLB invalidation.
> 
> Note that the term "context" in this register's bspec description is
> used to refer to the engine instance (in the same way "context" is used
> on bspec 46167).
> 
> Bspec: 43930
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Happy even a blind chicken (me) managed to pick on this piece of 
correctness. :)

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Prathap please r-b since you were the authoritative source in this case.

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c      | 1 +
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 92394f13b42f..53307ca0eed0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1175,6 +1175,7 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>   		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
>   		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
>   		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
> +		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
>   	};
>   	struct drm_i915_private *i915 = gt->i915;
>   	struct intel_uncore *uncore = gt->uncore;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index a39718a40cc3..a0a49c16babd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1007,6 +1007,7 @@
>   #define GEN12_VD_TLB_INV_CR			_MMIO(0xcedc)
>   #define GEN12_VE_TLB_INV_CR			_MMIO(0xcee0)
>   #define GEN12_BLT_TLB_INV_CR			_MMIO(0xcee4)
> +#define GEN12_COMPCTX_TLB_INV_CR		_MMIO(0xcf04)
>   
>   #define GEN12_MERT_MOD_CTRL			_MMIO(0xcf28)
>   #define RENDER_MOD_CTRL				_MMIO(0xcf2c)
