Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FB1A3DE1B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B5910E987;
	Thu, 20 Feb 2025 15:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="i+EjfkiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E6D10E987
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740064687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NOL1i6xUqLQVIsG43GJPNqJ1JcRMuKLykwpJPU/2eE=;
 b=i+EjfkiJRXOs2rQwQPu2ORkFVKwyAJM1YlNAcHeBBSFTtnV6M68vqLGhuf9wSuwDfwYFAq
 hcwebsAlumrOOyg6MCbJDmZlv4T7dPdD4+g/lIzu3gLpI7lta5NxSW1KTrOTlvVG45Yh1S
 bPqcdqcSOpgJtMypseqgvQbH2fiVS1Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-0r5JMDYtNzyrGqJyfWGzdA-1; Thu, 20 Feb 2025 10:18:06 -0500
X-MC-Unique: 0r5JMDYtNzyrGqJyfWGzdA-1
X-Mimecast-MFC-AGG-ID: 0r5JMDYtNzyrGqJyfWGzdA_1740064685
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38f3eb82fceso521631f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 07:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740064685; x=1740669485;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nJKKQXezkb4XbcyeMDKBvpFa8aXavg2f3XNPpB9D6Fs=;
 b=bIBk1THq9E8sw7iK9ptlCyZKtX7aAWWuIe6Sc72eRz/xJB7iOoXAEUWNNeK8cNouPv
 hFDB8b9Grl2ywmJ0ZeQD6+NBp6gishyQQ+dAFsXSnw2CkRYQ5VGJarEl3pF7JsgQJAKJ
 +qFf9sgYIwe6WcF7G2NNpXthybTXUg2wAfMJuzgUClMpSDpHO82iVTEODlVYJAG+7WM0
 sOZqnQ7r7+340c2mHSCXG9mnCbHmb5a9DlnxtkgxEQbJwmW6caTIkonOj1+CRMQWJO+k
 pLGyxQTpVjjWFr7hIzMdz4U9msTJP7AuCi7dlkQxxZF9QyC0YoO4P2QHBfTNkbHuZYeV
 A4iw==
X-Gm-Message-State: AOJu0YxK5eW3Pt0FFTJE2o2jnoQq8UwhXKOOxnkl0If7zk410e1+q7pe
 9kT4ASMD2eMFYd5oqvtOR6w1h4JhVr01VBvGgwJGNn9umh5VYrIYBDf8Cd8oH0bA0bJJKBs9fqo
 L+h0EUzFy08iPVh4DiK5ip5LuCmNI5ea2XTxFXAL1Vxt7D4t7SBVyrylMZ+KI1/ElJw==
X-Gm-Gg: ASbGncu1CXjneoYgwqHbAqf9gVLFMPP8BfGpHRgJyxeEiEdaCeB6sTgkTbDwwMt28p9
 k9KteHT0idCjSR25JxvtKRCgbDbKJ01ZukXyLzApcwQUNGMfR+0MKjLSjfBMwuCdB3h3YZ77cKO
 f91eu+49Zu1JENiLedBNuQBrEmY522CqlyCWIbds8pGYm2s4VPkFqw42Jeud8yNBT3XFksCeT1a
 /3jFn0h6ng7zma83faLiGDvZBNJ1LUQsgu58gCwZ2uvHwAfV9KAfTWL5OEeHnBoyKzT0vrmPtYw
 rYa8UCZ6M7Mk3XKK7tCoAMej1H6jHQ==
X-Received: by 2002:adf:f60f:0:b0:38d:dc4d:3476 with SMTP id
 ffacd0b85a97d-38f33f58da4mr18298515f8f.52.1740064685142; 
 Thu, 20 Feb 2025 07:18:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw0Np0iMPXyqskhwR/np+dPCkpfyMTYSiEwYQz6MNjvB6fw9+OMARKMG+dc7NsWkoJpGyZ3w==
X-Received: by 2002:adf:f60f:0:b0:38d:dc4d:3476 with SMTP id
 ffacd0b85a97d-38f33f58da4mr18298474f8f.52.1740064684659; 
 Thu, 20 Feb 2025 07:18:04 -0800 (PST)
