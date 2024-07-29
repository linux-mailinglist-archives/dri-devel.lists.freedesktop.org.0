Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9C993EADF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530D210E174;
	Mon, 29 Jul 2024 02:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hPUCSepG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AF810E174;
 Mon, 29 Jul 2024 02:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wQBluRrrGt01dD+afPUtEvpBKftOTj+eAINuCpJCm4I=; b=hPUCSepGeopynqjMCAQlnYF2ME
 0t+A2GI+KBfpb55y1CIbS/4g72EI6lh4C+q9rFYDIHKHgSMxGkxx1piIIlZOv+xEH1s9n3JiCce5B
 W13Wp/M9cNngf0addZZ1BZbE91FSZxT5GTqYczbUbTApau/qbWxz9G4cAh4oFRtS9k/v6ekidqXIP
 5hWQn4UynXRY81dhjc63s07xQgTgXTPqU6M6La+NQIAORTB6n0q8HaNLARLCHSjqTBYVYwlKs54TD
 rK7kYRFTkv4kOKfJ/aJvOp0XfryBSMebh0VKPpSMq89E2+oL5jqFaNXKJjWs7d3IHWst09/X5Astn
 BwjvoFuw==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sYFgP-003Jpz-Lu; Mon, 29 Jul 2024 04:00:18 +0200
Date: Sun, 28 Jul 2024 22:59:53 -0300
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, Mario Limonciello <mario.limonciello@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4 02/11] drm/amd/display: switch amdgpu_dm_connector to
 use struct drm_edid
Message-ID: <uemy2trmj43jhtzimd7jqvoajvn3snmxvcajw52rxdyfvftrfd@jpaxtb7q7qme>
References: <20240706034004.801329-1-mwen@igalia.com>
 <20240706034004.801329-3-mwen@igalia.com>
 <d1cce2ee-f12b-4d37-8729-5ff22cb64550@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1cce2ee-f12b-4d37-8729-5ff22cb64550@amd.com>
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

