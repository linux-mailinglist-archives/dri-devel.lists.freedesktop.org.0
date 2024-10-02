Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CF398D9EF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 16:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F3510E75A;
	Wed,  2 Oct 2024 14:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k6Kz3d57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB6410E75A;
 Wed,  2 Oct 2024 14:16:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BE72EA43D44;
 Wed,  2 Oct 2024 14:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EA5C4CECE;
 Wed,  2 Oct 2024 14:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727878564;
 bh=Lu5yeeAWDRG7wuGSdV8umcfdT5iHrBtdO/F0ex29vvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k6Kz3d57eDeMmu2Iall0kqR6ATmDj0MJv78eF4BB0UpFLOc71XptkxCkMXKvFdMba
 p9mCrhSbH/0jHOBJXR3rsH5x/OL5NDVQqFNXkPcz/yxLlxfVdgfJGcS0VW7hROE0WK
 rpy32Ia1ZXwbEmOQRDTfMx7ERd/GOR0g2gxnzkwV8ueN5EIfsPhR0wTiCU6ywvUdWk
 C/N3AFnv95flscZMI0KfGdANJPD+If3fBuFeBA5GlWrFW8rmJ3T8d0anuubU5ZtUvf
 NS6dzrqrlGekT3sCbQZ62y9wGv+ljnm+53zKO2fTe4AhhLhtqRu9MZYYROW2mAS++Z
 AbdSuqscRuOpw==
Date: Wed, 2 Oct 2024 16:16:00 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 pstanner@redhat.com, ltuikov89@gmail.com
Subject: Re: [PATCH v4 1/2] drm/sched: Use drm sched lockdep map for submit_wq
Message-ID: <Zv1VoJ_KEw1-P257@pollux>
References: <20241002131639.3425022-1-matthew.brost@intel.com>
 <20241002131639.3425022-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002131639.3425022-2-matthew.brost@intel.com>
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

On Wed, Oct 02, 2024 at 06:16:38AM -0700, Matthew Brost wrote:
> Avoid leaking a lockdep map on each drm sched creation and destruction
> by using a single lockdep map for all drm sched allocated submit_wq.
> 
> v2:
>  - Use alloc_ordered_workqueue_lockdep_map (Tejun)
> 
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Good catch,

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 36db5c7736fc..e32b0f7d7e94 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -87,6 +87,12 @@
>  #define CREATE_TRACE_POINTS
>  #include "gpu_scheduler_trace.h"
>  
> +#ifdef CONFIG_LOCKDEP
> +static struct lockdep_map drm_sched_lockdep_map = {
> +	.name = "drm_sched_lockdep_map"
> +};
> +#endif
> +
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> @@ -1270,7 +1276,12 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		sched->submit_wq = submit_wq;
>  		sched->own_submit_wq = false;
>  	} else {
> +#ifdef CONFIG_LOCKDEP
> +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
> +								       &drm_sched_lockdep_map);
> +#else
>  		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> +#endif
>  		if (!sched->submit_wq)
>  			return -ENOMEM;
>  
> -- 
> 2.34.1
> 
