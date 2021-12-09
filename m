Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2156046F128
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807F710E142;
	Thu,  9 Dec 2021 17:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E514710E141;
 Thu,  9 Dec 2021 17:11:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="301538010"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="301538010"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:06:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="462212264"
Received: from cwilso3-mobl.fi.intel.com (HELO localhost) ([10.252.19.112])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:06:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v6 01/11] drm/i915: Store backpointer to GT
 in uncore
In-Reply-To: <20211209132512.47241-2-andi.shyti@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
 <20211209132512.47241-2-andi.shyti@linux.intel.com>
Date: Thu, 09 Dec 2021 19:06:02 +0200
Message-ID: <87ilvx3dz9.fsf@intel.com>
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
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Dec 2021, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> From: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
>
> We now support a per-gt uncore, yet we're not able to infer which GT
> we're operating upon.  Let's store a backpointer for now.
>
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c               | 11 +++++++----
>  drivers/gpu/drm/i915/gt/intel_gt.h               |  1 +
>  drivers/gpu/drm/i915/i915_driver.c               |  5 +++--
>  drivers/gpu/drm/i915/intel_uncore.c              |  9 +++++----
>  drivers/gpu/drm/i915/intel_uncore.h              |  3 ++-
>  drivers/gpu/drm/i915/selftests/mock_gem_device.c |  4 ++--
>  drivers/gpu/drm/i915/selftests/mock_uncore.c     |  2 +-
>  7 files changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt=
/intel_gt.c
> index f2422d48be32..f98f0fb21efb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -25,11 +25,8 @@
>  #include "shmem_utils.h"
>  #include "pxp/intel_pxp.h"
>=20=20
> -void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i=
915)
> +void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private =
*i915)
>  {
> -	gt->i915 =3D i915;
> -	gt->uncore =3D &i915->uncore;
> -
>  	spin_lock_init(&gt->irq_lock);
>=20=20
>  	INIT_LIST_HEAD(&gt->closed_vma);
> @@ -48,6 +45,12 @@ void intel_gt_init_early(struct intel_gt *gt, struct d=
rm_i915_private *i915)
>  	intel_rps_init_early(&gt->rps);
>  }
>=20=20
> +void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i=
915)
> +{
> +	gt->i915 =3D i915;
> +	gt->uncore =3D &i915->uncore;
> +}
> +
>  int intel_gt_probe_lmem(struct intel_gt *gt)
>  {
>  	struct drm_i915_private *i915 =3D gt->i915;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt=
/intel_gt.h
> index 74e771871a9b..3ace129eb2af 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -35,6 +35,7 @@ static inline struct intel_gt *huc_to_gt(struct intel_h=
uc *huc)
>  }
>=20=20
>  void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i=
915);
> +void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private =
*i915);
>  void intel_gt_init_hw_early(struct intel_gt *gt, struct i915_ggtt *ggtt);
>  int intel_gt_probe_lmem(struct intel_gt *gt);
>  int intel_gt_init_mmio(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index e9125f14b3d1..42ae5a12040d 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -314,8 +314,9 @@ static int i915_driver_early_probe(struct drm_i915_pr=
ivate *dev_priv)
>  	intel_device_info_subplatform_init(dev_priv);
>  	intel_step_init(dev_priv);
>=20=20
> +	intel_gt_init_early(&dev_priv->gt, dev_priv);
>  	intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
> -	intel_uncore_init_early(&dev_priv->uncore, dev_priv);
> +	intel_uncore_init_early(&dev_priv->uncore, &dev_priv->gt);
>=20=20
>  	spin_lock_init(&dev_priv->irq_lock);
>  	spin_lock_init(&dev_priv->gpu_error.lock);
> @@ -346,7 +347,7 @@ static int i915_driver_early_probe(struct drm_i915_pr=
ivate *dev_priv)
>=20=20
>  	intel_wopcm_init_early(&dev_priv->wopcm);
>=20=20
> -	intel_gt_init_early(&dev_priv->gt, dev_priv);
> +	__intel_gt_init_early(&dev_priv->gt, dev_priv);

Why double underscores here? It looks like it's supposed to be internal
to intel_gt, not to be called by anyone else.

BR,
Jani.



>=20=20
>  	i915_gem_init_early(dev_priv);
>=20=20
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/i=
ntel_uncore.c
> index abdac78d3976..fc25ebf1a593 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2061,12 +2061,13 @@ void intel_uncore_cleanup_mmio(struct intel_uncor=
e *uncore)
>  }
>=20=20
>  void intel_uncore_init_early(struct intel_uncore *uncore,
> -			     struct drm_i915_private *i915)
> +			     struct intel_gt *gt)
>  {
>  	spin_lock_init(&uncore->lock);
> -	uncore->i915 =3D i915;
> -	uncore->rpm =3D &i915->runtime_pm;
> -	uncore->debug =3D &i915->mmio_debug;
> +	uncore->i915 =3D gt->i915;
> +	uncore->gt =3D gt;
> +	uncore->rpm =3D &gt->i915->runtime_pm;
> +	uncore->debug =3D &gt->i915->mmio_debug;
>  }
>=20=20
>  static void uncore_raw_init(struct intel_uncore *uncore)
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/i=
ntel_uncore.h
> index d1d17b04e29f..210fe2a71612 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -129,6 +129,7 @@ struct intel_uncore {
>  	void __iomem *regs;
>=20=20
>  	struct drm_i915_private *i915;
> +	struct intel_gt *gt;
>  	struct intel_runtime_pm *rpm;
>=20=20
>  	spinlock_t lock; /** lock is also taken in irq contexts. */
> @@ -217,7 +218,7 @@ u32 intel_uncore_read_with_mcr_steering(struct intel_=
uncore *uncore,
>  void
>  intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug *mmio_=
debug);
>  void intel_uncore_init_early(struct intel_uncore *uncore,
> -			     struct drm_i915_private *i915);
> +			     struct intel_gt *gt);
>  int intel_uncore_setup_mmio(struct intel_uncore *uncore);
>  int intel_uncore_init_mmio(struct intel_uncore *uncore);
>  void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/g=
pu/drm/i915/selftests/mock_gem_device.c
> index d0e2e61de8d4..eeb632aac4a7 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -175,12 +175,12 @@ struct drm_i915_private *mock_gem_device(void)
>  	mkwrite_device_info(i915)->memory_regions =3D REGION_SMEM;
>  	intel_memory_regions_hw_probe(i915);
>=20=20
> -	mock_uncore_init(&i915->uncore, i915);
> -
>  	spin_lock_init(&i915->gpu_error.lock);
>=20=20
>  	i915_gem_init__mm(i915);
>  	intel_gt_init_early(&i915->gt, i915);
> +	__intel_gt_init_early(&i915->gt, i915);
> +	mock_uncore_init(&i915->uncore, i915);
>  	atomic_inc(&i915->gt.wakeref.count); /* disable; no hw support */
>  	i915->gt.awake =3D -ENODEV;
>=20=20
> diff --git a/drivers/gpu/drm/i915/selftests/mock_uncore.c b/drivers/gpu/d=
rm/i915/selftests/mock_uncore.c
> index ca57e4008701..b3790ef137e4 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_uncore.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_uncore.c
> @@ -42,7 +42,7 @@ __nop_read(64)
>  void mock_uncore_init(struct intel_uncore *uncore,
>  		      struct drm_i915_private *i915)
>  {
> -	intel_uncore_init_early(uncore, i915);
> +	intel_uncore_init_early(uncore, &i915->gt);
>=20=20
>  	ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
>  	ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);

--=20
Jani Nikula, Intel Open Source Graphics Center
