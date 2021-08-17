Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20953EEAA8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 12:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22A6E11C;
	Tue, 17 Aug 2021 10:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE506E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:10:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u16so10625983wrn.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 03:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+aMIML02DeFl51LhhThOq1s67DpAXrQuB2GOPhk27dM=;
 b=A49XFyxxUKkEYFa9OKZFiz91KXxE0clCOfnRscS8auDA0R5nXe7iBp8hsn4wY7VIBH
 5mrV0iU2xFKls7K+bd4DDetK8Jh+7Hc6eE7xdeMXxBmZCL4Q5UllZkH2tc12oNTrQXFy
 IRrIamgzQ4ddn3OVmheMWb+nMSzU4QingKpmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+aMIML02DeFl51LhhThOq1s67DpAXrQuB2GOPhk27dM=;
 b=s2LVnf/6JCGvQapRpNtNBsglmhv16DS6XQeiY9SXEOkLEWr5Q/bGm6qxdleIVAUSYu
 R1PJWkmbnqt/xSKyIfUmnyUkdDeCFd8ErGG6Ouyn6mCgCgM0WTbnzoM/P/02bRNL+qnP
 ESyY2XAZqG2x260PlGO51rVLjXUtdxJ2USyZtQtIMl3aFg5FKoEd4+zDs83tJrKlU63s
 zF+lBARXVuu9zSIX/7iebpd+o6tX53fAU6LseHlG8SxTiaLwQuZelEQ5bzeWQUEZ9OWv
 aoCG0EXIDiQPdzohJ0ur4ikOQCjHkgV7LKWmf50eMzh1WMy2FDIplnBFW+Ownd+JYist
 luow==
X-Gm-Message-State: AOAM532URka2qmgB6VQraYmmWoHtKKiEOBZj7RRcaZWzeg90p8pJ0yjc
 fQkTPQsY+hisuAht7W+qfixhzg==
X-Google-Smtp-Source: ABdhPJzCjgbTdlGHR1yDloImfYa+znmHfcOSq53K6h/pzUKYjf9SfpMxf/xQAY72YixzLjLdqIryvA==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr3158791wrn.248.1629195027992; 
 Tue, 17 Aug 2021 03:10:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g21sm1660442wmk.8.2021.08.17.03.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 03:10:27 -0700 (PDT)
Date: Tue, 17 Aug 2021 12:10:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 17/22] drm/i915/guc: Move guc_blocked fence to struct
 guc_state
Message-ID: <YRuLEUQ27bNMbBsT@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-18-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816135139.10060-18-matthew.brost@intel.com>
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

On Mon, Aug 16, 2021 at 06:51:34AM -0700, Matthew Brost wrote:
> Move guc_blocked fence to struct guc_state as the lock which protects
> the fence lives there.
> 
> s/ce->guc_blocked/ce->guc_state.blocked_fence/g
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

General comment, but latest when your combine your count state with a wait
queue you're very far into "reinventing a mutex/semaphore, badly" land.

I think we really need to look into why we can't just protect this all
with a mutex and make sure the awkward transition states are never visible
to anyone else.
-Daniel

> ---
>  drivers/gpu/drm/i915/gt/intel_context.c        |  5 +++--
>  drivers/gpu/drm/i915/gt/intel_context_types.h  |  5 ++---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 +++++++++---------
>  3 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 745e84c72c90..0e48939ec85f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -405,8 +405,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>  	 * Initialize fence to be complete as this is expected to be complete
>  	 * unless there is a pending schedule disable outstanding.
>  	 */
> -	i915_sw_fence_init(&ce->guc_blocked, sw_fence_dummy_notify);
> -	i915_sw_fence_commit(&ce->guc_blocked);
> +	i915_sw_fence_init(&ce->guc_state.blocked_fence,
> +			   sw_fence_dummy_notify);
> +	i915_sw_fence_commit(&ce->guc_state.blocked_fence);
>  
>  	i915_active_init(&ce->active,
>  			 __intel_context_active, __intel_context_retire, 0);
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 3a73f3117873..c06171ee8792 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -167,6 +167,8 @@ struct intel_context {
>  		 * fence related to GuC submission
>  		 */
>  		struct list_head fences;
> +		/* GuC context blocked fence */
> +		struct i915_sw_fence blocked_fence;
>  	} guc_state;
>  
>  	struct {
> @@ -190,9 +192,6 @@ struct intel_context {
>  	 */
>  	struct list_head guc_id_link;
>  
> -	/* GuC context blocked fence */
> -	struct i915_sw_fence guc_blocked;
> -
>  	/*
>  	 * GuC priority management
>  	 */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9ae4633aa7cb..7aa16371908a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1482,24 +1482,24 @@ static void guc_blocked_fence_complete(struct intel_context *ce)
>  {
>  	lockdep_assert_held(&ce->guc_state.lock);
>  
> -	if (!i915_sw_fence_done(&ce->guc_blocked))
> -		i915_sw_fence_complete(&ce->guc_blocked);
> +	if (!i915_sw_fence_done(&ce->guc_state.blocked_fence))
> +		i915_sw_fence_complete(&ce->guc_state.blocked_fence);
>  }
>  
>  static void guc_blocked_fence_reinit(struct intel_context *ce)
>  {
>  	lockdep_assert_held(&ce->guc_state.lock);
> -	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_blocked));
> +	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_state.blocked_fence));
>  
>  	/*
>  	 * This fence is always complete unless a pending schedule disable is
>  	 * outstanding. We arm the fence here and complete it when we receive
>  	 * the pending schedule disable complete message.
>  	 */
> -	i915_sw_fence_fini(&ce->guc_blocked);
> -	i915_sw_fence_reinit(&ce->guc_blocked);
> -	i915_sw_fence_await(&ce->guc_blocked);
> -	i915_sw_fence_commit(&ce->guc_blocked);
> +	i915_sw_fence_fini(&ce->guc_state.blocked_fence);
> +	i915_sw_fence_reinit(&ce->guc_state.blocked_fence);
> +	i915_sw_fence_await(&ce->guc_state.blocked_fence);
> +	i915_sw_fence_commit(&ce->guc_state.blocked_fence);
>  }
>  
>  static u16 prep_context_pending_disable(struct intel_context *ce)
> @@ -1539,7 +1539,7 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>  		if (enabled)
>  			clr_context_enabled(ce);
>  		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> -		return &ce->guc_blocked;
> +		return &ce->guc_state.blocked_fence;
>  	}
>  
>  	/*
> @@ -1555,7 +1555,7 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>  	with_intel_runtime_pm(runtime_pm, wakeref)
>  		__guc_context_sched_disable(guc, ce, guc_id);
>  
> -	return &ce->guc_blocked;
> +	return &ce->guc_state.blocked_fence;
>  }
>  
>  static void guc_context_unblock(struct intel_context *ce)
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
