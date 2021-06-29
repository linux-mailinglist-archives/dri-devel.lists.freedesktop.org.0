Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480EB3B6FC8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 10:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E876E82F;
	Tue, 29 Jun 2021 08:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1195E6E82F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 08:58:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 19DBE1F42F22;
 Tue, 29 Jun 2021 09:58:08 +0100 (BST)
Date: Tue, 29 Jun 2021 10:58:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 02/16] drm/sched: Allow using a dedicated workqueue
 for the timeout/fault tdr
Message-ID: <20210629105804.5c9504cb@collabora.com>
In-Reply-To: <YNre3JOtQvvoQWBI@phenom.ffwll.local>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-3-boris.brezillon@collabora.com>
 <YNre3JOtQvvoQWBI@phenom.ffwll.local>
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
 Robin Murphy <robin.murphy@arm.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Jun 2021 10:50:36 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Jun 29, 2021 at 09:34:56AM +0200, Boris Brezillon wrote:
> > Mali Midgard/Bifrost GPUs have 3 hardware queues but only a global GPU
> > reset. This leads to extra complexity when we need to synchronize timeo=
ut
> > works with the reset work. One solution to address that is to have an
> > ordered workqueue at the driver level that will be used by the different
> > schedulers to queue their timeout work. Thanks to the serialization
> > provided by the ordered workqueue we are guaranteed that timeout
> > handlers are executed sequentially, and can thus easily reset the GPU
> > from the timeout handler without extra synchronization.
> >=20
> > v5:
> > * Add a new paragraph to the timedout_job() method
> >=20
> > v3:
> > * New patch
> >=20
> > v4:
> > * Actually use the timeout_wq to queue the timeout work
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Steven Price <steven.price@arm.com>
> > Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Qiang Yu <yuq825@gmail.com>
> > Cc: Emma Anholt <emma@anholt.net>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com> =20
>=20
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> Also since I'm occasionally blinded by my own pride, add suggested-by: me?

Duh, it's an oversight (I thought I had that 'Suggested-by: Daniel
Vetter ...' already).

> I did spend quite a bit pondering how to untangle your various lockdep
> splats in the trd handler :-)

And I'm grateful for your help ;-).
