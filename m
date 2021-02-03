Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF3C30E4C8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 22:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BBF6EBF6;
	Wed,  3 Feb 2021 21:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139936EBB7;
 Wed,  3 Feb 2021 21:15:16 +0000 (UTC)
IronPort-SDR: fUmksrj/yRx+ixYOyJorZXshRf9ujVuhJDeCEabvv9OnWS0cqIIQqdIMyI1/t1ABronjzwQ2Pa
 lmbEYMhHcg8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="265950962"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="265950962"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 13:15:15 -0800
IronPort-SDR: 73OLoKlVIQ9idFotB583rxlu4y8+B/3Dy0UVHEkyzOwwNF3IlSufmgdnHFyuac8DEA3R9Km0DK
 HkM9pC72Ruyg==
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="371687075"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 13:15:13 -0800
Date: Wed, 3 Feb 2021 23:15:09 +0200
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 Thiago Macieira <gitlab@gitlab.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/dp_mst: Don't report ports connected
 if nothing is attached to them
Message-ID: <20210203211509.GA601130@ideak-desk.fi.intel.com>
References: <20210201120145.350258-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201120145.350258-1-imre.deak@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 01, 2021 at 02:01:42PM +0200, Imre Deak wrote:
> Reporting a port as connected if nothing is attached to them leads to
> any i2c transactions on this port trying to use an uninitialized i2c
> adapter, fix this.
> 
> Let's account for this case even if branch devices have no good reason
> to report a port as unplugged with their peer device type set to 'none'.
> 
> Fixes: db1a07956968 ("drm/dp_mst: Handle SST-only branch device case")
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/2987
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/1963
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: <stable@vger.kernel.org> # v5.5+
> Cc: intel-gfx@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Thanks for the report and review, I pushed this one patch to
drm-misc-fixes.

I fixed a typo in the commit message.

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index e82b596d646c..deb7995f42fa 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4224,6 +4224,7 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
>  
>  	switch (port->pdt) {
>  	case DP_PEER_DEVICE_NONE:
> +		break;
>  	case DP_PEER_DEVICE_MST_BRANCHING:
>  		if (!port->mcs)
>  			ret = connector_status_connected;
> -- 
> 2.25.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
