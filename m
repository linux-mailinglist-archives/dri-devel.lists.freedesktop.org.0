Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC93FC4BB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 11:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF77F89BF8;
	Tue, 31 Aug 2021 09:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8B08975F;
 Tue, 31 Aug 2021 09:30:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="218155870"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="218155870"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 02:30:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="540942463"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.211.207])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 02:30:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Anisse Astier <anisse@astier.eu>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Hans de
 Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>, Daniel
 Dadap <ddadap@nvidia.com>, Anisse Astier <anisse@astier.eu>
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915/opregion: add support for
 mailbox #5 EDID
In-Reply-To: <20210817204329.5457-2-anisse@astier.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210817204329.5457-1-anisse@astier.eu>
 <20210817204329.5457-2-anisse@astier.eu>
Date: Tue, 31 Aug 2021 12:30:12 +0300
Message-ID: <87sfyqarmj.fsf@intel.com>
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

On Tue, 17 Aug 2021, Anisse Astier <anisse@astier.eu> wrote:
> The ACPI OpRegion Mailbox #5 ASLE extension may contain an EDID to be
> used for the embedded display. Add support for using it via by adding
> the EDID to the list of available modes on the connector, and use it for
> eDP when available.
>
> If a panel's EDID is broken, there may be an override EDID set in the
> ACPI OpRegion mailbox #5. Use it if available.
>
> Fixes the GPD Win Max laptop display, which seems to only use this
> mechanism to provide a proper EDID for its eDP screen. It would have
> been better to provide the EDID through the ACPI _DDC method instead, to
> have a more generic solution, but it seems the designers of this system
> did not consider it, and shipped the firmware without it.

