Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41566B113D6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 00:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5750510E34A;
	Thu, 24 Jul 2025 22:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N/8eTaLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2067C10E34A;
 Thu, 24 Jul 2025 22:27:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C614600AD;
 Thu, 24 Jul 2025 22:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B6AC4CEED;
 Thu, 24 Jul 2025 22:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753396052;
 bh=zDBfkniel8YE1EvR07CT7m8wF9mkrhDRPaV4U3vQ8/w=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=N/8eTaLh4yXMe8AdptiqwYYUXbH9EnZrtrTvCVaylb4T4UYVDjCuYLg0/lvN100y9
 0UgOnDlekbLDkMSb3QhOxFOiyNa40lsqyqgzBd1N/RdU+rpuMk1qizFW1WsNG1ImLd
 Nc9VKhMbctvoRB3BTg7T7FQlDTBbxvpkp99dx2H8aZ2XqdGAbY7N3xCXJeYeV+X3mC
 aa8ze0RWEdaYx7LHaWZgqNh7iqSOOSC9myxwFiM1bbZnaAmJS7O2v3Cbwj9h+yRaPW
 sfH/Fc1LCv2h2ULEZpA3qMIErGp/FMuOUGOlJ5pbMYvcczCndCnqIb+BJWB1G+QL/W
 VSwud1LTuZ5Vw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2025 00:27:26 +0200
Message-Id: <DBKN0VSJH3TX.2FYLW17KL0SWW@kernel.org>
Subject: Re: [PATCH] Partially revert "rust: drm: gem: Implement
 AlwaysRefCounted for all gem objects automatically"
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Asahi
 Lina" <lina+kernel@asahilina.net>, "Alyssa Rosenzweig"
 <alyssa@rosenzweig.io>, "open list" <linux-kernel@vger.kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250724191523.561314-1-lyude@redhat.com>
 <DBKJYLF9E3TY.IM6UZFA0BW9I@kernel.org>
 <e7a4cb0cc55a2d19e6eb9bf5280c68c0dd04d61d.camel@redhat.com>
In-Reply-To: <e7a4cb0cc55a2d19e6eb9bf5280c68c0dd04d61d.camel@redhat.com>
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

On Thu Jul 24, 2025 at 11:06 PM CEST, Lyude Paul wrote:
> On Thu, 2025-07-24 at 22:03 +0200, Danilo Krummrich wrote:
>> On Thu Jul 24, 2025 at 9:15 PM CEST, Lyude Paul wrote:
>> > -// SAFETY: All gem objects are refcounted.
>> > -unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T {
>> > -    fn inc_ref(&self) {
>> > -        // SAFETY: The existence of a shared reference guarantees tha=
t the refcount is non-zero.
>> > -        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
>> > -    }
>> > -
>> > -    unsafe fn dec_ref(obj: NonNull<Self>) {
>> > -        // SAFETY: We either hold the only refcount on `obj`, or one =
of many - meaning that no one
>> > -        // else could possibly hold a mutable reference to `obj` and =
thus this immutable reference
>> > -        // is safe.
>> > -        let obj =3D unsafe { obj.as_ref() }.as_raw();
>> > -
>> > -        // SAFETY:
>> > -        // - The safety requirements guarantee that the refcount is n=
on-zero.
>> > -        // - We hold no references to `obj` now, making it safe for u=
s to potentially deallocate it.
>> > -        unsafe { bindings::drm_gem_object_put(obj) };
>> > -    }
>> > -}
>>=20
>> IIUC, you'll add rust/kernel/drm/gem/shmem.rs with a new type shmem::Obj=
ect that
>> implements IntoGEMObject, right?
>>=20
>> If this is correct, I think that should work.
>
> Do you mean you think the blanket implementation that we had would work, =
or
> that getting rid of it would work?

The former.

> Since the blanket implementation we have
> definitely doesn't compile on my machine once we add more then one
> IntoGEMObject impl. (before adding it, it works just fine)

Do you have a branch somewhere, where it doesn't compile?
