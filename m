Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D37B111FA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 22:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6D510E2A2;
	Thu, 24 Jul 2025 20:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E8WwFdrC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F97510E29D;
 Thu, 24 Jul 2025 20:03:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1FDAB44433;
 Thu, 24 Jul 2025 20:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D066AC4CEED;
 Thu, 24 Jul 2025 20:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753387410;
 bh=fP0jCPxK1T2Ab4oOBOWBx+XZP5UkwaWLafeWg2ZgBJs=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=E8WwFdrC0RZ8rN7KsoVsEMrz9EqPnn13H/y/P7tAdZ247z4YBdpzTMikLpK4D0B5d
 mckAPFE+mrBsKdgZehZsVF1LVj0xcckG9oVDGyDOKf3sP5m6uNCJ9bRhUZQ9VOH/F8
 Olz0wT8gw1HaHi64LZXyA1unW6aNq+dVE0toyAZoe6dhlgfHE2MKd81Te/9ty/5vOQ
 seL1LFy8s0xfTYL5aJIN+IHPYw17vSqzbLN1OCYyr8dDQxFdrfjFr11Nksxt4SWA/T
 I5ivN9RjFm4i2abAKSt6c9ImLJOwQKIm0cgFzsDmzEGOrg6zoZpXy5HzD46w98A6KF
 0fzCgFpZzfBaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 22:03:24 +0200
Message-Id: <DBKJYLF9E3TY.IM6UZFA0BW9I@kernel.org>
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
In-Reply-To: <20250724191523.561314-1-lyude@redhat.com>
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

On Thu Jul 24, 2025 at 9:15 PM CEST, Lyude Paul wrote:
> -// SAFETY: All gem objects are refcounted.
> -unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T {
> -    fn inc_ref(&self) {
> -        // SAFETY: The existence of a shared reference guarantees that t=
he refcount is non-zero.
> -        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
> -    }
> -
> -    unsafe fn dec_ref(obj: NonNull<Self>) {
> -        // SAFETY: We either hold the only refcount on `obj`, or one of =
many - meaning that no one
> -        // else could possibly hold a mutable reference to `obj` and thu=
s this immutable reference
> -        // is safe.
> -        let obj =3D unsafe { obj.as_ref() }.as_raw();
> -
> -        // SAFETY:
> -        // - The safety requirements guarantee that the refcount is non-=
zero.
> -        // - We hold no references to `obj` now, making it safe for us t=
o potentially deallocate it.
> -        unsafe { bindings::drm_gem_object_put(obj) };
> -    }
> -}

IIUC, you'll add rust/kernel/drm/gem/shmem.rs with a new type shmem::Object=
 that
implements IntoGEMObject, right?

If this is correct, I think that should work.

Do I miss anything?
