Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3466CB54A76
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C87C10EC03;
	Fri, 12 Sep 2025 10:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="X/l9f1PK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1B610EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:58:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757674676; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=APlkudR0qjLm3XSz5iV/udOwNM0Siv+Wa+lYUjBN0XJDmqzgkIARb3x98conwd4lp/vlx6Chc1TtiuUI+U3ixJ/wDI/fHMrRNbtWbOUwtSxYLXneif8r6OZKk16jYDhCquuH3E3KxlWcLeRpm/e8LC8UGKdSgMJROQLs3zKnD9w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757674676;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qAdSIjUeiPovhOZ5oeAA6F0k6FxawUDv7nW9BDoqdPs=; 
 b=NW7FA+m/8rNcJ7Whq8jMVqSDaL+zANznArtBPhTNrV3R0aT22USlWtO77emw2trTNyfE7816PUszJ88UqawC7fUqeyau9CAx7nPBMmmrPgFspG/ABCT/OeNIu8B31D9Nen72AAFHO8sLVIsuohACT549VSG8nXrwaTuB970E874=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757674676; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=qAdSIjUeiPovhOZ5oeAA6F0k6FxawUDv7nW9BDoqdPs=;
 b=X/l9f1PKricjPo2coUdGbAprbK6vA1Ivu27kO6aluCoMKzZ8J+oUUNpD4OSc6on5
 ohXcnLuDs+mV0/8bNoAXFxd1uk9iQpoJ4yB4xneiLZMToT3Xmc6w9s1gB6b8OheeX9P
 WuxJPkqPDHm3/3jmE+T6H0sGZJlaQ+6y355i4xak=
Received: by mx.zohomail.com with SMTPS id 1757674674844468.5742493556746;
 Fri, 12 Sep 2025 03:57:54 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:57:51 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 2/4] drm/panfrost: Introduce JM contexts for manging
 job resources
Message-ID: <sucdvuv4upf24srwf4ki5z2zubpu3m5rkz2k4opzgcdtc5yovw@jm3dslwedctc>
References: <20250904001054.147465-1-adrian.larumbe@collabora.com>
 <20250904001054.147465-3-adrian.larumbe@collabora.com>
 <99a903b8-4b51-408d-b620-4166a11e3ad1@arm.com>
 <20250910175213.542fdb4b@fedora>
 <bba00626-f9aa-4525-8568-2616adac7563@arm.com>
 <20250910185058.5239ada4@fedora>
 <aec81419-a827-43bc-a157-75df059c2bd5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aec81419-a827-43bc-a157-75df059c2bd5@arm.com>
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

