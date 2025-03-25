Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F0A70B0B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAB310E5F6;
	Tue, 25 Mar 2025 20:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B7MyOxyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868D110E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:07:57 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6ecf99dd567so29155036d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742933276; x=1743538076; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V8afu+918+Q54xyruc7w9BxMECWF2zkytyg4bSZWLnw=;
 b=B7MyOxyqO6sI5aBNfdMk+6wyTUPsn3Q2sUUYu/n4zkrWGmUewFQeuiBZbWvnmuvWIg
 V9HEcrdmoB1v0SGraZUDYIU1OurVO5LsBf0+/nKwlLBVCCx/eoRCZKIOCKwa/id4dKwm
 z0IPif8tV2gGjvtKScVmg9p1h/oMbxyU4dUOsGdPWXIKUEFIEIz4c8ckkMoFr4MaiM6E
 q1BF/h2jIzgwOcGJYesH01G4mSzh8UMIUmFgDqEN4WazFlXzF8IEOPZtFi/Pwk7Ddhce
 AEJuFzACsgjacKjOEPZVzNacKoqtMHHz3t4iwz9cqZHc46OZB8pXo7etZG8LpXcKTNq2
 l2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742933276; x=1743538076;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8afu+918+Q54xyruc7w9BxMECWF2zkytyg4bSZWLnw=;
 b=LMu9yuz7dEvnw9c9QN2hofeEuZBJy+hktngWpGT7LUcMoi7je9S+eyNgzHjfjxX1Kr
 UeEDG5CG5Z+dSOnNLBjOpNDK39HQBAwEgvVyTER1BxD1QIzxlsxcNxIS3AMT4NS78gge
 GIREFLJOVPFfYC/LD7Yo0GimW0I5wxY1zjKro03JNGe8ZohWxvZf65cf3uMOYFa7cGce
 52kRB1jyzN34lyhXnAbZo2t8QkDJy5A9RjC/6w58xiEwXxSsGhjOavYxzAPpDaPT5SvH
 ZgK/+hNUR94XnxozFvcTT1wsrML+PTlfgKNA2lFIqyDu9oF2BicqL7TQOh0S537xzByP
 7DQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoElZmeNYhBc5vHRc8l9YdHrTizFiJWjzhJBT7YceJ6VioEofbb4SUtFXcEHAWP0l+jXRa7zWDX04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGwJuzm6NzlzIaVYN79q3VBAppLGSbqI31y44DWaelW90wuf48
 jnChHrF8JFdjh8UzfzjnJJzjwtVjmFo8hse6z4o99zsuTYu0I8Vu7jRkaYXVGoQ=
X-Gm-Gg: ASbGncuc7q5a/NDq8wqZZlqTBOqUAX0F9uWnCm91xlSVLkgHWskb5zxCvm/vKkIQnmX
 m1Byg2jF+ivwYU/3IGWy9aKx+MeHozhZDWWCIiCRlkSlE3iza26v2f6j1yTALSfEENnTM6yw9vE
 1WiYL14e1bvEyNgbYwMUXGe/584TXYIp+S6YhHwlLaRvYXUcKBjmDNpVAkPM2lPqKgUdPu7d62N
 xQEdRwvkXx/laAfcfSWlKDAwor3LX0Z7XDWqlXnneC4/1vpdOkCmIYplleeQ1XNRKe/bT2ljjwk
 hfrmHULUOVqSSXrloizG3AsM6GGUvG+QSBwiBv7OcTpLq6oR8JgggxrB9PR/cCZ68P5tgGBZrQ6
 +aYlip3C6X7KT0P+3cRkvFZZZxRJ7pUZzUocRjZCQ8fN0jeMYkj+INF3sre1kVkvH
X-Google-Smtp-Source: AGHT+IH5ctNWjC54Y7j3zCNpairalLYRZF34BaBc3KtOMVr913E6IQjPSqy4tjWyjdEoDRDpScx/lQ==
X-Received: by 2002:a05:6214:1d04:b0:6e6:6c7c:984a with SMTP id
 6a1803df08f44-6eb3f33c8b6mr233174246d6.29.1742933275610; 
 Tue, 25 Mar 2025 13:07:55 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:38f6]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eb3ef31810sm59790316d6.64.2025.03.25.13.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 13:07:55 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 25 Mar 2025 16:07:44 -0400
Subject: [PATCH v7 4/7] rust: enable `clippy::as_ptr_cast_mut` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-ptr-as-ptr-v7-4-87ab452147b9@gmail.com>
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
In-Reply-To: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
 FUJITA Tomonori <fujita.tomonori@gmail.com>
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile              | 1 +
 rust/kernel/devres.rs | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c62bae2b107b..bb15b86182a3 100644
--- a/Makefile
+++ b/Makefile
@@ -477,6 +477,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wrust_2018_idioms \
 			    -Wunreachable_pub \
 			    -Wclippy::all \
+			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 3a9d998ec371..598001157293 100644
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

