Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C311BAE57F0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 01:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B13210E478;
	Mon, 23 Jun 2025 23:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J6oZyXJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1571510E478
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 23:22:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DA82643C4F;
 Mon, 23 Jun 2025 23:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE859C4CEEA;
 Mon, 23 Jun 2025 23:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750720930;
 bh=gKpUNb2ySame1235TpxrDwcS53OCEqx/s21YimB9rrg=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=J6oZyXJpeDeGnaYjzST7RnCmZ+VNN1jEUocHjcmdMapezoQQmLB1Prk/RbwK9Zftc
 vMEDEvyNfzcWU+bWdjaiSM/PjvvInOe4PojPOUg68GRJ41o4+oHXGyQYLJbMXaC2dA
 ErNT7NHdGZYAd0TkjuE2h2AmiIF1/OGefRfgb4nG7znnD2h3CHCocW/LeO/uhuy6Gz
 xU9lYV+Bs5Bje15Xl7pGdDn0RPqkh8Yb5GngpO0JmY1zeskr5sRNzp032Kewv3BS11
 +x8clZkDGkPc1y3hNG4jrmDF4ZkOmzsuOdyMdP6TV+52LJ5O+aMQKHMFk8ViCRhVh/
 5Unm13xkG3PKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 01:22:05 +0200
Message-Id: <DAUARTYJ118U.YW38OP8TRVO3@kernel.org>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <gary@garyguo.net>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <will@kernel.org>, <longman@redhat.com>, <felipe_life@live.com>,
 <daniel@sedlak.dev>, <bjorn3_gh@protonmail.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
From: "Benno Lossin" <lossin@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org> <aFmKsE_nJkaVMv0T@tardis.local>
In-Reply-To: <aFmKsE_nJkaVMv0T@tardis.local>
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

On Mon Jun 23, 2025 at 7:11 PM CEST, Boqun Feng wrote:
> On Mon, Jun 23, 2025 at 05:14:37PM +0200, Benno Lossin wrote:
>> On Mon Jun 23, 2025 at 4:47 PM CEST, Boqun Feng wrote:
>> > On Mon, Jun 23, 2025 at 03:44:58PM +0200, Benno Lossin wrote:
>> >> I didn't have a concrete API in mind, but after having read the
>> >> abstractions more, would this make sense?
>> >>=20
>> >>     let ctx: &WwAcquireCtx =3D ...;
>> >>     let m1: &WwMutex<T> =3D ...;
>> >>     let m2: &WwMutex<Foo> =3D ...;
>> >>=20
>> >>     let (t, foo, foo2) =3D ctx
>> >>         .begin()
>> >>         .lock(m1)
>> >>         .lock(m2)
>> >>         .lock_with(|(t, foo)| &*foo.other)
>> >>         .finish();
>> >>=20
>> >
>> > Cute!
>> >
>> > However, each `.lock()` will need to be polymorphic over a tuple of
>> > locks that are already held, right? Otherwise I don't see how
>> > `.lock_with()` knows it's already held two locks. That sounds like a
>> > challenge for implementation.
>>=20
>> I think it's doable if we have=20
>>=20
>>     impl WwActiveCtx {
>
> I think you mean *WwAcquireCtx*

Oh yeah.

>>         fn begin(&self) -> WwActiveCtx<'_, ()>;
>>     }
>>=20
>>     struct WwActiveCtx<'a, Locks> {
>>         locks: Locks,
>
> This probably need to to be Result<Locks>, because we may detect
> -DEADLOCK in the middle.
>
>     let (a, c, d) =3D ctx.begin()
>         .lock(a)
>         .lock(b) // <- `b` may be locked by someone else. So we should
>                  // drop `a` and switch `locks` to an `Err(_)`.
>         .lock(c) // <- this should be a no-op if `locks` is an `Err(_)`.
>         .finish();

Hmm, I thought that we would go for the `lock_slow_path` thing, but
maybe that's the wrong thing to do? Maybe `lock` should return a result?
I'd have to see the use-cases...

