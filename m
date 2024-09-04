Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D796B84F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 12:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D09B10E741;
	Wed,  4 Sep 2024 10:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="D0QyZ6J6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C0210E741
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725445442;
 bh=xsgNIzs9hUDCknjOqPsMPXYD3Y1N9dIbh1GEaAiu8Qw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D0QyZ6J6caMU4bLTaoheCGlDsfN/eW90qoz8xmjjNIcKSkpiaI/ut4MCavsJblWYr
 ny4r8nyNru2d97YLHkIORFEN+ed9taZJ7cMBLj27IVS7roJiKoVOwqEFTRqZW+Sgtg
 yDcWceTql8w7LR0bN8OKm1hUvYgpQMQA6wZ7HRVqSSJKeIXw9iRnmF72vP9zcPDNmG
 u8Rj7thoUaC82PjhQ3pRHAdH9XA+SDW1/VBwqWlaHTUSNfZ43FsRLvhWbw7261amFR
 xno2UhrYI9XR4sL/T/b+KKYyhKmyb2lGK2s/S2PTL9Bu1OPns9YnrHOxBiLvEWgIfe
 LbnDTw4oJJsfA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 67A5617E0FAD;
 Wed,  4 Sep 2024 12:24:02 +0200 (CEST)
Date: Wed, 4 Sep 2024 12:23:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, kernel@collabora.com, Luben Tuikov
 <ltuikov89@gmail.com>, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Message-ID: <20240904122357.4c2022e2@collabora.com>
In-Reply-To: <ZtgsjoCWI4aDWpSi@phenom.ffwll.local>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
 <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
 <710b6946-ce8e-42ed-8df6-aa76bf0d5f3f@amd.com>
 <ZtW8aiIhBA5KBLR6@phenom.ffwll.local>
 <b6185b8e-148a-494e-a336-e4290c38b700@amd.com>
 <ZtbFJRZKA4UghVai@phenom.ffwll.local>
 <77ce6514-7050-4b17-b7f8-096b7933dcfb@amd.com>
 <ZtgsjoCWI4aDWpSi@phenom.ffwll.local>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Wed, 4 Sep 2024 11:46:54 +0200
Simona Vetter <simona.vetter@ffwll.ch> wrote:

> On Wed, Sep 04, 2024 at 09:40:36AM +0200, Christian K=C3=B6nig wrote:
> > Am 03.09.24 um 10:13 schrieb Simona Vetter: =20
> > > [SNIP] =20
> > > > > So I think the issue is much, much bigger, and there's more. And =
the
> > > > > issue is I think a fundamental design issue of dma_fence itself, =
not
> > > > > individual users. =20
> > > > IIRC both Alex and me pointed out this issue on the very first dma_=
fence
> > > > code and nobody really cared. =20
> > > I guess way back then we didn't really sort out any of the hotunplug
> > > issues, and there wasn't any fw ctx schedulers at least on our horizo=
ns
> > > yet. Thin excuse, I know ... =20
> >=20
> > Well it's just when you have a bee string and a broken leg, what do you
> > attend first? :) =20
>=20
> Yeah ...
>=20
> > > > >    I think at the core it's two constraints:
> > > > >=20
> > > > > - dma_fence can stick around practically forever in varios contai=
ner
> > > > >     objects. We only garbage collect when someone looks, and not =
even then
> > > > >     consistently.
> > > > >=20
> > > > > - fences are meant to be cheap, so they do not have the big refco=
unt going
> > > > >     on like other shared objects like dma_buf
> > > > >=20
> > > > > Specifically there's also no refcounting on the module itself wit=
h the =20
> > > > > ->owner and try_module_get stuff. So even if we fix all these iss=
ues on =20
> > > > > the data structure lifetime side of things, you might still oops =
calling
> > > > > into dma_fence->ops->release.
> > > > >=20
> > > > > Oops. =20
> > > > Yes, exactly that. I'm a bit surprised that you realize that only n=
ow :)
> > > >=20
> > > > We have the issue for at least 10 years or so and it pops up every =
now and
> > > > then on my desk because people complain that unloading amdgpu crash=
es. =20
> > > Yeah I knew about the issue. The new idea that popped into my mind is=
 that
> > > I think we cannot plug this properly unless we do it in dma_fence.c f=
or
> > > everyone, and essentially reshape the lifetime rules for that from yo=
lo
> > > to something actually well-defined.
> > >=20
> > > Kinda similar work to how dma_resv locking rules and fence book-keepi=
ng
> > > were unified to something that actually works across drivers ... =20
> >=20
> > Well sounds like I've just got more items on my TODO list.
> >=20
> > I have patches waiting to be send out going into this direction anyway,=
 will
> > try to get them out by the end of the week and then we can discuss what=
's
> > still missing. =20
>=20
> Quick addition, another motivator from the panthor userspace submit
> discussion: If the preempt ctx fence concept spreads, that's another
> non-drm_sched fence that drivers will need and are pretty much guaranteed
> to get wrong.
>=20
> Also maybe Boris volunteers to help out with some of the work here?

Sure, I can review/test what Christian comes up with, since he already
seems to have a draft for the new implementation.