Received: from [10.32.64.16] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259fdce7sm21109971f8f.96.2025.02.20.07.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 07:18:04 -0800 (PST)
Message-ID: <376c7d96559f2bf5a464ac2c51bdc69fbf940c45.camel@redhat.com>
Subject: Re: [PATCH v5 3/3] drm/sched: Update timedout_job()'s documentation
From: Philipp Stanner <pstanner@redhat.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 20 Feb 2025 16:18:03 +0100
In-Reply-To: <6ec16915-d7ae-4b1f-b156-80892d98e119@igalia.com>
References: <20250220112813.87992-2-phasta@kernel.org>
 <20250220112813.87992-5-phasta@kernel.org>
 <6ec16915-d7ae-4b1f-b156-80892d98e119@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZU98_zLzcHzA5cdRiONSQcILVJ2pieaP6nknLdnWICc_1740064685
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

On Thu, 2025-02-20 at 10:42 -0300, Ma=C3=ADra Canal wrote:
> Hi Philipp,
>=20
> On 20/02/25 08:28, Philipp Stanner wrote:
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
> > =C2=A0 include/drm/gpu_scheduler.h | 83 +++++++++++++++++++++++--------=
-
> > -----
> > =C2=A0 1 file changed, 52 insertions(+), 31 deletions(-)
> >=20
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 29e5bda91806..18cdeacf8651 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -393,8 +393,15 @@ static inline bool
> > drm_sched_invalidate_job(struct drm_sched_job *s_job,
> > =C2=A0=C2=A0=09return s_job && atomic_inc_return(&s_job->karma) >
> > threshold;
> > =C2=A0 }
> > =C2=A0=20
> > +/**
> > + * enum drm_gpu_sched_stat - the scheduler's status
> > + *
> > + * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> > + * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> > + * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
> > anymore.
> > + */
> > =C2=A0 enum drm_gpu_sched_stat {
> > -=09DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> > +=09DRM_GPU_SCHED_STAT_NONE,
> > =C2=A0=C2=A0=09DRM_GPU_SCHED_STAT_NOMINAL,
> > =C2=A0=C2=A0=09DRM_GPU_SCHED_STAT_ENODEV,
> > =C2=A0 };
> > @@ -430,6 +437,11 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0=09 *
> > =C2=A0=C2=A0=09 * TODO: Document which fence rules above.
> > =C2=A0=C2=A0=09 *
> > +=09 * This method is called in a workqueue context - either
> > from the
> > +=09 * submit_wq the driver passed through &drm_sched_init(),
> > or, if the
> > +=09 * driver passed NULL, a separate, ordered workqueue the
> > scheduler
> > +=09 * allocated.
> > +=09 *
>=20
> The commit message mentions "Update timedout_job()'s documentation".
> As
> this hunk is related to `run_job()`, maybe it would be a better fit
> to
> patch 2/3.
>=20
> > =C2=A0=C2=A0=09 * @sched_job: the job to run
> > =C2=A0=C2=A0=09 *
> > =C2=A0=C2=A0=09 * Note that the scheduler expects to 'inherit' its own
> > reference to
> > @@ -449,43 +461,52 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0=09 * @timedout_job: Called when a job has taken too long t=
o
> > execute,
> > =C2=A0=C2=A0=09 * to trigger GPU recovery.
> > =C2=A0=C2=A0=09 *
> > -=09 * This method is called in a workqueue context.
> > +=09 * @sched_job: The job that has timed out
> > =C2=A0=C2=A0=09 *
> > -=09 * Drivers typically issue a reset to recover from GPU
> > hangs, and this
> > -=09 * procedure usually follows the following workflow:
> > +=09 * Drivers typically issue a reset to recover from GPU
> > hangs.
> > +=09 * This procedure looks very different depending on
> > whether a firmware
> > +=09 * or a hardware scheduler is being used.
> > =C2=A0=C2=A0=09 *
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
> > +=09 * For a FIRMWARE SCHEDULER, each ring has one scheduler,
> > and each
> > +=09 * scheduler has one entity. Hence, the steps taken
> > typically look as
> > +=09 * follows:
> > +=09 *
> > +=09 * 1. Stop the scheduler using drm_sched_stop(). This will
> > pause the
> > +=09 *=C2=A0=C2=A0=C2=A0 scheduler workqueues and cancel the timeout wo=
rk,
> > guaranteeing
> > +=09 *=C2=A0=C2=A0=C2=A0 that nothing is queued while the ring is being
> > removed.
> > +=09 * 2. Remove the ring. The firmware will make sure that
> > the
> > +=09 *=C2=A0=C2=A0=C2=A0 corresponding parts of the hardware are resett=
ed,
> > and that other
> > +=09 *=C2=A0=C2=A0=C2=A0 rings are not impacted.
> > +=09 * 3. Kill the entity and the associated scheduler.
> > +=09 *
> > +=09 *
> > +=09 * For a HARDWARE SCHEDULER, a scheduler instance
> > schedules jobs from
> > +=09 * one or more entities to one ring. This implies that all
> > entities
> > +=09 * associated with the affected scheduler cannot be torn
> > down, because
> > +=09 * this would effectively also affect innocent userspace
> > processes which
> > +=09 * did not submit faulty jobs (for example).
> > +=09 *
> > +=09 * Consequently, the procedure to recover with a hardware
> > scheduler
> > +=09 * should look like this:
> > +=09 *
> > +=09 * 1. Stop all schedulers impacted by the reset using
> > drm_sched_stop().
> > +=09 * 2. Kill the entity the faulty job stems from.
> > +=09 * 3. Issue a GPU reset on all faulty rings (driver-
> > specific).
> > +=09 * 4. Re-submit jobs on all schedulers impacted by re-
> > submitting them to
> > +=09 *=C2=A0=C2=A0=C2=A0 the entities which are still alive.
>=20
> I believe that a mention to `drm_sched_resubmit_jobs()` still worth
> it,
> even mentioning that it is a deprecated option and it shouldn't be
> used
> in new code. It is deprecated indeed, but we still have five users.

