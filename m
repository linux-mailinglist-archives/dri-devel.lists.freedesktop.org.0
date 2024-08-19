Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD910956605
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C87A10E215;
	Mon, 19 Aug 2024 08:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eV3PHSwC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E2010E215;
 Mon, 19 Aug 2024 08:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724057513; x=1755593513;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=K4bpOnMgWezDoSJV6qPawntjUwnRc7zKGqc1iWsmrBo=;
 b=eV3PHSwCKr0LFlvA9rBMulrB6dbIM/PTxpJgd0aEmHUR5gfvUalLTyH1
 pHktgX5jbp+WfF62/O5qxHboyHhmM0m89+4+p182i/ZogXfyvjRDNFsJj
 S8ZDa3LYH4coSELpmcLzdJ4+iyWWlOUyV6pWFRQF39A6ufuI6chWCKFTc
 QvVDKrlAnAYuhqbemwiANUS4Jeu3XVGe7zMWsF3KSs1vs4KxQQc/ce3AC
 l3pYvm9y+zlUQ+Uw8gOVf/Ee7ZbmlMmIxNTX6TT1OfvqrkAxhj96BGy2e
 GakEB2v0aCBAOS75HuvHJhiwkAJbdFLaWF6z9BBxkOa3jzPLwAcdDeZsj A==;
X-CSE-ConnectionGUID: fJFQQJiRTxuxKtMUhqxkzQ==
X-CSE-MsgGUID: 9zVYGadJT9ea0Lhwf4pNXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22452339"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22452339"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:51:53 -0700
X-CSE-ConnectionGUID: WitLYzOlTICPt3kVPrY0kg==
X-CSE-MsgGUID: 36UFvXIPRHK/t5Xzt4cifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60360540"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:51:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Subject: Re: [PATCH] drm/radeon: Switch radeon_connector to struct drm_edid
In-Reply-To: <20240818-radeon-drm_edid-v1-1-4b7fdd19132e@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240818-radeon-drm_edid-v1-1-4b7fdd19132e@weissschuh.net>
Date: Mon, 19 Aug 2024 11:51:45 +0300
Message-ID: <87y14s6gke.fsf@intel.com>
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

On Sun, 18 Aug 2024, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:
> "struct drm_edid" is the safe and recommended alternative to "struct edid=
".
>
> Rename the member to make sure that no usage sites are missed,
> as "struct drm_edid" has some restrictions, for example it can not be
> used with kfree().
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> This is only compile-tested.
> ---
>  drivers/gpu/drm/radeon/radeon_audio.c      |  4 +--
>  drivers/gpu/drm/radeon/radeon_combios.c    |  4 +--
>  drivers/gpu/drm/radeon/radeon_connectors.c | 54 +++++++++++++++---------=
------
>  drivers/gpu/drm/radeon/radeon_mode.h       |  5 ++-
>  4 files changed, 33 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/rade=
on/radeon_audio.c
> index 47aa06a9a942..59d0e47c94d0 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.c
> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> @@ -311,7 +311,7 @@ static void radeon_audio_write_sad_regs(struct drm_en=
coder *encoder)
>  	if (!connector)
>  		return;
>=20=20
> -	sad_count =3D drm_edid_to_sad(radeon_connector->edid, &sads);
> +	sad_count =3D drm_edid_to_sad(drm_edid_raw(radeon_connector->drm_edid),=
 &sads);

The drm_edid_raw() usages could use a FIXME comment; eventually we want
all of them gone too.

