Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549DC62D79C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C395410E5E0;
	Thu, 17 Nov 2022 09:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0677A10E07E;
 Thu, 17 Nov 2022 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668679087; x=1700215087;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SDE0RwaNvyxAJEYja7y0XTPOObwyACSymAWRnV4n0Cc=;
 b=m+1i9zfxn9zNKAX03Fv7d1kdv+iQSb5yOMI/a3lbJrfXYwxxZs8K22PR
 Z00VjgLW6JbZ16HuDs7x8pUBQnLSv76af8OE93kL96tKW8um8UKP63gdM
 NyQUeZ7iSzQ3PvlQSeXrxJ6elPrD5Kinfz25bpIWA1CpH2dppSXwJHyNr
 +c7+PIktKtHgLvzLBbftLvv8rMGghn4Na6FOoInd6deexQCSTXM/xj1rj
 rRWzd3nH36mCCOlNdLiQQb3ck6Fb4Ub8j9OvJIH5uj8ThNik7RpsscEBp
 qVIFH67XaHyo1sro9XS/Zr7yg6DeiW/Jw+1w8vQKRiZ1yQDTCKRuWrXZ3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="339635546"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="339635546"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 01:58:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="634002513"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="634002513"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.45.163])
 ([10.249.45.163])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 01:58:04 -0800
Message-ID: <aaa3a058-8468-f903-4e7a-fdab2638236c@linux.intel.com>
Date: Thu, 17 Nov 2022 10:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Fix negative remaining time
 after retire requests
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
 <20221116112532.36253-2-janusz.krzysztofik@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20221116112532.36253-2-janusz.krzysztofik@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/2022 12:25 PM, Janusz Krzysztofik wrote:

> Commit b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work
> with GuC") extended the API of intel_gt_retire_requests_timeout() with an
> extra argument 'remaining_timeout', intended for passing back unconsumed
> portion of requested timeout when 0 (success) is returned.  However, when
> request retirement happens to succeed despite an error returned by
> dma_fence_wait_timeout(), the error code (a negative value) is passed back
> instead of remaining time.  If a user then passes that negative value
> forward as requested timeout to another wait, an explicit WARN or BUG can
> be triggered.
>
> Instead of copying the value of timeout variable to *remaining_timeout
> before return, update the *remaining_timeout after each DMA fence wait.


Thanks for the detailed comment, indeed we were not accounting for the 
return value of dma_fence_wait_timeout()

Acked-by: Nirmoy Das <nirmoy.das@intel.com>


Thanks,

Nirmoy


> Set it to 0 on -ETIME, -EINTR or -ERESTARTSYS, and assume no time has been
> consumed on other errors returned from the wait.
>
> Fixes: b97060a99b01 ("drm/i915/guc: Update intel_gt_wait_for_idle to work with GuC")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: stable@vger.kernel.org # v5.15+
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_requests.c | 23 ++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index edb881d756309..ccaf2fd80625b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -138,6 +138,9 @@ long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
>   	unsigned long active_count = 0;
>   	LIST_HEAD(free);
>   
> +	if (remaining_timeout)
> +		*remaining_timeout = timeout;
> +
>   	flush_submission(gt, timeout); /* kick the ksoftirqd tasklets */
>   	spin_lock(&timelines->lock);
>   	list_for_each_entry_safe(tl, tn, &timelines->active_list, link) {
> @@ -163,6 +166,23 @@ long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
>   								 timeout);
>   				dma_fence_put(fence);
>   
> +				if (remaining_timeout) {
> +					/*
> +					 * If we get an error here but request
> +					 * retirement succeeds anyway
> +					 * (!active_count) and we return 0, the
> +					 * caller may want to spend remaining
> +					 * time on waiting for other events.
> +					 */
> +					if (timeout == -ETIME ||
> +					    timeout == -EINTR ||
> +					    timeout == -ERESTARTSYS)
> +						*remaining_timeout = 0;
> +					else if (timeout >= 0)
> +						*remaining_timeout = timeout;
> +					/* else assume no time consumed */
> +				}
> +
>   				/* Retirement is best effort */
>   				if (!mutex_trylock(&tl->mutex)) {
>   					active_count++;
> @@ -196,9 +216,6 @@ out_active:	spin_lock(&timelines->lock);
>   	if (flush_submission(gt, timeout)) /* Wait, there's more! */
>   		active_count++;
>   
> -	if (remaining_timeout)
> -		*remaining_timeout = timeout;
> -
>   	return active_count ? timeout : 0;
>   }
>   
