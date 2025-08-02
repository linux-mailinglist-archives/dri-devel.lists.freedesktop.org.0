Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC43DB18F13
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 16:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ED010E0C4;
	Sat,  2 Aug 2025 14:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ijQ1uh7U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F193D10E0C4
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 14:15:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754144126; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QaVymuHxuvn3xpOhbmyZVvJbXF+0bSSURDIvXc1FpyaI/IhN3byBNvhNQyIdpuaF+cyksJ5RD/+hTmOqW/lbYzbRvz3ZkpvakQ+zC9tCETW/cI0amM5T9BJGOO0PVgrpfztcm1YCdTDxV+OJaD6mytVYeulLcTzk07UnTSFAsGA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754144126;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=EazKvct6W5hZA7aFxkpG2xwggdURKmc6pFVcBodVGJg=; 
 b=O9TCIQJUWH/uUujkOGdyHcyJ+lG9qd9SYfQAOoijSK2ZYuMk6VZVa19Hi2NYaWTyB1qWtDND9ledv7wVHRsKbEPo+7OEtnENFmHwCTZVGgXWNaf/wlscsjM5Pt1wk/ZaU1rhPVUSoCNf3JWPJjvmRA3HS2WDcr7RlGW9ZpwfN2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754144126; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=EazKvct6W5hZA7aFxkpG2xwggdURKmc6pFVcBodVGJg=;
 b=ijQ1uh7UMh5s9Y+27pZ91XUmSW/5PU9sEFIoNxsKH4ltuJVU+D62lxpuuJZg21h/
 g3dCv/tZ8yk9775Q+N/llPqhf74QyH9Xksw243/SWyWJSF4pFHkSSc270Ou9d3709J7
 yDs8kQ5DuV80AETqLXLSrNAqbYHySE2DjNB2ijZ8=
Received: by mx.zohomail.com with SMTPS id 1754144123849822.7763497824441;
 Sat, 2 Aug 2025 07:15:23 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DBRVNP4MM5KO.3IXLMXKGK4XTS@kernel.org>
Date: Sat, 2 Aug 2025 11:15:07 -0300
Cc: Onur <work@onurozkan.dev>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 bjorn3_gh@protonmail.com, dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E997DCAF-552F-4EF2-BF94-1385ECADF543@collabora.com>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org> <20250707163913.5ffc046d@nimda.home>
 <DB5XIWGZ8U36.1VB58YBJFL7OT@kernel.org> <20250707210613.2fd5bb55@nimda.home>
 <DB62ZN1LTO31.1HVWDLAWJWVM8@kernel.org>
 <FF481535-86EF-41EB-830A-1DA2434AAEA0@collabora.com>
 <DBRVNP4MM5KO.3IXLMXKGK4XTS@kernel.org>
To: Benno Lossin <lossin@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External
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



