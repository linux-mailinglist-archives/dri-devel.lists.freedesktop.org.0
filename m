Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF81C7E052
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 12:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D0F10E14C;
	Sun, 23 Nov 2025 11:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jljsarGb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AA810E0C0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 09:27:46 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-29586626fbeso41374665ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 01:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763890066; x=1764494866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YfyBoPWUbKIvicMj0KWg+NHqLc+OcZyzD61cN8gqS4k=;
 b=jljsarGb00oTxd5Qx8XDsb4D+icmyjoepUYfbcjjgbl55/0VRo+A0pU5k5BecV8pgu
 x4zkqFn8Xw4hDy+4/Usv0Zpk9y1wk1lzrsbIgDlaqp5T6A3vCt0PrfP58tIv8bdM6+b9
 zo2h9kg1bQgfE9nMjg5nAjGs46Jy6mlMtw36M4cZlOGkaaZZrkQX+XZTcDTaLRhN1K04
 zLWFnQHTfXO6ZK74mYJIPBXVD3y6damGFObwbG/KiqEoEhRcjbhLisUplFS0o2KnosJp
 pLJJjshMHZXLj6ghfBS70oIeOPImU1nYVXuhOAf5EujplyQYzznZ+fwwDgQ9kUIc+l6B
 k5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763890066; x=1764494866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YfyBoPWUbKIvicMj0KWg+NHqLc+OcZyzD61cN8gqS4k=;
 b=fMiEa2oIz2UYBwKOhRlzrRr3FYeK5ssLBp4qilzzu6hk/aC2HZMDASq1mmQgmDr5Z2
 AY8E7/KhSQ8Hn8fJ5Ea3qOcG2LJxPhTp7+hslhnodjq8Afaoqw//TxLwEdEBWMKV/kwq
 L6fLPgqEHajMcXM8w7GiqzxUbWRxdPjuOaqIv17Jmm+xls3E4KTewHMuWzyWtRzrPFea
 wuiJTZ43gkFOiCLSLU4F0BR7t1PuoU3V/29krqO0e0own9Gb3HyYC/ZnXB+beXcg7Oux
 UHYVVvEUXIwqu22+sc6omkuiR0MxjG6B6OH8Dc551OnzL5KA5MuEzlQvyFnk3fWW0+PG
 rYmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb20v5xW09YsyhakdOYVT1DHWVu25ltEKYO0MiewGrvEvmcZRa4trmrWjE70UGAMt3iliE/1STCnA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1DTDpbb8aHZQ0eIT9vkTspTIN2tz1TKitzWCN2mAATseXLDkq
 V/My/ji1J6HhbmYI9XwhaM2xqN3r02AiIWJKw6F12YbxdNwkgiP8ZBgx
X-Gm-Gg: ASbGncsZa3SsJQehvuH2mjSnelc802H3NlnBa6iDqqzpRTz5zt4DkTpr3/EHTkr1VTy
 oiOFMSESpFcWXg/69dySUMBTaBNuPM6Menl7o5TkznW7u/lBxnYNlbUQosNEoGc6F12yVHfWrpY
 mWeIctx3AN8RQcsrPrCirRbV8s0RxNubXYHH9IOAQMqWeKhUJnOe844PzP3LDg7xX5Ubz3VEur7
 qxAnj6m48q4RBtwr2+me5jpk0gr6ZGDTW5AwQlt1j/axGoR9k2GGZouqVk54XtwE7IImaXXiec3
 q+uYrtjhD55iMc3XASe+Xpf30524U1ZMJmmEjBYvOxixupM9ZQhuSGLEZR8RIK+upe5GpvSEB7a
 luOyFuKm63PTTA93PgXutuQDhiosD7LGRspSXFKzziF6jCu6G493YEZ1sBH9Xm/YIL6vH9t70Ih
 Nl6xV8+wWG4aSldphUSlM1OMVZIQ==
X-Google-Smtp-Source: AGHT+IExQFsNPtBs1Xj5miLvxmintvWHhiICyxn8q5+dbslUtcud5J24RqOaI8yRZ14HHbP/D4VKng==
X-Received: by 2002:a17:902:db0b:b0:295:28a4:f0aa with SMTP id
 d9443c01a7336-29b6bf5f036mr89773335ad.43.1763890065882; 
 Sun, 23 Nov 2025 01:27:45 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:27:45 -0800 (PST)
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
Subject: [PATCH 10/10] rust: kernel: remove temporary re-exports of ARef and
 AlwaysRefCounted
Date: Sun, 23 Nov 2025 14:54:38 +0530
Message-Id: <20251123092438.182251-11-shankari.ak0208@gmail.com>
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

Remove the temporary re-exports of `ARef` and `AlwaysRefCounted`
from `types.rs` now that all in-tree users have been updated to
import them directly from `sync::aref`.

These re-exports were originally added to avoid breaking the
kernel build during the transition period while call sites were
incrementally migrated. With all users updated, they are no
longer needed.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/types.rs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9c5e7dbf1632..4329d3c2c2e5 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -11,8 +11,6 @@
 };
 use pin_init::{PinInit, Wrapper, Zeroable};
 
-pub use crate::sync::aref::{ARef, AlwaysRefCounted};
-
 /// Used to transfer ownership to and from foreign (non-Rust) languages.
 ///
 /// Ownership is transferred from Rust to a foreign language by calling [`Self::into_foreign`] and
-- 
2.34.1

