Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4662CA53E8D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E5410E86A;
	Wed,  5 Mar 2025 23:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="jOJAu7pW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B0B10E86A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1741217824; x=1741477024;
 bh=Gxk41D0aEqbdm+zd94pkZqxTTDSqmpgclDrTYWEtmOU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=jOJAu7pWZF5YNcHCbbVPZ4Fkebu/IyTtsQPmQsnttyTD0DL599Ek2Pb7/DQwV6Anj
 kFmvU5ZkfUcIsDFuUcsNb/99bl5sNLQV2E0t9r9uVi5/i4PJbNRR15kWVPf0RpV30i
 i7L+/QxnHgzNCEGyv+aDgcZ23NRGTQzFykPqCUDvuQz3livsEWVMnbsel4heR8sYIX
 SiOahehcGiHt5tgQoSJFyW2VXaXpc6ZwG68MnmRXttIau09KAUKaBge5yAMbVeHUxL
 xzo7BUSGvahj4wi1j5zCYwp4oGqMsiaWeQlKmQ8QadrHR3Z6btPMOIduRUE5IPk5Ij
 2cwQm7Sab+yag==
Date: Wed, 05 Mar 2025 23:36:54 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 mcgrof@kernel.org, russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 2/5] rust: firmware: introduce
 `firmware::ModInfoBuilder`
Message-ID: <D88Q7503C8FF.2TMMBSEMOGKU1@proton.me>
In-Reply-To: <Z8jSV5CpZDcXrviY@pollux>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-3-dakr@kernel.org> <D88OSC9XJXZL.C5HXWFYCG9U6@proton.me>
 <Z8jSV5CpZDcXrviY@pollux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: f41048d72c2b4fded541320cd54a9e6ca4066086
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Wed Mar 5, 2025 at 11:38 PM CET, Danilo Krummrich wrote:
> On Wed, Mar 05, 2025 at 10:30:31PM +0000, Benno Lossin wrote:
>> On Tue Mar 4, 2025 at 6:34 PM CET, Danilo Krummrich wrote:
>> > +    /// Push an additional path component.
>> > +    ///
>> > +    /// After a new [`ModInfoBuilder`] instance has been created, [`M=
odInfoBuilder::prepare`] must
>> > +    /// be called before adding path components.
>> > +    pub const fn push(self, s: &str) -> Self {
>> > +        if N !=3D 0 && self.n =3D=3D 0 {
>> > +            crate::build_error!("Must call prepare() before push().")=
;
>>
>> This will only prevent the first `prepare` call being missed, right?
>
> Correct, unfortunately there's no way to detect subsequent ones.

Does it make sense to do that one in the constructor?

(After looking at the example below) Ah maybe you can't do that, since
then you would have two `prepare()` calls for the example below...?

>> > +        }
>> > +
>> > +        self.push_internal(s.as_bytes())
>> > +    }
>> > +
>> > +    const fn prepare_module_name(self) -> Self {
>> > +        let mut this =3D self;
>> > +        let module_name =3D this.module_name;
>> > +
>> > +        if !this.module_name.is_empty() {
>> > +            this =3D this.push_internal(module_name.as_bytes_with_nul=
());
>> > +
>> > +            if N !=3D 0 {
>> > +                // Re-use the space taken by the NULL terminator and =
swap it with the '.' separator.
>> > +                this.buf[this.n - 1] =3D b'.';
>> > +            }
>> > +        }
>> > +
>> > +        this.push_internal(b"firmware=3D")
>> > +    }
>> > +
>> > +    /// Prepare for the next module info entry.
>> > +    ///
>> > +    /// Must be called before [`ModInfoBuilder::push`] can be called.
>>
>> If you always have to call this before `push`, why not inline it there?
>
> You can push() multiple times to compose the firmware path string (which =
is the
> whole purpose :).

Ah I see, I only looked at the example you have in the next patch. All
in all, I think this patch could use some better documentation, since I
had to read a lot of the code to understand what everything is supposed
to do...

It might also make sense to make this more generic, since one probably
also needs this in other places? Or do you think this will only be
required for modinfo?

---
Cheers,
Benno

> Example from nova-core:
>
> =09pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuil=
der<N>);
>
> =09impl<const N: usize> ModInfoBuilder<N> {
> =09    const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
> =09        let version =3D "535.113.01";
>
> =09        ModInfoBuilder(
> =09            self.0
> =09                .prepare()
> =09                .push("nvidia/")
> =09                .push(chipset)
> =09                .push("/gsp/")
> =09                .push(fw)
> =09                .push("-")
> =09                .push(version)
> =09                .push(".bin"),
> =09        )
> =09    }
>
> =09    const fn make_entry_chipset(self, chipset: &str) -> Self {
> =09        self.make_entry_file(chipset, "booter_load")
> =09            .make_entry_file(chipset, "booter_unload")
> =09            .make_entry_file(chipset, "bootloader")
> =09            .make_entry_file(chipset, "gsp")
> =09    }
>
> =09    pub(crate) const fn create(
> =09        module_name: &'static kernel::str::CStr,
> =09    ) -> firmware::ModInfoBuilder<N> {
> =09        let mut this =3D Self(firmware::ModInfoBuilder::new(module_nam=
e));
> =09        let mut i =3D 0;
>
> =09        while i < gpu::Chipset::NAMES.len() {
> =09            this =3D this.make_entry_chipset(gpu::Chipset::NAMES[i]);
> =09            i +=3D 1;
> =09        }
>
> =09        this.0
> =09    }
> =09}


