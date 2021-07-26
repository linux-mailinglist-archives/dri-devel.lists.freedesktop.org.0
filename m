Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 428383D57B1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23636EAD0;
	Mon, 26 Jul 2021 10:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4BF6E3A0;
 Mon, 26 Jul 2021 10:41:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="212198887"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="212198887"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:41:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="455733974"
Received: from dechasso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.115.115])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 03:41:26 -0700
Date: Mon, 26 Jul 2021 06:41:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 11/30] drm/i915/display: remove explicit CNL handling
 from intel_dp.c
Message-ID: <YP6RVNJBPlOxW6Cc@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-12-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-12-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:10:55PM -0700, Lucas De Marchi wrote:
> The only real platform with DISPLAY_VER == 10 is GLK. We don't need to
> handle CNL explicitly in intel_dp.c.
> 
> Remove code and rename functions/macros accordingly to use ICL prefix.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 35 ++++---------------------
>  1 file changed, 5 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index c386ef8eb200..db701ec5a221 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -222,29 +222,6 @@ bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp)
>  		 encoder->port != PORT_A);
>  }
>  
> -static int cnl_max_source_rate(struct intel_dp *intel_dp)
> -{
> -	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> -	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
> -	enum port port = dig_port->base.port;
> -
> -	u32 voltage = intel_de_read(dev_priv, CNL_PORT_COMP_DW3) & VOLTAGE_INFO_MASK;
> -
> -	/* Low voltage SKUs are limited to max of 5.4G */
> -	if (voltage == VOLTAGE_INFO_0_85V)
> -		return 540000;
> -
> -	/* For this SKU 8.1G is supported in all ports */
> -	if (IS_CNL_WITH_PORT_F(dev_priv))
> -		return 810000;
> -
> -	/* For other SKUs, max rate on ports A and D is 5.4G */
> -	if (port == PORT_A || port == PORT_D)
> -		return 540000;
> -
> -	return 810000;
> -}
> -
>  static int icl_max_source_rate(struct intel_dp *intel_dp)
>  {
>  	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> @@ -270,7 +247,7 @@ static void
>  intel_dp_set_source_rates(struct intel_dp *intel_dp)
>  {
>  	/* The values must be in increasing order */
> -	static const int cnl_rates[] = {
> +	static const int icl_rates[] = {
>  		162000, 216000, 270000, 324000, 432000, 540000, 648000, 810000
>  	};
>  	static const int bxt_rates[] = {
> @@ -295,12 +272,10 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
>  	drm_WARN_ON(&dev_priv->drm,
>  		    intel_dp->source_rates || intel_dp->num_source_rates);
>  
> -	if (DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv)) {
> -		source_rates = cnl_rates;
> -		size = ARRAY_SIZE(cnl_rates);
> -		if (DISPLAY_VER(dev_priv) == 10)
> -			max_rate = cnl_max_source_rate(intel_dp);
> -		else if (IS_JSL_EHL(dev_priv))
> +	if (DISPLAY_VER(dev_priv) >= 11) {
> +		source_rates = icl_rates;
> +		size = ARRAY_SIZE(icl_rates);
> +		if (IS_JSL_EHL(dev_priv))
>  			max_rate = ehl_max_source_rate(intel_dp);
>  		else
>  			max_rate = icl_max_source_rate(intel_dp);
> -- 
> 2.31.1
> 
