Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C60B0B259
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A9210E42D;
	Sat, 19 Jul 2025 22:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XoQPoTfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A27E10E42D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:42:52 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4ab6e66ea68so43304661cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964971; x=1753569771; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NVwZZ6Mo9+UIM4MULp9oEI1KWAAVmyUYypitaepCOB0=;
 b=XoQPoTfYMcbxSJHnEitREpYV+GU0tW5tzYDQUtcIu5X2bR+93Kfd7k2oRf7/KfV45i
 o5MorcnCif7qzYkUH6/QQ7+RZNcASq8cLA9P73zpUEWYrRCrC64TXXV+jSeK+U0IeLHu
 UC7i7Z0EXusLJbkWQwRj3JGui01KJnpt9M1mvjhyz83h/ANXF8OC5Z9q7oEqPsyRSsBw
 pSRRz5c13rFq3FilkshZoFpy5Pri1/LIfGRSMKhBO6k8L7lgHoIP8T45WhpTRwag1QMY
 ScQgRPR+eW+1afLxRGpQHOe+0NCQVWejnFGP4xjbe9KDHyAS/pVFkXmqPkNnFJThg3hf
 86GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964971; x=1753569771;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVwZZ6Mo9+UIM4MULp9oEI1KWAAVmyUYypitaepCOB0=;
 b=g40yecMlEx6KqqUL8faN4LSzA+rA/YybE/caNzDTJ+eIJahly1ybMchQPx/P3HrEZu
 AUsbgs2KLi5pUxisZTtAjcPv6h7pgqH2EDG2vZKu1T95KsLFjfXSibPj57/fUPTJH2BV
 rbGmMzdVB/Xo5oHi9uK0kLeuL0vo5frKMYJyaPYmRDl8LThbMSz3uZAFQkq2K5PQpFJZ
 /u1q9I2F495sTH0TG26GVOoUh455mV45kS/l+pWrTlcl8uydX4PNEB7GvXHVwYKzsegL
 Nd+hOmDKRd3rsYa/w5RcwOq52fFIuRrH2YZIkXb6Ge9DX/IxW14tDtKAk0TvPC7M4Xo5
 8AmA==
X-Gm-Message-State: AOJu0YyFndDBqYHdU3zld+j4vxMXuQMraZ737ew5BJxAL4W4z5Pdo5DF
 BQp4gGK+LR/350NLGewQGswDGyVWMO4i/OjJH8vapjXOf3k+0C5sK4Ju
X-Gm-Gg: ASbGncsCF8/l1YwXXOoYowPhBZB1OQpj5QKNpvX6ZbYbuPnnnLOnXMvRQdDJA1ji9Ft
 dVXG/ov2Fz4XzmZG4Sh5X6tbzkm17pH8RTRBc3EwlkYT5C/txTDb/jMoOCa166IumtApDCtpNQ4
 q8BlhBBa5c6N4dzGrs7ldsNwNZkSaFYDuS9YyykTvQqfb0689qd1e8R4CjQix9RGnD0TG0oMieS
 3Inm6TXEvBwig1CHxdvWcXTHQQbDRYolruj3s20WHr9PO+qrF/BFJ4tL7OOOq2RDN2WmcxM+WDG
 6QdNd0+b1qaV4p+vdDIpkGWBogf+fowc9x68v6WIFyvQYJAyS0i52lL91SwrCcieI4smqreB27V
 +N30W+41p33X3MS++oKBcvxuNKs/qPik+WygjNTeSMOw2v2uJ81Bxtk63wUeWh0Wa8JuEUZFWaS
 KBFzxn6Fcp8HUwizlheHP6ks8c8tvc
X-Google-Smtp-Source: AGHT+IGrDAPhwT5uKgChUAOHQtHYjjVfCjGcgBqOR6dnOpB3dSPlP6wDfXu7rVGYdgsmj8RAJZS9ig==
X-Received: by 2002:a05:622a:258e:b0:4ab:5941:a919 with SMTP id
 d75a77b69052e-4aba3df1b41mr175208651cf.40.1752964971453; 
 Sat, 19 Jul 2025 15:42:51 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:50 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:42:36 -0400
Subject: [PATCH v2 07/10] rust: kunit: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-7-e1cb53f6d233@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964955; l=1799;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=csKsHCFbalTxJs2cYRiqc+aWsYXh/UqWq0VHOjKXa4U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOCZHQE3BNkYXCKJ+RyA32p/mSSS2r3g8aNiyzb0jETg6Ga0rgHtLN1SgqEcI0cBAzwMZUvRsRy
 Exo2ggC1/0gs=
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

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoid methods that only exist on the latter.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/kunit.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 099a61bbb8f4..3fd33c0c5ecc 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -102,12 +102,12 @@ unsafe impl Sync for Location {}
             unsafe impl Sync for UnaryAssert {}
 
             static LOCATION: Location = Location($crate::bindings::kunit_loc {
-                file: FILE.as_char_ptr(),
+                file: $crate::str::as_char_ptr_in_const_context(FILE),
                 line: LINE,
             });
             static ASSERTION: UnaryAssert = UnaryAssert($crate::bindings::kunit_unary_assert {
                 assert: $crate::bindings::kunit_assert {},
-                condition: CONDITION.as_char_ptr(),
+                condition: $crate::str::as_char_ptr_in_const_context(CONDITION),
                 expected_true: true,
             });
 
@@ -202,7 +202,7 @@ pub const fn kunit_case(
 ) -> kernel::bindings::kunit_case {
     kernel::bindings::kunit_case {
         run_case: Some(run_case),
-        name: name.as_char_ptr(),
+        name: kernel::str::as_char_ptr_in_const_context(name),
         attr: kernel::bindings::kunit_attributes {
             speed: kernel::bindings::kunit_speed_KUNIT_SPEED_NORMAL,
         },

-- 
2.50.1