>  	if (sad_count < 0)
>  		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
>  	if (sad_count <=3D 0)
> @@ -335,7 +335,7 @@ static void radeon_audio_write_speaker_allocation(str=
uct drm_encoder *encoder)
>  	if (!connector)
>  		return;
>=20=20
> -	sad_count =3D drm_edid_to_speaker_allocation(radeon_connector->edid, &s=
adb);
> +	sad_count =3D drm_edid_to_speaker_allocation(drm_edid_raw(radeon_connec=
tor->drm_edid), &sadb);
>  	if (sad_count < 0) {
>  		DRM_DEBUG("Couldn't read Speaker Allocation Data Block: %d\n",
>  			  sad_count);
> diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/ra=
deon/radeon_combios.c
> index df8d7f56b028..f4947acd0419 100644
> --- a/drivers/gpu/drm/radeon/radeon_combios.c
> +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> @@ -390,10 +390,10 @@ bool radeon_combios_check_hardcoded_edid(struct rad=
eon_device *rdev)
>  }
>=20=20
>  /* this is used for atom LCDs as well */
> -struct edid *
> +const struct drm_edid *
>  radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
>  {
> -	return drm_edid_duplicate(drm_edid_raw(rdev->mode_info.bios_hardcoded_e=
did));
> +	return drm_edid_dup(rdev->mode_info.bios_hardcoded_edid);
>  }
>=20=20
>  static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_dev=
ice *rdev,
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm=
/radeon/radeon_connectors.c
> index 528a8f3677c2..87a78c8e09c0 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -261,7 +261,7 @@ static void radeon_connector_get_edid(struct drm_conn=
ector *connector)
>  	struct radeon_device *rdev =3D dev->dev_private;
>  	struct radeon_connector *radeon_connector =3D to_radeon_connector(conne=
ctor);
>=20=20
> -	if (radeon_connector->edid)
> +	if (radeon_connector->drm_edid)
>  		return;
>=20=20
>  	/* on hw with routers, select right port */
> @@ -271,8 +271,8 @@ static void radeon_connector_get_edid(struct drm_conn=
ector *connector)
>  	if ((radeon_connector_encoder_get_dp_bridge_encoder_id(connector) !=3D
>  	     ENCODER_OBJECT_ID_NONE) &&
>  	    radeon_connector->ddc_bus->has_aux) {
> -		radeon_connector->edid =3D drm_get_edid(connector,
> -						      &radeon_connector->ddc_bus->aux.ddc);
> +		radeon_connector->drm_edid =3D drm_edid_read_ddc(connector,
> +							       &radeon_connector->ddc_bus->aux.ddc);
>  	} else if ((connector->connector_type =3D=3D DRM_MODE_CONNECTOR_Display=
Port) ||
>  		   (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)) {
>  		struct radeon_connector_atom_dig *dig =3D radeon_connector->con_priv;
> @@ -280,22 +280,22 @@ static void radeon_connector_get_edid(struct drm_co=
nnector *connector)
>  		if ((dig->dp_sink_type =3D=3D CONNECTOR_OBJECT_ID_DISPLAYPORT ||
>  		     dig->dp_sink_type =3D=3D CONNECTOR_OBJECT_ID_eDP) &&
>  		    radeon_connector->ddc_bus->has_aux)
> -			radeon_connector->edid =3D drm_get_edid(&radeon_connector->base,
> -							      &radeon_connector->ddc_bus->aux.ddc);
> +			radeon_connector->drm_edid =3D drm_edid_read_ddc(&radeon_connector->b=
ase,
> +								       &radeon_connector->ddc_bus->aux.ddc);
>  		else if (radeon_connector->ddc_bus)
> -			radeon_connector->edid =3D drm_get_edid(&radeon_connector->base,
> -							      &radeon_connector->ddc_bus->adapter);
> +			radeon_connector->drm_edid =3D drm_edid_read_ddc(&radeon_connector->b=
ase,
> +								       &radeon_connector->ddc_bus->adapter);
>  	} else if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_D=
DC &&
>  		   connector->connector_type =3D=3D DRM_MODE_CONNECTOR_LVDS &&
>  		   radeon_connector->ddc_bus) {
> -		radeon_connector->edid =3D drm_get_edid_switcheroo(&radeon_connector->=
base,
> -								 &radeon_connector->ddc_bus->adapter);
> +		radeon_connector->drm_edid =3D drm_edid_read_ddc(&radeon_connector->ba=
se,
> +							       &radeon_connector->ddc_bus->adapter);

drm_edid_read_switcheroo()!


>  	} else if (radeon_connector->ddc_bus) {
> -		radeon_connector->edid =3D drm_get_edid(&radeon_connector->base,
> -						      &radeon_connector->ddc_bus->adapter);
> +		radeon_connector->drm_edid =3D drm_edid_read_ddc(&radeon_connector->ba=
se,
> +							       &radeon_connector->ddc_bus->adapter);
>  	}
>=20=20
> -	if (!radeon_connector->edid) {
> +	if (!radeon_connector->drm_edid) {
>  		/* don't fetch the edid from the vbios if ddc fails and runpm is
>  		 * enabled so we report disconnected.
>  		 */
> @@ -306,20 +306,22 @@ static void radeon_connector_get_edid(struct drm_co=
nnector *connector)
>  			/* some laptops provide a hardcoded edid in rom for LCDs */
>  			if (((connector->connector_type =3D=3D DRM_MODE_CONNECTOR_LVDS) ||
>  			     (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)))
> -				radeon_connector->edid =3D radeon_bios_get_hardcoded_edid(rdev);
> +				radeon_connector->drm_edid =3D radeon_bios_get_hardcoded_edid(rdev);
>  		} else {
>  			/* some servers provide a hardcoded edid in rom for KVMs */
> -			radeon_connector->edid =3D radeon_bios_get_hardcoded_edid(rdev);
> +			radeon_connector->drm_edid =3D radeon_bios_get_hardcoded_edid(rdev);
>  		}
>  	}
> +
> +	drm_edid_connector_update(&radeon_connector->base, radeon_connector->dr=
m_edid);
>  }
>=20=20
>  static void radeon_connector_free_edid(struct drm_connector *connector)
>  {
>  	struct radeon_connector *radeon_connector =3D to_radeon_connector(conne=
ctor);
>=20=20
> -	kfree(radeon_connector->edid);
> -	radeon_connector->edid =3D NULL;
> +	drm_edid_free(radeon_connector->drm_edid);
> +	radeon_connector->drm_edid =3D NULL;
>  }
>=20=20
>  static int radeon_ddc_get_modes(struct drm_connector *connector)
> @@ -327,12 +329,12 @@ static int radeon_ddc_get_modes(struct drm_connecto=
r *connector)
>  	struct radeon_connector *radeon_connector =3D to_radeon_connector(conne=
ctor);
>  	int ret;
>=20=20
> -	if (radeon_connector->edid) {
> -		drm_connector_update_edid_property(connector, radeon_connector->edid);
> -		ret =3D drm_add_edid_modes(connector, radeon_connector->edid);
> +	if (radeon_connector->drm_edid) {
> +		drm_edid_connector_update(connector, radeon_connector->drm_edid);
> +		ret =3D drm_edid_connector_add_modes(connector);
>  		return ret;
>  	}
> -	drm_connector_update_edid_property(connector, NULL);
> +	drm_edid_connector_update(connector, NULL);

The whole thing above can be simplified, as the functions handle NULL
parameters just fine.

>  	return 0;
>  }
>=20=20
> @@ -869,7 +871,7 @@ radeon_lvds_detect(struct drm_connector *connector, b=
ool force)
>=20=20
>  	/* check for edid as well */
>  	radeon_connector_get_edid(connector);
> -	if (radeon_connector->edid)
> +	if (radeon_connector->drm_edid)
>  		ret =3D connector_status_connected;
>  	/* check acpi lid status ??? */
>=20=20
> @@ -1012,13 +1014,12 @@ radeon_vga_detect(struct drm_connector *connector=
, bool force)
>  		radeon_connector_free_edid(connector);
>  		radeon_connector_get_edid(connector);
>=20=20
> -		if (!radeon_connector->edid) {
> +		if (!radeon_connector->drm_edid) {
>  			DRM_ERROR("%s: probed a monitor but no|invalid EDID\n",
>  					connector->name);
>  			ret =3D connector_status_connected;
>  		} else {
> -			radeon_connector->use_digital =3D
> -				!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
> +			radeon_connector->use_digital =3D drm_edid_is_digital(radeon_connecto=
r->drm_edid);
>=20=20
>  			/* some oems have boards with separate digital and analog connectors
>  			 * with a shared ddc line (often vga + hdmi)
> @@ -1270,7 +1271,7 @@ radeon_dvi_detect(struct drm_connector *connector, =
bool force)
>  		radeon_connector_free_edid(connector);
>  		radeon_connector_get_edid(connector);
>=20=20
> -		if (!radeon_connector->edid) {
> +		if (!radeon_connector->drm_edid) {
>  			DRM_ERROR("%s: probed a monitor but no|invalid EDID\n",
>  					connector->name);
>  			/* rs690 seems to have a problem with connectors not existing and alw=
ays
> @@ -1286,8 +1287,7 @@ radeon_dvi_detect(struct drm_connector *connector, =
bool force)
>  				broken_edid =3D true; /* defer use_digital to later */
>  			}
>  		} else {
> -			radeon_connector->use_digital =3D
> -				!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
> +			radeon_connector->use_digital =3D drm_edid_is_digital(radeon_connecto=
r->drm_edid);
>=20=20
>  			/* some oems have boards with separate digital and analog connectors
>  			 * with a shared ddc line (often vga + hdmi)
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeo=
n/radeon_mode.h
> index 421c83fc70dc..ae1d91cd93ec 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -38,7 +38,6 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-algo-bit.h>
>=20=20
> -struct edid;
>  struct drm_edid;
>  struct radeon_bo;
>  struct radeon_device;
> @@ -521,7 +520,7 @@ struct radeon_connector {
>  	bool use_digital;
>  	/* we need to mind the EDID between detect
>  	   and get modes due to analog/digital/tvencoder */
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>  	void *con_priv;
>  	bool dac_load_detect;
>  	bool detected_by_load; /* if the connection status was determined by lo=
ad */
> @@ -843,7 +842,7 @@ radeon_get_crtc_scanout_position(struct drm_crtc *crt=
c, bool in_vblank_irq,
>  				 const struct drm_display_mode *mode);
>=20=20
>  extern bool radeon_combios_check_hardcoded_edid(struct radeon_device *rd=
ev);
> -extern struct edid *
> +extern const struct drm_edid *
>  radeon_bios_get_hardcoded_edid(struct radeon_device *rdev);
>  extern bool radeon_atom_get_clock_info(struct drm_device *dev);
>  extern bool radeon_combios_get_clock_info(struct drm_device *dev);
>
> ---
> base-commit: 19cff16559a4f2d763faf4f8392bf86d3a21b93c
> change-id: 20240818-radeon-drm_edid-9f0cec36e227
>
> Best regards,

--=20
Jani Nikula, Intel
