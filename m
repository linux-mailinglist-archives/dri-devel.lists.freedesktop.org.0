Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997CD9D3E8E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 16:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC0F10E77A;
	Wed, 20 Nov 2024 15:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLHdGyOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084AD10E771;
 Wed, 20 Nov 2024 15:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732115316; x=1763651316;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=HUU0RDLAMtZomwTvQzK6/Fc5LO8Mwc2wgLwr4ZnOTTg=;
 b=nLHdGyOMhH5ZmHdwmc/pY+ldS+U5wld+ldv6GAjT4j17ebYT+vI1JDpG
 9rDfKFtac6VX1vh3Tr3RqvVoJbI5eQm4E8aJo3UM08nTD7ZURKvjXDsLp
 nE0Ditgy5fk9D9xzIt7bD1VLFsBnLfNyXXJ3rRTlxhhEei9NgaD3kjOlY
 46uXvBLSQUT6XAHo+SYSXNqna5/TYV0XNBu1cLnm+NRO8FX5oeYxwZcPc
 vZ0Hf21ia4ZwUAxdhugpel6ZC/fKE80L4GAFXAarVVr4xmABe1BmI79ne
 y0lkjPpHQdOQJYEzf8gQoWJFo3S/sGZDeYlsmB4D5gFPJ9wDc9gVY4gn0 A==;
X-CSE-ConnectionGUID: wZfID7dUTKSoJnOtfeRTkg==
X-CSE-MsgGUID: POlGTYYJTLmKUmix+I9GvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32429615"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="32429615"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 07:08:36 -0800
X-CSE-ConnectionGUID: cwXMRjReQLyXhnqF79mGuA==
X-CSE-MsgGUID: xl/0YfkfQ0C+/J9ME9AiiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="90107555"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 07:08:34 -0800
Date: Wed, 20 Nov 2024 17:09:11 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/dp: extract drm_dp_dpcd_clear_payload()
Message-ID: <Zz37l-rL-wkA-lla@ideak-desk.fi.intel.com>
References: <cover.1731942780.git.jani.nikula@intel.com>
 <a873b0e3c59b92ba447a0f750b17dc21c38a586c.1731942780.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a873b0e3c59b92ba447a0f750b17dc21c38a586c.1731942780.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 18, 2024 at 05:14:54PM +0200, Jani Nikula wrote:
> SST with 128b/132b channel coding needs this too. Extract to a separate
> helper, independent of MST.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/display/drm_dp_helper.c       | 14 ++++++++++++++
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |  2 +-
>  include/drm/display/drm_dp_helper.h           |  1 +
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 0c9230f3f994..9b7f8393440d 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -848,6 +848,20 @@ int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
>  }
>  EXPORT_SYMBOL(drm_dp_dpcd_write_payload);
>  
> +/**
> + * drm_dp_dpcd_clear_payload() - Clear the entire VC Payload ID table
> + * @aux: DisplayPort AUX channel
> + *
> + * Clear the entire VC Payload ID table.
> + *
> + * Returns: 0 on success, negative error code on errors.
> + */
> +int drm_dp_dpcd_clear_payload(struct drm_dp_aux *aux)
> +{
> +	return drm_dp_dpcd_write_payload(aux, 0, 0, 0x3f);
> +}
> +EXPORT_SYMBOL(drm_dp_dpcd_clear_payload);
> +
>  /**
>   * drm_dp_dpcd_poll_act_handled() - Polls for ACT handled status.
>   * @aux: DisplayPort AUX channel
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index a426d13a7a36..307ce0981e2c 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3679,7 +3679,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>  			goto out_unlock;
>  
>  		/* Write reset payload */
> -		drm_dp_dpcd_write_payload(mgr->aux, 0, 0, 0x3f);
> +		drm_dp_dpcd_clear_payload(mgr->aux);
>  
>  		drm_dp_mst_queue_probe_work(mgr);
>  
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 69793815aa82..8f4054a56039 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -569,6 +569,7 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
>  
>  int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
>  			      int vcpid, u8 start_time_slot, u8 time_slot_count);
> +int drm_dp_dpcd_clear_payload(struct drm_dp_aux *aux);
>  int drm_dp_dpcd_poll_act_handled(struct drm_dp_aux *aux, int timeout_ms);
>  
>  bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> -- 
> 2.39.5
> 
