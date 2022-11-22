Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E46337D9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 10:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CC510E3B4;
	Tue, 22 Nov 2022 09:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300D710E3B4;
 Tue, 22 Nov 2022 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669107815; x=1700643815;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=hD4SMYS5eu7ysrzX+yTrMJhVD51CiXRFKyQvrLWuMvI=;
 b=h8W2oosrtQ9KQ2VdnQePDxlx0RcIdwDLIirSIwyAuDtttqAyO/1GJExa
 JC1teQQne6n98oVsHhLSwqH9RSxl7E3LNuuMA1ftZ3IphskLjeFjbNd9Z
 sUF1cYSPRB7SqYDuI8fLcUaG8t/ujvsSMO+p1uvvC+7niB37b9dEpX5uf
 J7mTQsr8tzgl1+uH4M+C4mYeeMMASNiA5CoWX34Rjuf6HFW4IH/0A8Rvb
 FT6unnGBdUU7VDy0KCe8TtBbO7wKnju1E2MoXJsxgRdnSqgmzV728NWQN
 l4KWIGVm8a990EIaBTvozVQlefmSUWQOdfFdBEbkJLDwHI4hTR+tASvFP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="315590246"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="315590246"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 01:03:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="635476095"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="635476095"
Received: from sfflynn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.18.151])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 01:03:32 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915/uc: Introduce GSC FW
In-Reply-To: <20221121231617.1110329-2-daniele.ceraolospurio@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-2-daniele.ceraolospurio@intel.com>
Date: Tue, 22 Nov 2022 11:03:30 +0200
Message-ID: <87fsebz7h9.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Nov 2022, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.co=
m> wrote:
> On MTL the GSC FW needs to be loaded on the media GT by the graphics
> driver. We're going to treat it like a new uc_fw, so add the initial
> defs and init/fini functions for it.
>
> Similarly to the other FWs, the GSC FW path can be overriden via
> modparam. The modparam can also be used to disable the GSC FW loading by
> setting it to an empty string.
>
> Note that the new structure has been called intel_gsc_uc to avoid
> confusion with the existing intel_gsc, which instead represents the heci
> gsc interfaces.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile             |  3 +-
>  drivers/gpu/drm/i915/gt/intel_gt.h        |  5 ++
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c | 70 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h | 36 ++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c     | 17 ++++++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.h     |  3 +
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 25 +++++++-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  7 ++-
>  drivers/gpu/drm/i915/i915_params.c        |  3 +
>  drivers/gpu/drm/i915/i915_params.h        |  1 +
>  10 files changed, 164 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 01974b82d205..92d37cf71e16 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -205,7 +205,8 @@ i915-y +=3D gt/uc/intel_uc.o \
>  	  gt/uc/intel_guc_submission.o \
>  	  gt/uc/intel_huc.o \
>  	  gt/uc/intel_huc_debugfs.o \
> -	  gt/uc/intel_huc_fw.o
> +	  gt/uc/intel_huc_fw.o \
> +	  gt/uc/intel_gsc_uc.o

Comment near the top of the file:

# Please keep these build lists sorted!

