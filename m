Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC42B40B09E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 16:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7F16E4AF;
	Tue, 14 Sep 2021 14:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E606E4AD
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 14:29:24 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i23so20587322wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jriQVbjQbyLYejKRY1L6h0qbwuc0iww7jRiaO8V3ofs=;
 b=aPgxPD87pUkmoRci9cM2GtAITmQKriKP/2Ogqqo4YXGut08by39mziA9yNrhB4cNw7
 c4d+KuWybTLp6InPq+QJVnxwAWBcdZma28NcvBK8vddbAQyLNLgRCzjxmtascC5rM7SW
 W4i5Rq3th0u28rfw4cujMD7iDBARJQGGfXNuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jriQVbjQbyLYejKRY1L6h0qbwuc0iww7jRiaO8V3ofs=;
 b=cTns+EK7mrEYcZRuSlZXsHzbYJgeYceaB7lee2kQ1g657tBrwqv0fox48DVYkspWpH
 DdHgJLRP+8EnMVzAul4wA3Dvnvxyj5zF4U/WCPm42Vh9Ru3ZJuYv9vSxrYaTIkx3voZA
 bWK10JXSSf61Nie2Nr6AJVu8hi+U53f6Uo9CfEuNSf9ZOTJCbG4jTWGgUO/21ps8V5CY
 c9Zsd4B+s92QMbPqQPCpueKZERp0xwukDdC1/d/3WPXhKJp6mslCJFw2zXD0tr9gnwfL
 ZkraX/kbWJ7mCohmjSTrkwor8NTF+4nOLzUvPcOfEdfXW09ZjbRzIFKk3kZ1yaCfukMO
 iHag==
X-Gm-Message-State: AOAM533kzkxiLx7M4CKDFsB05DbVv33muyai0SD5hESG3Hk9mKCUfRhT
 cLo5KHroiUIHU3KW9ouNW5NuaDX5nQiOhQ==
X-Google-Smtp-Source: ABdhPJz37rJ7nUUdK0sttc7v5sufe18Xx7bOLXpFyP+eWGU4XQPa3kzfwcCF+8rSDdQP+HMHEDPmrg==
X-Received: by 2002:adf:c542:: with SMTP id s2mr19440356wrf.374.1631629763418; 
 Tue, 14 Sep 2021 07:29:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d5sm11218089wra.38.2021.09.14.07.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:29:22 -0700 (PDT)
Date: Tue, 14 Sep 2021 16:29:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Refcount context during
 error capture
Message-ID: <YUCxwV+A3C8BXQp+@phenom.ffwll.local>
References: <20210914050956.30685-1-matthew.brost@intel.com>
 <20210914050956.30685-5-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914050956.30685-5-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Mon, Sep 13, 2021 at 10:09:56PM -0700, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> When i915 receives a context reset notification from GuC, it triggers
> an error capture before resetting any outstanding requsts of that
> context. Unfortunately, the error capture is not a time bound
> operation. In certain situations it can take a long time, particularly
> when multiple large LMEM buffers must be read back and eoncoded. If
> this delay is longer than other timeouts (heartbeat, test recovery,
> etc.) then a full GT reset can be triggered in the middle.
> 
> That can result in the context being reset by GuC actually being
> destroyed before the error capture completes and the GuC submission
> code resumes. Thus, the GuC side can start dereferencing stale
> pointers and Bad Things ensue.
> 
> So add a refcount get of the context during the entire reset
> operation. That way, the context can't be destroyed part way through
> no matter what other resets or user interactions occur.
> 
> v2:
>  (Matthew Brost)
>   - Update patch to work with async error capture
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

This sounds like a fundamental issue in our reset/scheduler design. If we
have multiple timeout-things working in parallel, then there's going to be
an endless whack-a-mole fireworks show.

Reset is not a perf critical path (aside from media timeout, which guc
handles internally anyway). Simplicity trumps everything else. The fix
here is to guarantee that anything related to reset cannot happen in
parallel with anything else related to reset/timeout. At least on a
per-engine (and really on a per-reset domain) basis.

The fix we've developed for drm/sched is that the driver can allocate a
single-thread work queue, pass it to each drm/sched instance, and all
timeout handling is run in there.

For i915 it's more of a mess since we have a ton of random things that
time out/reset potentially going on in parallel. But that's the design we
should head towards.

_not_ sprinkling random refcounts all over the place until most of the
oops/splats disappear. That's cargo-culting, not engineering.
-Daniel

> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 +++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 1986a57b52cc..02917fc4d4a8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2888,6 +2888,8 @@ static void capture_worker_func(struct work_struct *w)
>  	intel_engine_set_hung_context(engine, ce);
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>  		i915_capture_error_state(gt, ce->engine->mask);
> +
> +	intel_context_put(ce);
>  }
>  
>  static void capture_error_state(struct intel_guc *guc,
> @@ -2924,7 +2926,7 @@ static void guc_context_replay(struct intel_context *ce)
>  	tasklet_hi_schedule(&sched_engine->tasklet);
>  }
>  
> -static void guc_handle_context_reset(struct intel_guc *guc,
> +static bool guc_handle_context_reset(struct intel_guc *guc,
>  				     struct intel_context *ce)
>  {
>  	trace_intel_context_reset(ce);
> @@ -2937,7 +2939,11 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>  		   !context_blocked(ce))) {
>  		capture_error_state(guc, ce);
>  		guc_context_replay(ce);
> +
> +		return false;
>  	}
> +
> +	return true;
>  }
>  
>  int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> @@ -2945,6 +2951,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>  {
>  	struct intel_context *ce;
>  	int desc_idx;
> +	unsigned long flags;
>  
>  	if (unlikely(len != 1)) {
>  		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> @@ -2952,11 +2959,24 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>  	}
>  
>  	desc_idx = msg[0];
> +
> +	/*
> +	 * The context lookup uses the xarray but lookups only require an RCU lock
> +	 * not the full spinlock. So take the lock explicitly and keep it until the
> +	 * context has been reference count locked to ensure it can't be destroyed
> +	 * asynchronously until the reset is done.
> +	 */
> +	xa_lock_irqsave(&guc->context_lookup, flags);
>  	ce = g2h_context_lookup(guc, desc_idx);
> +	if (ce)
> +		intel_context_get(ce);
> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> +
>  	if (unlikely(!ce))
>  		return -EPROTO;
>  
> -	guc_handle_context_reset(guc, ce);
> +	if (guc_handle_context_reset(guc, ce))
> +		intel_context_put(ce);
>  
>  	return 0;
>  }
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
