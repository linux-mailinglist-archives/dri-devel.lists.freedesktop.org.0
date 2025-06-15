Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF28CADA3BF
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 22:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E3A10E241;
	Sun, 15 Jun 2025 20:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ERbPlHQ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1525E10E243;
 Sun, 15 Jun 2025 20:55:16 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4a58ebece05so41770581cf.1; 
 Sun, 15 Jun 2025 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750020915; x=1750625715; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3zUYH66sAi4M6SnRnDRUP9N7P8+78tvCpZpLM0hP8f0=;
 b=ERbPlHQ9RLTM/lWCj41FW9Ta48Gb+Txs/QK9tH3/lBG+dNQbYyicg0tkEGahgG8czY
 Iw5Lb67FzYRtJeJVeX+EoJoYEnqg82Zes3kV4fff4SdCWop3Ed9mKqKCvnBGSJCpForb
 UwUXDYCPvwKB0FRlHjpZYFmvkhgfcInM+qSkkCOsvOdRnOAmB1GqCwBPB/ffTydMD7fG
 XgA/5uj6x3SUJr7mrG4RzZY95Riq+QmXRvOlcmAMLpUWJP3w+QVEFor7KUNwLlTzQVht
 nrYpwRdsrNRHppScpgYdTQICOGlAH11k+5str4wl2CKL/BkFuFsj0YF4bSaH/GH4ev0s
 WySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750020915; x=1750625715;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3zUYH66sAi4M6SnRnDRUP9N7P8+78tvCpZpLM0hP8f0=;
 b=geZ+6tEM/4GuM+OnNwymCPh56BQ26NOvmqlF7e4J3HeAqT2ZGwUxLawsrnc4e7FH4E
 uiYdiPFf0sNa/qekKmdCeZixi7mrSb+yf3IS6xrx8/SjFvEcOuunJTcMWtruUZHJBBmJ
 FbYvofKNgUV4h/o8s3xgWNcZjBopzpmyG7ONehhl6xffomCVCJVGwovZSYByXDVrwnH9
 pyBL+4SpjyqPEOdC+WwzuOr5pBljTUNhvEJQc2uLBa7VfJjwkinNmLxaskuGyXynEuIi
 BcpDjj4HHX7Rsds/pFrUaTiK65OPiG1gQQv5fBMJDUfHjyz4zbmGpDGne8t175UU0BIW
 orHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy5tWc3XFcQRAiGreu2lZkgR0ytdNMfDoP98DZeW3MXnyW43JtJ5J5gj1nbVdNDDzkuNOfAstpaUE=@lists.freedesktop.org,
 AJvYcCVVoT9RZ5sHnjCswfF2NJqHVsmJhrfCQP453NBkYlUbZdUMgdNI7i2QFZBON8j2YUnBWWngycXyBQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv0cth0SWPFP4nTSLO2mGDoMyiPdnpB5FUP99Pw7fZVh1R2BqC
 sy/fyMmkJIAe21RljSt/P/1lDnsyMgAIkN/Mo3aFFSpbUiFwhaecLbRw
X-Gm-Gg: ASbGncvki2SmPD5QLqzUiz3gDOEUhJ93GCki4aN2WYYWDI2wl17Jv8LtJcBmKX/M3QI
 Q8276x872mNjQuRoQFkOrP/bZF+bC8ooA0rdsfc9w5PTQ33ArdP8XDecZQ3yKugZkAzTudoizuY
 64xjfIIXlQfXmcpN7rb12oYqDmy+rY4QWM52a2lg1gp/EFrv9TxG1/EqH3E6TDblgJSuqRY0eeP
 6DQ1ZYOjTCEVpLQJulJt9BlxJBWRbsVZylPWKKgfRt7CdwR7d2r8E8T/gF1PzkWnWWd6HV0jjEp
 0DDENf41pu9KuneclFOigPzxVoqBvvPgb0yha2M6oiBhyY0lNBEGDkzCCuNx43HIMHJKRWTj4GO
 ZY85Z
