Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E920B19003
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 22:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA65910E027;
	Sat,  2 Aug 2025 20:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="koAI3Zbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3310E027
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 20:58:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F16E601D0;
 Sat,  2 Aug 2025 20:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC92C4CEEF;
 Sat,  2 Aug 2025 20:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754168294;
 bh=jls7RI4UDsR9chSuQa2K32QuFY3fZP41M1jzeL+swwU=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=koAI3ZbhWKyjZtdIXDToFdqaiZcJLDzoToPPsxNKCXwkje8tMAZhTKoNgSee7Fkz0
 dvyLCEA20NvwVFs7cghTlJ87K4PSR3BxIUlrPAh6VeQnO3f7/65VNmUytivaEvblea
 w0up9iFo41Vvh2qAPdWNrFAGdkeMTm5AnUJL+M37kPCxDxwpJqFxOU9/AJKu46u6Tj
 qv30n6sVhXiMiAL5QRnhhQOiOVD80TH8g/YY5hzCQaj8zEGA2ucG+DzujhpiRsyn+7
 5enrYAyHGKMegoOVh20fY/ynjJ4JTDVYjbXjZGE7/M7rlK3ppZnm4gGRiTgKUSFVsw
 8gcG2c6cBfwSw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 Aug 2025 22:58:08 +0200
Message-Id: <DBS8REY5E82S.3937FAHS25ANA@kernel.org>
Cc: "Onur" <work@onurozkan.dev>, "Boqun Feng" <boqun.feng@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <gary@garyguo.net>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <will@kernel.org>, <longman@redhat.com>, <felipe_life@live.com>,
 <daniel@sedlak.dev>, <bjorn3_gh@protonmail.com>, "dri-devel"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: "Benno Lossin" <lossin@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
 <20250707163913.5ffc046d@nimda.home>
 <DB5XIWGZ8U36.1VB58YBJFL7OT@kernel.org>
 <20250707210613.2fd5bb55@nimda.home>
 <DB62ZN1LTO31.1HVWDLAWJWVM8@kernel.org>
 <FF481535-86EF-41EB-830A-1DA2434AAEA0@collabora.com>
 <DBRVNP4MM5KO.3IXLMXKGK4XTS@kernel.org>
 <E997DCAF-552F-4EF2-BF94-1385ECADF543@collabora.com>
In-Reply-To: <E997DCAF-552F-4EF2-BF94-1385ECADF543@collabora.com>
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

On Sat Aug 2, 2025 at 4:15 PM CEST, Daniel Almeida wrote:
> On 2 Aug 2025, at 07:42, Benno Lossin <lossin@kernel.org> wrote:
>> On Fri Aug 1, 2025 at 11:22 PM CEST, Daniel Almeida wrote:
>>> One thing I didn=E2=80=99t understand with your approach: is it amenabl=
e to loops?
>>> i.e.: are things like drm_exec() implementable?
>>=20
>> I don't think so, see also my reply here:
>>=20
>>    https://lore.kernel.org/all/DBOPIJHY9NZ7.2CU5XP7UY7ES3@kernel.org
>>=20
>> The type-based approach with tuples doesn't handle dynamic number of
>> locks.
>>=20
>
> This is probably the default use-case by the way.

That's an important detail. In that case, a type state won't we a good
idea. Unless it's also common to have a finite number of them, in which
case we should have two API.

>>> /**
>>> * drm_exec_until_all_locked - loop until all GEM objects are locked
>>> * @exec: drm_exec object
>>> *
>>> * Core functionality of the drm_exec object. Loops until all GEM object=
s are
>>> * locked and no more contention exists. At the beginning of the loop it=
 is
>>> * guaranteed that no GEM object is locked.
>>> *
>>> * Since labels can't be defined local to the loops body we use a jump p=
ointer
>>> * to make sure that the retry is only used from within the loops body.
>>> */
>>> #define drm_exec_until_all_locked(exec) \
>>> __PASTE(__drm_exec_, __LINE__): \
>>> for (void *__drm_exec_retry_ptr; ({ \
>>> __drm_exec_retry_ptr =3D &&__PASTE(__drm_exec_, __LINE__);\
>>> (void)__drm_exec_retry_ptr; \
>>> drm_exec_cleanup(exec); \
>>> });)
>>=20
>> My understanding of C preprocessor macros is not good enough to parse or
>> understand this :( What is that `__PASTE` thing?
>
> This macro is very useful, but also cursed :)
>
> This declares a unique label before the loop, so you can jump back to it =
on
> contention. It is usually used in conjunction with:

Ahh, I missed the `:` at the end of the line. Thanks for explaining!
(also Miguel in the other reply!) If you don't mind I'll ask some more
basic C questions :)

And yeah it's pretty cursed...

> /**
>  * drm_exec_retry_on_contention - restart the loop to grap all locks
>  * @exec: drm_exec object
>  *
>  * Control flow helper to continue when a contention was detected and we =
need to
>  * clean up and re-start the loop to prepare all GEM objects.
>  */
> #define drm_exec_retry_on_contention(exec)			\
> 	do {							\
> 		if (unlikely(drm_exec_is_contended(exec)))	\
> 			goto *__drm_exec_retry_ptr;		\
> 	} while (0)