On 11.09.2025 10:30, Steven Price wrote:
> On 10/09/2025 17:50, Boris Brezillon wrote:
> > On Wed, 10 Sep 2025 16:56:43 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >
> >> On 10/09/2025 16:52, Boris Brezillon wrote:
> >>> On Wed, 10 Sep 2025 16:42:32 +0100
> >>> Steven Price <steven.price@arm.com> wrote:
> >>>
> >>>>> +int panfrost_jm_ctx_create(struct drm_file *file,
> >>>>> +			   struct drm_panfrost_jm_ctx_create *args)
> >>>>> +{
> >>>>> +	struct panfrost_file_priv *priv = file->driver_priv;
> >>>>> +	struct panfrost_device *pfdev = priv->pfdev;
> >>>>> +	enum drm_sched_priority sched_prio;
> >>>>> +	struct panfrost_jm_ctx *jm_ctx;
> >>>>> +
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	jm_ctx = kzalloc(sizeof(*jm_ctx), GFP_KERNEL);
> >>>>> +	if (!jm_ctx)
> >>>>> +		return -ENOMEM;
> >>>>> +
> >>>>> +	kref_init(&jm_ctx->refcnt);
> >>>>> +
> >>>>> +	/* Same priority for all JS within a single context */
> >>>>> +	jm_ctx->config = JS_CONFIG_THREAD_PRI(args->priority);
> >>>>> +
> >>>>> +	ret = jm_ctx_prio_to_drm_sched_prio(file, args->priority, &sched_prio);
> >>>>> +	if (ret)
> >>>>> +		goto err_put_jm_ctx;
> >>>>> +
> >>>>> +	for (u32 i = 0; i < NUM_JOB_SLOTS - 1; i++) {
> >>>>> +		struct drm_gpu_scheduler *sched = &pfdev->js->queue[i].sched;
> >>>>> +		struct panfrost_js_ctx *js_ctx = &jm_ctx->slots[i];
> >>>>> +
> >>>>> +		ret = drm_sched_entity_init(&js_ctx->sched_entity, sched_prio,
> >>>>> +					    &sched, 1, NULL);
> >>>>> +		if (ret)
> >>>>> +			goto err_put_jm_ctx;
> >>>>> +
> >>>>> +		js_ctx->enabled = true;
> >>>>> +	}
> >>>>> +
> >>>>> +	ret = xa_alloc(&priv->jm_ctxs, &args->handle, jm_ctx,
> >>>>> +		       XA_LIMIT(0, MAX_JM_CTX_PER_FILE), GFP_KERNEL);
> >>>>> +	if (ret)
> >>>>> +		goto err_put_jm_ctx;
> >>>>
> >>>> On error here we just jump down and call panfrost_jm_ctx_put() which
> >>>> will free jm_ctx but won't destroy any of the drm_sched_entities. There
> >>>> seems to be something a bit off with the lifetime management here.
> >>>>
> >>>> Should panfrost_jm_ctx_release() be responsible for tearing down the
> >>>> context, and panfrost_jm_ctx_destroy() be nothing more than dropping the
> >>>> reference?
> >>>
> >>> The idea was to kill/cancel any pending jobs as soon as userspace
> >>> releases the context, like we were doing previously when the FD was
> >>> closed. If we defer this ctx teardown to the release() function, we're
> >>> basically waiting for all jobs to complete, which:
> >>>
> >>> 1. doesn't encourage userspace to have proper control over the contexts
> >>>    lifetime
> >>> 2. might use GPU/mem resources to execute jobs no one cares about
> >>>    anymore
> >>
> >> Ah, good point - yes killing the jobs in panfrost_jm_ctx_destroy() makes
> >> sense. But we still need to ensure the clean-up happens in the other
> >> paths ;)
> >>
> >> So panfrost_jm_ctx_destroy() should keep the killing jobs part, butthe
> >> drm scheduler entity cleanup should be moved.
> >
> > The thing is, we need to call drm_sched_entity_fini() if we want all
> > pending jobs that were not queued to the HW yet to be cancelled
> > (_fini() calls _flush() + _kill()). This has to happen before we cancel
> > the jobs at the JM level, otherwise drm_sched might pass us new jobs
> > while we're trying to get rid of the currently running ones. Once we've
> > done that, there's basically nothing left to defer, except the kfree().
>
> Ok, I guess that makes sense.
>
> In which case panfrost_jm_ctx_create() just needs fixing to fully tear
> down the context in the event the xa_alloc() fails. Although that makes
> me wonder whether the reference counting on the JM context really
> achieves anything. Are we ever expecting the context to live past the
> panfrost_jm_ctx_destroy() call?

We still need reference counting, otherwise there would be a racy window between
the submission and context destruction ioctls, in which a context that has just
been released is still owned by a newly created job leading to UAF.

> Indeed is it even possible to have any in-flight jobs after
> drm_sched_entity_destroy() has returned?

My understanding of drm_sched_entity_destroy() is that, after it returns,
no jobs can be in-flight any more and the entity is rendered unusable by
any new jobs. This can lead to the unpleasant situation in which a thread
tries to submit a new job and gets a context reference right before another
thread takes precedence and destroys it, causing the scheduler entities to
be unusable.

Then drm_sched_job_init() would contain a reference to an invalid entity,
which further down the line would cause drm_sched_entity_push_job() to report
a DRM_ERROR warning that te entity is stopped, which should never happen,
because drm_sched_entity_push_job() must always suceed.

> Once all the sched entities have been destroyed there doesn't really
> seem to be anything left in struct panfrost_jm_ctx.

We've thought of a new approach whereby a context would be flagged as destroyed
inside panfrost_jm_ctx_destroy(), destruction of scheduler entities done at context
release time and then cancelling new jobs that had been queued after context
destruction in the .run_job scheduler function if they notice the context
is so flagged.

> Thanks,
> Steve

Cheers,
Adrian Larumbe