X-Google-Smtp-Source: AGHT+IGnwG/F3pbc/I9CZO28hGaGlx5gnzKOmJ9C6eKZoLJoA9UqEbcNjyNDi/CwdRgtfZ3tf4DkZQ==
X-Received: by 2002:ac8:5811:0:b0:4a7:189b:98ad with SMTP id
 d75a77b69052e-4a73c5338f4mr110296191cf.14.1750020914928; 
 Sun, 15 Jun 2025 13:55:14 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:b0c6:92db:d807:21a6])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fb35c84148sm43468176d6.109.2025.06.15.13.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jun 2025 13:55:14 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 15 Jun 2025 16:55:06 -0400
Subject: [PATCH v12 2/6] rust: enable `clippy::ptr_cast_constness` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-ptr-as-ptr-v12-2-f43b024581e8@gmail.com>
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

In Rust 1.72.0, Clippy introduced the `ptr_cast_constness` lint [1]:

> Though `as` casts between raw pointers are not terrible,
> `pointer::cast_mut` and `pointer::cast_const` are safer because they
> cannot accidentally cast the pointer to another type.

There are only 3 affected sites:
- `*mut T as *const U as *mut U` becomes `(*mut T).cast()`.
- `&self as *const Self as *mut Self` becomes
  `core::ptr::from_ref(self).cast_mut()`.
- `*const T as *mut _` becommes `(*const T).cast_mut()`.

Apply these changes and enable the lint -- no functional change
intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_cast_constness [1]
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile                        | 1 +
 rust/kernel/block/mq/request.rs | 4 ++--
 rust/kernel/drm/device.rs       | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 21cc6e312ec9..5eeddfbf5900 100644
--- a/Makefile
+++ b/Makefile
@@ -485,6 +485,7 @@ export rust_common_flags := --edition=2021 \
 			    -Aclippy::needless_lifetimes \
 			    -Wclippy::no_mangle_with_rust_abi \
 			    -Wclippy::ptr_as_ptr \
+			    -Wclippy::ptr_cast_constness \
 			    -Wclippy::undocumented_unsafe_blocks \
 			    -Wclippy::unnecessary_safety_comment \
 			    -Wclippy::unnecessary_safety_doc \
diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index 4a5b7ec914ef..af5c9ac94f36 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -69,7 +69,7 @@ pub(crate) unsafe fn aref_from_raw(ptr: *mut bindings::request) -> ARef<Self> {
         // INVARIANT: By the safety requirements of this function, invariants are upheld.
         // SAFETY: By the safety requirement of this function, we own a
         // reference count that we can pass to `ARef`.
-        unsafe { ARef::from_raw(NonNull::new_unchecked(ptr as *const Self as *mut Self)) }
+        unsafe { ARef::from_raw(NonNull::new_unchecked(ptr.cast())) }
     }
 
     /// Notify the block layer that a request is going to be processed now.
@@ -155,7 +155,7 @@ pub(crate) fn wrapper_ref(&self) -> &RequestDataWrapper {
         // the private data associated with this request is initialized and
         // valid. The existence of `&self` guarantees that the private data is
         // valid as a shared reference.
-        unsafe { Self::wrapper_ptr(self as *const Self as *mut Self).as_ref() }
+        unsafe { Self::wrapper_ptr(core::ptr::from_ref(self).cast_mut()).as_ref() }
     }
 }
 
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 624d7a4c83ea..ef66deb7ce23 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -83,8 +83,8 @@ impl<T: drm::Driver> Device<T> {
         major: T::INFO.major,
         minor: T::INFO.minor,
         patchlevel: T::INFO.patchlevel,
-        name: T::INFO.name.as_char_ptr() as *mut _,
-        desc: T::INFO.desc.as_char_ptr() as *mut _,
+        name: T::INFO.name.as_char_ptr().cast_mut(),
+        desc: T::INFO.desc.as_char_ptr().cast_mut(),
 
         driver_features: drm::driver::FEAT_GEM,
         ioctls: T::IOCTLS.as_ptr(),

-- 
2.49.0

