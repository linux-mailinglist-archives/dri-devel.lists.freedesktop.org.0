Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C934093F172
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 11:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4660210E39E;
	Mon, 29 Jul 2024 09:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ae8VY5io";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BDC10E388;
 Mon, 29 Jul 2024 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722246398; x=1753782398;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=1zUqEV9uKWRKbZcOJDccWIU6L3YJKgdXBhzCtbMiD/Q=;
 b=Ae8VY5iouofESI16AhggnTBVy0gXEQDTnsro24lnCaRSVE7DvADCxxaj
 CMunLcrS2emUNBuGoFQkKaLPdtcHP/G1hAO7eb5nRqJKZ83aiQzVn7Pac
 z852vtuF1uGzmRLffAqpj2ClihxPf/g5XU99B2TjUxlSQ4EubIr8/VxAZ
 Sg/bAX0VEWq+EwVZv1d4AqCxdDlCTe4dQEsSJMlwMdbwAQ3FeGhgMIzEG
 tMVSNnKGbeb/hqb89dy9qUO0hqbpjPrKVTQD3cGXoNgC7TUfdV4QMJTWC
 D7vZwJBf2ghwweESLZ8u0lD/Lq2eLcgJQC1Z2lU8BXtcWuwOvE+N77JMn w==;
X-CSE-ConnectionGUID: 7+usQY9LQ8CkJJSfKM6gIA==
X-CSE-MsgGUID: 8AK9gz3JT/eRu/Nxy4th9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="31383585"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="31383585"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 02:46:37 -0700
X-CSE-ConnectionGUID: SM/v6pFrQteiKFWjdaCc/g==
X-CSE-MsgGUID: La5a1TbPQWSP1Dj6lWav+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="53884755"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 02:46:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Xinhui
 Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Subject: Re: [PATCH v2 1/2] drm/amdgpu: convert bios_hardcoded_edid to drm_edid
In-Reply-To: <20240726-amdgpu-edid-bios-v2-1-8a0326654253@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240726-amdgpu-edid-bios-v2-0-8a0326654253@weissschuh.net>
 <20240726-amdgpu-edid-bios-v2-1-8a0326654253@weissschuh.net>
Date: Mon, 29 Jul 2024 12:46:30 +0300
Message-ID: <877cd4zg21.fsf@intel.com>
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

