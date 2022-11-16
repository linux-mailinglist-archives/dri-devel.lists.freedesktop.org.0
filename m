Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5760C62C0A9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 15:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68B710E173;
	Wed, 16 Nov 2022 14:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7648C10E169;
 Wed, 16 Nov 2022 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668608133; x=1700144133;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jBRHdTLAs9nofaD/pEH5UDV99llUTO3EkS1LkfT8slo=;
 b=NO2L8SJDfQXeL0K8HxJQpH9RX/ORPO1Q6DQTJb91ShMdZ37c5eHrZP0n
 0R3R0ZGmqCXh4lHBkLZ+2gJtPC7EBc7DXc/1vxtsI1EWDWdd/K7KZEiu7
 3AMRGf0Fi/GhQmVvHKuNNQH+g+msRetvWdqdPafExBBKz46n4Ifx3LhEl
 Fh1hPidWY4vIbJInoLJ/ftmwfvefMhxxasSJBwJaukMDEPuhmsUANAoKh
 qfpcSCuQZaSTWnYVGOkwBXR6Tn90cWBCl9FOleZHcU+ls64ZXMzn0TpTi
 GapWKl18Vx3VvWwa1/QEctCCo5EvI0aZFEwLhTPRqBl2LpUErP8ZWaLVf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="376819964"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="376819964"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 06:15:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="708182276"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="708182276"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.11.238])
 ([10.213.11.238])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 06:15:30 -0800
Message-ID: <f92c0569-c687-f643-e520-bf298061390b@intel.com>
Date: Wed, 16 Nov 2022 15:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: Never return 0 on timeout when
 retiring requests
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
 <20221116112532.36253-3-janusz.krzysztofik@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221116112532.36253-3-janusz.krzysztofik@linux.intel.com>
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



Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   	if (flush_submission(gt, timeout)) /* Wait, there's more! */
>   		active_count++;
>   

