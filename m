Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5862E3D4908
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 20:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5176E139;
	Sat, 24 Jul 2021 18:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756386E139;
 Sat, 24 Jul 2021 18:05:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10055"; a="273137794"
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; d="scan'208";a="273137794"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 11:05:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; d="scan'208";a="436009063"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2021 11:05:09 -0700
Date: Sat, 24 Jul 2021 11:05:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 03/30] drm/i915/display: remove PORT_F workaround for CNL
Message-ID: <20210724180507.GK1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-4-lucas.demarchi@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Jose Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:10:47PM -0700, Lucas De Marchi wrote:
> Explicit support for CNL is being removed from the driver as it's not
> expected to work. Remove the workaround for PORT_F from
> display/intel_bios.c so we can also remove the generic DISPLAY_VER == 10
> calls to intel_ddi_init(): the only platform with that display version
> is already handled separately (GLK).
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_bios.c    | 6 +++---
>  drivers/gpu/drm/i915/display/intel_display.c | 7 -------
>  2 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index aa667fa71158..4172c8ee6aa6 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -1871,12 +1871,12 @@ intel_bios_encoder_supports_edp(const struct intel_bios_encoder_data *devdata)
>  static bool is_port_valid(struct drm_i915_private *i915, enum port port)
>  {
>  	/*
> -	 * On some ICL/CNL SKUs port F is not present, but broken VBTs mark
> +	 * On some ICL SKUs port F is not present, but broken VBTs mark
>  	 * the port as present. Only try to initialize port F for the
>  	 * SKUs that may actually have it.
>  	 */
> -	if (port == PORT_F && (IS_ICELAKE(i915) || IS_CANNONLAKE(i915)))
> -		return IS_ICL_WITH_PORT_F(i915) || IS_CNL_WITH_PORT_F(i915);
> +	if (port == PORT_F && IS_ICELAKE(i915))
> +		return IS_ICL_WITH_PORT_F(i915);
>  
>  	return true;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 4633d4e00e6b..ee6d5f8de24b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -11409,13 +11409,6 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
>  		intel_ddi_init(dev_priv, PORT_B);
>  		intel_ddi_init(dev_priv, PORT_C);
>  		vlv_dsi_init(dev_priv);
> -	} else if (DISPLAY_VER(dev_priv) == 10) {
> -		intel_ddi_init(dev_priv, PORT_A);
> -		intel_ddi_init(dev_priv, PORT_B);
> -		intel_ddi_init(dev_priv, PORT_C);
> -		intel_ddi_init(dev_priv, PORT_D);
> -		intel_ddi_init(dev_priv, PORT_E);
> -		intel_ddi_init(dev_priv, PORT_F);
>  	} else if (DISPLAY_VER(dev_priv) >= 9) {
>  		intel_ddi_init(dev_priv, PORT_A);
>  		intel_ddi_init(dev_priv, PORT_B);
> -- 
> 2.31.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
