Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40043B24E79
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DDF10E766;
	Wed, 13 Aug 2025 15:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UfBRAMjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC27910E77B;
 Wed, 13 Aug 2025 15:59:40 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4b109be3726so265801cf.2; 
 Wed, 13 Aug 2025 08:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100780; x=1755705580; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/uSi0/KFXiiCYmcIUU0pjTetKZWsYlG+no8vKmb84iA=;
 b=UfBRAMjTWbyhzCcdrgjVaivlf4Pix7OcehNscT/nziW31GX3TpeN8YUpnoF8cefEKw
 D0XU8Kn/u+vsFiziQPiil3Ot+Dv+aFAI3YWnGDdKFGPnnfx/Ghm6aVOtTBdEYoyAozWi
 gNxV68wTPU4cb+XsNEtxFyLuM8kz4f6iZXaUmyE4l0RvDa20BplHbNA82sqqpK2HIVNu
 7EQlMS4+JkdXT/ei3u32f5Zg/iUaK18apDHxLBjO0kAyNod59r3fXlackV4vqGG4aJtt
 YwR8TpAWIOpHNTAAGdHCi5me9TenQitINdTgKbxqHZvywJRD/nVZbOZF6qmdxNr2SiTr
 FjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100780; x=1755705580;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/uSi0/KFXiiCYmcIUU0pjTetKZWsYlG+no8vKmb84iA=;
 b=AizoA0NZGCPpIe2lCN+9EnqBq/pZ0Vh6K8crtPwH3zphRFhlMAPThTHUeJuGl7sveJ
 PmwvbYpS1eWZTMXmpbPeMbzdU2XUczFc8y17ApK2jx4fp9Y4LOgY5JwCQkMgCx6tsGwo
 WU+OWpCeaWhxUH5EdffxcyyNfIsYsyr4PWbja6EUwfPln1LQyBFFpOc//qpwmh2dpZwL
 MSBTfjA5vzOFWEcABNd6Jw40gxK8O3NINI+zVKUCPB53KjjkxeMEwOO6odKVjJw5dC/K
 bDTsjN31g2M60+1FotnuPx3LZFefBzFvAS0rsMP4xUInsvxJ6arWlYJ+qP5uXYCwmrPC
 dw1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj4ptv95RGchymNV5bisF9HYFoFkrgDgOh3+p4uvNqXaJMcMP/5cKA/PcZ5/e+esrzveHQAGhuIg==@lists.freedesktop.org,
 AJvYcCX7bzdRpmMhqOGJPjnM0zwVc7sx54a6cGlfpc7OapccqLJj3K8dU2dXZJGc1obEM6H+NLk1Mv+wOw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb4fCEWB91jZW/yumEZCzAEb9TME962oV58Ti+k5R2aKJf+SIw
 KuG0PcJoeyaF/2pZ11mhklrM0zQeSMjHaXzPC4TsxOpMm5T11766mO9t
X-Gm-Gg: ASbGncu48ScwW+cYuztSbL3IjCz5LLOccQD+XEbBuREurj/74aIr1UGe8BnU8+0GPHl
 l+G2MKWS2dnnXg3lsD+VZm11r2nB7VsDIyQotIkayCHo2VZeWbIZm26A+u3GV0GHN7MU0SndgF9
 l6AX1hs5X38gRW6jG8NNywIrY7qlBVG+zaRY2zFYD8Hu55r27LDvyK8UHUW6sNK3rH7UsxL0slQ
 qh+2D5Vb8iDL6moU9PbcjYvVM7Dk0ZZgEwH7YIAV7yMh/HKwcwDnejMENjd+HivACgsLUkreJlm
 FLNbsSmRanJvw0QrTt4wABomnGK5qp/ba0idGsbKQ0o0/IxCk8fkVX2BP3nQMTyeMGRYlHkV2/c
 ZOtFamy/PkC8L3NfdPoQ4LMDcwbHpW8k6ph2wL8+yR77U1r4UDUY0BoXYWeZdzqa8z68lKmp70o
 JcQDoJqJ0X5wchZGmBBN8qDONPOt+QksjojQdEZqI=
X-Google-Smtp-Source: AGHT+IEAmj18QhxLoJhKv5gl7oxN5rOUOYsu7xtf/ad0LtVX2HZm2WUPSGMiEf/0bbq/rLPvLyA/eg==
X-Received: by 2002:a05:622a:4811:b0:4af:230a:dadb with SMTP id
 d75a77b69052e-4b0fc6be691mr50407091cf.5.1755100779635; 
 Wed, 13 Aug 2025 08:59:39 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:39 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:15 -0400
Subject: [PATCH v2 05/19] rust: configfs: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-5-00be80fc541b@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100759; l=3197;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=EQZo1upB9M1x1JFdTpaV8Cq+trhQfkvbEQ0ucCR/Veg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMestgupOVA5qzlqQPukztYt1+taScdgyyamOqF0bRx/0xpl4F7OS1NMKmSJTbYBoooWukzcpGj
 E2jFgDmWmiQs=
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/configfs.rs       | 9 +++++----
 samples/rust/rust_configfs.rs | 5 ++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 9fb5ef825e41..69bb1fb53543 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -21,7 +21,6 @@
 //!
 //! ```ignore
 //! use kernel::alloc::flags;
-//! use kernel::c_str;
 //! use kernel::configfs_attrs;
 //! use kernel::configfs;
 //! use kernel::new_mutex;
@@ -50,7 +49,7 @@
 //!
 //!         try_pin_init!(Self {
 //!             config <- configfs::Subsystem::new(
-//!                 c_str!("rust_configfs"), item_type, Configuration::new()
+//!                 c"rust_configfs", item_type, Configuration::new()
 //!             ),
 //!         })
 //!     }
@@ -66,7 +65,7 @@
 //! impl Configuration {
 //!     fn new() -> impl PinInit<Self, Error> {
 //!         try_pin_init!(Self {
-//!             message: c_str!("Hello World\n"),
+//!             message: c"Hello World\n",
 //!             bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
 //!         })
 //!     }
@@ -1000,7 +999,9 @@ macro_rules! configfs_attrs {
                     static [< $data:upper _ $name:upper _ATTR >]:
                         $crate::configfs::Attribute<$attr, $data, $data> =
                             unsafe {
-                                $crate::configfs::Attribute::new(c_str!(::core::stringify!($name)))
+                                $crate::configfs::Attribute::new(
+                                    $crate::c_str!(::core::stringify!($name)),
+                                )
                             };
                 )*
 
diff --git a/samples/rust/rust_configfs.rs b/samples/rust/rust_configfs.rs
index 5005453f874d..ea84c23b784b 100644
--- a/samples/rust/rust_configfs.rs
+++ b/samples/rust/rust_configfs.rs
@@ -3,7 +3,6 @@
 //! Rust configfs sample.
 
 use kernel::alloc::flags;
-use kernel::c_str;
 use kernel::configfs;
 use kernel::configfs_attrs;
 use kernel::new_mutex;
@@ -35,7 +34,7 @@ struct Configuration {
 impl Configuration {
     fn new() -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
-            message: c_str!("Hello World\n"),
+            message: c"Hello World\n",
             bar <- new_mutex!((KBox::new([0; PAGE_SIZE], flags::GFP_KERNEL)?, 0)),
         })
     }
@@ -61,7 +60,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
 
         try_pin_init!(Self {
             config <- configfs::Subsystem::new(
-                c_str!("rust_configfs"), item_type, Configuration::new()
+                c"rust_configfs", item_type, Configuration::new()
             ),
         })
     }

-- 
2.50.1

