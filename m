Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 518047AFE33
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 10:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8420A10E499;
	Wed, 27 Sep 2023 08:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DD010E499;
 Wed, 27 Sep 2023 08:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695802963; x=1727338963;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=DT7SHM6VLdTnYjtIwSLDkU1b0j9BNsgG6Lmz1Qvs7rk=;
 b=Gwng/NagZijlIMG7vPDPjukD3iI0y0hnPSuMwq5x0+nuquUEFNkOxQAy
 KJzSO21qRT5rstXYpJv3AQFicrM1SFRGFFjbq4/mKXVJYNbw4t1YVmneb
 baMaW5MxShfnL/a75Tvp57HXMfkqrsdj2/vcRonDGsJ/0p08D9hfIYvz7
 NLeRKyOP44CMkv1DMAVICneazR+KzoiPAr4DAyxd2/na74CWkDhiMwlco
 8A3QgGg0hbnQT6rB7WqK2ZvEI7+60Jnrd8HQ2ZKhwSDmBq0nlElDizoBh
 ip2cKlxSq8/iG0ZTNPtXsKZ76kAMwzj6KQkJpyBZJyaTJGeMvF3MZzu1M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384549794"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="384549794"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 01:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819329068"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="819329068"
Received: from roomensx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.40.191])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 01:22:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Patch v1] drm/i915: Add uAPI to query micro-controller FW version
In-Reply-To: <900c90f4-8db5-b0b3-caec-4d7d76291f2c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <900c90f4-8db5-b0b3-caec-4d7d76291f2c@intel.com>
Date: Wed, 27 Sep 2023 11:22:36 +0300
Message-ID: <87zg18ja9f.fsf@intel.com>
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
Cc: john.c.harrison@intel.com, daniele.ceraolospurio@intel.com,
 jose.souza@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Sep 2023, "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@in=
tel.com> wrote:
> Due to a bug in GuC firmware, Mesa can't enable by default the usage of=20
> compute engines in DG2 and newer.
>
>
> A new GuC firmware fixed the issue but until now there was no way
>
> for Mesa to know if KMD was running with the fixed GuC version or not,
>
> so this uAPI is required.
>
>
> It may be expanded in future to query other firmware versions too.
>
> More information:=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
>
> Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/252=
33
>
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
>
> Signed-off-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>

Please use git send-email to send patches. This is corrupted.

BR,
Jani.

