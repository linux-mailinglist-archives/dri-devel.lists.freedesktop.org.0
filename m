Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9012997E9D3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 12:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB6E10E1D9;
	Mon, 23 Sep 2024 10:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JFVK5qSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3380B10E1D9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727086736;
 bh=FZPFPyImlZ9G/QZYUIY+wTwdbXvFKDdPVq5ZV7K2YM0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JFVK5qSMFhRSItdTGbHWohtUZKut2/6jd9DE3PZ7by+BDMt6KhajR4rzAZkrcXLg1
 yLRFcN7WYCTbvptb0Q//GQffpQngzTkCC3fEFgjuOKRWzx8HnrKpmNOavv2m4We9m4
 xCbGDNyucriAtfaLUDiYP4KV78oyKB+orPEBocQweq/LbT8LWRRnDVK/eUzoHgDGvC
 dZFYFzJDzgwf1ZchvQTRbccYhVxhOmxMIU4OXseJMleqmJX01IKTN/oA82lxW53Dh6
 8KRxcEbTBlAGLSpbAUE5a9FETDlKkLfnVDgQDB+oe668aPT8aQ+9GIFKAHd3aGWuEC
 HPSmZCeCDPR0Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F3CF217E10D3;
 Mon, 23 Sep 2024 12:18:55 +0200 (CEST)
Date: Mon, 23 Sep 2024 12:18:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v7 1/5] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <20240923121850.38181059@collabora.com>
In-Reply-To: <07c8c715-4016-4963-8544-2e9cc1a8208b@arm.com>
References: <20240920234436.207563-1-adrian.larumbe@collabora.com>
 <20240920234436.207563-2-adrian.larumbe@collabora.com>
 <07c8c715-4016-4963-8544-2e9cc1a8208b@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Sep 2024 10:07:14 +0100
Steven Price <steven.price@arm.com> wrote:

> > +static struct dma_fence *
> > +queue_run_job(struct drm_sched_job *sched_job)
> > +{
> > +	struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
> > +	struct panthor_group *group = job->group;
> > +	struct panthor_queue *queue = group->queues[job->queue_idx];
> > +	struct panthor_device *ptdev = group->ptdev;
> > +	struct panthor_scheduler *sched = ptdev->scheduler;
> > +	struct panthor_job_ringbuf_instrs instrs;  
> 
> instrs isn't initialised...
> 
> > +	struct panthor_job_cs_params cs_params;
> > +	struct dma_fence *done_fence;
> > +	int ret;
> >  
> >  	/* Stream size is zero, nothing to do except making sure all previously
> >  	 * submitted jobs are done before we signal the
> > @@ -2900,17 +3062,23 @@ queue_run_job(struct drm_sched_job *sched_job)
> >  		       queue->fence_ctx.id,
> >  		       atomic64_inc_return(&queue->fence_ctx.seqno));
> >  
> > -	memcpy(queue->ringbuf->kmap + ringbuf_insert,
> > -	       call_instrs, sizeof(call_instrs));
> > +	job->profiling.slot = queue->profiling.seqno++;
> > +	if (queue->profiling.seqno == queue->profiling.slot_count)
> > +		queue->profiling.seqno = 0;
> > +
> > +	job->ringbuf.start = queue->iface.input->insert;
> > +
> > +	get_job_cs_params(job, &cs_params);
> > +	prepare_job_instrs(&cs_params, &instrs);  
> 
> ...but it's passed into prepare_job_instrs() which depends on
> instrs.count (same bug as was in calc_job_credits()) - sorry I didn't
> spot it last review.

Hm, can't we initialize instr::count to zero in prepare_job_instrs()
instead?
