Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31423B9F6A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9A26E0FE;
	Fri,  2 Jul 2021 11:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F816E0FC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 11:01:47 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 181071F44C58;
 Fri,  2 Jul 2021 12:01:46 +0100 (BST)
Date: Fri, 2 Jul 2021 13:01:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add the ability to create submit
 queues
Message-ID: <20210702130142.17506173@collabora.com>
In-Reply-To: <e42f478f-eaa4-752f-8fb6-b0f53f09a2d7@arm.com>
References: <20210701091224.3209803-1-boris.brezillon@collabora.com>
 <20210701091224.3209803-5-boris.brezillon@collabora.com>
 <700919f1-a0d0-d8fb-e871-915b56260f83@arm.com>
 <20210702125234.14ab19fb@collabora.com>
 <e42f478f-eaa4-752f-8fb6-b0f53f09a2d7@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2 Jul 2021 11:58:34 +0100
Steven Price <steven.price@arm.com> wrote:

> On 02/07/2021 11:52, Boris Brezillon wrote:
> > On Fri, 2 Jul 2021 11:08:58 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >> On 01/07/2021 10:12, Boris Brezillon wrote:  
> >>> Needed to keep VkQueues isolated from each other.    
> >>
> >> One more comment I noticed when I tried this out:
> >>
> >> [...]  
> >>> +struct panfrost_submitqueue *
> >>> +panfrost_submitqueue_create(struct panfrost_file_priv *ctx,
> >>> +			    enum panfrost_submitqueue_priority priority,
> >>> +			    u32 flags)
> >>> +{
> >>> +	struct panfrost_submitqueue *queue;
> >>> +	enum drm_sched_priority sched_prio;
> >>> +	int ret, i;
> >>> +
> >>> +	if (flags || priority >= PANFROST_SUBMITQUEUE_PRIORITY_COUNT)
> >>> +		return ERR_PTR(-EINVAL);
> >>> +
> >>> +	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
> >>> +	if (!queue)
> >>> +		return ERR_PTR(-ENOMEM);
> >>> +
> >>> +	queue->pfdev = ctx->pfdev;
> >>> +	sched_prio = to_sched_prio(priority);
> >>> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> >>> +		struct drm_gpu_scheduler *sched;
> >>> +
> >>> +		sched = panfrost_job_get_sched(ctx->pfdev, i);
> >>> +		ret = drm_sched_entity_init(&queue->sched_entity[i],
> >>> +					    sched_prio, &sched, 1, NULL);
> >>> +		if (ret)
> >>> +			break;
> >>> +	}
> >>> +
> >>> +	if (ret) {
> >>> +		for (i--; i >= 0; i--)
> >>> +			drm_sched_entity_destroy(&queue->sched_entity[i]);
> >>> +
> >>> +		return ERR_PTR(ret);
> >>> +	}
> >>> +
> >>> +	kref_init(&queue->refcount);
> >>> +	idr_lock(&ctx->queues);
> >>> +	ret = idr_alloc(&ctx->queues, queue, 0, INT_MAX, GFP_KERNEL);    
> >>
> >> This makes lockdep complain. idr_lock() is a spinlock and GFP_KERNEL can
> >> sleep. So either we need to bring our own mutex here or not use GFP_KERNEL.
> >>  
> > 
> > Ouch! I wonder why I don't see that (I have lockdep enabled, and the
> > igt tests should have exercised this path).  
> 
> Actually I'm not sure it technically lockdep - have you got
> CONFIG_DEBUG_ATOMIC_SLEEP set?

Nope, I was missing that one :-/.
