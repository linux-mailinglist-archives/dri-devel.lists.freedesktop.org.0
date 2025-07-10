Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659F7B006C6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC80C10E90C;
	Thu, 10 Jul 2025 15:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eNZIQxGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7260E10E90C;
 Thu, 10 Jul 2025 15:31:57 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6fadb9a0325so9305916d6.2; 
 Thu, 10 Jul 2025 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161516; x=1752766316; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Vyfnq6g9C4EoCLlWfGQ54YuT/nc9bWKydj2wfDI2B58=;
 b=eNZIQxGHiLwUJ9ptgIPLdsZhv42Xej/BmWkqwy5tlM1kEeaFL43lL6V1SlqTPHYcWn
 2+ltuK97ns7WdbNb5JuHGh1Ph/FlYjd/AUI3N2q5WNtUR6cj14NjPbEgUxytzJHN/rGG
 DB/PXjm5sJtb9VhHPMPSQgRNv7FBfxCdEdMYex0apw4X0P+cSVPs/Lps/IYSbZpOhxbJ
 OWnFDrc5JM6/OqhSay/rOgZyd45ASMoH+v24FAmRX9CoLug6N8eqNWYN9lXfB033AQoC
 oZjYtsStodBVXOQQhTACwdY/H0hb92oXE4vlEhvOGhIAQ54FCs1Zx7TAW7inPQEGx53r
 3Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161516; x=1752766316;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vyfnq6g9C4EoCLlWfGQ54YuT/nc9bWKydj2wfDI2B58=;
 b=juoDr80HKDGtiD3ojn5MmllkuKC1zsl7vU+g5dOodz2HKRkkhWWikbFrbml+yv0243
 gV9zSTpOVFgjK8ZJQt5v9jHte6U+gDXaOk64QY8sCxB5aCFJr1NitgyXnbteW6GuMclr
 dW0UXAg89u2DUYONUa/MMB6PGktaIjto6M6+JcVL8ABTIJGL2TYrQCda/ZKMPPhn+fPx
 Pn9abfvFkl8YVdwFW16WHJwb0qRavRRUZHw03F+vF4PChcnqjxJeA3hu5+xj2SU7s1Hw
 1MFH+ZYlmbgHISxLc5/DryFt8rE27jwnnEwQYEjPCGF+EmljNhSVp40oCynpxgtq58tQ
 QRAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcHLenKTVIcKplciB0kACzWCXCg+5dth0klM+M1yS9zVF3HLD3cuGSN2OVyG2OlmflzH58/LhdBw==@lists.freedesktop.org,
 AJvYcCXyNi9ut2hTPq+h5BrMyIG+vX9dar8AeyPI54ZHMeeKHcqy5BbsWqBgt+T7V+kXtFKsWJo/hY0B+lg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywYdm+LPIfj7jbc62NwmEDoPwXGuMK7mKex0+gWKWwsT76EoLf
 AAm7iKjFgRQO+9nmuC0CCkyctNURIJtNvyyLAXfyVLMsNxS0uvIvPugRI0TTzumfs26naw==
X-Gm-Gg: ASbGncsUcwLdG1CXgA1xOpYaX3Fpo3emAdD75tH5xba8a5wJzVybAvlloSeilvs0TbI
 uktsbreiLUon2HzBy91etHw2PKZa3Gr3Q/fivZ5HpyyoK80es6VXSs2SVb0Za0KH/7BI4KHkjDc
 Zm2UJAj+Joafz1VKTYI8GHhFtc+qwfs+UtRPGHZPs+RdGR9jVgwTeHOT9BuHebKodYTbo+/CXar
 dEApU9tr4qQCCQFj4PFLAJUDkLxeHqvWFKwjBWzlz0iK6vnSgEWTp+v/5xUeEv5cdGPBF3yUG6O
 UUO317wNBEae+cyOf+RUnhGkVtQYwpkzYvOPnkHLqdlbBiFL2f/yGp14ttaVW+V7ymGCHCu+7wp
 iZkJIwuluIT7vxIypPcd17nZhMaWAEQkBZZ4i3dDRIrthMMQiasyc8XjF7Q==
X-Google-Smtp-Source: AGHT+IHvkNwRUWyARITk8WnQKy0SNCgtRWKVuNelSxExNeuSX0iEEl4oIe58qDpAXxbYdul2lXKeWQ==
X-Received: by 2002:a05:6214:1d08:b0:702:d63b:4c9f with SMTP id
 6a1803df08f44-70494fe211emr78209276d6.23.1752161516474; 
 Thu, 10 Jul 2025 08:31:56 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:31:56 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:14 -0400
Subject: [PATCH 11/17] rust: miscdevice: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-11-027420ea799e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161490; l=1089;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=JeDAf6wFDPBGfHdjZdgJ1MROy+GiZeSAvyl6oVbgRRY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNEY9zChdkMx4tt2VV68lYK+vC3TmeO7PS6pRdkJjdhnR0BMNjB8WcH4aXX01vTLirzgenjn3HS
 nz9VxZLystAI=
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
 samples/rust/rust_misc_device.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c881fd6dbd08..12b64296e912 100644
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
2.50.0

