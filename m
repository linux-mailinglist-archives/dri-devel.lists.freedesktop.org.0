Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 661D931841A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 04:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7726EDE1;
	Thu, 11 Feb 2021 03:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FAB6EDCC;
 Thu, 11 Feb 2021 03:52:48 +0000 (UTC)
IronPort-SDR: IR+17WoEmKTql7bRyQr9H3fCR/vJwaxLSdaZpPQKnWvVrTQW2IAIcwsqrdHLH5rlcT2lnCEUbG
 w3dM0Ys7T4Mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="243678014"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="243678014"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 19:52:47 -0800
IronPort-SDR: DFhb90rG7d/7EBknx6VJgS97m1G44IqmdjW3jeACpr1mEhvjQnRznkNSCub6FvVvVUf47EHE+L
 5W3lvwYYScLQ==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="397074805"
Received: from rontiver-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.212.99.95])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 19:52:46 -0800
Date: Wed, 10 Feb 2021 22:52:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [RFC v4 08/11] drm/i915/dpcd_bl: Return early in
 vesa_calc_max_backlight if we can't read PWMGEN_BIT_COUNT
Message-ID: <20210211035245.GG82362@intel.com>
References: <20210208233902.1289693-1-lyude@redhat.com>
 <20210208233902.1289693-9-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208233902.1289693-9-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 08, 2021 at 06:38:58PM -0500, Lyude Paul wrote:
> If we can't read DP_EDP_PWMGEN_BIT_COUNT in
> intel_dp_aux_vesa_calc_max_backlight() but do have a valid PWM frequency
> defined in the VBT, we'll keep going in the function until we inevitably
> fail on reading DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN. There's not much point in
> doing this, so just return early.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 611eb3a7cc08..a139f0e08839 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -449,11 +449,14 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
>  	int freq, fxp, fxp_min, fxp_max, fxp_actual, f = 1;
>  	u8 pn, pn_min, pn_max;
>  
> -	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, &pn) == 1) {
> -		pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -		max_backlight = (1 << pn) - 1;
> +	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, &pn) != 1) {
> +		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap\n");
> +		return 0;
>  	}
>  
> +	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +	max_backlight = (1 << pn) - 1;
> +
>  	/* Find desired value of (F x P)
>  	 * Note that, if F x P is out of supported range, the maximum value or
>  	 * minimum value will applied automatically. So no need to check that.
> -- 
> 2.29.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
