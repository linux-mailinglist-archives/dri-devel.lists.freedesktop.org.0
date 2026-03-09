Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H9wAZ7Grmn2IgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:09:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7173F239762
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B7E10E17B;
	Mon,  9 Mar 2026 13:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvpx3tSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1C110E143;
 Mon,  9 Mar 2026 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773061756; x=1804597756;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=u9u+zFnkWX7+UuFbyYJjNod438KKay8ZOiIFuachPpI=;
 b=bvpx3tSRXuAe8c1WSa/4EfNJXBUg199HSwzPjCbG93vEA+QBHzDZQ7wF
 XgHS0CO9/b1TaOswuErkUSl+EwVBKF7ZTbZZO8wCN4s7Y7CwStf3gZh1t
 oADsO5F4SwRTKa7OlqsDrj6F8Uxw+sA3gaWAKr/ySa2Y0NyEVpbgUtHlH
 7pTyxnNKrBbdsfR+rb20t7mh8Dl5lWVpwOqQvsffVmqh276JDHyHTNMmg
 o3XzhsG0Qdqmny43I/oajO2uRp5lLy4VWmU7E8ohCbMKeiaumMC9J5N5j
 Jt3ZfxXUDdB6uRDY6W7jfZsVZe1Qysk9vNuJY63C5uYD3ihnvhRzWhc2K A==;
X-CSE-ConnectionGUID: QOMCQIyHRNyY3ZlA4TjBdw==
X-CSE-MsgGUID: 8eAJSnzPQ6CouvtPCWhB0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99554070"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="99554070"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 06:09:16 -0700
X-CSE-ConnectionGUID: jZW2Od5kQoCCPbDMRrnxFQ==
X-CSE-MsgGUID: N94paUe8QBCk+bwTDmJmLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219731691"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 06:09:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, Simona Vetter
 <simona@ffwll.ch>, ville.syrjala@linux.intel.com, suraj.kandpal@intel.com,
 imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Arun R
 Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH RFC 3/3] drm/i915/dp: Configure PORT_AUX_CTL and then
 trigger the tx
In-Reply-To: <20260309-dp_aux_timeout-v1-3-08c610a63a84@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260309-dp_aux_timeout-v1-0-08c610a63a84@intel.com>
 <20260309-dp_aux_timeout-v1-3-08c610a63a84@intel.com>
Date: Mon, 09 Mar 2026 15:09:08 +0200
Message-ID: <63a9df004fb9843a54b8c7702102d2dc0cc3d948@intel.com>
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
X-Rspamd-Queue-Id: 7173F239762
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, 09 Mar 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Use re_rmw and update the required bits for PORT_AUX_CTL and drop the
> bit configurations that are not required(AUX Power Request setting of
> bit 19). Also break writing to PORT_AUX_CTL into 2 steps with first step
> for doing the configuration/settings and then second write to trigger
> the AUX transaction.

The primary question the commit message should answer is, "Why?"

There's a whole lot of "What?" here, indeed too much since the patch is
doing too many things in one go.

The point of an RFC patch is to solicit feedback on the idea. But the
idea remains vague here as there's no rationale why this is needed.


BR,
Jani.


