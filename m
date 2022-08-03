Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02D588ED3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 16:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDED8910B;
	Wed,  3 Aug 2022 14:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47E812A79B;
 Wed,  3 Aug 2022 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659537725; x=1691073725;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=SJdDyq3OVtLWWzCt3FB8aZBO2PKX9/MEOpyHUSzKujc=;
 b=cJL3h01jjElLgiYBPS6taboBpxha7ZT8XQYXvWbBTW6VCf5hKZrCUjqe
 tDI6tYVjwSM4vEObMq6DE+6lIMVGxs8v25925fI27fRno7245OuS+5b/D
 Cz9+EtTr3JLtljBclUYKZKV/DKvWKXGCZswkfQZcd0TVceURScNTtHrlx
 QI/2RZ0B8tdSiGf85wH7/eb7KhG1C36ZZbddirFdFp/nziqicm0nG9vSV
 6Qkkwy4jHiYCXrJfy5XdYNRAGRQcyBYc6TbY7XoYNto6l5q/peqmqB0cE
 kG/7I0E2404SLKoNRNx9ncvF2THUhUuEJP9NG0wJva2DVXrK/tkcFSGjp g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="276603242"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="276603242"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 07:42:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="662108294"
Received: from ns1-mobl.gar.corp.intel.com (HELO localhost) ([10.252.59.244])
 by fmsmga008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 07:42:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/i915: Sanitycheck PCI BARs
In-Reply-To: <20220803085829.1466903-3-piotr.piorkowski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220803075549.1464461-1-piotr.piorkowski@intel.com>
 <20220803085829.1466903-3-piotr.piorkowski@intel.com>
