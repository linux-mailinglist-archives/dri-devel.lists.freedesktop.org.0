Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFF6C7E040
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 12:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5346F10E157;
	Sun, 23 Nov 2025 11:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PmbHusHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3944910E12A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 09:26:02 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-29586626fbeso41368165ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763889962; x=1764494762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dTc0MgLeOubcwcfQp1wa7TpaWq1ZdIbTR1ydG9HUjeU=;
 b=PmbHusHFR5rbz7aWfBK6AY4CrafOxetAMlqQxX4R9IMIs9y0H6ThECrtap7s1qNBUD
 ADNiXe5ivOXz4BrrHmgRcStIgv/VxcuBpHXjXoc+T5KConeTYKvY8SFuGgDIUfPUwZnn
 Rq5WJYnijDNgEu1Q3nBmlaAwUPxD6d1jAxy/bOij+P+1FiY28jg/8oT/yAmmwH9EfFqx
 6Lbd1j8xSTGDh0OOgUMp1reuwOMPFd4K5kMbcPCaeF//a81oCkAp1Am06ils8gkeBaoj
 yEnagjJM1+HbhRMqSZJgeShO+iotxQi+PtseN5FXD7fXzMZ9nnOZkNvRk90oSDkwLzEk
 9jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763889962; x=1764494762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dTc0MgLeOubcwcfQp1wa7TpaWq1ZdIbTR1ydG9HUjeU=;
 b=bjHcVTduRsFZoSJJi0qyNmDWrG8VvYSAnc/PsaZxiUy75y83dzYgt54RS0RSQfXCWn
 z0YP5SbTyJhHyk838R+05SL5G2njNOjqmHx322jv6nnC7/MmX+g5xK0K8QwYcMPqhezH
 mAI/kUo8iXX9xbs4Mfn7vH1RaAslD9LlNTiAd/SPEJh2AqkXW68BgM9y8ZHdf95Izj5P
 Nl14779a2t5cRrajf1q4pHKwaqhCs9OQ4Q2i1DHAD3bQqUvTV4G/WUxgJV6slmtmLhRI
 BfJkaalnSPepJv1K30TsXhLruh2Xo9QuuPflHlbII6Gibg3FqCEdmVMQPVwDbJP1LW99
 i+0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4cS3TuYTJ2rrMPKP6DlmaMPnRznyZSwPPgwo5D+TGuEiVfqO4vAPbNQnivPLNV7roYNtYZqsoP5Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5HVy4teFEW2SZV1lq866ETSBNUcyfrFP++WCW5Ztl+0SOYwmy
 R1u2520fGScUbvEh6UjsUj68GbvmTYIrCXqc++B+kcBzSN8aRleK3kVj
X-Gm-Gg: ASbGncupAP9EHGRQeL6kfrfizkDW8ywx8YnJp9ePcyC/T1HNIzEHfjzuaMbAZFXk9Yo
 l81ouCby4Stl79WPIQqbQIaKkdFGXjSwcIn2xNgDroFgEnGJldS0CfmEpRY8yLzR4WS9hLnwXUW
 jzp/r/6DvHaeRun/DXiXHlKqla3rE/vcn/ZhVRAP3ExSIsT/H5bvqDP23/yg8C1HqXHfY6RW2no
 Pct6EsxgND4Hync2XiQLvLp7bDbei8e7P87ud+hjXzKYeGxO00KZ5wxOXYpgb2SmZ1ngCxw+4Uy
 rtdZB/OIwhMf2pLXuRLBB6tlaXhSufLCx93HiStHd6do3bSdf6nr2BbCZC6Xpv9/gKyDrA9P7Br
 ZZ7BnBzRaSghXM8FlzMaszxGq5o1C9AdfcMKLrjtjhwaaEH+4CUEJf6g7b+9FLSaKm/PPHjbGti
 opL6f6BwZLqdld0Wh5Kd32cg6gdw==
X-Google-Smtp-Source: AGHT+IFojSe5onG6l0184Qd+32Us2flx99qw215kwkBj86ninqiLXlY2kvADM9/iJBS4TWCcsIsZyA==
X-Received: by 2002:a17:902:f548:b0:295:4d97:84fc with SMTP id
 d9443c01a7336-29b6bf3bcc0mr89250955ad.32.1763889961522; 
 Sun, 23 Nov 2025 01:26:01 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:26:01 -0800 (PST)
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
Subject: [PATCH 02/10] drivers: gpu: Update ARef imports from sync::aref
Date: Sun, 23 Nov 2025 14:54:30 +0530
Message-Id: <20251123092438.182251-3-shankari.ak0208@gmail.com>
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

Update call sites to import `ARef` from `sync::aref`
instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 drivers/gpu/drm/tyr/driver.rs          | 2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
 drivers/gpu/nova-core/vbios.rs         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 0389c558c036..264c2362237a 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -16,10 +16,10 @@
 use kernel::regulator;
 use kernel::regulator::Regulator;
 use kernel::sizes::SZ_2M;
+use kernel::sync::aref::ARef;
 use kernel::sync::Arc;
 use kernel::sync::Mutex;
 use kernel::time;
-use kernel::types::ARef;
 
 use crate::file::File;
 use crate::gem::TyrObject;
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 2d0369c49092..9c689f0b21ab 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -14,12 +14,12 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    sync::aref::ARef, //
     time::{
         delay::fsleep,
         Delta, //
     },
     transmute::FromBytes,
-    types::ARef, //
 };
 
 use crate::{
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index abf423560ff4..7c26e4a2d61c 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -11,8 +11,8 @@
         Alignable,
         Alignment, //
     },
+    sync::aref::ARef,
     transmute::FromBytes,
-    types::ARef,
 };
 
 use crate::{
-- 
2.34.1

