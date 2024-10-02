Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A998DE8B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 17:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16010E761;
	Wed,  2 Oct 2024 15:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z0Sidars";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5358010E761;
 Wed,  2 Oct 2024 15:13:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D2CC5C0404;
 Wed,  2 Oct 2024 15:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDD2C4CECF;
 Wed,  2 Oct 2024 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727881992;
 bh=8mfDjnrEGnE0iLpRJT9CQ/wDNIFGILol9Wwq+rLBwFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z0SidarsMFfJc1HowY9NWf5dxKYbfa/VZcF3FbzMRYIzejrLM47ykrR0gMlYW+x8N
 m2jwzXRa3IbSorbLaHpI4RFRMFCwNZE3w/2f1fP51vX/anNAQmgBHE9ejkS2c0r03f
 uOuRPXEVTfQ6wTzqAhc3FJTQVmqDqkG1EaC6bnTgbz8O0CRVUhUBxmT5YtMvzj3cVe
 ykogiloOvVHmO9yQXWwLaonFHEtToeNEbVZP2ubdWDohFzCCdfz9VcSwOr0W2vZEmG
 qvCGTV/UW5G9BvDzrqudw7NA5MOlSJ4f2KGjRx84wy8h7C+MtRFs7MR9mL5abpnbjw
 +/+3nWu50VYrA==
Date: Wed, 2 Oct 2024 17:13:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 pstanner@redhat.com, ltuikov89@gmail.com
Subject: Re: [PATCH v4 1/2] drm/sched: Use drm sched lockdep map for submit_wq
Message-ID: <Zv1jAc_uqa-xyF0F@pollux>
References: <20241002131639.3425022-1-matthew.brost@intel.com>
 <20241002131639.3425022-2-matthew.brost@intel.com>
 <Zv1VoJ_KEw1-P257@pollux>
 <Zv1f+KHSe+N282+J@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv1f+KHSe+N282+J@DUT025-TGLU.fm.intel.com>
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

On Wed, Oct 02, 2024 at 03:00:08PM +0000, Matthew Brost wrote:
> On Wed, Oct 02, 2024 at 04:16:00PM +0200, Danilo Krummrich wrote:
> > On Wed, Oct 02, 2024 at 06:16:38AM -0700, Matthew Brost wrote:
> > > Avoid leaking a lockdep map on each drm sched creation and destruction
> > > by using a single lockdep map for all drm sched allocated submit_wq.
> > > 
> > > v2:
> > >  - Use alloc_ordered_workqueue_lockdep_map (Tejun)
> > > 
> > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > Good catch,
> > 
> 
> Thanks. I'm likely to merge this patch through drm-xe-next rather than
> drm-misc assuming it is ok with the drm-misc maintainers. I've pinged
> Maarten about this.
> 
> Any objection on your end if I do this?

No, I think that makes sense.

> 
> Matt
> 
> > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > 
> > > ---
> > >  drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 36db5c7736fc..e32b0f7d7e94 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -87,6 +87,12 @@
> > >  #define CREATE_TRACE_POINTS
> > >  #include "gpu_scheduler_trace.h"
> > >  
> > > +#ifdef CONFIG_LOCKDEP
> > > +static struct lockdep_map drm_sched_lockdep_map = {
> > > +	.name = "drm_sched_lockdep_map"
> > > +};
> > > +#endif
> > > +
> > >  #define to_drm_sched_job(sched_job)		\
> > >  		container_of((sched_job), struct drm_sched_job, queue_node)
> > >  
> > > @@ -1270,7 +1276,12 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
> > >  		sched->submit_wq = submit_wq;
> > >  		sched->own_submit_wq = false;
> > >  	} else {
> > > +#ifdef CONFIG_LOCKDEP
> > > +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
> > > +								       &drm_sched_lockdep_map);
> > > +#else
> > >  		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> > > +#endif
> > >  		if (!sched->submit_wq)
> > >  			return -ENOMEM;
> > >  
> > > -- 
> > > 2.34.1
> > > 
> 
