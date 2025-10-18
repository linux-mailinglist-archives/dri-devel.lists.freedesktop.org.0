Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBBABED904
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 21:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CE410E1EB;
	Sat, 18 Oct 2025 19:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iBGrgfs4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0404C10E1EA
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 19:17:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D320D44B4A;
 Sat, 18 Oct 2025 19:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33A0C116B1;
 Sat, 18 Oct 2025 19:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760815062;
 bh=mvzw2mOgVK1rTE6DegAxCmeiKe+4WCD0q+Vgj2JT9WU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=iBGrgfs4GuEuh6D6ykM1vled445YaakCr43raArOpb6AMPxUylZ/sY8YIZ8/ZWuKx
 l2ujB11ocOSuHi8Iw4VnX3qeaoOVrhagPImm5Lnfb7Tq+pOkuJFNaJ318v10IXizu3
 gFgA57LXOC6oLXyskeEAD44u8+iqC8pMYIreQCOq41gcSezsBGWxPvRb2m4BBFHtAZ
 DrFShpK4zZA7APeFat9mdn5pix3wb3FPQF8Ti+1G18sGFW1gpTs7/sbYNa/25049G8
 MovMdmjKZSzVOTL4HyaPU8WIwFlNFtVnm71iSvxuYShp3rZDWus+xnxLboFSUcFpQf
 IMD4WIfZLwxMg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 18 Oct 2025 15:16:34 -0400
Subject: [RESEND PATCH v18 13/16] rust: regulator: use `CStr::as_char_ptr`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-13-9378a54385f8@gmail.com>
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
 llvm@lists.linux.dev, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760814989; l=2203;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=TVneWa6JveF7OyfYzj6Kyk7+7jG+eRccWAa0D/umdvA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB66XSchXpQP0ql6hf2wFqSMWIu/xghHrf/J2fVOOToGeEX1prtd6Qtlv/bZtBsRRBGIVNZMvr8
 dES/KD1MjIgk=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

From: Tamir Duberstein <tamird@gmail.com>

Replace the use of `as_ptr` which works through `<CStr as
Deref<Target=&[u8]>::deref()` in preparation for replacing
`kernel::str::CStr` with `core::ffi::CStr` as the latter does not
implement `Deref<Target=&[u8]>`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/regulator.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
index b55a201e5029..65a4eb096cae 100644
--- a/rust/kernel/regulator.rs
+++ b/rust/kernel/regulator.rs
@@ -84,7 +84,7 @@ pub struct Error<State: RegulatorState> {
 pub fn devm_enable(dev: &Device<Bound>, name: &CStr) -> Result {
     // SAFETY: `dev` is a valid and bound device, while `name` is a valid C
     // string.
-    to_result(unsafe { bindings::devm_regulator_get_enable(dev.as_raw(), name.as_ptr()) })
+    to_result(unsafe { bindings::devm_regulator_get_enable(dev.as_raw(), name.as_char_ptr()) })
 }
 
 /// Same as [`devm_enable`], but calls `devm_regulator_get_enable_optional`
@@ -102,7 +102,9 @@ pub fn devm_enable(dev: &Device<Bound>, name: &CStr) -> Result {
 pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> Result {
     // SAFETY: `dev` is a valid and bound device, while `name` is a valid C
     // string.
-    to_result(unsafe { bindings::devm_regulator_get_enable_optional(dev.as_raw(), name.as_ptr()) })
+    to_result(unsafe {
+        bindings::devm_regulator_get_enable_optional(dev.as_raw(), name.as_char_ptr())
+    })
 }
 
 /// A `struct regulator` abstraction.
@@ -268,7 +270,8 @@ pub fn get_voltage(&self) -> Result<Voltage> {
     fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
         // SAFETY: It is safe to call `regulator_get()`, on a device pointer
         // received from the C code.
-        let inner = from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_ptr()) })?;
+        let inner =
+            from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_char_ptr()) })?;
 
         // SAFETY: We can safely trust `inner` to be a pointer to a valid
         // regulator if `ERR_PTR` was not returned.

-- 
2.51.1

