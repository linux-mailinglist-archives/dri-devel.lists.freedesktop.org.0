Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC9084CDB6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 16:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF52A1124A0;
	Wed,  7 Feb 2024 15:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgo3sAdH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449971124A0;
 Wed,  7 Feb 2024 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707318600; x=1738854600;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:to:cc:from:message-id:date;
 bh=3nKxjuLN5GZQX4lfJg/CBmW/yO3+/SCaAOBqdvLVE0k=;
 b=cgo3sAdHzNz6Zr77lzXCjLC1944nwtndkmmSGkAR7E4ASyzw5NKgpjq5
 MWxpYKbn2D0Y4TNzn3ykdUEkr32Qhh98XrVtnuNrSc2uUW56pUxLLPmZ0
 4MFEtSkqXq/2fCbZnUtI3/KYxyzV/elRItk9X73qJYo6kzGuVfVvhVj7a
 VIaTXdrNkYWhdK9zIGyU2n2TZELjFbUa7FU/R+wx3ewEKaKr4SRDyp0Dd
 uJAyNUl3PJqzBHzfB5qTq08HlYv0RklyKUCYEqNfJQCpjy2+ryuK7NXkc
 COD1uYxrLjFqBX7uzINUIv1LluUTtFHhm2GrQKlLtmQB6mgJWuUbBk84o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="916785"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="916785"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 07:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1354280"
Received: from unknown (HELO localhost) ([10.245.244.8])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 07:09:55 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
References: <20240207115612.1322778-1-tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC] drm/i915: Add GuC submission interface version query
To: Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, Jose Souza <jose.souza@intel.com>,
 Sagar Ghuge <sagar.ghuge@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170731859243.18961.9155317757969969815@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 07 Feb 2024 17:09:52 +0200
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2024-02-07 13:56:12)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> Add a new query to the GuC submission interface version.
>=20
> Mesa intends to use this information to check for old firmware versions
> with a known bug where using the render and compute command streamers
> simultaneously can cause GPU hangs due issues in firmware scheduling.
>=20
> Based on patches from Vivaik and Joonas.
>=20
> There is a little bit of an open around the width required for versions.
> While the GuC FW iface tells they are u8, i915 GuC code uses u32:
>=20
>  #define CSS_SW_VERSION_UC_MAJOR               (0xFF << 16)
>  #define CSS_SW_VERSION_UC_MINOR               (0xFF << 8)
>  #define CSS_SW_VERSION_UC_PATCH               (0xFF << 0)
> ...
>  struct intel_uc_fw_ver {
>          u32 major;
>          u32 minor;
>          u32 patch;
>          u32 build;
>  };
>=20
> So we could make the query u8, and refactor the struct intel_uc_fw_ver
> to use u8, or not. To avoid any doubts on why are we assigning u32 to
> u8 I simply opted to use u64. Which avoids the need to add any padding
> too.

This a single-shot init time query so I guess u64 is fine too, to keep
the code straightforward.

> Compile tested only.

If Mesa folks confirm this is working for them and after you add link to
the Mesa PR, then you can add my:

Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Regards, Joonas

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jose Souza <jose.souza@intel.com>
> Cc: Sagar Ghuge <sagar.ghuge@intel.com>
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_query.c | 32 +++++++++++++++++++++++++++++++
>  include/uapi/drm/i915_drm.h       | 11 +++++++++++
>  2 files changed, 43 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i91=
5_query.c
> index 00871ef99792..999687f6a3d4 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -551,6 +551,37 @@ static int query_hwconfig_blob(struct drm_i915_priva=
te *i915,
>         return hwconfig->size;
>  }
> =20
> +static int
> +query_guc_submission_version(struct drm_i915_private *i915,
> +                            struct drm_i915_query_item *query)
> +{
> +       struct drm_i915_query_guc_submission_version __user *query_ptr =3D
> +                                           u64_to_user_ptr(query->data_p=
tr);
> +       struct drm_i915_query_guc_submission_version ver;
> +       struct intel_guc *guc =3D &to_gt(i915)->uc.guc;
> +       const size_t size =3D sizeof(ver);
> +       int ret;
> +
> +       if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc))
> +               return -ENODEV;
> +
> +       ret =3D copy_query_item(&ver, size, size, query);
> +       if (ret !=3D 0)
> +               return ret;
> +
> +       if (ver.major || ver.minor || ver.patch)
> +               return -EINVAL;
> +
> +       ver.major =3D guc->submission_version.major;
> +       ver.minor =3D guc->submission_version.minor;
> +       ver.patch =3D guc->submission_version.patch;
> +
> +       if (copy_to_user(query_ptr, &ver, size))
> +               return -EFAULT;
> +
> +       return 0;
> +}
> +
>  static int (* const i915_query_funcs[])(struct drm_i915_private *dev_pri=
v,
>                                         struct drm_i915_query_item *query=
_item) =3D {
>         query_topology_info,
> @@ -559,6 +590,7 @@ static int (* const i915_query_funcs[])(struct drm_i9=
15_private *dev_priv,
>         query_memregion_info,
>         query_hwconfig_blob,
>         query_geometry_subslices,
> +       query_guc_submission_version,
>  };
> =20
>  int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file=
 *file)
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 550c496ce76d..d80d9b5e1eda 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3038,6 +3038,7 @@ struct drm_i915_query_item {
>          *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_m=
emory_regions)
>          *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
>          *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_que=
ry_topology_info)
> +        *  - %DRM_I915_QUERY_GUC_SUBMISSION_VERSION (see struct drm_i915=
_query_guc_submission_version)
>          */
>         __u64 query_id;
>  #define DRM_I915_QUERY_TOPOLOGY_INFO           1
> @@ -3046,6 +3047,7 @@ struct drm_i915_query_item {
>  #define DRM_I915_QUERY_MEMORY_REGIONS          4
>  #define DRM_I915_QUERY_HWCONFIG_BLOB           5
>  #define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
> +#define DRM_I915_QUERY_GUC_SUBMISSION_VERSION  7
>  /* Must be kept compact -- no holes and well documented */
> =20
>         /**
> @@ -3591,6 +3593,15 @@ struct drm_i915_query_memory_regions {
>         struct drm_i915_memory_region_info regions[];
>  };
> =20
> +/**
> +* struct drm_i915_query_guc_submission_version - query GuC submission in=
terface version
> +*/
> +struct drm_i915_query_guc_submission_version {
> +       __u64 major;
> +       __u64 minor;
> +       __u64 patch;
> +};
> +
>  /**
>   * DOC: GuC HWCONFIG blob uAPI
>   *
> --=20
> 2.40.1
>=20
