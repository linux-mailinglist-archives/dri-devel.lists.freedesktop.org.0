Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A34B24E78
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475FC10E772;
	Wed, 13 Aug 2025 15:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cmm2iPzA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F9210E77C;
 Wed, 13 Aug 2025 15:59:37 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7e6399d0654so503407685a.0; 
 Wed, 13 Aug 2025 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100777; x=1755705577; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0B/Rl80M2RF+JrMNdMpIaLoO99EqPe4tcyPYcOz885g=;
 b=cmm2iPzAr1Gzr8uf45UcWByr65+GXX7APnnQQDLX3sWprlG82jr0pM8Wzm+SWWD06o
 ahb9XOTQW9a7BXl2VKOV913bym360Yl0WAergyyFvmy1AKNBKcFPGdBalmjHWRNe8EhW
 sAqGR2vUhXpdE0djtA00f6mX0XVVllUg0ciB6wl0Ehfj4pYilQETk6+oXcszBfjtGvzY
 5ElFEH7EwWQqftZn/9Jq/a753sR5hj9kcb2p03FGinc6SVBSvmlYaIO+JHFnBIlaXVNf
 +5mIDP3panTWhFY/JIbi/i3JAx1XRt57h83UEPadR9UJLxRfT9Q+ZEEvZ7ddLAxzM060
 Kf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100777; x=1755705577;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0B/Rl80M2RF+JrMNdMpIaLoO99EqPe4tcyPYcOz885g=;
 b=e7KjFpDo7eS3cPmQdSALoHtq5NFOU0p1+bsyg/Ov07FwgGU5+FpKngf9RWsqlify8k
 yrTWbHvAlpjmQEfVc7S2Xj6nhPOUpwtz9AS9cZo3C3Tms4i8WTuS5BW93ZjwNcfdtlrV
 Hqpu53xhkX0FEcxboxOF+u2Rg6J/ljjuU9FMgmquk8/Evi+AyDi/iwm+m01i9RT6m2GL
 za/KCXam1myt0b8OjojoGVdwuOBJQ84QYUxqVsa3HbUFx2U1K2Y9o/CG13npkFf6Sxa4
 YXF0ZE9GD+ov6NvPpNvGz2HXRobtWqPkgfG4v222b0M6BwT99J7HIF1iQB2LwsGjgdip
 iXYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrIoX4L/tj0O9usm5VtW65rsl5herGhxesEpEzcvg0f/RxV0i57hyqRL4Hx2VLsdNvO1ZP2WOwIPU=@lists.freedesktop.org,
 AJvYcCXdJS2GkWLMcfCLCIoBpWHRCHyLZTY96b63nb3uVBKquTUihF/wAkN/kVC/Nms3gMuRCWuZN8l4rw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVjiqV0uBiMa1dG8uKSe2QYN3o+H2ZIRMrQsQulAKlCplCps5L
 DP7ZputXuynaI9zvTIinM5AXBQkcEy6CF/+i04/pONsf86d6ZzHtMMpy
X-Gm-Gg: ASbGncsD/nCif18Lj/KVatzEsXtdS+H6vwmgbIIzaIeh5y/i0s8orbgBk0loGp0nKsL
 8ASlu+Wq/inKuGLbZqOzUkm2a9mXgL6eymzSpioU+uOLByWSipwfQlK7chDmHU61oak5MkHVPEM
 N4NmKRpldZvxL2msItZx97yPW40kUymxyHRobOYyGjiwkDS9h3RAwGmYI/kaOJEha5elPrKaqbb
 jTwlRleGErBIV0R8tEfaWqsWJ8CSfzz708StvLlpjhsN0C+0CvR1q+X+p178f2rIVhVjmQAv/eW
 n+Pw8zZA9UdCVkco9LFCqYl28hGn5yRU7PmK7o+i9CzL2lxKp99jTfCv5noC0tyM6139JwlJ7eE
 sfLkdrbay72gQ3xpxTqLpKUD00ock+9IdB30ZFelwQRVVzCPLMFVh6QRl4wvY77YH4K17xne0Yc
 4X4Ipv1j837Su4EguS1A4rZ0qL+6TlvYxWqPvBpmE=
X-Google-Smtp-Source: AGHT+IGXAuHbm5U1Y4n3fl9DFmAOsvOkx0F/inmIBEc5qoVGXJ6UExGE17RCyI2F88NmRNkKJHgt9g==
X-Received: by 2002:a05:620a:46a9:b0:7e8:6551:64e3 with SMTP id
 af79cd13be357-7e86551689cmr488086185a.56.1755100776729; 
 Wed, 13 Aug 2025 08:59:36 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:36 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:14 -0400
Subject: [PATCH v2 04/19] rust: clk: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-4-00be80fc541b@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100759; l=1737;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=kr82Gyb3wJcxQA+MDJPetUwZA3ndNFP5TJoRT0zX8oM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIlIhhB4BGisD/SuihGvNGHWqLUmAuy/tzhcAeWkBxzWuNh9scLQItFeaGY7gyP1Qw+o3qXno4q
 0C9ZKgq+ekgw=
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
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 rust/kernel/clk.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 1e6c8c42fb3a..09469277e95b 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -104,13 +104,12 @@ mod common_clk {
     /// The following example demonstrates how to obtain and configure a clock for a device.
     ///
     /// ```
-    /// use kernel::c_str;
     /// use kernel::clk::{Clk, Hertz};
     /// use kernel::device::Device;
     /// use kernel::error::Result;
     ///
     /// fn configure_clk(dev: &Device) -> Result {
-    ///     let clk = Clk::get(dev, Some(c_str!("apb_clk")))?;
+    ///     let clk = Clk::get(dev, Some(c"apb_clk"))?;
     ///
     ///     clk.prepare_enable()?;
     ///
@@ -272,13 +271,12 @@ fn drop(&mut self) {
     /// device. The code functions correctly whether or not the clock is available.
     ///
     /// ```
-    /// use kernel::c_str;
     /// use kernel::clk::{OptionalClk, Hertz};
     /// use kernel::device::Device;
     /// use kernel::error::Result;
     ///
     /// fn configure_clk(dev: &Device) -> Result {
-    ///     let clk = OptionalClk::get(dev, Some(c_str!("apb_clk")))?;
+    ///     let clk = OptionalClk::get(dev, Some(c"apb_clk"))?;
     ///
     ///     clk.prepare_enable()?;
     ///

-- 
2.50.1

