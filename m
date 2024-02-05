Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D605B849D22
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 15:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2360A10E0FA;
	Mon,  5 Feb 2024 14:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="o4Wetk1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AC510E0FA;
 Mon,  5 Feb 2024 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JNb/J8lrs+XlI+ojGfX18cRoRCBHyVDkP/E+MSrJ1dM=; b=o4Wetk1m0HmsVKH0NW6Meyu8ya
 SfobbdYbjkT+0AARdkdpwXTT8XTtDFC7X9/11exyHUwfEBMShK2OA6mgmoRhqy+Kw4xSqNBoHcFWd
 sWc6HMz+aEHl0OB+Vn/VOuAnBm5DuTCTs6LIMCXADPHLWKg4trzlCit6OWJSODN6poJhDsqeXZin4
 H0Yy4h1IUsprUzZt6fMZ7g38mu/WMg/AuTlGOreF6YfV+SEgkCM0KGdtSBBQ1+PcGD12/4Ha51jiP
 xO+wwNQFPcpuAvrz6KNXjC8VQtoVSe/mvqpQdcillpoqccP4nU+2o7n5J5QM++a4Pj9Ru85OyIUpW
 UAMxmmuQ==;
Received: from [186.193.11.42] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rX02v-00E1WM-6p; Mon, 05 Feb 2024 15:34:05 +0100
Date: Mon, 5 Feb 2024 11:33:55 -0300
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, 
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [RFC PATCH 2/2] drm/amd/display: switch amdgpu_dm_connector to
 use struct drm_edid
Message-ID: <dymepvetr24jqqw6weszegqkynicj6k3tuq5dap7syy5rflf53@zz4n5oypze74>
References: <20240126163429.56714-1-mwen@igalia.com>
 <20240126163429.56714-3-mwen@igalia.com>
 <b5084ad7-8c5e-4ea7-8d0a-8fef27da31a2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5084ad7-8c5e-4ea7-8d0a-8fef27da31a2@amd.com>
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