Date: Wed, 03 Aug 2022 17:41:58 +0300
Message-ID: <87o7x1pex5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 03 Aug 2022, "Piorkowski, Piotr" <piotr.piorkowski@intel.com> wrote:
> From: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
>
> For proper operation of i915 we need usable PCI GTTMMADDR BAR 0
> (1 for GEN2). In most cases we also need usable PCI GFXMEM BAR 2.
> Let's add functions to check if BARs are set, and that it have
> a size greater than 0.
> In case GTTMMADDR BAR, let's validate at the beginning of i915
> initialization.
> For other BARs, let's validate before first use.
>
> Signed-off-by: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c  |  4 ++++
>  drivers/gpu/drm/i915/gt/intel_ggtt.c        |  7 ++++++
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c |  4 ++++
>  drivers/gpu/drm/i915/i915_pci.c             | 25 +++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_pci.h             |  4 ++++
>  5 files changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm=
/i915/gem/i915_gem_stolen.c
> index c369cfd185bc..4f4c9461a23b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -18,6 +18,7 @@
>  #include "gt/intel_region_lmem.h"
>  #include "i915_drv.h"
>  #include "i915_gem_stolen.h"
> +#include "i915_pci.h"
>  #include "i915_reg.h"
>  #include "i915_utils.h"
>  #include "i915_vgpu.h"
> @@ -828,6 +829,9 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i=
915, u16 type,
>  	if (WARN_ON_ONCE(instance))
>  		return ERR_PTR(-ENODEV);
>=20=20
> +	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
> +		return ERR_PTR(-ENXIO);
> +
>  	/* Use DSM base address instead for stolen memory */
>  	dsm_base =3D intel_uncore_read64(uncore, GEN12_DSMBASE);
>  	if (IS_DG1(uncore->i915)) {
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/=
gt/intel_ggtt.c
> index 8214e07a0f5b..30cf5c3369d9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -18,6 +18,7 @@
>  #include "intel_gt_regs.h"
>  #include "intel_pci_config.h"
>  #include "i915_drv.h"
> +#include "i915_pci.h"
>  #include "i915_scatterlist.h"
>  #include "i915_utils.h"
>  #include "i915_vgpu.h"
> @@ -931,6 +932,9 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  	u16 snb_gmch_ctl;
>=20=20
>  	if (!HAS_LMEM(i915)) {
> +		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
> +			return -ENXIO;
> +
>  		ggtt->gmadr =3D pci_resource(pdev, GTT_APERTURE_BAR);
>  		ggtt->mappable_end =3D resource_size(&ggtt->gmadr);
>  	}
> @@ -1085,6 +1089,9 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
>  	unsigned int size;
>  	u16 snb_gmch_ctl;
>=20=20
> +	if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
> +		return -ENXIO;
> +
>  	ggtt->gmadr =3D pci_resource(pdev, GTT_APERTURE_BAR);
>  	ggtt->mappable_end =3D resource_size(&ggtt->gmadr);
>=20=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/dr=
m/i915/gt/intel_region_lmem.c
> index 1e79d3c8b126..f3ad93db0b21 100644
> --- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
> @@ -4,6 +4,7 @@
>   */
>=20=20
>  #include "i915_drv.h"
> +#include "i915_pci.h"
>  #include "i915_reg.h"
>  #include "intel_memory_region.h"
>  #include "intel_pci_config.h"
> @@ -201,6 +202,9 @@ static struct intel_memory_region *setup_lmem(struct =
intel_gt *gt)
>  	if (!IS_DGFX(i915))
>  		return ERR_PTR(-ENODEV);
>=20=20
> +	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
> +		return ERR_PTR(-ENXIO);
> +
>  	if (HAS_FLAT_CCS(i915)) {
>  		resource_size_t lmem_range;
>  		u64 tile_stolen, flat_ccs_base;
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_=
pci.c
> index aacc10f2e73f..9fd788e147a3 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -30,6 +30,7 @@
>  #include "i915_drv.h"
>  #include "i915_pci.h"
>  #include "i915_reg.h"
> +#include "intel_pci_config.h"
>=20=20
>  #define PLATFORM(x) .platform =3D (x)
>  #define GEN(x) \
> @@ -1262,6 +1263,27 @@ static bool force_probe(u16 device_id, const char =
*devices)
>  	return ret;
>  }
>=20=20
> +bool i915_pci_resource_valid(struct pci_dev *pdev, int bar)
> +{
> +	if (!pci_resource_flags(pdev, bar))
> +		return false;
> +
> +	if (pci_resource_flags(pdev, bar) & IORESOURCE_UNSET)
> +		return false;
> +
> +	if (!pci_resource_len(pdev, bar))
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool intel_mmio_bar_valid(struct pci_dev *pdev, struct intel_devi=
ce_info *intel_info)
> +{
> +	int gttmmaddr_bar =3D intel_info->graphics.ver =3D=3D 2 ? GEN2_GTTMMADR=
_BAR : GTTMMADR_BAR;
> +
> +	return i915_pci_resource_valid(pdev, gttmmaddr_bar);
> +}
> +
>  static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_=
id *ent)
>  {
>  	struct intel_device_info *intel_info =3D
> @@ -1287,6 +1309,9 @@ static int i915_pci_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
>  	if (PCI_FUNC(pdev->devfn))
>  		return -ENODEV;
>=20=20
> +	if (!intel_mmio_bar_valid(pdev, intel_info))
> +		return -ENXIO;
> +
>  	/* Detect if we need to wait for other drivers early on */
>  	if (intel_modeset_probe_defer(pdev))
>  		return -EPROBE_DEFER;
> diff --git a/drivers/gpu/drm/i915/i915_pci.h b/drivers/gpu/drm/i915/i915_=
pci.h
> index ee048c238174..c0bda6aae806 100644
> --- a/drivers/gpu/drm/i915/i915_pci.h
> +++ b/drivers/gpu/drm/i915/i915_pci.h
> @@ -6,7 +6,11 @@
>  #ifndef __I915_PCI_H__
>  #define __I915_PCI_H__
>=20=20
> +#include <linux/pci.h>
> +

Please replace this with a forward declaration for struct pci_dev.

With that, seems good,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  int i915_pci_register_driver(void);
>  void i915_pci_unregister_driver(void);
>=20=20
> +bool i915_pci_resource_valid(struct pci_dev *pdev, int bar);
> +
>  #endif /* __I915_PCI_H__ */

--=20
Jani Nikula, Intel Open Source Graphics Center