>=20=20
>  # graphics system controller (GSC) support
>  i915-y +=3D gt/intel_gsc.o
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt=
/intel_gt.h
> index e0365d556248..d2f4fbde5f9f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -39,6 +39,11 @@ static inline struct intel_gt *huc_to_gt(struct intel_=
huc *huc)
>  	return container_of(huc, struct intel_gt, uc.huc);
>  }
>=20=20
> +static inline struct intel_gt *gsc_uc_to_gt(struct intel_gsc_uc *gsc_uc)
> +{
> +	return container_of(gsc_uc, struct intel_gt, uc.gsc);
> +}
> +
>  static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
>  {
>  	return container_of(gsc, struct intel_gt, gsc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/=
i915/gt/uc/intel_gsc_uc.c
> new file mode 100644
> index 000000000000..65cbf1ce9fa1
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +#include "gt/intel_gt.h"
> +#include "intel_gsc_uc.h"
> +#include "i915_drv.h"
> +
> +static bool gsc_engine_supported(struct intel_gt *gt)
> +{
> +	intel_engine_mask_t mask;
> +
> +	/*
> +	 * We reach here from i915_driver_early_probe for the primary GT before
> +	 * its engine mask is set, so we use the device info engine mask for it.
> +	 * For other GTs we expect the GT-specific mask to be set before we
> +	 * call this function.
> +	 */
> +	GEM_BUG_ON(!gt_is_root(gt) && !gt->info.engine_mask);
> +
> +	if (gt_is_root(gt))
> +		mask =3D RUNTIME_INFO(gt->i915)->platform_engine_mask;
> +	else
> +		mask =3D gt->info.engine_mask;
> +
> +	return __HAS_ENGINE(mask, GSC0);
> +}
> +
> +void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
> +{
> +	intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC);
> +
> +	/* we can arrive here from i915_driver_early_probe for primary
> +	 * GT with it being not fully setup hence check device info's
> +	 * engine mask
> +	 */
> +	if (!gsc_engine_supported(gsc_uc_to_gt(gsc))){
> +		intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
> +		return;
> +	}
> +}
> +
> +int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
> +{
> +	struct drm_i915_private *i915 =3D gsc_uc_to_gt(gsc)->i915;
> +	int err;
> +
> +	err =3D intel_uc_fw_init(&gsc->fw);
> +	if (err)
> +		goto out;
> +
> +	intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOADABLE);
> +
> +	return 0;
> +
> +out:
> +	i915_probe_error(i915, "failed with %d\n", err);
> +	return err;
> +}
> +
> +void intel_gsc_uc_fini(struct intel_gsc_uc *gsc)
> +{
> +	if (!intel_uc_fw_is_loadable(&gsc->fw))
> +		return;
> +
> +	intel_uc_fw_fini(&gsc->fw);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/=
i915/gt/uc/intel_gsc_uc.h
> new file mode 100644
> index 000000000000..ea2b1c0713b8
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2022 Intel Corporation
> + */
> +
> +#ifndef _INTEL_GSC_UC_H_
> +#define _INTEL_GSC_UC_H_
> +
> +#include "intel_uc_fw.h"
> +
> +struct intel_gsc_uc {
> +	/* Generic uC firmware management */
> +	struct intel_uc_fw fw;
> +};
> +
> +void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc);
> +int intel_gsc_uc_init(struct intel_gsc_uc *gsc);
> +void intel_gsc_uc_fini(struct intel_gsc_uc *gsc);
> +
> +static inline bool intel_gsc_uc_is_supported(struct intel_gsc_uc *gsc)
> +{
> +	return intel_uc_fw_is_supported(&gsc->fw);
> +}
> +
> +static inline bool intel_gsc_uc_is_wanted(struct intel_gsc_uc *gsc)
> +{
> +	return intel_uc_fw_is_enabled(&gsc->fw);
> +}
> +
> +static inline bool intel_gsc_uc_is_used(struct intel_gsc_uc *gsc)
> +{
> +	GEM_BUG_ON(__intel_uc_fw_status(&gsc->fw) =3D=3D INTEL_UC_FIRMWARE_SELE=
CTED);
> +	return intel_uc_fw_is_available(&gsc->fw);
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915=
/gt/uc/intel_uc.c
> index 1d28286e6f06..622935770aa1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -7,6 +7,7 @@
>=20=20
>  #include "gt/intel_gt.h"
>  #include "gt/intel_reset.h"
> +#include "intel_gsc_uc.h"
>  #include "intel_guc.h"
>  #include "intel_guc_ads.h"
>  #include "intel_guc_submission.h"
> @@ -126,6 +127,7 @@ void intel_uc_init_early(struct intel_uc *uc)
>=20=20
>  	intel_guc_init_early(&uc->guc);
>  	intel_huc_init_early(&uc->huc);
> +	intel_gsc_uc_init_early(&uc->gsc);
>=20=20
>  	__confirm_options(uc);
>=20=20
> @@ -296,15 +298,26 @@ static void __uc_fetch_firmwares(struct intel_uc *u=
c)
>  						  INTEL_UC_FIRMWARE_ERROR);
>  		}
>=20=20
> +		if (intel_uc_wants_gsc_uc(uc)) {
> +			drm_dbg(&uc_to_gt(uc)->i915->drm,
> +				"Failed to fetch GuC: %d disabling GSC\n", err);
> +			intel_uc_fw_change_status(&uc->gsc.fw,
> +						  INTEL_UC_FIRMWARE_ERROR);
> +		}
> +
>  		return;
>  	}
>=20=20
>  	if (intel_uc_wants_huc(uc))
>  		intel_uc_fw_fetch(&uc->huc.fw);
> +
> +	if (intel_uc_wants_gsc_uc(uc))
> +		intel_uc_fw_fetch(&uc->gsc.fw);
>  }
>=20=20
>  static void __uc_cleanup_firmwares(struct intel_uc *uc)
>  {
> +	intel_uc_fw_cleanup_fetch(&uc->gsc.fw);
>  	intel_uc_fw_cleanup_fetch(&uc->huc.fw);
>  	intel_uc_fw_cleanup_fetch(&uc->guc.fw);
>  }
> @@ -330,11 +343,15 @@ static int __uc_init(struct intel_uc *uc)
>  	if (intel_uc_uses_huc(uc))
>  		intel_huc_init(huc);
>=20=20
> +	if (intel_uc_uses_gsc_uc(uc))
> +		intel_gsc_uc_init(&uc->gsc);
> +
>  	return 0;
>  }
>=20=20
>  static void __uc_fini(struct intel_uc *uc)
>  {
> +	intel_gsc_uc_fini(&uc->gsc);
>  	intel_huc_fini(&uc->huc);
>  	intel_guc_fini(&uc->guc);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915=
/gt/uc/intel_uc.h
> index a8f38c2c60e2..5d0f1bcc381e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -6,6 +6,7 @@
>  #ifndef _INTEL_UC_H_
>  #define _INTEL_UC_H_
>=20=20
> +#include "intel_gsc_uc.h"

And thus intel_gsc_uc.h becomes another file that causes the entire
driver to be rebuilt when modified.

*sad trombone*

>  #include "intel_guc.h"
>  #include "intel_guc_rc.h"
>  #include "intel_guc_submission.h"
> @@ -27,6 +28,7 @@ struct intel_uc_ops {
>=20=20
>  struct intel_uc {
>  	struct intel_uc_ops const *ops;
> +	struct intel_gsc_uc gsc;
>  	struct intel_guc guc;
>  	struct intel_huc huc;
>=20=20
> @@ -87,6 +89,7 @@ uc_state_checkers(huc, huc);
>  uc_state_checkers(guc, guc_submission);
>  uc_state_checkers(guc, guc_slpc);
>  uc_state_checkers(guc, guc_rc);
> +uc_state_checkers(gsc, gsc_uc);
>=20=20
>  #undef uc_state_checkers
>  #undef __uc_state_checker
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i=
915/gt/uc/intel_uc_fw.c
> index 0c80ba51a4bd..5b2e4503aee7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -19,11 +19,18 @@
>  static inline struct intel_gt *
>  ____uc_fw_to_gt(struct intel_uc_fw *uc_fw, enum intel_uc_fw_type type)
>  {
> -	if (type =3D=3D INTEL_UC_FW_TYPE_GUC)
> +	GEM_BUG_ON(type >=3D INTEL_UC_FW_NUM_TYPES);
> +
> +	switch (type) {
> +	case INTEL_UC_FW_TYPE_GUC:
>  		return container_of(uc_fw, struct intel_gt, uc.guc.fw);
> +	case INTEL_UC_FW_TYPE_HUC:
> +		return container_of(uc_fw, struct intel_gt, uc.huc.fw);
> +	case INTEL_UC_FW_TYPE_GSC:
> +		return container_of(uc_fw, struct intel_gt, uc.gsc.fw);
> +	}
>=20=20
> -	GEM_BUG_ON(type !=3D INTEL_UC_FW_TYPE_HUC);
> -	return container_of(uc_fw, struct intel_gt, uc.huc.fw);
> +	return NULL;
>  }
>=20=20
>  static inline struct intel_gt *__uc_fw_to_gt(struct intel_uc_fw *uc_fw)
> @@ -246,6 +253,10 @@ __uc_fw_auto_select(struct drm_i915_private *i915, s=
truct intel_uc_fw *uc_fw)
>  	int i;
>  	bool found;
>=20=20
> +	/* FW is not defined until all the support is in place */
> +	if (uc_fw->type =3D=3D INTEL_UC_FW_TYPE_GSC)
> +		return;
> +
>  	/*
>  	 * The only difference between the ADL GuC FWs is the HWConfig support.
>  	 * ADL-N does not support HWConfig, so we should use the same binary as
> @@ -374,6 +385,11 @@ static const char *__override_huc_firmware_path(stru=
ct drm_i915_private *i915)
>  	return "";
>  }
>=20=20
> +static const char *__override_gsc_firmware_path(struct drm_i915_private =
*i915)
> +{
> +	return i915->params.gsc_firmware_path;
> +}
> +
>  static void __uc_fw_user_override(struct drm_i915_private *i915, struct =
intel_uc_fw *uc_fw)
>  {
>  	const char *path =3D NULL;
> @@ -385,6 +401,9 @@ static void __uc_fw_user_override(struct drm_i915_pri=
vate *i915, struct intel_uc
>  	case INTEL_UC_FW_TYPE_HUC:
>  		path =3D __override_huc_firmware_path(i915);
>  		break;
> +	case INTEL_UC_FW_TYPE_GSC:
> +		path =3D __override_gsc_firmware_path(i915);
> +		break;
>  	}
>=20=20
>  	if (unlikely(path)) {
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i=
915/gt/uc/intel_uc_fw.h
> index bc898ba5355d..5d2a8965a592 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -61,9 +61,10 @@ enum intel_uc_fw_status {
>=20=20
>  enum intel_uc_fw_type {
>  	INTEL_UC_FW_TYPE_GUC =3D 0,
> -	INTEL_UC_FW_TYPE_HUC
> +	INTEL_UC_FW_TYPE_HUC,
> +	INTEL_UC_FW_TYPE_GSC,
>  };
> -#define INTEL_UC_FW_NUM_TYPES 2
> +#define INTEL_UC_FW_NUM_TYPES 3
>=20=20
>  /*
>   * The firmware build process will generate a version header file with m=
ajor and
> @@ -205,6 +206,8 @@ static inline const char *intel_uc_fw_type_repr(enum =
intel_uc_fw_type type)
>  		return "GuC";
>  	case INTEL_UC_FW_TYPE_HUC:
>  		return "HuC";
> +	case INTEL_UC_FW_TYPE_GSC:
> +		return "GSC";
>  	}
>  	return "uC";
>  }
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i9=
15_params.c
> index d1e4d528cb17..61578f2860cd 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -192,6 +192,9 @@ i915_param_named_unsafe(huc_firmware_path, charp, 040=
0,
>  i915_param_named_unsafe(dmc_firmware_path, charp, 0400,
>  	"DMC firmware path to use instead of the default one");
>=20=20
> +i915_param_named_unsafe(gsc_firmware_path, charp, 0400,
> +	"GSC firmware path to use instead of the default one");
> +
>  i915_param_named_unsafe(enable_dp_mst, bool, 0400,
>  	"Enable multi-stream transport (MST) for new DisplayPort sinks. (defaul=
t: true)");
>=20=20
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i9=
15_params.h
> index 2733cb6cfe09..3f51f90145b6 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -64,6 +64,7 @@ struct drm_printer;
>  	param(char *, guc_firmware_path, NULL, 0400) \
>  	param(char *, huc_firmware_path, NULL, 0400) \
>  	param(char *, dmc_firmware_path, NULL, 0400) \
> +	param(char *, gsc_firmware_path, NULL, 0400) \
>  	param(bool, memtest, false, 0400) \
>  	param(int, mmio_debug, -IS_ENABLED(CONFIG_DRM_I915_DEBUG_MMIO), 0600) \
>  	param(int, edp_vswing, 0, 0400) \

--=20
Jani Nikula, Intel Open Source Graphics Center
