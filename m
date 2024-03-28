Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEC288FB9A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E487210E4B6;
	Thu, 28 Mar 2024 09:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IY9JFm5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABEC10E4F1;
 Thu, 28 Mar 2024 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711618437; x=1743154437;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=a9iok8BxaJLdBErrVnB+rdMebOtPy+aRrKjczKXelsk=;
 b=IY9JFm5vgsOAsKWDW1wyrT6rkQVRG0xJ5Q4/NVDJC/34TZJSVJsRBQY1
 99ZTxu/HImfDoLEYDiXsEPP13caSkvjBLfX7rgx4C6P+Jl0+XfHwXC6+e
 tvK2YIrlAHuVUJJ7iMsvQmvYqZgNopiKyj04fOIPDW/JhbD8Unavr3+eM
 l7xT9UFsssGNJACUCS4MV7VolDYYNwkEsKxGus4iEOOKPp1MZPKJGkxu+
 7wHhfbiCaxTE/OF3nmvF5traRafy3NaJucxqP6UiB0z2Jr7awgpwz2AyX
 pmRCdPnj39jJgP4qEph3yM0XeBnb5qkaPp954NUejH+c6c/7IVdRjmIkM Q==;
X-CSE-ConnectionGUID: XIr0OU4cSkePeWedP+uiEw==
X-CSE-MsgGUID: ESZNviNHRPCeNGvS+8Z9ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="24210214"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="24210214"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:33:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="17001540"
Received: from abdulqaf-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.57.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:33:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, Alex Hung <alex.hung@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v3 3/6] drm/amd/display: switch amdgpu_dm_connector
 to use struct drm_edid
In-Reply-To: <20240327214953.367126-4-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240327214953.367126-1-mwen@igalia.com>
 <20240327214953.367126-4-mwen@igalia.com>
Date: Thu, 28 Mar 2024 11:33:50 +0200
Message-ID: <87wmpmg0ox.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 27 Mar 2024, Melissa Wen <mwen@igalia.com> wrote:
> Replace raw edid handling (struct edid) with the opaque EDID type
> (struct drm_edid) on amdgpu_dm_connector for consistency. It may also
> prevent mismatch of approaches in different parts of the driver code.
> Working in progress. It was only exercised with IGT tests.
>
> v2: use const to fix warnings (Alex Hung)
> v3: fix general protection fault on mst
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 99 +++++++++----------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  4 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  8 +-
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 24 ++---
>  4 files changed, 67 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 280562707cd0..bbbf9c9d40d5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3269,18 +3269,19 @@ void amdgpu_dm_update_connector_after_detect(
>  		aconnector->dc_sink = sink;
>  		dc_sink_retain(aconnector->dc_sink);
>  		if (sink->dc_edid.length == 0) {
> -			aconnector->edid = NULL;
> +			drm_edid_free(aconnector->edid);

If aconnector->edid is used as some kind of cache, it might be prudent
to still set it to NULL.

It's up to the amd maintainers, but personally I've renamed any ->edid
fields to ->drm_edid when I've done these conversions to ensure every
single place is covered, and also later stable backports will give a
build failure if the change is not taken into account.

>  			if (aconnector->dc_link->aux_mode) {
>  				drm_dp_cec_unset_edid(
>  					&aconnector->dm_dp_aux.aux);
>  			}
>  		} else {
> -			aconnector->edid =
> -				(struct edid *)sink->dc_edid.raw_edid;
> +			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
> +			aconnector->edid = drm_edid_alloc(edid, sink->dc_edid.length);
>  
> +			/* FIXME: Get rid of drm_edid_raw() */
>  			if (aconnector->dc_link->aux_mode)
>  				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
> -						    aconnector->edid);
> +						    drm_edid_raw(aconnector->edid));

The goal should be to switch to use CEC functions that take the source
physical address directly instead of parsing the EDID.

