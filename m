Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED1513362
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 14:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B35F10E08C;
	Thu, 28 Apr 2022 12:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE9210E08C;
 Thu, 28 Apr 2022 12:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651148018; x=1682684018;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BM2HIIvbr5jatZhmnI7TvFCe9mc+7X5aVF8D50Q4fIg=;
 b=bbFOxZedyu6fwjf2qUY90fsaNSpLZWGj9jdtdxTHDTfGMxsZwLNMq+BU
 ZU8QzCp6SRG5Yr7Z6ZitFY4+aRR2UkC9Hx8l5dWfuajZjrF7SSQFN8UA6
 R5k60aPZENyA1q63KaKU4kdqBDdIoP4WEK3d4aZkdyinXKL/12ZgZHynS
 dTUSyzzi2on/HoWXqa2yixJrGrhPUrf189rhnR9kHThEOZ8b3GVT7x5tL
 mGfKNsrJ7PSFewJ9vilp6MItoCUezV2MRglE9yoY+NYLPo0SP+7UZYrtu
 WALNmcMDCwq9vGehWCuaxj4zVLNFizkc8hm1Td2fOWKrS5X+HbuOHABJz Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="329215717"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="329215717"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 05:13:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="559636993"
Received: from pkumarva-server.jf.intel.com (HELO intel.com) ([10.165.21.200])
 by orsmga007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 05:13:38 -0700
Date: Thu, 28 Apr 2022 08:13:38 -0400
From: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 2/4] drm/i915/xehp: Add register for compute engine's
 MMIO-based TLB invalidation
Message-ID: <20220428121338.GI384@intel.com>
References: <20220428041926.1483683-1-matthew.d.roper@intel.com>
 <20220428041926.1483683-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220428041926.1483683-3-matthew.d.roper@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 09:19:24PM -0700, Matt Roper wrote:
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
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c      | 1 +
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 92394f13b42f..53307ca0eed0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1175,6 +1175,7 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>  		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
>  		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
>  		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
> +		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
>  	};
>  	struct drm_i915_private *i915 = gt->i915;
>  	struct intel_uncore *uncore = gt->uncore;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index a39718a40cc3..a0a49c16babd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1007,6 +1007,7 @@
>  #define GEN12_VD_TLB_INV_CR			_MMIO(0xcedc)
>  #define GEN12_VE_TLB_INV_CR			_MMIO(0xcee0)
>  #define GEN12_BLT_TLB_INV_CR			_MMIO(0xcee4)
> +#define GEN12_COMPCTX_TLB_INV_CR		_MMIO(0xcf04)
>  
>  #define GEN12_MERT_MOD_CTRL			_MMIO(0xcf28)
>  #define RENDER_MOD_CTRL				_MMIO(0xcf2c)

Reviewed-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> -- 
> 2.35.1
> 
