Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BBCAD29D0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3669C10E26D;
	Mon,  9 Jun 2025 22:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GRbjvvlm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3850A10E06E;
 Mon,  9 Jun 2025 12:22:27 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-73bf5aa95e7so3110809b3a.1; 
 Mon, 09 Jun 2025 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749471747; x=1750076547; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YBch+ffur1O0Rgja7qluq4MVSQH3W827o3L8nkl80n0=;
 b=GRbjvvlmMwuoc0s5sz2gvE12okDQHv/WsweSIRbYZL3cEH/Jud4+C79ge/Gz79XB6t
 cPRw/e++1ALap2+3ST7qq7ORqJOzDrzab3vU44+226QkJQcsjCWlwuURBaGnjQF1hUvv
 83oLiev+Uos9bxms+dpe8Yx/LY0rVZ3nOZNY2SX2aeATVccB6c2QTDEJfMAmezRQLCY+
 fSHavWXOKNt0XJ69roU+xdhjESzXukD5ZXvX/h2YiN+CwOIo6vO6Lnk/kwIcXpLXl7nF
 eepS9Hfjkwv14dOeD7a8J9/3lNBLrKy1nQ0uykVdpGpSi6ZFjF+SnJwACkpd67GfSSup
 s0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749471747; x=1750076547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YBch+ffur1O0Rgja7qluq4MVSQH3W827o3L8nkl80n0=;
 b=vhPC5V+/X4jsB09v2yRRXTfkzDaOswwpmDXQgSFmNfBHqdyRVXIzdYHUFvtm3CiuQf
 xW/BJ/QO6QTvcRz9MButn9wr8Cp+YLywkGhsTB/5TQfS6ekZz7LA4vdnWIOFFP1d4nd5
 jZ5ZV8nbOGiJpxvLoLORSGJxELN/ximLc01k0cv2yCjZYMiAyPq1Tsun7FGgfJh3l8Zu
 F/APbs2gvag8rn7DK6sxeS2hqtw1c7GFqRzAZkJJsKE80utKPe/4QXxo2UxzTjrdSVg8
 zsXslVkL6g0RIv7HdLAep47G3n29plepMZczMlf9ULMo64G4vbS1MIXRyXxVzyjyXL3c
 JUXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKDS1RG7RPtQacvbRwAa7QZemfCgws69tvlzTu7kkoChuVzzTNFu6Z44W4HfXV6Kfve2p7d4daig==@lists.freedesktop.org,
 AJvYcCXaW5/uC/bucENfCAqlBr3WtdomKC7pr4Fh2RjhHdR9b/ED4ZjK3xg+LzdYYiv22jIrCPEVoezIBno=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDsDHPOiBgN/G49bDb3caJDRMlodvJZZnBYDyn2QKoTo2H9Jkd
 HQ3eGvr+vieSAMjUgPMu8MgSgUdAVsGhFaa8+zQybaoCI5jRG1f52U8S
X-Gm-Gg: ASbGncsFJ91DgpXczzLqrSHQuLo5ZULHnrsBZtYm0DAWBxaasFnRmwX2hOsoRQ0RTB+
 MJVOw2aN48DUXqpPKQy/pcYtJi7qPbQzIXzSvmOwSfP7VspQV5mJn4sC3XKE7Wr+OltDQdrr8Th
 si4yqCkl3NI/Pe5imm+p94efBsI3UXjykytfF3tltuVOQlQgo2B2FFQUlSFu3CtRyhXWHG9g3zM
 QE/LKledvac4Ib88S/6TcMhbGBwC/n43KuM0PdNXN+1gfemGIlk8JoVl/hTEGgzybwa2DUl6zE+
 y4pXlX0Vn7eaT06OEmrJrmJYQb/bg91EGhU4ssb4iMM0NQyEGeeNUd+mNV3iHhKKTzDJJrWX
X-Google-Smtp-Source: AGHT+IFN/6jpjwnUWAnmieziowXquVGyIPIEOCFl8zdXOz/2r+NiQoJ5BLmsN49W1/EDBbcGUv3y0g==
X-Received: by 2002:a05:6a21:6e41:b0:21f:62e7:cd08 with SMTP id
 adf61e73a8af0-21f62e7ce8dmr5864666637.8.1749471746484; 
 Mon, 09 Jun 2025 05:22:26 -0700 (PDT)
