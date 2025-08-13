Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB849B24E7C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EF110E76B;
	Wed, 13 Aug 2025 15:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RbNKPAfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5C110E76B;
 Wed, 13 Aug 2025 15:59:47 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4b109c781c4so175991cf.3; 
 Wed, 13 Aug 2025 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100786; x=1755705586; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ds0sd9CSyQTd+8w9NdPNI+kGfpLQ87PIjaVbK8R6JG4=;
 b=RbNKPAfaXXlvvspi3b09xS9U8sgrPr4xKuOQKQI14ApT3KpOq471H7vSBYqMt26SpV
 GyqxWa1rnLZYJTP3sbJ/WTobXfnEW0v7vcacidHlfH0LqBREx0y2hqnND7LEVYaFl3b1
 AV8bXTiGiXvt8fVdN8+qt7gfi0wB6rwasSuKI2TMKSYLuKhMZ0nqaSprEBQWqukDvWjH
 ETztI1e+Wtz6Tet3kMTvTPi5mPg2Ny3o/GT5w8aDcSIXho3+3g9zICpYYGrNQ2Eaapei
 h1pUJyi/ShDP5PgHeadXLmLL6xH1d9Xfsmzo+2t57X/qZY0oJP7IbeLERmT+zCkug6V3
 tplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100786; x=1755705586;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ds0sd9CSyQTd+8w9NdPNI+kGfpLQ87PIjaVbK8R6JG4=;
 b=nZH7eWT5TMjK4o1Ng6qg8OwRpUpb5B2VLFqF7OAdn8MtetiD+vR2nCjG6gqC3uUGqy
 x8P+MyiNQsskjVn2UGCITGGj0t5dqbdsyIsyMQYUnk9o9PilGdYyE5+krXz8DbpZMXzk
 vbgX8lqH9g1IwfGcvR3BOp8glrvs2Gt3WCkAcBP4j6s9EZZusSc0/F5c5a8jkXIG20KI
 TnuPn+r8txrywvVHkFYPvf4tIDfzr1ObeCdZuq0ijWURaa5ofsdtfKA+dIoOWHq5j0y/
 DmGImwtotENIpuP8+h60qqRyAG81q6D12Ezuw9SAcEHN1ND3PvLlBP8xu9zWz/J1D631
 G9wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmqg5B1KFtELnjOo4Xv4Tq8pJTqI9YMMiq9xTF0XxxP2PevIGGhO4z0oplgdRzFvg3TWroHmHq3Ug=@lists.freedesktop.org,
 AJvYcCVCs4nqyqsDScUfua5d2I9fYye5ybtkNCCCaMo+P+f1aWPo7OnBHU8uqcui6CpdCyQ6BSpbLpprzg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+wLmRt2e4QCUX2zXjxVb+eFf9oVJnSixBGH5SVU2xiAQldUyT
 2kZg3LkfnWqvBcadgJEhMC32laVdGSd6x5+mgf+Z1PHfXLK0AWpcEBUB
X-Gm-Gg: ASbGncu6Cfu4RKOBe+cr5La2p7XWEPGLvnApT3+Eas8HP64gDsZi/+lZBka2V67qp1z
 XSEPs+bQkZ1eKJ1TAOPoX7DjE6o0yJgfcdQo8OpIv6a42l/kZ7LOImHDhEGIW1LaYE/qXwr0lB7
 u85IUwGXXebo7/Spl+fITsANAWtlXn+As33Nr+tyqSX89Be7eTskcNNGV/gAX8AfBnW0dkQqaJs
 6zlYBbqPCF8Zz7Dat0MzUh0VFOxV2KC6QtPe7/kx5y4blDqbw6kbpxEMWJdQpokuB7PBx2Iyk6S
 S4y2sEqKdtZj7VmoNmE3tkwinvDnZSDdLRYhdvKqBAjL9NwkrL1a8gstax41Yb9uilQpqbD1a6O
 PzG8PX2nq1zyvhFzydk+K7wPo3q4H90ToJ5mKuZ7uAt2YOgukGXLyxj6ApIUo7ekbZOs/JRiNBu
 d4vHxRPYCQdazDU0yHIKEu0sGdz2VS5cIpSTVHScM=
X-Google-Smtp-Source: AGHT+IGzmio4gQcQhVHqdVVj3T/dp8/AnBV2SNRMYaPtvVI0BMHcZ69oZYPC29RV5DhuQIaBmMWhHg==
X-Received: by 2002:ac8:5a49:0:b0:4b1:e3:7f66 with SMTP id
 d75a77b69052e-4b100e3871emr30995001cf.4.1755100785956; 
 Wed, 13 Aug 2025 08:59:45 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:45 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:17 -0400
Subject: [PATCH v2 07/19] rust: device: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-7-00be80fc541b@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100760; l=2297;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=FPYWOVsji3ixX2iS2gVF/tvnt0qaiqF7Xfo+QifuOUk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNa4PcugqYrk3DuJ2Yn4vXySgpkZdlXpGXwDr9pq0jCPDnN1yG3NSwir9jXLBspeW3iRBmJ3qzJ
 EgNU8dPTeqg4=
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
 rust/kernel/device.rs          | 4 +---
 rust/kernel/device/property.rs | 6 +++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 449776474044..ba83cf3624fd 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -10,8 +10,6 @@
 };
 use core::{marker::PhantomData, ptr};
 
-#[cfg(CONFIG_PRINTK)]
-use crate::c_str;
 use crate::str::CStrExt as _;
 
 pub mod property;
@@ -265,7 +263,7 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             bindings::_dev_printk(
                 klevel.as_ptr().cast::<crate::ffi::c_char>(),
                 self.as_raw(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&msg).cast::<crate::ffi::c_void>(),
             )
         };
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 3a332a8c53a9..3eb3f36d66d0 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -178,11 +178,11 @@ pub fn property_count_elem<T: PropertyInt>(&self, name: &CStr) -> Result<usize>
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{c_str, device::{Device, property::FwNode}, str::CString};
+    /// # use kernel::{device::{Device, property::FwNode}, str::CString};
     /// fn examples(dev: &Device) -> Result {
     ///     let fwnode = dev.fwnode().ok_or(ENOENT)?;
-    ///     let b: u32 = fwnode.property_read(c_str!("some-number")).required_by(dev)?;
-    ///     if let Some(s) = fwnode.property_read::<CString>(c_str!("some-str")).optional() {
+    ///     let b: u32 = fwnode.property_read(c"some-number").required_by(dev)?;
+    ///     if let Some(s) = fwnode.property_read::<CString>(c"some-str").optional() {
     ///         // ...
     ///     }
     ///     Ok(())

-- 
2.50.1

