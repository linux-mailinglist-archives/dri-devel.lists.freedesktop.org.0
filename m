Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F55642C5E6
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 18:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA3B6EA79;
	Wed, 13 Oct 2021 16:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BCB6EA0F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 16:10:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227361286"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="227361286"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 09:10:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="491529057"
Received: from araghuw-mobl.gar.corp.intel.com (HELO localhost)
 ([10.251.208.234])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 09:10:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Jerry.Zuo@amd.com,
 dri-devel@lists.freedesktop.org, lyude@redhat.com
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
In-Reply-To: <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
Date: Wed, 13 Oct 2021 19:09:58 +0300
Message-ID: <871r4oykh5.fsf@intel.com>
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

On Tue, 12 Oct 2021, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com> wrote:
> 8b/10b encoding format requires to reserve the first slot for
> recording metadata. Real data transmission starts from the second slot,
> with a total of available 63 slots available.
>
> In 128b/132b encoding format, metadata is transmitted separately
> in LLCP packet before MTP. Real data transmission starts from
> the first slot, with a total of 64 slots available.
>
> v2:
> * Remove get_mst_link_encoding_cap
> * Move total/start slots to mst_state, and copy it to mst_mgr in
> atomic_check
>
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 35 +++++++++++++++----
>  include/drm/drm_dp_mst_helper.h               | 13 +++++++
>  3 files changed, 69 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5020f2d36fe1..4ad50eb0091a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10612,6 +10612,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>  	struct dsc_mst_fairness_vars vars[MAX_PIPES];
>  #endif
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct drm_dp_mst_topology_mgr *mgr;
>  
>  	trace_amdgpu_dm_atomic_check_begin(state);
>  
> @@ -10819,6 +10821,32 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  		lock_and_validation_needed = true;
>  	}
>  
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
> +		struct amdgpu_dm_connector *aconnector;
> +		struct drm_connector *connector;
> +		struct drm_connector_list_iter iter;
> +		u8 link_coding_cap;
> +
> +		if (!mgr->mst_state )
> +			continue;
> +
> +		drm_connector_list_iter_begin(dev, &iter);
> +		drm_for_each_connector_iter(connector, &iter) {
> +			int id = connector->index;
> +
> +			if (id == mst_state->mgr->conn_base_id) {
> +				aconnector = to_amdgpu_dm_connector(connector);
> +				link_coding_cap = dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
> +				drm_dp_mst_update_coding_cap(mst_state, link_coding_cap);
> +
> +				break;
> +			}
> +		}
> +		drm_connector_list_iter_end(&iter);
> +
> +	}
> +#endif

I wonder if we could split this to separate drm dp helper and amd driver
patches?

>  	/**
>  	 * Streams and planes are reset when there are changes that affect
>  	 * bandwidth. Anything that affects bandwidth needs to go through
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index ad0795afc21c..fb5c47c4cb2e 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
>  	struct drm_dp_payload req_payload;
>  	struct drm_dp_mst_port *port;
>  	int i, j;
> -	int cur_slots = 1;
> +	int cur_slots = mgr->start_slot;
>  	bool skip;
>  
>  	mutex_lock(&mgr->payload_lock);
> @@ -4321,7 +4321,7 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
>  	num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
>  
>  	/* max. time slots - one slot for MTP header */
> -	if (num_slots > 63)
> +	if (num_slots > mgr->total_avail_slots)
>  		return -ENOSPC;
>  	return num_slots;
>  }
> @@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>  	int ret;
>  
>  	/* max. time slots - one slot for MTP header */
> -	if (slots > 63)
> +	if (slots > mgr->total_avail_slots)
>  		return -ENOSPC;
>  
>  	vcpi->pbn = pbn;
> @@ -4507,6 +4507,18 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
>  }
>  EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
>  
> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state *mst_state, uint8_t link_coding_cap)
> +{
> +	if (link_coding_cap == DP_CAP_ANSI_128B132B) {
> +		mst_state->total_avail_slots = 64;
> +		mst_state->start_slot = 0;
> +	}

The values never change AFAICT, should we store the channel encoding
instead, and use that information to initialize the values?

(Alternatively, why aren't the 8b/10b values initialized here if
128b/132b are?)

> +
> +	DRM_DEBUG_KMS("%s coding format on mgr 0x%p\n",
> +			(link_coding_cap == DP_CAP_ANSI_128B132B) ? "128b/132b":"8b/10b", mst_state->mgr);
> +}
> +EXPORT_SYMBOL(drm_dp_mst_update_coding_cap);
> +
>  /**
>   * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
>   * @mgr: manager for this port
> @@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>  
>  	ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
>  	if (ret) {
> -		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63 ret=%d\n",
> -			    DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
> +		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=%d ret=%d\n",
> +			    DIV_ROUND_UP(pbn, mgr->pbn_div), mgr->total_avail_slots, ret);
>  		drm_dp_mst_topology_put_port(port);
>  		goto out;
>  	}
> @@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
>  					 struct drm_dp_mst_topology_state *mst_state)
>  {
>  	struct drm_dp_vcpi_allocation *vcpi;
> -	int avail_slots = 63, payload_count = 0;
> +	int avail_slots = mgr->total_avail_slots, payload_count = 0;

>  
>  	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
>  		/* Releasing VCPI is always OK-even if the port is gone */
> @@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
>  		}
>  	}
>  	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
> -		       mgr, mst_state, avail_slots, 63 - avail_slots);
> +		       mgr, mst_state, avail_slots, mgr->total_avail_slots - avail_slots);
>  
>  	return 0;
>  }
> @@ -5421,6 +5433,10 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
>  			break;
>  
>  		mutex_lock(&mgr->lock);
> +
> +		mgr->start_slot = mst_state->start_slot;
> +		mgr->total_avail_slots = mst_state->total_avail_slots;
> +

It feels wrong to me to be copying stuff from mst_state to mgr in
general, and in atomic check hook in particular.

>  		ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr->mst_primary,
>  							    mst_state);
>  		mutex_unlock(&mgr->lock);
> @@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  	if (!mgr->proposed_vcpis)
>  		return -ENOMEM;
>  	set_bit(0, &mgr->payload_mask);
> +	mgr->total_avail_slots = 63;
> +	mgr->start_slot = 1;
>  
>  	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
>  	if (mst_state == NULL)
>  		return -ENOMEM;
>  
> +	mst_state->total_avail_slots = 63;
> +	mst_state->start_slot = 1;
> +

The magic values for 8b/10b are now duplicated to two places, with the
128b/132b values in a separate place.

BR,
Jani.

>  	mst_state->mgr = mgr;
>  	INIT_LIST_HEAD(&mst_state->vcpis);
>  
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index ddb9231d0309..f8152dfb34ed 100644
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
> @@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
>  	 */
>  	int pbn_div;
>  
> +	/**
> +	 * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
> +	 */
> +	u8 total_avail_slots;
> +
> +	/**
> +	 * @start_slot: 1 for 8b/10b, 0 for 128/132b
> +	 */
> +	u8 start_slot;
> +
>  	/**
>  	 * @funcs: Atomic helper callbacks
>  	 */
> @@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp
>  
>  void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
>  
> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state *mst_state, uint8_t link_coding_cap);
>  
>  void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>  				struct drm_dp_mst_port *port);

-- 
Jani Nikula, Intel Open Source Graphics Center
