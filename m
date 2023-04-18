Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 196336E6686
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 16:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8257410E7BB;
	Tue, 18 Apr 2023 14:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDCF10E7BB;
 Tue, 18 Apr 2023 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681826488; x=1713362488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vjURlTqd//wThjsMTZnycpn3U2wKR1KrkFMZjbzMmf8=;
 b=jf2VOtYE0C6UitYrsXNgp73lmuWx7cLhs2U5GixPcL4c4E4RUF7jMNgj
 3NEJnoJdZxsF360KH0b1y3y/wdUntJpJr3+y49Ifahp2k5d0oFbzpv2qe
 Q6mfLfaiOtlVVCFT1culZHC/ioBzt1p0vHl0+/NT4Gl8C+2lCDt8DUg0E
 VUzB2dxsW+v/n/VdtMkR2190BHAgp307SBiyRlqzUY92vZS3LRup1TSVf
 ctN83NHSz2+ujfpF/9DmrYTsen62dSWsPG9KcDghpOaVrN3PMKlQ1Hfrc
 lLt055UJFd4EiW+ySIabhJHJiq2J4KAGm6c0BUrsf48sJymvjsvtQlizT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="410397484"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="410397484"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 07:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="834888392"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="834888392"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga001.fm.intel.com with SMTP; 18 Apr 2023 07:01:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 18 Apr 2023 17:01:22 +0300
Date: Tue, 18 Apr 2023 17:01:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>
Subject: Re: [PATCH] drm/dp_mst: Clear MSG_RDY flag before sending new message
Message-ID: <ZD6isq36T+RQ7uNK@intel.com>
References: <20230418060905.4078976-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230418060905.4078976-1-Wayne.Lin@amd.com>
X-Patchwork-Hint: comment
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
Cc: jani.nikula@intel.com, amd-gfx@lists.freedesktop.org, jerry.zuo@amd.com,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 02:09:05PM +0800, Wayne Lin wrote:
> [Why & How]
> The sequence for collecting down_reply/up_request from source
> perspective should be:
> 
> Request_n->repeat (get partial reply of Request_n->clear message ready
> flag to ack DPRX that the message is received) till all partial
> replies for Request_n are received->new Request_n+1.
> 
> While assembling partial reply packets, reading out DPCD DOWN_REP
> Sideband MSG buffer + clearing DOWN_REP_MSG_RDY flag should be
> wrapped up as a complete operation for reading out a reply packet.
> Kicking off a new request before clearing DOWN_REP_MSG_RDY flag might
> be risky. e.g. If the reply of the new request has overwritten the
> DPRX DOWN_REP Sideband MSG buffer before source writing ack to clear
> DOWN_REP_MSG_RDY flag, source then unintentionally flushes the reply
> for the new request. Should handle the up request in the same way.
> 
> In drm_dp_mst_hpd_irq(), we don't clear MSG_RDY flag before caliing
> drm_dp_mst_kick_tx(). Fix that.
> 
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Cc: stable@vger.kernel.org
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 ++
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 22 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  3 +++
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 ++
>  4 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 77277d90b6e2..5313a5656598 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3166,6 +3166,8 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
>  			for (retry = 0; retry < 3; retry++) {
>  				uint8_t wret;
>  
> +				/* MSG_RDY ack is done in drm*/
> +				esi[1] &= ~(DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY);
>  				wret = drm_dp_dpcd_write(
>  					&aconnector->dm_dp_aux.aux,
>  					dpcd_addr + 1,
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 51a46689cda7..02aad713c67c 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4054,6 +4054,9 @@ int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
>  {
>  	int ret = 0;
>  	int sc;
> +	const int tosend = 1;
> +	int retries = 0;
> +	u8 buf = 0;
>  	*handled = false;
>  	sc = DP_GET_SINK_COUNT(esi[0]);
>  
> @@ -4072,6 +4075,25 @@ int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
>  		*handled = true;
>  	}
>  
> +	if (*handled) {
> +		buf = esi[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY);
> +		do {
> +			ret = drm_dp_dpcd_write(mgr->aux,
> +						DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
> +						&buf,
> +						tosend);
> +
> +			if (ret == tosend)
> +				break;
> +
> +			retries++;
> +		} while (retries < 5);

What's with this magic retry loop?

Not sure I like the whole thing though. Splitting the irq ack
semi-randomly between driver vs. multiple helpers doesn't feel
great to me.

As a whole the HPD_IRQ handling is a total mess atm. At some point
I was trying to sketch something a bit better for it. The approach
I was thinking was something along the lines of:

 u8 vector[...];
 drm_dp_read_irq_vector(vector);
 ... handle all irqs/etc., calling suitable helpers as needed
 drm_dp_clear_irq_vector(vector);

And I was also thinking that this drm_dp_*_irq_vector() stuff
would always use the ESI layout, converting as needed from/to
the old layout for pre-1.2 (or whatever the cutoff was) devices.
That way drivers would just need the one codepath.

> +
> +		if (ret != tosend)
> +			drm_dbg_kms(mgr->dev, "failed to write dpcd 0x%x\n",
> +				    DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0);
> +	}
> +
>  	drm_dp_mst_kick_tx(mgr);
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index bf80f296a8fd..abec3de38b66 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3939,6 +3939,9 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
>  		if (!memchr_inv(ack, 0, sizeof(ack)))
>  			break;
>  
> +		/* MSG_RDY ack is done in drm*/
> +		ack[1] &= ~(DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY);
> +
>  		if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
>  			drm_dbg_kms(&i915->drm, "Failed to ack ESI\n");
>  	}
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index edcb2529b402..e905987104ed 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1336,6 +1336,8 @@ nv50_mstm_service(struct nouveau_drm *drm,
>  		if (!handled)
>  			break;
>  
> +		/* MSG_RDY ack is done in drm*/
> +		esi[1] &= ~(DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY);
>  		rc = drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1, &esi[1],
>  				       3);
>  		if (rc != 3) {
> -- 
> 2.37.3

-- 
Ville Syrjälä
Intel