>>         _ctx: PhantomData<&'a WwAcquireCtx>,
>
> We can still take a reference to WwAcquireCtx here I think.

Yeah we have to do that in order to call lock on the mutexes.

>>     }
>>=20
>>     impl<'a, Locks> WwActiveCtx<'a, Locks>
>>     where
>>         Locks: Tuple
>>     {
>>         fn lock<'b, T>(
>>             self,
>>             lock: &'b WwMutex<T>,
>>         ) -> WwActiveCtx<'a, Locks::Append<WwMutexGuard<'b, T>>>;
>>=20
>>         fn lock_with<'b, T>(
>>             self,
>>             get_lock: impl FnOnce(&Locks) -> &'b WwMutex<T>,
>>         ) -> WwActiveCtx<'a, Locks::Append<WwMutexGuard<'b, T>>>;
>>         // I'm not 100% sure that the lifetimes will work out...
>
> I think we can make the following work?
>
>     impl<'a, Locks> WwActiveCtx<'a, Locks>
>     where
>         Locks: Tuple
>     {
>         fn lock_with<T>(
> 	    self,
> 	    get_lock: impl FnOnce(&Locks) -> &WmMutex<T>,
> 	) -> WwActiveCtx<'a, Locks::Append<WmMutexGuard<'a, T>>
>     }
>
> because with a `WwActiveCtx<'a, Locks>`, we can get a `&'a Locks`, which
> will give us a `&'a WmMutex<T>`, and should be able to give us a
> `WmMutexGuard<'a, T>`.

I think this is more restrictive, since this will require that the mutex
is (potentially) locked for `'a` (you can drop the guard before, but you
can't drop the mutex itself). So again concrete use-cases should inform
our choice here.

>>         fn finish(self) -> Locks;
>>     }
>>=20
>>     trait Tuple {
>>         type Append<T>;
>>=20
>>         fn append<T>(self, value: T) -> Self::Append<T>;
>>     }
>>=20
>
> `Tuple` is good enough for its own, if you could remember, we have some
> ideas about using things like this to consolidate multiple `RcuOld` so
> that we can do one `synchronize_rcu()` for `RcuOld`s.

Yeah that's true, feel free to make a patch or good-first-issue, I won't
have time to create a series.

>>     impl Tuple for () {
>>         type Append<T> =3D (T,);
>>=20
>>         fn append<T>(self, value: T) -> Self::Append<T> {
>>             (value,)
>>         }
>>     }
>>    =20
>>     impl<T1> Tuple for (T1,) {
>>         type Append<T> =3D (T1, T);
>>=20
>>         fn append<T>(self, value: T) -> Self::Append<T> {
>>             (self.0, value,)
>>         }
>>     }
>>=20
>>     impl<T1, T2> Tuple for (T1, T2) {
>>         type Append<T> =3D (T1, T2, T);
>>=20
>>         fn append<T>(self, value: T) -> Self::Append<T> {
>>             (self.0, self.1, value,)
>>         }
>>     }
>>=20
>>     /* these can easily be generated by a macro */
>>=20
>> > We also need to take into consideration that the user want to drop any
>> > lock in the sequence? E.g. the user acquires a, b and c, and then drop
>> > b, and then acquires d. Which I think is possible for ww_mutex.
>>=20
>> Hmm what about adding this to the above idea?:
>>=20
>>     impl<'a, Locks> WwActiveCtx<'a, Locks>
>>     where
>>         Locks: Tuple
>>     {
>>         fn custom<L2>(self, action: impl FnOnce(Locks) -> L2) -> WwActiv=
eCtx<'a, L2>;
>>     }
>>=20
>> Then you can do:
>>=20
>>     let (a, c, d) =3D ctx.begin()
>>         .lock(a)
>>         .lock(b)
>>         .lock(c)
>>         .custom(|(a, _, c)| (a, c))
>>         .lock(d)
>>         .finish();
>>=20
>
> Seems reasonable. But we still need to present this to the end user to
> see how much they like it. For ww_mutex I think the major user is DRM,
> so add them into Cc list.

Yeah let's see some use-cases :)

---
Cheers,
Benno
