Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B774B006C9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE6010E909;
	Thu, 10 Jul 2025 15:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FxT6l+yN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A379B10E90A;
 Thu, 10 Jul 2025 15:32:01 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6fafb6899c2so11252816d6.0; 
 Thu, 10 Jul 2025 08:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752161521; x=1752766321; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IeIe+UDk+Kp3nZEK6u7JnfOt0xInihmGzvZ4vkm0xmQ=;
 b=FxT6l+yNVPKW30gOwAmJnxk8URBvNUtGFzJrRfUEgxgynywBuhiM5Afp1jTpyqu/GN
 FAWgz9MTWlQGIrR15wRvyYNbdXz4YSXMOsyQSzvuyqyZVxcHls1MVPK6gB7dzcVe2kUe
 E4lxkZX4AwZSA36FH3nSZ6UCWbWZIQKbVGkW77l6rlEua60NPkap3eRcUNcfwBvRDqg1
 qJJksvuorAIqLCR/P/JyqA8sc94nbBN7NAoaKGXxH/rqhW9teddXj663yBKw3422cCgU
 +DiOUksPcTBd4g288KgWl+i34z9LfBKzej3MF/wPKAMBPnLMSVIwhv908S5ke3G3oRXf
 e5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752161521; x=1752766321;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IeIe+UDk+Kp3nZEK6u7JnfOt0xInihmGzvZ4vkm0xmQ=;
 b=ndS33unTL7Cb5vc/7nbmwPgN4R/pqQYCJZnUC6AUk4Uw3bLAheamBkXC+RSK6vHc8t
 qardstZDfEYmyvMZnbuGMxZMQMIGAaUoN9PycGSWFiChDen+1au99R7+8VDQO+D5D50u
 cEl1839MC1AjhB7B/gOj7WG3S1LTDEZbqI0ip3Jo4EqvKq3k1z21YR40YWPWHbhb9sFe
 jBzurYSV1337tWGE49oCqPgwVjjB1Z/Kmnw/OUYUQNyvBrBFgnzAvWk+RLuZnP0cgOSo
 MB+YTTPHGTapXVZHBS75SefuFGWCD4wYiFVQdtWbKbiEHU0J3LT5yeFYFpU2qO4kUhv5
 6C4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUqrlWZ1R7kC+ePR2QIk+KbsFjhiR2zerD+xSCD82jTPjOXU3mpj4jo6gA657TR61/dMarOEvI4b4=@lists.freedesktop.org,
 AJvYcCVkidSZeZ3lnCTWfx+1awlSqH8rRrMNeQ7mHl157Hf4ZExF+dZ+XQk1FoMQCrPMx8c5bs9hFa3QPw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJh/36cIHUCmIkrLK1ioukTWVkJ+zACQAQf85cQMElIi6OVl0/
 z41vRPDhHjYB2QpUrcaXUR+fZRq+vsusg2lLQvuTn+sNRwz/7E55CX+Y
X-Gm-Gg: ASbGncsi13/h3kP7TTXSqYHOjprzIDEoMIwkWKJiuVBSeA7CNgfk9BA60XtnXi0YboO
 vy4agFxFqgjx0mnAh+cUFM4aMvNl9p1/gSNdG5CC8/woWe0v/3qn9Z+DaVVDyQq7LnfXg3sQODl
 /ikEYjNmSSbw5FQFU6F6sm7E2KopeoDsN2XAPAra3/Sbvknf7vK3TncrxWCfTnLlzI/4WbfQ5AD
 m6nLuiT1bbH62UBmaFuKMit5+9WzDqzVF6G9ZCctlIc6EbJpK4Iuf9KwBgELun+jXb0z0iHfJkN
 6GZhuoH2C9hiGjD/GWPpH7XUGnxM+8gDRHC3NbXPrq7eXtBVorWP/j0qGxc5Z74c2rk6ni6GV6r
 Q6Lu4j6MQ9OHOjyPzhABca1LQuL4SdMyhP9of6wVNYjyIz6O3Bkkm8H8pWR3vL2B2zjZb
X-Google-Smtp-Source: AGHT+IE2LTVg+t8dxVKDODJkNp+d8w0QU6pVu3P5qcDuA/4/6USIg8YBIVkV3R5pz7GFSaok/yUc5w==
X-Received: by 2002:a05:6214:d69:b0:704:8870:122 with SMTP id
 6a1803df08f44-70495a7ce2fmr58033506d6.11.1752161520428; 
 Thu, 10 Jul 2025 08:32:00 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-704979dbc3asm9449496d6.38.2025.07.10.08.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:32:00 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 10 Jul 2025 11:31:16 -0400
Subject: [PATCH 13/17] rust: pci: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-core-cstr-cstrings-v1-13-027420ea799e@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752161490; l=1308;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=K3quMGfwWSednLdCqfDckFdHtFzQdXTMeNPKPGlz5iU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBVoj/q+8630VrfoOdU7edikEfH4QTuHyG7talu6SHNqLcu39+eYJff2AqEgN0swyq7Yct3tiub
 arhdIzcGBNAI=
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
 samples/rust/rust_driver_pci.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 15147e4401b2..4ba5fcd2b357 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -4,7 +4,7 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
-use kernel::{bindings, c_str, device::Core, devres::Devres, pci, prelude::*, types::ARef};
+use kernel::{bindings, device::Core, devres::Devres, pci, prelude::*, types::ARef};
 
 struct Regs;
 
@@ -73,7 +73,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> Result<Pin<KBox<Self>
         pdev.enable_device_mem()?;
         pdev.set_master();
 
-        let bar = pdev.iomap_region_sized::<{ Regs::END }>(0, c_str!("rust_driver_pci"))?;
+        let bar = pdev.iomap_region_sized::<{ Regs::END }>(0, c"rust_driver_pci")?;
 
         let drvdata = KBox::new(
             Self {

-- 
2.50.0

