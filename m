Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9827632B38
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 18:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137A310E320;
	Mon, 21 Nov 2022 17:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFE710E321;
 Mon, 21 Nov 2022 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669052456; x=1700588456;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=taaX+HsFoObIJYjO9nxND9C0DPV8hfbOWMRhNe+qwJI=;
 b=VXV4mgNgTRGtoGgvlRiTbez9O2IXbJKXFGU6urBhJSIpzZejZD4mxmb+
 vxtZ2/KmX/9TSuxPTGFxJxGUyuNpMNhnWDDrXXh8zcbL7HB/40CkMjhbW
 tApnBZCfAw71SWjpgVnT3fJDBYNyEvHW3hLIl5vQ6rzleAqOIPes/d0lB
 LtrHZujDd357S1NXtbC9I37TinZLqeyh2fLt80w4/CHry98VJhz9HbrQ4
 WGnwt5324SblHh6cCukSevenMxvyTfo936Hx44gjbZiWrCX9havGzy4ui
 T/NnqPiQpjufsjhZ8X2YqtjtphQorgIsVx/cMUZ4kCDAyWXms9egwULnj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="311248328"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="311248328"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 09:40:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="886202204"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="886202204"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.14.16])
 ([10.213.14.16])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 09:40:53 -0800
Message-ID: <37493d84-441b-76fa-d42b-ae1764a361bb@intel.com>
Date: Mon, 21 Nov 2022 18:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915: Fix negative value passed as
 remaining time
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
 <20221121145655.75141-2-janusz.krzysztofik@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221121145655.75141-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.11.2022 15:56, Janusz Krzysztofik wrote:
> Commit b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work
> with GuC") extended the API of intel_gt_retire_requests_timeout() with an
> extra argument 'remaining_timeout', intended for passing back unconsumed
> portion of requested timeout when 0 (success) is returned.  However, when
> request retirement happens to succeed despite an error returned by a call
> to dma_fence_wait_timeout(), that error code (a negative value) is passed
> back instead of remaining time.  If we then pass that negative value
> forward as requested timeout to intel_uc_wait_for_idle(), an explicit BUG
> will be triggered.
> 
> If request retirement succeeds but an error code is passed back via
> remaininig_timeout, we may have no clue on how much of the initial timeout
> might have been left for spending it on waiting for GuC to become idle.
> OTOH, since all pending requests have been successfully retired, that
> error code has been already ignored by intel_gt_retire_requests_timeout(),
> then we shouldn't fail.
> 
> Assume no more time has been left on error and pass 0 timeout value to
> intel_uc_wait_for_idle() to give it a chance to return success if GuC is
> already idle.
> 
> v3: Don't fail on any error passed back via remaining_timeout.
> 
> v2: Fix the issue on the caller side, not the provider.
> 
> Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: stable@vger.kernel.org # v5.15+

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index b5ad9caa55372..7ef0edb2e37cd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -677,8 +677,13 @@ int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
>   			return -EINTR;
>   	}
>   
> -	return timeout ? timeout : intel_uc_wait_for_idle(&gt->uc,
> -							  remaining_timeout);
> +	if (timeout)
> +		return timeout;
> +
> +	if (remaining_timeout < 0)
> +		remaining_timeout = 0;
> +
> +	return intel_uc_wait_for_idle(&gt->uc, remaining_timeout);
>   }
>   
>   int intel_gt_init(struct intel_gt *gt)

