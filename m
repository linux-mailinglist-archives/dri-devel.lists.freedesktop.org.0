Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B660972AA01
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 09:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DD710E182;
	Sat, 10 Jun 2023 07:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA6010E180;
 Sat, 10 Jun 2023 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686383286; x=1717919286;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gPkLg/0r/eo2IQbzVlwKQrg5f60/iyeJSJzuYqUZ02A=;
 b=D/LwoVWefaGSOpTv17A1SgEjlKz94sx4RFinPu7EnuJ95aBqILrgjpIP
 y8RPRVehJ3t8TqXAZZH53OQQ6WLd6kA7eyOzM5EDhIhzeHtuKWUkDPk53
 IpPfC/0Cybytlat0cPGxjWJQPtHhRtagj0BKsIrISMfE0nDrst+ArLko3
 eidAMlGRCEREPjwoA3/SHaRffAAv5bFYbwk98sdpAZzwiY3Vk9ij9gJcl
 wNMQ5/iFhWtGovkRfBaoaJpjdq2K8/BgeqlITbhG1Lc2mACg0N7Ln3nku
 7pIx7/yfKeV9eprL/tbZHUNY/1fT9rj3G2RmPAw0IOQwED7Vs9XuYoZ43 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="342420805"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; d="scan'208";a="342420805"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2023 00:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="884834982"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; d="scan'208";a="884834982"
Received: from mnovakov-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.60.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2023 00:48:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
In-Reply-To: <20230609104925.3736756-1-Wayne.Lin@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230609104925.3736756-1-Wayne.Lin@amd.com>
Date: Sat, 10 Jun 2023 10:47:58 +0300
Message-ID: <87h6rfpxld.fsf@intel.com>
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
Cc: stable@vger.kernel.org, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 09 Jun 2023, Wayne Lin <Wayne.Lin@amd.com> wrote:
> [Why]
> The sequence for collecting down_reply from source perspective should
> be:
>
> Request_n->repeat (get partial reply of Request_n->clear message ready
> flag to ack DPRX that the message is received) till all partial
> replies for Request_n are received->new Request_n+1.
>
> Now there is chance that drm_dp_mst_hpd_irq() will fire new down
> request in the tx queue when the down reply is incomplete. Source is
> restricted to generate interveleaved message transactions so we should
> avoid it.
>
> Also, while assembling partial reply packets, reading out DPCD DOWN_REP
> Sideband MSG buffer + clearing DOWN_REP_MSG_RDY flag should be
> wrapped up as a complete operation for reading out a reply packet.
> Kicking off a new request before clearing DOWN_REP_MSG_RDY flag might
> be risky. e.g. If the reply of the new request has overwritten the
> DPRX DOWN_REP Sideband MSG buffer before source writing one to clear
> DOWN_REP_MSG_RDY flag, source then unintentionally flushes the reply
> for the new request. Should handle the up request in the same way.
>
> [How]
> Separete drm_dp_mst_hpd_irq() into 2 steps. After acking the MST IRQ
> event, driver calls drm_dp_mst_hpd_irq_send_new_request() and might
> trigger drm_dp_mst_kick_tx() only when there is no on going message
> transaction.
>
> Changes since v1:
> * Reworked on review comments received
> -> Adjust the fix to let driver explicitly kick off new down request
> when mst irq event is handled and acked
> -> Adjust the commit message
>
> Changes since v2:
> * Adjust the commit message
> * Adjust the naming of the divided 2 functions and add a new input
>   parameter "ack".
> * Adjust code flow as per review comments.
>
> Changes since v3:
> * Update the function description of drm_dp_mst_hpd_irq_handle_event
>
> Changes since v4:
> * Change ack of drm_dp_mst_hpd_irq_handle_event() to be an array align
>   the size of esi[]

