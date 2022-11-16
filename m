Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8349A62BF28
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 14:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF8F10E4A2;
	Wed, 16 Nov 2022 13:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958E610E499;
 Wed, 16 Nov 2022 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668604422; x=1700140422;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0mjJr9W+5yXRNJbUdmoyXqUfHIvQ6nLqBc7PMqj4m58=;
 b=fIAiJgri5jruDxvDVWik69sgzyScoNTiLgncHxoborS2XqtHWq7dW5Rk
 Hn3gpwYShtpCzt2Lf9vBsNPF8/Cqv5wLFb729r/RqKqCJPkOaIjz2+vQQ
 6CldmPH0iBSSNDxg4rWBE0fz9KLMiLZX49quR/ojMX/uirZ+oePh81B8j
 zt96OmXej7WUg2KFK0IJ83gslxt6WEfYA0C/XOTK9m3AwheozRes/MuzJ
 Qb8bCAnIj227pUz99szAUFJw03IDxDnIAQiDCPsNozyY/jUF/rfbAmMJr
 osYchJHaz5vwBW0d4tOkiL94/sRtELHFXMj57d4+XJDnadBOCyixkIwed A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="292929530"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="292929530"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 05:13:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="781760836"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="781760836"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.11.238])
 ([10.213.11.238])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 05:13:40 -0800
Message-ID: <58e39e38-eb47-2df1-f729-514c41dcd654@intel.com>
Date: Wed, 16 Nov 2022 14:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Fix negative remaining time
 after retire requests
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
 <20221116112532.36253-2-janusz.krzysztofik@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
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

On 16.11.2022 12:25, Janusz Krzysztofik wrote:
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

Looks correct, but the crazy semantic of dma_fence_wait_timeout does not 
make it easy to understand.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


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

