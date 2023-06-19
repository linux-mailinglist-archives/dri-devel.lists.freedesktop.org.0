Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2207351EE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 12:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528F010E1DB;
	Mon, 19 Jun 2023 10:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB08010E1DA;
 Mon, 19 Jun 2023 10:23:16 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 385616606F81;
 Mon, 19 Jun 2023 11:23:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687170194;
 bh=dwfj6A7GDHZ04QDjj9/w0/oDMPqRxaNJJcv+oyV0twQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ckyEjmkZfuX09sAMfq0gFy0Scv8IBpqncRO2eREj0iZNNAlFwr3LDYkJXb3OKsSxA
 H24R9yip6p1gLw1TyWVLgegm6Q9En26sNKk53y7WWFjSqIxTyCYNAVZ73h7A267TX3
 h2cZaYSSMgW1jWn/df2lr+VlWPXE8waxWaAOmsoUDLIZ9B+xyxtm8IF6J4ismcPFeu
 he5uSm4Vys9qoENzr1obhul4Nubdy+q+yvYbf75KQ9N+kvVsjsVd9a3BX0T2P69eTS
 Ir7stXVVNQdWWZcjdUAQ6pyCSOsP6X4xR0UmPQhtZmHcz05vg3klKwyTT7V1KvPFdu
 +J14ypPaUFfDA==
Date: Mon, 19 Jun 2023 12:23:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Message-ID: <20230619122311.0b26c31b@collabora.com>
In-Reply-To: <94f9393a-17fe-321d-c4e1-e12663dc3106@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
 <20230617135434.7dd3a25d@collabora.com>
 <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
 <94f9393a-17fe-321d-c4e1-e12663dc3106@amd.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, arunpravin.paneerselvam@amd.com,
 "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= \(Intel\)" <thomas_os@shipmail.org>,
 francois.dugast@intel.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, felix.kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Jun 2023 11:20:06 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Hi guys,
>=20
> Am 19.06.23 um 10:59 schrieb Thomas Hellstr=C3=B6m (Intel):
> > [SNIP] =20
> >>>>
> >>>> I really need to find some time to work on that anyway. =20
> >> I've been playing with drm_exec for a couple weeks now, and I wanted
> >> to share something I hacked to try and make the API simpler and
> >> more robust against misuse (see the below diff, which is a slightly
> >> adjusted version of your work). =20
> >
> > It would be good if we could have someone taking charge of this series=
=20
> > and address all review comments, I see some of my comments getting=20
> > lost, we have multiple submitters and I can't find a dri-devel=20
> > patchwork entry for this. Anyway some comments below. =20
>=20
> I can try to find some time for the series this week (As long as nobody=20
> comes along and has any burning roof).

That's great news!

>=20
> > =20
> >>
> >> In this version, the user is no longer in control of the retry
> >> loop. Instead, it provides an expression (a call to a
> >> sub-function) to be re-evaluated each time a contention is
> >> detected. IMHO, this makes the 'prepare-objs' functions easier to
> >> apprehend, and avoids any mistake like calling
> >> drm_exec_continue_on_contention() in an inner loop, or breaking
> >> out of the drm_exec_while_all_locked() loop unintentionally. =20
> >
> > In i915 we've had a very similar helper to this, and while I agree=20
> > this newer version would probably help make code cleaner, but OTOH=20
> > there also are some places where the short drm_exec_while_all_locked()=
=20
> > -likeblock don't really motivate a separate function. Porting i915 to=20
> > the current version will take some work, For=C2=A0 the xe driver both=20
> > versions would work fine. =20
>=20
> Yeah, this is actually what my first version of this looked like. But I=20
> abandoned that approach because we have a lot of cases were we just=20
> quickly want to lock a few GEM objects and don't want the extra overhead=
=20
> of putting all the state into some bag to forward it to a function.

If you're talking about verbosity, it might be the case, though I guess
it mostly a matter of taste (I do like when things are well isolated).
As for runtime overhead, I'd expect the compiler to inline the function
anyway, so it's unlikely to change anything.

> >> +/* Track the locked object in the array */
> >> +static int drm_exec_obj_locked(struct drm_exec *exec,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 if (unlikely(exec->num_objects =3D=3D exec->max_ob=
jects)) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size =3D exec->max_=
objects * sizeof(void *);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *tmp;
> >> +
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp =3D kvrealloc(exec->ob=
jects, size, size + PAGE_SIZE,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tmp)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -ENOMEM; =20
> >
> > Sometimes you need to just temporarily lock an object and then unlock=20
> > it again if it goes out of scope before reaching the end of=20
> > _until_all_locked(). In that case you might need to remove a lock from=
=20
> > the array. I *think* for all use-cases in i915 it would suffice to=20
> > take a snapshot of num_objects, and unlock everything above that,=20
> > having exec->objects behave like a stack, but was ever a list=20
> > considered instead of a realloced array? =20
>=20
> Yes, the problem is that linked lists really suck regarding their cache=20
> line locality. That's why I've came up with this approach here.

Hm, maybe I'm missing something, but if you place the list_head obj you
use to stack the locked objects close enough to the resv pointer, and
aligned on cache line, it shouldn't really be a problem, given you have
to dereference the GEM object to retrieve its resv anyway.
