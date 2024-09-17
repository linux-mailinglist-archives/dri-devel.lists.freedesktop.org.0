Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B197AEE7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 12:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A5910E150;
	Tue, 17 Sep 2024 10:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FSsU9v7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E2D10E150
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 10:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726569333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9aYl5XXIi/7ubyZ8ezcVqUU1as5WY2wuSJBEkXrA9o=;
 b=FSsU9v7v9Ayw/ekMRTRns5aX0rXeSnkX13FIM6hGL62WLFkGMCDhECe3eHveBbR3R+9ZOk
 LGRabaJSsEKYF56pvha66/Oz+XVPsjKHwu/KZQE0ebY9kwYy+vrRjmhsPCpXhKPoYP1As+
 qn/IUhqhebmIMzKFNf7jaR1guAX7qxY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-nR-mOyGDNF-MA3Ruce4Gzw-1; Tue, 17 Sep 2024 06:35:31 -0400
X-MC-Unique: nR-mOyGDNF-MA3Ruce4Gzw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a8d2e6a6989so349163866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 03:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726569330; x=1727174130;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RCp1iMHzYkpmRjeBvh/LqkIW3dL78rHqdSG8hJpMPAE=;
 b=h/hMER/BpvIwj0sjtOHdl8xKoIY6wL62fQ5eB0Ux9V//3ZHLDgQelmdfuov1jxQrXV
 pgaN1wFz8dZsJGV0LZn0MNrKpJ6vRai1UvSt+DMnIr2IoQtx1JY3WAGNbSmDPbf3U4YX
 w+6FE+cLppJOJyAmhyauCMsfNht2CNOsYkMIXPR1d2mfxymf69uODyosPbetvHPrNRSN
 rejanbBBCbAJd+02QA3kkXl1a1wtDVFvlWoEorYT4tQ8DBABN8l92UZsE4cJjJItJmmy
 dxx11Z8f+5ABzVZm4l1TSFYiYPfh+lZQPzVN3gOCl8qpCJ0bKV58hzbRn84vQR18MVZt
 V6Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzXVZ/cgt6A0x40ZezxaK61qryse/ifWq9JMscz7EtwA26W4L6XDCZqwfG0VzJxkgTDrp7SMPRpg0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7LtVCv6hs/PAAw2ouL7IaDENz28I2oufWTk3yND8EfMZ12gNm
 TT7LO/Xm4K+wkdkS+viP8al++dl2uKA7w1+FrjnP3EDtE+lL4PDs1H6iVj01UfXSQ5vJ36xarV2
 Zcaj2ZWBpiiJ/3y7XzxRzurXN9yLQCyLxGPueb08g82w8ABzvR/6L1dp9+J41cf8Bqw==
X-Received: by 2002:a17:907:f154:b0:a8a:8dd1:b2d1 with SMTP id
 a640c23a62f3a-a90480c79ddmr1641959266b.55.1726569330033; 
 Tue, 17 Sep 2024 03:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBLg0HzdrLDiPaWFsmIVhxj2190fyCsMc893lLvHhq+nJjMFKeWffexIEzfIeoCddSAvLTgg==
X-Received: by 2002:a17:907:f154:b0:a8a:8dd1:b2d1 with SMTP id
 a640c23a62f3a-a90480c79ddmr1641953866b.55.1726569329028; 
 Tue, 17 Sep 2024 03:35:29 -0700 (PDT)
