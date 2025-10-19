Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57573BEED95
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 23:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA5810E229;
	Sun, 19 Oct 2025 21:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IcBgCSzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFB010E229
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 21:31:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 75D2543B3C;
 Sun, 19 Oct 2025 21:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC02AC4CEE7;
 Sun, 19 Oct 2025 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760909481;
 bh=sApG3ZbJWTksJqIVkodaBxHNS4Hr0anMh4n685JAKh0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IcBgCSzHByUTg0KSFE2YM1558TixTmxwF02MD0Ww3VADciu/Lgk9WrbXSXsGsOcaC
 v6kMEo34mZA0JLdIPDM43OncXFjvRLZLRwVW7vZr7fMYiZgAndiThkdqHZg5bAjnpC
 94jwtQi5u8uivbJ/4fvAOYbSXhEt/PxHcW8V6BdzK0MWoXpKbXOunAy3ffRXj7R1M6
 dnsL/PYJUOmW7BfALr3gW9l/dimBr5iaveWEIDvnxLR0wsLf1XI3GeetXX1sqjLHb6
 Bv5r/a7HIE0buC/WueXJh7mVyIA3XNlCEAZ9ktEMuAVTaUiKBm2F727HQEcgVsHa4Z
 TYLOgNQsBVxGA==
From: Miguel Ojeda <ojeda@kernel.org>
To: tamird@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: Liam.Howlett@oracle.com, a.hindborg@kernel.org, airlied@gmail.com,
 aliceryhl@google.com, arve@android.com, axboe@kernel.dk,
 bhelgaas@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 brauner@kernel.org, broonie@kernel.org, cmllamas@google.com,
 dri-devel@lists.freedesktop.org, gary@garyguo.net, jack@suse.cz,
 joelagnelf@nvidia.com, justinstitt@google.com, kwilczynski@kernel.org,
 leitao@debian.org, lgirdwood@gmail.com, linux-block@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, llvm@lists.linux.dev, longman@redhat.com,
 lorenzo.stoakes@oracle.com, lossin@kernel.org, maco@android.com,
 mcgrof@kernel.org, mingo@redhat.com, mmaurer@google.com, morbo@google.com,
 mturquette@baylibre.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, nm@ti.com, peterz@infradead.org,
 russ.weight@linux.dev, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
 simona@ffwll.ch, surenb@google.com, tamird@gmail.com, tkjos@android.com,
 tmgross@umich.edu, urezki@gmail.com, vbabka@suse.cz, vireshk@kernel.org,
 viro@zeniv.linux.org.uk, will@kernel.org, patches@lists.linux.dev
Subject: [PATCH] samples: rust: debugfs: use `core::ffi::CStr` method names
Date: Sun, 19 Oct 2025 23:30:49 +0200
Message-ID: <20251019213049.2060970-1-ojeda@kernel.org>
In-Reply-To: <20251018-cstr-core-v18-7-9378a54385f8@gmail.com>
References: <20251018-cstr-core-v18-7-9378a54385f8@gmail.com>
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

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoiding methods that only exist on the latter.

This backslid in commit d4a5d397c7fb ("samples: rust: Add scoped debugfs
sample driver").

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 samples/rust/rust_debugfs_scoped.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_debugfs_scoped.rs b/samples/rust/rust_debugfs_scoped.rs
index b0c4e76b123e..eb870e9986b8 100644
--- a/samples/rust/rust_debugfs_scoped.rs
+++ b/samples/rust/rust_debugfs_scoped.rs
@@ -38,7 +38,7 @@ fn remove_file_write(
     mod_data
         .devices
         .lock()
-        .retain(|device| device.name.as_bytes() != to_remove.as_bytes());
+        .retain(|device| device.name.to_bytes() != to_remove.to_bytes());
     Ok(())
 }
 

base-commit: b214b442f2fa78aad04ebe1b5cad2c1d94120cb7
-- 
2.51.0

