Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D760EAE60EC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4361C10E55B;
	Tue, 24 Jun 2025 09:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 17B6C10E55B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:32:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF224106F;
 Tue, 24 Jun 2025 02:32:24 -0700 (PDT)
Received: from e129154.arm.com (unknown [10.57.66.60])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 38DAD3F66E;
 Tue, 24 Jun 2025 02:32:38 -0700 (PDT)
From: Beata Michalska <beata.michalska@arm.com>
To: ojeda@kernel.org, alex.gaynor@gmail.com, dakr@kernel.org,
 aliceryhl@google.com, daniel.almeida@collabora.com
Cc: boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 alyssa@rosenzweig.io, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] rust: drm: Drop the use of Opaque for ioctl arguments
Date: Tue, 24 Jun 2025 11:31:59 +0200
Message-Id: <20250624093200.812812-2-beata.michalska@arm.com>
In-Reply-To: <20250624093200.812812-1-beata.michalska@arm.com>
References: <20250624093200.812812-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

With the Opaque<T>, the expectations are that Rust should not
make any assumptions on the layout or invariants of the wrapped
C types. That runs rather counter to ioctl arguments, which must
adhere to certain data-layout constraits. By using Opaque<T>,
ioctl handlers are forced to use unsafe code where non is acually
needed. This adds needless complexity and maintenance overhead,
brining no safety benefits.
Drop the use of Opaque for ioctl arguments as that is not the best
fit here.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 rust/kernel/drm/ioctl.rs | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 445639404fb7..3425a835f9cd 100644
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
@@ -138,9 +138,12 @@ pub mod internal {
                             // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
                             // asserted above matches the size of this type, and all bit patterns of
                             // UAPI structs must be valid.
-                            let data = unsafe {
-                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
-                            };
+                            // The `ioctl` argument is exclusively owned by the handler
+                            // and guaranteed by the C implementation (`drm_ioctl()`) to remain
+                            // valid for the entire lifetime of the reference taken here.
+                            // There is no concurrent access or aliasing; no other references
+                            // to this object exist during this call.
+                            let data = unsafe { &mut *(raw_data as *mut $crate::uapi::$struct) };
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::as_ref(raw_file) };
 
-- 
2.25.1

