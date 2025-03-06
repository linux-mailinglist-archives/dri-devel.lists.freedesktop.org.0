Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A65A559A1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 23:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5237310EA9E;
	Thu,  6 Mar 2025 22:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LEDnF/vA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C31A10EA9C;
 Thu,  6 Mar 2025 22:23:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 07D485C57DD;
 Thu,  6 Mar 2025 22:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C56EC4CEE9;
 Thu,  6 Mar 2025 22:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741299832;
 bh=y3CZ8ZJK599hbiqH7CSxRE1Iiyt7j7EOyB3glexphq4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LEDnF/vAatuGoGS+jJ/f8Il9WWcjMiMR52s7GqhoM1H4CT+lNLEGSl/8twSncm9K9
 VhHca6D76eqleQx4IeiIcOiKo78v8SEwd77XX44t1sIsI/siVVY8xh7JXCVcv/m1Os
 GKi62DLNuE9J7e+uiPAemMzd+tT9Kcz52TbrE62MJcVtBiG8ot2YDrbbKm9oqzSZI3
 wYA8lWbI9M7DACASeAdo1E0303TcVmLEl1GtwhUspNlb+sX7BW0AzOOyTgZxrK6wjc
 DgdVys5kg1YAUSc3zuHdDCJethaX59mIgaGzpXXlPpb2Jqtt5ACy+G4PCM1QUY6VFY
 VPRgyxiKmzhTQ==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com,
 zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v6 1/5] rust: module: add type `LocalModule`
Date: Thu,  6 Mar 2025 23:23:27 +0100
Message-ID: <20250306222336.23482-2-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306222336.23482-1-dakr@kernel.org>
References: <20250306222336.23482-1-dakr@kernel.org>
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

The `LocalModule` type is the type of the module created by `module!`,
`module_pci_driver!`, `module_platform_driver!`, etc.

Since the exact type of the module is sometimes generated on the fly by
the listed macros, provide an alias.

This is first used by the `module_firmware!` macro.

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/macros/module.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index cdf94f4982df..110e59c64197 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -228,6 +228,10 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
                 kernel::ThisModule::from_ptr(core::ptr::null_mut())
             }};
 
+            /// The `LocalModule` type is the type of the module created by `module!`,
+            /// `module_pci_driver!`, `module_platform_driver!`, etc.
+            type LocalModule = {type_};
+
             impl kernel::ModuleMetadata for {type_} {{
                 const NAME: &'static kernel::str::CStr = kernel::c_str!(\"{name}\");
             }}
-- 
2.48.1