I see no reason to mention a deprecated function. What would that be
good for? Why should I direct someone to something that he must not
use?

The drivers which already use it don't need that documentation, since
they're more or less functioning already. And even they shouldn't be
encouraged to keep using it; the list above basically is a list
exclusively about how to do things right.

And the new drivers should best not even know that this function
exists.

Furthermore, additional mentions of the function just increases the
probability that the comment / docu will be forgotten when the
deprecated function is finally removed.
(We have multiple such places within the scheduler. Some comments still
refer to a "thread", despite the scheduler now being based on
workqueues)

So NACK to that idea.

Regarding your other review ideas, I'll look into them

Thx
P.


>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> > +=09 * 5. Restart all schedulers that were stopped in step #1
> > using
> > +=09 *=C2=A0=C2=A0=C2=A0 drm_sched_start().
> > =C2=A0=C2=A0=09 *
> > =C2=A0=C2=A0=09 * Note that some GPUs have distinct hardware queues but
> > need to reset
> > =C2=A0=C2=A0=09 * the GPU globally, which requires extra synchronizatio=
n
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
> > +=09 * timeout handlers of different schedulers. One way to
> > achieve this
> > +=09 * synchronization is to create an ordered workqueue
> > (using
> > +=09 * alloc_ordered_workqueue()) at the driver level, and
> > pass this queue
> > +=09 * as drm_sched_init()'s @timeout_wq parameter. This will
> > guarantee
> > +=09 * that timeout handlers are executed sequentially.
> > =C2=A0=C2=A0=09 *
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
> > +=09 * Return: The scheduler's status, defined by
> > &drm_gpu_sched_stat
> > =C2=A0=C2=A0=09 *
> > -=09 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> > -=09 * and the underlying driver has started or completed
> > recovery.
> > -=09 *
> > -=09 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no
> > longer
> > -=09 * available, i.e. has been unplugged.
> > =C2=A0=C2=A0=09 */
> > =C2=A0=C2=A0=09enum drm_gpu_sched_stat (*timedout_job)(struct
> > drm_sched_job *sched_job);
> > =C2=A0=20
>=20

