Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB493EE9F5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 11:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1161C6E120;
	Tue, 17 Aug 2021 09:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173BE6E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 09:33:00 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r6so27622710wrt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c42/ohKSnsW9BlnudEUEX124GsdLZJd20HxBJjZ+VMA=;
 b=R3zsPXqtESV09/V5vYRHYlrCIoupH19TJpS6cW+KeN/dRQlzRC4FEbH9rfkWWxmA1m
 Vm/be+9GGvcCo3kPshKhmCSGDKajoLYYRe+KedyIufFDX4CmNNUPX+B6bGoRCtQC7f/T
 F7eTYo2CmJXhzGu6FWT0U0QqP3Xvo97vANTno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c42/ohKSnsW9BlnudEUEX124GsdLZJd20HxBJjZ+VMA=;
 b=KtyIpgvYVOi0g2ZMZ4OubmrT+Zc/siIvoabWDBOtFMZDNKPZE8UUJn49KgP/VoAbws
 IECHzt2Q0FaKaSJa72xvIPsNuLxEu/o2sWOwxCTcvUe2U2VKG3Gmz4cxbubIAnp4PXjr
 fBe7v/QgZmVBTkvtQ67BM2uNoNh7NfX4N69+EC2PRBkq0tlW+o/c4yq5EL2kSVFiiIKA
 QCnP5FIDG7m9l1TnJZ5Ms7Unhny5SBETgtJGB6rjMkWd+pX1j4uzuUCxqaJBfQi7pUXe
 7g+dVsbSNRia/z/9QKiXa+/Zao71y+rFheUSwlomtZ3xuafU3UegL2udBlPaU93MDKTt
 D1aw==
X-Gm-Message-State: AOAM53205+UUOTrOYG4qv3rUhn86rpCnlojdj5+yCA+8HJuJg6tHa7xH
 AybIZvQx8pgTaFNlYd4RBrGYrQ==
X-Google-Smtp-Source: ABdhPJw3lw2cyBqoJVt2jYAYA1uZWDAAg35qJxZXLhhKLWbeJJQXOlyP/zEKjmq4MaTwVsat1wgVCg==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr2800388wrr.93.1629192778508;
 Tue, 17 Aug 2021 02:32:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 104sm1858712wrc.4.2021.08.17.02.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 02:32:57 -0700 (PDT)
Date: Tue, 17 Aug 2021 11:32:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 05/22] drm/i915/guc: Workaround reset G2H is received
 after schedule done G2H
Message-ID: <YRuCSLVnbr+k05uL@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-6-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816135139.10060-6-matthew.brost@intel.com>
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

On Mon, Aug 16, 2021 at 06:51:22AM -0700, Matthew Brost wrote:
> If the context is reset as a result of the request cancelation the
> context reset G2H is received after schedule disable done G2H which is
> likely the wrong order. The schedule disable done G2H release the
> waiting request cancelation code which resubmits the context. This races
> with the context reset G2H which also wants to resubmit the context but
> in this case it really should be a NOP as request cancelation code owns
> the resubmit. Use some clever tricks of checking the context state to
> seal this race until if / when the GuC firmware is fixed.
> 
> v2:
>  (Checkpatch)
>   - Fix typos
> 
> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 43 ++++++++++++++++---
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3cd2da6f5c03..c3b7bf7319dd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -826,17 +826,35 @@ __unwind_incomplete_requests(struct intel_context *ce)
>  static void __guc_reset_context(struct intel_context *ce, bool stalled)
>  {
>  	struct i915_request *rq;
> +	unsigned long flags;
>  	u32 head;
> +	bool skip = false;
>  
>  	intel_context_get(ce);
>  
>  	/*
> -	 * GuC will implicitly mark the context as non-schedulable
> -	 * when it sends the reset notification. Make sure our state
> -	 * reflects this change. The context will be marked enabled
> -	 * on resubmission.
> +	 * GuC will implicitly mark the context as non-schedulable when it sends
> +	 * the reset notification. Make sure our state reflects this change. The
> +	 * context will be marked enabled on resubmission.
> +	 *
> +	 * XXX: If the context is reset as a result of the request cancellation
> +	 * this G2H is received after the schedule disable complete G2H which is
> +	 * likely wrong as this creates a race between the request cancellation
> +	 * code re-submitting the context and this G2H handler. This likely
> +	 * should be fixed in the GuC but until if / when that gets fixed we
> +	 * need to workaround this. Convert this function to a NOP if a pending
> +	 * enable is in flight as this indicates that a request cancellation has
> +	 * occurred.
>  	 */
> -	clr_context_enabled(ce);
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	if (likely(!context_pending_enable(ce))) {
> +		clr_context_enabled(ce);
> +	} else {
> +		skip = true;
> +	}
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	if (unlikely(skip))
> +		goto out_put;
>  
>  	rq = intel_context_find_active_request(ce);
>  	if (!rq) {
> @@ -855,6 +873,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>  out_replay:
>  	guc_reset_state(ce, head, stalled);
>  	__unwind_incomplete_requests(ce);
> +out_put:
>  	intel_context_put(ce);
>  }
>  
> @@ -1599,6 +1618,13 @@ static void guc_context_cancel_request(struct intel_context *ce,
>  			guc_reset_state(ce, intel_ring_wrap(ce->ring, rq->head),
>  					true);
>  		}
> +
> +		/*
> +		 * XXX: Racey if context is reset, see comment in
> +		 * __guc_reset_context().
> +		 */
> +		flush_work(&ce_to_guc(ce)->ct.requests.worker);

This looks racy, and I think that holds in general for all the flush_work
you're adding: This only flushes the processing of the work, it doesn't
stop any re-queueing (as far as I can tell at least), which means it
doesn't do a hole lot.

Worse, your task is re-queue because it only processes one item at a time.
That means flush_work only flushes the first invocation, but not even
drains them all. So even if you do prevent requeueing somehow, this isn't
what you want. Two solutions.

- flush_work_sync, which flushes until self-requeues are all done too

- Or more preferred, make you're worker a bit more standard for this
  stuff: a) under the spinlock, take the entire list, not just the first
  entry, with list_move or similar to a local list b) process that local
  list in a loop b) don't requeue youreself.

Cheers, Daniel
> +
>  		guc_context_unblock(ce);
>  	}
>  }
> @@ -2719,7 +2745,12 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>  {
>  	trace_intel_context_reset(ce);
>  
> -	if (likely(!intel_context_is_banned(ce))) {
> +	/*
> +	 * XXX: Racey if request cancellation has occurred, see comment in
> +	 * __guc_reset_context().
> +	 */
> +	if (likely(!intel_context_is_banned(ce) &&
> +		   !context_blocked(ce))) {
>  		capture_error_state(guc, ce);
>  		guc_context_replay(ce);
>  	}
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