The question is whether the opregion EDID should be used for override or
fallback. The patch at hand is kind of neither, it just unconditionally
adds the modes from the opregion EDID to the connector. For your
display, they apparently end up also being the only mode(s), with one of
them being used as the fixed mode. (Otherwise the orientation quirk
wouldn't work.)

What does drm_get_edid() return for you? Maybe we should do something
like this instead:
=20
 	mutex_lock(&dev->mode_config.mutex);
 	edid =3D drm_get_edid(connector, &intel_dp->aux.ddc);
+	if (!edid)
+		edid =3D intel_opregion_get_edid(intel_connector);
 	if (edid) {
 		if (drm_add_edid_modes(connector, edid)) {
 			drm_connector_update_edid_property(connector, edid);

This way we'll actually use all the other bits in the EDID, not just the
modes. And if it needs to become override rather than fallback, the
solution is:

 	mutex_lock(&dev->mode_config.mutex);
-	edid =3D drm_get_edid(connector, &intel_dp->aux.ddc);
+	edid =3D intel_opregion_get_edid(intel_connector);
+	if (!edid)
+		edid =3D drm_get_edid(connector, &intel_dp->aux.ddc);
 	if (edid) {
 		if (drm_add_edid_modes(connector, edid)) {
 			drm_connector_update_edid_property(connector, edid);

In any case, I think it's just plain wrong to use both the display and
opregion EDIDs at the same time. It's probably all around safer to start
with fallback.

Please find some further comments inline.

> Based on original patch series by: Jani Nikula <jani.nikula@intel.com>
> https://patchwork.kernel.org/project/intel-gfx/patch/20200828061941.17051=
-1-jani.nikula@intel.com/
>
> Changes since Jani Nikula's series:
>  - EDID is copied and validated with drm_edid_is_valid
>  - Mode is now added via drm_add_edid_modes instead of using override
>    mechanism
>  - squashed the two patches
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c       |  3 +
>  drivers/gpu/drm/i915/display/intel_opregion.c | 69 ++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_opregion.h |  8 +++
>  3 files changed, 79 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 75d4ebc66941..f9254c0df1a2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5183,6 +5183,9 @@ static bool intel_edp_init_connector(struct intel_d=
p *intel_dp,
>  		goto out_vdd_off;
>  	}
>=20=20
> +	/* Set up override EDID, if any, from ACPI OpRegion */
> +	intel_opregion_edid_probe(intel_connector);
> +
>  	mutex_lock(&dev->mode_config.mutex);
>  	edid =3D drm_get_edid(connector, &intel_dp->aux.ddc);
>  	if (edid) {
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/=
drm/i915/display/intel_opregion.c
> index 3855fba70980..b1b87ed758ba 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.c
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.c
> @@ -196,6 +196,8 @@ struct opregion_asle_ext {
>  #define ASLE_IUER_WINDOWS_BTN		(1 << 1)
>  #define ASLE_IUER_POWER_BTN		(1 << 0)
>=20=20
> +#define ASLE_PHED_EDID_VALID_MASK	0x3
> +
>  /* Software System Control Interrupt (SWSCI) */
>  #define SWSCI_SCIC_INDICATOR		(1 << 0)
>  #define SWSCI_SCIC_MAIN_FUNCTION_SHIFT	1
> @@ -909,8 +911,10 @@ int intel_opregion_setup(struct drm_i915_private *de=
v_priv)
>  		opregion->asle->ardy =3D ASLE_ARDY_NOT_READY;
>  	}
>=20=20
> -	if (mboxes & MBOX_ASLE_EXT)
> +	if (mboxes & MBOX_ASLE_EXT) {
>  		drm_dbg(&dev_priv->drm, "ASLE extension supported\n");
> +		opregion->asle_ext =3D base + OPREGION_ASLE_EXT_OFFSET;
> +	}
>=20=20
>  	if (intel_load_vbt_firmware(dev_priv) =3D=3D 0)
>  		goto out;
> @@ -1037,6 +1041,68 @@ intel_opregion_get_panel_type(struct drm_i915_priv=
ate *dev_priv)
>  	return ret - 1;
>  }
>=20=20
> +/**
> + * intel_opregion_edid_probe - Add EDID from ACPI OpRegion mailbox #5
> + * @intel_connector: eDP connector
> + *
> + * This reads the ACPI Opregion mailbox #5 to extract the EDID that is p=
assed
> + * to it.
> + *
> + * Will take a lock on the DRM mode_config to add the EDID; make sure it=
 isn't
> + * called with lock taken.
> + *
> + */
> +void intel_opregion_edid_probe(struct intel_connector *intel_connector)

With what I proposed this would become:

struct edid *intel_opregion_get_edid(struct intel_connector *intel_connecto=
r)

> +{
> +	struct drm_connector *connector =3D &intel_connector->base;
> +	struct drm_i915_private *i915 =3D to_i915(connector->dev);
> +	struct intel_opregion *opregion =3D &i915->opregion;
> +	const void *in_edid;
> +	const struct edid *edid;
> +	struct edid *new_edid;
> +	int len, ret, num;
> +
> +	if (!opregion->asle_ext || connector->override_edid)

I don't think ->override_edid can actually be true at this point.

> +		return;
> +
> +	in_edid =3D opregion->asle_ext->bddc;
> +
> +	/* Validity corresponds to number of 128-byte blocks */
> +	len =3D (opregion->asle_ext->phed & ASLE_PHED_EDID_VALID_MASK) * 128;
> +	if (!len || !memchr_inv(in_edid, 0, len))
> +		return;
> +
> +	edid =3D in_edid;
> +
> +	if (len < EDID_LENGTH * (1 + edid->extensions)) {
> +		drm_dbg_kms(&i915->drm, "Invalid EDID in ACPI OpRegion (Mailbox #5)\n"=
);
> +		return;
> +	}
> +	new_edid =3D drm_edid_duplicate(edid);
> +	if (!new_edid) {
> +		drm_err(&i915->drm, "Cannot duplicate EDID\n");

In general, it's useless to try to debug print kmalloc errors.

> +		return;
> +	}
> +	if (!drm_edid_is_valid(new_edid)) {
> +		kfree(new_edid);
> +		drm_dbg_kms(&i915->drm, "Cannot validate EDID in ACPI OpRegion (Mailbo=
x #5)\n");

Please just say the EDID is invalid. "Cannot validate" seems like we
weren't able to check.

> +		return;
> +	}
> +
> +	ret =3D drm_connector_update_edid_property(connector, new_edid);
> +	if (ret) {
> +		kfree(new_edid);
> +		return;
> +	}
> +
> +	mutex_lock(&connector->dev->mode_config.mutex);
> +	num =3D drm_add_edid_modes(connector, new_edid);
> +	mutex_unlock(&connector->dev->mode_config.mutex);

The above parts would go away with my proposal.

> +
> +	drm_dbg_kms(&i915->drm, "Using OpRegion EDID for [CONNECTOR:%d:%s], add=
ed %d mode(s)\n",
> +		    connector->base.id, connector->name, num);

It's customary to have [CONNECTOR:%d:%s] as the first thing in the debug
log; it's easier to look for in dmesg.

> +}
> +
>  void intel_opregion_register(struct drm_i915_private *i915)
>  {
>  	struct intel_opregion *opregion =3D &i915->opregion;
> @@ -1130,6 +1196,7 @@ void intel_opregion_unregister(struct drm_i915_priv=
ate *i915)
>  	opregion->acpi =3D NULL;
>  	opregion->swsci =3D NULL;
>  	opregion->asle =3D NULL;
> +	opregion->asle_ext =3D NULL;
>  	opregion->vbt =3D NULL;
>  	opregion->lid_state =3D NULL;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/=
drm/i915/display/intel_opregion.h
> index 4aa68ffbd30e..c1ecfcbb6f55 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.h
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.h
> @@ -29,12 +29,14 @@
>  #include <linux/pci.h>
>=20=20
>  struct drm_i915_private;
> +struct intel_connector;
>  struct intel_encoder;
>=20=20
>  struct opregion_header;
>  struct opregion_acpi;
>  struct opregion_swsci;
>  struct opregion_asle;
> +struct opregion_asle_ext;
>=20=20
>  struct intel_opregion {
>  	struct opregion_header *header;
> @@ -43,6 +45,7 @@ struct intel_opregion {
>  	u32 swsci_gbda_sub_functions;
>  	u32 swsci_sbcb_sub_functions;
>  	struct opregion_asle *asle;
> +	struct opregion_asle_ext *asle_ext;
>  	void *rvda;
>  	void *vbt_firmware;
>  	const void *vbt;
> @@ -71,6 +74,7 @@ int intel_opregion_notify_encoder(struct intel_encoder =
*intel_encoder,
>  int intel_opregion_notify_adapter(struct drm_i915_private *dev_priv,
>  				  pci_power_t state);
>  int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
> +void intel_opregion_edid_probe(struct intel_connector *connector);
>=20=20
>  #else /* CONFIG_ACPI*/
>=20=20
> @@ -117,6 +121,10 @@ static inline int intel_opregion_get_panel_type(stru=
ct drm_i915_private *dev)
>  	return -ENODEV;
>  }
>=20=20
> +void intel_opregion_edid_probe(struct intel_connector *connector)
> +{
> +}
> +

static inline

>  #endif /* CONFIG_ACPI */
>=20=20
>  #endif

--=20
Jani Nikula, Intel Open Source Graphics Center
