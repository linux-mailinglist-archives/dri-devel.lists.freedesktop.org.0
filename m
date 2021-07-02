Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F0D3B9D33
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 09:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB6989FDE;
	Fri,  2 Jul 2021 07:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735A489FD7;
 Fri,  2 Jul 2021 07:58:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="294338663"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="294338663"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 00:58:02 -0700
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; d="scan'208";a="482209269"
Received: from flast-mobl.ger.corp.intel.com (HELO localhost) ([10.252.43.116])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 00:57:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 16/53] drm/i915/xehpsdv: add initial XeHP SDV definitions
In-Reply-To: <20210701202427.1547543-17-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-17-matthew.d.roper@intel.com>
Date: Fri, 02 Jul 2021 10:57:55 +0300
Message-ID: <87bl7lqha4.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Jul 2021, Matt Roper <matthew.d.roper@intel.com> wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
>
> XeHP SDV is a Intel=C2=AE dGPU without display. This is just the definiti=
on
> of some basic platform macros, by large a copy of current state of
> Tigerlake which does not reflect the end state of this platform.
>
> Bspec: 44467, 48077
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h          | 10 ++++++++++
>  drivers/gpu/drm/i915/i915_pci.c          | 20 ++++++++++++++++++++
>  drivers/gpu/drm/i915/intel_device_info.c |  1 +
>  drivers/gpu/drm/i915/intel_device_info.h |  1 +
>  4 files changed, 32 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index c02600850246..63bed18a2be7 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1406,6 +1406,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, INTEL_DG1)
>  #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, INTEL_ALDERLAKE_S)
>  #define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, INTEL_ALDERLAKE_P)
> +#define IS_XEHPSDV(dev_priv) IS_PLATFORM(dev_priv, INTEL_XEHPSDV)
>  #define IS_HSW_EARLY_SDV(dev_priv) (IS_HASWELL(dev_priv) && \
>  				    (INTEL_DEVID(dev_priv) & 0xFF00) =3D=3D 0x0C00)
>  #define IS_BDW_ULT(dev_priv) \
> @@ -1564,6 +1565,15 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  	(IS_ALDERLAKE_P(__i915) && \
>  	 IS_GT_STEP(__i915, since, until))
>=20=20
> +#define XEHPSDV_REVID_A0		0x0
> +#define XEHPSDV_REVID_A1		0x1
> +#define XEHPSDV_REVID_A_LAST	XEHPSDV_REVID_A1
> +#define XEHPSDV_REVID_B0		0x4
> +#define XEHPSDV_REVID_C0		0x8
> +
> +#define IS_XEHPSDV_REVID(p, since, until) \
> +	(IS_XEHPSDV(p) && IS_REVID(p, since, until))

For new platforms we should be using the mechanisms in
intel_step.[ch]. As well as converting the old ones.


BR,
Jani.


> +
>  #define IS_LP(dev_priv)		(INTEL_INFO(dev_priv)->is_lp)
>  #define IS_GEN9_LP(dev_priv)	(GRAPHICS_VER(dev_priv) =3D=3D 9 && IS_LP(d=
ev_priv))
>  #define IS_GEN9_BC(dev_priv)	(GRAPHICS_VER(dev_priv) =3D=3D 9 && !IS_LP(=
dev_priv))
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_=
pci.c
> index 88b279452b87..046309e95f43 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1020,6 +1020,26 @@ static const struct intel_device_info adl_p_info =
=3D {
>  	.ppgtt_size =3D 48, \
>  	.ppgtt_type =3D INTEL_PPGTT_FULL
>=20=20
> +#define XE_HPM_FEATURES \
> +	.media_ver =3D 12, \
> +	.media_ver_release =3D 50
> +
> +__maybe_unused
> +static const struct intel_device_info xehpsdv_info =3D {
> +	XE_HP_FEATURES,
> +	XE_HPM_FEATURES,
> +	DGFX_FEATURES,
> +	PLATFORM(INTEL_XEHPSDV),
> +	.display =3D { },
> +	.pipe_mask =3D 0,
> +	.platform_engine_mask =3D
> +		BIT(RCS0) | BIT(BCS0) |
> +		BIT(VECS0) | BIT(VECS1) | BIT(VECS2) | BIT(VECS3) |
> +		BIT(VCS0) | BIT(VCS1) | BIT(VCS2) | BIT(VCS3) |
> +		BIT(VCS4) | BIT(VCS5) | BIT(VCS6) | BIT(VCS7),
> +	.require_force_probe =3D 1,
> +};
> +
>  #undef PLATFORM
>=20=20
>  /*
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i=
915/intel_device_info.c
> index e8ad14f002c1..7b37b68f4548 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -68,6 +68,7 @@ static const char * const platform_names[] =3D {
>  	PLATFORM_NAME(DG1),
>  	PLATFORM_NAME(ALDERLAKE_S),
>  	PLATFORM_NAME(ALDERLAKE_P),
> +	PLATFORM_NAME(XEHPSDV),
>  };
>  #undef PLATFORM_NAME
>=20=20
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i=
915/intel_device_info.h
> index f824de632cfe..e8684199b0c9 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -88,6 +88,7 @@ enum intel_platform {
>  	INTEL_DG1,
>  	INTEL_ALDERLAKE_S,
>  	INTEL_ALDERLAKE_P,
> +	INTEL_XEHPSDV,
>  	INTEL_MAX_PLATFORMS
>  };

--=20
Jani Nikula, Intel Open Source Graphics Center
