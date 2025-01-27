Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABE2A1D5EB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 13:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAF610E50B;
	Mon, 27 Jan 2025 12:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CLN2aAFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2889010E50B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 12:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737981165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5zQGOE7NjhCJEG2vXRSFTmYAd4jfugQ38J94/wrCR3A=;
 b=CLN2aAFnpbk6bOSPfPrtRyuAnAWdXppzwHWVBeT1xAICyTpGb92D2m+9c1catbgy9/Ghi4
 V0oLAxx6bZgpKK9aqmW+YsKtNyvyms7xWNN+iAIb2caaQ2KhYRo6dsl0jpQGYUfshggDfq
 XBpGNpf/nHbEmQrw5S+kxf6n8W3IEjI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-5KXEP141PTy8pH5M8DyH3w-1; Mon, 27 Jan 2025 07:32:43 -0500
X-MC-Unique: 5KXEP141PTy8pH5M8DyH3w-1
X-Mimecast-MFC-AGG-ID: 5KXEP141PTy8pH5M8DyH3w
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3862c67763dso1538682f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 04:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737981162; x=1738585962;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8cJsN7JtVmizhZG8Wf1Rn8rpd7OZNPCP78564dc89H8=;
 b=ix3ZgRN6x9GFaS0602Hd9Cfb5meHQegKo90fN+8i3JVTp/d27TyGwsnUh9+XoC9i5F
 ZjEDwi+1Ex0u+UUvJw1jR6wsjjNU2ba8SEw6LT/fH1LX0+RSL5mv7uDF4gpDVzChdsPS
 J92QXKWsCYPOc3vCCBWPBTx2Bm2fT+k3fqWg+N191pRniB0yGaPAzFFv3yn4TXSnoqCT
 9iSLwbcobPMeazNMj7+gdIhZp1fai535PmdlcF5MUI6zD3MfRkjX8B7fCY03v+OLMt12
 Mk/E5KxFxo30Z44cYpfvZQyESfIr46tFse7EEAA/vj8vHRAao3bdNBefiA34sAOZQJMY
 Ferw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtcAKY0t3wWjXNxg732W9urzEfRfjambiYCk7E6eYIM+tSrDgYix/cVjoVjU4cr8QwxvvJSOpzz4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkRzTM2wdmQ8Qu4ShOH7jHqYGEm/sjhVUlwEOAQnKc2HonKpY7
 YUO8FpVBlPua8YomPQN9tbrmZuPAzzkmoj30tkdvFuPFaO4rZ/u2NdL7JkRumU1HipLUxmCurHQ
 5kJko8sgnRy+hTcRvVdzBJ4NIYf6iTIwY45W0Fbr5JBsOTU9BdtzpeFofi8tgn+mLwQ==
X-Gm-Gg: ASbGnctgSiK29AxLtYF0k+hJW27bHVX+i3QH/qdQp2Oi7qQwbaGUuzhbgbDrv/nzfYc
 TyM+X3pihwS78mJ/PEvCSeseclY9Ne8+GTWJBaYeIapBf5BBPp3WTI5dSE+LJnO93wXKgQAahm4
 cNg/J6f0kGQiYHNgl/gJ4Jady0qOiGz+HvKhw/TOYgmp1cF8HgIBjv975zd2qMtBUcU3JSZxI+I
 MJWeWBCqSO0AjmToyzDBrtdgYwcnFQ0cCjPfISzv7/RupIfCcSOaMUhUXZzOdtdLNO1wqaCTroH
 ZU9y5x07kJUQbjVHHm+0pZNMYpUzYIc=
X-Received: by 2002:a5d:52c2:0:b0:386:3b93:6cc6 with SMTP id
 ffacd0b85a97d-38bf566351emr33533120f8f.15.1737981162373; 
 Mon, 27 Jan 2025 04:32:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBaPCwUSnk53tQlc6WfPOk3ncvy1ywdcAouZXKSWdZNT8hyH+OzZG7uNY+oBoHpv0nkx0sOw==
X-Received: by 2002:a5d:52c2:0:b0:386:3b93:6cc6 with SMTP id
 ffacd0b85a97d-38bf566351emr33533074f8f.15.1737981161884; 
 Mon, 27 Jan 2025 04:32:41 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c42fcsm11143132f8f.96.2025.01.27.04.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 04:32:41 -0800 (PST)
Message-ID: <1da78171e9bb5c533bfc5ddb232d81a6a531de10.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] drm/sched: Update timedout_job()'s documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Mon, 27 Jan 2025 13:32:40 +0100
In-Reply-To: <Z5OHKHZRBed_bxF6@pollux>
References: <20250121151544.44949-2-phasta@kernel.org>
 <20250121151544.44949-6-phasta@kernel.org> <Z5OHKHZRBed_bxF6@pollux>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vfw9-RVETDDhnVmcHoW8TAzLkKE1VtIa99vzfwCLD8s_1737981162
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

