Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298DADA3C4
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 22:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E34B10E24B;
	Sun, 15 Jun 2025 20:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pios/v1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F08010E241;
 Sun, 15 Jun 2025 20:55:18 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6fb3bba0730so36734476d6.0; 
 Sun, 15 Jun 2025 13:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750020917; x=1750625717; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BwuzOkwr2WXLbNIqZ4PjxHxYIhjL5EaV2fkU8tqfaYg=;
 b=Pios/v1RUWcU6dcu+KPWFWwRA05JE1OinUFx929js/9RYKV/sLppOI0r4feNQCM0V9
 lbkfQZtZAzBlVso/Tcy2VfPxy2Pz6jyBuwU/KiVnAA/l4RizczexzfLfxeXTNZb+EWJV
 vQ0R4qKxlrnD08tyP/r0X2VHrfcnWxRDJRSHZj0FNPBq/L6gFHkpLVR4lQl7hlUy9TAT
 eNjeSDs9KZwLMpqSEwI1CqitM8LNpEx4wtTpAZqmL5uHtvQCuvQjYVgZGk1nk2Xjabk4
 ussPr40/inL9dhkQJmiMImQIHYoYFi7MICZJAZyGFXt5x34OQj/PjyyNR5y85s722kP4
 WWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750020917; x=1750625717;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwuzOkwr2WXLbNIqZ4PjxHxYIhjL5EaV2fkU8tqfaYg=;
 b=PYobx3MiZPXWcpbYfb/fw3xumgZNgoTjT+b5FpNhTmKbkKv0Zvi5yA1B4rbYAWGAj1
 nLzTvJ/GrcmTSeSPVVjMshWwJjnVU04c8nIE1jhQ6VceEE/Xm7bBBSCc1l1CEx/nZA2E
 4Y+IO2AesyTSOLNLiPFDKvbuWemS7pOcMi20fe8vrlxoD8nhRmx8cNx0XPVpTxlHGyzX
 4Z8J/n+Jc60pUwnKS9/RhoY2ivfg2LH2lkrAExPV6zxw+FMZGIDrtnn/yWOGC+wyN/dP
 5gybG/N7J0Yhjp5rcl7G8Z6EGFgM25V4Z+KgVCMHqLEu3YJpjUglJyV0SF4Hjt4105u+
 NqmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOtxkhq4ITlQjda0nlyvMqFTcLppdQtZ+pFG1I13Lm3IUB2txRXs1Ltu7Lh5La1ZQyVFxa0fEwLg==@lists.freedesktop.org,
 AJvYcCXeEFWmnW3sQ6zzv1SNZhdW7C5XeziRLFJiXRf/J03ljWo+ik+w2vUC/km05toe7LM+IQr8ZrDixuI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYTbKTO969yqunDbShaJGIQAsbUTCIT1Vlk3xechS5BlDyQjpW
 p/hOgaNKF+kmABzpIeiVahJc2DTeDvNqSutR3TnXisdzWIbtCTBqlteN
X-Gm-Gg: ASbGnctSiThLu2MjygalPGhPAU//uuPL9FqYtmtAyoAYgrwVwOEzTlZdcQRoddrubWS
 o4KTsAEo+s6vUBkWdDxUrHOFRJVkPbtSp60//2Dp76ZAP4HIKATI3ARHaCKJSINlH0qH88k47U1
 tzZOTkOO9z3leMnEiazHqdfuu4qnuF0P+YL8Ek4hIzfUsSkTHW8sfFPbehdTHwNMIqTacb01QQ8
 bNY//tu4jxs28pCZE7Ax0lmhl9Q2mTX1HyIbdX2Vt/1O5h1EMdhiJa8zNvU/N80upu+Sd+0pUgj
 306SFvYudToM3P0tPJpg9QHzL0OKqrbocuv1Zd/YaPBpYRaq05FbPmfEHC8JG++WeWNLiA==
X-Google-Smtp-Source: AGHT+IEgmK9+Bj58C8dqWwTYX0gZlBqZMRj5psT70nx4i2bPfqmKaepd9+hxp6sh8BMt38kvfV7yAg==
X-Received: by 2002:a05:6214:76d:b0:6f8:c53f:48e with SMTP id
 6a1803df08f44-6fb459eecb2mr143148166d6.0.1750020917091; 
 Sun, 15 Jun 2025 13:55:17 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:b0c6:92db:d807:21a6])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fb35c84148sm43468176d6.109.2025.06.15.13.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jun 2025 13:55:16 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 15 Jun 2025 16:55:07 -0400
Subject: [PATCH v12 3/6] rust: enable `clippy::as_ptr_cast_mut` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250615-ptr-as-ptr-v12-3-f43b024581e8@gmail.com>
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
 Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Tamir Duberstein <tamird@gmail.com>, Benno Lossin <lossin@kernel.org>
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
index 5eeddfbf5900..bb33023f87c3 100644
--- a/Makefile
+++ b/Makefile
@@ -479,6 +479,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wrust_2018_idioms \
 			    -Wunreachable_pub \
 			    -Wclippy::all \
+			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index e5475ff62da3..237182446db3 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -140,7 +140,7 @@ fn remove_action(this: &Arc<Self>) {
             bindings::devm_remove_action_nowarn(
                 this.dev.as_raw(),
                 Some(this.callback),
-                this.as_ptr() as _,
+                this.as_ptr().cast_mut().cast(),
             )
         };
 

-- 
2.49.0

