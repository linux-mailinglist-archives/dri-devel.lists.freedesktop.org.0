Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B551A46894
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7239310E98D;
	Wed, 26 Feb 2025 17:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fdcn+8sR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F4510E973;
 Wed, 26 Feb 2025 17:56:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0397614D3;
 Wed, 26 Feb 2025 17:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0E3C4CEE7;
 Wed, 26 Feb 2025 17:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740592568;
 bh=VWb05+i6gtUm2qjEL+/as6rN5zfg3VkaaaJqFy7VfTE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fdcn+8sR+GatvUYaAZHHzLLAAGsh2UzqruwvSYy0GxcigkHLLzJYBAic8orQ9bPHU
 Ulc1VgqwoZHhxmstu5mAfkhs/LaAnAy7SFktcB+crH4tVNk9eNTuwlUcKuZOt33RSx
 LI4AW8gfQRZqaTQW9SnU8NRAbn7bTPkKH5mxI3JP7kht/93vgHdph6hanooVwbks0r
 c9N11SGk/h8FAvg+a3MlAYYk16+28JrS2/3A0Mx/gXWH2kYeQGv7Ypp2b8E6mGUpNS
 W5mMhG3jROpUjysr1dBZjNmqhh6Qodr6lxHgeh4D9Al7lMPgxalcsn9C6E3Q3rMhVx
 YRfENSG2MubiQ==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com,
 zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 mcgrof@kernel.org, russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 1/6] rust: module: add type `LocalModule`
Date: Wed, 26 Feb 2025 18:55:43 +0100
Message-ID: <20250226175552.29381-2-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226175552.29381-1-dakr@kernel.org>
References: <20250226175552.29381-1-dakr@kernel.org>
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

