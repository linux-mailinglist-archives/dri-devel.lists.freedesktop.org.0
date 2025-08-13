Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98BBB24DBA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280A110E75E;
	Wed, 13 Aug 2025 15:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P7UPLU70";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D1610E75D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:42:17 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4b109bcba7eso26081cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099737; x=1755704537; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LnFW2npqKBPmKFjbk42rHSD2L60lz3bDYGogNM7LVaY=;
 b=P7UPLU70KqNRpwExr/NHzNXe3Gzy5Yz5HVApZnE3ucy9t7XPRoH1ZTyD/yTW9l9NiQ
 Y0tnezNLcTRS3v/G+TOBZYpzJZeEU36XxNCe0z/NjLmJIK6kvgBBBX6nt3P0p68En/lO
 UjVRIK6NnfmzSUmlApXtnz6oSaCPpXdY93R0G58uneUZx7DJlJ+rxUInwBppJv53uKua
 sgdnlCPOlnLyiNVdsiXIKNMmIshkBkPCR6fLf4jaePlfh8iisdYQN0wR9yfw/yQ5HIQK
 bwXIVCTYTT8Cufkv4PzJVwo8EL8EUALw1/e9P4TqGT6oeO/TDqVpfwqgj4vDt1Awh7WK
 TetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099737; x=1755704537;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LnFW2npqKBPmKFjbk42rHSD2L60lz3bDYGogNM7LVaY=;
 b=GkcgdVzLX8d3w1NN0JF6Gj996b1/+HL17NilQxvU7p1BjjeZ0aLIjNbeA2qrgoPq3I
 2S2txJs9ZPQidNvxDM91lAG+1Y5pnqMRzcmUbJBmfgdb79xjCdQEo1DhwWfhYKx8wagV
 mOV02e48L1yWgeCysAatW5GJ0XnE86TsL1iQqkckBgcyJjlsudYfoGM1lKNBw/JwpTKe
 g2DD3XXeoVYAnZLI3GLaVf2TdMpSO2mcLj43U3C6yEGY8B0ZxhgVoZVYA97SrtF1DlM+
 RbgRURv/DWaO5/FvRYZqLneoJsogr35cCqAqSWRtjU6NO4aasakPX57tzv/vMwnM4ZRb
 sFbg==
X-Gm-Message-State: AOJu0YzmgPckuilCln2RS4332gempdcETRmIQI/E7eXbh14tVoudu7Xj
 Nxq+8zZcEGkhqA5W+ruFWltwvU2htWxpkED/xUYALMIUhwrbjhVnYgx9
X-Gm-Gg: ASbGnctFTNaNz3MVj03RWWs7VE+gQdwpd0rbi3uemUiv5XzN5vo7EAfri+p3tcrcwd5
 pGBm5R5ofBq1urX8MURc9V3tnoh29pvjP/99mGA3LL5dv00stXAqQ0tpNdgFWOk+vVVFcVI55E/
 ddcQEFzg15xeIfgC6IwDSiJx14AYF215tMdL+PBuT1NzgCCKui9PdnYLeYcQjgHYk0GHinPu7Ct
 pp/zGmauoaNPAfRJEECQ235qP74KeCL1KcBMxrk/Z2yyViIGbmqqdM2j+Q4BFd+EluaEG6rHPH5
 FOUWVhzdpWSNl/MhOu3jJRZde7ohhyv0esv81+hmZkoMJhJ0N3mV2sVlJlqZSpGA/tYKjXNIYpI
 lKbuBY0JV8oMSIwZuwL3+Kw7V9ekSvSesQUnacB7R5E9rfEMUV/TrY53AFKPb7wyOBrDZTr5yh4
 Q60i2c8hj9xSUOMCMjky3LXOHIiDaOJuOQrgUcM9++YYRPWQT6MBkNORo=
X-Google-Smtp-Source: AGHT+IGst0K+bBIR1JPA1xxoo3PWJCWm9KLNl2+l1dIS1R4SJG8m1vtEDh/5FFkaiXywh2WmF6+IQA==
X-Received: by 2002:a05:622a:8a:b0:4b0:7f2c:b27d with SMTP id
 d75a77b69052e-4b0fc7589bcmr51851161cf.22.1755099735338; 
 Wed, 13 Aug 2025 08:42:15 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:42:14 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:41:58 -0400
Subject: [PATCH v3 07/11] rust: kunit: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-7-545c14bc44ff@gmail.com>
References: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
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
 Saravana Kannan <saravanak@google.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Arnd Bergmann <arnd@arndb.de>, Len Brown <lenb@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099715; l=1753;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Jy20RMjEgUasphU37v4mL3N9otH67wOqCSEUfHDoaEc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QK0mI8nizkbrqOlHVa/VZhAD5k+yfK1PeJ19bjxmLttJOSY1NKjCbDi2AQMIgqX63yg7JVa2YpU
 JwmcNQ286qAo=
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
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/kunit.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 41efd87595d6..5866cff072f9 100644
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

