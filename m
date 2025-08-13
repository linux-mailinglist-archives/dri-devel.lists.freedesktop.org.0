Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882ABB24E84
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 18:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94E910E771;
	Wed, 13 Aug 2025 16:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eLb78sY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E60810E774;
 Wed, 13 Aug 2025 16:00:09 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7e1d89fcc31so664548185a.1; 
 Wed, 13 Aug 2025 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100808; x=1755705608; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3Cr4skJMToxR5ZDNlOWKhFrCtS61lHTyy++Kenuer/M=;
 b=eLb78sY+3eHBJhyg0eNUolcIZi4uZRaWCm2ccHg2opdq020UHBexeJ/9siY1Dg2Ghy
 8t1WM+80iAt9zTIZQK2H3bdqEfIQ/xCNf1Ug+GM10fqGvdgHM1z6DbZ8hc0Sl7pMCats
 rY2ugBNvVR+alMede3HMbDbBGzxYO3iAzR+ST3EsZCcrvUW4TZXoIMZw2XDgnjq6KYp3
 rb7+dhGwlNdGIH7C3P0KoJhM34K+CLeQwSwYhckj0NLXlz06c5RYILkiT7JTO8kmcxbr
 cusV3chZYs3mKOmYFHEX9njkJIp5maFOfaLBJQhynB5VlnggipBZIVpdhQbW/ri2w5bf
 Je4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100808; x=1755705608;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Cr4skJMToxR5ZDNlOWKhFrCtS61lHTyy++Kenuer/M=;
 b=oVA3JGMLlE/jIWl5JG1Zw9KjBUbIi6/y1WPh7mDtMl31Jo+O4dZS18E2SUznDjPsFB
 MU30ZPYgFBgkUN55GjQcjcoB9QIwGsFbZWFCChcgx6lQD7RoXW2WqMd/CgJfPJWSiNP3
 ZYQPENi93stlMWBgx5aSPRITNAPiTgdBYRzkfP5EkkrqPNkzjYpr6bFc3ur24bVJs0WN
 bd6VmyyT0cusv7hwOfp4t9xVjBXA7astgtqBFCE5emXwWf9cRO27OUpvyba0h6JJ7VGG
 UY7bVc8aYe/rvtcllbovco6rINKfihOvgVMXrKB/tt8ZEkuK5k/J3+7Sbk8WujOtvgzf
 ZUVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/UsKGeNBrV6eQkEZL1YhGM4B02IQKpqTLdqeoTkFyxy2zcfL4IpJAosFLoxtXdRg7Aur/47+M3A==@lists.freedesktop.org,
 AJvYcCX4QbyI6bhLNkUutbuWU5LPxDBh6ST2W//xpjbqaI6rgFyOlVgZDz0+FBfmrha7Bu2+oJVYQaZ+0Cw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywCT/QDNewra0HABARe9H8WgXnIULq7hukKMufSQ69Q11Rz1lp
 B4xSsth7e6G6tOEDmVxAVHgjoIBUIDgO9vRxcP+FMhvGqGRH3wh1nwdQ
X-Gm-Gg: ASbGnctQZCu8y79XDM5jxC9SfIZ3sZkFq3fp3o/0Lz9NJeecW8+OK6yRRnKk9qz7wyR
 ObfQ8Zx8bjrL9pP+3Tg4Os5KOz3MqPRcjsvnhiD9iXe9m/HJMfqy372x/gosBCG9bCx8mmGsjDV
 PDTdliWz7GL+qY6R66cK0LtF3nzxMFjVLjlyPpLiOsLhFFm7SRpEJoXKXetLlh3N9VCY8EPC+fF
 QA98JkF9e48IZvC3Nh2t+gsJo4jjrzWTjDwE6K6MSGip4Xoa64uytfukrj/t3GJoJiIZ9VgfnXQ
 KiJ7UuyBaQssWB58ZFZsx4UNhQ2eqeYQVEqpn6ggndnVgZ92pZUOE7yXknk4KQWCf+GDrYZuZLt
 bczhv+0MOmC1EkK7CIjejOObhbZ+us0G6zGRx5fXwNKHBx5czQmIlgxrv0GcWXd1IhxSHaE2Wq2
 n1HYnu1psMSBUiDUyf5LLMGgVZfR6h
X-Google-Smtp-Source: AGHT+IF1FFwwiRWC7nkgIovb5g4WYGiTjLbCyBJ9eafSJnT0C/86p14jE6MKiVaAhyWdeKkN/zlclQ==
X-Received: by 2002:a05:620a:915f:b0:7e3:3894:113a with SMTP id
 af79cd13be357-7e86524c97cmr375547385a.16.1755100807777; 
 Wed, 13 Aug 2025 09:00:07 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.09.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 09:00:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:24 -0400