On 01/26, Alex Hung wrote:
> 
> 
> On 2024-01-26 09:28, Melissa Wen wrote:
> > Replace raw edid handling (struct edid) with the opaque EDID type
> > (struct drm_edid) on amdgpu_dm_connector for consistency. It may also
> > prevent mismatch of approaches in different parts of the driver code.
> > Working in progress. There are a couple of cast warnings and it was only
> > tested with IGT.
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 63 ++++++++++---------
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  4 +-
> >   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  9 +--
> >   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 23 +++----
> >   4 files changed, 51 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 68e71e2ea472..741081d73bb3 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -3277,12 +3277,12 @@ void amdgpu_dm_update_connector_after_detect(
> >   					&aconnector->dm_dp_aux.aux);
> >   			}
> >   		} else {
> > -			aconnector->edid =
> > -				(struct edid *)sink->dc_edid.raw_edid;
> > +			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
> > +			aconnector->edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
> >   			if (aconnector->dc_link->aux_mode)
> >   				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
> > -						    aconnector->edid);
> > +						    drm_edid_raw(aconnector->edid));
> >   		}
> >   		if (!aconnector->timing_requested) {
> > @@ -3293,13 +3293,13 @@ void amdgpu_dm_update_connector_after_detect(
> >   					"failed to create aconnector->requested_timing\n");
> >   		}
> > -		drm_connector_update_edid_property(connector, aconnector->edid);
> > +		drm_edid_connector_update(connector, aconnector->edid);
> >   		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
> >   		update_connector_ext_caps(aconnector);
> >   	} else {
> >   		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
> >   		amdgpu_dm_update_freesync_caps(connector, NULL);
> > -		drm_connector_update_edid_property(connector, NULL);
> > +		drm_edid_connector_update(connector, NULL);
> >   		aconnector->num_modes = 0;
> >   		dc_sink_release(aconnector->dc_sink);
> >   		aconnector->dc_sink = NULL;
> > @@ -6564,7 +6564,6 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
> >   	struct dc_link *dc_link = aconnector->dc_link;
> >   	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
> >   	const struct drm_edid *drm_edid;
> > -	const struct edid *edid;
> >   	/*
> >   	 * Note: drm_get_edid gets edid in the following order:
> > @@ -6578,11 +6577,12 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
> >   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
> >   		return;
> >   	}
> > -	edid = drm_edid_raw(drm_edid);
> > -	aconnector->edid = edid;
> > -
> > +	aconnector->edid = drm_edid;
> > +	drm_edid_connector_update(connector, drm_edid);
> >   	/* Update emulated (virtual) sink's EDID */
> >   	if (dc_em_sink && dc_link) {
> > +		const struct edid *edid = drm_edid_raw(drm_edid);
> > +
> >   		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
> >   		memmove(dc_em_sink->dc_edid.raw_edid, (uint8_t *)edid, (edid->extensions + 1) * EDID_LENGTH);
> >   		dm_helpers_parse_edid_caps(
> > @@ -6633,13 +6633,13 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
> >   		return;
> >   	}
> > -	edid = drm_edid_raw(drm_edid);
> > -
> > -	if (drm_detect_hdmi_monitor(edid))
> > +	if (connector->display_info.is_hdmi)
> >   		init_params.sink_signal = SIGNAL_TYPE_HDMI_TYPE_A;
> > -	aconnector->edid = edid;
> > +	aconnector->edid = drm_edid;
> > +	drm_edid_connector_update(connector, drm_edid);
> > +	edid = drm_edid_raw(drm_edid);
> >   	aconnector->dc_em_sink = dc_link_add_remote_sink(
> >   		aconnector->dc_link,
> >   		(uint8_t *)edid,
> > @@ -7322,16 +7322,16 @@ static void amdgpu_set_panel_orientation(struct drm_connector *connector)
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
> > @@ -7345,10 +7345,10 @@ static void amdgpu_dm_connector_ddc_get_modes(struct drm_connector *connector,
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
> > @@ -7444,12 +7444,12 @@ static uint add_fs_modes(struct amdgpu_dm_connector *aconnector)
> >   }
> >   static void amdgpu_dm_connector_add_freesync_modes(struct drm_connector *connector,
> > -						   struct edid *edid)
> > +						   const struct drm_edid *drm_edid)
> >   {
> >   	struct amdgpu_dm_connector *amdgpu_dm_connector =
> >   		to_amdgpu_dm_connector(connector);
> > -	if (!edid)
> > +	if (!drm_edid)
> >   		return;
> >   	if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
> > @@ -7462,23 +7462,23 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
> >   	struct amdgpu_dm_connector *amdgpu_dm_connector =
> >   			to_amdgpu_dm_connector(connector);
> >   	struct drm_encoder *encoder;
> > -	struct edid *edid = amdgpu_dm_connector->edid;
> > +	const struct drm_edid *drm_edid = amdgpu_dm_connector->edid;
> >   	struct dc_link_settings *verified_link_cap =
> >   			&amdgpu_dm_connector->dc_link->verified_link_cap;
> >   	const struct dc *dc = amdgpu_dm_connector->dc_link->dc;
> >   	encoder = amdgpu_dm_connector_to_encoder(connector);
> > -	if (!drm_edid_is_valid(edid)) {
> > +	if (!drm_edid_valid(drm_edid)) {
> >   		amdgpu_dm_connector->num_modes =
> >   				drm_add_modes_noedid(connector, 640, 480);
> >   		if (dc->link_srv->dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
> >   			amdgpu_dm_connector->num_modes +=
> >   				drm_add_modes_noedid(connector, 1920, 1080);
> >   	} else {
> > -		amdgpu_dm_connector_ddc_get_modes(connector, edid);
> > +		amdgpu_dm_connector_ddc_get_modes(connector, drm_edid);
> >   		amdgpu_dm_connector_add_common_modes(encoder, connector);
> > -		amdgpu_dm_connector_add_freesync_modes(connector, edid);
> > +		amdgpu_dm_connector_add_freesync_modes(connector, drm_edid);
> >   	}
> >   	amdgpu_dm_fbc_init(connector);
> > @@ -11038,7 +11038,7 @@ static bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
> >   }
> >   static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> > -			  struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> > +			  const struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> >   {
> >   	u8 *edid_ext = NULL;
> >   	int i;
> > @@ -11073,7 +11073,8 @@ static int parse_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> >   }
> >   static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> > -		struct edid *edid, struct amdgpu_hdmi_vsdb_info *vsdb_info)
> > +			       const struct edid *edid,
> > +			       struct amdgpu_hdmi_vsdb_info *vsdb_info)
> >   {
> >   	u8 *edid_ext = NULL;
> >   	int i;
> > @@ -11115,7 +11116,7 @@ static int parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
> >    * FreeSync parameters.
> >    */
> >   void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> > -				    struct edid *edid)
> > +				    const struct drm_edid *drm_edid)
> >   {
> >   	int i = 0;
> >   	struct detailed_timing *timing;
> > @@ -11125,9 +11126,9 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >   			to_amdgpu_dm_connector(connector);
> >   	struct dm_connector_state *dm_con_state = NULL;
> >   	struct dc_sink *sink;
> > -
> >   	struct amdgpu_device *adev = drm_to_adev(connector->dev);
> >   	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
> > +	const struct edid *edid = drm_edid_raw(drm_edid);
> 
> 
> I got below compile errors:
> 
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function
> ‘amdgpu_dm_update_freesync_caps’:
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11176:41: error:
> assignment discards ‘const’ qualifier from pointer target type
> [-Werror=discarded-qualifiers]
> 11176 |                                 timing  =
> &edid->detailed_timings[i];
>       |                                         ^
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11221:33: error:
> assignment discards ‘const’ qualifier from pointer target type
> [-Werror=discarded-qualifiers]
> 11221 |                         timing  = &edid->detailed_timings[i];
> 
> 
> and the following changes fixes it:
> 
> -       struct detailed_timing *timing;
> -       struct detailed_non_pixel *data;
> -       struct detailed_data_monitor_range *range;
> +       const struct detailed_timing *timing;
> +       const struct detailed_non_pixel *data;
> +       const struct detailed_data_monitor_range *range;

Oh, thanks! I didn't realize this fast path to fix these warnings.

I'm considering to replace it with a drm_edid helper in the next version
and avoid handling `struct edid` in the driver.

I'll work on it for the next version.

BR,

Melissa

> 
> 
> 
> 
> >   	bool freesync_capable = false;
> >   	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
> > @@ -11140,7 +11141,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >   		amdgpu_dm_connector->dc_sink :
> >   		amdgpu_dm_connector->dc_em_sink;
> > -	if (!edid || !sink) {
> > +	if (!drm_edid || !sink) {
> >   		dm_con_state = to_dm_connector_state(connector->state);
> >   		amdgpu_dm_connector->min_vfreq = 0;
> > @@ -11162,7 +11163,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >   		|| sink->sink_signal == SIGNAL_TYPE_EDP) {
> >   		bool edid_check_required = false;
> > -		if (edid) {
> > +		if (drm_edid) {
> >   			edid_check_required = is_dp_capable_without_timing_msa(
> >   						adev->dm.dc,
> >   						amdgpu_dm_connector);
> > @@ -11214,7 +11215,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >   			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
> >   		}
> > -	} else if (edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> > +	} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> >   		i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> >   		if (i >= 0 && vsdb_info.freesync_supported) {
> >   			timing  = &edid->detailed_timings[i];
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index 9c1871b866cc..b81cf6f3713b 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -637,7 +637,7 @@ struct amdgpu_dm_connector {
> >   	/* we need to mind the EDID between detect
> >   	   and get modes due to analog/digital/tvencoder */
> > -	struct edid *edid;
> > +	const struct drm_edid *edid;
> >   	/* shared with amdgpu */
> >   	struct amdgpu_hpd hpd;
> > @@ -908,7 +908,7 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
> >   				    struct drm_connector *connector);
> >   void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> > -					struct edid *edid);
> > +				    const struct drm_edid *drm_edid);
> >   void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > index e3915c4f8566..91006326ce6d 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > @@ -898,7 +898,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
> >   	struct i2c_adapter *ddc;
> >   	int retry = 3;
> >   	enum dc_edid_status edid_status;
> > -	struct edid *edid;
> > +	const struct drm_edid *drm_edid;
> > +	const struct edid *edid;
> >   	if (link->aux_mode)
> >   		ddc = &aconnector->dm_dp_aux.aux.ddc;
> > @@ -909,8 +910,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
> >   	 * do check sum and retry to make sure read correct edid.
> >   	 */
> >   	do {
> > -
> > -		edid = drm_get_edid(&aconnector->base, ddc);
> > +		drm_edid = drm_edid_read_ddc(connector, ddc);
> > +		edid = drm_edid_raw(drm_edid);
> >   		/* DP Compliance Test 4.2.2.6 */
> >   		if (link->aux_mode && connector->edid_corrupt)
> > @@ -928,7 +929,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
> >   		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
> >   		/* We don't need the original edid anymore */
> > -		kfree(edid);
> > +		drm_edid_free(drm_edid);
> >   		edid_status = dm_helpers_parse_edid_caps(
> >   						link,
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 7075a85dd16e..cdebd0e74b26 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -127,7 +127,7 @@ dm_dp_mst_connector_destroy(struct drm_connector *connector)
> >   		dc_sink_release(aconnector->dc_sink);
> >   	}
> > -	kfree(aconnector->edid);
> > +	drm_edid_free(aconnector->edid);
> >   	drm_connector_cleanup(connector);
> >   	drm_dp_mst_put_port_malloc(aconnector->mst_output_port);
> > @@ -297,15 +297,15 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
> >   		return drm_add_edid_modes(connector, NULL);
> >   	if (!aconnector->edid) {
> > -		struct edid *edid;
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
> > @@ -339,7 +339,7 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
> >   			return ret;
> >   		}
> > -		aconnector->edid = edid;
> > +		aconnector->edid = drm_edid;
> >   		amdgpu_dm_set_mst_status(&aconnector->mst_status,
> >   			MST_REMOTE_EDID, true);
> >   	}
> > @@ -354,10 +354,12 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
> >   		struct dc_sink_init_data init_params = {
> >   				.link = aconnector->dc_link,
> >   				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
> > +		const struct edid *edid = drm_edid_raw(aconnector->edid);
> > +
> >   		dc_sink = dc_link_add_remote_sink(
> >   			aconnector->dc_link,
> > -			(uint8_t *)aconnector->edid,
> > -			(aconnector->edid->extensions + 1) * EDID_LENGTH,
> > +			(uint8_t *)edid,
> > +			(edid->extensions + 1) * EDID_LENGTH,
> >   			&init_params);
> >   		if (!dc_sink) {
> > @@ -411,10 +413,9 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
> >   		}
> >   	}
> > -	drm_connector_update_edid_property(
> > -					&aconnector->base, aconnector->edid);
> > +	drm_edid_connector_update(&aconnector->base, aconnector->edid);
> > -	ret = drm_add_edid_modes(connector, aconnector->edid);
> > +	ret = drm_edid_connector_add_modes(connector);
> >   	return ret;
> >   }
