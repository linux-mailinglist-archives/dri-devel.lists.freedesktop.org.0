Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAC1A16A60
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DDB10E38C;
	Mon, 20 Jan 2025 10:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ony94r6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270B610E394
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737367681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TebyLQj20QCyx9Im/AnQ1gbV4CKxHwyPHILCzc7XnX4=;
 b=Ony94r6La8EwruGOaSJEeGGWFI8VImwTtqMVue33H66W6gvBsGw3ynuMpmVhZTuQoOmOOy
 jagxxa8oJE3RsAB0MWpuXZjH9/2DipxVmjZ5TyUX9+x5Lk88DrZNEyTZEWMvRLmcr3o6Kk
 lmF7WomTFdno4mAe5x+S4Dbs6jtB5Jg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-ADVK7SR5MMWVXQg6euvuag-1; Mon, 20 Jan 2025 05:07:59 -0500
X-MC-Unique: ADVK7SR5MMWVXQg6euvuag-1
X-Mimecast-MFC-AGG-ID: ADVK7SR5MMWVXQg6euvuag
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ef114d8346so7896608a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 02:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737367678; x=1737972478;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cam6lj9SKiCASZpKH8QSwyvgICKQyMWdN1CBKpORAmM=;
 b=rwTZuLFRCm7hCp08EWoGCy0SSWODDLKb+oMIxY51yxOUmfMRngaVk0zsqkq+mnpbgb
 9UccKGKHhK5Nu3YUcsi5oE2Pjl2a4Dcgc2zkHFjsFsbrVbl8XyGkU12PIm8Xtsuds4Ah
 wQAy0MvCzdvLgpTgIfAvVQT+prjmegNmWlLcwyPfJGK0Iw6JI/typd+ZkD9+H97IeG7W
 vcErxf/1ZkMl+h9pq98uf4d9bYWZfhshUIf3ToGtKEv8fQ8rGWO5A/r1q2YJKKjj+sjW
 Mz0QBhkS8j9Bb3p7T4FMdiIW2q8tttsTOIuguHn2mB8Shi6VS8cUmOGyj39i8WT7wmb1
 QvtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVGk0daCm1sCH+lu7pb8btXMRS6ro6BlrL0QVXWAXE4WK7fX7NnJFXU917k+aWO2XodtgAN9Ir4u8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjDH4NXYkL9pTvgY6ECrV9ZwpU+F5zNMgjBG8qAWAStmljIzAn
 e1iMHphBGJj6X6r2yCM3xrPXGcXYZaa5ntN1AI3bFWxu5AMmcbHZtM0/ssMm3qvW8hXLr37zky4
 8V6fQqDU7CpUdmcsUdbDH+WaErM0T3C37KBBkLYW1Z11lNk/jHXTYeIUhcy5LEQkMzA==
X-Gm-Gg: ASbGncsegGPjvRDczusbRBAblveKasxCp4ZKe/hYlS3mORfVfjvYrcBFT0LMTqhQ+SL
 Dwjnoq7lk74gcF5NUbEYcW37uSCzqWUp/lLbq5Ja7TgR2vfUi88GKaKhAbTRZeagd28djYgB/SR
 /ISQ64jeThllHsNtQTeC/a1rY1eb3VFHSRSFviTrdpXII8pZVUj9KpHT/9dsdzrtP0lAP4WM46h
 3EH7TnHOrplkX8zXCECPtZO1GHwcI1NLB/JCt2fMQ1YnlbP5OlAev8bzs2vqo+duOr+SM4UPwCK
 S0Hu7njZM/GkpaqU/x1s
X-Received: by 2002:a05:6a00:4c94:b0:724:e75b:22d1 with SMTP id
 d2e1a72fcca58-72dafa800c4mr18218123b3a.16.1737367678187; 
 Mon, 20 Jan 2025 02:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZoY/ziXee5by0xKUslLvYKlSWN/aLZztp5SxsNLxuQbdsugpbvji3u6wCsWMR+wUnsGZ5fg==
X-Received: by 2002:a05:6a00:4c94:b0:724:e75b:22d1 with SMTP id
 d2e1a72fcca58-72dafa800c4mr18218091b3a.16.1737367677786; 
 Mon, 20 Jan 2025 02:07:57 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab815f1bsm6880482b3a.65.2025.01.20.02.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 02:07:57 -0800 (PST)
Message-ID: <13d6fc760e3e4a297086bdfd56438f0079937fa5.camel@redhat.com>
Subject: Re: [PATCH 3/3] drm/sched: Update timedout_job()'s documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,  linaro-mm-sig@lists.linaro.org
Date: Mon, 20 Jan 2025 11:07:44 +0100
In-Reply-To: <Z4T9Eq9lMPlmLUYk@pollux.localdomain>
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-6-phasta@kernel.org>
 <Z4T9Eq9lMPlmLUYk@pollux.localdomain>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w8HAA4m8vBzZNcBbNykn6FzKbJFqgbrfxxFUxn3tPHQ_1737367678
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