Received: from pop-os.. ([201.49.69.163]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5f7827c0sm5170285a12.62.2025.06.09.05.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 05:22:26 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: rafael@kernel.org, viresh.kumar@linaro.org, dakr@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mcgrof@kernel.org,
 russ.weight@linux.dev, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, leitao@debian.org, gregkh@linuxfoundation.org,
 david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
 fujita.tomonori@gmail.com, tamird@gmail.com, igor.korotin.linux@gmail.com,
 walmeida@microsoft.com, anisse@astier.eu
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, trintaeoitogc@gmail.com
Subject: [PATCH] rust: module: remove deprecated author key
Date: Mon,  9 Jun 2025 09:22:00 -0300
Message-Id: <20250609122200.179307-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Jun 2025 22:53:28 +0000
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

Commit 38559da6afb2 ("rust: module: introduce `authors` key") introduced
a new `authors` key to support multiple module authors, while keeping
the old `author` key for backward compatibility.

Now that all in-tree modules have migrated to `authors`, remove:
1. The deprecated `author` key support from the module macro
2. Legacy `author` entries from remaining modules

Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
 drivers/cpufreq/rcpufreq_dt.rs        | 2 +-
 drivers/gpu/drm/nova/nova.rs          | 2 +-
 drivers/gpu/nova-core/nova_core.rs    | 2 +-
 rust/kernel/firmware.rs               | 2 +-
 rust/macros/module.rs                 | 6 ------
 samples/rust/rust_configfs.rs         | 2 +-
 samples/rust/rust_driver_auxiliary.rs | 2 +-
 7 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 94ed81644fe1..bdf4b844de42 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -220,7 +220,7 @@ fn probe(
 module_platform_driver! {
     type: CPUFreqDTDriver,
     name: "cpufreq-dt",
-    author: "Viresh Kumar <viresh.kumar@linaro.org>",
+    authors: ["Viresh Kumar <viresh.kumar@linaro.org>"],
     description: "Generic CPUFreq DT driver",
     license: "GPL v2",
 }
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
index 902876aa14d1..64fd670e99e1 100644
--- a/drivers/gpu/drm/nova/nova.rs
+++ b/drivers/gpu/drm/nova/nova.rs
@@ -12,7 +12,7 @@
 kernel::module_auxiliary_driver! {
     type: NovaDriver,
     name: "Nova",
-    author: "Danilo Krummrich",
+    authors: ["Danilo Krummrich"],
     description: "Nova GPU driver",
     license: "GPL v2",
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 618632f0abcc..f405d7a99c28 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,7 +13,7 @@
 kernel::module_pci_driver! {
     type: driver::NovaCore,
     name: "NovaCore",
-    author: "Danilo Krummrich",
+    authors: ["Danilo Krummrich"],
     description: "Nova Core GPU driver",
     license: "GPL v2",
     firmware: [],
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 2494c96e105f..ed2fc20cba9b 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -181,7 +181,7 @@ unsafe impl Sync for Firmware {}
 /// module! {
 ///    type: MyModule,
 ///    name: "module_firmware_test",
-///    author: "Rust for Linux",
+///    authors: ["Rust for Linux"],
 ///    description: "module_firmware! test module",
 ///    license: "GPL",
 /// }
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 2ddd2eeb2852..5dd276a2e5cb 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -94,7 +94,6 @@ struct ModuleInfo {
     type_: String,
     license: String,
     name: String,
-    author: Option<String>,
     authors: Option<Vec<String>>,
     description: Option<String>,
     alias: Option<Vec<String>>,
@@ -108,7 +107,6 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
         const EXPECTED_KEYS: &[&str] = &[
             "type",
             "name",
-            "author",
             "authors",
             "description",
             "license",
@@ -134,7 +132,6 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
             match key.as_str() {
                 "type" => info.type_ = expect_ident(it),
                 "name" => info.name = expect_string_ascii(it),
-                "author" => info.author = Some(expect_string(it)),
                 "authors" => info.authors = Some(expect_string_array(it)),
                 "description" => info.description = Some(expect_string(it)),
                 "license" => info.license = expect_string_ascii(it),
@@ -179,9 +176,6 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
     // Rust does not allow hyphens in identifiers, use underscore instead.
     let ident = info.name.replace('-', "_");
     let mut modinfo = ModInfoBuilder::new(ident.as_ref());
-    if let Some(author) = info.author {
-        modinfo.emit("author", &author);
-    }
     if let Some(authors) = info.authors {
         for author in authors {
             modinfo.emit("author", &author);
diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
index 60ddbe62cda3..af04bfa35cb2 100644
--- a/samples/rust/rust_configfs.rs
+++ b/samples/rust/rust_configfs.rs
@@ -14,7 +14,7 @@
 module! {
     type: RustConfigfs,
     name: "rust_configfs",
-    author: "Rust for Linux Contributors",
+    authors: ["Rust for Linux Contributors"],
     description: "Rust configfs sample",
     license: "GPL",
 }
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index 3e15e6d002bb..abf3d55ed249 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -114,7 +114,7 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
 module! {
     type: SampleModule,
     name: "rust_driver_auxiliary",
-    author: "Danilo Krummrich",
+    authors: ["Danilo Krummrich"],
     description: "Rust auxiliary driver",
     license: "GPL v2",
 }
-- 
2.34.1

