Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D115DAE2116
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 19:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB3A10EBA2;
	Fri, 20 Jun 2025 17:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 421BD10E025
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 10:21:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 964B9113E;
 Thu, 19 Jun 2025 03:21:01 -0700 (PDT)
Received: from e129154.arm.com (unknown [10.57.67.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 230573F66E;
 Thu, 19 Jun 2025 03:21:17 -0700 (PDT)
From: Beata Michalska <beata.michalska@arm.com>
To: ojeda@kernel.org, alex.gaynor@gmail.com, dakr@kernel.org,
 aliceryhl@google.com, daniel.almeida@collabora.com
Cc: boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 alyssa@rosenzweig.io, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Date: Thu, 19 Jun 2025 12:21:02 +0200
Message-Id: <20250619102102.750668-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Jun 2025 17:39:34 +0000
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

With the Opaque<T>, the expectations are that Rust should not make any
assumptions on the layout or invariants of the wrapped C types.
That runs rather counter to ioctl arguments, which must adhere to
certain data-layout constraints. By using Opaque<T>, ioctl handlers
end up doing unsound castings, which adds needless complexity and
maintenance overhead, brining no safety benefits.
Drop the use of Opaque for ioctl arguments as that is not the best
fit here.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---

 Additional comments:
 - UAPI types already automatically derive MaybeZeroable,
   so it probably makes little sense to add any verification for that
 - FromBytes is pending, but due to the orphan rule, adding verification
   of it being implemented for IOCTL args here is pointless
 - Verifying pointer alignment could make use of strict_provenance,
   but that one is unstable and I am not sure what are the exact rules
   here for using those. Without that one though, verifying alignment in
   some cases (i.e. pointer tagging) might require more extensive changes.
   Happy to deal with either.

 rust/kernel/drm/ioctl.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 445639404fb7..12b296131672 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -139,7 +139,7 @@ pub mod internal {
                             // asserted above matches the size of this type, and all bit patterns of
                             // UAPI structs must be valid.
                             let data = unsafe {
-                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
+                                &mut *(raw_data as *mut $crate::uapi::$struct)
                             };
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::as_ref(raw_file) };
-- 
2.25.1