I don't have the time for detailed review right now, but assuming
someone does that, and Intel CI passes (I bounced this to
intel-gfx@lists.freedesktop.org which should get it going),

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Cc: stable@vger.kernel.org
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 +++++------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 54 ++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp.c       |  7 +--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 12 +++--
>  include/drm/display/drm_dp_mst_helper.h       |  7 ++-
>  5 files changed, 81 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d5cec03eaa8d..ec629b4037e4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3263,6 +3263,7 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
>  
>  	while (dret == dpcd_bytes_to_read &&
>  		process_count < max_process_count) {
> +		u8 ack[DP_PSR_ERROR_STATUS - DP_SINK_COUNT_ESI] = {};
>  		u8 retry;
>  		dret = 0;
>  
> @@ -3271,28 +3272,29 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
>  		DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0], esi[1], esi[2]);
>  		/* handle HPD short pulse irq */
>  		if (aconnector->mst_mgr.mst_state)
> -			drm_dp_mst_hpd_irq(
> -				&aconnector->mst_mgr,
> -				esi,
> -				&new_irq_handled);
> +			drm_dp_mst_hpd_irq_handle_event(&aconnector->mst_mgr,
> +							esi,
> +							ack,
> +							&new_irq_handled);
>  
>  		if (new_irq_handled) {
>  			/* ACK at DPCD to notify down stream */
> -			const int ack_dpcd_bytes_to_write =
> -				dpcd_bytes_to_read - 1;
> -
>  			for (retry = 0; retry < 3; retry++) {
> -				u8 wret;
> -
> -				wret = drm_dp_dpcd_write(
> -					&aconnector->dm_dp_aux.aux,
> -					dpcd_addr + 1,
> -					&esi[1],
> -					ack_dpcd_bytes_to_write);
> -				if (wret == ack_dpcd_bytes_to_write)
> +				ssize_t wret;
> +
> +				wret = drm_dp_dpcd_writeb(&aconnector->dm_dp_aux.aux,
> +							  dpcd_addr + 1,
> +							  ack[1]);
> +				if (wret == 1)
>  					break;
>  			}
>  
> +			if (retry == 3) {
> +				DRM_ERROR("Failed to ack MST event.\n");
> +				return;
> +			}
> +
> +			drm_dp_mst_hpd_irq_send_new_request(&aconnector->mst_mgr);
>  			/* check if there is new irq to be handled */
>  			dret = drm_dp_dpcd_read(
>  				&aconnector->dm_dp_aux.aux,
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 38dab76ae69e..487d057a9582 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4053,17 +4053,28 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
>  }
>  
>  /**
> - * drm_dp_mst_hpd_irq() - MST hotplug IRQ notify
> + * drm_dp_mst_hpd_irq_handle_event() - MST hotplug IRQ handle MST event
>   * @mgr: manager to notify irq for.
>   * @esi: 4 bytes from SINK_COUNT_ESI
> + * @ack: 4 bytes used to ack events starting from SINK_COUNT_ESI
>   * @handled: whether the hpd interrupt was consumed or not
>   *
> - * This should be called from the driver when it detects a short IRQ,
> + * This should be called from the driver when it detects a HPD IRQ,
>   * along with the value of the DEVICE_SERVICE_IRQ_VECTOR_ESI0. The
> - * topology manager will process the sideband messages received as a result
> - * of this.
> + * topology manager will process the sideband messages received
> + * as indicated in the DEVICE_SERVICE_IRQ_VECTOR_ESI0 and set the
> + * corresponding flags that Driver has to ack the DP receiver later.
> + *
> + * Note that driver shall also call
> + * drm_dp_mst_hpd_irq_send_new_request() if the 'handled' is set
> + * after calling this function, to try to kick off a new request in
> + * the queue if the previous message transaction is completed.
> + *
> + * See also:
> + * drm_dp_mst_hpd_irq_send_new_request()
>   */
> -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handled)
> +int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr, const u8 *esi,
> +				    u8 *ack, bool *handled)
>  {
>  	int ret = 0;
>  	int sc;
> @@ -4078,18 +4089,47 @@ int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
>  	if (esi[1] & DP_DOWN_REP_MSG_RDY) {
>  		ret = drm_dp_mst_handle_down_rep(mgr);
>  		*handled = true;
> +		ack[1] |= DP_DOWN_REP_MSG_RDY;
>  	}
>  
>  	if (esi[1] & DP_UP_REQ_MSG_RDY) {
>  		ret |= drm_dp_mst_handle_up_req(mgr);
>  		*handled = true;
> +		ack[1] |= DP_UP_REQ_MSG_RDY;
>  	}
>  
> -	drm_dp_mst_kick_tx(mgr);
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_dp_mst_hpd_irq);
> +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_handle_event);
>  
> +/**
> + * drm_dp_mst_hpd_irq_send_new_request() - MST hotplug IRQ kick off new request
> + * @mgr: manager to notify irq for.
> + *
> + * This should be called from the driver when mst irq event is handled
> + * and acked. Note that new down request should only be sent when
> + * previous message transaction is completed. Source is not supposed to generate
> + * interleaved message transactions.
> + */
> +void drm_dp_mst_hpd_irq_send_new_request(struct drm_dp_mst_topology_mgr *mgr)
> +{
> +	struct drm_dp_sideband_msg_tx *txmsg;
> +	bool kick = true;
> +
> +	mutex_lock(&mgr->qlock);
> +	txmsg = list_first_entry_or_null(&mgr->tx_msg_downq,
> +					 struct drm_dp_sideband_msg_tx, next);
> +	/* If last transaction is not completed yet*/
> +	if (!txmsg ||
> +	    txmsg->state == DRM_DP_SIDEBAND_TX_START_SEND ||
> +	    txmsg->state == DRM_DP_SIDEBAND_TX_SENT)
> +		kick = false;
> +	mutex_unlock(&mgr->qlock);
> +
> +	if (kick)
> +		drm_dp_mst_kick_tx(mgr);
> +}
> +EXPORT_SYMBOL(drm_dp_mst_hpd_irq_send_new_request);
>  /**
>   * drm_dp_mst_detect_port() - get connection status for an MST port
>   * @connector: DRM connector for this port
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4bec8cd7979f..f4a2e72a5c20 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4062,9 +4062,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 *esi, u8 *ack)
>  {
>  	bool handled = false;
>  
> -	drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
> -	if (handled)
> -		ack[1] |= esi[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY);
> +	drm_dp_mst_hpd_irq_handle_event(&intel_dp->mst_mgr, esi, ack, &handled);
>  
>  	if (esi[1] & DP_CP_IRQ) {
>  		intel_hdcp_handle_cp_irq(intel_dp->attached_connector);
> @@ -4139,6 +4137,9 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
>  
>  		if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
>  			drm_dbg_kms(&i915->drm, "Failed to ack ESI\n");
> +
> +		if (ack[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY))
> +			drm_dp_mst_hpd_irq_send_new_request(&intel_dp->mst_mgr);
>  	}
>  
>  	return link_ok;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 9b6824f6b9e4..42e1665ba11a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1359,22 +1359,26 @@ nv50_mstm_service(struct nouveau_drm *drm,
>  	u8 esi[8] = {};
>  
>  	while (handled) {
> +		u8 ack[8] = {};
> +
>  		rc = drm_dp_dpcd_read(aux, DP_SINK_COUNT_ESI, esi, 8);
>  		if (rc != 8) {
>  			ret = false;
>  			break;
>  		}
>  
> -		drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
> +		drm_dp_mst_hpd_irq_handle_event(&mstm->mgr, esi, ack, &handled);
>  		if (!handled)
>  			break;
>  
> -		rc = drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1, &esi[1],
> -				       3);
> -		if (rc != 3) {
> +		rc = drm_dp_dpcd_writeb(aux, DP_SINK_COUNT_ESI + 1, ack[1]);
> +
> +		if (rc != 1) {
>  			ret = false;
>  			break;
>  		}
> +
> +		drm_dp_mst_hpd_irq_send_new_request(&mstm->mgr);
>  	}
>  
>  	if (!ret)
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index 32c764fb9cb5..40e855c8407c 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -815,8 +815,11 @@ void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
>  bool drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool mst_state);
>  
> -int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handled);
> -
> +int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr,
> +				    const u8 *esi,
> +				    u8 *ack,
> +				    bool *handled);
> +void drm_dp_mst_hpd_irq_send_new_request(struct drm_dp_mst_topology_mgr *mgr);
>  
>  int
>  drm_dp_mst_detect_port(struct drm_connector *connector,

-- 
Jani Nikula, Intel Open Source Graphics Center