>  		}
>  
>  		if (!aconnector->timing_requested) {
> @@ -3291,17 +3292,17 @@ void amdgpu_dm_update_connector_after_detect(
>  					"failed to create aconnector->requested_timing\n");
>  		}
>  
> -		drm_connector_update_edid_property(connector, aconnector->edid);
> +		drm_edid_connector_update(connector, aconnector->edid);
>  		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
>  		update_connector_ext_caps(aconnector);
>  	} else {
>  		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
>  		amdgpu_dm_update_freesync_caps(connector, NULL);
> -		drm_connector_update_edid_property(connector, NULL);
> +		drm_edid_connector_update(connector, NULL);
>  		aconnector->num_modes = 0;
>  		dc_sink_release(aconnector->dc_sink);
>  		aconnector->dc_sink = NULL;
> -		aconnector->edid = NULL;
> +		drm_edid_free(aconnector->edid);
>  		kfree(aconnector->timing_requested);
>  		aconnector->timing_requested = NULL;
>  		/* Set CP to DESIRED if it was ENABLED, so we can re-enable it again on hotplug */
> @@ -6661,13 +6662,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>  	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>  	struct dc_link *dc_link = aconnector->dc_link;
>  	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
> -	struct edid *edid;
> -	struct i2c_adapter *ddc;
> -
> -	if (dc_link && dc_link->aux_mode)
> -		ddc = &aconnector->dm_dp_aux.aux.ddc;
> -	else
> -		ddc = &aconnector->i2c->base;
> +	const struct drm_edid *drm_edid;
>  
>  	/*
>  	 * Note: drm_get_edid gets edid in the following order:
> @@ -6675,18 +6670,20 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>  	 * 2) firmware EDID if set via edid_firmware module parameter
>  	 * 3) regular DDC read.
>  	 */
> -	edid = drm_get_edid(connector, ddc);
> -	if (!edid) {
> +	drm_edid = drm_edid_read(connector);

You should call drm_edid_connector_update() here to clear the EDID
property etc. if it's NULL.

Ditto everywhere.

Due to a historical mistake, drm_get_edid() does that for you, but
shouldn't really.

> +
> +	if (!drm_edid) {
>  		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
>  		return;
>  	}
> -
> -	aconnector->edid = edid;
> -
> +	aconnector->edid = drm_edid;
> +	drm_edid_connector_update(connector, drm_edid);
>  	/* Update emulated (virtual) sink's EDID */
>  	if (dc_em_sink && dc_link) {
> +		const struct edid *edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> +
>  		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
> -		memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
> +		memmove(dc_em_sink->dc_edid.raw_edid, (uint8_t *)edid, (edid->extensions + 1) * EDID_LENGTH);
>  		dm_helpers_parse_edid_caps(
>  			dc_link,
>  			&dc_em_sink->dc_edid,
> @@ -6716,18 +6713,12 @@ static int get_modes(struct drm_connector *connector)
>  static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>  {
>  	struct drm_connector *connector = &aconnector->base;
> -	struct dc_link *dc_link = aconnector->dc_link;
>  	struct dc_sink_init_data init_params = {
>  			.link = aconnector->dc_link,
>  			.sink_signal = SIGNAL_TYPE_VIRTUAL
>  	};
> -	struct edid *edid;
> -	struct i2c_adapter *ddc;
> -
> -	if (dc_link->aux_mode)
> -		ddc = &aconnector->dm_dp_aux.aux.ddc;
> -	else
> -		ddc = &aconnector->i2c->base;
> +	const struct drm_edid *drm_edid;
> +	const struct edid *edid;
>  
>  	/*
>  	 * Note: drm_get_edid gets edid in the following order:
> @@ -6735,17 +6726,19 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>  	 * 2) firmware EDID if set via edid_firmware module parameter
>  	 * 3) regular DDC read.
>  	 */
> -	edid = drm_get_edid(connector, ddc);
> -	if (!edid) {
> +	drm_edid = drm_edid_read(connector);
> +	if (!drm_edid) {
>  		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
>  		return;
>  	}
>  
> -	if (drm_detect_hdmi_monitor(edid))
> +	if (connector->display_info.is_hdmi)
>  		init_params.sink_signal = SIGNAL_TYPE_HDMI_TYPE_A;
>  
> -	aconnector->edid = edid;
> +	aconnector->edid = drm_edid;
> +	drm_edid_connector_update(connector, drm_edid);
>  
> +	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
>  	aconnector->dc_em_sink = dc_link_add_remote_sink(
>  		aconnector->dc_link,
>  		(uint8_t *)edid,
> @@ -7428,16 +7421,16 @@ static void amdgpu_set_panel_orientation(struct drm_connector *connector)
>  }
>  
>  static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
> -					      struct edid *edid)
> +					      const struct drm_edid *drm_edid)
>  {
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =
>  			to_amdgpu_dm_connector(connector);
>  
> -	if (edid) {
> +	if (drm_edid) {
>  		/* empty probed_modes */
>  		INIT_LIST_HEAD(&connector->probed_modes);
>  		amdgpu_dm_connector->num_modes =
> -				drm_add_edid_modes(connector, edid);
> +				drm_edid_connector_add_modes(connector);
>  
>  		/* sorting the probed modes before calling function
>  		 * amdgpu_dm_get_native_mode() since EDID can have
> @@ -7451,10 +7444,10 @@ static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
>  		amdgpu_dm_get_native_mode(connector);
>  
>  		/* Freesync capabilities are reset by calling
> -		 * drm_add_edid_modes() and need to be
> +		 * drm_edid_connector_add_modes() and need to be
>  		 * restored here.
>  		 */
> -		amdgpu_dm_update_freesync_caps(connector, edid);
> +		amdgpu_dm_update_freesync_caps(connector, drm_edid);
>  	} else {
>  		amdgpu_dm_connector->num_modes = 0;
>  	}
> @@ -7550,12 +7543,12 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
>  }
>  
>  static void amdgpu_dm_connector_add_freesync_modes(struct drm_connector *connector,
> -						   struct edid *edid)
> +						   const struct drm_edid *drm_edid)
>  {
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =
>  		to_amdgpu_dm_connector(connector);
>  
> -	if (!(amdgpu_freesync_vid_mode && edid))
> +	if (!(amdgpu_freesync_vid_mode && drm_edid))
>  		return;
>  
>  	if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
> @@ -7568,23 +7561,23 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =
>  			to_amdgpu_dm_connector(connector);
>  	struct drm_encoder *encoder;
> -	struct edid *edid = amdgpu_dm_connector->edid;
> +	const struct drm_edid *drm_edid = amdgpu_dm_connector->edid;
>  	struct dc_link_settings *verified_link_cap =
>  			&amdgpu_dm_connector->dc_link->verified_link_cap;
>  	const struct dc *dc = amdgpu_dm_connector->dc_link->dc;
>  
>  	encoder = amdgpu_dm_connector_to_encoder(connector);
>  
> -	if (!drm_edid_is_valid(edid)) {
> +	if (!drm_edid_valid(drm_edid)) {

I don't think there should be reasons to validate the EDID at this
point. The EDID reading functions do that, and any amd driver specific
mechanisms should do that separately before setting ->edid. So it should
be just a NULL check here.

>  		amdgpu_dm_connector->num_modes =
>  				drm_add_modes_noedid(connector, 640, 480);
>  		if (dc->link_srv->dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
>  			amdgpu_dm_connector->num_modes +=
>  				drm_add_modes_noedid(connector, 1920, 1080);
>  	} else {
> -		amdgpu_dm_connector_ddc_get_modes(connector, edid);
> +		amdgpu_dm_connector_ddc_get_modes(connector, drm_edid);
>  		amdgpu_dm_connector_add_common_modes(encoder, connector);
> -		amdgpu_dm_connector_add_freesync_modes(connector, edid);
> +		amdgpu_dm_connector_add_freesync_modes(connector, drm_edid);
>  	}
>  	amdgpu_dm_fbc_init(connector);
>  
> @@ -11153,7 +11146,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
>  }
>  
>  static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> -			  struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> +			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
>  {
>  	u8 *edid_ext = NULL;
>  	int i;
> @@ -11188,7 +11181,8 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>  }
>  
>  static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> -		struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> +			       const struct edid *edid,
> +			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
>  {
>  	u8 *edid_ext = NULL;
>  	int i;
> @@ -11230,19 +11224,19 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>   * FreeSync parameters.
>   */
>  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> -				    struct edid *edid)
> +				    const struct drm_edid *drm_edid)
>  {
>  	int i = 0;
> -	struct detailed_timing *timing;
> -	struct detailed_non_pixel *data;
> -	struct detailed_data_monitor_range *range;
> +	const struct detailed_timing *timing;
> +	const struct detailed_non_pixel *data;
> +	const struct detailed_data_monitor_range *range;
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =
>  			to_amdgpu_dm_connector(connector);
>  	struct dm_connector_state *dm_con_state = NULL;
>  	struct dc_sink *sink;
> -
>  	struct amdgpu_device *adev = drm_to_adev(connector->dev);
>  	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
> +	const struct edid *edid;
>  	bool freesync_capable = false;
>  	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
>  
> @@ -11255,7 +11249,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  		amdgpu_dm_connector->dc_sink :
>  		amdgpu_dm_connector->dc_em_sink;
>  
> -	if (!edid || !sink) {
> +	if (!drm_edid || !sink) {
>  		dm_con_state = to_dm_connector_state(connector->state);
>  
>  		amdgpu_dm_connector->min_vfreq = 0;
> @@ -11272,6 +11266,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  	if (!adev->dm.freesync_module)
>  		goto update;
>  
> +	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
>  	if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
>  		     sink->sink_signal == SIGNAL_TYPE_EDP)) {
>  		bool edid_check_required = false;
> @@ -11341,7 +11336,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
>  		}
>  
> -	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> +	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
>  		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
>  		if (i >= 0 && vsdb_info.freesync_supported) {
>  			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 67647bb5999b..384f68203590 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -637,7 +637,7 @@ struct amdgpu_dm_connector {
>  
>  	/* we need to mind the EDID between detect
>  	   and get modes due to analog/digital/tvencoder */
> -	struct edid *edid;
> +	const struct drm_edid *edid;

As I said, I'd make this drm_edid. But not my call.

BR,
Jani.

>  
>  	/* shared with amdgpu */
>  	struct amdgpu_hpd hpd;
> @@ -908,7 +908,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
>  				    struct drm_connector *connector);
>  
>  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> -					struct edid *edid);
> +				    const struct drm_edid *drm_edid);
>  
>  void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index c27063305a13..1a37dff9c2b6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -901,7 +901,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  	struct i2c_adapter *ddc;
>  	int retry = 3;
>  	enum dc_edid_status edid_status;
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
> +	const struct edid *edid;
>  
>  	if (link->aux_mode)
>  		ddc = &aconnector->dm_dp_aux.aux.ddc;
> @@ -913,7 +914,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  	 */
>  	do {
>  
> -		edid = drm_get_edid(&aconnector->base, ddc);
> +		drm_edid = drm_edid_read_ddc(connector, ddc);
> +		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
>  
>  		/* DP Compliance Test 4.2.2.6 */
>  		if (link->aux_mode && connector->edid_corrupt)
> @@ -931,7 +933,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
>  		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
>  
>  		/* We don't need the original edid anymore */
> -		kfree(edid);
> +		drm_edid_free(drm_edid);
>  
>  		edid_status = dm_helpers_parse_edid_caps(
>  						link,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 941e96f100f4..a28004f9378a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -128,7 +128,7 @@ dm_dp_mst_connector_destroy(struct drm_connector *connector)
>  		dc_sink_release(aconnector->dc_sink);
>  	}
>  
> -	kfree(aconnector->edid);
> +	drm_edid_free(aconnector->edid);
>  
>  	drm_connector_cleanup(connector);
>  	drm_dp_mst_put_port_malloc(aconnector->mst_output_port);
> @@ -298,15 +298,15 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>  		return drm_add_edid_modes(connector, NULL);
>  
>  	if (!aconnector->edid) {
> -		struct edid *edid;
> +		const struct drm_edid *drm_edid;
>  
> -		edid = drm_dp_mst_get_edid(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
> +		drm_edid = drm_dp_mst_edid_read(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
>  
> -		if (!edid) {
> +		if (!drm_edid) {
>  			amdgpu_dm_set_mst_status(&aconnector->mst_status,
>  			MST_REMOTE_EDID, false);
>  
> -			drm_connector_update_edid_property(
> +			drm_edid_connector_update(
>  				&aconnector->base,
>  				NULL);
>  
> @@ -340,7 +340,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>  			return ret;
>  		}
>  
> -		aconnector->edid = edid;
> +		aconnector->edid = drm_edid;
>  		amdgpu_dm_set_mst_status(&aconnector->mst_status,
>  			MST_REMOTE_EDID, true);
>  	}
> @@ -355,10 +355,13 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>  		struct dc_sink_init_data init_params = {
>  				.link = aconnector->dc_link,
>  				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
> +		const struct edid *edid;
> +
> +		edid = drm_edid_raw(aconnector->edid); // FIXME: Get rid of drm_edid_raw()
>  		dc_sink = dc_link_add_remote_sink(
>  			aconnector->dc_link,
> -			(uint8_t *)aconnector->edid,
> -			(aconnector->edid->extensions + 1) * EDID_LENGTH,
> +			(uint8_t *)edid,
> +			(edid->extensions + 1) * EDID_LENGTH,
>  			&init_params);
>  
>  		if (!dc_sink) {
> @@ -412,10 +415,9 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>  		}
>  	}
>  
> -	drm_connector_update_edid_property(
> -					&aconnector->base, aconnector->edid);
> +	drm_edid_connector_update(&aconnector->base, aconnector->edid);
>  
> -	ret = drm_add_edid_modes(connector, aconnector->edid);
> +	ret = drm_edid_connector_add_modes(connector);
>  
>  	return ret;
>  }

-- 
Jani Nikula, Intel
