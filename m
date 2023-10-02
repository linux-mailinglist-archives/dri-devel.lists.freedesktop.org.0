Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C017B4FD4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 12:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB4A10E26D;
	Mon,  2 Oct 2023 10:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A7610E276;
 Mon,  2 Oct 2023 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696240844; x=1727776844;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jMA1qUgRZBOCtACv4+9yAge9XIVyKwYlEPTNSzbXWqE=;
 b=XNhJUMwfhK1Th5anDop7IdUnApPBg+r5eOx/JjYsAR72skRHg3Xz/YF0
 2rhNZ6TUxFWgk0qHIQvXZLnEUJWiuZ+dz/kDG3MDgf8arPysxpdCeEtpo
 aEb7AXtsn+61D5slcfWYQ8sE1taebyl3SPUIqD69KYbQz3ruv/aGM4iZP
 wmy9esYMlQqM0fl+AII9RL84aTFnOc+OX2w51zzBkicJdvvZjOmE475Ql
 B9k5hyaH3JFpjVM50KdMg+f6wOMZsrpfUJdJ3VLtITo0/bPRVV18DT8aq
 AHISJMOdiTdDHEv4iQJK271N6wO1AJkZXTN92gsSDrv9ySsg5DUasmoFO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="468892070"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="468892070"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="1081595161"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="1081595161"
Received: from svandens-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.151])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:00:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pablo Ceballos <pceballos@google.com>, Ankit K Nautiyal
 <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v3] drm/i915/display/lspcon: Increase LSPCON mode settle
 timeout
In-Reply-To: <20230816045654.833973-1-pceballos@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230816045654.833973-1-pceballos@google.com>
Date: Mon, 02 Oct 2023 13:00:05 +0300
Message-ID: <87r0mdgx96.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, imre.deak@linux.intel.com,
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

Please file the issue at [1] as requested before, and reference it in
the commit message.

[1] https://gitlab.freedesktop.org/drm/intel/-/issues/new

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

Please use plain int for plain numbers. There's nothing u32 about this.

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

All of the above is just

	return lspcon->vendor == LSPCON_VENDOR_PARADE ? 800 : 400;

BR,
Jani.

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
Jani Nikula, Intel
