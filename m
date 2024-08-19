Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18962956590
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CF910E1F3;
	Mon, 19 Aug 2024 08:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W98k5AYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942A210E1EF;
 Mon, 19 Aug 2024 08:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724055999; x=1755591999;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=RIRM+xjz5yzyB4NfxyuogaqXsk6cGmXaZHC+BFkxCxw=;
 b=W98k5AYJ/5jhg8L0CYY2bZn+ic/iuWDcqjl4zuJvntfveDFMzf3n8c5Y
 dRhB1DuNSGQ215vKYNdupaiOWpwSzTLPkRuLJDlQSwou91PSgb9JYr5ty
 OR0Jr0mTWWJqZztVcDeWB+8RbVHhFLjYLvwWX9CmXFBjcWTXpjIv2zgjK
 35b5Q72P0KizwZ5H3sbuWFKpYAKMj/06sA2LM5lQW9LPcgQSwMeajQ5i2
 t78j/VOZwOXV6GMJ26nHryMC0d7cCq76/pp03VNrFoOKJRTEcui5gRFAw
 xmvkOI2ng+MBMR0G9QvNiXhbrlclvytnURKGq6fyG4tO82PXXxsRFFDip A==;
X-CSE-ConnectionGUID: kYN76oAdSYue0OWMGQ5WOg==
X-CSE-MsgGUID: s2HS9BxJQ1S6TLsAq+epBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22449112"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22449112"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:26:38 -0700
X-CSE-ConnectionGUID: JjXHIvhoQ1WQXMub3g77RA==
X-CSE-MsgGUID: +R7EZ4MkS9KsVgiX3cbwvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60870332"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.70])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:26:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, jinzh <jinzh@github.amd.com>, Aric Cyr
 <Aric.Cyr@amd.com>, Alan Liu <HaoPing.Liu@amd.com>, Tony Cheng
 <Tony.Cheng@amd.com>, Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH 09/12] drm/amd/display: Switch amdgpu_dm_connector to
 struct drm_edid
In-Reply-To: <20240818-amdgpu-drm_edid-v1-9-aea66c1f7cf4@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
 <20240818-amdgpu-drm_edid-v1-9-aea66c1f7cf4@weissschuh.net>
