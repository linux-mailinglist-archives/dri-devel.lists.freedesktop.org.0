Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3080E85828B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7D610EC18;
	Fri, 16 Feb 2024 16:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fLSu72tz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216B710EC18
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 16:32:40 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4123891b49cso2724635e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 08:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708101158; x=1708705958; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SgQeh6gny5JrINPGAEJwqjErNXlFS7uJm/gN6H25Wl4=;
 b=fLSu72tzVwSc8tPEo3RCJeWOsd0OIwR5OIjrMpDRdDJs/fId45CqrgQOld8nf82DCt
 649o5Wil+6qvCqVqmDEzY8UB73/w3mk5jo4NnNKQIgpUnFZ3f6vNZX+Y798ChmWwZJOc
 uahYtlVdwzXmViVtAW50uDTnxjnEmdyr6KaXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708101158; x=1708705958;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SgQeh6gny5JrINPGAEJwqjErNXlFS7uJm/gN6H25Wl4=;
 b=K7vjVHq42QhsDbAj8yetwu4fkVbrK/9DdQvLOM8xcamhDIaMnoaHhfiEuTPzd/RgNK
 //kyElok7BH2H2RVUEwoaaHRNhfi6NYi0LKCK7CFDdGojoIDL/DDgLbWiVyjv3HI31T8
 j0qgVtE/qXbLlYoCsfMMj3Bb5Bz/fPmI7tfiF2yS75iVQybYREZHjZfl/+dBkE/rHLea
 c/SjPqwUC+cZuau9iUHKKTLMIbYnx+WtbCmpdajIpUFWLOh/c66sI3KOdw9tOyX16kaT
 FwrrI+Cohq8LQSDmmYeD+3XXw1ehHFTqhcCINB55UcLY/RepQAUJX1SbpyY9ZHluYOw7
 J9VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDqJepoJqRrgTIxvF7e99hdSx2aWNq7vwoFeL+p4U2FzG5RuhwHmJTp8sZUOLjFpjkvz4sT/RTK4JYcKdfE9yLkAmaOGVTQHWaKEZNxaLz
X-Gm-Message-State: AOJu0YzlJVdmgORfB3FsIcVyWlCJZWZk0i91+OQr4CZ9GCY5Oq7Ytevk
 H35M9MJXONXXVyO0eapgoNecKhi76yl/9o8IFqEf3USi3dQQVsLOrJAlZ9dvskA=
X-Google-Smtp-Source: AGHT+IFE0jwLawnXRHSScGe2ockTGkEpG5gU+Fwm8RLqeKicUfmzpG/tRRmoFIyQP2z5PdY038vGLA==
X-Received: by 2002:a05:600c:510a:b0:411:de28:bb52 with SMTP id
 o10-20020a05600c510a00b00411de28bb52mr3914738wms.4.1708101158500; 
 Fri, 16 Feb 2024 08:32:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b00411d0b58056sm2932741wmq.5.2024.02.16.08.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 08:32:38 -0800 (PST)
Date: Fri, 16 Feb 2024 17:32:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 1/6] tracing, dma-buf: add a trace_dma_fence_sync_to
 event
Message-ID: <Zc-OJAXlApzcOfYQ@phenom.ffwll.local>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Tue, Feb 13, 2024 at 04:50:26PM +0100, Pierre-Eric Pelloux-Prayer wrote:
> This new event can be used to trace where a given dma_fence is added
> as a dependency of some other work.

How?

What I'd expected here is that you add a dependency chain from one fence
to another, but this only has one fence. How do you figure out what's the
next dma_fence that will stall on this dependency? Like in the gpu
scheduler we do know what will be the fence that userspace gets back, so
we can make that connection. And same for the atomic code (although you
don't wire that up at all).

I'm very confused on how this works and rather worried it's a brittle
amdgpu-only solution ...
-Sima

> I plan to use it in amdgpu.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/dma-buf/dma-fence.c      |  1 +
>  include/trace/events/dma_fence.h | 34 ++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index e0fd99e61a2d..671a499a5ccd 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -23,6 +23,7 @@
>  EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
>  EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
>  EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
> +EXPORT_TRACEPOINT_SYMBOL(dma_fence_sync_to);
>  
>  static DEFINE_SPINLOCK(dma_fence_stub_lock);
>  static struct dma_fence dma_fence_stub;
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index 3963e79ca7b4..9b3875f7aa79 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -83,6 +83,40 @@ DEFINE_EVENT(dma_fence, dma_fence_wait_end,
>  	TP_ARGS(fence)
>  );
>  
> +DECLARE_EVENT_CLASS(dma_fence_from,
> +
> +	TP_PROTO(struct dma_fence *fence, const char *reason),
> +
> +	TP_ARGS(fence, reason),
> +
> +	TP_STRUCT__entry(
> +		__string(driver, fence->ops->get_driver_name(fence))
> +		__string(timeline, fence->ops->get_timeline_name(fence))
> +		__field(unsigned int, context)
> +		__field(unsigned int, seqno)
> +		__string(reason, reason)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(driver, fence->ops->get_driver_name(fence));
> +		__assign_str(timeline, fence->ops->get_timeline_name(fence));
> +		__entry->context = fence->context;
> +		__entry->seqno = fence->seqno;
> +		__assign_str(reason, reason);
> +	),
> +
> +	TP_printk("driver=%s timeline=%s context=%u seqno=%u reason=%s",
> +		  __get_str(driver), __get_str(timeline), __entry->context,
> +		  __entry->seqno, __get_str(reason))
> +);
> +
> +DEFINE_EVENT(dma_fence_from, dma_fence_sync_to,
> +
> +	TP_PROTO(struct dma_fence *fence, const char *reason),
> +
> +	TP_ARGS(fence, reason)
> +);
> +
>  #endif /*  _TRACE_DMA_FENCE_H */
>  
>  /* This part must be outside protection */
> -- 
> 2.40.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
