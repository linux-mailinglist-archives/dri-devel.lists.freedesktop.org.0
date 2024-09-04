Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620E696BA46
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 13:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7043710E765;
	Wed,  4 Sep 2024 11:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LfZnuDM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF34410E765
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725448993;
 bh=LWcupDb/szoL2F6j/H+ldLsPINpu0oFbCPpV0VYTUVQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LfZnuDM3hzp9GmKkwYVU+5dKoaaiQRmBi1pNQhPpiMxJIC9bmYsgR8QrymmbztOfg
 3gaMapqKJABuslOTjgWMUHoZRbhId0AfRfSPNeRJ0lYhMmrBpOxJtBRT/OnvYQTqJg
 DAseDjGz4hW39YnKs32Tusk/E9un/Mg0OlnpQwm2pXB6iS1S3tf4kl2QvKG/ycbxUg
 z44Le0Uey8or9LqJIdo7QUZyLD6H0mmSW/HoFgyKulspezCk/4yErzha8YsR8blcmD
 kT6uZFh4UGcz0gSR82DQPj74kpuSMCsaIv5dmFNvjGxaxvdEjZW7+m5hD5i0tskwcM
 XnJW8UmWuQ0ag==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E964217E0FD3;
 Wed,  4 Sep 2024 13:23:12 +0200 (CEST)
Date: Wed, 4 Sep 2024 13:23:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Mihail
 Atanassov <mihail.atanassov@arm.com>, linux-kernel@vger.kernel.org, Liviu
 Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, Shashank Sharma <shashank.sharma@amd.com>, Ketil
 Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
Message-ID: <20240904132308.7664902e@collabora.com>
In-Reply-To: <80ffea9b-63a6-4ae2-8a32-2db051bd7f28@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
 <090ae980-a944-4c00-a26e-d95434414417@amd.com>
 <80ffea9b-63a6-4ae2-8a32-2db051bd7f28@arm.com>
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

On Wed, 4 Sep 2024 10:31:36 +0100
Steven Price <steven.price@arm.com> wrote:

