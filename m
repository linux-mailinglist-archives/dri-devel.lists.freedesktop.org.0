Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69262D781
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A1510E5DF;
	Thu, 17 Nov 2022 09:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179A10E5D9;
 Thu, 17 Nov 2022 09:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668678827; x=1700214827;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dtyZO2vH2RNf9du34wjYotBye3xRp6HXQy8bNpMuRFA=;
 b=gXxP2WBilG6FAfI8WwE9OXRbQKI/rPK6L8Q2YYTGTzeeGckhtcl6dtkF
 4cQemKi3jSpdZ531zlMOWYBHVWqaIbno52qsD+gbZ60wlVihH0Sl4A8hZ
 iWO3x9bjvrGKXVAKCSh9fZpefMF7cTzAPpB8kBusFhEZXfQ0yIVjU3ooX
 +hJ5qqJNgqI4kzNIQj5tAo+cz4s+1lVZwYiCoTmFC3mY6YTdnSahRXWiS
 fXCYXy0pReU8hpzaOZH77h9GXP+/wvzDcEBFmrYxxawcBX1fSaieufMt1
 sS9Io3xx9JIQJ9FdSKBIM+I+6gSCfLjvyYIhgH6rRDuFIJUVkY042LhAP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="377075483"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="377075483"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 01:53:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="703267998"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="703267998"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.45.163])
 ([10.249.45.163])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 01:53:44 -0800
Message-ID: <8c0f2a40-38f1-82e3-0d75-0758dfad3563@linux.intel.com>
Date: Thu, 17 Nov 2022 10:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: Never return 0 on timeout when
 retiring requests
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
 <20221116112532.36253-3-janusz.krzysztofik@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20221116112532.36253-3-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Looks very relevant to  our recent hangcheck failures.


Acked-by: Nirmoy Das <nirmoy.das@intel.com>

On 11/16/2022 12:25 PM, Janusz Krzysztofik wrote:
> Users of intel_gt_retire_requests_timeout() expect 0 return value on
> success.  However, we have no protection from passing back 0 potentially
> returned by dma_fence_wait_timeout() on timeout.
>
> Replace 0 with -ETIME before using timeout as return value.
>
> Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with retire_request")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: stable@vger.kernel.org # v5.5+
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_requests.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index ccaf2fd80625b..ac6b2b1861397 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -213,6 +213,9 @@ out_active:	spin_lock(&timelines->lock);
>   	list_for_each_entry_safe(tl, tn, &free, link)
>   		__intel_timeline_free(&tl->kref);
>   
> +	if (!timeout)
> +		timeout = -ETIME;
> +
>   	if (flush_submission(gt, timeout)) /* Wait, there's more! */
>   		active_count++;
>   
