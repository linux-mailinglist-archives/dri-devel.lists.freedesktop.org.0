Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F67B660E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 12:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F23E10E039;
	Tue,  3 Oct 2023 10:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22BE10E029;
 Tue,  3 Oct 2023 10:05:59 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C32B76607181;
 Tue,  3 Oct 2023 11:05:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696327558;
 bh=Uea1kzbzCEAJv9egM0FbWhO2rAR8f8GiAjog6bbqjK8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ipi2QljETxWw6nUTpWbl4ctzFrUaNHlu+c2+q65SXjz+KjG3uvVXHvwBOY+QYHm+B
 RDJ/ZcNSJDP63J/DdmRPx/GZuCRFzufzwEP1rPK7deEt/+vRMgbNSMxLVuprskN88J
 dgukou0kAa2sTvJkZe1EJZunYHx6MT8WOUNmAbiOazJklYNk8RB0Vb9Z4hXcKxHF70
 IAcAVWsVp3b1Gn2lwXkD+V9HquYu4hEdqf5uXgUjTe6baAvXeUE+3cAmPQZo6Ut+rF
 3IufimnoHfz9IhkMm0x3C7x9+J7hYAPrwZKBz6gSthEkDUHWMDmbtr0V51wnor7GHh
 0+DlndPNGz4ng==
Date: Tue, 3 Oct 2023 12:05:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v5 4/6] drm/gpuvm: track/lock/validate
 external/evicted objects
Message-ID: <20231003120554.547090bc@collabora.com>
In-Reply-To: <e4e68970-c7c9-55e2-9483-01252f38c956@linux.intel.com>
References: <20230928191624.13703-1-dakr@redhat.com>
 <20230928191624.13703-5-dakr@redhat.com>
 <e4e68970-c7c9-55e2-9483-01252f38c956@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On Tue, 3 Oct 2023 10:36:10 +0200
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> > +/**
> > + * get_next_vm_bo_from_list() - get the next vm_bo element
> > + * @__gpuvm: The GPU VM
> > + * @__list_name: The name of the list we're iterating on
> > + * @__local_list: A pointer to the local list used to store already it=
erated items
> > + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_=
cached_vm_bo()
> > + *
> > + * This helper is here to provide lockless list iteration. Lockless as=
 in, the
> > + * iterator releases the lock immediately after picking the first elem=
ent from
> > + * the list, so list insertion deletion can happen concurrently.
> > + *
> > + * Elements popped from the original list are kept in a local list, so=
 removal
> > + * and is_empty checks can still happen while we're iterating the list.
> > + */
> > +#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, _=
_prev_vm_bo)	\
> > +	({										\
> > +		struct drm_gpuvm_bo *__vm_bo =3D NULL;					\
> > +											\
> > +		drm_gpuvm_bo_put(__prev_vm_bo);						\
> > +											\
> > +		spin_lock(&(__gpuvm)->__list_name.lock);				\ =20
>=20
> Here we unconditionally take the spinlocks while iterating, and the main=
=20
> point of DRM_GPUVM_RESV_PROTECTED was really to avoid that?
>=20
>=20
> > +		if (!(__gpuvm)->__list_name.local_list)					\
> > +			(__gpuvm)->__list_name.local_list =3D __local_list;		\
> > +		else									\
> > +			WARN_ON((__gpuvm)->__list_name.local_list !=3D __local_list);	\
> > +											\
> > +		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
> > +			__vm_bo =3D list_first_entry(&(__gpuvm)->__list_name.list,	\
> > +						   struct drm_gpuvm_bo,			\
> > +						   list.entry.__list_name);		\
> > +			if (kref_get_unless_zero(&__vm_bo->kref)) { =20
> And unnecessarily grab a reference in the RESV_PROTECTED case.
> > 			\
> > +				list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
> > +					       __local_list);				\
> > +				break;							\
> > +			} else {							\
> > +				list_del_init(&(__vm_bo)->list.entry.__list_name);	\
> > +				__vm_bo =3D NULL;						\
> > +			}								\
> > +		}									\
> > +		spin_unlock(&(__gpuvm)->__list_name.lock);				\
> > +											\
> > +		__vm_bo;								\
> > +	}) =20
>=20
> IMHO this lockless list iteration looks very complex and should be=20
> pretty difficult to maintain while moving forward, also since it pulls=20
> the gpuvm_bos off the list, list iteration needs to be protected by an=20
> outer lock anyway.

As being partly responsible for this convoluted list iterator, I must
say I agree with you. There's so many ways this can go wrong if the
user doesn't call it the right way, or doesn't protect concurrent list
iterations with a separate lock (luckily, this is a private iterator). I
mean, it works, so there's certainly a way to get it right, but gosh,
this is so far from the simple API I had hoped for.

> Also from what I understand from Boris, the extobj=20
> list would typically not need the fine-grained locking; only the evict=20
> list?

Right, I'm adding the gpuvm_bo to extobj list in the ioctl path, when
the GEM and VM resvs are held, and I'm deferring the drm_gpuvm_bo_put()
call to a work that's not in the dma-signalling path. This being said,
I'm still not comfortable with the

gem =3D drm_gem_object_get(vm_bo->gem);
dma_resv_lock(gem->resv);
drm_gpuvm_bo_put(vm_bo);
dma_resv_unlock(gem->resv);
drm_gem_object_put(gem);

dance that's needed to avoid a UAF when the gpuvm_bo is the last GEM
owner, not to mention that drm_gpuva_unlink() calls drm_gpuvm_bo_put()
after making sure the GEM gpuvm_list lock is held, but this lock might
differ from the resv lock (custom locking so we can call
gpuvm_unlink() in the dma-signalling path). So we now have paths where
drm_gpuvm_bo_put() are called with the resv lock held, and others where
they are not, and that only works because we're relying on the the fact
those drm_gpuvm_bo_put() calls won't make the refcount drop to zero,
because the deferred vm_bo_put() work still owns a vm_bo ref.

All these tiny details add to the overall complexity of this common
layer, and to me, that's not any better than the
get_next_vm_bo_from_list() complexity you were complaining about (might
be even worth, because this sort of things leak to users).

Having an internal lock partly solves that, in that the locking of the
extobj list is now entirely orthogonal to the GEM that's being removed
from this list, and we can lock/unlock internally without forcing the
caller to take weird actions to make sure things don't explode. Don't
get me wrong, I get that this locking overhead is not acceptable for
Xe, but I feel like we're turning drm_gpuvm into a white elephant that
only few people will get right.

This is just my personal view on this, and I certainly don't want to
block or delay the merging of this patchset, but I thought I'd share my
concerns. As someone who's been following the evolution of this
drm_gpuva/vm series for weeks, and who's still sometimes getting lost,
I can't imagine how new drm_gpuvm users would feel...

> Also it seems that if we are to maintain two modes here, for=20
> reasonably clean code we'd need two separate instances of=20
> get_next_bo_from_list().
>=20
> For the !RESV_PROTECTED case, perhaps one would want to consider the=20
> solution used currently in xe, where the VM maintains two evict lists.=20
> One protected by a spinlock and one protected by the VM resv. When the=20
> VM resv is locked to begin list traversal, the spinlock is locked *once*=
=20
> and the spinlock-protected list is looped over and copied into the resv=20
> protected one. For traversal, the resv protected one is used.

Oh, so you do have the same sort of trick where you move the entire
list to another list, such that you can let other paths update the list
while you're iterating your own snapshot. That's interesting...

Regards,

Boris
