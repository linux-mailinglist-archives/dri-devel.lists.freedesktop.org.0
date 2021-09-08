Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA901403482
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 08:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7426E134;
	Wed,  8 Sep 2021 06:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1366E134
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 06:50:46 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 02ED51F430F1;
 Wed,  8 Sep 2021 07:50:43 +0100 (BST)
Date: Wed, 8 Sep 2021 08:50:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Emma Anholt
 <emma@anholt.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>, Rob
 Herring <robh+dt@kernel.org>, Alyssa Rosenzweig
 <alyssa.rosenzweig@collabora.com>, Alex Deucher
 <alexander.deucher@amd.com>, Qiang Yu <yuq825@gmail.com>, Robin Murphy
 <robin.murphy@arm.com>
Subject: Re: [PATCH v5 02/16] drm/sched: Allow using a dedicated workqueue
 for the timeout/fault tdr
Message-ID: <20210908085038.0feeda7c@collabora.com>
In-Reply-To: <eaaad39f-832b-0c43-5043-061dc717a756@amd.com>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-3-boris.brezillon@collabora.com>
 <5b619624-ca5d-6b9a-0600-f122a4d68c58@amd.com>
 <20210629131858.1a598182@collabora.com>
 <532d1f9d-1092-18c3-c87d-463cfda60ed7@amd.com>
 <eaaad39f-832b-0c43-5043-061dc717a756@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Sep 2021 14:53:58 -0400
Andrey Grodzovsky <andrey.grodzovsky@amd.com> wrote:

> On 2021-06-29 7:24 a.m., Christian K=C3=B6nig wrote:
>=20
> > Am 29.06.21 um 13:18 schrieb Boris Brezillon: =20
> >> Hi Christian,
> >>
> >> On Tue, 29 Jun 2021 13:03:58 +0200
> >> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >> =20
> >>> Am 29.06.21 um 09:34 schrieb Boris Brezillon: =20
> >>>> Mali Midgard/Bifrost GPUs have 3 hardware queues but only a global G=
PU
> >>>> reset. This leads to extra complexity when we need to synchronize=20
> >>>> timeout
> >>>> works with the reset work. One solution to address that is to have an
> >>>> ordered workqueue at the driver level that will be used by the=20
> >>>> different
> >>>> schedulers to queue their timeout work. Thanks to the serialization
> >>>> provided by the ordered workqueue we are guaranteed that timeout
> >>>> handlers are executed sequentially, and can thus easily reset the GPU
> >>>> from the timeout handler without extra synchronization. =20
> >>> Well, we had already tried this and it didn't worked the way it is=20
> >>> expected.
> >>>
> >>> The major problem is that you not only want to serialize the queue, b=
ut
> >>> rather have a single reset for all queues.
> >>>
> >>> Otherwise you schedule multiple resets for each hardware queue. E.g.=
=20
> >>> for
> >>> your 3 hardware queues you would reset the GPU 3 times if all of them
> >>> time out at the same time (which is rather likely).
> >>>
> >>> Using a single delayed work item doesn't work either because you then
> >>> only have one timeout.
> >>>
> >>> What could be done is to cancel all delayed work items from all stopp=
ed
> >>> schedulers. =20
> >> drm_sched_stop() does that already, and since we call drm_sched_stop()
> >> on all queues in the timeout handler, we end up with only one global
> >> reset happening even if several queues report a timeout at the same
> >> time. =20
> >
> > Ah, nice. Yeah, in this case it should indeed work as expected.
> >
> > Feel free to add an Acked-by: Christian K=C3=B6nig=20
> > <christian.koenig@amd.com> to it.
> >
> > Regards,
> > Christian. =20
>=20
>=20
> Seems to me that for this to work we need to change cancel_delayed_work=20
> to cancel_delayed_work_sync
> so not only pending TO handlers=C2=A0 are cancelled but also any in progr=
ess=20
> are waited for and to to prevent rearming.
> Also move it right after kthread_park - before we start touching pending=
=20
> list.

I'm probably missing something, but I don't really see why this
specific change would require replacing cancel_delayed_work() calls by
the sync variant. I mean, if there's a situation where we need to wait
for in-flight timeout handler to return, it was already the case before
that patch. Note that we need to be careful to not call the sync
variant in helpers that are called from the interrupt handler itself
to avoid deadlocks (i.e. drm_sched_stop()).
