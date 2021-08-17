Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961A3EEA9C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 12:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934B189AA6;
	Tue, 17 Aug 2021 10:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C74D89121
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:08:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id w24so5563268wmi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dzAGblmlq5Ovpg9HVHA7dIltLgPspekst2kQM2PnE5M=;
 b=LuHSZdAR9rfJCCXffycmMEZUo1PSxmnojEzp/bwCJcr+KgOGUD3hSqx7Ktx1189vdM
 qaFftQMLePMFQiIN3HLJ/mxKhhuV/f7J5Qn6ucGEGFFK1/X6Abe+po3EB3rJN+v1WUba
 pW7/0fan9h53ZlN/L1FAzREld6WM37IpCQrEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dzAGblmlq5Ovpg9HVHA7dIltLgPspekst2kQM2PnE5M=;
 b=cpjTv8JbtD0Sj9Qq1LDkKgblZrdJrvOLYjqBHfR24T17kGMarNtU55NM//qmAvQthM
 E7zu0zeODsHPWpBvQd8wsr0ZCY6rWg+3Ku+wICerriR4Fpu04ktK+5bnRx6n4OynsxlO
 SrBK6uxM+YiuNEVMY/YTE1WNgVdbpzE0emHx2iBbjjmCpONtvzGBoq1h9SwmUPvsG76f
 z4vqeODlQB88Zm2wJrclicuaFFpG7nr/kKTwiAzWNdD3KhUQSre2DVs8L1X6Y9h79I8p
 ZTsGUpKvVkDSaWrybG9sdRJ+4NpLLL1YiVJiI2l1HXWyjqfPdvrOimXkKinv7FNoh7FV
 5SWA==
X-Gm-Message-State: AOAM532HJzu4nAoJno8YL/ZUQJGbpygCDcz9s2ohqr1cxC89YDOriXfj
 0s8nKoAT711aTheh/gYrar7leqyHQWlM8w==
X-Google-Smtp-Source: ABdhPJwermvAGgyDT3FL2SNtK1Hg3NKFsAYY8CFCC11KCyLqL7XTIaTYmgFIF0Ybhn2cNil8xD8yDQ==
X-Received: by 2002:a05:600c:225a:: with SMTP id
 a26mr2509814wmm.189.1629194891862; 
 Tue, 17 Aug 2021 03:08:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f17sm1534323wmq.17.2021.08.17.03.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 03:08:11 -0700 (PDT)
Date: Tue, 17 Aug 2021 12:08:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 16/22] drm/i915/guc: Release submit fence from an IRQ
Message-ID: <YRuKiZDoPeAMYvzj@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-17-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816135139.10060-17-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 16, 2021 at 06:51:33AM -0700, Matthew Brost wrote:
> A subsequent patch will flip the locking hierarchy from
> ce->guc_state.lock -> sched_engine->lock to sched_engine->lock ->
> ce->guc_state.lock. As such we need to release the submit fence for a
> request from an IRQ to break a lock inversion - i.e. the fence must be
> release went holding ce->guc_state.lock and the releasing of the can
> acquire sched_engine->lock.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Title should be "irq work", otherwise it reads a bit strange. Also these
kind of nestings would be good to document in the kerneldoc too (maybe as
you go even).
-Daniel

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 ++++++++++++++-
>  drivers/gpu/drm/i915/i915_request.h               |  5 +++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 8c560ed14976..9ae4633aa7cb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2017,6 +2017,14 @@ static const struct intel_context_ops guc_context_ops = {
>  	.create_virtual = guc_create_virtual,
>  };
>  
> +static void submit_work_cb(struct irq_work *wrk)
> +{
> +	struct i915_request *rq = container_of(wrk, typeof(*rq), submit_work);
> +
> +	might_lock(&rq->engine->sched_engine->lock);
> +	i915_sw_fence_complete(&rq->submit);
> +}
> +
>  static void __guc_signal_context_fence(struct intel_context *ce)
>  {
>  	struct i915_request *rq;
> @@ -2026,8 +2034,12 @@ static void __guc_signal_context_fence(struct intel_context *ce)
>  	if (!list_empty(&ce->guc_state.fences))
>  		trace_intel_context_fence_release(ce);
>  
> +	/*
> +	 * Use an IRQ to ensure locking order of sched_engine->lock ->
> +	 * ce->guc_state.lock is preserved.
> +	 */
>  	list_for_each_entry(rq, &ce->guc_state.fences, guc_fence_link)
> -		i915_sw_fence_complete(&rq->submit);
> +		irq_work_queue(&rq->submit_work);
>  
>  	INIT_LIST_HEAD(&ce->guc_state.fences);
>  }
> @@ -2137,6 +2149,7 @@ static int guc_request_alloc(struct i915_request *rq)
>  	spin_lock_irqsave(&ce->guc_state.lock, flags);
>  	if (context_wait_for_deregister_to_register(ce) ||
>  	    context_pending_disable(ce)) {
> +		init_irq_work(&rq->submit_work, submit_work_cb);
>  		i915_sw_fence_await(&rq->submit);
>  
>  		list_add_tail(&rq->guc_fence_link, &ce->guc_state.fences);
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 1bc1349ba3c2..d818cfbfc41d 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -218,6 +218,11 @@ struct i915_request {
>  	};
>  	struct llist_head execute_cb;
>  	struct i915_sw_fence semaphore;
> +	/**
> +	 * @submit_work: complete submit fence from an IRQ if needed for
> +	 * locking hierarchy reasons.
> +	 */
> +	struct irq_work submit_work;
>  
>  	/*
>  	 * A list of everyone we wait upon, and everyone who waits upon us.
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
