Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66E6F489A
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 18:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194BA10E0F6;
	Tue,  2 May 2023 16:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A415210E22A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 16:50:12 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F41FB6603219;
 Tue,  2 May 2023 17:50:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683046209;
 bh=vFTrOHJyWpt7KeT297iBopls6heX0p4Ispjj/VNUjN8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MSfq0XtRHVmVdlWCj8sy+PiN9/Rmncyql76Ax/+zXYCw0DCBUVeK2Hyf4P3EfXWRF
 WSKNEN3WRlmG8JHm4CX+s8uP/uaU+GO2jvhx9bt8oci3Tegy3QSTwKisAKXveScXWh
 y02aZ3KwtciEK2l97OZhjmErDaUsnoJChDP5DSJqA2JCDce3JtZ+S+IOvD62StpANd
 gEHF2Injphdb/VB+U/lSh5e+3O+wliDXjgQmYDLmldRTKgimjWqzHp9RaYOH4Z7nI+
 iTnhnScNkLMfvO/u8iGhi+i92z2e+J0MU8AOuRYb4htQmCAu3fkLpPMkJIucaxUwza
 lRvhzfiMOFbVw==
Date: Tue, 2 May 2023 18:50:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Message-ID: <20230502185006.4b2e67a7@collabora.com>
In-Reply-To: <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Sarah Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Matthew who's been working on the kthread -> wq transition.

On Tue, 2 May 2023 13:36:07 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Hi Boris,
>=20
> Am 02.05.23 um 13:19 schrieb Boris Brezillon:
> > Hello Christian, Alex,
> >
> > As part of our transition to drm_sched for the powervr GPU driver, we
> > realized drm_sched_resubmit_jobs(), which is used by all drivers
> > relying on drm_sched right except amdgpu, has been deprecated.
> > Unfortunately, commit 5efbe6aa7a0e ("drm/scheduler: deprecate
> > drm_sched_resubmit_jobs") doesn't describe what drivers should do or use
> > as an alternative.
> >
> > At the very least, for our implementation, we need to restore the
> > drm_sched_job::parent pointers that were set to NULL in
> > drm_sched_stop(), such that jobs submitted before the GPU recovery are
> > considered active when drm_sched_start() is called. That could be done
> > with a custom pending_list iteration restoring drm_sched_job::parent's
> > pointer, but that seems odd to let the scheduler backend manipulate
> > this list directly, and I suspect we need to do other checks, like the
> > karma vs hang-limit thing, so we can flag the entity dirty and cancel
> > all jobs being queued there if the entity has caused too many hangs.
> >
> > Now that drm_sched_resubmit_jobs() has been deprecated, that would be
> > great if you could help us write a piece of documentation describing
> > what should be done between drm_sched_stop() and drm_sched_start(), so
> > new drivers don't come up with their own slightly different/broken
> > version of the same thing. =20
>=20
> Yeah, really good point! The solution is to not use drm_sched_stop() and=
=20
> drm_sched_start() either.
>=20
> The general idea Daniel, the other Intel guys and me seem to have agreed=
=20
> on is to convert the scheduler thread into a work item.
>=20
> This work item for pushing jobs to the hw can then be queued to the same=
=20
> workqueue we use for the timeout work item.
>=20
> If this workqueue is now configured by your driver as single threaded=20
> you have a guarantee that only either the scheduler or the timeout work=20
> item is running at the same time. That in turn makes starting/stopping=20
> the scheduler for a reset completely superfluous.
>=20
> Patches for this has already been floating on the mailing list, but=20
> haven't been committed yet. Since this is all WIP.

As I said previously, our work is based on Matthew's patch series
converting drm_sched threads to a workqueue based implementation.
And I think there are a couple of shortcomings with the current
implementation if we do what you suggest (one single-threaded workqueue
used to serialize the GPU resets and job dequeuing/submission):

- drm_sched_main() has a loop dequeuing jobs until it can't (because a
  dep is not signaled, or because all slots are taken), not one at a
  time. There can also be several 1:1 entities waiting for jobs to be
  dequeued before the reset work. That means the reset operation might
  be delayed if we don't have a drm_sched_stop() calling cancel_work()
  and making sure we break out of the loop.
- with a workqueue (and that's even worse with a single-threaded one),
  the entity priorities are not enforced at the de-queuing level. The FW
  will still take care of execution priority, but you can have a low
  prio drm_sched_entity getting pushed a lot of jobs, and with the
  drm_sched_main() loop, you'll only let other entities dequeue their
  jobs when the ringbuf of this low prio entity is full or a job dep
  is not signaled. De-queuing one job at a time makes things better, but
  if you have a lot of 1:1 entities, it can still take sometime until
  you reach the high prio drm_sched worker.

I'm just wondering if you already have solutions to these problems.

Regards,

Boris
