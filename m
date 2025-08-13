Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2039B24E75
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56AC10E765;
	Wed, 13 Aug 2025 15:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CSkDKWU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1D010E765;
 Wed, 13 Aug 2025 15:59:28 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4b109ac42c2so318041cf.1; 
 Wed, 13 Aug 2025 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100768; x=1755705568; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mcLQFrhiOp/Rq3w2uCcr+Vuz3BcbpuBMoaDB6Viof4c=;
 b=CSkDKWU25hbe5SRaIQEWMB4wSltibe7DIZI85ZENADHF0WtagjNhrF0SAYs5Y5C0fd
 pOYvBQnN600WBytOjcQbgr437Bw+0n+Rp90WtwTnCLClwI8vCPv5ig65b8hSGA5NLgN2
 RZu/cssJo6XwY1Yc+4SOVnAGOuDeRSEf58twX9eJu5Bv5vnxpuptO0wVmBKXHKeOnj0W
 JtmSdZufnlPoxoi1MGBzkmNGwoTSykAjCi2feg1JeyOUZMpm/Enpn8NDcCK+xLyqfIOq
 rrW9zFgRvHVipRh7W9ApHaGXo2TCHkAh9AgVn0q4aRKEClHxEHLTYRSOLlD1lPvdQWL9
 YZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100768; x=1755705568;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mcLQFrhiOp/Rq3w2uCcr+Vuz3BcbpuBMoaDB6Viof4c=;
 b=Yfw+XsBfJjF83Ui2xAMgQ0lt9aln4lOJ80xYuyipQuPHeWN4C4K5fj/7HTOIe4nSBg
 FmA9S/1vy8RssE3brEoLE2OAiKdfUCH5UVeZXFi7rwEYhF74a7PgOBAyB4yge7Z1IXVl
 N3fezS3QFcwgCzx6JlnN8tdTkvjX4C0p6ItdWdUiEnl5KjErobB9sVQ0svzEB8FWcWiR
 356E7VJICSD2yzUyaQhdkK3Gvg0W8+HROJKcQxA3FgeEEw0LXW0mD5TCx3PfpOhNet9l
 gpAw5XYuScmfRCsLndRvip3EYpVJAHwchs1013UgYu6OpfAD/Dy36IYIt/c1JoAgWXWd
 TaQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzIHBgJyT8U986oeROO7Mi1aU0KjvMoGv3Ng7jVcAdS5eZLNBs1K3ymJdqaIWn/WExipt4ZcUHCqU=@lists.freedesktop.org,
 AJvYcCW4rXiEKvBZ0yhf0p9FfWtQlwY8WFZG3XwqSmiCJ/q8UVI6yaClwPlyKB2Lv2aCUGX0XhicdMd/HQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweTGldHHUNuKL4DOc79oj0/gj7YDKDL/laV6vqL2HHTgxC+19T
 dBTiImWwt0GO1MFyA/OamAfVcpMBbDmJvvaumdQF2BLkaiRzX1q2F4vt
X-Gm-Gg: ASbGnctq5s2wQgpiMrqwvLwSUsV5NdoIy85nVlx2XvkxzrSJZPWgft4O0YFtlywWsMO
 b3I8CCtM9y/SWlxAlTDvDxumephyzhI3YSVUoDBU+0dI0ZXUU8FJHPG4cwnIk5NJejBzXLOObZW
 84q30+9sVkqE5AVMJK+V8YRa9ZT3MoiQvPScTwqgQI8LBQS4xdCjVgj/qYkbssbuaQUZJKBddwb
 Y/S9D+qDQ8jwdOtd3/zOC5wYrHNBlSiTDucbOfrtofGhlniTgMQPcxbrndlm8oyoWVolSPg29tm
 tuXFni6r9+DMz8MAAw29TUm8pgaKaOgIiL6sU2Px8VuSD67OPSnG74fibtwPXtrJ9DzYRJPE3fL
 2F301aisBh2HuN7KPtjNPrVaTkeVwgkyG33Ao++9tElmw9ERioqRiL+cX+pO7MGkjRasrFMmq2R
 ZADREC/fpY1rw1RbVboGG/0Il9T1HI
