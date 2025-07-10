Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D387BB006CD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B2610E912;
	Thu, 10 Jul 2025 15:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gn4zlhC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC6D10E910;
 Thu, 10 Jul 2025 15:32:10 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6fadb9a0325so9307956d6.2; 
 Thu, 10 Jul 2025 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161529; x=1752766329; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qg9MyoLzW2O/wZTFQuwcCSu9JeslcLq4bzCQcPCtBGw=;
 b=gn4zlhC5U5VqY760TCYZ4Ra0eAkVydtQeqEokPJvtH7JyMyDpxpQOTWwuXLgjkrO4Z
 kyf7mLHCBOCiVZdZwfNhSzUM5eQZlE0zIZqG9pU/fiJs0cXgVTz4d0uBAbBjv/HXAhnQ
 j9P7Fl0f2AGUOeZESIpxqZmhOkQURUVjciaK8IjgHfB3MBTDaoJhJjIm5sxVyGq7twcN
 0G+jUVUq6ZxxufHb2IX/3Vx7Dk6OZqr6cuCVdllSR7NRCrbuMIltN+EfkrcN7eHFquTy
 molUBNUwW3lXJgjIqO/6uY/kTddMYfXtg5+bXA0uWG044E7S/Uk09/r1NUXh0Z2hbek/
 +/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161529; x=1752766329;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qg9MyoLzW2O/wZTFQuwcCSu9JeslcLq4bzCQcPCtBGw=;
 b=UjEd7wprASDbZbKe7AYwjZARDGq0IPXvdKH/Bj4RSQQkHDZjYOLWGPa4XAPV4RJNlm
 sIttKT6LaAGK0R9FbcVrBh7B8tGB2V52fpADquUu30wWvy1XKxFgQ8gZ27qjQhcOFnIo
 I6DR5GA9aX3yBq+xKANG5nzRLQVf04XgRE0rn8Ich3wJOXsjkGBDbm8VNTkt2hWRzpuM
 WEHgyKFbb9Uo53yqcX7aW2s0ExvQkDEMrD4wx5eF2jiDLqBN5Xqdtfa7xzhmMgHqmzKu
 NvIRiREI0CmDDUwe6Jtp8rU3AOqW8E/WheDcz2x+tJvSZlNSp2RJddPEqVxL/R9MxIOe
 S4hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmWW4qC2uA8yo6ib2YWsdrHXUZshH2L180fX5ivav1HSUayYhoHvPcsMDcXHIScy2fd7LJXF4tZeU=@lists.freedesktop.org,
 AJvYcCX8TFiZgeGlOkQYcRGoZkTF1JwnLa/t25Mcin5hk/2BMNN/Xbx6CTF+uXtKLS4vqBx5f1VoNh+TrQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo44HrbtEP5ug/lzCT0216cwA5iIWx5VR4nAGWVjvRCeeciAsr
 dXzsql5rAGfdinPa+xhGrtphBpoauOR8PyozuqCOpRyvFxxFAz9Z0oU/
X-Gm-Gg: ASbGncv6g4od94soE7j6Vc5oXau9qk0/P5j7mAG5v/JTElcqHrCWKf0cngm9l9kXNwN
 Y3s86V0QqWeWKjHtJbTTGhNkfIk0sYtMT6+bRcS8jsyPZkyP08W9dAwdjZo4NdpcxT98JQ/Qpmh
 fnVEoNndmh+waN95c6Nce4BpkHlhbO3Uuw1Je3qN5SOIFwsp1oR/Fgnw7w7UQ31mVIrA9fXAgd6
 GKmQsBMec9Qln5qPCc7NTphZT7YJGwYkmVZYlsO9FUWxkPjLfL/8XHu6XjHpnZBvfbwQdbYI7RA
 VSHZgBanzWlTqBD+0r80ZCSgsEVBbPIBDyetyvJukIU/5ahkVgWX7hiLgxvk/x1qAPz5WLFSo8e
 j4/62knPA5QmpznnuLfrk8SZfG06QuGsscjl/90zhlnf2EPOEroFYrPJddw==
