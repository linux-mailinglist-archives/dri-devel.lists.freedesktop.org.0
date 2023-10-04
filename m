Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667AA7B83B0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 17:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D9210E171;
	Wed,  4 Oct 2023 15:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E65610E17B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696433740; x=1727969740;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Hx7V+yVsMtVy4pESAElvmRBSgtPI3S8ueyYPH3wmwoc=;
 b=h8aM0bLIu5OlZFiXaE85INSm+z/dkPJ3UqpXOtMhtmleTTSoj3KPne7/
 9KEaaFMnCqjQfxjh3BOBljTyY24tx99XlesJHoMC4TGsijcWIeyoMIzf2
 X/k3x3ebRCWuwd8ngG3ssTzMqwwDKYtWq0N7GIjZ92t+2kFb4LuGVhvJ9
 KH677vgEAaawgkuQOR0vgLiCacgiullL/Qn0jCu3wIgb5GhSGQZH7oIb7
 A8kNwgd2MKVHIInvhzkFWr3Sgt4AA1RF0rTjhCmVgmty80phBdcFe7QXM
 o2mup3gXSHsGjhQjHWn6gni/zTLckfspmWeh7Aol7AUohvHWiPyKIfjcK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="449695282"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="449695282"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 08:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751351447"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="751351447"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.48])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 08:35:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Niko Tsirakis <ntsirakis@google.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/i915/display/lspcon: Increase LSPCON mode settle
 timeout
In-Reply-To: <20231002204709.761089-1-ntsirakis@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230816045654.833973-1-pceballos@google.com>
 <20231002204709.761089-1-ntsirakis@google.com>
Date: Wed, 04 Oct 2023 18:35:36 +0300
Message-ID: <87fs2qe6yf.fsf@intel.com>
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
Cc: Niko Tsirakis <ntsirakis@google.com>, Pablo Ceballos <pceballos@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 02 Oct 2023, Niko Tsirakis <ntsirakis@google.com> wrote:
> This is to eliminate all cases of "*ERROR* LSPCON mode hasn't settled",
> followed by link training errors. Intel engineers recommended increasing
> this timeout and that does resolve the issue.
>
> On some CometLake-based device designs the Parade PS175 takes more than
> 400ms to settle in PCON mode. 100 reboot trials on one device resulted
> in a median settle time of 440ms and a maximum of 444ms. Even after
> increasing the timeout to 500ms, 2% of devices still had this error. So
> this increases the timeout to 800ms.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9443
> Signed-off-by: Pablo Ceballos <pceballos@google.com>
> Signed-off-by: Niko Tsirakis <ntsirakis@google.com>

Thanks for the patch, pushed to drm-intel-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_lspcon.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index dc1b35559afd..92536482e657 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -116,6 +116,18 @@ static enum drm_lspcon_mode lspcon_get_current_mode(struct intel_lspcon *lspcon)
>  	return current_mode;
>  }
>  
> +static int lspcon_get_mode_settle_timeout(struct intel_lspcon *lspcon)
> +{
> +	/*
> +	 * On some CometLake-based device designs the Parade PS175 takes more
> +	 * than 400ms to settle in PCON mode. 100 reboot trials on one device
> +	 * resulted in a median settle time of 440ms and a maximum of 444ms.
> +	 * Even after increasing the timeout to 500ms, 2% of devices still had
> +	 * this error. So this sets the timeout to 800ms.
> +	 */
> +	return lspcon->vendor == LSPCON_VENDOR_PARADE ? 800 : 400;
> +}
> +
>  static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
>  					     enum drm_lspcon_mode mode)
>  {
> @@ -128,7 +140,8 @@ static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
>  	DRM_DEBUG_KMS("Waiting for LSPCON mode %s to settle\n",
>  		      lspcon_mode_name(mode));
>  
> -	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode, 400);
> +	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode,
> +		lspcon_get_mode_settle_timeout(lspcon));
>  	if (current_mode != mode)
>  		DRM_ERROR("LSPCON mode hasn't settled\n");

-- 
Jani Nikula, Intel