> On 2 Aug 2025, at 07:42, Benno Lossin <lossin@kernel.org> wrote:
>=20
> On Fri Aug 1, 2025 at 11:22 PM CEST, Daniel Almeida wrote:
>> Hi Benno,
>>=20
>>> On 7 Jul 2025, at 16:48, Benno Lossin <lossin@kernel.org> wrote:
>>>=20
>>> On Mon Jul 7, 2025 at 8:06 PM CEST, Onur wrote:
>>>> On Mon, 07 Jul 2025 17:31:10 +0200
>>>> "Benno Lossin" <lossin@kernel.org> wrote:
>>>>=20
>>>>> On Mon Jul 7, 2025 at 3:39 PM CEST, Onur wrote:
>>>>>> On Mon, 23 Jun 2025 17:14:37 +0200
>>>>>> "Benno Lossin" <lossin@kernel.org> wrote:
>>>>>>=20
>>>>>>>> We also need to take into consideration that the user want to
>>>>>>>> drop any lock in the sequence? E.g. the user acquires a, b and
>>>>>>>> c, and then drop b, and then acquires d. Which I think is
>>>>>>>> possible for ww_mutex.
>>>>>>>=20
>>>>>>> Hmm what about adding this to the above idea?:
>>>>>>>=20
>>>>>>>   impl<'a, Locks> WwActiveCtx<'a, Locks>
>>>>>>>   where
>>>>>>>       Locks: Tuple
>>>>>>>   {
>>>>>>>       fn custom<L2>(self, action: impl FnOnce(Locks) -> L2) ->
>>>>>>> WwActiveCtx<'a, L2>; }
>>>>>>>=20
>>>>>>> Then you can do:
>>>>>>>=20
>>>>>>>   let (a, c, d) =3D ctx.begin()
>>>>>>>       .lock(a)
>>>>>>>       .lock(b)
>>>>>>>       .lock(c)
>>>>>>>       .custom(|(a, _, c)| (a, c))
>>>>>>>       .lock(d)
>>>>>>>       .finish();
>>>>>>=20
>>>>>>=20
>>>>>> Instead of `begin` and `custom`, why not something like this:
>>>>>>=20
>>>>>> let (a, c, d) =3D ctx.init()
>>>>>>    .lock(a)
>>>>>>           .lock(b)
>>>>>>           .lock(c)
>>>>>>           .unlock(b)
>>>>>>           .lock(d)
>>>>>>           .finish();
>>>>>>=20
>>>>>> Instead of `begin`, `init` would be better naming to imply `fini`
>>>>>> on the C side, and `unlock` instead of `custom` would make the
>>>>>> intent clearer when dropping locks mid chain.
>>>=20
>>> Also, I'm not really fond of the name `init`, how about `enter`?
>>>=20
>>>>>=20
>>>>> I don't think that this `unlock` operation will work. How would =
you
>>>>> implement it?
>>>>=20
>>>>=20
>>>> We could link mutexes to locks using some unique value, so that we =
can
>>>> access locks by passing mutexes (though that sounds a bit odd).
>>>>=20
>>>> Another option would be to unlock by the index, e.g.,:
>>>>=20
>>>> let (a, c) =3D ctx.init()
>>>>    .lock(a)
>>>>           .lock(b)
>>>>           .unlock::<1>()
>>=20
>> Why do we need this random unlock() here? We usually want to lock =
everything
>> and proceed, or otherwise backoff completely so that someone else can =
proceed.
>=20
> No the `unlock` was just to show that we could interleave locking and
> unlocking.
>=20
>> One thing I didn=E2=80=99t understand with your approach: is it =
amenable to loops?
>> i.e.: are things like drm_exec() implementable?
>=20
> I don't think so, see also my reply here:
>=20
>    https://lore.kernel.org/all/DBOPIJHY9NZ7.2CU5XP7UY7ES3@kernel.org
>=20
> The type-based approach with tuples doesn't handle dynamic number of
> locks.
>=20

This is probably the default use-case by the way.

>> /**
>> * drm_exec_until_all_locked - loop until all GEM objects are locked
>> * @exec: drm_exec object
>> *
>> * Core functionality of the drm_exec object. Loops until all GEM =
objects are
>> * locked and no more contention exists. At the beginning of the loop =
it is
>> * guaranteed that no GEM object is locked.
>> *
>> * Since labels can't be defined local to the loops body we use a jump =
pointer
>> * to make sure that the retry is only used from within the loops =
body.
>> */
>> #define drm_exec_until_all_locked(exec) \
>> __PASTE(__drm_exec_, __LINE__): \
>> for (void *__drm_exec_retry_ptr; ({ \
>> __drm_exec_retry_ptr =3D &&__PASTE(__drm_exec_, __LINE__);\
>> (void)__drm_exec_retry_ptr; \
>> drm_exec_cleanup(exec); \
>> });)
>=20
> My understanding of C preprocessor macros is not good enough to parse =
or
> understand this :( What is that `__PASTE` thing?

This macro is very useful, but also cursed :)

This declares a unique label before the loop, so you can jump back to it =
on
contention. It is usually used in conjunction with:

/**
 * drm_exec_retry_on_contention - restart the loop to grap all locks
 * @exec: drm_exec object
 *
 * Control flow helper to continue when a contention was detected and we =
need to
 * clean up and re-start the loop to prepare all GEM objects.
 */
#define drm_exec_retry_on_contention(exec)			\
	do {							\
		if (unlikely(drm_exec_is_contended(exec)))	\
			goto *__drm_exec_retry_ptr;		\
	} while (0)


The termination is handled by:

/**
 * drm_exec_cleanup - cleanup when contention is detected
 * @exec: the drm_exec object to cleanup
 *
 * Cleanup the current state and return true if we should stay inside =
the retry
 * loop, false if there wasn't any contention detected and we can keep =
the
 * objects locked.
 */
bool drm_exec_cleanup(struct drm_exec *exec)
{
	if (likely(!exec->contended)) {
		ww_acquire_done(&exec->ticket);
		return false;
	}

	if (likely(exec->contended =3D=3D DRM_EXEC_DUMMY)) {
		exec->contended =3D NULL;
		ww_acquire_init(&exec->ticket, &reservation_ww_class);
		return true;
	}

	drm_exec_unlock_all(exec);
	exec->num_objects =3D 0;
	return true;
}
EXPORT_SYMBOL(drm_exec_cleanup);

The third clause in the loop is empty.

For example, in amdgpu:

/**
 * reserve_bo_and_vm - reserve a BO and a VM unconditionally.
 * @mem: KFD BO structure.
 * @vm: the VM to reserve.
 * @ctx: the struct that will be used in unreserve_bo_and_vms().
 */
static int reserve_bo_and_vm(struct kgd_mem *mem,
			      struct amdgpu_vm *vm,
			      struct bo_vm_reservation_context *ctx)
{
	struct amdgpu_bo *bo =3D mem->bo;
	int ret;

	WARN_ON(!vm);

	ctx->n_vms =3D 1;
	ctx->sync =3D &mem->sync;
	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
	drm_exec_until_all_locked(&ctx->exec) {
		ret =3D amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
		drm_exec_retry_on_contention(&ctx->exec);
		if (unlikely(ret))
			goto error;

		ret =3D drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base, =
1);
		drm_exec_retry_on_contention(&ctx->exec);
		if (unlikely(ret))
			goto error;
	}
        // <=E2=80=94=E2=80=94 everything is locked at this point.
	return 0;


So, something like:

some_unique_label:
for(void *retry_ptr;
    ({ retry_ptr =3D &some_unique_label; drm_exec_cleanup(); });
    /* empty *) {
     /* user code here, which potentially jumps back to =
some_unique_label  */
}

>=20
>> In fact, perhaps we can copy drm_exec, basically? i.e.:
>>=20
>> /**
>> * struct drm_exec - Execution context
>> */
>> struct drm_exec {
>> /**
>>  * @flags: Flags to control locking behavior
>>  */
>> u32                     flags;
>>=20
>> /**
>>  * @ticket: WW ticket used for acquiring locks
>>  */
>> struct ww_acquire_ctx ticket;
>>=20
>> /**
>>  * @num_objects: number of objects locked
>>  */
>> unsigned int num_objects;
>>=20
>> /**
>>  * @max_objects: maximum objects in array
>>  */
>> unsigned int max_objects;
>>=20
>> /**
>>  * @objects: array of the locked objects
>>  */
>> struct drm_gem_object **objects;
>>=20
>> /**
>>  * @contended: contended GEM object we backed off for
>>  */
>> struct drm_gem_object *contended;
>>=20
>> /**
>>  * @prelocked: already locked GEM object due to contention
>>  */
>> struct drm_gem_object *prelocked;
>> };
>>=20
>> This is GEM-specific, but we could perhaps implement the same idea by
>> tracking ww_mutexes instead of GEM objects.
>=20
> But this would only work for `Vec<WwMutex<T>>`, right?

I=E2=80=99m not sure if I understand your point here.

The list of ww_mutexes that we've managed to currently lock would be =
something
that we'd keep track internally in our context. In what way is a KVec an =
issue?

>=20
>> Also, I=E2=80=99d appreciate if the rollback logic could be =
automated, which is
>> what you=E2=80=99re trying to do, so +1 to your idea.
>=20
> Good to see that it seems useful to you :)
>=20
> ---
> Cheers,
> Benno

Btw, I can also try to implement a proof of concept, so long as people =
agree that
this approach makes sense.

By the way, dri-devel seems to not be on cc? Added them now.

Full context at [0].

=E2=80=94 Daniel

[0]: =
https://lore.kernel.org/rust-for-linux/DBPC27REX4N1.3JA4SSHDYXAHJ@kernel.o=
rg/T/#m17a1e3a913ead2648abdff0fc2d927c8323cb8c3

