Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B3AC7E055
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 12:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E15A10E14E;
	Sun, 23 Nov 2025 11:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R/bYqC/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B9210E0C0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 09:27:20 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2953e415b27so41070945ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 01:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763890040; x=1764494840; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cuE/I+mSjy5RFqX89Pi5DjFF+u40p6VYH+8i+leWPLg=;
 b=R/bYqC/VuMHFKRnaEf2MrgxBblNMvC99q6gv9wQyH5BcTx3S0dMKP10IegXug8KXF8
 7rqxxXlUTK2MEVuu3SJyrsIx39K6FbCA20N+U5E5exklZZ+AmMYGcmQ1Z4KdqQw2Q6Fk
 JzWYO2n3NXmVGMM97N0j5RQZErKF5xMguUJdgZ3MFe5tvaaK/MZC7uACOLeiLHVJpC9l
 njdu21k5siC/vvLR6Vl4/pTQB0KKhxGfV+zUeR1ir83WSyfokmNF12ni9mv7ONg5qwxx
 iQeO1WI0jp2GB9vqf57IQSs87Ou3gTesuAJhi9qr5bJ16/VJgtKRFUlzp+1sg2NJmKMC
 lAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763890040; x=1764494840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cuE/I+mSjy5RFqX89Pi5DjFF+u40p6VYH+8i+leWPLg=;
 b=qWLtRoWvV8f5CDfLgKP9VXHzSq0yjGywtP0srfbV531qsCUtiXpVkvBDD8fwSFF1N/
 Aysj6+xFe/6T0vz+y5zJcoditQGZcg6LFP+NFDQQ6tfnc9Jz5PbMW2QYVzCUBY4AoVPJ
 G8DCsfntJ7xeaBaGgiemFVFVm7dxJMNrc1e2jPz3qVxdXbyLkKMnLanMB/csyqWPEYDA
 GwqTykxL2rI7cQoM9TkxAiU9Cynow5fnZso1ltuu5i8TuRM1LNHTG6BygvYFwVn5wBqw
 +RdH3WoEjYUlO6epT8fpoYHBnDMM0xSidZ2bH/BJI+3HB9AAnIuXTmYWK4smaxYjrvDF
 DBGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsFyZrw+w8qDoKL0PmgHJpZ8prQZn/C6Kn60T105l/GoGegcVYD4FfUZSfIHYlCWuiG4MzLjK8Bp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbZWseuyS7vMwGJJsrSWQRzwakEJXHjFfN2+a+88eWbxaUBx+q
 PGH83lJJ/vMpefkJjjvwnZQabtNkJEHHElIfKZ2oJt6kpBRyE8DIqDkB
X-Gm-Gg: ASbGncv7TVR4NHcROXsf9PJFaD4Aa5Bu/dDl+0pgJFRF+dYGmggjBPpSKZ9BrK7DbiF
 FrQbc5cI5+frVMwAruKeI8PSRl1Y1sfGEdHPYLWVNTIU0hs+PbYTq0fFzWMGwUSx5Z4U0cswcxu
 JAgZ6fonzkzpg+Kn0RChASse2/8ry5Xl0igK9GjAWo9B42ekrFwFbaDBGbGRuShtjBlv7qgdDIY
 ntRlmG8Hxe00G9WpADC5AHPfeUs0KSZ4S4ht1hZNHO14i+XmjpJXf5wa2yh2agjXYZ73dnE94BU
 Ci6ib9DeHVMMLLNZXAS+WmiI8SLKVlayezrLOANh6/cRvAsvZpGjzujv1V/3pmvwJXVShxsKZAY
 yAU+9FiGh3vrCa8p9jwrsVMxQM9PRaDb6eO+kmklhgFkhxyIt8dr+I76XiYI9OwN4RwUNaQ56t/
 P5l4oAfsv8T3rT2zjKiDn4p6GYbA==
X-Google-Smtp-Source: AGHT+IFMN2aUokRTTtS+sIFfNu4kcDd93MwuGAJrh+xf6L/Jjr+U1cR7WS31QoNboosVEzIBjpWEvQ==
X-Received: by 2002:a17:903:2c06:b0:297:fc22:3a9f with SMTP id
 d9443c01a7336-29b6bf19f1dmr93932225ad.38.1763890039910; 
 Sun, 23 Nov 2025 01:27:19 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:27:19 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH 08/10] rust: kernel: Update AlwaysRefCounted imports to use
 sync::aref
Date: Sun, 23 Nov 2025 14:54:36 +0530
Message-Id: <20251123092438.182251-9-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 23 Nov 2025 11:28:20 +0000
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

Update call sites in `usb.rs` to import `AlwaysRefCounted`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/usb.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index d10b65e9fb6a..79ff2f881572 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -12,7 +12,8 @@
     error::{from_result, to_result, Result},
     prelude::*,
     str::CStr,
-    types::{AlwaysRefCounted, Opaque},
+    sync::aref::AlwaysRefCounted,
+    types::Opaque,
     ThisModule,
 };
 use core::{
-- 
2.34.1

