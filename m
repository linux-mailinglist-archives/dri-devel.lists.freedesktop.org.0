Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE7C7704C9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A1C10E724;
	Fri,  4 Aug 2023 15:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8C310E0C5;
 Fri,  4 Aug 2023 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691163158; x=1722699158;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Xb8yKtM+P1EZtxlbOf9O0+4Qcu87XixSy3+hsmzNVtA=;
 b=nK//X+67O/qPYYbWIHX1zmqp1n6VW08N+Rfv+EgidiGfYdPgB//Onxtn
 Z+TKRniRVoxzo3+lYu7f2AhT1SXhyGkr8bMhzUvTvSWOOpElksdB0WuwV
 nPS11fgQJQzGuN2HpOi5XDQ1SizQulTCkSRxG7dzUR/lA8LRfM+A2hKPp
 L/oJnjsZTJlxtpIcqxJuvOLVEDT2rr93e6jIZB59HyKKX3tig5z2l3kSp
 5rxQpP7FHo3EB3sqXSbzZrrCnxK8Uu9uk9A+jcmMgypnb/P+cXIGQqG/r
 SFCoPl9wg2ewf9EkAxefJ6FBjq3WND1zxQ/ss6YLmeyePSdPcxS8HTTqr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350486554"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="350486554"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 08:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="765154169"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="765154169"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 08:31:30 -0700
Date: Fri, 4 Aug 2023 18:31:42 +0300
From: Imre Deak <imre.deak@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>
Subject: Re: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Message-ID: <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804062029.5686-4-Wayne.Lin@amd.com>
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
Reply-To: imre.deak@intel.com
Cc: jani.nikula@intel.com, amd-gfx@lists.freedesktop.org, jerry.zuo@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote:
> [...]
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index e04f87ff755a..4270178f95f6 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3382,8 +3382,7 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part1);
>   * drm_dp_remove_payload_part2() - Remove an MST payload locally
>   * @mgr: Manager to use.
>   * @mst_state: The MST atomic state
> - * @old_payload: The payload with its old state
> - * @new_payload: The payload with its latest state
> + * @payload: The payload with its latest state
>   *
>   * Updates the starting time slots of all other payloads which would have been shifted towards
>   * the start of the payload ID table as a result of removing a payload. Driver should call this
> @@ -3392,25 +3391,36 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part1);
>   */
>  void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_dp_mst_topology_state *mst_state,
> -				 const struct drm_dp_mst_atomic_payload *old_payload,
> -				 struct drm_dp_mst_atomic_payload *new_payload)
> +				 struct drm_dp_mst_atomic_payload *payload)
>  {
>  	struct drm_dp_mst_atomic_payload *pos;
> +	u8 time_slots_to_remove;
> +	u8 next_payload_vc_start = mgr->next_start_slot;
> +
> +	/* Find the current allocated time slot number of the payload */
> +	list_for_each_entry(pos, &mst_state->payloads, next) {
> +		if (pos != payload &&
> +		    pos->vc_start_slot > payload->vc_start_slot &&
> +		    pos->vc_start_slot < next_payload_vc_start)
> +			next_payload_vc_start = pos->vc_start_slot;
> +	}
> +
> +	time_slots_to_remove = next_payload_vc_start - payload->vc_start_slot;

Imo, the intuitive way would be to pass the old payload state to this
function - which already contains the required time_slots param - and
refactor things instead moving vc_start_slot from the payload state to
mgr suggested by Ville earlier.

--Imre

>  	/* Remove local payload allocation */
>  	list_for_each_entry(pos, &mst_state->payloads, next) {
> -		if (pos != new_payload && pos->vc_start_slot > new_payload->vc_start_slot)
> -			pos->vc_start_slot -= old_payload->time_slots;
> +		if (pos != payload && pos->vc_start_slot > payload->vc_start_slot)
> +			pos->vc_start_slot -= time_slots_to_remove;
>  	}
> -	new_payload->vc_start_slot = -1;
> +	payload->vc_start_slot = -1;
>  
>  	mgr->payload_count--;
> -	mgr->next_start_slot -= old_payload->time_slots;
> +	mgr->next_start_slot -= time_slots_to_remove;
>  
> -	if (new_payload->delete)
> -		drm_dp_mst_put_port_malloc(new_payload->port);
> +	if (payload->delete)
> +		drm_dp_mst_put_port_malloc(payload->port);
>  
> -	new_payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> +	payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
>  }
