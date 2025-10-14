Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8AFBD7982
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 08:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB1C10E546;
	Tue, 14 Oct 2025 06:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QiUNOnJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D152010E545
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 06:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760424088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8eo0rdDzh07ckiTBotN/0G7m7UlosQASIFmbI9q9Ybw=;
 b=QiUNOnJwusTbBsP4RTgJuZmkJoGpW7C889pryQUKpagMCG0Z2VKNOmOcnecb6F66IjXoMr
 8KPloS7sGBQGHqImKN64hWh8MZ7U78X6fviBWxIVrHnh00zd/+9UcLDnrvkK9SlckuI5eX
 aqk4iQG+edjZZ3CteqAnQDA4arn9A8g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-fIWRr4WpOkuYa2Q_gZeuAQ-1; Tue, 14 Oct 2025 02:41:26 -0400
X-MC-Unique: fIWRr4WpOkuYa2Q_gZeuAQ-1
X-Mimecast-MFC-AGG-ID: fIWRr4WpOkuYa2Q_gZeuAQ_1760424086
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-426d2cd59e4so2872334f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760424085; x=1761028885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8eo0rdDzh07ckiTBotN/0G7m7UlosQASIFmbI9q9Ybw=;
 b=KTynKdbinWxcf+8y2wqSr/vrs4hsd3VEbRh7nTm/2TLIEPe1mO8dIMOqQOwfFHUKVc
 bT/wmo7MQ5jmy520rb/+PzO2gSvM63cHdzKV54BcWQxCuxnMJxFwJdz2cyFrnlhKcl/f
 vHiQSbNxM7uvGPOnuwh9NavEkSn36XXAfS0GKg8EyXZ6PIEyZDjBSCrR9V9tGMxRNWxv
 lG9D91xbRjGh+NL7/ohDvCkZXa6g8MvDBlePFBsr2C3HIDarxHNgnCqtPyhwaY+yy+yK
 I90WnOkNoDo4UgErpljgPtNiBkMUgpUraeb0qfEl8IOKUKyuw6+JE+fCyRwQmFr5sAu5
 V/dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnYY517od+AEOeW+sImLvy6+ss3BWaIDH3ieUwXK2r3yAv512eQh70pr7TjW6I00oSw0mnyimAK3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/TbiTTPD2DDt+OvSyS5mye8j2KneTTHmRO1bJF0n8WDotIxSn
 4KJEE2gN58Lx7YvdHiTVMk9DBhS25yjZk+irkW/y8qsEjJ+EZlSRebKkooaNcAK3v1vbZnctbRf
 D5/BhnfUxyW2iRmntN//ejdDCVgt82rasXF3gXTZFTvoAlbrDPqcn9i1HTMLj0PthjdleYw==
X-Gm-Gg: ASbGncspR0AsLhT9UdJ+10Zoi7npvbiD6cZc5yo1JmQvln7peU/qQTUca/bKBDTwbqF
 DuT9HP8f0ioWNkARIvj6dzvu0ny7dHIp6dg6miN8GcpN0ZoTfGfT6t/LLEVpZDPwEhXTKh+70Zu
 NbTT2llxs0TnAWJYBfvgETJo//MNBaaM/mF9Xvo3pQHkNrWNetOQEzQI+otBPYjrjqCJNPO53Vu
 qcST8xE+AH472IwSPCtIT94hRi3mI+arQff1D6t0D1MMup5Vl9W00e0zKDixzPezl181xqOAKGU
 Dt6UQX3S/nklCAhzAeEUT2mJCVnHPHo8cM/JdTRRB5+JLsSivrYxD/WmwfSq+6jhX9ApV6RoBOe
 oI335AQYAjCd1XQ==
X-Received: by 2002:a5d:5d86:0:b0:3eb:4e88:585 with SMTP id
 ffacd0b85a97d-4266e8f7f58mr14331631f8f.29.1760424085626; 
 Mon, 13 Oct 2025 23:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVQ04e7UfQsRRayb/A53UoKDUPQdS7WxAqx3NLzVujqatyY5Y+mwqkqiVt78YRvyiQ00wF5w==
X-Received: by 2002:a5d:5d86:0:b0:3eb:4e88:585 with SMTP id
 ffacd0b85a97d-4266e8f7f58mr14331606f8f.29.1760424085157; 
 Mon, 13 Oct 2025 23:41:25 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb
 ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb4982c10sm217369235e9.5.2025.10.13.23.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 23:41:24 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] rust: drm: remove unneeded handling for config DRM_LEGACY
Date: Tue, 14 Oct 2025 08:41:20 +0200
Message-ID: <20251014064120.263455-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 67bVi0zv1H_I0xgKqUCk9dwBEtZvRwLmV4V2IiFtzsk_1760424086
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Since commit 94f8f319cbcb ("drm: Remove Kconfig option for legacy support
(CONFIG_DRM_LEGACY)"), the special handling in the rust drm code for the
config DRM_LEGACY is not needed.

Remove the drm_legacy_fields macro and simply use bindings::drm_driver
unconditionally.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 rust/kernel/drm/device.rs | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3ce8f62a0056..a1d92d8922a4 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -16,37 +16,6 @@
 };
 use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
 
-#[cfg(CONFIG_DRM_LEGACY)]
-macro_rules! drm_legacy_fields {
-    ( $($field:ident: $val:expr),* $(,)? ) => {
-        bindings::drm_driver {
-            $( $field: $val ),*,
-            firstopen: None,
-            preclose: None,
-            dma_ioctl: None,
-            dma_quiescent: None,
-            context_dtor: None,
-            irq_handler: None,
-            irq_preinstall: None,
-            irq_postinstall: None,
-            irq_uninstall: None,
-            get_vblank_counter: None,
-            enable_vblank: None,
-            disable_vblank: None,
-            dev_priv_size: 0,
-        }
-    }
-}
-
-#[cfg(not(CONFIG_DRM_LEGACY))]
-macro_rules! drm_legacy_fields {
-    ( $($field:ident: $val:expr),* $(,)? ) => {
-        bindings::drm_driver {
-            $( $field: $val ),*
-        }
-    }
-}
-
 /// A typed DRM device with a specific `drm::Driver` implementation.
 ///
 /// The device is always reference-counted.
@@ -61,7 +30,7 @@ pub struct Device<T: drm::Driver> {
 }
 
 impl<T: drm::Driver> Device<T> {
-    const VTABLE: bindings::drm_driver = drm_legacy_fields! {
+    const VTABLE: bindings::drm_driver = bindings::drm_driver {
         load: None,
         open: Some(drm::File::<T::File>::open_callback),
         postclose: Some(drm::File::<T::File>::postclose_callback),
-- 
2.51.0

