Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561E5B11462
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 01:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50A110E350;
	Thu, 24 Jul 2025 23:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="GCfOorPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2998A10E0D2;
 Thu, 24 Jul 2025 23:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753398813; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QESqvU1fmd4n54OSgYaySl/CHEEEoQxkSlUqDEUi8sF6JOMkNcauBvwoQ8KZxJ1PJlDo9zTQyTiAl2GxAMxlHcz4axkPgse00BpNY696M+gsFlxlkprGaJ7NDKT9NN7cxjfnuRECQO1yUAlKUJEVFZ01CmUM7OTilcbqvn1Mjwo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753398813;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7WbypAsGzahsapPp7xQ+wrpUDPFjbToobgw0emJ/Uh0=; 
 b=GTmoZeM60VZe5HMFwnBH1m8HS7S/xDkrnxl+oi0LrNMcs9Lrq5vOuR9G7wFC0Ri3mhd74tLSZJtIOYgQbAlqoHz4ctyPQS4ygF3ZOXaxj2dUwRfgfqZaK8YK+xl/68AjruM7aS/owRBZQRhbRkaG/Z4eRr3LVLCfXd4xEKytH5c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753398813; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=7WbypAsGzahsapPp7xQ+wrpUDPFjbToobgw0emJ/Uh0=;
 b=GCfOorPLfvxPBlXdRlkZIAIP+WniIjzJfghV7NedxL6/w1N/hLkhR6rLWs2AKytP
 oQORm30pGWwULQJ1+jh9YpWmwIuk/svILXJnvm8uMcx0KhstBhsGkZX42QfFlPNj1tz
 pICfiA7qVpB5ybSyRkCUQzZ+ndmpVgqwtF95OY6U=
Received: by mx.zohomail.com with SMTPS id 1753398810537411.2389352606622;
 Thu, 24 Jul 2025 16:13:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] Partially revert "rust: drm: gem: Implement
 AlwaysRefCounted for all gem objects automatically"
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DBKN0VSJH3TX.2FYLW17KL0SWW@kernel.org>
Date: Thu, 24 Jul 2025 20:13:13 -0300
Cc: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E9028A26-2E47-4431-B4B4-C5B416EB36E2@collabora.com>
References: <20250724191523.561314-1-lyude@redhat.com>
 <DBKJYLF9E3TY.IM6UZFA0BW9I@kernel.org>
 <e7a4cb0cc55a2d19e6eb9bf5280c68c0dd04d61d.camel@redhat.com>
 <DBKN0VSJH3TX.2FYLW17KL0SWW@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
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



> On 24 Jul 2025, at 19:27, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Thu Jul 24, 2025 at 11:06 PM CEST, Lyude Paul wrote:
>> On Thu, 2025-07-24 at 22:03 +0200, Danilo Krummrich wrote:
>>> On Thu Jul 24, 2025 at 9:15 PM CEST, Lyude Paul wrote:
>>>> -// SAFETY: All gem objects are refcounted.
>>>> -unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T {
>>>> -    fn inc_ref(&self) {
>>>> -        // SAFETY: The existence of a shared reference guarantees =
that the refcount is non-zero.
>>>> -        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
>>>> -    }
>>>> -
>>>> -    unsafe fn dec_ref(obj: NonNull<Self>) {
>>>> -        // SAFETY: We either hold the only refcount on `obj`, or =
one of many - meaning that no one
>>>> -        // else could possibly hold a mutable reference to `obj` =
and thus this immutable reference
>>>> -        // is safe.
>>>> -        let obj =3D unsafe { obj.as_ref() }.as_raw();
>>>> -
>>>> -        // SAFETY:
>>>> -        // - The safety requirements guarantee that the refcount =
is non-zero.
>>>> -        // - We hold no references to `obj` now, making it safe =
for us to potentially deallocate it.
>>>> -        unsafe { bindings::drm_gem_object_put(obj) };
>>>> -    }
>>>> -}
>>>=20
>>> IIUC, you'll add rust/kernel/drm/gem/shmem.rs with a new type =
shmem::Object that
>>> implements IntoGEMObject, right?
>>>=20
>>> If this is correct, I think that should work.
>>=20
>> Do you mean you think the blanket implementation that we had would =
work, or
>> that getting rid of it would work?
>=20
> The former.
>=20
>> Since the blanket implementation we have
>> definitely doesn't compile on my machine once we add more then one
>> IntoGEMObject impl. (before adding it, it works just fine)
>=20
> Do you have a branch somewhere, where it doesn't compile?

Hi Lyude, I=E2=80=99m somewhat surprised to be honest. Your gem-shmem =
code works on
tyr-next, which is currently on top of 6.16-rc2. What exactly doesn=E2=80=99=
t
compile?

[0] =
https://gitlab.freedesktop.org/panfrost/linux/-/tree/tyr-next?ref_type=3Dh=
eads



