Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 994003E8E9E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7A06E117;
	Wed, 11 Aug 2021 10:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45446E116
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 10:30:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id n32so764161wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 03:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JzdAzPlFMIBxGnASivmCusmQmNZftWOM84fP9GYuvPY=;
 b=XcIWCz+1v1U0QbWSUaQjj78JzgHC3UAi0bB8ZWQsZbNMuK+trAY5Qj5BBwEMfiDY8+
 irg/MBLWIkjddCJRU+QwXzK9cJ+KnbmB/ck/L7WQfJG32VsmLnmAetzFQ9LDFryk6ZOg
 JeS3/tbKETDd02JIRv6bpjx707zCZXAewa5Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JzdAzPlFMIBxGnASivmCusmQmNZftWOM84fP9GYuvPY=;
 b=t2E2LzwqFo6RNzIfhI/nLctNAmrhVbSNAGAstR6BgPcjX5ZyGtJybPDSdcGlbVzvdF
 +bvnUbjoLg62wNW984YesTTDNieQlkNQNDPI/WsASd/yvuni5j41ZO3MxIyaRd5zyexd
 q4/0heuyPFyGTI6koZWEKlkDGPbvhuTWfrxKeUtqSySMrTVKQAppzkF4N4BkFWXlYBqa
 o+D/7a1v56PvbUzUkHEY5aYRCen5Z2A6gyw8shT9YCIwSPEdE0RRmbWuhg/DcCaQAnR5
 J9xFvuAZWtErlmWX0/9LhL7EJTCba8yJZMvkB8fFY23z0nsDnMw9Qs48oUWH7y1btJsG
 v0Dw==
X-Gm-Message-State: AOAM5331RCzncyoWrx5k6G9XTJeOfefDhO64wd82ndVsvoI5sTpyvxuJ
 2IYQ/o+PK0cyxhFT0RJE1qsNzF6VBfweTQ==
X-Google-Smtp-Source: ABdhPJzEqrpz3QDRZ6yRDEnjptoZrEmdRb3NM4EdZzoM/fwOjil2KqXeEWaw15AnD10ujHZwgIzoQA==
X-Received: by 2002:a1c:1b8f:: with SMTP id b137mr19910wmb.85.1628677855117;
 Wed, 11 Aug 2021 03:30:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z7sm1070807wmi.4.2021.08.11.03.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 03:30:54 -0700 (PDT)
Date: Wed, 11 Aug 2021 12:30:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: gfx-internal-devel@eclists.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/i915/guc: Fix blocked context accounting
Message-ID: <YROm3Ep+RpKHQcL/@phenom.ffwll.local>
References: <20210811011622.255784-1-matthew.brost@intel.com>
 <20210811011622.255784-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811011622.255784-2-matthew.brost@intel.com>
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

On Wed, Aug 11, 2021 at 01:16:14AM +0000, Matthew Brost wrote:
> Prior to this patch the blocked context counter was cleared on
> init_sched_state (used during registering a context & resets) which is
> incorrect. This state needs to be persistent or the counter can read the
> incorrect value resulting in scheduling never getting enabled again.
> 
> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")

Tiny bikeshed on that commit, but for SCHED_STATE_BLOCKED_MASK you want
GENMASK. Also SCHED_STATE_BLOCKED is usually called
SCHED_STATE_BLOCKED_BIAS or similar if you put a counter into that field.

But also ... we can't afford a separate counter? Is all the bitshifting
actually worth the space savings? With a separate counter your bugfix
below would look a lot more reasonable too.


> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 87d8dc8f51b9..69faa39da178 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -152,7 +152,7 @@ static inline void init_sched_state(struct intel_context *ce)
>  {
>  	/* Only should be called from guc_lrc_desc_pin() */
>  	atomic_set(&ce->guc_sched_state_no_lock, 0);

atomic_t without barriers or anything like that. tsk, tsk.

Do we really need this?

Also I looked through the callchain of init_sched_state and I couldn't
find any locking, nor any description about ownership that would explain
why there's no locking.

E.g. scrub_guc_desc_for_outstanding_g2h has an xa_for_each with no
protection. No idea how that one works. I also couldn't figure out how
anything else in there is protected (no spinlocks to be seen anywhere at
least).

And then there's stuff like this:

		/* Flush context */
		spin_lock_irqsave(&ce->guc_state.lock, flags);
		spin_unlock_irqrestore(&ce->guc_state.lock, flags);

This pattern seems very common, and it freaks me out.

Finally none of the locking or consistency rules are explained in the
kerneldoc (or even comments) in the relevant datastructures, which is not
great.

> -	ce->guc_state.sched_state = 0;
> +	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;

The patch itself matches the commit message and makes sense. But like I
said, would be cleaner I think if it's just a separate counter.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  }
>  
>  static inline bool
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
