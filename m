Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A40277DCE9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 11:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D282B10E22E;
	Wed, 16 Aug 2023 09:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CF510E22E;
 Wed, 16 Aug 2023 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692176586; x=1723712586;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=H25J00BMfihPwIlWyPi9fC1IUG683UCggpHQSZfGyQ0=;
 b=CMnHnDBG6MWEEjNBAmR98ilIsaGezRFafzPv/nkVpXYWzaPDPEPjt8uz
 86I1moDApInlWd35jYSJowWvX6JE3R7J5iJ/xK8ymExSy5v7KggR4KDkb
 BSDcU4AGaJlXlEU/tHyk/UQ0lNAkNJg1AwNAQ8YeeNjplp3wqh98aC+In
 KMpXGd2qvJT4XypeGk7e/XSC7spg211mN6BSgr4HJEx8xv6EHA/FcRWln
 ub/Aa/TQjh5iv6v1P2RwT151MNgWaPBMEAe5HmrYwuBFdwyVRaN8qHcZn
 FMlIU+JSoDL/IYnriTEB7v0IXn/U3nKteyA3TsFpKbFyPs+z4KEpBkD7o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="438826858"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="438826858"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 02:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="804134172"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="804134172"
Received: from golubevv-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 02:03:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pablo Ceballos <pceballos@google.com>, Ankit K Nautiyal
 <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v3] drm/i915/display/lspcon: Increase LSPCON mode settle
 timeout
In-Reply-To: <20230816045654.833973-1-pceballos@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230816045654.833973-1-pceballos@google.com>
Date: Wed, 16 Aug 2023 12:02:58 +0300
Message-ID: <87y1ib9x6l.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pablo Ceballos <pceballos@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Aug 2023, Pablo Ceballos <pceballos@google.com> wrote:
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
> Signed-off-by: Pablo Ceballos <pceballos@google.com>

I think we've been here before. Do you have a publicly available gitlab
issue with the proper logs? If not, please file one at [1].

BR,
Jani.

[1] https://gitlab.freedesktop.org/drm/intel/issues/new


> ---
>
> V2: Added more details in the commit message
> V3: Only apply the increased timeout if the vendor is Parade
>
> drivers/gpu/drm/i915/display/intel_lspcon.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index bb3b5355a0d9..b07eab84cc63 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -153,6 +153,24 @@ static enum drm_lspcon_mode lspcon_get_current_mode(struct intel_lspcon *lspcon)
>  	return current_mode;
>  }
>  
> +static u32 lspcon_get_mode_settle_timeout(struct intel_lspcon *lspcon)
> +{
> +	u32 timeout_ms = 400;
> +
> +	/*
> +	 * On some CometLake-based device designs the Parade PS175 takes more
> +	 * than 400ms to settle in PCON mode. 100 reboot trials on one device
> +	 * resulted in a median settle time of 440ms and a maximum of 444ms.
> +	 * Even after increasing the timeout to 500ms, 2% of devices still had
> +	 * this error. So this sets the timeout to 800ms.
> +	 */
> +	if (lspcon->vendor == LSPCON_VENDOR_PARADE)
> +		timeout_ms = 800;
> +
> +	return timeout_ms;
> +}
> +
> +
>  static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
>  					     enum drm_lspcon_mode mode)
>  {
> @@ -167,7 +185,8 @@ static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
>  	drm_dbg_kms(&i915->drm, "Waiting for LSPCON mode %s to settle\n",
>  		    lspcon_mode_name(mode));
>  
> -	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode, 400);
> +	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode,
> +		 lspcon_get_mode_settle_timeout(lspcon));
>  	if (current_mode != mode)
>  		drm_err(&i915->drm, "LSPCON mode hasn't settled\n");

-- 
Jani Nikula, Intel Open Source Graphics Center
