Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B92B252A2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD4710E1D9;
	Wed, 13 Aug 2025 17:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JvopyWmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9729510E1D9;
 Wed, 13 Aug 2025 17:56:56 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b47174beccfso124a12.2; 
 Wed, 13 Aug 2025 10:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755107816; x=1755712616; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g6QEvKbWqHKl56z7lqO1CQDa/mVnlY0njSFi7H7FEMM=;
 b=JvopyWmOL+WdjC+BHOWnKneSUoJEtmQvq2IDYwT359H05j+H0B38atm2y74qfMR1+h
 LgLdDNw/PxcJ65JBtSRLpckMrd4dH2u9MSCp9pDjz2AarQ45O5Fh1O9lDjzdk6tvR4nA
 t81Gq1S66HLkWlgETkYe932Rt/J+qPY3ek5zK2u1cxdu8xkV7FJhAyG6K5N/pgCAUOou
 fpbuxGNbqgb0oOr8zA7UzN+4w1627TRuVEMoUUJAMrqluRfCuW9C49Hryg6rJpwIb0Gh
 ZSH44IJ/kpmH8msCcfoMvQ4U/qtyGYImRTsIcxdhwWBmkuZ2guRH7nXzNw5lnsLlNIUM
 Fxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755107816; x=1755712616;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g6QEvKbWqHKl56z7lqO1CQDa/mVnlY0njSFi7H7FEMM=;
 b=j6fRNPLBtXv5+u99B26taOtoR2ZjQ300Hh8/g+TkYvBQW5uArRsVHxCtJ7BienCQuL
 bd2/lO5ASLIQTucJlapnY0sGLeEPHYhzLQcEKAPftn3xMC+xzfL1tz0zDmmopoPGLTe9
 HsXUtfdatu6aE8L4frAmyAN5XzPH0xR8GiLMm+fPXvl/5xVK1iAKOWS7YnoT4I0REyPV
 9amx/TvhZnJA8xleNxaOZ/CHpAU91eoG2pwACDEUS3Rs60AbpjsnuinCKBQrUD+qqVau
 Duvl5E6B02CdwW/6xPwfnzmJfvV5oKe8KR2XMhYtoBz09eCv+depne8B5PfyEY8/T8eS
 yh6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdza78eqP7ZQVIN+jwqXj8bYp5aJsbDcNOVTEG98QIFvvouxj+BkxV+GIO/C61ZIzfjZlv9i5Rd4o=@lists.freedesktop.org,
 AJvYcCXOSXS+HCF9INaAlzEKCQzvcNvSjwVAckGJu1NHNNNW8VYWL6Ra11AJnUUDp4nnuKtK+j3w3yS2aQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFSMGmAJQHy73FoJy1YHgUdn23RXihyy7draRPOX6who1gkYwK
 iZyZ4LCd5ZykZviwf6KeH/LurVHrfHIzYtWYIa1K4DVJ3xRo/P8NwtdlmRPCYOvb
X-Gm-Gg: ASbGnctsGo/MaZ+cZijzLOITGm+b+94N4WHyksgZy6hmMuc2oVrJoTNLsmVSzt5hLHy
 0q3eUObDTRIk7QIj4l4xhP/EnCdQH7XAroS6+Afm9XACggsXahQrUUP9RY/KFVmw1m0J5w7qp5v
 jGWohFVo7rnwEpsxX1RrBAlDYcIk80FZR/1IEc7J0R2XvV9FajKUWudvireNXl6fnJj/Nfxmio5
 BfjNZSoieY4H9aT08ZQT8HtIz2Wqt6jXOfHUh9BOgxmE9WU7QkSlKZ62T49G/jXyISp/AeU0O5S
 tD5/5N4VrlkIBb0bnNi9wM1ORtsF0phBAx8Y4LKVGIJIUJbHi3Ml80AHTON5UW7BPiIn3JKoM6I
 iZcAPFHd5MFzLhrYsSNY4XLAr5qJoiwt6uawNTKRK2xDPakIrn80HoGNG9Vyj2EedCEK/Ki1Gnb
 hfvQP9/MMCDkjSz6C5diERi/+devfq
X-Google-Smtp-Source: AGHT+IHzxOT0e51q9GMbCoQJQmA1iOf0AGvoQCtni9f1rWQqIeUQheFiN4hAfvpXA6DN5Xlkg8xgDQ==
X-Received: by 2002:a05:622a:1f96:b0:4b0:e6d1:ef60 with SMTP id
 d75a77b69052e-4b0fc88d5e7mr42154561cf.59.1755100798179; 
 Wed, 13 Aug 2025 08:59:58 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:57 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:21 -0400
Subject: [PATCH v2 11/19] rust: miscdevice: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-11-00be80fc541b@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100760; l=1136;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=kInu3WpIUa5ivvSUVJDySAyzqDy8m7u4hXMISKjVg1o=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLPeBqFF3G2/b3iHg82noX65chkInTWyugikz/odK+rtAeYGjZ0XZ8DXrV1KFAOJaqwd30EdnIK
 Svg+beZiy3Ak=
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
 samples/rust/rust_misc_device.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index e7ab77448f75..60ab10b02574 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -98,7 +98,6 @@
 use core::pin::Pin;
 
 use kernel::{
-    c_str,
     device::Device,
     fs::File,
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
@@ -133,7 +132,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         pr_info!("Initialising Rust Misc Device Sample\n");
 
         let options = MiscDeviceOptions {
-            name: c_str!("rust-misc-device"),
+            name: c"rust-misc-device",
         };
 
         try_pin_init!(Self {

-- 
2.50.1