On Fri, 2025-01-24 at 13:27 +0100, Danilo Krummrich wrote:
> On Tue, Jan 21, 2025 at 04:15:46PM +0100, Philipp Stanner wrote:
> > drm_sched_backend_ops.timedout_job()'s documentation is outdated.
> > It
> > mentions the deprecated function drm_sched_resubmit_job().
> > Furthermore,
> > it does not point out the important distinction between hardware
> > and
> > firmware schedulers.
> >=20
> > Since firmware schedulers tyipically only use one entity per
> > scheduler,
> > timeout handling is significantly more simple because the entity
> > the
> > faulted job came from can just be killed without affecting innocent
> > processes.
> >=20
> > Update the documentation with that distinction and other details.
> >=20
> > Reformat the docstring to work to a unified style with the other
> > handles.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0include/drm/gpu_scheduler.h | 82 ++++++++++++++++++++++----------=
-
> > ----
> > =C2=A01 file changed, 49 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index cf40fdb55541..4806740b9023 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -394,8 +394,14 @@ static inline bool
> > drm_sched_invalidate_job(struct drm_sched_job *s_job,
> > =C2=A0}
> > =C2=A0
> > =C2=A0enum drm_gpu_sched_stat {
> > -=09DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> > +=09/* Reserve 0 */
> > +=09DRM_GPU_SCHED_STAT_NONE,
> > +
> > +=09/* Operation succeeded */
> > =C2=A0=09DRM_GPU_SCHED_STAT_NOMINAL,
> > +
> > +=09/* Failure because dev is no longer available, for example
> > because
> > +=09 * it was unplugged. */
> > =C2=A0=09DRM_GPU_SCHED_STAT_ENODEV,
> > =C2=A0};
> > =C2=A0
> > @@ -447,43 +453,53 @@ struct drm_sched_backend_ops {
> > =C2=A0=09 * @timedout_job: Called when a job has taken too long to
> > execute,
> > =C2=A0=09 * to trigger GPU recovery.
> > =C2=A0=09 *
> > -=09 * This method is called in a workqueue context.
>=20
> Why remove this line?

I felt its surplus. All the functions here are callbacks that are
invoked by "the scheduler". I thought that's all the driver really
needs to know. Why should it care about the wq context?

Also, it's the only function for which the context is mentioned. If we
keep it here, we should probably provide it everywhere else, too.

>=20
> > +=09 * @sched_job: The job that has timed out
> > =C2=A0=09 *
> > -=09 * Drivers typically issue a reset to recover from GPU
> > hangs, and this
> > -=09 * procedure usually follows the following workflow:
> > +=09 * Returns: A drm_gpu_sched_stat enum.
>=20
> Maybe "The status of the scheduler, defined by &drm_gpu_sched_stat".
>=20
> I think you forgot to add the corresponding parts in the
> documentation of
> drm_gpu_sched_stat.

What do you mean, precisely? I added information to that enum. You mean
that I should add that that enum is a return type for this callback
here?

>=20
> > =C2=A0=09 *
> > -=09 * 1. Stop the scheduler using drm_sched_stop(). This will
> > park the
> > -=09 *=C2=A0=C2=A0=C2=A0 scheduler thread and cancel the timeout work,
> > guaranteeing that
> > -=09 *=C2=A0=C2=A0=C2=A0 nothing is queued while we reset the hardware =
queue
> > -=09 * 2. Try to gracefully stop non-faulty jobs (optional)
> > -=09 * 3. Issue a GPU reset (driver-specific)
> > -=09 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> > -=09 * 5. Restart the scheduler using drm_sched_start(). At
> > that point, new
> > -=09 *=C2=A0=C2=A0=C2=A0 jobs can be queued, and the scheduler thread i=
s
> > unblocked
> > +=09 * Drivers typically issue a reset to recover from GPU
> > hangs.
> > +=09 * This procedure looks very different depending on
> > whether a firmware
> > +=09 * or a hardware scheduler is being used.
> > +=09 *
> > +=09 * For a FIRMWARE SCHEDULER, each (pseudo-)ring has one
> > scheduler, and
>=20
> Why pseudo? It's still a real ring buffer.
>=20
> > +=09 * each scheduler has one entity. Hence, you typically
> > follow those
> > +=09 * steps:
>=20
> Maybe better "Hence, the steps taken typically look as follows:".
>=20
> > +=09 *
> > +=09 * 1. Stop the scheduler using drm_sched_stop(). This will
> > pause the
> > +=09 *=C2=A0=C2=A0=C2=A0 scheduler workqueues and cancel the timeout wo=
rk,
> > guaranteeing
> > +=09 *=C2=A0=C2=A0=C2=A0 that nothing is queued while we remove the rin=
g.
>=20
> "while the ring is removed"
>=20
> > +=09 * 2. Remove the ring. In most (all?) cases the firmware
> > will make sure
>=20
> At least I don't know about other cases and I also don't think it'd
> make a lot
> of sense if it'd be different. But of course there's no rule
> preventing people
> to implement things weirdly.

Seems like we can then use an absolute phrase here and who really wants
to do weird things won't be stopped by that anyways :]

>=20
> > +=09 *=C2=A0=C2=A0=C2=A0 that the corresponding parts of the hardware a=
re
> > resetted, and that
> > +=09 *=C2=A0=C2=A0=C2=A0 other rings are not impacted.
> > +=09 * 3. Kill the entity the faulted job stems from, and the
> > associated
>=20
> There can only be one entity in this case, so you can drop "the
> faulted job
> stems from".
>=20
> > +=09 *=C2=A0=C2=A0=C2=A0 scheduler.
> > +=09 *
> > +=09 *
> > +=09 * For a HARDWARE SCHEDULER, each ring also has one
> > scheduler, but each
> > +=09 * scheduler is typically associated with many entities.
> > This implies
>=20
> What about "each scheduler can be scheduling one or more entities"?
>=20
> > +=09 * that all entities associated with the affected
> > scheduler cannot be
>=20
> I think you want to say that not all entites can be torn down, rather
> than none
> of them can be torn down.
>=20
> > +=09 * torn down, because this would effectively also kill
> > innocent
> > +=09 * userspace processes which did not submit faulty jobs
> > (for example).
>=20
> This is phrased ambiguously, "kill userspace processs" typically
> means something
> different than you mean in this context.

then let's say "down, because this would also affect users that did not
provide faulty jobs through their entities.", ack?


Danke,
P.

>=20
> > +=09 *
> > +=09 * Consequently, the procedure to recover with a hardware
> > scheduler
> > +=09 * should look like this:
> > +=09 *
> > +=09 * 1. Stop all schedulers impacted by the reset using
> > drm_sched_stop().
> > +=09 * 2. Figure out to which entity the faulted job belongs
> > to.
> > +=09 * 3. Kill that entity.
>=20
> I'd combine the two steps: "2. Kill the entity the faulty job
> originates from".
>=20
> > +=09 * 4. Issue a GPU reset on all faulty rings (driver-
> > specific).
> > +=09 * 5. Re-submit jobs on all schedulers impacted by re-
> > submitting them to
> > +=09 *=C2=A0=C2=A0=C2=A0 the entities which are still alive.
> > +=09 * 6. Restart all schedulers that were stopped in step #1
> > using
> > +=09 *=C2=A0=C2=A0=C2=A0 drm_sched_start().
> > =C2=A0=09 *
> > =C2=A0=09 * Note that some GPUs have distinct hardware queues but
> > need to reset
> > =C2=A0=09 * the GPU globally, which requires extra synchronization
> > between the
> > -=09 * timeout handler of the different &drm_gpu_scheduler.
> > One way to
> > -=09 * achieve this synchronization is to create an ordered
> > workqueue
> > -=09 * (using alloc_ordered_workqueue()) at the driver level,
> > and pass this
> > -=09 * queue to drm_sched_init(), to guarantee that timeout
> > handlers are
> > -=09 * executed sequentially. The above workflow needs to be
> > slightly
> > -=09 * adjusted in that case:
> > -=09 *
> > -=09 * 1. Stop all schedulers impacted by the reset using
> > drm_sched_stop()
> > -=09 * 2. Try to gracefully stop non-faulty jobs on all queues
> > impacted by
> > -=09 *=C2=A0=C2=A0=C2=A0 the reset (optional)
> > -=09 * 3. Issue a GPU reset on all faulty queues (driver-
> > specific)
> > -=09 * 4. Re-submit jobs on all schedulers impacted by the
> > reset using
> > -=09 *=C2=A0=C2=A0=C2=A0 drm_sched_resubmit_jobs()
> > -=09 * 5. Restart all schedulers that were stopped in step #1
> > using
> > -=09 *=C2=A0=C2=A0=C2=A0 drm_sched_start()
> > -=09 *
> > -=09 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> > -=09 * and the underlying driver has started or completed
> > recovery.
> > -=09 *
> > -=09 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no
> > longer
> > -=09 * available, i.e. has been unplugged.
> > +=09 * timeout handlers of different schedulers. One way to
> > achieve this
> > +=09 * synchronization is to create an ordered workqueue
> > (using
> > +=09 * alloc_ordered_workqueue()) at the driver level, and
> > pass this queue
> > +=09 * as drm_sched_init()'s @timeout_wq parameter. This will
> > guarantee
> > +=09 * that timeout handlers are executed sequentially.
> > =C2=A0=09 */
> > =C2=A0=09enum drm_gpu_sched_stat (*timedout_job)(struct
> > drm_sched_job *sched_job);
> > =C2=A0
> > --=20
> > 2.47.1
> >=20

