Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3BE79D210
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 15:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BA610E235;
	Tue, 12 Sep 2023 13:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6933E10E22F;
 Tue, 12 Sep 2023 13:27:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 85A616607326;
 Tue, 12 Sep 2023 14:27:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694525229;
 bh=BT7shNG2qiSabyiU3Q+WBPZn8RemrMpyRzjMjj6LNV4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QGa+6paFAlgt+E59sbend+Qfg8Xk5VG3cw3jel1mqUB+EJ+ERLPMZro9b0mt2RK1+
 gui7fIP6j7K8fyYV0vIKuRezOHlc9rMeABJGbENr6hNN8HyXxKqsdsEVqZqZ/krkSg
 HtJZxm93IyUMYcSyOWqtz9mjKJzpPvvvlUgFz4gGmUA0D+BVdAm43tIluusXNQtCnx
 x5cEzV47M7X+39f0IdYC/CwiY55CSdRJSE9KL66fjwQA+1r17gR0YArEIe+qyARnKX
 JMax000RMx2PCcBwMo4jyOKfji5jSzcFmEsyv6vgpY8RGE8C6fVssBzzgC8ynUuoYL
 IiiXTctlScx1Q==
Date: Tue, 12 Sep 2023 15:27:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <20230912152705.70064f9f@collabora.com>
In-Reply-To: <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
 <6ae84066-b690-1562-0598-4694b022c960@amd.com>
 <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
 <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
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
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Aug 2023 15:45:49 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> >>>> I tried this patch with Nouveau and found a race condition:
> >>>>
> >>>> In drm_sched_run_job_work() the job is added to the pending_list via
> >>>> drm_sched_job_begin(), then the run_job() callback is called and the=
 scheduled
> >>>> fence is signaled.
> >>>>
> >>>> However, in parallel drm_sched_get_cleanup_job() might be called from
> >>>> drm_sched_free_job_work(), which picks the first job from the pendin=
g_list and
> >>>> for the next job on the pending_list sets the scheduled fence' times=
tamp field. =20
> >> Well why can this happen in parallel? Either the work items are schedu=
led to
> >> a single threaded work queue or you have protected the pending list wi=
th
> >> some locks.
> >> =20
> > Xe uses a single-threaded work queue, Nouveau does not (desired
> > behavior).
> >
> > The list of pending jobs is protected by a lock (safe), the race is:
> >
> > add job to pending list
> > run_job
> > signal scheduled fence
> >
> > dequeue from pending list
> > free_job
> > update timestamp
> >
> > Once a job is on the pending list its timestamp can be accessed which
> > can blow up if scheduled fence isn't signaled or more specifically unle=
ss
> > DMA_FENCE_FLAG_TIMESTAMP_BIT is set. =20

I'm a bit lost. How can this lead to a NULL deref? Timestamp is a
ktime_t embedded in dma_fence, and finished/scheduled are both
dma_fence objects embedded in drm_sched_fence. So, unless
{job,next_job}->s_fence is NULL, or {job,next_job} itself is NULL, I
don't really see where the NULL deref is. If s_fence is NULL, that means
drm_sched_job_init() wasn't called (unlikely to be detected that late),
or ->free_job()/drm_sched_job_cleanup() was called while the job was
still in the pending list. I don't really see a situation where job
could NULL to be honest.

While I agree that updating the timestamp before the fence has been
flagged as signaled/timestamped is broken (timestamp will be
overwritten when dma_fence_signal(scheduled) is called) I don't see a
situation where it would cause a NULL/invalid pointer deref. So I
suspect there's another race causing jobs to be cleaned up while
they're still in the pending_list.

>=20
> Ah, that problem again. No that is actually quite harmless.
>=20
> You just need to double check if the DMA_FENCE_FLAG_TIMESTAMP_BIT is=20
> already set and if it's not set don't do anything.
