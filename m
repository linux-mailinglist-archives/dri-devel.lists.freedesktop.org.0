Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50AA82878
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC7510E92B;
	Wed,  9 Apr 2025 14:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HEfY/LXu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA8F10E91F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 14:47:31 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-476ab588f32so34693521cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744210050; x=1744814850; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sORjvcO0tUIMjXvZbPyesA3RS3F2BYfcBEs3dz3VH8Y=;
 b=HEfY/LXu/EFssv4mFM8nLBWl4HxuDjfv2Y/QBj7Vn0xGmjEyljNFCkWwoiTKHzSARv
 i/GeGXdtxa8bgYgTZNzNf9+gWJERDa1iF5r8EXdq3iqfi6jIbTCLR0hkJDJX4nmCA6HB
 menMce1T+0pP2SS8QuUrLHN3d8m40Pj0w795FlJQYQ35bdSdhHWI+quT25R14TXa55Pe
 +PhXxDucH4/9n4aZNPFQsRH56FVrglJBs4wk67E5mwuTFzP8WGBxUU2DzV2BmU2jK5CV
 +yMafdtYtChGejxzDgANrbj8faya82Q35DE6xGKLcf7ZvdA5pC6UqT+LQWq0ODUiU0Zg
 N/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744210050; x=1744814850;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sORjvcO0tUIMjXvZbPyesA3RS3F2BYfcBEs3dz3VH8Y=;
 b=H/Gi7vZ6C2PPv3ETvc+NPV7oHf5hAsVmwlpvbdZMhALtUURGD5sybvc6CAdCQg/JtB
 /QMSraltq3v0pIavhEwrhQcGDA7fjChtGs7ilNqKQ62MjX4wEXBmDDkuJksu51S6HNM0
 E2Zf2d9z6H22+eZ+KUYYwx2H94IAKbgj9F20zzLlDprFHDJqmIXOSIUwduwkG+JRCx+M
 kbQrHGcIKmvrhHyjx4ulb6OAXvlJFoeqhFuCsKGInBYrGY7C9EJEn9tPu9vTw1b5/7sb
 N4NYY8a8VipDlLGx76Uq4L1Ip52DJ6NH+0LvtwyT5PIRCYIxjTiLT4KVkuiC2CN1N7B2
 +lrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWinMasNvz6DHVU4ilZuUy3EQ1Xndcdey4h3Ft4LRC0RL1RiFJOJG9Z7lGRbI4kOW7E1Iw9iYHgkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL+KB4nnZP82XNT3ECvyf1tdTd+K5mB/N1xzCd1693wCIa5NPY
 45wWTUPAz4QlPK4eGd9+tWYgJ7x8J4WOJI/9qBlzHDcHiXHFiMCq
X-Gm-Gg: ASbGncszxABBvR1fqtLfkJQ7t4GCsBzeMKDrjJJZ5XNvQ7wdMWNRdGe+FMVatScskrn
 av5Lf5UeoP3a0124MSfP10vyoJBmI6cVRVx7zZaQrMGtLMDASucyua1Bgd7dS0sLKLPZPJELEUm
 E+J6WzsU4di+0qpIqOlaigJith3tbdoyAEPFfwuZDfgjGPF1y+T8XvFbD5mNluUZobnzQbF8qWF
 TNFsyZxSic+lk4oZcjPzIWbWbfUwTig5y4LBbSp8HiGazb1mztRlOURzxB+EPH+kQLDZKZHHMa9
 feBRAERhOLBU0qLb5+Kx+joD3PVcuwCtmehEbuJQqwil82bzzsZ5JNo0ZdAmE8R+68V613eoLyO
 eO1ZJ5CxP3tw4KPMeQFqfjDOAdVMFaic/Arav/uW6eDn0
X-Google-Smtp-Source: AGHT+IH9LWDhCYt3RFzLjRakH45YjPiReCb3dS1+Uu22JX78lQZJIGgZ5/arLIqBQVHKNepy2RpTnw==
X-Received: by 2002:a05:622a:1116:b0:477:1ee1:23d9 with SMTP id
 d75a77b69052e-479600a3fe5mr42498781cf.20.1744210050275; 
 Wed, 09 Apr 2025 07:47:30 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:3298]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47964eb9a8fsm8024461cf.49.2025.04.09.07.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 07:47:29 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Apr 2025 10:47:20 -0400
Subject: [PATCH v8 3/6] rust: enable `clippy::as_ptr_cast_mut` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-ptr-as-ptr-v8-3-3738061534ef@gmail.com>
References: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
In-Reply-To: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
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

