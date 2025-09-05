Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E5B466CE
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 00:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9446610E02B;
	Fri,  5 Sep 2025 22:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TcAR77h4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EABA10E02B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 22:47:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6A070601AA;
 Fri,  5 Sep 2025 22:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B005C4CEF1;
 Fri,  5 Sep 2025 22:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757112460;
 bh=tGd46iQZ4DRbpvmkNmCnAZN6AsD9LicfdvyOISy1Mw4=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=TcAR77h4nbsHt3U50oejIjGSj8BdrAIgFlSpDcx5NiYDyXpLea7shRMuTA609gocg
 u9S6lrMd3bUWK76TBOgERnUWkorsz9Wovc3lehCAtg2NSfDovhYa2Ho11Qn0o8MaHp
 wFkQz2NlQtk61Y7D+m7/8/VTDSZRK2y2z0Ewl62j/FwG45YPA5CdZD5bhSC5jWoo0l
 1DCw1wM9dSSG+7SGCocKZr5yqhGbDh4lKYEUDQR8i/3c9aJ93B8aU9jRlWKXzuK8ku
 VsYKvmq4jL5s5CcsBNaJC64l/Ru45zCJ9NzYznJ8Z4W7QAbbfnuul28DgCUsapwhF6
 zKGo7P4oLHQHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Sep 2025 00:47:36 +0200
Message-Id: <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
Cc: "Boris Brezillon" <boris.brezillon@collabora.com>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Steven Price"
 <steven.price@arm.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Liviu Dudau" <liviu.dudau@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
In-Reply-To: <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
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

On Fri Sep 5, 2025 at 8:18 PM CEST, Alice Ryhl wrote:
> On Fri, Sep 5, 2025 at 3:25=E2=80=AFPM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
>> On Fri, 05 Sep 2025 12:11:28 +0000
>> Alice Ryhl <aliceryhl@google.com> wrote:
>> > +static bool
>> > +drm_gpuvm_bo_is_dead(struct drm_gpuvm_bo *vm_bo)
>> > +{
>> > +     return !kref_read(&vm_bo->kref);
>>
>> I'm not too sure I like the idea of [ab]using vm_bo::kref to defer the
>> vm_bo release. I get why it's done like that, but I'm wondering why we
>> don't defer the release of drm_gpuva objects instead (which is really
>> what's being released in va_unlink()). I can imagine drivers wanting to
>> attach resources to the gpuva that can't be released in the
>> dma-signalling path in the future, and if we're doing that at the gpuva
>> level, we also get rid of this kref dance, since the va will hold a
>> vm_bo ref until it's destroyed.
>>
>> Any particular reason you went for vm_bo destruction deferral instead
>> of gpuva?
>
> All of the things that were unsafe to release in the signalling path
> were tied to the vm_bo, so that is why I went for vm_bo cleanup.
> Another advantage is that it lets us use the same deferred logic for
> the vm_bo_put() call that drops the refcount from vm_bo_obtain().
>
> Of course if gpuvas might have resources that need deferred cleanup,
> that might change the situation somewhat.

I think we want to track PT(E) allocations, or rather reference counts of p=
age
table structures carried by the drm_gpuva, but we don't need to release the=
m on
drm_gpuva_unlink(), which is where we drop the reference count of the vm_bo=
.

Deferring drm_gpuva_unlink() isn't really an option I think, the GEMs list =
of
VM_BOs and the VM_BOs list of VAs is usually used in ttm_device_funcs::move=
 to
map or unmap all VAs associated with a GEM object.

I think PT(E) reference counts etc. should be rather released when the drm_=
gpuva
is freed, i.e. page table allocations can be bound to the lifetime of a
drm_gpuva. Given that, I think that eventually we'll need a cleanup list fo=
r
those as well, since once they're removed from the VM tree (in the fence
signalling critical path), we loose access otherwise.

>> > +static void
>> > +drm_gpuvm_bo_defer_locked(struct kref *kref)
>> > +{
>> > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gpu=
vm_bo,
>> > +                                               kref);
>> > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
>> > +
>> > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
>> > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
>> > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
>> > +     }
>> > +
>> > +     list_del(&vm_bo->list.entry.gem);
>> > +     mutex_unlock(&vm_bo->obj->gpuva.lock);
>>
>> I got tricked by this implicit unlock, and the conditional unlocks it
>> creates in drm_gpuva_unlink_defer(). Honestly, I'd rather see this
>> unlocked moved to drm_gpuva_unlink_defer() and a conditional unlock
>> added to drm_gpuvm_bo_put_deferred(), because it's easier to reason
>> about when the lock/unlock calls are in the same function
>> (kref_put_mutex() being the equivalent of a conditional lock).
>
> Ok. I followed the docs of kref_put_mutex() that say to unlock it from
> the function.

Yes, please keep it the way it is, I don't want to deviate from what is
documented and everyone else does. Besides that, I also think it's a little
less error prone.
