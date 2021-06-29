Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF33B7143
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B186E85E;
	Tue, 29 Jun 2021 11:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85456E85E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 11:19:03 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 232291F416F0;
 Tue, 29 Jun 2021 12:19:02 +0100 (BST)
Date: Tue, 29 Jun 2021 13:18:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v5 02/16] drm/sched: Allow using a dedicated workqueue
 for the timeout/fault tdr
Message-ID: <20210629131858.1a598182@collabora.com>
In-Reply-To: <5b619624-ca5d-6b9a-0600-f122a4d68c58@amd.com>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-3-boris.brezillon@collabora.com>
 <5b619624-ca5d-6b9a-0600-f122a4d68c58@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: Emma Anholt <emma@anholt.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Tue, 29 Jun 2021 13:03:58 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 29.06.21 um 09:34 schrieb Boris Brezillon:
> > Mali Midgard/Bifrost GPUs have 3 hardware queues but only a global GPU
> > reset. This leads to extra complexity when we need to synchronize timeo=
ut
> > works with the reset work. One solution to address that is to have an
> > ordered workqueue at the driver level that will be used by the different
> > schedulers to queue their timeout work. Thanks to the serialization
> > provided by the ordered workqueue we are guaranteed that timeout
> > handlers are executed sequentially, and can thus easily reset the GPU
> > from the timeout handler without extra synchronization. =20
>=20
> Well, we had already tried this and it didn't worked the way it is expect=
ed.
>=20
> The major problem is that you not only want to serialize the queue, but=20
> rather have a single reset for all queues.
>=20
> Otherwise you schedule multiple resets for each hardware queue. E.g. for=
=20
> your 3 hardware queues you would reset the GPU 3 times if all of them=20
> time out at the same time (which is rather likely).
>=20
> Using a single delayed work item doesn't work either because you then=20
> only have one timeout.
>=20
> What could be done is to cancel all delayed work items from all stopped=20
> schedulers.

drm_sched_stop() does that already, and since we call drm_sched_stop()
on all queues in the timeout handler, we end up with only one global
reset happening even if several queues report a timeout at the same
time.

Regards,

Boris
