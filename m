Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943796700E
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 09:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EA810E0B5;
	Sat, 31 Aug 2024 07:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ljrNGhEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2631410E0B5
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 07:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725089140;
 bh=09djdujbWKVDQrmyLHfHz4jZjXTKK3GsiUmETeJGLLA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ljrNGhEaGi1s7rFKRX2VZCXW9nVqWO7KOix9+fWaaJyfANbzdoaQrkb3KRbHpfuv5
 uURAjZNzf9Z18OuOo6ODdahFi6bhFFwzkOZx/CKRmTe8y4kuh2N2mg2NmCyvMaM2iq
 jhV08YhNmmfyOO9DugRzxUK13/JLhYULYl4/fxhh8FSkJ7xUi39YxRMX+lifz5IeYh
 6ji8PX5UqMEemUOo2bBsxYHivj2YOu6YXZsWOOOOeFzN3N3DRvpulg6TRmT3Skdrw6
 4CSRzCy/hDpfboVvBAu82SE+pcYy93sActV8mymzfUmAnegpqdrApvIBng8qvXY31Q
 SAS8EZ2m3sM/A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EB2B017E0F78;
 Sat, 31 Aug 2024 09:25:39 +0200 (CEST)
Date: Sat, 31 Aug 2024 09:25:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, <kernel@collabora.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Message-ID: <20240831092535.3ae06c19@collabora.com>
In-Reply-To: <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
 <ZtI9EMzHZW3DkHw/@DUT025-TGLU.fm.intel.com>
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

On Fri, 30 Aug 2024 21:43:44 +0000
Matthew Brost <matthew.brost@intel.com> wrote:

> On Fri, Aug 30, 2024 at 10:14:18AM +0200, Christian K=C3=B6nig wrote:
> > Am 29.08.24 um 19:12 schrieb Boris Brezillon: =20
> > > dma_fence objects created by an entity might outlive the
> > > drm_gpu_scheduler this entity was bound to if those fences are retain=
ed
> > > by other other objects, like a dma_buf resv. This means that
> > > drm_sched_fence::sched might be invalid when the resv is walked, which
> > > in turn leads to a UAF when dma_fence_ops::get_timeline_name() is cal=
led.
> > >=20
> > > This probably went unnoticed so far, because the drm_gpu_scheduler had
> > > the lifetime of the drm_device, so, unless you were removing the devi=
ce,
> > > there were no reasons for the scheduler to be gone before its fences.=
 =20
> >=20
> > Nope, that is intentional design. get_timeline_name() is not safe to be
> > called after the fence signaled because that would causes circular
> > dependency problems.
> > =20
>=20
> I'm quite sure happens, ftrace for example can and will call
> get_timeline_name in trace_dma_fence_destroy which is certainly after
> the fence is signaled. There are likely other cases too - this just
> quickly came to mind.
> =20
> > E.g. when you have hardware fences it can happen that fences reference a
> > driver module (for the function printing the name) and the module in tu=
rn
> > keeps fences around.
> >  =20
>=20
> I am almost positive without this patch this problematic in Xe or any
> driver in which schedulers are tied to IOCTLs rather than kernel module.
>=20
> In Xe 'fence->sched' maps to an xe_exec_queue which can be freed once
> the destroy exec queue IOCTL is called and all jobs are free'd (i.e.
> 'fence' signals). The fence could be live on after in dma-resv objects,
> drm syncobjs, etc...
>=20
> I know this issue has been raised before and basically NACK'd but I have
> a strong opinion this is valid and in fact required.

IIUC, Christian recognized that it's more problematic now that
schedulers lifetime is no longer bound to the device lifetime but
instead the GPU context lifetime. So I think we all agree that this
needs fixing :-).

How about I send a v2 of this patch, as it seems Christian was more or
less happy with the approach, baring the allocation scheme. And then
we can discuss how we want to fix the module-unload issue.
