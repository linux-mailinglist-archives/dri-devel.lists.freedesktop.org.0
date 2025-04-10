Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E87A84AD5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 19:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88F610E135;
	Thu, 10 Apr 2025 17:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JijSFDPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E06510E135;
 Thu, 10 Apr 2025 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744305660;
 bh=ZUKOIt2TPeR09xSD/SCPGuwRdPeLPJs1p/s3prVFIDw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JijSFDPQBUup+DCpgOHpzxoAJol/K3c//SY7heT+4IIhPk4H9oEQmo9UIXgdz2ahM
 wVmEYnH/1B0qqn+mUx5YDkLskj+8qKx9mMLUZuPcFYlhvTURxqYo1u4xBOI08jkoad
 ontMCw8xKPnjO39G7nnrAEEOmY68Ck4er86Fa93txC/b4HePelaPm4YnHFtUzIp4Vo
 +SOTojWcLEIyAzOzL8pVlsxHCDloAEadQ93xsJwc2SuLudzf+vmvcOw7+7WwuH9kci
 yB3p6qPlMzDg4yTUIcu8APZ5yLuDoE0CR5f2MD4VhEB0sxuxbvAtAlIOqtRYSg3eGb
 pOFpGWbvVmvJg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A974217E0808;
 Thu, 10 Apr 2025 19:20:59 +0200 (CEST)
Date: Thu, 10 Apr 2025 19:20:54 +0200
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
Message-ID: <20250410192054.24a592a5@collabora.com>
In-Reply-To: <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
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

On Thu, 10 Apr 2025 18:43:29 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Hi Boris,
>=20
> Am 10.04.25 um 17:53 schrieb Boris Brezillon:
> > Hi Christian,
> >
> > On Thu, 10 Apr 2025 17:05:07 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > =20
> >> Hi Boris,
> >>
> >> thanks for looping me in. Can you also send the full patch set to
> >> me since I don't see that on the mailing list (yet maybe).
> >>
> >> Am 10.04.25 um 16:48 schrieb Boris Brezillon: =20
> >>> +Christian, Alyssa and Faith, as suggested by Sima. I'll make
> >>> sure to Cc you on v4, but before that, I'd like to get your
> >>> opinion on the drm-gem/drm-gem-shmem changes to see if sending a
> >>> v4 is actually desirable or if I should go back to the drawing
> >>> board.
> >>>
> >>> On Fri,  4 Apr 2025 11:26:26 +0200
> >>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >>>   =20
> >>>> This patch series is a proposal for implementing sparse page
> >>>> allocations for shmem objects. It was initially motivated by a
> >>>> kind of BO managed by the Panfrost/Panthor and Lima drivers, the
> >>>> tiler heap, which grows on demand every time the GPU faults on a
> >>>> virtual address within the heap BO range.   =20
> >> Oh, wait a second! GPU faults and DMA fences are usually
> >> fundamentally incompatible.
> >>
> >> So stuff like filling in GEM objects on demand like you suggest
> >> here is usually seen as illegal. All resources must be pre-pinned
> >> before the submission. =20
> > Unfortunately, that's already how it's done in lima, panfrost and
> > panthor.
> > =20
> >> Faulting is only legal when you have something like HMM, SVM or
> >> whatever you call it. And then you can just use a plain shmem
> >> object to provide you with backing pages.
> >>
> >> I mean we could in theory allow faulting on GEM objects as well,
> >> but we would need to take very strict precautions on that we
> >> currently don't have as far as I know. =20
> > We only use this mechanism for very specific allocations: tiler
> > memory whose maximum size can't be guessed upfront because tile
> > binning is by nature unpredictible.
> > =20
> >> So could you explain how this works in the first place? =20
> > I can explain you how this works in Panthor, yes. You get an initial
> > amount of memory that the tiler can use, when it runs out of
> > memory, it will first ask the system for more memory, if the
> > allocation fails, it will fallback to what they call "incremental
> > rendering", where the already binned primitives are flushed to the
> > FB in order to free memory, and the rendering starts over from
> > there, with the memory that has been freed.
> >
> > In Panthor, this on-demand allocation scheme is something that
> > allows us to speed-up rendering when there's memory available, but
> > we can make progress when that's not the case, hence the failable
> > allocation scheme I'm proposing here. =20
>=20
> Puh, that sounds like it can potentially work but is also very very
> fragile.
>=20
> You must have a code comment when you select the GFP flags how and
> why that works.