On Fri, 26 Jul 2024, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:
> Instead of manually passing around 'struct edid *' and its size,
> use 'struct drm_edid', which encapsulates a validated combination of
> both.
>
> As the drm_edid_ can handle NULL gracefully, the explicit checks can be
> dropped.
>
> Also save a few characters by transforming '&array[0]' to the equivalent
> 'array' and using 'max_t(int, ...)' instead of manual casts.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c |  6 +-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h       |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c       |  2 +-
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 17 ++++++-----------
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c          |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c          |  2 +-
>  8 files changed, 14 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_connectors.c
> index bd0fbdc5f55d..344e0a9ee08a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -249,11 +249,7 @@ amdgpu_connector_find_encoder(struct drm_connector *=
connector,
>  static struct edid *
>  amdgpu_connector_get_hardcoded_edid(struct amdgpu_device *adev)
>  {
> -	if (adev->mode_info.bios_hardcoded_edid) {
> -		return kmemdup((unsigned char *)adev->mode_info.bios_hardcoded_edid,
> -			       adev->mode_info.bios_hardcoded_edid_size, GFP_KERNEL);
> -	}
> -	return NULL;
> +	return drm_edid_duplicate(drm_edid_raw(adev->mode_info.bios_hardcoded_e=
did));
>  }
>=20=20
>  static void amdgpu_connector_get_edid(struct drm_connector *connector)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_mode.h
> index d002b845d8ac..5e3faefc5510 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -51,6 +51,7 @@ struct amdgpu_encoder;
>  struct amdgpu_router;
>  struct amdgpu_hpd;
>  struct edid;
> +struct drm_edid;
>=20=20
>  #define to_amdgpu_crtc(x) container_of(x, struct amdgpu_crtc, base)
>  #define to_amdgpu_connector(x) container_of(x, struct amdgpu_connector, =
base)
> @@ -326,8 +327,7 @@ struct amdgpu_mode_info {
>  	/* FMT dithering */
>  	struct drm_property *dither_property;
>  	/* hardcoded DFP edid from BIOS */
> -	struct edid *bios_hardcoded_edid;
> -	int bios_hardcoded_edid_size;
> +	const struct drm_edid *bios_hardcoded_edid;
>=20=20
>  	/* firmware flags */
>  	u32 firmware_flags;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vkms.c
> index 6415d0d039e1..e5f508d34ed8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -549,7 +549,7 @@ static int amdgpu_vkms_sw_fini(void *handle)
>=20=20
>  	adev->mode_info.mode_config_initialized =3D false;
>=20=20
> -	kfree(adev->mode_info.bios_hardcoded_edid);
> +	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
>  	kfree(adev->amdgpu_vkms_output);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu=
/drm/amd/amdgpu/atombios_encoders.c
> index ebf83fee43bb..8defca3705d5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> @@ -2064,23 +2064,18 @@ amdgpu_atombios_encoder_get_lcd_info(struct amdgp=
u_encoder *encoder)
>  				case LCD_FAKE_EDID_PATCH_RECORD_TYPE:
>  					fake_edid_record =3D (ATOM_FAKE_EDID_PATCH_RECORD *)record;
>  					if (fake_edid_record->ucFakeEDIDLength) {
> -						struct edid *edid;
> +						const struct drm_edid *edid;

Bikeshedding follows, up to you and the AMD maintainers to decide
whether it matters.

I know it's a bit verbose, but personally I've named the struct drm_edid
variables drm_edid everywhere when making conversions, just to make a
clear distinction from struct edid. And I like the fact that it forces
you to account for every place the variable is used, in particular
passing it to functions that don't have type safety e.g. kfree().

>  						int edid_size;
>=20=20
>  						if (fake_edid_record->ucFakeEDIDLength =3D=3D 128)
>  							edid_size =3D fake_edid_record->ucFakeEDIDLength;
>  						else
>  							edid_size =3D fake_edid_record->ucFakeEDIDLength * 128;
> -						edid =3D kmemdup(&fake_edid_record->ucFakeEDIDString[0],
> -							       edid_size, GFP_KERNEL);
> -						if (edid) {
> -							if (drm_edid_is_valid(edid)) {
> -								adev->mode_info.bios_hardcoded_edid =3D edid;
> -								adev->mode_info.bios_hardcoded_edid_size =3D edid_size;
> -							} else {
> -								kfree(edid);
> -							}
> -						}
> +						edid =3D drm_edid_alloc(fake_edid_record->ucFakeEDIDString, edid_s=
ize);
> +						if (drm_edid_valid(edid))
> +							adev->mode_info.bios_hardcoded_edid =3D edid;
> +						else
> +							drm_edid_free(edid);
>  						record +=3D struct_size(fake_edid_record,
>  								      ucFakeEDIDString,
>  								      edid_size);

It also makes review easier because you don't have to check what goes on
outside of the patch context here. It just won't build.

> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/dce_v10_0.c
> index dddb5fe16f2c..742adbc460c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2846,7 +2846,7 @@ static int dce_v10_0_sw_fini(void *handle)
>  {
>  	struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>=20=20
> -	kfree(adev->mode_info.bios_hardcoded_edid);
> +	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
>=20=20
>  	drm_kms_helper_poll_fini(adev_to_drm(adev));
>=20=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/dce_v11_0.c
> index 11780e4d7e9f..8d46ebadfa46 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2973,7 +2973,7 @@ static int dce_v11_0_sw_fini(void *handle)
>  {
>  	struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>=20=20
> -	kfree(adev->mode_info.bios_hardcoded_edid);
> +	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
>=20=20
>  	drm_kms_helper_poll_fini(adev_to_drm(adev));
>=20=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v6_0.c
> index 05c0df97f01d..f08dc6a3886f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2745,7 +2745,7 @@ static int dce_v6_0_sw_fini(void *handle)
>  {
>  	struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>=20=20
> -	kfree(adev->mode_info.bios_hardcoded_edid);
> +	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
>=20=20
>  	drm_kms_helper_poll_fini(adev_to_drm(adev));
>=20=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v8_0.c
> index dc73e301d937..a6a3adf2ae13 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2766,7 +2766,7 @@ static int dce_v8_0_sw_fini(void *handle)
>  {
>  	struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>=20=20
> -	kfree(adev->mode_info.bios_hardcoded_edid);
> +	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
>=20=20
>  	drm_kms_helper_poll_fini(adev_to_drm(adev));

--=20
Jani Nikula, Intel
