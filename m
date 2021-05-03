Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EE6371EA1
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 19:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625AF6E9E9;
	Mon,  3 May 2021 17:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8B26E9E8;
 Mon,  3 May 2021 17:30:07 +0000 (UTC)
IronPort-SDR: XbPcWEfxUVjH+adlOoMaA9lmU5CoRqDtPV8DcKa4zAPlMjash45RXpDcQ1fYz0AOG654LwtRfs
 xEyY12YLbwYA==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="185268260"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="185268260"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 10:29:45 -0700
IronPort-SDR: VXu41/lC+XiLlrzAThqrT3wKaQRwNzNzuwlAkTUUp/EYSwxEv04ZQ2FeYqwdMPUDN+r8kH7qjT
 0bSL/YxZZ2DQ==
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="432843672"
Received: from tbashir-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 10:29:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nikola Cornij <nikola.cornij@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v1 1/1] drm/dp_mst: Use kHz as link rate units when settig
 source max link caps at init
In-Reply-To: <20210503172109.22877-2-nikola.cornij@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210503172109.22877-1-nikola.cornij@amd.com>
 <20210503172109.22877-2-nikola.cornij@amd.com>
Date: Mon, 03 May 2021 20:29:30 +0300
Message-ID: <875yzz20at.fsf@intel.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, James Jones <jajones@nvidia.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, koba.ko@canonical.com,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Leo Li <sunpeng.li@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Shawn C <shawn.c.lee@intel.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 03 May 2021, Nikola Cornij <nikola.cornij@amd.com> wrote:
> [why]
> Link rate in kHz is what is eventually required to calculate the link
> bandwidth, which makes kHz a more generic unit. This should also make
> forward-compatibility with new DP standards easier.
>
> [how]
> - Replace 'link rate DPCD code' with 'link rate in kHz' when used with
> drm_dp_mst_topology_mgr_init()
> - Add/remove related DPCD code conversion from/to kHz where applicable
>
> Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>

LGTM,

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via drm-misc-next where the previous patches went.

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   | 4 ++--
>  drivers/gpu/drm/drm_dp_mst_topology.c                     | 8 ++++----
>  drivers/gpu/drm/i915/display/intel_dp_mst.c               | 4 ++--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c                   | 5 +++--
>  drivers/gpu/drm/radeon/radeon_dp_mst.c                    | 2 +-
>  include/drm/drm_dp_mst_helper.h                           | 8 ++++----
>  6 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index ef8d53e24c47..3f3ead83c21c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -453,8 +453,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  		&aconnector->dm_dp_aux.aux,
>  		16,
>  		4,
> -		(u8)max_link_enc_cap.lane_count,
> -		(u8)max_link_enc_cap.link_rate,
> +		max_link_enc_cap.lane_count,
> +		drm_dp_bw_code_to_link_rate(max_link_enc_cap.link_rate),
>  		aconnector->connector_id);
>  
>  	drm_connector_attach_dp_subconnector_property(&aconnector->base);
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 54604633e65c..32b7f8983b94 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3722,9 +3722,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>  		}
>  
>  		lane_count = min_t(int, mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK, mgr->max_lane_count);
> -		link_rate = min_t(int, mgr->dpcd[1], mgr->max_link_rate);
> +		link_rate = min_t(int, drm_dp_bw_code_to_link_rate(mgr->dpcd[1]), mgr->max_link_rate);
>  		mgr->pbn_div = drm_dp_get_vc_payload_bw(mgr,
> -							drm_dp_bw_code_to_link_rate(link_rate),
> +							link_rate,
>  							lane_count);
>  		if (mgr->pbn_div == 0) {
>  			ret = -EINVAL;
> @@ -5454,7 +5454,7 @@ EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
>   * @max_dpcd_transaction_bytes: hw specific DPCD transaction limit
>   * @max_payloads: maximum number of payloads this GPU can source
>   * @max_lane_count: maximum number of lanes this GPU supports
> - * @max_link_rate: maximum link rate this GPU supports, units as in DPCD
> + * @max_link_rate: maximum link rate per lane this GPU supports in kHz
>   * @conn_base_id: the connector object ID the MST device is connected to.
>   *
>   * Return 0 for success, or negative error code on failure
> @@ -5462,7 +5462,7 @@ EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
>  int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_device *dev, struct drm_dp_aux *aux,
>  				 int max_dpcd_transaction_bytes, int max_payloads,
> -				 u8 max_lane_count, u8 max_link_rate,
> +				 int max_lane_count, int max_link_rate,
>  				 int conn_base_id)
>  {
>  	struct drm_dp_mst_topology_state *mst_state;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index f608c0cb98f4..26f65445bc8a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -960,8 +960,8 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
>  	intel_dp_create_fake_mst_encoders(dig_port);
>  	ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, &i915->drm,
>  					   &intel_dp->aux, 16, 3,
> -					   (u8)dig_port->max_lanes,
> -					   drm_dp_link_rate_to_bw_code(max_source_rate),
> +					   dig_port->max_lanes,
> +					   max_source_rate,
>  					   conn_base_id);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index c46d0374b6e6..f949767698fc 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1617,8 +1617,9 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct drm_dp_aux *aux, int aux_max,
>  	mstm->mgr.cbs = &nv50_mstm;
>  
>  	ret = drm_dp_mst_topology_mgr_init(&mstm->mgr, dev, aux, aux_max,
> -					   (u8)max_payloads, outp->dcb->dpconf.link_nr,
> -					   (u8)outp->dcb->dpconf.link_bw, conn_base_id);
> +					   max_payloads, outp->dcb->dpconf.link_nr,
> +					   drm_dp_bw_code_to_link_rate(outp->dcb->dpconf.link_bw),
> +					   conn_base_id);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> index 13072c2a6502..ec867fa880a4 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -642,7 +642,7 @@ radeon_dp_mst_init(struct radeon_connector *radeon_connector)
>  	radeon_connector->mst_mgr.cbs = &mst_cbs;
>  	return drm_dp_mst_topology_mgr_init(&radeon_connector->mst_mgr, dev,
>  					    &radeon_connector->ddc_bus->aux, 16, 6,
> -					    4, (u8)max_link_rate,
> +					    4, drm_dp_bw_code_to_link_rate(max_link_rate),
>  					    radeon_connector->base.base.id);
>  }
>  
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index c87a829b6498..ddb9231d0309 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -596,11 +596,11 @@ struct drm_dp_mst_topology_mgr {
>  	/**
>  	 * @max_lane_count: maximum number of lanes the GPU can drive.
>  	 */
> -	u8 max_lane_count;
> +	int max_lane_count;
>  	/**
> -	 * @max_link_rate: maximum link rate per lane GPU can output.
> +	 * @max_link_rate: maximum link rate per lane GPU can output, in kHz.
>  	 */
> -	u8 max_link_rate;
> +	int max_link_rate;
>  	/**
>  	 * @conn_base_id: DRM connector ID this mgr is connected to. Only used
>  	 * to build the MST connector path value.
> @@ -774,7 +774,7 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_device *dev, struct drm_dp_aux *aux,
>  				 int max_dpcd_transaction_bytes,
>  				 int max_payloads,
> -				 u8 max_lane_count, u8 max_link_rate,
> +				 int max_lane_count, int max_link_rate,
>  				 int conn_base_id);
>  
>  void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
