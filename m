Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63341AAF904
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 13:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84BD10E0A6;
	Thu,  8 May 2025 11:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bu/fgmsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA9D10E0A6;
 Thu,  8 May 2025 11:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746704878; x=1778240878;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ktSu32T2vHDtU3TaWxfNGQltXSfzb7pVbd9YNQ7yOL0=;
 b=Bu/fgmsxkkkvG2T8Yyo0bjWmktSVSw6+3cU62HI8yHbHfEwprUKYfymc
 gWpbDVUFOsmSb16NS2bR09i20XadECAI+S/YdZOZYc1yEzUcaoLWkbKdK
 R8wuAoO4H4Tr1h/zyY8ZdMP4wIrtzBtttuJ78K1Mk3IaKh+lqCa7ytU5H
 hrswkk3fhp1ltJx/WLAZzht+EsMTwVb/VP2UVCnah4OXwCtEAR7Xls82J
 nBt6O+A3YpT+ZjXDYlKvI9vrC2tTwN6TI9gtoNeww7hJ3xNcVI7Vwu35c
 MbTHJwPw20QR1an32opBTzggDkBHUZx+X6DLBNUF/SmPPLXyPf7mrWDCm w==;
X-CSE-ConnectionGUID: dDaWvcE+R321etNkB9Prhg==
X-CSE-MsgGUID: U7nY39qaTA232SpWXoZotQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59833151"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="59833151"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:47:58 -0700
X-CSE-ConnectionGUID: 7EcPh2urQiWsjZERFjUnUw==
X-CSE-MsgGUID: +5TkUEutSgiSUu8e2uFOTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="140308286"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:47:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Michel Daenzer <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2 12/14] drm/edid: introduce a helper that compares
 edid data from two drm_edid
In-Reply-To: <20250507001712.120215-13-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250507001712.120215-1-mwen@igalia.com>
 <20250507001712.120215-13-mwen@igalia.com>
Date: Thu, 08 May 2025 14:47:47 +0300
Message-ID: <87msbntjbw.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 May 2025, Melissa Wen <mwen@igalia.com> wrote:
> AMD driver has a function used to compare if two edid are the same; this
> is useful to some of the link detection algorithms implemented by
> amdgpu.=C2=A0Since the amdgpu function can be helpful for other drivers, =
this
         ^

Theres's a non-breaking space in there I think.

> commit abstracts the AMD function to make it available at the DRM level
> by wrapping existent drm_edid_eq().
>
> v2:
> - rename drm_edid_eq to drm_edid_eq_buf (jani)
> - add NULL checks (jani)
>
> Co-developed-by: Rodrigo Siqueira <siqueira@igalia.com>
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 24 +++++++++++++++++++++---
>  include/drm/drm_edid.h     |  2 ++
>  2 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 6e4cffd467f1..079042ccbc41 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1820,8 +1820,8 @@ static bool edid_block_is_zero(const void *edid)
>  	return mem_is_zero(edid, EDID_LENGTH);
>  }
>=20=20
> -static bool drm_edid_eq(const struct drm_edid *drm_edid,
> -			const void *raw_edid, size_t raw_edid_size)
> +static bool drm_edid_eq_buf(const struct drm_edid *drm_edid,
> +			    const void *raw_edid, size_t raw_edid_size)
>  {
>  	bool edid1_present =3D drm_edid && drm_edid->edid && drm_edid->size;
>  	bool edid2_present =3D raw_edid && raw_edid_size;
> @@ -6918,7 +6918,7 @@ static int _drm_edid_connector_property_update(stru=
ct drm_connector *connector,
>  		const void *old_edid =3D connector->edid_blob_ptr->data;
>  		size_t old_edid_size =3D connector->edid_blob_ptr->length;
>=20=20
> -		if (old_edid && !drm_edid_eq(drm_edid, old_edid, old_edid_size)) {
> +		if (old_edid && !drm_edid_eq_buf(drm_edid, old_edid, old_edid_size)) {
>  			connector->epoch_counter++;
>  			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\=
n",
>  				    connector->base.id, connector->name,
> @@ -7523,3 +7523,21 @@ bool drm_edid_is_digital(const struct drm_edid *dr=
m_edid)
>  		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
>  }
>  EXPORT_SYMBOL(drm_edid_is_digital);
> +
> +/**
> + * drm_edid_edid_eq - Check if EDIDs are equal
> + *
> + * @drm_edid_old: old drm_edid to compare edid
> + * @drm_edid_new: new drm_edid to compare edid

Comments still refer to old/new, please run kernel-doc.

> + *
> + * Return true if EDIDs are equal.
> + */
> +bool drm_edid_eq(const struct drm_edid *drm_edid_1,
> +		 const struct drm_edid *drm_edid_2)
> +{
> +	const void *edid_1 =3D drm_edid_1 ? drm_edid_1->edid : NULL;
> +	size_t edid_1_size =3D drm_edid_1 ? drm_edid_1->size : 0;
> +
> +	return drm_edid_eq_buf(drm_edid_2, edid_1, edid_1_size);
> +}
> +EXPORT_SYMBOL(drm_edid_eq);
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index ceb522c4f4c2..c0e49c4a32e9 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -472,6 +472,8 @@ int drm_edid_connector_update(struct drm_connector *c=
onnector,
>  			      const struct drm_edid *edid);
>  int drm_edid_connector_add_modes(struct drm_connector *connector);
>  bool drm_edid_is_digital(const struct drm_edid *drm_edid);
> +bool drm_edid_eq(const struct drm_edid *drm_edid_first,
> +			 const struct drm_edid *drm_edid_second);

Nitpick, parameter names in the declaration differ from the ones in the
definition.

With the above fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>  			     struct drm_edid_product_id *id);
>  void drm_edid_print_product_id(struct drm_printer *p,

--=20
Jani Nikula, Intel
