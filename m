Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D172CB6E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 18:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662E110E174;
	Mon, 12 Jun 2023 16:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220F210E174
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 16:25:35 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D754660583E;
 Mon, 12 Jun 2023 17:25:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686587133;
 bh=x4g1wUSEKvwby86oCg4nBPXfL749cFEjVoVSaUOHweM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GOqwJQ5W/KA4I6cYjdRzESyl1Fmgc3vMjyDlNzXDtygXB5o2dgnYlZ2TgU0eLeI4i
 6gUdRti+wr7W3TKReSsk5y6DAbzimlzgj/AoeEVMHcNaTZtPjsssVNUrfBqO4UOSMn
 K5mKDUPwgQAmQo8ePAJSxFLlhXbdzmWsoWgfaeamhIh5fOsOLrAJR1qOZG43Yg1Bry
 u9oGqFw1A7rKxuaiDJ1OuprNWWsHgGN+7+8iVlTv5qP7LEwmGQaGKPvvjiVrnCueRY
 VVoTvSK7P9dCCReRU0syYyh2sWwEwdbxg7TKyuqZhPv3+AqcREjnkee24fjz8KJ8A/
 zYIbsCBJliF+Q==
Date: Mon, 12 Jun 2023 18:25:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/sched: Add native dependency support to drm_sched
Message-ID: <20230612182530.6214caf3@collabora.com>
In-Reply-To: <20230612165902.437345c4@collabora.com>
References: <7ced7c0a101cb2467c34b69d2b686c429f64d8c2.camel@imgtec.com>
 <5fcf04fa-1f45-30dd-1a37-cb0eba6d5f4a@amd.com>
 <20230612165902.437345c4@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 Donald Robson <Donald.Robson@imgtec.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Jun 2023 16:59:02 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hi Christian,
>=20
> On Mon, 12 Jun 2023 15:16:03 +0200
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>=20
> > Am 08.06.23 um 15:23 schrieb Donald Robson: =20
> > > This patch adds support for 'native' dependencies to DRM scheduler.  =
In
> > > drivers that use a firmware based scheduler there are performance gai=
ns
> > > to be had by allowing waits to happen in the firmware, as this reduces
> > > the latency between signalling and job submission.   =20
> >=20
> > Well, if I'm not completely mistaken this patch here is superfluous=20
> > since we already use that functionality.
> >=20
> > This strongly sounds like the HW dependencies we have in amdgpu. See=20
> > AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES. =20
>=20
> I'll look at it in more details. Thanks for the pointer.

I had a quick look, and it looks pretty similar, indeed.

>=20
> >=20
> > Basically userspace can instead of giving a hard dependency to finish=20
> > something before the current submission starts also give a soft=20
> > dependency and only let the other submission be scheduled.
> >=20
> > This way you can then wait for the firmware for certain operations of=20
> > the previous submission to complete by comparing memory or registers.
> >=20
> > You don't necessarily need to give control over this to userspace, if=20
> > your kernel driver can determine a fw assisted wait by itself that=20
> > should also work fine. =20
>=20
> That's what we did initially. We had a separate 'native_deps' xarray in
> pvr_job that we were managing ourselves, and that worked fine, except
> for the kill_entity() stuff. If you don't wait for those
> 'native-fences', you're potentially signaling the job finished fence
> earlier than it should.

Hm, I think we could get drm_sched_entity_kill_jobs_cb() to do the
right thing here without teaching drm_sched about native deps. If we
turn back scheduled fences into finished fences in
drm_sched_entity_kill_jobs_cb(), this should work:

static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
                                          struct dma_fence_cb *cb)
{
        struct drm_sched_job *job =3D container_of(cb, struct drm_sched_job,
                                                 finish_cb);
        unsigned long index;
        int r;

        dma_fence_put(f);

        /* Wait for all dependencies to avoid data corruptions */
        xa_for_each(&job->dependencies, index, f) {
                struct drm_sched_fence *s_fence =3D to_drm_sched_fence(f);

                /* Make sure we wait for the finished fence here, so we can
                 * guarantee that any job we depend on that is still access=
ing
                 * resources is done before we signal this job finished fen=
ce
                 * and unblock further accesses on these resources.
                 */
                if (s_fence && f =3D=3D &s_fence->scheduled)
                        f =3D &s_fence->finished;

                xa_erase(&job->dependencies, index);
                r =3D dma_fence_add_callback(f, &job->finish_cb,
                                           drm_sched_entity_kill_jobs_cb);
                if (!r)
                        return;

                dma_fence_put(f);
        }

        INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
        schedule_work(&job->work);
}

Then, for native fences, we just have to add the scheduled fence to the deps
array, as you do (and as we did in our first version), and we should be goo=
d.
