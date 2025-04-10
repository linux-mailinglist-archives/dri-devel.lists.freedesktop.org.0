Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83ACA848A9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 17:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1359B10E12A;
	Thu, 10 Apr 2025 15:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Jxfr2/bx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C3C10E9F4;
 Thu, 10 Apr 2025 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744300435;
 bh=dY0taw0RnXFQe9UsxwFvQx4o/KJDdCaYJwmn/1Z0das=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jxfr2/bxV/G+j2Cav1iotZ+MQ9fEQHfsxBmI9VosKVHPmGAuGj5fYVYUYf6z3R5TR
 KVXNJlvmdbachkoBffcaImGOmrnPKt5SgwJWLK6jiA1TY016pOG2KaZdvbq3RpMFN8
 BcpjxVvfPj4/bKH7+GDSE/mQRtaCrBbKQDT0iKf0ra7FzHhVXg9JpHUmNTyWlDM02+
 gs286jTM4sGnunhSKMo+NkNE7Nr9l4CS9DluYN5oKcs35uNtKNYD33/hjreGCcmgtH
 cbHpJNj/u7f/k64gajE6p61Wuj1d0ApexgHPpL4fxuNZsZL01ByzVTZZLE+jamk291
 jBOUqT4o2/P4Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B19F17E0904;
 Thu, 10 Apr 2025 17:53:54 +0200 (CEST)
Date: Thu, 10 Apr 2025 17:53:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Faith Ekstrand
 <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <20250410175349.6bf6a4ea@collabora.com>
In-Reply-To: <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
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

Hi Christian,

On Thu, 10 Apr 2025 17:05:07 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Hi Boris,
>=20
> thanks for looping me in. Can you also send the full patch set to me sinc=
e I don't see that on the mailing list (yet maybe).
>=20
> Am 10.04.25 um 16:48 schrieb Boris Brezillon:
> > +Christian, Alyssa and Faith, as suggested by Sima. I'll make sure to
> > Cc you on v4, but before that, I'd like to get your opinion on the
> > drm-gem/drm-gem-shmem changes to see if sending a v4 is actually
> > desirable or if I should go back to the drawing board.
> >
> > On Fri,  4 Apr 2025 11:26:26 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > =20
> >> This patch series is a proposal for implementing sparse page allocatio=
ns
> >> for shmem objects. It was initially motivated by a kind of BO managed =
by
> >> the Panfrost/Panthor and Lima drivers, the tiler heap, which grows on
> >> demand every time the GPU faults on a virtual address within the heap =
BO
> >> range. =20
>=20
> Oh, wait a second! GPU faults and DMA fences are usually fundamentally in=
compatible.
>=20
> So stuff like filling in GEM objects on demand like you suggest here is u=
sually seen as illegal. All resources must be pre-pinned before the submiss=
ion.

Unfortunately, that's already how it's done in lima, panfrost and
panthor.

>=20
> Faulting is only legal when you have something like HMM, SVM or whatever =
you call it. And then you can just use a plain shmem object to provide you =
with backing pages.
>=20
> I mean we could in theory allow faulting on GEM objects as well, but we w=
ould need to take very strict precautions on that we currently don't have a=
s far as I know.

We only use this mechanism for very specific allocations: tiler memory
whose maximum size can't be guessed upfront because tile binning is by
nature unpredictible.

>=20
> So could you explain how this works in the first place?

I can explain you how this works in Panthor, yes. You get an initial
amount of memory that the tiler can use, when it runs out of memory, it
will first ask the system for more memory, if the allocation fails, it
will fallback to what they call "incremental rendering", where the
already binned primitives are flushed to the FB in order to free memory,
and the rendering starts over from there, with the memory that has been
freed.

In Panthor, this on-demand allocation scheme is something that allows
us to speed-up rendering when there's memory available, but we can make
progress when that's not the case, hence the failable allocation scheme
I'm proposing here.

In Panfrost and Lima, we don't have this concept of "incremental
rendering", so when we fail the allocation, we just fail the GPU job
with an unhandled GPU fault. And that's how it is today, the
alloc-on-fault mechanism is being used in at least 3 drivers, and all
I'm trying to do here is standardize it and try to document the
constraints that comes with this model, constraint that are currently
being ignored. Like the fact allocations in the fault handler path
shouldn't block so we're guaranteed to signal the job fence in finite
time, and we don't risk a deadlock between the driver shrinker and the
job triggering the fault.

I'm well aware of the implications of what I'm proposing here, but
ignoring the fact some drivers already violate the rules don't make them
disappear. So I'd rather work with you and others to clearly state what
the alloc-in-fault-path rules are, and enforce them in some helper
functions, than pretend these ugly things don't exist. :D

Regards,

Boris
