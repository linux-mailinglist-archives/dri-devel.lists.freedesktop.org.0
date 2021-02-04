Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28CE30FA4F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 18:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239DB6EE03;
	Thu,  4 Feb 2021 17:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB126EE03
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 17:54:54 +0000 (UTC)
IronPort-SDR: 9xahFuZ2cx5BaY9m+2l0AbDqb/pNQ4txf++NHjqp8L8uGGsZPvRP1oc0FYTIQBH/Mmk05YVeGQ
 TUZOfAGh1Z3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="177791176"
X-IronPort-AV: E=Sophos;i="5.81,152,1610438400"; d="scan'208";a="177791176"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 09:54:52 -0800
IronPort-SDR: 9dWjNYUlkm2cwvjBQko5dtunNIAei+xm9FbnC3lKbjjU2JFudKVrbRgTTrlxG4xCMpvlM8NiB3
 20/vC4uGCdMA==
X-IronPort-AV: E=Sophos;i="5.81,152,1610438400"; d="scan'208";a="393297016"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 09:54:51 -0800
Date: Thu, 4 Feb 2021 19:54:47 +0200
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 2/4] drm/dp_mst: Don't cache EDIDs for physical ports
Message-ID: <20210204175447.GA750296@ideak-desk.fi.intel.com>
References: <20210201120145.350258-1-imre.deak@intel.com>
 <20210201120145.350258-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201120145.350258-2-imre.deak@intel.com>
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
Cc: Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 01, 2021 at 02:01:43PM +0200, Imre Deak wrote:
> Caching EDIDs for physical ports prevents updating the EDID if a port
> gets reconnected via a Connection Status Notification message, fix this.
> 
> Fixes: db1a07956968 ("drm/dp_mst: Handle SST-only branch device case")
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Pushed patches 2-4 to drm-misc-next, thanks for the review.

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index deb7995f42fa..309afe61afdd 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2302,7 +2302,8 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
>  	}
>  
>  	if (port->pdt != DP_PEER_DEVICE_NONE &&
> -	    drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
> +	    drm_dp_mst_is_end_device(port->pdt, port->mcs) &&
> +	    port->port_num >= DP_MST_LOGICAL_PORT_0) {
>  		port->cached_edid = drm_get_edid(port->connector,
>  						 &port->aux.ddc);
>  		drm_connector_set_tile_property(port->connector);
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