Subject: [PATCH v2 14/19] rust: platform: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-14-00be80fc541b@gmail.com>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
In-Reply-To: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
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
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100760; l=6208;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=WdNf+rNMPJXvic2D/eUcktVEJW6IWJS1FHmVPimoUkg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMbMNG4YU/3mJ20aJZ2/qg6/JFicKqrYK50E3yuOLMOfQVP1/s/6nskEMQz/DX+ne69Xn25k7GG
 4YI8+/fuWpgo=
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/platform.rs              |  6 +++---
 samples/rust/rust_driver_faux.rs     |  4 ++--
 samples/rust/rust_driver_platform.rs | 30 ++++++++++++++----------------
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 8f028c76f9fa..d1cc5cee1cf5 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -135,7 +135,7 @@ macro_rules! module_platform_driver {
 /// # Examples
 ///
 ///```
-/// # use kernel::{acpi, bindings, c_str, device::Core, of, platform};
+/// # use kernel::{acpi, bindings, device::Core, of, platform};
 ///
 /// struct MyDriver;
 ///
@@ -144,7 +144,7 @@ macro_rules! module_platform_driver {
 ///     MODULE_OF_TABLE,
 ///     <MyDriver as platform::Driver>::IdInfo,
 ///     [
-///         (of::DeviceId::new(c_str!("test,device")), ())
+///         (of::DeviceId::new(c"test,device"), ())
 ///     ]
 /// );
 ///
@@ -153,7 +153,7 @@ macro_rules! module_platform_driver {
 ///     MODULE_ACPI_TABLE,
 ///     <MyDriver as platform::Driver>::IdInfo,
 ///     [
-///         (acpi::DeviceId::new(c_str!("LNUXBEEF")), ())
+///         (acpi::DeviceId::new(c"LNUXBEEF"), ())
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
index ad08df0d73f0..b3fe45a43043 100644
--- a/samples/rust/rust_driver_platform.rs
+++ b/samples/rust/rust_driver_platform.rs
@@ -63,7 +63,7 @@
 //!
 
 use kernel::{
-    acpi, c_str,
+    acpi,
     device::{
         self,
         property::{FwNodeReferenceArgs, NArgs},
@@ -85,14 +85,14 @@ struct SampleDriver {
     OF_TABLE,
     MODULE_OF_TABLE,
     <SampleDriver as platform::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("test,rust-device")), Info(42))]
+    [(of::DeviceId::new(c"test,rust-device"), Info(42))]
 );
 
 kernel::acpi_device_table!(
     ACPI_TABLE,
     MODULE_ACPI_TABLE,
     <SampleDriver as platform::Driver>::IdInfo,
-    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), Info(0))]
+    [(acpi::DeviceId::new(c"LNUXBEEF"), Info(0))]
 );
 
 impl platform::Driver for SampleDriver {
@@ -126,49 +126,47 @@ impl SampleDriver {
     fn properties_parse(dev: &device::Device) -> Result {
         let fwnode = dev.fwnode().ok_or(ENOENT)?;
 
-        if let Ok(idx) =
-            fwnode.property_match_string(c_str!("compatible"), c_str!("test,rust-device"))
-        {
+        if let Ok(idx) = fwnode.property_match_string(c"compatible", c"test,rust-device") {
             dev_info!(dev, "matched compatible string idx = {}\n", idx);
         }
 
-        let name = c_str!("compatible");
+        let name = c"compatible";
         let prop = fwnode.property_read::<CString>(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}'\n");
 
-        let name = c_str!("test,bool-prop");
-        let prop = fwnode.property_read_bool(c_str!("test,bool-prop"));
+        let name = c"test,bool-prop";
+        let prop = fwnode.property_read_bool(c"test,bool-prop");
         dev_info!(dev, "'{name}'='{prop}'\n");
 
-        if fwnode.property_present(c_str!("test,u32-prop")) {
+        if fwnode.property_present(c"test,u32-prop") {
             dev_info!(dev, "'test,u32-prop' is present\n");
         }
 
-        let name = c_str!("test,u32-optional-prop");
+        let name = c"test,u32-optional-prop";
         let prop = fwnode.property_read::<u32>(name).or(0x12);
         dev_info!(dev, "'{name}'='{prop:#x}' (default = 0x12)\n");
 
         // A missing required property will print an error. Discard the error to
         // prevent properties_parse from failing in that case.
-        let name = c_str!("test,u32-required-prop");
+        let name = c"test,u32-required-prop";
         let _ = fwnode.property_read::<u32>(name).required_by(dev);
 
-        let name = c_str!("test,u32-prop");
+        let name = c"test,u32-prop";
         let prop: u32 = fwnode.property_read(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:#x}'\n");
 
-        let name = c_str!("test,i16-array");
+        let name = c"test,i16-array";
         let prop: [i16; 4] = fwnode.property_read(name).required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}'\n");
         let len = fwnode.property_count_elem::<u16>(name)?;
         dev_info!(dev, "'{name}' length is {len}\n");
 
-        let name = c_str!("test,i16-array");
+        let name = c"test,i16-array";
         let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;
         dev_info!(dev, "'{name}'='{prop:?}' (KVec)\n");
 
         for child in fwnode.children() {
-            let name = c_str!("test,ref-arg");
+            let name = c"test,ref-arg";
             let nargs = NArgs::N(2);
             let prop: FwNodeReferenceArgs = child.property_get_reference_args(name, nargs, 0)?;
             dev_info!(dev, "'{name}'='{prop:?}'\n");

-- 
2.50.1

