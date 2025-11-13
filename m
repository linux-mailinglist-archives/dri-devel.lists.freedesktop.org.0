Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB789C57163
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 12:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2714010E050;
	Thu, 13 Nov 2025 11:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nG89sjJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281FC10E050
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 11:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763031949;
 bh=A3l1bqL2ZaHUeIvDTdtz9/4VdzTCmqZnngzv4BIt73E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nG89sjJkj48Upcqe3d0WT3HjMFRLbTjxNavBQrQ7+yio4bWlotn+pMSPb4uBqM4Jq
 k74P6Taw//OcDh7kMlPIg7dojE64h/XeH2ztSXcbohN0BKU0u5WnwoQU3cBk/RwKsW
 bR0K5BCOSRzpv+M1I+B7ivmXk8ZdOxOLbTZcghsO6vt/oHZE06gnxz5MZd5KAsHC7q
 vp0hWY8tpsgf+YgVA0BhCx/Mf7/QnyKkw0W5lASu6a480PEGxCwZCQOMmwB+Pplu+C
 XieQ3bbS6VZVrXcTExIQSHbsWokuEjBZf1BhoCiinIoRaBNy8qaEm+jiqLkLBYmkGI
 iBvELZG6MG/rA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5285217E12D5;
 Thu, 13 Nov 2025 12:05:49 +0100 (CET)
Date: Thu, 13 Nov 2025 12:05:45 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Detlev Casanova
 <detlev.casanova@collabora.com>, Ashley Smith <ashley.smith@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v7 1/2] drm/panthor: Make the timeout per-queue instead
 of per-job
Message-ID: <20251113120545.7a4ef9cc@fedora>
In-Reply-To: <fb6a92b02e4d6bf96b998a47184efb55fd4f952f.camel@redhat.com>
References: <20251112121744.1356882-1-boris.brezillon@collabora.com>
 <20251112121744.1356882-2-boris.brezillon@collabora.com>
 <7cea7efb7ff0ab34ab7352158ecce731a3f714d8.camel@redhat.com>
 <20251112143104.2cabebb9@fedora>
 <0558310f433debe93dddee0b6373bcb406b8bd62.camel@redhat.com>
 <20251112151253.7cfba768@fedora>
 <fb6a92b02e4d6bf96b998a47184efb55fd4f952f.camel@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Thu, 13 Nov 2025 11:56:03 +0100
Philipp Stanner <pstanner@redhat.com> wrote:

> On Wed, 2025-11-12 at 15:12 +0100, Boris Brezillon wrote:
> > On Wed, 12 Nov 2025 14:48:51 +0100
> > Philipp Stanner <pstanner@redhat.com> wrote:
> >  =20
> > >  =20
>=20
> [=E2=80=A6]
>=20
> > > > =C2=A0  =20
> > > > >=20
> > > > > You could write a proper drm_sched API function which serves your
> > > > > usecase.=C2=A0  =20
> > > >=20
> > > > It's not really lack of support for our usecase that drives this
> > > > change, but more the fact the current helpers are racy for drivers =
that
> > > > have a 1:1 entity:sched relationship with queues that can be schedu=
led
> > > > out behind drm_gpu_scheduler's back.=C2=A0  =20
> > >=20
> > > And you also can't stop drm_sched to prevent races? =20
> >=20
> > That's the thing, I don't want to stop the drm_gpu_scheduler attached
> > to a panthor_queue, I want new jobs to be queued to the ring buffer
> > until this ring buffer is full (which is controller with the
> > ::credit_limit property), even if the group this queue belongs to is
> > not currently active on the FW side. Those jobs will get executed at
> > some later point when the group gets picked by the panthor scheduler. =
=20
>=20
> Ah, OK! Understood.
>=20
> > >=20
> > > As you know I only learned a few weeks ago about your group scheduler
> > > on top of drm_sched. I wish I had heard about it when it was
> > > implemented; we might have come up with the idea for drm_jobqueue
> > > sooner. =20
> >=20
> > Might have simplified things, I guess, but that's life, and I'm happy
> > to transition to drm_jobqueue when it's deemed ready. =20
>=20
> JQ is in Rust, potentially one day with a C ABI. So that could only
> happen if your driver's users are OK with relying on LLVM for building
> the kernel.
>=20
> BTW would be interesting for me to know to what degree that's a problem
> for common distributions and users.

That's a good question. I must admit I never thought of this because I
usually build my kernels on a full-blown distro with both llvm and gcc
installed, so I can easily pick the one I need for the task. For distro
builds that should be okay, but for {yocto,buildroot,custom}-based
build systems the transition might be painful/annoying, but I'd expect
people to move to llvm if they have to. I mean, the ultimate goal is
for Tyr to replace Panthor so we don't have to maintain two drivers, so
if that's going to be a problem, I'd rather know it now :-).
