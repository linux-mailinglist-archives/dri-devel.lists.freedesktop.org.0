Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEFBA4ED0F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 20:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9D510E6A6;
	Tue,  4 Mar 2025 19:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="irJ7QdaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1494010E69F;
 Tue,  4 Mar 2025 19:17:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 937D75C6388;
 Tue,  4 Mar 2025 19:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEB2C4CEE5;
 Tue,  4 Mar 2025 19:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741115835;
 bh=PMboUH21QxSZynvmqYXTsJlCbDsI3wUH1QQCqbJpVC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=irJ7QdaR0K0c04nUp9b2wT+j89G4yrbHif+hu8lFO/egIAVdxMP+68HZBNcVhAMHn
 553GEYa/+Ppt5fcaxYJZ+jysAIxz7DNKriXV9R7mF1UFoFFGOvm2SicSkZYdK3GFKv
 hEAEg+m+bSXQQrCt/lrjDaRsbdtWmpLSnnJFCvu6RHx1nmBNpzctDhvx+b/x4dBSh0
 6/n3Uv+kvpFYtCW0XCXTp6HyhthA5/jBPGZ8vz/J3/ZkjYOk77t5IzWNubNl4Exr9k
 oV6k2bNSI/Iad/IPd+AWmbx7KHy7rwxVdd9igchCOuWhAkHqkJVD1oSE8muqq2z7CX
 ZBbbYaYOgTZWg==
Date: Tue, 4 Mar 2025 21:17:10 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org,
 russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 3/5] rust: firmware: add `module_firmware!` macro
Message-ID: <Z8dRtiUaS_Yrv8-K@kernel.org>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-4-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304173555.2496-4-dakr@kernel.org>
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

On Tue, Mar 04, 2025 at 06:34:50PM +0100, Danilo Krummrich wrote:
> Analogous to the `module!` macro `module_firmware!` adds additional
> firmware path strings to the .modinfo section.
> 
> In contrast to `module!`, where path strings need to be string literals,
> path strings can be composed with the `firmware::ModInfoBuilder`.
> 
> Some drivers require a lot of firmware files (such as nova-core) and
> hence benefit from more flexibility composing firmware path strings.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/firmware.rs | 79 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 6e6972d94597..5d1ac8287171 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -116,6 +116,85 @@ unsafe impl Send for Firmware {}
>  // be used from any thread.
>  unsafe impl Sync for Firmware {}
>  
> +/// Create firmware .modinfo entries.
> +///
> +/// This macro is the counterpart of the C macro `MODULE_FIRMWARE()`, but instead of taking a
> +/// simple string literals, which is already covered by the `firmware` field of
> +/// [`crate::prelude::module!`], it allows the caller to pass a builder type (e.g.
> +/// [`ModInfoBuilder`]) which can create the firmware modinfo strings in a more flexible way.
> +///
> +/// Drivers should extend the [`ModInfoBuilder`] with their own driver specific builder type.
> +///
> +/// The `builder` argument must be a type which implements the following function.
> +///
> +/// `const fn create(module_name: &'static CStr) -> ModInfoBuilder`
> +///
> +/// `create` should pass the `module_name` to the [`ModInfoBuilder`] and, with the help of
> +/// it construct the corresponding firmware modinfo.
> +///
> +/// Typically, such contracts would be enforced by a trait, however traits do not (yet) support
> +/// const functions.
> +///
> +/// # Example
> +///
> +/// ```
> +/// # mod module_firmware_test {
> +/// # use kernel::firmware;
> +/// # use kernel::prelude::*;
> +/// #
> +/// # struct MyModule;
> +/// #
> +/// # impl kernel::Module for MyModule {
> +/// #     fn init(_module: &'static ThisModule) -> Result<Self> {
> +/// #         Ok(Self)
> +/// #     }
> +/// # }
> +/// #
> +/// #
> +/// struct Builder<const N: usize>;
> +///
> +/// impl<const N: usize> Builder<N> {
> +///     const fn create(module_name: &'static kernel::str::CStr) -> firmware::ModInfoBuilder<N> {
> +///         firmware::ModInfoBuilder::new(module_name)
> +///             .prepare()
> +///             .push("vendor/foo.bin")
> +///             .prepare()
> +///             .push("vendor/bar.bin")
> +///     }
> +/// }
> +///
> +/// module! {
> +///    type: MyModule,
> +///    name: "module_firmware_test",
> +///    author: "Rust for Linux",
> +///    description: "module_firmware! test module",
> +///    license: "GPL",
> +/// }
> +///
> +/// kernel::module_firmware!(Builder);
> +/// # }
> +/// ```
> +#[macro_export]
> +macro_rules! module_firmware {
> +    ($($builder:tt)*) => {
> +
> +        #[cfg(not(MODULE))]
> +        const fn __module_name() -> &'static kernel::str::CStr {
> +            <LocalModule as kernel::ModuleMetadata>::NAME
> +        }
> +
> +        #[cfg(MODULE)]
> +        const fn __module_name() -> &'static kernel::str::CStr {
> +            kernel::c_str!("")
> +        }
> +
> +        #[link_section = ".modinfo"]
> +        #[used]
> +        static __MODULE_FIRMWARE: [u8; $($builder)*::create(__module_name()).build_length()] =
> +            $($builder)*::create(__module_name()).build();
> +    };
> +}
> +
>  /// Builder for firmware module info.
>  ///
>  /// [`ModInfoBuilder`] is a helper component to flexibly compose firmware paths strings for the
> -- 
> 2.48.1
> 
> 
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
