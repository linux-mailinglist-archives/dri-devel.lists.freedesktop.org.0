Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595AAA79E7E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 10:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D4B10E1B6;
	Thu,  3 Apr 2025 08:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WkGC/YVm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C778210E1B6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743670258;
 bh=VgJDFMUf0CnbGGng+slbh+GbKi51Jb9EAss+E3HtLCg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WkGC/YVmhvTAqNlr0Nur8sXSEX30OjNp9f0+9KFvLZjHFhq8jDeMn6Jl1/RQB9Tyf
 OXG8f18ipCqzmwTqSenogvbzM3qXxTMX/CujQJsR/olm/sPMYF8JSG0eiRQThfGv7K
 5afvJvu/cDnNo5cN6sgmnReT6FuGXYyFULUgfnrmdgR879CuWoWwdvPXs7t6ifcmnp
 8zPRhHvmNxB/HkCq6/6BA/cWElopLfZkJ4WBNFVUHLS7hBGVw1P6x2XWhwLLrkeu2h
 nUguuyYwLG77/AeBegAgaB5AnElOFBZSPSYZRqlQ9wDVOtQvs1BHbGZC0409e8J3Yd
 8OW8hmrEqIipg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 28D9217E00A3;
 Thu,  3 Apr 2025 10:50:58 +0200 (CEST)
Date: Thu, 3 Apr 2025 10:50:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>, Steven Price
 <steven.price@arm.com>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v20 09/10] drm/shmem-helper: Switch
 drm_gem_shmem_vmap/vunmap to use pin/unpin
Message-ID: <20250403105053.788b0f6e@collabora.com>
In-Reply-To: <a8ed4b8b-5116-4ac2-bfce-21b2751f7377@suse.de>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-10-dmitry.osipenko@collabora.com>
 <ea4f4059-7748-4bfd-9205-8e95222144da@suse.de>
 <710cdbd4-2c6e-48b7-b12b-972ab6d12abf@collabora.com>
 <20250402152102.01d9cfee@collabora.com>
 <a8ed4b8b-5116-4ac2-bfce-21b2751f7377@suse.de>
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

On Thu, 3 Apr 2025 09:20:00 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 02.04.25 um 15:21 schrieb Boris Brezillon:
> > On Wed, 2 Apr 2025 15:58:55 +0300
> > Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> > =20
> >> On 4/2/25 15:47, Thomas Zimmermann wrote: =20
> >>> Hi
> >>>
> >>> Am 22.03.25 um 22:26 schrieb Dmitry Osipenko: =20
> >>>> The vmapped pages shall be pinned in memory and previously get/
> >>>> put_pages()
> >>>> were implicitly hard-pinning/unpinning the pages. This will no longe=
r be
> >>>> the case with addition of memory shrinker because pages_use_count > 0
> >>>> won't
> >>>> determine anymore whether pages are hard-pinned (they will be soft-
> >>>> pinned),
> >>>> while the new pages_pin_count will do the hard-pinning. Switch the
> >>>> vmap/vunmap() to use pin/unpin() functions in a preparation of addit=
ion
> >>>> of the memory shrinker support to drm-shmem. =20
> >>> I've meanwhile rediscovered this patch and I'm sure this is not corre=
ct.
> >>> Vmap should not pin AFAIK. It is possible to vmap if the buffer has b=
een
> >>> pinned, but that's not automatic.=C2=A0 For other vmaps it is necessa=
ry to
> >>> hold the reservation lock to prevent the buffer from moving. =20
> > Hm, is this problematic though? If you want to vmap() inside a section
> > that's protected by the resv lock, you can
> >
> > - drm_gem_shmem_vmap_locked()
> > - do whatever you need to do with the vaddr,
> > - drm_gem_shmem_vunmap_locked()
> >
> > and the {pin,page_use}_count will be back to their original values.
> > Those are just ref counters, and I doubt the overhead of
> > incrementing/decrementing them makes a difference compared to the heavy
> > page-allocation/vmap operations... =20
>=20
> I once tried to add pin as part of vmap, so that pages stay in place.=20
> Christian was very clear about not doing this. I found this made a lot=20
> of sense: vmap means "make the memory available to the CPU". The memory=20
> location doesn't matter much here. Pin means something like "make the=20
> memory available to the GPU". But which GPU depends on the caller: calls=
=20
> via GEM refer to the local GPU, calls via dma-buf usually refer to the=20
> importer's GPU. That GPU uncertainty makes pin problematic already.

Okay, so it looks more like a naming issue then. The intent here is to
make sure the page array doesn't disappear while we have a kernel
mapping active (address returned by vmap()). The reason we went from
pages_count to pages_use_count+pin_count is because we have two kind of
references in drm_gem_shmem:

- weak references (tracked with pages_use_count). Those are
  usually held by GPU VMs, and they are weak in the sense they
  shouldn't prevent the shrinker to reclaim them if the GPU VM is idle.
  The other user of weak references is userspace mappings of GEM
  objects (mmap()), because then we can repopulate those with our fault
  handler.
- hard references (tracked with pin_count) which are used to prevent
  the shrinker from even considering the GEM as reclaimable. And clearly
  kernel mappings fall in that case, because otherwise we could reclaim
  pages that might be dereferenced by the CPU later on. It's also used
  to implement drm_gem_pin because it's the same mechanism really,
  hence the name

>=20
> In your case, vmap an pin both intent to hold the shmem pages in memory.=
=20
> They might be build on top of the same implementation, but one should=20
> not be implemented with the other because of their different meanings.

But that's not what we do, is it? Sure, in drm_gem_shmem_vmap_locked(),
we call drm_gem_shmem_pin_locked(), but that's an internal function to
make sure the pages are allocated and stay around until
drm_gem_shmem_vunmap_locked() is called.

I guess we could rename pin_count into hard_refcount or
page_residency_count or xxx_count, and change the pin/unpin_locked()
function names accordingly, but that's just a naming detail, it doesn't
force you to call drm_gem_pin() to vmap() your GEM, it's something we
do internally.

>=20
> More generally speaking, I've meanwhile come to the conclusion that pin=20
> should not even exist in the GEM interface. It's an internal operation=20
> of TTM and reveals too much about what happens within the=20
> implementation. Instead GEM should be free to move buffers around.

Well, yes and no. There are situations where you simply can't move
things around if there are active users, and vmap() is one of those
AFAICT.
=20
> Dma-buf importers should only tell exporters to make buffers available=20
> to them, but not how to do this. AFAIK that's what dma-buf's=20
> attach/detach is for.

And that's what they do, no? attach() tells the exporter to give the
importer a way to access those buffers, and given the exporter has no
clue about when/how the exporter will access those, there's no other way
but to pin the pages. Am I missing something here?
