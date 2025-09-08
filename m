Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47836B484D4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094DC10E06E;
	Mon,  8 Sep 2025 07:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jh/FZUGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03CA10E06E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 07:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757315506;
 bh=Of78UZh64IZN2D+3zi6NAhV8bopsYtrVBUXbZLFLOuw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jh/FZUGBFSm7nf8WfKZUADT/s3C4xpz4FcYbhkkvkyB2kuBQH7o8PBPNfJvOXWW+S
 lhREUPWp1BucMpHD8aNW2KjUXCJi8skCE6Gu3C/hYRipR84Cjn3gMIWgMtI5oAMlfU
 Yh3cd5qp9Eply6j5U/6+EmMW8dVeZcqguZ9GYou1Vwt7yE687sbsSrWlvhuNF0XMAU
 MJgIoD8nZUfWks1mdxBFs9EUzdMnDqIeBTM6zBY57NHtaqkdGqEHXyjyyj8GWDpdhx
 9hu5BO96NTBSWO879cHcC282K7VmRoYwkFL/+RxEDTb1OJ50/80SCrpD6Rp4K13bx8
 NsLxbWVkv66rg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 92FFD17E0100;
 Mon,  8 Sep 2025 09:11:45 +0200 (CEST)
Date: Mon, 8 Sep 2025 09:11:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?="
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Liviu Dudau
 <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
Message-ID: <20250908091140.44856fde@fedora>
In-Reply-To: <aL1u_YxOkuj1kIq6@google.com>
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org>
 <aL1pSFB9iBsfHFM_@google.com>
 <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org>
 <aL1u_YxOkuj1kIq6@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

Hi Alice,

On Sun, 7 Sep 2025 11:39:41 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Sun, Sep 07, 2025 at 01:28:05PM +0200, Danilo Krummrich wrote:
> > On Sun Sep 7, 2025 at 1:15 PM CEST, Alice Ryhl wrote: =20
> > > On Sat, Sep 06, 2025 at 12:47:36AM +0200, Danilo Krummrich wrote: =20
> > >> On Fri Sep 5, 2025 at 8:18 PM CEST, Alice Ryhl wrote: =20
> > >> > On Fri, Sep 5, 2025 at 3:25=E2=80=AFPM Boris Brezillon
> > >> > <boris.brezillon@collabora.com> wrote: =20
> > >> >> On Fri, 05 Sep 2025 12:11:28 +0000
> > >> >> Alice Ryhl <aliceryhl@google.com> wrote: =20
> > >> >> > +static bool
> > >> >> > +drm_gpuvm_bo_is_dead(struct drm_gpuvm_bo *vm_bo)
> > >> >> > +{
> > >> >> > +     return !kref_read(&vm_bo->kref); =20
> > >> >>
> > >> >> I'm not too sure I like the idea of [ab]using vm_bo::kref to defe=
r the
> > >> >> vm_bo release. I get why it's done like that, but I'm wondering w=
hy we
> > >> >> don't defer the release of drm_gpuva objects instead (which is re=
ally
> > >> >> what's being released in va_unlink()). I can imagine drivers want=
ing to
> > >> >> attach resources to the gpuva that can't be released in the
> > >> >> dma-signalling path in the future, and if we're doing that at the=
 gpuva
> > >> >> level, we also get rid of this kref dance, since the va will hold=
 a
> > >> >> vm_bo ref until it's destroyed.
> > >> >>
> > >> >> Any particular reason you went for vm_bo destruction deferral ins=
tead
> > >> >> of gpuva? =20
> > >> >
> > >> > All of the things that were unsafe to release in the signalling pa=
th
> > >> > were tied to the vm_bo, so that is why I went for vm_bo cleanup.
> > >> > Another advantage is that it lets us use the same deferred logic f=
or
> > >> > the vm_bo_put() call that drops the refcount from vm_bo_obtain().
> > >> >
> > >> > Of course if gpuvas might have resources that need deferred cleanu=
p,
> > >> > that might change the situation somewhat. =20
> > >>=20
> > >> I think we want to track PT(E) allocations, or rather reference coun=
ts of page
> > >> table structures carried by the drm_gpuva, but we don't need to rele=
ase them on
> > >> drm_gpuva_unlink(), which is where we drop the reference count of th=
e vm_bo.
> > >>=20
> > >> Deferring drm_gpuva_unlink() isn't really an option I think, the GEM=
s list of
> > >> VM_BOs and the VM_BOs list of VAs is usually used in ttm_device_func=
s::move to
> > >> map or unmap all VAs associated with a GEM object.
> > >>=20
> > >> I think PT(E) reference counts etc. should be rather released when t=
he drm_gpuva
> > >> is freed, i.e. page table allocations can be bound to the lifetime o=
f a
> > >> drm_gpuva. Given that, I think that eventually we'll need a cleanup =
list for
> > >> those as well, since once they're removed from the VM tree (in the f=
ence
> > >> signalling critical path), we loose access otherwise. =20
> > >
> > > Hmm. Another more conceptual issue with deferring gpuva is that
> > > "immediate mode" is defined as having the GPUVM match the GPU's actual
> > > address space at all times, which deferred gpuva cleanup would go
> > > against. =20
> >=20
> > Depends on what "deferred gpuva cleanup" means.
> >=20
> > What needs to happen in the run_job() is drm_gpuva_unlink() and
> > drm_gpuva_unmap(). Freeing the drm_gpuva, inluding releasing the assoic=
iated
> > driver specific resources, can be deferred. =20
>=20
> Yeah I guess we could have unlink remove the gpuva, but then allow the
> end-user to attach the gpuva to a list of gpuvas to kfree deferred. That
> way, the drm_gpuva_unlink() is not deferred but any resources it has can
> be.

This ^.

>=20
> Of course, this approach also makes deferred gpuva cleanup somewhat
> orthogonal to this patch.

Well, yes and no, because if you go for gpuva deferred cleanup, you
don't really need the fancy kref_put() you have in this patch, it's
just a regular vm_bo_put() that's called in the deferred gpuva path on
the vm_bo attached to the gpuva being released.

>=20
> One annoying part is that we don't have an gpuvm ops operation for
> freeing gpuva, and if we add one for this, it would *only* be used in
> this case as most drivers explicitly kfree gpuvas, which could be
> confusing for end-users.

Also not sure ::vm_bo_free() was meant to be used like that. It was for
drivers that need to control the drm_gpuvm_bo allocation, not those
that rely on the default implementation (kmalloc). Given how things
are described in the the doc, it feels weird to have a ::vm_bo_free()
without ::vm_bo_alloc(). So, if we decide to go this way (which I'm
still not convinced we should, given ultimately we might want to defer
gpuvas cleanup), the ::vm_bo_free() doc should be extended to cover
this 'deferred vm_bo free' case.

Regards,

Boris
