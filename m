Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0965484AF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCB010E373;
	Mon, 13 Jun 2022 11:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A6410E373;
 Mon, 13 Jun 2022 11:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655118324; x=1686654324;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eIB02uYfoFOCupkui0GuirERC+/vNh+am4bXH4TCy64=;
 b=EgA4yO5fxmWLco+7z6TA7D6k+2Ch8nQ0G81uL9bpWTx2+pDdu/BtFVh5
 +D6Ck+2cD4vbS8P1WHXv4M2AnijteJXlWmPhyd9Md0vDJ0H/v+E0fLKHz
 auwrBbA7XRFGWUWRvD5Gwg5BUCeIOACF3tIGAPseKVMJk3XSNeN78gesP
 7LmUi2tnTBtXnb4jLLW93LlwqX4Jiok2pKc9Zx4WK8G8Ds4Gwyp1lep+D
 SQet6Dg7n/YFyEVdmdRhL5+iaU4/FcdzSgzYzkEr22KSjt+QresDRRKX/
 7fEMrjyhXvslRrAsDovSUcDHSOgKsMYyG8iGsgzKt13lM9b4PdQsatGp2 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="266939468"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="266939468"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 04:05:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="639674205"
Received: from njascanu-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.47.149])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 04:05:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Re-add check for low voltage sku for
 max dp source rate
In-Reply-To: <20220613102241.9236-1-Jason@zx2c4.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220613102241.9236-1-Jason@zx2c4.com>
Date: Mon, 13 Jun 2022 14:05:17 +0300
Message-ID: <87edzszuvm.fsf@intel.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> This reverts commit 73867c8709b569cdd7fda67f01dfe02c8d055521, which, on
> an i7-11850H iGPU with a Thinkpad X1 Extreme Gen 4, attached to a LG
> LP160UQ1-SPB1 embedded panel, causes wild flickering glitching
> technicolor pyrotechnics on resumption from suspend. The display shows
> strobing colors in an utter disaster explosion of pantone, as though
> bombs were dropped on the leprechauns at the base of the rainbow.
>
> Rebooting the machine fixes the issue, presumably because the display is
> initialized by firmware rather than by i915. Otherwise, the GPU appears
> to work fine.
>
> Bisection traced it back to this commit, which makes sense given the
> issues.

Thanks for putting in the effort to bisect, and the patch.

As the commit message of the regressing commit suggests, the VBT (Video
BIOS Tables) should contain the info about max rates, filled in by the
OEM. Unfortunately, we were missing some of the checks,
e.g. 24b8b74eb2eb ("drm/i915: Parse max link rate from the eDP BDB
block") added to drm-intel-next just recently.

Unfortunately, gitlab is down today so I can't check if you already
tried drm-tip [1]; that might be helpful. Also, attaching
/sys/kernel/debug/dri/0/i915_vbt might be useful to see if the
limitation is there.

If your system works with the limitations from VBT, *and* the commits
adding that support are trivial to backport to v5.19, I'm inclined to do
that instead of the revert. But obviously the revert is the way to go if
that doesn't happen.

BR,
Jani.


[1] drm-tip branch of https://cgit.freedesktop.org/drm/drm-tip


>
> Fixes: 73867c8709b5 ("drm/i915/display: Remove check for low voltage sku for max dp source rate")
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Animesh Manna <animesh.manna@intel.com>
> Cc: Jani Saarinen <jani.saarinen@intel.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 32 ++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index e4a79c11fd25..ff67899522cf 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -388,13 +388,23 @@ static int dg2_max_source_rate(struct intel_dp *intel_dp)
>  	return intel_dp_is_edp(intel_dp) ? 810000 : 1350000;
>  }
>  
> +static bool is_low_voltage_sku(struct drm_i915_private *i915, enum phy phy)
> +{
> +	u32 voltage;
> +
> +	voltage = intel_de_read(i915, ICL_PORT_COMP_DW3(phy)) & VOLTAGE_INFO_MASK;
> +
> +	return voltage == VOLTAGE_INFO_0_85V;
> +}
> +
>  static int icl_max_source_rate(struct intel_dp *intel_dp)
>  {
>  	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
>  	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
>  	enum phy phy = intel_port_to_phy(dev_priv, dig_port->base.port);
>  
> -	if (intel_phy_is_combo(dev_priv, phy) && !intel_dp_is_edp(intel_dp))
> +	if (intel_phy_is_combo(dev_priv, phy) &&
> +	    (is_low_voltage_sku(dev_priv, phy) || !intel_dp_is_edp(intel_dp)))
>  		return 540000;
>  
>  	return 810000;
> @@ -402,7 +412,23 @@ static int icl_max_source_rate(struct intel_dp *intel_dp)
>  
>  static int ehl_max_source_rate(struct intel_dp *intel_dp)
>  {
> -	if (intel_dp_is_edp(intel_dp))
> +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> +	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
> +	enum phy phy = intel_port_to_phy(dev_priv, dig_port->base.port);
> +
> +	if (intel_dp_is_edp(intel_dp) || is_low_voltage_sku(dev_priv, phy))
> +		return 540000;
> +
> +	return 810000;
> +}
> +
> +static int dg1_max_source_rate(struct intel_dp *intel_dp)
> +{
> +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> +	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> +	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
> +
> +	if (intel_phy_is_combo(i915, phy) && is_low_voltage_sku(i915, phy))
>  		return 540000;
>  
>  	return 810000;
> @@ -445,7 +471,7 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
>  			max_rate = dg2_max_source_rate(intel_dp);
>  		else if (IS_ALDERLAKE_P(dev_priv) || IS_ALDERLAKE_S(dev_priv) ||
>  			 IS_DG1(dev_priv) || IS_ROCKETLAKE(dev_priv))
> -			max_rate = 810000;
> +			max_rate = dg1_max_source_rate(intel_dp);
>  		else if (IS_JSL_EHL(dev_priv))
>  			max_rate = ehl_max_source_rate(intel_dp);
>  		else

-- 
Jani Nikula, Intel Open Source Graphics Center