Received: from [192.168.55.237] (tmo-067-108.customers.d1-online.com.
 [80.187.67.108]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061096762sm428811966b.37.2024.09.17.03.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 03:35:28 -0700 (PDT)
Message-ID: <e43b0d33c3cc6350e89d88ff71943af28f7bacc6.camel@redhat.com>
Subject: Re: [PATCH v2] drm/scheduler: Improve documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 17 Sep 2024 12:35:26 +0200
In-Reply-To: <20240916210510.2731639-1-shuicheng.lin@intel.com>
References: <20240916210510.2731639-1-shuicheng.lin@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 2024-09-16 at 21:05 +0000, Shuicheng Lin wrote:
> Function drm_sched_entity_push_job() doesn't have return value,

Doesn't have *a* return value

> remove the return value description for it.
> Correct several other typo errors.
>=20
> v2 (Philipp):
> - more correction with related comments.
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Except for the nit above, looks good to me:

Reviewed-by: Philipp Stanner <pstanner@redhat.com>


Thx

> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++------
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++------
> =C2=A0include/linux/dma-resv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
> =C2=A04 files changed, 15 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 58c8161289fe..ffa3e765f5db 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -51,7 +51,7 @@
> =C2=A0 * drm_sched_entity_set_priority(). For changing the set of
> schedulers
> =C2=A0 * @sched_list at runtime see drm_sched_entity_modify_sched().
> =C2=A0 *
> - * An entity is cleaned up by callind drm_sched_entity_fini(). See
> also
> + * An entity is cleaned up by calling drm_sched_entity_fini(). See
> also
> =C2=A0 * drm_sched_entity_destroy().
> =C2=A0 *
> =C2=A0 * Returns 0 on success or a negative error code on failure.
> @@ -370,8 +370,8 @@ static void drm_sched_entity_clear_dep(struct
> dma_fence *f,
> =C2=A0}
> =C2=A0
> =C2=A0/*
> - * drm_sched_entity_clear_dep - callback to clear the entities
> dependency and
> - * wake up scheduler
> + * drm_sched_entity_wakeup - callback to clear the entity's
> dependency and
> + * wake up the scheduler
> =C2=A0 */
> =C2=A0static void drm_sched_entity_wakeup(struct dma_fence *f,
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0 struct dma_fence_cb *cb)
> @@ -389,7 +389,7 @@ static void drm_sched_entity_wakeup(struct
> dma_fence *f,
> =C2=A0 * @entity: scheduler entity
> =C2=A0 * @priority: scheduler priority
> =C2=A0 *
> - * Update the priority of runqueus used for the entity.
> + * Update the priority of runqueues used for the entity.
> =C2=A0 */
> =C2=A0void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> =C2=A0=09=09=09=09=C2=A0=C2=A0 enum drm_sched_priority priority)
> @@ -574,8 +574,6 @@ void drm_sched_entity_select_rq(struct
> drm_sched_entity *entity)
> =C2=A0 * fence sequence number this function should be called with
> drm_sched_job_arm()
> =C2=A0 * under common lock for the struct drm_sched_entity that was set u=
p
> for
> =C2=A0 * @sched_job in drm_sched_job_init().
> - *
> - * Returns 0 for success, negative error code otherwise.
> =C2=A0 */
> =C2=A0void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> =C2=A0{
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index ab53ab486fe6..cadf1662bc01 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -41,7 +41,7 @@
> =C2=A0 * 4. Entities themselves maintain a queue of jobs that will be
> scheduled on
> =C2=A0 *=C2=A0=C2=A0=C2=A0 the hardware.
> =C2=A0 *
> - * The jobs in a entity are always scheduled in the order that they
> were pushed.
> + * The jobs in an entity are always scheduled in the order in which
> they were pushed.
> =C2=A0 *
> =C2=A0 * Note that once a job was taken from the entities queue and pushe=
d
> to the
> =C2=A0 * hardware, i.e. the pending queue, the entity must not be
> referenced anymore
> @@ -1339,7 +1339,7 @@ void drm_sched_fini(struct drm_gpu_scheduler
> *sched)
> =C2=A0=09=09list_for_each_entry(s_entity, &rq->entities, list)
> =C2=A0=09=09=09/*
> =C2=A0=09=09=09 * Prevents reinsertion and marks job_queue
> as idle,
> -=09=09=09 * it will removed from rq in
> drm_sched_entity_fini
> +=09=09=09 * it will be removed from the rq in
> drm_sched_entity_fini()
> =C2=A0=09=09=09 * eventually
> =C2=A0=09=09=09 */
> =C2=A0=09=09=09s_entity->stopped =3D true;
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index fe8edb917360..ef23113451e4 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -33,11 +33,11 @@
> =C2=A0#define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> =C2=A0
> =C2=A0/**
> - * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
> + * DRM_SCHED_FENCE_DONT_PIPELINE - Prevent dependency pipelining
> =C2=A0 *
> =C2=A0 * Setting this flag on a scheduler fence prevents pipelining of
> jobs depending
> =C2=A0 * on this fence. In other words we always insert a full CPU round
> trip before
> - * dependen jobs are pushed to the hw queue.
> + * dependent jobs are pushed to the hw queue.
> =C2=A0 */
> =C2=A0#define DRM_SCHED_FENCE_DONT_PIPELINE=09DMA_FENCE_FLAG_USER_BITS
> =C2=A0
> @@ -71,7 +71,7 @@ enum drm_sched_priority {
> =C2=A0=09DRM_SCHED_PRIORITY_COUNT
> =C2=A0};
> =C2=A0
> -/* Used to chose between FIFO and RR jobs scheduling */
> +/* Used to choose between FIFO and RR job-scheduling */
> =C2=A0extern int drm_sched_policy;
> =C2=A0
> =C2=A0#define DRM_SCHED_POLICY_RR=C2=A0=C2=A0=C2=A0 0
> @@ -198,7 +198,7 @@ struct drm_sched_entity {
> =C2=A0=09 *
> =C2=A0=09 * Points to the finished fence of the last scheduled job.
> Only written
> =C2=A0=09 * by the scheduler thread, can be accessed locklessly from
> -=09 * drm_sched_job_arm() iff the queue is empty.
> +=09 * drm_sched_job_arm() if the queue is empty.
> =C2=A0=09 */
> =C2=A0=09struct dma_fence __rcu=09=09*last_scheduled;
> =C2=A0
> @@ -247,7 +247,7 @@ struct drm_sched_entity {
> =C2=A0 * @sched: the scheduler to which this rq belongs to.
> =C2=A0 * @entities: list of the entities to be scheduled.
> =C2=A0 * @current_entity: the entity which is to be scheduled.
> - * @rb_tree_root: root of time based priory queue of entities for
> FIFO scheduling
> + * @rb_tree_root: root of time based priority queue of entities for
> FIFO scheduling
> =C2=A0 *
> =C2=A0 * Run queue is a set of entities scheduling command submissions fo=
r
> =C2=A0 * one specific ring. It implements the scheduling policy that
> selects
> @@ -321,7 +321,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct
> dma_fence *f);
> =C2=A0 * @s_fence: contains the fences for the scheduling of job.
> =C2=A0 * @finish_cb: the callback for the finished fence.
> =C2=A0 * @credits: the number of credits this job contributes to the
> scheduler
> - * @work: Helper to reschdeule job kill to different context.
> + * @work: Helper to reschedule job kill to different context.
> =C2=A0 * @id: a unique id assigned to each job scheduled on the scheduler=
.
> =C2=A0 * @karma: increment on every hang caused by this job. If this
> exceeds the hang
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 limit of the sch=
eduler then the job is marked guilty and
> will not
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 8d0e34dad446..c5ab6fd9ebe8 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -105,10 +105,10 @@ enum dma_resv_usage {
> =C2=A0=09 * This should be used by submissions which don't want to
> participate in
> =C2=A0=09 * any implicit synchronization.
> =C2=A0=09 *
> -=09 * The most common case are preemption fences, page table
> updates, TLB
> -=09 * flushes as well as explicit synced user submissions.
> +=09 * The most common cases are preemption fences, page table
> updates, TLB
> +=09 * flushes as well as explicitly synced user submissions.
> =C2=A0=09 *
> -=09 * Explicit synced user user submissions can be promoted to
> +=09 * Explicitly synced user submissions can be promoted to
> =C2=A0=09 * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed
> using
> =C2=A0=09 * dma_buf_import_sync_file() when implicit synchronization
> should
> =C2=A0=09 * become necessary after initial adding of the fence.

