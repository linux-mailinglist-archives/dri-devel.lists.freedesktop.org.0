Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4425CA50EAE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 23:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992FE10E82D;
	Wed,  5 Mar 2025 22:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kA/clk9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D903910E04F;
 Wed,  5 Mar 2025 22:38:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 161645C6CC7;
 Wed,  5 Mar 2025 22:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C96C4CED1;
 Wed,  5 Mar 2025 22:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741214303;
 bh=Roi/euyc99FChG5PRFvFXT8ZwL1l4H4tpWXXNhTNGBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kA/clk9WPgtegyDu4qZG4uoAQHpEzBCX0vDP6Fl7+UDdfG9p5puozCMDQ5kFyAGKF
 NtBCKZIAj/YGDocvp28Xbb8pKpXLMEY1frV6Lz66+WTAzlRm29i5nA6wa2xx76O8gJ
 PoE+OjQ43lFAvcLD5HisHMw3hvdStEtfZaoXsrnk985rif07HdB1hN6Ij6zxWBYxdW
 LS4tMczCjF4l9B0nMjmNyxjzHXaHKg5iBFxOjsJdLYSepgdgeicUiTZc1PK/d5gois
 OfWP6zx6sflntD4RTvwSTJy/IxZiui90MLcw575hCHfP0bCzvBkwOXwzVJitup0w9T
 7ixe53hqaEpsw==
Date: Wed, 5 Mar 2025 23:38:15 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 2/5] rust: firmware: introduce
 `firmware::ModInfoBuilder`
Message-ID: <Z8jSV5CpZDcXrviY@pollux>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-3-dakr@kernel.org>
 <D88OSC9XJXZL.C5HXWFYCG9U6@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D88OSC9XJXZL.C5HXWFYCG9U6@proton.me>
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

On Wed, Mar 05, 2025 at 10:30:31PM +0000, Benno Lossin wrote:
> On Tue Mar 4, 2025 at 6:34 PM CET, Danilo Krummrich wrote:
> > The `firmware` field of the `module!` only accepts literal strings,
> > which is due to the fact that it is implemented as a proc macro.
> >
> > Some drivers require a lot of firmware files (such as nova-core) and
> > hence benefit from more flexibility composing firmware path strings.
> >
> > The `firmware::ModInfoBuilder` is a helper component to flexibly compose
> > firmware path strings for the .modinfo section in const context.
> >
> > It is meant to be used in combination with `kernel::module_firmware!`,
> > which is introduced in a subsequent patch.
> >
> > Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> >  rust/kernel/firmware.rs | 98 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >
> > diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> > index c5162fdc95ff..6e6972d94597 100644
> > --- a/rust/kernel/firmware.rs
> > +++ b/rust/kernel/firmware.rs
> > @@ -115,3 +115,101 @@ unsafe impl Send for Firmware {}
> >  // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, references to which are safe to
> >  // be used from any thread.
> >  unsafe impl Sync for Firmware {}
> > +
> > +/// Builder for firmware module info.
> > +///
> > +/// [`ModInfoBuilder`] is a helper component to flexibly compose firmware paths strings for the
> > +/// .modinfo section in const context.
> > +///
> > +/// It is meant to be used in combination with [`kernel::module_firmware!`].
> > +///
> > +/// For more details and an example, see [`kernel::module_firmware!`].
> > +pub struct ModInfoBuilder<const N: usize> {
> > +    buf: [u8; N],
> > +    n: usize,
> > +    module_name: &'static CStr,
> > +}
> > +
> > +impl<const N: usize> ModInfoBuilder<N> {
> > +    /// Create an empty builder instance.
> > +    pub const fn new(module_name: &'static CStr) -> Self {
> > +        Self {
> > +            buf: [0; N],
> > +            n: 0,
> > +            module_name,
> > +        }
> > +    }
> > +
> > +    const fn push_internal(mut self, bytes: &[u8]) -> Self {
> > +        let mut j = 0;
> > +
> > +        if N == 0 {
> > +            self.n += bytes.len();
> > +            return self;
> > +        }
> > +
> > +        while j < bytes.len() {
> > +            if self.n < N {
> > +                self.buf[self.n] = bytes[j];
> > +            }
> > +            self.n += 1;
> > +            j += 1;
> > +        }
> > +        self
> > +    }
> > +
> > +    /// Push an additional path component.
> > +    ///
> > +    /// After a new [`ModInfoBuilder`] instance has been created, [`ModInfoBuilder::prepare`] must
> > +    /// be called before adding path components.
> > +    pub const fn push(self, s: &str) -> Self {
> > +        if N != 0 && self.n == 0 {
> > +            crate::build_error!("Must call prepare() before push().");
> 
> This will only prevent the first `prepare` call being missed, right?

Correct, unfortunately there's no way to detect subsequent ones.

> 
> > +        }
> > +
> > +        self.push_internal(s.as_bytes())
> > +    }
> > +
> > +    const fn prepare_module_name(self) -> Self {
> > +        let mut this = self;
> > +        let module_name = this.module_name;
> > +
> > +        if !this.module_name.is_empty() {
> > +            this = this.push_internal(module_name.as_bytes_with_nul());
> > +
> > +            if N != 0 {
> > +                // Re-use the space taken by the NULL terminator and swap it with the '.' separator.
> > +                this.buf[this.n - 1] = b'.';
> > +            }
> > +        }
> > +
> > +        this.push_internal(b"firmware=")
> > +    }
> > +
> > +    /// Prepare for the next module info entry.
> > +    ///
> > +    /// Must be called before [`ModInfoBuilder::push`] can be called.
> 
> If you always have to call this before `push`, why not inline it there?

You can push() multiple times to compose the firmware path string (which is the
whole purpose :).

Example from nova-core:

	pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
	
	impl<const N: usize> ModInfoBuilder<N> {
	    const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
	        let version = "535.113.01";
	
	        ModInfoBuilder(
	            self.0
	                .prepare()
	                .push("nvidia/")
	                .push(chipset)
	                .push("/gsp/")
	                .push(fw)
	                .push("-")
	                .push(version)
	                .push(".bin"),
	        )
	    }
	
	    const fn make_entry_chipset(self, chipset: &str) -> Self {
	        self.make_entry_file(chipset, "booter_load")
	            .make_entry_file(chipset, "booter_unload")
	            .make_entry_file(chipset, "bootloader")
	            .make_entry_file(chipset, "gsp")
	    }
	
	    pub(crate) const fn create(
	        module_name: &'static kernel::str::CStr,
	    ) -> firmware::ModInfoBuilder<N> {
	        let mut this = Self(firmware::ModInfoBuilder::new(module_name));
	        let mut i = 0;
	
	        while i < gpu::Chipset::NAMES.len() {
	            this = this.make_entry_chipset(gpu::Chipset::NAMES[i]);
	            i += 1;
	        }
	
	        this.0
	    }
	}