On 07/25, Alex Hung wrote:
> Please see inline comments.
> 
> On 2024-07-05 21:35, Melissa Wen wrote:
> > Replace raw edid handling (struct edid) with the opaque EDID type
> > (struct drm_edid) on amdgpu_dm_connector for consistency. It may also
> > prevent mismatch of approaches in different parts of the driver code.
> > Working in progress. It was only exercised with IGT tests.
> > 
> > v2: use const to fix warnings (Alex Hung)
> > v3: fix general protection fault on mst
> > v4: rename edid to drm_edid in amdgpu_connector (Jani)
> >      call drm_edid_connector_update to clear edid in case of NULL (Jani)
> >      keep setting NULL instead of free drm_edid (Jani)
> >      check drm_edid not NULL, instead of valid (Jani)
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 106 +++++++++---------
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
> >   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  13 ++-
> >   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  32 +++---
> >   4 files changed, 79 insertions(+), 76 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 1dfa7ec9af35..49b8c5b00728 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -3408,7 +3408,7 @@ void amdgpu_dm_update_connector_after_detect(
> >   			aconnector->dc_sink = sink;
> >   			dc_sink_retain(aconnector->dc_sink);
> >   			amdgpu_dm_update_freesync_caps(connector,
> > -					aconnector->edid);
> > +					aconnector->drm_edid);
> >   		} else {
> >   			amdgpu_dm_update_freesync_caps(connector, NULL);
> >   			if (!aconnector->dc_sink) {
> > @@ -3467,18 +3467,20 @@ void amdgpu_dm_update_connector_after_detect(
> >   		aconnector->dc_sink = sink;
> >   		dc_sink_retain(aconnector->dc_sink);
> >   		if (sink->dc_edid.length == 0) {
> > -			aconnector->edid = NULL;
> > +			aconnector->drm_edid = NULL;
> >   			if (aconnector->dc_link->aux_mode) {
> >   				drm_dp_cec_unset_edid(
> >   					&aconnector->dm_dp_aux.aux);
> >   			}
> >   		} else {
> > -			aconnector->edid =
> > -				(struct edid *)sink->dc_edid.raw_edid;
> > +			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
> > +			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
> > +			drm_edid_connector_update(connector, aconnector->drm_edid);
> > +			/* FIXME: Get rid of drm_edid_raw() */
> >   			if (aconnector->dc_link->aux_mode)
> >   				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
> > -						    aconnector->edid);
> Why not pass edid but drm_edid_raw(aconnector->drm_edid)?

ack. Indeed, I can use edid directly.

My intention was to keep the code with drm_edid closer to the original
with edid as an element of aconnector, but this function call will be
removed in the next patch and then the comment will be wrong placed.
> 
> > +						    drm_edid_raw(aconnector->drm_edid));
> >   		}
> >   		if (!aconnector->timing_requested) {
> > @@ -3489,17 +3491,18 @@ void amdgpu_dm_update_connector_after_detect(
> >   					"failed to create aconnector->requested_timing\n");
> >   		}
> > -		drm_connector_update_edid_property(connector, aconnector->edid);
> > -		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
> > +		drm_edid_connector_update(connector, aconnector->drm_edid);
> > +		amdgpu_dm_update_freesync_caps(connector, aconnector->drm_edid);
> >   		update_connector_ext_caps(aconnector);
> >   	} else {
> >   		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
> >   		amdgpu_dm_update_freesync_caps(connector, NULL);
> > -		drm_connector_update_edid_property(connector, NULL);
> > +		drm_edid_connector_update(connector, NULL);
> >   		aconnector->num_modes = 0;
> >   		dc_sink_release(aconnector->dc_sink);
> >   		aconnector->dc_sink = NULL;
> > -		aconnector->edid = NULL;
> > +		drm_edid_free(aconnector->drm_edid);
> > +		aconnector->drm_edid = NULL;
> >   		kfree(aconnector->timing_requested);
> >   		aconnector->timing_requested = NULL;
> >   		/* Set CP to DESIRED if it was ENABLED, so we can re-enable it again on hotplug */
> > @@ -7002,13 +7005,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
> >   	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
> >   	struct dc_link *dc_link = aconnector->dc_link;
> >   	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
> > -	struct edid *edid;
> > -	struct i2c_adapter *ddc;
> > -
> > -	if (dc_link && dc_link->aux_mode)
> > -		ddc = &aconnector->dm_dp_aux.aux.ddc;
> > -	else
> > -		ddc = &aconnector->i2c->base;
> > +	const struct drm_edid *drm_edid;
> >   	/*
> >   	 * Note: drm_get_edid gets edid in the following order:
> > @@ -7016,18 +7013,20 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
> >   	 * 2) firmware EDID if set via edid_firmware module parameter
> >   	 * 3) regular DDC read.
> >   	 */
> > -	edid = drm_get_edid(connector, ddc);
> drm_get_edid() is removed here, and thhe above comments should be removed as
> well.

ack.

> 
> > -	if (!edid) {
> > +	drm_edid = drm_edid_read(connector);
> > +	drm_edid_connector_update(connector, drm_edid);
> > +	if (!drm_edid) {
> >   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
> >   		return;
> >   	}
> > -	aconnector->edid = edid;
> > -
> > +	aconnector->drm_edid = drm_edid;
> >   	/* Update emulated (virtual) sink's EDID */
> >   	if (dc_em_sink && dc_link) {
> > +		const struct edid *edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> > +
> >   		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
> > -		memmove(dc_em_sink->dc_edid.raw_edid, edid, (edid->extensions + 1) * EDID_LENGTH);
> > +		memmove(dc_em_sink->dc_edid.raw_edid, (uint8_t *)edid, (edid->extensions + 1) * EDID_LENGTH);
> 
> is casting to (uint8 *) necessary?

hmm.. probably not. I'll double check.

Thanks

> 
> >   		dm_helpers_parse_edid_caps(
> >   			dc_link,
> >   			&dc_em_sink->dc_edid,
> > @@ -7057,18 +7056,12 @@ static int get_modes(struct drm_connector *connector)
> >   static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
> >   {
> >   	struct drm_connector *connector = &aconnector->base;
> > -	struct dc_link *dc_link = aconnector->dc_link;
> >   	struct dc_sink_init_data init_params = {
> >   			.link = aconnector->dc_link,
> >   			.sink_signal = SIGNAL_TYPE_VIRTUAL
> >   	};
> > -	struct edid *edid;
> > -	struct i2c_adapter *ddc;
> > -
> > -	if (dc_link->aux_mode)
> > -		ddc = &aconnector->dm_dp_aux.aux.ddc;
> > -	else
> > -		ddc = &aconnector->i2c->base;
> > +	const struct drm_edid *drm_edid;
> > +	const struct edid *edid;
> >   	/*
> >   	 * Note: drm_get_edid gets edid in the following order:
> > @@ -7076,17 +7069,19 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
> >   	 * 2) firmware EDID if set via edid_firmware module parameter
> >   	 * 3) regular DDC read.
> >   	 */
> > -	edid = drm_get_edid(connector, ddc);
> 
> drm_get_edid() is removed here, and thhe above comments should be removed as
> well.

ack.

> 
> > -	if (!edid) {
> > +	drm_edid = drm_edid_read(connector);
> > +	drm_edid_connector_update(connector, drm_edid);
> > +	if (!drm_edid) {
> >   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
> >   		return;
> >   	}
> > -	if (drm_detect_hdmi_monitor(edid))
> > +	if (connector->display_info.is_hdmi)
> >   		init_params.sink_signal = SIGNAL_TYPE_HDMI_TYPE_A;
> > -	aconnector->edid = edid;
> > +	aconnector->drm_edid = drm_edid;
> > +	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> >   	aconnector->dc_em_sink = dc_link_add_remote_sink(
> >   		aconnector->dc_link,
> >   		(uint8_t *)edid,
> > @@ -7770,16 +7765,16 @@ static void amdgpu_set_panel_orientation(struct drm_connector *connector)
> >   }
> >   static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
> > -					      struct edid *edid)
> > +					      const struct drm_edid *drm_edid)
> >   {
> >   	struct amdgpu_dm_connector *amdgpu_dm_connector =
> >   			to_amdgpu_dm_connector(connector);
> > -	if (edid) {
> > +	if (drm_edid) {
> >   		/* empty probed_modes */
> >   		INIT_LIST_HEAD(&connector->probed_modes);
> >   		amdgpu_dm_connector->num_modes =
> > -				drm_add_edid_modes(connector, edid);
> > +				drm_edid_connector_add_modes(connector);
> >   		/* sorting the probed modes before calling function
> >   		 * amdgpu_dm_get_native_mode() since EDID can have
> > @@ -7793,10 +7788,10 @@ static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
> >   		amdgpu_dm_get_native_mode(connector);
> >   		/* Freesync capabilities are reset by calling
> > -		 * drm_add_edid_modes() and need to be
> > +		 * drm_edid_connector_add_modes() and need to be
> >   		 * restored here.
> >   		 */
> > -		amdgpu_dm_update_freesync_caps(connector, edid);
> > +		amdgpu_dm_update_freesync_caps(connector, drm_edid);
> >   	} else {
> >   		amdgpu_dm_connector->num_modes = 0;
> >   	}
> > @@ -7892,12 +7887,12 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
> >   }
> >   static void amdgpu_dm_connector_add_freesync_modes(struct drm_connector *connector,
> > -						   struct edid *edid)
> > +						   const struct drm_edid *drm_edid)
> >   {
> >   	struct amdgpu_dm_connector *amdgpu_dm_connector =
> >   		to_amdgpu_dm_connector(connector);
> > -	if (!(amdgpu_freesync_vid_mode && edid))
> > +	if (!(amdgpu_freesync_vid_mode && drm_edid))
> >   		return;
> >   	if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
> > @@ -7910,24 +7905,24 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
> >   	struct amdgpu_dm_connector *amdgpu_dm_connector =
> >   			to_amdgpu_dm_connector(connector);
> >   	struct drm_encoder *encoder;
> > -	struct edid *edid = amdgpu_dm_connector->edid;
> > +	const struct drm_edid *drm_edid = amdgpu_dm_connector->drm_edid;
> >   	struct dc_link_settings *verified_link_cap =
> >   			&amdgpu_dm_connector->dc_link->verified_link_cap;
> >   	const struct dc *dc = amdgpu_dm_connector->dc_link->dc;
> >   	encoder = amdgpu_dm_connector_to_encoder(connector);
> > -	if (!drm_edid_is_valid(edid)) {
> > +	if (!drm_edid) {
> >   		amdgpu_dm_connector->num_modes =
> >   				drm_add_modes_noedid(connector, 640, 480);
> >   		if (dc->link_srv->dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
> >   			amdgpu_dm_connector->num_modes +=
> >   				drm_add_modes_noedid(connector, 1920, 1080);
> >   	} else {
> > -		amdgpu_dm_connector_ddc_get_modes(connector, edid);
> > +		amdgpu_dm_connector_ddc_get_modes(connector, drm_edid);
> >   		if (encoder)
> >   			amdgpu_dm_connector_add_common_modes(encoder, connector);
> > -		amdgpu_dm_connector_add_freesync_modes(connector, edid);
> > +		amdgpu_dm_connector_add_freesync_modes(connector, drm_edid);
> >   	}
> >   	amdgpu_dm_fbc_init(connector);
> > @@ -11867,7 +11862,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
> >   }
> >   static void parse_edid_displayid_vrr(struct drm_connector *connector,
> > -		struct edid *edid)
> > +				     const struct edid *edid)
> >   {
> >   	u8 *edid_ext = NULL;
> >   	int i;
> > @@ -11910,7 +11905,7 @@ static void parse_edid_displayid_vrr(struct drm_connector *connector,
> >   }
> >   static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> > -			  struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> > +			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> >   {
> >   	u8 *edid_ext = NULL;
> >   	int i;
> > @@ -11945,7 +11940,8 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> >   }
> >   static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> > -		struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> > +			       const struct edid *edid,
> > +			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
> >   {
> >   	u8 *edid_ext = NULL;
> >   	int i;
> > @@ -11987,19 +11983,19 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> >    * FreeSync parameters.
> >    */
> >   void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> > -				    struct edid *edid)
> > +				    const struct drm_edid *drm_edid)
> >   {
> >   	int i = 0;
> > -	struct detailed_timing *timing;
> > -	struct detailed_non_pixel *data;
> > -	struct detailed_data_monitor_range *range;
> > +	const struct detailed_timing *timing;
> > +	const struct detailed_non_pixel *data;
> > +	const struct detailed_data_monitor_range *range;
> >   	struct amdgpu_dm_connector *amdgpu_dm_connector =
> >   			to_amdgpu_dm_connector(connector);
> >   	struct dm_connector_state *dm_con_state = NULL;
> >   	struct dc_sink *sink;
> > -
> >   	struct amdgpu_device *adev = drm_to_adev(connector->dev);
> >   	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
> > +	const struct edid *edid;
> >   	bool freesync_capable = false;
> >   	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
> > @@ -12012,7 +12008,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >   		amdgpu_dm_connector->dc_sink :
> >   		amdgpu_dm_connector->dc_em_sink;
> > -	if (!edid || !sink) {
> > +	if (!drm_edid || !sink) {
> >   		dm_con_state = to_dm_connector_state(connector->state);
> >   		amdgpu_dm_connector->min_vfreq = 0;
> > @@ -12029,6 +12025,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >   	if (!adev->dm.freesync_module)
> >   		goto update;
> > +	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> > +
> >   	/* Some eDP panels only have the refresh rate range info in DisplayID */
> >   	if ((connector->display_info.monitor_range.min_vfreq == 0 ||
> >   	     connector->display_info.monitor_range.max_vfreq == 0))
> > @@ -12105,7 +12103,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >   			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
> >   		}
> > -	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> > +	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> >   		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> >   		if (i >= 0 && vsdb_info.freesync_supported) {
> >   			amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index 5fd1b6b44577..2aff4c4b76de 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -658,7 +658,7 @@ struct amdgpu_dm_connector {
> >   	/* we need to mind the EDID between detect
> >   	   and get modes due to analog/digital/tvencoder */
> > -	struct edid *edid;
> > +	const struct drm_edid *drm_edid;
> >   	/* shared with amdgpu */
> >   	struct amdgpu_hpd hpd;
> > @@ -936,7 +936,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
> >   				    struct drm_connector *connector);
> >   void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> > -					struct edid *edid);
> > +				    const struct drm_edid *drm_edid);
> >   void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > index b490ae67b6be..be72f14f5429 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > @@ -897,7 +897,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
> >   	struct i2c_adapter *ddc;
> >   	int retry = 3;
> >   	enum dc_edid_status edid_status;
> > -	struct edid *edid;
> > +	const struct drm_edid *drm_edid;
> > +	const struct edid *edid;
> >   	if (link->aux_mode)
> >   		ddc = &aconnector->dm_dp_aux.aux.ddc;
> > @@ -909,25 +910,27 @@ enum dc_edid_status dm_helpers_read_local_edid(
> >   	 */
> >   	do {
> > -		edid = drm_get_edid(&aconnector->base, ddc);
> > +		drm_edid = drm_edid_read_ddc(connector, ddc);
> > +		drm_edid_connector_update(connector, drm_edid);
> >   		/* DP Compliance Test 4.2.2.6 */
> >   		if (link->aux_mode && connector->edid_corrupt)
> >   			drm_dp_send_real_edid_checksum(&aconnector->dm_dp_aux.aux, connector->real_edid_checksum);
> > -		if (!edid && connector->edid_corrupt) {
> > +		if (!drm_edid && connector->edid_corrupt) {
> >   			connector->edid_corrupt = false;
> >   			return EDID_BAD_CHECKSUM;
> >   		}
> > -		if (!edid)
> > +		if (!drm_edid)
> >   			return EDID_NO_RESPONSE;
> > +		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> >   		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
> >   		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
> >   		/* We don't need the original edid anymore */
> > -		kfree(edid);
> > +		drm_edid_free(drm_edid);
> >   		edid_status = dm_helpers_parse_edid_caps(
> >   						link,
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 5442da90f508..b0d307e5dd72 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -129,7 +129,7 @@ dm_dp_mst_connector_destroy(struct drm_connector *connector)
> >   		dc_sink_release(aconnector->dc_sink);
> >   	}
> > -	kfree(aconnector->edid);
> > +	drm_edid_free(aconnector->drm_edid);
> >   	drm_connector_cleanup(connector);
> >   	drm_dp_mst_put_port_malloc(aconnector->mst_output_port);
> > @@ -182,7 +182,7 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
> >   		dc_sink_release(dc_sink);
> >   		aconnector->dc_sink = NULL;
> > -		aconnector->edid = NULL;
> > +		aconnector->drm_edid = NULL;
> >   		aconnector->dsc_aux = NULL;
> >   		port->passthrough_aux = NULL;
> >   	}
> > @@ -302,16 +302,16 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
> >   	if (!aconnector)
> >   		return drm_add_edid_modes(connector, NULL);
> > -	if (!aconnector->edid) {
> > -		struct edid *edid;
> > +	if (!aconnector->drm_edid) {
> > +		const struct drm_edid *drm_edid;
> > -		edid = drm_dp_mst_get_edid(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
> > +		drm_edid = drm_dp_mst_edid_read(connector, &aconnector->mst_root->mst_mgr, aconnector->mst_output_port);
> > -		if (!edid) {
> > +		if (!drm_edid) {
> >   			amdgpu_dm_set_mst_status(&aconnector->mst_status,
> >   			MST_REMOTE_EDID, false);
> > -			drm_connector_update_edid_property(
> > +			drm_edid_connector_update(
> >   				&aconnector->base,
> >   				NULL);
> > @@ -345,7 +345,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
> >   			return ret;
> >   		}
> > -		aconnector->edid = edid;
> > +		aconnector->drm_edid = drm_edid;
> >   		amdgpu_dm_set_mst_status(&aconnector->mst_status,
> >   			MST_REMOTE_EDID, true);
> >   	}
> > @@ -360,10 +360,13 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
> >   		struct dc_sink_init_data init_params = {
> >   				.link = aconnector->dc_link,
> >   				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
> > +		const struct edid *edid;
> > +
> > +		edid = drm_edid_raw(aconnector->drm_edid); // FIXME: Get rid of drm_edid_raw()
> >   		dc_sink = dc_link_add_remote_sink(
> >   			aconnector->dc_link,
> > -			(uint8_t *)aconnector->edid,
> > -			(aconnector->edid->extensions + 1) * EDID_LENGTH,
> > +			(uint8_t *)edid,
> > +			(edid->extensions + 1) * EDID_LENGTH,
> >   			&init_params);
> >   		if (!dc_sink) {
> > @@ -405,7 +408,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
> >   		if (aconnector->dc_sink) {
> >   			amdgpu_dm_update_freesync_caps(
> > -					connector, aconnector->edid);
> > +					connector, aconnector->drm_edid);
> >   #if defined(CONFIG_DRM_AMD_DC_FP)
> >   			if (!validate_dsc_caps_on_connector(aconnector))
> > @@ -419,10 +422,9 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
> >   		}
> >   	}
> > -	drm_connector_update_edid_property(
> > -					&aconnector->base, aconnector->edid);
> > +	drm_edid_connector_update(&aconnector->base, aconnector->drm_edid);
> > -	ret = drm_add_edid_modes(connector, aconnector->edid);
> > +	ret = drm_edid_connector_add_modes(connector);
> >   	return ret;
> >   }
> > @@ -500,7 +502,7 @@ dm_dp_mst_detect(struct drm_connector *connector,
> >   		dc_sink_release(aconnector->dc_sink);
> >   		aconnector->dc_sink = NULL;
> > -		aconnector->edid = NULL;
> > +		aconnector->drm_edid = NULL;
> >   		aconnector->dsc_aux = NULL;
> >   		port->passthrough_aux = NULL;
