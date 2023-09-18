Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF57A46E3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 12:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8180510E25F;
	Mon, 18 Sep 2023 10:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C21210E25F;
 Mon, 18 Sep 2023 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695032771; x=1726568771;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Z3iL/y6QJ7h0kqxXMPKW9Xen6z9Asf9eYXxhADrOF38=;
 b=eEoMvWNJRqCPPX+SX349qcAROcQ3KoqGarojaqnEmH56iddvKsp1a7wy
 LxqR5dQtoaLA+3c7BKsReWMW2g+8wK+KBuv4Vn1JpvBxb8WNeIxeRpRWJ
 KZ/dpRNb6BtBmfCrz688y3LVbXVe2/9ewARBABDxD5lWq84+Zpz2X2S3u
 bgUssIfasUHWGm9uKB7/Ho6RXU5FGmdmsKphvyLYtF0hvB+P/pR2Bd3Zd
 4hzsCjehoMSLLubFBla7PHgbGAyyIMwmy3j5iyr7drhl3OhIPEql/v8km
 xH1e2/BVBtljAlbmk/zmfKhagTmtDqvoYN3Yt6S5/F3ORqAyokYdgvdEv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410574691"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="410574691"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 03:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="739079716"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="739079716"
Received: from mkhokhlx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.60])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 03:26:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH][V2] drm/amd/display: Remove unwanted drm edid references
In-Reply-To: <20230915224926.104072-1-alex.hung@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230915224926.104072-1-alex.hung@amd.com>
Date: Mon, 18 Sep 2023 13:25:59 +0300
Message-ID: <87zg1ju6a0.fsf@intel.com>
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
Cc: stylon.wang@amd.com, haoping.liu@amd.com, srinivasan.shanmugam@amd.com,
 sunpeng.li@amd.com, Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Alex Hung <alex.hung@amd.com>,
 daniel.wheeler@amd.com, aurabindo.pillai@amd.com, hersenxs.wu@amd.com,
 hamza.mahfooz@amd.com, wayne.lin@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Sep 2023, Alex Hung <alex.hung@amd.com> wrote:
> [WHY]
> edid_override and drm_edid_override_connector_update, according to drm
> documentation, should not be referred outside drm_edid.
>
> [HOW]
> Remove and replace them accordingly. This can tested by IGT's
> kms_hdmi_inject test.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>
> V2 - add comments for drm_get_edid and check edid before use.
>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 44 +++++++++++--------
>  1 file changed, 25 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5efebc06296b..b29ef87c27a9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6444,15 +6444,24 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>  static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>  {
>  	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
> +	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>  	struct dc_link *dc_link = aconnector->dc_link;
>  	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>  	struct edid *edid;
>  
> -	if (!connector->edid_override)
> +	/*
> +	 * Note: drm_get_edid gets edid in the following order:
> +	 * 1) override EDID if set via edid_override debugfs,
> +	 * 2) firmware EDID if set via edid_firmware module parameter
> +	 * 3) regular DDC read.
> +	 */
> +	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
> +	if (!edid) {
> +		DRM_ERROR("No EDID found on connector: %s, forcing to OFF!\n", connector->name);
> +		connector->force = DRM_FORCE_OFF;

Drivers aren't supposed to modify connector->force.

Why would you do that anyway? This connects EDID probe success with
connector forcing, and I've been repeatedly saying these are two
separate things that should not be conflated.

Maybe the user has set connector->force, because the display probe is
flaky. This switches connector->force off if the display does not
respond, undermining one of the main purposes of the whole thing.

>  		return;
> +	}
>  
> -	drm_edid_override_connector_update(&aconnector->base);
> -	edid = aconnector->base.edid_blob_ptr->data;
>  	aconnector->edid = edid;
>  
>  	/* Update emulated (virtual) sink's EDID */
> @@ -6487,30 +6496,27 @@ static int get_modes(struct drm_connector *connector)
>  
>  static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>  {
> +	struct drm_connector *connector = &aconnector->base;
> +	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(&aconnector->base);
>  	struct dc_sink_init_data init_params = {
>  			.link = aconnector->dc_link,
>  			.sink_signal = SIGNAL_TYPE_VIRTUAL
>  	};
>  	struct edid *edid;
>  
> -	if (!aconnector->base.edid_blob_ptr) {
> -		/* if connector->edid_override valid, pass
> -		 * it to edid_override to edid_blob_ptr
> -		 */
> -
> -		drm_edid_override_connector_update(&aconnector->base);
> -
> -		if (!aconnector->base.edid_blob_ptr) {
> -			DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
> -					aconnector->base.name);
> -
> -			aconnector->base.force = DRM_FORCE_OFF;
> -			return;
> -		}
> +	/*
> +	 * Note: drm_get_edid gets edid in the following order:
> +	 * 1) override EDID if set via edid_override debugfs,
> +	 * 2) firmware EDID if set via edid_firmware module parameter
> +	 * 3) regular DDC read.
> +	 */
> +	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
> +	if (!edid) {
> +		DRM_ERROR("No EDID found on connector: %s, forcing to OFF!\n", connector->name);
> +		connector->force = DRM_FORCE_OFF;

Ditto.

BR,
Jani.

> +		return;
>  	}
>  
> -	edid = (struct edid *) aconnector->base.edid_blob_ptr->data;
> -
>  	aconnector->edid = edid;
>  
>  	aconnector->dc_em_sink = dc_link_add_remote_sink(

-- 
Jani Nikula, Intel