>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h |  6 +-
>  drivers/gpu/drm/i915/display/intel_dp_aux.c        | 83 ++++++++++++++--------
>  drivers/gpu/drm/i915/display/intel_psr.c           | 29 +++++---
>  3 files changed, 76 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index e189f8c39ccb440f99cd642de177b18f3b605753..341749452579acfc3e08715d2f0b211bf6489dd9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1882,10 +1882,10 @@ struct intel_dp {
>  
>  	u32 (*get_aux_clock_divider)(struct intel_dp *dp, int index);
>  	/*
> -	 * This function returns the value we have to program the AUX_CTL
> -	 * register with to kick off an AUX transaction.
> +	 * This function programs the configuration/settings for the AUX_CTL
> +	 * register but dont kick off an AUX transaction.
>  	 */
> -	u32 (*get_aux_send_ctl)(struct intel_dp *dp, int send_bytes,
> +	void (*get_aux_send_ctl)(struct intel_dp *dp, int send_bytes,
>  				u32 aux_clock_divider);
>  
>  	i915_reg_t (*aux_ch_ctl_reg)(struct intel_dp *dp);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index 0a9e2d6cdbc5d9e0d17b2db60a32cf20a3bad6b6..4fef378e0a8fbf79211fd98913e507e90b2b48ea 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -175,12 +175,13 @@ static int g4x_dp_aux_precharge_len(void)
>  		precharge_min - preamble) / 2;
>  }
>  
> -static u32 g4x_get_aux_send_ctl(struct intel_dp *intel_dp,
> -				int send_bytes,
> -				u32 aux_clock_divider)
> +static void g4x_get_aux_send_ctl(struct intel_dp *intel_dp,
> +				 int send_bytes,
> +				 u32 aux_clock_divider)
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
> -	u32 timeout;
> +	i915_reg_t ch_ctl = intel_dp->aux_ch_ctl_reg(intel_dp);
> +	u32 timeout, value;
>  
>  	/* Max timeout value on G4x-BDW: 1.6ms */
>  	if (display->platform.broadwell)
> @@ -188,8 +189,7 @@ static u32 g4x_get_aux_send_ctl(struct intel_dp *intel_dp,
>  	else
>  		timeout = DP_AUX_CH_CTL_TIME_OUT_400us;
>  
> -	return DP_AUX_CH_CTL_SEND_BUSY |
> -		DP_AUX_CH_CTL_DONE |
> +	value = DP_AUX_CH_CTL_DONE |
>  		DP_AUX_CH_CTL_INTERRUPT |
>  		DP_AUX_CH_CTL_TIME_OUT_ERROR |
>  		timeout |
> @@ -197,23 +197,35 @@ static u32 g4x_get_aux_send_ctl(struct intel_dp *intel_dp,
>  		DP_AUX_CH_CTL_MESSAGE_SIZE(send_bytes) |
>  		DP_AUX_CH_CTL_PRECHARGE_2US(g4x_dp_aux_precharge_len()) |
>  		DP_AUX_CH_CTL_BIT_CLOCK_2X(aux_clock_divider);
> +
> +	intel_de_rmw(display, ch_ctl,
> +		     (DP_AUX_CH_CTL_DONE |
> +		      DP_AUX_CH_CTL_INTERRUPT |
> +		      DP_AUX_CH_CTL_TIME_OUT_ERROR |
> +		      DP_AUX_CH_CTL_TIME_OUT_MASK |
> +		      DP_AUX_CH_CTL_RECEIVE_ERROR |
> +		      DP_AUX_CH_CTL_MESSAGE_SIZE_MASK |
> +		      DP_AUX_CH_CTL_PRECHARGE_2US_MASK |
> +		      DP_AUX_CH_CTL_BIT_CLOCK_2X_MASK),
> +		     value);
> +	return;
>  }
>  
> -static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
> -				int send_bytes,
> -				u32 unused)
> +static void skl_get_aux_send_ctl(struct intel_dp *intel_dp,
> +				 int send_bytes,
> +				 u32 unused)
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
>  	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> -	u32 ret;
> +	i915_reg_t ch_ctl = intel_dp->aux_ch_ctl_reg(intel_dp);
> +	u32 value;
>  
>  	/*
>  	 * Max timeout values:
>  	 * SKL-GLK: 1.6ms
>  	 * ICL+: 4ms
>  	 */
> -	ret = DP_AUX_CH_CTL_SEND_BUSY |
> -		DP_AUX_CH_CTL_DONE |
> +	value = DP_AUX_CH_CTL_DONE |
>  		DP_AUX_CH_CTL_INTERRUPT |
>  		DP_AUX_CH_CTL_TIME_OUT_ERROR |
>  		DP_AUX_CH_CTL_TIME_OUT_MAX |
> @@ -222,17 +234,22 @@ static u32 skl_get_aux_send_ctl(struct intel_dp *intel_dp,
>  		DP_AUX_CH_CTL_FW_SYNC_PULSE_SKL(intel_dp_aux_fw_sync_len(intel_dp)) |
>  		DP_AUX_CH_CTL_SYNC_PULSE_SKL(intel_dp_aux_sync_len());
>  
> -	if (intel_tc_port_in_tbt_alt_mode(dig_port))
> -		ret |= DP_AUX_CH_CTL_TBT_IO;
> +	intel_de_rmw(display, ch_ctl,
> +		     (DP_AUX_CH_CTL_DONE |
> +		      DP_AUX_CH_CTL_INTERRUPT |
> +		      DP_AUX_CH_CTL_TIME_OUT_ERROR |
> +		      DP_AUX_CH_CTL_TIME_OUT_MASK |
> +		      DP_AUX_CH_CTL_RECEIVE_ERROR |
> +		      DP_AUX_CH_CTL_MESSAGE_SIZE_MASK |
> +		      DP_AUX_CH_CTL_FW_SYNC_PULSE_SKL_MASK |
> +		      DP_AUX_CH_CTL_SYNC_PULSE_SKL_MASK),
> +		     value);
>  
> -	/*
> -	 * Power request bit is already set during aux power well enable.
> -	 * Preserve the bit across aux transactions.
> -	 */
> -	if (DISPLAY_VER(display) >= 14)
> -		ret |= XELPDP_DP_AUX_CH_CTL_POWER_REQUEST;
> +	if (intel_tc_port_in_tbt_alt_mode(dig_port))
> +		intel_de_rmw(display, ch_ctl, DP_AUX_CH_CTL_TBT_IO,
> +			     DP_AUX_CH_CTL_TBT_IO);
>  
> -	return ret;
> +	return;
>  }
>  
>  static int
> @@ -341,11 +358,12 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	}
>  
>  	while ((aux_clock_divider = intel_dp->get_aux_clock_divider(intel_dp, clock++))) {
> -		u32 send_ctl = intel_dp->get_aux_send_ctl(intel_dp,
> -							  send_bytes,
> -							  aux_clock_divider);
> +		intel_dp->get_aux_send_ctl(intel_dp, send_bytes,
> +					   aux_clock_divider);
>  
> -		send_ctl |= aux_send_ctl_flags;
> +		/* Update the flags */
> +		intel_de_rmw(display, ch_ctl, DP_AUX_CH_CTL_AUX_AKSV_SELECT,
> +			     aux_send_ctl_flags);
>  
>  		/* Must try at least 3 times according to DP spec */
>  		for (try = 0; try < 5; try++) {
> @@ -356,15 +374,20 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  								 send_bytes - i));
>  
>  			/* Send the command and wait for it to complete */
> -			intel_de_write(display, ch_ctl, send_ctl);
> +			intel_de_rmw(display, ch_ctl,
> +				     DP_AUX_CH_CTL_SEND_BUSY,
> +				     DP_AUX_CH_CTL_SEND_BUSY);
>  
>  			status = intel_dp_aux_wait_done(intel_dp);
>  
>  			/* Clear done status and any errors */
> -			intel_de_write(display, ch_ctl,
> -				       status | DP_AUX_CH_CTL_DONE |
> -				       DP_AUX_CH_CTL_TIME_OUT_ERROR |
> -				       DP_AUX_CH_CTL_RECEIVE_ERROR);
> +			intel_de_rmw(display, ch_ctl,
> +				     (DP_AUX_CH_CTL_DONE |
> +				      DP_AUX_CH_CTL_TIME_OUT_ERROR |
> +				      DP_AUX_CH_CTL_RECEIVE_ERROR),
> +				     (DP_AUX_CH_CTL_DONE |
> +				      DP_AUX_CH_CTL_TIME_OUT_ERROR |
> +				      DP_AUX_CH_CTL_RECEIVE_ERROR));
>  
>  			/*
>  			 * DP CTS 1.2 Core Rev 1.1, 4.2.1.1 & 4.2.1.2
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 9296ca3a4ff468a6e61babd81217e4ba19b15062..e06e04f20355d511e5c58fc28866aa763fd65a4b 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -722,7 +722,9 @@ static void hsw_psr_setup_aux(struct intel_dp *intel_dp)
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
>  	enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
> +	i915_reg_t ch_ctl = psr_aux_ctl_reg(display, cpu_transcoder);
>  	u32 aux_clock_divider, aux_ctl;
> +
>  	/* write DP_SET_POWER=D0 */
>  	static const u8 aux_msg[] = {
>  		[0] = (DP_AUX_NATIVE_WRITE << 4) | ((DP_SET_POWER >> 16) & 0xf),
> @@ -742,17 +744,26 @@ static void hsw_psr_setup_aux(struct intel_dp *intel_dp)
>  	aux_clock_divider = intel_dp->get_aux_clock_divider(intel_dp, 0);
>  
>  	/* Start with bits set for DDI_AUX_CTL register */
> -	aux_ctl = intel_dp->get_aux_send_ctl(intel_dp, sizeof(aux_msg),
> -					     aux_clock_divider);
> +	intel_dp->get_aux_send_ctl(intel_dp, sizeof(aux_msg),
> +				   aux_clock_divider);
>  
>  	/* Select only valid bits for SRD_AUX_CTL */
> -	aux_ctl &= EDP_PSR_AUX_CTL_TIME_OUT_MASK |
> -		EDP_PSR_AUX_CTL_MESSAGE_SIZE_MASK |
> -		EDP_PSR_AUX_CTL_PRECHARGE_2US_MASK |
> -		EDP_PSR_AUX_CTL_BIT_CLOCK_2X_MASK;
> -
> -	intel_de_write(display, psr_aux_ctl_reg(display, cpu_transcoder),
> -		       aux_ctl);
> +	aux_ctl = EDP_PSR_AUX_CTL_TIME_OUT_MASK |
> +		  EDP_PSR_AUX_CTL_MESSAGE_SIZE_MASK |
> +		  EDP_PSR_AUX_CTL_PRECHARGE_2US_MASK |
> +		  EDP_PSR_AUX_CTL_BIT_CLOCK_2X_MASK;
> +
> +	intel_de_rmw(display, ch_ctl,
> +		     (EDP_PSR_AUX_CTL_TIME_OUT_MASK |
> +		      EDP_PSR_AUX_CTL_MESSAGE_SIZE_MASK |
> +		      EDP_PSR_AUX_CTL_PRECHARGE_2US_MASK |
> +		      EDP_PSR_AUX_CTL_BIT_CLOCK_2X_MASK),
> +		     aux_ctl);
> +
> +	/* Send the command or intitate the AUX transaction */
> +	intel_de_rmw(display, ch_ctl,
> +		     DP_AUX_CH_CTL_SEND_BUSY,
> +		     DP_AUX_CH_CTL_SEND_BUSY);
>  }
>  
>  static bool psr2_su_region_et_valid(struct intel_connector *connector, bool panel_replay)

-- 
Jani Nikula, Intel
