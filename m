Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85949AE02F9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 12:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0561E10EA03;
	Thu, 19 Jun 2025 10:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TL962kE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8780E10EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 10:55:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CAAB962A2C;
 Thu, 19 Jun 2025 10:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704C7C4CEEA;
 Thu, 19 Jun 2025 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750330514;
 bh=DsxkiLrEvnYYL3LtCmbLHbPeRaeKYhQpEGZGUUC0dts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TL962kE8WnCwuRVxzoRr7K58ahO16l4pdqiTzb3KsC+oAcykwFfR1pEy9tfHT79PD
 Gq7oXj3fdPhrXdogo0M9f7pE/vJmGRD5mx3ZzWej3+Cqi0foaKp/Jbowel0YWzjFcK
 LXnP805PsjX58Qv6VsACSFenMwcpiTggsp+wrT5Bzc7YDEcLQIx5xAyLCMnXCAtmB1
 UYFIYzZK+TuHZIpGebne/vzTac1ow7Sbogs2Og/Ri72ZklqVRnJHMnXHrjlxtJNypm
 JPhTfL5yxEQmCEEJ7VS938r4DzOSn4RXl4+SaBB/98ktgj8bZOcd5naXMeQAzn10cK
 QI6SwuquW1tlQ==
Date: Thu, 19 Jun 2025 12:55:08 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 daniel.almeida@collabora.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFPsjIFIC1J2qtdc@pollux>
References: <20250619102102.750668-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619102102.750668-1-beata.michalska@arm.com>
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

On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
> With the Opaque<T>, the expectations are that Rust should not make any
> assumptions on the layout or invariants of the wrapped C types.
> That runs rather counter to ioctl arguments, which must adhere to
> certain data-layout constraints. By using Opaque<T>, ioctl handlers
> end up doing unsound castings,

Which unsound casts? Please see [1] and [2] for how nova implements those IOCTL
handlers.

Speaking of which, this patch breaks the build, since it doesn't adjust the
users of the API, i.e. nova.

If you want I can post a diff to fix up nova accordingly for you to add to this
patch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nova/uapi.rs
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nova/file.rs

> which adds needless complexity and
> maintenance overhead, brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
> 
>  Additional comments:
>  - UAPI types already automatically derive MaybeZeroable,
>    so it probably makes little sense to add any verification for that
>  - FromBytes is pending, but due to the orphan rule, adding verification
>    of it being implemented for IOCTL args here is pointless
>  - Verifying pointer alignment could make use of strict_provenance,
>    but that one is unstable and I am not sure what are the exact rules
>    here for using those. Without that one though, verifying alignment in
>    some cases (i.e. pointer tagging) might require more extensive changes.
>    Happy to deal with either.
> 
>  rust/kernel/drm/ioctl.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> index 445639404fb7..12b296131672 100644
> --- a/rust/kernel/drm/ioctl.rs
> +++ b/rust/kernel/drm/ioctl.rs
> @@ -139,7 +139,7 @@ pub mod internal {
>                              // asserted above matches the size of this type, and all bit patterns of
>                              // UAPI structs must be valid.
>                              let data = unsafe {
> -                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
> +                                &mut *(raw_data as *mut $crate::uapi::$struct)

I think we have to document the guarantees we rely on to create this mutable
reference.

>                              };

This should be formatted as one single line and also adjust the doc-comment of
the macro accordingly, i.e.:

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 12b296131672..f0c599f15a41 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -83,7 +83,7 @@ pub mod internal {
 ///
 /// ```ignore
 /// fn foo(device: &kernel::drm::Device<Self>,
-///        data: &Opaque<uapi::argument_type>,
+///        data: &mut uapi::argument_type,
 ///        file: &kernel::drm::File<Self::File>,
 /// ) -> Result<u32>
 /// ```
@@ -138,9 +138,7 @@ macro_rules! declare_drm_ioctls {
                             // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
                             // asserted above matches the size of this type, and all bit patterns of
                             // UAPI structs must be valid.
-                            let data = unsafe {
-                                &mut *(raw_data as *mut $crate::uapi::$struct)
-                            };
+                            let data = unsafe { &mut *(raw_data as *mut $crate::uapi::$struct) };
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::as_ref(raw_file) };