Date: Mon, 19 Aug 2024 11:26:27 +0300
Message-ID: <874j7g7wb0.fsf@intel.com>
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
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 70 ++++++++++++----=
------
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  5 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 26 ++++----
>  3 files changed, 53 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bd9a1a21720e..961f4f308dc7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3426,7 +3426,7 @@ void amdgpu_dm_update_connector_after_detect(
>  			aconnector->dc_sink =3D sink;
>  			dc_sink_retain(aconnector->dc_sink);
>  			amdgpu_dm_update_freesync_caps(connector,
> -					aconnector->edid);
> +					aconnector->drm_edid);
>  		} else {
>  			amdgpu_dm_update_freesync_caps(connector, NULL);
>  			if (!aconnector->dc_sink) {
> @@ -3485,18 +3485,18 @@ void amdgpu_dm_update_connector_after_detect(
>  		aconnector->dc_sink =3D sink;
>  		dc_sink_retain(aconnector->dc_sink);
>  		if (sink->dc_edid.length =3D=3D 0) {
> -			aconnector->edid =3D NULL;
> +			aconnector->drm_edid =3D NULL;
>  			if (aconnector->dc_link->aux_mode) {
>  				drm_dp_cec_unset_edid(
>  					&aconnector->dm_dp_aux.aux);
>  			}
>  		} else {
> -			aconnector->edid =3D
> -				(struct edid *)sink->dc_edid.raw_edid;
> +			aconnector->drm_edid =3D drm_edid_alloc(sink->dc_edid.raw_edid,
> +							      sink->dc_edid.length);
>=20=20
>  			if (aconnector->dc_link->aux_mode)
>  				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
> -						    aconnector->edid);
> +						    drm_edid_raw(aconnector->drm_edid));
>  		}
>=20=20
>  		if (!aconnector->timing_requested) {
> @@ -3507,8 +3507,8 @@ void amdgpu_dm_update_connector_after_detect(
>  					"failed to create aconnector->requested_timing\n");
>  		}
>=20=20
> -		drm_connector_update_edid_property(connector, aconnector->edid);
> -		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
> +		drm_edid_connector_update(connector, aconnector->drm_edid);
> +		amdgpu_dm_update_freesync_caps(connector, aconnector->drm_edid);
>  		update_connector_ext_caps(aconnector);
>  	} else {
>  		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
> @@ -3517,7 +3517,7 @@ void amdgpu_dm_update_connector_after_detect(
>  		aconnector->num_modes =3D 0;
>  		dc_sink_release(aconnector->dc_sink);
>  		aconnector->dc_sink =3D NULL;
> -		aconnector->edid =3D NULL;
> +		aconnector->drm_edid =3D NULL;
>  		kfree(aconnector->timing_requested);
>  		aconnector->timing_requested =3D NULL;
>  		/* Set CP to DESIRED if it was ENABLED, so we can re-enable it again o=
n hotplug */
> @@ -7016,7 +7016,7 @@ static void amdgpu_dm_connector_funcs_force(struct =
drm_connector *connector)
>  	struct amdgpu_dm_connector *aconnector =3D to_amdgpu_dm_connector(conne=
ctor);
>  	struct dc_link *dc_link =3D aconnector->dc_link;
>  	struct dc_sink *dc_em_sink =3D aconnector->dc_em_sink;
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>  	struct i2c_adapter *ddc;
>=20=20
>  	if (dc_link && dc_link->aux_mode)
> @@ -7025,23 +7025,25 @@ static void amdgpu_dm_connector_funcs_force(struc=
t drm_connector *connector)
>  		ddc =3D &aconnector->i2c->base;
>=20=20
>  	/*
> -	 * Note: drm_get_edid gets edid in the following order:
> +	 * Note: drm_edid_read_ddc gets edid in the following order:
>  	 * 1) override EDID if set via edid_override debugfs,
>  	 * 2) firmware EDID if set via edid_firmware module parameter
>  	 * 3) regular DDC read.
>  	 */
> -	edid =3D drm_get_edid(connector, ddc);
> -	if (!edid) {
> +	drm_edid =3D drm_edid_read_ddc(connector, ddc);
> +	if (!drm_edid) {
>  		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
>  		return;
>  	}
>=20=20
> -	aconnector->edid =3D edid;
> +	aconnector->drm_edid =3D drm_edid;
>=20=20
>  	/* Update emulated (virtual) sink's EDID */
>  	if (dc_em_sink && dc_link) {
>  		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
> -		memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * E=
DID_LENGTH);
> +		memmove(dc_em_sink->dc_edid.raw_edid,
> +			drm_edid_raw(drm_edid),
> +			(drm_edid_raw(drm_edid)->extensions + 1) * EDID_LENGTH);
>  		dm_helpers_parse_edid_caps(
>  			dc_link,
>  			&dc_em_sink->dc_edid,
> @@ -7076,7 +7078,7 @@ static void create_eml_sink(struct amdgpu_dm_connec=
tor *aconnector)
>  			.link =3D aconnector->dc_link,
>  			.sink_signal =3D SIGNAL_TYPE_VIRTUAL
>  	};
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>  	struct i2c_adapter *ddc;
>=20=20
>  	if (dc_link->aux_mode)
> @@ -7085,25 +7087,25 @@ static void create_eml_sink(struct amdgpu_dm_conn=
ector *aconnector)
>  		ddc =3D &aconnector->i2c->base;
>=20=20
>  	/*
> -	 * Note: drm_get_edid gets edid in the following order:
> +	 * Note: drm_edid_read_ddc gets edid in the following order:
>  	 * 1) override EDID if set via edid_override debugfs,
>  	 * 2) firmware EDID if set via edid_firmware module parameter
>  	 * 3) regular DDC read.
>  	 */
> -	edid =3D drm_get_edid(connector, ddc);
> -	if (!edid) {
> +	drm_edid =3D drm_edid_read_ddc(connector, ddc);
> +	if (!drm_edid) {
>  		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
>  		return;
>  	}
>=20=20
> -	if (drm_detect_hdmi_monitor(edid))
> +	if (connector->display_info.is_hdmi)
>  		init_params.sink_signal =3D SIGNAL_TYPE_HDMI_TYPE_A;

You need to drm_edid_connector_update() to update
connector->display_info with the EDID info.

BR,
Jani.

>=20=20
> -	aconnector->edid =3D edid;
> +	aconnector->drm_edid =3D drm_edid;
>=20=20
>  	aconnector->dc_em_sink =3D dc_link_add_remote_sink(
>  		aconnector->dc_link,
> -		edid,
> +		drm_edid_raw(drm_edid),
>  		&init_params);
>=20=20
>  	if (aconnector->base.force =3D=3D DRM_FORCE_ON) {
> @@ -7786,16 +7788,17 @@ static void amdgpu_set_panel_orientation(struct d=
rm_connector *connector)
>  }
>=20=20
>  static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *conn=
ector,
> -					      struct edid *edid)
> +					      const struct drm_edid *drm_edid)
>  {
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =3D
>  			to_amdgpu_dm_connector(connector);
>=20=20
> -	if (edid) {
> +	if (drm_edid) {
>  		/* empty probed_modes */
>  		INIT_LIST_HEAD(&connector->probed_modes);
> +		drm_edid_connector_update(connector, drm_edid);
>  		amdgpu_dm_connector->num_modes =3D
> -				drm_add_edid_modes(connector, edid);
> +				drm_edid_connector_add_modes(connector);
>=20=20
>  		/* sorting the probed modes before calling function
>  		 * amdgpu_dm_get_native_mode() since EDID can have
> @@ -7809,10 +7812,10 @@ static void amdgpu_dm_connector_ddc_get_modes(str=
uct drm_connector *connector,
>  		amdgpu_dm_get_native_mode(connector);
>=20=20
>  		/* Freesync capabilities are reset by calling
> -		 * drm_add_edid_modes() and need to be
> +		 * drm_connector_edid_add_modes() and need to be
>  		 * restored here.
>  		 */
> -		amdgpu_dm_update_freesync_caps(connector, edid);
> +		amdgpu_dm_update_freesync_caps(connector, drm_edid);
>  	} else {
>  		amdgpu_dm_connector->num_modes =3D 0;
>  	}
> @@ -7908,12 +7911,12 @@ static uint add_fs_modes(struct amdgpu_dm_connect=
or *aconnector)
>  }
>=20=20
>  static void amdgpu_dm_connector_add_freesync_modes(struct drm_connector =
*connector,
> -						   struct edid *edid)
> +						   const struct drm_edid *drm_edid)
>  {
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =3D
>  		to_amdgpu_dm_connector(connector);
>=20=20
> -	if (!(amdgpu_freesync_vid_mode && edid))
> +	if (!(amdgpu_freesync_vid_mode && drm_edid))
>  		return;
>=20=20
>  	if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 1=
0)
> @@ -7926,24 +7929,24 @@ static int amdgpu_dm_connector_get_modes(struct d=
rm_connector *connector)
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =3D
>  			to_amdgpu_dm_connector(connector);
>  	struct drm_encoder *encoder;
> -	struct edid *edid =3D amdgpu_dm_connector->edid;
> +	const struct drm_edid *drm_edid =3D amdgpu_dm_connector->drm_edid;
>  	struct dc_link_settings *verified_link_cap =3D
>  			&amdgpu_dm_connector->dc_link->verified_link_cap;
>  	const struct dc *dc =3D amdgpu_dm_connector->dc_link->dc;
>=20=20
>  	encoder =3D amdgpu_dm_connector_to_encoder(connector);
>=20=20
> -	if (!drm_edid_is_valid(edid)) {
> +	if (!drm_edid_valid(drm_edid)) {
>  		amdgpu_dm_connector->num_modes =3D
>  				drm_add_modes_noedid(connector, 640, 480);
>  		if (dc->link_srv->dp_get_encoding_format(verified_link_cap) =3D=3D DP_=
128b_132b_ENCODING)
>  			amdgpu_dm_connector->num_modes +=3D
>  				drm_add_modes_noedid(connector, 1920, 1080);
>  	} else {
> -		amdgpu_dm_connector_ddc_get_modes(connector, edid);
> +		amdgpu_dm_connector_ddc_get_modes(connector, drm_edid);
>  		if (encoder)
>  			amdgpu_dm_connector_add_common_modes(encoder, connector);
> -		amdgpu_dm_connector_add_freesync_modes(connector, edid);
> +		amdgpu_dm_connector_add_freesync_modes(connector, drm_edid);
>  	}
>  	amdgpu_dm_fbc_init(connector);
>=20=20
> @@ -11953,12 +11956,13 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm=
_connector *aconnector,
>   * FreeSync parameters.
>   */
>  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> -				    const struct edid *edid)
> +				    const struct drm_edid *drm_edid)
>  {
>  	int i =3D 0;
>  	const struct detailed_timing *timing;
>  	const struct detailed_non_pixel *data;
>  	const struct detailed_data_monitor_range *range;
> +	const struct edid *edid =3D drm_edid_raw(drm_edid);
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =3D
>  			to_amdgpu_dm_connector(connector);
>  	struct dm_connector_state *dm_con_state =3D NULL;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 27c0017707dd..c49cc0170fc5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -81,6 +81,7 @@ struct amdgpu_bo;
>  struct dmub_srv;
>  struct dc_plane_state;
>  struct dmub_notification;
> +struct drm_edid;
>=20=20
>  struct amd_vsdb_block {
>  	unsigned char ieee_id[3];
> @@ -673,7 +674,7 @@ struct amdgpu_dm_connector {
>=20=20
>  	/* we need to mind the EDID between detect
>  	   and get modes due to analog/digital/tvencoder */
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>=20=20
>  	/* shared with amdgpu */
>  	struct amdgpu_hpd hpd;
> @@ -951,7 +952,7 @@ void dm_restore_drm_connector_state(struct drm_device=
 *dev,
>  				    struct drm_connector *connector);
>=20=20
>  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> -					const struct edid *edid);
> +				    const struct drm_edid *drm_edid);
>=20=20
>  void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>=20=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 25e98d248c21..cd03108db28b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -129,7 +129,7 @@ dm_dp_mst_connector_destroy(struct drm_connector *con=
nector)
>  		dc_sink_release(aconnector->dc_sink);
>  	}
>=20=20
> -	kfree(aconnector->edid);
> +	kfree(aconnector->drm_edid);
>=20=20
>  	drm_connector_cleanup(connector);
>  	drm_dp_mst_put_port_malloc(aconnector->mst_output_port);
> @@ -182,7 +182,7 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_c=
onnector *connector)
>=20=20
>  		dc_sink_release(dc_sink);
>  		aconnector->dc_sink =3D NULL;
> -		aconnector->edid =3D NULL;
> +		aconnector->drm_edid =3D NULL;
>  		aconnector->dsc_aux =3D NULL;
>  		port->passthrough_aux =3D NULL;
>  	}
> @@ -302,12 +302,13 @@ static int dm_dp_mst_get_modes(struct drm_connector=
 *connector)
