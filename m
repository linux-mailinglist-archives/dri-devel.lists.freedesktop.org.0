Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630AB006BC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F8C10E8FF;
	Thu, 10 Jul 2025 15:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WZPyMI+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5172610E90A;
 Thu, 10 Jul 2025 15:31:47 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6fad8b4c927so10268296d6.0; 
 Thu, 10 Jul 2025 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161506; x=1752766306; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A0zIVbcphTDjCV/BRYSz6swPeiPXn1qULo40NKxP67Q=;
 b=WZPyMI+521evQmQ/HmyEuXElce76k8d8AZkLBmDfU9Sokp7T/YhMarXrzN72pVxJ8F
 Vbvbyn4x3QJbSvetuDuQ56x9lcC5NYx1LTKd8JvIOBZUyKVOWRDJhu+0SxRiqTRwLDuS
 OkMb0vPSZzDecQ1Qic3mqYwL8csAkeLrCBauuz8ggKyR1rIjMdEVIpsG1Pbjk2IbGu3+
 M1LBqcLmhCU1IKn6Skp35+92RI5RUtOAuUVXVPp0Z1+VX3+nzdy172i7A1YNE6OEFJA7
 yPShgHdQZOKpqvsbsPNwxN5u+QAb8U/Z01s32rRWYqabkpjFUaaiPlEd1IiQTqLskgas
 kOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161506; x=1752766306;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0zIVbcphTDjCV/BRYSz6swPeiPXn1qULo40NKxP67Q=;
 b=wCSc4sLO7ZC+z3zH91YaynhDQm4lMtO70O9QdvtfA5nda/4BqZGzZAYA9tKgPHs2Hu
 m8UD2uCNi34gNpehmeYQPJKikgkmDfPURfqaHsoE/k1D0+PawJhBZe3rzJaZJuU2uG+s
 yKsXkfY4Iv9Ifbmbhxwbjfu5fayIC1SA3izTCMxbp+Ur9nMDYXmFUloJNx1dUb2G9Br5
 eB1Y6kS58ELNMFpFF6MQYL5U3tbtiSrawVCRq4SE3PPvO7WnaMJ+yJqN3sNDZpBEZx54
 IuUbev8dcvuGremM2iXD+QOCm508ZyviNX8+LIolVjCVLkCN3nWSKA8P6vXxOtb5FZGi
 QMLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTz1hZ46s9OoO0Cc+Dm8Yy4eUzOn/xaqTbZnRSybW3Jm/rDuK/hfTEuAeWu3D/klZzl910ud9mO6o=@lists.freedesktop.org,
 AJvYcCWZ6Ig7imQIUqo1WYZHfaUpxb9oRVSfnwA7K659M0YQ+rtnZaolzgFG76Dqloh9deFYQo5D3fuSyw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzeUgulSMiOmrWUkFZ5UAom1HpBlttBbWZt89Taj8LjJMoj84O
 t9w7lgarXGnWFncwkMTn1Tq8o6eQpWpjzGAWWs5kp/o4byJyPCWpxD3b
X-Gm-Gg: ASbGnctQC8w2xg/I2mOXSU7M+IIb8k5EQPH7q3RFpTRNxj+0GqL08+Py3o/kjrzEse7
 F1ZJ4ptsvPl1R4UlxPBrycIhM0aWzztdCFnJtPkRxOd36d0yKWoiAHFbrLSeXhzqcZgMBh9v5Hz
 K9F5OdQe/0QrQQ41atm/DmjfYfQKHAK8VwL8H2CwmQZCs2S6tTi8juxm0d9ks5LA7u0dCcBi9JC
 RVYn8uTe5d4INWQXilO8i5iJ/D/CT5StCCl+SKJGSKyIFrTmNE417mHR3141CuPpaIWjnSRte14
 awH5Xpc9bYvpfHbqNdoK2lX208QxS8HKz6mGxgdVMIBJQ8JmadN13i7Lm47pC141HOf6zQ3AyZ2
 kq5XujARClnB8DeiCqEbGNkGdsHmxFGNl/4jEtg2GPPZgtCCSVRY6W6xMEQ==
X-Google-Smtp-Source: AGHT+IGcu2AWwgL23R/GZcRg4GNhqiTRg3tVkCGWznIBgtE8Kyf5DTvce0/bAy+ygow+T8DZUkNSVg==
X-Received: by 2002:ad4:5aa9:0:b0:6fb:6114:1034 with SMTP id
 6a1803df08f44-70495068decmr72119166d6.39.1752161506061; 
 Thu, 10 Jul 2025 08:31:46 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:45 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:09 -0400
Subject: [PATCH 06/17] rust: cpufreq: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-6-027420ea799e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161489; l=2282;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=VNZQXHbrPNQTjnCfNmCZZ01KeKVkMs9GB6vXbtVxjro=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJt8ypGIS+ehjdJ0134iQriRSNjL+xYEiSlM8eZgFuoZS1V3HRYbC3s63Q2FJIma29BKt9XxA5D
 3g7BKjvyMGgk=
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
 drivers/cpufreq/rcpufreq_dt.rs | 5 ++---
 rust/kernel/cpufreq.rs         | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 4608d2286fa1..0b4feb27b4f4 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -3,7 +3,6 @@
 //! Rust based implementation of the cpufreq-dt driver.
 
 use kernel::{
-    c_str,
     clk::Clk,
     cpu, cpufreq,
     cpumask::CpumaskVar,
@@ -55,7 +54,7 @@ impl opp::ConfigOps for CPUFreqDTDriver {}
 
 #[vtable]
 impl cpufreq::Driver for CPUFreqDTDriver {
-    const NAME: &'static CStr = c_str!("cpufreq-dt");
+    const NAME: &'static CStr = c"cpufreq-dt";
     const FLAGS: u16 = cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV;
     const BOOST_ENABLED: bool = true;
 
@@ -200,7 +199,7 @@ fn register_em(policy: &mut cpufreq::Policy) {
     OF_TABLE,
     MODULE_OF_TABLE,
     <CPUFreqDTDriver as platform::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("operating-points-v2")), ())]
+    [(of::DeviceId::new(c"operating-points-v2"), ())]
 );
 
 impl platform::Driver for CPUFreqDTDriver {
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 71d601f7c261..0f316dfeb5dd 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -841,7 +841,6 @@ fn register_em(_policy: &mut Policy) {
 /// ```
 /// use kernel::{
 ///     cpufreq,
-///     c_str,
 ///     device::{Core, Device},
 ///     macros::vtable,
 ///     of, platform,
@@ -854,7 +853,7 @@ fn register_em(_policy: &mut Policy) {
 ///
 /// #[vtable]
 /// impl cpufreq::Driver for SampleDriver {
-///     const NAME: &'static CStr = c_str!("cpufreq-sample");
+///     const NAME: &'static CStr = c"cpufreq-sample";
 ///     const FLAGS: u16 = cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV;
 ///     const BOOST_ENABLED: bool = true;
 ///

-- 
2.50.0

