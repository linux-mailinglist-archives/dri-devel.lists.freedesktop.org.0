Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF99B48504
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F3F10E0DD;
	Mon,  8 Sep 2025 07:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BnjigNer";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65AB10E0DD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 07:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757316180;
 bh=ugfEoFNVZ3M9cpY/KPFcs/OdZTpdktA2anS+m2lC/eE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BnjigNerhf825KePWSmw4ZrB1RUwwXRhPhXLFpasUGLRKSfFQ8YztAHL8ZtXODqCU
 Hc6XejPetq/PIh2e+phUxABmrwboV0RV4DRJYqhrkrj8rdy2SNj4Q22b5akl7hNsEy
 KJAasrn222OOussuMeuTr4GGnxlVwzFb97rejCs3qoPtYpwcsi4VD5ymPvmd9AXHPK
 9XMjhR+ZUsXJifxCgzdIKiVxl5NYF0CjbDceDCkHYJMQ5TeT7cJc20PjjoXPJNqxp+
 dG/MAO/SV/DGjIvdNbyIOaisbfWjiXGKxX1Un4CyB2EGfXxa6v3E7hxYH9Il7y3Ob7
 mebiwGlHHvR1w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9847717E0A2B;
 Mon,  8 Sep 2025 09:22:59 +0200 (CEST)
Date: Mon, 8 Sep 2025 09:22:53 +0200
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
Message-ID: <20250908092253.52cd4df0@fedora>
In-Reply-To: <aL1pSFB9iBsfHFM_@google.com>
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org>
 <aL1pSFB9iBsfHFM_@google.com>
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

