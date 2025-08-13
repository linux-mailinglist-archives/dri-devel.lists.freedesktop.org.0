Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0CB24DC1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4133D10E767;
	Wed, 13 Aug 2025 15:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IUWXOm5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE2710E766
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:42:26 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7e81074ae83so702736785a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755099745; x=1755704545; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HV68KIDec58Lp5ofIAN+WaUYN4AgQmpZQcNEziHckfo=;
 b=IUWXOm5JCCoy1Ojgvl6u818GxZvHe77UIkUDVxEi2RfRkAoXhXraY2PYhnr5TTBxOC
 N+/R08JvTsWFVK8inzsS4vJPZJKFruj3hM8UoIDo933E83a3GNwZx5a/dwiDrDMb38r3
 sWJRPubD9tZfUJn7rcHcZ54qkZbEFyzJp7gP6OriWChuMNnFxdVZ7crcF70ITs/TJbLR
 KlL9JEzmI0CfGJ97gCeCCuyZwk9pKLBovwYaWA5fGQQA5oCBgjL8mYZMC4cX51OXt7a6
 VtpM0MG0MfONPZMmT39oLkUgUZZd3usECUJtEM1UttgV2rhKROTTcH+ZBfkAU8Z1Zuxx
 ilDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755099745; x=1755704545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HV68KIDec58Lp5ofIAN+WaUYN4AgQmpZQcNEziHckfo=;
 b=iwEPY+7qc/NU+JnnLNtVZFyetJGhbeGLRlVnXGypb+YRvsxrwfPhDMctGcYC1wLpJO
 q2f+5BbPitQzbPUsQW+XF5+OytUAZIuP/82qYGp1oFyqjkuephOCCoSWeT4UMgT+mxUq
 99mVykNHXkAcbf25KM8c/HKf99bqBtlxonElP54CnHFLbnph+mzcTi5ht8y54xxa9394
 ZQzTymovPywlY/T7N/c7p0LinA4NMAEXCtir2I32EWgNy/jqLPeeMhFwn01vOtKXmwxE
 4pDePnvgWhkP+SiUiJqVthgsuXFLyWwbH3IIZboaoLjn5S2cb0ZSf7iNbXYfW7sMePvn
 LF6w==
X-Gm-Message-State: AOJu0Yy2/rd6t9XvD0kmWwdS0nDeQxavp5rVqIBWotayVATBZZIRYxrK
 Snl4cD6DEmFlnVbfkISHMD6RBMbHLlQwf7h5Clc5NFQ2CIIxjbITY+/3
X-Gm-Gg: ASbGncuPsH4QfKISWtN6ypiSKvmpOKTQ7+3YVoH6mucU+YJP/zxhZk2JmGIf/AmZxpd
 7QNmvrrh0NPK89KQzZX8SQN+ky5h0I64eXEKOKD+jgUtH0uW0JJnyUdXkcO8DYx34MD44d8shSF
 3CKId4b3BsCFA0MXBkOP8I7quC3XKNFxOLtQgOuzja0UzxYyUBt3tCPEBrKhoWDP+H+JQef0imB
 7sJ/p2dO6/jon3M+qufOKxLhmC2ZhYnN7ZJbn6K7jFjNScXy9XTBsZrW7dHWgckLbUHphSW3hoG
 3K8DzEf5ZpGpEQbFF9TJhZjZ18Vyy+l/Kv5a4l02y6MQ+rHWmO7sEv/B5tFSYpvfNN4/SiubuVI
 c7nHLnCQTTE/13xYsV993L6K3iUnG/NEHQuTnZFgho9pzObTpty/DhhP0oOU1gG51TYCcXjeSyD
 DBVuAzvryJE6EQ/MPy1dAZrSDT3xnLTuwjmw==
X-Google-Smtp-Source: AGHT+IGueTHLMPq5mASKcygcGpjxpQLr77vYPVpPZinVZalsZaN0RbJcr5FWn9+kKNzsAHrio9z2NQ==
X-Received: by 2002:ae9:c10d:0:b0:7e1:5efc:6f6 with SMTP id
 af79cd13be357-7e865323bfbmr351498185a.47.1755099745105; 
 Wed, 13 Aug 2025 08:42:25 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e81bc7a1e3sm1180019685a.74.2025.08.13.08.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:42:24 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:42:02 -0400
Subject: [PATCH v3 11/11] rust: acpi: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-fanout-1-v3-11-545c14bc44ff@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1755099716; l=1137;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=7eEQScKSS4lgeevbAHUT916RwyFbFyv80kGiczwdQFA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLzNH5g4iPNs065FYw7w7djV+1xHowTEMku81polGSYjrhqzWV320xGu/06+NykyIYuirJGl3Sv
 bZdE3PrXglg8=
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

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/acpi.rs | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/acpi.rs b/rust/kernel/acpi.rs
index 7ae317368b00..37e1161c1298 100644
--- a/rust/kernel/acpi.rs
+++ b/rust/kernel/acpi.rs
@@ -37,11 +37,8 @@ impl DeviceId {
     /// Create a new device id from an ACPI 'id' string.
     #[inline(always)]
     pub const fn new(id: &'static CStr) -> Self {
-        build_assert!(
-            id.len_with_nul() <= Self::ACPI_ID_LEN,
-            "ID exceeds 16 bytes"
-        );
-        let src = id.as_bytes_with_nul();
+        let src = id.to_bytes_with_nul();
+        build_assert!(src.len() <= Self::ACPI_ID_LEN, "ID exceeds 16 bytes");
         // Replace with `bindings::acpi_device_id::default()` once stabilized for `const`.
         // SAFETY: FFI type is valid to be zero-initialized.
         let mut acpi: bindings::acpi_device_id = unsafe { core::mem::zeroed() };

-- 
2.50.1