On Mon, 2025-01-13 at 12:46 +0100, Danilo Krummrich wrote:
> On Thu, Jan 09, 2025 at 02:37:12PM +0100, Philipp Stanner wrote:
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
> > =C2=A0include/drm/gpu_scheduler.h | 83 +++++++++++++++++++++++---------=
-
> > ----
> > =C2=A01 file changed, 52 insertions(+), 31 deletions(-)
> >=20
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index c4e65f9f7f22..380b8840c591 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -445,43 +445,64 @@ struct drm_sched_backend_ops {
> > =C2=A0=09 * @timedout_job: Called when a job has taken too long to
> > execute,
> > =C2=A0=09 * to trigger GPU recovery.
> > =C2=A0=09 *
> > -=09 * This method is called in a workqueue context.
> > +=09 * @sched_job: The job that has timed out
> > =C2=A0=09 *
> > -=09 * Drivers typically issue a reset to recover from GPU
> > hangs, and this
> > -=09 * procedure usually follows the following workflow:
> > +=09 * Returns:
> > +=09 * - DRM_GPU_SCHED_STAT_NOMINAL, on success, i.e., if the
> > underlying
> > +=09 *=C2=A0=C2=A0 driver has started or completed recovery.
> > +=09 * - DRM_GPU_SCHED_STAT_ENODEV, if the device is no longer
> > +=09 *=C2=A0=C2=A0 available, i.e., has been unplugged.
>=20
> Maybe it'd be better to document this at the enum level and add a
> link.
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
> > +=09 * Drivers typically issue a reset to recover from GPU
> > hangs.
> > +=09 * This procedure looks very different depending on
> > whether a firmware
> > +=09 * or a hardware scheduler is being used.
> > +=09 *
> > +=09 * For a FIRMWARE SCHEDULER, each (pseudo-)ring has one
> > scheduler, and
> > +=09 * each scheduler (typically) has one entity. Hence, you
> > typically
>=20
> I think you can remove the first "typically" here. I don't think that
> for a
> firmware scheduler we ever have something else than a 1:1 relation,
> besides that
> having something else than a 1:1 relation (whatever that would be)
> would likely
> be a contradiction to the statement above.
>=20
> > +=09 * follow those steps:
> > +=09 *
> > +=09 * 1. Stop the scheduler using drm_sched_stop(). This will
> > pause the
> > +=09 *=C2=A0=C2=A0=C2=A0 scheduler workqueues and cancel the timeout wo=
rk,
> > guaranteeing
> > +=09 *=C2=A0=C2=A0=C2=A0 that nothing is queued while we reset the hard=
ware
> > queue.
>=20
> Rather reset / remove the software queue / ring.
>=20
> (Besides: I think we should also define a distinct terminology,
> sometimes "queue"
> refers to the ring buffer, sometimes it refers to the entity, etc. At
> least we
> should be consequent within this commit, and then fix the rest.)


Very good idea!

How about we, from now on, always just call it "ring" or "hardware
ring"?

I think queue is very generic and, as you point out, often used for the
entities and stuff like that.

>=20
> > +=09 * 2. Try to gracefully stop non-faulty jobs (optional).
> > +=09 * TODO: RFC ^ Folks, should we remove this step? What
> > does it even mean
> > +=09 * precisely to "stop" those jobs? Is that even helpful to
> > userspace in
> > +=09 * any way?
>=20
> I think this means to prevent unrelated queues / jobs from being
> impacted by the
> subsequent GPU reset.
>=20
> So, this is likely not applicable here, see below.
>=20
> > +=09 * 3. Issue a GPU reset (driver-specific).
>=20
> I'm not entirely sure it really applies to all GPUs that feature a FW
> scheduler,
> but I'd expect that the FW takes care of resetting the corresponding
> HW
> (including preventing impact on other FW rings) if the faulty FW ring
> is removed
> by the driver.

@Christian: Agree? AMD is still purely a HW scheduler afaik.

>=20
> > +=09 * 4. Kill the entity the faulted job stems from, and the
> > associated
> > +=09 *=C2=A0=C2=A0=C2=A0 scheduler.
> > =C2=A0=09 * 5. Restart the scheduler using drm_sched_start(). At
> > that point, new
> > -=09 *=C2=A0=C2=A0=C2=A0 jobs can be queued, and the scheduler thread i=
s
> > unblocked
> > +=09 *=C2=A0=C2=A0=C2=A0 jobs can be queued, and the scheduler workqueu=
es
> > awake again.
>=20
> How can we start the scheduler again after we've killed it? I think
> the most
> likely scenario is that the FW ring (including the scheduler
> structures) is
> removed entirely and simply re-created. So, I think we can probably
> remove 5.

ACK

>=20
> > +=09 *
> > +=09 * For a HARDWARE SCHEDULER, each ring also has one
> > scheduler, but each
> > +=09 * scheduler typically has many attached entities. This
> > implies that you
>=20
> Maybe better "associated". For the second sentence, I'd rephrase it,
> e.g. "This
> implies that all entities associated with the affected scheduler
> can't be torn
> down, because [...]".
>=20
> > +=09 * cannot tear down all entities associated with the
> > affected scheduler,
> > +=09 * because this would effectively also kill innocent
> > userspace processes
> > +=09 * which did not submit faulty jobs (for example).
> > +=09 *
> > +=09 * Consequently, the procedure to recover with a hardware
> > scheduler
> > +=09 * should look like this:
> > +=09 *
> > +=09 * 1. Stop all schedulers impacted by the reset using
> > drm_sched_stop().
> > +=09 * 2. Figure out to which entity the faulted job belongs.
>=20
> "belongs to"
>=20
> > +=09 * 3. Try to gracefully stop non-faulty jobs (optional).
> > +=09 * TODO: RFC ^ Folks, should we remove this step? What
> > does it even mean
> > +=09 * precisely to "stop" those jobs? Is that even helpful to
> > userspace in
> > +=09 * any way?
>=20
> See above.

Agree with all. Will fix those in v2.

Danke,
P.

>=20
> > +=09 * 4. Kill that entity.
> > +=09 * 5. Issue a GPU reset on all faulty rings (driver-
> > specific).
> > +=09 * 6. Re-submit jobs on all schedulers impacted by re-
> > submitting them to
> > +=09 *=C2=A0=C2=A0=C2=A0 the entities which are still alive.
> > +=09 * 7. Restart all schedulers that were stopped in step #1
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
>=20