X-Google-Smtp-Source: AGHT+IGR2RRZQW2bcini0bMXKS9fKRmwAOf5eVXkkfrEVuuKui6PaVOKJy0ulnbPEP69BzEKMolKgw==
X-Received: by 2002:a05:6214:328e:b0:6fa:bb26:1459 with SMTP id
 6a1803df08f44-70494eeb96cmr79324366d6.7.1752161529395; 
 Thu, 10 Jul 2025 08:32:09 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:32:08 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:20 -0400
Subject: [PATCH 17/17] rust: sync: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-17-027420ea799e@gmail.com>
References: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
In-Reply-To: <20250710-core-cstr-cstrings-v1-0-027420ea799e@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161491; l=3792;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=lLdnM+NUEuXkQdsCZ2Zc/ZWA5W8wgiORDQ2a6677Zzo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEQCLdocV7E4OivASyLh0mReapGH3HAqrlKw6p+xfkfcFh+9TajU5mVNbgdK6iJLvlwtkJLY9Sp
 YR4gNbcIrDgs=
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/block/rnull.rs         | 2 +-
 rust/kernel/sync.rs            | 5 ++---
 rust/kernel/sync/completion.rs | 2 +-
 rust/kernel/workqueue.rs       | 8 ++++----
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/block/rnull.rs b/drivers/block/rnull.rs
index 6366da12c5a5..9aa79b862b63 100644
--- a/drivers/block/rnull.rs
+++ b/drivers/block/rnull.rs
@@ -55,7 +55,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         })();
 
         try_pin_init!(Self {
-            _disk <- new_mutex!(disk?, "nullb:disk"),
+            _disk <- new_mutex!(disk?, c"nullb:disk"),
         })
     }
 }
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 63c99e015ad6..9a6d2753937d 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -43,7 +43,6 @@ impl LockClassKey {
     ///
     /// # Examples
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::alloc::KBox;
     /// # use kernel::types::ForeignOwnable;
     /// # use kernel::sync::{LockClassKey, SpinLock};
@@ -55,7 +54,7 @@ impl LockClassKey {
     /// {
     ///     stack_pin_init!(let num: SpinLock<u32> = SpinLock::new(
     ///         0,
-    ///         c_str!("my_spinlock"),
+    ///         c"my_spinlock",
     ///         // SAFETY: `key_ptr` is returned by the above `into_foreign()`, whose
     ///         // `from_foreign()` has not yet been called.
     ///         unsafe { <Pin<KBox<LockClassKey>> as ForeignOwnable>::borrow(key_ptr) }
@@ -111,6 +110,6 @@ macro_rules! optional_name {
         $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!()))
     };
     ($name:literal) => {
-        $crate::c_str!($name)
+        $name
     };
 }
diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index c50012a940a3..97d39c248793 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -34,7 +34,7 @@
 /// impl MyTask {
 ///     fn new() -> Result<Arc<Self>> {
 ///         let this = Arc::pin_init(pin_init!(MyTask {
-///             work <- new_work!("MyTask::work"),
+///             work <- new_work!(c"MyTask::work"),
 ///             done <- Completion::new(),
 ///         }), GFP_KERNEL)?;
 ///
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index cce23684af24..432624c69c72 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -51,7 +51,7 @@
 //!     fn new(value: i32) -> Result<Arc<Self>> {
 //!         Arc::pin_init(pin_init!(MyStruct {
 //!             value,
-//!             work <- new_work!("MyStruct::work"),
+//!             work <- new_work!(c"MyStruct::work"),
 //!         }), GFP_KERNEL)
 //!     }
 //! }
@@ -98,8 +98,8 @@
 //!         Arc::pin_init(pin_init!(MyStruct {
 //!             value_1,
 //!             value_2,
-//!             work_1 <- new_work!("MyStruct::work_1"),
-//!             work_2 <- new_work!("MyStruct::work_2"),
+//!             work_1 <- new_work!(c"MyStruct::work_1"),
+//!             work_2 <- new_work!(c"MyStruct::work_2"),
 //!         }), GFP_KERNEL)
 //!     }
 //! }
@@ -215,7 +215,7 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
         func: T,
     ) -> Result<(), AllocError> {
         let init = pin_init!(ClosureWork {
-            work <- new_work!("Queue::try_spawn"),
+            work <- new_work!(c"Queue::try_spawn"),
             func: Some(func),
         });
 

-- 
2.50.0

