Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B2D79D2E8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 15:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2306D10E41A;
	Tue, 12 Sep 2023 13:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED2910E41E;
 Tue, 12 Sep 2023 13:54:04 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 360D96607314;
 Tue, 12 Sep 2023 14:54:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694526842;
 bh=saNri85zlScbhT2/fd0o5fwxB1j8tMP6FLWoyyDLyyA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mMLoTrLnb+srh+b5UcCXxykppXXl+emqSwtPQRKRZODPm31sVctqRhwSYk89bSjEu
 yaScGLr59UHHvNYtp9Rx0k32Kf+RQaO+uWDm8eU/AyIwwHAcbl95kbLtGAFOfhkCpZ
 wmnOHTu9tfNLdipR+dEyfMQRqA9ITCTrREtZlDj2eMWmJoCcV42wINYI8uXkErFaKH
 GJrkRVx+dkrVrG/5p5EIJbbdRVGO2XK5lehHQpZ2QwRH9Y/uJyLt7iwQQb/tuBoV5J
 DLMHYHwL9z+okcROweNHExH5vv3BEKfQNX4Jr9M8HFItoaoi67w64Eo1mC/lQxSOHg
 AxqxWPxqrmL5A==
Date: Tue, 12 Sep 2023 15:53:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <20230912155359.538936a9@collabora.com>
In-Reply-To: <ZQBo8YbjFigHyKc5@pollux>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
 <6ae84066-b690-1562-0598-4694b022c960@amd.com>
 <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
 <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
 <20230912152705.70064f9f@collabora.com> <ZQBo8YbjFigHyKc5@pollux>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 sarah.walker@imgtec.com, thomas.hellstrom@linux.intel.com,
 ketil.johnsen@arm.com, lina@asahilina.net, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Sep 2023 15:34:41 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On Tue, Sep 12, 2023 at 03:27:05PM +0200, Boris Brezillon wrote:
> > On Fri, 25 Aug 2023 15:45:49 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >  =20
> > > >>>> I tried this patch with Nouveau and found a race condition:
> > > >>>>
> > > >>>> In drm_sched_run_job_work() the job is added to the pending_list=
 via
> > > >>>> drm_sched_job_begin(), then the run_job() callback is called and=
 the scheduled
> > > >>>> fence is signaled.
> > > >>>>
> > > >>>> However, in parallel drm_sched_get_cleanup_job() might be called=
 from
> > > >>>> drm_sched_free_job_work(), which picks the first job from the pe=
nding_list and
> > > >>>> for the next job on the pending_list sets the scheduled fence' t=
imestamp field.   =20
> > > >> Well why can this happen in parallel? Either the work items are sc=
heduled to
> > > >> a single threaded work queue or you have protected the pending lis=
t with
> > > >> some locks.
> > > >>   =20
> > > > Xe uses a single-threaded work queue, Nouveau does not (desired
> > > > behavior).
> > > >
> > > > The list of pending jobs is protected by a lock (safe), the race is:
> > > >
> > > > add job to pending list
> > > > run_job
> > > > signal scheduled fence
> > > >
> > > > dequeue from pending list
> > > > free_job
> > > > update timestamp
> > > >
> > > > Once a job is on the pending list its timestamp can be accessed whi=
ch
> > > > can blow up if scheduled fence isn't signaled or more specifically =
unless
> > > > DMA_FENCE_FLAG_TIMESTAMP_BIT is set.   =20
> >=20
> > I'm a bit lost. How can this lead to a NULL deref? Timestamp is a
> > ktime_t embedded in dma_fence, and finished/scheduled are both
> > dma_fence objects embedded in drm_sched_fence. So, unless
> > {job,next_job}->s_fence is NULL, or {job,next_job} itself is NULL, I
> > don't really see where the NULL deref is. If s_fence is NULL, that means
> > drm_sched_job_init() wasn't called (unlikely to be detected that late),
> > or ->free_job()/drm_sched_job_cleanup() was called while the job was
> > still in the pending list. I don't really see a situation where job
> > could NULL to be honest. =20
>=20
> I think the problem here was that a dma_fence' timestamp field is within =
a union
> together with it's cb_list list_head [1]. If a timestamp is set before th=
e fence
> is actually signalled, dma_fence_signal_timestamp_locked() will access the
> cb_list to run the particular callbacks registered to this dma_fence. How=
ever,
> writing the timestap will overwrite this list_head since it's a union, he=
nce
> we'd try to dereference the timestamp while iterating the list.

Ah, right. I didn't notice it was a union, thought it was a struct...

>=20
> [1] https://elixir.bootlin.com/linux/latest/source/include/linux/dma-fenc=
e.h#L87
>=20
> >=20
> > While I agree that updating the timestamp before the fence has been
> > flagged as signaled/timestamped is broken (timestamp will be
> > overwritten when dma_fence_signal(scheduled) is called) I don't see a
> > situation where it would cause a NULL/invalid pointer deref. So I
> > suspect there's another race causing jobs to be cleaned up while
> > they're still in the pending_list.
> >  =20
> > >=20
> > > Ah, that problem again. No that is actually quite harmless.
> > >=20
> > > You just need to double check if the DMA_FENCE_FLAG_TIMESTAMP_BIT is=
=20
> > > already set and if it's not set don't do anything. =20
> >  =20
>=20

