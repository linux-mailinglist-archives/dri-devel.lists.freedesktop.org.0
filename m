Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDE79EE3DD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0B310ED3C;
	Thu, 12 Dec 2024 10:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IF/ZIEG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B0710ED3B;
 Thu, 12 Dec 2024 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733998447; x=1765534447;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jDZef+jGNNHebWGw8VxqbHDA0R3+MI7QBiM3c8C5oDo=;
 b=IF/ZIEG3Tjk40LPjjbI4Me7tf33O6bw66LHYIp1yqIl0I+3l3jyCezLL
 1aWlnXrs190hMNSpyPsZeEeRR9go0G2IUuWXYnhPWsBzYc0fW6lJHYXqd
 D9j1ayuJv73csHib5yZXyEA/swB8dCzpR8/pGjykFUUStGZwHMhyidaUI
 PYDCyMPIoAcyu8kkU8fqeHYZJquBX3yWqp4cfnbWkHvXeNuW8Yk5Buca+
 PT2VYGT8uKvNTcWTlVG0/oakga1S0QbXvjmdHf0JKlYSSTZQ8rNZHZcvQ
 GL1rjKDTIjFOnLz/EZYinIzigGgQh1QFj0py6LDH0wJZhlRTl20LYCz6S A==;
X-CSE-ConnectionGUID: vvRVpB7EQYW6tLAt2FPXXQ==
X-CSE-MsgGUID: YXhPOusUQ8CE7MDn/D+Inw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34537240"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="34537240"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:14:07 -0800
X-CSE-ConnectionGUID: IVdPDe+CSgG6u5Xl0GPO+A==
X-CSE-MsgGUID: SVbPFxI+SDmnUXpoBAqc9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96025669"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.101])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:14:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Wayne Lin
 <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Lyude Paul
 <lyude@redhat.com>
Subject: Re: [PATCH v3 06/11] drm/amd/dp_mst: Expose a connector to kernel
 users after it's properly initialized
In-Reply-To: <20241211230328.4012496-7-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-7-imre.deak@intel.com>
Date: Thu, 12 Dec 2024 12:14:00 +0200
Message-ID: <875xnpxl7b.fsf@intel.com>
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

On Thu, 12 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> After a connector is added to the drm_mode_config::connector_list, it's
> visible to any in-kernel users looking up connectors via the above list.
> Make sure that the connector is properly initialized before such
> look-ups, by initializing the connector with
> drm_connector_dynamic_register() - which doesn't add the connector to
> the list - and registering it with drm_connector_dynamic_register() -
> which adds the connector to the list - after the initialization is
> complete.
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 6e43594906130..d398bc74e6677 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -590,11 +590,12 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
>  	amdgpu_dm_set_mst_status(&aconnector->mst_status,
>  			MST_PROBE, true);
>  
> -	if (drm_connector_init(
> +	if (drm_connector_dynamic_init(
>  		dev,
>  		connector,
>  		&dm_dp_mst_connector_funcs,
> -		DRM_MODE_CONNECTOR_DisplayPort)) {
> +		DRM_MODE_CONNECTOR_DisplayPort,
> +		NULL)) {
>  		kfree(aconnector);
>  		return NULL;
>  	}

-- 
Jani Nikula, Intel