X-Google-Smtp-Source: AGHT+IEw2MywSOelGxEwOHkkEsX6w+ABjjurOH62xOqVIAik4CTrWwNZQzOT2Gf4eYLfrctpn5BQhw==
X-Received: by 2002:a05:622a:1897:b0:4af:1f06:6b41 with SMTP id
 d75a77b69052e-4b0fc8ff29fmr44905511cf.59.1755100767638; 
 Wed, 13 Aug 2025 08:59:27 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:26 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:11 -0400
Subject: [PATCH v2 01/19] drivers: net: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-1-00be80fc541b@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100759; l=3366;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=ynC0QESeHbsdNeAVd2Vn1HA549NqluNx3Nnx6Y10jSc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHiyLqrJcehhIptvqcnDNXZWSbG5Ir619fMXHEgmHiYwxygRjCE1NI0Z8X3GDO4GkwgSMycAa+N
 s2+YoMGwSqgc=
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
---
 drivers/net/phy/ax88796b_rust.rs | 7 +++----
 drivers/net/phy/qt2025.rs        | 5 ++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index bc73ebccc2aa..2d24628a4e58 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -5,7 +5,6 @@
 //!
 //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.c)
 use kernel::{
-    c_str,
     net::phy::{self, reg::C22, DeviceId, Driver},
     prelude::*,
     uapi,
@@ -41,7 +40,7 @@ fn asix_soft_reset(dev: &mut phy::Device) -> Result {
 #[vtable]
 impl Driver for PhyAX88772A {
     const FLAGS: u32 = phy::flags::IS_INTERNAL;
-    const NAME: &'static CStr = c_str!("Asix Electronics AX88772A");
+    const NAME: &'static CStr = c"Asix Electronics AX88772A";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1861);
 
     // AX88772A is not working properly with some old switches (NETGEAR EN 108TP):
@@ -105,7 +104,7 @@ fn link_change_notify(dev: &mut phy::Device) {
 #[vtable]
 impl Driver for PhyAX88772C {
     const FLAGS: u32 = phy::flags::IS_INTERNAL;
-    const NAME: &'static CStr = c_str!("Asix Electronics AX88772C");
+    const NAME: &'static CStr = c"Asix Electronics AX88772C";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1881);
 
     fn suspend(dev: &mut phy::Device) -> Result {
@@ -125,7 +124,7 @@ fn soft_reset(dev: &mut phy::Device) -> Result {
 
 #[vtable]
 impl Driver for PhyAX88796B {
-    const NAME: &'static CStr = c_str!("Asix Electronics AX88796B");
+    const NAME: &'static CStr = c"Asix Electronics AX88796B";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_model_mask(0x003b1841);
 
     fn soft_reset(dev: &mut phy::Device) -> Result {
diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
index 0b9400dcb4c1..9ccc75f70219 100644
--- a/drivers/net/phy/qt2025.rs
+++ b/drivers/net/phy/qt2025.rs
@@ -9,7 +9,6 @@
 //!
 //! The QT2025 PHY integrates an Intel 8051 micro-controller.
 
-use kernel::c_str;
 use kernel::error::code;
 use kernel::firmware::Firmware;
 use kernel::net::phy::{
@@ -36,7 +35,7 @@
 
 #[vtable]
 impl Driver for PhyQT2025 {
-    const NAME: &'static CStr = c_str!("QT2025 10Gpbs SFP+");
+    const NAME: &'static CStr = c"QT2025 10Gpbs SFP+";
     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x0043a400);
 
     fn probe(dev: &mut phy::Device) -> Result<()> {
@@ -69,7 +68,7 @@ fn probe(dev: &mut phy::Device) -> Result<()> {
         // The micro-controller will start running from the boot ROM.
         dev.write(C45::new(Mmd::PCS, 0xe854), 0x00c0)?;
 
-        let fw = Firmware::request(c_str!("qt2025-2.0.3.3.fw"), dev.as_ref())?;
+        let fw = Firmware::request(c"qt2025-2.0.3.3.fw", dev.as_ref())?;
         if fw.data().len() > SZ_16K + SZ_8K {
             return Err(code::EFBIG);
         }

-- 
2.50.1

