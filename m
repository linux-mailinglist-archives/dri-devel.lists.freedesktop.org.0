Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD1A87CF4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF4210E53E;
	Mon, 14 Apr 2025 10:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KePMNTvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2CD10E53E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744625193; x=1776161193;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=WhUtYdHkWiJ3gnoNVWX8jifKoqmwY7T1iy25cY9QpS4=;
 b=KePMNTvPaNSyt3nDNnm9NwsA+j1UhJE0VIh/PuPPVByjOSnIdMcLUvJN
 lKXZUEkWZNRb8ZfIOERm8UKsOxp5ZpxUQQQ3V5/FZjI5mX+42b+hhnWns
 1oY/0mZh6XlKuOSDbgX6+n6aQncsubVQNAAozLUSLSkTj4Fwmd/bXCb05
 oxkB8z4qJqtsWy69DhycK+XPsCM/PNMiA8onDFyIKhzeLtZ9TFa8W9Bo2
 MP478/51tpAbgFVDxN9EUJ6g79WdkZM9zZGwFpH8STges8i+vuJF/a1G3
 TzMFOWNPPmFkVROAibRasEXNdNfk2iWaExwob6eLiprG+KhTmRGoPuOBz Q==;
X-CSE-ConnectionGUID: ujR3lFAfTS2WfNOyB3CGPw==
X-CSE-MsgGUID: +JemeMKOSoqpx0QkpHwPGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46218565"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="46218565"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:06:32 -0700
X-CSE-ConnectionGUID: okw0FzZZQLWWb67E/6Yqdw==
X-CSE-MsgGUID: eEDk4LnCT+K09Hr6L6GI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="160731825"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:06:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH 11/13] drm/edid: introduce a helper that compares edid
 data from two drm_edid
In-Reply-To: <20250411201333.151335-12-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250411201333.151335-1-mwen@igalia.com>
 <20250411201333.151335-12-mwen@igalia.com>
Date: Mon, 14 Apr 2025 13:06:25 +0300
Message-ID: <87ikn7t5um.fsf@intel.com>
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

On Fri, 11 Apr 2025, Melissa Wen <mwen@igalia.com> wrote:
> AMD driver has a function used to compare if two edid are the same; this
> is useful to some of the link detection algorithms implemented by
> amdgpu.=C2=A0Since the amdgpu function can be helpful for other drivers, =
this
> commit abstracts the AMD function to make it available at the DRM level
> by wrapping existent drm_edid_eq().
>
> Co-developed-by: Rodrigo Siqueira <siqueira@igalia.com>
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 18 ++++++++++++++++++
>  include/drm/drm_edid.h     |  2 ++
>  2 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ff..328a25d198e5 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -7502,3 +7502,21 @@ bool drm_edid_is_digital(const struct drm_edid *dr=
m_edid)
>  		drm_edid->edid->input & DRM_EDID_INPUT_DIGITAL;
>  }
>  EXPORT_SYMBOL(drm_edid_is_digital);
> +
> +/**
> + * drm_edid_is_edid_eq - Check if it the EDID is equal

I think drm_edid_eq() is the better name. Please rename the static one
to make room. Maybe make it drm_edid_eq_buf() or something, because
that's what it really does.

"Check if the EDIDs are equal"

> + *
> + * @drm_edid_old: old drm_edid to compare edid
> + * @drm_edid_new: new drm_edid to compare edid

Old and new are meaningless here. It's supposed to be a generic
function. Just a/b or edid1/edid2 or something.

> + *
> + * Return true if the EDID is equal

"Return true if the EDIDs are equal."

> + */
> +bool drm_edid_is_edid_eq(const struct drm_edid *drm_edid_old,
> +			 const struct drm_edid *drm_edid_new)
> +{
> +	const void *old_edid =3D drm_edid_old->edid;
> +	size_t old_edid_size =3D drm_edid_old->size;

The existing drm_edid_eq() function supports the use case of either or
both EDIDs being NULL, and returning true for two NULL EDIDs. This one
oopses if the "old" EDID is NULL.

I'm not sure you can trivially replicate that behaviour by reusing the
existing function, though.

> +
> +	return drm_edid_eq(drm_edid_new, old_edid, old_edid_size);
> +}
> +EXPORT_SYMBOL(drm_edid_is_edid_eq);
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index eaac5e665892..0e062761296c 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -469,6 +469,8 @@ int drm_edid_connector_update(struct drm_connector *c=
onnector,
>  			      const struct drm_edid *edid);
>  int drm_edid_connector_add_modes(struct drm_connector *connector);
>  bool drm_edid_is_digital(const struct drm_edid *drm_edid);
> +bool drm_edid_is_edid_eq(const struct drm_edid *drm_edid_first,
> +			 const struct drm_edid *drm_edid_second);
>  void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>  			     struct drm_edid_product_id *id);
>  void drm_edid_print_product_id(struct drm_printer *p,

--=20
Jani Nikula, Intel