> On 04/09/2024 08:49, Christian K=C3=B6nig wrote:
> > Am 03.09.24 um 23:11 schrieb Simona Vetter: =20
> >> On Tue, Sep 03, 2024 at 03:46:43PM +0200, Christian K=C3=B6nig wrote: =
=20
> >>> Hi Steven,
> >>>
> >>> Am 29.08.24 um 15:37 schrieb Steven Price: =20
> >>>> Hi Christian,
> >>>>
> >>>> Mihail should be able to give more definitive answers, but I think I
> >>>> can
> >>>> answer your questions.
> >>>>
> >>>> On 29/08/2024 10:40, Christian K=C3=B6nig wrote: =20
> >>>>> Am 28.08.24 um 19:25 schrieb Mihail Atanassov: =20
> >>>>>> Hello all,
> >>>>>>
> >>>>>> This series implements a mechanism to expose Mali CSF GPUs' queue
> >>>>>> ringbuffers directly to userspace, along with paraphernalia to all=
ow
> >>>>>> userspace to control job synchronisation between the CPU and GPU.
> >>>>>>
> >>>>>> The goal of these changes is to allow userspace to control work
> >>>>>> submission to the FW/HW directly without kernel intervention in the
> >>>>>> common case, thereby reducing context switching overhead. It also
> >>>>>> allows
> >>>>>> for greater flexibility in the way work is enqueued in the ringbuf=
s.
> >>>>>> For example, the current kernel submit path only supports indirect
> >>>>>> calls, which is inefficient for small command buffers. Userspace c=
an
> >>>>>> also skip unnecessary sync operations. =20
> >>>>> Question is how do you guarantee forward progress for fence signali=
ng? =20
> >>>> A timeout. Although looking at it I think it's probably set too high
> >>>> currently:
> >>>> =20
> >>>>> +#define JOB_TIMEOUT_MS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5000 =20
> >>>> But basically the XGS queue is a DRM scheduler just like a normal GPU
> >>>> queue and the jobs have a timeout. If the timeout is hit then any
> >>>> fences
> >>>> will be signalled (with an error). =20
> >>> Mhm, that is unfortunately exactly what I feared.
> >>> =20
> >>>>> E.g. when are fences created and published? How do they signal?
> >>>>>
> >>>>> How are dependencies handled? How can the kernel suspend an userspa=
ce
> >>>>> queue? =20
> >>>> The actual userspace queue can be suspended. This is actually a
> >>>> combination of firmware and kernel driver, and this functionality is
> >>>> already present without the user submission. The firmware will
> >>>> multiplex
> >>>> multiple 'groups' onto the hardware, and if there are too many for t=
he
> >>>> firmware then the kernel multiplexes the extra groups onto the ones =
the
> >>>> firmware supports. =20
> >>> How do you guarantee forward progress and that resuming of suspended
> >>> queues
> >>> doesn't end up in a circle dependency? =20
>=20
> I'm not entirely sure what you mean by "guarantee" here - the kernel by
> itself only guarantees forward progress by the means of timeouts. User
> space can 'easily' shoot itself in the foot by using a XGS queue to
> block waiting on a GPU event which will never happen.
>=20
> However dependencies between applications (and/or other device drivers)
> will only occur via dma fences and an unsignalled fence will only be
> returned when there is a path forward to signal it. So it shouldn't be
> possible to create a dependency loop between contexts (or command stream
> groups to use the Mali jargon).
>=20
> Because the groups can't have dependency cycles it should be possible to
> suspend/resume them without deadlocks.
>=20
> >>>> I haven't studied Mihail's series in detail yet, but if I understand
> >>>> correctly, the XGS queues are handled separately and are not suspend=
ed
> >>>> when the hardware queues are suspended. I guess this might be an area
> >>>> for improvement and might explain the currently very high timeout (to
> >>>> deal with the case where the actual GPU work has been suspended).
> >>>> =20
> >>>>> How does memory management work in this case? =20
> >>>> I'm not entirely sure what you mean here. If you are referring to the
> >>>> potential memory issues with signalling path then this should be
> >>>> handled
> >>>> by the timeout - although I haven't studied the code to check for
> >>>> bugs here. =20
> >>> You might have misunderstood my question (and I might misunderstand t=
he
> >>> code), but on first glance it strongly sounds like the current
> >>> approach will
> >>> be NAKed.
> >>> =20
> >>>> The actual new XGS queues don't allocate/free memory during the queue
> >>>> execution - so it's just the memory usage related to fences (and the
> >>>> other work which could be blocked on the fence). =20
> >>> But the kernel and the hardware could suspend the queues, right?
> >>> =20
> >>>> In terms of memory management for the GPU work itself, this is handl=
ed
> >>>> the same as before. The VM_BIND mechanism allows dependencies to be
> >>>> created between syncobjs and VM operations, with XGS these can then =
be
> >>>> tied to GPU HW events. =20
> >>> I don't know the details, but that again strongly sounds like that wo=
n't
> >>> work.
> >>>
> >>> What you need is to somehow guarantee that work doesn't run into memo=
ry
> >>> management deadlocks which are resolved by timeouts.
> >>>
> >>> Please read up here on why that stuff isn't allowed:
> >>> https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefi=
nite-dma-fences =20
> >> panthor doesn't yet have a shrinker, so all memory is pinned, which me=
ans
> >> memory management easy mode. =20
> >=20
> > Ok, that at least makes things work for the moment. =20
>=20
> Ah, perhaps this should have been spelt out more clearly ;)
>=20
> The VM_BIND mechanism that's already in place jumps through some hoops
> to ensure that memory is preallocated when the memory operations are
> enqueued. So any memory required should have been allocated before any
> sync object is returned. We're aware of the issue with memory
> allocations on the signalling path and trying to ensure that we don't
> have that.
>=20
> I'm hoping that we don't need a shrinker which deals with (active) GPU
> memory with our design.

That's actually what we were planning to do: the panthor shrinker was
about to rely on fences attached to GEM objects to know if it can
reclaim the memory. This design relies on each job attaching its fence
to the GEM mapped to the VM at the time the job is submitted, such that
memory that's in-use or about-to-be-used doesn't vanish before the GPU
is done.

> Memory which user space thinks the GPU might
> need should be pinned before the GPU work is submitted. APIs which
> require any form of 'paging in' of data would need to be implemented by
> the GPU work completing and being resubmitted by user space after the
> memory changes (i.e. there could be a DMA fence pending on the GPU work).

Hard pinning memory could work (ioctl() around gem_pin/unpin()), but
that means we can't really transparently swap out GPU memory, or we
have to constantly pin/unpin around each job, which means even more
ioctl()s than we have now. Another option would be to add the XGS fence
to the BOs attached to the VM, assuming it's created before the job
submission itself, but you're no longer reducing the number of user <->
kernel round trips if you do that, because you now have to create an
XSG job for each submission, so you basically get back to one ioctl()
per submission.
