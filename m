Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B46858268
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D7010EBE9;
	Fri, 16 Feb 2024 16:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="QXvgjRVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161C210EBE7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 16:25:30 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-411f8e84e4fso2902655e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 08:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708100728; x=1708705528; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FbovBTMRuauZ87JHkxYtCDu9xXwl8pNuoEKKXTPkIE4=;
 b=QXvgjRVkVAFLwDLWGWBgOiTRZjIq+urcyKqssIdNuFL+sqBuXRoR12sHwmNWCt8V8m
 7Zo4rX5+9AXWXFFI0nOjqvNU9hVp+/X2DJ2D0QfF7lZTo2+t3RXZhwm/JSgM6yYnQCQl
 JlNRAflUyQyKzv9zeKC6QKFlWHyDPnqAdchFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708100728; x=1708705528;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FbovBTMRuauZ87JHkxYtCDu9xXwl8pNuoEKKXTPkIE4=;
 b=PrHpn6ingE//EA/AUMOFbkK3zR4JXEjNXDGxsuz2F6dCmYRxdv6MC5fTsu9J8ffgFg
 N/pjvef3aYEoB8hzwALqs5L3gtkwMVYzy3BLG0ina/sFPysO70PRrD1NflfnTTbMIiRW
 eRVZMiRWVx3e7OfrKpmnggEAPXEUv56Pfsr6/3j46Qu/4KB1TyxaS21zbvXqR+fyCkmm
 TG5BI5Xe25XrKa6OQuUgR1LoHDx78/GgzQe5TScg1IJFc8fIcOw4vMH9kcEwwzQGWNAY
 CzKX7xBF+NvbmqIkbav5S5iCaSmTElisIkmOZyGhsNIByjGS7XVPvjF0F5R/dcnaHtQD
 htSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3V7me2wmPB90hwSAYwvkfVLHbUjvd5vI+FzA9LLVwO8AQUs64NAYAqlABnpzYS4Nz7LfRgiugvGe/euSKZKSKkm2Fd1yydYrlMX8KnMis
X-Gm-Message-State: AOJu0YzQS/sG2LOBKkiMTDty3jQCkQuQf9rlejlWeqeeqlMEAg5f5ge5
 s7Axh2/czXB7NCp1QFTSubu+nZBgsMk7NjTSzxV1QenbtJM6B/9jtYx6730yJT0=
X-Google-Smtp-Source: AGHT+IHeHVBrgNXG+qAN5mqx7oJbbjaQd6P5O0lqO0uCc/gzwoRohy4nD+vPEEMKf02n7YyersNUsg==
X-Received: by 2002:a05:600c:2258:b0:412:456e:636e with SMTP id
 a24-20020a05600c225800b00412456e636emr1585192wmm.3.1708100728278; 
 Fri, 16 Feb 2024 08:25:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b004122fbf9253sm2726818wmb.39.2024.02.16.08.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 08:25:27 -0800 (PST)
Date: Fri, 16 Feb 2024 17:25:25 +0100
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
Subject: Re: [PATCH v2 0/6] dma-fence, drm, amdgpu new trace events
Message-ID: <Zc-MdXp_2Wcm5ouT@phenom.ffwll.local>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
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

On Tue, Feb 13, 2024 at 04:50:25PM +0100, Pierre-Eric Pelloux-Prayer wrote:
> This series adds new events to make it easier for tools
> like gpuvis or umr to graph the GPUs, kernel and applications
> activity.
> 
> UMR patches using these events can be found here:
> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
> 
> V1:
> https://patchwork.kernel.org/project/linux-media/patch/20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com/
> 
> Changes from V1:
> * uses trace_dma_fence_sync_to from dma-fence-chain.c
> * new amdgpu events
> * new drm plane commit event

I think a patch to add this to the drm/sched dependency tracking would be
really neat. With the addition of drm_sched_job_add_dependency() and
friends that would wire up some basic dependency tracking for a _lot_ of
drivers.

It should also be done before the amdgpu specific additions, because
amdgpu is also using that and we don't want to duplicate fence dependency
tracking in drivers that should be in common code.

Cheer, Sima
> 
> Pierre-Eric Pelloux-Prayer (6):
>   tracing, dma-buf: add a trace_dma_fence_sync_to event
>   dma-buf/fence-chain: use trace_dma_fence_sync_to
>   amdgpu: use trace_dma_fence_sync_to in amdgpu_fence_sync
>   drm/amdgpu: add BO clear event
>   drm/amdgpu: add a amdgpu_cs_ioctl2 event
>   drm: add drm_mode_atomic_commit event
> 
>  drivers/dma-buf/dma-fence-chain.c             |  4 +++
>  drivers/dma-buf/dma-fence.c                   |  1 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  8 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 16 +++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  8 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  4 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      | 11 ++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h      |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     | 28 +++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  4 +--
>  drivers/gpu/drm/drm_atomic_uapi.c             | 19 +++++++++++
>  drivers/gpu/drm/drm_trace.h                   | 28 +++++++++++++--
>  include/trace/events/dma_fence.h              | 34 +++++++++++++++++++
>  14 files changed, 144 insertions(+), 26 deletions(-)
> 
> -- 
> 2.40.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
