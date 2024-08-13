Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B8694FF2D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 09:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900B110E04C;
	Tue, 13 Aug 2024 07:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5iF+mAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6481A10E04C;
 Tue, 13 Aug 2024 07:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723535800; x=1755071800;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=KYijDMxWTruxUOHeIXuSweAvO2AIcNRXv9pQTHmdND4=;
 b=l5iF+mAkHJ8O6704NkawDsDOkhCf/ZgC6w57SwuCdrkLFwAKnktObs4/
 wCU0zW7MG/1ltHEk1aKcw8FyXziaPyDnC8Kk5DGZJEtxqwj4Hd2vMzCz+
 hZSkRjo5ujyzskQ2Piw216/49F4Oozool//mJmEeUQG6gwxgy55cwv58a
 Vg+AP/H5Z0gHH+IyWk4MJRKe+5NwePSYjVOTa6xstAg4/FsEYiir4fovK
 bfK5B8zlHmVa5tmDjkEgqwjb7qSETl2GqAxS2wvz1oE+QghFarnKRk9g6
 zOYGjnIkfTqvvlhWcSEGZO0Q1P592v2JFuSFuzvb1c1RfHftdB76OXI46 g==;
X-CSE-ConnectionGUID: RtK2JQrpRsupEJUllqMYPw==
X-CSE-MsgGUID: TMQtl3WbQraWvW02ZnljIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25546397"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25546397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 00:56:39 -0700
X-CSE-ConnectionGUID: lG7mVi4oRlqiqUXf6sr6fg==
X-CSE-MsgGUID: kpoadPFQSNGgFJblkarbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63438975"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 00:56:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Harry
 Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Matt Hartley <matt.hartley@gmail.com>, Kieran
 Levin <ktl@framework.net>, Hans de Goede <hdegoede@redhat.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Subject: Re: [PATCH v4 1/3] drm: Add panel backlight quirks
In-Reply-To: <20240812-amdgpu-min-backlight-quirk-v4-1-56a63ff897b7@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net>
 <20240812-amdgpu-min-backlight-quirk-v4-1-56a63ff897b7@weissschuh.net>
Date: Tue, 13 Aug 2024 10:56:30 +0300
Message-ID: <878qx026vl.fsf@intel.com>
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

On Mon, 12 Aug 2024, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:
> Panels using a PWM-controlled backlight source without an do not have a
> standard way to communicate their valid PWM ranges.
> On x86 the ranges are read from ACPI through driver-specific tables.
> The built-in ranges are not necessarily correct, or may grow stale if an
> older device can be retrofitted with newer panels.
>
> Add a quirk infrastructure with which the minimum valid backlight value
> can be maintained as part of the kernel.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  Documentation/gpu/drm-kms-helpers.rst        |  3 ++
>  drivers/gpu/drm/Kconfig                      |  4 ++
>  drivers/gpu/drm/Makefile                     |  1 +
>  drivers/gpu/drm/drm_panel_backlight_quirks.c | 69 ++++++++++++++++++++++=
++++++
>  include/drm/drm_utils.h                      |  3 ++
>  5 files changed, 80 insertions(+)
>
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/dr=
m-kms-helpers.rst
> index 8435e8621cc0..a26989500129 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -230,6 +230,9 @@ Panel Helper Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
>     :export:
>=20=20
> +.. kernel-doc:: drivers/gpu/drm/drm_panel_backlight_quirks.c
> +   :export:
> +
>  Panel Self Refresh Helper Reference
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 6b2c6b91f962..9ebb8cdb535e 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -454,6 +454,10 @@ config DRM_HYPERV
>  config DRM_EXPORT_FOR_TESTS
>  	bool
>=20=20
> +# Separate option as not all DRM drivers use it
> +config DRM_PANEL_BACKLIGHT_QUIRKS
> +	tristate
> +
>  config DRM_LIB_RANDOM
>  	bool
>  	default n
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 68cc9258ffc4..adf85999aee2 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -92,6 +92,7 @@ drm-$(CONFIG_DRM_PANIC) +=3D drm_panic.o
>  obj-$(CONFIG_DRM)	+=3D drm.o
>=20=20
>  obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) +=3D drm_panel_orientation_qu=
irks.o
> +obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) +=3D drm_panel_backlight_quirks=
.o
>=20=20
>  #
>  # Memory-management helpers
> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/d=
rm/drm_panel_backlight_quirks.c
> new file mode 100644
> index 000000000000..a88e77db97c5
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/array_size.h>
> +#include <linux/dmi.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <drm/drm_utils.h>
> +
> +struct drm_panel_min_backlight_quirk {
> +	struct {
> +		enum dmi_field field;
> +		const char * const value;
> +	} dmi_match;
> +	struct drm_edid_ident ident;
> +	u8 min_brightness;
> +};
> +
> +static const struct drm_panel_min_backlight_quirk drm_panel_min_backligh=
t_quirks[] =3D {
> +};
> +
> +static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel=
_min_backlight_quirk *quirk,
> +						  const struct drm_edid *edid)
> +{
> +	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
> +		return false;
> +
> +	if (!drm_edid_match(edid, &quirk->ident))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * drm_get_panel_min_brightness_quirk - Get minimum supported brightness=
 level for a panel.
> + * @edid: EDID of the panel to check
> + *
> + * This function checks for platform specific (e.g. DMI based) quirks
> + * providing info on the minimum backlight brightness for systems where =
this
> + * cannot be probed correctly from the hard-/firm-ware.
> + *
> + * Returns:
> + * A negative error value or
> + * an override value in the range [0, 255] representing 0-100% to be sca=
led to
> + * the drivers target range.
> + */
> +int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid)
> +{
> +	const struct drm_panel_min_backlight_quirk *quirk;
> +	size_t i;
> +
> +	if (!IS_ENABLED(CONFIG_DMI))
> +		return -ENODATA;
> +
> +	if (!edid)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
> +		quirk =3D &drm_panel_min_backlight_quirks[i];
> +
> +		if (drm_panel_min_backlight_quirk_matches(quirk, edid))
> +			return quirk->min_brightness;
> +	}
> +
> +	return -ENODATA;
> +}
> +EXPORT_SYMBOL(drm_get_panel_min_brightness_quirk);
> +
> +MODULE_DESCRIPTION("Quirks for panel backlight overrides");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
> index 70775748d243..267711028dd4 100644
> --- a/include/drm/drm_utils.h
> +++ b/include/drm/drm_utils.h
> @@ -11,9 +11,12 @@
>  #define __DRM_UTILS_H__
>=20=20
>  #include <linux/types.h>
> +#include <drm/drm_edid.h>

Please prefer forward declarations over includes where possible.

Here,

struct drm_edid;

is sufficient.

BR,
Jani.

>=20=20
>  int drm_get_panel_orientation_quirk(int width, int height);
>=20=20
> +int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid);
> +
>  signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
>=20=20
>  #endif

--=20
Jani Nikula, Intel
