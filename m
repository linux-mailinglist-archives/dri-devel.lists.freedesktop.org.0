Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26775A939BE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA47E10EBB5;
	Fri, 18 Apr 2025 15:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S2cEBhKX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EB510EBB5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:37:31 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6eeb7589db4so21350396d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744990650; x=1745595450; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sq/SHuUzGkWXlE0xMieSzf1X7J6mgZyFeTghfCxeR6I=;
 b=S2cEBhKXo8tOIuqJy3FLNrUEgVFc0ZpYJcgUx8i+djuANHwOGHjeiyz1QMctTL1ybu
 plaM2hZh16gWbZexlMbBHQq3mje5+jyIFH6sQg/gmAwMEqybsiOGJVGXyrIN8aFpxrdI
 YFAfS2H2zxSGtmUOoSgbOjLeOuJkwBMj3MA1svZ7VyOBnGJVaSC4Gir8DGWI2j5wrLvQ
 xZv4CqRMdTFdHJV9poMmY5EkZbJYfxkyl9VvKiic0JDa7Tia9ssJ1TacNldcoVBjOync
 M3+2Ye0oro+ChZfEOx3C5BftLbWikGT8nZ7jHda5Gik9plPPhi22/F9CNFUauZUoYDO9
 k1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744990650; x=1745595450;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sq/SHuUzGkWXlE0xMieSzf1X7J6mgZyFeTghfCxeR6I=;
 b=rg9kJI5gvjK/WuWzh57dxrhJuROWS6zfYePLiJvB+XcpBt48h8J/xQcuvXEm+qf5cM
 ZF8PoE2p8FM5TbNd281UeF2biNmXOTn/jozz2uP6PXFbqJJu0qnS5JfsNMSJMp0KXuzL
 p0Art6MgFzbAYDKXDoR/3v50RUuN/ydIWdVsDxubJH+HU2XJLafW/bwHCdRM0qz8hmmS
 4pi+5jGPekJ7yR2G76pg4TVkkl4pMRWxN47bXSwVDk7zazBX0X1KMXFIG6tapWLIoLLG
 eAWH8E4hZ1Zc5me1ScHtRiG4e6VgJaBsMmx30DHTpc4JlzOKul/bj+7X6wGQh91e6W6J
 DFfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzQgLoHD+efjfwUeiSr+U4R+f22NGwZoZx5bnctygqfHAyxeofXevA7BThrKOqHOXP8Hw4ixNlm/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYXl1Y4x4NEiGm/s38PHccZmntZEairTlx/jl0rozmrdGIPRsU
 fwdtaYr82osCyTU2ySXpQ+PrBprPApGP7U2s+NzP9jM2vTQdGZT1
X-Gm-Gg: ASbGncsXXZKAqXIzmVn6JdXTUmWJjEtPvb3cKcsmb4AKgomiw/1txZce8mDGHf+QIuj
 XRzLHlkd/uiL1AL/KNKUoy6k1GAChHq0ETqlm7OkUkjtEeoSB39rH1IG3nhXQPf+BOHqHfgDuaf
 INUgYVoXhjpUq9zMa+KUiqlCxaN7oE/K9xr81YQpneP+KVcH0FxSZWmkruZrfHfGS2d6/G5z8O9
 kgvxdfczwHaOMo0SiBNptpUSdQuxAd8P4D+VbZ5hNt59ZdACKaONMYYK0bDK4D/vy9JvgKkLKuE
 H9+CZj9pp0YFPJDVbwFANWqL+xQPYUqseGrO1BySmZTLSr2E+hzCUELvQFXdFZ/cm4X2PQ==
X-Google-Smtp-Source: AGHT+IG9yKVgVclK4FNEvGa06LMTfBMSMcF6TN/Goe4L3z7/y4kXQiJs1GLAHbqOW92iCyBP0J1YfQ==
X-Received: by 2002:ad4:4eec:0:b0:6e2:497f:1ec7 with SMTP id
 6a1803df08f44-6f2c467180amr51017446d6.41.1744990649935; 
 Fri, 18 Apr 2025 08:37:29 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:7988:e5e5:1f4c:be78])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2c21d9bsm11623096d6.96.2025.04.18.08.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 08:37:29 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 18 Apr 2025 11:37:19 -0400
Subject: [PATCH v10 3/6] rust: enable `clippy::as_ptr_cast_mut` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-ptr-as-ptr-v10-3-3d63d27907aa@gmail.com>
References: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
In-Reply-To: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

In Rust 1.66.0, Clippy introduced the `as_ptr_cast_mut` lint [1]:

> Since `as_ptr` takes a `&self`, the pointer won’t have write
> permissions unless interior mutability is used, making it unlikely
> that having it as a mutable pointer is correct.

There is only one affected callsite, and the change amounts to replacing
`as _` with `.cast_mut().cast()`. This doesn't change the semantics, but
is more descriptive of what's going on.

Apply this change and enable the lint -- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_ptr_cast_mut [1]
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile              | 1 +
 rust/kernel/devres.rs | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7b85b2a8d371..04a5246171f9 100644
--- a/Makefile
+++ b/Makefile
@@ -474,6 +474,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wrust_2018_idioms \
 			    -Wunreachable_pub \
 			    -Wclippy::all \
+			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 9e649d70716a..f7e8f5f53622 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -143,7 +143,7 @@ fn remove_action(this: &Arc<Self>) {
             bindings::devm_remove_action_nowarn(
                 this.dev.as_raw(),
                 Some(this.callback),
-                this.as_ptr() as _,
+                this.as_ptr().cast_mut().cast(),
             )
         };
 

-- 
2.49.0

