Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47F474010
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 11:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB6B10E2D6;
	Tue, 14 Dec 2021 10:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7370310E2D6;
 Tue, 14 Dec 2021 10:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639476341; x=1671012341;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a3nUrhx9FVW/CHy4JCMSQ+3LnDviMv5jeGqSzXx7Kk8=;
 b=Jl7AONGdFalVWGoUK5XR/O/W19v3TM8+5/Mmk7z4RIkv8VAhefBmzyxo
 EZCSrqY0AyobLR+/R3/tk8AIt7tisHZ1yyPllL2xkaG97Y6SS7gZT3Owg
 W6hd6Pwn84sJyfHqp+tm1c5yb7CMIrgSryV/lNpXj31oHdfC0219dT/nP
 CGmHBpQmBNYURe8FUEtO+dxfxsOYYvHrGVbXy27XHbukewsTrJ5sZhcXQ
 1jjkozyJIAkAbsrghE5x643UwXHoB/D1q+EURLmDQ2PdfJ9jxTc5IIwug
 5EopZi5DcTsCxUyA46c3/9Lga7vCE+iSuQ2gm7hGcW++ub9I/M5ClBFQp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="302325215"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="302325215"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 02:05:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="505304983"
Received: from vgavinx-mobl1.ger.corp.intel.com (HELO [10.252.22.20])
 ([10.252.22.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 02:05:39 -0800
Message-ID: <306c544f-68c8-1077-399f-10a5717d3537@intel.com>
Date: Tue, 14 Dec 2021 10:05:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 04/16] drm/i915/xehpsdv: Add has_flat_ccs to device info
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
 <20211209154533.4084-5-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211209154533.4084-5-ramalingam.c@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2021 15:45, Ramalingam C wrote:
> From: CQ Tang <cq.tang@intel.com>
> 
> Platforms of XeHP and beyond support 3D surface (buffer) compression and
> various compression formats. This is accomplished by an additional
> compression control state (CCS) stored for each surface.
> 
> Gen 12 devices(TGL family and DG1) stores compression states in a separate
> region of memory. It is managed by user-space and has an associated set of
> user-space managed page tables used by hardware for address translation.
> 
> In Xe HP and beyond (XEHPSDV, DG2, etc), there is a new feature introduced
> i.e Flat CCS. It replaced AUX page tables with a flat indexed region of
> device memory for storing compression states.
> 
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_drv.h          | 2 ++
>   drivers/gpu/drm/i915/i915_pci.c          | 1 +
>   drivers/gpu/drm/i915/intel_device_info.h | 1 +
>   3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index aeafce112dcd..ad2dd18f7622 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1543,6 +1543,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
>   #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
>   
> +#define HAS_FLAT_CCS(dev_priv)   (INTEL_INFO(dev_priv)->has_flat_ccs)

Could maybe add a comment here to give brief description of the feature?

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
>   #define HAS_GT_UC(dev_priv)	(INTEL_INFO(dev_priv)->has_gt_uc)
>   
>   #define HAS_POOLED_EU(dev_priv)	(INTEL_INFO(dev_priv)->has_pooled_eu)
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index b523eb1ece5d..382e7278058a 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1005,6 +1005,7 @@ static const struct intel_device_info adl_p_info = {
>   	XE_HP_PAGE_SIZES, \
>   	.dma_mask_size = 46, \
>   	.has_64bit_reloc = 1, \
> +	.has_flat_ccs = 1, \
>   	.has_global_mocs = 1, \
>   	.has_gt_uc = 1, \
>   	.has_llc = 1, \
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 213ae2c07126..cbbb40e8451f 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -129,6 +129,7 @@ enum intel_ppgtt_type {
>   	func(has_64k_pages); \
>   	func(gpu_reset_clobbers_display); \
>   	func(has_reset_engine); \
> +	func(has_flat_ccs); \
>   	func(has_global_mocs); \
>   	func(has_gt_uc); \
>   	func(has_l3_dpf); \
> 
