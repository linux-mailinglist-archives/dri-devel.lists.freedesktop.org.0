Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8110A50ECE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 23:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7D110E04F;
	Wed,  5 Mar 2025 22:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="ExIVDq+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B7610E82E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 22:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1741213841; x=1741473041;
 bh=oA5VdBYqAl1FD7XLdd6ED5xak0jGnkmx5w36QBysOHU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=ExIVDq+Ujn6KsOt67OMC7GxrAMIcWg00nU1tO3l1CRkkMfRDzJfhUvlOnbAFRRdwh
 QSIFakcquGfaPU+hFA+dg/eqEL5ljlXh9cxSrJd/gz0cypodCjxiFBhoA+FX/Jji5X
 KH9tXlAO+QzhvYchL/eCAymMTqJgYmpyXsPoMOAW7Gr5cGXq/BOJ6ZHwGC4mHfHXmO
 BINFIJj8ovd8c3iX/5R20OaEcbzFpvkmE3oMa7zRiD7ziMgat1ysdRpIkc0JjpKlzK
 O2U8nk7deejkOq6rODO8bJp9A0ftPXefTmSwnB6yDHUxkwVXMCmui6Z3aid/fg9nM2
 5DLkYeCXLmxGw==
Date: Wed, 05 Mar 2025 22:30:31 +0000
To: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com,
 bskeggs@nvidia.com, acurrid@nvidia.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 mcgrof@kernel.org, russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 2/5] rust: firmware: introduce
 `firmware::ModInfoBuilder`
Message-ID: <D88OSC9XJXZL.C5HXWFYCG9U6@proton.me>
In-Reply-To: <20250304173555.2496-3-dakr@kernel.org>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-3-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: fc5a88e7746fec47f7de82f7668300d12884367f
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

On Tue Mar 4, 2025 at 6:34 PM CET, Danilo Krummrich wrote:
> The `firmware` field of the `module!` only accepts literal strings,
> which is due to the fact that it is implemented as a proc macro.
>
> Some drivers require a lot of firmware files (such as nova-core) and
> hence benefit from more flexibility composing firmware path strings.
>
> The `firmware::ModInfoBuilder` is a helper component to flexibly compose
> firmware path strings for the .modinfo section in const context.
>
> It is meant to be used in combination with `kernel::module_firmware!`,
> which is introduced in a subsequent patch.
>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/firmware.rs | 98 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index c5162fdc95ff..6e6972d94597 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -115,3 +115,101 @@ unsafe impl Send for Firmware {}
>  // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, ref=
erences to which are safe to
>  // be used from any thread.
>  unsafe impl Sync for Firmware {}
> +
> +/// Builder for firmware module info.
> +///
> +/// [`ModInfoBuilder`] is a helper component to flexibly compose firmwar=
e paths strings for the
> +/// .modinfo section in const context.
> +///
> +/// It is meant to be used in combination with [`kernel::module_firmware=
!`].
> +///
> +/// For more details and an example, see [`kernel::module_firmware!`].
> +pub struct ModInfoBuilder<const N: usize> {
> +    buf: [u8; N],
> +    n: usize,
> +    module_name: &'static CStr,
> +}
> +
> +impl<const N: usize> ModInfoBuilder<N> {
> +    /// Create an empty builder instance.
> +    pub const fn new(module_name: &'static CStr) -> Self {
> +        Self {
> +            buf: [0; N],
> +            n: 0,
> +            module_name,
> +        }
> +    }
> +
> +    const fn push_internal(mut self, bytes: &[u8]) -> Self {
> +        let mut j =3D 0;
> +
> +        if N =3D=3D 0 {
> +            self.n +=3D bytes.len();
> +            return self;
> +        }
> +
> +        while j < bytes.len() {
> +            if self.n < N {
> +                self.buf[self.n] =3D bytes[j];
> +            }
> +            self.n +=3D 1;
> +            j +=3D 1;
> +        }
> +        self
> +    }
> +
> +    /// Push an additional path component.
> +    ///
> +    /// After a new [`ModInfoBuilder`] instance has been created, [`ModI=
nfoBuilder::prepare`] must
> +    /// be called before adding path components.
> +    pub const fn push(self, s: &str) -> Self {
> +        if N !=3D 0 && self.n =3D=3D 0 {
> +            crate::build_error!("Must call prepare() before push().");

This will only prevent the first `prepare` call being missed, right?

> +        }
> +
> +        self.push_internal(s.as_bytes())
> +    }
> +
> +    const fn prepare_module_name(self) -> Self {
> +        let mut this =3D self;
> +        let module_name =3D this.module_name;
> +
> +        if !this.module_name.is_empty() {
> +            this =3D this.push_internal(module_name.as_bytes_with_nul())=
;
> +
> +            if N !=3D 0 {
> +                // Re-use the space taken by the NULL terminator and swa=
p it with the '.' separator.
> +                this.buf[this.n - 1] =3D b'.';
> +            }
> +        }
> +
> +        this.push_internal(b"firmware=3D")
> +    }
> +
> +    /// Prepare for the next module info entry.
> +    ///
> +    /// Must be called before [`ModInfoBuilder::push`] can be called.

If you always have to call this before `push`, why not inline it there?

---
Cheers,
Benno

> +    pub const fn prepare(self) -> Self {
> +        self.push_internal(b"\0").prepare_module_name()
> +    }
> +
> +    /// Build the byte array.
> +    pub const fn build(self) -> [u8; N] {
> +        // Add the final NULL terminator.
> +        let this =3D self.push_internal(b"\0");
> +
> +        if this.n =3D=3D N {
> +            this.buf
> +        } else {
> +            crate::build_error!("Length mismatch.");
> +        }
> +    }
> +}
> +
> +impl ModInfoBuilder<0> {
> +    /// Return the length of the byte array to build.
> +    pub const fn build_length(self) -> usize {
> +        // Compensate for the NULL terminator added by `build`.
> +        self.n + 1
> +    }
> +}
> --
> 2.48.1


