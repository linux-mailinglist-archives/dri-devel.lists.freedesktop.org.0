Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57678727FF1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 14:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1B710E256;
	Thu,  8 Jun 2023 12:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C0810E256;
 Thu,  8 Jun 2023 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686227194; x=1717763194;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lpwSug0A9uVIJP0rYqaNApuqhZnBfSjaRcLAHDOIRCI=;
 b=BOI/mD7ozNiFppZZw1kbRjKZobkbz+f4JaJ8FEdXa955R148i9hzkbUN
 8QVOF/u5AXhiKNTzjriXnGSh2Kb8PwOSxem12lPAFRiRI0fnzk/qgKtIq
 VSMj7JHh4PDlzFeauI/iTcEu7Z8iG45OPktecezj54ABz/AufwW4ikKSy
 JRmNxIm3VfwTlg4A4YFUEC7MnTKMtiILYLKUiinNUSqmdGtb0jHF/V5Hk
 /d6PLZ+Z2mlxxmDGwogcF1FYlkNuG5xXDazQ517d+8dg0IVgEPVn7gR7D
 SksyFYUNZWHZBNcXUK2kwKHQ0UQlyV1AE/ToiMnOofFgpmuEOR1neQUb3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354778142"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="354778142"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 05:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="1040087851"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="1040087851"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 05:26:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/dp_mst: Clear MSG_RDY flag before sending new
 message
In-Reply-To: <20230608114316.3078024-1-Wayne.Lin@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230608114316.3078024-1-Wayne.Lin@amd.com>
Date: Thu, 08 Jun 2023 15:26:10 +0300
Message-ID: <87a5xarvh9.fsf@intel.com>
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
Cc: stable@vger.kernel.org, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 Jun 2023, Wayne Lin <Wayne.Lin@amd.com> wrote:
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
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Cc: stable@vger.kernel.org
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 33 ++++++------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 54 ++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp.c       |  7 +--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 12 +++--
>  include/drm/display/drm_dp_mst_helper.h       |  7 ++-
>  5 files changed, 82 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d5cec03eaa8d..597c3368bcfb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3236,6 +3236,7 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
>  {
>  	u8 esi[DP_PSR_ERROR_STATUS - DP_SINK_COUNT_ESI] = { 0 };
>  	u8 dret;
> +	u8 ack;
>  	bool new_irq_handled = false;
>  	int dpcd_addr;
>  	int dpcd_bytes_to_read;
> @@ -3265,34 +3266,36 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
>  		process_count < max_process_count) {
>  		u8 retry;
>  		dret = 0;
> +		ack = 0;
>  
>  		process_count++;
>  
>  		DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0], esi[1], esi[2]);
>  		/* handle HPD short pulse irq */
>  		if (aconnector->mst_mgr.mst_state)
> -			drm_dp_mst_hpd_irq(
> -				&aconnector->mst_mgr,
> -				esi,
> -				&new_irq_handled);
> +			drm_dp_mst_hpd_irq_handle_event(&aconnector->mst_mgr,
> +							esi,
> +							&ack,
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
> +							  ack);
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
> index 38dab76ae69e..3a018f5b604c 100644
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
> + * @ack: flags of events to ack
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
> +		*ack |= DP_DOWN_REP_MSG_RDY;

My idea was that esi and ack would be the same size buffers, so the
caller wouldn't have to worry where exactly to point ack to.

I think the asymmetry here is misleading, with ack and esi having to
point at different locations.

BR,
Jani.



>  	}
>  
>  	if (esi[1] & DP_UP_REQ_MSG_RDY) {
>  		ret |= drm_dp_mst_handle_up_req(mgr);
>  		*handled = true;
> +		*ack |= DP_UP_REQ_MSG_RDY;
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
> index 4bec8cd7979f..f24602887015 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4062,9 +4062,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 *esi, u8 *ack)
>  {
>  	bool handled = false;
>  
> -	drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
> -	if (handled)
> -		ack[1] |= esi[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY);
> +	drm_dp_mst_hpd_irq_handle_event(&intel_dp->mst_mgr, esi, &ack[1], &handled);
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
> index 9b6824f6b9e4..b2d9978e88a8 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1357,6 +1357,7 @@ nv50_mstm_service(struct nouveau_drm *drm,
>  	bool handled = true, ret = true;
>  	int rc;
>  	u8 esi[8] = {};
> +	u8 ack;
>  
>  	while (handled) {
>  		rc = drm_dp_dpcd_read(aux, DP_SINK_COUNT_ESI, esi, 8);
> @@ -1365,16 +1366,19 @@ nv50_mstm_service(struct nouveau_drm *drm,
>  			break;
>  		}
>  
> -		drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
> +		ack = 0;
> +		drm_dp_mst_hpd_irq_handle_event(&mstm->mgr, esi, &ack, &handled);
>  		if (!handled)
>  			break;
>  
> -		rc = drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1, &esi[1],
> -				       3);
> -		if (rc != 3) {
> +		rc = drm_dp_dpcd_writeb(aux, DP_SINK_COUNT_ESI + 1, ack);
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