+	/* We want non-blocking allocations, if we're OOM, we just fail the job
+	 * to unblock things.
+	 */
+	ret =3D drm_gem_shmem_sparse_populate_range(&bo->base, page_offset,
+						  NUM_FAULT_PAGES, page_gfp,
+						  __GFP_NORETRY | __GFP_NOWARN);

That's what I have right now in the failable allocation path. The
tiler chunk allocation uses the same flags, but doesn't have a
comment explaining that a fallback exists when the allocation fails.

>=20
> > In Panfrost and Lima, we don't have this concept of "incremental
> > rendering", so when we fail the allocation, we just fail the GPU job
> > with an unhandled GPU fault. =20
>=20
> To be honest I think that this is enough to mark those two drivers as
> broken.=C2=A0 It's documented that this approach is a no-go for upstream
> drivers.
>=20
> How widely is that used?

It exists in lima and panfrost, and I wouldn't be surprised if a similar
mechanism was used in other drivers for tiler-based GPUs (etnaviv,
freedreno, powervr, ...), because ultimately that's how tilers work:
the amount of memory needed to store per-tile primitives (and metadata)
depends on what the geometry pipeline feeds the tiler with, and that
can't be predicted. If you over-provision, that's memory the system won't
be able to use while rendering takes place, even though only a small
portion might actually be used by the GPU. If your allocation is too
small, it will either trigger a GPU fault (for HW not supporting an
"incremental rendering" mode) or under-perform (because flushing
primitives has a huge cost on tilers).

Calling these drivers broken without having a plan to fix them is
also not option.

>=20
> > And that's how it is today, the
> > alloc-on-fault mechanism is being used in at least 3 drivers, and
> > all I'm trying to do here is standardize it and try to document the
> > constraints that comes with this model, constraint that are
> > currently being ignored. Like the fact allocations in the fault
> > handler path shouldn't block so we're guaranteed to signal the job
> > fence in finite time, and we don't risk a deadlock between the
> > driver shrinker and the job triggering the fault. =20
>=20
> Well on one hand it's good to that we document the pitfalls, but I
> clearly think that we should *not* spread that into common code.

Ack on not encouraging people to use that; but having a clear path
describing how this should be done for HW that don't have other
options, with helpers and extensive doc is IMHO better than letting
new drivers reproduce the mistake that were done in the past.
Because, if you tell people "don't do that", but don't have an
alternative to propose, they'll end up doing it anyway.

>=20
> That would give the impression that this actually works and to be
> honest I should start to charge money to rejecting stuff like that.
> It would probably get me rich.
>=20
> > I'm well aware of the implications of what I'm proposing here, but
> > ignoring the fact some drivers already violate the rules don't make
> > them disappear. So I'd rather work with you and others to clearly
> > state what the alloc-in-fault-path rules are, and enforce them in
> > some helper functions, than pretend these ugly things don't exist.
> > :D =20
>=20
> Yeah, but this kind of says to others it's ok to do this which
> clearly isn't as far as I can see.

Not really. At least not if we properly review any driver that use
these APIs, and clearly state in the doc that this is provided as a
last resort for HW that can't do without on-fault-allocation, because
they are designed to work this way.

>=20
> What we should do instead is to add this as not ok approaches to the
> documentation and move on.

Well, that's what happened with panfrost, lima and panthor, and see
where we are now: 3 drivers that you consider broken (probably
rightfully), and more to come if we don't come up with a plan for HW
that have the same requirements (as I said, I wouldn't be surprised
if most tilers were relying on the same kind of on-demand-allocation).

As always, I appreciate your valuable inputs, and would be happy to
try anything you think might be more adapted than what is proposed
here, but saying "this is broken HW/driver, so let's ignore it" is
not really an option, at least if you don't want the bad design
pattern to spread.

Regards,

Boris