> ---
>  =C2=A0drivers/gpu/drm/i915/i915_query.c | 47 +++++++++++++++++++++++++++=
++++
>  =C2=A0include/uapi/drm/i915_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
32 +++++++++++++++++++++
>  =C2=A02 files changed, 79 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_query.c=20
> b/drivers/gpu/drm/i915/i915_query.c
> index 00871ef99792..7f22a49faae7 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -551,6 +551,52 @@ static int query_hwconfig_blob(struct=20
> drm_i915_private *i915,
>  =C2=A0=C2=A0=C2=A0=C2=A0 return hwconfig->size;
>  =C2=A0}
>
> +static int
> +query_uc_fw_version(struct drm_i915_private *i915, struct=20
> drm_i915_query_item *query)
> +{
> +=C2=A0=C2=A0=C2=A0 struct drm_i915_query_uc_fw_version __user *query_ptr=
 =3D=20
> u64_to_user_ptr(query->data_ptr);
> +=C2=A0=C2=A0=C2=A0 size_t size =3D sizeof(struct drm_i915_query_uc_fw_ve=
rsion);
> +=C2=A0=C2=A0=C2=A0 struct drm_i915_query_uc_fw_version resp;
> +
> +=C2=A0=C2=A0=C2=A0 if (query->length =3D=3D 0) {
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 query->length =3D size;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return 0;
> +=C2=A0=C2=A0=C2=A0 } else if (query->length !=3D size) {
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 drm_dbg(&i915->drm,
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "Invalid uc_fw_=
version query item size=3D%u expected=3D%zu\n",
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 query->length,=
=C2=A0=C2=A0=C2=A0 size);
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -EINVAL;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if (copy_from_user(&resp, query_ptr, size))
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -EFAULT;
> +
> +=C2=A0=C2=A0=C2=A0 if (resp.pad || resp.pad2 || resp.reserved) {
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 drm_dbg(&i915->drm,
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "Invalid input =
fw version query structure parameters=20
> received");
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -EINVAL;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 switch (resp.uc_type) {
> +=C2=A0=C2=A0=C2=A0 case I915_QUERY_UC_TYPE_GUC: {
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 struct intel_guc *guc =3D &i915->g=
t0.uc.guc;
> +
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 resp.major_ver =3D guc->submission=
_version.major;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 resp.minor_ver =3D guc->submission=
_version.minor;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 resp.patch_ver =3D guc->submission=
_version.patch;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 resp.branch_ver =3D 0;
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 default:
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -EINVAL;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if (copy_to_user(query_ptr, &resp, size))
> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return -EFAULT;
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
>  =C2=A0static int (* const i915_query_funcs[])(struct drm_i915_private *d=
ev_priv,
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 struct drm_i915_query_item *query_item) =3D {
>  =C2=A0=C2=A0=C2=A0=C2=A0 query_topology_info,
> @@ -559,6 +605,7 @@ static int (* const i915_query_funcs[])(struct=20
> drm_i915_private *dev_priv,
>  =C2=A0=C2=A0=C2=A0=C2=A0 query_memregion_info,
>  =C2=A0=C2=A0=C2=A0=C2=A0 query_hwconfig_blob,
>  =C2=A0=C2=A0=C2=A0=C2=A0 query_geometry_subslices,
> +=C2=A0=C2=A0=C2=A0 query_uc_fw_version,
>  =C2=A0};
>
>  =C2=A0int i915_query_ioctl(struct drm_device *dev, void *data, struct=20
> drm_file *file)
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 7000e5910a1d..9be241fb77d8 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3013,6 +3013,7 @@ struct drm_i915_query_item {
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*=C2=A0 - %DRM_I915_QUERY_MEMORY_REGIONS =
(see struct=20
> drm_i915_query_memory_regions)
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*=C2=A0 - %DRM_I915_QUERY_HWCONFIG_BLOB (=
see `GuC HWCONFIG blob uAPI`)
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*=C2=A0 - %DRM_I915_QUERY_GEOMETRY_SUBSLI=
CES (see struct=20
> drm_i915_query_topology_info)
> +=C2=A0=C2=A0=C2=A0 =C2=A0*=C2=A0 - %DRM_I915_QUERY_UC_FW_VERSION (see st=
ruct=20
> drm_i915_query_uc_fw_version)
>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*/
>  =C2=A0=C2=A0=C2=A0=C2=A0 __u64 query_id;
>  =C2=A0#define DRM_I915_QUERY_TOPOLOGY_INFO=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 1
> @@ -3021,6 +3022,7 @@ struct drm_i915_query_item {
>  =C2=A0#define DRM_I915_QUERY_MEMORY_REGIONS=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 4
>  =C2=A0#define DRM_I915_QUERY_HWCONFIG_BLOB=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 5
>  =C2=A0#define DRM_I915_QUERY_GEOMETRY_SUBSLICES=C2=A0=C2=A0=C2=A0 6
> +#define DRM_I915_QUERY_UC_FW_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 7
>  =C2=A0/* Must be kept compact -- no holes and well documented */
>
>  =C2=A0=C2=A0=C2=A0=C2=A0 /**
> @@ -3213,6 +3215,36 @@ struct drm_i915_query_topology_info {
>  =C2=A0=C2=A0=C2=A0=C2=A0 __u8 data[];
>  =C2=A0};
>
> +/**
> +* struct drm_i915_query_uc_fw_version - query a micro-controller=20
> firmware version
> +*
> +* Given a uc_type this will return the major, minor, patch and branch=20
> version
> +* of the micro-controller firmware.
> +*/
> +struct drm_i915_query_uc_fw_version {
> +=C2=A0=C2=A0=C2=A0 /** @uc: The micro-controller type to query firmware =
version */
> +#define I915_QUERY_UC_TYPE_GUC 0
> +=C2=A0=C2=A0=C2=A0 __u16 uc_type;
> +
> +=C2=A0=C2=A0=C2=A0 /** @pad: MBZ */
> +=C2=A0=C2=A0=C2=A0 __u16 pad;
> +
> +=C2=A0=C2=A0=C2=A0 /* @major_ver: major uc fw version */
> +=C2=A0=C2=A0=C2=A0 __u32 major_ver;
> +=C2=A0=C2=A0=C2=A0 /* @minor_ver: minor uc fw version */
> +=C2=A0=C2=A0=C2=A0 __u32 minor_ver;
> +=C2=A0=C2=A0=C2=A0 /* @patch_ver: patch uc fw version */
> +=C2=A0=C2=A0=C2=A0 __u32 patch_ver;
> +=C2=A0=C2=A0=C2=A0 /* @branch_ver: branch uc fw version */
> +=C2=A0=C2=A0=C2=A0 __u32 branch_ver;
> +
> +=C2=A0=C2=A0=C2=A0 /** @pad2: MBZ */
> +=C2=A0=C2=A0=C2=A0 __u32 pad2;
> +
> +=C2=A0=C2=A0=C2=A0 /** @reserved: Reserved */
> +=C2=A0=C2=A0=C2=A0 __u64 reserved;
> +};
> +
>  =C2=A0/**
>  =C2=A0 * DOC: Engine Discovery uAPI
>  =C2=A0 *
>
> base-commit: a42554bf0755b80fdfb8e91ca35ae6835bb3534d

--=20
Jani Nikula, Intel
