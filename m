Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81979EE3EE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79E410ED46;
	Thu, 12 Dec 2024 10:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cf261ujK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E71F10ED3F;
 Thu, 12 Dec 2024 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733998600; x=1765534600;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zCh/UzTkFL0jjQ9IuFfHH/4qhCuxTEq14htbvrn3yIM=;
 b=cf261ujKfeS96Mqv/B+GYo2q7fGvUhzeorcPPqAFFoG4IEpx83va27t9
 nTYzfo3TZj+5J9BxGodTILAcCy1+3sE7mqK/8ffuyl5wGpwT9W6SmQ/7p
 1HODEXL0DzdxPy+hDfn01BP1ihLC9QheJCGjcOazZmgaKTtx4s7JDabMt
 tYMWhtBpFhF0zyzPihZJNao4MVTwFA5Ap3rrO895QlhQaH0nXUSvwQwwk
 mKnB9lIv4RdOBd523EQZPL/ij27Dt5spCeEllsNRFUxTswh3xaPF3QzWc
 2LWK+lUYawEwY29NQECBxkubWXgpWtwL9zYXZdfOAnPh6nai+7plSMIkT Q==;
X-CSE-ConnectionGUID: sf7QOyhDS+6zulnLEKKTZQ==
X-CSE-MsgGUID: fK/vJjkRROCuFWqEFDuXFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="21999627"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="21999627"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:16:40 -0800
X-CSE-ConnectionGUID: P3pcYGemRsmZocPggT8deg==
X-CSE-MsgGUID: KfqVL4cqSjK2KoPSFXyr7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="96079084"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.101])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 02:16:38 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 10/11] drm/i915/dp_mst: Fix error handling while
 adding a connector
In-Reply-To: <20241211230328.4012496-11-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241211230328.4012496-1-imre.deak@intel.com>
 <20241211230328.4012496-11-imre.deak@intel.com>
Date: Thu, 12 Dec 2024 12:16:34 +0200
Message-ID: <87wmg5w6il.fsf@intel.com>
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
> After an error during adding an MST connector the MST port and the
> intel_connector object could be leaked, fix this up.
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index debe4d0eee11f..99f08e31fd6e0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1743,11 +1743,8 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>  
>  	ret = drm_connector_dynamic_init(display->drm, connector, &mst_connector_funcs,
>  					 DRM_MODE_CONNECTOR_DisplayPort, NULL);
> -	if (ret) {
> -		drm_dp_mst_put_port_malloc(port);
> -		intel_connector_free(intel_connector);
> -		return NULL;
> -	}
> +	if (ret)
> +		goto err_put_port;
>  
>  	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
>  	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> @@ -1762,12 +1759,12 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>  
>  		ret = drm_connector_attach_encoder(&intel_connector->base, enc);
>  		if (ret)
> -			goto err;
> +			goto err_cleanup_connector;
>  	}
>  
>  	ret = mst_topology_add_connector_properties(intel_dp, connector, pathprop);
>  	if (ret)
> -		goto err;
> +		goto err_cleanup_connector;
>  
>  	ret = intel_dp_hdcp_init(dig_port, intel_connector);
>  	if (ret)
> @@ -1776,8 +1773,12 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>  
>  	return connector;
>  
> -err:
> +err_cleanup_connector:
>  	drm_connector_cleanup(connector);
> +err_put_port:
> +	drm_dp_mst_put_port_malloc(port);
> +	intel_connector_free(intel_connector);
> +
>  	return NULL;
>  }

-- 
Jani Nikula, Intel