On Sun, 7 Sep 2025 11:15:20 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Sat, Sep 06, 2025 at 12:47:36AM +0200, Danilo Krummrich wrote:
> > On Fri Sep 5, 2025 at 8:18 PM CEST, Alice Ryhl wrote: =20
> > > On Fri, Sep 5, 2025 at 3:25=E2=80=AFPM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote: =20
> > >> On Fri, 05 Sep 2025 12:11:28 +0000
> > >> Alice Ryhl <aliceryhl@google.com> wrote: =20
> > >> > +static bool
> > >> > +drm_gpuvm_bo_is_dead(struct drm_gpuvm_bo *vm_bo)
> > >> > +{
> > >> > +     return !kref_read(&vm_bo->kref); =20
> > >>
> > >> I'm not too sure I like the idea of [ab]using vm_bo::kref to defer t=
he
> > >> vm_bo release. I get why it's done like that, but I'm wondering why =
we
> > >> don't defer the release of drm_gpuva objects instead (which is really
> > >> what's being released in va_unlink()). I can imagine drivers wanting=
 to
> > >> attach resources to the gpuva that can't be released in the
> > >> dma-signalling path in the future, and if we're doing that at the gp=
uva
> > >> level, we also get rid of this kref dance, since the va will hold a
> > >> vm_bo ref until it's destroyed.
> > >>
> > >> Any particular reason you went for vm_bo destruction deferral instead
> > >> of gpuva? =20
> > >
> > > All of the things that were unsafe to release in the signalling path
> > > were tied to the vm_bo, so that is why I went for vm_bo cleanup.
> > > Another advantage is that it lets us use the same deferred logic for
> > > the vm_bo_put() call that drops the refcount from vm_bo_obtain().
> > >
> > > Of course if gpuvas might have resources that need deferred cleanup,
> > > that might change the situation somewhat. =20
> >=20
> > I think we want to track PT(E) allocations, or rather reference counts =
of page
> > table structures carried by the drm_gpuva, but we don't need to release=
 them on
> > drm_gpuva_unlink(), which is where we drop the reference count of the v=
m_bo.
> >=20
> > Deferring drm_gpuva_unlink() isn't really an option I think, the GEMs l=
ist of
> > VM_BOs and the VM_BOs list of VAs is usually used in ttm_device_funcs::=
move to
> > map or unmap all VAs associated with a GEM object.
> >=20
> > I think PT(E) reference counts etc. should be rather released when the =
drm_gpuva
> > is freed, i.e. page table allocations can be bound to the lifetime of a
> > drm_gpuva. Given that, I think that eventually we'll need a cleanup lis=
t for
> > those as well, since once they're removed from the VM tree (in the fence
> > signalling critical path), we loose access otherwise. =20
>=20
> Hmm. Another more conceptual issue with deferring gpuva is that
> "immediate mode" is defined as having the GPUVM match the GPU's actual
> address space at all times, which deferred gpuva cleanup would go
> against.
>=20
> Deferring vm_bo cleanup doesn't have this issue because even though the
> vm_bo isn't kfreed immediately, all GPUVM apis still treat it as-if it
> isn't there anymore.
>=20
> > >> > +static void
> > >> > +drm_gpuvm_bo_defer_locked(struct kref *kref)
> > >> > +{
> > >> > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm=
_gpuvm_bo,
> > >> > +                                               kref);
> > >> > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > >> > +
> > >> > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > >> > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > >> > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > >> > +     }
> > >> > +
> > >> > +     list_del(&vm_bo->list.entry.gem);
> > >> > +     mutex_unlock(&vm_bo->obj->gpuva.lock); =20
> > >>
> > >> I got tricked by this implicit unlock, and the conditional unlocks it
> > >> creates in drm_gpuva_unlink_defer(). Honestly, I'd rather see this
> > >> unlocked moved to drm_gpuva_unlink_defer() and a conditional unlock
> > >> added to drm_gpuvm_bo_put_deferred(), because it's easier to reason
> > >> about when the lock/unlock calls are in the same function
> > >> (kref_put_mutex() being the equivalent of a conditional lock). =20
> > >
> > > Ok. I followed the docs of kref_put_mutex() that say to unlock it from
> > > the function. =20
> >=20
> > Yes, please keep it the way it is, I don't want to deviate from what is
> > documented and everyone else does. Besides that, I also think it's a li=
ttle
> > less error prone. =20
>=20
> I gave it a try:
>=20
> bool
> drm_gpuvm_bo_put_deferred(struct drm_gpuvm_bo *vm_bo)
> {
> 	drm_WARN_ON(vm_bo->vm->drm, !drm_gpuvm_immediate_mode(vm_bo->vm));
>=20
> 	if (!vm_bo)
> 		return false;
>=20
> 	if (kref_put_mutex(&vm_bo->kref, drm_gpuvm_bo_defer_locked,
> 			   &vm_bo->obj->gpuva.lock)) {
> 		/*
> 		 * It's important that the GEM stays alive for the duration in which
> 		 * drm_gpuvm_bo_defer_locked() holds the mutex, but the instant we add
> 		 * the vm_bo to bo_defer, another thread might call
> 		 * drm_gpuvm_bo_deferred_cleanup() and put the GEM. For this reason, we
> 		 * add the vm_bo to bo_defer *after* releasing the GEM's mutex.
> 		 */
> 		mutex_unlock(&vm_bo->obj->gpuva.lock);
> 		drm_gpuvm_bo_list_add(vm_bo, bo_defer, true);
> 		return true;
> 	}
>=20
> 	return false;
> }
>=20
> void
> drm_gpuva_unlink_defer(struct drm_gpuva *va)
> {
> 	struct drm_gem_object *obj =3D va->gem.obj;
> 	struct drm_gpuvm_bo *vm_bo =3D va->vm_bo;
> 	bool should_defer_bo;
>=20
> 	if (unlikely(!obj))
> 		return;
>=20
> 	drm_WARN_ON(vm_bo->vm->drm, !drm_gpuvm_immediate_mode(vm_bo->vm));
>=20
> 	mutex_lock(&obj->gpuva.lock);
> 	list_del_init(&va->gem.entry);
>=20
> 	/*
> 	 * This is drm_gpuvm_bo_put_deferred() slightly modified since we
> 	 * already hold the mutex. It's important that we add the vm_bo to
> 	 * bo_defer after releasing the mutex for the same reason as in
> 	 * drm_gpuvm_bo_put_deferred().
> 	 */
> 	should_defer_bo =3D kref_put(&vm_bo->kref, drm_gpuvm_bo_defer_locked);
> 	mutex_unlock(&obj->gpuva.lock);
> 	if (should_defer_bo)
> 		drm_gpuvm_bo_list_add(vm_bo, bo_defer, true);
>=20
> 	va->vm_bo =3D NULL;
> }
>=20
> I do think it looks relatively nice like this, particularly
> drm_gpuva_unlink_defer().

I agree.

> But that's also the one not using
> kref_put_mutex().

Yeah, but that's the thing. I guess if drm_gpuvm_bo_defer_locked() was
only called from kref_put_mutex() this would be okay (though I still
have a hard time with those functions taking locks that have to be
released by the caller, but at least that's a well-known/documented
pattern). But it's also currently called from drm_gpuva_unlink_defer()
where the lock is taken but not released. I guess if the function name
was reflecting that (drm_gpuvm_bo_defer_locked_and_unlock()?), and with
a comment explaining why the lock is conditionally released in the
caller that would be acceptable, but I still find this locking scheme
quite confusing...