>  	if (!aconnector)
>  		return drm_add_edid_modes(connector, NULL);
>=20=20
> -	if (!aconnector->edid) {
> -		struct edid *edid;
> +	if (!aconnector->drm_edid) {
> +		const struct drm_edid *drm_edid;
>=20=20
> -		edid =3D drm_dp_mst_get_edid(connector, &aconnector->mst_root->mst_mgr=
, aconnector->mst_output_port);
> +		drm_edid =3D drm_dp_mst_edid_read(connector, &aconnector->mst_root->ms=
t_mgr,
> +						aconnector->mst_output_port);
>=20=20
> -		if (!edid) {
> +		if (!drm_edid) {
>  			amdgpu_dm_set_mst_status(&aconnector->mst_status,
>  			MST_REMOTE_EDID, false);
>=20=20
> @@ -344,7 +345,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *=
connector)
>  			return ret;
>  		}
>=20=20
> -		aconnector->edid =3D edid;
> +		aconnector->drm_edid =3D drm_edid;
>  		amdgpu_dm_set_mst_status(&aconnector->mst_status,
>  			MST_REMOTE_EDID, true);
>  	}
> @@ -361,7 +362,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *=
connector)
>  				.sink_signal =3D SIGNAL_TYPE_DISPLAY_PORT_MST };
>  		dc_sink =3D dc_link_add_remote_sink(
>  			aconnector->dc_link,
> -			aconnector->edid,
> +			drm_edid_raw(aconnector->drm_edid),
>  			&init_params);
>=20=20
>  		if (!dc_sink) {
> @@ -403,7 +404,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *=
connector)
>=20=20
>  		if (aconnector->dc_sink) {
>  			amdgpu_dm_update_freesync_caps(
> -					connector, aconnector->edid);
> +					connector, aconnector->drm_edid);
>=20=20
>  #if defined(CONFIG_DRM_AMD_DC_FP)
>  			if (!validate_dsc_caps_on_connector(aconnector))
> @@ -417,10 +418,9 @@ static int dm_dp_mst_get_modes(struct drm_connector =
*connector)
>  		}
>  	}
>=20=20
> -	drm_connector_update_edid_property(
> -					&aconnector->base, aconnector->edid);
> +	drm_edid_connector_update(&aconnector->base, aconnector->drm_edid);
>=20=20
> -	ret =3D drm_add_edid_modes(connector, aconnector->edid);
> +	ret =3D drm_edid_connector_add_modes(connector);
>=20=20
>  	return ret;
>  }
> @@ -498,7 +498,7 @@ dm_dp_mst_detect(struct drm_connector *connector,
>=20=20
>  		dc_sink_release(aconnector->dc_sink);
>  		aconnector->dc_sink =3D NULL;
> -		aconnector->edid =3D NULL;
> +		aconnector->drm_edid =3D NULL;
>  		aconnector->dsc_aux =3D NULL;
>  		port->passthrough_aux =3D NULL;

--=20
Jani Nikula, Intel