The `do { ... } while(0)` is used because C doesn't have `{ ... }`
scopes? (& because you want to be able to have this be called from an if
without braces?)

> The termination is handled by:
>
> /**
>  * drm_exec_cleanup - cleanup when contention is detected
>  * @exec: the drm_exec object to cleanup
>  *
>  * Cleanup the current state and return true if we should stay inside the=
 retry
>  * loop, false if there wasn't any contention detected and we can keep th=
e
>  * objects locked.
>  */
> bool drm_exec_cleanup(struct drm_exec *exec)
> {
> 	if (likely(!exec->contended)) {
> 		ww_acquire_done(&exec->ticket);
> 		return false;
> 	}
>
> 	if (likely(exec->contended =3D=3D DRM_EXEC_DUMMY)) {
> 		exec->contended =3D NULL;
> 		ww_acquire_init(&exec->ticket, &reservation_ww_class);
> 		return true;
> 	}
>
> 	drm_exec_unlock_all(exec);
> 	exec->num_objects =3D 0;
> 	return true;
> }
> EXPORT_SYMBOL(drm_exec_cleanup);
>
> The third clause in the loop is empty.
>
> For example, in amdgpu:
>
> /**
>  * reserve_bo_and_vm - reserve a BO and a VM unconditionally.
>  * @mem: KFD BO structure.
>  * @vm: the VM to reserve.
>  * @ctx: the struct that will be used in unreserve_bo_and_vms().
>  */
> static int reserve_bo_and_vm(struct kgd_mem *mem,
> 			      struct amdgpu_vm *vm,
> 			      struct bo_vm_reservation_context *ctx)
> {
> 	struct amdgpu_bo *bo =3D mem->bo;
> 	int ret;
>
> 	WARN_ON(!vm);
>
> 	ctx->n_vms =3D 1;
> 	ctx->sync =3D &mem->sync;
> 	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> 	drm_exec_until_all_locked(&ctx->exec) {
> 		ret =3D amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
> 		drm_exec_retry_on_contention(&ctx->exec);
> 		if (unlikely(ret))
> 			goto error;
>
> 		ret =3D drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base, 1);
> 		drm_exec_retry_on_contention(&ctx->exec);
> 		if (unlikely(ret))
> 			goto error;
> 	}
>         // <=E2=80=94=E2=80=94 everything is locked at this point.

Which function call locks the mutexes?

> 	return 0;
>
>
> So, something like:
>
> some_unique_label:
> for(void *retry_ptr;
>     ({ retry_ptr =3D &some_unique_label; drm_exec_cleanup(); });

Normally this should be a condition, or rather an expression evaluating
to bool, why is this okay? Or does C just take the value of the last
function call due to the `({})`?

Why isn't `({})` used instead of `do { ... } while(0)` above?

>     /* empty *) {
>      /* user code here, which potentially jumps back to some_unique_label=
  */
> }

Thanks for the example & the macro expansion. What I gather from this is
that we'd probably want a closure that executes the code & reruns it
when contention is detected.

>>> In fact, perhaps we can copy drm_exec, basically? i.e.:
>>>=20
>>> /**
>>> * struct drm_exec - Execution context
>>> */
>>> struct drm_exec {
>>> /**
>>>  * @flags: Flags to control locking behavior
>>>  */
>>> u32                     flags;
>>>=20
>>> /**
>>>  * @ticket: WW ticket used for acquiring locks
>>>  */
>>> struct ww_acquire_ctx ticket;
>>>=20
>>> /**
>>>  * @num_objects: number of objects locked
>>>  */
>>> unsigned int num_objects;
>>>=20
>>> /**
>>>  * @max_objects: maximum objects in array
>>>  */
>>> unsigned int max_objects;
>>>=20
>>> /**
>>>  * @objects: array of the locked objects
>>>  */
>>> struct drm_gem_object **objects;
>>>=20
>>> /**
>>>  * @contended: contended GEM object we backed off for
>>>  */
>>> struct drm_gem_object *contended;
>>>=20
>>> /**
>>>  * @prelocked: already locked GEM object due to contention
>>>  */
>>> struct drm_gem_object *prelocked;
>>> };
>>>=20
>>> This is GEM-specific, but we could perhaps implement the same idea by
>>> tracking ww_mutexes instead of GEM objects.
>>=20
>> But this would only work for `Vec<WwMutex<T>>`, right?
>
> I=E2=80=99m not sure if I understand your point here.
>
> The list of ww_mutexes that we've managed to currently lock would be some=
thing
> that we'd keep track internally in our context. In what way is a KVec an =
issue?

I saw "array of the locked objects" and thus thought so this must only
work for an array of locks. Looking at the type a bit closer, it
actually is an array of pointers, so it does work for arbitrary data
structures storing the locks.

So essentially it would amount to storing `Vec<WwMutexGuard<'_, T>>` in
Rust IIUC. I was under the impression that we wanted to avoid that,
because it's an extra allocation.

But maybe that's actually what's done on the C side.

> Btw, I can also try to implement a proof of concept, so long as people ag=
ree that
> this approach makes sense.

I'm not sure I understand what you are proposing, so I can't give a
recommendation yet.

---
Cheers,
Benno
