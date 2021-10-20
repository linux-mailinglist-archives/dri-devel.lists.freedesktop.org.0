Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89249434704
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 10:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A750289DCF;
	Wed, 20 Oct 2021 08:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4A489DCF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 08:34:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228997282"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="228997282"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 01:34:40 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="444272125"
Received: from sischoen-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.45.52])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 01:34:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Jerry.Zuo@amd.com,
 dri-devel@lists.freedesktop.org, lyude@redhat.com
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com,
 Mikita.Lipski@amd.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Subject: Re: [PATCH 2/4] drm: Update MST First Link Slot Information Based on
 Encoding Format
In-Reply-To: <20211019180150.103434-1-Bhawanpreet.Lakha@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <71f2b3bd6c43789f9821a6e815b94a3882c3a2c4.camel@redhat.com>
 <20211019180150.103434-1-Bhawanpreet.Lakha@amd.com>
Date: Wed, 20 Oct 2021 11:34:33 +0300
Message-ID: <87zgr4nlgm.fsf@intel.com>
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

On Tue, 19 Oct 2021, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com> wrote:
> 8b/10b encoding format requires to reserve the first slot for
> recording metadata. Real data transmission starts from the second slot,
> with a total of available 63 slots available.
>
> In 128b/132b encoding format, metadata is transmitted separately
> in LLCP packet before MTP. Real data transmission starts from
> the first slot, with a total of 64 slots available.

Please send the patches as a fresh series instead of replying to the old
thread, it's getting too confusing. Also, please Cc: intel-gfx mailing
list, so you'll get our CI results on it. (Although I'm not sure how
many machines we have with MST setups, but it's better than nothing.)

BR,
Jani.


