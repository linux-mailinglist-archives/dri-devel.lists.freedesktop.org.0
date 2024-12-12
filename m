Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C29EE3D1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D943510E082;
	Thu, 12 Dec 2024 10:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuxlLRiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A0C10E082;
 Thu, 12 Dec 2024 10:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733998342; x=1765534342;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Bx2m/CkVeM/Ue/kb2GRFV8CoNe2XocKmLebDfW1bh7k=;
 b=SuxlLRiudtoAcp8y77+M/6xrP4ZaD5CI3/R24XKWNPkaHt7KwSQURdob
 +WuJy84TwJjAGuC8C5KfTA7apoWsK7WPNrjDj+cbVVcQ6AOZK9IcKLhLo
 QJK4K6cBrHTQJUVwwJCTNOEt2Eqayo2p14euZ0WY+rwKuKSf3uHQKZi3m
 6s/5cuZdFFHtSeknOWGD1DLGEZg6vvMl7CVe4hvQoj1veFgkGqF8SLaVd
 Ik7WdzlWwjH0H/V5WR50Ef/WbfwzeDHAhpfj8HzVJUKMaV2i4AaT5iZXa
 Ib3OEOVyfeOk56B2Ki2sGApnHcO7FYPa5wEXvSlV/pSPhNNw02j+vwdsN w==;
X-CSE-ConnectionGUID: SoD8kby8QxKTJ77cy+qmhw==
X-CSE-MsgGUID: tVNCqrDMQ/6HbWeOguEMpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51936264"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="51936264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:12:21 -0800
X-CSE-ConnectionGUID: VvZiCuVNR9+CtpZEtcCXsQ==
X-CSE-MsgGUID: ZODWwVs/SMSnswIjmaE0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133571846"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:12:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>, Harry
 Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Wayne Lin
 <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Karol
 Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 04/11] drm/dp_mst: Register connectors via
 drm_connector_dynamic_register()
In-Reply-To: <20241211230328.4012496-5-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-5-imre.deak@intel.com>
Date: Thu, 12 Dec 2024 12:12:15 +0200
Message-ID: <87bjxhxla8.fsf@intel.com>
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
> MST connectors should be initialized/registered by calling
> drm_connector_dynamic_init()/drm_connector_dynamic_register(). The
> previous patch adding these functions explains the issue with the

References to "previous patch" become meaningless after this has been
committed.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

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

-- 
Jani Nikula, Intel
