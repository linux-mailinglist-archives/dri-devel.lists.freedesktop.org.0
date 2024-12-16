Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E719F3075
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D12410E5F4;
	Mon, 16 Dec 2024 12:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQ/65wiV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A19510E5F3;
 Mon, 16 Dec 2024 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734351793; x=1765887793;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ppI5iU3AtS1G5rRYVLkr8Lo5tQOvi3yH4QlfZBVljBw=;
 b=JQ/65wiV/+Hc02e86b7t2WuZAPn2/C3yMVXNmEriMkWno4fNboYe3XoN
 ccasH9fFSmU8nD4lbosiDVBhoM5QDv4wX4BokjE0pSpwMrXL9G3OgmFEa
 S7okGhncF8yooAFf7aRa+5cUF6Pgw28vfT0tc14rHHo4kE8X6gZ1/3d8o
 acl8Kq9T5ElVyknVyhsAW93tAJDugLNnYFg2mn28bBC2TJnglJqb0r7oZ
 F+xRaf+EwTe0wIiAKTRiWdT4GityChn/GPE85rvUhiZPHYoOr38hLgBos
 suGDcqR8wz7Hv1ffuAe2jgkFU6FwRohirbiVbisIRyTewnGST8NWe3Ouk Q==;
X-CSE-ConnectionGUID: /sMpPaNNRBu32Z7ujVY6WA==
X-CSE-MsgGUID: nkJDpfTFRuyvFK2mtAufeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46142168"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="46142168"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 04:23:12 -0800
X-CSE-ConnectionGUID: ajFll0UcSZC06C7qzc497Q==
X-CSE-MsgGUID: U0og3NJWR4iOR8tTKbuWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97618896"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 04:23:10 -0800
Date: Mon, 16 Dec 2024 14:23:51 +0200
From: Imre Deak <imre.deak@intel.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 04/11] drm/dp_mst: Register connectors via
 drm_connector_dynamic_register()
Message-ID: <Z2Ab14yzMJNoRNE8@ideak-desk.fi.intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-5-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211230328.4012496-5-imre.deak@intel.com>
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

Hi Harry, Leo, Alex, Wayne,

could you please ack this change?

Thanks,
Imre

On Thu, Dec 12, 2024 at 01:03:21AM +0200, Imre Deak wrote:
> MST connectors should be initialized/registered by calling
> drm_connector_dynamic_init()/drm_connector_dynamic_register(). The
> previous patch adding these functions explains the issue with the
> current drm_connector_init*()/drm_connector_register() interface for
> MST connectors.
> 
> Based on the above adjust here the registration part and change the
> initialization part in follow-up patches for each driver.
> 
> For now, drivers are allowed to keep using the drm_connector_init*()
> functions, by drm_connector_dynamic_register() checking for this (see
> drm_connector_add()). A patch later will change this to WARN in such
> cases.
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 687c70308d82b..f8cd094efa3c0 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2281,7 +2281,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
>  		port->cached_edid = drm_edid_read_ddc(port->connector,
>  						      &port->aux.ddc);
>  
> -	drm_connector_register(port->connector);
> +	drm_connector_dynamic_register(port->connector);
>  	return;
>  
>  error:
> -- 
> 2.44.2
> 
