Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C76CA4B6708
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 10:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CAA895B2;
	Tue, 15 Feb 2022 09:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3B8895B2;
 Tue, 15 Feb 2022 09:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644916197; x=1676452197;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=awoHnw/Sv0CY0ncJjQeG77lHxCZjK+04lwjonc5SI/k=;
 b=DVF8F1YnjHYJ6zczW0/cvOmyOSEyG6nCEb8iA+MvEsulYjCGqkHMYfdo
 1SKmmMVq9XwR6SkPgF1T3Jr3qrryRsxuAjtFg7IBfsaay0i+Sm35zDkNA
 uPfsm1TEjIleHFqMpJyC5EpV4k/cRqTDgoJDgLeufUNiE3iYcTpM7au2H
 Qsz6kwXOBzuF5KkjY8vmLhWryrROh/eH9KVOsH8kRgp5m2fx87uTQvOLw
 Olc19RR+ZsSu3iqTIc3cZTtnpxP5iqzblhCrHj8i6nPEKEHR0MHlD8u3J
 u/Ez0UMxyvBKrLRS0sPcLREXdluDiYDa0iK0FZL0Q0cu59NGwNIYBtXuu g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="336729664"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="336729664"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 01:09:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="624680293"
Received: from jkoratik-mobl2.amr.corp.intel.com (HELO [10.212.80.80])
 ([10.212.80.80])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 01:09:56 -0800
Message-ID: <5de141fa-014f-e95f-7dc8-74d95a9c6b14@linux.intel.com>
Date: Tue, 15 Feb 2022 09:09:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Initialize GuC submission locks
 and queues early
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220215011123.734572-1-daniele.ceraolospurio@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220215011123.734572-1-daniele.ceraolospurio@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/02/2022 01:11, Daniele Ceraolo Spurio wrote:
> Move initialization of submission-related spinlock, lists and workers to
> init_early. This fixes an issue where if the GuC init fails we might
> still try to get the lock in the context cleanup code. Note that it is

What's the worst case impact on non-debug builds aka is Fixes: required?

Regards,

Tvrtko

> safe to call the GuC context cleanup code even if the init failed
> because all contexts are initialized with an invalid GuC ID, which will
> cause the GuC side of the cleanup to be skipped, so it is easier to just
> make sure the variables are initialized than to special case the cleanup
> to handle the case when they're not.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/4932
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 27 ++++++++++---------
>   1 file changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0da..2160da2c83cbf 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1818,24 +1818,11 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	 */
>   	GEM_BUG_ON(!guc->lrc_desc_pool);
>   
> -	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
> -
> -	spin_lock_init(&guc->submission_state.lock);
> -	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
> -	ida_init(&guc->submission_state.guc_ids);
> -	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> -	INIT_WORK(&guc->submission_state.destroyed_worker,
> -		  destroyed_worker_func);
> -	INIT_WORK(&guc->submission_state.reset_fail_worker,
> -		  reset_fail_worker_func);
> -
>   	guc->submission_state.guc_ids_bitmap =
>   		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
>   	if (!guc->submission_state.guc_ids_bitmap)
>   		return -ENOMEM;
>   
> -	spin_lock_init(&guc->timestamp.lock);
> -	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
>   	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
>   	guc->timestamp.shift = gpm_timestamp_shift(gt);
>   
> @@ -3831,6 +3818,20 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
> +	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
> +
> +	spin_lock_init(&guc->submission_state.lock);
> +	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
> +	ida_init(&guc->submission_state.guc_ids);
> +	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> +	INIT_WORK(&guc->submission_state.destroyed_worker,
> +		  destroyed_worker_func);
> +	INIT_WORK(&guc->submission_state.reset_fail_worker,
> +		  reset_fail_worker_func);
> +
> +	spin_lock_init(&guc->timestamp.lock);
> +	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
> +
>   	guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
>   	guc->submission_supported = __guc_submission_supported(guc);
>   	guc->submission_selected = __guc_submission_selected(guc);
