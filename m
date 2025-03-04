Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A181DA4E922
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0725E10E664;
	Tue,  4 Mar 2025 17:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h2ZE3ycl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BB310E305;
 Tue,  4 Mar 2025 17:36:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3012BA45AB2;
 Tue,  4 Mar 2025 17:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7674C4CEE9;
 Tue,  4 Mar 2025 17:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741109770;
 bh=VWb05+i6gtUm2qjEL+/as6rN5zfg3VkaaaJqFy7VfTE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h2ZE3yclgc34fDhaGM2qEAHNmfCkQoDUpSzRjh1JM7sk3v/5XXEJer+QU+240LBSE
 kAxmK5wI0MsH6FuFoLoNH4M8AHT4jD6Wr4nJ4VOQUDnKWXru8xWHXvHws2LTsnzL4O
 iwJeJVs/8kvrYlBQ7SdxlF+M5DpIPVMwZ9sYotsWYyn6UbDJS/rJIhDE+HIyxn69VK
 Ld+ea8vPVr05iXacetdof/pQA1W+W7QjsorHjDx19LapBuS6d57kSkTv7urx4JzPYG
 fIPUhaTwhsEvA5lhUOVIXzejZfHTQ+GEjsI0c3SKGfara/eEiMI49PsdQLu29MEQqG
 FZVq5K1ADNzXQ==
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
Subject: [PATCH v5 1/5] rust: module: add type `LocalModule`
Date: Tue,  4 Mar 2025 18:34:48 +0100
Message-ID: <20250304173555.2496-2-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304173555.2496-1-dakr@kernel.org>
References: <20250304173555.2496-1-dakr@kernel.org>
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

This is first used by the `module_firmware!` macro introduced in a
subsequent patch.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/macros/module.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index cdf94f4982df..6ba9210677c5 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -228,6 +228,8 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
                 kernel::ThisModule::from_ptr(core::ptr::null_mut())
             }};
 
+            type LocalModule = {type_};
+
             impl kernel::ModuleMetadata for {type_} {{
                 const NAME: &'static kernel::str::CStr = kernel::c_str!(\"{name}\");
             }}
-- 
2.48.1