>
> v2:
> * Move total/start slots to mst_state, and copy it to mst_mgr in
> atomic_check
>
> v3:
> * Only keep the slot info on the mst_state
> * add a start_slot parameter to the payload function, to facilitate non
>   atomic drivers (this is a temporary workaround and should be removed when
>   we are moving out the non atomic driver helpers)
>
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 34 ++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 +--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  4 +--
>  include/drm/drm_dp_mst_helper.h               |  5 ++-
>  6 files changed, 40 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index ff0f91c93ba4..6169488e2011 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -251,7 +251,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
>  	}
>  
>  	/* It's OK for this to fail */
> -	drm_dp_update_payload_part1(mst_mgr);
> +	drm_dp_update_payload_part1(mst_mgr, 1);
>  
>  	/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
>  	 * AUX message. The sequence is slot 1-63 allocated sequence for each
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 5ab3b3a46e89..d188a5269070 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3353,6 +3353,9 @@ static int drm_dp_destroy_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
>  /**
>   * drm_dp_update_payload_part1() - Execute payload update part 1
>   * @mgr: manager to use.
> + * @start_slot: this is the cur slot
> + *  NOTE: start_slot is a temporary workaround for non-atomic drivers,
> + *  this will be removed when non-atomic mst helpers are moved out of the helper
>   *
>   * This iterates over all proposed virtual channels, and tries to
>   * allocate space in the link for them. For 0->slots transitions,
> @@ -3363,12 +3366,12 @@ static int drm_dp_destroy_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
>   * after calling this the driver should generate ACT and payload
>   * packets.
>   */
> -int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
> +int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_slot)
>  {
>  	struct drm_dp_payload req_payload;
>  	struct drm_dp_mst_port *port;
>  	int i, j;
> -	int cur_slots = 1;
> +	int cur_slots = start_slot;
>  	bool skip;
>  
>  	mutex_lock(&mgr->payload_lock);
> @@ -4503,6 +4506,26 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
>  }
>  EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
>  
> +/**
> + * drm_dp_mst_update_slots() - updates the slot info depending on the DP ecoding format
> + * @mst_state: mst_state to update
> + * @link_ecoding_cap: the ecoding format on the link
> + */
> +void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_ecoding_cap)
> +{
> +	if (link_ecoding_cap == DP_CAP_ANSI_128B132B) {
> +		mst_state->total_avail_slots = 64;
> +		mst_state->start_slot = 0;
> +	} else {
> +		mst_state->total_avail_slots = 63;
> +		mst_state->start_slot = 1;
> +	}
> +
> +	DRM_DEBUG_KMS("%s ecoding format on mst_state 0x%p\n",
> +			(link_ecoding_cap == DP_CAP_ANSI_128B132B) ? "128b/132b":"8b/10b", mst_state->mgr);
> +}
> +EXPORT_SYMBOL(drm_dp_mst_update_slots);
> +
>  /**
>   * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
>   * @mgr: manager for this port
> @@ -5222,7 +5245,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
>  					 struct drm_dp_mst_topology_state *mst_state)
>  {
>  	struct drm_dp_vcpi_allocation *vcpi;
> -	int avail_slots = 63, payload_count = 0;
> +	int avail_slots = mst_state->total_avail_slots, payload_count = 0;
>  
>  	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
>  		/* Releasing VCPI is always OK-even if the port is gone */
> @@ -5251,7 +5274,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
>  		}
>  	}
>  	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
> -		       mgr, mst_state, avail_slots, 63 - avail_slots);
> +		       mgr, mst_state, avail_slots, mst_state->total_avail_slots - avail_slots);
>  
>  	return 0;
>  }
> @@ -5528,6 +5551,9 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  	if (mst_state == NULL)
>  		return -ENOMEM;
>  
> +	mst_state->total_avail_slots = 63;
> +	mst_state->start_slot = 1;
> +
>  	mst_state->mgr = mgr;
>  	INIT_LIST_HEAD(&mst_state->vcpis);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index b170e272bdee..d3a24189a12c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -368,7 +368,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
>  
>  	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
>  
> -	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
> +	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
>  	if (ret) {
>  		drm_dbg_kms(&i915->drm, "failed to update payload %d\n", ret);
>  	}
> @@ -516,7 +516,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
>  
>  	intel_dp->active_mst_links++;
>  
> -	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
> +	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
>  
>  	/*
>  	 * Before Gen 12 this is not done as part of
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index f949767698fc..6c8c59c26dbf 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1413,7 +1413,7 @@ nv50_mstm_prepare(struct nv50_mstm *mstm)
>  	int ret;
>  
>  	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
> -	ret = drm_dp_update_payload_part1(&mstm->mgr);
> +	ret = drm_dp_update_payload_part1(&mstm->mgr, 1);
>  
>  	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>  		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> index ec867fa880a4..751c2c075e09 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -423,7 +423,7 @@ radeon_mst_encoder_dpms(struct drm_encoder *encoder, int mode)
>  		drm_dp_mst_allocate_vcpi(&radeon_connector->mst_port->mst_mgr,
>  					 radeon_connector->port,
>  					 mst_enc->pbn, slots);
> -		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr);
> +		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr, 1);
>  
>  		radeon_dp_mst_set_be_cntl(primary, mst_enc,
>  					  radeon_connector->mst_port->hpd.hpd, true);
> @@ -452,7 +452,7 @@ radeon_mst_encoder_dpms(struct drm_encoder *encoder, int mode)
>  			return;
>  
>  		drm_dp_mst_reset_vcpi_slots(&radeon_connector->mst_port->mst_mgr, mst_enc->port);
> -		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr);
> +		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr, 1);
>  
>  		drm_dp_check_act_status(&radeon_connector->mst_port->mst_mgr);
>  		/* and this can also fail */
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index ddb9231d0309..3207b49586fc 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
>  	struct drm_private_state base;
>  	struct list_head vcpis;
>  	struct drm_dp_mst_topology_mgr *mgr;
> +	u8 total_avail_slots;
> +	u8 start_slot;
>  };
>  
>  #define to_dp_mst_topology_mgr(x) container_of(x, struct drm_dp_mst_topology_mgr, base)
> @@ -806,6 +808,7 @@ int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp
>  
>  void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
>  
> +void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_ecoding_cap);
>  
>  void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>  				struct drm_dp_mst_port *port);
> @@ -815,7 +818,7 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
>  			   int pbn);
>  
>  
> -int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr);
> +int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_slot);
>  
>  
>  int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr);

-- 
Jani Nikula, Intel Open Source Graphics Center
