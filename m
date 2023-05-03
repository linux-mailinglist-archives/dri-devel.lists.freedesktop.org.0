Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76C6F52F1
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 10:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC69910E1F3;
	Wed,  3 May 2023 08:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6D410E1F3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 08:16:30 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 31E7C6602338;
 Wed,  3 May 2023 09:16:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683101787;
 bh=j0/H+bLnDL19R+pHbEkluQwebYd9DKUtaw7uoazfnI8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z0L66tKDinX97MabbCpB0xTnMHViulL7wkUSAtNimid4YLcCxm9+bxVH3MVyxd0yw
 hFZP+6GSP8gDAWY0MzJPPfGGnPentMoApNUaRSMjBQFXRDSe73o8ED3nxf4gTwxpFZ
 ORp3bteVyMnz2eyLCA3YkbabKFy52WCg7nZuUxBY5+1FA7H1SvVCdEHboTzVnJBC4m
 kZzopCx/I4bKuqYewluC4BI2qSUvkqGQp3VhD3F2ypOK3uCvO9FS/hWnLjCf3UlG4d
 t6ueVwO2cDOuKLEMI9JPjVk7d5i49QW0MxFiJhCZN1oE7YrBwpAF7j5GZAcENktI6c
 40eQBGdAA5Ctg==
Date: Wed, 3 May 2023 10:16:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Message-ID: <20230503101624.5dbae57c@collabora.com>
In-Reply-To: <20230502144132.6a9e1bb5@collabora.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
 <20230502144132.6a9e1bb5@collabora.com>
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

Hi Christian,

On Tue, 2 May 2023 14:41:32 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hi Christian,
>=20
> Thanks for your quick reply.
>=20
> On Tue, 2 May 2023 13:36:07 +0200
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>=20
> > Hi Boris,
> >=20
> > Am 02.05.23 um 13:19 schrieb Boris Brezillon: =20
> > > Hello Christian, Alex,
> > >
> > > As part of our transition to drm_sched for the powervr GPU driver, we
> > > realized drm_sched_resubmit_jobs(), which is used by all drivers
> > > relying on drm_sched right except amdgpu, has been deprecated.
> > > Unfortunately, commit 5efbe6aa7a0e ("drm/scheduler: deprecate
> > > drm_sched_resubmit_jobs") doesn't describe what drivers should do or =
use
> > > as an alternative.
> > >
> > > At the very least, for our implementation, we need to restore the
> > > drm_sched_job::parent pointers that were set to NULL in
> > > drm_sched_stop(), such that jobs submitted before the GPU recovery are
> > > considered active when drm_sched_start() is called. That could be done
> > > with a custom pending_list iteration restoring drm_sched_job::parent's
> > > pointer, but that seems odd to let the scheduler backend manipulate
> > > this list directly, and I suspect we need to do other checks, like the
> > > karma vs hang-limit thing, so we can flag the entity dirty and cancel
> > > all jobs being queued there if the entity has caused too many hangs.
> > >
> > > Now that drm_sched_resubmit_jobs() has been deprecated, that would be
> > > great if you could help us write a piece of documentation describing
> > > what should be done between drm_sched_stop() and drm_sched_start(), so
> > > new drivers don't come up with their own slightly different/broken
> > > version of the same thing.   =20
> >=20
> > Yeah, really good point! The solution is to not use drm_sched_stop() an=
d=20
> > drm_sched_start() either. =20
>=20
> Okay. If that's what we're heading to, this should really be clarified
> in the job_timedout() method doc, because right now it's
> mentioning drm_sched_{start,stop,resubmit_jobs}(), with
> drm_sched_resubmit_jobs() being deprecated already.
>=20
> >=20
> > The general idea Daniel, the other Intel guys and me seem to have agree=
d=20
> > on is to convert the scheduler thread into a work item.
> >=20
> > This work item for pushing jobs to the hw can then be queued to the sam=
e=20
> > workqueue we use for the timeout work item.
> >=20
> > If this workqueue is now configured by your driver as single threaded=20
> > you have a guarantee that only either the scheduler or the timeout work=
=20
> > item is running at the same time. That in turn makes starting/stopping=
=20
> > the scheduler for a reset completely superfluous. =20
>=20
> Makes sense.
>=20
> >=20
> > Patches for this has already been floating on the mailing list, but=20
> > haven't been committed yet. Since this is all WIP. =20
>=20
> Assuming you're talking about [1], yes, I'm aware of this effort
> (PowerVR also has FW-side scheduling, which is what this patch series
> was trying to address initially). And I'm aware of the
> ordered-workqueue trick too, it helped fixing a few races in panfrost
> in the past.
>=20
> >=20
> > In general it's not really a good idea to change the scheduler and hw=20
> > fences during GPU reset/recovery. The dma_fence implementation has a=20
> > pretty strict state transition which clearly say that a dma_fence shoul=
d=20
> > never go back from signaled to unsignaled and when you start messing=20
> > with that this is exactly what might happen.
> >=20
> > What you can do is to save your hw state and re-start at the same=20
> > location after handling the timeout. =20
>=20
> To sum-up, we shouldn't call drm_sched_{start,stop,resubmit_jobs}().

After the discussion I had with Matthew yesterday on IRC, I
realized there was no clear agreement on this. Matthew uses those 3
helpers in the Xe driver right now, and given he intends to use a
multi-threaded wq for its 1:1 schedulers run queue, there's no way he
can get away without calling drm_sched_{start,stop}().
drm_sched_resubmit_jobs() can be open-coded in each driver, but I'm
wondering if it wouldn't be preferable to add a ::resubmit_job() method
or extend the ::run_job() one to support the resubmit semantics, which,
AFAIU, is just about enforcing the job done fence (the one returned by
::run_job()) doesn't transition from a signaled to an unsignaled state.

But probably more important than providing a generic helper, we should
document the resubmit semantics (AKA, what should and/or shouldn't be
done with pending jobs when a recovery happens). Because forbidding
people to use a generic helper function doesn't give any guarantee that
they'll do the right thing when coding their own logic, unless we give
clues about what's considered right/wrong, and the current state of the
doc is pretty unclear in this regard.

Regards,

Boris
