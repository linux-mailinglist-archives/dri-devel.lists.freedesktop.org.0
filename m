Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A42C830C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 12:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879B36E463;
	Mon, 30 Nov 2020 11:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D153F6E463;
 Mon, 30 Nov 2020 11:19:06 +0000 (UTC)
IronPort-SDR: xeBkrqrZB1vkNSPQQkWGYiqd6xjsjssVei1BoS9UhNGP4upOSUp5tpJQEKiToQgDsUQkvnSwFd
 9pv4A8cTaRNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="151869178"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="151869178"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:19:05 -0800
IronPort-SDR: GVNS5TdGDwBhSI3M7qSVKPGak+6uBtF63a3y7Hl2VZMW6XCh6Ju8zAR6SSN39aqsyI6eRRBoKr
 KcgxI6thldIA==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="329549544"
Received: from cwilso3-mobl.fi.intel.com (HELO localhost) ([10.214.219.106])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 03:19:00 -0800
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-108-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-108-matthew.auld@intel.com>
Subject: Re: [RFC PATCH 107/162] drm/i915: setup GPU device lmem region
From: Chris Wilson <chris.p.wilson@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 30 Nov 2020 11:18:55 +0000
Message-ID: <160673513539.8815.7095510536023948003@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Sudeep Dutt <sudeep.dutt@intel.com>, dri-devel@lists.freedesktop.org,
	CQ Tang <cq.tang@intel.com>,
	Venkata S Dhanalakota <venkata.s.dhanalakota@intel.com>,
	Neel Desai <neel.desai@intel.com>,
	Francesco <francesco.balestrieri@intel.com>,
	Balestrieri@freedesktop.org,
	Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:06:23)
> From: CQ Tang <cq.tang@intel.com>
> 
> The lmem region needs to remove the stolen part.
> 
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
> Cc: Chris P Wilson <chris.p.wilson@intel.com>
> Cc: Balestrieri, Francesco <francesco.balestrieri@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Venkata S Dhanalakota <venkata.s.dhanalakota@intel.com>
> Cc: Neel Desai <neel.desai@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Sudeep Dutt <sudeep.dutt@intel.com>
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h          |  2 ++
>  drivers/gpu/drm/i915/intel_region_lmem.c | 11 +++++++----
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 1af1966ac461..0e01ea0cb0a4 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -12066,6 +12066,8 @@ enum skl_power_gate {
>  #define GEN12_LMEM_CFG_ADDR            _MMIO(0xcf58)
>  #define   LMEM_ENABLE                  (1 << 31)
>  
> +#define GEN12_GSMBASE                  _MMIO(0x108100)
> +
>  /* gamt regs */
>  #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
>  #define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
> diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
> index e98582c76de1..7f2b31d469b0 100644
> --- a/drivers/gpu/drm/i915/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/intel_region_lmem.c
> @@ -140,20 +140,23 @@ intel_setup_fake_lmem(struct drm_i915_private *i915)
>  static struct intel_memory_region *
>  setup_lmem(struct drm_i915_private *dev_priv)

Am I wrong in thinking lmem should be under gt?

>  {
> +       struct intel_uncore *uncore = &dev_priv->uncore;
>         struct pci_dev *pdev = dev_priv->drm.pdev;
>         struct intel_memory_region *mem;
>         resource_size_t io_start;
> -       resource_size_t size;
> +       resource_size_t lmem_size;
>  
>         /* Enables Local Memory functionality in GAM */
>         I915_WRITE(GEN12_LMEM_CFG_ADDR, I915_READ(GEN12_LMEM_CFG_ADDR) | LMEM_ENABLE);
>  
> +       /* Stolen starts from GSMBASE on DG1 */
> +       lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
> +
>         io_start = pci_resource_start(pdev, 2);
> -       size = pci_resource_len(pdev, 2);

Sanitycheck the two.

size = min(size, lmem_size);

>  
>         mem = intel_memory_region_create(dev_priv,
>                                          0,
> -                                        size,
> +                                        lmem_size,

Ok, stolen is at tail not start. 

>                                          I915_GTT_PAGE_SIZE_4K,
>                                          io_start,
>                                          &intel_region_lmem_ops);
> @@ -162,7 +165,7 @@ setup_lmem(struct drm_i915_private *dev_priv)
>                 DRM_INFO("Intel graphics LMEM IO start: %llx\n",
>                          (u64)mem->io_start);
>                 DRM_INFO("Intel graphics LMEM size: %llx\n",
> -                        (u64)size);
> +                        (u64)lmem_size);

Use the correct printf-formats, %pa.

>         }
>  
>         return mem;
> -- 
> 2.26.2
>
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
