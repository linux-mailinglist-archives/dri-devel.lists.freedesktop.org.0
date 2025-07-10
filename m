Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94962B006C8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A0F10E90E;
	Thu, 10 Jul 2025 15:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bus6Sy8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA1D10E90A;
 Thu, 10 Jul 2025 15:32:03 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-702cbfe860cso11403596d6.1; 
 Thu, 10 Jul 2025 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161523; x=1752766323; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gjJPn9BNZDTlQCUGZ6ZHdjrXUEWbzobkN6Ni4tq8q/s=;
 b=Bus6Sy8muyVYyd8w0eYMw6d//wAlC/dUhNdpBxjs3PqxOxZmwL+yYKV89TzA0jl+l0
 V6snLQnF4OX6XHdVeK+We3JsWSXWvOasy+YMFemdzCUoDeauIQxKw+LAbuTOyO0r+9QT
 R37i83wsdXW87dLHhlaoUosYFnLo2mUavvHjXyGME3ycR/H+i/aqWt3WD/YMhLebEoTv
 ueh71fjuj9CjFbKeFLF97FNMCKtdYpK5V8SpLKpGSeNExBKlFw8IbHRLVpjscbgqx3TQ
 hWqz169qyRdOKaF8my78EFQx/AyhsC9eb68m9etTB4SwuspPdqGQ9F39rJE/AaL5tLVI
 0Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161523; x=1752766323;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gjJPn9BNZDTlQCUGZ6ZHdjrXUEWbzobkN6Ni4tq8q/s=;
 b=kbaM4KXY1bYUqXLbWVBhxFHe7dKvLjUka+S6aa4/YhKuPM5mNupIUUx5/LDSn7dSiY
 PmC161L6bII+t2nolnpZXWIYsLqB80Lz8qrVGe1vZelxI9LMee53XemaU7m4kjBDiQ8x
 4sjdmXD9YDZpIA1Z4qtkggcx5Gr9BuuyeRpzqgL+55I4Nd7hXhjbJucut3pSNTiq+v/e
 /fQaXkEb8JqA4HoS943eRyBsvo7fSKFzlzAxhrnLO5gTY7cKCcYn46OGoGPnw8xJYvpa
 /62t2Kmy9I8CrII47efq0IIr2ec9Wf1lwO7D2mcm1k/E7eKqU2BcQ/s4VvXJEPm/6Hpg
 fAlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9x3IQH9zZ3iLsk5xyBTBkbKnoqWPcZKAQ4CSq0engvT4XxnHIlQTpUPSfOVSWW4nWBDssCeGaMQ==@lists.freedesktop.org,
 AJvYcCXpo+WNNpcVhI+kjkyPczcne0vFod9UEBV/7xLBV03Qnp2y/O5ShRa2LVonFT6qnMDUyYgB+L9paVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWtdhwEQjwtPd585nGyoXCb1z37dKS90eF2meHIwCvnGYT20GZ
 JMmqUxJN0sxRlzHTLLaU77U49XSrgJH/mISTWHdnWwUhq+E34skGpGjD
X-Gm-Gg: ASbGncshgRlZCP0LaLJRlzsLgapR8Bd0+cQJPdZ3huzabhvkrmKyqVTucjUfhqONLax
 WyCDEL9hqqjJQ0MSM0CIgB2UfFkSOxy24Z17GdKgKXehAWqaabsIYijt9yyK6uvS9nJz02r2UpZ
 pHk2B8OJn66kXJiRlKnHdZxkdPI/BRjFsPJRC9wRmzLuZ10bIGEcPfXHbEVtDnd3erzoBW8R4Qy
 0a35R5gGNMeiDn7G8ow7QdL3pII5ma5uyzKOJ5dKGRU6c2pb1v65FhL63LbVYm97o5tdtSZ+vhZ
 i2Uu0YiVe85b+r0kvPm8B7FSt38Yqssx2Lg5WfBLHyh+CVvw+Zdi+b8IN3uZBFIBrRZDZY2ysrs
 PsDFZECWqFGdAU0i/r/3zu+gJ5KRJNAOix/awHqWit256MB6HbvRW/HNifA==
X-Google-Smtp-Source: AGHT+IHjIbts0URjbxS9KvRYcAvq4YRl3uR9tFk562fCAP2FVfBcN0PJZZlEyH/xPHjBXW04p9wpRQ==
X-Received: by 2002:a05:6214:3d11:b0:6fa:a4ed:cce5 with SMTP id
 6a1803df08f44-7048b9da2e3mr90346426d6.44.1752161522568; 
 Thu, 10 Jul 2025 08:32:02 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:32:02 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:17 -0400
Subject: [PATCH 14/17] rust: platform: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-14-027420ea799e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161490; l=2804;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=b7MnZtqZPQC4U8mIjLdzpMTp0A3ghkW1nvaMttMu1TY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIC5PltnODTYX8vUFuqLnupbovnoGnPtVA8TJd95OaL9bqCetFK1JYHe9Aro3uVPT4GacvOI9dC
 qPGGQfSlBCgM=
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
 rust/kernel/platform.rs              | 4 ++--
 samples/rust/rust_driver_faux.rs     | 4 ++--
 samples/rust/rust_driver_platform.rs | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 0a6a6be732b2..99ad0b132ab6 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -125,7 +125,7 @@ macro_rules! module_platform_driver {
 /// # Examples
 ///
 ///```
-/// # use kernel::{bindings, c_str, device::Core, of, platform};
+/// # use kernel::{bindings, device::Core, of, platform};
 ///
 /// struct MyDriver;
 ///
@@ -134,7 +134,7 @@ macro_rules! module_platform_driver {
 ///     MODULE_OF_TABLE,
 ///     <MyDriver as platform::Driver>::IdInfo,
 ///     [
-///         (of::DeviceId::new(c_str!("test,device")), ())
+///         (of::DeviceId::new(c"test,device"), ())
 ///     ]
 /// );
 ///
diff --git a/samples/rust/rust_driver_faux.rs b/samples/rust/rust_driver_faux.rs
index ecc9fd378cbd..23add3160693 100644
--- a/samples/rust/rust_driver_faux.rs
+++ b/samples/rust/rust_driver_faux.rs
@@ -2,7 +2,7 @@
 
 //! Rust faux device sample.
 
-use kernel::{c_str, faux, prelude::*, Module};
+use kernel::{faux, prelude::*, Module};
 
 module! {
     type: SampleModule,
@@ -20,7 +20,7 @@ impl Module for SampleModule {
     fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_info!("Initialising Rust Faux Device Sample\n");
 
-        let reg = faux::Registration::new(c_str!("rust-faux-sample-device"), None)?;
+        let reg = faux::Registration::new(c"rust-faux-sample-device", None)?;
 
         dev_info!(reg.as_ref(), "Hello from faux device!\n");
 
diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_driver_platform.rs
index 8b42b3cfb363..e6487a970a59 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -2,7 +2,7 @@
 
 //! Rust Platform driver sample.
 
-use kernel::{c_str, device::Core, of, platform, prelude::*, types::ARef};
+use kernel::{device::Core, of, platform, prelude::*, types::ARef};
 
 struct SampleDriver {
     pdev: ARef<platform::Device>,
@@ -14,7 +14,7 @@ struct SampleDriver {
     OF_TABLE,
     MODULE_OF_TABLE,
     <SampleDriver as platform::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("test,rust-device")), Info(42))]
+    [(of::DeviceId::new(c"test,rust-device"), Info(42))]
 );
 
 impl platform::Driver for SampleDriver {

-- 
2.50.0

